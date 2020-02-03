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
--  /   /                  Output Buffer with LVDCI_DV2_25 I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_LVDCI_DV2_25.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:18 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_LVDCI_DV2_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_LVDCI_DV2_25 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_LVDCI_DV2_25;

architecture OBUF_LVDCI_DV2_25_V of OBUF_LVDCI_DV2_25 is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "LVDCI_DV2_25"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_LVDCI_DV2_25_V;