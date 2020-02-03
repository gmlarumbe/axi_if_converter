-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /             Global Clock Mux Buffer with Clock Enable and Output State 1 (Discontinue in 13.1)
-- /___/   /\     Filename : BUFGCE_1.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 05:08:51 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.
-- End Revision

----- CELL BUFGCE_1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity BUFGCE_1 is
     port(
	 O : out STD_ULOGIC;
         
	 CE: in STD_ULOGIC;
	 I : in STD_ULOGIC
         );
end BUFGCE_1;


architecture BUFGCE_1_V of BUFGCE_1 is
begin
     B0 : BUFGCTRL
     generic map (
	INIT_OUT => 1,
	PRESELECT_I0 => TRUE,
	PRESELECT_I1 => FALSE
     )
      port map (   	
        O => O, 
        CE0 => CE,
        CE1 => '0',
        I0 => I,
        I1 => '1',
        IGNORE0 => '0',
        IGNORE1 => '1',
        S0 => '1',
        S1 => '0'
  );
end BUFGCE_1_V;
