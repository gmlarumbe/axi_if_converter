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
--  /   /                  Output Buffer with PCIX66_3 I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_PCIX66_3.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:38 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_PCIX66_3-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_PCIX66_3 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_PCIX66_3;

architecture OBUF_PCIX66_3_V of OBUF_PCIX66_3 is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "PCIX66_3"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_PCIX66_3_V;
