-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2015.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  16-Bit Shift Register Look-Up-Table with Clock Enable
-- /___/   /\     Filename    : SRL16E.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision:
--    03/23/04 - Initial version.
--    11/28/11 - 591750 - Change bit attribute to std_logic
--    01/16/12 - 591750, 586884 - revert change severe IP impact.
--    04/16/13 - 683925 - add invertible pin support.
--    04/22/13 - 714490 - infinite loop if CLK stays X or Z causes XSIM to run forever.
-- End Revision
-------------------------------------------------------------------------------

----- CELL SRL16E -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity SRL16E is

  generic (
    INIT : bit_vector := X"0000";
    IS_CLK_INVERTED : bit := '0'
  );

  port (
    Q   : out STD_ULOGIC;
    A0  : in STD_ULOGIC;
    A1  : in STD_ULOGIC;
    A2  : in STD_ULOGIC;
    A3  : in STD_ULOGIC;
    CE  : in STD_ULOGIC;
    CLK : in STD_ULOGIC;        
    D   : in STD_ULOGIC
  ); 
end SRL16E;

architecture SRL16E_V of SRL16E is

  constant MODULE_NAME : string := "SRL16E";

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
  variable A_in : std_logic_vector(3 downto 0);
  begin
    A_in := A3 & A2 & A1 & A0;
    if (ADDR_IS_VALID(SLV => A_in)) then
      Index <= TO_INTEGER(UNSIGNED(A_in));
    else
      Index <= 0;
    end if;
    wait on A3, A2, A1, A0;
  end process Index_p;

  WriteBehavior : process (CLK, Index)
  variable SHIFT_REG : std_logic_vector (16 downto 0) := ('X' & To_StdLogicVector(INIT));
  variable ignore : boolean := true;
  variable Q_end : std_ulogic;
  variable Q_Index : std_ulogic;
  begin
    if (CLK'event) then
      if ((ignore and (CLK = '0')) or (first_time = '0')) then
        ignore := false;
      end if;
      if (xil_pos_edge_inv(CLK, IS_CLK_INVERTED_BIN) and (CE = '1' or CE = 'Z') and not ignore) then
        SHIFT_REG(15 downto 0) := (SHIFT_REG(14 downto 0) & D);
      end if;
    end if;
    if (Q_Index /= SHIFT_REG(Index)) then
      Q_Index := SHIFT_REG(Index);
      Q <= Q_Index after 100 ps;
    end if;
  end process WriteBehavior;
end SRL16E_V;
