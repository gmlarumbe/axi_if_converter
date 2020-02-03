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
--  /   /                 User Interface to Global Clock, Reset and 3-State Controls for VIRTEX6 (Discontinue in 13.1)
-- /___/   /\     Filename : STARTUP_VIRTEX6.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 12:03:26 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.

----- CELL STARTUP_VIRTEX6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity STARTUP_VIRTEX6 is
    generic (
      PROG_USR : boolean := FALSE
    );

    port (
      CFGCLK               : out std_ulogic;
      CFGMCLK              : out std_ulogic;
      DINSPI               : out std_ulogic;
      EOS                  : out std_ulogic;
      PREQ                 : out std_ulogic;
      TCKSPI               : out std_ulogic;
      CLK                  : in std_ulogic;
      GSR                  : in std_ulogic;
      GTS                  : in std_ulogic;
      KEYCLEARB            : in std_ulogic;
      PACK                 : in std_ulogic;
      USRCCLKO             : in std_ulogic;
      USRCCLKTS            : in std_ulogic;
      USRDONEO             : in std_ulogic;
      USRDONETS            : in std_ulogic      
    );
end STARTUP_VIRTEX6;

architecture STARTUP_VIRTEX6_V of STARTUP_VIRTEX6 is
   function boolean_to_string(bool: boolean)
    return string is
    begin
      if bool then
        return "TRUE";
      else
        return "FALSE";
      end if;
    end boolean_to_string;
begin
    S7 : STARTUPE2
     generic map(
      PROG_USR => boolean_to_string(PROG_USR)
    )
     port map (
      CFGCLK  => CFGCLK,
      CFGMCLK => CFGMCLK,
      EOS => EOS,
      PREQ => PREQ,
      CLK => CLK,
      GSR => GSR,
      GTS => GTS,
      KEYCLEARB => KEYCLEARB,
      PACK => PACK,
      USRCCLKO => USRCCLKO,
      USRCCLKTS => USRCCLKTS,
      USRDONEO => USRDONEO,
      USRDONETS => USRDONETS
);
end STARTUP_VIRTEX6_V;


