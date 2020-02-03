-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Unified Simulation Library Component
--  /   /                        48-bit Multi-Functional Arithmetic Block
-- /___/   /\      Filename    : DSP_OUTPUT.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  04/03/13 - yaml update
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
--  04/24/13 - 713706 - correct P_FDBK connection
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_OUTPUT -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_OUTPUT is
  generic (
    AUTORESET_PATDET : string := "NO_RESET";
    AUTORESET_PRIORITY : string := "RESET";
    IS_CLK_INVERTED : bit := '0';
    IS_RSTP_INVERTED : bit := '0';
    MASK : std_logic_vector(47 downto 0) := X"3FFFFFFFFFFF";
    PATTERN : std_logic_vector(47 downto 0) := X"000000000000";
    PREG : integer := 1;
    SEL_MASK : string := "MASK";
    SEL_PATTERN : string := "PATTERN";
    USE_PATTERN_DETECT : string := "NO_PATDET"
  );

  port (
    CARRYCASCOUT         : out std_ulogic;
    CARRYOUT             : out std_logic_vector(3 downto 0);
    CCOUT_FB             : out std_ulogic;
    MULTSIGNOUT          : out std_ulogic;
    OVERFLOW             : out std_ulogic;
    P                    : out std_logic_vector(47 downto 0);
    PATTERN_B_DETECT     : out std_ulogic;
    PATTERN_DETECT       : out std_ulogic;
    PCOUT                : out std_logic_vector(47 downto 0);
    P_FDBK               : out std_logic_vector(47 downto 0);
    P_FDBK_47            : out std_ulogic;
    UNDERFLOW            : out std_ulogic;
    XOROUT               : out std_logic_vector(7 downto 0);
    ALUMODE10            : in std_ulogic;
    ALU_OUT              : in std_logic_vector(47 downto 0);
    CEP                  : in std_ulogic;
    CLK                  : in std_ulogic;
    COUT                 : in std_logic_vector(3 downto 0);
    C_DATA               : in std_logic_vector(47 downto 0);
    MULTSIGN_ALU         : in std_ulogic;
    RSTP                 : in std_ulogic;
    XOR_MX               : in std_logic_vector(7 downto 0)
  );
end DSP_OUTPUT;

