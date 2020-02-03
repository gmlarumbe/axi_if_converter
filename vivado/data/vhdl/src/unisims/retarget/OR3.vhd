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
--  /   /                  3-input OR Gate (Discontinue in 13.1)
-- /___/   /\     Filename : OR3.vhd
-- \   \  /  \    Timestamp : Mon May 24 14:38:23 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/24/10 - Initial version.

----- CELL OR3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OR3 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic
    );
end OR3;

architecture OR3_V of OR3 is
begin
    L3 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2
);
end OR3_V;
