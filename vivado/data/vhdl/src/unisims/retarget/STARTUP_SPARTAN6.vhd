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
--  /   /                 User Interface to Global Clock, Reset and 3-State Controls for SPARTAN6 (Discontinue in 13.1)
-- /___/   /\     Filename : STARTUP_SPARTAN6.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 11:53:14 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.

----- CELL STARTUP_SPARTAN6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity STARTUP_SPARTAN6 is
    port (
      CFGCLK               : out std_ulogic;
      CFGMCLK              : out std_ulogic;
      EOS                  : out std_ulogic;
      CLK                  : in std_ulogic;
      GSR                  : in std_ulogic;
      GTS                  : in std_ulogic;
      KEYCLEARB            : in std_ulogic      
    );
end STARTUP_SPARTAN6;

architecture STARTUP_SPARTAN6_V of STARTUP_SPARTAN6 is
begin
    S7 : STARTUPE2
     port map (
      CFGCLK  => CFGCLK,
      CFGMCLK => CFGMCLK,
      EOS => EOS,
      PREQ => open,
      CLK => CLK,
      GSR => GSR,
      GTS => GTS,
      KEYCLEARB => KEYCLEARB,
      PACK => '0',
      USRCCLKO => '0',
      USRCCLKTS => '0',
      USRDONEO => '0',
      USRDONETS => '0'
);
end STARTUP_SPARTAN6_V;


