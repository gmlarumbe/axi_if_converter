-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        CMACE4
-- /___/   /\      Filename    : CMACE4.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL CMACE4 -----

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

entity CMACE4 is
  generic (
    CTL_PTP_TRANSPCLK_MODE : string := "FALSE";
    CTL_RX_CHECK_ACK : string := "TRUE";
    CTL_RX_CHECK_PREAMBLE : string := "FALSE";
    CTL_RX_CHECK_SFD : string := "FALSE";
    CTL_RX_DELETE_FCS : string := "TRUE";
    CTL_RX_ETYPE_GCP : std_logic_vector(15 downto 0) := X"8808";
    CTL_RX_ETYPE_GPP : std_logic_vector(15 downto 0) := X"8808";
    CTL_RX_ETYPE_PCP : std_logic_vector(15 downto 0) := X"8808";
    CTL_RX_ETYPE_PPP : std_logic_vector(15 downto 0) := X"8808";
    CTL_RX_FORWARD_CONTROL : string := "FALSE";
    CTL_RX_IGNORE_FCS : string := "FALSE";
    CTL_RX_MAX_PACKET_LEN : std_logic_vector(14 downto 0) := "010" & X"580";
    CTL_RX_MIN_PACKET_LEN : std_logic_vector(7 downto 0) := X"40";
    CTL_RX_OPCODE_GPP : std_logic_vector(15 downto 0) := X"0001";
    CTL_RX_OPCODE_MAX_GCP : std_logic_vector(15 downto 0) := X"FFFF";
    CTL_RX_OPCODE_MAX_PCP : std_logic_vector(15 downto 0) := X"FFFF";
    CTL_RX_OPCODE_MIN_GCP : std_logic_vector(15 downto 0) := X"0000";
    CTL_RX_OPCODE_MIN_PCP : std_logic_vector(15 downto 0) := X"0000";
    CTL_RX_OPCODE_PPP : std_logic_vector(15 downto 0) := X"0001";
    CTL_RX_PAUSE_DA_MCAST : std_logic_vector(47 downto 0) := X"0180C2000001";
    CTL_RX_PAUSE_DA_UCAST : std_logic_vector(47 downto 0) := X"000000000000";
    CTL_RX_PAUSE_SA : std_logic_vector(47 downto 0) := X"000000000000";
    CTL_RX_PROCESS_LFI : string := "FALSE";
    CTL_RX_RSFEC_AM_THRESHOLD : std_logic_vector(8 downto 0) := "0" & X"46";
    CTL_RX_RSFEC_FILL_ADJUST : std_logic_vector(1 downto 0) := "00";
    CTL_RX_VL_LENGTH_MINUS1 : std_logic_vector(15 downto 0) := X"3FFF";
    CTL_RX_VL_MARKER_ID0 : std_logic_vector(63 downto 0) := X"C16821003E97DE00";
    CTL_RX_VL_MARKER_ID1 : std_logic_vector(63 downto 0) := X"9D718E00628E7100";
    CTL_RX_VL_MARKER_ID10 : std_logic_vector(63 downto 0) := X"FD6C990002936600";
    CTL_RX_VL_MARKER_ID11 : std_logic_vector(63 downto 0) := X"B9915500466EAA00";
    CTL_RX_VL_MARKER_ID12 : std_logic_vector(63 downto 0) := X"5CB9B200A3464D00";
    CTL_RX_VL_MARKER_ID13 : std_logic_vector(63 downto 0) := X"1AF8BD00E5074200";
    CTL_RX_VL_MARKER_ID14 : std_logic_vector(63 downto 0) := X"83C7CA007C383500";
    CTL_RX_VL_MARKER_ID15 : std_logic_vector(63 downto 0) := X"3536CD00CAC93200";
    CTL_RX_VL_MARKER_ID16 : std_logic_vector(63 downto 0) := X"C4314C003BCEB300";
    CTL_RX_VL_MARKER_ID17 : std_logic_vector(63 downto 0) := X"ADD6B70052294800";
    CTL_RX_VL_MARKER_ID18 : std_logic_vector(63 downto 0) := X"5F662A00A099D500";
    CTL_RX_VL_MARKER_ID19 : std_logic_vector(63 downto 0) := X"C0F0E5003F0F1A00";
    CTL_RX_VL_MARKER_ID2 : std_logic_vector(63 downto 0) := X"594BE800A6B41700";
    CTL_RX_VL_MARKER_ID3 : std_logic_vector(63 downto 0) := X"4D957B00B26A8400";
    CTL_RX_VL_MARKER_ID4 : std_logic_vector(63 downto 0) := X"F50709000AF8F600";
    CTL_RX_VL_MARKER_ID5 : std_logic_vector(63 downto 0) := X"DD14C20022EB3D00";
    CTL_RX_VL_MARKER_ID6 : std_logic_vector(63 downto 0) := X"9A4A260065B5D900";
    CTL_RX_VL_MARKER_ID7 : std_logic_vector(63 downto 0) := X"7B45660084BA9900";
    CTL_RX_VL_MARKER_ID8 : std_logic_vector(63 downto 0) := X"A02476005FDB8900";
    CTL_RX_VL_MARKER_ID9 : std_logic_vector(63 downto 0) := X"68C9FB0097360400";
    CTL_TEST_MODE_PIN_CHAR : string := "FALSE";
    CTL_TX_CUSTOM_PREAMBLE_ENABLE : string := "FALSE";
    CTL_TX_DA_GPP : std_logic_vector(47 downto 0) := X"0180C2000001";
    CTL_TX_DA_PPP : std_logic_vector(47 downto 0) := X"0180C2000001";
    CTL_TX_ETHERTYPE_GPP : std_logic_vector(15 downto 0) := X"8808";
    CTL_TX_ETHERTYPE_PPP : std_logic_vector(15 downto 0) := X"8808";
    CTL_TX_FCS_INS_ENABLE : string := "TRUE";
    CTL_TX_IGNORE_FCS : string := "FALSE";
    CTL_TX_IPG_VALUE : std_logic_vector(3 downto 0) := X"C";
    CTL_TX_OPCODE_GPP : std_logic_vector(15 downto 0) := X"0001";
    CTL_TX_OPCODE_PPP : std_logic_vector(15 downto 0) := X"0001";
    CTL_TX_PTP_1STEP_ENABLE : string := "FALSE";
    CTL_TX_PTP_LATENCY_ADJUST : std_logic_vector(10 downto 0) := "010" & X"C1";
    CTL_TX_SA_GPP : std_logic_vector(47 downto 0) := X"000000000000";
    CTL_TX_SA_PPP : std_logic_vector(47 downto 0) := X"000000000000";
    CTL_TX_VL_LENGTH_MINUS1 : std_logic_vector(15 downto 0) := X"3FFF";
    CTL_TX_VL_MARKER_ID0 : std_logic_vector(63 downto 0) := X"C16821003E97DE00";
    CTL_TX_VL_MARKER_ID1 : std_logic_vector(63 downto 0) := X"9D718E00628E7100";
    CTL_TX_VL_MARKER_ID10 : std_logic_vector(63 downto 0) := X"FD6C990002936600";
    CTL_TX_VL_MARKER_ID11 : std_logic_vector(63 downto 0) := X"B9915500466EAA00";
    CTL_TX_VL_MARKER_ID12 : std_logic_vector(63 downto 0) := X"5CB9B200A3464D00";
    CTL_TX_VL_MARKER_ID13 : std_logic_vector(63 downto 0) := X"1AF8BD00E5074200";
    CTL_TX_VL_MARKER_ID14 : std_logic_vector(63 downto 0) := X"83C7CA007C383500";
    CTL_TX_VL_MARKER_ID15 : std_logic_vector(63 downto 0) := X"3536CD00CAC93200";
    CTL_TX_VL_MARKER_ID16 : std_logic_vector(63 downto 0) := X"C4314C003BCEB300";
    CTL_TX_VL_MARKER_ID17 : std_logic_vector(63 downto 0) := X"ADD6B70052294800";
    CTL_TX_VL_MARKER_ID18 : std_logic_vector(63 downto 0) := X"5F662A00A099D500";
    CTL_TX_VL_MARKER_ID19 : std_logic_vector(63 downto 0) := X"C0F0E5003F0F1A00";
    CTL_TX_VL_MARKER_ID2 : std_logic_vector(63 downto 0) := X"594BE800A6B41700";
    CTL_TX_VL_MARKER_ID3 : std_logic_vector(63 downto 0) := X"4D957B00B26A8400";
    CTL_TX_VL_MARKER_ID4 : std_logic_vector(63 downto 0) := X"F50709000AF8F600";
    CTL_TX_VL_MARKER_ID5 : std_logic_vector(63 downto 0) := X"DD14C20022EB3D00";
    CTL_TX_VL_MARKER_ID6 : std_logic_vector(63 downto 0) := X"9A4A260065B5D900";
    CTL_TX_VL_MARKER_ID7 : std_logic_vector(63 downto 0) := X"7B45660084BA9900";
    CTL_TX_VL_MARKER_ID8 : std_logic_vector(63 downto 0) := X"A02476005FDB8900";
    CTL_TX_VL_MARKER_ID9 : std_logic_vector(63 downto 0) := X"68C9FB0097360400";
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    TEST_MODE_PIN_CHAR : string := "FALSE"
  );
  
  port (
    DRP_DO               : out std_logic_vector(15 downto 0);
    DRP_RDY              : out std_ulogic;
    RSFEC_BYPASS_RX_DOUT : out std_logic_vector(329 downto 0);
    RSFEC_BYPASS_RX_DOUT_CW_START : out std_ulogic;
    RSFEC_BYPASS_RX_DOUT_VALID : out std_ulogic;
    RSFEC_BYPASS_TX_DOUT : out std_logic_vector(329 downto 0);
    RSFEC_BYPASS_TX_DOUT_CW_START : out std_ulogic;
    RSFEC_BYPASS_TX_DOUT_VALID : out std_ulogic;
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
    RX_LANE_ALIGNER_FILL_0 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_1 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_10 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_11 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_12 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_13 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_14 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_15 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_16 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_17 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_18 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_19 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_2 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_3 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_4 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_5 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_6 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_7 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_8 : out std_logic_vector(6 downto 0);
    RX_LANE_ALIGNER_FILL_9 : out std_logic_vector(6 downto 0);
    RX_MTYOUT0           : out std_logic_vector(3 downto 0);
    RX_MTYOUT1           : out std_logic_vector(3 downto 0);
    RX_MTYOUT2           : out std_logic_vector(3 downto 0);
    RX_MTYOUT3           : out std_logic_vector(3 downto 0);
    RX_OTN_BIP8_0        : out std_logic_vector(7 downto 0);
    RX_OTN_BIP8_1        : out std_logic_vector(7 downto 0);
    RX_OTN_BIP8_2        : out std_logic_vector(7 downto 0);
    RX_OTN_BIP8_3        : out std_logic_vector(7 downto 0);
    RX_OTN_BIP8_4        : out std_logic_vector(7 downto 0);
    RX_OTN_DATA_0        : out std_logic_vector(65 downto 0);
    RX_OTN_DATA_1        : out std_logic_vector(65 downto 0);
    RX_OTN_DATA_2        : out std_logic_vector(65 downto 0);
    RX_OTN_DATA_3        : out std_logic_vector(65 downto 0);
    RX_OTN_DATA_4        : out std_logic_vector(65 downto 0);
    RX_OTN_ENA           : out std_ulogic;
    RX_OTN_LANE0         : out std_ulogic;
    RX_OTN_VLMARKER      : out std_ulogic;
    RX_PREOUT            : out std_logic_vector(55 downto 0);
    RX_PTP_PCSLANE_OUT   : out std_logic_vector(4 downto 0);
    RX_PTP_TSTAMP_OUT    : out std_logic_vector(79 downto 0);
    RX_SOPOUT0           : out std_ulogic;
    RX_SOPOUT1           : out std_ulogic;
    RX_SOPOUT2           : out std_ulogic;
    RX_SOPOUT3           : out std_ulogic;
    STAT_RX_ALIGNED      : out std_ulogic;
    STAT_RX_ALIGNED_ERR  : out std_ulogic;
    STAT_RX_BAD_CODE     : out std_logic_vector(2 downto 0);
    STAT_RX_BAD_FCS      : out std_logic_vector(2 downto 0);
    STAT_RX_BAD_PREAMBLE : out std_ulogic;
    STAT_RX_BAD_SFD      : out std_ulogic;
    STAT_RX_BIP_ERR_0    : out std_ulogic;
    STAT_RX_BIP_ERR_1    : out std_ulogic;
    STAT_RX_BIP_ERR_10   : out std_ulogic;
    STAT_RX_BIP_ERR_11   : out std_ulogic;
    STAT_RX_BIP_ERR_12   : out std_ulogic;
    STAT_RX_BIP_ERR_13   : out std_ulogic;
    STAT_RX_BIP_ERR_14   : out std_ulogic;
    STAT_RX_BIP_ERR_15   : out std_ulogic;
    STAT_RX_BIP_ERR_16   : out std_ulogic;
    STAT_RX_BIP_ERR_17   : out std_ulogic;
    STAT_RX_BIP_ERR_18   : out std_ulogic;
    STAT_RX_BIP_ERR_19   : out std_ulogic;
    STAT_RX_BIP_ERR_2    : out std_ulogic;
    STAT_RX_BIP_ERR_3    : out std_ulogic;
    STAT_RX_BIP_ERR_4    : out std_ulogic;
    STAT_RX_BIP_ERR_5    : out std_ulogic;
    STAT_RX_BIP_ERR_6    : out std_ulogic;
    STAT_RX_BIP_ERR_7    : out std_ulogic;
    STAT_RX_BIP_ERR_8    : out std_ulogic;
    STAT_RX_BIP_ERR_9    : out std_ulogic;
    STAT_RX_BLOCK_LOCK   : out std_logic_vector(19 downto 0);
    STAT_RX_BROADCAST    : out std_ulogic;
    STAT_RX_FRAGMENT     : out std_logic_vector(2 downto 0);
    STAT_RX_FRAMING_ERR_0 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_1 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_10 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_11 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_12 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_13 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_14 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_15 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_16 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_17 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_18 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_19 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_2 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_3 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_4 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_5 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_6 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_7 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_8 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_9 : out std_logic_vector(1 downto 0);
    STAT_RX_FRAMING_ERR_VALID_0 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_1 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_10 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_11 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_12 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_13 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_14 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_15 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_16 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_17 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_18 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_19 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_2 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_3 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_4 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_5 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_6 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_7 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_8 : out std_ulogic;
    STAT_RX_FRAMING_ERR_VALID_9 : out std_ulogic;
    STAT_RX_GOT_SIGNAL_OS : out std_ulogic;
    STAT_RX_HI_BER       : out std_ulogic;
    STAT_RX_INRANGEERR   : out std_ulogic;
    STAT_RX_INTERNAL_LOCAL_FAULT : out std_ulogic;
    STAT_RX_JABBER       : out std_ulogic;
    STAT_RX_LANE0_VLM_BIP7 : out std_logic_vector(7 downto 0);
    STAT_RX_LANE0_VLM_BIP7_VALID : out std_ulogic;
    STAT_RX_LOCAL_FAULT  : out std_ulogic;
    STAT_RX_MF_ERR       : out std_logic_vector(19 downto 0);
    STAT_RX_MF_LEN_ERR   : out std_logic_vector(19 downto 0);
    STAT_RX_MF_REPEAT_ERR : out std_logic_vector(19 downto 0);
    STAT_RX_MISALIGNED   : out std_ulogic;
    STAT_RX_MULTICAST    : out std_ulogic;
    STAT_RX_OVERSIZE     : out std_ulogic;
    STAT_RX_PACKET_1024_1518_BYTES : out std_ulogic;
    STAT_RX_PACKET_128_255_BYTES : out std_ulogic;
    STAT_RX_PACKET_1519_1522_BYTES : out std_ulogic;
    STAT_RX_PACKET_1523_1548_BYTES : out std_ulogic;
    STAT_RX_PACKET_1549_2047_BYTES : out std_ulogic;
    STAT_RX_PACKET_2048_4095_BYTES : out std_ulogic;
    STAT_RX_PACKET_256_511_BYTES : out std_ulogic;
    STAT_RX_PACKET_4096_8191_BYTES : out std_ulogic;
    STAT_RX_PACKET_512_1023_BYTES : out std_ulogic;
    STAT_RX_PACKET_64_BYTES : out std_ulogic;
    STAT_RX_PACKET_65_127_BYTES : out std_ulogic;
    STAT_RX_PACKET_8192_9215_BYTES : out std_ulogic;
    STAT_RX_PACKET_BAD_FCS : out std_ulogic;
    STAT_RX_PACKET_LARGE : out std_ulogic;
    STAT_RX_PACKET_SMALL : out std_logic_vector(2 downto 0);
    STAT_RX_PAUSE        : out std_ulogic;
    STAT_RX_PAUSE_QUANTA0 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA1 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA2 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA3 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA4 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA5 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA6 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA7 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_QUANTA8 : out std_logic_vector(15 downto 0);
    STAT_RX_PAUSE_REQ    : out std_logic_vector(8 downto 0);
    STAT_RX_PAUSE_VALID  : out std_logic_vector(8 downto 0);
    STAT_RX_RECEIVED_LOCAL_FAULT : out std_ulogic;
    STAT_RX_REMOTE_FAULT : out std_ulogic;
    STAT_RX_RSFEC_AM_LOCK0 : out std_ulogic;
    STAT_RX_RSFEC_AM_LOCK1 : out std_ulogic;
    STAT_RX_RSFEC_AM_LOCK2 : out std_ulogic;
    STAT_RX_RSFEC_AM_LOCK3 : out std_ulogic;
    STAT_RX_RSFEC_CORRECTED_CW_INC : out std_ulogic;
    STAT_RX_RSFEC_CW_INC : out std_ulogic;
    STAT_RX_RSFEC_ERR_COUNT0_INC : out std_logic_vector(2 downto 0);
    STAT_RX_RSFEC_ERR_COUNT1_INC : out std_logic_vector(2 downto 0);
    STAT_RX_RSFEC_ERR_COUNT2_INC : out std_logic_vector(2 downto 0);
    STAT_RX_RSFEC_ERR_COUNT3_INC : out std_logic_vector(2 downto 0);
    STAT_RX_RSFEC_HI_SER : out std_ulogic;
    STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS : out std_ulogic;
    STAT_RX_RSFEC_LANE_FILL_0 : out std_logic_vector(13 downto 0);
    STAT_RX_RSFEC_LANE_FILL_1 : out std_logic_vector(13 downto 0);
    STAT_RX_RSFEC_LANE_FILL_2 : out std_logic_vector(13 downto 0);
    STAT_RX_RSFEC_LANE_FILL_3 : out std_logic_vector(13 downto 0);
    STAT_RX_RSFEC_LANE_MAPPING : out std_logic_vector(7 downto 0);
    STAT_RX_RSFEC_RSVD   : out std_logic_vector(31 downto 0);
    STAT_RX_RSFEC_UNCORRECTED_CW_INC : out std_ulogic;
    STAT_RX_STATUS       : out std_ulogic;
    STAT_RX_STOMPED_FCS  : out std_logic_vector(2 downto 0);
    STAT_RX_SYNCED       : out std_logic_vector(19 downto 0);
    STAT_RX_SYNCED_ERR   : out std_logic_vector(19 downto 0);
    STAT_RX_TEST_PATTERN_MISMATCH : out std_logic_vector(2 downto 0);
    STAT_RX_TOOLONG      : out std_ulogic;
    STAT_RX_TOTAL_BYTES  : out std_logic_vector(6 downto 0);
    STAT_RX_TOTAL_GOOD_BYTES : out std_logic_vector(13 downto 0);
    STAT_RX_TOTAL_GOOD_PACKETS : out std_ulogic;
    STAT_RX_TOTAL_PACKETS : out std_logic_vector(2 downto 0);
    STAT_RX_TRUNCATED    : out std_ulogic;
    STAT_RX_UNDERSIZE    : out std_logic_vector(2 downto 0);
    STAT_RX_UNICAST      : out std_ulogic;
    STAT_RX_USER_PAUSE   : out std_ulogic;
    STAT_RX_VLAN         : out std_ulogic;
    STAT_RX_VL_DEMUXED   : out std_logic_vector(19 downto 0);
    STAT_RX_VL_NUMBER_0  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_1  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_10 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_11 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_12 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_13 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_14 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_15 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_16 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_17 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_18 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_19 : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_2  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_3  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_4  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_5  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_6  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_7  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_8  : out std_logic_vector(4 downto 0);
    STAT_RX_VL_NUMBER_9  : out std_logic_vector(4 downto 0);
    STAT_TX_BAD_FCS      : out std_ulogic;
    STAT_TX_BROADCAST    : out std_ulogic;
    STAT_TX_FRAME_ERROR  : out std_ulogic;
    STAT_TX_LOCAL_FAULT  : out std_ulogic;
    STAT_TX_MULTICAST    : out std_ulogic;
    STAT_TX_PACKET_1024_1518_BYTES : out std_ulogic;
    STAT_TX_PACKET_128_255_BYTES : out std_ulogic;
    STAT_TX_PACKET_1519_1522_BYTES : out std_ulogic;
    STAT_TX_PACKET_1523_1548_BYTES : out std_ulogic;
    STAT_TX_PACKET_1549_2047_BYTES : out std_ulogic;
    STAT_TX_PACKET_2048_4095_BYTES : out std_ulogic;
    STAT_TX_PACKET_256_511_BYTES : out std_ulogic;
    STAT_TX_PACKET_4096_8191_BYTES : out std_ulogic;
    STAT_TX_PACKET_512_1023_BYTES : out std_ulogic;
    STAT_TX_PACKET_64_BYTES : out std_ulogic;
    STAT_TX_PACKET_65_127_BYTES : out std_ulogic;
    STAT_TX_PACKET_8192_9215_BYTES : out std_ulogic;
    STAT_TX_PACKET_LARGE : out std_ulogic;
    STAT_TX_PACKET_SMALL : out std_ulogic;
    STAT_TX_PAUSE        : out std_ulogic;
    STAT_TX_PAUSE_VALID  : out std_logic_vector(8 downto 0);
    STAT_TX_PTP_FIFO_READ_ERROR : out std_ulogic;
    STAT_TX_PTP_FIFO_WRITE_ERROR : out std_ulogic;
    STAT_TX_TOTAL_BYTES  : out std_logic_vector(5 downto 0);
    STAT_TX_TOTAL_GOOD_BYTES : out std_logic_vector(13 downto 0);
    STAT_TX_TOTAL_GOOD_PACKETS : out std_ulogic;
    STAT_TX_TOTAL_PACKETS : out std_ulogic;
    STAT_TX_UNICAST      : out std_ulogic;
    STAT_TX_USER_PAUSE   : out std_ulogic;
    STAT_TX_VLAN         : out std_ulogic;
    TX_OVFOUT            : out std_ulogic;
    TX_PTP_PCSLANE_OUT   : out std_logic_vector(4 downto 0);
    TX_PTP_TSTAMP_OUT    : out std_logic_vector(79 downto 0);
    TX_PTP_TSTAMP_TAG_OUT : out std_logic_vector(15 downto 0);
    TX_PTP_TSTAMP_VALID_OUT : out std_ulogic;
    TX_RDYOUT            : out std_ulogic;
    TX_SERDES_ALT_DATA0  : out std_logic_vector(15 downto 0);
    TX_SERDES_ALT_DATA1  : out std_logic_vector(15 downto 0);
    TX_SERDES_ALT_DATA2  : out std_logic_vector(15 downto 0);
    TX_SERDES_ALT_DATA3  : out std_logic_vector(15 downto 0);
    TX_SERDES_DATA0      : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA1      : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA2      : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA3      : out std_logic_vector(63 downto 0);
    TX_SERDES_DATA4      : out std_logic_vector(31 downto 0);
    TX_SERDES_DATA5      : out std_logic_vector(31 downto 0);
    TX_SERDES_DATA6      : out std_logic_vector(31 downto 0);
    TX_SERDES_DATA7      : out std_logic_vector(31 downto 0);
    TX_SERDES_DATA8      : out std_logic_vector(31 downto 0);
    TX_SERDES_DATA9      : out std_logic_vector(31 downto 0);
    TX_UNFOUT            : out std_ulogic;
    CTL_CAUI4_MODE       : in std_ulogic;
    CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE : in std_ulogic;
    CTL_RSFEC_IEEE_ERROR_INDICATION_MODE : in std_ulogic;
    CTL_RX_CHECK_ETYPE_GCP : in std_ulogic;
    CTL_RX_CHECK_ETYPE_GPP : in std_ulogic;
    CTL_RX_CHECK_ETYPE_PCP : in std_ulogic;
    CTL_RX_CHECK_ETYPE_PPP : in std_ulogic;
    CTL_RX_CHECK_MCAST_GCP : in std_ulogic;
    CTL_RX_CHECK_MCAST_GPP : in std_ulogic;
    CTL_RX_CHECK_MCAST_PCP : in std_ulogic;
    CTL_RX_CHECK_MCAST_PPP : in std_ulogic;
    CTL_RX_CHECK_OPCODE_GCP : in std_ulogic;
    CTL_RX_CHECK_OPCODE_GPP : in std_ulogic;
    CTL_RX_CHECK_OPCODE_PCP : in std_ulogic;
    CTL_RX_CHECK_OPCODE_PPP : in std_ulogic;
    CTL_RX_CHECK_SA_GCP  : in std_ulogic;
    CTL_RX_CHECK_SA_GPP  : in std_ulogic;
    CTL_RX_CHECK_SA_PCP  : in std_ulogic;
    CTL_RX_CHECK_SA_PPP  : in std_ulogic;
    CTL_RX_CHECK_UCAST_GCP : in std_ulogic;
    CTL_RX_CHECK_UCAST_GPP : in std_ulogic;
    CTL_RX_CHECK_UCAST_PCP : in std_ulogic;
    CTL_RX_CHECK_UCAST_PPP : in std_ulogic;
    CTL_RX_ENABLE        : in std_ulogic;
    CTL_RX_ENABLE_GCP    : in std_ulogic;
    CTL_RX_ENABLE_GPP    : in std_ulogic;
    CTL_RX_ENABLE_PCP    : in std_ulogic;
    CTL_RX_ENABLE_PPP    : in std_ulogic;
    CTL_RX_FORCE_RESYNC  : in std_ulogic;
    CTL_RX_PAUSE_ACK     : in std_logic_vector(8 downto 0);
    CTL_RX_PAUSE_ENABLE  : in std_logic_vector(8 downto 0);
    CTL_RX_RSFEC_ENABLE  : in std_ulogic;
    CTL_RX_RSFEC_ENABLE_CORRECTION : in std_ulogic;
    CTL_RX_RSFEC_ENABLE_INDICATION : in std_ulogic;
    CTL_RX_SYSTEMTIMERIN : in std_logic_vector(79 downto 0);
    CTL_RX_TEST_PATTERN  : in std_ulogic;
    CTL_TX_ENABLE        : in std_ulogic;
    CTL_TX_LANE0_VLM_BIP7_OVERRIDE : in std_ulogic;
    CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE : in std_logic_vector(7 downto 0);
    CTL_TX_PAUSE_ENABLE  : in std_logic_vector(8 downto 0);
    CTL_TX_PAUSE_QUANTA0 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA1 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA2 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA3 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA4 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA5 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA6 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA7 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_QUANTA8 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER0 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER1 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER2 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER3 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER4 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER5 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER6 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER7 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REFRESH_TIMER8 : in std_logic_vector(15 downto 0);
    CTL_TX_PAUSE_REQ     : in std_logic_vector(8 downto 0);
    CTL_TX_PTP_VLANE_ADJUST_MODE : in std_ulogic;
    CTL_TX_RESEND_PAUSE  : in std_ulogic;
    CTL_TX_RSFEC_ENABLE  : in std_ulogic;
    CTL_TX_SEND_IDLE     : in std_ulogic;
    CTL_TX_SEND_LFI      : in std_ulogic;
    CTL_TX_SEND_RFI      : in std_ulogic;
    CTL_TX_SYSTEMTIMERIN : in std_logic_vector(79 downto 0);
    CTL_TX_TEST_PATTERN  : in std_ulogic;
    DRP_ADDR             : in std_logic_vector(9 downto 0);
    DRP_CLK              : in std_ulogic;
    DRP_DI               : in std_logic_vector(15 downto 0);
    DRP_EN               : in std_ulogic;
    DRP_WE               : in std_ulogic;
    RSFEC_BYPASS_RX_DIN  : in std_logic_vector(329 downto 0);
    RSFEC_BYPASS_RX_DIN_CW_START : in std_ulogic;
    RSFEC_BYPASS_TX_DIN  : in std_logic_vector(329 downto 0);
    RSFEC_BYPASS_TX_DIN_CW_START : in std_ulogic;
    RX_CLK               : in std_ulogic;
    RX_RESET             : in std_ulogic;
    RX_SERDES_ALT_DATA0  : in std_logic_vector(15 downto 0);
    RX_SERDES_ALT_DATA1  : in std_logic_vector(15 downto 0);
    RX_SERDES_ALT_DATA2  : in std_logic_vector(15 downto 0);
    RX_SERDES_ALT_DATA3  : in std_logic_vector(15 downto 0);
    RX_SERDES_CLK        : in std_logic_vector(9 downto 0);
    RX_SERDES_DATA0      : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA1      : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA2      : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA3      : in std_logic_vector(63 downto 0);
    RX_SERDES_DATA4      : in std_logic_vector(31 downto 0);
    RX_SERDES_DATA5      : in std_logic_vector(31 downto 0);
    RX_SERDES_DATA6      : in std_logic_vector(31 downto 0);
    RX_SERDES_DATA7      : in std_logic_vector(31 downto 0);
    RX_SERDES_DATA8      : in std_logic_vector(31 downto 0);
    RX_SERDES_DATA9      : in std_logic_vector(31 downto 0);
    RX_SERDES_RESET      : in std_logic_vector(9 downto 0);
    TX_CLK               : in std_ulogic;
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
    TX_PREIN             : in std_logic_vector(55 downto 0);
    TX_PTP_1588OP_IN     : in std_logic_vector(1 downto 0);
    TX_PTP_CHKSUM_OFFSET_IN : in std_logic_vector(15 downto 0);
    TX_PTP_RXTSTAMP_IN   : in std_logic_vector(63 downto 0);
    TX_PTP_TAG_FIELD_IN  : in std_logic_vector(15 downto 0);
    TX_PTP_TSTAMP_OFFSET_IN : in std_logic_vector(15 downto 0);
    TX_PTP_UPD_CHKSUM_IN : in std_ulogic;
    TX_RESET             : in std_ulogic;
    TX_SOPIN0            : in std_ulogic;
    TX_SOPIN1            : in std_ulogic;
    TX_SOPIN2            : in std_ulogic;
    TX_SOPIN3            : in std_ulogic
  );
