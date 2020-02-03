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
--  /   /                  3-input Look-Up-Table with Local Output (Discontinue in 13.1)
-- /___/   /\     Filename : LUT3_L.vhd
-- \   \  /  \    Timestamp : Tue Oct 12 4:09:36 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/25/10 - Initial version.

----- CELL LUT3_L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LUT3_L is
  generic(
    INIT : bit_vector := X"00"
    );
  port(
    LO : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic
    );
end LUT3_L;

architecture LUT3_L_V of LUT3_L is
signal O_out : std_ulogic;
begin
    L3 : LUT3
     generic map(
      INIT => INIT
    )
     port map (
      O  => O_out,
      I0 => I0,
      I1 => I1,
      I2 => I2
);
    LO <= O_out;
end LUT3_L_V;


