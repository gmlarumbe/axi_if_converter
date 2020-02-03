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
--  /   /                  2-input OR Gate (Discontinue in 13.1)
-- /___/   /\     Filename : OR2.vhd
-- \   \  /  \    Timestamp : Mon May 24 14:28:11 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/24/10 - Initial version.

----- CELL OR2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OR2 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic
    );
end OR2;

architecture OR2_V of OR2 is
begin
    L2 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1
);
end OR2_V;
