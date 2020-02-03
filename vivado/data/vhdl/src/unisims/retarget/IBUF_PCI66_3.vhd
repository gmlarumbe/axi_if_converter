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
--  /   /                  Input Buffer with PCI66_3 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUF_PCI66_3.vhd
-- \   \  /  \    Timestamp : Wed Jun  2 15:44:17 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUF_PCI66_3-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUF_PCI66_3 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUF_PCI66_3;

architecture IBUF_PCI66_3_V of IBUF_PCI66_3 is
begin
    I0 : IBUF
    generic map (
      IOSTANDARD => "PCI66_3"
    )
    port map (
      O  => O,
      I => I
);

end IBUF_PCI66_3_V;
