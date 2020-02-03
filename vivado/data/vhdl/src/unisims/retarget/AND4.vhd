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
--  /   /                  4-input AND Gate (Discontinue in 13.1)
-- /___/   /\     Filename : AND4.vhd
-- \   \  /  \    Timestamp : Fri May 21 16:35:48 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/21/10 - Initial version.

----- CELL AND4 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity AND4 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic;
    I3 : in std_ulogic
    );
end AND4;

architecture AND4_V of AND4 is
begin
    L4 : LUT4
     generic map(
      INIT => X"8000"
    )
     port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2,
      I3 => I3
);
end AND4_V;


