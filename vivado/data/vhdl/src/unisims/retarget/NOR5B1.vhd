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
--  /   /                  5-input NOR Gate (Discontinue in 13.1)
-- /___/   /\     Filename : NOR5B1.vhd
-- \   \  /  \    Timestamp : Mon May 24 16:07:25 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/24/10 - Initial version.

----- CELL NOR5B1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity NOR5B1 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic;
    I3 : in std_ulogic;
    I4 : in std_ulogic
    );
end NOR5B1;

architecture NOR5B1_V of NOR5B1 is
begin
    L5 : LUT5
    generic map(
      INIT => X"00000002"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2,
      I3 => I3,
      I4 => I4
);
end NOR5B1_V;
