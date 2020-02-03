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
--  /   /                  Transparent Data Latch with Asynchronous Preset and Gate Enable and Inverted Gate (Discontinue in 13.1)
-- /___/   /\     Filename : LDPE_1.vhd
-- \   \  /  \    Timestamp : Tue Aug  18 03:39:19 PDT 2010
--  \___\/\___\
--
-- Revision:
--    08/17/10 - Initial version.
--    05/25/12 - 662144 correct initial value.
-- End Revision

----- CELL LDPE_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity LDPE_1 is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    D   : in std_ulogic;
    G   : in std_ulogic;
    GE  : in std_ulogic;
    PRE : in std_ulogic
    );
end LDPE_1;

architecture LDPE_1_V of LDPE_1 is
signal not_G : std_ulogic;
begin
    not_G <= not G;
    L8 : LDPE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      G  => not_G,
      GE  => GE,
      PRE  => PRE,
      D => D
);
end LDPE_1_V;
