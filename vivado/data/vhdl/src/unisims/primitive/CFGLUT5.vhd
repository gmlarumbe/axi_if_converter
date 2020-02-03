-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2015.3
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  5-input Dynamically Reconfigurable Look-Up-Table with Carry and Clock Enable 
-- /___/   /\     Filename    : CFGLUT5.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision:
--    12/28/05 - Initial version.
--    04/13/06 - 229735 - Add address declaration.
--    05/13/13 - Add IS_CLK_INVERTED
-- End Revision
-------------------------------------------------------------------------------

----- CELL CFGLUT5 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;

entity CFGLUT5 is

  generic (
    INIT : bit_vector := X"00000000";
    IS_CLK_INVERTED : bit := '0'
  );

  port (
    CDO : out STD_ULOGIC;
    O5  : out STD_ULOGIC;
    O6  : out STD_ULOGIC;
    CDI : in STD_ULOGIC;
    CE  : in STD_ULOGIC;
    CLK : in STD_ULOGIC;        
    I0  : in STD_ULOGIC;
    I1  : in STD_ULOGIC;
    I2  : in STD_ULOGIC;
    I3  : in STD_ULOGIC;
    I4  : in STD_ULOGIC
  ); 
end CFGLUT5;

architecture CFGLUT5_V of CFGLUT5 is

  constant MODULE_NAME : string := "CFGLUT5";

  signal IS_CLK_INVERTED_BIN : std_ulogic;

  signal Index : integer := 0;
  signal Index5 : integer := 0;

begin

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);

  Index_p : process
  variable A_in : std_logic_vector(4 downto 0);
  begin
    A_in := I4 & I3 & I2 & I1 & I0;
    if (ADDR_IS_VALID(SLV => A_in)) then
      Index <= TO_INTEGER(UNSIGNED(A_in));
      Index5 <= TO_INTEGER(UNSIGNED(A_in(3 downto 0)));
    else
      Index <= 0;
      Index5 <= 0;
    end if;
    wait on I4, I3, I2, I1, I0;
  end process Index_p;

  WriteBehavior : process (CLK, Index)
  variable SHIFT_REG : std_logic_vector (31 downto 0) := To_StdLogicVector(INIT);
  variable Q_end : std_ulogic;
  variable Q_Index : std_ulogic;
  variable Q_Index5 : std_ulogic;
  begin
    if (CLK'event) then
      if (xil_pos_edge_inv(CLK, IS_CLK_INVERTED_BIN) and (CE = '1' or CE = 'Z')) then
        SHIFT_REG(31 downto 0) := (SHIFT_REG(30 downto 0) & CDI);
      end if;
    end if;
    if (Q_Index /= SHIFT_REG(Index)) then
      Q_Index := SHIFT_REG(Index);
      O6 <= Q_Index after 100 ps;
    end if;
    if (Q_Index5 /= SHIFT_REG(Index5)) then
      Q_Index5 := SHIFT_REG(Index5);
      O5 <= Q_Index5 after 100 ps;
    end if;
    if (Q_end /= SHIFT_REG(31)) then
      Q_end := SHIFT_REG(31);
      CDO <= Q_end after 100 ps;
    end if;
  end process WriteBehavior;
end CFGLUT5_V;
