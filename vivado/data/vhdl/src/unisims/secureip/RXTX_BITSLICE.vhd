-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        RXTX_BITSLICE
-- /___/   /\      Filename    : RXTX_BITSLICE.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL RXTX_BITSLICE -----

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

entity RXTX_BITSLICE is
  generic (
    ENABLE_PRE_EMPHASIS : string := "FALSE";
    FIFO_SYNC_MODE : string := "FALSE";
    INIT : bit := '1';
    IS_RX_CLK_INVERTED : bit := '0';
    IS_RX_RST_DLY_INVERTED : bit := '0';
    IS_RX_RST_INVERTED : bit := '0';
    IS_TX_CLK_INVERTED : bit := '0';
    IS_TX_RST_DLY_INVERTED : bit := '0';
    IS_TX_RST_INVERTED : bit := '0';
    LOOPBACK : string := "FALSE";
    NATIVE_ODELAY_BYPASS : string := "FALSE";
    RX_DATA_TYPE : string := "DATA";
    RX_DATA_WIDTH : integer := 8;
    RX_DELAY_FORMAT : string := "TIME";
    RX_DELAY_TYPE : string := "FIXED";
    RX_DELAY_VALUE : integer := 0;
    RX_REFCLK_FREQUENCY : real := 300.0;
    RX_UPDATE_MODE : string := "ASYNC";
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0;
    TBYTE_CTL : string := "TBYTE_IN";
    TX_DATA_WIDTH : integer := 8;
    TX_DELAY_FORMAT : string := "TIME";
    TX_DELAY_TYPE : string := "FIXED";
    TX_DELAY_VALUE : integer := 0;
    TX_OUTPUT_PHASE_90 : string := "FALSE";
    TX_REFCLK_FREQUENCY : real := 300.0;
    TX_UPDATE_MODE : string := "ASYNC"
  );
  
  port (
    FIFO_EMPTY           : out std_ulogic;
    FIFO_WRCLK_OUT       : out std_ulogic;
    O                    : out std_ulogic;
    Q                    : out std_logic_vector(7 downto 0);
    RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
    RX_CNTVALUEOUT       : out std_logic_vector(8 downto 0);
    TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
    TX_CNTVALUEOUT       : out std_logic_vector(8 downto 0);
    T_OUT                : out std_ulogic;
    D                    : in std_logic_vector(7 downto 0);
    DATAIN               : in std_ulogic;
    FIFO_RD_CLK          : in std_ulogic;
    FIFO_RD_EN           : in std_ulogic;
    RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
    RX_CE                : in std_ulogic;
    RX_CLK               : in std_ulogic;
    RX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
    RX_EN_VTC            : in std_ulogic;
    RX_INC               : in std_ulogic;
    RX_LOAD              : in std_ulogic;
    RX_RST               : in std_ulogic;
    RX_RST_DLY           : in std_ulogic;
    T                    : in std_ulogic;
    TBYTE_IN             : in std_ulogic;
    TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
    TX_CE                : in std_ulogic;
    TX_CLK               : in std_ulogic;
    TX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
    TX_EN_VTC            : in std_ulogic;
    TX_INC               : in std_ulogic;
    TX_LOAD              : in std_ulogic;
    TX_RST               : in std_ulogic;
    TX_RST_DLY           : in std_ulogic
  );
end RXTX_BITSLICE;

