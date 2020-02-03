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
--  /   /                 User Interface to Global Clock, Reset and 3-State Controls for SPARTAN3 (Discontinue in 13.1)
-- /___/   /\     Filename : STARTUP_SPARTAN3.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 11:51:24 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.

----- CELL STARTUP_SPARTAN3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity STARTUP_SPARTAN3 is
  port(
    CLK : in std_ulogic := 'X';
    GSR : in std_ulogic := 'X';
    GTS : in std_ulogic := 'X'
    );
end STARTUP_SPARTAN3;

architecture STARTUP_SPARTAN3_V of STARTUP_SPARTAN3 is
begin
    S7 : STARTUPE2
     port map (
      CFGCLK  => open,
      CFGMCLK => open,
      EOS => open,
      PREQ => open,
      CLK => CLK,
      GSR => GSR,
      GTS => GTS,
      KEYCLEARB => '0',
      PACK => '0',
      USRCCLKO => '0',
      USRCCLKTS => '0',
      USRDONEO => '0',
      USRDONETS => '0'
);
end STARTUP_SPARTAN3_V;


