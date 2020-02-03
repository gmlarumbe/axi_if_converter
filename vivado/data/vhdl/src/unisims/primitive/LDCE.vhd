-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Transparent Data Latch with Asynchronous Clear and Gate Enable
-- /___/   /\     Filename : LDCE.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    11/03/08 - Initial Q. CR49409
--    05/22/12 - 659432 - Add GSR
--    04/16/13 - PR683925 - add invertible pin support.
--    04/22/13 - 714506 - D_in GE_in in process sensitivty list.
-- End Revision

----- CELL LDCE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

entity LDCE is
  generic(
    INIT : bit := '0';
    IS_CLR_INVERTED : bit := '0';
    IS_G_INVERTED : bit := '0'
    );

  port(
    Q : out std_ulogic;

    CLR : in std_ulogic;
    D   : in std_ulogic;
    G   : in std_ulogic;
    GE  : in std_ulogic
    );
end LDCE;

architecture LDCE_V of LDCE is
  signal q_o : std_ulogic := TO_X01(INIT);
  signal gsr_in : std_ulogic;
  signal CLR_in : std_ulogic;
  signal G_in : std_ulogic;
  signal GE_in : std_ulogic;
  signal D_in : std_ulogic;

  signal IS_CLR_INVERTED_BIN : std_ulogic;
  signal IS_G_INVERTED_BIN : std_ulogic;

begin
 
  Q <=  q_o;
  gsr_in <= TO_X01(GSR);
  CLR_in <= CLR xor IS_CLR_INVERTED_BIN;
  G_in <= G xor IS_G_INVERTED_BIN;
  GE_in <= GE;
  D_in <= D;

  IS_CLR_INVERTED_BIN <= TO_X01(IS_CLR_INVERTED);
  IS_G_INVERTED_BIN <= TO_X01(IS_G_INVERTED);

  FunctionalBehavior : process(CLR_in, D_in, G_in, GE_in, gsr_in)
  begin
    if (gsr_in = '1') then
      q_o   <= TO_X01(INIT);
    elsif (CLR_in = '1') then
      q_o   <= '0';
    elsif ((GE_in = '1')  and (G_in = '1')) then
      q_o <= D_in after 100 ps;        
    end if;
  end process;
end LDCE_V;


