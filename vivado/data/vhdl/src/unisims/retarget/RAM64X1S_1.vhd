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
--  /   /                  Static Synchronous RAM 64-Deep by 1-Wide (Discontinue in 13.1)
-- /___/   /\     Filename : RAM64X1S_1.vhd
-- \   \  /  \    Timestamp : Thu Oct 21 01:55:54 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/21/10 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    08/23/13 - PR683925 - add invertible pin support.
-- End Revision:

----- CELL RAM64X1S_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM64X1S_1 is
  generic (
    INIT : bit_vector(63 downto 0) := X"0000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    O : out std_ulogic;

    A0   : in std_ulogic;
    A1   : in std_ulogic;
    A2   : in std_ulogic;
    A3   : in std_ulogic;
    A4   : in std_ulogic;
    A5   : in std_ulogic;
    D    : in std_ulogic;
    WCLK : in std_ulogic;
    WE   : in std_ulogic
);
end RAM64X1S_1;

architecture RAM64X1S_1_V of RAM64X1S_1 is
signal not_WCLK : std_ulogic;
begin
    not_WCLK <= not WCLK;
    R5 : RAM64X1S
    generic map (
      INIT => INIT,
      IS_WCLK_INVERTED => IS_WCLK_INVERTED
    )
    port map (
      O  => O,
      A0  => A0,
      A1  => A1,
      A2  => A2,
      A3  => A3,
      A4  => A4,
      A5  => A5,
      D  => D,
      WCLK  => not_WCLK,
      WE  => WE
);
end RAM64X1S_1_V;
