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
--  /   /                 User Interface to Global Clock, Reset and 3-State Controls for VIRTEX5 (Discontinue in 13.1)
-- /___/   /\     Filename : STARTUP_VIRTEX5.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 12:01:11 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.

----- CELL STARTUP_VIRTEX5 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity STARTUP_VIRTEX5 is
  port(
    CFGCLK	: out std_ulogic;
    CFGMCLK	: out std_ulogic;
    DINSPI	: out std_ulogic;
    EOS		: out std_ulogic;
    TCKSPI	: out std_ulogic;

    CLK		: in std_ulogic := 'X';
    GSR		: in std_ulogic := 'X';
    GTS		: in std_ulogic := 'X';
    USRCCLKO	: in std_ulogic := 'X';
    USRCCLKTS	: in std_ulogic := 'X';
    USRDONEO	: in std_ulogic := 'X';
    USRDONETS	: in std_ulogic := 'X'
    );
end STARTUP_VIRTEX5;

architecture STARTUP_VIRTEX5_V of STARTUP_VIRTEX5 is
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
      KEYCLEARB => '0',
      PACK => '0',
      USRCCLKO => USRCCLKO,
      USRCCLKTS => USRCCLKTS,
      USRDONEO => USRDONEO,
      USRDONETS => USRDONETS
);
end STARTUP_VIRTEX5_V;


