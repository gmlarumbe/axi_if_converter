-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        BITSLICE_CONTROL
-- /___/   /\      Filename    : BITSLICE_CONTROL.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL BITSLICE_CONTROL -----

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

entity BITSLICE_CONTROL is
  generic (
    CTRL_CLK : string := "EXTERNAL";
    DIV_MODE : string := "DIV2";
    EN_CLK_TO_EXT_NORTH : string := "DISABLE";
    EN_CLK_TO_EXT_SOUTH : string := "DISABLE";
    EN_DYN_ODLY_MODE : string := "FALSE";
    EN_OTHER_NCLK : string := "FALSE";
    EN_OTHER_PCLK : string := "FALSE";
    IDLY_VT_TRACK : string := "TRUE";
    INV_RXCLK : string := "FALSE";
    ODLY_VT_TRACK : string := "TRUE";
    QDLY_VT_TRACK : string := "TRUE";
    READ_IDLE_COUNT : std_logic_vector(5 downto 0) := "00" & X"0";
    REFCLK_SRC : string := "PLLCLK";
    ROUNDING_FACTOR : integer := 16;
    RXGATE_EXTEND : string := "FALSE";
    RX_CLK_PHASE_N : string := "SHIFT_0";
    RX_CLK_PHASE_P : string := "SHIFT_0";
    RX_GATING : string := "DISABLE";
    SELF_CALIBRATE : string := "ENABLE";
    SERIAL_MODE : string := "FALSE";
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_SPEEDUP : string := "FAST";
    SIM_VERSION : real := 2.0;
    TX_GATING : string := "DISABLE"
  );
  
  port (
    CLK_TO_EXT_NORTH     : out std_ulogic;
    CLK_TO_EXT_SOUTH     : out std_ulogic;
    DLY_RDY              : out std_ulogic;
    DYN_DCI              : out std_logic_vector(6 downto 0);
    NCLK_NIBBLE_OUT      : out std_ulogic;
    PCLK_NIBBLE_OUT      : out std_ulogic;
    RIU_RD_DATA          : out std_logic_vector(15 downto 0);
    RIU_VALID            : out std_ulogic;
    RX_BIT_CTRL_OUT0     : out std_logic_vector(39 downto 0);
    RX_BIT_CTRL_OUT1     : out std_logic_vector(39 downto 0);
    RX_BIT_CTRL_OUT2     : out std_logic_vector(39 downto 0);
    RX_BIT_CTRL_OUT3     : out std_logic_vector(39 downto 0);
    RX_BIT_CTRL_OUT4     : out std_logic_vector(39 downto 0);
    RX_BIT_CTRL_OUT5     : out std_logic_vector(39 downto 0);
    RX_BIT_CTRL_OUT6     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT0     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT1     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT2     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT3     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT4     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT5     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT6     : out std_logic_vector(39 downto 0);
    TX_BIT_CTRL_OUT_TRI  : out std_logic_vector(39 downto 0);
    VTC_RDY              : out std_ulogic;
    CLK_FROM_EXT         : in std_ulogic;
    EN_VTC               : in std_ulogic;
    NCLK_NIBBLE_IN       : in std_ulogic;
    PCLK_NIBBLE_IN       : in std_ulogic;
    PHY_RDCS0            : in std_logic_vector(3 downto 0);
    PHY_RDCS1            : in std_logic_vector(3 downto 0);
    PHY_RDEN             : in std_logic_vector(3 downto 0);
    PHY_WRCS0            : in std_logic_vector(3 downto 0);
    PHY_WRCS1            : in std_logic_vector(3 downto 0);
    PLL_CLK              : in std_ulogic;
    REFCLK               : in std_ulogic;
    RIU_ADDR             : in std_logic_vector(5 downto 0);
    RIU_CLK              : in std_ulogic;
    RIU_NIBBLE_SEL       : in std_ulogic;
    RIU_WR_DATA          : in std_logic_vector(15 downto 0);
    RIU_WR_EN            : in std_ulogic;
    RST                  : in std_ulogic;
    RX_BIT_CTRL_IN0      : in std_logic_vector(39 downto 0);
    RX_BIT_CTRL_IN1      : in std_logic_vector(39 downto 0);
    RX_BIT_CTRL_IN2      : in std_logic_vector(39 downto 0);
    RX_BIT_CTRL_IN3      : in std_logic_vector(39 downto 0);
    RX_BIT_CTRL_IN4      : in std_logic_vector(39 downto 0);
    RX_BIT_CTRL_IN5      : in std_logic_vector(39 downto 0);
    RX_BIT_CTRL_IN6      : in std_logic_vector(39 downto 0);
    TBYTE_IN             : in std_logic_vector(3 downto 0);
    TX_BIT_CTRL_IN0      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN1      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN2      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN3      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN4      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN5      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN6      : in std_logic_vector(39 downto 0);
    TX_BIT_CTRL_IN_TRI   : in std_logic_vector(39 downto 0)
  );
end BITSLICE_CONTROL;

