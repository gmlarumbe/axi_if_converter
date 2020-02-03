-- $Header: $
-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Retarget Simulation Library Component
--  /   /                  Differential Signaling Input Clock Buffer
-- /___/   /\     Filename : IBUFGDS.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    07/26/07 - Add else to handle x case for output (CR 424214).
--    07/16/08 - Added IBUF_LOW_PWR attribute.
--    04/22/09 - CR 519127 - Changed IBUF_LOW_PWR default to TRUE.
--    07/30/12 - 669140 - retarget to IBUF variant
-- End Revision

----- CELL IBUFGDS -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;

entity IBUFGDS is
  generic(
      CAPACITANCE : string  := "DONT_CARE";
      DIFF_TERM   : boolean :=  FALSE;
      IBUF_DELAY_VALUE : string := "0";
      IBUF_LOW_PWR : boolean :=  TRUE;
      IOSTANDARD  : string  := "DEFAULT"
    );

  port(
    O : out std_ulogic;

    I  : in std_ulogic;
    IB : in std_ulogic
    );
end IBUFGDS;

architecture IBUFGDS_V of IBUFGDS is
begin
    B1 : IBUFDS
   generic map (
    DQS_BIAS => "FALSE",
    CAPACITANCE => CAPACITANCE,
    DIFF_TERM  => DIFF_TERM,
    IBUF_DELAY_VALUE => IBUF_DELAY_VALUE,
    IBUF_LOW_PWR => IBUF_LOW_PWR,
    IFD_DELAY_VALUE => "AUTO",
    IOSTANDARD => IOSTANDARD
    )
  port map (
    O => O,
    I => I,
    IB => IB
    );

end IBUFGDS_V;
