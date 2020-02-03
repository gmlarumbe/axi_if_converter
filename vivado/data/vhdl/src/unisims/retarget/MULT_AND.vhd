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
--  /   /                  Fast Multiplier AND (Discontinue in 13.1)
-- /___/   /\     Filename : MULT_AND.vhd
-- \   \  /  \    Timestamp : Thu Aug  26 11:21:12 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/26/10 - Initial version.

----- CELL MULT_AND -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MULT_AND is
  port(
    LO : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic
    );
end MULT_AND;

architecture MULT_AND_V of MULT_AND is
begin
    L2 : LUT2
     generic map(
      INIT => X"8"
    )
     port map (
      O  => LO,
      I0 => I0,
      I1 => I1
);
end MULT_AND_V;


