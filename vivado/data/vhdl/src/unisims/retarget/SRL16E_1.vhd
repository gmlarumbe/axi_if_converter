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
--  /   /                 16-Bit Shift Register Look-Up-Table with Clock Enable and Negative-Edge Clock (Discontinue in 13.1)
-- /___/   /\     Filename : SRL16E_1.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 11:02:30 PDT 2010

--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    08/09/12 - 669069 change retarget from SRLC16E to SRL16E
-- End Revision:

----- CELL SRL16E_1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity SRL16E_1 is
  generic (
       INIT : bit_vector := X"0000"
  );

  port (
        Q   : out STD_ULOGIC;
        
        A0  : in STD_ULOGIC;
        A1  : in STD_ULOGIC;
        A2  : in STD_ULOGIC;
        A3  : in STD_ULOGIC;        
        CE  : in STD_ULOGIC;
        CLK : in STD_ULOGIC;
        D   : in STD_ULOGIC
       ); 
end SRL16E_1;

architecture SRL16E_1_V of SRL16E_1 is
signal not_CLK : std_ulogic;
begin
    not_CLK <= not CLK;
    S0 : SRL16E
     generic map(
      INIT => INIT
    )
     port map (
      Q  => Q,
      A0 => A0,
      A1 => A1,
      A2 => A2,
      A3 => A3,
      CE => CE,
      CLK => not_CLK,
      D => D
);
end SRL16E_1_V;


