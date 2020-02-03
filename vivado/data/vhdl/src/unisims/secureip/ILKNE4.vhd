-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Interlaken MAC
-- /___/   /\      Filename    : ILKNE4.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL ILKNE4 -----

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

entity ILKNE4 is
  generic (
    BYPASS : string := "FALSE";
    CTL_RX_BURSTMAX : std_logic_vector(1 downto 0) := "11";
    CTL_RX_CHAN_EXT : std_logic_vector(1 downto 0) := "00";
    CTL_RX_LAST_LANE : std_logic_vector(3 downto 0) := X"B";
    CTL_RX_MFRAMELEN_MINUS1 : std_logic_vector(15 downto 0) := X"07FF";
    CTL_RX_PACKET_MODE : string := "FALSE";
    CTL_RX_RETRANS_MULT : std_logic_vector(2 downto 0) := "000";
    CTL_RX_RETRANS_RETRY : std_logic_vector(3 downto 0) := X"2";
    CTL_RX_RETRANS_TIMER1 : std_logic_vector(15 downto 0) := X"0009";
    CTL_RX_RETRANS_TIMER2 : std_logic_vector(15 downto 0) := X"0000";
    CTL_RX_RETRANS_WDOG : std_logic_vector(11 downto 0) := X"000";
    CTL_RX_RETRANS_WRAP_TIMER : std_logic_vector(7 downto 0) := X"00";
    CTL_TEST_MODE_PIN_CHAR : string := "FALSE";
    CTL_TX_BURSTMAX : std_logic_vector(1 downto 0) := "11";
    CTL_TX_BURSTSHORT : std_logic_vector(2 downto 0) := "001";
    CTL_TX_CHAN_EXT : std_logic_vector(1 downto 0) := "00";
    CTL_TX_DISABLE_SKIPWORD : string := "FALSE";
    CTL_TX_FC_CALLEN : std_logic_vector(3 downto 0) := X"F";
    CTL_TX_LAST_LANE : std_logic_vector(3 downto 0) := X"B";
    CTL_TX_MFRAMELEN_MINUS1 : std_logic_vector(15 downto 0) := X"07FF";
    CTL_TX_RETRANS_DEPTH : std_logic_vector(13 downto 0) := "00" & X"800";
    CTL_TX_RETRANS_MULT : std_logic_vector(2 downto 0) := "000";
    CTL_TX_RETRANS_RAM_BANKS : std_logic_vector(1 downto 0) := "11";
    MODE : string := "TRUE";
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    TEST_MODE_PIN_CHAR : string := "FALSE"
  );
  
  port (
    DRP_DO               : out std_logic_vector(15 downto 0);
    DRP_RDY              : out std_ulogic;
    RX_BYPASS_DATAOUT00  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT01  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT02  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT03  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT04  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT05  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT06  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT07  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT08  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT09  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT10  : out std_logic_vector(65 downto 0);
    RX_BYPASS_DATAOUT11  : out std_logic_vector(65 downto 0);
    RX_BYPASS_ENAOUT     : out std_logic_vector(11 downto 0);
    RX_BYPASS_IS_AVAILOUT : out std_logic_vector(11 downto 0);
    RX_BYPASS_IS_BADLYFRAMEDOUT : out std_logic_vector(11 downto 0);
    RX_BYPASS_IS_OVERFLOWOUT : out std_logic_vector(11 downto 0);
    RX_BYPASS_IS_SYNCEDOUT : out std_logic_vector(11 downto 0);
    RX_BYPASS_IS_SYNCWORDOUT : out std_logic_vector(11 downto 0);
    RX_CHANOUT0          : out std_logic_vector(10 downto 0);
    RX_CHANOUT1          : out std_logic_vector(10 downto 0);
    RX_CHANOUT2          : out std_logic_vector(10 downto 0);
    RX_CHANOUT3          : out std_logic_vector(10 downto 0);
    RX_DATAOUT0          : out std_logic_vector(127 downto 0);
    RX_DATAOUT1          : out std_logic_vector(127 downto 0);
    RX_DATAOUT2          : out std_logic_vector(127 downto 0);
    RX_DATAOUT3          : out std_logic_vector(127 downto 0);
    RX_ENAOUT0           : out std_ulogic;
    RX_ENAOUT1           : out std_ulogic;
    RX_ENAOUT2           : out std_ulogic;
    RX_ENAOUT3           : out std_ulogic;
    RX_EOPOUT0           : out std_ulogic;
    RX_EOPOUT1           : out std_ulogic;
    RX_EOPOUT2           : out std_ulogic;
    RX_EOPOUT3           : out std_ulogic;
    RX_ERROUT0           : out std_ulogic;
    RX_ERROUT1           : out std_ulogic;
    RX_ERROUT2           : out std_ulogic;
    RX_ERROUT3           : out std_ulogic;
    RX_MTYOUT0           : out std_logic_vector(3 downto 0);
    RX_MTYOUT1           : out std_logic_vector(3 downto 0);
    RX_MTYOUT2           : out std_logic_vector(3 downto 0);
    RX_MTYOUT3           : out std_logic_vector(3 downto 0);
    RX_OVFOUT            : out std_ulogic;
    RX_SOPOUT0           : out std_ulogic;
    RX_SOPOUT1           : out std_ulogic;
    RX_SOPOUT2           : out std_ulogic;
    RX_SOPOUT3           : out std_ulogic;
    STAT_RX_ALIGNED      : out std_ulogic;
    STAT_RX_ALIGNED_ERR  : out std_ulogic;
    STAT_RX_BAD_TYPE_ERR : out std_logic_vector(11 downto 0);
    STAT_RX_BURSTMAX_ERR : out std_ulogic;
    STAT_RX_BURST_ERR    : out std_ulogic;
    STAT_RX_CRC24_ERR    : out std_ulogic;
    STAT_RX_CRC32_ERR    : out std_logic_vector(11 downto 0);
    STAT_RX_CRC32_VALID  : out std_logic_vector(11 downto 0);
    STAT_RX_DESCRAM_ERR  : out std_logic_vector(11 downto 0);
    STAT_RX_DIAGWORD_INTFSTAT : out std_logic_vector(11 downto 0);
    STAT_RX_DIAGWORD_LANESTAT : out std_logic_vector(11 downto 0);
    STAT_RX_FC_STAT      : out std_logic_vector(255 downto 0);
    STAT_RX_FRAMING_ERR  : out std_logic_vector(11 downto 0);
    STAT_RX_MEOP_ERR     : out std_ulogic;
    STAT_RX_MF_ERR       : out std_logic_vector(11 downto 0);
    STAT_RX_MF_LEN_ERR   : out std_logic_vector(11 downto 0);
    STAT_RX_MF_REPEAT_ERR : out std_logic_vector(11 downto 0);
    STAT_RX_MISALIGNED   : out std_ulogic;
    STAT_RX_MSOP_ERR     : out std_ulogic;
    STAT_RX_MUBITS       : out std_logic_vector(7 downto 0);
    STAT_RX_MUBITS_UPDATED : out std_ulogic;
    STAT_RX_OVERFLOW_ERR : out std_ulogic;
    STAT_RX_RETRANS_CRC24_ERR : out std_ulogic;
    STAT_RX_RETRANS_DISC : out std_ulogic;
    STAT_RX_RETRANS_LATENCY : out std_logic_vector(15 downto 0);
    STAT_RX_RETRANS_REQ  : out std_ulogic;
    STAT_RX_RETRANS_RETRY_ERR : out std_ulogic;
    STAT_RX_RETRANS_SEQ  : out std_logic_vector(7 downto 0);
    STAT_RX_RETRANS_SEQ_UPDATED : out std_ulogic;
    STAT_RX_RETRANS_STATE : out std_logic_vector(2 downto 0);
    STAT_RX_RETRANS_SUBSEQ : out std_logic_vector(4 downto 0);
    STAT_RX_RETRANS_WDOG_ERR : out std_ulogic;
    STAT_RX_RETRANS_WRAP_ERR : out std_ulogic;
    STAT_RX_SYNCED       : out std_logic_vector(11 downto 0);
    STAT_RX_SYNCED_ERR   : out std_logic_vector(11 downto 0);
    STAT_RX_WORD_SYNC    : out std_logic_vector(11 downto 0);
    STAT_TX_BURST_ERR    : out std_ulogic;
    STAT_TX_ERRINJ_BITERR_DONE : out std_ulogic;
    STAT_TX_OVERFLOW_ERR : out std_ulogic;
    STAT_TX_RETRANS_BURST_ERR : out std_ulogic;
    STAT_TX_RETRANS_BUSY : out std_ulogic;
    STAT_TX_RETRANS_RAM_PERROUT : out std_ulogic;
    STAT_TX_RETRANS_RAM_RADDR : out std_logic_vector(8 downto 0);
    STAT_TX_RETRANS_RAM_RD_B0 : out std_ulogic;
    STAT_TX_RETRANS_RAM_RD_B1 : out std_ulogic;
    STAT_TX_RETRANS_RAM_RD_B2 : out std_ulogic;
    STAT_TX_RETRANS_RAM_RD_B3 : out std_ulogic;
    STAT_TX_RETRANS_RAM_RSEL : out std_logic_vector(1 downto 0);
    STAT_TX_RETRANS_RAM_WADDR : out std_logic_vector(8 downto 0);
    STAT_TX_RETRANS_RAM_WDATA : out std_logic_vector(643 downto 0);
    STAT_TX_RETRANS_RAM_WE_B0 : out std_ulogic;
    STAT_TX_RETRANS_RAM_WE_B1 : out std_ulogic;
    STAT_TX_RETRANS_RAM_WE_B2 : out std_ulogic;
    STAT_TX_RETRANS_RAM_WE_B3 : out std_ulogic;
    STAT_TX_UNDERFLOW_ERR : out std_ulogic;
    TX_OVFOUT            : out std_ulogic;
    TX_RDYOUT            : out std_ulogic;
    TX_SERDES_DATA00     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA01     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA02     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA03     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA04     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA05     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA06     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA07     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA08     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA09     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA10     : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA11     : out std_logic_vector(63 downto 0);
    CORE_CLK             : in std_ulogic;
    CTL_RX_FORCE_RESYNC  : in std_ulogic;
    CTL_RX_RETRANS_ACK   : in std_ulogic;
    CTL_RX_RETRANS_ENABLE : in std_ulogic;
    CTL_RX_RETRANS_ERRIN : in std_ulogic;
    CTL_RX_RETRANS_FORCE_REQ : in std_ulogic;
    CTL_RX_RETRANS_RESET : in std_ulogic;
    CTL_RX_RETRANS_RESET_MODE : in std_ulogic;
    CTL_TX_DIAGWORD_INTFSTAT : in std_ulogic;
    CTL_TX_DIAGWORD_LANESTAT : in std_logic_vector(11 downto 0);
    CTL_TX_ENABLE        : in std_ulogic;
    CTL_TX_ERRINJ_BITERR_GO : in std_ulogic;
    CTL_TX_ERRINJ_BITERR_LANE : in std_logic_vector(3 downto 0);
    CTL_TX_FC_STAT       : in std_logic_vector(255 downto 0);
    CTL_TX_MUBITS        : in std_logic_vector(7 downto 0);
    CTL_TX_RETRANS_ENABLE : in std_ulogic;
    CTL_TX_RETRANS_RAM_PERRIN : in std_ulogic;
    CTL_TX_RETRANS_RAM_RDATA : in std_logic_vector(643 downto 0);
    CTL_TX_RETRANS_REQ   : in std_ulogic;
    CTL_TX_RETRANS_REQ_VALID : in std_ulogic;
    CTL_TX_RLIM_DELTA    : in std_logic_vector(11 downto 0);
    CTL_TX_RLIM_ENABLE   : in std_ulogic;
    CTL_TX_RLIM_INTV     : in std_logic_vector(7 downto 0);
    CTL_TX_RLIM_MAX      : in std_logic_vector(11 downto 0);
    DRP_ADDR             : in std_logic_vector(9 downto 0);
    DRP_CLK              : in std_ulogic;
    DRP_DI               : in std_logic_vector(15 downto 0);
    DRP_EN               : in std_ulogic;
    DRP_WE               : in std_ulogic;
    LBUS_CLK             : in std_ulogic;
    RX_BYPASS_FORCE_REALIGNIN : in std_ulogic;
    RX_BYPASS_RDIN       : in std_ulogic;
    RX_RESET             : in std_ulogic;
    RX_SERDES_CLK        : in std_logic_vector(11 downto 0);
    RX_SERDES_DATA00     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA01     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA02     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA03     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA04     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA05     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA06     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA07     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA08     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA09     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA10     : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA11     : in std_logic_vector(63 downto 0);
    RX_SERDES_RESET      : in std_logic_vector(11 downto 0);
    TX_BCTLIN0           : in std_ulogic;
    TX_BCTLIN1           : in std_ulogic;
    TX_BCTLIN2           : in std_ulogic;
    TX_BCTLIN3           : in std_ulogic;
    TX_BYPASS_CTRLIN     : in std_logic_vector(11 downto 0);
    TX_BYPASS_DATAIN00   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN01   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN02   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN03   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN04   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN05   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN06   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN07   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN08   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN09   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN10   : in std_logic_vector(63 downto 0);
    TX_BYPASS_DATAIN11   : in std_logic_vector(63 downto 0);
    TX_BYPASS_ENAIN      : in std_ulogic;
    TX_BYPASS_GEARBOX_SEQIN : in std_logic_vector(7 downto 0);
    TX_BYPASS_MFRAMER_STATEIN : in std_logic_vector(3 downto 0);
    TX_CHANIN0           : in std_logic_vector(10 downto 0);
    TX_CHANIN1           : in std_logic_vector(10 downto 0);
    TX_CHANIN2           : in std_logic_vector(10 downto 0);
    TX_CHANIN3           : in std_logic_vector(10 downto 0);
    TX_DATAIN0           : in std_logic_vector(127 downto 0);
    TX_DATAIN1           : in std_logic_vector(127 downto 0);
    TX_DATAIN2           : in std_logic_vector(127 downto 0);
    TX_DATAIN3           : in std_logic_vector(127 downto 0);
    TX_ENAIN0            : in std_ulogic;
    TX_ENAIN1            : in std_ulogic;
    TX_ENAIN2            : in std_ulogic;
    TX_ENAIN3            : in std_ulogic;
    TX_EOPIN0            : in std_ulogic;
    TX_EOPIN1            : in std_ulogic;
    TX_EOPIN2            : in std_ulogic;
    TX_EOPIN3            : in std_ulogic;
    TX_ERRIN0            : in std_ulogic;
    TX_ERRIN1            : in std_ulogic;
    TX_ERRIN2            : in std_ulogic;
    TX_ERRIN3            : in std_ulogic;
    TX_MTYIN0            : in std_logic_vector(3 downto 0);
    TX_MTYIN1            : in std_logic_vector(3 downto 0);
    TX_MTYIN2            : in std_logic_vector(3 downto 0);
    TX_MTYIN3            : in std_logic_vector(3 downto 0);
    TX_RESET             : in std_ulogic;
    TX_SERDES_REFCLK     : in std_ulogic;
    TX_SERDES_REFCLK_RESET : in std_ulogic;
    TX_SOPIN0            : in std_ulogic;
    TX_SOPIN1            : in std_ulogic;
    TX_SOPIN2            : in std_ulogic;
    TX_SOPIN3            : in std_ulogic
  );
