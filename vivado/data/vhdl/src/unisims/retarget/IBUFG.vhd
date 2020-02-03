-- $Header: $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 14.3
--  \   \         Description : Xilinx Retarget Simulation Library Component
--  /   /                  Input Clock Buffer
-- /___/   /\     Filename : IBUFG.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    07/16/08 - Added IBUF_LOW_PWR attribute.
--    04/22/09 - CR 519127 - Changed IBUF_LOW_PWR default to TRUE.
--    07/30/12 - 669140 - retarget to IBUF variant
-- End Revision

----- CELL IBUFG -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;

entity IBUFG is
  generic(
    CAPACITANCE : string := "DONT_CARE";
    IBUF_DELAY_VALUE : string := "0";        
    IBUF_LOW_PWR : boolean :=  TRUE;
    IOSTANDARD  : string := "DEFAULT"
    );

  port(
    O : out std_ulogic;

    I : in std_ulogic
    );
end IBUFG;

architecture IBUFG_V of IBUFG is
begin
    B1 : IBUF
   generic map (
    CAPACITANCE => CAPACITANCE,
    IBUF_DELAY_VALUE => IBUF_DELAY_VALUE,
    IBUF_LOW_PWR => IBUF_LOW_PWR,
    IFD_DELAY_VALUE => "AUTO",
    IOSTANDARD => IOSTANDARD
    )
  port map (
    O => O,
    I => I
    );

end IBUFG_V;
