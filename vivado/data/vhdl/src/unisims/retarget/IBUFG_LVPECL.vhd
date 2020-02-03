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
--  /   /                  Input Clock Buffer with LVPECL I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_LVPECL.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:26:02 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_LVPECL-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_LVPECL is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_LVPECL;

architecture IBUFG_LVPECL_V of IBUFG_LVPECL is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "LVPECL"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_LVPECL_V;
