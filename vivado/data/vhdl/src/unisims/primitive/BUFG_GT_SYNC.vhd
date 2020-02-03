-----------------------------------------------------------------------------
--  Copyright (c) 2014 Xilinx Inc.
--  All Right Reserved.
-----------------------------------------------------------------------------
--
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2014.1 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Clock Buffer CLK synchronizer
-- /___/   /\      Filename    : BUFG_GT_SYNC.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-----------------------------------------------------------------------------
--  Revision:
--  02/03/14 - Initial version.
--  End Revision:
-----------------------------------------------------------------------------

----- CELL BUFG_GT_SYNC -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity BUFG_GT_SYNC is
    port (
      CESYNC               : out std_ulogic;
      CLRSYNC              : out std_ulogic;
      CE                   : in std_ulogic;
      CLK                  : in std_ulogic;
      CLR                  : in std_ulogic
    );
  end BUFG_GT_SYNC;

  architecture BUFG_GT_SYNC_V of BUFG_GT_SYNC is
    
    constant MODULE_NAME : string := "BUFG_GT_SYNC";
    begin
    CESYNC <= CE;
    CLRSYNC <= CLR;
 
 end BUFG_GT_SYNC_V;
