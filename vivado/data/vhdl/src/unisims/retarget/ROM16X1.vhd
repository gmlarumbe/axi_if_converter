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
--  /   /                  16-Deep by 1-Wide ROM (Discontinue in 13.1)
-- /___/   /\     Filename : ROM16X1.vhd
-- \   \  /  \    Timestamp : Fri Oct  15 11:19:14 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.

----- CELL ROM16X1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ROM16X1 is
  generic (
       INIT : bit_vector := X"0000"
  );

  port (
        O : out std_ulogic;
        
        A0 : in std_ulogic;
        A1 : in std_ulogic;
        A2 : in std_ulogic;
        A3 : in std_ulogic
       );
end ROM16X1;

architecture ROM16X1_V of ROM16X1 is
begin
    L4 : LUT4
    generic map (
      INIT => INIT
    )
    port map (
      O  => O,
      I0  => A0,
      I1  => A1,
      I2  => A2,
      I3  => A3
);
end ROM16X1_V;
