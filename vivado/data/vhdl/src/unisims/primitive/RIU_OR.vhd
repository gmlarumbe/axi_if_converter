-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        RIU_OR
-- /___/   /\      Filename    : RIU_OR.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL RIU_OR -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity RIU_OR is
  generic (
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0
  );
  
  port (
    RIU_RD_DATA          : out std_logic_vector(15 downto 0);
    RIU_RD_VALID         : out std_ulogic;
    RIU_RD_DATA_LOW      : in std_logic_vector(15 downto 0);
    RIU_RD_DATA_UPP      : in std_logic_vector(15 downto 0);
    RIU_RD_VALID_LOW     : in std_ulogic;
    RIU_RD_VALID_UPP     : in std_ulogic
  );
end RIU_OR;

architecture RIU_OR_V of RIU_OR is

  constant MODULE_NAME : string := "RIU_OR";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant SIM_DEVICE_ULTRASCALE : std_logic_vector(1 downto 0) := "00";
  constant SIM_DEVICE_ULTRASCALE_PLUS : std_logic_vector(1 downto 0) := "01";
  constant SIM_DEVICE_ULTRASCALE_PLUS_ES1 : std_logic_vector(1 downto 0) := "10";
  constant SIM_DEVICE_ULTRASCALE_PLUS_ES2 : std_logic_vector(1 downto 0) := "11";

  signal SIM_DEVICE_BIN : std_logic_vector(1 downto 0);

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed
  
  signal RIU_RD_DATA_out : std_logic_vector(15 downto 0);
  signal RIU_RD_VALID_out : std_ulogic;
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal RIU_RD_DATA_LOW_in : std_logic_vector(15 downto 0);
  signal RIU_RD_DATA_UPP_in : std_logic_vector(15 downto 0);
  signal RIU_RD_VALID_LOW_in : std_ulogic;
  signal RIU_RD_VALID_UPP_in : std_ulogic;
  
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  RIU_RD_DATA <= RIU_RD_DATA_out after OUT_DELAY;
  RIU_RD_VALID <= RIU_RD_VALID_out after OUT_DELAY;
  
  RIU_RD_DATA_LOW_in <= RIU_RD_DATA_LOW;
  RIU_RD_DATA_UPP_in <= RIU_RD_DATA_UPP;
  RIU_RD_VALID_LOW_in <= RIU_RD_VALID_LOW;
  RIU_RD_VALID_UPP_in <= RIU_RD_VALID_UPP;
  
  SIM_DEVICE_BIN <= 
      SIM_DEVICE_ULTRASCALE when (SIM_DEVICE = "ULTRASCALE") else
      SIM_DEVICE_ULTRASCALE_PLUS when (SIM_DEVICE = "ULTRASCALE_PLUS") else
      SIM_DEVICE_ULTRASCALE_PLUS_ES1 when (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") else
      SIM_DEVICE_ULTRASCALE_PLUS_ES2 when (SIM_DEVICE = "ULTRASCALE_PLUS_ES2") else
      SIM_DEVICE_ULTRASCALE;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RIU_OR_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_VERSION check
      if((xil_attr_test) or
         ((SIM_VERSION /= 2.0) and 
          (SIM_VERSION /= 1.0))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] SIM_VERSION attribute is set to "));
        Write ( Message, SIM_VERSION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2.0 or "));
        Write ( Message, string'("1.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RIU_OR_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-103] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RIU_OR_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    RIU_RD_DATA_out <= RIU_RD_DATA_UPP_in or RIU_RD_DATA_LOW_in;
    RIU_RD_VALID_out <= RIU_RD_VALID_UPP_in and RIU_RD_VALID_LOW_in;
  
  end RIU_OR_V;
