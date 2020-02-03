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
--  /   /                  Output Buffer with LVCMOS33 I/O Standard FAST Slew 12 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_LVCMOS33_F_12.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:04 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_LVCMOS33_F_12-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_LVCMOS33_F_12 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_LVCMOS33_F_12;

architecture OBUF_LVCMOS33_F_12_V of OBUF_LVCMOS33_F_12 is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "LVCMOS33",
      SLEW => "FAST",
      DRIVE => 12
    )
    port map (
      O  => O,
      I => I
);

end OBUF_LVCMOS33_F_12_V;
