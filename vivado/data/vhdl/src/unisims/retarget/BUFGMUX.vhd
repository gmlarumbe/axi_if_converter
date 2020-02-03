-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/unisim/VITAL/BUFGMUX.vhd,v 1.4 2009/11/23 22:47:31 yanx Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Global Clock Mux Buffer with Output State 0
-- /___/   /\     Filename : BUFGMUX.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:55:16 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    01/11/08 - Add CLK_SEL_TYPE attribute.
--    05/20/08 - Recoding same as verilog model. (CR467336)
--    02/19/09 - Add initial to q0_t and q1_t (CR507901)
--    11/23/09 - Change Q to 0 instead of L (CR538513)
-- End Revision


----- CELL BUFGMUX -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;

library unisim;
use unisim.vpkg.all;
use unisim.vcomponents.all;

entity BUFGMUX is
  generic (
      CLK_SEL_TYPE : string  := "SYNC"
  );

  port(
    O : out std_ulogic := '0';

    I0 : in std_ulogic := '0';
    I1 : in std_ulogic := '0';
    S  : in std_ulogic := '0'
    );

  attribute VITAL_LEVEL0 of
    BUFGMUX : entity is true;
end BUFGMUX;

architecture BUFGMUX_V of BUFGMUX is
  
  signal NS : std_ulogic := '0';
  signal IG0 : std_ulogic := '0';
  signal IG1 : std_ulogic := '0';

begin

   IG0 <= '0' when (CLK_SEL_TYPE = "SYNC") else '1'; 
   IG1 <= '0' when (CLK_SEL_TYPE = "SYNC") else '1'; 

   BUFGMUX_BUFGCTRL: BUFGCTRL
     generic map (
       INIT_OUT => 0,
       PRESELECT_I0 => true,
       PRESELECT_I1 => false)
     port map (
       O => O,
       CE0 => NS,
       CE1 => S,
       I0 => I0,
       I1 => I1,
       IGNORE0 => IG0,
       IGNORE1 => IG1,
       S0 => '1',
       S1 => '1'
       );

   INV_S : INV
     port map (
       O => NS,
       I => S
     );

end BUFGMUX_V;


