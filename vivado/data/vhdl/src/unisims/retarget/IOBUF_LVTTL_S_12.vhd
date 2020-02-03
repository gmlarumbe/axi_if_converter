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
--  /   /                  Bi-Directional Buffer with LVTTL I/O Standard SLOW Slew 12 ma Drive  (Discontinue in 13.1)
-- /___/   /\     Filename : IOBUF_LVTTL_S_12.vhd
-- \   \  /  \    Timestamp : Thu Aug  5 16:22:26 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IOBUF_LVTTL_S_12-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IOBUF_LVTTL_S_12 is
  port(
    O : out std_ulogic;

    IO : inout std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end IOBUF_LVTTL_S_12;

architecture IOBUF_LVTTL_S_12_V of IOBUF_LVTTL_S_12 is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "LVTTL",
      SLEW => "SLOW",
      DRIVE => 12
    )
    port map (
      O  => IO,
      T  => T,
      I => I
);
    I0 : IBUF
    generic map (
      IOSTANDARD => "LVTTL"
    )
    port map (
      O  => O,
      I => IO
);

end IOBUF_LVTTL_S_12_V;
