-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 64-Deep by 1-Wide
-- /___/   /\     Filename : RAMD64E.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:49 PDT 2004
--  \___\/\___\
--
-- Revision:
--    12/14/10 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/16/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAMD64E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAMD64E is
  generic (
    INIT : bit_vector(63 downto 0) := X"0000000000000000";
    IS_CLK_INVERTED : bit := '0';
    RAM_ADDRESS_MASK : std_logic_vector (1 downto 0) := "00";
    RAM_ADDRESS_SPACE : std_logic_vector (1 downto 0) := "00"
    );

  port (
    O : out std_ulogic;

    CLK   : in std_ulogic;
    I     : in std_ulogic;
    RADR0 : in std_ulogic;
    RADR1 : in std_ulogic;
    RADR2 : in std_ulogic;
    RADR3 : in std_ulogic;
    RADR4 : in std_ulogic;
    RADR5 : in std_ulogic;
    WADR0 : in std_ulogic;
    WADR1 : in std_ulogic;
    WADR2 : in std_ulogic;
    WADR3 : in std_ulogic;
    WADR4 : in std_ulogic;
    WADR5 : in std_ulogic;
    WADR6 : in std_ulogic;
    WADR7 : in std_ulogic;
    WE    : in std_ulogic
    );
end RAMD64E;

architecture RAMD64E_V of RAMD64E is
  signal MEM : std_logic_vector(64 downto 0 ) := ('X' & To_StdLogicVector(INIT) );
  signal CLK_in  : std_ulogic;
  signal RADR_in : std_logic_vector(5 downto 0);
  signal WADR_in : std_logic_vector(7 downto 0);
  signal I_in    : std_ulogic;
  signal WE_in   : std_ulogic;

  signal IS_CLK_INVERTED_BIN : std_ulogic;

begin
  
  CLK_in  <= CLK xor IS_CLK_INVERTED_BIN;
  WE_in   <= WE;
  I_in    <= I;
  RADR_in <= RADR5 & RADR4 & RADR3 & RADR2 & RADR1 & RADR0;
  WADR_in <= WADR7 & WADR6 & WADR5 & WADR4 & WADR3 & WADR2 & WADR1 & WADR0;

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);

  FunctionalReadBehavior : process(RADR_in, MEM)
    variable Index_O : integer := 64;

  begin
    Index_O := SLV_TO_INT(SLV => RADR_in);
    O <= MEM(Index_O);
    
  end process FunctionalReadBehavior;

  
  FunctionalWriteBehavior : process(CLK_in)
    variable Index_WA : integer := 64;

  begin
    Index_WA := SLV_TO_INT(SLV => WADR_in(5 downto 0));

    if ((WE_in = '1') and 
        ((WADR_in(7) = RAM_ADDRESS_SPACE(1)) or (RAM_ADDRESS_MASK(1) = '1')) and 
        ((WADR_in(6) = RAM_ADDRESS_SPACE(0)) or (RAM_ADDRESS_MASK(0) = '1')) and 
        (rising_edge(CLK_in))) then
      MEM(Index_WA) <= I_in after 100 ps;      
    end if;

  end process FunctionalWriteBehavior;
  
end RAMD64E_V;
