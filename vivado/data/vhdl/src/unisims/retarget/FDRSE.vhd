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
--  /   /                  D Flip-Flop with Synchronous Reset and Set and Clock Enable (Discontinue in 13.1)
-- /___/   /\     Filename : FDRSE.vhd
-- \   \  /  \    Timestamp : Wed Sep  08 2:33:26 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/08/10 - Initial version.
--    08/23/13 - PR683925 - add invertible pin support.

----- CELL FDRSE-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDRSE is
  generic(
      INIT  : bit := '0';
      IS_C_INVERTED : bit := '0';
      IS_CE_INVERTED : bit := '0';
      IS_D_INVERTED : bit := '0';
      IS_R_INVERTED : bit := '0';
      IS_S_INVERTED : bit := '0'
    );
  port(
    Q : out std_ulogic;
    C : in std_ulogic;
    CE : in std_ulogic;
    R : in std_ulogic;
    S : in std_ulogic;
    D : in std_ulogic
    );

end FDRSE;

architecture FDRSE_V of FDRSE is
signal D0 : std_ulogic;
signal Q_out : std_ulogic;
signal I0_out : std_ulogic;
signal CE_in : std_ulogic;
signal D_in : std_ulogic;
signal S_in : std_ulogic;
signal IS_CE_INVERTED_BIN : std_ulogic := TO_X01(IS_CE_INVERTED);
signal IS_D_INVERTED_BIN : std_ulogic := TO_X01(IS_D_INVERTED);
signal IS_S_INVERTED_BIN : std_ulogic := TO_X01(IS_S_INVERTED);

begin
    Q <= Q_out;
    I0_out <= Q_out;
    CE_in <= IS_CE_INVERTED_BIN xor CE;
    D_in <= IS_D_INVERTED_BIN xor D;
    S_in <= IS_S_INVERTED_BIN xor S;

    L4 : LUT4
    generic map (
      INIT => X"FFCA"
    )
    port map (
      O  => D0,
      I0  => I0_out,
      I1  => D_in,
      I2  => CE_in,
      I3 => S_in
);
    F3 : FDRE
    generic map (
      INIT => INIT,
      IS_C_INVERTED => IS_C_INVERTED,
      IS_R_INVERTED => IS_R_INVERTED
    )
    port map (
      Q  => Q_out,
      C  => C,
      CE  => '1',
      D  => D0,
      R => R
);

end FDRSE_V;
