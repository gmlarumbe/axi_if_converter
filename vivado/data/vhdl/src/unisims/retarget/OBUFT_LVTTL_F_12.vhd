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
--  /   /                  3-State Output Buffer with LVTTL I/O Standard FAST Slew 12 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFT_LVTTL_F_12.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:15:46 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFT_LVTTL_F_12-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFT_LVTTL_F_12 is
  port(
    O : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFT_LVTTL_F_12;

architecture OBUFT_LVTTL_F_12_V of OBUFT_LVTTL_F_12 is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "LVTTL",
      SLEW => "FAST",
      DRIVE => 12
    )
    port map (
      O  => O,
      T => T,
      I => I
);

end OBUFT_LVTTL_F_12_V;
