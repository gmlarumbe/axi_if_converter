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
--  /   /                  D Flip-Flop with Asynchronous Clear (Discontinue in 13.1)
-- /___/   /\     Filename : FDC.vhd
-- \   \  /  \    Timestamp : Wed Sep  01 03:00:28 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/01/10 - Initial version.

----- CELL FDC-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDC is
  generic(
      INIT  : bit := '0'
    );
  port(
    Q : out std_ulogic;

    C : in std_ulogic;

    CLR : in std_ulogic;

    D : in std_ulogic
    );

end FDC;

architecture FDC_V of FDC is
begin
    F1 : FDCE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => C,
      CE  => '1',
      CLR  => CLR,
      D => D
);

end FDC_V;
