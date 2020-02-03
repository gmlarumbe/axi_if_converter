-- $Header:  $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                 Register State Capture for Bitstream Readback for VIRTEX6 (Discontinue in 13.1)
-- /___/   /\     Filename : CAPTURE_VIRTEX6.vhd
-- \   \  /  \    Timestamp : Wed Oct 13 03:13:19 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/13/10 - Initial version.
--    05/29/12 - Change ONESHOT to boolean (CR 662144).
-- End Revision

----- CELL CAPTURE_VIRTEX6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity CAPTURE_VIRTEX6 is
  generic(
    ONESHOT : boolean := true
    );  
  port(
    CAP : in std_ulogic;
    CLK : in std_ulogic
    );
end CAPTURE_VIRTEX6;

architecture CAPTURE_VIRTEX6_V of CAPTURE_VIRTEX6 is

  function boolean_to_string(bool: boolean)
    return string is
  begin
    if bool then
      return "TRUE";
    else
      return "FALSE";
    end if;
  end boolean_to_string;

begin
    C4 : CAPTUREE2
     generic map(
      ONESHOT => boolean_to_string(ONESHOT)
    )
     port map (
      CAP  => CAP,
      CLK  => CLK
);
end CAPTURE_VIRTEX6_V;


