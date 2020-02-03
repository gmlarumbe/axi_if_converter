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
--  /   /                  2-to-1 Lookup Table Multiplexer with Dual Output (Discontinue in 13.1)
-- /___/   /\     Filename : MUXF5.vhd
-- \   \  /  \    Timestamp : Wed Aug 25 11:50:59 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/24/10 - Initial version.

----- CELL MUXF5 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MUXF5 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    S : in std_ulogic
    );
end MUXF5;

architecture MUXF5_V of MUXF5 is
begin
    L3 : LUT3
     generic map(
      INIT => X"ca"
    )
     port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => S
);
end MUXF5_V;


