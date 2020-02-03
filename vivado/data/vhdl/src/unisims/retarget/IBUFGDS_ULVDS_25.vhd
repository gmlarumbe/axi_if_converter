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
--  /   /             Differential Signaling  Input Clock Buffer with ULVDS_25 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFGDS_ULVDS_25.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 12:55:07 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFGDS_ULVDS_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFGDS_ULVDS_25 is
  port(
    O : out std_ulogic;

    IB : in std_ulogic;

    I : in std_ulogic
    );

end IBUFGDS_ULVDS_25;

architecture IBUFGDS_ULVDS_25_V of IBUFGDS_ULVDS_25 is
begin
    I2 : IBUFGDS
    generic map (
      IOSTANDARD => "ULVDS_25"
    )
    port map (
      O  => O,
      IB => IB,
      I => I
);

end IBUFGDS_ULVDS_25_V;
