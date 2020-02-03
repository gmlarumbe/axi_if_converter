-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/rainier/VITAL/SRL32E.vhd,v 1.1 2008/06/19 16:59:22 vandanad Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Retarget Simulation Library Component
--  /   /                  32-Bit Shift Register Look-Up-Table with Clock Enable
-- /___/   /\     Filename : SRL32E.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    03/15/04 - Initial version.
--    04/22/05 - Change input A type from ulogic vector to logic vector.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    01/03/13 - 677832 - Moved to retarget -> SRLC32E
-- End Revision

----- CELL SRL32E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity SRL32E is

  generic (
       INIT : bit_vector := X"00000000"
  );

  port (
        Q   : out STD_ULOGIC;

        A   : in STD_LOGIC_VECTOR (4 downto 0) := "00000";
        CE  : in STD_ULOGIC;
        CLK : in STD_ULOGIC;        
        D   : in STD_ULOGIC
       ); 
end SRL32E;

architecture SRL32E_V of SRL32E is
signal Q31 : std_ulogic;
begin
    S0 : SRLC32E
     generic map(
      INIT => INIT
    )
     port map (
      Q  => Q,
      Q31 => Q31,
      A => A,
      CE => CE,
      CLK => CLK,
      D => D
);
end SRL32E_V;


