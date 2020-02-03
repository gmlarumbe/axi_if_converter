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
--  /   /                  Transparent Data Latch  (Discontinue in 13.1)
-- /___/   /\     Filename : LD.vhd
-- \   \  /  \    Timestamp : Tue Aug  17 06:23:36 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/17/10 - Initial version.

----- CELL LD-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LD is
  generic(
    INIT : bit := '0'
    );

  port(
    Q : out std_ulogic;

    D : in std_ulogic;
    G : in std_ulogic
    );
end LD;

architecture LD_V of LD is
begin
    L7 : LDCE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      G  => G,
      GE  => '1',
      CLR  => '0',
      D => D
);
end LD_V;
