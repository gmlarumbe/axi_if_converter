-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Latch used 2-input AND Gate
-- /___/   /\     Filename : AND2B1L.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    04/01/08 - Initial version.
--    02/26/09 - Change port order (CR510370)
--    04/14/09 - Invert SRI not DI (CR517897)
--    05/22/12 - 659432 - Add GSR
--    04/16/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL AND2B1L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

entity AND2B1L is
  generic (
    IS_SRI_INVERTED : bit := '0'
  );

  port(
    O : out std_ulogic;

    DI : in std_ulogic;
    SRI : in std_ulogic
    );
end AND2B1L;

architecture AND2B1L_V of AND2B1L is
  signal o_o : std_ulogic;
  signal gsr_in : std_ulogic;
  signal SRI_in : std_ulogic;

  signal IS_SRI_INVERTED_BIN : std_ulogic;

begin
  gsr_in <= TO_X01(GSR);
  o_o <= (not SRI_in) and  DI;
  O <= '0' when (gsr_in = '1') else o_o;
  SRI_in <= SRI xor IS_SRI_INVERTED_BIN;
  IS_SRI_INVERTED_BIN <= TO_X01(IS_SRI_INVERTED);

end AND2B1L_V;


