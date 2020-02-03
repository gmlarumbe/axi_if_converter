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
--  /   /                  6-input Look-Up-Table with Dual Output (Discontinue in 13.1)
-- /___/   /\     Filename : LUT6_D.vhd
-- \   \  /  \    Timestamp : Tue Oct 12 5:30:59 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/25/10 - Initial version.

----- CELL LUT6_D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LUT6_D is
  generic(
    INIT : bit_vector := X"0000000000000000"
    );
  port(
    LO : out std_ulogic;
    O  : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic;
    I3 : in std_ulogic;
    I4 : in std_ulogic;
    I5 : in std_ulogic
    );
end LUT6_D;

architecture LUT6_D_V of LUT6_D is
signal O_out : std_ulogic;
begin
    L6 : LUT6
     generic map(
      INIT => INIT
    )
     port map (
      O  => O_out,
      I0 => I0,
      I1 => I1,
      I2 => I2,
      I3 => I3,
      I4 => I4,
      I5 => I5
);
    O <= O_out;
    LO <= O_out;
end LUT6_D_V;


