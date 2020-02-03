-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 32-Deep by 1-Wide
-- /___/   /\     Filename : RAM32X1D.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:48 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/18/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM32X1D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAM32X1D is

  generic (
    INIT : bit_vector(31 downto 0) := X"00000000";
    IS_WCLK_INVERTED : bit := '0'
  );

  port (
    DPO   : out std_ulogic;        
    SPO   : out std_ulogic;

    A0    : in std_ulogic;
    A1    : in std_ulogic;
    A2    : in std_ulogic;
    A3    : in std_ulogic;
    A4    : in std_ulogic;
    D     : in std_ulogic;
    DPRA0 : in std_ulogic;
    DPRA1 : in std_ulogic;
    DPRA2 : in std_ulogic;
    DPRA3 : in std_ulogic;
    DPRA4 : in std_ulogic;
    WCLK  : in std_ulogic;        
    WE    : in std_ulogic
    );
end RAM32X1D;
architecture RAM32X1D_V of RAM32X1D is
  signal MEM      : std_logic_vector( 32 downto 0 ) := ('X' & To_StdLogicVector(INIT) );
  signal WCLK_in  : std_ulogic;
  signal DPRA_in  : std_logic_vector(4 downto 0);
  signal A_in     : std_logic_vector(4 downto 0);
  signal D_in     : std_ulogic;
  signal WE_in    : std_ulogic;
  signal Index_SP : integer := 0;
  signal Index_DP : integer := 0;

begin

  WCLK_in  <= WCLK;
  WE_in    <= WE;
  A_in     <= A4 & A3 & A2 & A1 & A0;
  DPRA_in  <= DPRA4 & DPRA3 & DPRA2 & DPRA1 & DPRA0;
  D_in     <= D;
  Index_SP <= TO_INTEGER(UNSIGNED(A_in))    when ADDR_IS_VALID(SLV => A_in)    else 32;
  Index_DP <= TO_INTEGER(UNSIGNED(DPRA_in)) when ADDR_IS_VALID(SLV => DPRA_in) else 32;
  SPO <= MEM(Index_SP);
  DPO <= MEM(Index_DP);      

 FunctionalWriteBehavior : process(WCLK_in)
  begin 
    if (WE_in = '1') then
      if ((rising_edge (WCLK_in) and IS_WCLK_INVERTED = '0') or
          (falling_edge(WCLK_in) and IS_WCLK_INVERTED = '1')) then
         MEM(Index_SP) <= D_in after 100 ps;            
      end if;
    end if;
  end process FunctionalWriteBehavior;
end RAM32X1D_V;
 