architecture DSP_OUTPUT_V of DSP_OUTPUT is

  constant MODULE_NAME : string := "DSP_OUTPUT";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant AUTORESET_PATDET_NO_RESET : std_logic_vector(1 downto 0) := "00";
  constant AUTORESET_PATDET_RESET_MATCH : std_logic_vector(1 downto 0) := "01";
  constant AUTORESET_PATDET_RESET_NOT_MATCH : std_logic_vector(1 downto 0) := "10";
  constant AUTORESET_PRIORITY_CEP : std_ulogic := '1';
  constant AUTORESET_PRIORITY_RESET : std_ulogic := '0';
  constant PREG_0 : std_ulogic := '1';
  constant PREG_1 : std_ulogic := '0';
  constant SEL_MASK_C : std_logic_vector(1 downto 0) := "01";
  constant SEL_MASK_MASK : std_logic_vector(1 downto 0) := "00";
  constant SEL_MASK_ROUNDING_MODE1 : std_logic_vector(1 downto 0) := "10";
  constant SEL_MASK_ROUNDING_MODE2 : std_logic_vector(1 downto 0) := "11";
  constant SEL_PATTERN_C : std_ulogic := '1';
  constant SEL_PATTERN_PATTERN : std_ulogic := '0';
  constant USE_PATTERN_DETECT_NO_PATDET : std_ulogic := '0';
  constant USE_PATTERN_DETECT_PATDET : std_ulogic := '1';

  signal AUTORESET_PATDET_BIN : std_logic_vector(1 downto 0);
  signal AUTORESET_PRIORITY_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_RSTP_INVERTED_BIN : std_ulogic;
  signal MASK_BIN : std_logic_vector(47 downto 0);
  signal PATTERN_BIN : std_logic_vector(47 downto 0);
  signal PREG_BIN : std_ulogic;
  signal SEL_MASK_BIN : std_logic_vector(1 downto 0);
  signal SEL_PATTERN_BIN : std_ulogic;
  signal USE_PATTERN_DETECT_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal CARRYCASCOUT_out : std_ulogic;
  signal CARRYOUT_out : std_logic_vector(3 downto 0);
  signal CCOUT_FB_out : std_ulogic;
  signal MULTSIGNOUT_out : std_ulogic;
  signal OVERFLOW_out : std_ulogic;
  signal PATTERN_B_DETECT_out : std_ulogic;
  signal PATTERN_DETECT_out : std_ulogic;
  signal PCOUT_out : std_logic_vector(47 downto 0);
  signal P_FDBK_47_out : std_ulogic;
  signal P_FDBK_out : std_logic_vector(47 downto 0);
  signal P_out : std_logic_vector(47 downto 0);
  signal UNDERFLOW_out : std_ulogic;
  signal XOROUT_out : std_logic_vector(7 downto 0);
 
  signal ALUMODE10_in : std_ulogic;
  signal ALU_OUT_in : std_logic_vector(47 downto 0);
  signal CEP_in : std_ulogic;
  signal COUT_in : std_logic_vector(3 downto 0);
  signal C_DATA_in : std_logic_vector(47 downto 0);
  signal MULTSIGN_ALU_in : std_ulogic;
  signal RSTP_in : std_ulogic;
  signal XOR_MX_in : std_logic_vector(7 downto 0);

  signal the_auto_reset_patdet : std_ulogic;
  signal auto_reset_pri        : std_ulogic;
  signal the_mask         : std_logic_vector(47 downto 0) := (others => '0');
  signal the_pattern      : std_logic_vector(47 downto 0) := (others => '0');
  signal opmode_valid_flag_dou : boolean := true; -- TODO

  signal COUT_reg         : std_logic_vector(3 downto 0) := "0000";
  signal ALUMODE10_reg    : std_ulogic := '0';
  signal ALUMODE10_mux    : std_ulogic := '0';
  signal MULTSIGN_ALU_reg : std_ulogic := '0';
  signal ALU_OUT_reg      : std_logic_vector(47 downto 0) := (others => '0');
  signal XOR_MX_reg       : std_logic_vector(7 downto 0) := (others => '0');

  signal pdet_o               : std_ulogic;
  signal pdetb_o              : std_ulogic;
  signal pdet_o_mux           : std_ulogic;
  signal pdetb_o_mux          : std_ulogic;
  signal overflow_data        : std_ulogic;
  signal underflow_data       : std_ulogic;
  signal pdet_o_reg1          : std_ulogic := '0';
  signal pdet_o_reg2          : std_ulogic := '0';
  signal pdetb_o_reg1         : std_ulogic := '0';
  signal pdetb_o_reg2         : std_ulogic := '0';
  signal CLK_preg             : std_ulogic;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  CARRYCASCOUT <= CARRYCASCOUT_out after OUT_DELAY;
  CARRYOUT <= CARRYOUT_out after OUT_DELAY;
  CCOUT_FB <= CCOUT_FB_out after OUT_DELAY;
  MULTSIGNOUT <= MULTSIGNOUT_out after OUT_DELAY;
  OVERFLOW <= OVERFLOW_out after OUT_DELAY;
  P <= P_out after OUT_DELAY;
  PATTERN_B_DETECT <= PATTERN_B_DETECT_out after OUT_DELAY;
  PATTERN_DETECT <= PATTERN_DETECT_out after OUT_DELAY;
  PCOUT <= PCOUT_out after OUT_DELAY;
  P_FDBK <= P_FDBK_out after OUT_DELAY;
  P_FDBK_47 <= P_FDBK_47_out after OUT_DELAY;
  UNDERFLOW <= UNDERFLOW_out after OUT_DELAY;
  XOROUT <= XOROUT_out after OUT_DELAY;
  
  ALUMODE10_in <= ALUMODE10;
  ALU_OUT_in <= ALU_OUT after 1 ps; --  break 0 delay feedback
  CEP_in <= '0' when (CEP = 'Z') else CEP; -- rv 0
  CLK_preg  <= '0' when (PREG_BIN = PREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  COUT_in <= COUT;
  C_DATA_in <= C_DATA;
  MULTSIGN_ALU_in <= MULTSIGN_ALU;
  RSTP_in <= '0' when (RSTP = 'Z') else RSTP xor IS_RSTP_INVERTED_BIN; -- rv 0
  XOR_MX_in <= XOR_MX;
  
  AUTORESET_PATDET_BIN <= 
    AUTORESET_PATDET_NO_RESET when (AUTORESET_PATDET = "NO_RESET") else
    AUTORESET_PATDET_RESET_MATCH when (AUTORESET_PATDET = "RESET_MATCH") else
    AUTORESET_PATDET_RESET_NOT_MATCH when (AUTORESET_PATDET = "RESET_NOT_MATCH") else
    AUTORESET_PATDET_NO_RESET;

  AUTORESET_PRIORITY_BIN <= 
    AUTORESET_PRIORITY_RESET when (AUTORESET_PRIORITY = "RESET") else
    AUTORESET_PRIORITY_CEP when (AUTORESET_PRIORITY = "CEP") else
    AUTORESET_PRIORITY_RESET;

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_RSTP_INVERTED_BIN <= TO_X01(IS_RSTP_INVERTED);
  MASK_BIN <= MASK;

  PATTERN_BIN <= PATTERN;

  PREG_BIN <= 
    PREG_1 when (PREG = 1) else
    PREG_0 when (PREG = 0) else
    PREG_1;

  SEL_MASK_BIN <= 
    SEL_MASK_MASK when (SEL_MASK = "MASK") else
    SEL_MASK_C when (SEL_MASK = "C") else
    SEL_MASK_ROUNDING_MODE1 when (SEL_MASK = "ROUNDING_MODE1") else
    SEL_MASK_ROUNDING_MODE2 when (SEL_MASK = "ROUNDING_MODE2") else
    SEL_MASK_MASK;

  SEL_PATTERN_BIN <= 
    SEL_PATTERN_PATTERN when (SEL_PATTERN = "PATTERN") else
    SEL_PATTERN_C when (SEL_PATTERN = "C") else
    SEL_PATTERN_PATTERN;

  USE_PATTERN_DETECT_BIN <= 
    USE_PATTERN_DETECT_NO_PATDET when (USE_PATTERN_DETECT = "NO_PATDET") else
    USE_PATTERN_DETECT_PATDET when (USE_PATTERN_DETECT = "PATDET") else
    USE_PATTERN_DETECT_NO_PATDET;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- AUTORESET_PATDET check
  if((xil_attr_test) or
     ((AUTORESET_PATDET /= "NO_RESET") and 
      (AUTORESET_PATDET /= "RESET_MATCH") and 
      (AUTORESET_PATDET /= "RESET_NOT_MATCH"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-106] AUTORESET_PATDET attribute is set to """));
    Write ( Message, string'(AUTORESET_PATDET));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""NO_RESET"", "));
    Write ( Message, string'("""RESET_MATCH"" or "));
    Write ( Message, string'("""RESET_NOT_MATCH"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AUTORESET_PRIORITY check
  if((xil_attr_test) or
     ((AUTORESET_PRIORITY /= "RESET") and 
      (AUTORESET_PRIORITY /= "CEP"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-107] AUTORESET_PRIORITY attribute is set to """));
    Write ( Message, string'(AUTORESET_PRIORITY));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""RESET"" or "));
    Write ( Message, string'("""CEP"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- MASK check

    -------- PATTERN check

    -------- PREG check
  if((xil_attr_test) or
     ((PREG /= 1) and 
      (PREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-138] PREG attribute is set to "));
    Write ( Message, PREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SEL_MASK check
  if((xil_attr_test) or
     ((SEL_MASK /= "MASK") and 
      (SEL_MASK /= "C") and 
      (SEL_MASK /= "ROUNDING_MODE1") and 
      (SEL_MASK /= "ROUNDING_MODE2"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-140] SEL_MASK attribute is set to """));
    Write ( Message, string'(SEL_MASK));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""MASK"", "));
    Write ( Message, string'("""C"", "));
    Write ( Message, string'("""ROUNDING_MODE1"" or "));
    Write ( Message, string'("""ROUNDING_MODE2"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SEL_PATTERN check
  if((xil_attr_test) or
     ((SEL_PATTERN /= "PATTERN") and 
      (SEL_PATTERN /= "C"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-141] SEL_PATTERN attribute is set to """));
    Write ( Message, string'(SEL_PATTERN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""PATTERN"" or "));
    Write ( Message, string'("""C"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- USE_PATTERN_DETECT check
  if((xil_attr_test) or
     ((USE_PATTERN_DETECT /= "NO_PATDET") and 
      (USE_PATTERN_DETECT /= "PATDET"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-143] USE_PATTERN_DETECT attribute is set to """));
    Write ( Message, string'(USE_PATTERN_DETECT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""NO_PATDET"" or "));
    Write ( Message, string'("""PATDET"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_OUTPUT_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

-- --####################################################################
-- --#####                    Pattern Detector                      #####
-- --####################################################################

--  new

--  select pattern
  the_pattern <= PATTERN_BIN when SEL_PATTERN_BIN = SEL_PATTERN_PATTERN else C_DATA_in;

--  selet mask
  the_mask <= (others => '1') when (USE_PATTERN_DETECT_BIN = USE_PATTERN_DETECT_NO_PATDET) else
      C_DATA_in when (SEL_MASK_BIN = SEL_MASK_C) else
      (not(C_DATA_in(46 downto 0)) & '0')  when (SEL_MASK_BIN = SEL_MASK_ROUNDING_MODE1) else
      (not(C_DATA_in(45 downto 0)) & "00") when (SEL_MASK_BIN = SEL_MASK_ROUNDING_MODE2) else
      MASK_BIN;

--  process (C_DATA_in) begin
--    case  SEL_MASK_BIN  is
--      when  SEL_MASK_MASK           => the_mask <= MASK_BIN;
--      when  SEL_MASK_C              => the_mask <= C_DATA_in;
--      when  SEL_MASK_ROUNDING_MODE1 =>
--                       the_mask <= not(C_DATA_in (46 downto 0) & '0');
--      when  SEL_MASK_ROUNDING_MODE2 =>
--                       the_mask <= not(C_DATA_in (45 downto 0) & "00");
--      when  others                  => the_mask <= MASK_BIN;
--    end case;
--  end process;

-- --  now do the pattern detection

  pdet_o  <= '1' when (    the_pattern or the_mask) = (ALU_OUT_in or the_mask)
                 else '0';
  pdetb_o <= '1' when (not the_pattern or the_mask) = (ALU_OUT_in or the_mask)
                 else '0';

  PATTERN_DETECT_out   <= pdet_o_mux  when opmode_valid_flag_dou else 'X';
  PATTERN_B_DETECT_out <= pdetb_o_mux when opmode_valid_flag_dou else 'X';

--  CLK_preg  <=  CLK_in  when  PREG_BIN = PREG_1  else  '0';

-- *** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

-- -- the previous values are used in Underflow/Overflow
  process (CLK_preg) begin
    if (glblGSR = '1') then
      pdet_o_reg1  <= '0';
      pdet_o_reg2  <= '0';
      pdetb_o_reg1 <= '0';
      pdetb_o_reg2 <= '0';
    elsif (rising_edge(CLK_preg)) then
      if (RSTP_in = '1' or the_auto_reset_patdet = '1') then
        pdet_o_reg1  <= '0';
        pdet_o_reg2  <= '0';
        pdetb_o_reg1 <= '0';
        pdetb_o_reg2 <= '0';
      elsif  (CEP_in = '1') then
        pdet_o_reg2  <= pdet_o_reg1;
        pdet_o_reg1  <= pdet_o;
        pdetb_o_reg2 <= pdetb_o_reg1;
        pdetb_o_reg1 <= pdetb_o;
      end if;
    end if;
  end process;

  pdet_o_mux     <= pdet_o_reg1  when (PREG_BIN = PREG_1) else pdet_o;
  pdetb_o_mux    <= pdetb_o_reg1 when (PREG_BIN = PREG_1) else pdetb_o;
  overflow_data  <= pdet_o_reg2  when (PREG_BIN = PREG_1) else pdet_o;
  underflow_data <= pdetb_o_reg2 when (PREG_BIN = PREG_1) else pdetb_o;

-- --####################################################################
-- --#####                     AUTORESET_PATDET                     #####
-- --####################################################################
  auto_reset_pri <= '1' when (AUTORESET_PRIORITY_BIN = AUTORESET_PRIORITY_RESET) else CEP_in;

  the_auto_reset_patdet <= auto_reset_pri and pdet_o_mux
           when (AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_MATCH) else
                           auto_reset_pri and overflow_data and not pdet_o_mux
           when (AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_NOT_MATCH) else
                           '0'; -- _RESET
--  the_auto_reset_patdet <= '1' when
--  (((AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_MATCH) and
--    (pdet_o_reg1 = '1')) or
--   ((AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_NOT_MATCH) and
--    ((pdet_o_reg2 = '1') and (pdet_o_reg1 = '0')))) and
--  ((CEP_in = '1') or
--   (AUTORESET_PRIORITY_BIN = AUTORESET_PRIORITY_RESET)) else '0';

-- --####################################################################
-- --#### CARRYOUT, CARRYCASCOUT. MULTSIGNOUT, PCOUT and XOROUT reg ##### 
-- --####################################################################
-- *** register with 1 level of register
  process (CLK_preg) begin
    if (glblGSR = '1') then
      COUT_reg <= "0000";
      ALUMODE10_reg <= '0';
      MULTSIGN_ALU_reg <= '0';
      ALU_OUT_reg <= (others => '0');
      XOR_MX_reg <= (others => '0');
    elsif (rising_edge(CLK_preg)) then
      if  (RSTP_in = '1' or the_auto_reset_patdet = '1') then
        COUT_reg <= "0000";
        ALUMODE10_reg <= '0';
        MULTSIGN_ALU_reg <= '0';
        ALU_OUT_reg <= (others => '0');
        XOR_MX_reg <= (others => '0');
      elsif (CEP_in = '1') then
        COUT_reg <= COUT_in;
        ALUMODE10_reg <= ALUMODE10_in;
        MULTSIGN_ALU_reg <= MULTSIGN_ALU_in;
        ALU_OUT_reg <= ALU_OUT_in;
        XOR_MX_reg <= XOR_MX_in;
      end if;
    end if;
  end process;

 CARRYOUT_out    <= COUT_reg         when PREG_BIN = PREG_1 else COUT_in;
 MULTSIGNOUT_out <= MULTSIGN_ALU_reg when PREG_BIN = PREG_1 else MULTSIGN_ALU_in;
 P_out           <= ALU_OUT_reg      when PREG_BIN = PREG_1 else ALU_OUT_in;
 ALUMODE10_mux   <= ALUMODE10_reg    when PREG_BIN = PREG_1 else ALUMODE10_in;
 XOROUT_out      <= XOR_MX_reg       when PREG_BIN = PREG_1 else XOR_MX_in;
 CCOUT_FB_out     <= ALUMODE10_reg xor COUT_reg(3);
 CARRYCASCOUT_out <= ALUMODE10_mux xor CARRYOUT_out(3);
 P_FDBK_out      <= ALU_OUT_reg      when PREG_BIN = PREG_1 else ALU_OUT_in;
 P_FDBK_47_out   <= ALU_OUT_reg(47)  when PREG_BIN = PREG_1 else ALU_OUT_in(47);
 PCOUT_out       <= ALU_OUT_reg      when PREG_BIN = PREG_1 else ALU_OUT_in;


-- --####################################################################
-- --#####                    Underflow / Overflow                  #####
-- --####################################################################

  OVERFLOW_out  <= not pdet_o_mux and not pdetb_o_mux and overflow_data when
                ((USE_PATTERN_DETECT_BIN = USE_PATTERN_DETECT_PATDET) or (PREG_BIN = PREG_1))
                   else 'X';
  UNDERFLOW_out <= not pdet_o_mux and not pdetb_o_mux and underflow_data when
                ((USE_PATTERN_DETECT_BIN = USE_PATTERN_DETECT_PATDET) or (PREG_BIN = PREG_1))
                   else 'X';


    -- end behavioral body
  end DSP_OUTPUT_V;
