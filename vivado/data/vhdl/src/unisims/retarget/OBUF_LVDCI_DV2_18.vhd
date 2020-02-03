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
--  /   /                  Output Buffer with LVDCI_DV2_18 I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_LVDCI_DV2_18.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:17 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_LVDCI_DV2_18-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_LVDCI_DV2_18 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_LVDCI_DV2_18;

architecture OBUF_LVDCI_DV2_18_V of OBUF_LVDCI_DV2_18 is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "LVDCI_DV2_18"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_LVDCI_DV2_18_V;
