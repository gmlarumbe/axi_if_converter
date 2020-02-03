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
--  /   /                  3-State Diffential Signaling I/O Buffer with BLVDS_25 I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : IOBUFDS_BLVDS_25.vhd
-- \   \  /  \    Timestamp : Thu Aug  12 12:27:30 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL IOBUFDS_BLVDS_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IOBUFDS_BLVDS_25 is
  port(
    O : out std_ulogic;

    IO : inout std_ulogic;

    IOB : inout std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end IOBUFDS_BLVDS_25;

architecture IOBUFDS_BLVDS_25_V of IOBUFDS_BLVDS_25 is
begin
    O2 : OBUFTDS
    generic map (
      IOSTANDARD => "BLVDS_25"
    )
    port map (
      O  => IO,
      OB  => IOB,
      T  => T,
      I => I
);
    I4 : IBUFDS
    generic map (
      IOSTANDARD => "BLVDS_25"
    )
    port map (
      O  => O,
      I => IO,
      IB => IOB
);

end IOBUFDS_BLVDS_25_V;
