-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2015.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  32-Bit Shift Register Look-Up-Table with Carry and Clock Enable
-- /___/   /\     Filename    : SRLC32E.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision:
--    03/15/04 - Initial version.
--    04/22/05 - Change input A type from ulogic vector to logic vector.
--    11/28/11 - 591750 - Change bit attribute to std_logic
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/16/13 - 683925 - add invertible pin support.
--    04/22/13 - 714426 - A_in <= A connection missing.
--    04/22/13 - 714490 - infinite loop if CLK stays X or Z causes XSIM to run forever.
-- End Revision
-------------------------------------------------------------------------------

----- CELL SRLC32E -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity SRLC32E is

  generic (
    INIT : bit_vector := X"00000000";
    IS_CLK_INVERTED : bit := '0'
  );

  port (
    Q   : out STD_ULOGIC;
    Q31 : out STD_ULOGIC;
    A   : in STD_LOGIC_VECTOR (4 downto 0) := "00000";
    CE  : in STD_ULOGIC;
    CLK : in STD_ULOGIC;        
    D   : in STD_ULOGIC
  ); 
end SRLC32E;

architecture SRLC32E_V of SRLC32E is

  constant MODULE_NAME : string := "SRLC32E";

  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal first_time : std_ulogic := '1';

  signal Index : integer := 0;

begin

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);

  first_time_p : process
  begin
    wait for 100000 ps;
    first_time <= '0';
    wait;
  end process first_time_p;

  Index_p : process
  variable A_in : std_logic_vector(4 downto 0);
  begin
    A_in := A;
    if (ADDR_IS_VALID(SLV => A_in)) then
      Index <= TO_INTEGER(UNSIGNED(A_in));
    else
      Index <= 0;
    end if;
    wait on A;
  end process Index_p;

  WriteBehavior : process (CLK, Index)
  variable SHIFT_REG : std_logic_vector (31 downto 0) := To_StdLogicVector(INIT);
  variable ignore : boolean := true;
  variable Q_end : std_ulogic;
  variable Q_Index : std_ulogic;
  begin
    if (CLK'event) then
      if ((ignore and (CLK = '0')) or (first_time = '0')) then
        ignore := false;
      end if;
      if (xil_pos_edge_inv(CLK, IS_CLK_INVERTED_BIN) and (CE = '1' or CE = 'Z') and not ignore) then
        SHIFT_REG(31 downto 0) := (SHIFT_REG(30 downto 0) & D);
      end if;
    end if;
    if (Q_Index /= SHIFT_REG(Index)) then
      Q_Index := SHIFT_REG(Index);
      Q <= Q_Index after 100 ps;
    end if;
    if (Q_end /= SHIFT_REG(31)) then
      Q_end := SHIFT_REG(31);
      Q31 <= Q_end after 100 ps;
    end if;
  end process WriteBehavior;
end SRLC32E_V;
