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
--  /   /                  XOR for Carry Logic with Local Output in 13.1)
-- /___/   /\     Filename : MUXCY_L.vhd
-- \   \  /  \    Timestamp : Wed Aug 25 11:51:00 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/25/10 - Initial version.

----- CELL MUXCY_L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MUXCY_L is
  port(
    LO : out std_ulogic;

    CI : in std_ulogic;
    DI : in std_ulogic;
    S : in std_ulogic
    );
end MUXCY_L;

architecture MUXCY_L_V of MUXCY_L is
begin
    M0 : MUXCY
     port map (
      O  => LO,
      CI => CI,
      S => S,
      DI => DI
);
end MUXCY_L_V;


