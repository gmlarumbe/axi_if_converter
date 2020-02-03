-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2017.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                  Analog Auxiliary SYSMON Input/Output Buffer
-- /___/   /\      Filename    : IOBUF_ANALOG.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- End Revision
-------------------------------------------------------------------------------

----- CELL IOBUF_ANALOG -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IOBUF_ANALOG is
  generic (
    DRIVE : integer := 12;
    IBUF_LOW_PWR : boolean := TRUE;
    IOSTANDARD : string := "DEFAULT";
    SLEW : string := "SLOW"
  );

  port (
    O                    : out std_ulogic;
    IO                   : inout std_ulogic;
    I                    : in std_ulogic;
    T                    : in std_ulogic
  );
end IOBUF_ANALOG;

architecture IOBUF_ANALOG_V of IOBUF_ANALOG is

  constant MODULE_NAME : string := "IOBUF_ANALOG";
-- Parameter encodings and registers
  constant IBUF_LOW_PWR_FALSE : std_ulogic := '1';
  constant IBUF_LOW_PWR_TRUE : std_ulogic := '0';
  constant IOSTANDARD_DEFAULT : std_ulogic := '0';
  constant SLEW_FAST : std_ulogic := '1';
  constant SLEW_SLOW : std_ulogic := '0';

  signal DRIVE_BIN : std_logic_vector(4 downto 0);
  signal IBUF_LOW_PWR_BIN : std_ulogic;
  signal IOSTANDARD_BIN : std_ulogic;
  signal SLEW_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal O_out : std_ulogic;
  
  signal I_in : std_ulogic;
  signal T_in : std_ulogic;
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  I_in <= '1' when (I = 'U') else TO_X01(I); -- rv 1
  T_in <= '1' when (T = 'U') else TO_X01(T); -- rv 1
  
  DRIVE_BIN <= std_logic_vector(to_unsigned(DRIVE,5));
  
  IBUF_LOW_PWR_BIN <= 
    IBUF_LOW_PWR_FALSE when (IBUF_LOW_PWR = FALSE) else
    IBUF_LOW_PWR_TRUE when (IBUF_LOW_PWR = TRUE) else
    IBUF_LOW_PWR_TRUE;

  IOSTANDARD_BIN <= 
      IOSTANDARD_DEFAULT when (IOSTANDARD = "DEFAULT") else
      IOSTANDARD_DEFAULT;
  
  SLEW_BIN <= 
      SLEW_SLOW when (SLEW = "SLOW") else
      SLEW_FAST when (SLEW = "FAST") else
      SLEW_SLOW;
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DRIVE check
        if((xil_attr_test) or
           ((DRIVE < 2) or (DRIVE > 24))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-101] DRIVE attribute is set to "));
          Write ( Message, DRIVE);
          Write ( Message, string'(". Legal values for this attribute are 2 to 24. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(IOBUF_ANALOG_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IBUF_LOW_PWR check
  if((xil_attr_test) or
     ((IBUF_LOW_PWR /= TRUE) and
      (IBUF_LOW_PWR /= FALSE)))then 
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] IBUF_LOW_PWR attribute is set to "));
    Write ( Message, IBUF_LOW_PWR);
    Write ( Message, string'(". Legal values for this attribute are TRUE or FALSE. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUF_ANALOG_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- IOSTANDARD check
      if((xil_attr_test) or
         ((IOSTANDARD /= "DEFAULT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] IOSTANDARD attribute is set to """));
        Write ( Message, string'(IOSTANDARD));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DEFAULT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IOBUF_ANALOG_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SLEW check
      if((xil_attr_test) or
         ((SLEW /= "SLOW") and 
          (SLEW /= "FAST"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] SLEW attribute is set to """));
        Write ( Message, string'(SLEW));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SLOW"" or "));
        Write ( Message, string'("""FAST"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IOBUF_ANALOG_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-105] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUF_ANALOG_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

  O <= TO_X01(IO);
  IO <= I_in when (T_in = '0') else 'Z';

end IOBUF_ANALOG_V;
