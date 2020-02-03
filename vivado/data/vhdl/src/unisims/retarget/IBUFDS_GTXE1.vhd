-------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Differential Signaling Input Buffer for GTs
-- /___/   /\     Filename : IBUFDS_GTXE1.vhd
-- \   \  /  \    Timestamp : Mon Aug  8 16:05:19 PDT 2011
--  \___\/\___\
--
-- Revision:
--    08/08/11 - Initial version.
-- End Revision


----- CELL IBUFDS_GTXE1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


library unisim;
use unisim.vpkg.all;

entity IBUFDS_GTXE1 is

 generic(

      CLKCM_CFG	    : boolean       := TRUE;
      CLKRCV_TRST   : boolean       := TRUE;
      REFCLKOUT_DLY : bit_vector    := b"0000000000"
      );

  port(
      O       : out std_ulogic;
      ODIV2   : out std_ulogic;

      CEB     : in  std_ulogic;
      I       : in  std_ulogic;
      IB      : in  std_ulogic
    );

end IBUFDS_GTXE1;

architecture IBUFDS_GTXE1_V OF IBUFDS_GTXE1 is

begin

--####################################################################
--#####                        Initialization                      ###
--####################################################################
  prcs_init:process
  begin

    assert false
      report "ERROR : The following component IBUFDS_GTXE1 is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
      severity Failure;

     wait;

  end process prcs_init;

  
end IBUFDS_GTXE1_V;

