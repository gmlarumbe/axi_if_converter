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
--  /   /                  5-input AND Gate (Discontinue in 13.1)
-- /___/   /\     Filename : AND5B2.vhd
-- \   \  /  \    Timestamp : Fri May 21 16:48:08 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/21/10 - Initial version.

----- CELL AND5B2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity AND5B2 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic;
    I3 : in std_ulogic;
    I4 : in std_ulogic
    );
end AND5B2;

architecture AND5B2_V of AND5B2 is
begin
    L5 : LUT5
     generic map(
      INIT => X"10000000"
    )
     port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2,
      I3 => I3,
      I4 => I4
);
end AND5B2_V;


