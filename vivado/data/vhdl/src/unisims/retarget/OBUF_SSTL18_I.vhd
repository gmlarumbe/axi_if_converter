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
--  /   /                  Output Buffer with SSTL18_I I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_SSTL18_I.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:42 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_SSTL18_I-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_SSTL18_I is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_SSTL18_I;

architecture OBUF_SSTL18_I_V of OBUF_SSTL18_I is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "SSTL18_I"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_SSTL18_I_V;
