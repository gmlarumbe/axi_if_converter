-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 2012.2
--  \   \         Description : Xilinx Function Simulation Library Component
--  /   /                  Static Synchronous RAM 32-Deep by 16-Wide
-- /___/   /\     Filename : RAM32M16.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    07/02/12 - Initial version, from RAM32M
--    04/29/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM32M16 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM32M16 is
  generic (
      INIT_A : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_B : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_C : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_D : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_E : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_F : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_G : std_logic_vector(63 downto 0) := X"0000000000000000";
      INIT_H : std_logic_vector(63 downto 0) := X"0000000000000000";
      IS_WCLK_INVERTED : bit := '0'
    );

  port (
    DOA    : out std_logic_vector (1 downto 0);
    DOB    : out std_logic_vector (1 downto 0);
    DOC    : out std_logic_vector (1 downto 0);
    DOD    : out std_logic_vector (1 downto 0);
    DOE    : out std_logic_vector (1 downto 0);
    DOF    : out std_logic_vector (1 downto 0);
    DOG    : out std_logic_vector (1 downto 0);
    DOH    : out std_logic_vector (1 downto 0);

    ADDRA : in  std_logic_vector(4 downto 0);
    ADDRB : in  std_logic_vector(4 downto 0);
    ADDRC : in  std_logic_vector(4 downto 0);
    ADDRD : in  std_logic_vector(4 downto 0);
    ADDRE : in  std_logic_vector(4 downto 0);
    ADDRF : in  std_logic_vector(4 downto 0);
    ADDRG : in  std_logic_vector(4 downto 0);
    ADDRH : in  std_logic_vector(4 downto 0);
    DIA   : in  std_logic_vector (1 downto 0);
    DIB   : in  std_logic_vector (1 downto 0);
    DIC   : in  std_logic_vector (1 downto 0);
    DID   : in  std_logic_vector (1 downto 0);
    DIE   : in  std_logic_vector (1 downto 0);
    DIF   : in  std_logic_vector (1 downto 0);
    DIG   : in  std_logic_vector (1 downto 0);
    DIH   : in  std_logic_vector (1 downto 0);
    WCLK  : in  std_ulogic;
    WE   : in  std_ulogic
    );
end RAM32M16;

