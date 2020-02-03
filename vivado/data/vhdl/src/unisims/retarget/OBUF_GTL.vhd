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
--  /   /                  Output Buffer with GTL I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_GTL.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:08:20 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_GTL-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_GTL is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_GTL;

architecture OBUF_GTL_V of OBUF_GTL is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "GTL"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_GTL_V;
