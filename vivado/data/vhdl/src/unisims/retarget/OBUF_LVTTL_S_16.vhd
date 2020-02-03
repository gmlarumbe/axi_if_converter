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
--  /   /                  Output Buffer with LVTTL I/O Standard SLOW Slew 16 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_LVTTL_S_16.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:28 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_LVTTL_S_16-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_LVTTL_S_16 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_LVTTL_S_16;

architecture OBUF_LVTTL_S_16_V of OBUF_LVTTL_S_16 is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "LVTTL",
      SLEW => "SLOW",
      DRIVE => 16
    )
    port map (
      O  => O,
      I => I
);

end OBUF_LVTTL_S_16_V;
