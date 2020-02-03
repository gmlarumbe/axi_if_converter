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
--  /   /                  Input Clock Buffer with LVDS I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_LVDS.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:26:01 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_LVDS-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_LVDS is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_LVDS;

architecture IBUFG_LVDS_V of IBUFG_LVDS is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "LVDS"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_LVDS_V;
