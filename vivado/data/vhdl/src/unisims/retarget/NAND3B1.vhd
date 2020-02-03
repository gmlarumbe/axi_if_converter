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
--  /   /                  3-input NAND Gate (Discontinue in 13.1)
-- /___/   /\     Filename : NAND3B1.vhd
-- \   \  /  \    Timestamp : Mon May 24 11:54:04 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/21/10 - Initial version.

----- CELL NAND3B1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity NAND3B1 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic
    );
end NAND3B1;

architecture NAND3B1_V of NAND3B1 is
begin
    L3 : LUT3
    generic map(
      INIT => X"BF"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2
);
end NAND3B1_V;


