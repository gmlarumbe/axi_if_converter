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
--  /   /                  1-input Look-Up-Table with Local Output (Discontinue in 13.1)
-- /___/   /\     Filename : LUT1_L.vhd
-- \   \  /  \    Timestamp : Tue Oct 12 2:56:08 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/25/10 - Initial version.

----- CELL LUT1_L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LUT1_L is
  generic(
    INIT : bit_vector := X"0"
    );
  port(
    LO : out std_ulogic;

    I0 : in std_ulogic
    );
end LUT1_L;

architecture LUT1_L_V of LUT1_L is
signal O_out : std_ulogic;
begin
    L1 : LUT1
     generic map(
      INIT => INIT
    )
     port map (
      O  => O_out,
      I0 => I0
);
    LO <= O_out;
end LUT1_L_V;


