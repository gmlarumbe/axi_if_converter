-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        RX_BITSLICE
-- /___/   /\      Filename    : RX_BITSLICE.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL RX_BITSLICE -----

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

entity RX_BITSLICE is
  generic (
    CASCADE : string := "FALSE";
    DATA_TYPE : string := "DATA";
    DATA_WIDTH : integer := 8;
    DELAY_FORMAT : string := "TIME";
    DELAY_TYPE : string := "FIXED";
    DELAY_VALUE : integer := 0;
    DELAY_VALUE_EXT : integer := 0;
    FIFO_SYNC_MODE : string := "FALSE";
    IS_CLK_EXT_INVERTED : bit := '0';
    IS_CLK_INVERTED : bit := '0';
    IS_RST_DLY_EXT_INVERTED : bit := '0';
    IS_RST_DLY_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    REFCLK_FREQUENCY : real := 300.0;
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0;
    UPDATE_MODE : string := "ASYNC";
    UPDATE_MODE_EXT : string := "ASYNC"
  );
  
  port (
    CNTVALUEOUT          : out std_logic_vector(8 downto 0);
    CNTVALUEOUT_EXT      : out std_logic_vector(8 downto 0);
    FIFO_EMPTY           : out std_ulogic;
    FIFO_WRCLK_OUT       : out std_ulogic;
    Q                    : out std_logic_vector(7 downto 0);
    RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
    CE                   : in std_ulogic;
    CE_EXT               : in std_ulogic;
    CLK                  : in std_ulogic;
    CLK_EXT              : in std_ulogic;
    CNTVALUEIN           : in std_logic_vector(8 downto 0);
    CNTVALUEIN_EXT       : in std_logic_vector(8 downto 0);
    DATAIN               : in std_ulogic;
    EN_VTC               : in std_ulogic;
    EN_VTC_EXT           : in std_ulogic;
    FIFO_RD_CLK          : in std_ulogic;
    FIFO_RD_EN           : in std_ulogic;
    INC                  : in std_ulogic;
    INC_EXT              : in std_ulogic;
    LOAD                 : in std_ulogic;
    LOAD_EXT             : in std_ulogic;
    RST                  : in std_ulogic;
    RST_DLY              : in std_ulogic;
    RST_DLY_EXT          : in std_ulogic;
    RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0)
  );
end RX_BITSLICE;

