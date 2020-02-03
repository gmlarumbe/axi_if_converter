-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 2012.3
--  \   \         Description : Xilinx Function Simulation Library Component
--  /   /                  Static Synchronous RAM 64-Deep by 8-Wide
-- /___/   /\     Filename : RAM64M8.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    07/02/12 - Initial version, from RAM64M
--    01/23/13 - 696546 - MEM_e through MEM_h not connected
--    04/29/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM64M8 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM64M8 is
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
    DOA    : out std_ulogic;
    DOB    : out std_ulogic;
    DOC    : out std_ulogic;
    DOD    : out std_ulogic;
    DOE    : out std_ulogic;
    DOF    : out std_ulogic;
    DOG    : out std_ulogic;
    DOH    : out std_ulogic;

    ADDRA : in  std_logic_vector(5 downto 0);
    ADDRB : in  std_logic_vector(5 downto 0);
    ADDRC : in  std_logic_vector(5 downto 0);
    ADDRD : in  std_logic_vector(5 downto 0);
    ADDRE : in  std_logic_vector(5 downto 0);
    ADDRF : in  std_logic_vector(5 downto 0);
    ADDRG : in  std_logic_vector(5 downto 0);
    ADDRH : in  std_logic_vector(5 downto 0);
    DIA   : in  std_ulogic;
    DIB   : in  std_ulogic;
    DIC   : in  std_ulogic;
    DID   : in  std_ulogic;
    DIE   : in  std_ulogic;
    DIF   : in  std_ulogic;
    DIG   : in  std_ulogic;
    DIH   : in  std_ulogic;
    WCLK  : in  std_ulogic;
    WE   : in  std_ulogic
    );
end RAM64M8;

architecture RAM64M8_V of RAM64M8 is

  signal MEM_a : std_logic_vector( 63 downto 0 ) := INIT_A;
  signal MEM_b : std_logic_vector( 63 downto 0 ) := INIT_B;
  signal MEM_c : std_logic_vector( 63 downto 0 ) := INIT_C;
  signal MEM_d : std_logic_vector( 63 downto 0 ) := INIT_D;
  signal MEM_e : std_logic_vector( 63 downto 0 ) := INIT_E;
  signal MEM_f : std_logic_vector( 63 downto 0 ) := INIT_F;
  signal MEM_g : std_logic_vector( 63 downto 0 ) := INIT_G;
  signal MEM_h : std_logic_vector( 63 downto 0 ) := INIT_H;
  signal WCLK_in  : std_ulogic;
  signal ADDRA_in : std_logic_vector(5 downto 0);
  signal ADDRB_in : std_logic_vector(5 downto 0);
  signal ADDRC_in : std_logic_vector(5 downto 0);
  signal ADDRD_in : std_logic_vector(5 downto 0);
  signal ADDRE_in : std_logic_vector(5 downto 0);
  signal ADDRF_in : std_logic_vector(5 downto 0);
  signal ADDRG_in : std_logic_vector(5 downto 0);
  signal ADDRH_in : std_logic_vector(5 downto 0);
  signal DIA_in   : std_ulogic;
  signal DIB_in   : std_ulogic;
  signal DIC_in   : std_ulogic;
  signal DID_in   : std_ulogic;
  signal DIE_in   : std_ulogic;
  signal DIF_in   : std_ulogic;
  signal DIG_in   : std_ulogic;
  signal DIH_in   : std_ulogic;
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

  DOA   <= MEM_a(SLV_TO_INT(SLV => ADDRA_in));
  DOB   <= MEM_b(SLV_TO_INT(SLV => ADDRB_in));
  DOC   <= MEM_c(SLV_TO_INT(SLV => ADDRC_in));
  DOD   <= MEM_d(SLV_TO_INT(SLV => ADDRD_in));
  DOE   <= MEM_e(SLV_TO_INT(SLV => ADDRE_in));
  DOF   <= MEM_f(SLV_TO_INT(SLV => ADDRF_in));
  DOG   <= MEM_g(SLV_TO_INT(SLV => ADDRG_in));
  DOH   <= MEM_h(SLV_TO_INT(SLV => ADDRH_in));

  FunctionalWriteBehavior : process(WCLK_in)
    variable Index   : integer := 63 ;
  begin
    if (rising_edge(WCLK_in)) then
      if (WE_in = '1') then
        Index := SLV_TO_INT(SLV => ADDRH_in);
        MEM_a(Index) <= DIA_in  after 100 ps;
        MEM_b(Index) <= DIB_in  after 100 ps;
        MEM_c(Index) <= DIC_in  after 100 ps;
        MEM_d(Index) <= DID_in  after 100 ps;
        MEM_e(Index) <= DIE_in  after 100 ps;
        MEM_f(Index) <= DIF_in  after 100 ps;
        MEM_g(Index) <= DIG_in  after 100 ps;
        MEM_h(Index) <= DIH_in  after 100 ps;
      end if;
    end if;
  end process FunctionalWriteBehavior;

end RAM64M8_V;
