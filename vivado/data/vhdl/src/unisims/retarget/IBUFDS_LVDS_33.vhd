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
--  /   /             Differential Signaling  Input Buffer with LVDS_33 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFDS_LVDS_33.vhd
-- \   \  /  \    Timestamp : Tue Aug  3 16:07:42 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFDS_LVDS_33-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFDS_LVDS_33 is
  port(
    O : out std_ulogic;

    IB : in std_ulogic;

    I : in std_ulogic
    );

end IBUFDS_LVDS_33;

architecture IBUFDS_LVDS_33_V of IBUFDS_LVDS_33 is
begin
    I4 : IBUFDS
    generic map (
      IOSTANDARD => "LVDS_33"
    )
    port map (
      O  => O,
      IB => IB,
      I => I
);

end IBUFDS_LVDS_33_V;
