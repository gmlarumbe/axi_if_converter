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
--  /   /                  Transparent Data Latch with Asynchronous Clear and Preset and Inverted Gate (Discontinue in 13.1)
-- /___/   /\     Filename : LDCP_1.vhd
-- \   \  /  \    Timestamp : Tue Aug  18 10:40:30 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/18/10 - Initial version.
--    08/23/13 - PR683925 - add invertible pin support.

----- CELL LDCP_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LDCP_1 is
  generic(
      INIT  : bit := '0';
      IS_CLR_INVERTED : bit := '0';
      IS_D_INVERTED : bit := '0';
      IS_G_INVERTED : bit := '0';
      IS_PRE_INVERTED : bit := '0'
    );
  port(
    Q : out std_ulogic;
    CLR : in std_ulogic;
    D : in std_ulogic;
    G : in std_ulogic;
    PRE : in std_ulogic
    );

end LDCP_1;

architecture LDCP_1_V of LDCP_1 is
signal G0 : std_ulogic;
signal D0 : std_ulogic;
signal CLR_in : std_ulogic;
signal D_in : std_ulogic;
signal G_in : std_ulogic;
signal PRE_in : std_ulogic;
signal IS_CLR_INVERTED_BIN : std_ulogic := TO_X01(IS_CLR_INVERTED);
signal IS_D_INVERTED_BIN : std_ulogic := TO_X01(IS_D_INVERTED);
signal IS_G_INVERTED_BIN : std_ulogic := TO_X01(IS_G_INVERTED);
signal IS_PRE_INVERTED_BIN : std_ulogic := TO_X01(IS_PRE_INVERTED);
begin
    CLR_in <= IS_CLR_INVERTED_BIN xor CLR;
    D_in <= IS_D_INVERTED_BIN xor D;
    G_in <= IS_G_INVERTED_BIN xor G;
    PRE_in <= IS_PRE_INVERTED_BIN xor PRE;

    L3_1 : LUT3
    generic map (
      INIT => X"32"
    )
    port map (
      I0  => PRE_in,
      I1  => CLR_in,
      I2  => D_in,
      O  =>  D0
);
    L3_2 : LUT3
    generic map (
      INIT => X"FD"
    )
    port map (
      I0  => G_in,
      I1  => CLR_in,
      I2  => PRE_in,
      O  =>  G0
);
    L7 : LDCE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      G  => G0,
      GE  => '1',
      CLR  => '0',
      D => D0
);
end LDCP_1_V;
