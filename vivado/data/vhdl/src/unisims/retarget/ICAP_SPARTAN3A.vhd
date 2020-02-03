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
--  /   /                 Internal Configuration Access Port for SPARTAN3A (Discontinue in 13.1)
-- /___/   /\     Filename : ICAP_SPARTAN3A.vhd
-- \   \  /  \    Timestamp : Wed Oct 13 04:28:25 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/13/10 - Initial version.

----- CELL ICAP_SPARTAN3A -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ICAP_SPARTAN3A is
  port(
    BUSY : out std_ulogic;
    O    : out std_logic_vector(7 downto 0);

    CE    : in std_ulogic;
    CLK   : in std_ulogic;
    I     : in std_logic_vector(7 downto 0);
    WRITE : in std_ulogic
    );
end ICAP_SPARTAN3A;

architecture ICAP_SPARTAN3A_V of ICAP_SPARTAN3A is
signal dummy_O : std_logic_vector(31 downto 0);
signal dummy_I_bus : std_logic_vector(31 downto 0);
begin
    dummy_I_bus <= X"000000" & I;
    I5 : ICAPE2
     generic map (
	ICAP_WIDTH => "X8"
     )
     port map (
      O  => dummy_O,
      CLK  => CLK,
      CSIB  => CE,
      I  => dummy_I_bus,
      RDWRB  => WRITE
);
      O <= dummy_O(7 downto 0);
end ICAP_SPARTAN3A_V;


