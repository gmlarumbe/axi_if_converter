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
--  /   /                  256-Deep by 1-Wide ROM (Discontinue in 13.1)
-- /___/   /\     Filename : ROM256X1.vhd
-- \   \  /  \    Timestamp : Fri Oct  15 11:27:30 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.
--    09/28/11 - 627074 - Fixed INIT load error
-- End Revision

----- CELL ROM256X1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ROM256X1 is
  generic (
    INIT : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );

  port (
    O : out std_ulogic;

    A0 : in std_ulogic;
    A1 : in std_ulogic;
    A2 : in std_ulogic;
    A3 : in std_ulogic;
    A4 : in std_ulogic;
    A5 : in std_ulogic;
    A6 : in std_ulogic;
    A7 : in std_ulogic
    );
end ROM256X1;

architecture ROM256X1_V of ROM256X1 is
signal O1, O2, O3, O4, O5, O6 : std_ulogic;
begin
    L6_0 : LUT6
    generic map (
      INIT => INIT(192 to 255)
    )
    port map (
      O  => O1,
      I0  => A0,
      I1  => A1,
      I2  => A2,
      I3  => A3,
      I4  => A4,
      I5  => A5
);
    L6_1 : LUT6
    generic map (
      INIT => INIT(128 to 191)
    )
    port map (
      O  => O2,
      I0  => A0,
      I1  => A1,
      I2  => A2,
      I3  => A3,
      I4  => A4,
      I5  => A5
);
    M7_0 : MUXF7
    port map (
      O  => O5,
      I0  => O1,
      I1  => O2,
      S => A6
);
    L6_2 : LUT6
    generic map (
      INIT => INIT(64 to 127)
    )
    port map (
      O  => O3,
      I0  => A0,
      I1  => A1,
      I2  => A2,
      I3  => A3,
      I4  => A4,
      I5  => A5
);
    L6_3 : LUT6
    generic map (
      INIT => INIT(0 to 63)
    )
    port map (
      O  => O4,
      I0  => A0,
      I1  => A1,
      I2  => A2,
      I3  => A3,
      I4  => A4,
      I5  => A5
);
    M7_1 : MUXF7
    port map (
      O  => O6,
      I0  => O3,
      I1  => O4,
      S => A6
);
    M8 : MUXF8
    port map (
      O  => O,
      I0  => O5,
      I1  => O6,
      S => A7
);
end ROM256X1_V;