architecture RAM32M16_V of RAM32M16 is

  signal MEM_a : std_logic_vector( 63 downto 0 ) := INIT_A;
  signal MEM_b : std_logic_vector( 63 downto 0 ) := INIT_B;
  signal MEM_c : std_logic_vector( 63 downto 0 ) := INIT_C;
  signal MEM_d : std_logic_vector( 63 downto 0 ) := INIT_D;
  signal MEM_e : std_logic_vector( 63 downto 0 ) := INIT_E;
  signal MEM_f : std_logic_vector( 63 downto 0 ) := INIT_F;
  signal MEM_g : std_logic_vector( 63 downto 0 ) := INIT_G;
  signal MEM_h : std_logic_vector( 63 downto 0 ) := INIT_H;
  signal WCLK_in  : std_ulogic;
  signal ADDRA_in : std_logic_vector(4 downto 0);
  signal ADDRB_in : std_logic_vector(4 downto 0);
  signal ADDRC_in : std_logic_vector(4 downto 0);
  signal ADDRD_in : std_logic_vector(4 downto 0);
  signal ADDRE_in : std_logic_vector(4 downto 0);
  signal ADDRF_in : std_logic_vector(4 downto 0);
  signal ADDRG_in : std_logic_vector(4 downto 0);
  signal ADDRH_in : std_logic_vector(4 downto 0);
  signal DIA_in   : std_logic_vector (1 downto 0);
  signal DIB_in   : std_logic_vector (1 downto 0);
  signal DIC_in   : std_logic_vector (1 downto 0);
  signal DID_in   : std_logic_vector (1 downto 0);
  signal DIE_in   : std_logic_vector (1 downto 0);
  signal DIF_in   : std_logic_vector (1 downto 0);
  signal DIG_in   : std_logic_vector (1 downto 0);
  signal DIH_in   : std_logic_vector (1 downto 0);
  signal WE_in    : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin

  WCLK_in  <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in    <= WE;
  ADDRA_in <= ADDRA;
  ADDRB_in <= ADDRB;
  ADDRC_in <= ADDRC;
  ADDRD_in <= ADDRD;
  ADDRE_in <= ADDRE;
  ADDRF_in <= ADDRF;
  ADDRG_in <= ADDRG;
  ADDRH_in <= ADDRH;
  DIA_in   <= DIA;
  DIB_in   <= DIB;
  DIC_in   <= DIC;
  DID_in   <= DID;
  DIE_in   <= DIE;
  DIF_in   <= DIF;
  DIG_in   <= DIG;
  DIH_in   <= DIH;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  QA_P : process ( ADDRA_in, MEM_a) 
    variable Index_a : integer := 62;
  begin
    Index_a := 2 * SLV_TO_INT(SLV => ADDRA_in);
    DOA(0) <= MEM_a(Index_a);
    DOA(1) <= MEM_a(Index_a + 1);
  end process QA_P;

  QB_P : process ( ADDRB_in, MEM_b) 
    variable Index_b : integer := 62;
  begin
    Index_b := 2 * SLV_TO_INT(SLV => ADDRB_in);
    DOB(0) <= MEM_b(Index_b);
    DOB(1) <= MEM_b(Index_b + 1);
  end process QB_P;

  QC_P : process ( ADDRC_in, MEM_c) 
    variable Index_c : integer := 62;
  begin
    Index_c := 2 * SLV_TO_INT(SLV => ADDRC_in);
    DOC(0) <= MEM_c(Index_c);
    DOC(1) <= MEM_c(Index_c + 1);
  end process QC_P;

  QD_P : process ( ADDRD_in, MEM_d) 
    variable Index_d : integer := 62;
  begin
    Index_d := 2 * SLV_TO_INT(SLV => ADDRD_in);
    DOD(0) <= MEM_d(Index_d);
    DOD(1) <= MEM_d(Index_d + 1);
  end process QD_P;

  QE_P : process ( ADDRE_in, MEM_e) 
    variable Index_e : integer := 62;
  begin
    Index_e := 2 * SLV_TO_INT(SLV => ADDRE_in);
    DOE(0) <= MEM_e(Index_e);
    DOE(1) <= MEM_e(Index_e + 1);
  end process QE_P;

  QF_P : process ( ADDRF_in, MEM_f) 
    variable Index_f : integer := 62;
  begin
    Index_f := 2 * SLV_TO_INT(SLV => ADDRF_in);
    DOF(0) <= MEM_f(Index_f);
    DOF(1) <= MEM_f(Index_f + 1);
  end process QF_P;

  QG_P : process ( ADDRG_in, MEM_g) 
    variable Index_g : integer := 62;
  begin
    Index_g := 2 * SLV_TO_INT(SLV => ADDRG_in);
    DOG(0) <= MEM_g(Index_g);
    DOG(1) <= MEM_g(Index_g + 1);
  end process QG_P;

  QH_P : process ( ADDRH_in, MEM_h) 
    variable Index_h : integer := 62;
  begin
    Index_h := 2 * SLV_TO_INT(SLV => ADDRH_in);
    DOH(0) <= MEM_h(Index_h);
    DOH(1) <= MEM_h(Index_h + 1);
  end process QH_P;

  FunctionalWriteBehavior : process(WCLK_in)
    variable Index   : integer := 62 ;
  begin
    if (rising_edge(WCLK_in)) then
      if (WE_in = '1') then
        Index := 2 * SLV_TO_INT(SLV => ADDRH_in);
        MEM_a(Index) <= DIA_in(0)  after 100 ps;
        MEM_a(Index+1) <= DIA_in(1) after 100 ps;
        MEM_b(Index) <= DIB_in(0)  after 100 ps;
        MEM_b(Index+1) <= DIB_in(1) after 100 ps;
        MEM_c(Index) <= DIC_in(0)  after 100 ps;
        MEM_c(Index+1) <= DIC_in(1) after 100 ps;
        MEM_d(Index) <= DID_in(0)  after 100 ps;
        MEM_d(Index+1) <= DID_in(1)  after 100 ps;
        MEM_e(Index) <= DIE_in(0)  after 100 ps;
        MEM_e(Index+1) <= DIE_in(1)  after 100 ps;
        MEM_f(Index) <= DIF_in(0)  after 100 ps;
        MEM_f(Index+1) <= DIF_in(1)  after 100 ps;
        MEM_g(Index) <= DIG_in(0)  after 100 ps;
        MEM_g(Index+1) <= DIG_in(1)  after 100 ps;
        MEM_h(Index) <= DIH_in(0)  after 100 ps;
        MEM_h(Index+1) <= DIH_in(1)  after 100 ps;
      end if;
    end if;
  end process FunctionalWriteBehavior;

end RAM32M16_V;

