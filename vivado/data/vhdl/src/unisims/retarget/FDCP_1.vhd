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
--  /   /                  D Flip-Flop with Asynchronous Clear and Preset and Negative-Edge Clock (Discontinue in 13.1)
-- /___/   /\     Filename : FDCP_1.vhd
-- \   \  /  \    Timestamp : Wed Sep  08 2:17:31 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/08/10 - Initial version.
--    08/23/13 - PR683925 - add invertible pin support.

----- CELL FDCP_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDCP_1 is
  generic(
      INIT  : bit := '0';
      IS_C_INVERTED : bit := '0';
      IS_CLR_INVERTED : bit := '0';
      IS_PRE_INVERTED : bit := '0'
    );
  port(
    Q : out std_ulogic;
    C : in std_ulogic;
    PRE : in std_ulogic;
    CLR : in std_ulogic;
    D : in std_ulogic
    );

end FDCP_1;

architecture FDCP_1_V of FDCP_1 is
signal D0, D1, S0 : std_ulogic;
signal not_C : std_ulogic;
signal PRE_in : std_ulogic;
signal IS_PRE_INVERTED_BIN : std_ulogic := TO_X01(IS_PRE_INVERTED);

begin
    not_C <= not C;
    PRE_in <= IS_PRE_INVERTED_BIN xor PRE;

    F1 : FDCE
    generic map (
      INIT => INIT,
      IS_C_INVERTED => IS_C_INVERTED,
      IS_CLR_INVERTED => IS_CLR_INVERTED
    )
    port map (
      Q  => D0,
      C  => not_C,
      CE  => '1',
      CLR  => CLR,
      D => D
);
    F2 : FDPE
    generic map (
      INIT => INIT,
      IS_C_INVERTED => IS_C_INVERTED,
      IS_PRE_INVERTED => IS_PRE_INVERTED
    )
    port map (
      Q  => D1,
      C  => not_C,
      CE  => '1',
      PRE  => PRE,
      D => D
);
    L7 : LDCE
    generic map (
      INIT => INIT,
      IS_CLR_INVERTED => IS_CLR_INVERTED
    )
    port map (
      Q  => S0,
      G  => PRE_in,
      GE  => '1',
      CLR  => CLR,
      D => '1'
);
    L3 : LUT3
    generic map (
      INIT => X"CA"
    )
    port map (
      O  => Q,
      I0  => D0,
      I1  => D1,
      I2 => S0
);

end FDCP_1_V;