end CMACE4;

architecture CMACE4_V of CMACE4 is
  component SIP_CMACE4
    
    port (
        CTL_CSSD_EN          : in std_logic_vector(39 downto 0);
        CTL_CSSD_MRKR_INIT   : in std_logic_vector(15 downto 0);
        CTL_CSSD_ROOT_CLK_DIS : in std_logic_vector(11 downto 0);
        CTL_CSSD_ROOT_CLK_SEL : in std_logic_vector(3 downto 0);
        CTL_CSSD_SNGL_CHAIN_MD : in std_logic_vector(39 downto 0);
        CTL_CSSD_STOP_COUNT_0 : in std_logic_vector(15 downto 0);
        CTL_CSSD_STOP_COUNT_1 : in std_logic_vector(15 downto 0);
        CTL_CSSD_STOP_COUNT_2 : in std_logic_vector(15 downto 0);
        CTL_PTP_TRANSPCLK_MODE : in std_logic_vector(39 downto 0);
        CTL_RX_CHECK_ACK     : in std_logic_vector(39 downto 0);
        CTL_RX_CHECK_PREAMBLE : in std_logic_vector(39 downto 0);
        CTL_RX_CHECK_SFD     : in std_logic_vector(39 downto 0);
        CTL_RX_DELETE_FCS    : in std_logic_vector(39 downto 0);
        CTL_RX_ETYPE_GCP     : in std_logic_vector(15 downto 0);
        CTL_RX_ETYPE_GPP     : in std_logic_vector(15 downto 0);
        CTL_RX_ETYPE_PCP     : in std_logic_vector(15 downto 0);
        CTL_RX_ETYPE_PPP     : in std_logic_vector(15 downto 0);
        CTL_RX_FORWARD_CONTROL : in std_logic_vector(39 downto 0);
        CTL_RX_IGNORE_FCS    : in std_logic_vector(39 downto 0);
        CTL_RX_MAX_PACKET_LEN : in std_logic_vector(14 downto 0);
        CTL_RX_MIN_PACKET_LEN : in std_logic_vector(7 downto 0);
        CTL_RX_OPCODE_GPP    : in std_logic_vector(15 downto 0);
        CTL_RX_OPCODE_MAX_GCP : in std_logic_vector(15 downto 0);
        CTL_RX_OPCODE_MAX_PCP : in std_logic_vector(15 downto 0);
        CTL_RX_OPCODE_MIN_GCP : in std_logic_vector(15 downto 0);
        CTL_RX_OPCODE_MIN_PCP : in std_logic_vector(15 downto 0);
        CTL_RX_OPCODE_PPP    : in std_logic_vector(15 downto 0);
        CTL_RX_PAUSE_DA_MCAST : in std_logic_vector(47 downto 0);
        CTL_RX_PAUSE_DA_UCAST : in std_logic_vector(47 downto 0);
        CTL_RX_PAUSE_SA      : in std_logic_vector(47 downto 0);
        CTL_RX_PROCESS_LFI   : in std_logic_vector(39 downto 0);
        CTL_RX_RSFEC_AM_THRESHOLD : in std_logic_vector(8 downto 0);
        CTL_RX_RSFEC_FILL_ADJUST : in std_logic_vector(1 downto 0);
        CTL_RX_VL_LENGTH_MINUS1 : in std_logic_vector(15 downto 0);
        CTL_RX_VL_MARKER_ID0 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID1 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID10 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID11 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID12 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID13 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID14 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID15 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID16 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID17 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID18 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID19 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID2 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID3 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID4 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID5 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID6 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID7 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID8 : in std_logic_vector(63 downto 0);
        CTL_RX_VL_MARKER_ID9 : in std_logic_vector(63 downto 0);
        CTL_TEST_MODE_PIN_CHAR : in std_logic_vector(39 downto 0);
        CTL_TX_CUSTOM_PREAMBLE_ENABLE : in std_logic_vector(39 downto 0);
        CTL_TX_DA_GPP        : in std_logic_vector(47 downto 0);
        CTL_TX_DA_PPP        : in std_logic_vector(47 downto 0);
        CTL_TX_ETHERTYPE_GPP : in std_logic_vector(15 downto 0);
        CTL_TX_ETHERTYPE_PPP : in std_logic_vector(15 downto 0);
        CTL_TX_FCS_INS_ENABLE : in std_logic_vector(39 downto 0);
        CTL_TX_IGNORE_FCS    : in std_logic_vector(39 downto 0);
        CTL_TX_IPG_VALUE     : in std_logic_vector(3 downto 0);
        CTL_TX_OPCODE_GPP    : in std_logic_vector(15 downto 0);
        CTL_TX_OPCODE_PPP    : in std_logic_vector(15 downto 0);
        CTL_TX_PTP_1STEP_ENABLE : in std_logic_vector(39 downto 0);
        CTL_TX_PTP_LATENCY_ADJUST : in std_logic_vector(10 downto 0);
        CTL_TX_SA_GPP        : in std_logic_vector(47 downto 0);
        CTL_TX_SA_PPP        : in std_logic_vector(47 downto 0);
        CTL_TX_VL_LENGTH_MINUS1 : in std_logic_vector(15 downto 0);
        CTL_TX_VL_MARKER_ID0 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID1 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID10 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID11 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID12 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID13 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID14 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID15 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID16 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID17 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID18 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID19 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID2 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID3 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID4 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID5 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID6 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID7 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID8 : in std_logic_vector(63 downto 0);
        CTL_TX_VL_MARKER_ID9 : in std_logic_vector(63 downto 0);
        TEST_MODE_PIN_CHAR   : in std_logic_vector(39 downto 0);
        CFG_RESET_CSSD       : out std_ulogic;
        CSSD_CLK_STOP_DONE   : out std_ulogic;
        DRP_DO               : out std_logic_vector(15 downto 0);
        DRP_RDY              : out std_ulogic;
        GRESTORE_CSSD        : out std_ulogic;
        GWE_CSSD             : out std_ulogic;
        RSFEC_BYPASS_RX_DOUT : out std_logic_vector(329 downto 0);
        RSFEC_BYPASS_RX_DOUT_CW_START : out std_ulogic;
        RSFEC_BYPASS_RX_DOUT_VALID : out std_ulogic;
        RSFEC_BYPASS_TX_DOUT : out std_logic_vector(329 downto 0);
        RSFEC_BYPASS_TX_DOUT_CW_START : out std_ulogic;
        RSFEC_BYPASS_TX_DOUT_VALID : out std_ulogic;
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
        RX_LANE_ALIGNER_FILL_0 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_1 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_10 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_11 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_12 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_13 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_14 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_15 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_16 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_17 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_18 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_19 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_2 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_3 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_4 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_5 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_6 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_7 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_8 : out std_logic_vector(6 downto 0);
        RX_LANE_ALIGNER_FILL_9 : out std_logic_vector(6 downto 0);
        RX_MTYOUT0           : out std_logic_vector(3 downto 0);
        RX_MTYOUT1           : out std_logic_vector(3 downto 0);
        RX_MTYOUT2           : out std_logic_vector(3 downto 0);
        RX_MTYOUT3           : out std_logic_vector(3 downto 0);
        RX_OTN_BIP8_0        : out std_logic_vector(7 downto 0);
        RX_OTN_BIP8_1        : out std_logic_vector(7 downto 0);
        RX_OTN_BIP8_2        : out std_logic_vector(7 downto 0);
        RX_OTN_BIP8_3        : out std_logic_vector(7 downto 0);
        RX_OTN_BIP8_4        : out std_logic_vector(7 downto 0);
        RX_OTN_DATA_0        : out std_logic_vector(65 downto 0);
        RX_OTN_DATA_1        : out std_logic_vector(65 downto 0);
        RX_OTN_DATA_2        : out std_logic_vector(65 downto 0);
        RX_OTN_DATA_3        : out std_logic_vector(65 downto 0);
        RX_OTN_DATA_4        : out std_logic_vector(65 downto 0);
        RX_OTN_ENA           : out std_ulogic;
        RX_OTN_LANE0         : out std_ulogic;
        RX_OTN_VLMARKER      : out std_ulogic;
        RX_PREOUT            : out std_logic_vector(55 downto 0);
        RX_PTP_PCSLANE_OUT   : out std_logic_vector(4 downto 0);
        RX_PTP_TSTAMP_OUT    : out std_logic_vector(79 downto 0);
        RX_SOPOUT0           : out std_ulogic;
        RX_SOPOUT1           : out std_ulogic;
        RX_SOPOUT2           : out std_ulogic;
        RX_SOPOUT3           : out std_ulogic;
        SCAN_OUT             : out std_logic_vector(267 downto 0);
        STAT_RX_ALIGNED      : out std_ulogic;
        STAT_RX_ALIGNED_ERR  : out std_ulogic;
        STAT_RX_BAD_CODE     : out std_logic_vector(2 downto 0);
        STAT_RX_BAD_FCS      : out std_logic_vector(2 downto 0);
        STAT_RX_BAD_PREAMBLE : out std_ulogic;
        STAT_RX_BAD_SFD      : out std_ulogic;
        STAT_RX_BIP_ERR_0    : out std_ulogic;
        STAT_RX_BIP_ERR_1    : out std_ulogic;
        STAT_RX_BIP_ERR_10   : out std_ulogic;
        STAT_RX_BIP_ERR_11   : out std_ulogic;
        STAT_RX_BIP_ERR_12   : out std_ulogic;
        STAT_RX_BIP_ERR_13   : out std_ulogic;
        STAT_RX_BIP_ERR_14   : out std_ulogic;
        STAT_RX_BIP_ERR_15   : out std_ulogic;
        STAT_RX_BIP_ERR_16   : out std_ulogic;
        STAT_RX_BIP_ERR_17   : out std_ulogic;
        STAT_RX_BIP_ERR_18   : out std_ulogic;
        STAT_RX_BIP_ERR_19   : out std_ulogic;
        STAT_RX_BIP_ERR_2    : out std_ulogic;
        STAT_RX_BIP_ERR_3    : out std_ulogic;
        STAT_RX_BIP_ERR_4    : out std_ulogic;
        STAT_RX_BIP_ERR_5    : out std_ulogic;
        STAT_RX_BIP_ERR_6    : out std_ulogic;
        STAT_RX_BIP_ERR_7    : out std_ulogic;
        STAT_RX_BIP_ERR_8    : out std_ulogic;
        STAT_RX_BIP_ERR_9    : out std_ulogic;
        STAT_RX_BLOCK_LOCK   : out std_logic_vector(19 downto 0);
        STAT_RX_BROADCAST    : out std_ulogic;
        STAT_RX_FRAGMENT     : out std_logic_vector(2 downto 0);
        STAT_RX_FRAMING_ERR_0 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_1 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_10 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_11 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_12 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_13 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_14 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_15 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_16 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_17 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_18 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_19 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_2 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_3 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_4 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_5 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_6 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_7 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_8 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_9 : out std_logic_vector(1 downto 0);
        STAT_RX_FRAMING_ERR_VALID_0 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_1 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_10 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_11 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_12 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_13 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_14 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_15 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_16 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_17 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_18 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_19 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_2 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_3 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_4 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_5 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_6 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_7 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_8 : out std_ulogic;
        STAT_RX_FRAMING_ERR_VALID_9 : out std_ulogic;
        STAT_RX_GOT_SIGNAL_OS : out std_ulogic;
        STAT_RX_HI_BER       : out std_ulogic;
        STAT_RX_INRANGEERR   : out std_ulogic;
        STAT_RX_INTERNAL_LOCAL_FAULT : out std_ulogic;
        STAT_RX_JABBER       : out std_ulogic;
        STAT_RX_LANE0_VLM_BIP7 : out std_logic_vector(7 downto 0);
        STAT_RX_LANE0_VLM_BIP7_VALID : out std_ulogic;
        STAT_RX_LOCAL_FAULT  : out std_ulogic;
        STAT_RX_MF_ERR       : out std_logic_vector(19 downto 0);
        STAT_RX_MF_LEN_ERR   : out std_logic_vector(19 downto 0);
        STAT_RX_MF_REPEAT_ERR : out std_logic_vector(19 downto 0);
        STAT_RX_MISALIGNED   : out std_ulogic;
        STAT_RX_MULTICAST    : out std_ulogic;
        STAT_RX_OVERSIZE     : out std_ulogic;
        STAT_RX_PACKET_1024_1518_BYTES : out std_ulogic;
        STAT_RX_PACKET_128_255_BYTES : out std_ulogic;
        STAT_RX_PACKET_1519_1522_BYTES : out std_ulogic;
        STAT_RX_PACKET_1523_1548_BYTES : out std_ulogic;
        STAT_RX_PACKET_1549_2047_BYTES : out std_ulogic;
        STAT_RX_PACKET_2048_4095_BYTES : out std_ulogic;
        STAT_RX_PACKET_256_511_BYTES : out std_ulogic;
        STAT_RX_PACKET_4096_8191_BYTES : out std_ulogic;
        STAT_RX_PACKET_512_1023_BYTES : out std_ulogic;
        STAT_RX_PACKET_64_BYTES : out std_ulogic;
        STAT_RX_PACKET_65_127_BYTES : out std_ulogic;
        STAT_RX_PACKET_8192_9215_BYTES : out std_ulogic;
        STAT_RX_PACKET_BAD_FCS : out std_ulogic;
        STAT_RX_PACKET_LARGE : out std_ulogic;
        STAT_RX_PACKET_SMALL : out std_logic_vector(2 downto 0);
        STAT_RX_PAUSE        : out std_ulogic;
        STAT_RX_PAUSE_QUANTA0 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA1 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA2 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA3 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA4 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA5 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA6 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA7 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_QUANTA8 : out std_logic_vector(15 downto 0);
        STAT_RX_PAUSE_REQ    : out std_logic_vector(8 downto 0);
        STAT_RX_PAUSE_VALID  : out std_logic_vector(8 downto 0);
        STAT_RX_RECEIVED_LOCAL_FAULT : out std_ulogic;
        STAT_RX_REMOTE_FAULT : out std_ulogic;
        STAT_RX_RSFEC_AM_LOCK0 : out std_ulogic;
        STAT_RX_RSFEC_AM_LOCK1 : out std_ulogic;
        STAT_RX_RSFEC_AM_LOCK2 : out std_ulogic;
        STAT_RX_RSFEC_AM_LOCK3 : out std_ulogic;
        STAT_RX_RSFEC_CORRECTED_CW_INC : out std_ulogic;
        STAT_RX_RSFEC_CW_INC : out std_ulogic;
        STAT_RX_RSFEC_ERR_COUNT0_INC : out std_logic_vector(2 downto 0);
        STAT_RX_RSFEC_ERR_COUNT1_INC : out std_logic_vector(2 downto 0);
        STAT_RX_RSFEC_ERR_COUNT2_INC : out std_logic_vector(2 downto 0);
        STAT_RX_RSFEC_ERR_COUNT3_INC : out std_logic_vector(2 downto 0);
        STAT_RX_RSFEC_HI_SER : out std_ulogic;
        STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS : out std_ulogic;
        STAT_RX_RSFEC_LANE_FILL_0 : out std_logic_vector(13 downto 0);
        STAT_RX_RSFEC_LANE_FILL_1 : out std_logic_vector(13 downto 0);
        STAT_RX_RSFEC_LANE_FILL_2 : out std_logic_vector(13 downto 0);
        STAT_RX_RSFEC_LANE_FILL_3 : out std_logic_vector(13 downto 0);
        STAT_RX_RSFEC_LANE_MAPPING : out std_logic_vector(7 downto 0);
        STAT_RX_RSFEC_RSVD   : out std_logic_vector(31 downto 0);
        STAT_RX_RSFEC_UNCORRECTED_CW_INC : out std_ulogic;
        STAT_RX_STATUS       : out std_ulogic;
        STAT_RX_STOMPED_FCS  : out std_logic_vector(2 downto 0);
        STAT_RX_SYNCED       : out std_logic_vector(19 downto 0);
        STAT_RX_SYNCED_ERR   : out std_logic_vector(19 downto 0);
        STAT_RX_TEST_PATTERN_MISMATCH : out std_logic_vector(2 downto 0);
        STAT_RX_TOOLONG      : out std_ulogic;
        STAT_RX_TOTAL_BYTES  : out std_logic_vector(6 downto 0);
        STAT_RX_TOTAL_GOOD_BYTES : out std_logic_vector(13 downto 0);
        STAT_RX_TOTAL_GOOD_PACKETS : out std_ulogic;
        STAT_RX_TOTAL_PACKETS : out std_logic_vector(2 downto 0);
        STAT_RX_TRUNCATED    : out std_ulogic;
        STAT_RX_UNDERSIZE    : out std_logic_vector(2 downto 0);
        STAT_RX_UNICAST      : out std_ulogic;
        STAT_RX_USER_PAUSE   : out std_ulogic;
        STAT_RX_VLAN         : out std_ulogic;
        STAT_RX_VL_DEMUXED   : out std_logic_vector(19 downto 0);
        STAT_RX_VL_NUMBER_0  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_1  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_10 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_11 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_12 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_13 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_14 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_15 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_16 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_17 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_18 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_19 : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_2  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_3  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_4  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_5  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_6  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_7  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_8  : out std_logic_vector(4 downto 0);
        STAT_RX_VL_NUMBER_9  : out std_logic_vector(4 downto 0);
        STAT_TX_BAD_FCS      : out std_ulogic;
        STAT_TX_BROADCAST    : out std_ulogic;
        STAT_TX_FRAME_ERROR  : out std_ulogic;
        STAT_TX_LOCAL_FAULT  : out std_ulogic;
        STAT_TX_MULTICAST    : out std_ulogic;
        STAT_TX_PACKET_1024_1518_BYTES : out std_ulogic;
        STAT_TX_PACKET_128_255_BYTES : out std_ulogic;
        STAT_TX_PACKET_1519_1522_BYTES : out std_ulogic;
        STAT_TX_PACKET_1523_1548_BYTES : out std_ulogic;
        STAT_TX_PACKET_1549_2047_BYTES : out std_ulogic;
        STAT_TX_PACKET_2048_4095_BYTES : out std_ulogic;
        STAT_TX_PACKET_256_511_BYTES : out std_ulogic;
        STAT_TX_PACKET_4096_8191_BYTES : out std_ulogic;
        STAT_TX_PACKET_512_1023_BYTES : out std_ulogic;
        STAT_TX_PACKET_64_BYTES : out std_ulogic;
        STAT_TX_PACKET_65_127_BYTES : out std_ulogic;
        STAT_TX_PACKET_8192_9215_BYTES : out std_ulogic;
        STAT_TX_PACKET_LARGE : out std_ulogic;
        STAT_TX_PACKET_SMALL : out std_ulogic;
        STAT_TX_PAUSE        : out std_ulogic;
        STAT_TX_PAUSE_VALID  : out std_logic_vector(8 downto 0);
        STAT_TX_PTP_FIFO_READ_ERROR : out std_ulogic;
        STAT_TX_PTP_FIFO_WRITE_ERROR : out std_ulogic;
        STAT_TX_TOTAL_BYTES  : out std_logic_vector(5 downto 0);
        STAT_TX_TOTAL_GOOD_BYTES : out std_logic_vector(13 downto 0);
        STAT_TX_TOTAL_GOOD_PACKETS : out std_ulogic;
        STAT_TX_TOTAL_PACKETS : out std_ulogic;
        STAT_TX_UNICAST      : out std_ulogic;
        STAT_TX_USER_PAUSE   : out std_ulogic;
        STAT_TX_VLAN         : out std_ulogic;
        TX_OVFOUT            : out std_ulogic;
        TX_PTP_PCSLANE_OUT   : out std_logic_vector(4 downto 0);
        TX_PTP_TSTAMP_OUT    : out std_logic_vector(79 downto 0);
        TX_PTP_TSTAMP_TAG_OUT : out std_logic_vector(15 downto 0);
        TX_PTP_TSTAMP_VALID_OUT : out std_ulogic;
        TX_RDYOUT            : out std_ulogic;
        TX_SERDES_ALT_DATA0  : out std_logic_vector(15 downto 0);
        TX_SERDES_ALT_DATA1  : out std_logic_vector(15 downto 0);
        TX_SERDES_ALT_DATA2  : out std_logic_vector(15 downto 0);
        TX_SERDES_ALT_DATA3  : out std_logic_vector(15 downto 0);
        TX_SERDES_DATA0      : out std_logic_vector(63 downto 0);
        TX_SERDES_DATA1      : out std_logic_vector(63 downto 0);
        TX_SERDES_DATA2      : out std_logic_vector(63 downto 0);
        TX_SERDES_DATA3      : out std_logic_vector(63 downto 0);
        TX_SERDES_DATA4      : out std_logic_vector(31 downto 0);
        TX_SERDES_DATA5      : out std_logic_vector(31 downto 0);
        TX_SERDES_DATA6      : out std_logic_vector(31 downto 0);
        TX_SERDES_DATA7      : out std_logic_vector(31 downto 0);
        TX_SERDES_DATA8      : out std_logic_vector(31 downto 0);
        TX_SERDES_DATA9      : out std_logic_vector(31 downto 0);
        TX_UNFOUT            : out std_ulogic;
        CSSD_CLK_STOP_EVENT  : in std_ulogic;
        CSSD_RESETN          : in std_ulogic;
        CTL_CAUI4_MODE       : in std_ulogic;
        CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE : in std_ulogic;
        CTL_RSFEC_IEEE_ERROR_INDICATION_MODE : in std_ulogic;
        CTL_RX_CHECK_ETYPE_GCP : in std_ulogic;
        CTL_RX_CHECK_ETYPE_GPP : in std_ulogic;
        CTL_RX_CHECK_ETYPE_PCP : in std_ulogic;
        CTL_RX_CHECK_ETYPE_PPP : in std_ulogic;
        CTL_RX_CHECK_MCAST_GCP : in std_ulogic;
        CTL_RX_CHECK_MCAST_GPP : in std_ulogic;
        CTL_RX_CHECK_MCAST_PCP : in std_ulogic;
        CTL_RX_CHECK_MCAST_PPP : in std_ulogic;
        CTL_RX_CHECK_OPCODE_GCP : in std_ulogic;
        CTL_RX_CHECK_OPCODE_GPP : in std_ulogic;
        CTL_RX_CHECK_OPCODE_PCP : in std_ulogic;
        CTL_RX_CHECK_OPCODE_PPP : in std_ulogic;
        CTL_RX_CHECK_SA_GCP  : in std_ulogic;
        CTL_RX_CHECK_SA_GPP  : in std_ulogic;
        CTL_RX_CHECK_SA_PCP  : in std_ulogic;
        CTL_RX_CHECK_SA_PPP  : in std_ulogic;
        CTL_RX_CHECK_UCAST_GCP : in std_ulogic;
        CTL_RX_CHECK_UCAST_GPP : in std_ulogic;
        CTL_RX_CHECK_UCAST_PCP : in std_ulogic;
        CTL_RX_CHECK_UCAST_PPP : in std_ulogic;
        CTL_RX_ENABLE        : in std_ulogic;
        CTL_RX_ENABLE_GCP    : in std_ulogic;
        CTL_RX_ENABLE_GPP    : in std_ulogic;
        CTL_RX_ENABLE_PCP    : in std_ulogic;
        CTL_RX_ENABLE_PPP    : in std_ulogic;
        CTL_RX_FORCE_RESYNC  : in std_ulogic;
        CTL_RX_PAUSE_ACK     : in std_logic_vector(8 downto 0);
        CTL_RX_PAUSE_ENABLE  : in std_logic_vector(8 downto 0);
        CTL_RX_RSFEC_ENABLE  : in std_ulogic;
        CTL_RX_RSFEC_ENABLE_CORRECTION : in std_ulogic;
        CTL_RX_RSFEC_ENABLE_INDICATION : in std_ulogic;
        CTL_RX_SYSTEMTIMERIN : in std_logic_vector(79 downto 0);
        CTL_RX_TEST_PATTERN  : in std_ulogic;
        CTL_TX_ENABLE        : in std_ulogic;
        CTL_TX_LANE0_VLM_BIP7_OVERRIDE : in std_ulogic;
        CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE : in std_logic_vector(7 downto 0);
        CTL_TX_PAUSE_ENABLE  : in std_logic_vector(8 downto 0);
        CTL_TX_PAUSE_QUANTA0 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA1 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA2 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA3 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA4 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA5 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA6 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA7 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_QUANTA8 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER0 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER1 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER2 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER3 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER4 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER5 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER6 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER7 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REFRESH_TIMER8 : in std_logic_vector(15 downto 0);
        CTL_TX_PAUSE_REQ     : in std_logic_vector(8 downto 0);
        CTL_TX_PTP_VLANE_ADJUST_MODE : in std_ulogic;
        CTL_TX_RESEND_PAUSE  : in std_ulogic;
        CTL_TX_RSFEC_ENABLE  : in std_ulogic;
        CTL_TX_SEND_IDLE     : in std_ulogic;
        CTL_TX_SEND_LFI      : in std_ulogic;
        CTL_TX_SEND_RFI      : in std_ulogic;
        CTL_TX_SYSTEMTIMERIN : in std_logic_vector(79 downto 0);
        CTL_TX_TEST_PATTERN  : in std_ulogic;
        DRP_ADDR             : in std_logic_vector(9 downto 0);
        DRP_CLK              : in std_ulogic;
        DRP_DI               : in std_logic_vector(15 downto 0);
        DRP_EN               : in std_ulogic;
        DRP_WE               : in std_ulogic;
        RSFEC_BYPASS_RX_DIN  : in std_logic_vector(329 downto 0);
        RSFEC_BYPASS_RX_DIN_CW_START : in std_ulogic;
        RSFEC_BYPASS_TX_DIN  : in std_logic_vector(329 downto 0);
        RSFEC_BYPASS_TX_DIN_CW_START : in std_ulogic;
        RX_CLK               : in std_ulogic;
        RX_RESET             : in std_ulogic;
        RX_SERDES_ALT_DATA0  : in std_logic_vector(15 downto 0);
        RX_SERDES_ALT_DATA1  : in std_logic_vector(15 downto 0);
        RX_SERDES_ALT_DATA2  : in std_logic_vector(15 downto 0);
        RX_SERDES_ALT_DATA3  : in std_logic_vector(15 downto 0);
        RX_SERDES_CLK        : in std_logic_vector(9 downto 0);
        RX_SERDES_DATA0      : in std_logic_vector(63 downto 0);
        RX_SERDES_DATA1      : in std_logic_vector(63 downto 0);
        RX_SERDES_DATA2      : in std_logic_vector(63 downto 0);
        RX_SERDES_DATA3      : in std_logic_vector(63 downto 0);
        RX_SERDES_DATA4      : in std_logic_vector(31 downto 0);
        RX_SERDES_DATA5      : in std_logic_vector(31 downto 0);
        RX_SERDES_DATA6      : in std_logic_vector(31 downto 0);
        RX_SERDES_DATA7      : in std_logic_vector(31 downto 0);
        RX_SERDES_DATA8      : in std_logic_vector(31 downto 0);
        RX_SERDES_DATA9      : in std_logic_vector(31 downto 0);
        RX_SERDES_RESET      : in std_logic_vector(9 downto 0);
        SCAN_CLK             : in std_ulogic;
        SCAN_EN_N            : in std_ulogic;
        SCAN_IN              : in std_logic_vector(267 downto 0);
        TEST_MODE_N          : in std_ulogic;
        TEST_RESET           : in std_ulogic;
        TX_CLK               : in std_ulogic;
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
        TX_PREIN             : in std_logic_vector(55 downto 0);
        TX_PTP_1588OP_IN     : in std_logic_vector(1 downto 0);
        TX_PTP_CHKSUM_OFFSET_IN : in std_logic_vector(15 downto 0);
        TX_PTP_RXTSTAMP_IN   : in std_logic_vector(63 downto 0);
        TX_PTP_TAG_FIELD_IN  : in std_logic_vector(15 downto 0);
        TX_PTP_TSTAMP_OFFSET_IN : in std_logic_vector(15 downto 0);
        TX_PTP_UPD_CHKSUM_IN : in std_ulogic;
        TX_RESET             : in std_ulogic;
        TX_SOPIN0            : in std_ulogic;
        TX_SOPIN1            : in std_ulogic;
        TX_SOPIN2            : in std_ulogic;
        TX_SOPIN3            : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;

    constant MODULE_NAME : string := "CMACE4";
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
    constant CTL_CSSD_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant CTL_CSSD_SNGL_CHAIN_MD_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant CTL_PTP_TRANSPCLK_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_PTP_TRANSPCLK_MODE,40);
    constant CTL_RX_CHECK_ACK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_CHECK_ACK,40);
    constant CTL_RX_CHECK_PREAMBLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_CHECK_PREAMBLE,40);
    constant CTL_RX_CHECK_SFD_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_CHECK_SFD,40);
    constant CTL_RX_DELETE_FCS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_DELETE_FCS,40);
    constant CTL_RX_FORWARD_CONTROL_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_FORWARD_CONTROL,40);
    constant CTL_RX_IGNORE_FCS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_IGNORE_FCS,40);
    constant CTL_RX_PROCESS_LFI_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_RX_PROCESS_LFI,40);
    constant CTL_TEST_MODE_PIN_CHAR_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TEST_MODE_PIN_CHAR,40);
    constant CTL_TX_CUSTOM_PREAMBLE_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TX_CUSTOM_PREAMBLE_ENABLE,40);
    constant CTL_TX_FCS_INS_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TX_FCS_INS_ENABLE,40);
    constant CTL_TX_IGNORE_FCS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TX_IGNORE_FCS,40);
    constant CTL_TX_PTP_1STEP_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CTL_TX_PTP_1STEP_ENABLE,40);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);
    constant TEST_MODE_PIN_CHAR_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TEST_MODE_PIN_CHAR,40);

    constant CTL_CSSD_MRKR_INIT_BIN : std_logic_vector(15 downto 0) := X"0000";
    constant CTL_CSSD_ROOT_CLK_DIS_BIN : std_logic_vector(11 downto 0) := X"000";
    constant CTL_CSSD_ROOT_CLK_SEL_BIN : std_logic_vector(3 downto 0) := X"0";
    constant CTL_CSSD_STOP_COUNT_0_BIN : std_logic_vector(15 downto 0) := X"00FF";
    constant CTL_CSSD_STOP_COUNT_1_BIN : std_logic_vector(15 downto 0) := X"0000";
    constant CTL_CSSD_STOP_COUNT_2_BIN : std_logic_vector(15 downto 0) := X"0000";
    constant CTL_RX_ETYPE_GCP_BIN : std_logic_vector(15 downto 0) := CTL_RX_ETYPE_GCP;
    constant CTL_RX_ETYPE_GPP_BIN : std_logic_vector(15 downto 0) := CTL_RX_ETYPE_GPP;
    constant CTL_RX_ETYPE_PCP_BIN : std_logic_vector(15 downto 0) := CTL_RX_ETYPE_PCP;
    constant CTL_RX_ETYPE_PPP_BIN : std_logic_vector(15 downto 0) := CTL_RX_ETYPE_PPP;
    constant CTL_RX_MAX_PACKET_LEN_BIN : std_logic_vector(14 downto 0) := CTL_RX_MAX_PACKET_LEN;
    constant CTL_RX_MIN_PACKET_LEN_BIN : std_logic_vector(7 downto 0) := CTL_RX_MIN_PACKET_LEN;
    constant CTL_RX_OPCODE_GPP_BIN : std_logic_vector(15 downto 0) := CTL_RX_OPCODE_GPP;
    constant CTL_RX_OPCODE_MAX_GCP_BIN : std_logic_vector(15 downto 0) := CTL_RX_OPCODE_MAX_GCP;
    constant CTL_RX_OPCODE_MAX_PCP_BIN : std_logic_vector(15 downto 0) := CTL_RX_OPCODE_MAX_PCP;
    constant CTL_RX_OPCODE_MIN_GCP_BIN : std_logic_vector(15 downto 0) := CTL_RX_OPCODE_MIN_GCP;
    constant CTL_RX_OPCODE_MIN_PCP_BIN : std_logic_vector(15 downto 0) := CTL_RX_OPCODE_MIN_PCP;
    constant CTL_RX_OPCODE_PPP_BIN : std_logic_vector(15 downto 0) := CTL_RX_OPCODE_PPP;
    constant CTL_RX_PAUSE_DA_MCAST_BIN : std_logic_vector(47 downto 0) := CTL_RX_PAUSE_DA_MCAST;
    constant CTL_RX_PAUSE_DA_UCAST_BIN : std_logic_vector(47 downto 0) := CTL_RX_PAUSE_DA_UCAST;
    constant CTL_RX_PAUSE_SA_BIN : std_logic_vector(47 downto 0) := CTL_RX_PAUSE_SA;
    constant CTL_RX_RSFEC_AM_THRESHOLD_BIN : std_logic_vector(8 downto 0) := CTL_RX_RSFEC_AM_THRESHOLD;
    constant CTL_RX_RSFEC_FILL_ADJUST_BIN : std_logic_vector(1 downto 0) := CTL_RX_RSFEC_FILL_ADJUST;
    constant CTL_RX_VL_LENGTH_MINUS1_BIN : std_logic_vector(15 downto 0) := CTL_RX_VL_LENGTH_MINUS1;
    constant CTL_RX_VL_MARKER_ID0_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID0;
    constant CTL_RX_VL_MARKER_ID10_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID10;
    constant CTL_RX_VL_MARKER_ID11_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID11;
    constant CTL_RX_VL_MARKER_ID12_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID12;
    constant CTL_RX_VL_MARKER_ID13_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID13;
    constant CTL_RX_VL_MARKER_ID14_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID14;
    constant CTL_RX_VL_MARKER_ID15_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID15;
    constant CTL_RX_VL_MARKER_ID16_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID16;
    constant CTL_RX_VL_MARKER_ID17_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID17;
    constant CTL_RX_VL_MARKER_ID18_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID18;
    constant CTL_RX_VL_MARKER_ID19_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID19;
    constant CTL_RX_VL_MARKER_ID1_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID1;
    constant CTL_RX_VL_MARKER_ID2_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID2;
    constant CTL_RX_VL_MARKER_ID3_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID3;
    constant CTL_RX_VL_MARKER_ID4_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID4;
    constant CTL_RX_VL_MARKER_ID5_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID5;
    constant CTL_RX_VL_MARKER_ID6_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID6;
    constant CTL_RX_VL_MARKER_ID7_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID7;
    constant CTL_RX_VL_MARKER_ID8_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID8;
    constant CTL_RX_VL_MARKER_ID9_BIN : std_logic_vector(63 downto 0) := CTL_RX_VL_MARKER_ID9;
    constant CTL_TX_DA_GPP_BIN : std_logic_vector(47 downto 0) := CTL_TX_DA_GPP;
    constant CTL_TX_DA_PPP_BIN : std_logic_vector(47 downto 0) := CTL_TX_DA_PPP;
    constant CTL_TX_ETHERTYPE_GPP_BIN : std_logic_vector(15 downto 0) := CTL_TX_ETHERTYPE_GPP;
    constant CTL_TX_ETHERTYPE_PPP_BIN : std_logic_vector(15 downto 0) := CTL_TX_ETHERTYPE_PPP;
    constant CTL_TX_IPG_VALUE_BIN : std_logic_vector(3 downto 0) := CTL_TX_IPG_VALUE;
    constant CTL_TX_OPCODE_GPP_BIN : std_logic_vector(15 downto 0) := CTL_TX_OPCODE_GPP;
    constant CTL_TX_OPCODE_PPP_BIN : std_logic_vector(15 downto 0) := CTL_TX_OPCODE_PPP;
    constant CTL_TX_PTP_LATENCY_ADJUST_BIN : std_logic_vector(10 downto 0) := CTL_TX_PTP_LATENCY_ADJUST;
    constant CTL_TX_SA_GPP_BIN : std_logic_vector(47 downto 0) := CTL_TX_SA_GPP;
    constant CTL_TX_SA_PPP_BIN : std_logic_vector(47 downto 0) := CTL_TX_SA_PPP;
    constant CTL_TX_VL_LENGTH_MINUS1_BIN : std_logic_vector(15 downto 0) := CTL_TX_VL_LENGTH_MINUS1;
    constant CTL_TX_VL_MARKER_ID0_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID0;
    constant CTL_TX_VL_MARKER_ID10_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID10;
    constant CTL_TX_VL_MARKER_ID11_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID11;
    constant CTL_TX_VL_MARKER_ID12_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID12;
    constant CTL_TX_VL_MARKER_ID13_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID13;
    constant CTL_TX_VL_MARKER_ID14_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID14;
    constant CTL_TX_VL_MARKER_ID15_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID15;
    constant CTL_TX_VL_MARKER_ID16_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID16;
    constant CTL_TX_VL_MARKER_ID17_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID17;
    constant CTL_TX_VL_MARKER_ID18_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID18;
    constant CTL_TX_VL_MARKER_ID19_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID19;
    constant CTL_TX_VL_MARKER_ID1_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID1;
    constant CTL_TX_VL_MARKER_ID2_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID2;
    constant CTL_TX_VL_MARKER_ID3_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID3;
    constant CTL_TX_VL_MARKER_ID4_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID4;
    constant CTL_TX_VL_MARKER_ID5_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID5;
    constant CTL_TX_VL_MARKER_ID6_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID6;
    constant CTL_TX_VL_MARKER_ID7_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID7;
    constant CTL_TX_VL_MARKER_ID8_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID8;
    constant CTL_TX_VL_MARKER_ID9_BIN : std_logic_vector(63 downto 0) := CTL_TX_VL_MARKER_ID9;

  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed
    
    signal CFG_RESET_CSSD_out : std_ulogic;
    signal CSSD_CLK_STOP_DONE_out : std_ulogic;
    signal DRP_DO_out : std_logic_vector(15 downto 0);
    signal DRP_RDY_out : std_ulogic;
    signal GRESTORE_CSSD_out : std_ulogic;
    signal GWE_CSSD_out : std_ulogic;
    signal RSFEC_BYPASS_RX_DOUT_CW_START_out : std_ulogic;
    signal RSFEC_BYPASS_RX_DOUT_VALID_out : std_ulogic;
    signal RSFEC_BYPASS_RX_DOUT_out : std_logic_vector(329 downto 0);
    signal RSFEC_BYPASS_TX_DOUT_CW_START_out : std_ulogic;
    signal RSFEC_BYPASS_TX_DOUT_VALID_out : std_ulogic;
    signal RSFEC_BYPASS_TX_DOUT_out : std_logic_vector(329 downto 0);
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
    signal RX_LANE_ALIGNER_FILL_0_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_10_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_11_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_12_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_13_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_14_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_15_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_16_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_17_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_18_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_19_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_1_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_2_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_3_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_4_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_5_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_6_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_7_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_8_out : std_logic_vector(6 downto 0);
    signal RX_LANE_ALIGNER_FILL_9_out : std_logic_vector(6 downto 0);
    signal RX_MTYOUT0_out : std_logic_vector(3 downto 0);
    signal RX_MTYOUT1_out : std_logic_vector(3 downto 0);
    signal RX_MTYOUT2_out : std_logic_vector(3 downto 0);
    signal RX_MTYOUT3_out : std_logic_vector(3 downto 0);
    signal RX_OTN_BIP8_0_out : std_logic_vector(7 downto 0);
    signal RX_OTN_BIP8_1_out : std_logic_vector(7 downto 0);
    signal RX_OTN_BIP8_2_out : std_logic_vector(7 downto 0);
    signal RX_OTN_BIP8_3_out : std_logic_vector(7 downto 0);
    signal RX_OTN_BIP8_4_out : std_logic_vector(7 downto 0);
    signal RX_OTN_DATA_0_out : std_logic_vector(65 downto 0);
    signal RX_OTN_DATA_1_out : std_logic_vector(65 downto 0);
    signal RX_OTN_DATA_2_out : std_logic_vector(65 downto 0);
    signal RX_OTN_DATA_3_out : std_logic_vector(65 downto 0);
    signal RX_OTN_DATA_4_out : std_logic_vector(65 downto 0);
    signal RX_OTN_ENA_out : std_ulogic;
    signal RX_OTN_LANE0_out : std_ulogic;
    signal RX_OTN_VLMARKER_out : std_ulogic;
    signal RX_PREOUT_out : std_logic_vector(55 downto 0);
    signal RX_PTP_PCSLANE_OUT_out : std_logic_vector(4 downto 0);
    signal RX_PTP_TSTAMP_OUT_out : std_logic_vector(79 downto 0);
    signal RX_SOPOUT0_out : std_ulogic;
    signal RX_SOPOUT1_out : std_ulogic;
    signal RX_SOPOUT2_out : std_ulogic;
    signal RX_SOPOUT3_out : std_ulogic;
    signal SCAN_OUT_out : std_logic_vector(267 downto 0);
    signal STAT_RX_ALIGNED_ERR_out : std_ulogic;
    signal STAT_RX_ALIGNED_out : std_ulogic;
    signal STAT_RX_BAD_CODE_out : std_logic_vector(2 downto 0);
    signal STAT_RX_BAD_FCS_out : std_logic_vector(2 downto 0);
    signal STAT_RX_BAD_PREAMBLE_out : std_ulogic;
    signal STAT_RX_BAD_SFD_out : std_ulogic;
    signal STAT_RX_BIP_ERR_0_out : std_ulogic;
    signal STAT_RX_BIP_ERR_10_out : std_ulogic;
    signal STAT_RX_BIP_ERR_11_out : std_ulogic;
    signal STAT_RX_BIP_ERR_12_out : std_ulogic;
    signal STAT_RX_BIP_ERR_13_out : std_ulogic;
    signal STAT_RX_BIP_ERR_14_out : std_ulogic;
    signal STAT_RX_BIP_ERR_15_out : std_ulogic;
    signal STAT_RX_BIP_ERR_16_out : std_ulogic;
    signal STAT_RX_BIP_ERR_17_out : std_ulogic;
    signal STAT_RX_BIP_ERR_18_out : std_ulogic;
    signal STAT_RX_BIP_ERR_19_out : std_ulogic;
    signal STAT_RX_BIP_ERR_1_out : std_ulogic;
    signal STAT_RX_BIP_ERR_2_out : std_ulogic;
    signal STAT_RX_BIP_ERR_3_out : std_ulogic;
    signal STAT_RX_BIP_ERR_4_out : std_ulogic;
    signal STAT_RX_BIP_ERR_5_out : std_ulogic;
    signal STAT_RX_BIP_ERR_6_out : std_ulogic;
    signal STAT_RX_BIP_ERR_7_out : std_ulogic;
    signal STAT_RX_BIP_ERR_8_out : std_ulogic;
    signal STAT_RX_BIP_ERR_9_out : std_ulogic;
    signal STAT_RX_BLOCK_LOCK_out : std_logic_vector(19 downto 0);
    signal STAT_RX_BROADCAST_out : std_ulogic;
    signal STAT_RX_FRAGMENT_out : std_logic_vector(2 downto 0);
    signal STAT_RX_FRAMING_ERR_0_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_10_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_11_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_12_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_13_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_14_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_15_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_16_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_17_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_18_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_19_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_1_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_2_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_3_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_4_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_5_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_6_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_7_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_8_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_9_out : std_logic_vector(1 downto 0);
    signal STAT_RX_FRAMING_ERR_VALID_0_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_10_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_11_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_12_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_13_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_14_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_15_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_16_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_17_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_18_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_19_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_1_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_2_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_3_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_4_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_5_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_6_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_7_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_8_out : std_ulogic;
    signal STAT_RX_FRAMING_ERR_VALID_9_out : std_ulogic;
    signal STAT_RX_GOT_SIGNAL_OS_out : std_ulogic;
    signal STAT_RX_HI_BER_out : std_ulogic;
    signal STAT_RX_INRANGEERR_out : std_ulogic;
    signal STAT_RX_INTERNAL_LOCAL_FAULT_out : std_ulogic;
    signal STAT_RX_JABBER_out : std_ulogic;
    signal STAT_RX_LANE0_VLM_BIP7_VALID_out : std_ulogic;
    signal STAT_RX_LANE0_VLM_BIP7_out : std_logic_vector(7 downto 0);
    signal STAT_RX_LOCAL_FAULT_out : std_ulogic;
    signal STAT_RX_MF_ERR_out : std_logic_vector(19 downto 0);
    signal STAT_RX_MF_LEN_ERR_out : std_logic_vector(19 downto 0);
    signal STAT_RX_MF_REPEAT_ERR_out : std_logic_vector(19 downto 0);
    signal STAT_RX_MISALIGNED_out : std_ulogic;
    signal STAT_RX_MULTICAST_out : std_ulogic;
    signal STAT_RX_OVERSIZE_out : std_ulogic;
    signal STAT_RX_PACKET_1024_1518_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_128_255_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_1519_1522_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_1523_1548_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_1549_2047_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_2048_4095_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_256_511_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_4096_8191_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_512_1023_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_64_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_65_127_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_8192_9215_BYTES_out : std_ulogic;
    signal STAT_RX_PACKET_BAD_FCS_out : std_ulogic;
    signal STAT_RX_PACKET_LARGE_out : std_ulogic;
    signal STAT_RX_PACKET_SMALL_out : std_logic_vector(2 downto 0);
    signal STAT_RX_PAUSE_QUANTA0_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA1_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA2_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA3_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA4_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA5_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA6_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA7_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_QUANTA8_out : std_logic_vector(15 downto 0);
    signal STAT_RX_PAUSE_REQ_out : std_logic_vector(8 downto 0);
    signal STAT_RX_PAUSE_VALID_out : std_logic_vector(8 downto 0);
    signal STAT_RX_PAUSE_out : std_ulogic;
    signal STAT_RX_RECEIVED_LOCAL_FAULT_out : std_ulogic;
    signal STAT_RX_REMOTE_FAULT_out : std_ulogic;
    signal STAT_RX_RSFEC_AM_LOCK0_out : std_ulogic;
    signal STAT_RX_RSFEC_AM_LOCK1_out : std_ulogic;
    signal STAT_RX_RSFEC_AM_LOCK2_out : std_ulogic;
    signal STAT_RX_RSFEC_AM_LOCK3_out : std_ulogic;
    signal STAT_RX_RSFEC_CORRECTED_CW_INC_out : std_ulogic;
    signal STAT_RX_RSFEC_CW_INC_out : std_ulogic;
    signal STAT_RX_RSFEC_ERR_COUNT0_INC_out : std_logic_vector(2 downto 0);
    signal STAT_RX_RSFEC_ERR_COUNT1_INC_out : std_logic_vector(2 downto 0);
    signal STAT_RX_RSFEC_ERR_COUNT2_INC_out : std_logic_vector(2 downto 0);
    signal STAT_RX_RSFEC_ERR_COUNT3_INC_out : std_logic_vector(2 downto 0);
    signal STAT_RX_RSFEC_HI_SER_out : std_ulogic;
    signal STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS_out : std_ulogic;
    signal STAT_RX_RSFEC_LANE_FILL_0_out : std_logic_vector(13 downto 0);
    signal STAT_RX_RSFEC_LANE_FILL_1_out : std_logic_vector(13 downto 0);
    signal STAT_RX_RSFEC_LANE_FILL_2_out : std_logic_vector(13 downto 0);
    signal STAT_RX_RSFEC_LANE_FILL_3_out : std_logic_vector(13 downto 0);
    signal STAT_RX_RSFEC_LANE_MAPPING_out : std_logic_vector(7 downto 0);
    signal STAT_RX_RSFEC_RSVD_out : std_logic_vector(31 downto 0);
    signal STAT_RX_RSFEC_UNCORRECTED_CW_INC_out : std_ulogic;
    signal STAT_RX_STATUS_out : std_ulogic;
    signal STAT_RX_STOMPED_FCS_out : std_logic_vector(2 downto 0);
    signal STAT_RX_SYNCED_ERR_out : std_logic_vector(19 downto 0);
    signal STAT_RX_SYNCED_out : std_logic_vector(19 downto 0);
    signal STAT_RX_TEST_PATTERN_MISMATCH_out : std_logic_vector(2 downto 0);
    signal STAT_RX_TOOLONG_out : std_ulogic;
    signal STAT_RX_TOTAL_BYTES_out : std_logic_vector(6 downto 0);
    signal STAT_RX_TOTAL_GOOD_BYTES_out : std_logic_vector(13 downto 0);
    signal STAT_RX_TOTAL_GOOD_PACKETS_out : std_ulogic;
    signal STAT_RX_TOTAL_PACKETS_out : std_logic_vector(2 downto 0);
    signal STAT_RX_TRUNCATED_out : std_ulogic;
    signal STAT_RX_UNDERSIZE_out : std_logic_vector(2 downto 0);
    signal STAT_RX_UNICAST_out : std_ulogic;
    signal STAT_RX_USER_PAUSE_out : std_ulogic;
    signal STAT_RX_VLAN_out : std_ulogic;
    signal STAT_RX_VL_DEMUXED_out : std_logic_vector(19 downto 0);
    signal STAT_RX_VL_NUMBER_0_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_10_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_11_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_12_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_13_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_14_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_15_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_16_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_17_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_18_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_19_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_1_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_2_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_3_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_4_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_5_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_6_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_7_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_8_out : std_logic_vector(4 downto 0);
    signal STAT_RX_VL_NUMBER_9_out : std_logic_vector(4 downto 0);
    signal STAT_TX_BAD_FCS_out : std_ulogic;
    signal STAT_TX_BROADCAST_out : std_ulogic;
    signal STAT_TX_FRAME_ERROR_out : std_ulogic;
    signal STAT_TX_LOCAL_FAULT_out : std_ulogic;
    signal STAT_TX_MULTICAST_out : std_ulogic;
    signal STAT_TX_PACKET_1024_1518_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_128_255_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_1519_1522_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_1523_1548_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_1549_2047_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_2048_4095_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_256_511_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_4096_8191_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_512_1023_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_64_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_65_127_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_8192_9215_BYTES_out : std_ulogic;
    signal STAT_TX_PACKET_LARGE_out : std_ulogic;
    signal STAT_TX_PACKET_SMALL_out : std_ulogic;
    signal STAT_TX_PAUSE_VALID_out : std_logic_vector(8 downto 0);
    signal STAT_TX_PAUSE_out : std_ulogic;
    signal STAT_TX_PTP_FIFO_READ_ERROR_out : std_ulogic;
    signal STAT_TX_PTP_FIFO_WRITE_ERROR_out : std_ulogic;
    signal STAT_TX_TOTAL_BYTES_out : std_logic_vector(5 downto 0);
    signal STAT_TX_TOTAL_GOOD_BYTES_out : std_logic_vector(13 downto 0);
    signal STAT_TX_TOTAL_GOOD_PACKETS_out : std_ulogic;
    signal STAT_TX_TOTAL_PACKETS_out : std_ulogic;
    signal STAT_TX_UNICAST_out : std_ulogic;
    signal STAT_TX_USER_PAUSE_out : std_ulogic;
    signal STAT_TX_VLAN_out : std_ulogic;
    signal TX_OVFOUT_out : std_ulogic;
    signal TX_PTP_PCSLANE_OUT_out : std_logic_vector(4 downto 0);
    signal TX_PTP_TSTAMP_OUT_out : std_logic_vector(79 downto 0);
    signal TX_PTP_TSTAMP_TAG_OUT_out : std_logic_vector(15 downto 0);
    signal TX_PTP_TSTAMP_VALID_OUT_out : std_ulogic;
    signal TX_RDYOUT_out : std_ulogic;
    signal TX_SERDES_ALT_DATA0_out : std_logic_vector(15 downto 0);
    signal TX_SERDES_ALT_DATA1_out : std_logic_vector(15 downto 0);
    signal TX_SERDES_ALT_DATA2_out : std_logic_vector(15 downto 0);
    signal TX_SERDES_ALT_DATA3_out : std_logic_vector(15 downto 0);
    signal TX_SERDES_DATA0_out : std_logic_vector(63 downto 0);
    signal TX_SERDES_DATA1_out : std_logic_vector(63 downto 0);
    signal TX_SERDES_DATA2_out : std_logic_vector(63 downto 0);
    signal TX_SERDES_DATA3_out : std_logic_vector(63 downto 0);
    signal TX_SERDES_DATA4_out : std_logic_vector(31 downto 0);
    signal TX_SERDES_DATA5_out : std_logic_vector(31 downto 0);
    signal TX_SERDES_DATA6_out : std_logic_vector(31 downto 0);
    signal TX_SERDES_DATA7_out : std_logic_vector(31 downto 0);
    signal TX_SERDES_DATA8_out : std_logic_vector(31 downto 0);
    signal TX_SERDES_DATA9_out : std_logic_vector(31 downto 0);
    signal TX_UNFOUT_out : std_ulogic;
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CSSD_CLK_STOP_EVENT_in : std_ulogic;
    signal CSSD_RESETN_in : std_ulogic;
    signal CTL_CAUI4_MODE_in : std_ulogic;
    signal CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE_in : std_ulogic;
    signal CTL_RSFEC_IEEE_ERROR_INDICATION_MODE_in : std_ulogic;
    signal CTL_RX_CHECK_ETYPE_GCP_in : std_ulogic;
    signal CTL_RX_CHECK_ETYPE_GPP_in : std_ulogic;
    signal CTL_RX_CHECK_ETYPE_PCP_in : std_ulogic;
    signal CTL_RX_CHECK_ETYPE_PPP_in : std_ulogic;
    signal CTL_RX_CHECK_MCAST_GCP_in : std_ulogic;
    signal CTL_RX_CHECK_MCAST_GPP_in : std_ulogic;
    signal CTL_RX_CHECK_MCAST_PCP_in : std_ulogic;
    signal CTL_RX_CHECK_MCAST_PPP_in : std_ulogic;
    signal CTL_RX_CHECK_OPCODE_GCP_in : std_ulogic;
    signal CTL_RX_CHECK_OPCODE_GPP_in : std_ulogic;
    signal CTL_RX_CHECK_OPCODE_PCP_in : std_ulogic;
    signal CTL_RX_CHECK_OPCODE_PPP_in : std_ulogic;
    signal CTL_RX_CHECK_SA_GCP_in : std_ulogic;
    signal CTL_RX_CHECK_SA_GPP_in : std_ulogic;
    signal CTL_RX_CHECK_SA_PCP_in : std_ulogic;
    signal CTL_RX_CHECK_SA_PPP_in : std_ulogic;
    signal CTL_RX_CHECK_UCAST_GCP_in : std_ulogic;
    signal CTL_RX_CHECK_UCAST_GPP_in : std_ulogic;
    signal CTL_RX_CHECK_UCAST_PCP_in : std_ulogic;
    signal CTL_RX_CHECK_UCAST_PPP_in : std_ulogic;
    signal CTL_RX_ENABLE_GCP_in : std_ulogic;
    signal CTL_RX_ENABLE_GPP_in : std_ulogic;
    signal CTL_RX_ENABLE_PCP_in : std_ulogic;
    signal CTL_RX_ENABLE_PPP_in : std_ulogic;
    signal CTL_RX_ENABLE_in : std_ulogic;
    signal CTL_RX_FORCE_RESYNC_in : std_ulogic;
    signal CTL_RX_PAUSE_ACK_in : std_logic_vector(8 downto 0);
    signal CTL_RX_PAUSE_ENABLE_in : std_logic_vector(8 downto 0);
    signal CTL_RX_RSFEC_ENABLE_CORRECTION_in : std_ulogic;
    signal CTL_RX_RSFEC_ENABLE_INDICATION_in : std_ulogic;
    signal CTL_RX_RSFEC_ENABLE_in : std_ulogic;
    signal CTL_RX_SYSTEMTIMERIN_in : std_logic_vector(79 downto 0);
    signal CTL_RX_TEST_PATTERN_in : std_ulogic;
    signal CTL_TX_ENABLE_in : std_ulogic;
    signal CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE_in : std_logic_vector(7 downto 0);
    signal CTL_TX_LANE0_VLM_BIP7_OVERRIDE_in : std_ulogic;
    signal CTL_TX_PAUSE_ENABLE_in : std_logic_vector(8 downto 0);
    signal CTL_TX_PAUSE_QUANTA0_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA1_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA2_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA3_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA4_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA5_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA6_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA7_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_QUANTA8_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER0_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER1_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER2_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER3_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER4_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER5_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER6_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER7_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REFRESH_TIMER8_in : std_logic_vector(15 downto 0);
    signal CTL_TX_PAUSE_REQ_in : std_logic_vector(8 downto 0);
    signal CTL_TX_PTP_VLANE_ADJUST_MODE_in : std_ulogic;
    signal CTL_TX_RESEND_PAUSE_in : std_ulogic;
    signal CTL_TX_RSFEC_ENABLE_in : std_ulogic;
    signal CTL_TX_SEND_IDLE_in : std_ulogic;
    signal CTL_TX_SEND_LFI_in : std_ulogic;
    signal CTL_TX_SEND_RFI_in : std_ulogic;
    signal CTL_TX_SYSTEMTIMERIN_in : std_logic_vector(79 downto 0);
    signal CTL_TX_TEST_PATTERN_in : std_ulogic;
    signal DRP_ADDR_in : std_logic_vector(9 downto 0);
    signal DRP_CLK_in : std_ulogic;
    signal DRP_DI_in : std_logic_vector(15 downto 0);
    signal DRP_EN_in : std_ulogic;
    signal DRP_WE_in : std_ulogic;
    signal RSFEC_BYPASS_RX_DIN_CW_START_in : std_ulogic;
    signal RSFEC_BYPASS_RX_DIN_in : std_logic_vector(329 downto 0);
    signal RSFEC_BYPASS_TX_DIN_CW_START_in : std_ulogic;
    signal RSFEC_BYPASS_TX_DIN_in : std_logic_vector(329 downto 0);
    signal RX_CLK_in : std_ulogic;
    signal RX_RESET_in : std_ulogic;
    signal RX_SERDES_ALT_DATA0_in : std_logic_vector(15 downto 0);
    signal RX_SERDES_ALT_DATA1_in : std_logic_vector(15 downto 0);
    signal RX_SERDES_ALT_DATA2_in : std_logic_vector(15 downto 0);
    signal RX_SERDES_ALT_DATA3_in : std_logic_vector(15 downto 0);
    signal RX_SERDES_CLK_in : std_logic_vector(9 downto 0);
    signal RX_SERDES_DATA0_in : std_logic_vector(63 downto 0);
    signal RX_SERDES_DATA1_in : std_logic_vector(63 downto 0);
    signal RX_SERDES_DATA2_in : std_logic_vector(63 downto 0);
    signal RX_SERDES_DATA3_in : std_logic_vector(63 downto 0);
    signal RX_SERDES_DATA4_in : std_logic_vector(31 downto 0);
    signal RX_SERDES_DATA5_in : std_logic_vector(31 downto 0);
    signal RX_SERDES_DATA6_in : std_logic_vector(31 downto 0);
    signal RX_SERDES_DATA7_in : std_logic_vector(31 downto 0);
    signal RX_SERDES_DATA8_in : std_logic_vector(31 downto 0);
    signal RX_SERDES_DATA9_in : std_logic_vector(31 downto 0);
    signal RX_SERDES_RESET_in : std_logic_vector(9 downto 0);
    signal SCAN_CLK_in : std_ulogic;
    signal SCAN_EN_N_in : std_ulogic;
    signal SCAN_IN_in : std_logic_vector(267 downto 0);
    signal TEST_MODE_N_in : std_ulogic;
    signal TEST_RESET_in : std_ulogic;
    signal TX_CLK_in : std_ulogic;
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
    signal TX_PREIN_in : std_logic_vector(55 downto 0);
    signal TX_PTP_1588OP_IN_in : std_logic_vector(1 downto 0);
    signal TX_PTP_CHKSUM_OFFSET_IN_in : std_logic_vector(15 downto 0);
    signal TX_PTP_RXTSTAMP_IN_in : std_logic_vector(63 downto 0);
    signal TX_PTP_TAG_FIELD_IN_in : std_logic_vector(15 downto 0);
    signal TX_PTP_TSTAMP_OFFSET_IN_in : std_logic_vector(15 downto 0);
    signal TX_PTP_UPD_CHKSUM_IN_in : std_ulogic;
    signal TX_RESET_in : std_ulogic;
    signal TX_SOPIN0_in : std_ulogic;
    signal TX_SOPIN1_in : std_ulogic;
    signal TX_SOPIN2_in : std_ulogic;
    signal TX_SOPIN3_in : std_ulogic;
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    DRP_DO <= DRP_DO_out after OUT_DELAY;
    DRP_RDY <= DRP_RDY_out after OUT_DELAY;
    RSFEC_BYPASS_RX_DOUT <= RSFEC_BYPASS_RX_DOUT_out after OUT_DELAY;
    RSFEC_BYPASS_RX_DOUT_CW_START <= RSFEC_BYPASS_RX_DOUT_CW_START_out after OUT_DELAY;
    RSFEC_BYPASS_RX_DOUT_VALID <= RSFEC_BYPASS_RX_DOUT_VALID_out after OUT_DELAY;
    RSFEC_BYPASS_TX_DOUT <= RSFEC_BYPASS_TX_DOUT_out after OUT_DELAY;
    RSFEC_BYPASS_TX_DOUT_CW_START <= RSFEC_BYPASS_TX_DOUT_CW_START_out after OUT_DELAY;
    RSFEC_BYPASS_TX_DOUT_VALID <= RSFEC_BYPASS_TX_DOUT_VALID_out after OUT_DELAY;
    RX_DATAOUT0 <= RX_DATAOUT0_out after OUT_DELAY;
    RX_DATAOUT1 <= RX_DATAOUT1_out after OUT_DELAY;
    RX_DATAOUT2 <= RX_DATAOUT2_out after OUT_DELAY;
    RX_DATAOUT3 <= RX_DATAOUT3_out after OUT_DELAY;
    RX_ENAOUT0 <= RX_ENAOUT0_out after OUT_DELAY;
    RX_ENAOUT1 <= RX_ENAOUT1_out after OUT_DELAY;
    RX_ENAOUT2 <= RX_ENAOUT2_out after OUT_DELAY;
    RX_ENAOUT3 <= RX_ENAOUT3_out after OUT_DELAY;
    RX_EOPOUT0 <= RX_EOPOUT0_out after OUT_DELAY;
    RX_EOPOUT1 <= RX_EOPOUT1_out after OUT_DELAY;
    RX_EOPOUT2 <= RX_EOPOUT2_out after OUT_DELAY;
    RX_EOPOUT3 <= RX_EOPOUT3_out after OUT_DELAY;
    RX_ERROUT0 <= RX_ERROUT0_out after OUT_DELAY;
    RX_ERROUT1 <= RX_ERROUT1_out after OUT_DELAY;
    RX_ERROUT2 <= RX_ERROUT2_out after OUT_DELAY;
    RX_ERROUT3 <= RX_ERROUT3_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_0 <= RX_LANE_ALIGNER_FILL_0_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_1 <= RX_LANE_ALIGNER_FILL_1_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_10 <= RX_LANE_ALIGNER_FILL_10_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_11 <= RX_LANE_ALIGNER_FILL_11_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_12 <= RX_LANE_ALIGNER_FILL_12_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_13 <= RX_LANE_ALIGNER_FILL_13_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_14 <= RX_LANE_ALIGNER_FILL_14_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_15 <= RX_LANE_ALIGNER_FILL_15_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_16 <= RX_LANE_ALIGNER_FILL_16_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_17 <= RX_LANE_ALIGNER_FILL_17_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_18 <= RX_LANE_ALIGNER_FILL_18_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_19 <= RX_LANE_ALIGNER_FILL_19_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_2 <= RX_LANE_ALIGNER_FILL_2_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_3 <= RX_LANE_ALIGNER_FILL_3_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_4 <= RX_LANE_ALIGNER_FILL_4_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_5 <= RX_LANE_ALIGNER_FILL_5_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_6 <= RX_LANE_ALIGNER_FILL_6_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_7 <= RX_LANE_ALIGNER_FILL_7_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_8 <= RX_LANE_ALIGNER_FILL_8_out after OUT_DELAY;
    RX_LANE_ALIGNER_FILL_9 <= RX_LANE_ALIGNER_FILL_9_out after OUT_DELAY;
    RX_MTYOUT0 <= RX_MTYOUT0_out after OUT_DELAY;
    RX_MTYOUT1 <= RX_MTYOUT1_out after OUT_DELAY;
    RX_MTYOUT2 <= RX_MTYOUT2_out after OUT_DELAY;
    RX_MTYOUT3 <= RX_MTYOUT3_out after OUT_DELAY;
    RX_OTN_BIP8_0 <= RX_OTN_BIP8_0_out after OUT_DELAY;
    RX_OTN_BIP8_1 <= RX_OTN_BIP8_1_out after OUT_DELAY;
    RX_OTN_BIP8_2 <= RX_OTN_BIP8_2_out after OUT_DELAY;
    RX_OTN_BIP8_3 <= RX_OTN_BIP8_3_out after OUT_DELAY;
    RX_OTN_BIP8_4 <= RX_OTN_BIP8_4_out after OUT_DELAY;
    RX_OTN_DATA_0 <= RX_OTN_DATA_0_out after OUT_DELAY;
    RX_OTN_DATA_1 <= RX_OTN_DATA_1_out after OUT_DELAY;
    RX_OTN_DATA_2 <= RX_OTN_DATA_2_out after OUT_DELAY;
    RX_OTN_DATA_3 <= RX_OTN_DATA_3_out after OUT_DELAY;
    RX_OTN_DATA_4 <= RX_OTN_DATA_4_out after OUT_DELAY;
    RX_OTN_ENA <= RX_OTN_ENA_out after OUT_DELAY;
    RX_OTN_LANE0 <= RX_OTN_LANE0_out after OUT_DELAY;
    RX_OTN_VLMARKER <= RX_OTN_VLMARKER_out after OUT_DELAY;
    RX_PREOUT <= RX_PREOUT_out after OUT_DELAY;
    RX_PTP_PCSLANE_OUT <= RX_PTP_PCSLANE_OUT_out after OUT_DELAY;
    RX_PTP_TSTAMP_OUT <= RX_PTP_TSTAMP_OUT_out after OUT_DELAY;
    RX_SOPOUT0 <= RX_SOPOUT0_out after OUT_DELAY;
    RX_SOPOUT1 <= RX_SOPOUT1_out after OUT_DELAY;
    RX_SOPOUT2 <= RX_SOPOUT2_out after OUT_DELAY;
    RX_SOPOUT3 <= RX_SOPOUT3_out after OUT_DELAY;
    STAT_RX_ALIGNED <= STAT_RX_ALIGNED_out after OUT_DELAY;
    STAT_RX_ALIGNED_ERR <= STAT_RX_ALIGNED_ERR_out after OUT_DELAY;
    STAT_RX_BAD_CODE <= STAT_RX_BAD_CODE_out after OUT_DELAY;
    STAT_RX_BAD_FCS <= STAT_RX_BAD_FCS_out after OUT_DELAY;
    STAT_RX_BAD_PREAMBLE <= STAT_RX_BAD_PREAMBLE_out after OUT_DELAY;
    STAT_RX_BAD_SFD <= STAT_RX_BAD_SFD_out after OUT_DELAY;
    STAT_RX_BIP_ERR_0 <= STAT_RX_BIP_ERR_0_out after OUT_DELAY;
    STAT_RX_BIP_ERR_1 <= STAT_RX_BIP_ERR_1_out after OUT_DELAY;
    STAT_RX_BIP_ERR_10 <= STAT_RX_BIP_ERR_10_out after OUT_DELAY;
    STAT_RX_BIP_ERR_11 <= STAT_RX_BIP_ERR_11_out after OUT_DELAY;
    STAT_RX_BIP_ERR_12 <= STAT_RX_BIP_ERR_12_out after OUT_DELAY;
    STAT_RX_BIP_ERR_13 <= STAT_RX_BIP_ERR_13_out after OUT_DELAY;
    STAT_RX_BIP_ERR_14 <= STAT_RX_BIP_ERR_14_out after OUT_DELAY;
    STAT_RX_BIP_ERR_15 <= STAT_RX_BIP_ERR_15_out after OUT_DELAY;
    STAT_RX_BIP_ERR_16 <= STAT_RX_BIP_ERR_16_out after OUT_DELAY;
    STAT_RX_BIP_ERR_17 <= STAT_RX_BIP_ERR_17_out after OUT_DELAY;
    STAT_RX_BIP_ERR_18 <= STAT_RX_BIP_ERR_18_out after OUT_DELAY;
    STAT_RX_BIP_ERR_19 <= STAT_RX_BIP_ERR_19_out after OUT_DELAY;
    STAT_RX_BIP_ERR_2 <= STAT_RX_BIP_ERR_2_out after OUT_DELAY;
    STAT_RX_BIP_ERR_3 <= STAT_RX_BIP_ERR_3_out after OUT_DELAY;
    STAT_RX_BIP_ERR_4 <= STAT_RX_BIP_ERR_4_out after OUT_DELAY;
    STAT_RX_BIP_ERR_5 <= STAT_RX_BIP_ERR_5_out after OUT_DELAY;
    STAT_RX_BIP_ERR_6 <= STAT_RX_BIP_ERR_6_out after OUT_DELAY;
    STAT_RX_BIP_ERR_7 <= STAT_RX_BIP_ERR_7_out after OUT_DELAY;
    STAT_RX_BIP_ERR_8 <= STAT_RX_BIP_ERR_8_out after OUT_DELAY;
    STAT_RX_BIP_ERR_9 <= STAT_RX_BIP_ERR_9_out after OUT_DELAY;
    STAT_RX_BLOCK_LOCK <= STAT_RX_BLOCK_LOCK_out after OUT_DELAY;
    STAT_RX_BROADCAST <= STAT_RX_BROADCAST_out after OUT_DELAY;
    STAT_RX_FRAGMENT <= STAT_RX_FRAGMENT_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_0 <= STAT_RX_FRAMING_ERR_0_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_1 <= STAT_RX_FRAMING_ERR_1_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_10 <= STAT_RX_FRAMING_ERR_10_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_11 <= STAT_RX_FRAMING_ERR_11_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_12 <= STAT_RX_FRAMING_ERR_12_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_13 <= STAT_RX_FRAMING_ERR_13_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_14 <= STAT_RX_FRAMING_ERR_14_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_15 <= STAT_RX_FRAMING_ERR_15_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_16 <= STAT_RX_FRAMING_ERR_16_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_17 <= STAT_RX_FRAMING_ERR_17_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_18 <= STAT_RX_FRAMING_ERR_18_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_19 <= STAT_RX_FRAMING_ERR_19_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_2 <= STAT_RX_FRAMING_ERR_2_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_3 <= STAT_RX_FRAMING_ERR_3_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_4 <= STAT_RX_FRAMING_ERR_4_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_5 <= STAT_RX_FRAMING_ERR_5_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_6 <= STAT_RX_FRAMING_ERR_6_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_7 <= STAT_RX_FRAMING_ERR_7_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_8 <= STAT_RX_FRAMING_ERR_8_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_9 <= STAT_RX_FRAMING_ERR_9_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_0 <= STAT_RX_FRAMING_ERR_VALID_0_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_1 <= STAT_RX_FRAMING_ERR_VALID_1_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_10 <= STAT_RX_FRAMING_ERR_VALID_10_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_11 <= STAT_RX_FRAMING_ERR_VALID_11_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_12 <= STAT_RX_FRAMING_ERR_VALID_12_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_13 <= STAT_RX_FRAMING_ERR_VALID_13_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_14 <= STAT_RX_FRAMING_ERR_VALID_14_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_15 <= STAT_RX_FRAMING_ERR_VALID_15_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_16 <= STAT_RX_FRAMING_ERR_VALID_16_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_17 <= STAT_RX_FRAMING_ERR_VALID_17_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_18 <= STAT_RX_FRAMING_ERR_VALID_18_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_19 <= STAT_RX_FRAMING_ERR_VALID_19_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_2 <= STAT_RX_FRAMING_ERR_VALID_2_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_3 <= STAT_RX_FRAMING_ERR_VALID_3_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_4 <= STAT_RX_FRAMING_ERR_VALID_4_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_5 <= STAT_RX_FRAMING_ERR_VALID_5_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_6 <= STAT_RX_FRAMING_ERR_VALID_6_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_7 <= STAT_RX_FRAMING_ERR_VALID_7_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_8 <= STAT_RX_FRAMING_ERR_VALID_8_out after OUT_DELAY;
    STAT_RX_FRAMING_ERR_VALID_9 <= STAT_RX_FRAMING_ERR_VALID_9_out after OUT_DELAY;
    STAT_RX_GOT_SIGNAL_OS <= STAT_RX_GOT_SIGNAL_OS_out after OUT_DELAY;
    STAT_RX_HI_BER <= STAT_RX_HI_BER_out after OUT_DELAY;
    STAT_RX_INRANGEERR <= STAT_RX_INRANGEERR_out after OUT_DELAY;
    STAT_RX_INTERNAL_LOCAL_FAULT <= STAT_RX_INTERNAL_LOCAL_FAULT_out after OUT_DELAY;
    STAT_RX_JABBER <= STAT_RX_JABBER_out after OUT_DELAY;
    STAT_RX_LANE0_VLM_BIP7 <= STAT_RX_LANE0_VLM_BIP7_out after OUT_DELAY;
    STAT_RX_LANE0_VLM_BIP7_VALID <= STAT_RX_LANE0_VLM_BIP7_VALID_out after OUT_DELAY;
    STAT_RX_LOCAL_FAULT <= STAT_RX_LOCAL_FAULT_out after OUT_DELAY;
    STAT_RX_MF_ERR <= STAT_RX_MF_ERR_out after OUT_DELAY;
    STAT_RX_MF_LEN_ERR <= STAT_RX_MF_LEN_ERR_out after OUT_DELAY;
    STAT_RX_MF_REPEAT_ERR <= STAT_RX_MF_REPEAT_ERR_out after OUT_DELAY;
    STAT_RX_MISALIGNED <= STAT_RX_MISALIGNED_out after OUT_DELAY;
    STAT_RX_MULTICAST <= STAT_RX_MULTICAST_out after OUT_DELAY;
    STAT_RX_OVERSIZE <= STAT_RX_OVERSIZE_out after OUT_DELAY;
    STAT_RX_PACKET_1024_1518_BYTES <= STAT_RX_PACKET_1024_1518_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_128_255_BYTES <= STAT_RX_PACKET_128_255_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_1519_1522_BYTES <= STAT_RX_PACKET_1519_1522_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_1523_1548_BYTES <= STAT_RX_PACKET_1523_1548_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_1549_2047_BYTES <= STAT_RX_PACKET_1549_2047_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_2048_4095_BYTES <= STAT_RX_PACKET_2048_4095_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_256_511_BYTES <= STAT_RX_PACKET_256_511_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_4096_8191_BYTES <= STAT_RX_PACKET_4096_8191_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_512_1023_BYTES <= STAT_RX_PACKET_512_1023_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_64_BYTES <= STAT_RX_PACKET_64_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_65_127_BYTES <= STAT_RX_PACKET_65_127_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_8192_9215_BYTES <= STAT_RX_PACKET_8192_9215_BYTES_out after OUT_DELAY;
    STAT_RX_PACKET_BAD_FCS <= STAT_RX_PACKET_BAD_FCS_out after OUT_DELAY;
    STAT_RX_PACKET_LARGE <= STAT_RX_PACKET_LARGE_out after OUT_DELAY;
    STAT_RX_PACKET_SMALL <= STAT_RX_PACKET_SMALL_out after OUT_DELAY;
    STAT_RX_PAUSE <= STAT_RX_PAUSE_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA0 <= STAT_RX_PAUSE_QUANTA0_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA1 <= STAT_RX_PAUSE_QUANTA1_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA2 <= STAT_RX_PAUSE_QUANTA2_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA3 <= STAT_RX_PAUSE_QUANTA3_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA4 <= STAT_RX_PAUSE_QUANTA4_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA5 <= STAT_RX_PAUSE_QUANTA5_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA6 <= STAT_RX_PAUSE_QUANTA6_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA7 <= STAT_RX_PAUSE_QUANTA7_out after OUT_DELAY;
    STAT_RX_PAUSE_QUANTA8 <= STAT_RX_PAUSE_QUANTA8_out after OUT_DELAY;
    STAT_RX_PAUSE_REQ <= STAT_RX_PAUSE_REQ_out after OUT_DELAY;
    STAT_RX_PAUSE_VALID <= STAT_RX_PAUSE_VALID_out after OUT_DELAY;
    STAT_RX_RECEIVED_LOCAL_FAULT <= STAT_RX_RECEIVED_LOCAL_FAULT_out after OUT_DELAY;
    STAT_RX_REMOTE_FAULT <= STAT_RX_REMOTE_FAULT_out after OUT_DELAY;
    STAT_RX_RSFEC_AM_LOCK0 <= STAT_RX_RSFEC_AM_LOCK0_out after OUT_DELAY;
    STAT_RX_RSFEC_AM_LOCK1 <= STAT_RX_RSFEC_AM_LOCK1_out after OUT_DELAY;
    STAT_RX_RSFEC_AM_LOCK2 <= STAT_RX_RSFEC_AM_LOCK2_out after OUT_DELAY;
    STAT_RX_RSFEC_AM_LOCK3 <= STAT_RX_RSFEC_AM_LOCK3_out after OUT_DELAY;
    STAT_RX_RSFEC_CORRECTED_CW_INC <= STAT_RX_RSFEC_CORRECTED_CW_INC_out after OUT_DELAY;
    STAT_RX_RSFEC_CW_INC <= STAT_RX_RSFEC_CW_INC_out after OUT_DELAY;
    STAT_RX_RSFEC_ERR_COUNT0_INC <= STAT_RX_RSFEC_ERR_COUNT0_INC_out after OUT_DELAY;
    STAT_RX_RSFEC_ERR_COUNT1_INC <= STAT_RX_RSFEC_ERR_COUNT1_INC_out after OUT_DELAY;
    STAT_RX_RSFEC_ERR_COUNT2_INC <= STAT_RX_RSFEC_ERR_COUNT2_INC_out after OUT_DELAY;
    STAT_RX_RSFEC_ERR_COUNT3_INC <= STAT_RX_RSFEC_ERR_COUNT3_INC_out after OUT_DELAY;
    STAT_RX_RSFEC_HI_SER <= STAT_RX_RSFEC_HI_SER_out after OUT_DELAY;
    STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS <= STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS_out after OUT_DELAY;
    STAT_RX_RSFEC_LANE_FILL_0 <= STAT_RX_RSFEC_LANE_FILL_0_out after OUT_DELAY;
    STAT_RX_RSFEC_LANE_FILL_1 <= STAT_RX_RSFEC_LANE_FILL_1_out after OUT_DELAY;
    STAT_RX_RSFEC_LANE_FILL_2 <= STAT_RX_RSFEC_LANE_FILL_2_out after OUT_DELAY;
    STAT_RX_RSFEC_LANE_FILL_3 <= STAT_RX_RSFEC_LANE_FILL_3_out after OUT_DELAY;
    STAT_RX_RSFEC_LANE_MAPPING <= STAT_RX_RSFEC_LANE_MAPPING_out after OUT_DELAY;
    STAT_RX_RSFEC_RSVD <= STAT_RX_RSFEC_RSVD_out after OUT_DELAY;
    STAT_RX_RSFEC_UNCORRECTED_CW_INC <= STAT_RX_RSFEC_UNCORRECTED_CW_INC_out after OUT_DELAY;
    STAT_RX_STATUS <= STAT_RX_STATUS_out after OUT_DELAY;
    STAT_RX_STOMPED_FCS <= STAT_RX_STOMPED_FCS_out after OUT_DELAY;
    STAT_RX_SYNCED <= STAT_RX_SYNCED_out after OUT_DELAY;
    STAT_RX_SYNCED_ERR <= STAT_RX_SYNCED_ERR_out after OUT_DELAY;
    STAT_RX_TEST_PATTERN_MISMATCH <= STAT_RX_TEST_PATTERN_MISMATCH_out after OUT_DELAY;
    STAT_RX_TOOLONG <= STAT_RX_TOOLONG_out after OUT_DELAY;
    STAT_RX_TOTAL_BYTES <= STAT_RX_TOTAL_BYTES_out after OUT_DELAY;
    STAT_RX_TOTAL_GOOD_BYTES <= STAT_RX_TOTAL_GOOD_BYTES_out after OUT_DELAY;
    STAT_RX_TOTAL_GOOD_PACKETS <= STAT_RX_TOTAL_GOOD_PACKETS_out after OUT_DELAY;
    STAT_RX_TOTAL_PACKETS <= STAT_RX_TOTAL_PACKETS_out after OUT_DELAY;
    STAT_RX_TRUNCATED <= STAT_RX_TRUNCATED_out after OUT_DELAY;
    STAT_RX_UNDERSIZE <= STAT_RX_UNDERSIZE_out after OUT_DELAY;
    STAT_RX_UNICAST <= STAT_RX_UNICAST_out after OUT_DELAY;
    STAT_RX_USER_PAUSE <= STAT_RX_USER_PAUSE_out after OUT_DELAY;
    STAT_RX_VLAN <= STAT_RX_VLAN_out after OUT_DELAY;
    STAT_RX_VL_DEMUXED <= STAT_RX_VL_DEMUXED_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_0 <= STAT_RX_VL_NUMBER_0_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_1 <= STAT_RX_VL_NUMBER_1_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_10 <= STAT_RX_VL_NUMBER_10_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_11 <= STAT_RX_VL_NUMBER_11_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_12 <= STAT_RX_VL_NUMBER_12_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_13 <= STAT_RX_VL_NUMBER_13_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_14 <= STAT_RX_VL_NUMBER_14_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_15 <= STAT_RX_VL_NUMBER_15_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_16 <= STAT_RX_VL_NUMBER_16_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_17 <= STAT_RX_VL_NUMBER_17_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_18 <= STAT_RX_VL_NUMBER_18_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_19 <= STAT_RX_VL_NUMBER_19_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_2 <= STAT_RX_VL_NUMBER_2_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_3 <= STAT_RX_VL_NUMBER_3_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_4 <= STAT_RX_VL_NUMBER_4_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_5 <= STAT_RX_VL_NUMBER_5_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_6 <= STAT_RX_VL_NUMBER_6_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_7 <= STAT_RX_VL_NUMBER_7_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_8 <= STAT_RX_VL_NUMBER_8_out after OUT_DELAY;
    STAT_RX_VL_NUMBER_9 <= STAT_RX_VL_NUMBER_9_out after OUT_DELAY;
    STAT_TX_BAD_FCS <= STAT_TX_BAD_FCS_out after OUT_DELAY;
    STAT_TX_BROADCAST <= STAT_TX_BROADCAST_out after OUT_DELAY;
    STAT_TX_FRAME_ERROR <= STAT_TX_FRAME_ERROR_out after OUT_DELAY;
    STAT_TX_LOCAL_FAULT <= STAT_TX_LOCAL_FAULT_out after OUT_DELAY;
    STAT_TX_MULTICAST <= STAT_TX_MULTICAST_out after OUT_DELAY;
    STAT_TX_PACKET_1024_1518_BYTES <= STAT_TX_PACKET_1024_1518_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_128_255_BYTES <= STAT_TX_PACKET_128_255_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_1519_1522_BYTES <= STAT_TX_PACKET_1519_1522_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_1523_1548_BYTES <= STAT_TX_PACKET_1523_1548_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_1549_2047_BYTES <= STAT_TX_PACKET_1549_2047_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_2048_4095_BYTES <= STAT_TX_PACKET_2048_4095_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_256_511_BYTES <= STAT_TX_PACKET_256_511_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_4096_8191_BYTES <= STAT_TX_PACKET_4096_8191_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_512_1023_BYTES <= STAT_TX_PACKET_512_1023_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_64_BYTES <= STAT_TX_PACKET_64_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_65_127_BYTES <= STAT_TX_PACKET_65_127_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_8192_9215_BYTES <= STAT_TX_PACKET_8192_9215_BYTES_out after OUT_DELAY;
    STAT_TX_PACKET_LARGE <= STAT_TX_PACKET_LARGE_out after OUT_DELAY;
    STAT_TX_PACKET_SMALL <= STAT_TX_PACKET_SMALL_out after OUT_DELAY;
    STAT_TX_PAUSE <= STAT_TX_PAUSE_out after OUT_DELAY;
    STAT_TX_PAUSE_VALID <= STAT_TX_PAUSE_VALID_out after OUT_DELAY;
    STAT_TX_PTP_FIFO_READ_ERROR <= STAT_TX_PTP_FIFO_READ_ERROR_out after OUT_DELAY;
    STAT_TX_PTP_FIFO_WRITE_ERROR <= STAT_TX_PTP_FIFO_WRITE_ERROR_out after OUT_DELAY;
    STAT_TX_TOTAL_BYTES <= STAT_TX_TOTAL_BYTES_out after OUT_DELAY;
    STAT_TX_TOTAL_GOOD_BYTES <= STAT_TX_TOTAL_GOOD_BYTES_out after OUT_DELAY;
    STAT_TX_TOTAL_GOOD_PACKETS <= STAT_TX_TOTAL_GOOD_PACKETS_out after OUT_DELAY;
    STAT_TX_TOTAL_PACKETS <= STAT_TX_TOTAL_PACKETS_out after OUT_DELAY;
    STAT_TX_UNICAST <= STAT_TX_UNICAST_out after OUT_DELAY;
    STAT_TX_USER_PAUSE <= STAT_TX_USER_PAUSE_out after OUT_DELAY;
    STAT_TX_VLAN <= STAT_TX_VLAN_out after OUT_DELAY;
    TX_OVFOUT <= TX_OVFOUT_out after OUT_DELAY;
    TX_PTP_PCSLANE_OUT <= TX_PTP_PCSLANE_OUT_out after OUT_DELAY;
    TX_PTP_TSTAMP_OUT <= TX_PTP_TSTAMP_OUT_out after OUT_DELAY;
    TX_PTP_TSTAMP_TAG_OUT <= TX_PTP_TSTAMP_TAG_OUT_out after OUT_DELAY;
    TX_PTP_TSTAMP_VALID_OUT <= TX_PTP_TSTAMP_VALID_OUT_out after OUT_DELAY;
    TX_RDYOUT <= TX_RDYOUT_out after OUT_DELAY;
    TX_SERDES_ALT_DATA0 <= TX_SERDES_ALT_DATA0_out after OUT_DELAY;
    TX_SERDES_ALT_DATA1 <= TX_SERDES_ALT_DATA1_out after OUT_DELAY;
    TX_SERDES_ALT_DATA2 <= TX_SERDES_ALT_DATA2_out after OUT_DELAY;
    TX_SERDES_ALT_DATA3 <= TX_SERDES_ALT_DATA3_out after OUT_DELAY;
    TX_SERDES_DATA0 <= TX_SERDES_DATA0_out after OUT_DELAY;
    TX_SERDES_DATA1 <= TX_SERDES_DATA1_out after OUT_DELAY;
    TX_SERDES_DATA2 <= TX_SERDES_DATA2_out after OUT_DELAY;
    TX_SERDES_DATA3 <= TX_SERDES_DATA3_out after OUT_DELAY;
    TX_SERDES_DATA4 <= TX_SERDES_DATA4_out after OUT_DELAY;
    TX_SERDES_DATA5 <= TX_SERDES_DATA5_out after OUT_DELAY;
    TX_SERDES_DATA6 <= TX_SERDES_DATA6_out after OUT_DELAY;
    TX_SERDES_DATA7 <= TX_SERDES_DATA7_out after OUT_DELAY;
    TX_SERDES_DATA8 <= TX_SERDES_DATA8_out after OUT_DELAY;
    TX_SERDES_DATA9 <= TX_SERDES_DATA9_out after OUT_DELAY;
    TX_UNFOUT <= TX_UNFOUT_out after OUT_DELAY;
    
    CTL_CAUI4_MODE_in <= CTL_CAUI4_MODE;
    CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE_in <= CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE;
    CTL_RSFEC_IEEE_ERROR_INDICATION_MODE_in <= CTL_RSFEC_IEEE_ERROR_INDICATION_MODE;
    CTL_RX_CHECK_ETYPE_GCP_in <= CTL_RX_CHECK_ETYPE_GCP;
    CTL_RX_CHECK_ETYPE_GPP_in <= CTL_RX_CHECK_ETYPE_GPP;
    CTL_RX_CHECK_ETYPE_PCP_in <= CTL_RX_CHECK_ETYPE_PCP;
    CTL_RX_CHECK_ETYPE_PPP_in <= CTL_RX_CHECK_ETYPE_PPP;
    CTL_RX_CHECK_MCAST_GCP_in <= CTL_RX_CHECK_MCAST_GCP;
    CTL_RX_CHECK_MCAST_GPP_in <= CTL_RX_CHECK_MCAST_GPP;
    CTL_RX_CHECK_MCAST_PCP_in <= CTL_RX_CHECK_MCAST_PCP;
    CTL_RX_CHECK_MCAST_PPP_in <= CTL_RX_CHECK_MCAST_PPP;
    CTL_RX_CHECK_OPCODE_GCP_in <= CTL_RX_CHECK_OPCODE_GCP;
    CTL_RX_CHECK_OPCODE_GPP_in <= CTL_RX_CHECK_OPCODE_GPP;
    CTL_RX_CHECK_OPCODE_PCP_in <= CTL_RX_CHECK_OPCODE_PCP;
    CTL_RX_CHECK_OPCODE_PPP_in <= CTL_RX_CHECK_OPCODE_PPP;
    CTL_RX_CHECK_SA_GCP_in <= CTL_RX_CHECK_SA_GCP;
    CTL_RX_CHECK_SA_GPP_in <= CTL_RX_CHECK_SA_GPP;
    CTL_RX_CHECK_SA_PCP_in <= CTL_RX_CHECK_SA_PCP;
    CTL_RX_CHECK_SA_PPP_in <= CTL_RX_CHECK_SA_PPP;
    CTL_RX_CHECK_UCAST_GCP_in <= CTL_RX_CHECK_UCAST_GCP;
    CTL_RX_CHECK_UCAST_GPP_in <= CTL_RX_CHECK_UCAST_GPP;
    CTL_RX_CHECK_UCAST_PCP_in <= CTL_RX_CHECK_UCAST_PCP;
    CTL_RX_CHECK_UCAST_PPP_in <= CTL_RX_CHECK_UCAST_PPP;
    CTL_RX_ENABLE_GCP_in <= CTL_RX_ENABLE_GCP;
    CTL_RX_ENABLE_GPP_in <= CTL_RX_ENABLE_GPP;
    CTL_RX_ENABLE_PCP_in <= CTL_RX_ENABLE_PCP;
    CTL_RX_ENABLE_PPP_in <= CTL_RX_ENABLE_PPP;
    CTL_RX_ENABLE_in <= CTL_RX_ENABLE;
    CTL_RX_FORCE_RESYNC_in <= CTL_RX_FORCE_RESYNC;
    CTL_RX_PAUSE_ACK_in <= CTL_RX_PAUSE_ACK;
    CTL_RX_PAUSE_ENABLE_in <= CTL_RX_PAUSE_ENABLE;
    CTL_RX_RSFEC_ENABLE_CORRECTION_in <= CTL_RX_RSFEC_ENABLE_CORRECTION;
    CTL_RX_RSFEC_ENABLE_INDICATION_in <= CTL_RX_RSFEC_ENABLE_INDICATION;
    CTL_RX_RSFEC_ENABLE_in <= CTL_RX_RSFEC_ENABLE;
    CTL_RX_SYSTEMTIMERIN_in <= CTL_RX_SYSTEMTIMERIN;
    CTL_RX_TEST_PATTERN_in <= CTL_RX_TEST_PATTERN;
    CTL_TX_ENABLE_in <= CTL_TX_ENABLE;
    CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE_in <= CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE;
    CTL_TX_LANE0_VLM_BIP7_OVERRIDE_in <= CTL_TX_LANE0_VLM_BIP7_OVERRIDE;
    CTL_TX_PAUSE_ENABLE_in <= CTL_TX_PAUSE_ENABLE;
    CTL_TX_PAUSE_QUANTA0_in <= CTL_TX_PAUSE_QUANTA0;
    CTL_TX_PAUSE_QUANTA1_in <= CTL_TX_PAUSE_QUANTA1;
    CTL_TX_PAUSE_QUANTA2_in <= CTL_TX_PAUSE_QUANTA2;
    CTL_TX_PAUSE_QUANTA3_in <= CTL_TX_PAUSE_QUANTA3;
    CTL_TX_PAUSE_QUANTA4_in <= CTL_TX_PAUSE_QUANTA4;
    CTL_TX_PAUSE_QUANTA5_in <= CTL_TX_PAUSE_QUANTA5;
    CTL_TX_PAUSE_QUANTA6_in <= CTL_TX_PAUSE_QUANTA6;
    CTL_TX_PAUSE_QUANTA7_in <= CTL_TX_PAUSE_QUANTA7;
    CTL_TX_PAUSE_QUANTA8_in <= CTL_TX_PAUSE_QUANTA8;
    CTL_TX_PAUSE_REFRESH_TIMER0_in <= CTL_TX_PAUSE_REFRESH_TIMER0;
    CTL_TX_PAUSE_REFRESH_TIMER1_in <= CTL_TX_PAUSE_REFRESH_TIMER1;
    CTL_TX_PAUSE_REFRESH_TIMER2_in <= CTL_TX_PAUSE_REFRESH_TIMER2;
    CTL_TX_PAUSE_REFRESH_TIMER3_in <= CTL_TX_PAUSE_REFRESH_TIMER3;
    CTL_TX_PAUSE_REFRESH_TIMER4_in <= CTL_TX_PAUSE_REFRESH_TIMER4;
    CTL_TX_PAUSE_REFRESH_TIMER5_in <= CTL_TX_PAUSE_REFRESH_TIMER5;
    CTL_TX_PAUSE_REFRESH_TIMER6_in <= CTL_TX_PAUSE_REFRESH_TIMER6;
    CTL_TX_PAUSE_REFRESH_TIMER7_in <= CTL_TX_PAUSE_REFRESH_TIMER7;
    CTL_TX_PAUSE_REFRESH_TIMER8_in <= CTL_TX_PAUSE_REFRESH_TIMER8;
    CTL_TX_PAUSE_REQ_in <= CTL_TX_PAUSE_REQ;
    CTL_TX_PTP_VLANE_ADJUST_MODE_in <= CTL_TX_PTP_VLANE_ADJUST_MODE;
    CTL_TX_RESEND_PAUSE_in <= CTL_TX_RESEND_PAUSE;
    CTL_TX_RSFEC_ENABLE_in <= CTL_TX_RSFEC_ENABLE;
    CTL_TX_SEND_IDLE_in <= CTL_TX_SEND_IDLE;
    CTL_TX_SEND_LFI_in <= CTL_TX_SEND_LFI;
    CTL_TX_SEND_RFI_in <= CTL_TX_SEND_RFI;
    CTL_TX_SYSTEMTIMERIN_in <= CTL_TX_SYSTEMTIMERIN;
    CTL_TX_TEST_PATTERN_in <= CTL_TX_TEST_PATTERN;
    DRP_ADDR_in <= DRP_ADDR;
    DRP_CLK_in <= DRP_CLK;
    DRP_DI_in <= DRP_DI;
    DRP_EN_in <= DRP_EN;
    DRP_WE_in <= DRP_WE;
    RSFEC_BYPASS_RX_DIN_CW_START_in <= RSFEC_BYPASS_RX_DIN_CW_START;
    RSFEC_BYPASS_RX_DIN_in <= RSFEC_BYPASS_RX_DIN;
    RSFEC_BYPASS_TX_DIN_CW_START_in <= RSFEC_BYPASS_TX_DIN_CW_START;
    RSFEC_BYPASS_TX_DIN_in <= RSFEC_BYPASS_TX_DIN;
    RX_CLK_in <= RX_CLK;
    RX_RESET_in <= RX_RESET;
    RX_SERDES_ALT_DATA0_in <= RX_SERDES_ALT_DATA0;
    RX_SERDES_ALT_DATA1_in <= RX_SERDES_ALT_DATA1;
    RX_SERDES_ALT_DATA2_in <= RX_SERDES_ALT_DATA2;
    RX_SERDES_ALT_DATA3_in <= RX_SERDES_ALT_DATA3;
    RX_SERDES_CLK_in <= RX_SERDES_CLK;
    RX_SERDES_DATA0_in <= RX_SERDES_DATA0;
    RX_SERDES_DATA1_in <= RX_SERDES_DATA1;
    RX_SERDES_DATA2_in <= RX_SERDES_DATA2;
    RX_SERDES_DATA3_in <= RX_SERDES_DATA3;
    RX_SERDES_DATA4_in <= RX_SERDES_DATA4;
    RX_SERDES_DATA5_in <= RX_SERDES_DATA5;
    RX_SERDES_DATA6_in <= RX_SERDES_DATA6;
    RX_SERDES_DATA7_in <= RX_SERDES_DATA7;
    RX_SERDES_DATA8_in <= RX_SERDES_DATA8;
    RX_SERDES_DATA9_in <= RX_SERDES_DATA9;
    RX_SERDES_RESET_in <= RX_SERDES_RESET;
    TX_CLK_in <= TX_CLK;
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
    TX_PREIN_in <= TX_PREIN;
    TX_PTP_1588OP_IN_in <= TX_PTP_1588OP_IN;
    TX_PTP_CHKSUM_OFFSET_IN_in <= TX_PTP_CHKSUM_OFFSET_IN;
    TX_PTP_RXTSTAMP_IN_in <= TX_PTP_RXTSTAMP_IN;
    TX_PTP_TAG_FIELD_IN_in <= TX_PTP_TAG_FIELD_IN;
    TX_PTP_TSTAMP_OFFSET_IN_in <= TX_PTP_TSTAMP_OFFSET_IN;
    TX_PTP_UPD_CHKSUM_IN_in <= TX_PTP_UPD_CHKSUM_IN;
    TX_RESET_in <= TX_RESET;
    TX_SOPIN0_in <= TX_SOPIN0;
    TX_SOPIN1_in <= TX_SOPIN1;
    TX_SOPIN2_in <= TX_SOPIN2;
    TX_SOPIN3_in <= TX_SOPIN3;
    


    CSSD_CLK_STOP_EVENT_in <= '1'; -- tie off
    CSSD_RESETN_in <= '1'; -- tie off
    SCAN_CLK_in <= '1'; -- tie off
    SCAN_EN_N_in <= '1'; -- tie off
    SCAN_IN_in <= "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
    TEST_MODE_N_in <= '1'; -- tie off
    TEST_RESET_in <= '1'; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CTL_PTP_TRANSPCLK_MODE check
      if((xil_attr_test) or
         ((CTL_PTP_TRANSPCLK_MODE /= "FALSE") and 
          (CTL_PTP_TRANSPCLK_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-109] CTL_PTP_TRANSPCLK_MODE attribute is set to """));
        Write ( Message, string'(CTL_PTP_TRANSPCLK_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_CHECK_ACK check
      if((xil_attr_test) or
         ((CTL_RX_CHECK_ACK /= "TRUE") and 
          (CTL_RX_CHECK_ACK /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-110] CTL_RX_CHECK_ACK attribute is set to """));
        Write ( Message, string'(CTL_RX_CHECK_ACK));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_CHECK_PREAMBLE check
      if((xil_attr_test) or
         ((CTL_RX_CHECK_PREAMBLE /= "FALSE") and 
          (CTL_RX_CHECK_PREAMBLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] CTL_RX_CHECK_PREAMBLE attribute is set to """));
        Write ( Message, string'(CTL_RX_CHECK_PREAMBLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_CHECK_SFD check
      if((xil_attr_test) or
         ((CTL_RX_CHECK_SFD /= "FALSE") and 
          (CTL_RX_CHECK_SFD /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-112] CTL_RX_CHECK_SFD attribute is set to """));
        Write ( Message, string'(CTL_RX_CHECK_SFD));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_DELETE_FCS check
      if((xil_attr_test) or
         ((CTL_RX_DELETE_FCS /= "TRUE") and 
          (CTL_RX_DELETE_FCS /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] CTL_RX_DELETE_FCS attribute is set to """));
        Write ( Message, string'(CTL_RX_DELETE_FCS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_ETYPE_GCP check
        if((xil_attr_test) or
           ((CTL_RX_ETYPE_GCP < X"0600") or (CTL_RX_ETYPE_GCP > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-114] CTL_RX_ETYPE_GCP attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_ETYPE_GCP));
          Write ( Message, string'(". Legal values for this attribute are 0600 to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_ETYPE_GPP check
        if((xil_attr_test) or
           ((CTL_RX_ETYPE_GPP < X"0600") or (CTL_RX_ETYPE_GPP > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-115] CTL_RX_ETYPE_GPP attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_ETYPE_GPP));
          Write ( Message, string'(". Legal values for this attribute are 0600 to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_ETYPE_PCP check
        if((xil_attr_test) or
           ((CTL_RX_ETYPE_PCP < X"0600") or (CTL_RX_ETYPE_PCP > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-116] CTL_RX_ETYPE_PCP attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_ETYPE_PCP));
          Write ( Message, string'(". Legal values for this attribute are 0600 to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_ETYPE_PPP check
        if((xil_attr_test) or
           ((CTL_RX_ETYPE_PPP < X"0600") or (CTL_RX_ETYPE_PPP > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-117] CTL_RX_ETYPE_PPP attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_ETYPE_PPP));
          Write ( Message, string'(". Legal values for this attribute are 0600 to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_FORWARD_CONTROL check
      if((xil_attr_test) or
         ((CTL_RX_FORWARD_CONTROL /= "FALSE") and 
          (CTL_RX_FORWARD_CONTROL /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-118] CTL_RX_FORWARD_CONTROL attribute is set to """));
        Write ( Message, string'(CTL_RX_FORWARD_CONTROL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_IGNORE_FCS check
      if((xil_attr_test) or
         ((CTL_RX_IGNORE_FCS /= "FALSE") and 
          (CTL_RX_IGNORE_FCS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-119] CTL_RX_IGNORE_FCS attribute is set to """));
        Write ( Message, string'(CTL_RX_IGNORE_FCS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_MAX_PACKET_LEN check
        if((xil_attr_test) or
           ((CTL_RX_MAX_PACKET_LEN < "000" & X"040") or (CTL_RX_MAX_PACKET_LEN > "011" & X"FFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-120] CTL_RX_MAX_PACKET_LEN attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_MAX_PACKET_LEN));
          Write ( Message, string'(". Legal values for this attribute are 0040 to 3FFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_MIN_PACKET_LEN check
        if((xil_attr_test) or
           ((CTL_RX_MIN_PACKET_LEN < X"40") or (CTL_RX_MIN_PACKET_LEN > X"FF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-121] CTL_RX_MIN_PACKET_LEN attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_MIN_PACKET_LEN));
          Write ( Message, string'(". Legal values for this attribute are 40 to FF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_RX_PROCESS_LFI check
      if((xil_attr_test) or
         ((CTL_RX_PROCESS_LFI /= "FALSE") and 
          (CTL_RX_PROCESS_LFI /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-131] CTL_RX_PROCESS_LFI attribute is set to """));
        Write ( Message, string'(CTL_RX_PROCESS_LFI));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_RX_VL_LENGTH_MINUS1 check
        if((xil_attr_test) or
           ((CTL_RX_VL_LENGTH_MINUS1 < X"01FF") or (CTL_RX_VL_LENGTH_MINUS1 > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-134] CTL_RX_VL_LENGTH_MINUS1 attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_RX_VL_LENGTH_MINUS1));
          Write ( Message, string'(". Legal values for this attribute are 01FF to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
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
        Write ( Message, string'("-155] CTL_TEST_MODE_PIN_CHAR attribute is set to """));
        Write ( Message, string'(CTL_TEST_MODE_PIN_CHAR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_CUSTOM_PREAMBLE_ENABLE check
      if((xil_attr_test) or
         ((CTL_TX_CUSTOM_PREAMBLE_ENABLE /= "FALSE") and 
          (CTL_TX_CUSTOM_PREAMBLE_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-156] CTL_TX_CUSTOM_PREAMBLE_ENABLE attribute is set to """));
        Write ( Message, string'(CTL_TX_CUSTOM_PREAMBLE_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_ETHERTYPE_GPP check
        if((xil_attr_test) or
           ((CTL_TX_ETHERTYPE_GPP < X"0600") or (CTL_TX_ETHERTYPE_GPP > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-159] CTL_TX_ETHERTYPE_GPP attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_ETHERTYPE_GPP));
          Write ( Message, string'(". Legal values for this attribute are 0600 to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TX_ETHERTYPE_PPP check
        if((xil_attr_test) or
           ((CTL_TX_ETHERTYPE_PPP < X"0600") or (CTL_TX_ETHERTYPE_PPP > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-160] CTL_TX_ETHERTYPE_PPP attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_ETHERTYPE_PPP));
          Write ( Message, string'(". Legal values for this attribute are 0600 to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CTL_TX_FCS_INS_ENABLE check
      if((xil_attr_test) or
         ((CTL_TX_FCS_INS_ENABLE /= "TRUE") and 
          (CTL_TX_FCS_INS_ENABLE /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-161] CTL_TX_FCS_INS_ENABLE attribute is set to """));
        Write ( Message, string'(CTL_TX_FCS_INS_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_IGNORE_FCS check
      if((xil_attr_test) or
         ((CTL_TX_IGNORE_FCS /= "FALSE") and 
          (CTL_TX_IGNORE_FCS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-162] CTL_TX_IGNORE_FCS attribute is set to """));
        Write ( Message, string'(CTL_TX_IGNORE_FCS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_PTP_1STEP_ENABLE check
      if((xil_attr_test) or
         ((CTL_TX_PTP_1STEP_ENABLE /= "FALSE") and 
          (CTL_TX_PTP_1STEP_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-166] CTL_TX_PTP_1STEP_ENABLE attribute is set to """));
        Write ( Message, string'(CTL_TX_PTP_1STEP_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CTL_TX_VL_LENGTH_MINUS1 check
        if((xil_attr_test) or
           ((CTL_TX_VL_LENGTH_MINUS1 < X"01FF") or (CTL_TX_VL_LENGTH_MINUS1 > X"FFFF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-170] CTL_TX_VL_LENGTH_MINUS1 attribute is set to "));
          Write ( Message, SLV_TO_STR(CTL_TX_VL_LENGTH_MINUS1));
          Write ( Message, string'(". Legal values for this attribute are 01FF to FFFF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(CMACE4_V'PATH_NAME));
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
        Write ( Message, string'("-191] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
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
        Write ( Message, string'("-192] TEST_MODE_PIN_CHAR attribute is set to """));
        Write ( Message, string'(TEST_MODE_PIN_CHAR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(CMACE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-126] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(CMACE4_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    CMACE4_INST : SIP_CMACE4
      port map (
        CTL_CSSD_EN          => CTL_CSSD_EN_BIN,
        CTL_CSSD_MRKR_INIT   => CTL_CSSD_MRKR_INIT_BIN,
        CTL_CSSD_ROOT_CLK_DIS => CTL_CSSD_ROOT_CLK_DIS_BIN,
        CTL_CSSD_ROOT_CLK_SEL => CTL_CSSD_ROOT_CLK_SEL_BIN,
        CTL_CSSD_SNGL_CHAIN_MD => CTL_CSSD_SNGL_CHAIN_MD_BIN,
        CTL_CSSD_STOP_COUNT_0 => CTL_CSSD_STOP_COUNT_0_BIN,
        CTL_CSSD_STOP_COUNT_1 => CTL_CSSD_STOP_COUNT_1_BIN,
        CTL_CSSD_STOP_COUNT_2 => CTL_CSSD_STOP_COUNT_2_BIN,
        CTL_PTP_TRANSPCLK_MODE => CTL_PTP_TRANSPCLK_MODE_BIN,
        CTL_RX_CHECK_ACK     => CTL_RX_CHECK_ACK_BIN,
        CTL_RX_CHECK_PREAMBLE => CTL_RX_CHECK_PREAMBLE_BIN,
        CTL_RX_CHECK_SFD     => CTL_RX_CHECK_SFD_BIN,
        CTL_RX_DELETE_FCS    => CTL_RX_DELETE_FCS_BIN,
        CTL_RX_ETYPE_GCP     => CTL_RX_ETYPE_GCP_BIN,
        CTL_RX_ETYPE_GPP     => CTL_RX_ETYPE_GPP_BIN,
        CTL_RX_ETYPE_PCP     => CTL_RX_ETYPE_PCP_BIN,
        CTL_RX_ETYPE_PPP     => CTL_RX_ETYPE_PPP_BIN,
        CTL_RX_FORWARD_CONTROL => CTL_RX_FORWARD_CONTROL_BIN,
        CTL_RX_IGNORE_FCS    => CTL_RX_IGNORE_FCS_BIN,
        CTL_RX_MAX_PACKET_LEN => CTL_RX_MAX_PACKET_LEN_BIN,
        CTL_RX_MIN_PACKET_LEN => CTL_RX_MIN_PACKET_LEN_BIN,
        CTL_RX_OPCODE_GPP    => CTL_RX_OPCODE_GPP_BIN,
        CTL_RX_OPCODE_MAX_GCP => CTL_RX_OPCODE_MAX_GCP_BIN,
        CTL_RX_OPCODE_MAX_PCP => CTL_RX_OPCODE_MAX_PCP_BIN,
        CTL_RX_OPCODE_MIN_GCP => CTL_RX_OPCODE_MIN_GCP_BIN,
        CTL_RX_OPCODE_MIN_PCP => CTL_RX_OPCODE_MIN_PCP_BIN,
        CTL_RX_OPCODE_PPP    => CTL_RX_OPCODE_PPP_BIN,
        CTL_RX_PAUSE_DA_MCAST => CTL_RX_PAUSE_DA_MCAST_BIN,
        CTL_RX_PAUSE_DA_UCAST => CTL_RX_PAUSE_DA_UCAST_BIN,
        CTL_RX_PAUSE_SA      => CTL_RX_PAUSE_SA_BIN,
        CTL_RX_PROCESS_LFI   => CTL_RX_PROCESS_LFI_BIN,
        CTL_RX_RSFEC_AM_THRESHOLD => CTL_RX_RSFEC_AM_THRESHOLD_BIN,
        CTL_RX_RSFEC_FILL_ADJUST => CTL_RX_RSFEC_FILL_ADJUST_BIN,
        CTL_RX_VL_LENGTH_MINUS1 => CTL_RX_VL_LENGTH_MINUS1_BIN,
        CTL_RX_VL_MARKER_ID0 => CTL_RX_VL_MARKER_ID0_BIN,
        CTL_RX_VL_MARKER_ID1 => CTL_RX_VL_MARKER_ID1_BIN,
        CTL_RX_VL_MARKER_ID10 => CTL_RX_VL_MARKER_ID10_BIN,
        CTL_RX_VL_MARKER_ID11 => CTL_RX_VL_MARKER_ID11_BIN,
        CTL_RX_VL_MARKER_ID12 => CTL_RX_VL_MARKER_ID12_BIN,
        CTL_RX_VL_MARKER_ID13 => CTL_RX_VL_MARKER_ID13_BIN,
        CTL_RX_VL_MARKER_ID14 => CTL_RX_VL_MARKER_ID14_BIN,
        CTL_RX_VL_MARKER_ID15 => CTL_RX_VL_MARKER_ID15_BIN,
        CTL_RX_VL_MARKER_ID16 => CTL_RX_VL_MARKER_ID16_BIN,
        CTL_RX_VL_MARKER_ID17 => CTL_RX_VL_MARKER_ID17_BIN,
        CTL_RX_VL_MARKER_ID18 => CTL_RX_VL_MARKER_ID18_BIN,
        CTL_RX_VL_MARKER_ID19 => CTL_RX_VL_MARKER_ID19_BIN,
        CTL_RX_VL_MARKER_ID2 => CTL_RX_VL_MARKER_ID2_BIN,
        CTL_RX_VL_MARKER_ID3 => CTL_RX_VL_MARKER_ID3_BIN,
        CTL_RX_VL_MARKER_ID4 => CTL_RX_VL_MARKER_ID4_BIN,
        CTL_RX_VL_MARKER_ID5 => CTL_RX_VL_MARKER_ID5_BIN,
        CTL_RX_VL_MARKER_ID6 => CTL_RX_VL_MARKER_ID6_BIN,
        CTL_RX_VL_MARKER_ID7 => CTL_RX_VL_MARKER_ID7_BIN,
        CTL_RX_VL_MARKER_ID8 => CTL_RX_VL_MARKER_ID8_BIN,
        CTL_RX_VL_MARKER_ID9 => CTL_RX_VL_MARKER_ID9_BIN,
        CTL_TEST_MODE_PIN_CHAR => CTL_TEST_MODE_PIN_CHAR_BIN,
        CTL_TX_CUSTOM_PREAMBLE_ENABLE => CTL_TX_CUSTOM_PREAMBLE_ENABLE_BIN,
        CTL_TX_DA_GPP        => CTL_TX_DA_GPP_BIN,
        CTL_TX_DA_PPP        => CTL_TX_DA_PPP_BIN,
        CTL_TX_ETHERTYPE_GPP => CTL_TX_ETHERTYPE_GPP_BIN,
        CTL_TX_ETHERTYPE_PPP => CTL_TX_ETHERTYPE_PPP_BIN,
        CTL_TX_FCS_INS_ENABLE => CTL_TX_FCS_INS_ENABLE_BIN,
        CTL_TX_IGNORE_FCS    => CTL_TX_IGNORE_FCS_BIN,
        CTL_TX_IPG_VALUE     => CTL_TX_IPG_VALUE_BIN,
        CTL_TX_OPCODE_GPP    => CTL_TX_OPCODE_GPP_BIN,
        CTL_TX_OPCODE_PPP    => CTL_TX_OPCODE_PPP_BIN,
        CTL_TX_PTP_1STEP_ENABLE => CTL_TX_PTP_1STEP_ENABLE_BIN,
        CTL_TX_PTP_LATENCY_ADJUST => CTL_TX_PTP_LATENCY_ADJUST_BIN,
        CTL_TX_SA_GPP        => CTL_TX_SA_GPP_BIN,
        CTL_TX_SA_PPP        => CTL_TX_SA_PPP_BIN,
        CTL_TX_VL_LENGTH_MINUS1 => CTL_TX_VL_LENGTH_MINUS1_BIN,
        CTL_TX_VL_MARKER_ID0 => CTL_TX_VL_MARKER_ID0_BIN,
        CTL_TX_VL_MARKER_ID1 => CTL_TX_VL_MARKER_ID1_BIN,
        CTL_TX_VL_MARKER_ID10 => CTL_TX_VL_MARKER_ID10_BIN,
        CTL_TX_VL_MARKER_ID11 => CTL_TX_VL_MARKER_ID11_BIN,
        CTL_TX_VL_MARKER_ID12 => CTL_TX_VL_MARKER_ID12_BIN,
        CTL_TX_VL_MARKER_ID13 => CTL_TX_VL_MARKER_ID13_BIN,
        CTL_TX_VL_MARKER_ID14 => CTL_TX_VL_MARKER_ID14_BIN,
        CTL_TX_VL_MARKER_ID15 => CTL_TX_VL_MARKER_ID15_BIN,
        CTL_TX_VL_MARKER_ID16 => CTL_TX_VL_MARKER_ID16_BIN,
        CTL_TX_VL_MARKER_ID17 => CTL_TX_VL_MARKER_ID17_BIN,
        CTL_TX_VL_MARKER_ID18 => CTL_TX_VL_MARKER_ID18_BIN,
        CTL_TX_VL_MARKER_ID19 => CTL_TX_VL_MARKER_ID19_BIN,
        CTL_TX_VL_MARKER_ID2 => CTL_TX_VL_MARKER_ID2_BIN,
        CTL_TX_VL_MARKER_ID3 => CTL_TX_VL_MARKER_ID3_BIN,
        CTL_TX_VL_MARKER_ID4 => CTL_TX_VL_MARKER_ID4_BIN,
        CTL_TX_VL_MARKER_ID5 => CTL_TX_VL_MARKER_ID5_BIN,
        CTL_TX_VL_MARKER_ID6 => CTL_TX_VL_MARKER_ID6_BIN,
        CTL_TX_VL_MARKER_ID7 => CTL_TX_VL_MARKER_ID7_BIN,
        CTL_TX_VL_MARKER_ID8 => CTL_TX_VL_MARKER_ID8_BIN,
        CTL_TX_VL_MARKER_ID9 => CTL_TX_VL_MARKER_ID9_BIN,
        TEST_MODE_PIN_CHAR   => TEST_MODE_PIN_CHAR_BIN,
        CFG_RESET_CSSD       => CFG_RESET_CSSD_out,
        CSSD_CLK_STOP_DONE   => CSSD_CLK_STOP_DONE_out,
        DRP_DO               => DRP_DO_out,
        DRP_RDY              => DRP_RDY_out,
        GRESTORE_CSSD        => GRESTORE_CSSD_out,
        GWE_CSSD             => GWE_CSSD_out,
        RSFEC_BYPASS_RX_DOUT => RSFEC_BYPASS_RX_DOUT_out,
        RSFEC_BYPASS_RX_DOUT_CW_START => RSFEC_BYPASS_RX_DOUT_CW_START_out,
        RSFEC_BYPASS_RX_DOUT_VALID => RSFEC_BYPASS_RX_DOUT_VALID_out,
        RSFEC_BYPASS_TX_DOUT => RSFEC_BYPASS_TX_DOUT_out,
        RSFEC_BYPASS_TX_DOUT_CW_START => RSFEC_BYPASS_TX_DOUT_CW_START_out,
        RSFEC_BYPASS_TX_DOUT_VALID => RSFEC_BYPASS_TX_DOUT_VALID_out,
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
        RX_LANE_ALIGNER_FILL_0 => RX_LANE_ALIGNER_FILL_0_out,
        RX_LANE_ALIGNER_FILL_1 => RX_LANE_ALIGNER_FILL_1_out,
        RX_LANE_ALIGNER_FILL_10 => RX_LANE_ALIGNER_FILL_10_out,
        RX_LANE_ALIGNER_FILL_11 => RX_LANE_ALIGNER_FILL_11_out,
        RX_LANE_ALIGNER_FILL_12 => RX_LANE_ALIGNER_FILL_12_out,
        RX_LANE_ALIGNER_FILL_13 => RX_LANE_ALIGNER_FILL_13_out,
        RX_LANE_ALIGNER_FILL_14 => RX_LANE_ALIGNER_FILL_14_out,
        RX_LANE_ALIGNER_FILL_15 => RX_LANE_ALIGNER_FILL_15_out,
        RX_LANE_ALIGNER_FILL_16 => RX_LANE_ALIGNER_FILL_16_out,
        RX_LANE_ALIGNER_FILL_17 => RX_LANE_ALIGNER_FILL_17_out,
        RX_LANE_ALIGNER_FILL_18 => RX_LANE_ALIGNER_FILL_18_out,
        RX_LANE_ALIGNER_FILL_19 => RX_LANE_ALIGNER_FILL_19_out,
        RX_LANE_ALIGNER_FILL_2 => RX_LANE_ALIGNER_FILL_2_out,
        RX_LANE_ALIGNER_FILL_3 => RX_LANE_ALIGNER_FILL_3_out,
        RX_LANE_ALIGNER_FILL_4 => RX_LANE_ALIGNER_FILL_4_out,
        RX_LANE_ALIGNER_FILL_5 => RX_LANE_ALIGNER_FILL_5_out,
        RX_LANE_ALIGNER_FILL_6 => RX_LANE_ALIGNER_FILL_6_out,
        RX_LANE_ALIGNER_FILL_7 => RX_LANE_ALIGNER_FILL_7_out,
        RX_LANE_ALIGNER_FILL_8 => RX_LANE_ALIGNER_FILL_8_out,
        RX_LANE_ALIGNER_FILL_9 => RX_LANE_ALIGNER_FILL_9_out,
        RX_MTYOUT0           => RX_MTYOUT0_out,
        RX_MTYOUT1           => RX_MTYOUT1_out,
        RX_MTYOUT2           => RX_MTYOUT2_out,
        RX_MTYOUT3           => RX_MTYOUT3_out,
        RX_OTN_BIP8_0        => RX_OTN_BIP8_0_out,
        RX_OTN_BIP8_1        => RX_OTN_BIP8_1_out,
        RX_OTN_BIP8_2        => RX_OTN_BIP8_2_out,
        RX_OTN_BIP8_3        => RX_OTN_BIP8_3_out,
        RX_OTN_BIP8_4        => RX_OTN_BIP8_4_out,
        RX_OTN_DATA_0        => RX_OTN_DATA_0_out,
        RX_OTN_DATA_1        => RX_OTN_DATA_1_out,
        RX_OTN_DATA_2        => RX_OTN_DATA_2_out,
        RX_OTN_DATA_3        => RX_OTN_DATA_3_out,
        RX_OTN_DATA_4        => RX_OTN_DATA_4_out,
        RX_OTN_ENA           => RX_OTN_ENA_out,
        RX_OTN_LANE0         => RX_OTN_LANE0_out,
        RX_OTN_VLMARKER      => RX_OTN_VLMARKER_out,
        RX_PREOUT            => RX_PREOUT_out,
        RX_PTP_PCSLANE_OUT   => RX_PTP_PCSLANE_OUT_out,
        RX_PTP_TSTAMP_OUT    => RX_PTP_TSTAMP_OUT_out,
        RX_SOPOUT0           => RX_SOPOUT0_out,
        RX_SOPOUT1           => RX_SOPOUT1_out,
        RX_SOPOUT2           => RX_SOPOUT2_out,
        RX_SOPOUT3           => RX_SOPOUT3_out,
        SCAN_OUT             => SCAN_OUT_out,
        STAT_RX_ALIGNED      => STAT_RX_ALIGNED_out,
        STAT_RX_ALIGNED_ERR  => STAT_RX_ALIGNED_ERR_out,
        STAT_RX_BAD_CODE     => STAT_RX_BAD_CODE_out,
        STAT_RX_BAD_FCS      => STAT_RX_BAD_FCS_out,
        STAT_RX_BAD_PREAMBLE => STAT_RX_BAD_PREAMBLE_out,
        STAT_RX_BAD_SFD      => STAT_RX_BAD_SFD_out,
        STAT_RX_BIP_ERR_0    => STAT_RX_BIP_ERR_0_out,
        STAT_RX_BIP_ERR_1    => STAT_RX_BIP_ERR_1_out,
        STAT_RX_BIP_ERR_10   => STAT_RX_BIP_ERR_10_out,
        STAT_RX_BIP_ERR_11   => STAT_RX_BIP_ERR_11_out,
        STAT_RX_BIP_ERR_12   => STAT_RX_BIP_ERR_12_out,
        STAT_RX_BIP_ERR_13   => STAT_RX_BIP_ERR_13_out,
        STAT_RX_BIP_ERR_14   => STAT_RX_BIP_ERR_14_out,
        STAT_RX_BIP_ERR_15   => STAT_RX_BIP_ERR_15_out,
        STAT_RX_BIP_ERR_16   => STAT_RX_BIP_ERR_16_out,
        STAT_RX_BIP_ERR_17   => STAT_RX_BIP_ERR_17_out,
        STAT_RX_BIP_ERR_18   => STAT_RX_BIP_ERR_18_out,
        STAT_RX_BIP_ERR_19   => STAT_RX_BIP_ERR_19_out,
        STAT_RX_BIP_ERR_2    => STAT_RX_BIP_ERR_2_out,
        STAT_RX_BIP_ERR_3    => STAT_RX_BIP_ERR_3_out,
        STAT_RX_BIP_ERR_4    => STAT_RX_BIP_ERR_4_out,
        STAT_RX_BIP_ERR_5    => STAT_RX_BIP_ERR_5_out,
        STAT_RX_BIP_ERR_6    => STAT_RX_BIP_ERR_6_out,
        STAT_RX_BIP_ERR_7    => STAT_RX_BIP_ERR_7_out,
        STAT_RX_BIP_ERR_8    => STAT_RX_BIP_ERR_8_out,
        STAT_RX_BIP_ERR_9    => STAT_RX_BIP_ERR_9_out,
        STAT_RX_BLOCK_LOCK   => STAT_RX_BLOCK_LOCK_out,
        STAT_RX_BROADCAST    => STAT_RX_BROADCAST_out,
        STAT_RX_FRAGMENT     => STAT_RX_FRAGMENT_out,
        STAT_RX_FRAMING_ERR_0 => STAT_RX_FRAMING_ERR_0_out,
        STAT_RX_FRAMING_ERR_1 => STAT_RX_FRAMING_ERR_1_out,
        STAT_RX_FRAMING_ERR_10 => STAT_RX_FRAMING_ERR_10_out,
        STAT_RX_FRAMING_ERR_11 => STAT_RX_FRAMING_ERR_11_out,
        STAT_RX_FRAMING_ERR_12 => STAT_RX_FRAMING_ERR_12_out,
        STAT_RX_FRAMING_ERR_13 => STAT_RX_FRAMING_ERR_13_out,
        STAT_RX_FRAMING_ERR_14 => STAT_RX_FRAMING_ERR_14_out,
        STAT_RX_FRAMING_ERR_15 => STAT_RX_FRAMING_ERR_15_out,
        STAT_RX_FRAMING_ERR_16 => STAT_RX_FRAMING_ERR_16_out,
        STAT_RX_FRAMING_ERR_17 => STAT_RX_FRAMING_ERR_17_out,
        STAT_RX_FRAMING_ERR_18 => STAT_RX_FRAMING_ERR_18_out,
        STAT_RX_FRAMING_ERR_19 => STAT_RX_FRAMING_ERR_19_out,
        STAT_RX_FRAMING_ERR_2 => STAT_RX_FRAMING_ERR_2_out,
        STAT_RX_FRAMING_ERR_3 => STAT_RX_FRAMING_ERR_3_out,
        STAT_RX_FRAMING_ERR_4 => STAT_RX_FRAMING_ERR_4_out,
        STAT_RX_FRAMING_ERR_5 => STAT_RX_FRAMING_ERR_5_out,
        STAT_RX_FRAMING_ERR_6 => STAT_RX_FRAMING_ERR_6_out,
        STAT_RX_FRAMING_ERR_7 => STAT_RX_FRAMING_ERR_7_out,
        STAT_RX_FRAMING_ERR_8 => STAT_RX_FRAMING_ERR_8_out,
        STAT_RX_FRAMING_ERR_9 => STAT_RX_FRAMING_ERR_9_out,
        STAT_RX_FRAMING_ERR_VALID_0 => STAT_RX_FRAMING_ERR_VALID_0_out,
        STAT_RX_FRAMING_ERR_VALID_1 => STAT_RX_FRAMING_ERR_VALID_1_out,
        STAT_RX_FRAMING_ERR_VALID_10 => STAT_RX_FRAMING_ERR_VALID_10_out,
        STAT_RX_FRAMING_ERR_VALID_11 => STAT_RX_FRAMING_ERR_VALID_11_out,
        STAT_RX_FRAMING_ERR_VALID_12 => STAT_RX_FRAMING_ERR_VALID_12_out,
        STAT_RX_FRAMING_ERR_VALID_13 => STAT_RX_FRAMING_ERR_VALID_13_out,
        STAT_RX_FRAMING_ERR_VALID_14 => STAT_RX_FRAMING_ERR_VALID_14_out,
        STAT_RX_FRAMING_ERR_VALID_15 => STAT_RX_FRAMING_ERR_VALID_15_out,
        STAT_RX_FRAMING_ERR_VALID_16 => STAT_RX_FRAMING_ERR_VALID_16_out,
        STAT_RX_FRAMING_ERR_VALID_17 => STAT_RX_FRAMING_ERR_VALID_17_out,
        STAT_RX_FRAMING_ERR_VALID_18 => STAT_RX_FRAMING_ERR_VALID_18_out,
        STAT_RX_FRAMING_ERR_VALID_19 => STAT_RX_FRAMING_ERR_VALID_19_out,
        STAT_RX_FRAMING_ERR_VALID_2 => STAT_RX_FRAMING_ERR_VALID_2_out,
        STAT_RX_FRAMING_ERR_VALID_3 => STAT_RX_FRAMING_ERR_VALID_3_out,
        STAT_RX_FRAMING_ERR_VALID_4 => STAT_RX_FRAMING_ERR_VALID_4_out,
        STAT_RX_FRAMING_ERR_VALID_5 => STAT_RX_FRAMING_ERR_VALID_5_out,
        STAT_RX_FRAMING_ERR_VALID_6 => STAT_RX_FRAMING_ERR_VALID_6_out,
        STAT_RX_FRAMING_ERR_VALID_7 => STAT_RX_FRAMING_ERR_VALID_7_out,
        STAT_RX_FRAMING_ERR_VALID_8 => STAT_RX_FRAMING_ERR_VALID_8_out,
        STAT_RX_FRAMING_ERR_VALID_9 => STAT_RX_FRAMING_ERR_VALID_9_out,
        STAT_RX_GOT_SIGNAL_OS => STAT_RX_GOT_SIGNAL_OS_out,
        STAT_RX_HI_BER       => STAT_RX_HI_BER_out,
        STAT_RX_INRANGEERR   => STAT_RX_INRANGEERR_out,
        STAT_RX_INTERNAL_LOCAL_FAULT => STAT_RX_INTERNAL_LOCAL_FAULT_out,
        STAT_RX_JABBER       => STAT_RX_JABBER_out,
        STAT_RX_LANE0_VLM_BIP7 => STAT_RX_LANE0_VLM_BIP7_out,
        STAT_RX_LANE0_VLM_BIP7_VALID => STAT_RX_LANE0_VLM_BIP7_VALID_out,
        STAT_RX_LOCAL_FAULT  => STAT_RX_LOCAL_FAULT_out,
        STAT_RX_MF_ERR       => STAT_RX_MF_ERR_out,
        STAT_RX_MF_LEN_ERR   => STAT_RX_MF_LEN_ERR_out,
        STAT_RX_MF_REPEAT_ERR => STAT_RX_MF_REPEAT_ERR_out,
        STAT_RX_MISALIGNED   => STAT_RX_MISALIGNED_out,
        STAT_RX_MULTICAST    => STAT_RX_MULTICAST_out,
        STAT_RX_OVERSIZE     => STAT_RX_OVERSIZE_out,
        STAT_RX_PACKET_1024_1518_BYTES => STAT_RX_PACKET_1024_1518_BYTES_out,
        STAT_RX_PACKET_128_255_BYTES => STAT_RX_PACKET_128_255_BYTES_out,
        STAT_RX_PACKET_1519_1522_BYTES => STAT_RX_PACKET_1519_1522_BYTES_out,
        STAT_RX_PACKET_1523_1548_BYTES => STAT_RX_PACKET_1523_1548_BYTES_out,
        STAT_RX_PACKET_1549_2047_BYTES => STAT_RX_PACKET_1549_2047_BYTES_out,
        STAT_RX_PACKET_2048_4095_BYTES => STAT_RX_PACKET_2048_4095_BYTES_out,
        STAT_RX_PACKET_256_511_BYTES => STAT_RX_PACKET_256_511_BYTES_out,
        STAT_RX_PACKET_4096_8191_BYTES => STAT_RX_PACKET_4096_8191_BYTES_out,
        STAT_RX_PACKET_512_1023_BYTES => STAT_RX_PACKET_512_1023_BYTES_out,
        STAT_RX_PACKET_64_BYTES => STAT_RX_PACKET_64_BYTES_out,
        STAT_RX_PACKET_65_127_BYTES => STAT_RX_PACKET_65_127_BYTES_out,
        STAT_RX_PACKET_8192_9215_BYTES => STAT_RX_PACKET_8192_9215_BYTES_out,
        STAT_RX_PACKET_BAD_FCS => STAT_RX_PACKET_BAD_FCS_out,
        STAT_RX_PACKET_LARGE => STAT_RX_PACKET_LARGE_out,
        STAT_RX_PACKET_SMALL => STAT_RX_PACKET_SMALL_out,
        STAT_RX_PAUSE        => STAT_RX_PAUSE_out,
        STAT_RX_PAUSE_QUANTA0 => STAT_RX_PAUSE_QUANTA0_out,
        STAT_RX_PAUSE_QUANTA1 => STAT_RX_PAUSE_QUANTA1_out,
        STAT_RX_PAUSE_QUANTA2 => STAT_RX_PAUSE_QUANTA2_out,
        STAT_RX_PAUSE_QUANTA3 => STAT_RX_PAUSE_QUANTA3_out,
        STAT_RX_PAUSE_QUANTA4 => STAT_RX_PAUSE_QUANTA4_out,
        STAT_RX_PAUSE_QUANTA5 => STAT_RX_PAUSE_QUANTA5_out,
        STAT_RX_PAUSE_QUANTA6 => STAT_RX_PAUSE_QUANTA6_out,
        STAT_RX_PAUSE_QUANTA7 => STAT_RX_PAUSE_QUANTA7_out,
        STAT_RX_PAUSE_QUANTA8 => STAT_RX_PAUSE_QUANTA8_out,
        STAT_RX_PAUSE_REQ    => STAT_RX_PAUSE_REQ_out,
        STAT_RX_PAUSE_VALID  => STAT_RX_PAUSE_VALID_out,
        STAT_RX_RECEIVED_LOCAL_FAULT => STAT_RX_RECEIVED_LOCAL_FAULT_out,
        STAT_RX_REMOTE_FAULT => STAT_RX_REMOTE_FAULT_out,
        STAT_RX_RSFEC_AM_LOCK0 => STAT_RX_RSFEC_AM_LOCK0_out,
        STAT_RX_RSFEC_AM_LOCK1 => STAT_RX_RSFEC_AM_LOCK1_out,
        STAT_RX_RSFEC_AM_LOCK2 => STAT_RX_RSFEC_AM_LOCK2_out,
        STAT_RX_RSFEC_AM_LOCK3 => STAT_RX_RSFEC_AM_LOCK3_out,
        STAT_RX_RSFEC_CORRECTED_CW_INC => STAT_RX_RSFEC_CORRECTED_CW_INC_out,
        STAT_RX_RSFEC_CW_INC => STAT_RX_RSFEC_CW_INC_out,
        STAT_RX_RSFEC_ERR_COUNT0_INC => STAT_RX_RSFEC_ERR_COUNT0_INC_out,
        STAT_RX_RSFEC_ERR_COUNT1_INC => STAT_RX_RSFEC_ERR_COUNT1_INC_out,
        STAT_RX_RSFEC_ERR_COUNT2_INC => STAT_RX_RSFEC_ERR_COUNT2_INC_out,
        STAT_RX_RSFEC_ERR_COUNT3_INC => STAT_RX_RSFEC_ERR_COUNT3_INC_out,
        STAT_RX_RSFEC_HI_SER => STAT_RX_RSFEC_HI_SER_out,
        STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS => STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS_out,
        STAT_RX_RSFEC_LANE_FILL_0 => STAT_RX_RSFEC_LANE_FILL_0_out,
        STAT_RX_RSFEC_LANE_FILL_1 => STAT_RX_RSFEC_LANE_FILL_1_out,
        STAT_RX_RSFEC_LANE_FILL_2 => STAT_RX_RSFEC_LANE_FILL_2_out,
        STAT_RX_RSFEC_LANE_FILL_3 => STAT_RX_RSFEC_LANE_FILL_3_out,
        STAT_RX_RSFEC_LANE_MAPPING => STAT_RX_RSFEC_LANE_MAPPING_out,
        STAT_RX_RSFEC_RSVD   => STAT_RX_RSFEC_RSVD_out,
        STAT_RX_RSFEC_UNCORRECTED_CW_INC => STAT_RX_RSFEC_UNCORRECTED_CW_INC_out,
        STAT_RX_STATUS       => STAT_RX_STATUS_out,
        STAT_RX_STOMPED_FCS  => STAT_RX_STOMPED_FCS_out,
        STAT_RX_SYNCED       => STAT_RX_SYNCED_out,
        STAT_RX_SYNCED_ERR   => STAT_RX_SYNCED_ERR_out,
        STAT_RX_TEST_PATTERN_MISMATCH => STAT_RX_TEST_PATTERN_MISMATCH_out,
        STAT_RX_TOOLONG      => STAT_RX_TOOLONG_out,
        STAT_RX_TOTAL_BYTES  => STAT_RX_TOTAL_BYTES_out,
        STAT_RX_TOTAL_GOOD_BYTES => STAT_RX_TOTAL_GOOD_BYTES_out,
        STAT_RX_TOTAL_GOOD_PACKETS => STAT_RX_TOTAL_GOOD_PACKETS_out,
        STAT_RX_TOTAL_PACKETS => STAT_RX_TOTAL_PACKETS_out,
        STAT_RX_TRUNCATED    => STAT_RX_TRUNCATED_out,
        STAT_RX_UNDERSIZE    => STAT_RX_UNDERSIZE_out,
        STAT_RX_UNICAST      => STAT_RX_UNICAST_out,
        STAT_RX_USER_PAUSE   => STAT_RX_USER_PAUSE_out,
        STAT_RX_VLAN         => STAT_RX_VLAN_out,
        STAT_RX_VL_DEMUXED   => STAT_RX_VL_DEMUXED_out,
        STAT_RX_VL_NUMBER_0  => STAT_RX_VL_NUMBER_0_out,
        STAT_RX_VL_NUMBER_1  => STAT_RX_VL_NUMBER_1_out,
        STAT_RX_VL_NUMBER_10 => STAT_RX_VL_NUMBER_10_out,
        STAT_RX_VL_NUMBER_11 => STAT_RX_VL_NUMBER_11_out,
        STAT_RX_VL_NUMBER_12 => STAT_RX_VL_NUMBER_12_out,
        STAT_RX_VL_NUMBER_13 => STAT_RX_VL_NUMBER_13_out,
        STAT_RX_VL_NUMBER_14 => STAT_RX_VL_NUMBER_14_out,
        STAT_RX_VL_NUMBER_15 => STAT_RX_VL_NUMBER_15_out,
        STAT_RX_VL_NUMBER_16 => STAT_RX_VL_NUMBER_16_out,
        STAT_RX_VL_NUMBER_17 => STAT_RX_VL_NUMBER_17_out,
        STAT_RX_VL_NUMBER_18 => STAT_RX_VL_NUMBER_18_out,
        STAT_RX_VL_NUMBER_19 => STAT_RX_VL_NUMBER_19_out,
        STAT_RX_VL_NUMBER_2  => STAT_RX_VL_NUMBER_2_out,
        STAT_RX_VL_NUMBER_3  => STAT_RX_VL_NUMBER_3_out,
        STAT_RX_VL_NUMBER_4  => STAT_RX_VL_NUMBER_4_out,
        STAT_RX_VL_NUMBER_5  => STAT_RX_VL_NUMBER_5_out,
        STAT_RX_VL_NUMBER_6  => STAT_RX_VL_NUMBER_6_out,
        STAT_RX_VL_NUMBER_7  => STAT_RX_VL_NUMBER_7_out,
        STAT_RX_VL_NUMBER_8  => STAT_RX_VL_NUMBER_8_out,
        STAT_RX_VL_NUMBER_9  => STAT_RX_VL_NUMBER_9_out,
        STAT_TX_BAD_FCS      => STAT_TX_BAD_FCS_out,
        STAT_TX_BROADCAST    => STAT_TX_BROADCAST_out,
        STAT_TX_FRAME_ERROR  => STAT_TX_FRAME_ERROR_out,
        STAT_TX_LOCAL_FAULT  => STAT_TX_LOCAL_FAULT_out,
        STAT_TX_MULTICAST    => STAT_TX_MULTICAST_out,
        STAT_TX_PACKET_1024_1518_BYTES => STAT_TX_PACKET_1024_1518_BYTES_out,
        STAT_TX_PACKET_128_255_BYTES => STAT_TX_PACKET_128_255_BYTES_out,
        STAT_TX_PACKET_1519_1522_BYTES => STAT_TX_PACKET_1519_1522_BYTES_out,
        STAT_TX_PACKET_1523_1548_BYTES => STAT_TX_PACKET_1523_1548_BYTES_out,
        STAT_TX_PACKET_1549_2047_BYTES => STAT_TX_PACKET_1549_2047_BYTES_out,
        STAT_TX_PACKET_2048_4095_BYTES => STAT_TX_PACKET_2048_4095_BYTES_out,
        STAT_TX_PACKET_256_511_BYTES => STAT_TX_PACKET_256_511_BYTES_out,
        STAT_TX_PACKET_4096_8191_BYTES => STAT_TX_PACKET_4096_8191_BYTES_out,
        STAT_TX_PACKET_512_1023_BYTES => STAT_TX_PACKET_512_1023_BYTES_out,
        STAT_TX_PACKET_64_BYTES => STAT_TX_PACKET_64_BYTES_out,
        STAT_TX_PACKET_65_127_BYTES => STAT_TX_PACKET_65_127_BYTES_out,
        STAT_TX_PACKET_8192_9215_BYTES => STAT_TX_PACKET_8192_9215_BYTES_out,
        STAT_TX_PACKET_LARGE => STAT_TX_PACKET_LARGE_out,
        STAT_TX_PACKET_SMALL => STAT_TX_PACKET_SMALL_out,
        STAT_TX_PAUSE        => STAT_TX_PAUSE_out,
        STAT_TX_PAUSE_VALID  => STAT_TX_PAUSE_VALID_out,
        STAT_TX_PTP_FIFO_READ_ERROR => STAT_TX_PTP_FIFO_READ_ERROR_out,
        STAT_TX_PTP_FIFO_WRITE_ERROR => STAT_TX_PTP_FIFO_WRITE_ERROR_out,
        STAT_TX_TOTAL_BYTES  => STAT_TX_TOTAL_BYTES_out,
        STAT_TX_TOTAL_GOOD_BYTES => STAT_TX_TOTAL_GOOD_BYTES_out,
        STAT_TX_TOTAL_GOOD_PACKETS => STAT_TX_TOTAL_GOOD_PACKETS_out,
        STAT_TX_TOTAL_PACKETS => STAT_TX_TOTAL_PACKETS_out,
        STAT_TX_UNICAST      => STAT_TX_UNICAST_out,
        STAT_TX_USER_PAUSE   => STAT_TX_USER_PAUSE_out,
        STAT_TX_VLAN         => STAT_TX_VLAN_out,
        TX_OVFOUT            => TX_OVFOUT_out,
        TX_PTP_PCSLANE_OUT   => TX_PTP_PCSLANE_OUT_out,
        TX_PTP_TSTAMP_OUT    => TX_PTP_TSTAMP_OUT_out,
        TX_PTP_TSTAMP_TAG_OUT => TX_PTP_TSTAMP_TAG_OUT_out,
        TX_PTP_TSTAMP_VALID_OUT => TX_PTP_TSTAMP_VALID_OUT_out,
        TX_RDYOUT            => TX_RDYOUT_out,
        TX_SERDES_ALT_DATA0  => TX_SERDES_ALT_DATA0_out,
        TX_SERDES_ALT_DATA1  => TX_SERDES_ALT_DATA1_out,
        TX_SERDES_ALT_DATA2  => TX_SERDES_ALT_DATA2_out,
        TX_SERDES_ALT_DATA3  => TX_SERDES_ALT_DATA3_out,
        TX_SERDES_DATA0      => TX_SERDES_DATA0_out,
        TX_SERDES_DATA1      => TX_SERDES_DATA1_out,
        TX_SERDES_DATA2      => TX_SERDES_DATA2_out,
        TX_SERDES_DATA3      => TX_SERDES_DATA3_out,
        TX_SERDES_DATA4      => TX_SERDES_DATA4_out,
        TX_SERDES_DATA5      => TX_SERDES_DATA5_out,
        TX_SERDES_DATA6      => TX_SERDES_DATA6_out,
        TX_SERDES_DATA7      => TX_SERDES_DATA7_out,
        TX_SERDES_DATA8      => TX_SERDES_DATA8_out,
        TX_SERDES_DATA9      => TX_SERDES_DATA9_out,
        TX_UNFOUT            => TX_UNFOUT_out,
        CSSD_CLK_STOP_EVENT  => CSSD_CLK_STOP_EVENT_in,
        CSSD_RESETN          => CSSD_RESETN_in,
        CTL_CAUI4_MODE       => CTL_CAUI4_MODE_in,
        CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE => CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE_in,
        CTL_RSFEC_IEEE_ERROR_INDICATION_MODE => CTL_RSFEC_IEEE_ERROR_INDICATION_MODE_in,
        CTL_RX_CHECK_ETYPE_GCP => CTL_RX_CHECK_ETYPE_GCP_in,
        CTL_RX_CHECK_ETYPE_GPP => CTL_RX_CHECK_ETYPE_GPP_in,
        CTL_RX_CHECK_ETYPE_PCP => CTL_RX_CHECK_ETYPE_PCP_in,
        CTL_RX_CHECK_ETYPE_PPP => CTL_RX_CHECK_ETYPE_PPP_in,
        CTL_RX_CHECK_MCAST_GCP => CTL_RX_CHECK_MCAST_GCP_in,
        CTL_RX_CHECK_MCAST_GPP => CTL_RX_CHECK_MCAST_GPP_in,
        CTL_RX_CHECK_MCAST_PCP => CTL_RX_CHECK_MCAST_PCP_in,
        CTL_RX_CHECK_MCAST_PPP => CTL_RX_CHECK_MCAST_PPP_in,
        CTL_RX_CHECK_OPCODE_GCP => CTL_RX_CHECK_OPCODE_GCP_in,
        CTL_RX_CHECK_OPCODE_GPP => CTL_RX_CHECK_OPCODE_GPP_in,
        CTL_RX_CHECK_OPCODE_PCP => CTL_RX_CHECK_OPCODE_PCP_in,
        CTL_RX_CHECK_OPCODE_PPP => CTL_RX_CHECK_OPCODE_PPP_in,
        CTL_RX_CHECK_SA_GCP  => CTL_RX_CHECK_SA_GCP_in,
        CTL_RX_CHECK_SA_GPP  => CTL_RX_CHECK_SA_GPP_in,
        CTL_RX_CHECK_SA_PCP  => CTL_RX_CHECK_SA_PCP_in,
        CTL_RX_CHECK_SA_PPP  => CTL_RX_CHECK_SA_PPP_in,
        CTL_RX_CHECK_UCAST_GCP => CTL_RX_CHECK_UCAST_GCP_in,
        CTL_RX_CHECK_UCAST_GPP => CTL_RX_CHECK_UCAST_GPP_in,
        CTL_RX_CHECK_UCAST_PCP => CTL_RX_CHECK_UCAST_PCP_in,
        CTL_RX_CHECK_UCAST_PPP => CTL_RX_CHECK_UCAST_PPP_in,
        CTL_RX_ENABLE        => CTL_RX_ENABLE_in,
        CTL_RX_ENABLE_GCP    => CTL_RX_ENABLE_GCP_in,
        CTL_RX_ENABLE_GPP    => CTL_RX_ENABLE_GPP_in,
        CTL_RX_ENABLE_PCP    => CTL_RX_ENABLE_PCP_in,
        CTL_RX_ENABLE_PPP    => CTL_RX_ENABLE_PPP_in,
        CTL_RX_FORCE_RESYNC  => CTL_RX_FORCE_RESYNC_in,
        CTL_RX_PAUSE_ACK     => CTL_RX_PAUSE_ACK_in,
        CTL_RX_PAUSE_ENABLE  => CTL_RX_PAUSE_ENABLE_in,
        CTL_RX_RSFEC_ENABLE  => CTL_RX_RSFEC_ENABLE_in,
        CTL_RX_RSFEC_ENABLE_CORRECTION => CTL_RX_RSFEC_ENABLE_CORRECTION_in,
        CTL_RX_RSFEC_ENABLE_INDICATION => CTL_RX_RSFEC_ENABLE_INDICATION_in,
        CTL_RX_SYSTEMTIMERIN => CTL_RX_SYSTEMTIMERIN_in,
        CTL_RX_TEST_PATTERN  => CTL_RX_TEST_PATTERN_in,
        CTL_TX_ENABLE        => CTL_TX_ENABLE_in,
        CTL_TX_LANE0_VLM_BIP7_OVERRIDE => CTL_TX_LANE0_VLM_BIP7_OVERRIDE_in,
        CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE => CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE_in,
        CTL_TX_PAUSE_ENABLE  => CTL_TX_PAUSE_ENABLE_in,
        CTL_TX_PAUSE_QUANTA0 => CTL_TX_PAUSE_QUANTA0_in,
        CTL_TX_PAUSE_QUANTA1 => CTL_TX_PAUSE_QUANTA1_in,
        CTL_TX_PAUSE_QUANTA2 => CTL_TX_PAUSE_QUANTA2_in,
        CTL_TX_PAUSE_QUANTA3 => CTL_TX_PAUSE_QUANTA3_in,
        CTL_TX_PAUSE_QUANTA4 => CTL_TX_PAUSE_QUANTA4_in,
        CTL_TX_PAUSE_QUANTA5 => CTL_TX_PAUSE_QUANTA5_in,
        CTL_TX_PAUSE_QUANTA6 => CTL_TX_PAUSE_QUANTA6_in,
        CTL_TX_PAUSE_QUANTA7 => CTL_TX_PAUSE_QUANTA7_in,
        CTL_TX_PAUSE_QUANTA8 => CTL_TX_PAUSE_QUANTA8_in,
        CTL_TX_PAUSE_REFRESH_TIMER0 => CTL_TX_PAUSE_REFRESH_TIMER0_in,
        CTL_TX_PAUSE_REFRESH_TIMER1 => CTL_TX_PAUSE_REFRESH_TIMER1_in,
        CTL_TX_PAUSE_REFRESH_TIMER2 => CTL_TX_PAUSE_REFRESH_TIMER2_in,
        CTL_TX_PAUSE_REFRESH_TIMER3 => CTL_TX_PAUSE_REFRESH_TIMER3_in,
        CTL_TX_PAUSE_REFRESH_TIMER4 => CTL_TX_PAUSE_REFRESH_TIMER4_in,
        CTL_TX_PAUSE_REFRESH_TIMER5 => CTL_TX_PAUSE_REFRESH_TIMER5_in,
        CTL_TX_PAUSE_REFRESH_TIMER6 => CTL_TX_PAUSE_REFRESH_TIMER6_in,
        CTL_TX_PAUSE_REFRESH_TIMER7 => CTL_TX_PAUSE_REFRESH_TIMER7_in,
        CTL_TX_PAUSE_REFRESH_TIMER8 => CTL_TX_PAUSE_REFRESH_TIMER8_in,
        CTL_TX_PAUSE_REQ     => CTL_TX_PAUSE_REQ_in,
        CTL_TX_PTP_VLANE_ADJUST_MODE => CTL_TX_PTP_VLANE_ADJUST_MODE_in,
        CTL_TX_RESEND_PAUSE  => CTL_TX_RESEND_PAUSE_in,
        CTL_TX_RSFEC_ENABLE  => CTL_TX_RSFEC_ENABLE_in,
        CTL_TX_SEND_IDLE     => CTL_TX_SEND_IDLE_in,
        CTL_TX_SEND_LFI      => CTL_TX_SEND_LFI_in,
        CTL_TX_SEND_RFI      => CTL_TX_SEND_RFI_in,
        CTL_TX_SYSTEMTIMERIN => CTL_TX_SYSTEMTIMERIN_in,
        CTL_TX_TEST_PATTERN  => CTL_TX_TEST_PATTERN_in,
        DRP_ADDR             => DRP_ADDR_in,
        DRP_CLK              => DRP_CLK_in,
        DRP_DI               => DRP_DI_in,
        DRP_EN               => DRP_EN_in,
        DRP_WE               => DRP_WE_in,
        RSFEC_BYPASS_RX_DIN  => RSFEC_BYPASS_RX_DIN_in,
        RSFEC_BYPASS_RX_DIN_CW_START => RSFEC_BYPASS_RX_DIN_CW_START_in,
        RSFEC_BYPASS_TX_DIN  => RSFEC_BYPASS_TX_DIN_in,
        RSFEC_BYPASS_TX_DIN_CW_START => RSFEC_BYPASS_TX_DIN_CW_START_in,
        RX_CLK               => RX_CLK_in,
        RX_RESET             => RX_RESET_in,
        RX_SERDES_ALT_DATA0  => RX_SERDES_ALT_DATA0_in,
        RX_SERDES_ALT_DATA1  => RX_SERDES_ALT_DATA1_in,
        RX_SERDES_ALT_DATA2  => RX_SERDES_ALT_DATA2_in,
        RX_SERDES_ALT_DATA3  => RX_SERDES_ALT_DATA3_in,
        RX_SERDES_CLK        => RX_SERDES_CLK_in,
        RX_SERDES_DATA0      => RX_SERDES_DATA0_in,
        RX_SERDES_DATA1      => RX_SERDES_DATA1_in,
        RX_SERDES_DATA2      => RX_SERDES_DATA2_in,
        RX_SERDES_DATA3      => RX_SERDES_DATA3_in,
        RX_SERDES_DATA4      => RX_SERDES_DATA4_in,
        RX_SERDES_DATA5      => RX_SERDES_DATA5_in,
        RX_SERDES_DATA6      => RX_SERDES_DATA6_in,
        RX_SERDES_DATA7      => RX_SERDES_DATA7_in,
        RX_SERDES_DATA8      => RX_SERDES_DATA8_in,
        RX_SERDES_DATA9      => RX_SERDES_DATA9_in,
        RX_SERDES_RESET      => RX_SERDES_RESET_in,
        SCAN_CLK             => SCAN_CLK_in,
        SCAN_EN_N            => SCAN_EN_N_in,
        SCAN_IN              => SCAN_IN_in,
        TEST_MODE_N          => TEST_MODE_N_in,
        TEST_RESET           => TEST_RESET_in,
        TX_CLK               => TX_CLK_in,
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
        TX_PREIN             => TX_PREIN_in,
        TX_PTP_1588OP_IN     => TX_PTP_1588OP_IN_in,
        TX_PTP_CHKSUM_OFFSET_IN => TX_PTP_CHKSUM_OFFSET_IN_in,
        TX_PTP_RXTSTAMP_IN   => TX_PTP_RXTSTAMP_IN_in,
        TX_PTP_TAG_FIELD_IN  => TX_PTP_TAG_FIELD_IN_in,
        TX_PTP_TSTAMP_OFFSET_IN => TX_PTP_TSTAMP_OFFSET_IN_in,
        TX_PTP_UPD_CHKSUM_IN => TX_PTP_UPD_CHKSUM_IN_in,
        TX_RESET             => TX_RESET_in,
        TX_SOPIN0            => TX_SOPIN0_in,
        TX_SOPIN1            => TX_SOPIN1_in,
        TX_SOPIN2            => TX_SOPIN2_in,
        TX_SOPIN3            => TX_SOPIN3_in,
        GSR                  => glblGSR        
      );
  end CMACE4_V;
