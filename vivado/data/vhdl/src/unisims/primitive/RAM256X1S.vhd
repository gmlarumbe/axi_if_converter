-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Synchronous RAM 256-Deep by 1-Wide
-- /___/   /\     Filename : RAM256X1S.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:49 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/15/05 - Initial version.
--    09/21/05 - Use SLV_TO_INT to decode the address. (CR 217651)
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/18/13 - PR683925 - add invertible pin support.
--    04/22/13 - 714506 - A_in in process sensitivty list.
-- End Revision

----- CELL RAM256X1S -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAM256X1S is
  generic (
    INIT : bit_vector(255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    O : out std_ulogic;

    A     : in std_logic_vector(7 downto 0);
    D     : in std_ulogic;
    WCLK  : in std_ulogic;
    WE    : in std_ulogic
    );
end RAM256X1S;

architecture RAM256X1S_V of RAM256X1S is
  signal MEM     : std_ulogic_vector( 256 downto 0 ) :=  ('X' & TO_STDULOGICVECTOR(INIT));
  signal WCLK_in : std_ulogic;
  signal A_in    : std_logic_vector(7 downto 0);
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
    variable Index   : integer := 256;

  begin
    Index   := SLV_TO_INT(SLV => A_in);
    O <= MEM(Index);      
  end process ReadBehavior;

  WriteBehavior : process(WCLK_in)
    variable Index   : integer := 256;
  begin
    Index                  := SLV_TO_INT(SLV => A_in);
    if ((WE_in = '1') and (WCLK_in'event) and (WCLK_in'last_value = '0') and (WCLK_in = '1')) then
        MEM(Index) <= D_in after 100 ps;
    end if;
  end process WriteBehavior;

end RAM256X1S_V;


