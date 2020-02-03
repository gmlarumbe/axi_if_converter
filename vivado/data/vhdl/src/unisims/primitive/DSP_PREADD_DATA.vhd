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
-- /___/   /\      Filename    : DSP_PREADD_DATA.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  01/11/13 - DIN, D_DATA width change (26/24) sync4 yml
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_PREADD_DATA -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_PREADD_DATA is
  generic (
    ADREG : integer := 1;
    AMULTSEL : string := "A";
    BMULTSEL : string := "B";
    DREG : integer := 1;
    INMODEREG : integer := 1;
    IS_CLK_INVERTED : bit := '0';
    IS_INMODE_INVERTED : std_logic_vector(4 downto 0) := "00000";
    IS_RSTD_INVERTED : bit := '0';
    IS_RSTINMODE_INVERTED : bit := '0';
    PREADDINSEL : string := "A";
    USE_MULT : string := "MULTIPLY"
  );

  port (
    A2A1                 : out std_logic_vector(26 downto 0);
    ADDSUB               : out std_ulogic;
    AD_DATA              : out std_logic_vector(26 downto 0);
    B2B1                 : out std_logic_vector(17 downto 0);
    D_DATA               : out std_logic_vector(26 downto 0);
    INMODE_2             : out std_ulogic;
    PREADD_AB            : out std_logic_vector(26 downto 0);
    A1_DATA              : in std_logic_vector(26 downto 0);
    A2_DATA              : in std_logic_vector(26 downto 0);
    AD                   : in std_logic_vector(26 downto 0);
    B1_DATA              : in std_logic_vector(17 downto 0);
    B2_DATA              : in std_logic_vector(17 downto 0);
    CEAD                 : in std_ulogic;
    CED                  : in std_ulogic;
    CEINMODE             : in std_ulogic;
    CLK                  : in std_ulogic;
    DIN                  : in std_logic_vector(26 downto 0);
    INMODE               : in std_logic_vector(4 downto 0);
    RSTD                 : in std_ulogic;
    RSTINMODE            : in std_ulogic
  );
end DSP_PREADD_DATA;

