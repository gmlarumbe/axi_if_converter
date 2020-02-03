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
--  /   /                  Output Buffer with HSTL_II I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_HSTL_II.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:08:26 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_HSTL_II-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_HSTL_II is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_HSTL_II;

architecture OBUF_HSTL_II_V of OBUF_HSTL_II is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "HSTL_II"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_HSTL_II_V;