architecture BITSLICE_CONTROL_V of BITSLICE_CONTROL is
  component SIP_BITSLICE_CONTROL_K2
    
    port (
        CONTROL_DLY_TEST_EN  : in std_logic_vector(55 downto 0);
        CTRL_CLK             : in std_logic_vector(63 downto 0);
        DC_ADJ_EN            : in std_logic_vector(39 downto 0);
        DIV_MODE             : in std_logic_vector(31 downto 0);
        DLY_RNK0             : in std_logic_vector(12 downto 0);
        DLY_RNK1             : in std_logic_vector(12 downto 0);
        DLY_RNK2             : in std_logic_vector(12 downto 0);
        DLY_RNK3             : in std_logic_vector(12 downto 0);
        EN_CLK_TO_EXT_NORTH  : in std_logic_vector(55 downto 0);
        EN_CLK_TO_EXT_SOUTH  : in std_logic_vector(55 downto 0);
        EN_DYN_ODLY_MODE     : in std_logic_vector(39 downto 0);
        EN_OTHER_NCLK        : in std_logic_vector(39 downto 0);
        EN_OTHER_PCLK        : in std_logic_vector(39 downto 0);
        FDLY                 : in std_logic_vector(2 downto 0);
        IDLY_VT_TRACK        : in std_logic_vector(39 downto 0);
        INCDEC_CRSE          : in std_logic_vector(7 downto 0);
        INV_RXCLK            : in std_logic_vector(39 downto 0);
        MON                  : in std_logic_vector(9 downto 0);
        NQTR                 : in std_logic_vector(8 downto 0);
        ODLY_VT_TRACK        : in std_logic_vector(39 downto 0);
        PQTR                 : in std_logic_vector(8 downto 0);
        QDLY_VT_TRACK        : in std_logic_vector(39 downto 0);
        READ_IDLE_COUNT      : in std_logic_vector(5 downto 0);
        REFCLK_SRC           : in std_logic_vector(47 downto 0);
        ROUNDING_FACTOR      : in std_logic_vector(7 downto 0);
        RXGATE_EXTEND        : in std_logic_vector(39 downto 0);
        RX_CLK_PHASE_N       : in std_logic_vector(63 downto 0);
        RX_CLK_PHASE_P       : in std_logic_vector(63 downto 0);
        RX_GATING            : in std_logic_vector(55 downto 0);
        SELF_CALIBRATE       : in std_logic_vector(55 downto 0);
        SERIAL_MODE          : in std_logic_vector(39 downto 0);
        SIM_SPEEDUP          : in std_logic_vector(31 downto 0);
        SIM_VERSION          : in std_logic_vector(63 downto 0);
        TX_GATING            : in std_logic_vector(55 downto 0);
        CLK_TO_EXT_NORTH     : out std_ulogic;
        CLK_TO_EXT_SOUTH     : out std_ulogic;
        DLY_RDY              : out std_ulogic;
        DLY_TEST_OUT         : out std_ulogic;
        DYN_DCI              : out std_logic_vector(6 downto 0);
        LOCAL_DIV_CLK        : out std_ulogic;
        MASTER_PD_OUT        : out std_ulogic;
        NCLK_NIBBLE_OUT      : out std_ulogic;
        PCLK_NIBBLE_OUT      : out std_ulogic;
        PLL_CLK_EN           : out std_ulogic;
        REFCLK_DFD           : out std_ulogic;
        RIU_RD_DATA          : out std_logic_vector(15 downto 0);
        RIU_VALID            : out std_ulogic;
        RX_BIT_CTRL_OUT0     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT1     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT2     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT3     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT4     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT5     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT6     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT0     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT1     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT2     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT3     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT4     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT5     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT6     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT_TRI  : out std_logic_vector(39 downto 0);
        VTC_RDY              : out std_ulogic;
        CLK_FROM_EXT         : in std_ulogic;
        CLK_STOP             : in std_ulogic;
        DLY_TEST_IN          : in std_ulogic;
        EN_VTC               : in std_ulogic;
        NCLK_NIBBLE_IN       : in std_ulogic;
        PCLK_NIBBLE_IN       : in std_ulogic;
        PHY_RDCS0            : in std_logic_vector(3 downto 0);
        PHY_RDCS1            : in std_logic_vector(3 downto 0);
        PHY_RDEN             : in std_logic_vector(3 downto 0);
        PHY_WRCS0            : in std_logic_vector(3 downto 0);
        PHY_WRCS1            : in std_logic_vector(3 downto 0);
        PLL_CLK              : in std_ulogic;
        REFCLK               : in std_ulogic;
        RIU_ADDR             : in std_logic_vector(5 downto 0);
        RIU_CLK              : in std_ulogic;
        RIU_NIBBLE_SEL       : in std_ulogic;
        RIU_WR_DATA          : in std_logic_vector(15 downto 0);
        RIU_WR_EN            : in std_ulogic;
        RST                  : in std_ulogic;
        RX_BIT_CTRL_IN0      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN1      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN2      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN3      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN4      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN5      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN6      : in std_logic_vector(39 downto 0);
        SCAN_INT             : in std_ulogic;
        TBYTE_IN             : in std_logic_vector(3 downto 0);
        TX_BIT_CTRL_IN0      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN1      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN2      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN3      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN4      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN5      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN6      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN_TRI   : in std_logic_vector(39 downto 0);
        GSR                  : in std_ulogic
      );
    end component;
  component SIP_BITSLICE_CONTROL_D1
    
    port (
        BISC_MULTI_FREQ_EN   : in std_logic_vector(39 downto 0);
        CONTROL_DLY_TEST_EN  : in std_logic_vector(55 downto 0);
        CTRL_CLK             : in std_logic_vector(63 downto 0);
        DC_ADJ_EN            : in std_logic_vector(39 downto 0);
        DIV_MODE             : in std_logic_vector(31 downto 0);
        DLY_RNK0             : in std_logic_vector(12 downto 0);
        DLY_RNK1             : in std_logic_vector(12 downto 0);
        DLY_RNK2             : in std_logic_vector(12 downto 0);
        DLY_RNK3             : in std_logic_vector(12 downto 0);
        EN_CLK_TO_EXT_NORTH  : in std_logic_vector(55 downto 0);
        EN_CLK_TO_EXT_SOUTH  : in std_logic_vector(55 downto 0);
        EN_DYN_ODLY_MODE     : in std_logic_vector(39 downto 0);
        EN_OTHER_NCLK        : in std_logic_vector(39 downto 0);
        EN_OTHER_PCLK        : in std_logic_vector(39 downto 0);
        FDLY                 : in std_logic_vector(2 downto 0);
        IDLY_VT_TRACK        : in std_logic_vector(39 downto 0);
        INCDEC_CRSE          : in std_logic_vector(7 downto 0);
        INV_RXCLK            : in std_logic_vector(39 downto 0);
        MASK_FIXDLY          : in std_logic_vector(39 downto 0);
        MON                  : in std_logic_vector(9 downto 0);
        NQTR                 : in std_logic_vector(8 downto 0);
        ODLY_VT_TRACK        : in std_logic_vector(39 downto 0);
        PQTR                 : in std_logic_vector(8 downto 0);
        QDLY_VT_TRACK        : in std_logic_vector(39 downto 0);
        READ_IDLE_COUNT      : in std_logic_vector(5 downto 0);
        REFCLK_SRC           : in std_logic_vector(47 downto 0);
        RIU_RL_ARBITRATION_FIX_EN : in std_logic_vector(39 downto 0);
        ROUNDING_FACTOR      : in std_logic_vector(7 downto 0);
        RXGATE_EXTEND        : in std_logic_vector(39 downto 0);
        RX_CLK_PHASE_N       : in std_logic_vector(63 downto 0);
        RX_CLK_PHASE_P       : in std_logic_vector(63 downto 0);
        RX_GATING            : in std_logic_vector(55 downto 0);
        SELF_CALIBRATE       : in std_logic_vector(55 downto 0);
        SERIAL_MODE          : in std_logic_vector(39 downto 0);
        SIM_SPEEDUP          : in std_logic_vector(31 downto 0);
        SPARE                : in std_logic_vector(1 downto 0);
        TX_GATING            : in std_logic_vector(55 downto 0);
        CLK_TO_EXT_NORTH     : out std_ulogic;
        CLK_TO_EXT_SOUTH     : out std_ulogic;
        DLY_RDY              : out std_ulogic;
        DLY_TEST_OUT         : out std_ulogic;
        DYN_DCI              : out std_logic_vector(6 downto 0);
        LOCAL_DIV_CLK        : out std_ulogic;
        MASTER_PD_OUT        : out std_ulogic;
        NCLK_NIBBLE_OUT      : out std_ulogic;
        PCLK_NIBBLE_OUT      : out std_ulogic;
        PLL_CLK_EN           : out std_ulogic;
        REFCLK_DFD           : out std_ulogic;
        RIU_RD_DATA          : out std_logic_vector(15 downto 0);
        RIU_VALID            : out std_ulogic;
        RX_BIT_CTRL_OUT0     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT1     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT2     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT3     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT4     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT5     : out std_logic_vector(39 downto 0);
        RX_BIT_CTRL_OUT6     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT0     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT1     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT2     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT3     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT4     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT5     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT6     : out std_logic_vector(39 downto 0);
        TX_BIT_CTRL_OUT_TRI  : out std_logic_vector(39 downto 0);
        VTC_RDY              : out std_ulogic;
        CLK_FROM_EXT         : in std_ulogic;
        CLK_STOP             : in std_ulogic;
        DLY_TEST_IN          : in std_ulogic;
        EN_VTC               : in std_ulogic;
        NCLK_NIBBLE_IN       : in std_ulogic;
        PCLK_NIBBLE_IN       : in std_ulogic;
        PHY_RDCS0            : in std_logic_vector(3 downto 0);
        PHY_RDCS1            : in std_logic_vector(3 downto 0);
        PHY_RDEN             : in std_logic_vector(3 downto 0);
        PHY_WRCS0            : in std_logic_vector(3 downto 0);
        PHY_WRCS1            : in std_logic_vector(3 downto 0);
        PLL_CLK              : in std_ulogic;
        REFCLK               : in std_ulogic;
        RIU_ADDR             : in std_logic_vector(5 downto 0);
        RIU_CLK              : in std_ulogic;
        RIU_NIBBLE_SEL       : in std_ulogic;
        RIU_WR_DATA          : in std_logic_vector(15 downto 0);
        RIU_WR_EN            : in std_ulogic;
        RST                  : in std_ulogic;
        RX_BIT_CTRL_IN0      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN1      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN2      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN3      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN4      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN5      : in std_logic_vector(39 downto 0);
        RX_BIT_CTRL_IN6      : in std_logic_vector(39 downto 0);
        SCAN_INT             : in std_ulogic;
        TBYTE_IN             : in std_logic_vector(3 downto 0);
        TX_BIT_CTRL_IN0      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN1      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN2      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN3      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN4      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN5      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN6      : in std_logic_vector(39 downto 0);
        TX_BIT_CTRL_IN_TRI   : in std_logic_vector(39 downto 0);
        GSR                  : in std_ulogic
      );
    end component;

    constant MODULE_NAME : string := "BITSLICE_CONTROL";
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
    constant BISC_MULTI_FREQ_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant CONTROL_DLY_TEST_EN_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv("DISABLE",56);
    constant CTRL_CLK_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(CTRL_CLK,64);
    constant DC_ADJ_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant DIV_MODE_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(DIV_MODE,32);
    constant EN_CLK_TO_EXT_NORTH_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv(EN_CLK_TO_EXT_NORTH,56);
    constant EN_CLK_TO_EXT_SOUTH_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv(EN_CLK_TO_EXT_SOUTH,56);
    constant EN_DYN_ODLY_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(EN_DYN_ODLY_MODE,40);
    constant EN_OTHER_NCLK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(EN_OTHER_NCLK,40);
    constant EN_OTHER_PCLK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(EN_OTHER_PCLK,40);
    constant IDLY_VT_TRACK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(IDLY_VT_TRACK,40);
    constant INV_RXCLK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(INV_RXCLK,40);
    constant MASK_FIXDLY_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant ODLY_VT_TRACK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ODLY_VT_TRACK,40);
    constant QDLY_VT_TRACK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(QDLY_VT_TRACK,40);
    constant REFCLK_SRC_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(REFCLK_SRC,48);
    constant RIU_RL_ARBITRATION_FIX_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant RXGATE_EXTEND_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXGATE_EXTEND,40);
    constant RX_CLK_PHASE_N_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(RX_CLK_PHASE_N,64);
    constant RX_CLK_PHASE_P_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(RX_CLK_PHASE_P,64);
    constant RX_GATING_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv(RX_GATING,56);
    constant SELF_CALIBRATE_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv(SELF_CALIBRATE,56);
    constant SERIAL_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SERIAL_MODE,40);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);
    constant SIM_SPEEDUP_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(SIM_SPEEDUP,32);
    constant TX_GATING_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv(TX_GATING,56);

    constant DLY_RNK0_BIN : std_logic_vector(12 downto 0) := "0" & X"000";
    constant DLY_RNK1_BIN : std_logic_vector(12 downto 0) := "0" & X"000";
    constant DLY_RNK2_BIN : std_logic_vector(12 downto 0) := "0" & X"000";
    constant DLY_RNK3_BIN : std_logic_vector(12 downto 0) := "0" & X"000";
    constant FDLY_BIN : std_logic_vector(2 downto 0) := "010";
    constant INCDEC_CRSE_BIN : std_logic_vector(7 downto 0) := X"08";
    constant MON_BIN : std_logic_vector(9 downto 0) := "00" & X"00";
    constant NQTR_BIN : std_logic_vector(8 downto 0) := "0" & X"00";
    constant PQTR_BIN : std_logic_vector(8 downto 0) := "0" & X"00";
    constant READ_IDLE_COUNT_BIN : std_logic_vector(5 downto 0) := READ_IDLE_COUNT;
    constant ROUNDING_FACTOR_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(ROUNDING_FACTOR,8));
    constant SIM_VERSION_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(SIM_VERSION * 1000.0),64));
    constant SPARE_BIN : std_logic_vector(1 downto 0) := "00";

  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed

    signal CLK_TO_EXT_NORTH_out : std_logic;
    signal CLK_TO_EXT_SOUTH_out : std_logic;
    signal DLY_RDY_out : std_logic;
    signal DLY_TEST_OUT_out : std_logic;
    signal DYN_DCI_out : std_logic_vector(6 downto 0);
    signal LOCAL_DIV_CLK_out : std_logic;
    signal MASTER_PD_OUT_out : std_logic;
    signal NCLK_NIBBLE_OUT_out : std_logic;
    signal PCLK_NIBBLE_OUT_out : std_logic;
    signal PLL_CLK_EN_out : std_logic;
    signal REFCLK_DFD_out : std_logic;
    signal RIU_RD_DATA_out : std_logic_vector(15 downto 0);
    signal RIU_VALID_out : std_logic;
    signal RX_BIT_CTRL_OUT0_out : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_OUT1_out : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_OUT2_out : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_OUT3_out : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_OUT4_out : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_OUT5_out : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_OUT6_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT0_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT1_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT2_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT3_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT4_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT5_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT6_out : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_OUT_TRI_out : std_logic_vector(39 downto 0);
    signal VTC_RDY_out : std_logic;
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CLK_FROM_EXT_in : std_ulogic;
    signal CLK_STOP_in : std_ulogic;
    signal DLY_TEST_IN_in : std_ulogic;
    signal EN_VTC_in : std_ulogic;
    signal NCLK_NIBBLE_IN_in : std_ulogic;
    signal PCLK_NIBBLE_IN_in : std_ulogic;
    signal PHY_RDCS0_in : std_logic_vector(3 downto 0);
    signal PHY_RDCS1_in : std_logic_vector(3 downto 0);
    signal PHY_RDEN_in : std_logic_vector(3 downto 0);
    signal PHY_WRCS0_in : std_logic_vector(3 downto 0);
    signal PHY_WRCS1_in : std_logic_vector(3 downto 0);
    signal PLL_CLK_in : std_ulogic;
    signal REFCLK_in : std_ulogic;
    signal RIU_ADDR_in : std_logic_vector(5 downto 0);
    signal RIU_CLK_in : std_ulogic;
    signal RIU_NIBBLE_SEL_in : std_ulogic;
    signal RIU_WR_DATA_in : std_logic_vector(15 downto 0);
    signal RIU_WR_EN_in : std_ulogic;
    signal RST_in : std_ulogic;
    signal RX_BIT_CTRL_IN0_in : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_IN1_in : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_IN2_in : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_IN3_in : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_IN4_in : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_IN5_in : std_logic_vector(39 downto 0);
    signal RX_BIT_CTRL_IN6_in : std_logic_vector(39 downto 0);
    signal SCAN_INT_in : std_ulogic;
    signal TBYTE_IN_in : std_logic_vector(3 downto 0);
    signal TX_BIT_CTRL_IN0_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN1_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN2_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN3_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN4_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN5_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN6_in : std_logic_vector(39 downto 0);
    signal TX_BIT_CTRL_IN_TRI_in : std_logic_vector(39 downto 0);
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    CLK_TO_EXT_NORTH <= CLK_TO_EXT_NORTH_out after OUT_DELAY;
    CLK_TO_EXT_SOUTH <= CLK_TO_EXT_SOUTH_out after OUT_DELAY;
    DLY_RDY <= DLY_RDY_out after OUT_DELAY;
    DYN_DCI <= DYN_DCI_out after OUT_DELAY;
    NCLK_NIBBLE_OUT <= NCLK_NIBBLE_OUT_out after OUT_DELAY;
    PCLK_NIBBLE_OUT <= PCLK_NIBBLE_OUT_out after OUT_DELAY;
    RIU_RD_DATA <= RIU_RD_DATA_out after OUT_DELAY;
    RIU_VALID <= RIU_VALID_out after OUT_DELAY;
    RX_BIT_CTRL_OUT0 <= RX_BIT_CTRL_OUT0_out after OUT_DELAY;
    RX_BIT_CTRL_OUT1 <= RX_BIT_CTRL_OUT1_out after OUT_DELAY;
    RX_BIT_CTRL_OUT2 <= RX_BIT_CTRL_OUT2_out after OUT_DELAY;
    RX_BIT_CTRL_OUT3 <= RX_BIT_CTRL_OUT3_out after OUT_DELAY;
    RX_BIT_CTRL_OUT4 <= RX_BIT_CTRL_OUT4_out after OUT_DELAY;
    RX_BIT_CTRL_OUT5 <= RX_BIT_CTRL_OUT5_out after OUT_DELAY;
    RX_BIT_CTRL_OUT6 <= RX_BIT_CTRL_OUT6_out after OUT_DELAY;
    TX_BIT_CTRL_OUT0 <= TX_BIT_CTRL_OUT0_out after OUT_DELAY;
    TX_BIT_CTRL_OUT1 <= TX_BIT_CTRL_OUT1_out after OUT_DELAY;
    TX_BIT_CTRL_OUT2 <= TX_BIT_CTRL_OUT2_out after OUT_DELAY;
    TX_BIT_CTRL_OUT3 <= TX_BIT_CTRL_OUT3_out after OUT_DELAY;
    TX_BIT_CTRL_OUT4 <= TX_BIT_CTRL_OUT4_out after OUT_DELAY;
    TX_BIT_CTRL_OUT5 <= TX_BIT_CTRL_OUT5_out after OUT_DELAY;
    TX_BIT_CTRL_OUT6 <= TX_BIT_CTRL_OUT6_out after OUT_DELAY;
    TX_BIT_CTRL_OUT_TRI <= TX_BIT_CTRL_OUT_TRI_out after OUT_DELAY;
    VTC_RDY <= VTC_RDY_out after OUT_DELAY;
    
    CLK_FROM_EXT_in <= CLK_FROM_EXT;
    EN_VTC_in <= '1' when (EN_VTC = 'U') else EN_VTC; -- rv 1
    NCLK_NIBBLE_IN_in <= NCLK_NIBBLE_IN;
    PCLK_NIBBLE_IN_in <= PCLK_NIBBLE_IN;
    PHY_RDCS0_in <= PHY_RDCS0;
    PHY_RDCS1_in <= PHY_RDCS1;
    PHY_RDEN_in <= PHY_RDEN;
    PHY_WRCS0_in <= PHY_WRCS0;
    PHY_WRCS1_in <= PHY_WRCS1;
    PLL_CLK_in <= PLL_CLK;
    REFCLK_in <= REFCLK;
    RIU_ADDR_in <= RIU_ADDR;
    RIU_CLK_in <= RIU_CLK;
    RIU_NIBBLE_SEL_in <= '0' when (RIU_NIBBLE_SEL = 'U') else RIU_NIBBLE_SEL; -- rv 0
    RIU_WR_DATA_in <= RIU_WR_DATA;
    RIU_WR_EN_in <= RIU_WR_EN;
    RST_in <= RST;
    RX_BIT_CTRL_IN0_in <= RX_BIT_CTRL_IN0;
    RX_BIT_CTRL_IN1_in <= RX_BIT_CTRL_IN1;
    RX_BIT_CTRL_IN2_in <= RX_BIT_CTRL_IN2;
    RX_BIT_CTRL_IN3_in <= RX_BIT_CTRL_IN3;
    RX_BIT_CTRL_IN4_in <= RX_BIT_CTRL_IN4;
    RX_BIT_CTRL_IN5_in <= RX_BIT_CTRL_IN5;
    RX_BIT_CTRL_IN6_in <= RX_BIT_CTRL_IN6;
    TBYTE_IN_in(0) <= '0' when (TBYTE_IN(0) = 'U') else TBYTE_IN(0); -- rv 0
    TBYTE_IN_in(1) <= '0' when (TBYTE_IN(1) = 'U') else TBYTE_IN(1); -- rv 0
    TBYTE_IN_in(2) <= '0' when (TBYTE_IN(2) = 'U') else TBYTE_IN(2); -- rv 0
    TBYTE_IN_in(3) <= '0' when (TBYTE_IN(3) = 'U') else TBYTE_IN(3); -- rv 0
    TX_BIT_CTRL_IN0_in <= TX_BIT_CTRL_IN0;
    TX_BIT_CTRL_IN1_in <= TX_BIT_CTRL_IN1;
    TX_BIT_CTRL_IN2_in <= TX_BIT_CTRL_IN2;
    TX_BIT_CTRL_IN3_in <= TX_BIT_CTRL_IN3;
    TX_BIT_CTRL_IN4_in <= TX_BIT_CTRL_IN4;
    TX_BIT_CTRL_IN5_in <= TX_BIT_CTRL_IN5;
    TX_BIT_CTRL_IN6_in <= TX_BIT_CTRL_IN6;
    TX_BIT_CTRL_IN_TRI_in <= TX_BIT_CTRL_IN_TRI;
    


    CLK_STOP_in <= '1'; -- tie off
    DLY_TEST_IN_in <= '0'; -- tie off
    SCAN_INT_in <= '1'; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CTRL_CLK check
      if((xil_attr_test) or
         ((CTRL_CLK /= "EXTERNAL") and 
          (CTRL_CLK /= "INTERNAL"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] CTRL_CLK attribute is set to """));
        Write ( Message, string'(CTRL_CLK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""EXTERNAL"" or "));
        Write ( Message, string'("""INTERNAL"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DIV_MODE check
      if((xil_attr_test) or
         ((DIV_MODE /= "DIV2") and 
          (DIV_MODE /= "DIV4"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] DIV_MODE attribute is set to """));
        Write ( Message, string'(DIV_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DIV2"" or "));
        Write ( Message, string'("""DIV4"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_CLK_TO_EXT_NORTH check
      if((xil_attr_test) or
         ((EN_CLK_TO_EXT_NORTH /= "DISABLE") and 
          (EN_CLK_TO_EXT_NORTH /= "ENABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-110] EN_CLK_TO_EXT_NORTH attribute is set to """));
        Write ( Message, string'(EN_CLK_TO_EXT_NORTH));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DISABLE"" or "));
        Write ( Message, string'("""ENABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_CLK_TO_EXT_SOUTH check
      if((xil_attr_test) or
         ((EN_CLK_TO_EXT_SOUTH /= "DISABLE") and 
          (EN_CLK_TO_EXT_SOUTH /= "ENABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] EN_CLK_TO_EXT_SOUTH attribute is set to """));
        Write ( Message, string'(EN_CLK_TO_EXT_SOUTH));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DISABLE"" or "));
        Write ( Message, string'("""ENABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_DYN_ODLY_MODE check
      if((xil_attr_test) or
         ((EN_DYN_ODLY_MODE /= "FALSE") and 
          (EN_DYN_ODLY_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-112] EN_DYN_ODLY_MODE attribute is set to """));
        Write ( Message, string'(EN_DYN_ODLY_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_OTHER_NCLK check
      if((xil_attr_test) or
         ((EN_OTHER_NCLK /= "FALSE") and 
          (EN_OTHER_NCLK /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] EN_OTHER_NCLK attribute is set to """));
        Write ( Message, string'(EN_OTHER_NCLK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_OTHER_PCLK check
      if((xil_attr_test) or
         ((EN_OTHER_PCLK /= "FALSE") and 
          (EN_OTHER_PCLK /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-114] EN_OTHER_PCLK attribute is set to """));
        Write ( Message, string'(EN_OTHER_PCLK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IDLY_VT_TRACK check
      if((xil_attr_test) or
         ((IDLY_VT_TRACK /= "TRUE") and 
          (IDLY_VT_TRACK /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-116] IDLY_VT_TRACK attribute is set to """));
        Write ( Message, string'(IDLY_VT_TRACK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- INV_RXCLK check
      if((xil_attr_test) or
         ((INV_RXCLK /= "FALSE") and 
          (INV_RXCLK /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-118] INV_RXCLK attribute is set to """));
        Write ( Message, string'(INV_RXCLK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ODLY_VT_TRACK check
      if((xil_attr_test) or
         ((ODLY_VT_TRACK /= "TRUE") and 
          (ODLY_VT_TRACK /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-122] ODLY_VT_TRACK attribute is set to """));
        Write ( Message, string'(ODLY_VT_TRACK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- QDLY_VT_TRACK check
      if((xil_attr_test) or
         ((QDLY_VT_TRACK /= "TRUE") and 
          (QDLY_VT_TRACK /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-124] QDLY_VT_TRACK attribute is set to """));
        Write ( Message, string'(QDLY_VT_TRACK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- REFCLK_SRC check
      if((xil_attr_test) or
         ((REFCLK_SRC /= "PLLCLK") and 
          (REFCLK_SRC /= "REFCLK"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-126] REFCLK_SRC attribute is set to """));
        Write ( Message, string'(REFCLK_SRC));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""PLLCLK"" or "));
        Write ( Message, string'("""REFCLK"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ROUNDING_FACTOR check
      if((xil_attr_test) or
         ((ROUNDING_FACTOR /= 16) and 
          (ROUNDING_FACTOR /= 2) and 
          (ROUNDING_FACTOR /= 4) and 
          (ROUNDING_FACTOR /= 8) and 
          (ROUNDING_FACTOR /= 32) and 
          (ROUNDING_FACTOR /= 64) and 
          (ROUNDING_FACTOR /= 128))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-128] ROUNDING_FACTOR attribute is set to "));
        Write ( Message, ROUNDING_FACTOR);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("16, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("32, "));
        Write ( Message, string'("64 or "));
        Write ( Message, string'("128. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXGATE_EXTEND check
      if((xil_attr_test) or
         ((RXGATE_EXTEND /= "FALSE") and 
          (RXGATE_EXTEND /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-129] RXGATE_EXTEND attribute is set to """));
        Write ( Message, string'(RXGATE_EXTEND));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_CLK_PHASE_N check
      if((xil_attr_test) or
         ((RX_CLK_PHASE_N /= "SHIFT_0") and 
          (RX_CLK_PHASE_N /= "SHIFT_90"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-130] RX_CLK_PHASE_N attribute is set to """));
        Write ( Message, string'(RX_CLK_PHASE_N));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SHIFT_0"" or "));
        Write ( Message, string'("""SHIFT_90"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_CLK_PHASE_P check
      if((xil_attr_test) or
         ((RX_CLK_PHASE_P /= "SHIFT_0") and 
          (RX_CLK_PHASE_P /= "SHIFT_90"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-131] RX_CLK_PHASE_P attribute is set to """));
        Write ( Message, string'(RX_CLK_PHASE_P));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SHIFT_0"" or "));
        Write ( Message, string'("""SHIFT_90"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_GATING check
      if((xil_attr_test) or
         ((RX_GATING /= "DISABLE") and 
          (RX_GATING /= "ENABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-132] RX_GATING attribute is set to """));
        Write ( Message, string'(RX_GATING));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DISABLE"" or "));
        Write ( Message, string'("""ENABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SELF_CALIBRATE check
      if((xil_attr_test) or
         ((SELF_CALIBRATE /= "ENABLE") and 
          (SELF_CALIBRATE /= "DISABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-133] SELF_CALIBRATE attribute is set to """));
        Write ( Message, string'(SELF_CALIBRATE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ENABLE"" or "));
        Write ( Message, string'("""DISABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SERIAL_MODE check
      if((xil_attr_test) or
         ((SERIAL_MODE /= "FALSE") and 
          (SERIAL_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-134] SERIAL_MODE attribute is set to """));
        Write ( Message, string'(SERIAL_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
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
        Write ( Message, string'("-135] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_SPEEDUP check
      if((xil_attr_test) or
         ((SIM_SPEEDUP /= "FAST") and 
          (SIM_SPEEDUP /= "SLOW"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-136] SIM_SPEEDUP attribute is set to """));
        Write ( Message, string'(SIM_SPEEDUP));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FAST"" or "));
        Write ( Message, string'("""SLOW"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
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
        Write ( Message, string'("-137] SIM_VERSION attribute is set to "));
        Write ( Message, SIM_VERSION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2.0 or "));
        Write ( Message, string'("1.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_GATING check
      if((xil_attr_test) or
         ((TX_GATING /= "DISABLE") and 
          (TX_GATING /= "ENABLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-139] TX_GATING attribute is set to """));
        Write ( Message, string'(TX_GATING));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DISABLE"" or "));
        Write ( Message, string'("""ENABLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-124] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    if((SIM_DEVICE = "ULTRASCALE") and 
         ((RX_CLK_PHASE_P = "SHIFT_90") or 
          (RX_CLK_PHASE_N = "SHIFT_90"))) then
        Write ( Message, string'("Warning : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-1] When using RX_CLK_PHASE_<P:N> = SHIFT_90 simulation may not match hardware when using RX_DELAY_VALUE > 0 or CASCADE = TRUE. Every BITSLICE_CONTROL must have at least one RX_BITSLICE with DELAY_VALUE = 0 in order to ensure proper alignment"));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BITSLICE_CONTROL_V'PATH_NAME));
        --writeline(output, Message);
	assert FALSE
        report Message.all
        severity warning;
        DEALLOCATE (Message);
    end if;

    wait;
    end process INIPROC;

  D1_BC_inst : if ((SIM_DEVICE = "ULTRASCALE_PLUS") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES2")) generate
    BITSLICE_CONTROL_INST : SIP_BITSLICE_CONTROL_D1
      port map (
        BISC_MULTI_FREQ_EN   => BISC_MULTI_FREQ_EN_BIN,
        CONTROL_DLY_TEST_EN  => CONTROL_DLY_TEST_EN_BIN,
        CTRL_CLK             => CTRL_CLK_BIN,
        DC_ADJ_EN            => DC_ADJ_EN_BIN,
        DIV_MODE             => DIV_MODE_BIN,
        DLY_RNK0             => DLY_RNK0_BIN,
        DLY_RNK1             => DLY_RNK1_BIN,
        DLY_RNK2             => DLY_RNK2_BIN,
        DLY_RNK3             => DLY_RNK3_BIN,
        EN_CLK_TO_EXT_NORTH  => EN_CLK_TO_EXT_NORTH_BIN,
        EN_CLK_TO_EXT_SOUTH  => EN_CLK_TO_EXT_SOUTH_BIN,
        EN_DYN_ODLY_MODE     => EN_DYN_ODLY_MODE_BIN,
        EN_OTHER_NCLK        => EN_OTHER_NCLK_BIN,
        EN_OTHER_PCLK        => EN_OTHER_PCLK_BIN,
        FDLY                 => FDLY_BIN,
        IDLY_VT_TRACK        => IDLY_VT_TRACK_BIN,
        INCDEC_CRSE          => INCDEC_CRSE_BIN,
        INV_RXCLK            => INV_RXCLK_BIN,
        MASK_FIXDLY          => MASK_FIXDLY_BIN,
        MON                  => MON_BIN,
        NQTR                 => NQTR_BIN,
        ODLY_VT_TRACK        => ODLY_VT_TRACK_BIN,
        PQTR                 => PQTR_BIN,
        QDLY_VT_TRACK        => QDLY_VT_TRACK_BIN,
        READ_IDLE_COUNT      => READ_IDLE_COUNT_BIN,
        REFCLK_SRC           => REFCLK_SRC_BIN,
        RIU_RL_ARBITRATION_FIX_EN => RIU_RL_ARBITRATION_FIX_EN_BIN,
        ROUNDING_FACTOR      => ROUNDING_FACTOR_BIN,
        RXGATE_EXTEND        => RXGATE_EXTEND_BIN,
        RX_CLK_PHASE_N       => RX_CLK_PHASE_N_BIN,
        RX_CLK_PHASE_P       => RX_CLK_PHASE_P_BIN,
        RX_GATING            => RX_GATING_BIN,
        SELF_CALIBRATE       => SELF_CALIBRATE_BIN,
        SERIAL_MODE          => SERIAL_MODE_BIN,
        SIM_SPEEDUP          => SIM_SPEEDUP_BIN,
        SPARE                => SPARE_BIN,
        TX_GATING            => TX_GATING_BIN,
        CLK_TO_EXT_NORTH     => CLK_TO_EXT_NORTH_out,
        CLK_TO_EXT_SOUTH     => CLK_TO_EXT_SOUTH_out,
        DLY_RDY              => DLY_RDY_out,
        DLY_TEST_OUT         => DLY_TEST_OUT_out,
        DYN_DCI              => DYN_DCI_out,
        LOCAL_DIV_CLK        => LOCAL_DIV_CLK_out,
        MASTER_PD_OUT        => MASTER_PD_OUT_out,
        NCLK_NIBBLE_OUT      => NCLK_NIBBLE_OUT_out,
        PCLK_NIBBLE_OUT      => PCLK_NIBBLE_OUT_out,
        PLL_CLK_EN           => PLL_CLK_EN_out,
        REFCLK_DFD           => REFCLK_DFD_out,
        RIU_RD_DATA          => RIU_RD_DATA_out,
        RIU_VALID            => RIU_VALID_out,
        RX_BIT_CTRL_OUT0     => RX_BIT_CTRL_OUT0_out,
        RX_BIT_CTRL_OUT1     => RX_BIT_CTRL_OUT1_out,
        RX_BIT_CTRL_OUT2     => RX_BIT_CTRL_OUT2_out,
        RX_BIT_CTRL_OUT3     => RX_BIT_CTRL_OUT3_out,
        RX_BIT_CTRL_OUT4     => RX_BIT_CTRL_OUT4_out,
        RX_BIT_CTRL_OUT5     => RX_BIT_CTRL_OUT5_out,
        RX_BIT_CTRL_OUT6     => RX_BIT_CTRL_OUT6_out,
        TX_BIT_CTRL_OUT0     => TX_BIT_CTRL_OUT0_out,
        TX_BIT_CTRL_OUT1     => TX_BIT_CTRL_OUT1_out,
        TX_BIT_CTRL_OUT2     => TX_BIT_CTRL_OUT2_out,
        TX_BIT_CTRL_OUT3     => TX_BIT_CTRL_OUT3_out,
        TX_BIT_CTRL_OUT4     => TX_BIT_CTRL_OUT4_out,
        TX_BIT_CTRL_OUT5     => TX_BIT_CTRL_OUT5_out,
        TX_BIT_CTRL_OUT6     => TX_BIT_CTRL_OUT6_out,
        TX_BIT_CTRL_OUT_TRI  => TX_BIT_CTRL_OUT_TRI_out,
        VTC_RDY              => VTC_RDY_out,
        CLK_FROM_EXT         => CLK_FROM_EXT_in,
        CLK_STOP             => CLK_STOP_in,
        DLY_TEST_IN          => DLY_TEST_IN_in,
        EN_VTC               => EN_VTC_in,
        NCLK_NIBBLE_IN       => NCLK_NIBBLE_IN_in,
        PCLK_NIBBLE_IN       => PCLK_NIBBLE_IN_in,
        PHY_RDCS0            => PHY_RDCS0_in,
        PHY_RDCS1            => PHY_RDCS1_in,
        PHY_RDEN             => PHY_RDEN_in,
        PHY_WRCS0            => PHY_WRCS0_in,
        PHY_WRCS1            => PHY_WRCS1_in,
        PLL_CLK              => PLL_CLK_in,
        REFCLK               => REFCLK_in,
        RIU_ADDR             => RIU_ADDR_in,
        RIU_CLK              => RIU_CLK_in,
        RIU_NIBBLE_SEL       => RIU_NIBBLE_SEL_in,
        RIU_WR_DATA          => RIU_WR_DATA_in,
        RIU_WR_EN            => RIU_WR_EN_in,
        RST                  => RST_in,
        RX_BIT_CTRL_IN0      => RX_BIT_CTRL_IN0_in,
        RX_BIT_CTRL_IN1      => RX_BIT_CTRL_IN1_in,
        RX_BIT_CTRL_IN2      => RX_BIT_CTRL_IN2_in,
        RX_BIT_CTRL_IN3      => RX_BIT_CTRL_IN3_in,
        RX_BIT_CTRL_IN4      => RX_BIT_CTRL_IN4_in,
        RX_BIT_CTRL_IN5      => RX_BIT_CTRL_IN5_in,
        RX_BIT_CTRL_IN6      => RX_BIT_CTRL_IN6_in,
        SCAN_INT             => SCAN_INT_in,
        TBYTE_IN             => TBYTE_IN_in,
        TX_BIT_CTRL_IN0      => TX_BIT_CTRL_IN0_in,
        TX_BIT_CTRL_IN1      => TX_BIT_CTRL_IN1_in,
        TX_BIT_CTRL_IN2      => TX_BIT_CTRL_IN2_in,
        TX_BIT_CTRL_IN3      => TX_BIT_CTRL_IN3_in,
        TX_BIT_CTRL_IN4      => TX_BIT_CTRL_IN4_in,
        TX_BIT_CTRL_IN5      => TX_BIT_CTRL_IN5_in,
        TX_BIT_CTRL_IN6      => TX_BIT_CTRL_IN6_in,
        TX_BIT_CTRL_IN_TRI   => TX_BIT_CTRL_IN_TRI_in,
        GSR                  => glblGSR        
      );
    end generate D1_BC_inst;
    K2_BC_inst : if (SIM_DEVICE = "ULTRASCALE") generate
    BITSLICE_CONTROL_INST : SIP_BITSLICE_CONTROL_K2
      port map (
        CONTROL_DLY_TEST_EN  => CONTROL_DLY_TEST_EN_BIN,
        CTRL_CLK             => CTRL_CLK_BIN,
        DC_ADJ_EN            => DC_ADJ_EN_BIN,
        DIV_MODE             => DIV_MODE_BIN,
        DLY_RNK0             => DLY_RNK0_BIN,
        DLY_RNK1             => DLY_RNK1_BIN,
        DLY_RNK2             => DLY_RNK2_BIN,
        DLY_RNK3             => DLY_RNK3_BIN,
        EN_CLK_TO_EXT_NORTH  => EN_CLK_TO_EXT_NORTH_BIN,
        EN_CLK_TO_EXT_SOUTH  => EN_CLK_TO_EXT_SOUTH_BIN,
        EN_DYN_ODLY_MODE     => EN_DYN_ODLY_MODE_BIN,
        EN_OTHER_NCLK        => EN_OTHER_NCLK_BIN,
        EN_OTHER_PCLK        => EN_OTHER_PCLK_BIN,
        FDLY                 => FDLY_BIN,
        IDLY_VT_TRACK        => IDLY_VT_TRACK_BIN,
        INCDEC_CRSE          => INCDEC_CRSE_BIN,
        INV_RXCLK            => INV_RXCLK_BIN,
        MON                  => MON_BIN,
        NQTR                 => NQTR_BIN,
        ODLY_VT_TRACK        => ODLY_VT_TRACK_BIN,
        PQTR                 => PQTR_BIN,
        QDLY_VT_TRACK        => QDLY_VT_TRACK_BIN,
        READ_IDLE_COUNT      => READ_IDLE_COUNT_BIN,
        REFCLK_SRC           => REFCLK_SRC_BIN,
        ROUNDING_FACTOR      => ROUNDING_FACTOR_BIN,
        RXGATE_EXTEND        => RXGATE_EXTEND_BIN,
        RX_CLK_PHASE_N       => RX_CLK_PHASE_N_BIN,
        RX_CLK_PHASE_P       => RX_CLK_PHASE_P_BIN,
        RX_GATING            => RX_GATING_BIN,
        SELF_CALIBRATE       => SELF_CALIBRATE_BIN,
        SERIAL_MODE          => SERIAL_MODE_BIN,
        SIM_SPEEDUP          => SIM_SPEEDUP_BIN,
        SIM_VERSION          => SIM_VERSION_BIN,
        TX_GATING            => TX_GATING_BIN,
        CLK_TO_EXT_NORTH     => CLK_TO_EXT_NORTH_out,
        CLK_TO_EXT_SOUTH     => CLK_TO_EXT_SOUTH_out,
        DLY_RDY              => DLY_RDY_out,
        DLY_TEST_OUT         => DLY_TEST_OUT_out,
        DYN_DCI              => DYN_DCI_out,
        LOCAL_DIV_CLK        => LOCAL_DIV_CLK_out,
        MASTER_PD_OUT        => MASTER_PD_OUT_out,
        NCLK_NIBBLE_OUT      => NCLK_NIBBLE_OUT_out,
        PCLK_NIBBLE_OUT      => PCLK_NIBBLE_OUT_out,
        PLL_CLK_EN           => PLL_CLK_EN_out,
        REFCLK_DFD           => REFCLK_DFD_out,
        RIU_RD_DATA          => RIU_RD_DATA_out,
        RIU_VALID            => RIU_VALID_out,
        RX_BIT_CTRL_OUT0     => RX_BIT_CTRL_OUT0_out,
        RX_BIT_CTRL_OUT1     => RX_BIT_CTRL_OUT1_out,
        RX_BIT_CTRL_OUT2     => RX_BIT_CTRL_OUT2_out,
        RX_BIT_CTRL_OUT3     => RX_BIT_CTRL_OUT3_out,
        RX_BIT_CTRL_OUT4     => RX_BIT_CTRL_OUT4_out,
        RX_BIT_CTRL_OUT5     => RX_BIT_CTRL_OUT5_out,
        RX_BIT_CTRL_OUT6     => RX_BIT_CTRL_OUT6_out,
        TX_BIT_CTRL_OUT0     => TX_BIT_CTRL_OUT0_out,
        TX_BIT_CTRL_OUT1     => TX_BIT_CTRL_OUT1_out,
        TX_BIT_CTRL_OUT2     => TX_BIT_CTRL_OUT2_out,
        TX_BIT_CTRL_OUT3     => TX_BIT_CTRL_OUT3_out,
        TX_BIT_CTRL_OUT4     => TX_BIT_CTRL_OUT4_out,
        TX_BIT_CTRL_OUT5     => TX_BIT_CTRL_OUT5_out,
        TX_BIT_CTRL_OUT6     => TX_BIT_CTRL_OUT6_out,
        TX_BIT_CTRL_OUT_TRI  => TX_BIT_CTRL_OUT_TRI_out,
        VTC_RDY              => VTC_RDY_out,
        CLK_FROM_EXT         => CLK_FROM_EXT_in,
        CLK_STOP             => CLK_STOP_in,
        DLY_TEST_IN          => DLY_TEST_IN_in,
        EN_VTC               => EN_VTC_in,
        NCLK_NIBBLE_IN       => NCLK_NIBBLE_IN_in,
        PCLK_NIBBLE_IN       => PCLK_NIBBLE_IN_in,
        PHY_RDCS0            => PHY_RDCS0_in,
        PHY_RDCS1            => PHY_RDCS1_in,
        PHY_RDEN             => PHY_RDEN_in,
        PHY_WRCS0            => PHY_WRCS0_in,
        PHY_WRCS1            => PHY_WRCS1_in,
        PLL_CLK              => PLL_CLK_in,
        REFCLK               => REFCLK_in,
        RIU_ADDR             => RIU_ADDR_in,
        RIU_CLK              => RIU_CLK_in,
        RIU_NIBBLE_SEL       => RIU_NIBBLE_SEL_in,
        RIU_WR_DATA          => RIU_WR_DATA_in,
        RIU_WR_EN            => RIU_WR_EN_in,
        RST                  => RST_in,
        RX_BIT_CTRL_IN0      => RX_BIT_CTRL_IN0_in,
        RX_BIT_CTRL_IN1      => RX_BIT_CTRL_IN1_in,
        RX_BIT_CTRL_IN2      => RX_BIT_CTRL_IN2_in,
        RX_BIT_CTRL_IN3      => RX_BIT_CTRL_IN3_in,
        RX_BIT_CTRL_IN4      => RX_BIT_CTRL_IN4_in,
        RX_BIT_CTRL_IN5      => RX_BIT_CTRL_IN5_in,
        RX_BIT_CTRL_IN6      => RX_BIT_CTRL_IN6_in,
        SCAN_INT             => SCAN_INT_in,
        TBYTE_IN             => TBYTE_IN_in,
        TX_BIT_CTRL_IN0      => TX_BIT_CTRL_IN0_in,
        TX_BIT_CTRL_IN1      => TX_BIT_CTRL_IN1_in,
        TX_BIT_CTRL_IN2      => TX_BIT_CTRL_IN2_in,
        TX_BIT_CTRL_IN3      => TX_BIT_CTRL_IN3_in,
        TX_BIT_CTRL_IN4      => TX_BIT_CTRL_IN4_in,
        TX_BIT_CTRL_IN5      => TX_BIT_CTRL_IN5_in,
        TX_BIT_CTRL_IN6      => TX_BIT_CTRL_IN6_in,
        TX_BIT_CTRL_IN_TRI   => TX_BIT_CTRL_IN_TRI_in,
        GSR                  => glblGSR        
      );
    end generate K2_BC_inst;
  end BITSLICE_CONTROL_V;
