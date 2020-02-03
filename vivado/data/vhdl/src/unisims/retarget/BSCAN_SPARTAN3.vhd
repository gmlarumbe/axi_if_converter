-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/unisim/VITAL/BSCAN_SPARTAN3.vhd,v 1.1 2008/06/19 16:59:23 vandanad Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Boundary Scan Logic Control Circuit for SPARTAN3
-- /___/   /\     Filename : BSCAN_SPARTAN3.vhd
-- \   \  /  \    Timestamp : Mon Aug  8 16:05:19 PDT 2011
--  \___\/\___\
--
-- Revision:
--    08/08/11 - Initial version.
-- End Revision

----- CELL BSCAN_SPARTAN3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BSCAN_SPARTAN3 is
  port(
    CAPTURE : out std_ulogic := 'H';
    DRCK1   : out std_ulogic := 'L';
    DRCK2   : out std_ulogic := 'L';
    RESET   : out std_ulogic := 'L';
    SEL1    : out std_ulogic := 'L';
    SEL2    : out std_ulogic := 'L';
    SHIFT   : out std_ulogic := 'L';
    TDI     : out std_ulogic := 'L';
    UPDATE  : out std_ulogic := 'L';

    TDO1 : in std_ulogic := 'X';
    TDO2 : in std_ulogic := 'X'
    );
end BSCAN_SPARTAN3;

architecture BSCAN_SPARTAN3_V of BSCAN_SPARTAN3 is

begin

--####################################################################
--#####                        Initialization                      ###
--####################################################################

  prcs_init:process
  begin

    assert false
      report "ERROR : The following component BSCAN_SPARTAN3 is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
      severity Failure;

     wait;

  end process prcs_init;
  
end BSCAN_SPARTAN3_V;


