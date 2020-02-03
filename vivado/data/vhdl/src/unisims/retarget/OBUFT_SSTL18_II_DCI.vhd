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
--  /   /                  3-State Output Buffer with SSTL18_II_DCI I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFT_SSTL18_II_DCI.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:16:03 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFT_SSTL18_II_DCI-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFT_SSTL18_II_DCI is
  port(
    O : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFT_SSTL18_II_DCI;

architecture OBUFT_SSTL18_II_DCI_V of OBUFT_SSTL18_II_DCI is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "SSTL18_II_DCI"
      
      
    )
    port map (
      O  => O,
      T => T,
      I => I
);

end OBUFT_SSTL18_II_DCI_V;
