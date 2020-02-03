-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        _no_description_
-- /___/   /\      Filename    : IBUFCTRL.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL IBUFCTRL -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IBUFCTRL is
  generic (
    ISTANDARD : string := "UNUSED";
    USE_IBUFDISABLE : string := "FALSE"
  );

  port (
    O                    : out std_ulogic;
    I                    : in std_ulogic;
    IBUFDISABLE          : in std_ulogic;
    INTERMDISABLE        : in std_ulogic;
    T                    : in std_ulogic
  );
end IBUFCTRL;

architecture IBUFCTRL_V of IBUFCTRL is

  constant MODULE_NAME : string := "IBUFCTRL";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant USE_IBUFDISABLE_FALSE : std_ulogic := '0';
  constant USE_IBUFDISABLE_TRUE : std_ulogic := '1';

  signal USE_IBUFDISABLE_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal O_out : std_ulogic;
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal IBUFDISABLE_in : std_ulogic;
  signal INTERMDISABLE_in : std_ulogic;
  signal I_in : std_ulogic;
  signal T_in : std_ulogic;
  
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  O <= O_out after OUT_DELAY;
  
  IBUFDISABLE_in <= IBUFDISABLE;
  INTERMDISABLE_in <= INTERMDISABLE;
  I_in <= I;
  T_in <= T;
  
  USE_IBUFDISABLE_BIN <= 
    USE_IBUFDISABLE_FALSE when (USE_IBUFDISABLE = "FALSE") else
    USE_IBUFDISABLE_TRUE when (USE_IBUFDISABLE = "TRUE") else
    USE_IBUFDISABLE_FALSE;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- USE_IBUFDISABLE check
  if((xil_attr_test) or
     ((USE_IBUFDISABLE /= "FALSE") and 
      (USE_IBUFDISABLE /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-104] USE_IBUFDISABLE attribute is set to """));
    Write ( Message, string'(USE_IBUFDISABLE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IBUFCTRL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-103] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IBUFCTRL_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
  Behavior     : process (IBUFDISABLE_in, I_in, T_in)
  variable NOT_T_OR_IBUFDISABLE   : std_ulogic := '0';  
  begin
    if(USE_IBUFDISABLE = "TRUE") then
       NOT_T_OR_IBUFDISABLE := IBUFDISABLE_in OR (not T_in);

       if(NOT_T_OR_IBUFDISABLE = '1') then
          O_out  <= '0';
       elsif (NOT_T_OR_IBUFDISABLE = '0') then
          O_out  <= TO_X01(I_in);
       end if; 
    elsif(USE_IBUFDISABLE = "FALSE") then
          O_out  <= TO_X01(I_in);
    end if;	  
  end process;
    
    -- end behavioral body
  end IBUFCTRL_V;
