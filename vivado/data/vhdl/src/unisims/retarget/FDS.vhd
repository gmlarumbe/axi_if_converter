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
--  /   /                  D Flip-Flop with Synchronous Set  (Discontinue in 13.1)
-- /___/   /\     Filename : FDS.vhd
-- \   \  /  \    Timestamp : Wed Sep  08 04:11:48 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/08/10 - Initial version.
--    05/25/12 - 662144 correct initial value.
-- End Revision

----- CELL FDS-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDS is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    C : in std_ulogic;
    D : in std_ulogic;
    S : in std_ulogic
    );
end FDS;

architecture FDS_V of FDS is
begin
    F4 : FDSE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => C,
      CE  => '1',
      S  => S,
      D => D
);
end FDS_V;
