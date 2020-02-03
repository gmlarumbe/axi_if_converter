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
--  /   /                  Input Buffer with LVDCI_DV2_33 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUF_LVDCI_DV2_33.vhd
-- \   \  /  \    Timestamp : Wed Jun  2 15:44:13 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUF_LVDCI_DV2_33-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUF_LVDCI_DV2_33 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUF_LVDCI_DV2_33;

architecture IBUF_LVDCI_DV2_33_V of IBUF_LVDCI_DV2_33 is
begin
    I0 : IBUF
    generic map (
      IOSTANDARD => "LVDCI_DV2_33"
    )
    port map (
      O  => O,
      I => I
);

end IBUF_LVDCI_DV2_33_V;
