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
-- /___/   /\     Filename : FRAME_ECC_VIRTEX6.vhd
-- \   \  /  \    Timestamp : Wed Oct 13 03:59:19 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/13/10 - Initial version.

----- CELL FRAME_ECC_VIRTEX6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FRAME_ECC_VIRTEX6 is
    generic (
      FARSRC : string:= "EFAR";
      FRAME_RBT_IN_FILENAME : string := "NONE"
    );

    port (
      CRCERROR             : out std_ulogic;
      ECCERROR             : out std_ulogic;
      ECCERRORSINGLE       : out std_ulogic;
      FAR                  : out std_logic_vector(23 downto 0);
      SYNBIT               : out std_logic_vector(4 downto 0);
      SYNDROME             : out std_logic_vector(12 downto 0);
      SYNDROMEVALID        : out std_ulogic;
      SYNWORD              : out std_logic_vector(6 downto 0)
    );
end FRAME_ECC_VIRTEX6;

architecture FRAME_ECC_VIRTEX6_V of FRAME_ECC_VIRTEX6 is
signal dummy_FAR : std_logic_vector(25 downto 0);
begin
    F4 : FRAME_ECCE2
     generic map(
      FARSRC => FARSRC,
      FRAME_RBT_IN_FILENAME => FRAME_RBT_IN_FILENAME
    )
     port map (
      CRCERROR  => CRCERROR,
      ECCERROR => ECCERROR,
      ECCERRORSINGLE => ECCERRORSINGLE,
      FAR => dummy_FAR,
      SYNBIT => SYNBIT,
      SYNDROME => SYNDROME,
      SYNDROMEVALID => SYNDROMEVALID,
      SYNWORD => SYNWORD
);
      FAR <= dummy_FAR(23 downto 0);
end FRAME_ECC_VIRTEX6_V;


