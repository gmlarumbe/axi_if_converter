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
--  /   /                  2-input AND Gate (Discontinue in 13.1)
-- /___/   /\     Filename : AND2B1.vhd
-- \   \  /  \    Timestamp : Fri May 21 12:35:15 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/20/10 - Initial version.

----- CELL AND2B1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity AND2B1 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic
    );
end AND2B1;

architecture AND2B1_V of AND2B1 is
begin
    L2 : LUT2
     generic map(
      INIT => X"4"
    )
     port map (
      O  => O,
      I0 => I0,
      I1 => I1
);
end AND2B1_V;


