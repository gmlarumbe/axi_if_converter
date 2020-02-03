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
--  /   /                  D Flip-Flop with Asynchronous Clear and Negative-Edge Clock (Discontinue in 13.1)
-- /___/   /\     Filename : FDC_1.vhd
-- \   \  /  \    Timestamp : Wed Sep  01 03:27:18 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/01/10 - Initial version.

----- CELL FDC_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDC_1 is
  generic(
      INIT  : bit := '0'
    );
  port(
    Q : out std_ulogic;

    C : in std_ulogic;

    CLR : in std_ulogic;

    D : in std_ulogic
    );

end FDC_1;

architecture FDC_1_V of FDC_1 is
signal not_C : std_ulogic;
begin
    not_C <= not C;
    F1 : FDCE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => not_C,
      CE  => '1',
      CLR  => CLR,
      D => D
);

end FDC_1_V;
