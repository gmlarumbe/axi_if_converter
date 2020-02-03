-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 2012.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 256-Deep by 1-Wide
-- /___/   /\     Filename : RAM256X1D.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    07/02/12 - Initial version, from RAM128X1D
--    09/17/12 - 678604 - fix compilation errors
--    04/29/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM256X1D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAM256X1D is
  generic (
    INIT : std_logic_vector(255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    DPO : out std_ulogic;
    SPO : out std_ulogic;

    A     : in std_logic_vector(7 downto 0);
    D     : in std_ulogic;
    DPRA  : in std_logic_vector(7 downto 0);
    WCLK  : in std_ulogic;
    WE    : in std_ulogic
    );
end RAM256X1D;

architecture RAM256X1D_V of RAM256X1D is
  signal MEM : std_logic_vector( 255 downto 0 ) :=  INIT;
  signal WCLK_in : std_ulogic;
  signal A_in    : std_logic_vector(7 downto 0);
  signal D_in    : std_ulogic;
  signal DPRA_in : std_logic_vector(7 downto 0);
  signal WE_in   : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin

  WCLK_in <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in   <= WE;
  A_in    <= A;
  DPRA_in <= DPRA;
  D_in    <= D;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  ReadBehavior   : process(A_in, DPRA_in, MEM)
    variable Index_SP : integer := 256;
    variable Index_DP : integer := 256;
  begin
    Index_SP := SLV_TO_INT(SLV => A_in);
    Index_DP := SLV_TO_INT(SLV => DPRA_in);
    SPO <= MEM(Index_SP);
    DPO <= MEM(Index_DP);      
  end process ReadBehavior;

 WriteBehavior  : process(WCLK_in)
    variable Index_SP : integer := 256;
  begin
    Index_SP := SLV_TO_INT(SLV => A_in );
    if ((WE_in = '1') and rising_edge(WCLK_in)) then
      MEM(Index_SP) <= D_in after 100 ps;      
    end if;
  end process WriteBehavior;

end RAM256X1D_V;
