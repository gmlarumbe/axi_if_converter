-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        TX_BITSLICE
-- /___/   /\      Filename    : TX_BITSLICE.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL TX_BITSLICE -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

library SECUREIP;
use SECUREIP.all;

entity TX_BITSLICE is
  generic (
    DATA_WIDTH : integer := 8;
    DELAY_FORMAT : string := "TIME";
    DELAY_TYPE : string := "FIXED";
    DELAY_VALUE : integer := 0;
    ENABLE_PRE_EMPHASIS : string := "FALSE";
    INIT : bit := '1';
    IS_CLK_INVERTED : bit := '0';
    IS_RST_DLY_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    NATIVE_ODELAY_BYPASS : string := "FALSE";
    OUTPUT_PHASE_90 : string := "FALSE";
    REFCLK_FREQUENCY : real := 300.0;
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0;
    TBYTE_CTL : string := "TBYTE_IN";
    UPDATE_MODE : string := "ASYNC"
  );
  
  port (
    CNTVALUEOUT          : out std_logic_vector(8 downto 0);
    O                    : out std_ulogic;
    RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
    T_OUT                : out std_ulogic;
    CE                   : in std_ulogic;
    CLK                  : in std_ulogic;
    CNTVALUEIN           : in std_logic_vector(8 downto 0);
    D                    : in std_logic_vector(7 downto 0);
    EN_VTC               : in std_ulogic;
    INC                  : in std_ulogic;
    LOAD                 : in std_ulogic;
    RST                  : in std_ulogic;
    RST_DLY              : in std_ulogic;
    RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
    T                    : in std_ulogic;
    TBYTE_IN             : in std_ulogic;
    TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0)
  );
end TX_BITSLICE;

