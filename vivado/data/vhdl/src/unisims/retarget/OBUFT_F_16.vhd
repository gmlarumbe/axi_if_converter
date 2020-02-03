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
--  /   /                  3-State Output Buffer with FAST Slew 16 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFT_F_16.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:14:33 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFT_F_16-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFT_F_16 is
  port(
    O : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFT_F_16;

architecture OBUFT_F_16_V of OBUFT_F_16 is
begin
    O1 : OBUFT
    generic map (
      
      SLEW => "FAST",
      DRIVE => 16
    )
    port map (
      O  => O,
      T => T,
      I => I
);

end OBUFT_F_16_V;
