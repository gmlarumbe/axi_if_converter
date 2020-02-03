-----------------------------------------------------------------------------
--  Copyright (c) 2013 Xilinx Inc.
--  All Right Reserved.
-----------------------------------------------------------------------------
--
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2012.2 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      
-- /___/   /\      Filename    : MASTER_JTAG.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-----------------------------------------------------------------------------
--  Revision:
--     06/17/13 - Initial version.
--  End Revision:
-----------------------------------------------------------------------------

----- CELL MASTER_JTAG -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity MASTER_JTAG is
  port (
    TDO                  : out std_ulogic;
    TCK                  : in std_ulogic;
    TDI                  : in std_ulogic;
    TMS                  : in std_ulogic    
  );
end MASTER_JTAG;

architecture MASTER_JTAG_V of MASTER_JTAG is
  
  signal glblGSR      : std_ulogic;
  
  begin

    glblGSR     <= TO_X01(GSR);
  
end MASTER_JTAG_V;
