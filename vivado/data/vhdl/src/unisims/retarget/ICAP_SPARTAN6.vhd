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
--  /   /                 Internal Configuration Access Port for SPARTAN6 (Discontinue in 13.1)
-- /___/   /\     Filename : ICAP_SPARTAN6.vhd
-- \   \  /  \    Timestamp : Wed Oct 13 04:32:49 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/13/10 - Initial version.

----- CELL ICAP_SPARTAN6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ICAP_SPARTAN6 is
    generic (
      DEVICE_ID : bit_vector := X"04000093";
      SIM_CFG_FILE_NAME : string := "NONE"
    );

    port (
      BUSY                 : out std_ulogic := '1';
      O                    : out std_logic_vector(15 downto 0);
      CE                   : in std_ulogic;
      CLK                  : in std_ulogic;
      I                    : in std_logic_vector(15 downto 0);
      WRITE                : in std_ulogic      
    );
end ICAP_SPARTAN6;

architecture ICAP_SPARTAN6_V of ICAP_SPARTAN6 is
signal dummy_O : std_logic_vector(31 downto 0);
signal dummy_I_bus : std_logic_vector(31 downto 0);
begin
    dummy_I_bus <= X"0000" & I;
    I5 : ICAPE2
     generic map(
      DEVICE_ID => DEVICE_ID,
      ICAP_WIDTH => "X16",
      SIM_CFG_FILE_NAME => SIM_CFG_FILE_NAME
    )
     port map (
      O  => dummy_O,
      CLK  => CLK,
      CSIB  => CE,
      I  => dummy_I_bus,
      RDWRB  => WRITE
);
      O <= dummy_O(15 downto 0);
end ICAP_SPARTAN6_V;


