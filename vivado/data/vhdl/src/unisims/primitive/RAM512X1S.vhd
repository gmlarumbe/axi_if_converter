-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 2012.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Synchronous RAM 512-Deep by 1-Wide
-- /___/   /\     Filename : RAM512X1S.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    07/02/12 - Initial version, from RAM2561S
--    09/17/12 - 678604 fix compilation error, 678488 fix file name
--    04/29/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM512X1S -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAM512X1S is
  generic (
    INIT : std_logic_vector(511 downto 0) := X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    O : out std_ulogic;

    A     : in std_logic_vector(8 downto 0);
    D     : in std_ulogic;
    WCLK  : in std_ulogic;
    WE    : in std_ulogic
    );
end RAM512X1S;

architecture RAM512X1S_V of RAM512X1S is
  signal MEM : std_logic_vector( 511 downto 0 ) := INIT;
  signal WCLK_in : std_ulogic;
  signal A_in    : std_logic_vector(8 downto 0);
  signal D_in    : std_ulogic;
  signal WE_in   : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin

  WCLK_in <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in   <= WE;
  A_in    <= A;
  D_in    <= D;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  ReadBehavior  : process(A_in, MEM)
    variable Index   : integer := 511;
  begin
    Index   := SLV_TO_INT(SLV => A_in);
    O <= MEM(Index);      
  end process ReadBehavior;

  WriteBehavior : process(WCLK_in)
    variable Index   : integer := 511;
  begin
    Index                  := SLV_TO_INT(SLV => A_in);
    if ((WE_in = '1') and rising_edge(WCLK_in)) then
        MEM(Index) <= D_in after 100 ps;
    end if;
  end process WriteBehavior;

end RAM512X1S_V;
