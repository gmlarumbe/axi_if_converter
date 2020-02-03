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
--  /   /                  128-Deep by 1-Wide ROM (Discontinue in 13.1)
-- /___/   /\     Filename : ROM128X1.vhd
-- \   \  /  \    Timestamp : Fri Oct  15 11:12:21 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.
--    09/28/11 - 627074 - Fixed INIT load error
-- End Revision

----- CELL ROM128X1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ROM128X1 is
  generic (
    INIT : bit_vector := X"00000000000000000000000000000000"
    );

  port (
    O : out std_ulogic;

    A0 : in std_ulogic;
    A1 : in std_ulogic;
    A2 : in std_ulogic;
    A3 : in std_ulogic;
    A4 : in std_ulogic;
    A5 : in std_ulogic;
    A6 : in std_ulogic
    );
end ROM128X1;

architecture ROM128X1_V of ROM128X1 is
signal O1, O2 : std_ulogic;
begin
    L6_0 : LUT6
    generic map (
      INIT => INIT(64 to 127)
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
      INIT => INIT(0 to 63)
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
    M7 : MUXF7
    port map (
      O  => O,
      I0  => O1,
      I1  => O2,
      S => A6
);

end ROM128X1_V;
