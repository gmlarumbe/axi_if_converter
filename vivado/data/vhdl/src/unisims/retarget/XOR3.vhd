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
--  /   /                  3-input XOR Gate (Discontinue in 13.1)
-- /___/   /\     Filename : XOR3.vhd
-- \   \  /  \    Timestamp : Mon May 24 16:20:41 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/24/10 - Initial version.

----- CELL XOR3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity XOR3 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic
    );
end XOR3;

architecture XOR3_V of XOR3 is
begin
    L3 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2
);
end XOR3_V;