architecture RX_BITSLICE_V of RX_BITSLICE is
  component SIP_RX_BITSLICE_K2
    
    port (
        CASCADE              : in std_logic_vector(39 downto 0);
        DATA_TYPE            : in std_logic_vector(111 downto 0);
        DATA_WIDTH           : in std_logic_vector(31 downto 0);
        DC_ADJ_EN            : in std_logic_vector(0 downto 0);
        DC_ADJ_EN_EXT        : in std_logic_vector(0 downto 0);
        DDR_DIS_DQS          : in std_logic_vector(39 downto 0);
        DELAY_FORMAT         : in std_logic_vector(39 downto 0);
        DELAY_TYPE           : in std_logic_vector(63 downto 0);
        DELAY_VALUE          : in std_logic_vector(31 downto 0);
        DELAY_VALUE_EXT      : in std_logic_vector(31 downto 0);
        FDLY                 : in std_logic_vector(2 downto 0);
        FDLY_EXT             : in std_logic_vector(2 downto 0);
        FIFO_SYNC_MODE       : in std_logic_vector(39 downto 0);
        REFCLK_FREQUENCY     : in std_logic_vector(63 downto 0);
        RX_Q4_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_Q5_ROUTETHRU      : in std_logic_vector(39 downto 0);
        SIM_VERSION          : in std_logic_vector(63 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        TX_Q_ROUTETHRU       : in std_logic_vector(39 downto 0);
        TX_T_OUT_ROUTETHRU   : in std_logic_vector(39 downto 0);
        UPDATE_MODE          : in std_logic_vector(47 downto 0);
        UPDATE_MODE_EXT      : in std_logic_vector(47 downto 0);
        XIPHY_BITSLICE_MODE  : in std_logic_vector(39 downto 0);
        CNTVALUEOUT          : out std_logic_vector(8 downto 0);
        CNTVALUEOUT_EXT      : out std_logic_vector(8 downto 0);
        FIFO_EMPTY           : out std_ulogic;
        FIFO_WRCLK_OUT       : out std_ulogic;
        Q                    : out std_logic_vector(7 downto 0);
        RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        CE                   : in std_ulogic;
        CE_EXT               : in std_ulogic;
        CLK                  : in std_ulogic;
        CLK_EXT              : in std_ulogic;
        CNTVALUEIN           : in std_logic_vector(8 downto 0);
        CNTVALUEIN_EXT       : in std_logic_vector(8 downto 0);
        DATAIN               : in std_ulogic;
        EN_VTC               : in std_ulogic;
        EN_VTC_EXT           : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        INC                  : in std_ulogic;
        INC_EXT              : in std_ulogic;
        LOAD                 : in std_ulogic;
        LOAD_EXT             : in std_ulogic;
        OFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        RST_DLY              : in std_ulogic;
        RST_DLY_EXT          : in std_ulogic;
        RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        RX_DATAIN1           : in std_ulogic;
        T                    : in std_ulogic;
        TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        TX_D                 : in std_logic_vector(7 downto 0);
        TX_RST               : in std_ulogic;
        SIM_IDELAY_DATAIN0   : out std_ulogic;
        SIM_IDELAY_DATAOUT   : out std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;
  component SIP_RX_BITSLICE_D1
    
    port (
        CASCADE              : in std_logic_vector(39 downto 0);
        DATA_TYPE            : in std_logic_vector(111 downto 0);
        DATA_WIDTH           : in std_logic_vector(31 downto 0);
        DC_ADJ_EN            : in std_logic_vector(0 downto 0);
        DC_ADJ_EN_EXT        : in std_logic_vector(0 downto 0);
        DDR_DIS_DQS          : in std_logic_vector(39 downto 0);
        DELAY_FORMAT         : in std_logic_vector(39 downto 0);
        DELAY_TYPE           : in std_logic_vector(63 downto 0);
        DELAY_VALUE          : in std_logic_vector(31 downto 0);
        DELAY_VALUE_EXT      : in std_logic_vector(31 downto 0);
        FIFO_ENABLE          : in std_logic_vector(39 downto 0);
        FDLY                 : in std_logic_vector(2 downto 0);
        FDLY_EXT             : in std_logic_vector(2 downto 0);
        FIFO_SYNC_MODE       : in std_logic_vector(39 downto 0);
        REFCLK_FREQUENCY     : in std_logic_vector(63 downto 0);
        RX_Q4_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_Q5_ROUTETHRU      : in std_logic_vector(39 downto 0);
        SPARE                : in std_logic_vector(5 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        TX_Q_ROUTETHRU       : in std_logic_vector(39 downto 0);
        TX_T_OUT_ROUTETHRU   : in std_logic_vector(39 downto 0);
        UPDATE_MODE          : in std_logic_vector(47 downto 0);
        UPDATE_MODE_EXT      : in std_logic_vector(47 downto 0);
        XIPHY_BITSLICE_MODE  : in std_logic_vector(39 downto 0);
        CNTVALUEOUT          : out std_logic_vector(8 downto 0);
        CNTVALUEOUT_EXT      : out std_logic_vector(8 downto 0);
        FIFO_EMPTY           : out std_ulogic;
        FIFO_WRCLK_OUT       : out std_ulogic;
        Q                    : out std_logic_vector(7 downto 0);
        RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        CE                   : in std_ulogic;
        CE_EXT               : in std_ulogic;
        CLK                  : in std_ulogic;
        CLK_EXT              : in std_ulogic;
        CNTVALUEIN           : in std_logic_vector(8 downto 0);
        CNTVALUEIN_EXT       : in std_logic_vector(8 downto 0);
        DATAIN               : in std_ulogic;
        EN_VTC               : in std_ulogic;
        EN_VTC_EXT           : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        INC                  : in std_ulogic;
        INC_EXT              : in std_ulogic;
        LOAD                 : in std_ulogic;
        LOAD_EXT             : in std_ulogic;
        OFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        RST_DLY              : in std_ulogic;
        RST_DLY_EXT          : in std_ulogic;
        RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        RX_DATAIN1           : in std_ulogic;
        T                    : in std_ulogic;
        TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        TX_D                 : in std_logic_vector(7 downto 0);
        TX_RST               : in std_ulogic;
        SIM_IDELAY_DATAIN0   : out std_ulogic;
        SIM_IDELAY_DATAOUT   : out std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;

    constant MODULE_NAME : string := "RX_BITSLICE";
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
    constant CASCADE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CASCADE,40);
    constant DATA_TYPE_BIN : std_logic_vector(111 downto 0) := conv_string_to_slv(DATA_TYPE,112);
    constant DDR_DIS_DQS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant DELAY_FORMAT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DELAY_FORMAT,40);
    constant DELAY_TYPE_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(DELAY_TYPE,64);
    constant FIFO_SYNC_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(FIFO_SYNC_MODE,40);
    constant RX_Q4_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant RX_Q5_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);
    constant TBYTE_CTL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv("T",64);
    constant TX_Q_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant TX_T_OUT_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant UPDATE_MODE_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(UPDATE_MODE,48);
    constant UPDATE_MODE_EXT_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(UPDATE_MODE_EXT,48);
    constant XIPHY_BITSLICE_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);

    constant DATA_WIDTH_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(DATA_WIDTH,32));
    constant DC_ADJ_EN_BIN : std_logic_vector(0 downto 0) := "0";
    constant DC_ADJ_EN_EXT_BIN : std_logic_vector(0 downto 0) := "0";
    constant DELAY_VALUE_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(DELAY_VALUE,32));
    constant DELAY_VALUE_EXT_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(DELAY_VALUE_EXT,32));
    constant FDLY_BIN : std_logic_vector(2 downto 0) := "010";
    constant FDLY_EXT_BIN : std_logic_vector(2 downto 0) := "010";
    constant REFCLK_FREQUENCY_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(REFCLK_FREQUENCY * 1000.0),64));
    constant SIM_VERSION_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(SIM_VERSION * 1000.0),64));
    constant SPARE_BIN : std_logic_vector(5 downto 0) := "000000";
    constant FIFO_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
 
    signal IS_CLK_EXT_INVERTED_BIN : std_ulogic := TO_X01(IS_CLK_EXT_INVERTED);    signal IS_CLK_INVERTED_BIN : std_ulogic := TO_X01(IS_CLK_INVERTED);    signal IS_RST_DLY_EXT_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_DLY_EXT_INVERTED);    signal IS_RST_DLY_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_DLY_INVERTED);    signal IS_RST_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_INVERTED);
  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed
    
    signal CNTVALUEOUT_EXT_out : std_logic_vector(8 downto 0);
    signal CNTVALUEOUT_out : std_logic_vector(8 downto 0);
    signal FIFO_EMPTY_out : std_logic;
    signal FIFO_WRCLK_OUT_out : std_logic;
    signal Q_out : std_logic_vector(7 downto 0);
    signal RX_BIT_CTRL_OUT_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT_out : std_logic_vector(39 downto 0);
    
    signal warning_flag : std_ulogic := '1';
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CE_EXT_in : std_ulogic;
    signal CE_in : std_ulogic;
    signal CLK_EXT_in : std_ulogic;
    signal CLK_in : std_ulogic;
    signal CNTVALUEIN_EXT_in : std_logic_vector(8 downto 0);
    signal CNTVALUEIN_in : std_logic_vector(8 downto 0);
    signal DATAIN_in : std_ulogic;
    signal EN_VTC_EXT_in : std_ulogic;
    signal EN_VTC_in : std_ulogic;
    signal FIFO_RD_CLK_in : std_ulogic;
    signal FIFO_RD_EN_in : std_ulogic;
    signal IFD_CE_in : std_ulogic;
    signal INC_EXT_in : std_ulogic;
    signal INC_in : std_ulogic;
    signal LOAD_EXT_in : std_ulogic;
    signal LOAD_in : std_ulogic;
    signal OFD_CE_in : std_ulogic;
    signal RST_DLY_EXT_in : std_ulogic;
    signal RST_DLY_in : std_ulogic;
    signal RST_in : std_ulogic;
    signal RX_BIT_CTRL_IN_in : std_logic_vector(39 downto 0);
    signal RX_DATAIN1_in : std_ulogic;
    signal TX_BIT_CTRL_IN_in : std_logic_vector(39 downto 0);
    signal TX_D_in : std_logic_vector(7 downto 0);
    signal TX_RST_in : std_ulogic;
    signal T_in : std_ulogic;
    signal IDELAY_DATAIN0_out : std_logic;
    signal IDELAY_DATAOUT_out : std_logic;
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    CNTVALUEOUT <= "XXXXXXXXX" when (EN_VTC_in = '1') else CNTVALUEOUT_out after OUT_DELAY;
    CNTVALUEOUT_EXT <= CNTVALUEOUT_EXT_out after OUT_DELAY;
    FIFO_EMPTY <= FIFO_EMPTY_out after OUT_DELAY;
    FIFO_WRCLK_OUT <= FIFO_WRCLK_OUT_out after OUT_DELAY;
    Q <= Q_out after OUT_DELAY;
    RX_BIT_CTRL_OUT <= RX_BIT_CTRL_OUT_out after OUT_DELAY;
    TX_BIT_CTRL_OUT <= TX_BIT_CTRL_OUT_out after OUT_DELAY;
    
    CE_EXT_in <= CE_EXT;
    CE_in <= CE;
    CLK_EXT_in <= CLK_EXT xor IS_CLK_EXT_INVERTED_BIN;
    CLK_in <= CLK xor IS_CLK_INVERTED_BIN;
    CNTVALUEIN_EXT_in <= CNTVALUEIN_EXT;
    CNTVALUEIN_in <= CNTVALUEIN;
    DATAIN_in <= DATAIN;
    EN_VTC_EXT_in <= EN_VTC_EXT;
    EN_VTC_in <= EN_VTC;
    FIFO_RD_CLK_in <= FIFO_RD_CLK;
    FIFO_RD_EN_in <= FIFO_RD_EN;
    INC_EXT_in <= INC_EXT;
    INC_in <= INC;
    LOAD_EXT_in <= LOAD_EXT;
    LOAD_in <= LOAD;
    RST_DLY_EXT_in <= RST_DLY_EXT xor IS_RST_DLY_EXT_INVERTED_BIN;
    RST_DLY_in <= RST_DLY xor IS_RST_DLY_INVERTED_BIN;
    RST_in <= RST xor IS_RST_INVERTED_BIN;
    RX_BIT_CTRL_IN_in <= RX_BIT_CTRL_IN;
    TX_BIT_CTRL_IN_in <= TX_BIT_CTRL_IN;
    


    IFD_CE_in <= '0'; -- tie off
    OFD_CE_in <= '0'; -- tie off
    RX_DATAIN1_in <= '0'; -- tie off
    TX_D_in <= "00000000"; -- tie off
    TX_RST_in <= '0'; -- tie off
    T_in <= '1'; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CASCADE check
      if((xil_attr_test) or
         ((CASCADE /= "FALSE") and 
          (CASCADE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] CASCADE attribute is set to """));
        Write ( Message, string'(CASCADE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DATA_TYPE check
      if((xil_attr_test) or
         ((DATA_TYPE /= "DATA") and 
          (DATA_TYPE /= "CLOCK") and 
          (DATA_TYPE /= "DATA_AND_CLOCK") and 
          (DATA_TYPE /= "SERIAL"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] DATA_TYPE attribute is set to """));
        Write ( Message, string'(DATA_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DATA"", "));
        Write ( Message, string'("""CLOCK"", "));
        Write ( Message, string'("""DATA_AND_CLOCK"" or "));
        Write ( Message, string'("""SERIAL"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DATA_WIDTH check
      if((xil_attr_test) or
         ((DATA_WIDTH /= 8) and 
          (DATA_WIDTH /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] DATA_WIDTH attribute is set to "));
        Write ( Message, DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("8 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-107] DELAY_FORMAT attribute is set to """));
        Write ( Message, string'(DELAY_FORMAT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TIME"" or "));
        Write ( Message, string'("""COUNT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-108] DELAY_TYPE attribute is set to """));
        Write ( Message, string'(DELAY_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FIXED"", "));
        Write ( Message, string'("""VAR_LOAD"" or "));
        Write ( Message, string'("""VARIABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DELAY_VALUE check
        if((xil_attr_test) or
           (SIM_DEVICE = "ULTRASCALE" and ((DELAY_VALUE < 0) or (DELAY_VALUE > 1250)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-109] DELAY_VALUE attribute is set to "));
          Write ( Message, DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1250. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
           (SIM_DEVICE /= "ULTRASCALE" and ((DELAY_VALUE < 0) or (DELAY_VALUE > 1100)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-109] DELAY_VALUE attribute is set to "));
          Write ( Message, DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- DELAY_VALUE_EXT check
        if((xil_attr_test) or
           (SIM_DEVICE = "ULTRASCALE" and ((DELAY_VALUE_EXT < 0) or (DELAY_VALUE_EXT > 1250)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-110] DELAY_VALUE_EXT attribute is set to "));
          Write ( Message, DELAY_VALUE_EXT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1250. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
           (SIM_DEVICE /= "ULTRASCALE" and ((DELAY_VALUE_EXT < 0) or (DELAY_VALUE_EXT > 1100)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-110] DELAY_VALUE_EXT attribute is set to "));
          Write ( Message, DELAY_VALUE_EXT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- FIFO_SYNC_MODE check
      if((xil_attr_test) or
         ((FIFO_SYNC_MODE /= "FALSE") and 
          (FIFO_SYNC_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] FIFO_SYNC_MODE attribute is set to """));
        Write ( Message, string'(FIFO_SYNC_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- REFCLK_FREQUENCY check
        if((xil_attr_test) or
         (DELAY_FORMAT /= "COUNT" and SIM_DEVICE /= "ULTRASCALE" and   ((REFCLK_FREQUENCY < 300.0) or (REFCLK_FREQUENCY > 2667.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-119] REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 300.0 to 2667.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
         (DELAY_FORMAT /= "COUNT" and SIM_DEVICE = "ULTRASCALE" and   ((REFCLK_FREQUENCY < 200.0) or (REFCLK_FREQUENCY > 2400.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-119] REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 200.0 to 2400.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-122] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-123] SIM_VERSION attribute is set to "));
        Write ( Message, SIM_VERSION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2.0 or "));
        Write ( Message, string'("1.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-127] UPDATE_MODE attribute is set to """));
        Write ( Message, string'(UPDATE_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ASYNC"", "));
        Write ( Message, string'("""MANUAL"" or "));
        Write ( Message, string'("""SYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- UPDATE_MODE_EXT check
      if((xil_attr_test) or
         ((UPDATE_MODE_EXT /= "ASYNC") and 
          (UPDATE_MODE_EXT /= "MANUAL") and 
          (UPDATE_MODE_EXT /= "SYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-128] UPDATE_MODE_EXT attribute is set to """));
        Write ( Message, string'(UPDATE_MODE_EXT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ASYNC"", "));
        Write ( Message, string'("""MANUAL"" or "));
        Write ( Message, string'("""SYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-114] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RX_BITSLICE_V'PATH_NAME));
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
      Write ( Message, string'(RX_BITSLICE_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity Warning;
      DEALLOCATE (Message);
      warning_flag <= '0';
    end if;
  end process prcs_en_vtc;

D1_RX_inst : if ((SIM_DEVICE = "ULTRASCALE_PLUS") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES2")) generate
   
    RX_BITSLICE_INST : SIP_RX_BITSLICE_D1
      port map (
        CASCADE              => CASCADE_BIN,
        DATA_TYPE            => DATA_TYPE_BIN,
        DATA_WIDTH           => DATA_WIDTH_BIN,
        DC_ADJ_EN            => DC_ADJ_EN_BIN,
        DC_ADJ_EN_EXT        => DC_ADJ_EN_EXT_BIN,
        DDR_DIS_DQS          => DDR_DIS_DQS_BIN,
        DELAY_FORMAT         => DELAY_FORMAT_BIN,
        DELAY_TYPE           => DELAY_TYPE_BIN,
        DELAY_VALUE          => DELAY_VALUE_BIN,
        DELAY_VALUE_EXT      => DELAY_VALUE_EXT_BIN,
        FIFO_ENABLE          => FIFO_ENABLE_BIN,
        FDLY                 => FDLY_BIN,
        FDLY_EXT             => FDLY_EXT_BIN,
        FIFO_SYNC_MODE       => FIFO_SYNC_MODE_BIN,
        REFCLK_FREQUENCY     => REFCLK_FREQUENCY_BIN,
        RX_Q4_ROUTETHRU      => RX_Q4_ROUTETHRU_BIN,
        RX_Q5_ROUTETHRU      => RX_Q5_ROUTETHRU_BIN,
        SPARE                => SPARE_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        TX_Q_ROUTETHRU       => TX_Q_ROUTETHRU_BIN,
        TX_T_OUT_ROUTETHRU   => TX_T_OUT_ROUTETHRU_BIN,
        UPDATE_MODE          => UPDATE_MODE_BIN,
        UPDATE_MODE_EXT      => UPDATE_MODE_EXT_BIN,
        XIPHY_BITSLICE_MODE  => XIPHY_BITSLICE_MODE_BIN,
        CNTVALUEOUT          => CNTVALUEOUT_out,
        CNTVALUEOUT_EXT      => CNTVALUEOUT_EXT_out,
        FIFO_EMPTY           => FIFO_EMPTY_out,
        FIFO_WRCLK_OUT       => FIFO_WRCLK_OUT_out,
        Q                    => Q_out,
        RX_BIT_CTRL_OUT      => RX_BIT_CTRL_OUT_out,
        TX_BIT_CTRL_OUT      => TX_BIT_CTRL_OUT_out,
        CE                   => CE_in,
        CE_EXT               => CE_EXT_in,
        CLK                  => CLK_in,
        CLK_EXT              => CLK_EXT_in,
        CNTVALUEIN           => CNTVALUEIN_in,
        CNTVALUEIN_EXT       => CNTVALUEIN_EXT_in,
        DATAIN               => DATAIN_in,
        EN_VTC               => EN_VTC_in,
        EN_VTC_EXT           => EN_VTC_EXT_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        INC                  => INC_in,
        INC_EXT              => INC_EXT_in,
        LOAD                 => LOAD_in,
        LOAD_EXT             => LOAD_EXT_in,
        OFD_CE               => OFD_CE_in,
        RST                  => RST_in,
        RST_DLY              => RST_DLY_in,
        RST_DLY_EXT          => RST_DLY_EXT_in,
        RX_BIT_CTRL_IN       => RX_BIT_CTRL_IN_in,
        RX_DATAIN1           => RX_DATAIN1_in,
        T                    => T_in,
        TX_BIT_CTRL_IN       => TX_BIT_CTRL_IN_in,
        TX_D                 => TX_D_in,
        TX_RST               => TX_RST_in,
        SIM_IDELAY_DATAIN0   => IDELAY_DATAIN0_out,
        SIM_IDELAY_DATAOUT   => IDELAY_DATAOUT_out,
        GSR                  => glblGSR        
      );
  end generate D1_RX_inst;
  K2_RX_inst : if (SIM_DEVICE = "ULTRASCALE") generate

    RX_BITSLICE_INST : SIP_RX_BITSLICE_K2
      port map (
        CASCADE              => CASCADE_BIN,
        DATA_TYPE            => DATA_TYPE_BIN,
        DATA_WIDTH           => DATA_WIDTH_BIN,
        DC_ADJ_EN            => DC_ADJ_EN_BIN,
        DC_ADJ_EN_EXT        => DC_ADJ_EN_EXT_BIN,
        DDR_DIS_DQS          => DDR_DIS_DQS_BIN,
        DELAY_FORMAT         => DELAY_FORMAT_BIN,
        DELAY_TYPE           => DELAY_TYPE_BIN,
        DELAY_VALUE          => DELAY_VALUE_BIN,
        DELAY_VALUE_EXT      => DELAY_VALUE_EXT_BIN,
        FDLY                 => FDLY_BIN,
        FDLY_EXT             => FDLY_EXT_BIN,
        FIFO_SYNC_MODE       => FIFO_SYNC_MODE_BIN,
        REFCLK_FREQUENCY     => REFCLK_FREQUENCY_BIN,
        RX_Q4_ROUTETHRU      => RX_Q4_ROUTETHRU_BIN,
        RX_Q5_ROUTETHRU      => RX_Q5_ROUTETHRU_BIN,
        SIM_VERSION          => SIM_VERSION_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        TX_Q_ROUTETHRU       => TX_Q_ROUTETHRU_BIN,
        TX_T_OUT_ROUTETHRU   => TX_T_OUT_ROUTETHRU_BIN,
        UPDATE_MODE          => UPDATE_MODE_BIN,
        UPDATE_MODE_EXT      => UPDATE_MODE_EXT_BIN,
        XIPHY_BITSLICE_MODE  => XIPHY_BITSLICE_MODE_BIN,
        CNTVALUEOUT          => CNTVALUEOUT_out,
        CNTVALUEOUT_EXT      => CNTVALUEOUT_EXT_out,
        FIFO_EMPTY           => FIFO_EMPTY_out,
        FIFO_WRCLK_OUT       => FIFO_WRCLK_OUT_out,
        Q                    => Q_out,
        RX_BIT_CTRL_OUT      => RX_BIT_CTRL_OUT_out,
        TX_BIT_CTRL_OUT      => TX_BIT_CTRL_OUT_out,
        CE                   => CE_in,
        CE_EXT               => CE_EXT_in,
        CLK                  => CLK_in,
        CLK_EXT              => CLK_EXT_in,
        CNTVALUEIN           => CNTVALUEIN_in,
        CNTVALUEIN_EXT       => CNTVALUEIN_EXT_in,
        DATAIN               => DATAIN_in,
        EN_VTC               => EN_VTC_in,
        EN_VTC_EXT           => EN_VTC_EXT_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        INC                  => INC_in,
        INC_EXT              => INC_EXT_in,
        LOAD                 => LOAD_in,
        LOAD_EXT             => LOAD_EXT_in,
        OFD_CE               => OFD_CE_in,
        RST                  => RST_in,
        RST_DLY              => RST_DLY_in,
        RST_DLY_EXT          => RST_DLY_EXT_in,
        RX_BIT_CTRL_IN       => RX_BIT_CTRL_IN_in,
        RX_DATAIN1           => RX_DATAIN1_in,
        T                    => T_in,
        TX_BIT_CTRL_IN       => TX_BIT_CTRL_IN_in,
        TX_D                 => TX_D_in,
        TX_RST               => TX_RST_in,
        SIM_IDELAY_DATAIN0   => IDELAY_DATAIN0_out,
        SIM_IDELAY_DATAOUT   => IDELAY_DATAOUT_out,
        GSR                  => glblGSR        
      );
    end generate K2_RX_inst;
   end RX_BITSLICE_V;
