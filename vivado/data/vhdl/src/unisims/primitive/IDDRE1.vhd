-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2015.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Dedicated Dual Data Rate (DDR) Input Register
-- /___/   /\      Filename    : IDDRE1.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- End Revision
-------------------------------------------------------------------------------

----- CELL IDDRE1 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IDDRE1 is
  generic (
    DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
    IS_CB_INVERTED : bit := '0';
    IS_C_INVERTED : bit := '0'
  );

  port (
    Q1                   : out std_ulogic;
    Q2                   : out std_ulogic;
    C                    : in std_ulogic;
    CB                   : in std_ulogic;
    D                    : in std_ulogic;
    R                    : in std_ulogic    
  );
end IDDRE1;

architecture IDDRE1_V of IDDRE1 is
  
  constant MODULE_NAME : string := "IDDRE1";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

  constant DDR_CLK_EDGE_OPPOSITE_EDGE : std_logic_vector(1 downto 0) := "00";
  constant DDR_CLK_EDGE_SAME_EDGE : std_logic_vector(1 downto 0) := "01";
  constant DDR_CLK_EDGE_SAME_EDGE_PIPELINED : std_logic_vector(1 downto 0) := "10";

  signal DDR_CLK_EDGE_BIN : std_logic_vector(1 downto 0);
  signal IS_CB_INVERTED_BIN : std_ulogic;
  signal IS_C_INVERTED_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal CB_in : std_ulogic;
  signal C_in : std_ulogic;
  signal D_in : std_ulogic;
  signal R_in : std_ulogic;
 
  signal q1_o_reg  : std_ulogic := 'X';
  signal q2_o_reg  : std_ulogic := 'X';
  signal q3_o_reg  : std_ulogic := 'X';
  signal q4_o_reg  : std_ulogic := 'X';
  
  begin
  glblGSR     <= TO_X01(GSR);
  CB_in <= '1' when (CB = 'U') else CB xor IS_CB_INVERTED_BIN; -- rv 1
  C_in <= C xor IS_C_INVERTED_BIN;
  D_in <= D;
  R_in <= R;
  
  DDR_CLK_EDGE_BIN <= 
    DDR_CLK_EDGE_OPPOSITE_EDGE when (DDR_CLK_EDGE = "OPPOSITE_EDGE") else
    DDR_CLK_EDGE_SAME_EDGE when (DDR_CLK_EDGE = "SAME_EDGE") else
    DDR_CLK_EDGE_SAME_EDGE_PIPELINED when (DDR_CLK_EDGE = "SAME_EDGE_PIPELINED") else
    DDR_CLK_EDGE_OPPOSITE_EDGE;

  IS_CB_INVERTED_BIN <= TO_X01(IS_CB_INVERTED);
  IS_C_INVERTED_BIN <= TO_X01(IS_C_INVERTED);
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DDR_CLK_EDGE check
    if((xil_attr_test) or
       ((DDR_CLK_EDGE /= "OPPOSITE_EDGE") and 
        (DDR_CLK_EDGE /= "SAME_EDGE") and 
        (DDR_CLK_EDGE /= "SAME_EDGE_PIPELINED"))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-101] DDR_CLK_EDGE attribute is set to """));
      Write ( Message, string'(DDR_CLK_EDGE));
      Write ( Message, string'(""". Legal values for this attribute are "));
      Write ( Message, string'("""OPPOSITE_EDGE"", "));
      Write ( Message, string'("""SAME_EDGE"" or "));
      Write ( Message, string'("""SAME_EDGE_PIPELINED"". "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IDDRE1_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- IS_CB_INVERTED check
    if((xil_attr_test) or
       ((IS_CB_INVERTED < '0') or (IS_CB_INVERTED > '1'))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-103] IS_CB_INVERTED attribute is set to "));
      Write ( Message, IS_CB_INVERTED);
      Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IDDRE1_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- IS_C_INVERTED check
    if((xil_attr_test) or
       ((IS_C_INVERTED < '0') or (IS_C_INVERTED > '1'))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] IS_C_INVERTED attribute is set to "));
      Write ( Message, IS_C_INVERTED);
      Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IDDRE1_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-105] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IDDRE1_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
 
  PROC_C_CB : process(C_in, CB_in, D_in, glblGSR, R_in) begin
    if(glblGSR = '1') then
      q1_o_reg <= '0';
      q2_o_reg <= '0';
      q3_o_reg <= '0';
      q4_o_reg <= '0';
    elsif(glblGSR = '0') then
      if(R_in = '1') then
        q1_o_reg <= '0';
        q2_o_reg <= '0';
        q3_o_reg <= '0';
        q4_o_reg <= '0';
      elsif(R_in = '0' or R_in = 'L' or R_in = 'U') then
        if(rising_edge(C_in)) then
         q3_o_reg <= q1_o_reg;
         q1_o_reg <= D_in;
         q4_o_reg <= q2_o_reg;
        end if;
        if(rising_edge(CB_in)) then
          q2_o_reg <= D_in;
        end if;
      end if;
    end if;  
  end process PROC_C_CB;

  PROC_Q1_Q2_MUX: process(q1_o_reg,q2_o_reg,q3_o_reg,q4_o_reg) begin
    case DDR_CLK_EDGE_BIN is
      when "00" =>
        Q1 <= q1_o_reg;
        Q2 <= q2_o_reg;
      when "01" =>
        Q1 <= q1_o_reg;
        Q2 <= q4_o_reg;
      when "10" =>
        Q1 <= q3_o_reg;
        Q2 <= q4_o_reg;
      when others =>
        null;
    end case;     
  end process PROC_Q1_Q2_MUX;
   
end IDDRE1_V;
