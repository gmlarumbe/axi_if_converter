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
--  /   /                  Transparent Data Latch with Asynchronous Clear and Gate Enable and Inverted Gate (Discontinue in 13.1)
-- /___/   /\     Filename : LDCE_1.vhd
-- \   \  /  \    Timestamp : Tue Aug  17 05:20:10 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/17/10 - Initial version.

----- CELL LDCE_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LDCE_1 is
  generic(
      INIT  : bit := '0'
    );
  port(
    Q : out std_ulogic;

    G : in std_ulogic;

    GE : in std_ulogic;

    CLR : in std_ulogic;

    D : in std_ulogic
    );

end LDCE_1;

architecture LDCE_1_V of LDCE_1 is
signal not_G : std_ulogic;
begin
    not_G <= not G;
    L7 : LDCE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      G  => not_G,
      GE  => GE,
      CLR  => CLR,
      D => D
);

end LDCE_1_V;
