-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                  Fast Carry Logic with Look Ahead
-- /___/   /\      Filename : CARRY8.vhd
-- \   \  /  \
--  \___\/\___\
-------------------------------------------------------------------------------
-- Revision
--    09/26/12 - Initial version.
--    05/13/13 - 718066 - S used in logic rather than S_in.
--    05/24/13 - Add CARRY_TYPE and CI_TOP
-- End Revision
-------------------------------------------------------------------------------

----- CELL CARRY8 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity CARRY8 is
  generic (
    CARRY_TYPE : string := "SINGLE_CY8"
  );

  port (
    CO                   : out std_logic_vector(7 downto 0);
    O                    : out std_logic_vector(7 downto 0);
    CI                   : in std_ulogic := '0';
    CI_TOP               : in std_ulogic := '0';
    DI                   : in std_logic_vector(7 downto 0) := (others => '0');
    S                    : in std_logic_vector(7 downto 0) := (others => '0')
  );
end CARRY8;

architecture CARRY8_V of CARRY8 is

  constant MODULE_NAME : string := "CARRY8";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant CARRY_TYPE_DUAL_CY4 : std_ulogic := '1';
  constant CARRY_TYPE_SINGLE_CY8 : std_ulogic := '0';

  signal CARRY_TYPE_BIN : std_ulogic;

  signal glblGSR      : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal attr_err     : std_ulogic := '0';

  signal CO_out : std_logic_vector(7 downto 0);
  signal O_out  : std_logic_vector(7 downto 0);

  signal CI_TOP_in : std_ulogic;
  signal CI_in : std_ulogic;
  signal DI_in : std_logic_vector(7 downto 0);
  signal S_in  : std_logic_vector(7 downto 0);

  signal CI_TOP_mux : std_ulogic;

begin
  glblGSR     <= TO_X01(GSR);
  CO <= CO_out after OUT_DELAY;
  O <= O_out after OUT_DELAY;
  
  CI_TOP_in <= '0' when (CI_TOP = 'Z') else CI_TOP;
  CI_in <= '0' when (CI = 'Z') else CI;
  DI_in(7) <= '0' when (DI(7) = 'Z') else DI(7);
  DI_in(6) <= '0' when (DI(6) = 'Z') else DI(6);
  DI_in(5) <= '0' when (DI(5) = 'Z') else DI(5);
  DI_in(4) <= '0' when (DI(4) = 'Z') else DI(4);
  DI_in(3) <= '0' when (DI(3) = 'Z') else DI(3);
  DI_in(2) <= '0' when (DI(2) = 'Z') else DI(2);
  DI_in(1) <= '0' when (DI(1) = 'Z') else DI(1);
  DI_in(0) <= '0' when (DI(0) = 'Z') else DI(0);
  S_in(7) <= '0' when (S(7) = 'Z') else S(7);
  S_in(6) <= '0' when (S(6) = 'Z') else S(6);
  S_in(5) <= '0' when (S(5) = 'Z') else S(5);
  S_in(4) <= '0' when (S(4) = 'Z') else S(4);
  S_in(3) <= '0' when (S(3) = 'Z') else S(3);
  S_in(2) <= '0' when (S(2) = 'Z') else S(2);
  S_in(1) <= '0' when (S(1) = 'Z') else S(1);
  S_in(0) <= '0' when (S(0) = 'Z') else S(0);
  
  CARRY_TYPE_BIN <= 
    CARRY_TYPE_SINGLE_CY8 when (CARRY_TYPE = "SINGLE_CY8") else
    CARRY_TYPE_DUAL_CY4 when (CARRY_TYPE = "DUAL_CY4") else
    CARRY_TYPE_SINGLE_CY8;

 INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
-------- CARRY_TYPE check
  if((xil_attr_test) or
     ((CARRY_TYPE /= "SINGLE_CY8") and 
      (CARRY_TYPE /= "DUAL_CY4"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] CARRY_TYPE attribute is set to """));
    Write ( Message, string'(CARRY_TYPE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""SINGLE_CY8"" or "));
    Write ( Message, string'("""DUAL_CY4"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(CARRY8_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-102] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(CARRY8_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
  wait;
  end process INIPROC;

  CI_TOP_mux <= CI_TOP_in when CARRY_TYPE_BIN = CARRY_TYPE_DUAL_CY4 else CO_out(3);
  O_out     <= S_in xor ( CO_out(6 downto 4) & CI_TOP_mux & CO_out(2 downto 0) & CI_in );
  CO_out(0) <= CI_in     when S_in(0) = '1' else DI_in(0) when S_in(0) = '0' else 'X'; 
  CO_out(1) <= CO_out(0) when S_in(1) = '1' else DI_in(1) when S_in(1) = '0' else 'X'; 
  CO_out(2) <= CO_out(1) when S_in(2) = '1' else DI_in(2) when S_in(2) = '0' else 'X'; 
  CO_out(3) <= CO_out(2) when S_in(3) = '1' else DI_in(3) when S_in(3) = '0' else 'X'; 
  CO_out(4) <= CI_TOP_mux when S_in(4) = '1' else DI_in(4) when S_in(4) = '0' else 'X'; 
  CO_out(5) <= CO_out(4) when S_in(5) = '1' else DI_in(5) when S_in(5) = '0' else 'X'; 
  CO_out(6) <= CO_out(5) when S_in(6) = '1' else DI_in(6) when S_in(6) = '0' else 'X'; 
  CO_out(7) <= CO_out(6) when S_in(7) = '1' else DI_in(7) when S_in(7) = '0' else 'X'; 

end CARRY8_V;
