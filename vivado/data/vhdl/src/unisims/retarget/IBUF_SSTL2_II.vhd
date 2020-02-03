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
--  /   /                  Input Buffer with SSTL2_II I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUF_SSTL2_II.vhd
-- \   \  /  \    Timestamp : Wed Jun  2 15:44:24 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUF_SSTL2_II-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUF_SSTL2_II is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUF_SSTL2_II;

architecture IBUF_SSTL2_II_V of IBUF_SSTL2_II is
begin
    I0 : IBUF
    generic map (
      IOSTANDARD => "SSTL2_II"
    )
    port map (
      O  => O,
      I => I
);

end IBUF_SSTL2_II_V;