architecture DSP_PREADD_DATA_V of DSP_PREADD_DATA is

  constant MODULE_NAME : string := "DSP_PREADD_DATA";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant ADREG_0 : std_ulogic := '1';
  constant ADREG_1 : std_ulogic := '0';
  constant AMULTSEL_A : std_ulogic := '0';
  constant AMULTSEL_AD : std_ulogic := '1';
  constant BMULTSEL_AD : std_ulogic := '1';
  constant BMULTSEL_B : std_ulogic := '0';
  constant DREG_0 : std_ulogic := '1';
  constant DREG_1 : std_ulogic := '0';
  constant INMODEREG_0 : std_ulogic := '1';
  constant INMODEREG_1 : std_ulogic := '0';
  constant PREADDINSEL_A : std_ulogic := '0';
  constant PREADDINSEL_B : std_ulogic := '1';
  constant USE_MULT_DYNAMIC : std_logic_vector(1 downto 0) := "01";
  constant USE_MULT_MULTIPLY : std_logic_vector(1 downto 0) := "00";
  constant USE_MULT_NONE : std_logic_vector(1 downto 0) := "10";

  signal ADREG_BIN : std_ulogic;
  signal AMULTSEL_BIN : std_ulogic;
  signal BMULTSEL_BIN : std_ulogic;
  signal DREG_BIN : std_ulogic;
  signal INMODEREG_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_INMODE_INVERTED_BIN : std_logic_vector(4 downto 0);
  signal IS_RSTD_INVERTED_BIN : std_ulogic;
  signal IS_RSTINMODE_INVERTED_BIN : std_ulogic;
  signal PREADDINSEL_BIN : std_ulogic;
  signal USE_MULT_BIN : std_logic_vector(1 downto 0);

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal A2A1_out : std_logic_vector(26 downto 0);
  signal ADDSUB_out : std_ulogic;
  signal AD_DATA_out : std_logic_vector(26 downto 0);
  signal B2B1_out : std_logic_vector(17 downto 0);
  signal D_DATA_out : std_logic_vector(26 downto 0);
  signal INMODE_2_out : std_ulogic;
  signal PREADD_AB_out : std_logic_vector(26 downto 0);
 
  signal A1_DATA_in : std_logic_vector(26 downto 0);
  signal A2_DATA_in : std_logic_vector(26 downto 0);
  signal AD_in : std_logic_vector(26 downto 0);
  signal B1_DATA_in : std_logic_vector(17 downto 0);
  signal B2_DATA_in : std_logic_vector(17 downto 0);
  signal CEAD_in : std_ulogic;
  signal CED_in : std_ulogic;
  signal CEINMODE_in : std_ulogic;
  signal DIN_in : std_logic_vector(26 downto 0);
  signal INMODE_in : std_logic_vector(4 downto 0);
  signal RSTD_in : std_ulogic;
  signal RSTINMODE_in : std_ulogic;


  signal a1a2_i_mux   : std_logic_vector(26 downto 0);
  signal b1b2_i_mux   : std_logic_vector(17 downto 0);
  signal b1b2_i_mux_17_9 : std_logic_vector(8 downto 0);
  signal INMODE_mux   : std_logic_vector(4 downto 0);
  signal INMODE_reg   : std_logic_vector(4 downto 0) := (others => '0');
  signal AD_DATA_reg  : std_logic_vector(26 downto 0) := (others => '0');
  signal D_DATA_reg   : std_logic_vector(26 downto 0) := (others => '0');
  signal CLK_inmode   : std_ulogic;
  signal CLK_dreg     : std_ulogic;
  signal CLK_adreg    : std_ulogic;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  A2A1 <= A2A1_out after OUT_DELAY;
  ADDSUB <= ADDSUB_out after OUT_DELAY;
  AD_DATA <= AD_DATA_out after OUT_DELAY;
  B2B1 <= B2B1_out after OUT_DELAY;
  D_DATA <= D_DATA_out after OUT_DELAY;
  INMODE_2 <= INMODE_2_out after OUT_DELAY;
  PREADD_AB <= PREADD_AB_out after OUT_DELAY;
  
  A1_DATA_in <= A1_DATA;
  A2_DATA_in <= A2_DATA;
  AD_in <= AD;
  B1_DATA_in <= B1_DATA;
  B2_DATA_in <= B2_DATA;
  CEAD_in <= '0' when (CEAD = 'Z') else CEAD; -- rv 0
  CED_in <= '0' when (CED = 'Z') else CED; -- rv 0
  CEINMODE_in <= CEINMODE;
  CLK_inmode <=  '0' when (INMODEREG_BIN = INMODEREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_dreg   <=  '0' when (DREG_BIN = DREG_0)           else CLK xor IS_CLK_INVERTED_BIN;
  CLK_adreg  <=  '0' when (ADREG_BIN = ADREG_0)         else CLK xor IS_CLK_INVERTED_BIN;
  DIN_in(0) <= '0' when (DIN(0) = 'Z') else DIN(0); -- rv 0
  DIN_in(1) <= '0' when (DIN(1) = 'Z') else DIN(1); -- rv 0
  DIN_in(10) <= '0' when (DIN(10) = 'Z') else DIN(10); -- rv 0
  DIN_in(11) <= '0' when (DIN(11) = 'Z') else DIN(11); -- rv 0
  DIN_in(12) <= '0' when (DIN(12) = 'Z') else DIN(12); -- rv 0
  DIN_in(13) <= '0' when (DIN(13) = 'Z') else DIN(13); -- rv 0
  DIN_in(14) <= '0' when (DIN(14) = 'Z') else DIN(14); -- rv 0
  DIN_in(15) <= '0' when (DIN(15) = 'Z') else DIN(15); -- rv 0
  DIN_in(16) <= '0' when (DIN(16) = 'Z') else DIN(16); -- rv 0
  DIN_in(17) <= '0' when (DIN(17) = 'Z') else DIN(17); -- rv 0
  DIN_in(18) <= '0' when (DIN(18) = 'Z') else DIN(18); -- rv 0
  DIN_in(19) <= '0' when (DIN(19) = 'Z') else DIN(19); -- rv 0
  DIN_in(2) <= '0' when (DIN(2) = 'Z') else DIN(2); -- rv 0
  DIN_in(20) <= '0' when (DIN(20) = 'Z') else DIN(20); -- rv 0
  DIN_in(21) <= '0' when (DIN(21) = 'Z') else DIN(21); -- rv 0
  DIN_in(22) <= '0' when (DIN(22) = 'Z') else DIN(22); -- rv 0
  DIN_in(23) <= '0' when (DIN(23) = 'Z') else DIN(23); -- rv 0
  DIN_in(24) <= '0' when (DIN(24) = 'Z') else DIN(24); -- rv 0
  DIN_in(25) <= '0' when (DIN(25) = 'Z') else DIN(25); -- rv 0
  DIN_in(26) <= '0' when (DIN(26) = 'Z') else DIN(26); -- rv 0
  DIN_in(3) <= '0' when (DIN(3) = 'Z') else DIN(3); -- rv 0
  DIN_in(4) <= '0' when (DIN(4) = 'Z') else DIN(4); -- rv 0
  DIN_in(5) <= '0' when (DIN(5) = 'Z') else DIN(5); -- rv 0
  DIN_in(6) <= '0' when (DIN(6) = 'Z') else DIN(6); -- rv 0
  DIN_in(7) <= '0' when (DIN(7) = 'Z') else DIN(7); -- rv 0
  DIN_in(8) <= '0' when (DIN(8) = 'Z') else DIN(8); -- rv 0
  DIN_in(9) <= '0' when (DIN(9) = 'Z') else DIN(9); -- rv 0
  INMODE_in(0) <= '0' when (INMODE(0) = 'Z') else INMODE(0) xor IS_INMODE_INVERTED_BIN(0); -- rv 0
  INMODE_in(1) <= '0' when (INMODE(1) = 'Z') else INMODE(1) xor IS_INMODE_INVERTED_BIN(1); -- rv 0
  INMODE_in(2) <= '0' when (INMODE(2) = 'Z') else INMODE(2) xor IS_INMODE_INVERTED_BIN(2); -- rv 0
  INMODE_in(3) <= '0' when (INMODE(3) = 'Z') else INMODE(3) xor IS_INMODE_INVERTED_BIN(3); -- rv 0
  INMODE_in(4) <= '0' when (INMODE(4) = 'Z') else INMODE(4) xor IS_INMODE_INVERTED_BIN(4); -- rv 0
  RSTD_in <= '0' when (RSTD = 'Z') else RSTD xor IS_RSTD_INVERTED_BIN; -- rv 0
  RSTINMODE_in <= '0' when (RSTINMODE = 'Z') else RSTINMODE xor IS_RSTINMODE_INVERTED_BIN; -- rv 0
  
  ADREG_BIN <= 
    ADREG_1 when (ADREG = 1) else
    ADREG_0 when (ADREG = 0) else
    ADREG_1;

  AMULTSEL_BIN <= 
    AMULTSEL_A when (AMULTSEL = "A") else
    AMULTSEL_AD when (AMULTSEL = "AD") else
    AMULTSEL_A;

  BMULTSEL_BIN <= 
    BMULTSEL_B when (BMULTSEL = "B") else
    BMULTSEL_AD when (BMULTSEL = "AD") else
    BMULTSEL_B;

  DREG_BIN <= 
    DREG_1 when (DREG = 1) else
    DREG_0 when (DREG = 0) else
    DREG_1;

  INMODEREG_BIN <= 
    INMODEREG_1 when (INMODEREG = 1) else
    INMODEREG_0 when (INMODEREG = 0) else
    INMODEREG_1;

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_INMODE_INVERTED_BIN <= IS_INMODE_INVERTED;

  IS_RSTD_INVERTED_BIN <= TO_X01(IS_RSTD_INVERTED);
  IS_RSTINMODE_INVERTED_BIN <= TO_X01(IS_RSTINMODE_INVERTED);
  PREADDINSEL_BIN <= 
    PREADDINSEL_A when (PREADDINSEL = "A") else
    PREADDINSEL_B when (PREADDINSEL = "B") else
    PREADDINSEL_A;

  USE_MULT_BIN <= 
    USE_MULT_MULTIPLY when (USE_MULT = "MULTIPLY") else
    USE_MULT_DYNAMIC when (USE_MULT = "DYNAMIC") else
    USE_MULT_NONE when (USE_MULT = "NONE") else
    USE_MULT_MULTIPLY;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- ADREG check
  if((xil_attr_test) or
     ((ADREG /= 1) and 
      (ADREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] ADREG attribute is set to "));
    Write ( Message, ADREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AMULTSEL check
  if((xil_attr_test) or
     ((AMULTSEL /= "A") and 
      (AMULTSEL /= "AD"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-104] AMULTSEL attribute is set to """));
    Write ( Message, string'(AMULTSEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""A"" or "));
    Write ( Message, string'("""AD"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- BMULTSEL check
  if((xil_attr_test) or
     ((BMULTSEL /= "B") and 
      (BMULTSEL /= "AD"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-110] BMULTSEL attribute is set to """));
    Write ( Message, string'(BMULTSEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""B"" or "));
    Write ( Message, string'("""AD"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DREG check
  if((xil_attr_test) or
     ((DREG /= 1) and 
      (DREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-116] DREG attribute is set to "));
    Write ( Message, DREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- INMODEREG check
  if((xil_attr_test) or
     ((INMODEREG /= 1) and 
      (INMODEREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-117] INMODEREG attribute is set to "));
    Write ( Message, INMODEREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- PREADDINSEL check
  if((xil_attr_test) or
     ((PREADDINSEL /= "A") and 
      (PREADDINSEL /= "B"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-137] PREADDINSEL attribute is set to """));
    Write ( Message, string'(PREADDINSEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""A"" or "));
    Write ( Message, string'("""B"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- USE_MULT check
  if((xil_attr_test) or
     ((USE_MULT /= "MULTIPLY") and 
      (USE_MULT /= "DYNAMIC") and 
      (USE_MULT /= "NONE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-142] USE_MULT attribute is set to """));
    Write ( Message, string'(USE_MULT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""MULTIPLY"", "));
    Write ( Message, string'("""DYNAMIC"" or "));
    Write ( Message, string'("""NONE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_PREADD_DATA_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

  a1a2_i_mux    <= A1_DATA_in      when INMODE_mux(0) = '1' else A2_DATA_in;
  b1b2_i_mux    <= B1_DATA_in      when INMODE_mux(4) = '1' else B2_DATA_in;
-- replace {9{b1b2_i_mux[17]}} shorthand
  b1b2_i_mux_17_9 <= "000000000" when b1b2_i_mux(17) = '0' else
                     "111111111";
  A2A1_out  <= (others => '0') when (INMODE_mux(1) = '1' and PREADDINSEL_BIN = PREADDINSEL_A)
                else a1a2_i_mux;
  B2B1_out  <= (others => '0') when (INMODE_mux(1) = '1' and PREADDINSEL_BIN = PREADDINSEL_B)
                else b1b2_i_mux;
  ADDSUB_out    <= INMODE_mux(3);
  INMODE_2_out  <= INMODE_mux(2);
  PREADD_AB_out <= (b1b2_i_mux_17_9 & B2B1_out) when PREADDINSEL_BIN = PREADDINSEL_B
                   else A2A1_out;

-- *********************************************************
-- **********  INMODE signal registering        ************
-- *********************************************************
--  new 
--  CLK_inmode  <=  CLK_in  when  INMODEREG_BIN = INMODEREG_1  else  '0';
  process (CLK_inmode) begin
    if  (glblGSR = '1') then INMODE_reg <= (others => '0');
    elsif (rising_edge(CLK_inmode)) then
      if    (RSTINMODE_in = '1') then INMODE_reg <= (others => '0');
      elsif (CEINMODE_in = '1')  then INMODE_reg <= INMODE_in;
      end if;
    end if;
  end process;

  INMODE_mux  <=  INMODE_reg  when  INMODEREG_BIN = INMODEREG_1  else  INMODE_in;

-- *********************************************************
-- *** Input register D with 1 level deep of register
-- *********************************************************
--  CLK_dreg  <=  CLK_in  when  DREG_BIN = DREG_1  else  '0';
  process (CLK_dreg) begin
    if (glblGSR = '1') then D_DATA_reg <= (others => '0');
    elsif (rising_edge(CLK_dreg)) then
      if    (RSTD_in = '1') then D_DATA_reg <= (others => '0');
      elsif (CED_in = '1')  then D_DATA_reg <= DIN_in;
      end if;
    end if;
  end process;

  D_DATA_out  <=  D_DATA_reg  when  DREG_BIN = DREG_1  else  DIN_in;

-- *********************************************************
-- *** Input register AD with 1 level deep of register
-- *********************************************************
--  CLK_adreg  <=  CLK_in  when  ADREG_BIN = ADREG_1  else  '0';
  process (CLK_adreg) begin
    if  (glblGSR = '1') then AD_DATA_reg <= (others => '0');
    elsif (rising_edge(CLK_adreg)) then
      if    (RSTD_in = '1') then AD_DATA_reg <= (others => '0');
      elsif (CEAD_in = '1') then AD_DATA_reg <= AD_in;
      end if;
    end if;
  end process;

  AD_DATA_out  <=  AD_DATA_reg  when  ADREG_BIN = ADREG_1  else  AD_in;


    -- end behavioral body
  end DSP_PREADD_DATA_V;