architecture RXTX_BITSLICE_V of RXTX_BITSLICE is
  component SIP_RXTX_BITSLICE_K2
    
    port (
        DDR_DIS_DQS          : in std_logic_vector(39 downto 0);
        ENABLE_PRE_EMPHASIS  : in std_logic_vector(39 downto 0);
        FIFO_SYNC_MODE       : in std_logic_vector(39 downto 0);
        INIT                 : in std_logic_vector(0 downto 0);
        LOOPBACK             : in std_logic_vector(39 downto 0);
        NATIVE_ODELAY_BYPASS : in std_logic_vector(39 downto 0);
        RX_DATA_TYPE         : in std_logic_vector(111 downto 0);
        RX_DATA_WIDTH        : in std_logic_vector(31 downto 0);
        RX_DC_ADJ_EN         : in std_logic_vector(0 downto 0);
        RX_DELAY_FORMAT      : in std_logic_vector(39 downto 0);
        RX_DELAY_TYPE        : in std_logic_vector(63 downto 0);
        RX_DELAY_VALUE       : in std_logic_vector(31 downto 0);
        RX_FDLY              : in std_logic_vector(2 downto 0);
        RX_Q4_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_Q5_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_REFCLK_FREQUENCY  : in std_logic_vector(63 downto 0);
        RX_UPDATE_MODE       : in std_logic_vector(47 downto 0);
        SIM_VERSION          : in std_logic_vector(63 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        TXRX_LOOPBACK        : in std_logic_vector(39 downto 0);
        TX_DATA_WIDTH        : in std_logic_vector(31 downto 0);
        TX_DC_ADJ_EN         : in std_logic_vector(0 downto 0);
        TX_DELAY_FORMAT      : in std_logic_vector(39 downto 0);
        TX_DELAY_TYPE        : in std_logic_vector(63 downto 0);
        TX_DELAY_VALUE       : in std_logic_vector(31 downto 0);
        TX_FDLY              : in std_logic_vector(2 downto 0);
        TX_OUTPUT_PHASE_90   : in std_logic_vector(39 downto 0);
        TX_Q_ROUTETHRU       : in std_logic_vector(39 downto 0);
        TX_REFCLK_FREQUENCY  : in std_logic_vector(63 downto 0);
        TX_T_OUT_ROUTETHRU   : in std_logic_vector(39 downto 0);
        TX_UPDATE_MODE       : in std_logic_vector(47 downto 0);
        XIPHY_BITSLICE_MODE  : in std_logic_vector(39 downto 0);
        FIFO_EMPTY           : out std_ulogic;
        FIFO_WRCLK_OUT       : out std_ulogic;
        O                    : out std_ulogic;
        Q                    : out std_logic_vector(7 downto 0);
        RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        RX_CNTVALUEOUT       : out std_logic_vector(8 downto 0);
        TX2RX_CASC_OUT       : out std_ulogic;
        TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        TX_CNTVALUEOUT       : out std_logic_vector(8 downto 0);
        T_OUT                : out std_ulogic;
        SIM_IDELAY_DATAIN0   : out std_ulogic;
        SIM_IDELAY_DATAOUT   : out std_ulogic;
        SIM_ODELAY_DATAIN0   : out std_ulogic;
        SIM_ODELAY_DATAOUT   : out std_ulogic;
        D                    : in std_logic_vector(7 downto 0);
        DATAIN               : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        OFD_CE               : in std_ulogic;
        RX2TX_CASC_RETURN_IN : in std_ulogic;
        RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        RX_CE                : in std_ulogic;
        RX_CLK               : in std_ulogic;
        RX_CLKDIV            : in std_ulogic;
        RX_CLK_C             : in std_ulogic;
        RX_CLK_C_B           : in std_ulogic;
        RX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
        RX_DATAIN1           : in std_ulogic;
        RX_EN_VTC            : in std_ulogic;
        RX_INC               : in std_ulogic;
        RX_LOAD              : in std_ulogic;
        RX_RST               : in std_ulogic;
        RX_RST_DLY           : in std_ulogic;
        T                    : in std_ulogic;
        TBYTE_IN             : in std_ulogic;
        TX2RX_CASC_IN        : in std_ulogic;
        TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        TX_CE                : in std_ulogic;
        TX_CLK               : in std_ulogic;
        TX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
        TX_EN_VTC            : in std_ulogic;
        TX_INC               : in std_ulogic;
        TX_LOAD              : in std_ulogic;
        TX_OCLK              : in std_ulogic;
        TX_OCLKDIV           : in std_ulogic;
        TX_RST               : in std_ulogic;
        TX_RST_DLY           : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;
  component SIP_RXTX_BITSLICE_D1
    
    port (
        DDR_DIS_DQS          : in std_logic_vector(39 downto 0);
        ENABLE_PRE_EMPHASIS  : in std_logic_vector(39 downto 0);
        FIFO_SYNC_MODE       : in std_logic_vector(39 downto 0);
        FIFO_ENABLE          : in std_logic_vector(39 downto 0);
        INIT                 : in std_logic_vector(0 downto 0);
        LOOPBACK             : in std_logic_vector(39 downto 0);
        NATIVE_ODELAY_BYPASS : in std_logic_vector(39 downto 0);
        RX_DATA_TYPE         : in std_logic_vector(111 downto 0);
        RX_DATA_WIDTH        : in std_logic_vector(31 downto 0);
        RX_DC_ADJ_EN         : in std_logic_vector(0 downto 0);
        RX_DELAY_FORMAT      : in std_logic_vector(39 downto 0);
        RX_DELAY_TYPE        : in std_logic_vector(63 downto 0);
        RX_DELAY_VALUE       : in std_logic_vector(31 downto 0);
        RX_FDLY              : in std_logic_vector(2 downto 0);
        RX_Q4_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_Q5_ROUTETHRU      : in std_logic_vector(39 downto 0);
        RX_REFCLK_FREQUENCY  : in std_logic_vector(63 downto 0);
        RX_UPDATE_MODE       : in std_logic_vector(47 downto 0);
        SPARE                : in std_logic_vector(5 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        TXRX_LOOPBACK        : in std_logic_vector(39 downto 0);
        TX_DATA_WIDTH        : in std_logic_vector(31 downto 0);
        TX_DC_ADJ_EN         : in std_logic_vector(0 downto 0);
        TX_DELAY_FORMAT      : in std_logic_vector(39 downto 0);
        TX_DELAY_TYPE        : in std_logic_vector(63 downto 0);
        TX_DELAY_VALUE       : in std_logic_vector(31 downto 0);
        TX_FDLY              : in std_logic_vector(2 downto 0);
        TX_OUTPUT_PHASE_90   : in std_logic_vector(39 downto 0);
        TX_Q_ROUTETHRU       : in std_logic_vector(39 downto 0);
        TX_REFCLK_FREQUENCY  : in std_logic_vector(63 downto 0);
        TX_T_OUT_ROUTETHRU   : in std_logic_vector(39 downto 0);
        TX_UPDATE_MODE       : in std_logic_vector(47 downto 0);
        XIPHY_BITSLICE_MODE  : in std_logic_vector(39 downto 0);
        FIFO_EMPTY           : out std_ulogic;
        FIFO_WRCLK_OUT       : out std_ulogic;
        O                    : out std_ulogic;
        Q                    : out std_logic_vector(7 downto 0);
        RX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        RX_CNTVALUEOUT       : out std_logic_vector(8 downto 0);
        TX2RX_CASC_OUT       : out std_ulogic;
        TX_BIT_CTRL_OUT      : out std_logic_vector(39 downto 0);
        TX_CNTVALUEOUT       : out std_logic_vector(8 downto 0);
        T_OUT                : out std_ulogic;
        SIM_IDELAY_DATAIN0   : out std_ulogic;
        SIM_IDELAY_DATAOUT   : out std_ulogic;
        SIM_ODELAY_DATAIN0   : out std_ulogic;
        SIM_ODELAY_DATAOUT   : out std_ulogic;
        D                    : in std_logic_vector(7 downto 0);
        DATAIN               : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        OFD_CE               : in std_ulogic;
        RX2TX_CASC_RETURN_IN : in std_ulogic;
        RX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        RX_CE                : in std_ulogic;
        RX_CLK               : in std_ulogic;
        RX_CLKDIV            : in std_ulogic;
        RX_CLK_C             : in std_ulogic;
        RX_CLK_C_B           : in std_ulogic;
        RX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
        RX_DATAIN1           : in std_ulogic;
        RX_EN_VTC            : in std_ulogic;
        RX_INC               : in std_ulogic;
        RX_LOAD              : in std_ulogic;
        RX_RST               : in std_ulogic;
        RX_RST_DLY           : in std_ulogic;
        T                    : in std_ulogic;
        TBYTE_IN             : in std_ulogic;
        TX2RX_CASC_IN        : in std_ulogic;
        TX_BIT_CTRL_IN       : in std_logic_vector(39 downto 0);
        TX_CE                : in std_ulogic;
        TX_CLK               : in std_ulogic;
        TX_CNTVALUEIN        : in std_logic_vector(8 downto 0);
        TX_EN_VTC            : in std_ulogic;
        TX_INC               : in std_ulogic;
        TX_LOAD              : in std_ulogic;
        TX_OCLK              : in std_ulogic;
        TX_OCLKDIV           : in std_ulogic;
        TX_RST               : in std_ulogic;
        TX_RST_DLY           : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;

    constant MODULE_NAME : string := "RXTX_BITSLICE";
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
    constant DDR_DIS_DQS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant FIFO_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant SPARE_BIN : std_logic_vector(5 downto 0) := "000000";
    constant ENABLE_PRE_EMPHASIS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ENABLE_PRE_EMPHASIS,40);
    constant FIFO_SYNC_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(FIFO_SYNC_MODE,40);
    constant LOOPBACK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(LOOPBACK,40);
    constant NATIVE_ODELAY_BYPASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(NATIVE_ODELAY_BYPASS,40);
    constant RX_DATA_TYPE_BIN : std_logic_vector(111 downto 0) := conv_string_to_slv(RX_DATA_TYPE,112);
    constant RX_DELAY_FORMAT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_DELAY_FORMAT,40);
    constant RX_DELAY_TYPE_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(RX_DELAY_TYPE,64);
    constant RX_Q4_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant RX_Q5_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant RX_UPDATE_MODE_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(RX_UPDATE_MODE,48);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);
    constant TBYTE_CTL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(TBYTE_CTL,64);
    constant TXRX_LOOPBACK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant TX_DELAY_FORMAT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TX_DELAY_FORMAT,40);
    constant TX_DELAY_TYPE_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(TX_DELAY_TYPE,64);
    constant TX_OUTPUT_PHASE_90_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TX_OUTPUT_PHASE_90,40);
    constant TX_Q_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant TX_T_OUT_ROUTETHRU_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant TX_UPDATE_MODE_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(TX_UPDATE_MODE,48);
    constant XIPHY_BITSLICE_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);

    constant INIT_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(INIT));
    constant RX_DATA_WIDTH_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(RX_DATA_WIDTH,32));
    constant RX_DC_ADJ_EN_BIN : std_logic_vector(0 downto 0) := "0";
    constant RX_DELAY_VALUE_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(RX_DELAY_VALUE,32));
    constant RX_FDLY_BIN : std_logic_vector(2 downto 0) := "010";
    constant RX_REFCLK_FREQUENCY_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(RX_REFCLK_FREQUENCY * 1000.0),64));
    constant SIM_VERSION_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(SIM_VERSION * 1000.0),64));
    constant TX_DATA_WIDTH_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(TX_DATA_WIDTH,32));
    constant TX_DC_ADJ_EN_BIN : std_logic_vector(0 downto 0) := "0";
    constant TX_DELAY_VALUE_BIN : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(TX_DELAY_VALUE,32));
    constant TX_FDLY_BIN : std_logic_vector(2 downto 0) := "010";
    constant TX_REFCLK_FREQUENCY_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(TX_REFCLK_FREQUENCY * 1000.0),64));
    signal IS_RX_CLK_INVERTED_BIN : std_ulogic := TO_X01(IS_RX_CLK_INVERTED);    signal IS_RX_RST_DLY_INVERTED_BIN : std_ulogic := TO_X01(IS_RX_RST_DLY_INVERTED);    signal IS_RX_RST_INVERTED_BIN : std_ulogic := TO_X01(IS_RX_RST_INVERTED);    signal IS_TX_CLK_INVERTED_BIN : std_ulogic := TO_X01(IS_TX_CLK_INVERTED);    signal IS_TX_RST_DLY_INVERTED_BIN : std_ulogic := TO_X01(IS_TX_RST_DLY_INVERTED);    signal IS_TX_RST_INVERTED_BIN : std_ulogic := TO_X01(IS_TX_RST_INVERTED);
  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed

    signal FIFO_EMPTY_out : std_logic;
    signal FIFO_WRCLK_OUT_out : std_logic;
    signal O_out : std_logic;
    signal Q_out : std_logic_vector(7 downto 0);
    signal RX_BIT_CTRL_OUT_out : std_logic_vector(39 downto 0);
    signal RX_CNTVALUEOUT_out : std_logic_vector(8 downto 0);
    signal TX2RX_CASC_OUT_out : std_logic;
    signal TX_BIT_CTRL_OUT_out : std_logic_vector(39 downto 0);
    signal TX_CNTVALUEOUT_out : std_logic_vector(8 downto 0);
    signal T_OUT_out : std_logic;
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal DATAIN_in : std_ulogic;
    signal D_in : std_logic_vector(7 downto 0);
    signal FIFO_RD_CLK_in : std_ulogic;
    signal FIFO_RD_EN_in : std_ulogic;
    signal IFD_CE_in : std_ulogic;
    signal OFD_CE_in : std_ulogic;
    signal RX2TX_CASC_RETURN_IN_in : std_ulogic;
    signal RX_BIT_CTRL_IN_in : std_logic_vector(39 downto 0);
    signal RX_CE_in : std_ulogic;
    signal RX_CLKDIV_in : std_ulogic;
    signal RX_CLK_C_B_in : std_ulogic;
    signal RX_CLK_C_in : std_ulogic;
    signal RX_CLK_in : std_ulogic;
    signal RX_CNTVALUEIN_in : std_logic_vector(8 downto 0);
    signal RX_DATAIN1_in : std_ulogic;
    signal RX_EN_VTC_in : std_ulogic;
    signal RX_INC_in : std_ulogic;
    signal RX_LOAD_in : std_ulogic;
    signal RX_RST_DLY_in : std_ulogic;
    signal RX_RST_in : std_ulogic;
    signal TBYTE_IN_in : std_ulogic;
    signal TX2RX_CASC_IN_in : std_ulogic;
    signal TX_BIT_CTRL_IN_in : std_logic_vector(39 downto 0);
    signal TX_CE_in : std_ulogic;
    signal TX_CLK_in : std_ulogic;
    signal TX_CNTVALUEIN_in : std_logic_vector(8 downto 0);
    signal TX_EN_VTC_in : std_ulogic;
    signal TX_INC_in : std_ulogic;
    signal TX_LOAD_in : std_ulogic;
    signal TX_OCLKDIV_in : std_ulogic;
    signal TX_OCLK_in : std_ulogic;
    signal TX_RST_DLY_in : std_ulogic;
    signal TX_RST_in : std_ulogic;
    signal T_in : std_ulogic;
    signal IDELAY_DATAIN0_out : std_logic;
    signal IDELAY_DATAOUT_out : std_logic;
    signal ODELAY_DATAIN0_out : std_logic;
    signal ODELAY_DATAOUT_out : std_logic;
   
   
    signal warning_flag : std_ulogic := '1';
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    FIFO_EMPTY <= FIFO_EMPTY_out after OUT_DELAY;
    FIFO_WRCLK_OUT <= FIFO_WRCLK_OUT_out after OUT_DELAY;
    O <= O_out after OUT_DELAY;
    Q <= Q_out after OUT_DELAY;
    RX_BIT_CTRL_OUT <= RX_BIT_CTRL_OUT_out after OUT_DELAY;
    RX_CNTVALUEOUT <= "XXXXXXXXX" when (RX_EN_VTC_in = '1') else RX_CNTVALUEOUT_out after OUT_DELAY;
    TX_BIT_CTRL_OUT <= TX_BIT_CTRL_OUT_out after OUT_DELAY;
    TX_CNTVALUEOUT <= "XXXXXXXXX" when (TX_EN_VTC_in = '1') else TX_CNTVALUEOUT_out after OUT_DELAY;
    T_OUT <= T_OUT_out after OUT_DELAY;
    
    DATAIN_in <= DATAIN;
    D_in <= D;
    FIFO_RD_CLK_in <= FIFO_RD_CLK;
    FIFO_RD_EN_in <= FIFO_RD_EN;
    RX_BIT_CTRL_IN_in <= RX_BIT_CTRL_IN;
    RX_CE_in <= RX_CE;
    RX_CLK_in <= RX_CLK xor IS_RX_CLK_INVERTED_BIN;
    RX_CNTVALUEIN_in <= RX_CNTVALUEIN;
    RX_EN_VTC_in <= RX_EN_VTC;
    RX_INC_in <= RX_INC;
    RX_LOAD_in <= RX_LOAD;
    RX_RST_DLY_in <= RX_RST_DLY xor IS_RX_RST_DLY_INVERTED_BIN;
    RX_RST_in <= RX_RST xor IS_RX_RST_INVERTED_BIN;
    TBYTE_IN_in <= TBYTE_IN;
    TX_BIT_CTRL_IN_in <= TX_BIT_CTRL_IN;
    TX_CE_in <= TX_CE;
    TX_CLK_in <= TX_CLK xor IS_TX_CLK_INVERTED_BIN;
    TX_CNTVALUEIN_in <= TX_CNTVALUEIN;
    TX_EN_VTC_in <= TX_EN_VTC;
    TX_INC_in <= TX_INC;
    TX_LOAD_in <= TX_LOAD;
    TX_RST_DLY_in <= TX_RST_DLY xor IS_TX_RST_DLY_INVERTED_BIN;
    TX_RST_in <= TX_RST xor IS_TX_RST_INVERTED_BIN;
    T_in <= T;
    

    RX_CLKDIV_in <= '1'; -- tie off
    RX_CLK_C_B_in <= '1'; -- tie off
    RX_CLK_C_in <= '1'; -- tie off
    TX_OCLKDIV_in <= '1'; -- tie off
    TX_OCLK_in <= '1'; -- tie off

    IFD_CE_in <= '0'; -- tie off
    OFD_CE_in <= '0'; -- tie off
    RX2TX_CASC_RETURN_IN_in <= '1'; -- tie off
    RX_DATAIN1_in <= '0'; -- tie off
    TX2RX_CASC_IN_in <= '1'; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- ENABLE_PRE_EMPHASIS check
      if((xil_attr_test) or
         ((ENABLE_PRE_EMPHASIS /= "FALSE") and 
          (ENABLE_PRE_EMPHASIS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] ENABLE_PRE_EMPHASIS attribute is set to """));
        Write ( Message, string'(ENABLE_PRE_EMPHASIS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-103] FIFO_SYNC_MODE attribute is set to """));
        Write ( Message, string'(FIFO_SYNC_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- LOOPBACK check
      if((xil_attr_test) or
         ((LOOPBACK /= "FALSE") and 
          (LOOPBACK /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] LOOPBACK attribute is set to """));
        Write ( Message, string'(LOOPBACK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DATA_TYPE check
      if((xil_attr_test) or
         ((RX_DATA_TYPE /= "DATA") and 
          (RX_DATA_TYPE /= "CLOCK") and 
          (RX_DATA_TYPE /= "DATA_AND_CLOCK") and 
          (RX_DATA_TYPE /= "SERIAL"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] RX_DATA_TYPE attribute is set to """));
        Write ( Message, string'(RX_DATA_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DATA"", "));
        Write ( Message, string'("""CLOCK"", "));
        Write ( Message, string'("""DATA_AND_CLOCK"" or "));
        Write ( Message, string'("""SERIAL"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DATA_WIDTH check
      if((xil_attr_test) or
         ((RX_DATA_WIDTH /= 8) and 
          (RX_DATA_WIDTH /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-114] RX_DATA_WIDTH attribute is set to "));
        Write ( Message, RX_DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("8 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DELAY_FORMAT check
      if((xil_attr_test) or
         ((RX_DELAY_FORMAT /= "TIME") and 
          (RX_DELAY_FORMAT /= "COUNT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-116] RX_DELAY_FORMAT attribute is set to """));
        Write ( Message, string'(RX_DELAY_FORMAT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TIME"" or "));
        Write ( Message, string'("""COUNT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DELAY_TYPE check
      if((xil_attr_test) or
         ((RX_DELAY_TYPE /= "FIXED") and 
          (RX_DELAY_TYPE /= "VAR_LOAD") and 
          (RX_DELAY_TYPE /= "VARIABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-117] RX_DELAY_TYPE attribute is set to """));
        Write ( Message, string'(RX_DELAY_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FIXED"", "));
        Write ( Message, string'("""VAR_LOAD"" or "));
        Write ( Message, string'("""VARIABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DELAY_VALUE check
        if((xil_attr_test) or
          (SIM_DEVICE = "ULTRASCALE" and  ((RX_DELAY_VALUE < 0) or (RX_DELAY_VALUE > 1250)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-118] RX_DELAY_VALUE attribute is set to "));
          Write ( Message, RX_DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1250. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
          (SIM_DEVICE /= "ULTRASCALE" and  ((RX_DELAY_VALUE < 0) or (RX_DELAY_VALUE > 1100)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-118] RX_DELAY_VALUE attribute is set to "));
          Write ( Message, RX_DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- RX_REFCLK_FREQUENCY check
        if((xil_attr_test) or
           (RX_DELAY_FORMAT /= "COUNT" and SIM_DEVICE /= "ULTRASCALE" and   ((RX_REFCLK_FREQUENCY < 300.0) or (RX_REFCLK_FREQUENCY > 2667.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-122] RX_REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, RX_REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 300.0 to 2667.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
           (RX_DELAY_FORMAT /= "COUNT" and SIM_DEVICE = "ULTRASCALE" and   ((RX_REFCLK_FREQUENCY < 200.0) or (RX_REFCLK_FREQUENCY > 2400.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-122] RX_REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, RX_REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 200.0 to 2400.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- RX_UPDATE_MODE check
      if((xil_attr_test) or
         ((RX_UPDATE_MODE /= "ASYNC") and 
          (RX_UPDATE_MODE /= "MANUAL") and 
          (RX_UPDATE_MODE /= "SYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-123] RX_UPDATE_MODE attribute is set to """));
        Write ( Message, string'(RX_UPDATE_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ASYNC"", "));
        Write ( Message, string'("""MANUAL"" or "));
        Write ( Message, string'("""SYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-124] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-125] SIM_VERSION attribute is set to "));
        Write ( Message, SIM_VERSION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2.0 or "));
        Write ( Message, string'("1.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
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
        Write ( Message, string'("-126] TBYTE_CTL attribute is set to """));
        Write ( Message, string'(TBYTE_CTL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TBYTE_IN"" or "));
        Write ( Message, string'("""T"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_DATA_WIDTH check
      if((xil_attr_test) or
         ((TX_DATA_WIDTH /= 8) and 
          (TX_DATA_WIDTH /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-128] TX_DATA_WIDTH attribute is set to "));
        Write ( Message, TX_DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("8 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_DELAY_FORMAT check
      if((xil_attr_test) or
         ((TX_DELAY_FORMAT /= "TIME") and 
          (TX_DELAY_FORMAT /= "COUNT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-130] TX_DELAY_FORMAT attribute is set to """));
        Write ( Message, string'(TX_DELAY_FORMAT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TIME"" or "));
        Write ( Message, string'("""COUNT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_DELAY_TYPE check
      if((xil_attr_test) or
         ((TX_DELAY_TYPE /= "FIXED") and 
          (TX_DELAY_TYPE /= "VAR_LOAD") and 
          (TX_DELAY_TYPE /= "VARIABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-131] TX_DELAY_TYPE attribute is set to """));
        Write ( Message, string'(TX_DELAY_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FIXED"", "));
        Write ( Message, string'("""VAR_LOAD"" or "));
        Write ( Message, string'("""VARIABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_DELAY_VALUE check
        if((xil_attr_test) or
          (SIM_DEVICE = "ULTRASCALE" and ((TX_DELAY_VALUE < 0) or (TX_DELAY_VALUE > 1250)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-132] TX_DELAY_VALUE attribute is set to "));
          Write ( Message, TX_DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1250. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
          (SIM_DEVICE /= "ULTRASCALE" and ((TX_DELAY_VALUE < 0) or (TX_DELAY_VALUE > 1100)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-132] TX_DELAY_VALUE attribute is set to "));
          Write ( Message, TX_DELAY_VALUE);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- TX_OUTPUT_PHASE_90 check
      if((xil_attr_test) or
         ((TX_OUTPUT_PHASE_90 /= "FALSE") and 
          (TX_OUTPUT_PHASE_90 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-134] TX_OUTPUT_PHASE_90 attribute is set to """));
        Write ( Message, string'(TX_OUTPUT_PHASE_90));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_REFCLK_FREQUENCY check
        if((xil_attr_test) or
          (TX_DELAY_FORMAT /= "COUNT" and SIM_DEVICE /= "ULTRASCALE" and  ((TX_REFCLK_FREQUENCY < 300.0) or (TX_REFCLK_FREQUENCY > 2667.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-136] TX_REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, TX_REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 300.0 to 2667.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
        if((xil_attr_test) or
          (TX_DELAY_FORMAT /= "COUNT" and SIM_DEVICE = "ULTRASCALE" and  ((TX_REFCLK_FREQUENCY < 200.0) or (TX_REFCLK_FREQUENCY > 2400.0)))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-136] TX_REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, TX_REFCLK_FREQUENCY);
          Write ( Message, string'(". Legal values for this attribute are 200.0 to 2400.0. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
	
    -------- TX_UPDATE_MODE check
      if((xil_attr_test) or
         ((TX_UPDATE_MODE /= "ASYNC") and 
          (TX_UPDATE_MODE /= "MANUAL") and 
          (TX_UPDATE_MODE /= "SYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-138] TX_UPDATE_MODE attribute is set to """));
        Write ( Message, string'(TX_UPDATE_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ASYNC"", "));
        Write ( Message, string'("""MANUAL"" or "));
        Write ( Message, string'("""SYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    ---------------RX/TX attribute checks
      if((xil_attr_test) or
         (TX_DELAY_FORMAT /= RX_DELAY_FORMAT))  then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-139] TX_DELAY_FORMAT attribute is set to """));
        Write ( Message, string'(TX_DELAY_FORMAT));
        Write ( Message, string'(""". RX_DELAY_FORMAT is set to """));
        Write ( Message, string'(RX_DELAY_FORMAT));
        Write ( Message, string'(""". [TX/RX]_DELAY_FORMAT attributes must be set to same value."));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
     if((xil_attr_test) or
         ((TX_DELAY_FORMAT = "TIME") and 
         (TX_DELAY_VALUE /= RX_DELAY_VALUE)))  then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-140] TX/RX_DELAY_FORMAT attribute is set to """));
        Write ( Message, string'(TX_DELAY_FORMAT));
        Write ( Message, string'(""". TX_DELAY_VALUE attribute is set to "));
        Write ( Message, TX_DELAY_VALUE);
        Write ( Message, string'(". RX_DELAY_VALUE attribute is set to "));
        Write ( Message, RX_DELAY_VALUE);
        Write ( Message, string'(".[TX/RX]_DELAY_VALUE attributes must be set to same value when [RX/TX]_DELAY_FORMAT is set to TIME."));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
      if((xil_attr_test) or
           (TX_REFCLK_FREQUENCY /= RX_REFCLK_FREQUENCY )) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-141] TX_REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, TX_REFCLK_FREQUENCY);
          Write ( Message, string'(".RX_REFCLK_FREQUENCY attribute is set to "));
          Write ( Message, RX_REFCLK_FREQUENCY);
          Write ( Message, string'(". [TX/RX]_REFCLK_FREQUENCY attributes must be set to same value."));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
      end if;
      if((xil_attr_test) or
           (TX_DATA_WIDTH /= RX_DATA_WIDTH )) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-142] TX_DATA_WIDTH attribute is set to "));
          Write ( Message, TX_DATA_WIDTH);
          Write ( Message, string'(".RX_DATA_WIDTH attribute is set to "));
          Write ( Message, RX_DATA_WIDTH);
          Write ( Message, string'(". [TX/RX]_DATA_WIDTH attributes must be set to same value."));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-122] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RXTX_BITSLICE_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

  prcs_en_vtc: process(RX_EN_VTC_in, TX_EN_VTC_in)
   variable Message : line;
  begin
    if ((RX_EN_VTC_in = '0' or TX_EN_VTC_in = '0') and (RX_DELAY_FORMAT = "TIME" or TX_DELAY_FORMAT = "TIME") and warning_flag = '1') then
      DEALLOCATE (Message);
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-1] BISC Calibration : DELAY_FORMAT set to TIME with RX_EN_VTC/TX_EN_VTC signal set to 0. In hardware, when the RX_EN_VTC/TX_EN_VTC signal is low during the initial calibration process, the BISC will never complete and the DLY_RDY and VTC_RDY status signals from the BITSLICE_CONTROL remain low. Simulation will not reflect this behavior. In simulation, the DLY_RDY and VTC_RDY from the BITSLICE_CONTROL will assert high. You should ensure the RX_EN_VTC/TX_EN_VTC signal is held high during initial BISC self calibration to ensure BISC completes in hardware. See Select IO Userguide UG571 for more information."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RXTX_BITSLICE_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity Warning;
      DEALLOCATE (Message);
      warning_flag <= '0';
    end if;
  end process prcs_en_vtc;

D1_RXTX_inst : if ((SIM_DEVICE = "ULTRASCALE_PLUS") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES2")) generate
    
    RXTX_BITSLICE_INST : SIP_RXTX_BITSLICE_D1
      port map (
        DDR_DIS_DQS          => DDR_DIS_DQS_BIN,
        ENABLE_PRE_EMPHASIS  => ENABLE_PRE_EMPHASIS_BIN,
        FIFO_SYNC_MODE       => FIFO_SYNC_MODE_BIN,
        FIFO_ENABLE          => FIFO_ENABLE_BIN,
        SPARE                => SPARE_BIN,
        INIT                 => INIT_BIN,
        LOOPBACK             => LOOPBACK_BIN,
        NATIVE_ODELAY_BYPASS => NATIVE_ODELAY_BYPASS_BIN,
        RX_DATA_TYPE         => RX_DATA_TYPE_BIN,
        RX_DATA_WIDTH        => RX_DATA_WIDTH_BIN,
        RX_DC_ADJ_EN         => RX_DC_ADJ_EN_BIN,
        RX_DELAY_FORMAT      => RX_DELAY_FORMAT_BIN,
        RX_DELAY_TYPE        => RX_DELAY_TYPE_BIN,
        RX_DELAY_VALUE       => RX_DELAY_VALUE_BIN,
        RX_FDLY              => RX_FDLY_BIN,
        RX_Q4_ROUTETHRU      => RX_Q4_ROUTETHRU_BIN,
        RX_Q5_ROUTETHRU      => RX_Q5_ROUTETHRU_BIN,
        RX_REFCLK_FREQUENCY  => RX_REFCLK_FREQUENCY_BIN,
        RX_UPDATE_MODE       => RX_UPDATE_MODE_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        TXRX_LOOPBACK        => TXRX_LOOPBACK_BIN,
        TX_DATA_WIDTH        => TX_DATA_WIDTH_BIN,
        TX_DC_ADJ_EN         => TX_DC_ADJ_EN_BIN,
        TX_DELAY_FORMAT      => TX_DELAY_FORMAT_BIN,
        TX_DELAY_TYPE        => TX_DELAY_TYPE_BIN,
        TX_DELAY_VALUE       => TX_DELAY_VALUE_BIN,
        TX_FDLY              => TX_FDLY_BIN,
        TX_OUTPUT_PHASE_90   => TX_OUTPUT_PHASE_90_BIN,
        TX_Q_ROUTETHRU       => TX_Q_ROUTETHRU_BIN,
        TX_REFCLK_FREQUENCY  => TX_REFCLK_FREQUENCY_BIN,
        TX_T_OUT_ROUTETHRU   => TX_T_OUT_ROUTETHRU_BIN,
        TX_UPDATE_MODE       => TX_UPDATE_MODE_BIN,
        XIPHY_BITSLICE_MODE  => XIPHY_BITSLICE_MODE_BIN,
        FIFO_EMPTY           => FIFO_EMPTY_out,
        FIFO_WRCLK_OUT       => FIFO_WRCLK_OUT_out,
        O                    => O_out,
        Q                    => Q_out,
        RX_BIT_CTRL_OUT      => RX_BIT_CTRL_OUT_out,
        RX_CNTVALUEOUT       => RX_CNTVALUEOUT_out,
        TX2RX_CASC_OUT       => TX2RX_CASC_OUT_out,
        TX_BIT_CTRL_OUT      => TX_BIT_CTRL_OUT_out,
        TX_CNTVALUEOUT       => TX_CNTVALUEOUT_out,
        T_OUT                => T_OUT_out,
        D                    => D_in,
        DATAIN               => DATAIN_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        OFD_CE               => OFD_CE_in,
        RX2TX_CASC_RETURN_IN => RX2TX_CASC_RETURN_IN_in,
        RX_BIT_CTRL_IN       => RX_BIT_CTRL_IN_in,
        RX_CE                => RX_CE_in,
        RX_CLK               => RX_CLK_in,
        RX_CLKDIV            => RX_CLKDIV_in,
        RX_CLK_C             => RX_CLK_C_in,
        RX_CLK_C_B           => RX_CLK_C_B_in,
        RX_CNTVALUEIN        => RX_CNTVALUEIN_in,
        RX_DATAIN1           => RX_DATAIN1_in,
        RX_EN_VTC            => RX_EN_VTC_in,
        RX_INC               => RX_INC_in,
        RX_LOAD              => RX_LOAD_in,
        RX_RST               => RX_RST_in,
        RX_RST_DLY           => RX_RST_DLY_in,
        T                    => T_in,
        TBYTE_IN             => TBYTE_IN_in,
        TX2RX_CASC_IN        => TX2RX_CASC_IN_in,
        TX_BIT_CTRL_IN       => TX_BIT_CTRL_IN_in,
        TX_CE                => TX_CE_in,
        TX_CLK               => TX_CLK_in,
        TX_CNTVALUEIN        => TX_CNTVALUEIN_in,
        TX_EN_VTC            => TX_EN_VTC_in,
        TX_INC               => TX_INC_in,
        TX_LOAD              => TX_LOAD_in,
        TX_OCLK              => TX_OCLK_in,
        TX_OCLKDIV           => TX_OCLKDIV_in,
        TX_RST               => TX_RST_in,
        TX_RST_DLY           => TX_RST_DLY_in,
	SIM_IDELAY_DATAIN0   => IDELAY_DATAIN0_out,
        SIM_IDELAY_DATAOUT   => IDELAY_DATAOUT_out,
        SIM_ODELAY_DATAIN0   => ODELAY_DATAIN0_out,
        SIM_ODELAY_DATAOUT   => ODELAY_DATAOUT_out,
        GSR                  => glblGSR        
      );
  end generate D1_RXTX_inst;
    K2_RXTX_inst : if (SIM_DEVICE = "ULTRASCALE") generate
    RXTX_BITSLICE_INST : SIP_RXTX_BITSLICE_K2
      port map (
        DDR_DIS_DQS          => DDR_DIS_DQS_BIN,
        ENABLE_PRE_EMPHASIS  => ENABLE_PRE_EMPHASIS_BIN,
        FIFO_SYNC_MODE       => FIFO_SYNC_MODE_BIN,
        INIT                 => INIT_BIN,
        LOOPBACK             => LOOPBACK_BIN,
        NATIVE_ODELAY_BYPASS => NATIVE_ODELAY_BYPASS_BIN,
        RX_DATA_TYPE         => RX_DATA_TYPE_BIN,
        RX_DATA_WIDTH        => RX_DATA_WIDTH_BIN,
        RX_DC_ADJ_EN         => RX_DC_ADJ_EN_BIN,
        RX_DELAY_FORMAT      => RX_DELAY_FORMAT_BIN,
        RX_DELAY_TYPE        => RX_DELAY_TYPE_BIN,
        RX_DELAY_VALUE       => RX_DELAY_VALUE_BIN,
        RX_FDLY              => RX_FDLY_BIN,
        RX_Q4_ROUTETHRU      => RX_Q4_ROUTETHRU_BIN,
        RX_Q5_ROUTETHRU      => RX_Q5_ROUTETHRU_BIN,
        RX_REFCLK_FREQUENCY  => RX_REFCLK_FREQUENCY_BIN,
        RX_UPDATE_MODE       => RX_UPDATE_MODE_BIN,
        SIM_VERSION          => SIM_VERSION_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        TXRX_LOOPBACK        => TXRX_LOOPBACK_BIN,
        TX_DATA_WIDTH        => TX_DATA_WIDTH_BIN,
        TX_DC_ADJ_EN         => TX_DC_ADJ_EN_BIN,
        TX_DELAY_FORMAT      => TX_DELAY_FORMAT_BIN,
        TX_DELAY_TYPE        => TX_DELAY_TYPE_BIN,
        TX_DELAY_VALUE       => TX_DELAY_VALUE_BIN,
        TX_FDLY              => TX_FDLY_BIN,
        TX_OUTPUT_PHASE_90   => TX_OUTPUT_PHASE_90_BIN,
        TX_Q_ROUTETHRU       => TX_Q_ROUTETHRU_BIN,
        TX_REFCLK_FREQUENCY  => TX_REFCLK_FREQUENCY_BIN,
        TX_T_OUT_ROUTETHRU   => TX_T_OUT_ROUTETHRU_BIN,
        TX_UPDATE_MODE       => TX_UPDATE_MODE_BIN,
        XIPHY_BITSLICE_MODE  => XIPHY_BITSLICE_MODE_BIN,
        FIFO_EMPTY           => FIFO_EMPTY_out,
        FIFO_WRCLK_OUT       => FIFO_WRCLK_OUT_out,
        O                    => O_out,
        Q                    => Q_out,
        RX_BIT_CTRL_OUT      => RX_BIT_CTRL_OUT_out,
        RX_CNTVALUEOUT       => RX_CNTVALUEOUT_out,
        TX2RX_CASC_OUT       => TX2RX_CASC_OUT_out,
        TX_BIT_CTRL_OUT      => TX_BIT_CTRL_OUT_out,
        TX_CNTVALUEOUT       => TX_CNTVALUEOUT_out,
        T_OUT                => T_OUT_out,
        D                    => D_in,
        DATAIN               => DATAIN_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        OFD_CE               => OFD_CE_in,
        RX2TX_CASC_RETURN_IN => RX2TX_CASC_RETURN_IN_in,
        RX_BIT_CTRL_IN       => RX_BIT_CTRL_IN_in,
        RX_CE                => RX_CE_in,
        RX_CLK               => RX_CLK_in,
        RX_CLKDIV            => RX_CLKDIV_in,
        RX_CLK_C             => RX_CLK_C_in,
        RX_CLK_C_B           => RX_CLK_C_B_in,
        RX_CNTVALUEIN        => RX_CNTVALUEIN_in,
        RX_DATAIN1           => RX_DATAIN1_in,
        RX_EN_VTC            => RX_EN_VTC_in,
        RX_INC               => RX_INC_in,
        RX_LOAD              => RX_LOAD_in,
        RX_RST               => RX_RST_in,
        RX_RST_DLY           => RX_RST_DLY_in,
        T                    => T_in,
        TBYTE_IN             => TBYTE_IN_in,
        TX2RX_CASC_IN        => TX2RX_CASC_IN_in,
        TX_BIT_CTRL_IN       => TX_BIT_CTRL_IN_in,
        TX_CE                => TX_CE_in,
        TX_CLK               => TX_CLK_in,
        TX_CNTVALUEIN        => TX_CNTVALUEIN_in,
        TX_EN_VTC            => TX_EN_VTC_in,
        TX_INC               => TX_INC_in,
        TX_LOAD              => TX_LOAD_in,
        TX_OCLK              => TX_OCLK_in,
        TX_OCLKDIV           => TX_OCLKDIV_in,
        TX_RST               => TX_RST_in,
        TX_RST_DLY           => TX_RST_DLY_in,
        SIM_IDELAY_DATAIN0   => IDELAY_DATAIN0_out,
        SIM_IDELAY_DATAOUT   => IDELAY_DATAOUT_out,
        SIM_ODELAY_DATAIN0   => ODELAY_DATAIN0_out,
        SIM_ODELAY_DATAOUT   => ODELAY_DATAOUT_out,
        GSR                  => glblGSR        
      );
   end generate K2_RXTX_inst;
  end RXTX_BITSLICE_V;
