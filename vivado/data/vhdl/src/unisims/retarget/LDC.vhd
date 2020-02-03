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
--  /   /                  Transparent Data Latch with Asynchronous Clear (Discontinue in 13.1)
-- /___/   /\     Filename : LDC.vhd
-- \   \  /  \    Timestamp : Tue Aug  17 05:25:18 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/17/10 - Initial version.

----- CELL LDC-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LDC is
  generic(
      INIT  : bit := '0'
    );
  port(
    Q : out std_ulogic;

    G : in std_ulogic;

    CLR : in std_ulogic;

    D : in std_ulogic
    );

end LDC;

architecture LDC_V of LDC is
begin
    L7 : LDCE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      G  => G,
      GE  => '1',
      CLR  => CLR,
      D => D
);

end LDC_V;
