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
--  /   /                  Input Buffer with GTLP I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUF_GTLP.vhd
-- \   \  /  \    Timestamp : Wed Jun  2 15:43:49 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUF_GTLP-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUF_GTLP is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUF_GTLP;

architecture IBUF_GTLP_V of IBUF_GTLP is
begin
    I0 : IBUF
    generic map (
      IOSTANDARD => "GTLP"
    )
    port map (
      O  => O,
      I => I
);

end IBUF_GTLP_V;
