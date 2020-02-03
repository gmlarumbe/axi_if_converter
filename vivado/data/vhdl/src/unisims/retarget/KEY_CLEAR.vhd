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
-- /___/   /\     Filename : KEY_CLEAR.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 12:06:36 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.

----- CELL KEY_CLEAR -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity KEY_CLEAR is
  port(
      KEYCLEARB            : in std_ulogic
    );

end KEY_CLEAR;

architecture KEY_CLEAR_V of KEY_CLEAR is
begin
    S7 : STARTUPE2
     port map (
      CFGCLK  => open,
      CFGMCLK => open,
      EOS => open,
      PREQ => open,
      CLK => '0',
      GSR => '0',
      GTS => '0',
      KEYCLEARB => KEYCLEARB,
      PACK => '0',
      USRCCLKO => '0',
      USRCCLKTS => '0',
      USRDONEO => '0',
      USRDONETS => '0'
);
end KEY_CLEAR_V;


