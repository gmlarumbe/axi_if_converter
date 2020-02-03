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
--  /   /                  XOR for Carry Logic with Dual Output (Discontinue in 13.1)
-- /___/   /\     Filename : XORCY_D.vhd
-- \   \  /  \    Timestamp : Mon Oct 11 02:20:36 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/11/10 - Initial version.

----- CELL XORCY_D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity XORCY_D is
  port(
    LO : out std_ulogic;
    O  : out std_ulogic;

    CI : in std_ulogic;
    LI : in std_ulogic
    );
end XORCY_D;

architecture XORCY_D_V of XORCY_D is
signal O_out : std_ulogic;
begin
    X0 : XORCY
     port map (
      O  => O_out,
      CI => CI,
      LI => LI
);
    O <= O_out;
    LO <= O_out;
end XORCY_D_V;


