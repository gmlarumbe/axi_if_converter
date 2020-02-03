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
--  /   /                  64-Deep by 1-Wide ROM (Discontinue in 13.1)
-- /___/   /\     Filename : ROM64X1.vhd
-- \   \  /  \    Timestamp : Fri Oct  15 11:40:35 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.

----- CELL ROM64X1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ROM64X1 is
  generic (
    INIT : bit_vector := X"0000000000000000"
    );

  port (
    O : out std_ulogic;

    A0 : in std_ulogic;
    A1 : in std_ulogic;
    A2 : in std_ulogic;
    A3 : in std_ulogic;
    A4 : in std_ulogic;
    A5 : in std_ulogic
    );
end ROM64X1;

architecture ROM64X1_V of ROM64X1 is
begin
    L6 : LUT6
    generic map (
      INIT => INIT
    )
    port map (
      O  => O,
      I0  => A0,
      I1  => A1,
      I2  => A2,
      I3  => A3,
      I4  => A4,
      I5  => A5
);
end ROM64X1_V;
