-- $Header: $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 2012.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Reset/Tristate On Configuration
-- /___/   /\     Filename : GLBL_VHD.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    06/06/12 - Initial version.

----- CELL GLBL_VHD -----

library IEEE;
use IEEE.std_logic_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

entity GLBL_VHD is
  generic (
    InstancePath : string := "*";
    ROC_WIDTH : integer := 100000;
    TOC_WIDTH : integer := 0
    );
end GLBL_VHD;

architecture GLBL_VHD_V of GLBL_VHD is
constant ROC_time : time := ROC_WIDTH * 1 ps;
constant TOC_time : time := TOC_WIDTH * 1 ps;
begin
  ROC : process
  begin
    if (ROC_WIDTH <= 0) then
      assert false report
        "*** Error : a positive non-zero value of ROC_WIDTH must be specified ***"
        severity failure;
    else
      GSR <= 'H';
      wait for ROC_time;
      GSR <= 'L';
    end if;
    wait;
  end process ROC;
  TOC : process
  begin
    if (TOC_WIDTH < 0) then
      assert false report
        "*** Error : a positive value of TOC_WIDTH must be specified ***"
        severity failure;
    else
      GTS <= 'H';
      wait for TOC_time;
      GTS <= 'L';
    end if;
    wait;
  end process TOC;
end GLBL_VHD_V;

