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
-- /___/   /\      Filename    : DIFFINBUF.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL DIFFINBUF -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DIFFINBUF is
  generic (
    DIFF_TERM : boolean := FALSE;
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR : string := "TRUE";
    ISTANDARD : string := "UNUSED";
    SIM_INPUT_BUFFER_OFFSET : integer := 0
  );

  port (
    O                    : out std_ulogic;
    O_B                  : out std_ulogic;
    DIFF_IN_N            : in std_ulogic;
    DIFF_IN_P            : in std_ulogic;
    OSC                  : in std_logic_vector(3 downto 0);
    OSC_EN               : in std_logic_vector(1 downto 0);
    VREF                 : in std_ulogic
  );
end DIFFINBUF;

architecture DIFFINBUF_V of DIFFINBUF is

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

  constant MODULE_NAME : string := "DIFFINBUF";
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

  signal DIFF_TERM_BIN : std_ulogic;
  signal DQS_BIAS_BIN : std_ulogic;
  signal IBUF_LOW_PWR_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal O_B_out : std_ulogic;
  signal O_out : std_ulogic;
  signal O_OSC_in : std_logic;
  signal O_B_OSC_in : std_logic;

  signal O_B_delay : std_ulogic;
  signal O_delay : std_ulogic;

  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal DIFF_IN_N_in : std_ulogic;
  signal DIFF_IN_P_in : std_ulogic;
  signal OSC_EN_in : std_logic_vector(1 downto 0);
  signal OSC_in : std_logic_vector(3 downto 0);
  signal VREF_in : std_ulogic;
  
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  O <= O_delay after OUT_DELAY;
  O_B <= O_B_delay after OUT_DELAY;
  
  DIFF_IN_N_in <= DIFF_IN_N;
  DIFF_IN_P_in <= DIFF_IN_P;
  OSC_EN_in <= OSC_EN;
  OSC_in <= OSC;
  VREF_in <= VREF;
  
  DIFF_TERM_BIN <=
    DIFF_TERM_FALSE when (DIFF_TERM = FALSE) else
    DIFF_TERM_TRUE  when (DIFF_TERM = TRUE)  else
    DIFF_TERM_FALSE;

  DQS_BIAS_BIN <= 
    DQS_BIAS_FALSE when (DQS_BIAS = "FALSE") else
    DQS_BIAS_TRUE when (DQS_BIAS = "TRUE") else
    DQS_BIAS_FALSE;

  IBUF_LOW_PWR_BIN <= 
    IBUF_LOW_PWR_TRUE when (IBUF_LOW_PWR = "TRUE") else
    IBUF_LOW_PWR_FALSE when (IBUF_LOW_PWR = "FALSE") else
    IBUF_LOW_PWR_TRUE;

  
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
    Write ( Message, string'(DIFFINBUF_V'INSTANCE_NAME));
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
    Write ( Message, string'(DIFFINBUF_V'INSTANCE_NAME));
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
    Write ( Message, string'("-104] IBUF_LOW_PWR attribute is set to """));
    Write ( Message, string'(IBUF_LOW_PWR));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DIFFINBUF_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SIM_INPUT_BUFFER_OFFSET check
    if ((SIM_INPUT_BUFFER_OFFSET < -50) or (SIM_INPUT_BUFFER_OFFSET > 50)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-111] SIM_INPUT_BUFFER_OFFSET attribute is set to "));
      Write ( Message, SIM_INPUT_BUFFER_OFFSET);
      Write ( Message, string'(". Legal values for this attribute are -50 to 50. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DIFFINBUF_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-106] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DIFFINBUF_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
  Behavior : process (DIFF_IN_P_in, DIFF_IN_N_in,DQS_BIAS_BIN)
  begin
     if  (((DIFF_IN_P_in = '1') or (DIFF_IN_P_in = 'H')) and ((DIFF_IN_N_in = '0') or (DIFF_IN_N_in = 'L'))) then
      O_out <= '1';
      O_B_out <= '0';
    elsif (((DIFF_IN_P_in = '0') or (DIFF_IN_P_in = 'L')) and ((DIFF_IN_N_in = '1') or (DIFF_IN_N_in = 'H'))) then
      O_out <= '0';
      O_B_out <= '1';
    elsif ((DIFF_IN_P_in = 'Z' or DIFF_IN_P_in = '0' or DIFF_IN_P_in = 'L') and (DIFF_IN_N_in = 'Z' or DIFF_IN_N_in = '1' or DIFF_IN_N_in = 'H')) then
      if (DQS_BIAS_BIN = '1') then
        O_out <= '0';
        O_B_out <= '1';
      else
        O_out <= 'X';
        O_B_out <= 'X';
      end if;
    elsif ((DIFF_IN_P_in = 'X') or (DIFF_IN_N_in = 'X')) then
      O_out <= 'X';
      O_B_out <= 'X';
    end if;
  end process Behavior;
  OSC_Enable : process(OSC_in,OSC_EN_in)
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
          O_B_OSC_in <= '1';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) > 0) then
          O_OSC_in <= '1';
          O_B_OSC_in <= '0';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) = 0 ) then
          O_OSC_in <= not O_OSC_in;
          O_B_OSC_in <= not O_B_OSC_in;
      end if;	  
    end if;
  end process OSC_Enable;
 
 O_delay <= O_OSC_in when OSC_EN_in = "11" else
            'X' when (OSC_EN_in = "10" or OSC_EN_in = "01") else
	    O_out; 

 O_B_delay <= O_B_OSC_in when OSC_EN_in = "11" else
            'X' when (OSC_EN_in = "10" or OSC_EN_in = "01") else
	    O_B_out; 
  
    -- end behavioral body
  end DIFFINBUF_V;
