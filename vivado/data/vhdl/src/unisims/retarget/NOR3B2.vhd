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
--  /   /                  3-input NOR Gate (Discontinue in 13.1)
-- /___/   /\     Filename : NOR3B2.vhd
-- \   \  /  \    Timestamp : Mon May 24 15:11:49 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/24/10 - Initial version.

----- CELL NOR3B2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity NOR3B2 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic
    );
end NOR3B2;

architecture NOR3B2_V of NOR3B2 is
begin
    L3 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2
);
end NOR3B2_V;
