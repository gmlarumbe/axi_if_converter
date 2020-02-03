-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Bidirectional I/O Buffer with Offset Calibration and VREF Tuning
-- /___/   /\      Filename    : IOBUFE3.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL IOBUFE3 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IOBUFE3 is
  generic (
    DRIVE : integer := 12;
    IBUF_LOW_PWR : string := "TRUE";
    IOSTANDARD : string := "DEFAULT";
    SIM_INPUT_BUFFER_OFFSET : integer := 0;
    USE_IBUFDISABLE : string := "FALSE"
  );

  port (
    O                    : out std_ulogic;
    IO                   : inout std_ulogic;
    DCITERMDISABLE       : in std_ulogic;
    I                    : in std_ulogic;
    IBUFDISABLE          : in std_ulogic;
    OSC                  : in std_logic_vector(3 downto 0);
    OSC_EN               : in std_ulogic;
    T                    : in std_ulogic;
    VREF                 : in std_ulogic
  );
end IOBUFE3;

architecture IOBUFE3_V of IOBUFE3 is
  ---------------------------------------------------------------------------
  -- Function SLV_TO_INT converts a std_logic_vector TO INTEGER
  ---------------------------------------------------------------------------
  function SLV_TO_INT(SLV: in std_logic_vector
                      ) return integer is

    variable int : integer;
  begin
    int := 0;
    for i in SLV'high downto SLV'low loop
      int := int * 2;
      if SLV(i) = '1' then
        int := int + 1;
      end if;
    end loop;
    return int;
  end;

  constant MODULE_NAME : string := "IOBUFE3";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant IBUF_LOW_PWR_FALSE : std_ulogic := '1';
  constant IBUF_LOW_PWR_TRUE : std_ulogic := '0';
  constant USE_IBUFDISABLE_FALSE : std_ulogic := '0';
  constant USE_IBUFDISABLE_TRUE : std_ulogic := '1';

  signal DRIVE_BIN : std_logic_vector(4 downto 0);
  signal IBUF_LOW_PWR_BIN : std_ulogic;
  signal USE_IBUFDISABLE_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal O_out : std_ulogic;
  signal IO_out : std_ulogic;  
  
  signal O_delay : std_ulogic;
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal DCITERMDISABLE_in : std_ulogic;
  signal IBUFDISABLE_in : std_ulogic;
  signal I_in : std_ulogic;
  signal IO_in : std_ulogic;
  signal OSC_EN_in : std_ulogic;
  signal OSC_in : std_logic_vector(3 downto 0);
  signal T_in : std_ulogic;
  signal O_OSC_in : std_ulogic;
  signal VREF_in : std_ulogic;
  
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  O <= O_out after OUT_DELAY;
  IO <= IO_out after OUT_DELAY;  
 
  DCITERMDISABLE_in <= DCITERMDISABLE;
  IBUFDISABLE_in <= IBUFDISABLE;
  I_in <= I;
  IO_in <= IO;
  OSC_EN_in <= OSC_EN;
  OSC_in <= OSC;
  T_in <= T;
  VREF_in <= VREF;
  
  DRIVE_BIN <= std_logic_vector(to_unsigned(DRIVE,5));

  IBUF_LOW_PWR_BIN <= 
    IBUF_LOW_PWR_TRUE when (IBUF_LOW_PWR = "TRUE") else
    IBUF_LOW_PWR_FALSE when (IBUF_LOW_PWR = "FALSE") else
    IBUF_LOW_PWR_TRUE;

  USE_IBUFDISABLE_BIN <= 
    USE_IBUFDISABLE_FALSE when (USE_IBUFDISABLE = "FALSE") else
    USE_IBUFDISABLE_TRUE when (USE_IBUFDISABLE = "TRUE") else
    USE_IBUFDISABLE_FALSE;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DRIVE check
    if ((DRIVE < 2) or (DRIVE > 24)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-101] DRIVE attribute is set to "));
      Write ( Message, DRIVE);
      Write ( Message, string'(". Legal values for this attribute are 2 to 24. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUFE3_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- IBUF_LOW_PWR check
  if((xil_attr_test) or
     ((IBUF_LOW_PWR /= "TRUE") and 
      (IBUF_LOW_PWR /= "FALSE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] IBUF_LOW_PWR attribute is set to """));
    Write ( Message, string'(IBUF_LOW_PWR));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUFE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SIM_INPUT_BUFFER_OFFSET check
    if ((SIM_INPUT_BUFFER_OFFSET < -50) or (SIM_INPUT_BUFFER_OFFSET > 50)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] SIM_INPUT_BUFFER_OFFSET attribute is set to "));
      Write ( Message, SIM_INPUT_BUFFER_OFFSET);
      Write ( Message, string'(". Legal values for this attribute are -50 to 50. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUFE3_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- USE_IBUFDISABLE check
  if((xil_attr_test) or
     ((USE_IBUFDISABLE /= "FALSE") and 
      (USE_IBUFDISABLE /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-106] USE_IBUFDISABLE attribute is set to """));
    Write ( Message, string'(USE_IBUFDISABLE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUFE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-106] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUFE3_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
 FunctionalBehavior_IOBUFE3   : process (I_in, T_in)
  begin
    if ((T_in = '1') or (T_in = 'H')) then
      IO_out <= 'Z';
    elsif ((T_in = '0') or (T_in = 'L')) then
      if ((I_in = '1') or (I_in = 'H')) then
        IO_out <= '1';
      elsif ((I_in = '0') or (I_in = 'L')) then
        IO_out <= '0';
      elsif (I_in = 'U') then
        IO_out <= 'U';
      else
        IO_out <= 'X';  
      end if;
    elsif (T_in = 'U') then
      IO_out <= 'U';          
    else                                      
      IO_out <= 'X';  
    end if;
  end process;
   OSC_Enable_IOBUFE3 : process(OSC_in,OSC_EN_in)
  variable OSC_int : integer := 0;
  begin
    if (OSC_in(3) = '0') then
    OSC_int := -1 * SLV_TO_INT(OSC_in(2 downto 0)) * 5;
    else
    OSC_int := SLV_TO_INT(OSC_in(2 downto 0)) * 5;
    end if;
    if (OSC_EN_in = '1') then
      if ((SIM_INPUT_BUFFER_OFFSET - OSC_int) < 0) then 
          O_OSC_in <= '0';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) > 0) then
          O_OSC_in <= '1';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) = 0 ) then
          O_OSC_in <= not O_OSC_in;
      end if;	  
    end if;
  end process OSC_Enable_IOBUFE3;

  Behavior     : process (IBUFDISABLE_in, T_in,IO_in, O_OSC_in, OSC_EN_in)
    variable NOT_T_OR_IBUFDISABLE   : std_ulogic := '0';
  begin
   NOT_T_OR_IBUFDISABLE := (IBUFDISABLE_in or (not T_in)); 
    if(USE_IBUFDISABLE = "TRUE") then
      if(NOT_T_OR_IBUFDISABLE = '1' and OSC_EN_in /= '1') then
          O_out  <= '0';
       elsif (NOT_T_OR_IBUFDISABLE = '0') then
         if (OSC_EN_in = '1') then
            O_out <= O_OSC_in;
	 else
	    O_out <= TO_X01(IO_in);
         end if;
       else
          O_out <= 'X';
       end if;
    elsif(USE_IBUFDISABLE = "FALSE") then
            if (OSC_EN_in = '1') then
            O_out <= O_OSC_in;
	 else
	    O_out <= TO_X01(IO_in);
         end if;
    end if;
 end process;
    -- end behavioral body
  end IOBUFE3_V;
