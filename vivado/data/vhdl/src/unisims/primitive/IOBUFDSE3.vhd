-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Differential Bidirectional I/O Buffer with Offset Calibration
-- /___/   /\      Filename    : IOBUFDSE3.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL IOBUFDSE3 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IOBUFDSE3 is
  generic (
    DIFF_TERM : string := "FALSE";
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR : string := "TRUE";
    IOSTANDARD : string := "DEFAULT";
    SIM_INPUT_BUFFER_OFFSET : integer := 0;
    USE_IBUFDISABLE : string := "FALSE"
  );

  port (
    O                    : out std_ulogic;
    IO                   : inout std_ulogic;
    IOB                  : inout std_ulogic;
    DCITERMDISABLE       : in std_ulogic;
    I                    : in std_ulogic;
    IBUFDISABLE          : in std_ulogic;
    OSC                  : in std_logic_vector(3 downto 0);
    OSC_EN               : in std_logic_vector(1 downto 0);
    T                    : in std_ulogic
  );
end IOBUFDSE3;

architecture IOBUFDSE3_V of IOBUFDSE3 is

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


  constant MODULE_NAME : string := "IOBUFDSE3";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant DIFF_TERM_FALSE : std_ulogic := '0';
  constant DIFF_TERM_TRUE : std_ulogic := '1';
  constant DQS_BIAS_FALSE : std_ulogic := '0';
  constant DQS_BIAS_TRUE : std_ulogic := '1';
  constant IBUF_LOW_PWR_FALSE : std_ulogic := '1';
  constant IBUF_LOW_PWR_TRUE : std_ulogic := '0';
  constant USE_IBUFDISABLE_FALSE : std_ulogic := '0';
  constant USE_IBUFDISABLE_TRUE : std_ulogic := '1';

  signal DIFF_TERM_BIN : std_ulogic;
  signal DQS_BIAS_BIN : std_ulogic;
  signal IBUF_LOW_PWR_BIN : std_ulogic;
  signal SIM_INPUT_BUFFER_OFFSET_BIN : std_logic_vector(6 downto 0);
  signal USE_IBUFDISABLE_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal O_out : std_ulogic;
  signal IO_out : std_ulogic;
  signal IOB_out : std_ulogic;
  signal O_delay : std_ulogic;
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal DCITERMDISABLE_in : std_ulogic;
  signal IBUFDISABLE_in : std_ulogic;
  signal I_in : std_ulogic;
  signal IOB_in : std_ulogic;
  signal IO_in : std_ulogic;  
  signal OSC_EN_in : std_logic_vector(1 downto 0);
  signal OSC_in : std_logic_vector(3 downto 0);
  signal T_in : std_ulogic;
  signal O_OSC_in : std_logic;  
  
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  O <= O_delay after OUT_DELAY;
  IO <= IO_out after OUT_DELAY;
  IOB <= IOB_out after OUT_DELAY;
  
  DCITERMDISABLE_in <= DCITERMDISABLE;
  IBUFDISABLE_in <= IBUFDISABLE;
  IOB_in <= IOB;
  IO_in <= IO;
  I_in <= I;
  OSC_EN_in <= OSC_EN;
  OSC_in <= OSC;
  T_in <= T;
  
  DIFF_TERM_BIN <=
    DIFF_TERM_FALSE when (DIFF_TERM = "FALSE") else
    DIFF_TERM_TRUE  when (DIFF_TERM = "TRUE")  else
    DIFF_TERM_FALSE;

  DQS_BIAS_BIN <= 
    DQS_BIAS_FALSE when (DQS_BIAS = "FALSE") else
    DQS_BIAS_TRUE when (DQS_BIAS = "TRUE") else
    DQS_BIAS_FALSE;

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
    -------- DIFF_TERM check
  if((xil_attr_test) or
     ((DIFF_TERM /= "TRUE") and
      (DIFF_TERM /= "FALSE")))then 
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] DIFF_TERM attribute is set to "));
    Write ( Message, DIFF_TERM);
    Write ( Message, string'(". Legal values for this attribute are TRUE or FALSE. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUFDSE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DQS_BIAS check
  if((xil_attr_test) or
     ((DQS_BIAS /= "FALSE") and 
      (DQS_BIAS /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] DQS_BIAS attribute is set to """));
    Write ( Message, string'(DQS_BIAS));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUFDSE3_V'INSTANCE_NAME));
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
    Write ( Message, string'("-103] IBUF_LOW_PWR attribute is set to """));
    Write ( Message, string'(IBUF_LOW_PWR));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUFDSE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SIM_INPUT_BUFFER_OFFSET check
    if ((SIM_INPUT_BUFFER_OFFSET < -50) or (SIM_INPUT_BUFFER_OFFSET > 50)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-105] SIM_INPUT_BUFFER_OFFSET attribute is set to "));
      Write ( Message, SIM_INPUT_BUFFER_OFFSET);
      Write ( Message, string'(". Legal values for this attribute are -50 to 50. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUFDSE3_V'INSTANCE_NAME));
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
    Write ( Message, string'("-107] USE_IBUFDISABLE attribute is set to """));
    Write ( Message, string'(USE_IBUFDISABLE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IOBUFDSE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-107] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUFDSE3_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
  Behavior : process (IO_in, IOB_in, IBUFDISABLE_in, T_in, USE_IBUFDISABLE_BIN, DQS_BIAS_BIN)
      variable IBUFDISABLE_AND_ENABLED   : std_ulogic := '0';
  begin
    IBUFDISABLE_AND_ENABLED := ((IBUFDISABLE_in or (not T_in)) and USE_IBUFDISABLE_BIN);
    if(IBUFDISABLE_AND_ENABLED = '1') then
       O_out <= '0';
    elsif(IBUFDISABLE_AND_ENABLED = '0') then
    if  (((IO_in = '1') or (IO_in = 'H')) and ((IOB_in = '0') or (IOB_in = 'L'))) then
      O_out <= '1';
    elsif (((IO_in = '0') or (IO_in = 'L')) and ((IOB_in = '1') or (IOB_in = 'H'))) then
      O_out <= '0';
    elsif ((IO_in = 'Z' or IO_in = '0' or IO_in = 'L') and (IOB_in = 'Z' or IOB_in = '1' or IOB_in = 'H')) then
      if (DQS_BIAS_BIN = '1') then
        O_out <= '0';
      else
        O_out <= 'X';
      end if;
    elsif ((IO_in = 'X') or (IOB_in = 'X')) then
      O_out <= 'X';
    end if;
    end if;
  end process Behavior;
  OSC_Enable_IOBUFDSE3 :process(OSC_in,OSC_EN_in)
  variable OSC_int : integer := 0;
  begin
    if (OSC_in(3) = '0') then
    OSC_int := -1 * SLV_TO_INT(OSC_in(2 downto 0)) * 5;
    else
    OSC_int := SLV_TO_INT(OSC_in(2 downto 0)) * 5;
    end if;
    if (OSC_EN_in = "11") then
      if ((SIM_INPUT_BUFFER_OFFSET - OSC_int) < 0) then 
          O_OSC_in <= '0';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) > 0) then
          O_OSC_in <= '1';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) = 0 ) then
          O_OSC_in <= not O_OSC_in;
      end if;	  
    end if;
  end process OSC_Enable_IOBUFDSE3;
 
 O_delay <= O_OSC_in when OSC_EN_in = "11" else
            'X' when (OSC_EN_in = "10" or OSC_EN_in = "01") else
	    O_out;

 FunctionalBehavior_IOBUFDSE3    : process (I_in, T_in)
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

    if ((T_in = '1') or (T_in = 'H')) then
      IOB_out <= 'Z';
    elsif ((T_in = '0') or (T_in = 'L')) then
      if (((not I_in) = '1') or ((not I_in) = 'H')) then
        IOB_out <= '1';
      elsif (((not I_in) = '0') or ((not I_in) = 'L')) then
        IOB_out <= '0';
      elsif ((not I_in) = 'U') then
        IOB_out <= 'U';
      else
        IOB_out <= 'X';  
      end if;
    elsif (T_in = 'U') then
      IOB_out <= 'U';          
    else                                      
      IOB_out <= 'X';  
    end if;        
  end process;
    -- end behavioral body
  end IOBUFDSE3_V;
