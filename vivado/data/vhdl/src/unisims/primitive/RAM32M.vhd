-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Function Simulation Library Component
--  /   /                  Static Synchronous RAM 32-Deep by 8-Wide
-- /___/   /\     Filename : RAM32M.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    03/23/06 - Initial version.
--    02/12/07 - Change MEM_a in QB_P process to MEM_b (CR 434008)
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/18/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM32M -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM32M is
  generic (
    INIT_A : bit_vector(63 downto 0) := X"0000000000000000";
    INIT_B : bit_vector(63 downto 0) := X"0000000000000000";
    INIT_C : bit_vector(63 downto 0) := X"0000000000000000";
    INIT_D : bit_vector(63 downto 0) := X"0000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    DOA    : out std_logic_vector (1 downto 0);
    DOB    : out std_logic_vector (1 downto 0);
    DOC    : out std_logic_vector (1 downto 0);
    DOD    : out std_logic_vector (1 downto 0);

    ADDRA : in  std_logic_vector(4 downto 0);
    ADDRB : in  std_logic_vector(4 downto 0);
    ADDRC : in  std_logic_vector(4 downto 0);
    ADDRD : in  std_logic_vector(4 downto 0);
    DIA   : in  std_logic_vector (1 downto 0);
    DIB   : in  std_logic_vector (1 downto 0);
    DIC   : in  std_logic_vector (1 downto 0);
    DID   : in  std_logic_vector (1 downto 0);
    WCLK  : in  std_ulogic;
    WE   : in  std_ulogic
    );
end RAM32M;

architecture RAM32M_V of RAM32M is

  signal MEM_a : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_A) );
  signal MEM_b : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_B) );
  signal MEM_c : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_C) );
  signal MEM_d : std_logic_vector( 65 downto 0 ) := ("XX" & To_StdLogicVector(INIT_D) );
  signal WCLK_in  : std_ulogic;
  signal ADDRA_in : std_logic_vector(4 downto 0);
  signal ADDRB_in : std_logic_vector(4 downto 0);
  signal ADDRC_in : std_logic_vector(4 downto 0);
  signal ADDRD_in : std_logic_vector(4 downto 0);
  signal DIA_in   : std_logic_vector (1 downto 0);
  signal DIB_in   : std_logic_vector (1 downto 0);
  signal DIC_in   : std_logic_vector (1 downto 0);
  signal DID_in   : std_logic_vector (1 downto 0);
  signal WE_in    : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin

  WCLK_in  <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in    <= WE;
  ADDRA_in <= ADDRA;
  ADDRB_in <= ADDRB;
  ADDRC_in <= ADDRC;
  ADDRD_in <= ADDRD;
  DIA_in   <= DIA;
  DIB_in   <= DIB;
  DIC_in   <= DIC;
  DID_in   <= DID;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  QA_P : process ( ADDRA_in, MEM_a) 
    variable Index_a : integer := 32;
  begin
    Index_a := 2 * SLV_TO_INT(SLV => ADDRA_in);
    DOA(0) <= MEM_a(Index_a);
    DOA(1) <= MEM_a(Index_a + 1);
  end process QA_P;

  QB_P : process ( ADDRB_in, MEM_b) 
    variable Index_b : integer := 32;
  begin
    Index_b := 2 * SLV_TO_INT(SLV => ADDRB_in);
    DOB(0) <= MEM_b(Index_b);
    DOB(1) <= MEM_b(Index_b + 1);
  end process QB_P;

  QC_P : process ( ADDRC_in, MEM_c) 
    variable Index_c : integer := 32;
  begin
    Index_c := 2 * SLV_TO_INT(SLV => ADDRC_in);
    DOC(0) <= MEM_c(Index_c);
    DOC(1) <= MEM_c(Index_c + 1);
  end process QC_P;

  QD_P : process ( ADDRD_in, MEM_d) 
    variable Index_d : integer := 32;
  begin
    Index_d := 2 * SLV_TO_INT(SLV => ADDRD_in);
    DOD(0) <= MEM_d(Index_d);
    DOD(1) <= MEM_d(Index_d + 1);
  end process QD_P;

  FunctionalWriteBehavior : process(WCLK_in)
    variable Index   : integer := 32 ;
  begin
    if (rising_edge(WCLK_in)) then
      if (WE_in = '1') then
        Index                  := 2 * SLV_TO_INT(SLV => ADDRD_in);
        MEM_a(Index) <= DIA_in(0)  after 100 ps;
        MEM_a(Index+1) <= DIA_in(1) after 100 ps;
        MEM_b(Index) <= DIB_in(0)  after 100 ps;
        MEM_b(Index+1) <= DIB_in(1) after 100 ps;
        MEM_c(Index) <= DIC_in(0)  after 100 ps;
        MEM_c(Index+1) <= DIC_in(1) after 100 ps;
        MEM_d(Index) <= DID_in(0)  after 100 ps;
        MEM_d(Index+1) <= DID_in(1)  after 100 ps;
      end if;
    end if;
  end process FunctionalWriteBehavior;

end RAM32M_V;

