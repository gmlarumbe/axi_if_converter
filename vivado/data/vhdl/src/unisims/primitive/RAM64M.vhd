-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Function Simulation Library Component
--  /   /                  Static Synchronous RAM 64-Deep by 4-Wide
-- /___/   /\     Filename : RAM64M.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    03/23/06 - Initial version.
--    11/28/11 - Change bit attribute to std_logic (CR591750)
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/18/13 - PR683925 - add invertible pin support.
-- End Revision

----- CELL RAM64M -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity RAM64M is
  generic (
    INIT_A : bit_vector(63 downto 0) := X"0000000000000000";
    INIT_B : bit_vector(63 downto 0) := X"0000000000000000";
    INIT_C : bit_vector(63 downto 0) := X"0000000000000000";
    INIT_D : bit_vector(63 downto 0) := X"0000000000000000";
    IS_WCLK_INVERTED : bit := '0'
    );

  port (
    DOA    : out std_ulogic;
    DOB    : out std_ulogic;
    DOC    : out std_ulogic;
    DOD    : out std_ulogic;

    ADDRA : in  std_logic_vector(5 downto 0);
    ADDRB : in  std_logic_vector(5 downto 0);
    ADDRC : in  std_logic_vector(5 downto 0);
    ADDRD : in  std_logic_vector(5 downto 0);
    DIA   : in  std_ulogic;
    DIB   : in  std_ulogic;
    DIC   : in  std_ulogic;
    DID   : in  std_ulogic;
    WCLK  : in  std_ulogic;
    WE   : in  std_ulogic
    );
end RAM64M;

architecture RAM64M_V of RAM64M is

  signal MEM_a : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_A) );
  signal MEM_b : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_B) );
  signal MEM_c : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_C) );
  signal MEM_d : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_D) );
  signal WCLK_in : std_ulogic;
  signal ADDRA_in : std_logic_vector(5 downto 0);
  signal ADDRB_in : std_logic_vector(5 downto 0); 
  signal ADDRC_in : std_logic_vector(5 downto 0); 
  signal ADDRD_in : std_logic_vector(5 downto 0); 
  signal DIA_in   : std_ulogic;
  signal DIB_in   : std_ulogic;
  signal DIC_in   : std_ulogic;
  signal DID_in   : std_ulogic;
  signal WE_in    : std_ulogic;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin

  WCLK_in <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in   <= WE;
  ADDRA_in <= ADDRA;
  ADDRB_in <= ADDRB;
  ADDRC_in <= ADDRC;
  ADDRD_in <= ADDRD;
  DIA_in   <= DIA;
  DIB_in   <= DIB;
  DIC_in   <= DIC;
  DID_in   <= DID;

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  DOA   <= MEM_a(SLV_TO_INT(SLV => ADDRA_in));
  DOB   <= MEM_b(SLV_TO_INT(SLV => ADDRB_in));
  DOC   <= MEM_c(SLV_TO_INT(SLV => ADDRC_in));
  DOD   <= MEM_d(SLV_TO_INT(SLV => ADDRD_in));

  FunctionalWriteBehavior : process(WCLK_in)
    variable Index   : integer := 64 ;
  begin
    if (rising_edge(WCLK_in)) then
      if (WE_in = '1') then
        Index                  := SLV_TO_INT(SLV => ADDRD_in);
        MEM_a(Index) <= DIA_in  after 100 ps;
        MEM_b(Index) <= DIB_in  after 100 ps;
        MEM_c(Index) <= DIC_in  after 100 ps;
        MEM_d(Index) <= DID_in  after 100 ps;
      end if;
    end if;
  end process FunctionalWriteBehavior;

end RAM64M_V;
