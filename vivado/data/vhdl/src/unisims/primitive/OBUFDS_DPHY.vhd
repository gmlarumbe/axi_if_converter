-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2015.4
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        OBUFDS_DPHY
-- /___/   /\      Filename    : OBUFDS_DPHY.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL OBUFDS_DPHY -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity OBUFDS_DPHY is
  generic (
    IOSTANDARD : string := "DEFAULT"
  );

  port (
    O                    : out std_ulogic;
    OB                   : out std_ulogic;
    HSTX_I               : in std_ulogic;
    HSTX_T               : in std_ulogic;
    LPTX_I_N             : in std_ulogic;
    LPTX_I_P             : in std_ulogic;
    LPTX_T               : in std_ulogic
  );
end OBUFDS_DPHY;

architecture OBUFDS_DPHY_V of OBUFDS_DPHY is

  constant MODULE_NAME : string := "OBUFDS_DPHY";

-- Parameter encodings and registers
  constant IOSTANDARD_DEFAULT : std_ulogic := '0';

  signal IOSTANDARD_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal OB_out : std_ulogic;
  signal O_out : std_ulogic;
  
  signal HSTX_I_in : std_ulogic;
  signal HSTX_T_in : std_ulogic;
  signal LPTX_I_N_in : std_ulogic;
  signal LPTX_I_P_in : std_ulogic;
  signal LPTX_T_in : std_ulogic;
  
  begin
  glblGSR     <= TO_X01(GSR);
  O <= O_out;
  OB <= OB_out;
  
  HSTX_I_in <= HSTX_I;
  HSTX_T_in <= HSTX_T;
  LPTX_I_N_in <= LPTX_I_N;
  LPTX_I_P_in <= LPTX_I_P;
  LPTX_T_in <= LPTX_T;
  
  IOSTANDARD_BIN <= 
    IOSTANDARD_DEFAULT when (IOSTANDARD = "DEFAULT") else
    IOSTANDARD_DEFAULT;

--Commenting out DRC check for IOSTANDARD attribute as it is not required as per IOTST.  
--  INIPROC : process
--  variable Message : line;
--  variable attr_err : boolean := false;
--  begin
--    -------- IOSTANDARD check
--      if((xil_attr_test) or
--         ((IOSTANDARD /= "DEFAULT"))) then
--        attr_err := true;
--        Write ( Message, string'("Error : [Unisim "));
--        Write ( Message, string'(MODULE_NAME));
--        Write ( Message, string'("-101] IOSTANDARD attribute is set to """));
--        Write ( Message, string'(IOSTANDARD));
--        Write ( Message, string'(""". Legal values for this attribute are "));
--        Write ( Message, string'("""DEFAULT"". "));
--        Write ( Message, string'("Instance "));
--        Write ( Message, string'(OBUFDS_DPHY_V'PATH_NAME));
--        writeline(output, Message);
--        DEALLOCATE (Message);
--      end if;
--    if  (attr_err) then
--      Write ( Message, string'("[Unisim "));
--      Write ( Message, string'(MODULE_NAME));
--      Write ( Message, string'("-102] Attribute Error(s) encountered. "));
--      Write ( Message, string'("Instance "));
--      Write ( Message, string'(OBUFDS_DPHY_V'PATH_NAME));
--      assert FALSE
--      report Message.all
--      severity error;
--    end if;
--    wait;
--    end process INIPROC;

  Behavior : process (LPTX_T_in,HSTX_T_in,LPTX_I_P_in,LPTX_I_N_in,HSTX_I_in)
  begin
    if(LPTX_T_in = '0') then
       O_out  <= TO_X01(LPTX_I_P_in);
       OB_out <= TO_X01(LPTX_I_N_in);
    elsif (LPTX_T_in = '1' and HSTX_T_in = '0') then
       O_out <= TO_X01(HSTX_I_in);
       OB_out <= not (TO_X01(HSTX_I_in));
    else 
       O_out <= 'Z';
       OB_out <= 'Z';
    end if;
  end process Behavior;
   
  end OBUFDS_DPHY_V;
