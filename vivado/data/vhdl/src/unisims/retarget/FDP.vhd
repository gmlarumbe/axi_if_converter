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
--  /   /                  D Flip-Flop with Asynchronous Preset (Discontinue in 13.1)
-- /___/   /\     Filename : FDP.vhd
-- \   \  /  \    Timestamp : Thu Sep  02 03:47:28 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/02/10 - Initial version.
--    05/25/12 - 662144 correct initial value.
-- End Revision

----- CELL FDP-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDP is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    C   : in std_ulogic;
    D   : in std_ulogic;
    PRE : in std_ulogic
    );
end FDP;

architecture FDP_V of FDP is
begin
    F2 : FDPE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => C,
      CE  => '1',
      PRE  => PRE,
      D => D
);
end FDP_V;
