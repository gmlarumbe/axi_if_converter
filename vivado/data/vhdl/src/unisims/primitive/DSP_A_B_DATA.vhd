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
-- /___/   /\      Filename    : DSP_A_B_DATA.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  03/06/13 - 701316 - A_B_reg no clk when REG=0
--  04/22/13 - 714213 - ACOUT, BCOUT wrong logic
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_A_B_DATA -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_A_B_DATA is
  generic (
    ACASCREG : integer := 1;
    AREG : integer := 1;
    A_INPUT : string := "DIRECT";
    BCASCREG : integer := 1;
    BREG : integer := 1;
    B_INPUT : string := "DIRECT";
    IS_CLK_INVERTED : bit := '0';
    IS_RSTA_INVERTED : bit := '0';
    IS_RSTB_INVERTED : bit := '0'
  );

  port (
    A1_DATA              : out std_logic_vector(26 downto 0);
    A2_DATA              : out std_logic_vector(26 downto 0);
    ACOUT                : out std_logic_vector(29 downto 0);
    A_ALU                : out std_logic_vector(29 downto 0);
    B1_DATA              : out std_logic_vector(17 downto 0);
    B2_DATA              : out std_logic_vector(17 downto 0);
    BCOUT                : out std_logic_vector(17 downto 0);
    B_ALU                : out std_logic_vector(17 downto 0);
    A                    : in std_logic_vector(29 downto 0);
    ACIN                 : in std_logic_vector(29 downto 0);
    B                    : in std_logic_vector(17 downto 0);
    BCIN                 : in std_logic_vector(17 downto 0);
    CEA1                 : in std_ulogic;
    CEA2                 : in std_ulogic;
    CEB1                 : in std_ulogic;
    CEB2                 : in std_ulogic;
    CLK                  : in std_ulogic;
    RSTA                 : in std_ulogic;
    RSTB                 : in std_ulogic
  );
end DSP_A_B_DATA;

