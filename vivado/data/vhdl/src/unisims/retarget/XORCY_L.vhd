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
--  /   /                  XOR for Carry Logic with Local Output (Discontinue in 13.1)
-- /___/   /\     Filename : XORCY_L.vhd
-- \   \  /  \    Timestamp : Mon Oct 11 02:25:46 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/11/10 - Initial version.

----- CELL XORCY_L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity XORCY_L is
  port(
    LO : out std_ulogic;
    CI : in std_ulogic;
    LI : in std_ulogic
    );
end XORCY_L;

architecture XORCY_L_V of XORCY_L is
begin
    X0 : XORCY
     port map (
      O  => LO,
      CI => CI,
      LI => LI
);
end XORCY_L_V;


