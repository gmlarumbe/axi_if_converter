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
-- /___/   /\      Filename    : DSP_M_DATA.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  04/22/13 - 713695 - Zero mult result on USE_SIMD
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_M_DATA -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_M_DATA is
  generic (
    IS_CLK_INVERTED : bit := '0';
    IS_RSTM_INVERTED : bit := '0';
    MREG : integer := 1
  );

  port (
    U_DATA               : out std_logic_vector(44 downto 0);
    V_DATA               : out std_logic_vector(44 downto 0);
    CEM                  : in std_ulogic;
    CLK                  : in std_ulogic;
    RSTM                 : in std_ulogic;
    U                    : in std_logic_vector(44 downto 0);
    V                    : in std_logic_vector(44 downto 0)
  );
end DSP_M_DATA;

architecture DSP_M_DATA_V of DSP_M_DATA is

  constant MODULE_NAME : string := "DSP_M_DATA";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant MREG_0 : std_ulogic := '1';
  constant MREG_1 : std_ulogic := '0';

  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_RSTM_INVERTED_BIN : std_ulogic;
  signal MREG_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal U_DATA_out : std_logic_vector(44 downto 0);
  signal V_DATA_out : std_logic_vector(44 downto 0);
 
  signal CEM_in : std_ulogic;
  signal RSTM_in : std_ulogic;
  signal U_in : std_logic_vector(44 downto 0);
  signal V_in : std_logic_vector(44 downto 0);

  signal U_DATA_reg      : std_logic_vector(44 downto 0) := '0' & X"00000000000";
  signal V_DATA_reg      : std_logic_vector(44 downto 0) := '0' & X"00000000000";
  signal CLK_mreg        : std_ulogic;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  U_DATA <= U_DATA_out after OUT_DELAY;
  V_DATA <= V_DATA_out after OUT_DELAY;
  
  CEM_in <= '0' when (CEM = 'Z') else CEM; -- rv 0
  CLK_mreg  <= '0' when (MREG_BIN = MREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  RSTM_in <= '0' when (RSTM = 'Z') else RSTM xor IS_RSTM_INVERTED_BIN; -- rv 0
  U_in <= U;
  V_in <= V;
  
  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_RSTM_INVERTED_BIN <= TO_X01(IS_RSTM_INVERTED);
  MREG_BIN <= 
    MREG_1 when (MREG = 1) else
    MREG_0 when (MREG = 0) else
    MREG_1;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- MREG check
  if((xil_attr_test) or
     ((MREG /= 1) and 
      (MREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-134] MREG attribute is set to "));
    Write ( Message, MREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_M_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_M_DATA_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

-- *********************************************************
-- *** Multiplier outputs U, V  with 1 level deep of register
-- *********************************************************

--  CLK_mreg <= CLK_in  when MREG_BIN = MREG_1 else '0';
  process (CLK_mreg) begin
    if (glblGSR = '1') then
      U_DATA_reg    <= '0' & X"00000000000";
      V_DATA_reg    <= '0' & X"00000000000";
    elsif (rising_edge(CLK_mreg)) then
      if (RSTM_in = '1') then
        U_DATA_reg    <= '0' & X"00000000000";
        V_DATA_reg    <= '0' & X"00000000000";
      elsif (CEM_in = '1') then
        U_DATA_reg    <= U_in;
        V_DATA_reg    <= V_in;
      end if;
    end if;
  end process;

  U_DATA_out    <= U_DATA_reg    when MREG_BIN = MREG_1 else U_in;
  V_DATA_out    <= V_DATA_reg    when MREG_BIN = MREG_1 else V_in;


    -- end behavioral body
  end DSP_M_DATA_V;
