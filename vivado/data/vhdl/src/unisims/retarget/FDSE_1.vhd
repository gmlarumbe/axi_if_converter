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
--  /   /                  D Flip-Flop with Synchronous Set  and Clock Enable and Negative-Edge Clock (Discontinue in 13.1)
-- /___/   /\     Filename : FDSE_1.vhd
-- \   \  /  \    Timestamp : Wed Sep  08 04:17:22 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/08/10 - Initial version.
--    05/25/12 - 662144 correct initial value.
-- End Revision

----- CELL FDSE_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDSE_1 is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    C  : in std_ulogic;
    CE : in std_ulogic;
    D  : in std_ulogic;
    S  : in std_ulogic
    );
end FDSE_1;

architecture FDSE_1_V of FDSE_1 is
signal not_C : std_ulogic;
begin
    not_C <= not C;
    F4 : FDSE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => not_C,
      CE  => CE,
      S  => S,
      D => D
);
end FDSE_1_V;
