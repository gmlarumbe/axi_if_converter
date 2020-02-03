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
--  /   /                  Input Clock Buffer with HSTL_I_DCI I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_HSTL_I_DCI.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:25:31 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_HSTL_I_DCI-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_HSTL_I_DCI is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_HSTL_I_DCI;

architecture IBUFG_HSTL_I_DCI_V of IBUFG_HSTL_I_DCI is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "HSTL_I_DCI"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_HSTL_I_DCI_V;
