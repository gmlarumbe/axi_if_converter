-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/      Version     : 2018.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                        A high-fanout buffer for low-skew distribution of the PS Clock signals
-- /___/   /\     Filename : BUFG_PS.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--    03/10/15 - Initial version
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFG_PS -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity BUFG_PS is
  port(
    O : out std_ulogic;
    I : in std_ulogic
    );
end BUFG_PS;

architecture BUFG_PS_V of BUFG_PS is

  constant MODULE_NAME : string := "BUFG_PS";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers


  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- begin behavioral model declarations
  
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
-- begin behavioral model
  O <= TO_X01(I);

-- end behavioral model

end BUFG_PS_V;
