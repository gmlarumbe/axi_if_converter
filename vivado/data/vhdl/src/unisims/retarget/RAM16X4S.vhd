-- $Header:  $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Synchronous RAM 16-Deep by 4-Wide (Discontinue in 13.1)
-- /___/   /\     Filename : RAM16X4S.vhd
-- \   \  /  \    Timestamp : Wed Oct 20 04:34:22 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/20/10 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    08/23/13 - PR683925 - add invertible pin support.
-- End Revision:

----- CELL RAM16X4S-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM16X4S is
  generic (
    INIT_00 : bit_vector(15 downto 0) := X"0000";
    INIT_01 : bit_vector(15 downto 0) := X"0000";
    INIT_02 : bit_vector(15 downto 0) := X"0000";
    INIT_03 : bit_vector(15 downto 0) := X"0000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    O0 : out std_ulogic;
    O1 : out std_ulogic;
    O2 : out std_ulogic;
    O3 : out std_ulogic;

    A0   : in std_ulogic;
    A1   : in std_ulogic;
    A2   : in std_ulogic;
    A3   : in std_ulogic;
    D0   : in std_ulogic;
    D1   : in std_ulogic;
    D2   : in std_ulogic;
    D3   : in std_ulogic;
    WCLK : in std_ulogic;
    WE   : in std_ulogic
    );
end RAM16X4S;

architecture RAM16X4S_V of RAM16X4S is
begin
    R3_1 : RAM32X1S
    generic map (
      INIT => X"0000" & INIT_00(15 downto 0),
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O0,
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => '0',
      D  => D0,
      WCLK  => WCLK,
      WE  => WE
);
    R3_2 : RAM32X1S
    generic map (
      INIT => X"0000" & INIT_01(15 downto 0),
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O1,
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => '0',
      D  => D1,
      WCLK  => WCLK,
      WE  => WE
);
    R3_3 : RAM32X1S
    generic map (
      INIT => X"0000" & INIT_02(15 downto 0),
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O2,
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => '0',
      D  => D2,
      WCLK  => WCLK,
      WE  => WE
);
    R3_4 : RAM32X1S
    generic map (
      INIT => X"0000" & INIT_03(15 downto 0),
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O3,
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => '0',
      D  => D3,
      WCLK  => WCLK,
      WE  => WE
);

end RAM16X4S_V;
