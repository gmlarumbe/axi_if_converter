-------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  I/O Clock Buffer/Divider for the Spartan Series
-- /___/   /\     Filename : BUFIO2.vhd
-- \   \  /  \    Timestamp : Tue Aug 16 13:49:22 PDT 2011
--  \___\/\___\
--
-- Revision:
--    08/16/11 - Initial version.
-- End Revision

----- CELL BUFIO2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


library unisim;
use unisim.vpkg.all;

entity BUFIO2 is

  generic(

      DIVIDE_BYPASS : boolean := TRUE;  -- TRUE, FALSE
      DIVIDE        : integer := 1;     -- {1..8}
      I_INVERT      : boolean := FALSE; -- TRUE, FALSE
      USE_DOUBLER   : boolean := FALSE  -- TRUE, FALSE
      );

  port(
      DIVCLK       : out std_ulogic;
      IOCLK        : out std_ulogic;
      SERDESSTROBE : out std_ulogic;

      I            : in  std_ulogic
    );

end BUFIO2;

architecture BUFIO2_V OF BUFIO2 is

begin
  
--####################################################################
--#####                        Initialization                      ###
--####################################################################
  prcs_init:process
  begin

    assert false
      report "ERROR : The following component BUFIO2 is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
      severity Failure;

     wait;

  end process prcs_init;

  
end BUFIO2_V;

