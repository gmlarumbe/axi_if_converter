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
--  /   /                  D Flip-Flop with Asynchronous Preset and Clock Enable and Negative-Edge Clock (Discontinue in 13.1)
-- /___/   /\     Filename : FDPE_1.vhd
-- \   \  /  \    Timestamp : Tue Sep  07 05:06:39 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/07/10 - Initial version.
--    05/25/12 - 662144 correct initial value.
-- End Revision

----- CELL FDPE_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDPE_1 is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    C   : in std_ulogic;
    CE  : in std_ulogic;
    D   : in std_ulogic;
    PRE : in std_ulogic
    );
end FDPE_1;

architecture FDPE_1_V of FDPE_1 is
signal not_C : std_ulogic;
begin
    not_C <= not C;
    F2 : FDPE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => not_C,
      CE  => CE,
      PRE  => PRE,
      D => D
);
end FDPE_1_V;