end ILKNE4;

architecture ILKNE4_V of ILKNE4 is
  component SIP_ILKNE4
    port (
      BYPASS               : in std_logic_vector(39 downto 0);
      CTL_CSSD_EN          : in std_logic_vector(39 downto 0);
      CTL_CSSD_MRKR_INIT   : in std_logic_vector(15 downto 0);
      CTL_CSSD_ROOT_CLK_DIS : in std_logic_vector(14 downto 0);
      CTL_CSSD_ROOT_CLK_SEL : in std_logic_vector(3 downto 0);
      CTL_CSSD_SNGL_CHAIN_MD : in std_logic_vector(39 downto 0);
      CTL_CSSD_STOP_COUNT_0 : in std_logic_vector(15 downto 0);
      CTL_CSSD_STOP_COUNT_1 : in std_logic_vector(15 downto 0);
      CTL_CSSD_STOP_COUNT_2 : in std_logic_vector(15 downto 0);
      CTL_RX_BURSTMAX      : in std_logic_vector(1 downto 0);
      CTL_RX_CHAN_EXT      : in std_logic_vector(1 downto 0);
      CTL_RX_LAST_LANE     : in std_logic_vector(3 downto 0);
      CTL_RX_MFRAMELEN_MINUS1 : in std_logic_vector(15 downto 0);
      CTL_RX_PACKET_MODE   : in std_logic_vector(39 downto 0);
      CTL_RX_RETRANS_MULT  : in std_logic_vector(2 downto 0);
      CTL_RX_RETRANS_RETRY : in std_logic_vector(3 downto 0);
      CTL_RX_RETRANS_TIMER1 : in std_logic_vector(15 downto 0);
      CTL_RX_RETRANS_TIMER2 : in std_logic_vector(15 downto 0);
      CTL_RX_RETRANS_WDOG  : in std_logic_vector(11 downto 0);
      CTL_RX_RETRANS_WRAP_TIMER : in std_logic_vector(7 downto 0);
      CTL_TEST_MODE_PIN_CHAR : in std_logic_vector(39 downto 0);
      CTL_TX_BURSTMAX      : in std_logic_vector(1 downto 0);
      CTL_TX_BURSTSHORT    : in std_logic_vector(2 downto 0);
      CTL_TX_CHAN_EXT      : in std_logic_vector(1 downto 0);
      CTL_TX_DISABLE_SKIPWORD : in std_logic_vector(39 downto 0);
      CTL_TX_FC_CALLEN     : in std_logic_vector(3 downto 0);
      CTL_TX_LAST_LANE     : in std_logic_vector(3 downto 0);
      CTL_TX_MFRAMELEN_MINUS1 : in std_logic_vector(15 downto 0);
      CTL_TX_RETRANS_DEPTH : in std_logic_vector(13 downto 0);
      CTL_TX_RETRANS_MULT  : in std_logic_vector(2 downto 0);
      CTL_TX_RETRANS_RAM_BANKS : in std_logic_vector(1 downto 0);
      MODE                 : in std_logic_vector(39 downto 0);
      TEST_MODE_PIN_CHAR   : in std_logic_vector(39 downto 0);
      CFG_RESET_CSSD       : out std_ulogic;
      CSSD_CLK_STOP_DONE   : out std_ulogic;
      DRP_DO               : out std_logic_vector(15 downto 0);
      DRP_RDY              : out std_ulogic;
      GRESTORE_CSSD        : out std_ulogic;
      GWE_CSSD             : out std_ulogic;
      RX_BYPASS_DATAOUT00  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT01  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT02  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT03  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT04  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT05  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT06  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT07  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT08  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT09  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT10  : out std_logic_vector(65 downto 0);
      RX_BYPASS_DATAOUT11  : out std_logic_vector(65 downto 0);
      RX_BYPASS_ENAOUT     : out std_logic_vector(11 downto 0);
      RX_BYPASS_IS_AVAILOUT : out std_logic_vector(11 downto 0);
      RX_BYPASS_IS_BADLYFRAMEDOUT : out std_logic_vector(11 downto 0);
      RX_BYPASS_IS_OVERFLOWOUT : out std_logic_vector(11 downto 0);
      RX_BYPASS_IS_SYNCEDOUT : out std_logic_vector(11 downto 0);
      RX_BYPASS_IS_SYNCWORDOUT : out std_logic_vector(11 downto 0);
      RX_CHANOUT0          : out std_logic_vector(10 downto 0);
      RX_CHANOUT1          : out std_logic_vector(10 downto 0);
      RX_CHANOUT2          : out std_logic_vector(10 downto 0);
      RX_CHANOUT3          : out std_logic_vector(10 downto 0);
      RX_DATAOUT0          : out std_logic_vector(127 downto 0);
      RX_DATAOUT1          : out std_logic_vector(127 downto 0);
      RX_DATAOUT2          : out std_logic_vector(127 downto 0);
      RX_DATAOUT3          : out std_logic_vector(127 downto 0);
      RX_ENAOUT0           : out std_ulogic;
      RX_ENAOUT1           : out std_ulogic;
      RX_ENAOUT2           : out std_ulogic;
      RX_ENAOUT3           : out std_ulogic;
      RX_EOPOUT0           : out std_ulogic;
      RX_EOPOUT1           : out std_ulogic;
      RX_EOPOUT2           : out std_ulogic;
      RX_EOPOUT3           : out std_ulogic;
      RX_ERROUT0           : out std_ulogic;
      RX_ERROUT1           : out std_ulogic;
      RX_ERROUT2           : out std_ulogic;
      RX_ERROUT3           : out std_ulogic;
      RX_MTYOUT0           : out std_logic_vector(3 downto 0);
      RX_MTYOUT1           : out std_logic_vector(3 downto 0);
      RX_MTYOUT2           : out std_logic_vector(3 downto 0);
      RX_MTYOUT3           : out std_logic_vector(3 downto 0);
      RX_OVFOUT            : out std_ulogic;
      RX_SOPOUT0           : out std_ulogic;
      RX_SOPOUT1           : out std_ulogic;
      RX_SOPOUT2           : out std_ulogic;
      RX_SOPOUT3           : out std_ulogic;
      SCAN_OUT             : out std_logic_vector(264 downto 0);
      STAT_RX_ALIGNED      : out std_ulogic;
      STAT_RX_ALIGNED_ERR  : out std_ulogic;
      STAT_RX_BAD_TYPE_ERR : out std_logic_vector(11 downto 0);
      STAT_RX_BURSTMAX_ERR : out std_ulogic;
      STAT_RX_BURST_ERR    : out std_ulogic;
      STAT_RX_CRC24_ERR    : out std_ulogic;
      STAT_RX_CRC32_ERR    : out std_logic_vector(11 downto 0);
      STAT_RX_CRC32_VALID  : out std_logic_vector(11 downto 0);
      STAT_RX_DESCRAM_ERR  : out std_logic_vector(11 downto 0);
      STAT_RX_DIAGWORD_INTFSTAT : out std_logic_vector(11 downto 0);
      STAT_RX_DIAGWORD_LANESTAT : out std_logic_vector(11 downto 0);
      STAT_RX_FC_STAT      : out std_logic_vector(255 downto 0);
      STAT_RX_FRAMING_ERR  : out std_logic_vector(11 downto 0);
      STAT_RX_MEOP_ERR     : out std_ulogic;
      STAT_RX_MF_ERR       : out std_logic_vector(11 downto 0);
      STAT_RX_MF_LEN_ERR   : out std_logic_vector(11 downto 0);
      STAT_RX_MF_REPEAT_ERR : out std_logic_vector(11 downto 0);
      STAT_RX_MISALIGNED   : out std_ulogic;
      STAT_RX_MSOP_ERR     : out std_ulogic;
      STAT_RX_MUBITS       : out std_logic_vector(7 downto 0);
      STAT_RX_MUBITS_UPDATED : out std_ulogic;
      STAT_RX_OVERFLOW_ERR : out std_ulogic;
      STAT_RX_RETRANS_CRC24_ERR : out std_ulogic;
      STAT_RX_RETRANS_DISC : out std_ulogic;
      STAT_RX_RETRANS_LATENCY : out std_logic_vector(15 downto 0);
      STAT_RX_RETRANS_REQ  : out std_ulogic;
      STAT_RX_RETRANS_RETRY_ERR : out std_ulogic;
      STAT_RX_RETRANS_SEQ  : out std_logic_vector(7 downto 0);
      STAT_RX_RETRANS_SEQ_UPDATED : out std_ulogic;
      STAT_RX_RETRANS_STATE : out std_logic_vector(2 downto 0);
      STAT_RX_RETRANS_SUBSEQ : out std_logic_vector(4 downto 0);
      STAT_RX_RETRANS_WDOG_ERR : out std_ulogic;
      STAT_RX_RETRANS_WRAP_ERR : out std_ulogic;
      STAT_RX_SYNCED       : out std_logic_vector(11 downto 0);
      STAT_RX_SYNCED_ERR   : out std_logic_vector(11 downto 0);
      STAT_RX_WORD_SYNC    : out std_logic_vector(11 downto 0);
      STAT_TX_BURST_ERR    : out std_ulogic;
      STAT_TX_ERRINJ_BITERR_DONE : out std_ulogic;
      STAT_TX_OVERFLOW_ERR : out std_ulogic;
      STAT_TX_RETRANS_BURST_ERR : out std_ulogic;
      STAT_TX_RETRANS_BUSY : out std_ulogic;
      STAT_TX_RETRANS_RAM_PERROUT : out std_ulogic;
      STAT_TX_RETRANS_RAM_RADDR : out std_logic_vector(8 downto 0);
      STAT_TX_RETRANS_RAM_RD_B0 : out std_ulogic;
      STAT_TX_RETRANS_RAM_RD_B1 : out std_ulogic;
      STAT_TX_RETRANS_RAM_RD_B2 : out std_ulogic;
      STAT_TX_RETRANS_RAM_RD_B3 : out std_ulogic;
      STAT_TX_RETRANS_RAM_RSEL : out std_logic_vector(1 downto 0);
      STAT_TX_RETRANS_RAM_WADDR : out std_logic_vector(8 downto 0);
      STAT_TX_RETRANS_RAM_WDATA : out std_logic_vector(643 downto 0);
      STAT_TX_RETRANS_RAM_WE_B0 : out std_ulogic;
      STAT_TX_RETRANS_RAM_WE_B1 : out std_ulogic;
      STAT_TX_RETRANS_RAM_WE_B2 : out std_ulogic;
      STAT_TX_RETRANS_RAM_WE_B3 : out std_ulogic;
      STAT_TX_UNDERFLOW_ERR : out std_ulogic;
      TX_OVFOUT            : out std_ulogic;
      TX_RDYOUT            : out std_ulogic;
      TX_SERDES_DATA00     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA01     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA02     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA03     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA04     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA05     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA06     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA07     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA08     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA09     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA10     : out std_logic_vector(63 downto 0);
      TX_SERDES_DATA11     : out std_logic_vector(63 downto 0);
      CORE_CLK             : in std_ulogic;
      CSSD_CLK_STOP_EVENT  : in std_ulogic;
      CSSD_RESETN          : in std_ulogic;
      CTL_RX_FORCE_RESYNC  : in std_ulogic;
      CTL_RX_RETRANS_ACK   : in std_ulogic;
      CTL_RX_RETRANS_ENABLE : in std_ulogic;
      CTL_RX_RETRANS_ERRIN : in std_ulogic;
      CTL_RX_RETRANS_FORCE_REQ : in std_ulogic;
      CTL_RX_RETRANS_RESET : in std_ulogic;
      CTL_RX_RETRANS_RESET_MODE : in std_ulogic;
      CTL_TX_DIAGWORD_INTFSTAT : in std_ulogic;
      CTL_TX_DIAGWORD_LANESTAT : in std_logic_vector(11 downto 0);
      CTL_TX_ENABLE        : in std_ulogic;
      CTL_TX_ERRINJ_BITERR_GO : in std_ulogic;
      CTL_TX_ERRINJ_BITERR_LANE : in std_logic_vector(3 downto 0);
      CTL_TX_FC_STAT       : in std_logic_vector(255 downto 0);
      CTL_TX_MUBITS        : in std_logic_vector(7 downto 0);
      CTL_TX_RETRANS_ENABLE : in std_ulogic;
      CTL_TX_RETRANS_RAM_PERRIN : in std_ulogic;
      CTL_TX_RETRANS_RAM_RDATA : in std_logic_vector(643 downto 0);
      CTL_TX_RETRANS_REQ   : in std_ulogic;
      CTL_TX_RETRANS_REQ_VALID : in std_ulogic;
      CTL_TX_RLIM_DELTA    : in std_logic_vector(11 downto 0);
      CTL_TX_RLIM_ENABLE   : in std_ulogic;
      CTL_TX_RLIM_INTV     : in std_logic_vector(7 downto 0);
      CTL_TX_RLIM_MAX      : in std_logic_vector(11 downto 0);
      DRP_ADDR             : in std_logic_vector(9 downto 0);
      DRP_CLK              : in std_ulogic;
      DRP_DI               : in std_logic_vector(15 downto 0);
      DRP_EN               : in std_ulogic;
      DRP_WE               : in std_ulogic;
      LBUS_CLK             : in std_ulogic;
      RX_BYPASS_FORCE_REALIGNIN : in std_ulogic;
      RX_BYPASS_RDIN       : in std_ulogic;
      RX_RESET             : in std_ulogic;
      RX_SERDES_CLK        : in std_logic_vector(11 downto 0);
      RX_SERDES_DATA00     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA01     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA02     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA03     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA04     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA05     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA06     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA07     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA08     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA09     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA10     : in std_logic_vector(63 downto 0);
      RX_SERDES_DATA11     : in std_logic_vector(63 downto 0);
      RX_SERDES_RESET      : in std_logic_vector(11 downto 0);
      SCAN_CLK             : in std_ulogic;
      SCAN_EN_N            : in std_ulogic;
      SCAN_IN              : in std_logic_vector(264 downto 0);
      TEST_MODE_N          : in std_ulogic;
      TEST_RESET           : in std_ulogic;
      TX_BCTLIN0           : in std_ulogic;
      TX_BCTLIN1           : in std_ulogic;
      TX_BCTLIN2           : in std_ulogic;
      TX_BCTLIN3           : in std_ulogic;
      TX_BYPASS_CTRLIN     : in std_logic_vector(11 downto 0);
      TX_BYPASS_DATAIN00   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN01   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN02   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN03   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN04   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN05   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN06   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN07   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN08   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN09   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN10   : in std_logic_vector(63 downto 0);
      TX_BYPASS_DATAIN11   : in std_logic_vector(63 downto 0);
      TX_BYPASS_ENAIN      : in std_ulogic;
      TX_BYPASS_GEARBOX_SEQIN : in std_logic_vector(7 downto 0);
      TX_BYPASS_MFRAMER_STATEIN : in std_logic_vector(3 downto 0);
      TX_CHANIN0           : in std_logic_vector(10 downto 0);
      TX_CHANIN1           : in std_logic_vector(10 downto 0);
      TX_CHANIN2           : in std_logic_vector(10 downto 0);
      TX_CHANIN3           : in std_logic_vector(10 downto 0);
      TX_DATAIN0           : in std_logic_vector(127 downto 0);
      TX_DATAIN1           : in std_logic_vector(127 downto 0);
      TX_DATAIN2           : in std_logic_vector(127 downto 0);
      TX_DATAIN3           : in std_logic_vector(127 downto 0);
      TX_ENAIN0            : in std_ulogic;
      TX_ENAIN1            : in std_ulogic;
      TX_ENAIN2            : in std_ulogic;
      TX_ENAIN3            : in std_ulogic;
      TX_EOPIN0            : in std_ulogic;
      TX_EOPIN1            : in std_ulogic;
      TX_EOPIN2            : in std_ulogic;
      TX_EOPIN3            : in std_ulogic;
      TX_ERRIN0            : in std_ulogic;
      TX_ERRIN1            : in std_ulogic;
      TX_ERRIN2            : in std_ulogic;
      TX_ERRIN3            : in std_ulogic;
      TX_MTYIN0            : in std_logic_vector(3 downto 0);
      TX_MTYIN1            : in std_logic_vector(3 downto 0);
      TX_MTYIN2            : in std_logic_vector(3 downto 0);
      TX_MTYIN3            : in std_logic_vector(3 downto 0);
      TX_RESET             : in std_ulogic;
      TX_SERDES_REFCLK     : in std_ulogic;
      TX_SERDES_REFCLK_RESET : in std_ulogic;
      TX_SOPIN0            : in std_ulogic;
      TX_SOPIN1            : in std_ulogic;
      TX_SOPIN2            : in std_ulogic;
      TX_SOPIN3            : in std_ulogic;
      GSR                  : in std_ulogic
    );
  end component;
  

  constant MODULE_NAME : string := "ILKNE4";
  
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
  constant BYPASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(BYPASS,40);
  constant CTL_CSSD_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant CTL_CSSD_SNGL_CHAIN_MD_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant CTL_RX_PACKET_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_PACKET_MODE,40);
  constant CTL_TEST_MODE_PIN_CHAR_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TEST_MODE_PIN_CHAR,40);
  constant CTL_TX_DISABLE_SKIPWORD_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TX_DISABLE_SKIPWORD,40);
  constant MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MODE,40);
  constant TEST_MODE_PIN_CHAR_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TEST_MODE_PIN_CHAR,40);

  constant CTL_CSSD_MRKR_INIT_BIN : std_logic_vector(15 downto 0) := X"0000";
  constant CTL_CSSD_ROOT_CLK_DIS_BIN : std_logic_vector(14 downto 0) := "000" & X"000";
  constant CTL_CSSD_ROOT_CLK_SEL_BIN : std_logic_vector(3 downto 0) := X"0";
  constant CTL_CSSD_STOP_COUNT_0_BIN : std_logic_vector(15 downto 0) := X"0FFF";
  constant CTL_CSSD_STOP_COUNT_1_BIN : std_logic_vector(15 downto 0) := X"0000";
  constant CTL_CSSD_STOP_COUNT_2_BIN : std_logic_vector(15 downto 0) := X"0000";
  constant CTL_RX_BURSTMAX_BIN : std_logic_vector(1 downto 0) := CTL_RX_BURSTMAX;
  constant CTL_RX_CHAN_EXT_BIN : std_logic_vector(1 downto 0) := CTL_RX_CHAN_EXT;
  constant CTL_RX_LAST_LANE_BIN : std_logic_vector(3 downto 0) := CTL_RX_LAST_LANE;
  constant CTL_RX_MFRAMELEN_MINUS1_BIN : std_logic_vector(15 downto 0) := CTL_RX_MFRAMELEN_MINUS1;
  constant CTL_RX_RETRANS_MULT_BIN : std_logic_vector(2 downto 0) := CTL_RX_RETRANS_MULT;
  constant CTL_RX_RETRANS_RETRY_BIN : std_logic_vector(3 downto 0) := CTL_RX_RETRANS_RETRY;
  constant CTL_RX_RETRANS_TIMER1_BIN : std_logic_vector(15 downto 0) := CTL_RX_RETRANS_TIMER1;
  constant CTL_RX_RETRANS_TIMER2_BIN : std_logic_vector(15 downto 0) := CTL_RX_RETRANS_TIMER2;
  constant CTL_RX_RETRANS_WDOG_BIN : std_logic_vector(11 downto 0) := CTL_RX_RETRANS_WDOG;
  constant CTL_RX_RETRANS_WRAP_TIMER_BIN : std_logic_vector(7 downto 0) := CTL_RX_RETRANS_WRAP_TIMER;
  constant CTL_TX_BURSTMAX_BIN : std_logic_vector(1 downto 0) := CTL_TX_BURSTMAX;
  constant CTL_TX_BURSTSHORT_BIN : std_logic_vector(2 downto 0) := CTL_TX_BURSTSHORT;
  constant CTL_TX_CHAN_EXT_BIN : std_logic_vector(1 downto 0) := CTL_TX_CHAN_EXT;
  constant CTL_TX_FC_CALLEN_BIN : std_logic_vector(3 downto 0) := CTL_TX_FC_CALLEN;
  constant CTL_TX_LAST_LANE_BIN : std_logic_vector(3 downto 0) := CTL_TX_LAST_LANE;
  constant CTL_TX_MFRAMELEN_MINUS1_BIN : std_logic_vector(15 downto 0) := CTL_TX_MFRAMELEN_MINUS1;
  constant CTL_TX_RETRANS_DEPTH_BIN : std_logic_vector(13 downto 0) := CTL_TX_RETRANS_DEPTH;
  constant CTL_TX_RETRANS_MULT_BIN : std_logic_vector(2 downto 0) := CTL_TX_RETRANS_MULT;
  constant CTL_TX_RETRANS_RAM_BANKS_BIN : std_logic_vector(1 downto 0) := CTL_TX_RETRANS_RAM_BANKS;


