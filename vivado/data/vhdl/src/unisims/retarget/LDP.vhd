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
--  /   /                  Transparent Data Latch with Asynchronous Preset (Discontinue in 13.1)
-- /___/   /\     Filename : LDP.vhd
-- \   \  /  \    Timestamp : Wed Aug  18 03:37:24 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/18/10 - Initial version.
--    05/25/12 - 662144 correct initial value.
-- End Revision

----- CELL LDP-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LDP is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    D   : in std_ulogic;
    G   : in std_ulogic;
    PRE : in std_ulogic
    );
end LDP;

architecture LDP_V of LDP is
begin
    L8 : LDPE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      G  => G,
      GE  => '1',
      PRE  => PRE,
      D => D
);
end LDP_V;
