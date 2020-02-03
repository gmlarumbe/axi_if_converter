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
--  /   /                  2-to-1 Lookup Table Multiplexer with Local Output (Discontinue in 13.1)
-- /___/   /\     Filename : MUXF6_L.vhd
-- \   \  /  \    Timestamp : Wed Aug 25 11:51:00 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/24/10 - Initial version.

----- CELL MUXF6_L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MUXF6_L is
  port(
    LO : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    S : in std_ulogic
    );
end MUXF6_L;

architecture MUXF6_L_V of MUXF6_L is
begin
    L3 : LUT3
     generic map(
      INIT => X"ca"
    )
     port map (
      O  => LO,
      I0 => I0,
      I1 => I1,
      I2 => S
);
end MUXF6_L_V;


