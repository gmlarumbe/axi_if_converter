-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/      Version     : 2018.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                        General Clock Buffer
-- /___/   /\     Filename : BUFG.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--    03/23/04 - Initial version.
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFG -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BUFG is
  port(
    O : out std_ulogic;
    I : in std_ulogic
    );
end BUFG;

architecture BUFG_V of BUFG is
  
begin
  -- begin behavioral model
  O <= TO_X01(I);
  -- end behavioral model

end BUFG_V;
