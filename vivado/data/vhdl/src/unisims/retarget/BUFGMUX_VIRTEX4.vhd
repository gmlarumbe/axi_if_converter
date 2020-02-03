-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /             Global Clock Mux Buffer (Discontinue in 13.1)
-- /___/   /\     Filename : BUFGMUX_VIRTEX4.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 04:26:37 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.
-- End Revision

----- CELL BUFGMUX_VIRTEX4 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity BUFGMUX_VIRTEX4 is

  port(
      O			: out std_ulogic;

      I0		: in std_ulogic;
      I1		: in std_ulogic;
      S			: in std_ulogic
    );
end BUFGMUX_VIRTEX4;


architecture BUFGMUX_VIRTEX4_V of BUFGMUX_VIRTEX4 is
signal not_S : std_ulogic;
begin
     not_S <= not S;
     B0 : BUFGCTRL
     generic map (
	INIT_OUT => 0,
	PRESELECT_I0 => TRUE,
	PRESELECT_I1 => FALSE
     )
      port map (   	
        O => O, 
        CE0 => '1',
        CE1 => '1',
        I0 => I0,
        I1 => I1,
        IGNORE0 => '0',
        IGNORE1 => '1',
        S0 => not_S,
        S1 => S
  );
end BUFGMUX_VIRTEX4_V;
