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
--  /   /                  Input Clock Buffer with GTLP I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_GTLP.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:25:28 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_GTLP-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_GTLP is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_GTLP;

architecture IBUFG_GTLP_V of IBUFG_GTLP is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "GTLP"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_GTLP_V;
