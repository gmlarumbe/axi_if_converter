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
--  /   /                 Internal Configuration Access Port for Virtex6 (Discontinue in 13.1)
-- /___/   /\     Filename : ICAP_VIRTEX6.vhd
-- \   \  /  \    Timestamp : Wed Oct 13 04:45:14 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/13/10 - Initial version.

----- CELL ICAP_VIRTEX6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity ICAP_VIRTEX6 is
    generic (
      DEVICE_ID : bit_vector := X"04244093";
      ICAP_WIDTH : string := "X8";
      SIM_CFG_FILE_NAME : string := "NONE"
    );

    port (
      BUSY                 : out std_ulogic := '1';
      O                    : out std_logic_vector(31 downto 0);
      CLK                  : in std_ulogic;
      CSB                  : in std_ulogic;
      I                    : in std_logic_vector(31 downto 0);
      RDWRB                : in std_ulogic      
    );
end ICAP_VIRTEX6;

architecture ICAP_VIRTEX6_V of ICAP_VIRTEX6 is
begin
    I5 : ICAPE2
     generic map(
      DEVICE_ID => DEVICE_ID,
      SIM_CFG_FILE_NAME => SIM_CFG_FILE_NAME,
      ICAP_WIDTH => ICAP_WIDTH
    )
     port map (
      O  => O,
      CLK  => CLK,
      CSIB  => CSB,
      I  => I,
      RDWRB  => RDWRB
);
end ICAP_VIRTEX6_V;


