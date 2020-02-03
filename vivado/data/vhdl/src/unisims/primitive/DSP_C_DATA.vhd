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
-- /___/   /\      Filename    : DSP_C_DATA.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_C_DATA -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_C_DATA is
  generic (
    CREG : integer := 1;
    IS_CLK_INVERTED : bit := '0';
    IS_RSTC_INVERTED : bit := '0'
  );

  port (
    C_DATA               : out std_logic_vector(47 downto 0);
    C                    : in std_logic_vector(47 downto 0);
    CEC                  : in std_ulogic;
    CLK                  : in std_ulogic;
    RSTC                 : in std_ulogic
  );
end DSP_C_DATA;

architecture DSP_C_DATA_V of DSP_C_DATA is

  constant MODULE_NAME : string := "DSP_C_DATA";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant CREG_0 : std_ulogic := '1';
  constant CREG_1 : std_ulogic := '0';

  signal CREG_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_RSTC_INVERTED_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal C_DATA_out : std_logic_vector(47 downto 0);
 
  signal CEC_in : std_ulogic;
  signal C_in : std_logic_vector(47 downto 0);
  signal RSTC_in : std_ulogic;


  signal C_reg                : std_logic_vector(47 downto 0) := (others => '0');
  signal CLK_creg             : std_ulogic;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  C_DATA <= C_DATA_out after OUT_DELAY;
  
  CEC_in <= '0' when (CEC = 'Z') else CEC; -- rv 0
  CLK_creg  <= '0' when (CREG_BIN = CREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  C_in(0) <= '1' when (C(0) = 'Z') else C(0); -- rv 1
  C_in(1) <= '1' when (C(1) = 'Z') else C(1); -- rv 1
  C_in(10) <= '1' when (C(10) = 'Z') else C(10); -- rv 1
  C_in(11) <= '1' when (C(11) = 'Z') else C(11); -- rv 1
  C_in(12) <= '1' when (C(12) = 'Z') else C(12); -- rv 1
  C_in(13) <= '1' when (C(13) = 'Z') else C(13); -- rv 1
  C_in(14) <= '1' when (C(14) = 'Z') else C(14); -- rv 1
  C_in(15) <= '1' when (C(15) = 'Z') else C(15); -- rv 1
  C_in(16) <= '1' when (C(16) = 'Z') else C(16); -- rv 1
  C_in(17) <= '1' when (C(17) = 'Z') else C(17); -- rv 1
  C_in(18) <= '1' when (C(18) = 'Z') else C(18); -- rv 1
  C_in(19) <= '1' when (C(19) = 'Z') else C(19); -- rv 1
  C_in(2) <= '1' when (C(2) = 'Z') else C(2); -- rv 1
  C_in(20) <= '1' when (C(20) = 'Z') else C(20); -- rv 1
  C_in(21) <= '1' when (C(21) = 'Z') else C(21); -- rv 1
  C_in(22) <= '1' when (C(22) = 'Z') else C(22); -- rv 1
  C_in(23) <= '1' when (C(23) = 'Z') else C(23); -- rv 1
  C_in(24) <= '1' when (C(24) = 'Z') else C(24); -- rv 1
  C_in(25) <= '1' when (C(25) = 'Z') else C(25); -- rv 1
  C_in(26) <= '1' when (C(26) = 'Z') else C(26); -- rv 1
  C_in(27) <= '1' when (C(27) = 'Z') else C(27); -- rv 1
  C_in(28) <= '1' when (C(28) = 'Z') else C(28); -- rv 1
  C_in(29) <= '1' when (C(29) = 'Z') else C(29); -- rv 1
  C_in(3) <= '1' when (C(3) = 'Z') else C(3); -- rv 1
  C_in(30) <= '1' when (C(30) = 'Z') else C(30); -- rv 1
  C_in(31) <= '1' when (C(31) = 'Z') else C(31); -- rv 1
  C_in(32) <= '1' when (C(32) = 'Z') else C(32); -- rv 1
  C_in(33) <= '1' when (C(33) = 'Z') else C(33); -- rv 1
  C_in(34) <= '1' when (C(34) = 'Z') else C(34); -- rv 1
  C_in(35) <= '1' when (C(35) = 'Z') else C(35); -- rv 1
  C_in(36) <= '1' when (C(36) = 'Z') else C(36); -- rv 1
  C_in(37) <= '1' when (C(37) = 'Z') else C(37); -- rv 1
  C_in(38) <= '1' when (C(38) = 'Z') else C(38); -- rv 1
  C_in(39) <= '1' when (C(39) = 'Z') else C(39); -- rv 1
  C_in(4) <= '1' when (C(4) = 'Z') else C(4); -- rv 1
  C_in(40) <= '1' when (C(40) = 'Z') else C(40); -- rv 1
  C_in(41) <= '1' when (C(41) = 'Z') else C(41); -- rv 1
  C_in(42) <= '1' when (C(42) = 'Z') else C(42); -- rv 1
  C_in(43) <= '1' when (C(43) = 'Z') else C(43); -- rv 1
  C_in(44) <= '1' when (C(44) = 'Z') else C(44); -- rv 1
  C_in(45) <= '1' when (C(45) = 'Z') else C(45); -- rv 1
  C_in(46) <= '1' when (C(46) = 'Z') else C(46); -- rv 1
  C_in(47) <= '1' when (C(47) = 'Z') else C(47); -- rv 1
  C_in(5) <= '1' when (C(5) = 'Z') else C(5); -- rv 1
  C_in(6) <= '1' when (C(6) = 'Z') else C(6); -- rv 1
  C_in(7) <= '1' when (C(7) = 'Z') else C(7); -- rv 1
  C_in(8) <= '1' when (C(8) = 'Z') else C(8); -- rv 1
  C_in(9) <= '1' when (C(9) = 'Z') else C(9); -- rv 1
  RSTC_in <= '0' when (RSTC = 'Z') else RSTC xor IS_RSTC_INVERTED_BIN; -- rv 0
  
  CREG_BIN <= 
    CREG_1 when (CREG = 1) else
    CREG_0 when (CREG = 0) else
    CREG_1;

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_RSTC_INVERTED_BIN <= TO_X01(IS_RSTC_INVERTED);
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CREG check
  if((xil_attr_test) or
     ((CREG /= 1) and 
      (CREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-115] CREG attribute is set to "));
    Write ( Message, CREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_C_DATA_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_C_DATA_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

-- *********************************************************
-- *** Input register C with 1 level deep of register
-- *********************************************************

--  CLK_creg  <=  CLK_in  when  CREG_BIN = CREG_1  else  '0';

  process (CLK_creg) begin
    if  (glblGSR = '1') then C_reg <= (others => '0');
    elsif (rising_edge(CLK_creg)) then
      if    (RSTC_in = '1') then C_reg <= (others => '0');
      elsif (CEC_in = '1')  then C_reg <= C_in;
      end if;
    end if;
  end process;

  C_DATA_out  <=  C_reg  when  CREG_BIN = CREG_1  else  C_in;


    -- end behavioral body
  end DSP_C_DATA_V;
