-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Latch used 2-input OR Gate
-- /___/   /\     Filename : OR2L.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    02/26/08 - Initial version.
--    04/01/08 - Change input pins name.
--    02/19/09 - Order port name. (CR509139)
--    05/22/12 - 659432 - Add GSR
--    04/16/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL OR2L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

entity OR2L is
  generic (
    IS_SRI_INVERTED : bit := '0'
  );

  port(
    O : out std_ulogic;

    DI : in std_ulogic;
    SRI : in std_ulogic
    );
end OR2L;

architecture OR2L_V of OR2L is
  signal o_o : std_ulogic;
  signal gsr_in : std_ulogic;
  signal SRI_in : std_ulogic;
  signal IS_SRI_INVERTED_BIN : std_ulogic;

begin
  gsr_in <= TO_X01(GSR);
  SRI_in <= SRI xor IS_SRI_INVERTED_BIN;
  o_o <= SRI_in or DI;
  O <= '0' when (gsr_in = '1') else o_o;
  IS_SRI_INVERTED_BIN <= TO_X01(IS_SRI_INVERTED);


end OR2L_V;