-- Parameter encodings and registers

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal CFG_RESET_CSSD_out : std_ulogic;
  signal CSSD_CLK_STOP_DONE_out : std_ulogic;
  signal DRP_DO_out : std_logic_vector(15 downto 0);
  signal DRP_RDY_out : std_ulogic;
  signal GRESTORE_CSSD_out : std_ulogic;
  signal GWE_CSSD_out : std_ulogic;
  signal RX_BYPASS_DATAOUT00_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT01_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT02_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT03_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT04_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT05_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT06_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT07_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT08_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT09_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT10_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_DATAOUT11_out : std_logic_vector(65 downto 0);
  signal RX_BYPASS_ENAOUT_out : std_logic_vector(11 downto 0);
  signal RX_BYPASS_IS_AVAILOUT_out : std_logic_vector(11 downto 0);
  signal RX_BYPASS_IS_BADLYFRAMEDOUT_out : std_logic_vector(11 downto 0);
  signal RX_BYPASS_IS_OVERFLOWOUT_out : std_logic_vector(11 downto 0);
  signal RX_BYPASS_IS_SYNCEDOUT_out : std_logic_vector(11 downto 0);
  signal RX_BYPASS_IS_SYNCWORDOUT_out : std_logic_vector(11 downto 0);
  signal RX_CHANOUT0_out : std_logic_vector(10 downto 0);
  signal RX_CHANOUT1_out : std_logic_vector(10 downto 0);
  signal RX_CHANOUT2_out : std_logic_vector(10 downto 0);
  signal RX_CHANOUT3_out : std_logic_vector(10 downto 0);
  signal RX_DATAOUT0_out : std_logic_vector(127 downto 0);
  signal RX_DATAOUT1_out : std_logic_vector(127 downto 0);
  signal RX_DATAOUT2_out : std_logic_vector(127 downto 0);
  signal RX_DATAOUT3_out : std_logic_vector(127 downto 0);
  signal RX_ENAOUT0_out : std_ulogic;
  signal RX_ENAOUT1_out : std_ulogic;
  signal RX_ENAOUT2_out : std_ulogic;
  signal RX_ENAOUT3_out : std_ulogic;
  signal RX_EOPOUT0_out : std_ulogic;
  signal RX_EOPOUT1_out : std_ulogic;
  signal RX_EOPOUT2_out : std_ulogic;
  signal RX_EOPOUT3_out : std_ulogic;
  signal RX_ERROUT0_out : std_ulogic;
  signal RX_ERROUT1_out : std_ulogic;
  signal RX_ERROUT2_out : std_ulogic;
  signal RX_ERROUT3_out : std_ulogic;
  signal RX_MTYOUT0_out : std_logic_vector(3 downto 0);
  signal RX_MTYOUT1_out : std_logic_vector(3 downto 0);
  signal RX_MTYOUT2_out : std_logic_vector(3 downto 0);
  signal RX_MTYOUT3_out : std_logic_vector(3 downto 0);
  signal RX_OVFOUT_out : std_ulogic;
  signal RX_SOPOUT0_out : std_ulogic;
  signal RX_SOPOUT1_out : std_ulogic;
  signal RX_SOPOUT2_out : std_ulogic;
  signal RX_SOPOUT3_out : std_ulogic;
  signal SCAN_OUT_out : std_logic_vector(264 downto 0);
  signal STAT_RX_ALIGNED_ERR_out : std_ulogic;
  signal STAT_RX_ALIGNED_out : std_ulogic;
  signal STAT_RX_BAD_TYPE_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_BURSTMAX_ERR_out : std_ulogic;
  signal STAT_RX_BURST_ERR_out : std_ulogic;
  signal STAT_RX_CRC24_ERR_out : std_ulogic;
  signal STAT_RX_CRC32_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_CRC32_VALID_out : std_logic_vector(11 downto 0);
  signal STAT_RX_DESCRAM_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_DIAGWORD_INTFSTAT_out : std_logic_vector(11 downto 0);
  signal STAT_RX_DIAGWORD_LANESTAT_out : std_logic_vector(11 downto 0);
  signal STAT_RX_FC_STAT_out : std_logic_vector(255 downto 0);
  signal STAT_RX_FRAMING_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_MEOP_ERR_out : std_ulogic;
  signal STAT_RX_MF_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_MF_LEN_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_MF_REPEAT_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_MISALIGNED_out : std_ulogic;
  signal STAT_RX_MSOP_ERR_out : std_ulogic;
  signal STAT_RX_MUBITS_UPDATED_out : std_ulogic;
  signal STAT_RX_MUBITS_out : std_logic_vector(7 downto 0);
  signal STAT_RX_OVERFLOW_ERR_out : std_ulogic;
  signal STAT_RX_RETRANS_CRC24_ERR_out : std_ulogic;
  signal STAT_RX_RETRANS_DISC_out : std_ulogic;
  signal STAT_RX_RETRANS_LATENCY_out : std_logic_vector(15 downto 0);
  signal STAT_RX_RETRANS_REQ_out : std_ulogic;
  signal STAT_RX_RETRANS_RETRY_ERR_out : std_ulogic;
  signal STAT_RX_RETRANS_SEQ_UPDATED_out : std_ulogic;
  signal STAT_RX_RETRANS_SEQ_out : std_logic_vector(7 downto 0);
  signal STAT_RX_RETRANS_STATE_out : std_logic_vector(2 downto 0);
  signal STAT_RX_RETRANS_SUBSEQ_out : std_logic_vector(4 downto 0);
  signal STAT_RX_RETRANS_WDOG_ERR_out : std_ulogic;
  signal STAT_RX_RETRANS_WRAP_ERR_out : std_ulogic;
  signal STAT_RX_SYNCED_ERR_out : std_logic_vector(11 downto 0);
  signal STAT_RX_SYNCED_out : std_logic_vector(11 downto 0);
  signal STAT_RX_WORD_SYNC_out : std_logic_vector(11 downto 0);
  signal STAT_TX_BURST_ERR_out : std_ulogic;
  signal STAT_TX_ERRINJ_BITERR_DONE_out : std_ulogic;
  signal STAT_TX_OVERFLOW_ERR_out : std_ulogic;
  signal STAT_TX_RETRANS_BURST_ERR_out : std_ulogic;
  signal STAT_TX_RETRANS_BUSY_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_PERROUT_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_RADDR_out : std_logic_vector(8 downto 0);
  signal STAT_TX_RETRANS_RAM_RD_B0_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_RD_B1_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_RD_B2_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_RD_B3_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_RSEL_out : std_logic_vector(1 downto 0);
  signal STAT_TX_RETRANS_RAM_WADDR_out : std_logic_vector(8 downto 0);
  signal STAT_TX_RETRANS_RAM_WDATA_out : std_logic_vector(643 downto 0);
  signal STAT_TX_RETRANS_RAM_WE_B0_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_WE_B1_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_WE_B2_out : std_ulogic;
  signal STAT_TX_RETRANS_RAM_WE_B3_out : std_ulogic;
  signal STAT_TX_UNDERFLOW_ERR_out : std_ulogic;
  signal TX_OVFOUT_out : std_ulogic;
  signal TX_RDYOUT_out : std_ulogic;
  signal TX_SERDES_DATA00_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA01_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA02_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA03_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA04_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA05_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA06_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA07_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA08_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA09_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA10_out : std_logic_vector(63 downto 0);
  signal TX_SERDES_DATA11_out : std_logic_vector(63 downto 0);
  
  signal CORE_CLK_in : std_ulogic;
  signal CSSD_CLK_STOP_EVENT_in : std_ulogic;
  signal CSSD_RESETN_in : std_ulogic;
  signal CTL_RX_FORCE_RESYNC_in : std_ulogic;
  signal CTL_RX_RETRANS_ACK_in : std_ulogic;
  signal CTL_RX_RETRANS_ENABLE_in : std_ulogic;
  signal CTL_RX_RETRANS_ERRIN_in : std_ulogic;
  signal CTL_RX_RETRANS_FORCE_REQ_in : std_ulogic;
  signal CTL_RX_RETRANS_RESET_MODE_in : std_ulogic;
  signal CTL_RX_RETRANS_RESET_in : std_ulogic;
  signal CTL_TX_DIAGWORD_INTFSTAT_in : std_ulogic;
  signal CTL_TX_DIAGWORD_LANESTAT_in : std_logic_vector(11 downto 0);
  signal CTL_TX_ENABLE_in : std_ulogic;
  signal CTL_TX_ERRINJ_BITERR_GO_in : std_ulogic;
  signal CTL_TX_ERRINJ_BITERR_LANE_in : std_logic_vector(3 downto 0);
  signal CTL_TX_FC_STAT_in : std_logic_vector(255 downto 0);
  signal CTL_TX_MUBITS_in : std_logic_vector(7 downto 0);
  signal CTL_TX_RETRANS_ENABLE_in : std_ulogic;
  signal CTL_TX_RETRANS_RAM_PERRIN_in : std_ulogic;
  signal CTL_TX_RETRANS_RAM_RDATA_in : std_logic_vector(643 downto 0);
  signal CTL_TX_RETRANS_REQ_VALID_in : std_ulogic;
  signal CTL_TX_RETRANS_REQ_in : std_ulogic;
  signal CTL_TX_RLIM_DELTA_in : std_logic_vector(11 downto 0);
  signal CTL_TX_RLIM_ENABLE_in : std_ulogic;
  signal CTL_TX_RLIM_INTV_in : std_logic_vector(7 downto 0);
  signal CTL_TX_RLIM_MAX_in : std_logic_vector(11 downto 0);
  signal DRP_ADDR_in : std_logic_vector(9 downto 0);
  signal DRP_CLK_in : std_ulogic;
  signal DRP_DI_in : std_logic_vector(15 downto 0);
  signal DRP_EN_in : std_ulogic;
  signal DRP_WE_in : std_ulogic;
  signal LBUS_CLK_in : std_ulogic;
  signal RX_BYPASS_FORCE_REALIGNIN_in : std_ulogic;
  signal RX_BYPASS_RDIN_in : std_ulogic;
  signal RX_RESET_in : std_ulogic;
  signal RX_SERDES_CLK_in : std_logic_vector(11 downto 0);
  signal RX_SERDES_DATA00_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA01_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA02_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA03_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA04_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA05_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA06_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA07_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA08_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA09_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA10_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_DATA11_in : std_logic_vector(63 downto 0);
  signal RX_SERDES_RESET_in : std_logic_vector(11 downto 0);
  signal SCAN_CLK_in : std_ulogic;
  signal SCAN_EN_N_in : std_ulogic;
  signal SCAN_IN_in : std_logic_vector(264 downto 0);
  signal TEST_MODE_N_in : std_ulogic;
  signal TEST_RESET_in : std_ulogic;
  signal TX_BCTLIN0_in : std_ulogic;
  signal TX_BCTLIN1_in : std_ulogic;
  signal TX_BCTLIN2_in : std_ulogic;
  signal TX_BCTLIN3_in : std_ulogic;
  signal TX_BYPASS_CTRLIN_in : std_logic_vector(11 downto 0);
  signal TX_BYPASS_DATAIN00_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN01_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN02_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN03_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN04_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN05_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN06_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN07_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN08_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN09_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN10_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_DATAIN11_in : std_logic_vector(63 downto 0);
  signal TX_BYPASS_ENAIN_in : std_ulogic;
  signal TX_BYPASS_GEARBOX_SEQIN_in : std_logic_vector(7 downto 0);
  signal TX_BYPASS_MFRAMER_STATEIN_in : std_logic_vector(3 downto 0);
  signal TX_CHANIN0_in : std_logic_vector(10 downto 0);
  signal TX_CHANIN1_in : std_logic_vector(10 downto 0);
  signal TX_CHANIN2_in : std_logic_vector(10 downto 0);
  signal TX_CHANIN3_in : std_logic_vector(10 downto 0);
  signal TX_DATAIN0_in : std_logic_vector(127 downto 0);
  signal TX_DATAIN1_in : std_logic_vector(127 downto 0);
  signal TX_DATAIN2_in : std_logic_vector(127 downto 0);
  signal TX_DATAIN3_in : std_logic_vector(127 downto 0);
  signal TX_ENAIN0_in : std_ulogic;
  signal TX_ENAIN1_in : std_ulogic;
  signal TX_ENAIN2_in : std_ulogic;
  signal TX_ENAIN3_in : std_ulogic;
  signal TX_EOPIN0_in : std_ulogic;
  signal TX_EOPIN1_in : std_ulogic;
  signal TX_EOPIN2_in : std_ulogic;
  signal TX_EOPIN3_in : std_ulogic;
  signal TX_ERRIN0_in : std_ulogic;
  signal TX_ERRIN1_in : std_ulogic;
  signal TX_ERRIN2_in : std_ulogic;
  signal TX_ERRIN3_in : std_ulogic;
  signal TX_MTYIN0_in : std_logic_vector(3 downto 0);
  signal TX_MTYIN1_in : std_logic_vector(3 downto 0);
  signal TX_MTYIN2_in : std_logic_vector(3 downto 0);
  signal TX_MTYIN3_in : std_logic_vector(3 downto 0);
  signal TX_RESET_in : std_ulogic;
  signal TX_SERDES_REFCLK_RESET_in : std_ulogic;
  signal TX_SERDES_REFCLK_in : std_ulogic;
  signal TX_SOPIN0_in : std_ulogic;
  signal TX_SOPIN1_in : std_ulogic;
  signal TX_SOPIN2_in : std_ulogic;
  signal TX_SOPIN3_in : std_ulogic;
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  DRP_DO <= DRP_DO_out;
  DRP_RDY <= DRP_RDY_out;
  RX_BYPASS_DATAOUT00 <= RX_BYPASS_DATAOUT00_out;
  RX_BYPASS_DATAOUT01 <= RX_BYPASS_DATAOUT01_out;
  RX_BYPASS_DATAOUT02 <= RX_BYPASS_DATAOUT02_out;
  RX_BYPASS_DATAOUT03 <= RX_BYPASS_DATAOUT03_out;
  RX_BYPASS_DATAOUT04 <= RX_BYPASS_DATAOUT04_out;
  RX_BYPASS_DATAOUT05 <= RX_BYPASS_DATAOUT05_out;
  RX_BYPASS_DATAOUT06 <= RX_BYPASS_DATAOUT06_out;
  RX_BYPASS_DATAOUT07 <= RX_BYPASS_DATAOUT07_out;
  RX_BYPASS_DATAOUT08 <= RX_BYPASS_DATAOUT08_out;
  RX_BYPASS_DATAOUT09 <= RX_BYPASS_DATAOUT09_out;
  RX_BYPASS_DATAOUT10 <= RX_BYPASS_DATAOUT10_out;
  RX_BYPASS_DATAOUT11 <= RX_BYPASS_DATAOUT11_out;
  RX_BYPASS_ENAOUT <= RX_BYPASS_ENAOUT_out;
  RX_BYPASS_IS_AVAILOUT <= RX_BYPASS_IS_AVAILOUT_out;
  RX_BYPASS_IS_BADLYFRAMEDOUT <= RX_BYPASS_IS_BADLYFRAMEDOUT_out;
  RX_BYPASS_IS_OVERFLOWOUT <= RX_BYPASS_IS_OVERFLOWOUT_out;
  RX_BYPASS_IS_SYNCEDOUT <= RX_BYPASS_IS_SYNCEDOUT_out;
  RX_BYPASS_IS_SYNCWORDOUT <= RX_BYPASS_IS_SYNCWORDOUT_out;
  RX_CHANOUT0 <= RX_CHANOUT0_out;
  RX_CHANOUT1 <= RX_CHANOUT1_out;
  RX_CHANOUT2 <= RX_CHANOUT2_out;
  RX_CHANOUT3 <= RX_CHANOUT3_out;
  RX_DATAOUT0 <= RX_DATAOUT0_out;
  RX_DATAOUT1 <= RX_DATAOUT1_out;
  RX_DATAOUT2 <= RX_DATAOUT2_out;
  RX_DATAOUT3 <= RX_DATAOUT3_out;
  RX_ENAOUT0 <= RX_ENAOUT0_out;
  RX_ENAOUT1 <= RX_ENAOUT1_out;
  RX_ENAOUT2 <= RX_ENAOUT2_out;
  RX_ENAOUT3 <= RX_ENAOUT3_out;
  RX_EOPOUT0 <= RX_EOPOUT0_out;
  RX_EOPOUT1 <= RX_EOPOUT1_out;
  RX_EOPOUT2 <= RX_EOPOUT2_out;
  RX_EOPOUT3 <= RX_EOPOUT3_out;
  RX_ERROUT0 <= RX_ERROUT0_out;
  RX_ERROUT1 <= RX_ERROUT1_out;
  RX_ERROUT2 <= RX_ERROUT2_out;
  RX_ERROUT3 <= RX_ERROUT3_out;
  RX_MTYOUT0 <= RX_MTYOUT0_out;
  RX_MTYOUT1 <= RX_MTYOUT1_out;
  RX_MTYOUT2 <= RX_MTYOUT2_out;
  RX_MTYOUT3 <= RX_MTYOUT3_out;
  RX_OVFOUT <= RX_OVFOUT_out;
  RX_SOPOUT0 <= RX_SOPOUT0_out;
  RX_SOPOUT1 <= RX_SOPOUT1_out;
  RX_SOPOUT2 <= RX_SOPOUT2_out;
  RX_SOPOUT3 <= RX_SOPOUT3_out;
  STAT_RX_ALIGNED <= STAT_RX_ALIGNED_out;
  STAT_RX_ALIGNED_ERR <= STAT_RX_ALIGNED_ERR_out;
  STAT_RX_BAD_TYPE_ERR <= STAT_RX_BAD_TYPE_ERR_out;
  STAT_RX_BURSTMAX_ERR <= STAT_RX_BURSTMAX_ERR_out;
  STAT_RX_BURST_ERR <= STAT_RX_BURST_ERR_out;
  STAT_RX_CRC24_ERR <= STAT_RX_CRC24_ERR_out;
  STAT_RX_CRC32_ERR <= STAT_RX_CRC32_ERR_out;
  STAT_RX_CRC32_VALID <= STAT_RX_CRC32_VALID_out;
  STAT_RX_DESCRAM_ERR <= STAT_RX_DESCRAM_ERR_out;
  STAT_RX_DIAGWORD_INTFSTAT <= STAT_RX_DIAGWORD_INTFSTAT_out;
  STAT_RX_DIAGWORD_LANESTAT <= STAT_RX_DIAGWORD_LANESTAT_out;
  STAT_RX_FC_STAT <= STAT_RX_FC_STAT_out;
  STAT_RX_FRAMING_ERR <= STAT_RX_FRAMING_ERR_out;
  STAT_RX_MEOP_ERR <= STAT_RX_MEOP_ERR_out;
  STAT_RX_MF_ERR <= STAT_RX_MF_ERR_out;
  STAT_RX_MF_LEN_ERR <= STAT_RX_MF_LEN_ERR_out;
  STAT_RX_MF_REPEAT_ERR <= STAT_RX_MF_REPEAT_ERR_out;
  STAT_RX_MISALIGNED <= STAT_RX_MISALIGNED_out;
  STAT_RX_MSOP_ERR <= STAT_RX_MSOP_ERR_out;
  STAT_RX_MUBITS <= STAT_RX_MUBITS_out;
  STAT_RX_MUBITS_UPDATED <= STAT_RX_MUBITS_UPDATED_out;
  STAT_RX_OVERFLOW_ERR <= STAT_RX_OVERFLOW_ERR_out;
  STAT_RX_RETRANS_CRC24_ERR <= STAT_RX_RETRANS_CRC24_ERR_out;
  STAT_RX_RETRANS_DISC <= STAT_RX_RETRANS_DISC_out;
  STAT_RX_RETRANS_LATENCY <= STAT_RX_RETRANS_LATENCY_out;
  STAT_RX_RETRANS_REQ <= STAT_RX_RETRANS_REQ_out;
  STAT_RX_RETRANS_RETRY_ERR <= STAT_RX_RETRANS_RETRY_ERR_out;
  STAT_RX_RETRANS_SEQ <= STAT_RX_RETRANS_SEQ_out;
  STAT_RX_RETRANS_SEQ_UPDATED <= STAT_RX_RETRANS_SEQ_UPDATED_out;
  STAT_RX_RETRANS_STATE <= STAT_RX_RETRANS_STATE_out;
  STAT_RX_RETRANS_SUBSEQ <= STAT_RX_RETRANS_SUBSEQ_out;
  STAT_RX_RETRANS_WDOG_ERR <= STAT_RX_RETRANS_WDOG_ERR_out;
  STAT_RX_RETRANS_WRAP_ERR <= STAT_RX_RETRANS_WRAP_ERR_out;
  STAT_RX_SYNCED <= STAT_RX_SYNCED_out;
  STAT_RX_SYNCED_ERR <= STAT_RX_SYNCED_ERR_out;
  STAT_RX_WORD_SYNC <= STAT_RX_WORD_SYNC_out;
  STAT_TX_BURST_ERR <= STAT_TX_BURST_ERR_out;
  STAT_TX_ERRINJ_BITERR_DONE <= STAT_TX_ERRINJ_BITERR_DONE_out;
  STAT_TX_OVERFLOW_ERR <= STAT_TX_OVERFLOW_ERR_out;
  STAT_TX_RETRANS_BURST_ERR <= STAT_TX_RETRANS_BURST_ERR_out;
  STAT_TX_RETRANS_BUSY <= STAT_TX_RETRANS_BUSY_out;
  STAT_TX_RETRANS_RAM_PERROUT <= STAT_TX_RETRANS_RAM_PERROUT_out;
  STAT_TX_RETRANS_RAM_RADDR <= STAT_TX_RETRANS_RAM_RADDR_out;
  STAT_TX_RETRANS_RAM_RD_B0 <= STAT_TX_RETRANS_RAM_RD_B0_out;
  STAT_TX_RETRANS_RAM_RD_B1 <= STAT_TX_RETRANS_RAM_RD_B1_out;
  STAT_TX_RETRANS_RAM_RD_B2 <= STAT_TX_RETRANS_RAM_RD_B2_out;
  STAT_TX_RETRANS_RAM_RD_B3 <= STAT_TX_RETRANS_RAM_RD_B3_out;
  STAT_TX_RETRANS_RAM_RSEL <= STAT_TX_RETRANS_RAM_RSEL_out;
  STAT_TX_RETRANS_RAM_WADDR <= STAT_TX_RETRANS_RAM_WADDR_out;
  STAT_TX_RETRANS_RAM_WDATA <= STAT_TX_RETRANS_RAM_WDATA_out;
  STAT_TX_RETRANS_RAM_WE_B0 <= STAT_TX_RETRANS_RAM_WE_B0_out;
  STAT_TX_RETRANS_RAM_WE_B1 <= STAT_TX_RETRANS_RAM_WE_B1_out;
  STAT_TX_RETRANS_RAM_WE_B2 <= STAT_TX_RETRANS_RAM_WE_B2_out;
  STAT_TX_RETRANS_RAM_WE_B3 <= STAT_TX_RETRANS_RAM_WE_B3_out;
  STAT_TX_UNDERFLOW_ERR <= STAT_TX_UNDERFLOW_ERR_out;
  TX_OVFOUT <= TX_OVFOUT_out;
  TX_RDYOUT <= TX_RDYOUT_out;
  TX_SERDES_DATA00 <= TX_SERDES_DATA00_out;
  TX_SERDES_DATA01 <= TX_SERDES_DATA01_out;
  TX_SERDES_DATA02 <= TX_SERDES_DATA02_out;
  TX_SERDES_DATA03 <= TX_SERDES_DATA03_out;
  TX_SERDES_DATA04 <= TX_SERDES_DATA04_out;
  TX_SERDES_DATA05 <= TX_SERDES_DATA05_out;
  TX_SERDES_DATA06 <= TX_SERDES_DATA06_out;
  TX_SERDES_DATA07 <= TX_SERDES_DATA07_out;
  TX_SERDES_DATA08 <= TX_SERDES_DATA08_out;
  TX_SERDES_DATA09 <= TX_SERDES_DATA09_out;
  TX_SERDES_DATA10 <= TX_SERDES_DATA10_out;
  TX_SERDES_DATA11 <= TX_SERDES_DATA11_out;
  
  CORE_CLK_in <= CORE_CLK;
  CTL_RX_FORCE_RESYNC_in <= CTL_RX_FORCE_RESYNC;
  CTL_RX_RETRANS_ACK_in <= CTL_RX_RETRANS_ACK;
  CTL_RX_RETRANS_ENABLE_in <= CTL_RX_RETRANS_ENABLE;
  CTL_RX_RETRANS_ERRIN_in <= CTL_RX_RETRANS_ERRIN;
  CTL_RX_RETRANS_FORCE_REQ_in <= CTL_RX_RETRANS_FORCE_REQ;
  CTL_RX_RETRANS_RESET_MODE_in <= CTL_RX_RETRANS_RESET_MODE;
  CTL_RX_RETRANS_RESET_in <= CTL_RX_RETRANS_RESET;
  CTL_TX_DIAGWORD_INTFSTAT_in <= CTL_TX_DIAGWORD_INTFSTAT;
  CTL_TX_DIAGWORD_LANESTAT_in <= CTL_TX_DIAGWORD_LANESTAT;
  CTL_TX_ENABLE_in <= CTL_TX_ENABLE;
  CTL_TX_ERRINJ_BITERR_GO_in <= CTL_TX_ERRINJ_BITERR_GO;
  CTL_TX_ERRINJ_BITERR_LANE_in <= CTL_TX_ERRINJ_BITERR_LANE;
  CTL_TX_FC_STAT_in <= CTL_TX_FC_STAT;
  CTL_TX_MUBITS_in <= CTL_TX_MUBITS;
  CTL_TX_RETRANS_ENABLE_in <= CTL_TX_RETRANS_ENABLE;
  CTL_TX_RETRANS_RAM_PERRIN_in <= CTL_TX_RETRANS_RAM_PERRIN;
  CTL_TX_RETRANS_RAM_RDATA_in <= CTL_TX_RETRANS_RAM_RDATA;
  CTL_TX_RETRANS_REQ_VALID_in <= CTL_TX_RETRANS_REQ_VALID;
  CTL_TX_RETRANS_REQ_in <= CTL_TX_RETRANS_REQ;
  CTL_TX_RLIM_DELTA_in <= CTL_TX_RLIM_DELTA;
  CTL_TX_RLIM_ENABLE_in <= CTL_TX_RLIM_ENABLE;
  CTL_TX_RLIM_INTV_in <= CTL_TX_RLIM_INTV;
  CTL_TX_RLIM_MAX_in <= CTL_TX_RLIM_MAX;
  DRP_ADDR_in <= DRP_ADDR;
  DRP_CLK_in <= DRP_CLK;
  DRP_DI_in <= DRP_DI;
  DRP_EN_in <= DRP_EN;
  DRP_WE_in <= DRP_WE;
  LBUS_CLK_in <= LBUS_CLK;
  RX_BYPASS_FORCE_REALIGNIN_in <= RX_BYPASS_FORCE_REALIGNIN;
  RX_BYPASS_RDIN_in <= RX_BYPASS_RDIN;
  RX_RESET_in <= RX_RESET;
  RX_SERDES_CLK_in <= RX_SERDES_CLK;
  RX_SERDES_DATA00_in <= RX_SERDES_DATA00;
  RX_SERDES_DATA01_in <= RX_SERDES_DATA01;
  RX_SERDES_DATA02_in <= RX_SERDES_DATA02;
  RX_SERDES_DATA03_in <= RX_SERDES_DATA03;
  RX_SERDES_DATA04_in <= RX_SERDES_DATA04;
  RX_SERDES_DATA05_in <= RX_SERDES_DATA05;
  RX_SERDES_DATA06_in <= RX_SERDES_DATA06;
  RX_SERDES_DATA07_in <= RX_SERDES_DATA07;
  RX_SERDES_DATA08_in <= RX_SERDES_DATA08;
  RX_SERDES_DATA09_in <= RX_SERDES_DATA09;
  RX_SERDES_DATA10_in <= RX_SERDES_DATA10;
  RX_SERDES_DATA11_in <= RX_SERDES_DATA11;
  RX_SERDES_RESET_in <= RX_SERDES_RESET;
  TX_BCTLIN0_in <= TX_BCTLIN0;
  TX_BCTLIN1_in <= TX_BCTLIN1;
  TX_BCTLIN2_in <= TX_BCTLIN2;
  TX_BCTLIN3_in <= TX_BCTLIN3;
  TX_BYPASS_CTRLIN_in <= TX_BYPASS_CTRLIN;
  TX_BYPASS_DATAIN00_in <= TX_BYPASS_DATAIN00;
  TX_BYPASS_DATAIN01_in <= TX_BYPASS_DATAIN01;
  TX_BYPASS_DATAIN02_in <= TX_BYPASS_DATAIN02;
  TX_BYPASS_DATAIN03_in <= TX_BYPASS_DATAIN03;
  TX_BYPASS_DATAIN04_in <= TX_BYPASS_DATAIN04;
  TX_BYPASS_DATAIN05_in <= TX_BYPASS_DATAIN05;
  TX_BYPASS_DATAIN06_in <= TX_BYPASS_DATAIN06;
  TX_BYPASS_DATAIN07_in <= TX_BYPASS_DATAIN07;
  TX_BYPASS_DATAIN08_in <= TX_BYPASS_DATAIN08;
  TX_BYPASS_DATAIN09_in <= TX_BYPASS_DATAIN09;
  TX_BYPASS_DATAIN10_in <= TX_BYPASS_DATAIN10;
  TX_BYPASS_DATAIN11_in <= TX_BYPASS_DATAIN11;
  TX_BYPASS_ENAIN_in <= TX_BYPASS_ENAIN;
  TX_BYPASS_GEARBOX_SEQIN_in <= TX_BYPASS_GEARBOX_SEQIN;
  TX_BYPASS_MFRAMER_STATEIN_in <= TX_BYPASS_MFRAMER_STATEIN;
  TX_CHANIN0_in <= TX_CHANIN0;
  TX_CHANIN1_in <= TX_CHANIN1;
  TX_CHANIN2_in <= TX_CHANIN2;
  TX_CHANIN3_in <= TX_CHANIN3;
  TX_DATAIN0_in <= TX_DATAIN0;
  TX_DATAIN1_in <= TX_DATAIN1;
  TX_DATAIN2_in <= TX_DATAIN2;
  TX_DATAIN3_in <= TX_DATAIN3;
  TX_ENAIN0_in <= TX_ENAIN0;
  TX_ENAIN1_in <= TX_ENAIN1;
  TX_ENAIN2_in <= TX_ENAIN2;
  TX_ENAIN3_in <= TX_ENAIN3;
  TX_EOPIN0_in <= TX_EOPIN0;
  TX_EOPIN1_in <= TX_EOPIN1;
  TX_EOPIN2_in <= TX_EOPIN2;
  TX_EOPIN3_in <= TX_EOPIN3;
  TX_ERRIN0_in <= TX_ERRIN0;
  TX_ERRIN1_in <= TX_ERRIN1;
  TX_ERRIN2_in <= TX_ERRIN2;
  TX_ERRIN3_in <= TX_ERRIN3;
  TX_MTYIN0_in <= TX_MTYIN0;
  TX_MTYIN1_in <= TX_MTYIN1;
  TX_MTYIN2_in <= TX_MTYIN2;
  TX_MTYIN3_in <= TX_MTYIN3;
  TX_RESET_in <= TX_RESET;
  TX_SERDES_REFCLK_RESET_in <= TX_SERDES_REFCLK_RESET;
  TX_SERDES_REFCLK_in <= TX_SERDES_REFCLK;
  TX_SOPIN0_in <= TX_SOPIN0;
  TX_SOPIN1_in <= TX_SOPIN1;
  TX_SOPIN2_in <= TX_SOPIN2;
  TX_SOPIN3_in <= TX_SOPIN3;
  
  CSSD_CLK_STOP_EVENT_in <= '1'; -- tie off
  CSSD_RESETN_in <= '1'; -- tie off
  SCAN_CLK_in <= '1'; -- tie off
  SCAN_EN_N_in <= '1'; -- tie off
  SCAN_IN_in <= "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
  TEST_MODE_N_in <= '1'; -- tie off
  TEST_RESET_in <= '1'; -- tie off

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- BYPASS check
      if((xil_attr_test) or
         ((BYPASS /= "FALSE") and 
          (BYPASS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] BYPASS attribute is set to """));
        Write ( Message, string'(BYPASS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_LAST_LANE check
        if((xil_attr_test) or
           ((CTL_RX_LAST_LANE < X"0") or (CTL_RX_LAST_LANE > X"B"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-112] CTL_RX_LAST_LANE attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_LAST_LANE));
          Write ( Message, string'(". Legal values for this attribute are 0 to B. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_MFRAMELEN_MINUS1 check
        if((xil_attr_test) or
           ((CTL_RX_MFRAMELEN_MINUS1 < X"00FF") or (CTL_RX_MFRAMELEN_MINUS1 > X"1FFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-113] CTL_RX_MFRAMELEN_MINUS1 attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_MFRAMELEN_MINUS1));
          Write ( Message, string'(". Legal values for this attribute are 00FF to 1FFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_PACKET_MODE check
      if((xil_attr_test) or
         ((CTL_RX_PACKET_MODE /= "FALSE") and 
          (CTL_RX_PACKET_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-114] CTL_RX_PACKET_MODE attribute is set to """));
        Write ( Message, string'(CTL_RX_PACKET_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_RETRANS_MULT check
        if((xil_attr_test) or
           ((CTL_RX_RETRANS_MULT < "000") or (CTL_RX_RETRANS_MULT > "101"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-115] CTL_RX_RETRANS_MULT attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_RETRANS_MULT));
          Write ( Message, string'(". Legal values for this attribute are 0 to 5. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TEST_MODE_PIN_CHAR check
      if((xil_attr_test) or
         ((CTL_TEST_MODE_PIN_CHAR /= "FALSE") and 
          (CTL_TEST_MODE_PIN_CHAR /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-121] CTL_TEST_MODE_PIN_CHAR attribute is set to """));
        Write ( Message, string'(CTL_TEST_MODE_PIN_CHAR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_BURSTSHORT check
        if((xil_attr_test) or
           ((CTL_TX_BURSTSHORT < "001") or (CTL_TX_BURSTSHORT > "111"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-123] CTL_TX_BURSTSHORT attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_BURSTSHORT));
          Write ( Message, string'(". Legal values for this attribute are 1 to 7. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TX_DISABLE_SKIPWORD check
      if((xil_attr_test) or
         ((CTL_TX_DISABLE_SKIPWORD /= "FALSE") and 
          (CTL_TX_DISABLE_SKIPWORD /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-125] CTL_TX_DISABLE_SKIPWORD attribute is set to """));
        Write ( Message, string'(CTL_TX_DISABLE_SKIPWORD));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_LAST_LANE check
        if((xil_attr_test) or
           ((CTL_TX_LAST_LANE < X"0") or (CTL_TX_LAST_LANE > X"B"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-127] CTL_TX_LAST_LANE attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_LAST_LANE));
          Write ( Message, string'(". Legal values for this attribute are 0 to B. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TX_MFRAMELEN_MINUS1 check
        if((xil_attr_test) or
           ((CTL_TX_MFRAMELEN_MINUS1 < X"00FF") or (CTL_TX_MFRAMELEN_MINUS1 > X"1FFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-128] CTL_TX_MFRAMELEN_MINUS1 attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_MFRAMELEN_MINUS1));
          Write ( Message, string'(". Legal values for this attribute are 00FF to 1FFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TX_RETRANS_DEPTH check
        if((xil_attr_test) or
           ((CTL_TX_RETRANS_DEPTH < "00" & X"015") or (CTL_TX_RETRANS_DEPTH > "00" & X"800"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-129] CTL_TX_RETRANS_DEPTH attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_RETRANS_DEPTH));
          Write ( Message, string'(". Legal values for this attribute are 0015 to 0800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TX_RETRANS_MULT check
        if((xil_attr_test) or
           ((CTL_TX_RETRANS_MULT < "000") or (CTL_TX_RETRANS_MULT > "101"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-130] CTL_TX_RETRANS_MULT attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_RETRANS_MULT));
          Write ( Message, string'(". Legal values for this attribute are 0 to 5. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(ILKNE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- MODE check
      if((xil_attr_test) or
         ((MODE /= "TRUE") and 
          (MODE /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-132] MODE attribute is set to """));
        Write ( Message, string'(MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-133] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TEST_MODE_PIN_CHAR check
      if((xil_attr_test) or
         ((TEST_MODE_PIN_CHAR /= "FALSE") and 
          (TEST_MODE_PIN_CHAR /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-134] TEST_MODE_PIN_CHAR attribute is set to """));
        Write ( Message, string'(TEST_MODE_PIN_CHAR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ILKNE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-116] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ILKNE4_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    
    SIP_ILKNE4_INST : SIP_ILKNE4
      port map (
        BYPASS               => BYPASS_BIN,
        CTL_CSSD_EN          => CTL_CSSD_EN_BIN,
        CTL_CSSD_MRKR_INIT   => CTL_CSSD_MRKR_INIT_BIN,
        CTL_CSSD_ROOT_CLK_DIS => CTL_CSSD_ROOT_CLK_DIS_BIN,
        CTL_CSSD_ROOT_CLK_SEL => CTL_CSSD_ROOT_CLK_SEL_BIN,
        CTL_CSSD_SNGL_CHAIN_MD => CTL_CSSD_SNGL_CHAIN_MD_BIN,
        CTL_CSSD_STOP_COUNT_0 => CTL_CSSD_STOP_COUNT_0_BIN,
        CTL_CSSD_STOP_COUNT_1 => CTL_CSSD_STOP_COUNT_1_BIN,
        CTL_CSSD_STOP_COUNT_2 => CTL_CSSD_STOP_COUNT_2_BIN,
        CTL_RX_BURSTMAX      => CTL_RX_BURSTMAX_BIN,
        CTL_RX_CHAN_EXT      => CTL_RX_CHAN_EXT_BIN,
        CTL_RX_LAST_LANE     => CTL_RX_LAST_LANE_BIN,
        CTL_RX_MFRAMELEN_MINUS1 => CTL_RX_MFRAMELEN_MINUS1_BIN,
        CTL_RX_PACKET_MODE   => CTL_RX_PACKET_MODE_BIN,
        CTL_RX_RETRANS_MULT  => CTL_RX_RETRANS_MULT_BIN,
        CTL_RX_RETRANS_RETRY => CTL_RX_RETRANS_RETRY_BIN,
        CTL_RX_RETRANS_TIMER1 => CTL_RX_RETRANS_TIMER1_BIN,
        CTL_RX_RETRANS_TIMER2 => CTL_RX_RETRANS_TIMER2_BIN,
        CTL_RX_RETRANS_WDOG  => CTL_RX_RETRANS_WDOG_BIN,
        CTL_RX_RETRANS_WRAP_TIMER => CTL_RX_RETRANS_WRAP_TIMER_BIN,
        CTL_TEST_MODE_PIN_CHAR => CTL_TEST_MODE_PIN_CHAR_BIN,
        CTL_TX_BURSTMAX      => CTL_TX_BURSTMAX_BIN,
        CTL_TX_BURSTSHORT    => CTL_TX_BURSTSHORT_BIN,
        CTL_TX_CHAN_EXT      => CTL_TX_CHAN_EXT_BIN,
        CTL_TX_DISABLE_SKIPWORD => CTL_TX_DISABLE_SKIPWORD_BIN,
        CTL_TX_FC_CALLEN     => CTL_TX_FC_CALLEN_BIN,
        CTL_TX_LAST_LANE     => CTL_TX_LAST_LANE_BIN,
        CTL_TX_MFRAMELEN_MINUS1 => CTL_TX_MFRAMELEN_MINUS1_BIN,
        CTL_TX_RETRANS_DEPTH => CTL_TX_RETRANS_DEPTH_BIN,
        CTL_TX_RETRANS_MULT  => CTL_TX_RETRANS_MULT_BIN,
        CTL_TX_RETRANS_RAM_BANKS => CTL_TX_RETRANS_RAM_BANKS_BIN,
        MODE                 => MODE_BIN,
        TEST_MODE_PIN_CHAR   => TEST_MODE_PIN_CHAR_BIN,
        CFG_RESET_CSSD       => CFG_RESET_CSSD_out,
        CSSD_CLK_STOP_DONE   => CSSD_CLK_STOP_DONE_out,
        DRP_DO               => DRP_DO_out,
        DRP_RDY              => DRP_RDY_out,
        GRESTORE_CSSD        => GRESTORE_CSSD_out,
        GWE_CSSD             => GWE_CSSD_out,
        RX_BYPASS_DATAOUT00  => RX_BYPASS_DATAOUT00_out,
        RX_BYPASS_DATAOUT01  => RX_BYPASS_DATAOUT01_out,
        RX_BYPASS_DATAOUT02  => RX_BYPASS_DATAOUT02_out,
        RX_BYPASS_DATAOUT03  => RX_BYPASS_DATAOUT03_out,
        RX_BYPASS_DATAOUT04  => RX_BYPASS_DATAOUT04_out,
        RX_BYPASS_DATAOUT05  => RX_BYPASS_DATAOUT05_out,
        RX_BYPASS_DATAOUT06  => RX_BYPASS_DATAOUT06_out,
        RX_BYPASS_DATAOUT07  => RX_BYPASS_DATAOUT07_out,
        RX_BYPASS_DATAOUT08  => RX_BYPASS_DATAOUT08_out,
        RX_BYPASS_DATAOUT09  => RX_BYPASS_DATAOUT09_out,
        RX_BYPASS_DATAOUT10  => RX_BYPASS_DATAOUT10_out,
        RX_BYPASS_DATAOUT11  => RX_BYPASS_DATAOUT11_out,
        RX_BYPASS_ENAOUT     => RX_BYPASS_ENAOUT_out,
        RX_BYPASS_IS_AVAILOUT => RX_BYPASS_IS_AVAILOUT_out,
        RX_BYPASS_IS_BADLYFRAMEDOUT => RX_BYPASS_IS_BADLYFRAMEDOUT_out,
        RX_BYPASS_IS_OVERFLOWOUT => RX_BYPASS_IS_OVERFLOWOUT_out,
        RX_BYPASS_IS_SYNCEDOUT => RX_BYPASS_IS_SYNCEDOUT_out,
        RX_BYPASS_IS_SYNCWORDOUT => RX_BYPASS_IS_SYNCWORDOUT_out,
        RX_CHANOUT0          => RX_CHANOUT0_out,
        RX_CHANOUT1          => RX_CHANOUT1_out,
        RX_CHANOUT2          => RX_CHANOUT2_out,
        RX_CHANOUT3          => RX_CHANOUT3_out,
        RX_DATAOUT0          => RX_DATAOUT0_out,
        RX_DATAOUT1          => RX_DATAOUT1_out,
        RX_DATAOUT2          => RX_DATAOUT2_out,
        RX_DATAOUT3          => RX_DATAOUT3_out,
        RX_ENAOUT0           => RX_ENAOUT0_out,
        RX_ENAOUT1           => RX_ENAOUT1_out,
        RX_ENAOUT2           => RX_ENAOUT2_out,
        RX_ENAOUT3           => RX_ENAOUT3_out,
        RX_EOPOUT0           => RX_EOPOUT0_out,
        RX_EOPOUT1           => RX_EOPOUT1_out,
        RX_EOPOUT2           => RX_EOPOUT2_out,
        RX_EOPOUT3           => RX_EOPOUT3_out,
        RX_ERROUT0           => RX_ERROUT0_out,
        RX_ERROUT1           => RX_ERROUT1_out,
        RX_ERROUT2           => RX_ERROUT2_out,
        RX_ERROUT3           => RX_ERROUT3_out,
        RX_MTYOUT0           => RX_MTYOUT0_out,
        RX_MTYOUT1           => RX_MTYOUT1_out,
        RX_MTYOUT2           => RX_MTYOUT2_out,
        RX_MTYOUT3           => RX_MTYOUT3_out,
        RX_OVFOUT            => RX_OVFOUT_out,
        RX_SOPOUT0           => RX_SOPOUT0_out,
        RX_SOPOUT1           => RX_SOPOUT1_out,
        RX_SOPOUT2           => RX_SOPOUT2_out,
        RX_SOPOUT3           => RX_SOPOUT3_out,
        SCAN_OUT             => SCAN_OUT_out,
        STAT_RX_ALIGNED      => STAT_RX_ALIGNED_out,
        STAT_RX_ALIGNED_ERR  => STAT_RX_ALIGNED_ERR_out,
        STAT_RX_BAD_TYPE_ERR => STAT_RX_BAD_TYPE_ERR_out,
        STAT_RX_BURSTMAX_ERR => STAT_RX_BURSTMAX_ERR_out,
        STAT_RX_BURST_ERR    => STAT_RX_BURST_ERR_out,
        STAT_RX_CRC24_ERR    => STAT_RX_CRC24_ERR_out,
        STAT_RX_CRC32_ERR    => STAT_RX_CRC32_ERR_out,
        STAT_RX_CRC32_VALID  => STAT_RX_CRC32_VALID_out,
        STAT_RX_DESCRAM_ERR  => STAT_RX_DESCRAM_ERR_out,
        STAT_RX_DIAGWORD_INTFSTAT => STAT_RX_DIAGWORD_INTFSTAT_out,
        STAT_RX_DIAGWORD_LANESTAT => STAT_RX_DIAGWORD_LANESTAT_out,
        STAT_RX_FC_STAT      => STAT_RX_FC_STAT_out,
        STAT_RX_FRAMING_ERR  => STAT_RX_FRAMING_ERR_out,
        STAT_RX_MEOP_ERR     => STAT_RX_MEOP_ERR_out,
        STAT_RX_MF_ERR       => STAT_RX_MF_ERR_out,
        STAT_RX_MF_LEN_ERR   => STAT_RX_MF_LEN_ERR_out,
        STAT_RX_MF_REPEAT_ERR => STAT_RX_MF_REPEAT_ERR_out,
        STAT_RX_MISALIGNED   => STAT_RX_MISALIGNED_out,
        STAT_RX_MSOP_ERR     => STAT_RX_MSOP_ERR_out,
        STAT_RX_MUBITS       => STAT_RX_MUBITS_out,
        STAT_RX_MUBITS_UPDATED => STAT_RX_MUBITS_UPDATED_out,
        STAT_RX_OVERFLOW_ERR => STAT_RX_OVERFLOW_ERR_out,
        STAT_RX_RETRANS_CRC24_ERR => STAT_RX_RETRANS_CRC24_ERR_out,
        STAT_RX_RETRANS_DISC => STAT_RX_RETRANS_DISC_out,
        STAT_RX_RETRANS_LATENCY => STAT_RX_RETRANS_LATENCY_out,
        STAT_RX_RETRANS_REQ  => STAT_RX_RETRANS_REQ_out,
        STAT_RX_RETRANS_RETRY_ERR => STAT_RX_RETRANS_RETRY_ERR_out,
        STAT_RX_RETRANS_SEQ  => STAT_RX_RETRANS_SEQ_out,
        STAT_RX_RETRANS_SEQ_UPDATED => STAT_RX_RETRANS_SEQ_UPDATED_out,
        STAT_RX_RETRANS_STATE => STAT_RX_RETRANS_STATE_out,
        STAT_RX_RETRANS_SUBSEQ => STAT_RX_RETRANS_SUBSEQ_out,
        STAT_RX_RETRANS_WDOG_ERR => STAT_RX_RETRANS_WDOG_ERR_out,
        STAT_RX_RETRANS_WRAP_ERR => STAT_RX_RETRANS_WRAP_ERR_out,
        STAT_RX_SYNCED       => STAT_RX_SYNCED_out,
        STAT_RX_SYNCED_ERR   => STAT_RX_SYNCED_ERR_out,
        STAT_RX_WORD_SYNC    => STAT_RX_WORD_SYNC_out,
        STAT_TX_BURST_ERR    => STAT_TX_BURST_ERR_out,
        STAT_TX_ERRINJ_BITERR_DONE => STAT_TX_ERRINJ_BITERR_DONE_out,
        STAT_TX_OVERFLOW_ERR => STAT_TX_OVERFLOW_ERR_out,
        STAT_TX_RETRANS_BURST_ERR => STAT_TX_RETRANS_BURST_ERR_out,
        STAT_TX_RETRANS_BUSY => STAT_TX_RETRANS_BUSY_out,
        STAT_TX_RETRANS_RAM_PERROUT => STAT_TX_RETRANS_RAM_PERROUT_out,
        STAT_TX_RETRANS_RAM_RADDR => STAT_TX_RETRANS_RAM_RADDR_out,
        STAT_TX_RETRANS_RAM_RD_B0 => STAT_TX_RETRANS_RAM_RD_B0_out,
        STAT_TX_RETRANS_RAM_RD_B1 => STAT_TX_RETRANS_RAM_RD_B1_out,
        STAT_TX_RETRANS_RAM_RD_B2 => STAT_TX_RETRANS_RAM_RD_B2_out,
        STAT_TX_RETRANS_RAM_RD_B3 => STAT_TX_RETRANS_RAM_RD_B3_out,
        STAT_TX_RETRANS_RAM_RSEL => STAT_TX_RETRANS_RAM_RSEL_out,
        STAT_TX_RETRANS_RAM_WADDR => STAT_TX_RETRANS_RAM_WADDR_out,
        STAT_TX_RETRANS_RAM_WDATA => STAT_TX_RETRANS_RAM_WDATA_out,
        STAT_TX_RETRANS_RAM_WE_B0 => STAT_TX_RETRANS_RAM_WE_B0_out,
        STAT_TX_RETRANS_RAM_WE_B1 => STAT_TX_RETRANS_RAM_WE_B1_out,
        STAT_TX_RETRANS_RAM_WE_B2 => STAT_TX_RETRANS_RAM_WE_B2_out,
        STAT_TX_RETRANS_RAM_WE_B3 => STAT_TX_RETRANS_RAM_WE_B3_out,
        STAT_TX_UNDERFLOW_ERR => STAT_TX_UNDERFLOW_ERR_out,
        TX_OVFOUT            => TX_OVFOUT_out,
        TX_RDYOUT            => TX_RDYOUT_out,
        TX_SERDES_DATA00     => TX_SERDES_DATA00_out,
        TX_SERDES_DATA01     => TX_SERDES_DATA01_out,
        TX_SERDES_DATA02     => TX_SERDES_DATA02_out,
        TX_SERDES_DATA03     => TX_SERDES_DATA03_out,
        TX_SERDES_DATA04     => TX_SERDES_DATA04_out,
        TX_SERDES_DATA05     => TX_SERDES_DATA05_out,
        TX_SERDES_DATA06     => TX_SERDES_DATA06_out,
        TX_SERDES_DATA07     => TX_SERDES_DATA07_out,
        TX_SERDES_DATA08     => TX_SERDES_DATA08_out,
        TX_SERDES_DATA09     => TX_SERDES_DATA09_out,
        TX_SERDES_DATA10     => TX_SERDES_DATA10_out,
        TX_SERDES_DATA11     => TX_SERDES_DATA11_out,
        CORE_CLK             => CORE_CLK_in,
        CSSD_CLK_STOP_EVENT  => CSSD_CLK_STOP_EVENT_in,
        CSSD_RESETN          => CSSD_RESETN_in,
        CTL_RX_FORCE_RESYNC  => CTL_RX_FORCE_RESYNC_in,
        CTL_RX_RETRANS_ACK   => CTL_RX_RETRANS_ACK_in,
        CTL_RX_RETRANS_ENABLE => CTL_RX_RETRANS_ENABLE_in,
        CTL_RX_RETRANS_ERRIN => CTL_RX_RETRANS_ERRIN_in,
        CTL_RX_RETRANS_FORCE_REQ => CTL_RX_RETRANS_FORCE_REQ_in,
        CTL_RX_RETRANS_RESET => CTL_RX_RETRANS_RESET_in,
        CTL_RX_RETRANS_RESET_MODE => CTL_RX_RETRANS_RESET_MODE_in,
        CTL_TX_DIAGWORD_INTFSTAT => CTL_TX_DIAGWORD_INTFSTAT_in,
        CTL_TX_DIAGWORD_LANESTAT => CTL_TX_DIAGWORD_LANESTAT_in,
        CTL_TX_ENABLE        => CTL_TX_ENABLE_in,
        CTL_TX_ERRINJ_BITERR_GO => CTL_TX_ERRINJ_BITERR_GO_in,
        CTL_TX_ERRINJ_BITERR_LANE => CTL_TX_ERRINJ_BITERR_LANE_in,
        CTL_TX_FC_STAT       => CTL_TX_FC_STAT_in,
        CTL_TX_MUBITS        => CTL_TX_MUBITS_in,
        CTL_TX_RETRANS_ENABLE => CTL_TX_RETRANS_ENABLE_in,
        CTL_TX_RETRANS_RAM_PERRIN => CTL_TX_RETRANS_RAM_PERRIN_in,
        CTL_TX_RETRANS_RAM_RDATA => CTL_TX_RETRANS_RAM_RDATA_in,
        CTL_TX_RETRANS_REQ   => CTL_TX_RETRANS_REQ_in,
        CTL_TX_RETRANS_REQ_VALID => CTL_TX_RETRANS_REQ_VALID_in,
        CTL_TX_RLIM_DELTA    => CTL_TX_RLIM_DELTA_in,
        CTL_TX_RLIM_ENABLE   => CTL_TX_RLIM_ENABLE_in,
        CTL_TX_RLIM_INTV     => CTL_TX_RLIM_INTV_in,
        CTL_TX_RLIM_MAX      => CTL_TX_RLIM_MAX_in,
        DRP_ADDR             => DRP_ADDR_in,
        DRP_CLK              => DRP_CLK_in,
        DRP_DI               => DRP_DI_in,
        DRP_EN               => DRP_EN_in,
        DRP_WE               => DRP_WE_in,
        LBUS_CLK             => LBUS_CLK_in,
        RX_BYPASS_FORCE_REALIGNIN => RX_BYPASS_FORCE_REALIGNIN_in,
        RX_BYPASS_RDIN       => RX_BYPASS_RDIN_in,
        RX_RESET             => RX_RESET_in,
        RX_SERDES_CLK        => RX_SERDES_CLK_in,
        RX_SERDES_DATA00     => RX_SERDES_DATA00_in,
        RX_SERDES_DATA01     => RX_SERDES_DATA01_in,
        RX_SERDES_DATA02     => RX_SERDES_DATA02_in,
        RX_SERDES_DATA03     => RX_SERDES_DATA03_in,
        RX_SERDES_DATA04     => RX_SERDES_DATA04_in,
        RX_SERDES_DATA05     => RX_SERDES_DATA05_in,
        RX_SERDES_DATA06     => RX_SERDES_DATA06_in,
        RX_SERDES_DATA07     => RX_SERDES_DATA07_in,
        RX_SERDES_DATA08     => RX_SERDES_DATA08_in,
        RX_SERDES_DATA09     => RX_SERDES_DATA09_in,
        RX_SERDES_DATA10     => RX_SERDES_DATA10_in,
        RX_SERDES_DATA11     => RX_SERDES_DATA11_in,
        RX_SERDES_RESET      => RX_SERDES_RESET_in,
        SCAN_CLK             => SCAN_CLK_in,
        SCAN_EN_N            => SCAN_EN_N_in,
        SCAN_IN              => SCAN_IN_in,
        TEST_MODE_N          => TEST_MODE_N_in,
        TEST_RESET           => TEST_RESET_in,
        TX_BCTLIN0           => TX_BCTLIN0_in,
        TX_BCTLIN1           => TX_BCTLIN1_in,
        TX_BCTLIN2           => TX_BCTLIN2_in,
        TX_BCTLIN3           => TX_BCTLIN3_in,
        TX_BYPASS_CTRLIN     => TX_BYPASS_CTRLIN_in,
        TX_BYPASS_DATAIN00   => TX_BYPASS_DATAIN00_in,
        TX_BYPASS_DATAIN01   => TX_BYPASS_DATAIN01_in,
        TX_BYPASS_DATAIN02   => TX_BYPASS_DATAIN02_in,
        TX_BYPASS_DATAIN03   => TX_BYPASS_DATAIN03_in,
        TX_BYPASS_DATAIN04   => TX_BYPASS_DATAIN04_in,
        TX_BYPASS_DATAIN05   => TX_BYPASS_DATAIN05_in,
        TX_BYPASS_DATAIN06   => TX_BYPASS_DATAIN06_in,
        TX_BYPASS_DATAIN07   => TX_BYPASS_DATAIN07_in,
        TX_BYPASS_DATAIN08   => TX_BYPASS_DATAIN08_in,
        TX_BYPASS_DATAIN09   => TX_BYPASS_DATAIN09_in,
        TX_BYPASS_DATAIN10   => TX_BYPASS_DATAIN10_in,
        TX_BYPASS_DATAIN11   => TX_BYPASS_DATAIN11_in,
        TX_BYPASS_ENAIN      => TX_BYPASS_ENAIN_in,
        TX_BYPASS_GEARBOX_SEQIN => TX_BYPASS_GEARBOX_SEQIN_in,
        TX_BYPASS_MFRAMER_STATEIN => TX_BYPASS_MFRAMER_STATEIN_in,
        TX_CHANIN0           => TX_CHANIN0_in,
        TX_CHANIN1           => TX_CHANIN1_in,
        TX_CHANIN2           => TX_CHANIN2_in,
        TX_CHANIN3           => TX_CHANIN3_in,
        TX_DATAIN0           => TX_DATAIN0_in,
        TX_DATAIN1           => TX_DATAIN1_in,
        TX_DATAIN2           => TX_DATAIN2_in,
        TX_DATAIN3           => TX_DATAIN3_in,
        TX_ENAIN0            => TX_ENAIN0_in,
        TX_ENAIN1            => TX_ENAIN1_in,
        TX_ENAIN2            => TX_ENAIN2_in,
        TX_ENAIN3            => TX_ENAIN3_in,
        TX_EOPIN0            => TX_EOPIN0_in,
        TX_EOPIN1            => TX_EOPIN1_in,
        TX_EOPIN2            => TX_EOPIN2_in,
        TX_EOPIN3            => TX_EOPIN3_in,
        TX_ERRIN0            => TX_ERRIN0_in,
        TX_ERRIN1            => TX_ERRIN1_in,
        TX_ERRIN2            => TX_ERRIN2_in,
        TX_ERRIN3            => TX_ERRIN3_in,
        TX_MTYIN0            => TX_MTYIN0_in,
        TX_MTYIN1            => TX_MTYIN1_in,
        TX_MTYIN2            => TX_MTYIN2_in,
        TX_MTYIN3            => TX_MTYIN3_in,
        TX_RESET             => TX_RESET_in,
        TX_SERDES_REFCLK     => TX_SERDES_REFCLK_in,
        TX_SERDES_REFCLK_RESET => TX_SERDES_REFCLK_RESET_in,
        TX_SOPIN0            => TX_SOPIN0_in,
        TX_SOPIN1            => TX_SOPIN1_in,
        TX_SOPIN2            => TX_SOPIN2_in,
        TX_SOPIN3            => TX_SOPIN3_in,
        GSR                  => glblGSR        
      );
  end ILKNE4_V;
