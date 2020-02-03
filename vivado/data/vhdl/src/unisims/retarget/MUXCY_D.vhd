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
--  /   /                  2-to-1 Multiplexer for Carry Logic with Dual Output in 13.1)
-- /___/   /\     Filename : MUXCY_D.vhd
-- \   \  /  \    Timestamp : Wed Aug 25 11:51:00 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/25/10 - Initial version.
--    11/01/12 - Connect LO to O_out

----- CELL MUXCY_D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MUXCY_D is
  port(
    LO : out std_ulogic;
    O : out std_ulogic;

    CI : in std_ulogic;
    DI : in std_ulogic;
    S : in std_ulogic
    );
end MUXCY_D;

architecture MUXCY_D_V of MUXCY_D is
signal O_out : std_ulogic;
begin
    M0 : MUXCY
     port map (
      O  => O_out,
      CI => CI,
      S => S,
      DI => DI
);
    O <= O_out;
    LO <= O_out;
end MUXCY_D_V;