architecture TX_BITSLICE_V of TX_BITSLICE is
  component SIP_TX_BITSLICE_K2
    
    port (
        DATA_WIDTH           : in std_logic_vector(31 downto 0);
        DC_ADJ_EN            : in std_logic_vector(0 downto 0);
        DELAY_FORMAT         : in std_logic_vector(39 downto 0);
        DELAY_TYPE           : in std_logic_vector(63 downto 0);
        DELAY_VALUE          : in std_logic_vector(31 downto 0);
        ENABLE_PRE_EMPHASIS  : in std_logic_vector(39 downto 0);
        FDLY                 : in std_logic_vector(2 downto 0);
        INIT                 : in std_logic_vector(0 downto 0);
        NATIVE_ODELAY_BYPASS : in std_logic_vector(39 downto 0);
        OUTPUT_PHASE_90      : in std_logic_vector(39 downto 0);
        REFCLK_FREQUENCY     : in std_logic_vector(63 downto 0);
        RX_Q4_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_Q5_ROUTETHRU      : in std_logic_vector(39 downto 0);
        SIM_VERSION          : in std_logic_vector(63 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        TX_Q_ROUTETHRU       : in std_logic_vector(39 downto 0);
        TX_T_OUT_ROUTETHRU   : in std_logic_vector(39 downto 0);
        UPDATE_MODE          : in std_logic_vector(47 downto 0);
        XIPHY_BITSLICE_MODE  : in std_logic_vector(39 downto 0);
        RX_DATA_TYPE         : in std_logic_vector(111 downto 0);
        RX_DELAY_FORMAT      : in std_logic_vector(39 downto 0);
        CNTVALUEOUT          : out std_logic_vector(8 downto 0);
        O                    : out std_ulogic;
        RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        T_OUT                : out std_ulogic;
        CE                   : in std_ulogic;
        CLK                  : in std_ulogic;
        CNTVALUEIN           : in std_logic_vector(8 downto 0);
        D                    : in std_logic_vector(7 downto 0);
        EN_VTC               : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        INC                  : in std_ulogic;
        LOAD                 : in std_ulogic;
        OFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        RST_DLY              : in std_ulogic;
        RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        RX_CE                : in std_ulogic;
        RX_CLK               : in std_ulogic;
        RX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
        RX_DATAIN1           : in std_ulogic;
        RX_EN_VTC            : in std_ulogic;
        RX_INC               : in std_ulogic;
        RX_LOAD              : in std_ulogic;
        RX_RESET             : in std_ulogic;
        RX_RST               : in std_ulogic;
        T                    : in std_ulogic;
        TBYTE_IN             : in std_ulogic;
        TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        SIM_ODELAY_DATAIN0   : out std_ulogic;
        SIM_ODELAY_DATAOUT   : out std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;
  component SIP_TX_BITSLICE_D1
    
    port (
        DATA_WIDTH           : in std_logic_vector(31 downto 0);
        DC_ADJ_EN            : in std_logic_vector(0 downto 0);
        DELAY_FORMAT         : in std_logic_vector(39 downto 0);
        DELAY_TYPE           : in std_logic_vector(63 downto 0);
        DELAY_VALUE          : in std_logic_vector(31 downto 0);
        ENABLE_PRE_EMPHASIS  : in std_logic_vector(39 downto 0);
        FDLY                 : in std_logic_vector(2 downto 0);
        INIT                 : in std_logic_vector(0 downto 0);
        NATIVE_ODELAY_BYPASS : in std_logic_vector(39 downto 0);
        OUTPUT_PHASE_90      : in std_logic_vector(39 downto 0);
        REFCLK_FREQUENCY     : in std_logic_vector(63 downto 0);
        RX_DATA_TYPE         : in std_logic_vector(111 downto 0);
        RX_DELAY_FORMAT      : in std_logic_vector(39 downto 0);
        RX_Q4_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_Q5_ROUTETHRU      : in std_logic_vector(39 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        TX_Q_ROUTETHRU       : in std_logic_vector(39 downto 0);
        TX_T_OUT_ROUTETHRU   : in std_logic_vector(39 downto 0);
        FIFO_ENABLE          : in std_logic_vector(39 downto 0);
        SPARE                : in std_logic_vector(5 downto 0);
        UPDATE_MODE          : in std_logic_vector(47 downto 0);
        XIPHY_BITSLICE_MODE  : in std_logic_vector(39 downto 0);
        CNTVALUEOUT          : out std_logic_vector(8 downto 0);
        O                    : out std_ulogic;
        RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        T_OUT                : out std_ulogic;
        CE                   : in std_ulogic;
        CLK                  : in std_ulogic;
        CNTVALUEIN           : in std_logic_vector(8 downto 0);
        D                    : in std_logic_vector(7 downto 0);
        EN_VTC               : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        INC                  : in std_ulogic;
        LOAD                 : in std_ulogic;
        OFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        RST_DLY              : in std_ulogic;
        RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        RX_CE                : in std_ulogic;
        RX_CLK               : in std_ulogic;
        RX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
        RX_DATAIN1           : in std_ulogic;
        RX_EN_VTC            : in std_ulogic;
        RX_INC               : in std_ulogic;
        RX_LOAD              : in std_ulogic;
        RX_RESET             : in std_ulogic;
        RX_RST               : in std_ulogic;
        T                    : in std_ulogic;
        TBYTE_IN             : in std_ulogic;
        TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        SIM_ODELAY_DATAIN0   : out std_ulogic;
        SIM_ODELAY_DATAOUT   : out std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;

    constant MODULE_NAME : string := "TX_BITSLICE";
    constant IN_DELAY : time := 0 ps;
    constant OUT_DELAY : time := 0 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 100 ps;
    
  FUNCTION conv_string_to_slv(s: string; size: IN INTEGER) RETURN std_logic_vector IS
    CONSTANT ss: string(s'length downto 1) := s;
    VARIABLE y: std_logic_vector(size-1 downto 0) := (others => '0');
    VARIABLE p: integer;
  --- Variable to hold each character's ASCII code
    VARIABLE c: integer;
  BEGIN
    FOR i IN ss'RANGE LOOP --- scan the characters
      p := 8*i;
      c := character'pos(ss(i)); --- get the character's ASCII code
      y(p-1 downto p-8) := std_logic_vector(to_unsigned(c,8));
    end loop;
    return y;
  END conv_string_to_slv;

    -- Convert generic to signal
    constant DELAY_FORMAT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DELAY_FORMAT,40);
    constant FIFO_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant SPARE_BIN : std_logic_vector(5 downto 0) := "000000";
    constant DELAY_TYPE_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(DELAY_TYPE,64);
    constant ENABLE_PRE_EMPHASIS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ENABLE_PRE_EMPHASIS,40);
    constant NATIVE_ODELAY_BYPASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(NATIVE_ODELAY_BYPASS,40);
    constant OUTPUT_PHASE_90_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(OUTPUT_PHASE_90,40);
    constant RX_Q4_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant RX_Q5_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);
    constant TBYTE_CTL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(TBYTE_CTL,64);
    constant TX_Q_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant TX_T_OUT_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant UPDATE_MODE_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(UPDATE_MODE,48);
    constant XIPHY_BITSLICE_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant RX_DELAY_FORMAT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv("COUNT",40);
    constant RX_DATA_TYPE_REG : std_logic_vector(111 downto 0) := conv_string_to_slv("DATA_AND_CLOCK",112);
    

    constant DATA_WIDTH_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(DATA_WIDTH,32));
    constant DC_ADJ_EN_BIN : std_logic_vector(0 downto 0) := "0";
    constant DELAY_VALUE_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(DELAY_VALUE,32));
    constant FDLY_BIN : std_logic_vector(2 downto 0) := "010";
    constant INIT_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(INIT));
    constant REFCLK_FREQUENCY_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(REFCLK_FREQUENCY * 1000.0),64));
    constant SIM_VERSION_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(SIM_VERSION * 1000.0),64));
    signal IS_CLK_INVERTED_BIN : std_ulogic := TO_X01(IS_CLK_INVERTED);    signal IS_RST_DLY_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_DLY_INVERTED);    signal IS_RST_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_INVERTED);
  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed
    
    signal CNTVALUEOUT_out : std_logic_vector(8 downto 0);
    signal O_out : std_logic;
    signal RX_BIT_CTRL_OUT_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT_out : std_logic_vector(39 downto 0);
    signal T_OUT_out : std_logic;
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CE_in : std_ulogic;
    signal CLK_in : std_ulogic;
    signal CNTVALUEIN_in : std_logic_vector(8 downto 0);
    signal D_in : std_logic_vector(7 downto 0);
    signal EN_VTC_in : std_ulogic;
    signal FIFO_RD_CLK_in : std_ulogic;
    signal FIFO_RD_EN_in : std_ulogic;
    signal IFD_CE_in : std_ulogic;
    signal INC_in : std_ulogic;
    signal LOAD_in : std_ulogic;
    signal OFD_CE_in : std_ulogic;
    signal RST_DLY_in : std_ulogic;
    signal RST_in : std_ulogic;
    signal RX_BIT_CTRL_IN_in : std_logic_vector(39 downto 0);
    signal RX_CE_in : std_ulogic;
    signal RX_CLK_in : std_ulogic;
    signal RX_CNTVALUEIN_in : std_logic_vector(8 downto 0);
    signal RX_DATAIN1_in : std_ulogic;
    signal RX_EN_VTC_in : std_ulogic;
    signal RX_INC_in : std_ulogic;
    signal RX_LOAD_in : std_ulogic;
    signal RX_RESET_in : std_ulogic;
    signal RX_RST_in : std_ulogic;
    signal TBYTE_IN_in : std_ulogic;
    signal TX_BIT_CTRL_IN_in : std_logic_vector(39 downto 0);
    signal T_in : std_ulogic;
    signal ODELAY_DATAIN0_out : std_logic;
    signal ODELAY_DATAOUT_out : std_logic;
    
    
    
    signal warning_flag : std_ulogic := '1';
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    CNTVALUEOUT <= "XXXXXXXXX" when (EN_VTC_in = '1') else CNTVALUEOUT_out after OUT_DELAY;
    O <= O_out after OUT_DELAY;
    RX_BIT_CTRL_OUT <= RX_BIT_CTRL_OUT_out after OUT_DELAY;
    TX_BIT_CTRL_OUT <= TX_BIT_CTRL_OUT_out after OUT_DELAY;
    T_OUT <= T_OUT_out after OUT_DELAY;
    
    CE_in <= CE;
    CLK_in <= CLK xor IS_CLK_INVERTED_BIN;
    CNTVALUEIN_in <= CNTVALUEIN;
    D_in <= D;
    EN_VTC_in <= EN_VTC;
    INC_in <= INC;
    LOAD_in <= LOAD;
    RST_DLY_in <= RST_DLY xor IS_RST_DLY_INVERTED_BIN;
    RST_in <= RST xor IS_RST_INVERTED_BIN;
    RX_BIT_CTRL_IN_in <= RX_BIT_CTRL_IN;
    TBYTE_IN_in <= TBYTE_IN;
    TX_BIT_CTRL_IN_in <= TX_BIT_CTRL_IN;
    T_in <= T;
    

    RX_CLK_in <= '1'; -- tie off

    FIFO_RD_CLK_in <= '0'; -- tie off
    FIFO_RD_EN_in <= '0'; -- tie off
    IFD_CE_in <= '0'; -- tie off
    OFD_CE_in <= '0'; -- tie off
    RX_CE_in <= '0'; -- tie off
    RX_CNTVALUEIN_in <= "000000000"; -- tie off
    RX_DATAIN1_in <= '0'; -- tie off
    RX_EN_VTC_in <= '1'; -- tie off
    RX_INC_in <= '0'; -- tie off
    RX_LOAD_in <= '0'; -- tie off
    RX_RESET_in <= '0'; -- tie off
    RX_RST_in <= '0'; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DATA_WIDTH check
      if((xil_attr_test) or
         ((DATA_WIDTH /= 8) and 
          (DATA_WIDTH /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] DATA_WIDTH attribute is set to "));
        Write ( Message, DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("8 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DELAY_FORMAT check
      if((xil_attr_test) or
         ((DELAY_FORMAT /= "TIME") and 
          (DELAY_FORMAT /= "COUNT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] DELAY_FORMAT attribute is set to """));
        Write ( Message, string'(DELAY_FORMAT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TIME"" or "));
        Write ( Message, string'("""COUNT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DELAY_TYPE check
      if((xil_attr_test) or
         ((DELAY_TYPE /= "FIXED") and 
          (DELAY_TYPE /= "VAR_LOAD") and 
          (DELAY_TYPE /= "VARIABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] DELAY_TYPE attribute is set to """));
        Write ( Message, string'(DELAY_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FIXED"", "));
        Write ( Message, string'("""VAR_LOAD"" or "));
        Write ( Message, string'("""VARIABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DELAY_VALUE check
        if((xil_attr_test) or
          (SIM_DEVICE = "ULTRASCALE" and  ((DELAY_VALUE < 0) or (DELAY_VALUE > 1250)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-105] DELAY_VALUE attribute is set to "));
          Write ( Message, DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1250. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
          (SIM_DEVICE /= "ULTRASCALE" and  ((DELAY_VALUE < 0) or (DELAY_VALUE > 1100)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-105] DELAY_VALUE attribute is set to "));
          Write ( Message, DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- ENABLE_PRE_EMPHASIS check
      if((xil_attr_test) or
         ((ENABLE_PRE_EMPHASIS /= "FALSE") and 
          (ENABLE_PRE_EMPHASIS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] ENABLE_PRE_EMPHASIS attribute is set to """));
        Write ( Message, string'(ENABLE_PRE_EMPHASIS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- NATIVE_ODELAY_BYPASS check
      if((xil_attr_test) or
         ((NATIVE_ODELAY_BYPASS /= "FALSE") and 
          (NATIVE_ODELAY_BYPASS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-112] NATIVE_ODELAY_BYPASS attribute is set to """));
        Write ( Message, string'(NATIVE_ODELAY_BYPASS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- OUTPUT_PHASE_90 check
      if((xil_attr_test) or
         ((OUTPUT_PHASE_90 /= "FALSE") and 
          (OUTPUT_PHASE_90 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] OUTPUT_PHASE_90 attribute is set to """));
        Write ( Message, string'(OUTPUT_PHASE_90));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- REFCLK_FREQUENCY check
        if((xil_attr_test) or
          (DELAY_FORMAT /= "COUNT" and SIM_DEVICE /= "ULTRASCALE" and  ((REFCLK_FREQUENCY < 300.0) or (REFCLK_FREQUENCY > 2667.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-114] REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 300.0 to 2667.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
       if((xil_attr_test) or
          (DELAY_FORMAT /= "COUNT" and SIM_DEVICE = "ULTRASCALE" and  ((REFCLK_FREQUENCY < 200.0) or (REFCLK_FREQUENCY > 2400.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-114] REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 200.0 to 2400.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-117] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-118] SIM_VERSION attribute is set to "));
        Write ( Message, SIM_VERSION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2.0 or "));
        Write ( Message, string'("1.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TBYTE_CTL check
      if((xil_attr_test) or
         ((TBYTE_CTL /= "TBYTE_IN") and 
          (TBYTE_CTL /= "T"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-119] TBYTE_CTL attribute is set to """));
        Write ( Message, string'(TBYTE_CTL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TBYTE_IN"" or "));
        Write ( Message, string'("""T"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- UPDATE_MODE check
      if((xil_attr_test) or
         ((UPDATE_MODE /= "ASYNC") and 
          (UPDATE_MODE /= "MANUAL") and 
          (UPDATE_MODE /= "SYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-122] UPDATE_MODE attribute is set to """));
        Write ( Message, string'(UPDATE_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ASYNC"", "));
        Write ( Message, string'("""MANUAL"" or "));
        Write ( Message, string'("""SYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-113] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(TX_BITSLICE_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

  prcs_en_vtc: process(EN_VTC_in)
   variable Message : line;
  begin
    if ((EN_VTC_in = '0') and (DELAY_FORMAT = "TIME") and warning_flag = '1') then
      DEALLOCATE (Message);
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-1] BISC Calibration : DELAY_FORMAT set to TIME with EN_VTC signal set to 0. In hardware, when the EN_VTC signal is low during the initial calibration process, the BISC will never complete and the DLY_RDY and VTC_RDY status signals from the BITSLICE_CONTROL remain low. Simulation will not reflect this behavior. In simulation, the DLY_RDY and VTC_RDY from the BITSLICE_CONTROL will assert high. You should ensure the EN_VTC signal is held high during initial BISC self calibration to ensure BISC completes in hardware. See Select IO Userguide UG571 for more information."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(TX_BITSLICE_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity Warning;
      DEALLOCATE (Message);
      warning_flag <= '0';
    end if;
  end process prcs_en_vtc;


  D1_TX_inst : if ((SIM_DEVICE = "ULTRASCALE_PLUS") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES2")) generate
    TX_BITSLICE_INST : SIP_TX_BITSLICE_D1
      port map (
        DATA_WIDTH           => DATA_WIDTH_BIN,
        DC_ADJ_EN            => DC_ADJ_EN_BIN,
        DELAY_FORMAT         => DELAY_FORMAT_BIN,
        DELAY_TYPE           => DELAY_TYPE_BIN,
        DELAY_VALUE          => DELAY_VALUE_BIN,
        ENABLE_PRE_EMPHASIS  => ENABLE_PRE_EMPHASIS_BIN,
        FDLY                 => FDLY_BIN,
        FIFO_ENABLE          => FIFO_ENABLE_BIN,
        SPARE                => SPARE_BIN,
        RX_DATA_TYPE	     => RX_DATA_TYPE_REG,
        RX_DELAY_FORMAT      => RX_DELAY_FORMAT_REG,
        INIT                 => INIT_BIN,
        NATIVE_ODELAY_BYPASS => NATIVE_ODELAY_BYPASS_BIN,
        OUTPUT_PHASE_90      => OUTPUT_PHASE_90_BIN,
        REFCLK_FREQUENCY     => REFCLK_FREQUENCY_BIN,
        RX_Q4_ROUTETHRU      => RX_Q4_ROUTETHRU_BIN,
        RX_Q5_ROUTETHRU      => RX_Q5_ROUTETHRU_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        TX_Q_ROUTETHRU       => TX_Q_ROUTETHRU_BIN,
        TX_T_OUT_ROUTETHRU   => TX_T_OUT_ROUTETHRU_BIN,
        UPDATE_MODE          => UPDATE_MODE_BIN,
        XIPHY_BITSLICE_MODE  => XIPHY_BITSLICE_MODE_BIN,
        CNTVALUEOUT          => CNTVALUEOUT_out,
        O                    => O_out,
        RX_BIT_CTRL_OUT      => RX_BIT_CTRL_OUT_out,
        TX_BIT_CTRL_OUT      => TX_BIT_CTRL_OUT_out,
        T_OUT                => T_OUT_out,
        CE                   => CE_in,
        CLK                  => CLK_in,
        CNTVALUEIN           => CNTVALUEIN_in,
        D                    => D_in,
        EN_VTC               => EN_VTC_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        INC                  => INC_in,
        LOAD                 => LOAD_in,
        OFD_CE               => OFD_CE_in,
        RST                  => RST_in,
        RST_DLY              => RST_DLY_in,
        RX_BIT_CTRL_IN       => RX_BIT_CTRL_IN_in,
        RX_CE                => RX_CE_in,
        RX_CLK               => RX_CLK_in,
        RX_CNTVALUEIN        => RX_CNTVALUEIN_in,
        RX_DATAIN1           => RX_DATAIN1_in,
        RX_EN_VTC            => RX_EN_VTC_in,
        RX_INC               => RX_INC_in,
        RX_LOAD              => RX_LOAD_in,
        RX_RESET             => RX_RESET_in,
        RX_RST               => RX_RST_in,
        T                    => T_in,
        TBYTE_IN             => TBYTE_IN_in,
        TX_BIT_CTRL_IN       => TX_BIT_CTRL_IN_in,
        SIM_ODELAY_DATAIN0   => ODELAY_DATAIN0_out,
        SIM_ODELAY_DATAOUT   => ODELAY_DATAOUT_out,
        GSR                  => glblGSR        
      );
  end generate D1_TX_inst;
  K2_TX_inst : if (SIM_DEVICE = "ULTRASCALE") generate
    TX_BITSLICE_INST : SIP_TX_BITSLICE_K2
      port map (
        DATA_WIDTH           => DATA_WIDTH_BIN,
        DC_ADJ_EN            => DC_ADJ_EN_BIN,
        DELAY_FORMAT         => DELAY_FORMAT_BIN,
        DELAY_TYPE           => DELAY_TYPE_BIN,
        DELAY_VALUE          => DELAY_VALUE_BIN,
        ENABLE_PRE_EMPHASIS  => ENABLE_PRE_EMPHASIS_BIN,
        FDLY                 => FDLY_BIN,
        INIT                 => INIT_BIN,
        NATIVE_ODELAY_BYPASS => NATIVE_ODELAY_BYPASS_BIN,
        OUTPUT_PHASE_90      => OUTPUT_PHASE_90_BIN,
        REFCLK_FREQUENCY     => REFCLK_FREQUENCY_BIN,
        RX_DATA_TYPE	     => RX_DATA_TYPE_REG,
        RX_DELAY_FORMAT      => RX_DELAY_FORMAT_REG,
        RX_Q4_ROUTETHRU      => RX_Q4_ROUTETHRU_BIN,
        RX_Q5_ROUTETHRU      => RX_Q5_ROUTETHRU_BIN,
        SIM_VERSION          => SIM_VERSION_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        TX_Q_ROUTETHRU       => TX_Q_ROUTETHRU_BIN,
        TX_T_OUT_ROUTETHRU   => TX_T_OUT_ROUTETHRU_BIN,
        UPDATE_MODE          => UPDATE_MODE_BIN,
        XIPHY_BITSLICE_MODE  => XIPHY_BITSLICE_MODE_BIN,
        CNTVALUEOUT          => CNTVALUEOUT_out,
        O                    => O_out,
        RX_BIT_CTRL_OUT      => RX_BIT_CTRL_OUT_out,
        TX_BIT_CTRL_OUT      => TX_BIT_CTRL_OUT_out,
        T_OUT                => T_OUT_out,
        CE                   => CE_in,
        CLK                  => CLK_in,
        CNTVALUEIN           => CNTVALUEIN_in,
        D                    => D_in,
        EN_VTC               => EN_VTC_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        INC                  => INC_in,
        LOAD                 => LOAD_in,
        OFD_CE               => OFD_CE_in,
        RST                  => RST_in,
        RST_DLY              => RST_DLY_in,
        RX_BIT_CTRL_IN       => RX_BIT_CTRL_IN_in,
        RX_CE                => RX_CE_in,
        RX_CLK               => RX_CLK_in,
        RX_CNTVALUEIN        => RX_CNTVALUEIN_in,
        RX_DATAIN1           => RX_DATAIN1_in,
        RX_EN_VTC            => RX_EN_VTC_in,
        RX_INC               => RX_INC_in,
        RX_LOAD              => RX_LOAD_in,
        RX_RESET             => RX_RESET_in,
        RX_RST               => RX_RST_in,
        T                    => T_in,
        TBYTE_IN             => TBYTE_IN_in,
        TX_BIT_CTRL_IN       => TX_BIT_CTRL_IN_in,
        SIM_ODELAY_DATAIN0   => ODELAY_DATAIN0_out,
        SIM_ODELAY_DATAOUT   => ODELAY_DATAOUT_out,
        GSR                  => glblGSR        
      );
  end generate K2_TX_inst;
  end TX_BITSLICE_V;
