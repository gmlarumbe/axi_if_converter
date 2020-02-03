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
--  /   /                  D Flip-Flop   (Discontinue in 13.1)
-- /___/   /\     Filename : FD.vhd
-- \   \  /  \    Timestamp : Wed Sep  01 04:30:36 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/01/10 - Initial version.

----- CELL FD-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FD is
  generic(
      INIT  : bit := '0'
    );
  port(
    Q : out std_ulogic;

    C : in std_ulogic;

    D : in std_ulogic
    );

end FD;

architecture FD_V of FD is
begin
    F3 : FDRE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => C,
      CE  => '1',
      R  => '0',
      D => D
);

end FD_V;
