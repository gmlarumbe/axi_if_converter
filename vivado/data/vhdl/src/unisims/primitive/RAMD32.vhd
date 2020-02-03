-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 32-Deep by 1-Wide
-- /___/   /\     Filename : RAMD32.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:49 PDT 2004
--  \___\/\___\
--
-- Revision:
--    12/14/10 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/16/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAMD32 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAMD32 is
  generic (
    INIT : bit_vector(31 downto 0) := X"00000000";
    IS_CLK_INVERTED : bit := '0'
    );

  port (
    O : out std_ulogic;

    CLK  : in std_ulogic;
    I     : in std_ulogic;
    RADR0 : in std_ulogic;
    RADR1 : in std_ulogic;
    RADR2 : in std_ulogic;
    RADR3 : in std_ulogic;
    RADR4 : in std_ulogic;
    WADR0    : in std_ulogic;
    WADR1    : in std_ulogic;
    WADR2    : in std_ulogic;
    WADR3    : in std_ulogic;
    WADR4    : in std_ulogic;
    WE    : in std_ulogic
    );
end RAMD32;

architecture RAMD32_V of RAMD32 is
  signal MEM : std_logic_vector(31 downto 0) := (To_StdLogicVector(INIT));
  signal CLK_in  : std_ulogic;
  signal RADR_in : std_logic_vector(4 downto 0);
  signal WADR_in : std_logic_vector(4 downto 0); 
  signal I_in    : std_ulogic;
  signal WE_in   : std_ulogic;

  signal IS_CLK_INVERTED_BIN : std_ulogic;

begin
  
  CLK_in  <= CLK xor IS_CLK_INVERTED_BIN;
  WE_in   <= WE;
  RADR_in <= RADR4 & RADR3 & RADR2 & RADR1 & RADR0;
  WADR_in <= WADR4 & WADR3 & WADR2 & WADR1 & WADR0;
  I_in    <= I;

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);

  FunctionalReadBehavior : process(RADR_in, MEM)
    variable Index_O : integer := 32;

  begin
    Index_O := SLV_TO_INT(SLV => RADR_in);
    O <= MEM(Index_O);
    
  end process FunctionalReadBehavior;
  
  FunctionalWriteBehavior : process(CLK_in)
    variable Index_WA : integer := 32;

  begin
    Index_WA := SLV_TO_INT(SLV => WADR_in);

    if ((WE_in = '1') and (rising_edge(CLK_in))) then
      MEM(Index_WA) <= I_in after 100 ps;      
    end if;

  end process FunctionalWriteBehavior;
  
end RAMD32_V;
