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
--  /   /                  3-State Output Buffer with GTL_DCI I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFT_GTL_DCI.vhd
-- \   \  /  \    Timestamp : Fri Aug 13 11:14:36 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFT_GTL_DCI-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFT_GTL_DCI is
  port(
    O : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFT_GTL_DCI;

architecture OBUFT_GTL_DCI_V of OBUFT_GTL_DCI is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "GTL_DCI"
      
      
    )
    port map (
      O  => O,
      T => T,
      I => I
);

end OBUFT_GTL_DCI_V;
