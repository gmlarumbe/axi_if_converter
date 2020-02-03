-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        HBM_SNGLBLI_INTF_APB
-- /___/   /\      Filename    : HBM_SNGLBLI_INTF_APB.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL HBM_SNGLBLI_INTF_APB -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity HBM_SNGLBLI_INTF_APB is
  generic (
    CLK_SEL : string := "FALSE";
    IS_PCLK_INVERTED : bit := '0';
    IS_PRESET_N_INVERTED : bit := '0';
    MC_ENABLE : string := "FALSE";
    PHY_ENABLE : string := "FALSE";
    PHY_PCLK_INVERT : string := "FALSE";
    SWITCH_ENABLE : string := "FALSE"
  );
  
  port (
    CATTRIP_PIPE         : out std_ulogic;
    PRDATA_PIPE          : out std_logic_vector(31 downto 0);
    PREADY_PIPE          : out std_ulogic;
    PSLVERR_PIPE         : out std_ulogic;
    TEMP_PIPE            : out std_logic_vector(2 downto 0);
    PADDR                : in std_logic_vector(21 downto 0);
    PCLK                 : in std_ulogic;
    PENABLE              : in std_ulogic;
    PRESET_N             : in std_ulogic;
    PSEL                 : in std_ulogic;
    PWDATA               : in std_logic_vector(31 downto 0);
    PWRITE               : in std_ulogic
  );
end HBM_SNGLBLI_INTF_APB;

architecture HBM_SNGLBLI_INTF_APB_V of HBM_SNGLBLI_INTF_APB is

  constant MODULE_NAME : string := "HBM_SNGLBLI_INTF_APB";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant CLK_SEL_FALSE : std_ulogic := '0';
  constant CLK_SEL_TRUE : std_ulogic := '1';
  constant MC_ENABLE_FALSE : std_ulogic := '0';
  constant MC_ENABLE_TRUE : std_ulogic := '1';
  constant PHY_ENABLE_FALSE : std_ulogic := '0';
  constant PHY_ENABLE_TRUE : std_ulogic := '1';
  constant PHY_PCLK_INVERT_FALSE : std_ulogic := '0';
  constant PHY_PCLK_INVERT_TRUE : std_ulogic := '1';
  constant SWITCH_ENABLE_FALSE : std_ulogic := '0';
  constant SWITCH_ENABLE_TRUE : std_ulogic := '1';

  signal CLK_SEL_BIN : std_ulogic;
  signal IS_PCLK_INVERTED_BIN : std_ulogic;
  signal IS_PRESET_N_INVERTED_BIN : std_ulogic;
  signal MC_ENABLE_BIN : std_ulogic;
  signal PHY_ENABLE_BIN : std_ulogic;
  signal PHY_PCLK_INVERT_BIN : std_ulogic;
  signal SWITCH_ENABLE_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal CATTRIP_PIPE_out : std_ulogic;
  signal PRDATA_PIPE_out : std_logic_vector(31 downto 0);
  signal PREADY_PIPE_out : std_ulogic;
  signal PSLVERR_PIPE_out : std_ulogic;
  signal TEMP_PIPE_out : std_logic_vector(2 downto 0);
  
  signal PADDR_in : std_logic_vector(21 downto 0);
  signal PCLK_in : std_ulogic;
  signal PENABLE_in : std_ulogic;
  signal PRESET_N_in : std_ulogic;
  signal PSEL_in : std_ulogic;
  signal PWDATA_in : std_logic_vector(31 downto 0);
  signal PWRITE_in : std_ulogic;
  
  -- begin behavioral model declarations
  
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  CATTRIP_PIPE <= CATTRIP_PIPE_out;
  PRDATA_PIPE <= PRDATA_PIPE_out;
  PREADY_PIPE <= PREADY_PIPE_out;
  PSLVERR_PIPE <= PSLVERR_PIPE_out;
  TEMP_PIPE <= TEMP_PIPE_out;
  
  PADDR_in <= PADDR;
  PCLK_in <= PCLK;
  PENABLE_in <= PENABLE;
  PRESET_N_in <= PRESET_N;
  PSEL_in <= PSEL;
  PWDATA_in <= PWDATA;
  PWRITE_in <= PWRITE;
  
  CLK_SEL_BIN <= 
      CLK_SEL_FALSE when (CLK_SEL = "FALSE") else
      CLK_SEL_TRUE when (CLK_SEL = "TRUE") else
      CLK_SEL_FALSE;
  
  IS_PCLK_INVERTED_BIN <= TO_X01(IS_PCLK_INVERTED);
  IS_PRESET_N_INVERTED_BIN <= TO_X01(IS_PRESET_N_INVERTED);
  MC_ENABLE_BIN <= 
      MC_ENABLE_FALSE when (MC_ENABLE = "FALSE") else
      MC_ENABLE_TRUE when (MC_ENABLE = "TRUE") else
      MC_ENABLE_FALSE;
  
  PHY_ENABLE_BIN <= 
      PHY_ENABLE_FALSE when (PHY_ENABLE = "FALSE") else
      PHY_ENABLE_TRUE when (PHY_ENABLE = "TRUE") else
      PHY_ENABLE_FALSE;
  
  PHY_PCLK_INVERT_BIN <= 
      PHY_PCLK_INVERT_FALSE when (PHY_PCLK_INVERT = "FALSE") else
      PHY_PCLK_INVERT_TRUE when (PHY_PCLK_INVERT = "TRUE") else
      PHY_PCLK_INVERT_FALSE;
  
  SWITCH_ENABLE_BIN <= 
      SWITCH_ENABLE_FALSE when (SWITCH_ENABLE = "FALSE") else
      SWITCH_ENABLE_TRUE when (SWITCH_ENABLE = "TRUE") else
      SWITCH_ENABLE_FALSE;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CLK_SEL check
      if((xil_attr_test) or
         ((CLK_SEL /= "FALSE") and 
          (CLK_SEL /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] CLK_SEL attribute is set to """));
        Write ( Message, string'(CLK_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_APB_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE check
      if((xil_attr_test) or
         ((MC_ENABLE /= "FALSE") and 
          (MC_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] MC_ENABLE attribute is set to """));
        Write ( Message, string'(MC_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_APB_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE check
      if((xil_attr_test) or
         ((PHY_ENABLE /= "FALSE") and 
          (PHY_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] PHY_ENABLE attribute is set to """));
        Write ( Message, string'(PHY_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_APB_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_PCLK_INVERT check
      if((xil_attr_test) or
         ((PHY_PCLK_INVERT /= "FALSE") and 
          (PHY_PCLK_INVERT /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] PHY_PCLK_INVERT attribute is set to """));
        Write ( Message, string'(PHY_PCLK_INVERT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_APB_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SWITCH_ENABLE check
      if((xil_attr_test) or
         ((SWITCH_ENABLE /= "FALSE") and 
          (SWITCH_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-107] SWITCH_ENABLE attribute is set to """));
        Write ( Message, string'(SWITCH_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_APB_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-106] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HBM_SNGLBLI_INTF_APB_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model

-- end behavioral model

  end HBM_SNGLBLI_INTF_APB_V;
