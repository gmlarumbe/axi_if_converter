-- $Header: $
-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 14.3
--  \   \         Description : Xilinx Retarget Simulation Library Component
--  /   /                  Differential Signaling Input Clock Buffer with Differential Outputs
-- /___/   /\     Filename : IBUFGDS_DIFF_OUT.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    02/10/09 - CR 430124 -- Added attribute DIFF_TERM.
--    06/02/09 - CR 523083 -- Added attribute IBUF_LOW_PWR.
--    11/03/10 - CR 576577 -- changed default value of IOSTANDARD from LVDS_25 to DEFAULT.
--    07/30/12 - 669140 - retarget to IBUF variant
-- End Revision

----- CELL IBUFGDS_DIFF_OUT -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;

entity IBUFGDS_DIFF_OUT is
  generic(
    DIFF_TERM   : boolean :=  FALSE;
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR : boolean :=  TRUE;
    IOSTANDARD  : string  := "DEFAULT"          
    );

   port(
      O                              :	out   STD_ULOGIC;
      OB                              :	out   STD_ULOGIC;      
      
      I                              :	in    STD_ULOGIC;
      IB                              :	in    STD_ULOGIC      
      );
end IBUFGDS_DIFF_OUT;

architecture IBUFGDS_DIFF_OUT_V of IBUFGDS_DIFF_OUT is
begin
    B1 : IBUFDS_DIFF_OUT
   generic map (
    DIFF_TERM => DIFF_TERM,
    DQS_BIAS => DQS_BIAS,
    IBUF_LOW_PWR => IBUF_LOW_PWR,
    IOSTANDARD => IOSTANDARD
    )
  port map (
    O => O,
    OB => OB,
    I => I,
    IB => IB
    );

end IBUFGDS_DIFF_OUT_V;
