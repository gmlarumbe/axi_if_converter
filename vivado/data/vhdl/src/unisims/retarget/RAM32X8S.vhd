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
--  /   /                  Static Synchronous RAM 32-Deep by 8-Wide (Discontinue in 13.1)
-- /___/   /\     Filename : RAM32X8S.vhd
-- \   \  /  \    Timestamp : Thu Oct 21 10:21:20 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/21/10 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    08/23/13 - PR683925 - add invertible pin support.
-- End Revision:

----- CELL RAM32X8S-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM32X8S is
  generic (
    INIT_00 : bit_vector(31 downto 0) := X"00000000";
    INIT_01 : bit_vector(31 downto 0) := X"00000000";
    INIT_02 : bit_vector(31 downto 0) := X"00000000";
    INIT_03 : bit_vector(31 downto 0) := X"00000000";
    INIT_04 : bit_vector(31 downto 0) := X"00000000";
    INIT_05 : bit_vector(31 downto 0) := X"00000000";
    INIT_06 : bit_vector(31 downto 0) := X"00000000";
    INIT_07 : bit_vector(31 downto 0) := X"00000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    O : out std_logic_vector ( 7 downto 0);

    A0   : in std_ulogic;
    A1   : in std_ulogic;
    A2   : in std_ulogic;
    A3   : in std_ulogic;
    A4   : in std_ulogic;
    D    : in std_logic_vector ( 7 downto 0);
    WCLK : in std_ulogic;
    WE   : in std_ulogic
    );
end RAM32X8S;

architecture RAM32X8S_V of RAM32X8S is
begin
    R3_1 : RAM32X1S
    generic map (
      INIT => INIT_00,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(0),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(0),
      WCLK  => WCLK,
      WE  => WE
);
    R3_2 : RAM32X1S
    generic map (
      INIT => INIT_01,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(1),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(1),
      WCLK  => WCLK,
      WE  => WE
);
    R3_3 : RAM32X1S
    generic map (
      INIT => INIT_02,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(2),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(2),
      WCLK  => WCLK,
      WE  => WE
);
    R3_4 : RAM32X1S
    generic map (
      INIT => INIT_03,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(3),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(3),
      WCLK  => WCLK,
      WE  => WE
);
    R3_5 : RAM32X1S
    generic map (
      INIT => INIT_04,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(4),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(4),
      WCLK  => WCLK,
      WE  => WE
);
    R3_6 : RAM32X1S
    generic map (
      INIT => INIT_05,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(5),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(5),
      WCLK  => WCLK,
      WE  => WE
);
    R3_7 : RAM32X1S
    generic map (
      INIT => INIT_06,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(6),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(6),
      WCLK  => WCLK,
      WE  => WE
);
    R3_8: RAM32X1S
    generic map (
      INIT => INIT_07,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O(7),
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      D  => D(7),
      WCLK  => WCLK,
      WE  => WE
);

end RAM32X8S_V;
