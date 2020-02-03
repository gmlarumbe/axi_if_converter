-------------------------------------------------------------------------------
--  Copyright (c) 1995/2015 Xilinx, Inc.
--  All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2016.1 
--  \   \          Description : Xilinx Unified Simulation Library Component
--  /   /                        Phase Lock Loop Clock
-- /___/   /\      Filename    : PLLE4_ADV.vhd
-- \   \  /  \
--  \___\/\___\
--                                 
-------------------------------------------------------------------------------
--  Revision
--  02/22/2013 700625 - update PLLE3 for yml changes
--  02/28/2013 703674 - update vco_half attribute
--  03/25/2013 PLLE3 sync5 changes
--  04/04/2013 709484 - add PFD check
--  04/02/2013 709723 - fix Lock for lost clock
--  04/08/2013 709729 - Fix clkoutxiphy for CLKIN mode
--  04/09/2013 709725 - Fix clkout0 frequency after reset
--  04/09/2013 709726 - Fix clkout0 frequency
--  04/12/2013 Invertible pin changes
--  04/16/2013 Writer and invertible pin changes
--  05/02/2013 716345 - Fix CLKFBOUT_MULT DRC
--  End Revision
-------------------------------------------------------------------------------

----- CELL PLLE4_ADV -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity PLLE4_ADV is
  generic (
    CLKFBOUT_MULT : integer := 5;
    CLKFBOUT_PHASE : real := 0.000;
    CLKIN_PERIOD : real := 0.000;
    CLKOUT0_DIVIDE : integer := 1;
    CLKOUT0_DUTY_CYCLE : real := 0.500;
    CLKOUT0_PHASE : real := 0.000;
    CLKOUT1_DIVIDE : integer := 1;
    CLKOUT1_DUTY_CYCLE : real := 0.500;
    CLKOUT1_PHASE : real := 0.000;
    CLKOUTPHY_MODE : string := "VCO_2X";
    COMPENSATION : string := "AUTO";
    DIVCLK_DIVIDE : integer := 1;
    IS_CLKFBIN_INVERTED : bit := '0';
    IS_CLKIN_INVERTED : bit := '0';
    IS_PWRDWN_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    REF_JITTER : real := 0.010;
    STARTUP_WAIT : string := "FALSE"
  );

  port (
    CLKFBOUT             : out std_ulogic;
    CLKOUT0              : out std_ulogic;
    CLKOUT0B             : out std_ulogic;
    CLKOUT1              : out std_ulogic;
    CLKOUT1B             : out std_ulogic;
    CLKOUTPHY            : out std_ulogic;
    DO                   : out std_logic_vector(15 downto 0);
    DRDY                 : out std_ulogic;
    LOCKED               : out std_ulogic;
    CLKFBIN              : in std_ulogic;
    CLKIN                : in std_ulogic;
    CLKOUTPHYEN          : in std_ulogic;
    DADDR                : in std_logic_vector(6 downto 0);
    DCLK                 : in std_ulogic;
    DEN                  : in std_ulogic;
    DI                   : in std_logic_vector(15 downto 0);
    DWE                  : in std_ulogic;
    PWRDWN               : in std_ulogic;
    RST                  : in std_ulogic      
  );
