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
--  /   /                  Output Buffer with PCIX I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_PCIX.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:37 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_PCIX-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_PCIX is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_PCIX;

architecture OBUF_PCIX_V of OBUF_PCIX is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "PCIX"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_PCIX_V;
