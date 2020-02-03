-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Transparent Data Latch with Asynchronous Preset and Gate Enable
-- /___/   /\     Filename : LDPE.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    11/03/08 - Initial Q. CR49409
--    05/22/12 - 659432 - Add GSR
--    04/16/13 - PR683925 - add invertible pin support.
--    04/23/13 - 714506 - D_in GE_in n sensitivity list
-- End Revision

----- CELL LDPE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

entity LDPE is
  generic(
    INIT : bit := '1';
    IS_G_INVERTED : bit := '0';
    IS_PRE_INVERTED : bit := '0'
    );

  port(
    Q : out std_ulogic;

    D   : in std_ulogic;
    G   : in std_ulogic;
    GE  : in std_ulogic;
    PRE : in std_ulogic
    );
end LDPE;

architecture LDPE_V of LDPE is
  signal q_o : std_ulogic := TO_X01(INIT);
  signal gsr_in : std_ulogic;
  signal G_in : std_ulogic;
  signal PRE_in : std_ulogic;
  signal GE_in : std_ulogic;
  signal D_in : std_ulogic;

  signal IS_PRE_INVERTED_BIN : std_ulogic;
  signal IS_G_INVERTED_BIN : std_ulogic;

begin
 
  gsr_in <= TO_X01(GSR);
  Q <=  q_o;
  G_in <= G xor IS_G_INVERTED_BIN;
  PRE_in <= PRE xor IS_PRE_INVERTED_BIN;
  GE_in <= GE;
  D_in <= D;

  IS_PRE_INVERTED_BIN <= TO_X01(IS_PRE_INVERTED);
  IS_G_INVERTED_BIN <= TO_X01(IS_G_INVERTED);

  FunctionalBehavior : process(D_in, G_in, GE_in, PRE_in, gsr_in)
  begin
    if (gsr_in = '1') then
      q_o   <= TO_X01(INIT);
    elsif (PRE_in = '1') then
      q_o   <= '1';
    elsif ((GE_in = '1') and (G_in = '1'))then
      q_o <= D_in after 100 ps;        
    end if;
  end process;
end LDPE_V;


