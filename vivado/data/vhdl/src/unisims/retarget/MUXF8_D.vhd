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
--  /   /                  2-to-1 Lookup Table Multiplexer with Dual Output (Discontinue in 13.1)
-- /___/   /\     Filename : MUXF8_D.vhd
-- \   \  /  \    Timestamp : Wed Aug 25 02:57:36 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/25/10 - Initial version.

----- CELL MUXF8_D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MUXF8_D is
  port(
    LO : out std_ulogic;
    O  : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    S : in std_ulogic
    );
end MUXF8_D;

architecture MUXF8_D_V of MUXF8_D is
signal O_out : std_ulogic;
begin
    M8 : MUXF8
     port map (
      O  => O_out,
      I0 => I0,
      I1 => I1,
      S => S
);
    O <= O_out;
    LO <= O_out;
end MUXF8_D_V;


