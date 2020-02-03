-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2016.1
--  \   \         Description : Xilinx Function Simulation Library Component
--  /   /                  Static Synchronous RAM 64-Deep with 8-bit read and 1-bit write
-- /___/   /\     Filename : RAM64X8SW.vhd
-- \   \  /  \    
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision:
--    11/12/15 - Initial version
-- End Revision
-------------------------------------------------------------------------------

----- CELL RAM64X8SW -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use UNISIM.VPKG.all;

entity RAM64X8SW is
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
    O    : out std_logic_vector(7 downto 0);

    A    : in  std_logic_vector(5 downto 0);
    D    : in  std_ulogic;
    WCLK : in  std_ulogic;
    WE   : in  std_ulogic;
    WSEL : in  std_logic_vector(2 downto 0)
    );
end RAM64X8SW;

architecture RAM64X8SW_V of RAM64X8SW is

  signal MEM_0 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_H;
  signal MEM_1 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_G;
  signal MEM_2 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_F;
  signal MEM_3 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_E;
  signal MEM_4 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_D;
  signal MEM_5 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_C;
  signal MEM_6 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_B;
  signal MEM_7 : std_logic_vector( 64 downto 0 ) := 'X' & INIT_A;
  signal Index : integer := 0;

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

begin

  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);

  Index_p : process
  begin
    if (ADDR_IS_VALID(SLV => A)) then
      Index  <= TO_INTEGER(UNSIGNED(A));
    else
      Index  <= 64;
    end if;
    wait on A;
  end process Index_p;

  ReadBehavior0  : process(MEM_0, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_0(Index)) then
      O_out := MEM_0(Index);
      O(0) <= O_out after 100 ps;
    end if;
  end process ReadBehavior0;

  ReadBehavior1  : process(MEM_1, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_1(Index)) then
      O_out := MEM_1(Index);
      O(1) <= O_out after 100 ps;
    end if;
  end process ReadBehavior1;

  ReadBehavior2  : process(MEM_2, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_2(Index)) then
      O_out := MEM_2(Index);
      O(2) <= O_out after 100 ps;
    end if;
  end process ReadBehavior2;

  ReadBehavior3  : process(MEM_3, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_3(Index)) then
      O_out := MEM_3(Index);
      O(3) <= O_out after 100 ps;
    end if;
  end process ReadBehavior3;

  ReadBehavior4  : process(MEM_4, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_4(Index)) then
      O_out := MEM_4(Index);
      O(4) <= O_out after 100 ps;
    end if;
  end process ReadBehavior4;

  ReadBehavior5  : process(MEM_5, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_5(Index)) then
      O_out := MEM_5(Index);
      O(5) <= O_out after 100 ps;
    end if;
  end process ReadBehavior5;

  ReadBehavior6  : process(MEM_6, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_6(Index)) then
      O_out := MEM_6(Index);
      O(6) <= O_out after 100 ps;
    end if;
  end process ReadBehavior6;

  ReadBehavior7  : process(MEM_7, Index)
    variable O_out : std_ulogic;
  begin
    if (O_out /= MEM_7(Index)) then
      O_out := MEM_7(Index);
      O(7) <= O_out after 100 ps;
    end if;
  end process ReadBehavior7;

  WriteBehavior : process(WCLK)
  begin
    if (xil_pos_edge_inv(WCLK, IS_WCLK_INVERTED_BIN)) then
      if (WE = '1') then
        case (WSEL) is
          when "000" => if (D /= MEM_0(Index)) then MEM_0(Index) <= D; end if;
          when "001" => if (D /= MEM_1(Index)) then MEM_1(Index) <= D; end if;
          when "010" => if (D /= MEM_2(Index)) then MEM_2(Index) <= D; end if;
          when "011" => if (D /= MEM_3(Index)) then MEM_3(Index) <= D; end if;
          when "100" => if (D /= MEM_4(Index)) then MEM_4(Index) <= D; end if;
          when "101" => if (D /= MEM_5(Index)) then MEM_5(Index) <= D; end if;
          when "110" => if (D /= MEM_6(Index)) then MEM_6(Index) <= D; end if;
          when "111" => if (D /= MEM_7(Index)) then MEM_7(Index) <= D; end if;
          when others => null;
        end case;
      end if;
    end if;
  end process WriteBehavior;

end RAM64X8SW_V;
