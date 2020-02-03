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
--  /   /                  Output Buffer with SSTL2_II I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_SSTL2_II.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:46 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_SSTL2_II-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_SSTL2_II is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_SSTL2_II;

architecture OBUF_SSTL2_II_V of OBUF_SSTL2_II is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "SSTL2_II"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_SSTL2_II_V;
