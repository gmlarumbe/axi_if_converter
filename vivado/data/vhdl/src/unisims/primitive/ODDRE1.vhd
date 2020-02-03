-------------------------------------------------------------------------------
-- Copyright (c) 1995/2015 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2015.3 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Dedicated Dual Data Rate (DDR) Output Register
-- /___/   /\      Filename    : ODDRE1.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- End Revision
-------------------------------------------------------------------------------

----- CELL ODDRE1 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity ODDRE1 is
  generic (
    IS_C_INVERTED : bit := '0';
    IS_D1_INVERTED : bit := '0';
    IS_D2_INVERTED : bit := '0';
    SIM_DEVICE : string := "ULTRASCALE";
    SRVAL : bit := '0'
  );

  port (
    Q                    : out std_ulogic := TO_X01(SRVAL);
    C                    : in std_ulogic;
    D1                   : in std_ulogic;
    D2                   : in std_ulogic;
    SR                   : in std_ulogic    
  );
end ODDRE1;

architecture ODDRE1_V of ODDRE1 is
  
  constant MODULE_NAME : string := "ODDRE1";

-- Parameter encodings and registers

  signal IS_C_INVERTED_BIN : std_ulogic;
  signal IS_D1_INVERTED_BIN : std_ulogic;
  signal IS_D2_INVERTED_BIN : std_ulogic;
  signal SRVAL_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal      R_sync         : std_ulogic := '0'; 
  signal      R_sync_reg     : std_logic_vector(3 downto 1) := "000"; 
 
  begin
  glblGSR     <= TO_X01(GSR);
  
  IS_C_INVERTED_BIN <= TO_X01(IS_C_INVERTED);
  IS_D1_INVERTED_BIN <= TO_X01(IS_D1_INVERTED);
  IS_D2_INVERTED_BIN <= TO_X01(IS_D2_INVERTED);
  SRVAL_BIN <= TO_X01(SRVAL);
 

  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "EVEREST") and
          (SIM_DEVICE /= "EVEREST_ES1") and
          (SIM_DEVICE /= "EVEREST_ES2") and
          (SIM_DEVICE /= "ULTRASCALE") and
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""EVEREST"", "));
        Write ( Message, string'("""EVEREST_ES1"", "));
        Write ( Message, string'("""EVEREST_ES2"", "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ODDRE1_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-100] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODDRE1_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

  prcs_R_sync: process(SR, R_sync_reg)
  begin
    if ((SIM_DEVICE /= "EVEREST") or (SIM_DEVICE /= "EVEREST_ES1") or (SIM_DEVICE /= "EVEREST_ES2")) then
      R_sync <= SR;
    else
      R_sync <= R_sync_reg(3) or R_sync_reg(2) or R_sync_reg(1);
    end if;
  end process prcs_R_sync;
  
  prcs_R_sync_reg: process(C)
  begin
    if(C'event and xil_pos_edge_inv(C, IS_C_INVERTED_BIN)) then
      R_sync_reg <= R_sync_reg(2 downto 1) & SR;
    end if;
  end process prcs_R_sync_reg;
  
  PRCS_C : process(C,glblGSR,SR)
  variable QD2_posedge_int : std_ulogic := TO_X01(SRVAL);
  begin
    if(glblGSR = '1') then
       Q <= TO_X01(SRVAL);
       QD2_posedge_int := TO_X01(SRVAL);
    elsif (glblGSR = '0') then
      if (SR = '1' or R_sync = '1') then
        Q <= TO_X01(SRVAL);
        QD2_posedge_int := TO_X01(SRVAL);
      elsif (R_sync = '0' or R_sync = 'L' or R_sync = 'U') then
       if (C'event and xil_pos_edge_inv(C, IS_C_INVERTED_BIN)) then
         Q <= D1 xor IS_D1_INVERTED_BIN;
         QD2_posedge_int := D2 xor IS_D2_INVERTED_BIN;
       end if;
       if(C'event and xil_neg_edge_inv(C, IS_C_INVERTED_BIN)) then
         Q <= QD2_posedge_int;
       end if;
      end if;  
    end if;
  
  end process PRCS_C;
 
  end ODDRE1_V;
