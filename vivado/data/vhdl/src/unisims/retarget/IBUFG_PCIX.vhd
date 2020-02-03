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
--  /   /                  Input Clock Buffer with PCIX I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_PCIX.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:26:06 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_PCIX-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_PCIX is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_PCIX;

architecture IBUFG_PCIX_V of IBUFG_PCIX is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "PCIX"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_PCIX_V;
