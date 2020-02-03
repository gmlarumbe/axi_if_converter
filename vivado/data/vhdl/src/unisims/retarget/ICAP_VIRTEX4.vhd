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
--  /   /                 Internal Configuration Access Port for Virtex4 (Discontinue in 13.1)
-- /___/   /\     Filename : ICAP_VIRTEX4.vhd
-- \   \  /  \    Timestamp : Wed Oct 13 04:38:35 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/13/10 - Initial version.

----- CELL ICAP_VIRTEX4 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ICAP_VIRTEX4 is
  generic(
    ICAP_WIDTH : string := "X8"
    );


  port(
    BUSY : out std_ulogic;
    O    : out std_logic_vector(31 downto 0);

    CE    : in std_ulogic;
    CLK   : in std_ulogic;
    I     : in std_logic_vector(31 downto 0);
    WRITE : in std_ulogic
    );
end ICAP_VIRTEX4;

architecture ICAP_VIRTEX4_V of ICAP_VIRTEX4 is
begin
    I5 : ICAPE2
     generic map(
      ICAP_WIDTH => ICAP_WIDTH
    )
     port map (
      O  => O,
      CLK  => CLK,
      CSIB  => CE,
      I  => I,
      RDWRB  => WRITE
);
end ICAP_VIRTEX4_V;


