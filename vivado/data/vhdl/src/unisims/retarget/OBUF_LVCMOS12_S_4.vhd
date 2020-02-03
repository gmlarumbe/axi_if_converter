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
--  /   /                  Output Buffer with LVCMOS12 I/O Standard SLOW Slew 4 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_LVCMOS12_S_4.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:08:38 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_LVCMOS12_S_4-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_LVCMOS12_S_4 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_LVCMOS12_S_4;

architecture OBUF_LVCMOS12_S_4_V of OBUF_LVCMOS12_S_4 is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "LVCMOS12",
      SLEW => "SLOW",
      DRIVE => 4
    )
    port map (
      O  => O,
      I => I
);

end OBUF_LVCMOS12_S_4_V;
