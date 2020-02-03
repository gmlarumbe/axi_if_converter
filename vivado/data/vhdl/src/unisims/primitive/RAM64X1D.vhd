-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 64-Deep by 1-Wide
-- /___/   /\     Filename : RAM64X1D.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:49 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/18/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM64X1D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAM64X1D is
  generic (
    INIT : bit_vector(63 downto 0) := X"0000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    DPO : out std_ulogic;
    SPO : out std_ulogic;

    A0    : in std_ulogic;
    A1    : in std_ulogic;
    A2    : in std_ulogic;
    A3    : in std_ulogic;
    A4    : in std_ulogic;
    A5    : in std_ulogic;
    D     : in std_ulogic;
    DPRA0 : in std_ulogic;
    DPRA1 : in std_ulogic;
    DPRA2 : in std_ulogic;
    DPRA3 : in std_ulogic;
    DPRA4 : in std_ulogic;
    DPRA5 : in std_ulogic;
    WCLK  : in std_ulogic;
    WE    : in std_ulogic
    );
end RAM64X1D;

architecture RAM64X1D_V of RAM64X1D is
  signal MEM : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT) );
  signal WCLK_in : std_ulogic;
  signal DPRA_in : std_logic_vector(5 downto 0);
  signal A_in    : std_logic_vector(5 downto 0);
  signal D_in    : std_ulogic;
  signal WE_in   : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin
  WCLK_in <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in   <= WE;
  DPRA_in <= DPRA5 & DPRA4 & DPRA3 & DPRA2 & DPRA1 & DPRA0;
  A_in    <= A5 & A4 & A3 & A2 & A1 & A0;
  D_in    <= D;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  FunctionalReadBehavior   : process(A_in, DPRA_in, MEM)
    variable Index_SP : integer := 64;
    variable Index_DP : integer := 64;

  begin
    Index_SP := SLV_TO_INT(SLV => A_in);
    Index_DP := SLV_TO_INT(SLV => DPRA_in);
    SPO <= MEM(Index_SP);
    DPO <= MEM(Index_DP);      
  end process FunctionalReadBehavior;

  FunctionalWriteBehavior  : process(WCLK_in)
    variable Index_SP : integer := 32;
    variable Index_DP : integer := 32;

  begin
    Index_SP := SLV_TO_INT(SLV => A_in );
    if ((WE_in = '1') and (WCLK_in'event) and (WCLK_in'last_value = '0') and (WCLK_in = '1')) then
      MEM(Index_SP) <= D_in after 100 ps;      
    end if;
  end process FunctionalWriteBehavior;
end RAM64X1D_V;


