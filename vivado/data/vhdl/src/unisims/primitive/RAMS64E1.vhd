-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2016.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                       Static Dual Port Synchronous RAM 64-Deep by 1-Wide
-- /___/   /\     Filename    : RAMS64E1.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision:
-- End Revision
-------------------------------------------------------------------------------

----- CELL RAMS64E1 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAMS64E1 is
  generic (
    INIT : std_logic_vector(63 downto 0) := X"0000000000000000";
    IS_CLK_INVERTED : bit := '0';
    RAM_ADDRESS_MASK : std_logic_vector (2 downto 0) := "000";
    RAM_ADDRESS_SPACE : std_logic_vector (2 downto 0) := "000"
    );

  port (
    O : out std_ulogic;
    ADR0 : in std_ulogic;
    ADR1 : in std_ulogic;
    ADR2 : in std_ulogic;
    ADR3 : in std_ulogic;
    ADR4 : in std_ulogic;
    ADR5 : in std_ulogic;
    CLK   : in std_ulogic;
    I     : in std_ulogic;
    WADR6 : in std_ulogic;
    WADR7 : in std_ulogic;
    WADR8 : in std_ulogic;
    WE    : in std_ulogic
    );
end RAMS64E1;

architecture RAMS64E1_V of RAMS64E1 is

  constant MODULE_NAME : string := "RAMS64E1";

begin
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists which is also not supported in VHDL. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(RAMS64E1_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-100] Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RAMS64E1_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
  
end RAMS64E1_V;