end PLLE4_ADV;

  architecture PLLE4_ADV_V of PLLE4_ADV is

  ---------------------------------------------------------------------------
  -- Function SLV_TO_INT converts a std_logic_vector TO INTEGER
  ---------------------------------------------------------------------------
  function SLV_TO_INT(SLV: in std_logic_vector
                      ) return integer is

    variable int : integer;
  begin
    int := 0;
    for i in SLV'high downto SLV'low loop
      int := int * 2;
      if SLV(i) = '1' then
        int := int + 1;
      end if;
    end loop;
    return int;
  end;

  ---------------------------------------------------------------------------
  -- Function ADDR_IS_VALID checks for the validity of the argument. A FALSE
  -- is returned if any argument bit is other than a '0' or '1'.
  ---------------------------------------------------------------------------
  function ADDR_IS_VALID (
    SLV : in std_logic_vector
    ) return boolean is

    variable IS_VALID : boolean := TRUE;
    variable address : integer := 0;

  begin
    for I in SLV'high downto SLV'low loop
      if (SLV(I) /= '0' AND SLV(I) /= '1') then
        IS_VALID := FALSE;
      end if;
    end loop;
    if (IS_VALID) then
      address := SLV_TO_INT(SLV);
      if (((address >= 8) and (address <= 11)) or
          ((address >= 20) and (address <= 22)) or
          ((address >= 24) and (address <= 26)) or
          (address = 28) or
          (address = 78) or
          (address = 79) or
          (address = 92)) then
        IS_VALID := TRUE;
      else
        IS_VALID := FALSE;
      end if;
    end if;
    return IS_VALID;
  end ADDR_IS_VALID;

  function real2int( real_in : in real) return integer is
    variable int_value : integer;
    variable int_value1 : integer;
    variable tmps : time := 1 ps;
    variable tmps1 : real;
    
  begin
    if (real_in < 1.00000 and real_in > -1.00000) then
        int_value1 := 0;
    else
      tmps := real_in * 1 ns;
      int_value := tmps / 1 ns;
      tmps1 := real (int_value);
      if ( tmps1 > real_in) then
        int_value1 := int_value - 1 ;
      else
        int_value1 := int_value;
      end if;
    end if;
    return int_value1;
  end real2int;

  procedure clkout_dly_cal (clkout_dly : out std_logic_vector(5 downto 0);
                          clkdiv : in integer;
                          clk_ps : in real;
                          clk_ps_name : in string )
  is
    variable clk_dly_rl : real;
    variable clk_dly_int : integer;
    variable clkdiv_real : real;
    variable clkpm_sel_rl : real;
    variable clk_ps_rl : real;
    variable  Message : line;
  begin

     clkdiv_real := real(clkdiv);
     if (clk_ps < 0.0) then
        clk_dly_rl := (360.0 + clk_ps) * clkdiv_real / 360.0;
     else
        clk_dly_rl := clk_ps * clkdiv_real / 360.0;
     end if;
     --clk_dly_int := real2int (clk_dly_rl);
     clk_dly_int := integer (clk_dly_rl);

     if (clk_dly_int > 63) then
        Write ( Message, string'(" Warning : [Unisim PLLE4_ADV-101] Attribute "));
        Write ( Message, clk_ps_name );
        Write ( Message, string'(" of PLLE4_ADV is set to "));
        Write ( Message, clk_ps);
        Write ( Message, string'(". Required phase shifting can not be reached since it is over the maximum phase shifting ability of PLLE4_ADV"));
        Write ( Message, '.' & LF );
        assert false report Message.all severity warning;
        DEALLOCATE (Message);
        clkout_dly := "111111";
     else
       clkout_dly := STD_LOGIC_VECTOR(TO_UNSIGNED(clk_dly_int, 6));
     end if;


  end procedure clkout_dly_cal;

  procedure clk_out_para_cal (clk_ht : out std_logic_vector(6 downto 0);
                            clk_lt : out std_logic_vector(6 downto 0);
                            clk_nocnt : out std_ulogic;
                            clk_edge : out std_ulogic;
                            CLKOUT_DIVIDE : in  integer;
                            CLKOUT_DUTY_CYCLE : in  real )
  is 
     variable tmp_value : real;
     variable tmp_value_tmp : real;
     variable tmp_value_r : integer;
     variable tmp_value_r2 : integer;
     variable tmp_value_r3 : real;
     variable tmp_value_r1 : real;
     variable tmp_value_r_0 : real;
     variable tmp_value_rm : real;
     variable tmp_value_rm1 : real;
     variable tmp_value0 : real;
     variable tmp_value_l: real;
     variable tmp_value2 : real;
     variable tmp_value1 : integer;
     variable clk_lt_tmp : real;
     variable clk_ht_i : integer;
     variable clk_lt_i : integer;
     variable CLKOUT_DIVIDE_real : real;
     variable tmp_value_round : integer;
     constant O_MAX_HT_LT_real : real := 128.0;
  begin
     CLKOUT_DIVIDE_real := real(CLKOUT_DIVIDE);
     tmp_value_tmp := CLKOUT_DIVIDE_real * CLKOUT_DUTY_CYCLE;
     tmp_value_r := real2int(tmp_value_tmp);
     tmp_value_r_0 := real(tmp_value_r);
     tmp_value_rm := tmp_value_tmp - tmp_value_r_0;
     if (tmp_value_rm < 0.1) then
       tmp_value := tmp_value_r_0;
     elsif (tmp_value_rm > 0.9) then
       tmp_value :=  tmp_value_r_0 + 1.0;
     else
       tmp_value_r1 := tmp_value_tmp * 2.0;
       tmp_value_r2 := real2int(tmp_value_r1);
       tmp_value_r3 := real(tmp_value_r2);
       tmp_value_rm1 := tmp_value_r1 - tmp_value_r3;
       if (tmp_value_rm1 > 0.995) then
          tmp_value := tmp_value_tmp + 0.002;
       else
          tmp_value := tmp_value_tmp;
       end if;
     end if;
     tmp_value_round := integer (tmp_value * 2.0);
     tmp_value1 := tmp_value_round mod 2;
     tmp_value2 := CLKOUT_DIVIDE_real - tmp_value;

     if ((tmp_value2) >= O_MAX_HT_LT_real) then
       clk_lt_tmp := 64.0;
       clk_lt := "1000000";
     else
       if (tmp_value2 < 1.0) then
           clk_lt := "0000001";
           clk_lt_tmp := 1.0;
       else
           if (tmp_value1 /= 0) then
             clk_lt_i := real2int(tmp_value2) + 1;
           else
             clk_lt_i := real2int(tmp_value2);
           end if;
           clk_lt := STD_LOGIC_VECTOR(TO_UNSIGNED(clk_lt_i, 7));
           clk_lt_tmp := real(clk_lt_i);
       end if;
     end if;

     tmp_value_l := CLKOUT_DIVIDE_real -  clk_lt_tmp;

     if ( tmp_value_l >= O_MAX_HT_LT_real) then
       clk_ht := "1000000";
     else
       clk_ht_i := real2int(tmp_value_l);
       clk_ht :=  STD_LOGIC_VECTOR(TO_UNSIGNED(clk_ht_i, 7));
     end if;

     if (CLKOUT_DIVIDE = 1) then
       clk_nocnt := '1';
     else
       clk_nocnt := '0';
     end if;

     if (tmp_value < 1.0) then
       clk_edge := '1';
     elsif (tmp_value1 /= 0) then
       clk_edge := '1';
     else
       clk_edge := '0';
     end if;

  end procedure clk_out_para_cal;

  procedure clkout_pm_cal ( clk_ht1 : out integer ;
                           clk_div : out integer;
                           clk_div1 : out integer;
                           clk_ht : in std_logic_vector(6 downto 0);
                           clk_lt : in std_logic_vector(6 downto 0);
                           clk_nocnt : in std_ulogic;
                           clk_edge : in std_ulogic )
  is 
     variable clk_div_tmp : integer;
  begin
    if (clk_nocnt = '1') then
        clk_div := 1;
        clk_div1 := 1;
        clk_ht1 := 1;
    else 
      if (clk_edge = '1') then
           clk_ht1 := 2 * SLV_TO_INT(clk_ht) + 1;
      else
           clk_ht1 :=  2 * SLV_TO_INT(clk_ht);
      end if;
       clk_div_tmp := SLV_TO_INT(clk_ht) + SLV_TO_INT(clk_lt);
       clk_div := clk_div_tmp;
       clk_div1 :=  2 * clk_div_tmp - 1;
    end if;

  end procedure clkout_pm_cal;

  procedure clkout_delay_para_drp ( clkout_dly : out std_logic_vector(5 downto 0);
                           clk_nocnt : out std_ulogic;
                           clk_edge : out std_ulogic;
                           di_in : in std_logic_vector(15 downto 0);
                           daddr_in : in std_logic_vector(6 downto 0);
                           di_str : string ( 1 to 16);
                           daddr_str : string ( 1 to 7))
  is
     variable  Message : line;
  begin
     clkout_dly := di_in(5 downto 0);
     clk_nocnt := di_in(6);
     clk_edge := di_in(7);
  end procedure clkout_delay_para_drp;
                           
  procedure clkout_hl_para_drp ( clk_lt : out std_logic_vector(6 downto 0) ;
                               clk_ht : out std_logic_vector(6 downto 0) ;
                           di_in : in std_logic_vector(15 downto 0);
                           daddr_in : in std_logic_vector(6 downto 0);
                           di_str : string ( 1 to 16);
                           daddr_str : string ( 1 to 7))
  is
     variable  Message : line;
  begin
    if (di_in(12) /= '1')  then
      Write ( Message, string'(" Error : [Unisim PLLE4_ADV-102] input DI(15 downto 0) is set to"));
      Write ( Message, di_str);
      Write ( Message, string'(" at address DADDR = "));
      Write ( Message, daddr_str );
      Write ( Message, string'(". The bit 12 needs to be set to 1."));
      Write ( Message, '.' & LF );
      assert false report Message.all severity error;
      DEALLOCATE (Message);
    end if;
  
    if ( di_in(5 downto 0) = "000000") then
       clk_lt := "1000000";
    else
       clk_lt := ( '0' & di_in(5 downto 0));
    end if;
    if (  di_in(11 downto 6) = "000000") then
       clk_ht := "1000000";
    else
       clk_ht := ( '0' & di_in(11 downto 6));
    end if;

  end procedure clkout_hl_para_drp; 

  function clkout_duty_chk (CLKOUT_DIVIDE : in integer;
                            CLKOUT_DUTY_CYCLE : in real;
                            CLKOUT_DUTY_CYCLE_N : in string)
                          return std_ulogic is
    constant O_MAX_HT_LT_real : real := 64.0;
    variable CLKOUT_DIVIDE_real : real;
    variable CLK_DUTY_CYCLE_MIN : real;
    variable CLK_DUTY_CYCLE_MIN_rnd : real;
    variable CLK_DUTY_CYCLE_MAX : real;
    variable CLK_DUTY_CYCLE_STEP : real;
    variable clk_duty_tmp_int : integer;
    variable  duty_cycle_valid : std_ulogic;
    variable tmp_duty_value : real;
    variable  tmp_j : real; 
    variable Message : line;
    variable step_round_tmp : integer;
    variable step_round_tmp1 : real;

  begin
    CLKOUT_DIVIDE_real := real(CLKOUT_DIVIDE);
    step_round_tmp := 1000 /CLKOUT_DIVIDE;
    step_round_tmp1 := real(step_round_tmp);
    if (CLKOUT_DIVIDE_real > O_MAX_HT_LT_real) then 
      CLK_DUTY_CYCLE_MIN := (CLKOUT_DIVIDE_real - O_MAX_HT_LT_real)/CLKOUT_DIVIDE_real;
      CLK_DUTY_CYCLE_MAX := (O_MAX_HT_LT_real + 0.5)/CLKOUT_DIVIDE_real;
      CLK_DUTY_CYCLE_MIN_rnd := CLK_DUTY_CYCLE_MIN;
    else  
      if (CLKOUT_DIVIDE = 1) then
          CLK_DUTY_CYCLE_MIN_rnd := 0.0;
          CLK_DUTY_CYCLE_MIN := 0.0;
      else
          CLK_DUTY_CYCLE_MIN_rnd := step_round_tmp1 / 1000.00;
          CLK_DUTY_CYCLE_MIN := 1.0 / CLKOUT_DIVIDE_real;
      end if;
      CLK_DUTY_CYCLE_MAX := 1.0;
    end if;

    if ((CLKOUT_DUTY_CYCLE > CLK_DUTY_CYCLE_MAX) or (CLKOUT_DUTY_CYCLE < CLK_DUTY_CYCLE_MIN_rnd)) then 
      Write ( Message, string'(" Warning : [Unisim PLLE4_ADV-103] "));
      Write ( Message, CLKOUT_DUTY_CYCLE_N);
      Write ( Message, string'(" is set to "));
      Write ( Message, CLKOUT_DUTY_CYCLE);
      Write ( Message, string'(" and is not in the allowed range "));
      Write ( Message, CLK_DUTY_CYCLE_MIN);
      Write ( Message, string'("  to "));
      Write ( Message, CLK_DUTY_CYCLE_MAX);
      Write ( Message, '.' & LF );
      assert false report Message.all severity warning;
      DEALLOCATE (Message);
    end if;

    CLK_DUTY_CYCLE_STEP := 0.5 / CLKOUT_DIVIDE_real;
    tmp_j := 0.0;
    duty_cycle_valid := '0';
    clk_duty_tmp_int := 0;
    for j in 0 to  (2 * CLKOUT_DIVIDE ) loop
      tmp_duty_value := CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * tmp_j;
      if (abs(tmp_duty_value - CLKOUT_DUTY_CYCLE) < 0.001 and (tmp_duty_value <= CLK_DUTY_CYCLE_MAX)) then
          duty_cycle_valid := '1';
      end if;
      tmp_j := tmp_j + 1.0;
    end loop;

    if (duty_cycle_valid /= '1') then
      Write ( Message, string'(" Warning : [Unisim PLLE4_ADV-104] "));
      Write ( Message, CLKOUT_DUTY_CYCLE_N);
      Write ( Message, string'(" =  "));
      Write ( Message, CLKOUT_DUTY_CYCLE);
      Write ( Message, string'(" which is  not an allowed value. Allowed value s are: "));
      Write ( Message,  LF );
      tmp_j := 0.0;
      for j in 0 to  (2 * CLKOUT_DIVIDE ) loop
        tmp_duty_value := CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * tmp_j;
        if ( (tmp_duty_value <= CLK_DUTY_CYCLE_MAX) and (tmp_duty_value < 1.0)) then
           Write ( Message,  tmp_duty_value);
           Write ( Message,  LF );
        end if;
        tmp_j := tmp_j + 1.0;
      end loop;
      assert false report Message.all severity warning;
      DEALLOCATE (Message);
    end if;
    return duty_cycle_valid;
  end function clkout_duty_chk;

-- Input/Output Pin signals

  constant CLKIN_FREQ_MAX : real := 1066.0;
  constant CLKIN_FREQ_MIN : real := 70.0;
  constant CLKPFD_FREQ_MAX : real := 667.5;
  constant CLKPFD_FREQ_MIN : real := 70.0;
  constant VCOCLK_FREQ_MAX : real := 1500.0;
  constant VCOCLK_FREQ_MIN : real := 750.0;

  constant VCOCLK_FREQ_TARGET : real := 1200.0;
  constant M_MIN : integer := 2;
  constant M_MAX : integer := 21;
  constant D_MIN : integer := 1;
  constant D_MAX : integer := 15;
  constant O_MAX_HT_LT : integer := 128; -- change from 64
  constant REF_CLK_JITTER_MAX : time := 1000 ps;
  constant OSC_P2 : time := 250 ps;

  constant MAX_FEEDBACK_DELAY : real := 3.00;
  constant MAX_FEEDBACK_DELAY_SCALE : time := 1 ns;
 
  signal   pll_lock_time : integer;
  signal   lock_period_time : integer;  
  signal   STARTUP_WAIT_sig : std_ulogic;
  signal   xiphy_mode : std_logic_vector(1 downto 0);
  signal   GSR_dly      : std_ulogic := '0';
  signal   clkout0_out  :  std_ulogic := '0';
  signal   clkout1_out  :  std_ulogic := '0';
  signal   clkinstopped_out : std_ulogic := '0';
  signal   clkfbstopped_out : std_ulogic := '0';
  signal   clkfb_out  :  std_ulogic := '0';
  signal   period_avg_stp : time := 0 ps;
  signal   locked_out  :  std_ulogic := '0';
  signal   locked_out_tmp  :  std_ulogic := '0';
  signal   do_out  :  std_logic_vector(15 downto 0);
  signal   DRDY_out  :  std_ulogic := '0';
  signal   PSDONE_out  :  std_ulogic := '0';

  signal di_in : std_logic_vector (15 downto 0);
  signal dwe_in : std_ulogic := '0';
  signal den_in : std_ulogic := '0';
  signal dclk_in : std_ulogic := '0';
  signal rst_in : std_ulogic := '0';
  signal pwrdwn_in : std_ulogic := '0';
  signal pwrdwn_in1 : std_ulogic := '0';
  signal pwrdwn_in1_h : std_ulogic := '0';
  signal pwron_int : std_ulogic := '1';
  signal rst_input : std_ulogic := '0';
  signal rst_input_r : std_ulogic := '0';
  signal rst_input_r_h : std_ulogic := '0';
  signal pchk_clr : std_ulogic := '0';
  signal clkin_in : std_ulogic := '0';
  signal clkfb_in : std_ulogic := '0';
  signal clkin_in_dly : std_ulogic := '0';
  signal daddr_in :  std_logic_vector(6 downto 0);
  signal daddr_in_lat :  integer := 0;
  signal drp_lock :  std_ulogic := '0';
  constant drp_lock_lat      :  integer := 4;
  signal   drp_lock_lat_cnt  :  integer := 0;
  type   drp_array is array (127 downto 0) of std_logic_vector(15 downto 0);
  signal dr_sram : drp_array;
  signal xiphyen_in : std_ulogic := '0';
  signal xiphyen_sync : std_ulogic := '0';
  signal xiphyen_sync1 : std_ulogic := '0';
  signal xiphyen_sync2 : std_ulogic := '0';
  signal clkvco_cnt : unsigned (1 downto 0) := "00";
        
  signal clk0_out :  std_ulogic := '0';
  signal clk1_out :  std_ulogic := '0';
  signal clkfbm1_out :  std_ulogic := '0';
  signal clkind_out :  std_ulogic := '0';
  signal clkout_en :  std_ulogic := '0';
  signal clkout_en1 :  std_ulogic := '0';
  signal clkout_en0 :  std_ulogic := '0';
  signal clkout_en0_tmp :  std_ulogic := '0';
  signal clkout_en0_tmp1 :  std_ulogic := '0';
  signal clkout_en_t : integer := 0;
  signal clkout_en_val : integer := 0;
  signal clkout_cnt : integer := 0;
  signal clkin_cnt : integer := 0;
  signal clkin_lock_cnt : integer := 0;
  signal clkout_en_time : integer := 12;
  signal locked_en_time : integer := 10;
  signal lock_cnt_max : integer := 30;
  signal clkvco_lk :  std_ulogic := '0';
  signal clkvco_lk_tmp2 :  std_ulogic := '0';
  signal clkvco_lk_dly_tmp :  std_ulogic := '0';
  signal clkinstopped_vco_f : std_ulogic := '0';
  signal clkvco :  std_ulogic := '0';
  signal clkvco_2x :  std_ulogic := '0';
  signal clkvco_by2 :  std_ulogic := '0';
  signal clkvco_by8 :  std_ulogic := '0';
  signal fbclk_tmp :  std_ulogic := '0';
  signal dly_tmp_o : time := 0 ps; 
  signal clkfb_div_fint     : integer := 0;
  signal clkfbm1_div_t     : real := 1.000;
  signal clk0_div_fint      : integer := 0;
  signal init_done          : std_ulogic := '0';

  signal rst_edge : time := 0 ps;
  signal rst_ht : time := 0 ps;
  signal fb_delay_found :  std_ulogic := '0';
  signal fb_delay_found_tmp :  std_ulogic := '0';
  signal clkfb_tst :  std_ulogic := '0';
  signal fb_delay_max : time := MAX_FEEDBACK_DELAY * MAX_FEEDBACK_DELAY_SCALE;
  signal fb_delay : time := 0 ps;
  signal clkvco_delay : time := 0 ps;
  signal val_tmp : time := 0 ps;
  signal clkin_edge : time := 0 ps;
  signal delay_edge : time := 0 ps;

  type   real_array_usr is array (4 downto 0) of time;
  signal clkinp_period : real_array_usr := (others => 0 ps);
  signal period_vco_en : time := 0 ps;
  signal period_vco : time := 0 ps;
  signal period_vco_mf : integer := 0;
  signal period_vco_rm : integer := 0;
  signal period_vco_cmp_cnt : integer := 0;
  signal clkvco_tm_cnt : integer := 0;
  signal period_vco_cmp_flag : integer := 0;
  signal period_vco_half : time := 0 ps;
  signal period_vco_half1 : time := 0 ps;
  signal period_vco_half_rm : time := 0 ps;
  signal period_vco_half_rm1 : time := 0 ps;
  signal period_vco_half_rm2 : time := 0 ps;
  signal clkvco_pdrm : real := 0.0;
  constant period_vco_max : time :=  1000 ps / VCOCLK_FREQ_MIN;
  constant period_vco_min : time :=  1000 ps / VCOCLK_FREQ_MAX;
  constant period_vco_target : time :=   1000 ps / VCOCLK_FREQ_TARGET;
  constant period_vco_target_half : time :=  500 ps / VCOCLK_FREQ_TARGET;
  signal period_fb : time := 0 ps;
  signal period_avg : time := 0 ps;

  signal md_product : integer;
  signal m_product : integer;
  signal m_product1 : integer := 0;
  signal m_product2 : integer;

  signal pll_locked_delay : time := 0 ps;
  signal clkin_dly_t : time := 0 ps;
  signal pll_unlock : std_ulogic := '0';
  signal pll_unlock1 : std_ulogic := '0';
  signal pll_unlock1_tmp : std_ulogic := '0';
  signal pll_locked_tm : std_ulogic := '0';
  signal pll_locked_tmp1 : std_ulogic := '0';
  signal pll_locked_tmp2 : std_ulogic := '0';
  signal pll_locked_tmp2_dly : std_ulogic := '0';
  signal lock_period : std_ulogic := '0';
  signal pll_lock_tm: std_ulogic := '0';
  signal unlock_recover : std_ulogic := '0';
  signal clkpll_jitter_unlock : std_ulogic := '0';
  signal clkin_jit : time := 0 ps;
  constant ref_jitter_max_tmp : time := REF_CLK_JITTER_MAX;
       
  signal clk0_edge  : std_ulogic := '0';
  signal clk1_edge  : std_ulogic := '0';
  signal clkfbm1_edge  : std_ulogic := '0';
  signal clkind_edge  : std_ulogic := '0';
  signal clk0_nocnt  : std_ulogic := '0';
  signal clk1_nocnt  : std_ulogic := '0';
  signal clkfbm1_nocnt  : std_ulogic := '0';
  signal clkind_nocnt  : std_ulogic := '0';
  signal clk0_dly_cnt : integer := 0;
  signal clk1_dly_cnt : integer := 0;
  signal clkfbm1_dly_cnt : integer := 0;
  signal clk0_ht : std_logic_vector (6 downto 0) := "0000000";
  signal clk1_ht : std_logic_vector (6 downto 0) := "0000000";
  signal clk0_lt : std_logic_vector (6 downto 0) := "0000000";
  signal clk1_lt : std_logic_vector (6 downto 0) := "0000000";
  signal clkind_ht : std_logic_vector (6 downto 0) := "0000000";
  signal clkind_lt : std_logic_vector (6 downto 0) := "0000000";
  signal clkfbm1_ht : std_logic_vector (6 downto 0) := "0000000";
  signal clkfbm1_lt : std_logic_vector (6 downto 0) := "0000000";
  signal clkout0_dly : integer := 0;
  signal clkout1_dly : integer := 0;
  signal clkfbm1_dly : integer := 0;
  signal clk0_ht1 : integer := 0;
  signal clk1_ht1 : integer := 0;
  signal clkind_ht1 : integer := 0;
  signal clkfbm1_ht1 : integer := 0;
  signal clk0_cnt : integer := 0;
  signal clk1_cnt : integer := 0;
  signal clkfbm1_cnt : integer := 0;
  signal clkind_cnt : integer := 0;
  signal clk0_div : integer := 0;
  signal clk1_div : integer := 0;
  signal clkfbm1_div : integer := 1;
  signal clkfbm1_f_div : real := 1.0;
  signal clk0_div1 : integer := 0;
  signal clk1_div1 : integer := 0;
  signal clkfbm1_div1 : integer := 0;
  signal clkind_div : integer := 1;
  signal clkind_div1 : integer := 1;
        
  signal clkvco_lk_tmp : std_ulogic := '0';
  signal clkin_period_tmp : real := 0.0;
  signal clkpll_tmp1 : std_ulogic := '0';
  signal clkpll : std_ulogic := '0';
  signal clkpll_r : std_ulogic := '0';
  signal clkin_lost_cnt : integer := 0; 
  signal clkfb_lost_cnt : integer := 0;
  signal clkin_lost_val : integer := 500;
  signal clkfb_lost_val : integer := 500;
  signal clk_osc :  std_ulogic := '0';
  signal clkin_p :  std_ulogic := '0';
  signal clkfb_p :  std_ulogic := '0';
  signal clkoutxiphy_int : std_ulogic := '0';
  signal IS_CLKFBIN_INVERTED_BIN : std_ulogic;
  signal clkbfbin_sel : std_ulogic := '0';

  begin

   IS_CLKFBIN_INVERTED_BIN <= TO_X01(IS_CLKFBIN_INVERTED);
   CLKOUT0 <=  clkout0_out;
   CLKOUT0B <=  not clkout0_out;
   CLKOUT1 <=  clkout1_out;
   CLKOUT1B <=  not clkout1_out;
   CLKFBOUT <= clkfb_out;
   with xiphy_mode select clkoutxiphy_int <= clkvco_2x when "00",
                                             clkvco when "01",
                                             clkvco_by2 when "10",
                                             --clkin_in when "11",
                                             clkind_out when "11",
                    clkvco when others;
                                     
   CLKOUTPHY <= clkoutxiphy_int when xiphyen_sync = '1' else '0';                 

   unisim.VCOMPONENTS.PLL_LOCKG <= '0' when (STARTUP_WAIT_sig = '1' and locked_out_tmp = '0') else 'H';

   DO <=   do_out(15 downto 0);
   DRDY <=   DRDY_out after 100 ps;
   LOCKED <= locked_out_tmp;
   pll_locked_tmp2_dly <= pll_locked_tmp2 after 100 ps;
   clkin_in <= not CLKIN when IS_CLKIN_INVERTED = '1' else CLKIN;
   clkbfbin_sel <= '1' when (((COMPENSATION = "AUTO") and (CLKFBIN = 'U')) or
                             (COMPENSATION = "INTERNAL")) else '0';
   clkfb_in <= clkfb_out when clkbfbin_sel = '1' else CLKFBIN xor IS_CLKFBIN_INVERTED_BIN;
   rst_input_r <= not RST when IS_RST_INVERTED = '1' else RST;
   xiphyen_in <= CLKOUTPHYEN;
   daddr_in(6 downto 0) <= DADDR(6 downto 0);
   di_in(15 downto 0) <= DI(15 downto 0);
   dwe_in <= DWE;
   den_in <= DEN;
   dclk_in <= DCLK;
   pwrdwn_in <= not PWRDWN when IS_PWRDWN_INVERTED = '1' else PWRDWN;
   GSR_dly <= TO_X01(GSR);
   INIPROC : process
            variable Message : line;
            variable con_line : line;
            variable tmpvalue : real;
            variable chk_ok : std_ulogic;
            variable tmp_string : string(1 to 18);
            variable skipspace : character;
            variable CLK_DUTY_CYCLE_MIN : real;
            variable CLK_DUTY_CYCLE_MAX : real;
            variable CLK_DUTY_CYCLE_STEP : real;
            variable O_MAX_HT_LT_real : real;
            variable duty_cycle_valid : std_ulogic;
            variable tmp_j : real;
            variable tmp_duty_value : real;
            variable clk_ht_i : std_logic_vector(5 downto 0);
            variable clk_lt_i : std_logic_vector(5 downto 0);
            variable clk_nocnt_i : std_ulogic;
            variable clk_edge_i : std_ulogic;
            variable clkfbm1_f_div_v : real := 1.0;
            variable clkfb_div_fint_v : integer := 1;
            variable clkfb_div_fint_v_tmp : integer := 1;
            variable clkfb_div_fint_v1 : real := 1.0;
            variable clk0_div_fint_v : integer := 1;
            variable lock_en_tmp1_rl : real;
            variable lock_en_tmp2_rl : real;
            variable lock_en_tmp3_int : integer;
            variable clkout_en_time_i : integer;
            variable clkout_en_time_i1 : integer;
            
    begin
      -- case COMPENSATION is
      if((COMPENSATION /= "AUTO") and (COMPENSATION /= "auto")) and 
        ((COMPENSATION /= "BUF_IN") and (COMPENSATION /= "buf_in")) and
        ((COMPENSATION /= "INTERNAL") and (COMPENSATION /= "internal")) and
        ((COMPENSATION /= "PHY_ALIGN") and (COMPENSATION /= "phy_align")) then
        assert FALSE report "Error : [Unisim PLLE4_ADV-105] COMPENSATION = is not AUTO, BUF_IN, INTERNAL, PHY_ALIGN." severity error;
      end if;
    -- end case;

      if((STARTUP_WAIT = "FALSE") or (STARTUP_WAIT = "false")) then
         STARTUP_WAIT_sig <= '0';
      elsif((STARTUP_WAIT = "TRUE") or (STARTUP_WAIT= "true")) then
         STARTUP_WAIT_sig <= '1';
      else
         assert FALSE report "Error : [Unisim PLLE4_ADV-106] STARTUP_WAIT  is not FALSE, TRUE." severity error;
      end if;

     -- case CLKOUTPHY_MODE is
      if((CLKOUTPHY_MODE = "VCO_2X") or (CLKOUTPHY_MODE = "vco_2x")) then
        xiphy_mode <= "00";
      elsif((CLKOUTPHY_MODE = "VCO") or (CLKOUTPHY_MODE= "vco")) then
        xiphy_mode <= "01";
      elsif((CLKOUTPHY_MODE = "VCO_HALF") or (CLKOUTPHY_MODE= "vco_half")) then
        xiphy_mode <= "10";
      elsif((CLKOUTPHY_MODE = "CLKIN") or (CLKOUTPHY_MODE= "clkin")) then
        xiphy_mode <= "11";
      else
        assert FALSE report "Error : [Unisim PLLE4_ADV-107] CLKOUTPHY_MODE = is not VCO_2X, CLKIN, VCO_HALF, VCO." severity error;
      end if;

       clkfbm1_f_div_v := real(CLKFBOUT_MULT);
       clkfbm1_f_div <= clkfbm1_f_div_v;
       clkfb_div_fint_v := CLKFBOUT_MULT;
       clkfb_div_fint_v1 := real(clkfb_div_fint_v);
       clkfb_div_fint <= clkfb_div_fint_v;
       clk0_div_fint_v := CLKOUT0_DIVIDE;
       clk0_div_fint <= clk0_div_fint_v;


       if (CLKOUT0_DIVIDE < 1 or CLKOUT0_DIVIDE > 256) then
          assert FALSE report "Error : [Unisim PLLE4_ADV-108] CLKOUT0_DIVIDE is not in range 1 to 256." severity error;
       end if;

       if ((CLKOUT0_DUTY_CYCLE < 0.001) or (CLKOUT0_DUTY_CYCLE > 0.999)) then
           assert FALSE report "Error : [Unisim PLLE4_ADV-109] CLKOUT0_DUTY_CYCLE is not real in range 0.001 to 0.999 pecentage."severity error;
       end if;

        case CLKOUT1_DIVIDE is
           when   1 to 256 => NULL ;
           when others  =>  assert FALSE report "Error : [Unisim PLLE4_ADV-110] CLKOUT1_DIVIDE is not in range 1 to 256." severity error;
        end case;

         if ((CLKOUT1_DUTY_CYCLE < 0.001) or (CLKOUT1_DUTY_CYCLE > 0.999)) then
             assert FALSE report "Error : [Unisim PLLE4_ADV-111] CLKOUT1_DUTY_CYCLE is not real in range 0.001 to 0.999 pecentage."severity error;
         end if;

         if (CLKFBOUT_MULT < M_MIN or CLKFBOUT_MULT > M_MAX) then 
          assert FALSE report "Error : [Unisim PLLE4_ADV-112] CLKFBOUT_MULT is not in range 1 to 19 ." severity error;
         end if; 

       case DIVCLK_DIVIDE is
         when    D_MIN  to D_MAX => NULL;
         when others  =>  assert FALSE report "Error : [Unisim PLLE4_ADV-113] DIVCLK_DIVIDE is not in range 1 to 15." severity error;
       end case;

       if ((REF_JITTER < 0.0) or (REF_JITTER > 0.999)) then
         assert FALSE report "Error : [Unisim PLLE4_ADV-114] REF_JITTER is not in range 0.0 ... 1.0." severity error;
       end if;

       O_MAX_HT_LT_real := real(O_MAX_HT_LT);

       if (CLKOUT0_DIVIDE /= 0) then
        chk_ok := clkout_duty_chk (CLKOUT0_DIVIDE, CLKOUT0_DUTY_CYCLE, "CLKOUT0_DUTY_CYCLE");
       end if;
       if (CLKOUT1_DIVIDE /= 0) then
       chk_ok := clkout_duty_chk (CLKOUT1_DIVIDE, CLKOUT1_DUTY_CYCLE, "CLKOUT1_DUTY_CYCLE");
       end if;
       lock_en_tmp3_int := DIVCLK_DIVIDE * CLKFBOUT_MULT;
       clkout_en_time_i := lock_en_tmp3_int;
       if ( CLKIN_PERIOD < MAX_FEEDBACK_DELAY ) then
       fb_delay_max <= CLKIN_PERIOD * MAX_FEEDBACK_DELAY_SCALE;
       else
       fb_delay_max <= MAX_FEEDBACK_DELAY * MAX_FEEDBACK_DELAY_SCALE;
       end if;
       pll_lock_time <= 12;
       lock_period_time <= 10;
       clkout_en_time_i1 := clkout_en_time_i + 12;
       clkout_en_time <= clkout_en_time_i1;
       locked_en_time <= lock_en_tmp3_int +  clkout_en_time_i1 + 2;
       lock_cnt_max <= lock_en_tmp3_int +  clkout_en_time_i1 + 16;
       init_done <= '1';

       wait;
    end process INIPROC;


    clkincheck_p : process 
          variable period_clkin : real;
          variable clkvco_freq_init_chk : real := 0.0;
          variable clkpfd_freq_init_chk : real := 0.0;
          variable Message : line;
          variable tmpreal1 : real;
          variable tmpreal2 : real;
          variable first_check : boolean := true;
          variable clkin_chk_t1 : real;
          variable clkin_chk_t1_tmp1 : real;
          variable clkin_chk_t1_tmp2 : real;
          variable clkin_chk_t1_tmpi : time;
          variable clkin_chk_t1_tmpi1 : integer;
          variable clkin_chk_t2 : real;
          variable clkin_chk_t2_tmp1 : real;
          variable clkin_chk_t2_tmp2 : real;
          variable clkin_chk_t2_tmpi : time;
          variable clkin_chk_t2_tmpi1 : integer;
    begin

      if (first_check = true) then

        if (NOW = 0 ps) then
           wait for 1 ps;
        end if;

           clkin_chk_t1_tmp1 := 1000.0 / CLKIN_FREQ_MIN;
           clkin_chk_t1_tmp2 := 1000.0 * clkin_chk_t1_tmp1;
           clkin_chk_t1_tmpi := clkin_chk_t1_tmp2 * 1 ps;
           clkin_chk_t1_tmpi1 := clkin_chk_t1_tmpi / 1 ps;
           clkin_chk_t1 := real(clkin_chk_t1_tmpi1) / 1000.0;

           clkin_chk_t2_tmp1 := 1000.0 / CLKIN_FREQ_MAX;
           clkin_chk_t2_tmp2 := 1000.0 * clkin_chk_t2_tmp1;
           clkin_chk_t2_tmpi := clkin_chk_t2_tmp2 * 1 ps;
           clkin_chk_t2_tmpi1 := clkin_chk_t2_tmpi / 1 ps;
           clkin_chk_t2 := real(clkin_chk_t2_tmpi1) / 1000.0;
      

        if (((CLKIN_PERIOD < clkin_chk_t2) or (CLKIN_PERIOD > clkin_chk_t1))) then
        Write ( Message, string'(" Error : [Unisim PLLE4_ADV-115] The attribute CLKIN_PERIOD is set to "));
        Write ( Message, CLKIN_PERIOD);
        Write ( Message, string'(" ns and out the allowed range "));
        Write ( Message, clkin_chk_t2);
        Write ( Message, string'(" ns to "));
        Write ( Message, clkin_chk_t1);
        Write ( Message, string'(" ns" ));
        Write ( Message, '.' & LF );
        assert false report Message.all severity error;
        DEALLOCATE (Message);
          end if;

        period_clkin :=  CLKIN_PERIOD;
      
        tmpreal1 := real(CLKFBOUT_MULT);
        tmpreal2 := real(DIVCLK_DIVIDE);
        if (period_clkin > 0.000) then
          clkvco_freq_init_chk :=  (1000.0 * tmpreal1) / ( period_clkin * tmpreal2);
      
          if ((clkvco_freq_init_chk > VCOCLK_FREQ_MAX) or (clkvco_freq_init_chk < VCOCLK_FREQ_MIN)) then
           Write ( Message, string'(" Error : [Unisim PLLE4_ADV-116] The calculation of VCO frequency="));
           Write ( Message, clkvco_freq_init_chk);
           Write ( Message, string'(" Mhz. This exceeds the permitted VCO frequency range of "));
           Write ( Message, VCOCLK_FREQ_MIN);
           Write ( Message, string'(" MHz to "));
           Write ( Message, VCOCLK_FREQ_MAX);
           Write ( Message, string'(" MHz. The VCO frequency is calculated with formula: VCO frequency =  CLKFBOUT_MULT / (DIVCLK_DIVIDE * CLKIN_PERIOD)."));
           Write ( Message, string'(" Please adjust the attributes to the permitted VCO frequency range."));
           assert false report Message.all severity error;
              DEALLOCATE (Message);
          end if;
        end if;   
   if (period_clkin > 0.000) then
          clkpfd_freq_init_chk :=  (1000.0) / (period_clkin * tmpreal2);
      
          if ((clkpfd_freq_init_chk > CLKPFD_FREQ_MAX) or (clkpfd_freq_init_chk < CLKPFD_FREQ_MIN)) then
           Write ( Message, string'(" Error : [Unisim PLLE4_ADV-117] The calculation of PFD frequency="));
           Write ( Message, clkpfd_freq_init_chk);
           Write ( Message, string'(" Mhz. This exceeds the permitted PFD frequency range of "));
           Write ( Message, CLKPFD_FREQ_MIN);
           Write ( Message, string'(" MHz to "));
           Write ( Message, CLKPFD_FREQ_MAX);
           Write ( Message, string'(" MHz. The PFD frequency is calculated with formula: PFD frequency =  (1 / (DIVCLK_DIVIDE * CLKIN_PERIOD)."));
           Write ( Message, string'(" Please adjust the attributes to the permitted PFD frequency range."));
           assert false report Message.all severity error;
              DEALLOCATE (Message);
          end if;
        end if;
        first_check := false;
    end if;
      wait on clkpll_r;
    end process;

    clkpll_r <= clkin_in;
    pwrdwn_in1 <= '1' when pwrdwn_in = '1' else '0'; 
    rst_input <= rst_input_r or pwrdwn_in1;

    RST_SYNC_P : process (clkpll_r, rst_input)
    begin
      if (rst_input = '1') then
        rst_in <= '1';
      elsif (rising_edge (clkpll_r)) then
        rst_in <= rst_input;
      end if;
    end process;

--simprim_rst_h
  pwrdwn_in1_h_p : process(pwrdwn_in1, pchk_clr)
  begin
    if (rising_edge(pwrdwn_in1)) then
       pwrdwn_in1_h <= '1';
    elsif (rising_edge(pchk_clr)) then
       pwrdwn_in1_h <= '0';
    end if;
  end process;

  rst_input_r_h_p : process(rst_input_r, pchk_clr)
  begin
    if (rising_edge(rst_input_r)) then
       rst_input_r_h <= '1';
    elsif (rising_edge(pchk_clr)) then
       rst_input_r_h <= '0';
    end if;
  end process;

    RST_PW_P : process (rst_input)
      variable rst_edge : time := 0 ps;
      variable rst_ht : time := 0 ps;
    begin
      if (rising_edge(rst_input)) then
         rst_edge := NOW;
      elsif ((falling_edge(rst_input)) and rst_edge > 1 ps)  then
         rst_ht := NOW - rst_edge;
         if (rst_ht < 1.5 ns and rst_ht > 0 ps) then
           if (rst_input_r_h = '1' and  pwrdwn_in1_h = '1') then
            assert false report
               "Error : [Unisim PLLE4_ADV-118] RST and PWRDWN must be asserted at least for 1.5 ns."
            severity error;
           elsif (rst_input_r_h = '1' and  pwrdwn_in1_h = '0') then
            assert false report
               "Error : [Unisim PLLE4_ADV-119] RST must be asserted at least for 1.5 ns."
            severity error;
           elsif (rst_input_r_h = '0' and  pwrdwn_in1_h = '1') then
            assert false report
               "Error : [Unisim PLLE4_ADV-120] PWRDWN must be asserted at least for 1.5 ns."
            severity error;
           end if;
         end if;
      end if;
    end process;
--endsimprim_rst_h
     
---- 
----  DRP port read and write
----

    do_out <= dr_sram(daddr_in_lat);

    DRP_PROC : process
      variable address : integer;
      variable valid_daddr : boolean := false;
      variable Message : line;
      variable di_str : string (1 to 16);
      variable daddr_str : string ( 1 to 7);
      variable first_time : boolean := true;
      variable clk_ht : std_logic_vector (6 downto 0);
      variable tmp_ht : std_logic_vector (6 downto 0);
      variable clk_lt : std_logic_vector (6 downto 0);
      variable tmp_lt : std_logic_vector (6 downto 0);
      variable clk_nocnt : std_ulogic;
      variable clk_edge : std_ulogic;
      variable clkout_dly : std_logic_vector (5 downto 0);
      variable tmpx : std_logic_vector (7 downto 0);
      variable clk0_hti : std_logic_vector (6 downto 0);
      variable clk1_hti : std_logic_vector (6 downto 0);
      variable clkfbm1_hti : std_logic_vector (6 downto 0);
      variable clkfbm1_divi : integer;
      variable clk0_lti : std_logic_vector (6 downto 0);
      variable clk1_lti : std_logic_vector (6 downto 0);
      variable clkfbm1_lti : std_logic_vector (6 downto 0);
      variable clk0_nocnti : std_ulogic;
      variable clk1_nocnti : std_ulogic;
      variable clkfbm1_nocnti : std_ulogic;
      variable clk0_edgei  : std_ulogic;
      variable clk1_edgei  : std_ulogic;
      variable clkfbm1_edgei  : std_ulogic;
      variable clkout0_dlyi : std_logic_vector (5 downto 0);
      variable clkout1_dlyi : std_logic_vector (5 downto 0);
      variable clkfbm1_dlyi : std_logic_vector (5 downto 0);
      variable clk_ht1 : integer;
      variable clk_div : integer;
      variable clk_div1 : integer;
      variable clkind_hti : std_logic_vector (6 downto 0);
      variable clkind_lti : std_logic_vector (6 downto 0);
      variable clkfbin_hti : std_logic_vector (6 downto 0);
      variable clkfbin_lti : std_logic_vector (6 downto 0);
      variable clkind_nocnti : std_ulogic;
      variable clkind_edgei : std_ulogic;
      variable clkfbin_edgei : std_ulogic;
      variable clkfbin_nocnti : std_ulogic;
      variable pll_cp_v : std_logic_vector (3 downto 0);
      variable pll_res_v : std_logic_vector (3 downto 0);
      variable pll_cp : integer range 0 to 15;
      variable pll_res : integer range 0 to 15;
      variable pll_lfhf : std_logic_vector (1 downto 0);
    
      variable drp_lock_ref_dly : integer range 0 to 31;
      variable drp_lock_fb_dly : integer range 0 to 31;
      variable drp_lock_cnt : integer range 0 to 1023;
      variable drp_unlock_cnt : integer range 0 to 1023;
      variable drp_lock_sat_high : integer range 0 to 1023;
      variable drp_lock_ref_dly_v : std_logic_vector (4 downto 0);
      variable drp_lock_fb_dly_v : std_logic_vector (4 downto 0);
      variable drp_lock_cnt_v : std_logic_vector (9 downto 0);
      variable drp_unlock_cnt_v : std_logic_vector (9 downto 0);
      variable drp_lock_sat_high_v : std_logic_vector (9 downto 0);
      variable tmpadd : std_logic_vector (4 downto 0);
    begin

    if (first_time = true and init_done = '1') then
        clk_out_para_cal (clk_ht, clk_lt, clk_nocnt, clk_edge, clk0_div_fint, CLKOUT0_DUTY_CYCLE);
        clk0_hti := clk_ht;
        clk0_lti := clk_lt;
        clk0_nocnti := clk_nocnt;
        clk0_edgei := clk_edge;
        clk0_ht <= clk0_hti;
        clk0_lt <= clk0_lti;
        clk0_nocnt <= clk0_nocnti;
        clk0_edge <= clk0_edgei;

        clk_out_para_cal (clk_ht, clk_lt, clk_nocnt, clk_edge, clkfb_div_fint, 0.50);
        clkfbm1_hti := clk_ht;
        clkfbm1_lti := clk_lt;
        clkfbm1_nocnti := clk_nocnt;
        clkfbm1_edgei := clk_edge;
        clkfbm1_ht <= clkfbm1_hti;
        clkfbm1_lt <= clkfbm1_lti;
        clkfbm1_nocnt <= clkfbm1_nocnti;
        clkfbm1_edge <= clkfbm1_edgei;

      clk_out_para_cal (clk_ht, clk_lt, clk_nocnt, clk_edge, CLKOUT1_DIVIDE, CLKOUT1_DUTY_CYCLE);
      clk1_hti := clk_ht;
      clk1_lti := clk_lt;
      clk1_nocnti := clk_nocnt;
      clk1_edgei := clk_edge;
      clk1_ht <= clk1_hti;
      clk1_lt <= clk1_lti;
      clk1_nocnt <= clk1_nocnti;
      clk1_edge <= clk1_edgei;

      clk_out_para_cal (clk_ht, clk_lt, clk_nocnt, clk_edge, DIVCLK_DIVIDE, 0.50);
      clkind_hti := clk_ht;
      clkind_lti := clk_lt;
      clkind_nocnti := clk_nocnt;
      clkind_edgei := clk_edge;
      clkind_ht <= clkind_hti;
      clkind_lt <= clkind_lti;

      clkout_pm_cal(clk_ht1, clk_div, clk_div1, clk0_hti, clk0_lti, clk0_nocnti, clk0_edgei);
      clk0_ht1 <= clk_ht1;
      clk0_div <= clk_div;
      clk0_div1 <= clk_div1;
      clkout_pm_cal(clk_ht1, clk_div, clk_div1, clk1_hti, clk1_lti, clk1_nocnti, clk1_edgei);
      clk1_ht1 <= clk_ht1;
      clk1_div <= clk_div;
      clk1_div1 <= clk_div1;
      clkout_pm_cal(clk_ht1, clk_div, clk_div1, clkfbm1_hti, clkfbm1_lti, clkfbm1_nocnti, clkfbm1_edgei);
      clkfbm1_ht1 <= clk_ht1;
      clkfbm1_div <= clk_div;
      clkfbm1_div1 <= clk_div1;
      clkout_pm_cal(clk_ht1, clk_div, clk_div1, clkind_hti, clkind_lti, clkind_nocnti, '0');
      clkind_ht1 <= clk_ht1;
      clkind_div1 <= clk_div1;
      clkind_div <= clk_div;

      clkout_dly_cal (clkout_dly, clk0_div_fint, CLKOUT0_PHASE, "CLKOUT0_PHASE");
      clkout0_dly <= SLV_TO_INT(clkout_dly);
      clkout0_dlyi := clkout_dly;
   
      clkout_dly_cal (clkout_dly, CLKOUT1_DIVIDE, CLKOUT1_PHASE, "CLKOUT1_PHASE");
      clkout1_dly <= SLV_TO_INT(clkout_dly);
      clkout1_dlyi := clkout_dly;

      clkout_dly_cal (clkout_dly, clkfb_div_fint, CLKFBOUT_PHASE, "CLKFBOUT_PHASE");
      clkfbm1_dly <= SLV_TO_INT(clkout_dly);
      clkfbm1_dlyi := clkout_dly;

      pll_lfhf := "00";

    case clkfb_div_fint is
       when 2 => pll_cp  := 3 ; pll_res := 7 ; 
       when 3 => pll_cp  := 5 ; pll_res := 15;
       when 4 => pll_cp  := 7 ; pll_res := 15;
       when 5 => pll_cp  := 7 ; pll_res := 11;
       when 6 => pll_cp  := 13; pll_res := 7 ;
       when 7 => pll_cp  := 14; pll_res := 11;
       when 8 => pll_cp  := 14; pll_res := 13;
       when 9 => pll_cp  := 15; pll_res := 13;
       when 10 => pll_cp := 15; pll_res := 3 ;
       when 11 => pll_cp := 14; pll_res := 5 ;
       when 12 => pll_cp := 15; pll_res := 5 ;
       when 13 => pll_cp := 15; pll_res := 9 ;
       when 14 => pll_cp := 13; pll_res := 1 ;
       when 15 => pll_cp := 15; pll_res := 14;
       when 16 => pll_cp := 14; pll_res := 1 ;
       when 17 => pll_cp := 15; pll_res := 1 ;
       when 18 => pll_cp := 15; pll_res := 1 ;
       when 19 => pll_cp := 15; pll_res := 1 ;
       when 20 => pll_cp := 14; pll_res := 6 ;
       when 21 => pll_cp := 14; pll_res := 6 ;
       when 22 => pll_cp := 15; pll_res := 6 ;
       when 23 => pll_cp := 15; pll_res := 6 ;
       when 24 => pll_cp := 14; pll_res := 10;
       when 25 => pll_cp := 14; pll_res := 10;
       when 26 => pll_cp := 14; pll_res := 10;
       when 27 => pll_cp := 13; pll_res := 10;
       when 28 => pll_cp := 6 ; pll_res := 2 ;
       when 29 => pll_cp := 6 ; pll_res := 2 ;
       when 30 => pll_cp := 6 ; pll_res := 2 ;
       when 31 => pll_cp := 13; pll_res := 6 ;
       when 32 => pll_cp := 12; pll_res := 10;
       when 33 => pll_cp := 6 ; pll_res := 12;
       when 34 => pll_cp := 6 ; pll_res := 12;
       when 35 => pll_cp := 5 ; pll_res := 2 ;
       when 36 => pll_cp := 3 ; pll_res := 4 ;
       when 37 => pll_cp := 3 ; pll_res := 4 ;
       when 38 => pll_cp := 3 ; pll_res := 4 ;
       when 39 => pll_cp := 3 ; pll_res := 4 ;
       when 40 => pll_cp := 3 ; pll_res := 4 ;
       when 41 => pll_cp := 2 ; pll_res := 8 ;
       when 42 => pll_cp := 2 ; pll_res := 8 ;
       when 43 => pll_cp := 2 ; pll_res := 8 ;
       when 44 => pll_cp := 2 ; pll_res := 8 ;
       when 45 => pll_cp := 2 ; pll_res := 8 ;
       when 46 => pll_cp := 2 ; pll_res := 8 ;
       when 47 => pll_cp := 2 ; pll_res := 8 ;
       when 48 => pll_cp := 2 ; pll_res := 8 ;
       when 49 => pll_cp := 2 ; pll_res := 8 ;
       when 50 => pll_cp := 2 ; pll_res := 8 ;
       when 51 => pll_cp := 2 ; pll_res := 8 ;
       when 52 => pll_cp := 2 ; pll_res := 8 ;
       when 53 => pll_cp := 2 ; pll_res := 8 ;
       when 54 => pll_cp := 4 ; pll_res := 12;
       when 55 => pll_cp := 4 ; pll_res := 12;
       when 56 => pll_cp := 4 ; pll_res := 12;
       when 57 => pll_cp := 4 ; pll_res := 12;
       when 58 => pll_cp := 4 ; pll_res := 12;
       when 59 => pll_cp := 4 ; pll_res := 12;
       when 60 => pll_cp := 4 ; pll_res := 12;
       when 61 => pll_cp := 2 ; pll_res := 4 ;
       when 62 => pll_cp := 2 ; pll_res := 4 ;
       when 63 => pll_cp := 2 ; pll_res := 4 ;
       when 64 => pll_cp := 2 ; pll_res := 4 ;
    when others => NULL;
    end case;

  case clkfb_div_fint is
     when 1 =>  drp_lock_ref_dly := 6;
           drp_lock_fb_dly := 6;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 2 =>  drp_lock_ref_dly := 6;
           drp_lock_fb_dly := 6;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 3 =>  drp_lock_ref_dly := 8;
           drp_lock_fb_dly := 8;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 4 =>  drp_lock_ref_dly := 11;
           drp_lock_fb_dly := 11;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 5 =>  drp_lock_ref_dly := 14;
           drp_lock_fb_dly := 14;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 6 =>  drp_lock_ref_dly := 17;
           drp_lock_fb_dly := 17;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 7 =>  drp_lock_ref_dly := 19;
           drp_lock_fb_dly := 19;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 8 =>  drp_lock_ref_dly := 22;
           drp_lock_fb_dly := 22;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 9 =>  drp_lock_ref_dly := 25;
           drp_lock_fb_dly := 25;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 10 =>  drp_lock_ref_dly := 28;
           drp_lock_fb_dly := 28;
           drp_lock_cnt := 1000;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 11 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 900;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 12 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 825;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 13 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 750;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 14 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 700;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 15 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 650;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 16 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 625;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 17 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 575;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 18 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 550;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 19 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 525;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 20 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 500;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 21 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 475;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 22 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 450;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 23 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 425;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 24 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 400;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 25 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 400;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 26 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 375;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 27 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 350;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 28 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 350;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 29 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 325;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 30 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 325;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 31 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 300;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 32 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 33 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 34 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 35 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 36 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 37 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 38 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 39 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 40 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 41 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 42 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 43 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 44 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 45 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 46 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 47 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 48 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 49 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 50 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 51 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 52 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 53 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 54 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 55 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 56 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 57 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 58 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 59 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 60 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 61 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 62 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 63 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when 64 =>  drp_lock_ref_dly := 31;
           drp_lock_fb_dly := 31;
           drp_lock_cnt := 275;
           drp_lock_sat_high := 1001;
           drp_unlock_cnt := 1;
     when others => NULL;
    end case;
     drp_lock_ref_dly_v := std_logic_vector(to_unsigned(drp_lock_ref_dly,5));
     drp_lock_fb_dly_v := std_logic_vector(to_unsigned(drp_lock_fb_dly,5));
     drp_lock_cnt_v := std_logic_vector(to_unsigned(drp_lock_cnt,10));
     drp_lock_sat_high_v := std_logic_vector(to_unsigned(drp_lock_sat_high,10));
     drp_unlock_cnt_v := std_logic_vector(to_unsigned(drp_unlock_cnt,10));

      tmpx := ('X' & 'X' & 'X' & 'X' & 'X' & 'X' & '0' & '0' );
      dr_sram(8) <= ("XXX" & '1' & clk0_hti(5 downto 0) & clk0_lti(5 downto 0));
      dr_sram(9) <= ("00000000" & clk0_edgei & clk0_nocnti & clkout0_dlyi(5 downto 0));
      dr_sram(10) <= ("XXX" & '1' & clk1_hti(5 downto 0) & clk1_lti(5 downto 0));
      dr_sram(11) <= ('X' & xiphy_mode(1) & xiphy_mode(0) & "XXX" & "00" & clk1_edgei & clk1_nocnti & clkout1_dlyi(5 downto 0));
      dr_sram(20) <= ("XXX" & '1' & clkfbm1_hti(5 downto 0) & clkfbm1_lti(5 downto 0));
      dr_sram(21) <= ("00000000"  & clkfbm1_edgei & clkfbm1_nocnti & clkfbm1_dlyi(5 downto 0));
      dr_sram(22) <= ("XX" & clkind_edgei & clkind_nocnti & clkind_hti(5 downto 0) & clkind_lti(5 downto 0));
      dr_sram(23) <= ("XX"  & clkfbin_edgei & clkfbin_nocnti & clkfbin_hti(5 downto 0) & clkfbin_lti(5 downto 0));
      dr_sram(24) <= ("XXXXXX" & drp_lock_cnt_v);
      dr_sram(25) <= ('X' & drp_lock_fb_dly_v & drp_unlock_cnt_v);
      dr_sram(26) <= ('X' & drp_lock_ref_dly_v & drp_lock_sat_high_v);
      dr_sram(78) <= (pll_cp_v(3) & "XX" & pll_cp_v(2) & pll_cp_v(1) & "XX" & pll_cp_v(0) & "0XX00XXX");
      dr_sram(79) <= (pll_res_v(3) & "XX" & pll_res_v(2) & pll_res_v(1) & "XX" & pll_res_v(0) & pll_lfhf(1) & "XX" & pll_lfhf(0) & "XXXX");

      first_time := false;

    end if;

    if (GSR_dly = '1') then
       drp_lock <= '0';
       drp_lock_lat_cnt <= 0;
       DRDY_out <= '0';
    elsif (rising_edge(dclk_in)) then 
    if (den_in = '1') then
       valid_daddr := ADDR_IS_VALID(daddr_in);
       if (valid_daddr) then
         address := slv_to_int(daddr_in);
         daddr_in_lat <= address;
       end if;

       if (drp_lock = '0') then
          drp_lock <= '1';
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
       end if;


       if (dwe_in = '1')  then
          if (rst_input = '1') then
--             if (valid_daddr and (((address >= 8) and (address <= 11)) or ((address >= 20) and (address <= 22)) or ((address >= 24) and (address <= 26)) or address = 78 or address = 79 or address = 92)) then
             if (valid_daddr) then
               dr_sram(address) <= di_in;
               di_str := SLV_TO_STR(di_in);
             else 
               Write ( Message, string'(" Warning :  [Unisim PLLE4_ADV-121] Address DADDR="));
--               Write ( Message,  address);
               Write ( Message,  string'(slv_to_str(daddr_in)));
               Write ( Message, string'(" on the PLLE4_ADV instance is unsupported") );
               Write ( Message, '.' & LF );
               assert false report Message.all severity warning;
               DEALLOCATE (Message);
             end if;

             if (daddr_in = "0001001") then -- 9
                 daddr_str := "0001001";
                 clkout_delay_para_drp (clkout_dly, clk_nocnt, clk_edge, di_in, daddr_in, di_str, daddr_str);
       clkout0_dly <= SLV_TO_INT(clkout_dly);
                 clk0_nocnt <= clk_nocnt;
                 clk0_nocnti := clk_nocnt;
                 clk0_edgei := clk_edge;
                 clk0_edge <= clk_edge;
             end if;

             if (daddr_in = "0001000") then -- 8
                daddr_str := "0001000";
                 clkout_hl_para_drp (clk_lt, clk_ht, di_in, daddr_in, di_str, daddr_str);
                 clk0_lt <= clk_lt;
                 clk0_ht <= clk_ht;
                 clk0_lti := clk_lt;
                 clk0_hti := clk_ht;
             end if;

             if (daddr_in = "0001011") then -- 11
                 daddr_str := "0001011";
                 clkout_delay_para_drp (clkout_dly, clk_nocnt, clk_edge, di_in, daddr_in, di_str, daddr_str);
       clkout1_dly <= SLV_TO_INT(clkout_dly);
                 clk1_nocnt <= clk_nocnt;
                 clk1_nocnti := clk_nocnt;
                 clk1_edgei := clk_edge;
                 clk1_edge <= clk_edge;
             end if;


             if (daddr_in = "0001010") then -- 10
                 daddr_str := "0001010";
                 clkout_hl_para_drp (clk_lt, clk_ht, di_in, daddr_in, di_str, daddr_str);
                 clk1_lt <= clk_lt;
                 clk1_ht <= clk_ht;
                 clk1_lti := clk_lt;
                 clk1_hti := clk_ht;
             end if;

             if (daddr_in = "0010101") then -- 21
                 daddr_str := "0010101";
                 clkout_delay_para_drp (clkout_dly, clk_nocnt, clk_edge, di_in, daddr_in, di_str, daddr_str);
       clkfbm1_dly <=  SLV_TO_INT(clkout_dly);
                 clkfbm1_nocnt <= clk_nocnt;
                 clkfbm1_nocnti := clk_nocnt;
                 clkfbm1_edge <= clk_edge;
                 clkfbm1_edgei := clk_edge;
             end if;

             if (daddr_in = "0010100") then -- 20
                 daddr_str := "0010100";
                 clkout_hl_para_drp (clk_lt, clk_ht, di_in, daddr_in, di_str, daddr_str);
                 clkfbm1_lt <= clk_lt;
                 clkfbm1_lti := clk_lt;
                 clkfbm1_ht <= clk_ht;
                 clkfbm1_hti := clk_ht;
                 clkfbm1_divi := SLV_TO_INT(clk_lt) + SLV_TO_INT(clk_ht);
                if ((clkfbm1_divi) > M_MAX or (clkfbm1_divi) < M_MIN ) then
               Write ( Message, string'("Error : [Unisim PLLE4_ADV-122] The sum of DI[11:6] and DI[5:0] ("));
               Write ( Message, clkfbm1_divi);
               Write ( Message, string'(") at Address DADDR = "));
               Write ( Message, address);
               Write ( Message, string'(" is CLKFBOUT clock divider of PLLE4_ADV and over the "));
               Write ( Message, M_MIN);
               Write ( Message, string'(" to "));
               Write ( Message, M_MAX);
               Write ( Message, string'(" range"));
               Write ( Message, '.' & LF );
               assert false report Message.all severity warning;
               DEALLOCATE (Message);
                end if;
             end if;

             if (daddr_in = "0010110") then -- 22
                 clkind_lti := ('0' & di_in(11 downto 6));
                 clkind_hti := ('0' & di_in(5 downto 0));
                 clkind_lt <= clkind_lti;
                 clkind_ht <= clkind_hti;
                 clkind_nocnti := di_in(12);
                 clkind_edgei := di_in(13);
              end if;

              clkout_pm_cal(clk_ht1, clk_div, clk_div1, clk0_hti, clk0_lti, clk0_nocnti, clk0_edgei);
              clk0_ht1 <= clk_ht1;
              clk0_div <= clk_div;
              clk0_div1 <= clk_div1;
              clkout_pm_cal(clk_ht1, clk_div, clk_div1, clk1_hti, clk1_lti, clk1_nocnti, clk1_edgei);
              clk1_ht1 <= clk_ht1;
              clk1_div <= clk_div;
              clk1_div1 <= clk_div1;
              clkout_pm_cal(clk_ht1, clk_div, clk_div1, clkfbm1_hti, clkfbm1_lti, clkfbm1_nocnti, clkfbm1_edgei);
              clkfbm1_ht1 <= clk_ht1;
              clkfbm1_div <= clk_div;
              clkfbm1_div1 <= clk_div1;
              clkout_pm_cal(clk_ht1, clk_div, clk_div1, clkind_hti, clkind_lti, clkind_nocnti, '0');
              clkind_ht1 <= clk_ht1;
              clkind_div <= clk_div;
              clkind_div1 <= clk_div1;
              if (clk_div > D_MAX or (clk_div < D_MIN and clkind_nocnti = '0')) then
               Write ( Message, string'("Error : [Unisim PLLE4_ADV-123] The sum of DI[11:6] and DI[5:0] ("));
               Write ( Message, clkfbm1_divi);
               Write ( Message, string'(") at Address DADDR = "));
               Write ( Message, address);
               Write ( Message, string'(" is input clock divider of PLLE4_ADV and over the "));
               Write ( Message, D_MIN);
               Write ( Message, string'(" to "));
               Write ( Message, D_MAX);
               Write ( Message, string'(" range"));
               Write ( Message, '.' & LF );
               assert false report Message.all severity warning;
               DEALLOCATE (Message);
              end if;

          else 
              assert false report " Error : [Unisim PLLE4_ADV-124] RST is low at PLLE4_ADV. RST need to be high when change PLLE4_ADV paramters through DRP. " severity error;
          end if; -- end rst

        end if; --DWE
      end if;  --DEN

      if (drp_lock = '1') then
         if (drp_lock_lat_cnt < drp_lock_lat) then
           drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
         else
           drp_lock <= '0';
           DRDY_out <= '1';
           drp_lock_lat_cnt <= 0;
         end if;
      end if;
      if (DRDY_out = '1') then DRDY_out <= '0';
      end if;
    end if; -- end GSR_dly

    wait on dclk_in, GSR_dly, init_done;
    end process;


    CLOCK_PERIOD_P : process (clkpll_r, rst_in)
      variable  clkin_edge_previous : time := 0 ps;
      variable  clkin_edge_current : time := 0 ps;
    begin
      if (rst_in = '1') then
        clkinp_period(0) <= period_vco_target;
        clkinp_period(1) <= period_vco_target;
        clkinp_period(2) <= period_vco_target;
        clkinp_period(3) <= period_vco_target;
        clkinp_period(4) <= period_vco_target;
        clkin_jit <= 0 ps;
        clkin_lock_cnt <= 0;
        pll_locked_tm <= '0';
        pll_locked_tmp1 <= '0';
        lock_period <= '0';
        clkout_en0_tmp <= '0';
        unlock_recover <= '0';
        clkin_edge_previous := 0 ps;
      elsif (rising_edge(clkpll_r)) then
        clkin_edge_current := NOW;
        if (clkin_edge_previous /= 0 ps and  clkinstopped_out = '0') then
          clkinp_period(4) <= clkinp_period(3);
          clkinp_period(3) <= clkinp_period(2);
          clkinp_period(2) <= clkinp_period(1);
          clkinp_period(1) <= clkinp_period(0);
          clkinp_period(0) <= clkin_edge_current - clkin_edge_previous;
        end if;

        if (pll_unlock = '0' and clkin_edge_previous /= 0 ps and  clkinstopped_out = '0') then
          clkin_jit <=  clkin_edge_current - clkin_edge_previous - clkinp_period(0);
        else
          clkin_jit <= 0 ps;
        end if;

        clkin_edge_previous := clkin_edge_current;

        if ( pll_unlock1 = '0' and  (clkin_lock_cnt < lock_cnt_max) and fb_delay_found = '1' ) then
            clkin_lock_cnt <= clkin_lock_cnt + 1;
        elsif (pll_unlock1 = '1' and pll_locked_tmp1 = '1' ) then
            clkin_lock_cnt <= lock_cnt_max - 6;
            unlock_recover <= '1';
        end if;

        if ( clkin_lock_cnt >= PLL_LOCK_TIME and pll_unlock1 = '0') then
            pll_locked_tm <= '1';
        end if;

        if ( clkin_lock_cnt = lock_period_time ) then
            lock_period <= '1';
        end if;

        if (clkin_lock_cnt >= clkout_en_time and pll_locked_tm = '1') then
            clkout_en0_tmp <= '1';
        end if;
 
        if (clkin_lock_cnt >= locked_en_time and clkout_en = '1') then
            pll_locked_tmp1 <= '1';
        end if;

        if (unlock_recover = '1' and clkin_lock_cnt  >= lock_cnt_max) then
            unlock_recover <= '0';
        end if;

      end if;
    end process;
    
  pchk_p : process(pll_locked_tmp1)
    variable pchk_tmp1 : time;
    variable pchk_tmp2 : time;
  begin
  if (rising_edge(pll_locked_tmp1)) then
       pchk_tmp1 := CLKIN_PERIOD * 1100 ps;
       pchk_tmp2 := CLKIN_PERIOD * 900 ps;
       if (period_avg > pchk_tmp1 or  period_avg < pchk_tmp2) then
         assert false report "Warning : [Unisim PLLE4_ADV-125] input CLKIN period and attribute CLKIN_PERIOD are not same." severity error ;
       end if;    
  end if;
  end process;

    clkout_en_val <= m_product1;
    clkout_en0_tmp1 <=   clkout_en0_tmp after 1 ps;

    CLKOUT_EN0_P : process (clkout_en0_tmp1, clkout_en_t, clkout_en0_tmp)
    begin
      if (clkout_en0_tmp = '0') then
        clkout_en0 <= '0';
      else
       if (clkout_en_t = clkout_en_val and clkout_en0_tmp1 = '1') then
             clkout_en0 <=  transport clkout_en0_tmp1 after (period_vco - 1 ps);
       end if;
      end if;
     end process;
 
    clkout_en1 <=  transport clkout_en0 after clkvco_delay;

    clkout_en_p : process (clkout_en1, rst_in)
    begin
      if (rst_in = '1') then
        clkout_en <= '0';
      else
          clkout_en <= clkout_en1;
      end if;
    end process;

    PLL_LOCK_P1 : process (pll_locked_tmp1, rst_in)
    begin
      if (rst_in = '1') then
         pll_locked_tmp2 <= '0';
      elsif (pll_locked_tmp1 = '0') then
         pll_locked_tmp2 <=  pll_locked_tmp1;
      else 
         pll_locked_tmp2 <= transport pll_locked_tmp1 after pll_locked_delay;
      end if;
    end process;

    locked_out <= '1' when pll_locked_tm = '1' and pll_locked_tmp2_dly ='1' and pll_unlock = '0' and unlock_recover = '0' else '0';


    locked_out_tmp_p : process
    begin
      if (rst_in = '1') then
           wait for 1 ns;   -- lock delay simprim only 
           locked_out_tmp <= '0';
      else
         locked_out_tmp <= locked_out;
      end if;
      wait on rst_in, locked_out;
    end process;

 
    CLOCK_PERIOD_AVG_P : process (clkinp_period(0), clkinp_period(1), clkinp_period(2),
                                 clkinp_period(3), clkinp_period(4), period_avg)
      variable period_avg_tmp : integer := 0;
      variable clkin_period_tmp0 : time := 0 ps;
      variable clkin_period_tmp1 : time := 0 ps;
      variable clkin_period_tmp_t : time := 0 ps;
    begin
      clkin_period_tmp0 := clkinp_period(0);
      clkin_period_tmp1 := clkinp_period(1);
      if (clkin_period_tmp0 > clkin_period_tmp1) then
          clkin_period_tmp_t := clkin_period_tmp0 - clkin_period_tmp1;
      else
          clkin_period_tmp_t := clkin_period_tmp1 - clkin_period_tmp0;
      end if;

      if (clkin_period_tmp0 /= period_avg and (clkin_period_tmp0 < 1.5 * period_avg or clkin_period_tmp_t <= 300 ps)) then
         period_avg_tmp := (clkinp_period(0) + clkinp_period(1) + clkinp_period(2)
                       + clkinp_period(3) + clkinp_period(4))/5 ps;
         period_avg <= period_avg_tmp * 1 ps;

      end if;
    end process;

    clk_period_lost_p : process (period_avg,  lock_period, clkind_div)
    begin
     if (period_avg > 500 ps and lock_period = '1') then
       clkin_lost_val <= ((period_avg * 1.5) / 500 ps) - 1;
       clkfb_lost_val <= ((clkind_div * period_avg * 1.5) / 500 ps) - 1;
     end if;
    end process;


    clkfbm1_div_t_p : process (clkfbm1_f_div, clkfbm1_div, rst_in)
      variable clkfbm1_div_t_tmp : real;
    begin
         if rst_in = '1' then
         clkfbm1_div_t_tmp := 0.0;
    else
         clkfbm1_div_t_tmp := real(clkfbm1_div);
         clkfbm1_div_t <= clkfbm1_div_t_tmp;
    end if;
    end process;

    CLOCK_PERIOD_UPDATE_P : process (period_avg, period_avg_stp, clkind_div, clkfbm1_div_t, init_done)
      variable period_fb_tmp : time;
      variable period_vco_tmp : time;
      variable period_vco_tmp1 : time;
      variable period_vco_tmp1_i : integer;
      variable period_vco_tmp1_rl : real;
      variable tmpreal : real;
      variable tmpreal1: real;
      variable period_vco_rm_tmp : integer;
      variable period_vco_rm_tmp1 : integer;
      variable clkind_div_rl : real;
      variable clkfbm1_div_t_int : integer;
      variable period_fb_tmpint  : integer;
      variable period_fb_tmpreal : real;
      variable period_vco_tmpint : integer;
      variable period_vco_tmpint1 : integer;
      variable clk0_frac_ht_tmp : integer;
      variable clk0_frac_lt_tmp : integer;
      variable clkfb_frac_ht_tmp : integer;
      variable clkfb_frac_lt_tmp : integer;
      variable period_vco_tmp0 : real;
      variable period_vco_tmp02 : real;
      variable period_vco_tmp03 : real;
      variable period_vco_half_rm_t : time;
      
    begin
      if (init_done = '1') then
       clkind_div_rl := real(clkind_div);
       clkfbm1_div_t_int := real2int(clkfbm1_div_t);
       md_product <= real2int(clkfbm1_div_t * clkind_div_rl);
       m_product <= clkfbm1_div_t_int;
       m_product1 <= clkfbm1_div_t_int - 1;
       m_product2 <= real2int(clkfbm1_div_t / 2.0);
       period_fb_tmp :=  clkind_div * period_avg;
       if (period_fb_tmp > 0 ps ) then
          period_fb_tmpint := period_fb_tmp / 1 ps;
       else
          period_fb_tmpint := 0;
       end if;
       period_vco_mf <= (period_avg / 1 ps ) * 8;
       period_fb_tmpreal := real(period_fb_tmpint);
       period_vco_tmp0 := (period_fb_tmpreal / clkfbm1_div_t);
       period_vco_tmpint1 := real2int(period_vco_tmp0);
       period_vco_tmp02 := real(period_vco_tmpint1);
       period_vco_tmp03 := period_vco_tmp0 - period_vco_tmp02;
       if (period_vco_tmp03 > 0.500) then
          period_vco_tmp1 := (1 + period_vco_tmpint1) * 1 ps;
       else
          period_vco_tmp1 := period_vco_tmpint1 * 1 ps;
       end if;
       period_vco_tmp1_i := period_vco_tmp1 / 1 ps; 
       period_vco_tmp1_rl := real(period_vco_tmp1_i);
       clkvco_pdrm <= period_vco_tmp0 - period_vco_tmp1_rl;
       period_vco_tmp := period_vco_tmp1;
       if (period_vco_tmp > 0 ps) then
         period_vco_tmpint := period_vco_tmp / 1 ps; 
       else
         period_vco_tmpint := 0;
       end if;
       period_vco_rm_tmp := period_fb_tmpint mod clkfbm1_div_t_int;
       period_vco_rm <= period_vco_rm_tmp;
       if (period_vco_rm_tmp > 1) then
         if (period_vco_rm_tmp > m_product2 and period_vco_rm_tmp < m_product)  then
           period_vco_cmp_cnt <= (m_product / (m_product - period_vco_rm_tmp)) - 1;
           period_vco_cmp_flag <= 2;
         else 
           period_vco_cmp_cnt <= (m_product / period_vco_rm_tmp) - 1;
           period_vco_cmp_flag <= 1;
         end if;
       else 
         period_vco_cmp_cnt <= 0;
         period_vco_cmp_flag <= 0;
       end if;

       period_vco_half <= period_vco_tmp /2;
       if (period_vco_tmp > 0 ps) then
         period_vco_half1 <= ((period_vco_tmp /2) / 1 ps + 1) * 1 ps;
       else
         period_vco_half1 <= 0 ps;
       end if;
       period_vco_half_rm_t := period_vco_tmp - (period_vco_tmp /2);
       period_vco_half_rm <= period_vco_half_rm_t;
       period_vco_half_rm1 <= period_vco_half_rm_t + 1 ps;
       period_vco_half_rm2 <= period_vco_half_rm_t - 1 ps;
       pll_locked_delay <= period_fb_tmp * clkfbm1_div_t;
       clkin_dly_t <=  period_avg * clkind_div + period_avg * 1.25;
       period_fb <= period_fb_tmp;
       period_vco <= period_vco_tmp;
       period_vco_en <= period_vco_tmp * 2.0  - period_vco_tmp / 4.0;
     end if;
    end process;

    clkpll_tmp1 <=  transport clkpll_r after period_avg;
    clkpll <=  transport clkpll_tmp1 after period_avg;

    clkinstopped_vco_f_p : process
    begin
      if (rst_in = '1') then
         clkinstopped_vco_f <= '0';
      elsif (rising_edge(clkinstopped_out)) then
        clkinstopped_vco_f <= '1';
        wait until (falling_edge(clkinstopped_out) or rising_edge(rst_in));
        if (rst_in = '1') then
          clkinstopped_vco_f <= '0';
        else
           wait until (rising_edge(clkpll) );
           wait until (rising_edge(clkpll) );
           clkinstopped_vco_f <= '0';
        end if;
      end if;
      wait on clkinstopped_out, rst_in;
    end process;

    clkvco_lk_p : process
    begin
      if (rst_in = '1') then
        clkvco_lk <= '0';
      else
        if (clkinstopped_out = '1') then
          if (period_vco_half > 0 ps) then
            clkvco_lk <= transport not clkvco_lk after period_vco_half;
          end if;
        elsif (clkinstopped_vco_f = '0') then
           clkvco_lk <= clkvco_lk_tmp;
        else
          if (period_vco_half > 0 ps) then
            clkvco_lk <= transport not clkvco_lk after period_vco_half;
          end if;
        end if;
      end if;
      wait on clkinstopped_vco_f, clkvco_lk, clkvco_lk_tmp, rst_in, clkinstopped_out;
    end process;

-- xiphy clocks
--
--generate clkvco_2x
--    

  GEN_CLKVCO_2X : process
  begin
    if (xiphyen_sync = '0' or rst_in = '1') then
      clkvco_2x <= '0';
    else  
      if (rising_edge(clkvco) or falling_edge(clkvco)) then
        clkvco_2x <= '1';
        wait for (period_vco / 4);
        clkvco_2x <= '0';
      end if;
    end if;
    wait on clkvco, rst_in, xiphyen_sync;
  end process GEN_CLKVCO_2X;

--
--generate clkvco_by2
--    

  GEN_CLKVCO_BY2 : process
  begin
    if (xiphyen_sync = '0' or rst_in = '1') then
      clkvco_by2 <= '0';
    else  
      if (rising_edge(clkvco)) then
        clkvco_by2 <= not clkvco_by2;
      end if;
    end if;
    wait on clkvco, rst_in, xiphyen_sync;
  end process GEN_CLKVCO_BY2;

  GEN_CLKVCO_BY8 : process
  begin
    if (rst_in = '1') then
      clkvco_by8 <= '0';
      clkvco_cnt <= "00";
    else  
      if (rising_edge(clkvco)) then
        if (clkvco_cnt = "00" ) then
           clkvco_by8 <= not clkvco_by8;
        end if;
        clkvco_cnt <= clkvco_cnt + "01";
      end if;
    end if;
    wait on clkvco, rst_in;
  end process GEN_CLKVCO_BY8;

-- count 2 falling edges of vco_by8
  GEN_XEN1_SYNC : process
  begin
    if (rst_in = '1') then
      xiphyen_sync2  <= '0';
      xiphyen_sync1  <= '0';
    elsif (falling_edge(clkvco_by8)) then
      xiphyen_sync2  <= xiphyen_in;
      xiphyen_sync1  <= xiphyen_sync2;
    end if;
    wait on clkvco_by8, rst_in;
  end process GEN_XEN1_SYNC;

-- enable xiphyen last falling edge before first rising edge of vco
  GEN_XEN_SYNC : process
  begin
    if (rst_in = '1') then
      xiphyen_sync  <= '0';
    elsif (falling_edge(clkvco)) then
      if (clkvco_cnt = "00" ) then
         xiphyen_sync <= xiphyen_sync1;
      end if;
    end if;
    wait on clkvco, rst_in;
  end process GEN_XEN_SYNC;

  CLKVCO_LK_TMP_P : process
       variable clkvco_rm_cnt : integer;
       variable cmpvco1 : real := 0.0;
       variable cmpvco : real := 0.0;
       variable vcoflag : integer := 0;
    begin
      if (rising_edge(clkpll)) then
           if (pll_locked_tm = '1') then
              clkvco_lk_tmp <= '1';
              clkvco_rm_cnt := 0;
              clkout_en_t <= 0;
              if ( period_vco_cmp_flag = 1) then
            vcoflag := 1;
                for I in 2 to m_product loop
                  clkout_en_t <= I-1;
                  wait for (period_vco_half);
                  clkvco_lk_tmp <=  '0';  
                  if ( clkvco_rm_cnt = 1) then
--                    wait for (period_vco_half1);
                    wait for (period_vco_half_rm1);
                    clkvco_lk_tmp <=  '1';  
                  else
                    wait for (period_vco_half_rm);
                    clkvco_lk_tmp <=  '1';  
                  end if;

                  if ( clkvco_rm_cnt = period_vco_cmp_cnt) then
                    clkvco_rm_cnt := 0;
                  else
                    clkvco_rm_cnt := clkvco_rm_cnt + 1;
                  end if;
                end loop;
              elsif ( period_vco_cmp_flag = 2) then
            vcoflag := 1;
                for I in 2 to m_product loop
                  clkout_en_t <= I-1;
                  wait for (period_vco_half);
                  clkvco_lk_tmp <=  '0';
                  if ( clkvco_rm_cnt = 1) then
                    wait for (period_vco_half_rm);
                    clkvco_lk_tmp <=  '1';
                  else
--                    wait for (period_vco_half1);
                    wait for (period_vco_half_rm1);
                    clkvco_lk_tmp <=  '1';
                  end if;

                  if ( clkvco_rm_cnt = period_vco_cmp_cnt) then
                    clkvco_rm_cnt := 0;
                  else
                    clkvco_rm_cnt := clkvco_rm_cnt + 1;
                  end if;
                end loop;
              else
            vcoflag := 1;
--                for I in 2 to md_product loop
                for I in 2 to m_product loop
                  clkout_en_t <= I-1;
                  wait for (period_vco_half);
                  clkvco_lk_tmp <=  '0';
                  wait for (period_vco_half_rm);
                  clkvco_lk_tmp <=  '1';
                end loop;
              end if;
              wait for (period_vco_half);
              clkvco_lk_tmp <= '0';
--              if (clkpll = '1' ) then
              if (clkpll = '1' and m_product > 1 and vcoflag = 0) then
--                 for I in 2 to md_product loop
                 for I in 2 to m_product loop
--                  clkout_en_t <= I-1;
                  wait for (period_vco_half);
                  clkvco_lk_tmp <=  '0';
                  wait for (period_vco_half_rm);
                  clkvco_lk_tmp <=  '1';
                  end loop;
                  wait for (period_vco_half);
                  clkvco_lk_tmp <= '0';
               end if;
          end if;
        end if;
        wait on clkpll;
    end process;

    CLKVCO_DLY_CAL_P : process ( period_vco, fb_delay,
                                lock_period, period_vco_mf)
        variable val_tmp : integer;
        variable val_tmp2 : integer;
        variable val_tmp3 : integer;
        variable fbm1_comp_delay : integer;
        variable fbm1_comp_delay_rl : real;
        variable period_vco_i : integer;
        variable period_vco_rl : real;
        variable dly_tmp : integer;
        variable dly_tmp1 : integer;
        variable tmp_ps_val1 : integer;
        variable tmp_ps_val2 : integer;
        variable dly_tmp_int : integer;
      begin
      if (lock_period = '1') then
        if ( period_vco /= 0 ps) then
          period_vco_i := period_vco * 1 / 1 ps;
          period_vco_rl := real(period_vco_i);
          val_tmp := (period_avg * 1 / 1 ps) * DIVCLK_DIVIDE;
          fbm1_comp_delay_rl := period_vco_rl;
          fbm1_comp_delay := real2int(fbm1_comp_delay_rl);
          val_tmp2 := fb_delay * 1 / 1 ps;
          dly_tmp1 := val_tmp2 + fbm1_comp_delay;
          dly_tmp_int := 1;
          dly_tmp := dly_tmp1;
     
          dly_tmp_o <= dly_tmp * 1 ps;

          if (dly_tmp_int < 0) then
            clkvco_delay <= dly_tmp * 1 ps;
          else 
            if ( dly_tmp < val_tmp) then
               clkvco_delay <= (val_tmp - dly_tmp) * 1 ps;
            else
               clkvco_delay <=  (val_tmp - dly_tmp mod val_tmp) * 1 ps;
            end if;
           end if;
        end if;
      end if;
    end process;

    clkvco_lk_dly_tmp <= transport clkvco_lk after clkvco_delay;
    clkvco <= '0' when (pll_locked_tm = '0')  else clkvco_lk when dly_tmp_o = 0 ps else clkvco_lk_dly_tmp;
  
    CLK0_DLY_CNT_P : process(clkvco, rst_in)
    begin
      if ((rst_in = '1') or (clkout_en = '0')) then
          clk0_dly_cnt <= 0;
      else
        if (falling_edge(clkvco)) then
          if (clk0_dly_cnt < clkout0_dly and clkout_en = '1') then
              clk0_dly_cnt <= clk0_dly_cnt + 1;
          end if;
        end if;
      end if;
    end process;

    CLK1_DLY_CNT_P : process(clkvco, rst_in)
    begin
      if ((rst_in = '1') or (clkout_en = '0')) then
          clk1_dly_cnt <= 0;
      else
        if (falling_edge(clkvco)) then
          if ((clk1_dly_cnt < clkout1_dly) and clkout_en = '1') then
            clk1_dly_cnt <= clk1_dly_cnt + 1;
          end if;
        end if;
      end if;
    end process;
    
    CLKFB_DLY_CNT_P : process(clkvco, rst_in) begin
      if ((rst_in = '1') or (clkout_en = '0')) then
         clkfbm1_dly_cnt <= 0;
      else
        if (falling_edge(clkvco)) then
          if (clkfbm1_dly_cnt < clkfbm1_dly and clkout_en = '1') then
            clkfbm1_dly_cnt <= clkfbm1_dly_cnt + 1;
          end if;
        end if;
       end if;
    end process;

   CLK0_GEN_P : process (clkvco, rst_in) begin
     if ((rst_in = '1') or (clkout_en = '0')) then
       clk0_cnt <= 0;
       clk0_out <= '0';
     else
       if (rising_edge(clkvco) or falling_edge(clkvco)) then
         if ((clkout_en = '1') and (clk0_dly_cnt = clkout0_dly)) then
           if (clk0_cnt < clk0_div1) then
             clk0_cnt <= clk0_cnt + 1;
           else
             clk0_cnt <= 0;
           end if;
           if  (clk0_cnt < clk0_ht1) then
             clk0_out <= '1';
           else
             clk0_out <= '0';
           end if;
         else
           clk0_out <= '0';
           clk0_cnt <= 0;
         end if;
       end if;     
     end if;
   end process;

   CLK1_GEN_P : process (clkvco, rst_in) begin
     if ((rst_in = '1') or (clkout_en = '0')) then
       clk1_cnt <= 0;
       clk1_out <= '0';
     else
       if (rising_edge(clkvco) or falling_edge(clkvco)) then
         if ((clkout_en = '1') and (clk1_dly_cnt = clkout1_dly)) then
           if (clk1_cnt < clk1_div1) then
             clk1_cnt <= clk1_cnt + 1;
           else
             clk1_cnt <= 0;
           end if;

           if  (clk1_cnt < clk1_ht1) then
             clk1_out <= '1';
           else
             clk1_out <= '0';
           end if;
         else
           clk1_out <= '0';
           clk1_cnt <= 0;
         end if;
       end if;
     end if;
   end process;

   CLKIND_GEN_P : process (clkpll_r, rst_in)
   begin
     if (rst_in = '1') then
         clkind_cnt <= 0;
         clkind_out <= '0';
     else
        if (rising_edge(clkpll_r)  or falling_edge(clkpll_r)) then
            if (clkout_en = '1') then
              if (clkind_cnt < clkind_div1) then
                      clkind_cnt <= clkind_cnt + 1;
               else
                      clkind_cnt <= 0;
               end if;

               if  (clkind_cnt < clkind_ht1) then
                     clkind_out <= '1';
               else
                     clkind_out <= '0';
               end if;
          else
             clkind_out <= '0';
             clkind_cnt <= 0;
          end if;
        end if;
      end if;
    end process;

   CLKFB_GEN_P : process (clkvco, rst_in) begin
     if ((rst_in = '1') or (clkout_en = '0')) then
         clkfbm1_cnt <= 0;
         clkfbm1_out <= '0';
     else
       if (rising_edge(clkvco) or falling_edge(clkvco)) then
         if ((clkout_en = '1') and (clkfbm1_dly_cnt = clkfbm1_dly)) then
           if (clkfbm1_cnt < clkfbm1_div1) then
             clkfbm1_cnt <= clkfbm1_cnt + 1;
           else
             clkfbm1_cnt <= 0;
           end if;
           if  (clkfbm1_cnt < clkfbm1_ht1) then
             clkfbm1_out <= '1';
           else
             clkfbm1_out <= '0';
           end if;
         else
           clkfbm1_out <= '0';
           clkfbm1_cnt <= 0;
         end if;
     end if;  
    end if;   
    end process;           
    
    clkout0_out <= transport clk0_out  when fb_delay_found = '1' else clkfb_tst when rst_in = '0' else '0';
    clkout1_out <= transport clk1_out  when fb_delay_found = '1' else clkfb_tst when rst_in = '0' else '0';
    clkfb_out <= transport clkfbm1_out when fb_delay_found = '1' else clkfb_tst when rst_in = '0' else '0';

  --
  -- determine feedback delay
  --
    pwron_int_p : process
    begin
      pwron_int <= '1';
      wait for 100 ns;
      pwron_int <= '0';
      wait;
    end process;


    CLKFB_TST_P : process (clkpll_r, rst_in)
    begin
      if ((rst_in = '1') or (pwron_int = '1') or (fb_delay_found = '1')) then
         clkfb_tst <= '0';
      elsif (rising_edge(clkpll_r)) then
         clkfb_tst <= not clkfb_tst;
      end if;
    end process;

   FB_DELAY_CAL_P0 : process (clkfb_tst, rst_in)
    begin
      if (rst_in = '1')  then
         delay_edge <= 0 ps;
      elsif (rising_edge(clkfb_tst)) then
        delay_edge <= NOW;
      end if;
    end process;

    FB_DELAY_CAL_P : process (clkfb_in, rst_in)
      variable delay_edge1 : time := 0 ps;
      variable fb_delay_tmp : time := 0 ps;
      variable Message : line;
    begin
      if (rst_in = '1')  then
        fb_delay  <= 0 ps;
        fb_delay_found_tmp <= '0';
        delay_edge1 := 0 ps;
        fb_delay_tmp := 0 ps;
      elsif (rising_edge(clkfb_in)) then
        if (fb_delay_found_tmp = '0') then
          if (delay_edge /= 0 ps) then
            delay_edge1 := NOW;
            fb_delay_tmp := delay_edge1 - delay_edge;
          else
            fb_delay_tmp := 0 ps;
          end if;
          fb_delay <= fb_delay_tmp;
          fb_delay_found_tmp <= '1';
          if (rst_in = '0' and fb_delay_tmp > fb_delay_max) then
            Write ( Message, string'(" Warning : [Unisim PLLE4_ADV-126] The feedback delay is "));
            Write ( Message, fb_delay_tmp);
            Write ( Message, string'(". It is over the maximun value "));
            Write ( Message, fb_delay_max);
            Write ( Message, '.' & LF );
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
          end if;
        end if;
      end if;
    end process;

--    fb_delay_found_P : process(fb_delay_found_tmp, clkvco_delay, rst_in)
--    begin
--      if (rst_in = '1') then
--        fb_delay_found <= '0';
--      elsif (clkvco_delay = 0 ps) then
--        fb_delay_found <= fb_delay_found_tmp after 1 ns;
--      else
--        fb_delay_found <= fb_delay_found_tmp after clkvco_delay;
--      end if;
--    end process;

    fb_delay_found_P : process(clkfb_tst)
    begin
      if (falling_edge(clkfb_tst)) then
        fb_delay_found <= fb_delay_found_tmp;
      end if;
    end process;

  --
  -- generate unlock signal
  --

  clk_osc_p : process(clk_osc, rst_in)
  begin
    if (rst_in = '1') then
      clk_osc <= '0';
    else
      clk_osc <= not clk_osc after OSC_P2;
    end if;
  end process;

  clkin_p_p : process
  begin
    if (rising_edge(clkpll_r) or falling_edge(clkpll_r)) then
      clkin_p <= '1';
      wait for 100 ps;
      clkin_p <= '0';
    end if;
    wait on clkpll_r;
  end process;

  clkfb_p_p : process
  begin
    if (rising_edge(clkfb_in) or falling_edge(clkfb_in)) then
      clkfb_p <= '1';
      wait for 100 ps;
      clkfb_p <= '0';
    end if;
    wait on clkfb_in;
  end process;
     
  clkin_lost_out_p : process
  begin
    if (rising_edge(clkinstopped_out) and rst_in = '0') then
       assert FALSE report " Warning : [Unisim PLLE4_ADV-127] input CLKIN of PLLE4_ADV  is stopped. Reset is required for PLLE4_ADV when input clock returns." severity warning;
    end if;
    wait on clkinstopped_out, locked_out, rst_in;
  end process;

  clkin_stopped_p : process
  begin
     if (rst_in = '1') then
       clkinstopped_out <= '0';
       clkin_lost_cnt <= 0;
     elsif (clkin_p = '1') then
      if (clkinstopped_out = '1') then
        wait until rising_edge(clkpll_r);
        clkinstopped_out <= '0';
        clkin_lost_cnt <= 0;
      else
        clkinstopped_out <= '0';
        clkin_lost_cnt <= 0;
      end if;
     elsif (rising_edge(clk_osc)) then
       if (lock_period = '1') then
         if (clkin_lost_cnt < clkin_lost_val)  then
           clkin_lost_cnt <= clkin_lost_cnt + 1;
           clkinstopped_out <= '0';
         else
            clkinstopped_out <= '1';
         end if;
       end if;
     end if;
     wait on clk_osc, rst_in, clkin_p;
  end process;


  clkfb_stopped_p : process(clk_osc, rst_in, clkfb_p)
  begin
     if (rst_in = '1' or clkfb_p = '1') then
       clkfbstopped_out <= '0';
       clkfb_lost_cnt <= 0;
     elsif (rising_edge(clk_osc)) then
       if (clkout_en1 = '1') then
         if (clkfb_lost_cnt < clkfb_lost_val)  then
           clkfb_lost_cnt <= clkfb_lost_cnt + 1;
           clkfbstopped_out <= '0';
         else
            clkfbstopped_out <= '1';
         end if;
       end if;
     end if;
    end process;
  
    CLK_JITTER_P : process (clkin_jit, rst_in)
    begin
      if (rst_in = '1') then
        clkpll_jitter_unlock <= '0';
      else
        if ( pll_locked_tmp2 = '1') then
          if  (ABS(clkin_jit) > ref_jitter_max_tmp) then
            clkpll_jitter_unlock <= '1';
          else
            clkpll_jitter_unlock <= '0';
          end if;
        else
            clkpll_jitter_unlock <= '0';
        end if;
      end if;
    end process;
     
    pll_unlock1_p : process
    begin
      if (rst_in = '1') then
         pll_unlock1 <= '0';
      elsif (rising_edge(pll_unlock1_tmp)) then
           pll_unlock1 <= '1';
           wait until (falling_edge(pll_unlock1_tmp));
           if (clkpll_r = '1') then
              pll_unlock1 <= '0';
           else
              wait until (rising_edge(clkpll_r));
              pll_unlock1 <= '0';
           end if;
         end if;
         wait on pll_unlock1_tmp, clkpll_r, rst_in;
    end process;
           
    pll_unlock1_tmp <= '1' when (clkinstopped_out = '1' or
                   clkfbstopped_out = '1' or clkpll_jitter_unlock = '1') else '0';
    pll_unlock <= '1' when ( pll_unlock1 = '1' or unlock_recover = '1') else '0';


end PLLE4_ADV_V;
