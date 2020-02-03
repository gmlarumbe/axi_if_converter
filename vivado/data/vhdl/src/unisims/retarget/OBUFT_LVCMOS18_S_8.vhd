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
--  /   /                  3-State Output Buffer with LVCMOS18 I/O Standard SLOW Slew 8 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFT_LVCMOS18_S_8.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:15:21 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFT_LVCMOS18_S_8-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFT_LVCMOS18_S_8 is
  port(
    O : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFT_LVCMOS18_S_8;

architecture OBUFT_LVCMOS18_S_8_V of OBUFT_LVCMOS18_S_8 is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "LVCMOS18",
      SLEW => "SLOW",
      DRIVE => 8
    )
    port map (
      O  => O,
      T => T,
      I => I
);

end OBUFT_LVCMOS18_S_8_V;
