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
--  /   /                  Static Synchronous RAM 128-Deep by 1-Wide (Discontinue in 13.1)
-- /___/   /\     Filename : RAM128X1S_1.vhd
-- \   \  /  \    Timestamp : Wed Oct 20 04:06:19 PDT 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.
--    10/13/11 - Fixed clock with inversion.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    08/23/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM128X1S_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM128X1S_1 is
  generic (
    INIT : bit_vector(127 downto 0) := X"00000000000000000000000000000000";
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
    A6   : in std_ulogic;
    D    : in std_ulogic;
    WCLK : in std_ulogic;
    WE   : in std_ulogic
    );
end RAM128X1S_1;

architecture RAM128X1S_1_V of RAM128X1S_1 is
  signal WCLK_int : std_ulogic;
begin

  WCLK_int <= not WCLK;
  
    R6 : RAM128X1S
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
      A6  => A6,
      D  => D,
      WCLK  => WCLK_int ,
      WE  => WE
);
end RAM128X1S_1_V;
