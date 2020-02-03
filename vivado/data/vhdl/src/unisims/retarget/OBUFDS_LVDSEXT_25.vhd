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
--  /   /             Differential Signaling  Buffer with LVDSEXT_25 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFDS_LVDSEXT_25.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:45:11 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFDS_LVDSEXT_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFDS_LVDSEXT_25 is
  port(
    O : out std_ulogic;

    OB : out std_ulogic;

    I : in std_ulogic
    );

end OBUFDS_LVDSEXT_25;

architecture OBUFDS_LVDSEXT_25_V of OBUFDS_LVDSEXT_25 is
begin
    O0 : OBUFDS
    generic map (
      IOSTANDARD => "LVDSEXT_25"
    )
    port map (
      O  => O,
      OB => OB,
      I => I
);

end OBUFDS_LVDSEXT_25_V;
