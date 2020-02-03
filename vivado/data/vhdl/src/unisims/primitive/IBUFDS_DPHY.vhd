-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2015.4
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        IBUFDS_DPHY
-- /___/   /\      Filename    : IBUFDS_DPHY.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL IBUFDS_DPHY -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IBUFDS_DPHY is
  generic (
    DIFF_TERM : boolean := TRUE;
    IOSTANDARD : string := "DEFAULT";
    SIM_DEVICE : string := "ULTRASCALE_PLUS"
  );

  port (
    HSRX_O               : out std_ulogic;
    LPRX_O_N             : out std_ulogic;
    LPRX_O_P             : out std_ulogic;
    HSRX_DISABLE         : in std_ulogic;
    I                    : in std_ulogic;
    IB                   : in std_ulogic;
    LPRX_DISABLE         : in std_ulogic
  );
end IBUFDS_DPHY;

architecture IBUFDS_DPHY_V of IBUFDS_DPHY is

  constant MODULE_NAME : string := "IBUFDS_DPHY";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant DIFF_TERM_FALSE : std_ulogic := '1';
  constant DIFF_TERM_TRUE : std_ulogic := '0';
  constant IOSTANDARD_DEFAULT : std_ulogic := '0';

  signal DIFF_TERM_BIN : std_ulogic;
  signal IOSTANDARD_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal HSRX_O_out : std_ulogic;
  signal LPRX_O_N_out : std_ulogic;
  signal LPRX_O_P_out : std_ulogic;
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal HSRX_DISABLE_in : std_ulogic;
  signal IB_in : std_ulogic;
  signal I_in : std_ulogic;
  signal LPRX_DISABLE_in : std_ulogic;
  signal out_val : std_ulogic := '1';
 
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  HSRX_O <= HSRX_O_out after OUT_DELAY;
  LPRX_O_N <= LPRX_O_N_out after OUT_DELAY;
  LPRX_O_P <= LPRX_O_P_out after OUT_DELAY;
  
  HSRX_DISABLE_in <= HSRX_DISABLE;
  IB_in <= IB;
  I_in <= I;
  LPRX_DISABLE_in <= LPRX_DISABLE;
  
  DIFF_TERM_BIN <=
    DIFF_TERM_FALSE when (DIFF_TERM = FALSE) else
    DIFF_TERM_TRUE  when (DIFF_TERM = TRUE)  else
    DIFF_TERM_TRUE;

  IOSTANDARD_BIN <= 
    IOSTANDARD_DEFAULT when (IOSTANDARD = "DEFAULT") else
    IOSTANDARD_DEFAULT;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DIFF_TERM check
  if((xil_attr_test) or
     ((DIFF_TERM /= TRUE) and
      (DIFF_TERM /= FALSE)))then 
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] DIFF_TERM attribute is set to "));
    Write ( Message, DIFF_TERM);
    Write ( Message, string'(". Legal values for this attribute are TRUE or FALSE. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IBUFDS_DPHY_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if((xil_attr_test) or
     ((SIM_DEVICE /= "ULTRASCALE_PLUS") and
      (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and
      (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2") and
      (SIM_DEVICE /= "EVEREST") and
      (SIM_DEVICE /= "EVEREST_ES1") and
      (SIM_DEVICE /= "EVEREST_ES2")))then 
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] SIM_DEVICE attribute is set to "));
    Write ( Message, DIFF_TERM);
    Write ( Message, string'(". Legal values for this attribute are ULTRASCALE_PLUS or ULTRASCALE_PLUS_ES1 or ULTRASCALE_PLUS_ES2 or EVEREST or EVEREST_ES1 or EVEREST_ES2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IBUFDS_DPHY_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;

    -------- IOSTANDARD do not check
--      if((xil_attr_test) or
--         ((IOSTANDARD /= "DEFAULT"))) then
--        attr_err := true;
--        Write ( Message, string'("Error : [Unisim "));
--        Write ( Message, string'(MODULE_NAME));
--        Write ( Message, string'("-102] IOSTANDARD attribute is set to """));
--        Write ( Message, string'(IOSTANDARD));
--        Write ( Message, string'(""". Legal values for this attribute are "));
--        Write ( Message, string'("""DEFAULT"". "));
--        Write ( Message, string'("Instance "));
--        Write ( Message, string'(IBUFDS_DPHY_V'PATH_NAME));
--        writeline(output, Message);
--        DEALLOCATE (Message);
--      end if;
  if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-103] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IBUFDS_DPHY_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    -- end behavioral body
  out_val <= '0' when (SIM_DEVICE = "ULTRASCALE_PLUS" or SIM_DEVICE = "ULTRASCALE_PLUS_ES1" or SIM_DEVICE = "ULTRASCALE_PLUS_ES2") else
              '1' when (SIM_DEVICE = "EVEREST" or SIM_DEVICE = "EVEREST_ES1" or SIM_DEVICE = "EVEREST_ES2");

Behavior : process (LPRX_DISABLE_in, HSRX_DISABLE_in, I_in, IB_in)
  begin
    if  (HSRX_DISABLE_in = '0' and LPRX_DISABLE_in = '0') then
      if ((I_in = 'L' and IB_in = 'H') or (I_in = 'H' and IB_in = 'L')) then -- weak diff
        HSRX_O_out <= TO_X01(I_in);
        LPRX_O_P_out <= '0';
        LPRX_O_N_out <= '0';
      elsif ((I_in = 'L' or I_in = 'H') and (IB_in = 'H' or IB_in = 'L')) then -- weak
        LPRX_O_P_out <= '0';
        LPRX_O_N_out <= '0';
      elsif ((I_in = '0' and IB_in = '1') or (I_in = '1' and IB_in = '0')) then -- strong diff
        HSRX_O_out <= TO_X01(I_in);
        LPRX_O_P_out <= I_in;
        LPRX_O_N_out <= IB_in;
      elsif ((I_in = '0' or I_in = '1') and (IB_in = '1' or IB_in = '0')) then -- strong
        LPRX_O_P_out <= I_in;
        LPRX_O_N_out <= IB_in;
      elsif (I_in = 'X' or IB_in = 'X' or I_in = 'Z' or IB_in = 'Z') then
        HSRX_O_out <= 'X';
        LPRX_O_P_out <= '0';
        LPRX_O_N_out <= '0';
      end if;
    elsif (HSRX_DISABLE_in = '1' and LPRX_DISABLE_in = '0') then
      if (I_in = '0' or I_in = '1' or IB_in = '0' or IB_in = '1') then
        HSRX_O_out <= '0';
        LPRX_O_P_out <= I_in;
        LPRX_O_N_out <= IB_in;
      elsif (I_in = 'L' or I_in = 'H' or IB_in = 'L' or IB_in = 'H') then
        HSRX_O_out <= '0';
        LPRX_O_P_out <= '0';
        LPRX_O_N_out <= '0';
      else
        HSRX_O_out <= '0';
        LPRX_O_P_out <= 'X';
        LPRX_O_N_out <= 'X';
      end if;
    elsif (HSRX_DISABLE_in = '0' and LPRX_DISABLE_in = '1') then
        HSRX_O_out <= TO_X01(I_in);
        LPRX_O_P_out <= out_val;
        LPRX_O_N_out <= out_val;
    elsif (HSRX_DISABLE_in = 'X' or HSRX_DISABLE_in = 'Z' or LPRX_DISABLE_in = 'X' or LPRX_DISABLE_in = 'Z') then
        HSRX_O_out <= 'X';
        LPRX_O_P_out <= 'X';
        LPRX_O_N_out <= 'X';
    else
        HSRX_O_out <= '0';
        LPRX_O_P_out <= '0';
        LPRX_O_N_out <= '0';
    end if;
  end process Behavior;

  end IBUFDS_DPHY_V;
