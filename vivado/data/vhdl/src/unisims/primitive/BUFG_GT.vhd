-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
--  All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2018.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Clock Buffer Driven by Gigabit Transceiver
-- /___/   /\      Filename    : BUFG_GT.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  03/20/13 - Initial version.
--  05/06/13 - 716311 - match with hardware
--  02/03/14 - yml update
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFG_GT -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity BUFG_GT is
    port (
      O                    : out std_ulogic;
      CE                   : in std_ulogic;
      CEMASK               : in std_ulogic;
      CLR                  : in std_ulogic;
      CLRMASK              : in std_ulogic;
      DIV                  : in std_logic_vector(2 downto 0);
      I                    : in std_ulogic      
    );
  end BUFG_GT;

  architecture BUFG_GT_V of BUFG_GT is
    
    constant MODULE_NAME : string := "BUFG_GT";
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
    
    
  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
    
  signal O_out : std_ulogic;
    
    signal CEMASK_in : std_ulogic;
    signal CE_in : std_ulogic;
    signal CLRMASK_in : std_ulogic;
    signal CLR_in : std_ulogic;
    signal DIV_in : std_logic_vector(2 downto 0);
    signal I_in : std_ulogic;

  -- begin behavioral model declarations
    signal ce_en	         : std_ulogic := '0';
    signal i_ce	                 : std_ulogic := '0';
    signal O_out_gl : std_ulogic := '0';

    signal divide   	      : boolean    := false;
    signal FIRST_TOGGLE_COUNT : integer    := -1;
    signal SECOND_TOGGLE_COUNT: integer    := -1;

    signal ce_sync1, ce_sync     :  std_ulogic := '0';
    signal clr_sync1, clr_sync   :  std_ulogic := '0';
    signal ce_masked, clr_masked :  std_ulogic;
    signal clr_out, clr_inv      : std_logic;
    signal clrmask_inv    : std_logic;



    signal clk_count_s         : integer := 0;
    signal first_half_period_s : boolean;
    signal FIRST_RISE_s        : boolean;
  -- end behavioral model declarations
    
  begin
  glblGSR <= TO_X01(GSR);
  
  O <= O_out;
  
  CEMASK_in <= '0' when (CEMASK = 'U') else CEMASK; -- rv 0
  CE_in <= '1' when (CE = 'U') else CE; -- rv 1
  CLRMASK_in <= '0' when (CLRMASK = 'U') else CLRMASK; -- rv 0
  CLR_in <= '0' when (CLR = 'U') else CLR; -- rv 0
  DIV_in(0) <= '0' when (DIV(0) = 'U') else DIV(0); -- rv 0
  DIV_in(1) <= '0' when (DIV(1) = 'U') else DIV(1); -- rv 0
  DIV_in(2) <= '0' when (DIV(2) = 'U') else DIV(2); -- rv 0
  I_in <= I;
  
-- begin behavioral model

  --####################################################################
  --#####                     Initialize                           #####
  --####################################################################

    prcs_init:process (DIV_in)
    variable FIRST_TOGGLE_COUNT_var  : integer    := -1;
    variable SECOND_TOGGLE_COUNT_var : integer    := -1;
    variable divide_var  	           : boolean    := false;

    begin
      if(DIV_in = "000") then
         divide_var    := false;
         FIRST_TOGGLE_COUNT_var  := 1;
         SECOND_TOGGLE_COUNT_var := 1;
      elsif(DIV_in = "001") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 2;
      elsif(DIV_in = "010") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(DIV_in = "011") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(DIV_in = "100") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(DIV_in = "101") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(DIV_in = "110") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 8;
      elsif(DIV_in = "111") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 8;
         SECOND_TOGGLE_COUNT_var := 8;
      end if;

      FIRST_TOGGLE_COUNT  <= FIRST_TOGGLE_COUNT_var; 
      SECOND_TOGGLE_COUNT <= SECOND_TOGGLE_COUNT_var; 

      divide    <= divide_var;

    end process prcs_init;
  
    prcs_lce : process(glblGSR, clr_masked, I_in, ce_masked)
    begin
      if(glblGSR = '1' or clr_masked = '1') then
        ce_en <= '0';
      elsif (I_in = '0') then
        ce_en <= ce_masked;
      end if; 
    end process prcs_lce;

    i_ce  <= I_in and ce_en;

    clr_inv <= not CLR_in;

    prcs_synce : process(I_in, glblGSR)
    begin
      if(glblGSR = '1') then
        ce_sync1 <= '0';
        ce_sync <= '0';
      elsif (I_in'event and I_in = '1') then
        ce_sync1 <= CE_in;
        ce_sync <= ce_sync1;
      end if;
    end process prcs_synce;  

    prcs_synclr : process(I_in, clr_inv)
    begin
      if(clr_inv = '0') then
        clr_sync1 <= '0';
        clr_sync <= '0';
      elsif (I_in'event and I_in = '1') then
        clr_sync1 <= '1';
        clr_sync <= clr_sync1;
      end if;
    end process prcs_synclr;
  
    clr_out <= not clr_sync;
    clrmask_inv <= not CLRMASK_in;
    ce_masked <= ce_sync or CEMASK_in;
    clr_masked <= clr_out and clrmask_inv;

  --####################################################################
  --#####                       CLK-I                              #####
  --####################################################################

    prcs_I:process(i_ce, glblGSR, clr_masked)
    variable clk_count      : integer := 0;
    variable toggle_count   : integer := 0;
    variable first_half_period : boolean := false;
    variable FIRST_RISE        : boolean := true;

    begin
      if(divide) then
          if((glblGSR = '1') or (clr_masked = '1')) then
            O_out_gl       <= '0';
            clk_count  := 1;
            first_half_period  := true;
            FIRST_RISE := true;
          elsif((glblGSR = '0') and (clr_masked = '0')) then
              if((i_ce='1') and (FIRST_RISE)) then
                    O_out_gl <= '1';
                    clk_count  := 1;
                    first_half_period        := true;
                    toggle_count := FIRST_TOGGLE_COUNT;
                    FIRST_RISE := false;
              elsif ((clk_count = SECOND_TOGGLE_COUNT) and ( first_half_period = false)) then
                    O_out_gl <= not O_out_gl;
                    clk_count  := 1;
                    first_half_period := true;
              elsif ((clk_count = FIRST_TOGGLE_COUNT) and ( first_half_period = true)) then
                    O_out_gl <= not O_out_gl;
                    clk_count  := 1;
                    first_half_period := false;
              elsif (FIRST_RISE = false) then
                    clk_count := clk_count + 1;
              end if;
          end if;
      else
          O_out_gl <= i_ce;
      end if;

      clk_count_s         <= clk_count;
      first_half_period_s <= first_half_period;
      FIRST_RISE_s        <= FIRST_RISE;


    end process prcs_I;

  --####################################################################
  --#####                         OUTPUT                           #####
  --####################################################################
    prcs_output:process(O_out_gl)
    begin
      O_out <= reject 1 ps inertial O_out_gl after 1 ps; 
    end process prcs_output;
  --####################################################################
-- end behavioral model
 
 end BUFG_GT_V;
