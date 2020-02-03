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
-- /___/   /\     Filename : MUXF5_D.vhd
-- \   \  /  \    Timestamp : Wed Aug 25 11:50:58 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/24/10 - Initial version.
--    05/29/12 - 662144 - add missing LO pin and logic
-- End Revision:

----- CELL MUXF5_D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MUXF5_D is
  port(
    LO : out std_ulogic;
    O  : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    S  : in std_ulogic
    );
end MUXF5_D;

architecture MUXF5_D_V of MUXF5_D is
    signal O_out  : std_ulogic;
begin
    O <= O_out;
    LO <= O_out;
    L3 : LUT3
     generic map(
      INIT => X"ca"
    )
     port map (
      O  => O_out,
      I0 => I0,
      I1 => I1,
      I2 => S
);
end MUXF5_D_V;


