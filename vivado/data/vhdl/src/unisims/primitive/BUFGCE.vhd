-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
--  All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2018.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        General Clock Buffer with Clock Enable
-- /___/   /\      Filename    : BUFGCE.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
--  05/15/12 - Initial version.
--  10/17/12 - 682802 - convert GSR H/L to 1/0
--  End Revision
-------------------------------------------------------------------------------

----- CELL BUFGCE -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity BUFGCE is
    generic (
      CE_TYPE : string := "SYNC";
      IS_CE_INVERTED : bit := '0';
      IS_I_INVERTED : bit := '0'
    );

    port (
      O                    : out std_ulogic;
      CE                   : in std_ulogic;
      I                    : in std_ulogic      
    );
  end BUFGCE;

  architecture BUFGCE_V of BUFGCE is
    
    constant MODULE_NAME : string := "BUFGCE";
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant CE_TYPE_ASYNC : std_logic_vector(1 downto 0) := "01";
  constant CE_TYPE_HARDSYNC : std_logic_vector(1 downto 0) := "10";
  constant CE_TYPE_SYNC : std_logic_vector(1 downto 0) := "00";

  signal CE_TYPE_BIN : std_logic_vector(1 downto 0);
    signal IS_CE_INVERTED_BIN : std_ulogic;
    signal IS_I_INVERTED_BIN : std_ulogic;

    signal glblGSR : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    signal O_out : std_ulogic;
    
    signal CE_in : std_ulogic;
    signal I_in : std_ulogic;

  -- begin behavioral model declarations
    signal ice : std_ulogic := 'X';
    signal enable_clk : std_ulogic := '1';
    signal ce_inv : std_ulogic := 'X';

  -- end behavioral model declarations

  begin
    glblGSR     <= TO_X01(GSR);
   
    O <= O_out;
    
    CE_in <= '1' when (CE = 'U') else CE xor IS_CE_INVERTED_BIN; -- rv 1
    I_in <= I xor IS_I_INVERTED_BIN;
    
    CE_TYPE_BIN <= 
      CE_TYPE_SYNC when (CE_TYPE = "SYNC") else
      CE_TYPE_ASYNC when (CE_TYPE = "ASYNC") else
      CE_TYPE_HARDSYNC when (CE_TYPE = "HARDSYNC") else
      CE_TYPE_SYNC;
      
    IS_CE_INVERTED_BIN <= TO_X01(IS_CE_INVERTED);
    IS_I_INVERTED_BIN <= TO_X01(IS_I_INVERTED);

  INIPROC : process
    variable Message : line;
    variable attr_err : boolean := false;
    begin
    -------- CE_TYPE check
      if((xil_attr_test) or
         ((CE_TYPE /= "SYNC") and 
          (CE_TYPE /= "ASYNC") and 
          (CE_TYPE /= "HARDSYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] CE_TYPE attribute is set to """));
        Write ( Message, string'(CE_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"", "));
        Write ( Message, string'("""ASYNC"" or "));
        Write ( Message, string'("""HARDSYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-102] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BUFGCE_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
      end if;
      wait;
    end process INIPROC;

-- begin behavioral model

    prcs_1 : process(glblGSR, CE_in, I_in)
    begin
      if (glblGSR = '1') then
        enable_clk <= '1';
      elsif ((CE_TYPE_BIN = CE_TYPE_ASYNC) or (I_in = '0')) then
        enable_clk <= CE_in;
      end if;  
    end process prcs_1;

    O_out <= enable_clk and I_in;

-- end behavioral model

  end BUFGCE_V;
