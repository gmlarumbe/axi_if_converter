-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 128-Deep by 1-Wide
-- /___/   /\     Filename : RAM128X1D.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:49 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/15/05 - Initial version.
--    09/21/05 - Use SLV_TO_INT to decode the address. (CR 217651)
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/18/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM128X1D -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity RAM128X1D is
  generic (
    INIT : bit_vector(127 downto 0) := X"00000000000000000000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    DPO : out std_ulogic;
    SPO : out std_ulogic;

    A     : in std_logic_vector(6 downto 0);
    D     : in std_ulogic;
    DPRA  : in std_logic_vector(6 downto 0);
    WCLK  : in std_ulogic;
    WE    : in std_ulogic
    );
end RAM128X1D;

architecture RAM128X1D_V of RAM128X1D is
  signal MEM : std_ulogic_vector( 128 downto 0 ) :=  ('X' & TO_STDULOGICVECTOR(INIT));
  signal WCLK_in : std_ulogic;
  signal A_in    : std_logic_vector(6 downto 0);
  signal D_in    : std_ulogic;
  signal DPRA_in : std_logic_vector(6 downto 0);
  signal WE_in   : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic := '0';

begin

  WCLK_in <= WCLK xor IS_WCLK_INVERTED_BIN ;
  WE_in   <= WE;
  A_in    <= A;
  DPRA_in <= DPRA;
  D_in    <= D;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  ReadBehavior   : process(A_in, DPRA_in, MEM)
    variable Index_SP : integer := 128;
    variable Index_DP : integer := 128;
  begin
    Index_SP := SLV_TO_INT(SLV => A_in);
    Index_DP := SLV_TO_INT(SLV => DPRA_in);
    SPO <= MEM(Index_SP);
    DPO <= MEM(Index_DP);      
  end process ReadBehavior;

 WriteBehavior  : process(WCLK_in)
    variable Index_SP : integer := 128;
  begin
    Index_SP := SLV_TO_INT(SLV => A_in );
    if ((WE_in = '1') and (WCLK_in'event) and (WCLK_in'last_value = '0') and (WCLK_in = '1')) then
      MEM(Index_SP) <= D_in after 100 ps;      
    end if;
  end process WriteBehavior;

end RAM128X1D_V;


