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
-- /___/   /\      Filename    : DSP_MULTIPLIER.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_MULTIPLIER -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_MULTIPLIER is
  generic (
    AMULTSEL : string := "A";
    BMULTSEL : string := "B";
    USE_MULT : string := "MULTIPLY"
  );

  port (
    AMULT26              : out std_ulogic;
    BMULT17              : out std_ulogic;
    U                    : out std_logic_vector(44 downto 0);
    V                    : out std_logic_vector(44 downto 0);
    A2A1                 : in std_logic_vector(26 downto 0);
    AD_DATA              : in std_logic_vector(26 downto 0);
    B2B1                 : in std_logic_vector(17 downto 0)
  );
end DSP_MULTIPLIER;

architecture DSP_MULTIPLIER_V of DSP_MULTIPLIER is

  constant MODULE_NAME : string := "DSP_MULTIPLIER";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant AMULTSEL_A : std_ulogic := '0';
  constant AMULTSEL_AD : std_ulogic := '1';
  constant BMULTSEL_AD : std_ulogic := '1';
  constant BMULTSEL_B : std_ulogic := '0';
  constant USE_MULT_DYNAMIC : std_logic_vector(1 downto 0) := "01";
  constant USE_MULT_MULTIPLY : std_logic_vector(1 downto 0) := "00";
  constant USE_MULT_NONE : std_logic_vector(1 downto 0) := "10";

  signal AMULTSEL_BIN : std_ulogic;
  signal BMULTSEL_BIN : std_ulogic;
  signal USE_MULT_BIN : std_logic_vector(1 downto 0);

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal AMULT26_out : std_ulogic;
  signal BMULT17_out : std_ulogic;
  signal U_out : std_logic_vector(44 downto 0);
  signal V_out : std_logic_vector(44 downto 0);
 
  signal A2A1_in : std_logic_vector(26 downto 0);
  signal AD_DATA_in : std_logic_vector(26 downto 0);
  signal B2B1_in : std_logic_vector(17 downto 0);

  signal b_mult_mux       : signed (17 downto 0);
  signal a_mult_mux_26_18 : unsigned (17 downto 0);
  signal a_mult_mux       : signed (26 downto 0);
  signal b_mult_mux_17_27 : unsigned (26 downto 0);
  signal mult      : signed (44 downto 0);
  signal ps_u_mask : unsigned (43 downto 0) := X"55555555555";
  signal ps_v_mask : unsigned (43 downto 0) := X"aaaaaaaaaaa";

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  AMULT26 <= AMULT26_out after OUT_DELAY;
  BMULT17 <= BMULT17_out after OUT_DELAY;
  U <= U_out after OUT_DELAY;
  V <= V_out after OUT_DELAY;
  
  A2A1_in <= A2A1;
  AD_DATA_in <= AD_DATA;
  B2B1_in <= B2B1;
  
  AMULTSEL_BIN <= 
    AMULTSEL_A when (AMULTSEL = "A") else
    AMULTSEL_AD when (AMULTSEL = "AD") else
    AMULTSEL_A;

  BMULTSEL_BIN <= 
    BMULTSEL_B when (BMULTSEL = "B") else
    BMULTSEL_AD when (BMULTSEL = "AD") else
    BMULTSEL_B;

  USE_MULT_BIN <= 
    USE_MULT_MULTIPLY when (USE_MULT = "MULTIPLY") else
    USE_MULT_DYNAMIC when (USE_MULT = "DYNAMIC") else
    USE_MULT_NONE when (USE_MULT = "NONE") else
    USE_MULT_MULTIPLY;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
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
    Write ( Message, string'(DSP_MULTIPLIER_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_MULTIPLIER_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_MULTIPLIER_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_MULTIPLIER_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

  a_mult_mux <= signed(A2A1_in) when AMULTSEL_BIN = AMULTSEL_A else
                signed(AD_DATA_in);
  b_mult_mux <= signed(B2B1_in) when BMULTSEL_BIN = BMULTSEL_B else
                signed(AD_DATA_in(17 downto 0)) ;
-- replace {18{a_mult_mux[26]}} shorthand
  a_mult_mux_26_18 <= "000000000000000000" when a_mult_mux(26) = '0' else
                      "111111111111111111";
-- replace {27{b_mult_mux[17]}} shorthand
  b_mult_mux_17_27 <= "000000000000000000000000000" when b_mult_mux(17) = '0' else
                      "111111111111111111111111111";

  AMULT26_out <= a_mult_mux(26);
  BMULT17_out <= b_mult_mux(17);
  U_out <= std_logic_vector('1'          & (unsigned(mult(43 downto 0)) and ps_u_mask));
  V_out <= std_logic_vector(not mult(44) & (unsigned(mult(43 downto 0)) and ps_v_mask));

  mult <= (others => '0') when USE_MULT_BIN = USE_MULT_NONE else
          a_mult_mux * b_mult_mux;
--          (a_mult_mux_26_18 & a_mult_mux) * (b_mult_mux_17_27 & b_mult_mux);


    -- end behavioral body
  end DSP_MULTIPLIER_V;
