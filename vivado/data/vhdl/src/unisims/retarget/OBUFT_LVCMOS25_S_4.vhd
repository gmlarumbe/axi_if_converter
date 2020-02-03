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
--  /   /                  3-State Output Buffer with LVCMOS25 I/O Standard SLOW Slew 4 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFT_LVCMOS25_S_4.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:15:30 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFT_LVCMOS25_S_4-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFT_LVCMOS25_S_4 is
  port(
    O : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFT_LVCMOS25_S_4;

architecture OBUFT_LVCMOS25_S_4_V of OBUFT_LVCMOS25_S_4 is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "LVCMOS25",
      SLEW => "SLOW",
      DRIVE => 4
    )
    port map (
      O  => O,
      T => T,
      I => I
);

end OBUFT_LVCMOS25_S_4_V;
