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
--  /   /                  Input Clock Buffer with PCI66_3 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_PCI66_3.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:26:05 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_PCI66_3-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_PCI66_3 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_PCI66_3;

architecture IBUFG_PCI66_3_V of IBUFG_PCI66_3 is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "PCI66_3"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_PCI66_3_V;