architecture DSP_A_B_DATA_V of DSP_A_B_DATA is

  constant MODULE_NAME : string := "DSP_A_B_DATA";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant ACASCREG_0 : std_logic_vector(1 downto 0) := "01";
  constant ACASCREG_1 : std_logic_vector(1 downto 0) := "00";
  constant ACASCREG_2 : std_logic_vector(1 downto 0) := "10";
  constant AREG_0 : std_logic_vector(1 downto 0) := "01";
  constant AREG_1 : std_logic_vector(1 downto 0) := "00";
  constant AREG_2 : std_logic_vector(1 downto 0) := "10";
  constant A_INPUT_CASCADE : std_ulogic := '1';
  constant A_INPUT_DIRECT : std_ulogic := '0';
  constant BCASCREG_0 : std_logic_vector(1 downto 0) := "01";
  constant BCASCREG_1 : std_logic_vector(1 downto 0) := "00";
  constant BCASCREG_2 : std_logic_vector(1 downto 0) := "10";
  constant BREG_0 : std_logic_vector(1 downto 0) := "01";
  constant BREG_1 : std_logic_vector(1 downto 0) := "00";
  constant BREG_2 : std_logic_vector(1 downto 0) := "10";
  constant B_INPUT_CASCADE : std_ulogic := '1';
  constant B_INPUT_DIRECT : std_ulogic := '0';

  signal ACASCREG_BIN : std_logic_vector(1 downto 0);
  signal AREG_BIN : std_logic_vector(1 downto 0);
  signal A_INPUT_BIN : std_ulogic;
  signal BCASCREG_BIN : std_logic_vector(1 downto 0);
  signal BREG_BIN : std_logic_vector(1 downto 0);
  signal B_INPUT_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_RSTA_INVERTED_BIN : std_ulogic;
  signal IS_RSTB_INVERTED_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal A1_DATA_out : std_logic_vector(26 downto 0);
  signal A2_DATA_out : std_logic_vector(26 downto 0);
  signal ACOUT_out : std_logic_vector(29 downto 0);
  signal A_ALU_out : std_logic_vector(29 downto 0);
  signal B1_DATA_out : std_logic_vector(17 downto 0);
  signal B2_DATA_out : std_logic_vector(17 downto 0);
  signal BCOUT_out : std_logic_vector(17 downto 0);
  signal B_ALU_out : std_logic_vector(17 downto 0);
 
  signal ACIN_in : std_logic_vector(29 downto 0);
  signal A_in : std_logic_vector(29 downto 0);
  signal BCIN_in : std_logic_vector(17 downto 0);
  signal B_in : std_logic_vector(17 downto 0);
  signal CEA1_in : std_ulogic;
  signal CEA2_in : std_ulogic;
  signal CEB1_in : std_ulogic;
  signal CEB2_in : std_ulogic;
  signal RSTA_in : std_ulogic;
  signal RSTB_in : std_ulogic;

  signal A_ACIN_mux   : std_logic_vector(29 downto 0);
  signal A1_reg_mux   : std_logic_vector(29 downto 0);
  signal A2_reg_mux   : std_logic_vector(29 downto 0);
  signal A1_reg       : std_logic_vector(29 downto 0) := (others => '0');
  signal A2_reg       : std_logic_vector(29 downto 0) := (others => '0');
  signal B_BCIN_mux   : std_logic_vector(17 downto 0);
  signal B1_reg_mux   : std_logic_vector(17 downto 0);
  signal B2_reg_mux   : std_logic_vector(17 downto 0);
  signal B1_reg       : std_logic_vector(17 downto 0) := (others => '0');
  signal B2_reg       : std_logic_vector(17 downto 0) := (others => '0');
  signal CLK_areg1            : std_ulogic;
  signal CLK_areg2            : std_ulogic;
  signal CLK_breg1            : std_ulogic;
  signal CLK_breg2            : std_ulogic;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  A1_DATA <= A1_DATA_out after OUT_DELAY;
  A2_DATA <= A2_DATA_out after OUT_DELAY;
  ACOUT <= ACOUT_out after OUT_DELAY;
  A_ALU <= A_ALU_out after OUT_DELAY;
  B1_DATA <= B1_DATA_out after OUT_DELAY;
  B2_DATA <= B2_DATA_out after OUT_DELAY;
  BCOUT <= BCOUT_out after OUT_DELAY;
  B_ALU <= B_ALU_out after OUT_DELAY;
  
  ACIN_in <= ACIN;
  A_in(0) <= '1' when (A(0) = 'Z') else A(0); -- rv 1
  A_in(1) <= '1' when (A(1) = 'Z') else A(1); -- rv 1
  A_in(10) <= '1' when (A(10) = 'Z') else A(10); -- rv 1
  A_in(11) <= '1' when (A(11) = 'Z') else A(11); -- rv 1
  A_in(12) <= '1' when (A(12) = 'Z') else A(12); -- rv 1
  A_in(13) <= '1' when (A(13) = 'Z') else A(13); -- rv 1
  A_in(14) <= '1' when (A(14) = 'Z') else A(14); -- rv 1
  A_in(15) <= '1' when (A(15) = 'Z') else A(15); -- rv 1
  A_in(16) <= '1' when (A(16) = 'Z') else A(16); -- rv 1
  A_in(17) <= '1' when (A(17) = 'Z') else A(17); -- rv 1
  A_in(18) <= '1' when (A(18) = 'Z') else A(18); -- rv 1
  A_in(19) <= '1' when (A(19) = 'Z') else A(19); -- rv 1
  A_in(2) <= '1' when (A(2) = 'Z') else A(2); -- rv 1
  A_in(20) <= '1' when (A(20) = 'Z') else A(20); -- rv 1
  A_in(21) <= '1' when (A(21) = 'Z') else A(21); -- rv 1
  A_in(22) <= '1' when (A(22) = 'Z') else A(22); -- rv 1
  A_in(23) <= '1' when (A(23) = 'Z') else A(23); -- rv 1
  A_in(24) <= '1' when (A(24) = 'Z') else A(24); -- rv 1
  A_in(25) <= '1' when (A(25) = 'Z') else A(25); -- rv 1
  A_in(26) <= '1' when (A(26) = 'Z') else A(26); -- rv 1
  A_in(27) <= '1' when (A(27) = 'Z') else A(27); -- rv 1
  A_in(28) <= '1' when (A(28) = 'Z') else A(28); -- rv 1
  A_in(29) <= '1' when (A(29) = 'Z') else A(29); -- rv 1
  A_in(3) <= '1' when (A(3) = 'Z') else A(3); -- rv 1
  A_in(4) <= '1' when (A(4) = 'Z') else A(4); -- rv 1
  A_in(5) <= '1' when (A(5) = 'Z') else A(5); -- rv 1
  A_in(6) <= '1' when (A(6) = 'Z') else A(6); -- rv 1
  A_in(7) <= '1' when (A(7) = 'Z') else A(7); -- rv 1
  A_in(8) <= '1' when (A(8) = 'Z') else A(8); -- rv 1
  A_in(9) <= '1' when (A(9) = 'Z') else A(9); -- rv 1
  BCIN_in <= BCIN;
  B_in(0) <= '1' when (B(0) = 'Z') else B(0); -- rv 1
  B_in(1) <= '1' when (B(1) = 'Z') else B(1); -- rv 1
  B_in(10) <= '1' when (B(10) = 'Z') else B(10); -- rv 1
  B_in(11) <= '1' when (B(11) = 'Z') else B(11); -- rv 1
  B_in(12) <= '1' when (B(12) = 'Z') else B(12); -- rv 1
  B_in(13) <= '1' when (B(13) = 'Z') else B(13); -- rv 1
  B_in(14) <= '1' when (B(14) = 'Z') else B(14); -- rv 1
  B_in(15) <= '1' when (B(15) = 'Z') else B(15); -- rv 1
  B_in(16) <= '1' when (B(16) = 'Z') else B(16); -- rv 1
  B_in(17) <= '1' when (B(17) = 'Z') else B(17); -- rv 1
  B_in(2) <= '1' when (B(2) = 'Z') else B(2); -- rv 1
  B_in(3) <= '1' when (B(3) = 'Z') else B(3); -- rv 1
  B_in(4) <= '1' when (B(4) = 'Z') else B(4); -- rv 1
  B_in(5) <= '1' when (B(5) = 'Z') else B(5); -- rv 1
  B_in(6) <= '1' when (B(6) = 'Z') else B(6); -- rv 1
  B_in(7) <= '1' when (B(7) = 'Z') else B(7); -- rv 1
  B_in(8) <= '1' when (B(8) = 'Z') else B(8); -- rv 1
  B_in(9) <= '1' when (B(9) = 'Z') else B(9); -- rv 1
  CEA1_in <= '0' when (CEA1 = 'Z') else CEA1; -- rv 0
  CEA2_in <= '0' when (CEA2 = 'Z') else CEA2; -- rv 0
  CEB1_in <= '0' when (CEB1 = 'Z') else CEB1; -- rv 0
  CEB2_in <= '0' when (CEB2 = 'Z') else CEB2; -- rv 0
  CLK_areg1 <= '0' when (AREG_BIN = AREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_areg2 <= '0' when (AREG_BIN = AREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_breg1 <= '0' when (BREG_BIN = BREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_breg2 <= '0' when (BREG_BIN = BREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  RSTA_in <= '0' when (RSTA = 'Z') else RSTA xor IS_RSTA_INVERTED_BIN; -- rv 0
  RSTB_in <= '0' when (RSTB = 'Z') else RSTB xor IS_RSTB_INVERTED_BIN; -- rv 0
  
  ACASCREG_BIN <= 
    ACASCREG_1 when (ACASCREG = 1) else
    ACASCREG_0 when (ACASCREG = 0) else
    ACASCREG_2 when (ACASCREG = 2) else
    ACASCREG_1;

  AREG_BIN <= 
    AREG_1 when (AREG = 1) else
    AREG_0 when (AREG = 0) else
    AREG_2 when (AREG = 2) else
    AREG_1;

  A_INPUT_BIN <= 
    A_INPUT_DIRECT when (A_INPUT = "DIRECT") else
    A_INPUT_CASCADE when (A_INPUT = "CASCADE") else
    A_INPUT_DIRECT;

  BCASCREG_BIN <= 
    BCASCREG_1 when (BCASCREG = 1) else
    BCASCREG_0 when (BCASCREG = 0) else
    BCASCREG_2 when (BCASCREG = 2) else
    BCASCREG_1;

  BREG_BIN <= 
    BREG_1 when (BREG = 1) else
    BREG_0 when (BREG = 0) else
    BREG_2 when (BREG = 2) else
    BREG_1;

  B_INPUT_BIN <= 
    B_INPUT_DIRECT when (B_INPUT = "DIRECT") else
    B_INPUT_CASCADE when (B_INPUT = "CASCADE") else
    B_INPUT_DIRECT;

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_RSTA_INVERTED_BIN <= TO_X01(IS_RSTA_INVERTED);
  IS_RSTB_INVERTED_BIN <= TO_X01(IS_RSTB_INVERTED);
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- ACASCREG check
  if((xil_attr_test) or
     ((ACASCREG /= 1) and 
      (ACASCREG /= 0) and 
      (ACASCREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] ACASCREG attribute is set to "));
    Write ( Message, ACASCREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AREG check
  if((xil_attr_test) or
     ((AREG /= 1) and 
      (AREG /= 0) and 
      (AREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-105] AREG attribute is set to "));
    Write ( Message, AREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- A_INPUT check
  if((xil_attr_test) or
     ((A_INPUT /= "DIRECT") and 
      (A_INPUT /= "CASCADE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-108] A_INPUT attribute is set to """));
    Write ( Message, string'(A_INPUT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DIRECT"" or "));
    Write ( Message, string'("""CASCADE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- BCASCREG check
  if((xil_attr_test) or
     ((BCASCREG /= 1) and 
      (BCASCREG /= 0) and 
      (BCASCREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-109] BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- BREG check
  if((xil_attr_test) or
     ((BREG /= 1) and 
      (BREG /= 0) and 
      (BREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-111] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- B_INPUT check
  if((xil_attr_test) or
     ((B_INPUT /= "DIRECT") and 
      (B_INPUT /= "CASCADE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-112] B_INPUT attribute is set to """));
    Write ( Message, string'(B_INPUT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DIRECT"" or "));
    Write ( Message, string'("""CASCADE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AREG check vs ACASCREG
  if (AREG = 1) then
    if (ACASCREG /= 1) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-2] AREG attribute is set to "));
      Write ( Message, AREG);
      Write ( Message, string'(" and ACASCREG attribute is set to "));
      Write ( Message, ACASCREG);
      Write ( Message, string'(". When AREG is 0 or 1, ACASCREG must be set to the same value."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
  elsif (AREG = 0) then
    if (ACASCREG /= 0) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-2] AREG attribute is set to "));
      Write ( Message, AREG);
      Write ( Message, string'(" and ACASCREG attribute is set to "));
      Write ( Message, ACASCREG);
      Write ( Message, string'(". When AREG is 0 or 1, ACASCREG must be set to the same value."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
  elsif (AREG = 2) then
    if (ACASCREG = 0) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-3] AREG attribute is set to "));
      Write ( Message, AREG);
      Write ( Message, string'(" and ACASCREG attribute is set to "));
      Write ( Message, ACASCREG);
      Write ( Message, string'(". When AREG is 2, ACASCREG must be set to 1 or 2."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
  end if;
    ------ BREG check vs BCASCREG
  if (BREG = 1) then
    if (BCASCREG /= 1) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-4] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(" and BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". When BREG is 0 or 1, BCASCREG must be set to the same value."));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    end if;
  elsif (BREG = 0) then
    if (BCASCREG /= 0) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-4] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(" and BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". When BREG is 0 or 1, BCASCREG must be set to the same value."));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    end if;
  elsif (BREG = 2) then
    if (BCASCREG = 0) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-5] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(" and BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". When BREG is 2, BCASCREG must be set to 1 or 2."));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    end if;
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_A_B_DATA_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

-- *********************************************************
-- *** Input register A with 2 level deep of registers
-- *********************************************************

  A_ACIN_mux <= ACIN_in when (A_INPUT_BIN = A_INPUT_CASCADE) else  A_in;
--  CLK_areg1  <= '0' when (AREG_BIN = AREG_0) else CLK_in  ;
--  CLK_areg2  <= '0' when (AREG_BIN = AREG_0) else CLK_in  ;

  process (CLK_areg1) begin
    if  (glblGSR = '1') then A1_reg <= (others => '0');
    elsif (rising_edge(CLK_areg1)) then
      if     (RSTA_in = '1') then A1_reg <= (others => '0');
      elsif  (CEA1_in = '1') then A1_reg <= A_ACIN_mux;
      end if;
    end if;
  end process;

  A1_reg_mux  <=  A1_reg when (AREG_BIN = AREG_2) else A_ACIN_mux;

  process (CLK_areg2)
  begin
    if  (glblGSR = '1') then A2_reg <= (others => '0');
    elsif (rising_edge(CLK_areg2)) then
      if    (RSTA_in = '1') then A2_reg <= (others => '0');
      elsif (CEA2_in = '1') then A2_reg <= A1_reg_mux;
      end if;
    end if;
  end process;

  A2_reg_mux  <= A1_reg_mux when (AREG_BIN = AREG_0) else A2_reg;

-- assumes encoding the same for ACASCREG and AREG
  ACOUT_out   <= A2_reg_mux when ACASCREG_BIN = AREG_BIN else A1_reg;
  A1_DATA_out <= A1_reg (26 downto 0);
  A2_DATA_out <= A2_reg_mux (26 downto 0);
  A_ALU_out   <= A2_reg_mux;

-- *********************************************************
-- *** Input register B with 2 level deep of registers
-- *********************************************************

  B_BCIN_mux <= BCIN_in when (B_INPUT_BIN = B_INPUT_CASCADE) else B_in;
--  CLK_breg1  <= '0' when (BREG_BIN = BREG_0) else CLK_in ;
--  CLK_breg2  <= '0' when (BREG_BIN = BREG_0) else CLK_in ;

  process (CLK_breg1) begin
    if (glblGSR = '1') then B1_reg <= (others => '0');
    elsif (rising_edge(CLK_breg1)) then
      if    (RSTB_in = '1') then B1_reg <= (others => '0');
      elsif (CEB1_in = '1') then B1_reg <= B_BCIN_mux;
      end if;
    end if;
  end process;

  B1_reg_mux  <= B1_reg when (BREG_BIN = BREG_2) else B_BCIN_mux;

  process (CLK_breg2) begin
    if (glblGSR = '1') then B2_reg <= (others => '0');
    elsif (rising_edge(CLK_breg2)) then
      if    (RSTB_in = '1') then B2_reg <= (others => '0');
      elsif (CEB2_in = '1') then B2_reg <= B1_reg_mux;
      end if;
    end if;
  end process;

  B2_reg_mux <=  B1_reg_mux when (BREG_BIN = BREG_0) else B2_reg;

-- assumes encoding the same for BCASCREG and BREG
  BCOUT_out   <= B2_reg_mux when BCASCREG_BIN = BREG_BIN else B1_reg;
  B1_DATA_out <= B1_reg;
  B2_DATA_out <= B2_reg_mux;
  B_ALU_out <= B2_reg_mux;


    -- end behavioral body
  end DSP_A_B_DATA_V;
