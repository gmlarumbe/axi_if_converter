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
--  /   /                  Bi-Directional Buffer with LVCMOS15 I/O Standard FAST Slew 8 ma Drive  (Discontinue in 13.1)
-- /___/   /\     Filename : IOBUF_LVCMOS15_F_8.vhd
-- \   \  /  \    Timestamp : Thu Aug  5 16:19:21 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IOBUF_LVCMOS15_F_8-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IOBUF_LVCMOS15_F_8 is
  port(
    O : out std_ulogic;

    IO : inout std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end IOBUF_LVCMOS15_F_8;

architecture IOBUF_LVCMOS15_F_8_V of IOBUF_LVCMOS15_F_8 is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "LVCMOS15",
      SLEW => "FAST",
      DRIVE => 8
    )
    port map (
      O  => IO,
      T  => T,
      I => I
);
    I0 : IBUF
    generic map (
      IOSTANDARD => "LVCMOS15"
    )
    port map (
      O  => O,
      I => IO
);

end IOBUF_LVCMOS15_F_8_V;
