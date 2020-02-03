-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 13.1
--  \   \         Description : Xilinx Simulation Library Component
--  /   /                  Bi-Directional IO
-- /___/   /\     Filename : BIBUF.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
-- End Revision

library IEEE;
use IEEE.std_logic_1164.all;

entity BIBUF is 
  port (
       PAD       : inout std_ulogic;
       IO        : inout std_ulogic
       );
end BIBUF;

architecture BIBUF_V of BIBUF is
  signal drv_IO  : boolean := false;
  signal drv_PAD : boolean := false;

begin
  IO <= PAD when drv_IO else 'Z';
  PAD <= IO when drv_PAD else 'Z';

  drv_p : process
     begin
     if ((IO = 'Z' or IO = 'U') and (PAD = 'Z' or PAD = 'U')) then
        drv_IO <= false;
        drv_PAD <= false;
     elsif ((IO = 'Z' or IO = 'U') and not (PAD = 'Z' or PAD = 'U')) then
        drv_IO <= true;
        drv_PAD <= false;
     elsif (not (IO = 'Z' or IO = 'U') and (PAD = 'Z' or PAD = 'U')) then
        drv_IO <= false;
        drv_PAD <= true;
     end if;
     wait on IO, PAD;
  end process drv_p;

end BIBUF_V;
