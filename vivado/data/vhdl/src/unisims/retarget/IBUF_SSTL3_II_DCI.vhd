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
--  /   /                  Input Buffer with SSTL3_II_DCI I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUF_SSTL3_II_DCI.vhd
-- \   \  /  \    Timestamp : Wed Jun  2 15:44:26 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUF_SSTL3_II_DCI-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUF_SSTL3_II_DCI is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUF_SSTL3_II_DCI;

architecture IBUF_SSTL3_II_DCI_V of IBUF_SSTL3_II_DCI is
begin
    I0 : IBUF
    generic map (
      IOSTANDARD => "SSTL3_II_DCI"
    )
    port map (
      O  => O,
      I => I
);

end IBUF_SSTL3_II_DCI_V;
