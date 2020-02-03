-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2017.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Gigabit Transceiver for UltraScale+ devices
-- /___/   /\      Filename    : GTYE4_CHANNEL.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL GTYE4_CHANNEL -----

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

entity GTYE4_CHANNEL is
  generic (
    ACJTAG_DEBUG_MODE : bit := '0';
    ACJTAG_MODE : bit := '0';
    ACJTAG_RESET : bit := '0';
    ADAPT_CFG0 : std_logic_vector(15 downto 0) := X"9200";
    ADAPT_CFG1 : std_logic_vector(15 downto 0) := X"801C";
    ADAPT_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    ALIGN_COMMA_DOUBLE : string := "FALSE";
    ALIGN_COMMA_ENABLE : std_logic_vector(9 downto 0) := "0001111111";
    ALIGN_COMMA_WORD : integer := 1;
    ALIGN_MCOMMA_DET : string := "TRUE";
    ALIGN_MCOMMA_VALUE : std_logic_vector(9 downto 0) := "1010000011";
    ALIGN_PCOMMA_DET : string := "TRUE";
    ALIGN_PCOMMA_VALUE : std_logic_vector(9 downto 0) := "0101111100";
    A_RXOSCALRESET : bit := '0';
    A_RXPROGDIVRESET : bit := '0';
    A_RXTERMINATION : bit := '1';
    A_TXDIFFCTRL : std_logic_vector(4 downto 0) := "01100";
    A_TXPROGDIVRESET : bit := '0';
    CBCC_DATA_SOURCE_SEL : string := "DECODED";
    CDR_SWAP_MODE_EN : bit := '0';
    CFOK_PWRSVE_EN : bit := '1';
    CHAN_BOND_KEEP_ALIGN : string := "FALSE";
    CHAN_BOND_MAX_SKEW : integer := 7;
    CHAN_BOND_SEQ_1_1 : std_logic_vector(9 downto 0) := "0101111100";
    CHAN_BOND_SEQ_1_2 : std_logic_vector(9 downto 0) := "0000000000";
    CHAN_BOND_SEQ_1_3 : std_logic_vector(9 downto 0) := "0000000000";
    CHAN_BOND_SEQ_1_4 : std_logic_vector(9 downto 0) := "0000000000";
    CHAN_BOND_SEQ_1_ENABLE : std_logic_vector(3 downto 0) := "1111";
    CHAN_BOND_SEQ_2_1 : std_logic_vector(9 downto 0) := "0100000000";
    CHAN_BOND_SEQ_2_2 : std_logic_vector(9 downto 0) := "0100000000";
    CHAN_BOND_SEQ_2_3 : std_logic_vector(9 downto 0) := "0100000000";
    CHAN_BOND_SEQ_2_4 : std_logic_vector(9 downto 0) := "0100000000";
    CHAN_BOND_SEQ_2_ENABLE : std_logic_vector(3 downto 0) := "1111";
    CHAN_BOND_SEQ_2_USE : string := "FALSE";
    CHAN_BOND_SEQ_LEN : integer := 2;
    CH_HSPMUX : std_logic_vector(15 downto 0) := X"2424";
    CKCAL1_CFG_0 : std_logic_vector(15 downto 0) := "1100000011000000";
    CKCAL1_CFG_1 : std_logic_vector(15 downto 0) := "0101000011000000";
    CKCAL1_CFG_2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL1_CFG_3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_0 : std_logic_vector(15 downto 0) := "1100000011000000";
    CKCAL2_CFG_1 : std_logic_vector(15 downto 0) := "1000000011000000";
    CKCAL2_CFG_2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CLK_CORRECT_USE : string := "TRUE";
    CLK_COR_KEEP_IDLE : string := "FALSE";
    CLK_COR_MAX_LAT : integer := 20;
    CLK_COR_MIN_LAT : integer := 18;
    CLK_COR_PRECEDENCE : string := "TRUE";
    CLK_COR_REPEAT_WAIT : integer := 0;
    CLK_COR_SEQ_1_1 : std_logic_vector(9 downto 0) := "0100011100";
    CLK_COR_SEQ_1_2 : std_logic_vector(9 downto 0) := "0000000000";
    CLK_COR_SEQ_1_3 : std_logic_vector(9 downto 0) := "0000000000";
    CLK_COR_SEQ_1_4 : std_logic_vector(9 downto 0) := "0000000000";
    CLK_COR_SEQ_1_ENABLE : std_logic_vector(3 downto 0) := "1111";
    CLK_COR_SEQ_2_1 : std_logic_vector(9 downto 0) := "0100000000";
    CLK_COR_SEQ_2_2 : std_logic_vector(9 downto 0) := "0100000000";
    CLK_COR_SEQ_2_3 : std_logic_vector(9 downto 0) := "0100000000";
    CLK_COR_SEQ_2_4 : std_logic_vector(9 downto 0) := "0100000000";
    CLK_COR_SEQ_2_ENABLE : std_logic_vector(3 downto 0) := "1111";
    CLK_COR_SEQ_2_USE : string := "FALSE";
    CLK_COR_SEQ_LEN : integer := 2;
    CPLL_CFG0 : std_logic_vector(15 downto 0) := X"01FA";
    CPLL_CFG1 : std_logic_vector(15 downto 0) := X"24A9";
    CPLL_CFG2 : std_logic_vector(15 downto 0) := X"6807";
    CPLL_CFG3 : std_logic_vector(15 downto 0) := X"0000";
    CPLL_FBDIV : integer := 4;
    CPLL_FBDIV_45 : integer := 4;
    CPLL_INIT_CFG0 : std_logic_vector(15 downto 0) := X"001E";
    CPLL_LOCK_CFG : std_logic_vector(15 downto 0) := X"01E8";
    CPLL_REFCLK_DIV : integer := 1;
    CTLE3_OCAP_EXT_CTRL : std_logic_vector(2 downto 0) := "000";
    CTLE3_OCAP_EXT_EN : bit := '0';
    DDI_CTRL : std_logic_vector(1 downto 0) := "00";
    DDI_REALIGN_WAIT : integer := 15;
    DEC_MCOMMA_DETECT : string := "TRUE";
    DEC_PCOMMA_DETECT : string := "TRUE";
    DEC_VALID_COMMA_ONLY : string := "TRUE";
    DELAY_ELEC : bit := '0';
    DMONITOR_CFG0 : std_logic_vector(9 downto 0) := "00" & X"00";
    DMONITOR_CFG1 : std_logic_vector(7 downto 0) := X"00";
    ES_CLK_PHASE_SEL : bit := '0';
    ES_CONTROL : std_logic_vector(5 downto 0) := "000000";
    ES_ERRDET_EN : string := "FALSE";
    ES_EYE_SCAN_EN : string := "FALSE";
    ES_HORZ_OFFSET : std_logic_vector(11 downto 0) := X"800";
    ES_PRESCALE : std_logic_vector(4 downto 0) := "00000";
    ES_QUALIFIER0 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER1 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER2 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER3 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER4 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER5 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER6 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER7 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER8 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUALIFIER9 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK0 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK1 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK2 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK3 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK4 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK5 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK6 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK7 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK8 : std_logic_vector(15 downto 0) := X"0000";
    ES_QUAL_MASK9 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK0 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK1 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK2 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK3 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK4 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK5 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK6 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK7 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK8 : std_logic_vector(15 downto 0) := X"0000";
    ES_SDATA_MASK9 : std_logic_vector(15 downto 0) := X"0000";
    EYESCAN_VP_RANGE : integer := 0;
    EYE_SCAN_SWAP_EN : bit := '0';
    FTS_DESKEW_SEQ_ENABLE : std_logic_vector(3 downto 0) := "1111";
    FTS_LANE_DESKEW_CFG : std_logic_vector(3 downto 0) := "1111";
    FTS_LANE_DESKEW_EN : string := "FALSE";
    GEARBOX_MODE : std_logic_vector(4 downto 0) := "00000";
    ISCAN_CK_PH_SEL2 : bit := '0';
    LOCAL_MASTER : bit := '0';
    LPBK_BIAS_CTRL : integer := 4;
    LPBK_EN_RCAL_B : bit := '0';
    LPBK_EXT_RCAL : std_logic_vector(3 downto 0) := "0000";
    LPBK_IND_CTRL0 : integer := 5;
    LPBK_IND_CTRL1 : integer := 5;
    LPBK_IND_CTRL2 : integer := 5;
    LPBK_RG_CTRL : integer := 2;
    OOBDIVCTL : std_logic_vector(1 downto 0) := "00";
    OOB_PWRUP : bit := '0';
    PCI3_AUTO_REALIGN : string := "FRST_SMPL";
    PCI3_PIPE_RX_ELECIDLE : bit := '1';
    PCI3_RX_ASYNC_EBUF_BYPASS : std_logic_vector(1 downto 0) := "00";
    PCI3_RX_ELECIDLE_EI2_ENABLE : bit := '0';
    PCI3_RX_ELECIDLE_H2L_COUNT : std_logic_vector(5 downto 0) := "000000";
    PCI3_RX_ELECIDLE_H2L_DISABLE : std_logic_vector(2 downto 0) := "000";
    PCI3_RX_ELECIDLE_HI_COUNT : std_logic_vector(5 downto 0) := "000000";
    PCI3_RX_ELECIDLE_LP4_DISABLE : bit := '0';
    PCI3_RX_FIFO_DISABLE : bit := '0';
    PCIE3_CLK_COR_EMPTY_THRSH : std_logic_vector(4 downto 0) := "00000";
    PCIE3_CLK_COR_FULL_THRSH : std_logic_vector(5 downto 0) := "010000";
    PCIE3_CLK_COR_MAX_LAT : std_logic_vector(4 downto 0) := "01000";
    PCIE3_CLK_COR_MIN_LAT : std_logic_vector(4 downto 0) := "00100";
    PCIE3_CLK_COR_THRSH_TIMER : std_logic_vector(5 downto 0) := "001000";
    PCIE_64B_DYN_CLKSW_DIS : string := "FALSE";
    PCIE_BUFG_DIV_CTRL : std_logic_vector(15 downto 0) := X"0000";
    PCIE_GEN4_64BIT_INT_EN : string := "FALSE";
    PCIE_PLL_SEL_MODE_GEN12 : std_logic_vector(1 downto 0) := "00";
    PCIE_PLL_SEL_MODE_GEN3 : std_logic_vector(1 downto 0) := "00";
    PCIE_PLL_SEL_MODE_GEN4 : std_logic_vector(1 downto 0) := "00";
    PCIE_RXPCS_CFG_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    PCIE_RXPMA_CFG : std_logic_vector(15 downto 0) := X"0000";
    PCIE_TXPCS_CFG_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    PCIE_TXPMA_CFG : std_logic_vector(15 downto 0) := X"0000";
    PCS_PCIE_EN : string := "FALSE";
    PCS_RSVD0 : std_logic_vector(15 downto 0) := X"0000";
    PD_TRANS_TIME_FROM_P2 : std_logic_vector(11 downto 0) := X"03C";
    PD_TRANS_TIME_NONE_P2 : std_logic_vector(7 downto 0) := X"19";
    PD_TRANS_TIME_TO_P2 : std_logic_vector(7 downto 0) := X"64";
    PREIQ_FREQ_BST : integer := 0;
    RATE_SW_USE_DRP : bit := '0';
    RCLK_SIPO_DLY_ENB : bit := '0';
    RCLK_SIPO_INV_EN : bit := '0';
    RTX_BUF_CML_CTRL : std_logic_vector(2 downto 0) := "010";
    RTX_BUF_TERM_CTRL : std_logic_vector(1 downto 0) := "00";
    RXBUFRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXBUF_ADDR_MODE : string := "FULL";
    RXBUF_EIDLE_HI_CNT : std_logic_vector(3 downto 0) := "1000";
    RXBUF_EIDLE_LO_CNT : std_logic_vector(3 downto 0) := "0000";
    RXBUF_EN : string := "TRUE";
    RXBUF_RESET_ON_CB_CHANGE : string := "TRUE";
    RXBUF_RESET_ON_COMMAALIGN : string := "FALSE";
    RXBUF_RESET_ON_EIDLE : string := "FALSE";
    RXBUF_RESET_ON_RATE_CHANGE : string := "TRUE";
    RXBUF_THRESH_OVFLW : integer := 0;
    RXBUF_THRESH_OVRD : string := "FALSE";
    RXBUF_THRESH_UNDFLW : integer := 4;
    RXCDRFREQRESET_TIME : std_logic_vector(4 downto 0) := "10000";
    RXCDRPHRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXCDR_CFG0 : std_logic_vector(15 downto 0) := X"0003";
    RXCDR_CFG0_GEN3 : std_logic_vector(15 downto 0) := X"0003";
    RXCDR_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG1_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG2 : std_logic_vector(15 downto 0) := X"0164";
    RXCDR_CFG2_GEN2 : std_logic_vector(9 downto 0) := "01" & X"64";
    RXCDR_CFG2_GEN3 : std_logic_vector(15 downto 0) := X"0034";
    RXCDR_CFG2_GEN4 : std_logic_vector(15 downto 0) := X"0034";
    RXCDR_CFG3 : std_logic_vector(15 downto 0) := X"0024";
    RXCDR_CFG3_GEN2 : std_logic_vector(5 downto 0) := "10" & X"4";
    RXCDR_CFG3_GEN3 : std_logic_vector(15 downto 0) := X"0024";
    RXCDR_CFG3_GEN4 : std_logic_vector(15 downto 0) := X"0024";
    RXCDR_CFG4 : std_logic_vector(15 downto 0) := X"5CF6";
    RXCDR_CFG4_GEN3 : std_logic_vector(15 downto 0) := X"5CF6";
    RXCDR_CFG5 : std_logic_vector(15 downto 0) := X"B46B";
    RXCDR_CFG5_GEN3 : std_logic_vector(15 downto 0) := X"146B";
    RXCDR_FR_RESET_ON_EIDLE : bit := '0';
    RXCDR_HOLD_DURING_EIDLE : bit := '0';
    RXCDR_LOCK_CFG0 : std_logic_vector(15 downto 0) := X"0040";
    RXCDR_LOCK_CFG1 : std_logic_vector(15 downto 0) := X"8000";
    RXCDR_LOCK_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_LOCK_CFG3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_LOCK_CFG4 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_PH_RESET_ON_EIDLE : bit := '0';
    RXCFOK_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXCFOK_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXCFOK_CFG2 : std_logic_vector(15 downto 0) := X"002D";
    RXCKCAL1_IQ_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXCKCAL1_I_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXCKCAL1_Q_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXCKCAL2_DX_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXCKCAL2_D_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXCKCAL2_S_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXCKCAL2_X_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXDFELPMRESET_TIME : std_logic_vector(6 downto 0) := "0001111";
    RXDFELPM_KL_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFELPM_KL_CFG1 : std_logic_vector(15 downto 0) := X"0022";
    RXDFELPM_KL_CFG2 : std_logic_vector(15 downto 0) := X"0100";
    RXDFE_CFG0 : std_logic_vector(15 downto 0) := X"4000";
    RXDFE_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_GC_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_GC_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_GC_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H2_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H2_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_H3_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H3_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_H4_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H4_CFG1 : std_logic_vector(15 downto 0) := X"0003";
    RXDFE_H5_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H5_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_H6_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H6_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_H7_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H7_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_H8_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H8_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_H9_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_H9_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_HA_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_HA_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_HB_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_HB_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_HC_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_HC_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_HD_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_HD_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_HE_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_HE_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_HF_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_HF_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_KH_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_KH_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_KH_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_KH_CFG3 : std_logic_vector(15 downto 0) := X"2000";
    RXDFE_OS_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_OS_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_UT_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_UT_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_UT_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_VP_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_VP_CFG1 : std_logic_vector(15 downto 0) := X"0022";
    RXDLY_CFG : std_logic_vector(15 downto 0) := X"0010";
    RXDLY_LCFG : std_logic_vector(15 downto 0) := X"0030";
    RXELECIDLE_CFG : string := "SIGCFG_4";
    RXGBOX_FIFO_INIT_RD_ADDR : integer := 4;
    RXGEARBOX_EN : string := "FALSE";
    RXISCANRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXLPM_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXLPM_GC_CFG : std_logic_vector(15 downto 0) := X"1000";
    RXLPM_KH_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXLPM_KH_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXLPM_OS_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXLPM_OS_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXOOB_CFG : std_logic_vector(8 downto 0) := "000110000";
    RXOOB_CLK_CFG : string := "PMA";
    RXOSCALRESET_TIME : std_logic_vector(4 downto 0) := "00011";
    RXOUT_DIV : integer := 4;
    RXPCSRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXPHBEACON_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXPHDLY_CFG : std_logic_vector(15 downto 0) := X"2020";
    RXPHSAMP_CFG : std_logic_vector(15 downto 0) := X"2100";
    RXPHSLIP_CFG : std_logic_vector(15 downto 0) := X"9933";
    RXPH_MONITOR_SEL : std_logic_vector(4 downto 0) := "00000";
    RXPI_CFG0 : std_logic_vector(15 downto 0) := X"0102";
    RXPI_CFG1 : std_logic_vector(15 downto 0) := "0000000001010100";
    RXPMACLK_SEL : string := "DATA";
    RXPMARESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXPRBS_ERR_LOOPBACK : bit := '0';
    RXPRBS_LINKACQ_CNT : integer := 15;
    RXREFCLKDIV2_SEL : bit := '0';
    RXSLIDE_AUTO_WAIT : integer := 7;
    RXSLIDE_MODE : string := "OFF";
    RXSYNC_MULTILANE : bit := '0';
    RXSYNC_OVRD : bit := '0';
    RXSYNC_SKIP_DA : bit := '0';
    RX_AFE_CM_EN : bit := '0';
    RX_BIAS_CFG0 : std_logic_vector(15 downto 0) := X"12B0";
    RX_BUFFER_CFG : std_logic_vector(5 downto 0) := "000000";
    RX_CAPFF_SARC_ENB : bit := '0';
    RX_CLK25_DIV : integer := 8;
    RX_CLKMUX_EN : bit := '1';
    RX_CLK_SLIP_OVRD : std_logic_vector(4 downto 0) := "00000";
    RX_CM_BUF_CFG : std_logic_vector(3 downto 0) := "1010";
    RX_CM_BUF_PD : bit := '0';
    RX_CM_SEL : integer := 2;
    RX_CM_TRIM : integer := 12;
    RX_CTLE_PWR_SAVING : bit := '0';
    RX_CTLE_RES_CTRL : std_logic_vector(3 downto 0) := "0000";
    RX_DATA_WIDTH : integer := 20;
    RX_DDI_SEL : std_logic_vector(5 downto 0) := "000000";
    RX_DEFER_RESET_BUF_EN : string := "TRUE";
    RX_DEGEN_CTRL : std_logic_vector(2 downto 0) := "100";
    RX_DFELPM_CFG0 : integer := 10;
    RX_DFELPM_CFG1 : bit := '1';
    RX_DFELPM_KLKH_AGC_STUP_EN : bit := '1';
    RX_DFE_AGC_CFG1 : integer := 4;
    RX_DFE_KL_LPM_KH_CFG0 : integer := 1;
    RX_DFE_KL_LPM_KH_CFG1 : integer := 2;
    RX_DFE_KL_LPM_KL_CFG0 : std_logic_vector(1 downto 0) := "01";
    RX_DFE_KL_LPM_KL_CFG1 : integer := 4;
    RX_DFE_LPM_HOLD_DURING_EIDLE : bit := '0';
    RX_DISPERR_SEQ_MATCH : string := "TRUE";
    RX_DIVRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RX_EN_CTLE_RCAL_B : bit := '0';
    RX_EN_SUM_RCAL_B : integer := 0;
    RX_EYESCAN_VS_CODE : std_logic_vector(6 downto 0) := "0000000";
    RX_EYESCAN_VS_NEG_DIR : bit := '0';
    RX_EYESCAN_VS_RANGE : std_logic_vector(1 downto 0) := "10";
    RX_EYESCAN_VS_UT_SIGN : bit := '0';
    RX_FABINT_USRCLK_FLOP : bit := '0';
    RX_I2V_FILTER_EN : bit := '1';
    RX_INT_DATAWIDTH : integer := 1;
    RX_PMA_POWER_SAVE : bit := '0';
    RX_PMA_RSV0 : std_logic_vector(15 downto 0) := X"002F";
    RX_PROGDIV_CFG : real := 0.0;
    RX_PROGDIV_RATE : std_logic_vector(15 downto 0) := X"0001";
    RX_RESLOAD_CTRL : std_logic_vector(3 downto 0) := "0000";
    RX_RESLOAD_OVRD : bit := '0';
    RX_SAMPLE_PERIOD : std_logic_vector(2 downto 0) := "101";
    RX_SIG_VALID_DLY : integer := 11;
    RX_SUM_DEGEN_AVTT_OVERITE : integer := 0;
    RX_SUM_DFETAPREP_EN : bit := '0';
    RX_SUM_IREF_TUNE : std_logic_vector(3 downto 0) := "0000";
    RX_SUM_PWR_SAVING : integer := 0;
    RX_SUM_RES_CTRL : std_logic_vector(3 downto 0) := "0000";
    RX_SUM_VCMTUNE : std_logic_vector(3 downto 0) := "0011";
    RX_SUM_VCM_BIAS_TUNE_EN : bit := '1';
    RX_SUM_VCM_OVWR : bit := '0';
    RX_SUM_VREF_TUNE : std_logic_vector(2 downto 0) := "100";
    RX_TUNE_AFE_OS : std_logic_vector(1 downto 0) := "00";
    RX_VREG_CTRL : std_logic_vector(2 downto 0) := "010";
    RX_VREG_PDB : bit := '1';
    RX_WIDEMODE_CDR : std_logic_vector(1 downto 0) := "01";
    RX_WIDEMODE_CDR_GEN3 : std_logic_vector(1 downto 0) := "01";
    RX_WIDEMODE_CDR_GEN4 : std_logic_vector(1 downto 0) := "01";
    RX_XCLK_SEL : string := "RXDES";
    RX_XMODE_SEL : bit := '0';
    SAMPLE_CLK_PHASE : bit := '0';
    SAS_12G_MODE : bit := '0';
    SATA_BURST_SEQ_LEN : std_logic_vector(3 downto 0) := "1111";
    SATA_BURST_VAL : std_logic_vector(2 downto 0) := "100";
    SATA_CPLL_CFG : string := "VCO_3000MHZ";
    SATA_EIDLE_VAL : std_logic_vector(2 downto 0) := "100";
    SHOW_REALIGN_COMMA : string := "TRUE";
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    SIM_MODE : string := "FAST";
    SIM_RECEIVER_DETECT_PASS : string := "TRUE";
    SIM_RESET_SPEEDUP : string := "TRUE";
    SIM_TX_EIDLE_DRIVE_LEVEL : string := "Z";
    SRSTMODE : bit := '0';
    TAPDLY_SET_TX : std_logic_vector(1 downto 0) := "00";
    TERM_RCAL_CFG : std_logic_vector(14 downto 0) := "100001000010000";
    TERM_RCAL_OVRD : std_logic_vector(2 downto 0) := "000";
    TRANS_TIME_RATE : std_logic_vector(7 downto 0) := X"0E";
    TST_RSV0 : std_logic_vector(7 downto 0) := X"00";
    TST_RSV1 : std_logic_vector(7 downto 0) := X"00";
    TXBUF_EN : string := "TRUE";
    TXBUF_RESET_ON_RATE_CHANGE : string := "FALSE";
    TXDLY_CFG : std_logic_vector(15 downto 0) := X"0010";
    TXDLY_LCFG : std_logic_vector(15 downto 0) := X"0030";
    TXDRV_FREQBAND : integer := 0;
    TXFE_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    TXFE_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    TXFE_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    TXFE_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    TXFIFO_ADDR_CFG : string := "LOW";
    TXGBOX_FIFO_INIT_RD_ADDR : integer := 4;
    TXGEARBOX_EN : string := "FALSE";
    TXOUT_DIV : integer := 4;
    TXPCSRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    TXPHDLY_CFG0 : std_logic_vector(15 downto 0) := X"6020";
    TXPHDLY_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    TXPH_CFG : std_logic_vector(15 downto 0) := X"0123";
    TXPH_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    TXPH_MONITOR_SEL : std_logic_vector(4 downto 0) := "00000";
    TXPI_CFG0 : std_logic_vector(15 downto 0) := "0000000100000000";
    TXPI_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    TXPI_GRAY_SEL : bit := '0';
    TXPI_INVSTROBE_SEL : bit := '0';
    TXPI_PPM : bit := '0';
    TXPI_PPM_CFG : std_logic_vector(7 downto 0) := "00000000";
    TXPI_SYNFREQ_PPM : std_logic_vector(2 downto 0) := "000";
    TXPMARESET_TIME : std_logic_vector(4 downto 0) := "00001";
    TXREFCLKDIV2_SEL : bit := '0';
    TXSWBST_BST : integer := 1;
    TXSWBST_EN : integer := 0;
    TXSWBST_MAG : integer := 6;
    TXSYNC_MULTILANE : bit := '0';
    TXSYNC_OVRD : bit := '0';
    TXSYNC_SKIP_DA : bit := '0';
    TX_CLK25_DIV : integer := 8;
    TX_CLKMUX_EN : bit := '1';
    TX_DATA_WIDTH : integer := 20;
    TX_DCC_LOOP_RST_CFG : std_logic_vector(15 downto 0) := X"0000";
    TX_DEEMPH0 : std_logic_vector(5 downto 0) := "000000";
    TX_DEEMPH1 : std_logic_vector(5 downto 0) := "000000";
    TX_DEEMPH2 : std_logic_vector(5 downto 0) := "000000";
    TX_DEEMPH3 : std_logic_vector(5 downto 0) := "000000";
    TX_DIVRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    TX_DRIVE_MODE : string := "DIRECT";
    TX_EIDLE_ASSERT_DELAY : std_logic_vector(2 downto 0) := "110";
    TX_EIDLE_DEASSERT_DELAY : std_logic_vector(2 downto 0) := "100";
    TX_FABINT_USRCLK_FLOP : bit := '0';
    TX_FIFO_BYP_EN : bit := '0';
    TX_IDLE_DATA_ZERO : bit := '0';
    TX_INT_DATAWIDTH : integer := 1;
    TX_LOOPBACK_DRIVE_HIZ : string := "FALSE";
    TX_MAINCURSOR_SEL : bit := '0';
    TX_MARGIN_FULL_0 : std_logic_vector(6 downto 0) := "1001110";
    TX_MARGIN_FULL_1 : std_logic_vector(6 downto 0) := "1001001";
    TX_MARGIN_FULL_2 : std_logic_vector(6 downto 0) := "1000101";
    TX_MARGIN_FULL_3 : std_logic_vector(6 downto 0) := "1000010";
    TX_MARGIN_FULL_4 : std_logic_vector(6 downto 0) := "1000000";
    TX_MARGIN_LOW_0 : std_logic_vector(6 downto 0) := "1000110";
    TX_MARGIN_LOW_1 : std_logic_vector(6 downto 0) := "1000100";
    TX_MARGIN_LOW_2 : std_logic_vector(6 downto 0) := "1000010";
    TX_MARGIN_LOW_3 : std_logic_vector(6 downto 0) := "1000000";
    TX_MARGIN_LOW_4 : std_logic_vector(6 downto 0) := "1000000";
    TX_PHICAL_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    TX_PHICAL_CFG1 : std_logic_vector(15 downto 0) := X"003F";
    TX_PI_BIASSET : integer := 0;
    TX_PMADATA_OPT : bit := '0';
    TX_PMA_POWER_SAVE : bit := '0';
    TX_PMA_RSV0 : std_logic_vector(15 downto 0) := X"0000";
    TX_PMA_RSV1 : std_logic_vector(15 downto 0) := X"0000";
    TX_PROGCLK_SEL : string := "POSTPI";
    TX_PROGDIV_CFG : real := 0.0;
    TX_PROGDIV_RATE : std_logic_vector(15 downto 0) := X"0001";
    TX_RXDETECT_CFG : std_logic_vector(13 downto 0) := "00" & X"032";
    TX_RXDETECT_REF : integer := 3;
    TX_SAMPLE_PERIOD : std_logic_vector(2 downto 0) := "101";
    TX_SW_MEAS : std_logic_vector(1 downto 0) := "00";
    TX_VREG_CTRL : std_logic_vector(2 downto 0) := "000";
    TX_VREG_PDB : bit := '0';
    TX_VREG_VREFSEL : std_logic_vector(1 downto 0) := "00";
    TX_XCLK_SEL : string := "TXOUT";
    USB_BOTH_BURST_IDLE : bit := '0';
    USB_BURSTMAX_U3WAKE : std_logic_vector(6 downto 0) := "1111111";
    USB_BURSTMIN_U3WAKE : std_logic_vector(6 downto 0) := "1100011";
    USB_CLK_COR_EQ_EN : bit := '0';
    USB_EXT_CNTL : bit := '1';
    USB_IDLEMAX_POLLING : std_logic_vector(9 downto 0) := "1010111011";
    USB_IDLEMIN_POLLING : std_logic_vector(9 downto 0) := "0100101011";
    USB_LFPSPING_BURST : std_logic_vector(8 downto 0) := "000000101";
    USB_LFPSPOLLING_BURST : std_logic_vector(8 downto 0) := "000110001";
    USB_LFPSPOLLING_IDLE_MS : std_logic_vector(8 downto 0) := "000000100";
    USB_LFPSU1EXIT_BURST : std_logic_vector(8 downto 0) := "000011101";
    USB_LFPSU2LPEXIT_BURST_MS : std_logic_vector(8 downto 0) := "001100011";
    USB_LFPSU3WAKE_BURST_MS : std_logic_vector(8 downto 0) := "111110011";
    USB_LFPS_TPERIOD : std_logic_vector(3 downto 0) := "0011";
    USB_LFPS_TPERIOD_ACCURATE : bit := '1';
    USB_MODE : bit := '0';
    USB_PCIE_ERR_REP_DIS : bit := '0';
    USB_PING_SATA_MAX_INIT : integer := 21;
    USB_PING_SATA_MIN_INIT : integer := 12;
    USB_POLL_SATA_MAX_BURST : integer := 8;
    USB_POLL_SATA_MIN_BURST : integer := 4;
    USB_RAW_ELEC : bit := '0';
    USB_RXIDLE_P0_CTRL : bit := '1';
    USB_TXIDLE_TUNE_ENABLE : bit := '1';
    USB_U1_SATA_MAX_WAKE : integer := 7;
    USB_U1_SATA_MIN_WAKE : integer := 4;
    USB_U2_SAS_MAX_COM : integer := 64;
    USB_U2_SAS_MIN_COM : integer := 36;
    USE_PCS_CLK_PHASE_SEL : bit := '0';
    Y_ALL_MODE : bit := '0'
  );
  
  port (
    BUFGTCE              : out std_ulogic;
    BUFGTCEMASK          : out std_logic_vector(2 downto 0);
    BUFGTDIV             : out std_logic_vector(8 downto 0);
    BUFGTRESET           : out std_ulogic;
    BUFGTRSTMASK         : out std_logic_vector(2 downto 0);
    CPLLFBCLKLOST        : out std_ulogic;
    CPLLLOCK             : out std_ulogic;
    CPLLREFCLKLOST       : out std_ulogic;
    DMONITOROUT          : out std_logic_vector(15 downto 0);
    DMONITOROUTCLK       : out std_ulogic;
    DRPDO                : out std_logic_vector(15 downto 0);
    DRPRDY               : out std_ulogic;
    EYESCANDATAERROR     : out std_ulogic;
    GTPOWERGOOD          : out std_ulogic;
    GTREFCLKMONITOR      : out std_ulogic;
    GTYTXN               : out std_ulogic;
    GTYTXP               : out std_ulogic;
    PCIERATEGEN3         : out std_ulogic;
    PCIERATEIDLE         : out std_ulogic;
    PCIERATEQPLLPD       : out std_logic_vector(1 downto 0);
    PCIERATEQPLLRESET    : out std_logic_vector(1 downto 0);
    PCIESYNCTXSYNCDONE   : out std_ulogic;
    PCIEUSERGEN3RDY      : out std_ulogic;
    PCIEUSERPHYSTATUSRST : out std_ulogic;
    PCIEUSERRATESTART    : out std_ulogic;
    PCSRSVDOUT           : out std_logic_vector(15 downto 0);
    PHYSTATUS            : out std_ulogic;
    PINRSRVDAS           : out std_logic_vector(15 downto 0);
    POWERPRESENT         : out std_ulogic;
    RESETEXCEPTION       : out std_ulogic;
    RXBUFSTATUS          : out std_logic_vector(2 downto 0);
    RXBYTEISALIGNED      : out std_ulogic;
    RXBYTEREALIGN        : out std_ulogic;
    RXCDRLOCK            : out std_ulogic;
    RXCDRPHDONE          : out std_ulogic;
    RXCHANBONDSEQ        : out std_ulogic;
    RXCHANISALIGNED      : out std_ulogic;
    RXCHANREALIGN        : out std_ulogic;
    RXCHBONDO            : out std_logic_vector(4 downto 0);
    RXCKCALDONE          : out std_ulogic;
    RXCLKCORCNT          : out std_logic_vector(1 downto 0);
    RXCOMINITDET         : out std_ulogic;
    RXCOMMADET           : out std_ulogic;
    RXCOMSASDET          : out std_ulogic;
    RXCOMWAKEDET         : out std_ulogic;
    RXCTRL0              : out std_logic_vector(15 downto 0);
    RXCTRL1              : out std_logic_vector(15 downto 0);
    RXCTRL2              : out std_logic_vector(7 downto 0);
    RXCTRL3              : out std_logic_vector(7 downto 0);
    RXDATA               : out std_logic_vector(127 downto 0);
    RXDATAEXTENDRSVD     : out std_logic_vector(7 downto 0);
    RXDATAVALID          : out std_logic_vector(1 downto 0);
    RXDLYSRESETDONE      : out std_ulogic;
    RXELECIDLE           : out std_ulogic;
    RXHEADER             : out std_logic_vector(5 downto 0);
    RXHEADERVALID        : out std_logic_vector(1 downto 0);
    RXLFPSTRESETDET      : out std_ulogic;
    RXLFPSU2LPEXITDET    : out std_ulogic;
    RXLFPSU3WAKEDET      : out std_ulogic;
    RXMONITOROUT         : out std_logic_vector(7 downto 0);
    RXOSINTDONE          : out std_ulogic;
    RXOSINTSTARTED       : out std_ulogic;
    RXOSINTSTROBEDONE    : out std_ulogic;
    RXOSINTSTROBESTARTED : out std_ulogic;
    RXOUTCLK             : out std_ulogic;
    RXOUTCLKFABRIC       : out std_ulogic;
    RXOUTCLKPCS          : out std_ulogic;
    RXPHALIGNDONE        : out std_ulogic;
    RXPHALIGNERR         : out std_ulogic;
    RXPMARESETDONE       : out std_ulogic;
    RXPRBSERR            : out std_ulogic;
    RXPRBSLOCKED         : out std_ulogic;
    RXPRGDIVRESETDONE    : out std_ulogic;
    RXRATEDONE           : out std_ulogic;
    RXRECCLKOUT          : out std_ulogic;
    RXRESETDONE          : out std_ulogic;
    RXSLIDERDY           : out std_ulogic;
    RXSLIPDONE           : out std_ulogic;
    RXSLIPOUTCLKRDY      : out std_ulogic;
    RXSLIPPMARDY         : out std_ulogic;
    RXSTARTOFSEQ         : out std_logic_vector(1 downto 0);
    RXSTATUS             : out std_logic_vector(2 downto 0);
    RXSYNCDONE           : out std_ulogic;
    RXSYNCOUT            : out std_ulogic;
    RXVALID              : out std_ulogic;
    TXBUFSTATUS          : out std_logic_vector(1 downto 0);
    TXCOMFINISH          : out std_ulogic;
    TXDCCDONE            : out std_ulogic;
    TXDLYSRESETDONE      : out std_ulogic;
    TXOUTCLK             : out std_ulogic;
    TXOUTCLKFABRIC       : out std_ulogic;
    TXOUTCLKPCS          : out std_ulogic;
    TXPHALIGNDONE        : out std_ulogic;
    TXPHINITDONE         : out std_ulogic;
    TXPMARESETDONE       : out std_ulogic;
    TXPRGDIVRESETDONE    : out std_ulogic;
    TXRATEDONE           : out std_ulogic;
    TXRESETDONE          : out std_ulogic;
    TXSYNCDONE           : out std_ulogic;
    TXSYNCOUT            : out std_ulogic;
    CDRSTEPDIR           : in std_ulogic;
    CDRSTEPSQ            : in std_ulogic;
    CDRSTEPSX            : in std_ulogic;
    CFGRESET             : in std_ulogic;
    CLKRSVD0             : in std_ulogic;
    CLKRSVD1             : in std_ulogic;
    CPLLFREQLOCK         : in std_ulogic;
    CPLLLOCKDETCLK       : in std_ulogic;
    CPLLLOCKEN           : in std_ulogic;
    CPLLPD               : in std_ulogic;
    CPLLREFCLKSEL        : in std_logic_vector(2 downto 0);
    CPLLRESET            : in std_ulogic;
    DMONFIFORESET        : in std_ulogic;
    DMONITORCLK          : in std_ulogic;
    DRPADDR              : in std_logic_vector(9 downto 0);
    DRPCLK               : in std_ulogic;
    DRPDI                : in std_logic_vector(15 downto 0);
    DRPEN                : in std_ulogic;
    DRPRST               : in std_ulogic;
    DRPWE                : in std_ulogic;
    EYESCANRESET         : in std_ulogic;
    EYESCANTRIGGER       : in std_ulogic;
    FREQOS               : in std_ulogic;
    GTGREFCLK            : in std_ulogic;
    GTNORTHREFCLK0       : in std_ulogic;
    GTNORTHREFCLK1       : in std_ulogic;
    GTREFCLK0            : in std_ulogic;
    GTREFCLK1            : in std_ulogic;
    GTRSVD               : in std_logic_vector(15 downto 0);
    GTRXRESET            : in std_ulogic;
    GTRXRESETSEL         : in std_ulogic;
    GTSOUTHREFCLK0       : in std_ulogic;
    GTSOUTHREFCLK1       : in std_ulogic;
    GTTXRESET            : in std_ulogic;
    GTTXRESETSEL         : in std_ulogic;
    GTYRXN               : in std_ulogic;
    GTYRXP               : in std_ulogic;
    INCPCTRL             : in std_ulogic;
    LOOPBACK             : in std_logic_vector(2 downto 0);
    PCIEEQRXEQADAPTDONE  : in std_ulogic;
    PCIERSTIDLE          : in std_ulogic;
    PCIERSTTXSYNCSTART   : in std_ulogic;
    PCIEUSERRATEDONE     : in std_ulogic;
    PCSRSVDIN            : in std_logic_vector(15 downto 0);
    QPLL0CLK             : in std_ulogic;
    QPLL0FREQLOCK        : in std_ulogic;
    QPLL0REFCLK          : in std_ulogic;
    QPLL1CLK             : in std_ulogic;
    QPLL1FREQLOCK        : in std_ulogic;
    QPLL1REFCLK          : in std_ulogic;
    RESETOVRD            : in std_ulogic;
    RX8B10BEN            : in std_ulogic;
    RXAFECFOKEN          : in std_ulogic;
    RXBUFRESET           : in std_ulogic;
    RXCDRFREQRESET       : in std_ulogic;
    RXCDRHOLD            : in std_ulogic;
    RXCDROVRDEN          : in std_ulogic;
    RXCDRRESET           : in std_ulogic;
    RXCHBONDEN           : in std_ulogic;
    RXCHBONDI            : in std_logic_vector(4 downto 0);
    RXCHBONDLEVEL        : in std_logic_vector(2 downto 0);
    RXCHBONDMASTER       : in std_ulogic;
    RXCHBONDSLAVE        : in std_ulogic;
    RXCKCALRESET         : in std_ulogic;
    RXCKCALSTART         : in std_logic_vector(6 downto 0);
    RXCOMMADETEN         : in std_ulogic;
    RXDFEAGCHOLD         : in std_ulogic;
    RXDFEAGCOVRDEN       : in std_ulogic;
    RXDFECFOKFCNUM       : in std_logic_vector(3 downto 0);
    RXDFECFOKFEN         : in std_ulogic;
    RXDFECFOKFPULSE      : in std_ulogic;
    RXDFECFOKHOLD        : in std_ulogic;
    RXDFECFOKOVREN       : in std_ulogic;
    RXDFEKHHOLD          : in std_ulogic;
    RXDFEKHOVRDEN        : in std_ulogic;
    RXDFELFHOLD          : in std_ulogic;
    RXDFELFOVRDEN        : in std_ulogic;
    RXDFELPMRESET        : in std_ulogic;
    RXDFETAP10HOLD       : in std_ulogic;
    RXDFETAP10OVRDEN     : in std_ulogic;
    RXDFETAP11HOLD       : in std_ulogic;
    RXDFETAP11OVRDEN     : in std_ulogic;
    RXDFETAP12HOLD       : in std_ulogic;
    RXDFETAP12OVRDEN     : in std_ulogic;
    RXDFETAP13HOLD       : in std_ulogic;
    RXDFETAP13OVRDEN     : in std_ulogic;
    RXDFETAP14HOLD       : in std_ulogic;
    RXDFETAP14OVRDEN     : in std_ulogic;
    RXDFETAP15HOLD       : in std_ulogic;
    RXDFETAP15OVRDEN     : in std_ulogic;
    RXDFETAP2HOLD        : in std_ulogic;
    RXDFETAP2OVRDEN      : in std_ulogic;
    RXDFETAP3HOLD        : in std_ulogic;
    RXDFETAP3OVRDEN      : in std_ulogic;
    RXDFETAP4HOLD        : in std_ulogic;
    RXDFETAP4OVRDEN      : in std_ulogic;
    RXDFETAP5HOLD        : in std_ulogic;
    RXDFETAP5OVRDEN      : in std_ulogic;
    RXDFETAP6HOLD        : in std_ulogic;
    RXDFETAP6OVRDEN      : in std_ulogic;
    RXDFETAP7HOLD        : in std_ulogic;
    RXDFETAP7OVRDEN      : in std_ulogic;
    RXDFETAP8HOLD        : in std_ulogic;
    RXDFETAP8OVRDEN      : in std_ulogic;
    RXDFETAP9HOLD        : in std_ulogic;
    RXDFETAP9OVRDEN      : in std_ulogic;
    RXDFEUTHOLD          : in std_ulogic;
    RXDFEUTOVRDEN        : in std_ulogic;
    RXDFEVPHOLD          : in std_ulogic;
    RXDFEVPOVRDEN        : in std_ulogic;
    RXDFEXYDEN           : in std_ulogic;
    RXDLYBYPASS          : in std_ulogic;
    RXDLYEN              : in std_ulogic;
    RXDLYOVRDEN          : in std_ulogic;
    RXDLYSRESET          : in std_ulogic;
    RXELECIDLEMODE       : in std_logic_vector(1 downto 0);
    RXEQTRAINING         : in std_ulogic;
    RXGEARBOXSLIP        : in std_ulogic;
    RXLATCLK             : in std_ulogic;
    RXLPMEN              : in std_ulogic;
    RXLPMGCHOLD          : in std_ulogic;
    RXLPMGCOVRDEN        : in std_ulogic;
    RXLPMHFHOLD          : in std_ulogic;
    RXLPMHFOVRDEN        : in std_ulogic;
    RXLPMLFHOLD          : in std_ulogic;
    RXLPMLFKLOVRDEN      : in std_ulogic;
    RXLPMOSHOLD          : in std_ulogic;
    RXLPMOSOVRDEN        : in std_ulogic;
    RXMCOMMAALIGNEN      : in std_ulogic;
    RXMONITORSEL         : in std_logic_vector(1 downto 0);
    RXOOBRESET           : in std_ulogic;
    RXOSCALRESET         : in std_ulogic;
    RXOSHOLD             : in std_ulogic;
    RXOSOVRDEN           : in std_ulogic;
    RXOUTCLKSEL          : in std_logic_vector(2 downto 0);
    RXPCOMMAALIGNEN      : in std_ulogic;
    RXPCSRESET           : in std_ulogic;
    RXPD                 : in std_logic_vector(1 downto 0);
    RXPHALIGN            : in std_ulogic;
    RXPHALIGNEN          : in std_ulogic;
    RXPHDLYPD            : in std_ulogic;
    RXPHDLYRESET         : in std_ulogic;
    RXPLLCLKSEL          : in std_logic_vector(1 downto 0);
    RXPMARESET           : in std_ulogic;
    RXPOLARITY           : in std_ulogic;
    RXPRBSCNTRESET       : in std_ulogic;
    RXPRBSSEL            : in std_logic_vector(3 downto 0);
    RXPROGDIVRESET       : in std_ulogic;
    RXRATE               : in std_logic_vector(2 downto 0);
    RXRATEMODE           : in std_ulogic;
    RXSLIDE              : in std_ulogic;
    RXSLIPOUTCLK         : in std_ulogic;
    RXSLIPPMA            : in std_ulogic;
    RXSYNCALLIN          : in std_ulogic;
    RXSYNCIN             : in std_ulogic;
    RXSYNCMODE           : in std_ulogic;
    RXSYSCLKSEL          : in std_logic_vector(1 downto 0);
    RXTERMINATION        : in std_ulogic;
    RXUSERRDY            : in std_ulogic;
    RXUSRCLK             : in std_ulogic;
    RXUSRCLK2            : in std_ulogic;
    SIGVALIDCLK          : in std_ulogic;
    TSTIN                : in std_logic_vector(19 downto 0);
    TX8B10BBYPASS        : in std_logic_vector(7 downto 0);
    TX8B10BEN            : in std_ulogic;
    TXCOMINIT            : in std_ulogic;
    TXCOMSAS             : in std_ulogic;
    TXCOMWAKE            : in std_ulogic;
    TXCTRL0              : in std_logic_vector(15 downto 0);
    TXCTRL1              : in std_logic_vector(15 downto 0);
    TXCTRL2              : in std_logic_vector(7 downto 0);
    TXDATA               : in std_logic_vector(127 downto 0);
    TXDATAEXTENDRSVD     : in std_logic_vector(7 downto 0);
    TXDCCFORCESTART      : in std_ulogic;
    TXDCCRESET           : in std_ulogic;
    TXDEEMPH             : in std_logic_vector(1 downto 0);
    TXDETECTRX           : in std_ulogic;
    TXDIFFCTRL           : in std_logic_vector(4 downto 0);
    TXDLYBYPASS          : in std_ulogic;
    TXDLYEN              : in std_ulogic;
    TXDLYHOLD            : in std_ulogic;
    TXDLYOVRDEN          : in std_ulogic;
    TXDLYSRESET          : in std_ulogic;
    TXDLYUPDOWN          : in std_ulogic;
    TXELECIDLE           : in std_ulogic;
    TXHEADER             : in std_logic_vector(5 downto 0);
    TXINHIBIT            : in std_ulogic;
    TXLATCLK             : in std_ulogic;
    TXLFPSTRESET         : in std_ulogic;
    TXLFPSU2LPEXIT       : in std_ulogic;
    TXLFPSU3WAKE         : in std_ulogic;
    TXMAINCURSOR         : in std_logic_vector(6 downto 0);
    TXMARGIN             : in std_logic_vector(2 downto 0);
    TXMUXDCDEXHOLD       : in std_ulogic;
    TXMUXDCDORWREN       : in std_ulogic;
    TXONESZEROS          : in std_ulogic;
    TXOUTCLKSEL          : in std_logic_vector(2 downto 0);
    TXPCSRESET           : in std_ulogic;
    TXPD                 : in std_logic_vector(1 downto 0);
    TXPDELECIDLEMODE     : in std_ulogic;
    TXPHALIGN            : in std_ulogic;
    TXPHALIGNEN          : in std_ulogic;
    TXPHDLYPD            : in std_ulogic;
    TXPHDLYRESET         : in std_ulogic;
    TXPHDLYTSTCLK        : in std_ulogic;
    TXPHINIT             : in std_ulogic;
    TXPHOVRDEN           : in std_ulogic;
    TXPIPPMEN            : in std_ulogic;
    TXPIPPMOVRDEN        : in std_ulogic;
    TXPIPPMPD            : in std_ulogic;
    TXPIPPMSEL           : in std_ulogic;
    TXPIPPMSTEPSIZE      : in std_logic_vector(4 downto 0);
    TXPISOPD             : in std_ulogic;
    TXPLLCLKSEL          : in std_logic_vector(1 downto 0);
    TXPMARESET           : in std_ulogic;
    TXPOLARITY           : in std_ulogic;
    TXPOSTCURSOR         : in std_logic_vector(4 downto 0);
    TXPRBSFORCEERR       : in std_ulogic;
    TXPRBSSEL            : in std_logic_vector(3 downto 0);
    TXPRECURSOR          : in std_logic_vector(4 downto 0);
    TXPROGDIVRESET       : in std_ulogic;
    TXRATE               : in std_logic_vector(2 downto 0);
    TXRATEMODE           : in std_ulogic;
    TXSEQUENCE           : in std_logic_vector(6 downto 0);
    TXSWING              : in std_ulogic;
    TXSYNCALLIN          : in std_ulogic;
    TXSYNCIN             : in std_ulogic;
    TXSYNCMODE           : in std_ulogic;
    TXSYSCLKSEL          : in std_logic_vector(1 downto 0);
    TXUSERRDY            : in std_ulogic;
    TXUSRCLK             : in std_ulogic;
    TXUSRCLK2            : in std_ulogic
  );
end GTYE4_CHANNEL;

architecture GTYE4_CHANNEL_V of GTYE4_CHANNEL is
  component SIP_GTYE4_CHANNEL
    port (
      ACJTAG_DEBUG_MODE    : in std_logic_vector(0 downto 0);
      ACJTAG_MODE          : in std_logic_vector(0 downto 0);
      ACJTAG_RESET         : in std_logic_vector(0 downto 0);
      ADAPT_CFG0           : in std_logic_vector(15 downto 0);
      ADAPT_CFG1           : in std_logic_vector(15 downto 0);
      ADAPT_CFG2           : in std_logic_vector(15 downto 0);
      AEN_CDRSTEPSEL       : in std_logic_vector(0 downto 0);
      AEN_CPLL             : in std_logic_vector(0 downto 0);
      AEN_LOOPBACK         : in std_logic_vector(0 downto 0);
      AEN_MASTER           : in std_logic_vector(0 downto 0);
      AEN_PD_AND_EIDLE     : in std_logic_vector(0 downto 0);
      AEN_POLARITY         : in std_logic_vector(0 downto 0);
      AEN_PRBS             : in std_logic_vector(0 downto 0);
      AEN_RESET            : in std_logic_vector(0 downto 0);
      AEN_RXCDR            : in std_logic_vector(0 downto 0);
      AEN_RXDFE            : in std_logic_vector(0 downto 0);
      AEN_RXDFELPM         : in std_logic_vector(0 downto 0);
      AEN_RXOUTCLK_SEL     : in std_logic_vector(0 downto 0);
      AEN_RXPHDLY          : in std_logic_vector(0 downto 0);
      AEN_RXPLLCLK_SEL     : in std_logic_vector(0 downto 0);
      AEN_RXSYSCLK_SEL     : in std_logic_vector(0 downto 0);
      AEN_TXMUXDCD         : in std_logic_vector(0 downto 0);
      AEN_TXOUTCLK_SEL     : in std_logic_vector(0 downto 0);
      AEN_TXPHDLY          : in std_logic_vector(0 downto 0);
      AEN_TXPI_PPM         : in std_logic_vector(0 downto 0);
      AEN_TXPLLCLK_SEL     : in std_logic_vector(0 downto 0);
      AEN_TXSYSCLK_SEL     : in std_logic_vector(0 downto 0);
      AEN_TX_DRIVE_MODE    : in std_logic_vector(0 downto 0);
      ALIGN_COMMA_DOUBLE   : in std_logic_vector(39 downto 0);
      ALIGN_COMMA_ENABLE   : in std_logic_vector(9 downto 0);
      ALIGN_COMMA_WORD     : in std_logic_vector(2 downto 0);
      ALIGN_MCOMMA_DET     : in std_logic_vector(39 downto 0);
      ALIGN_MCOMMA_VALUE   : in std_logic_vector(9 downto 0);
      ALIGN_PCOMMA_DET     : in std_logic_vector(39 downto 0);
      ALIGN_PCOMMA_VALUE   : in std_logic_vector(9 downto 0);
      AMONITOR_CFG         : in std_logic_vector(15 downto 0);
      A_CPLLLOCKEN         : in std_logic_vector(0 downto 0);
      A_CPLLPD             : in std_logic_vector(0 downto 0);
      A_CPLLRESET          : in std_logic_vector(0 downto 0);
      A_EYESCANRESET       : in std_logic_vector(0 downto 0);
      A_GTRESETSEL         : in std_logic_vector(0 downto 0);
      A_GTRXRESET          : in std_logic_vector(0 downto 0);
      A_GTTXRESET          : in std_logic_vector(0 downto 0);
      A_LOOPBACK           : in std_logic_vector(79 downto 0);
      A_RXAFECFOKEN        : in std_logic_vector(0 downto 0);
      A_RXBUFRESET         : in std_logic_vector(0 downto 0);
      A_RXCDRFREQRESET     : in std_logic_vector(0 downto 0);
      A_RXCDRHOLD          : in std_logic_vector(0 downto 0);
      A_RXCDROVRDEN        : in std_logic_vector(0 downto 0);
      A_RXCDRRESET         : in std_logic_vector(0 downto 0);
      A_RXCKCALRESET       : in std_logic_vector(0 downto 0);
      A_RXDFEAGCHOLD       : in std_logic_vector(0 downto 0);
      A_RXDFEAGCOVRDEN     : in std_logic_vector(0 downto 0);
      A_RXDFECFOKFCNUM     : in std_logic_vector(3 downto 0);
      A_RXDFECFOKFEN       : in std_logic_vector(0 downto 0);
      A_RXDFECFOKFPULSE    : in std_logic_vector(0 downto 0);
      A_RXDFECFOKHOLD      : in std_logic_vector(0 downto 0);
      A_RXDFECFOKOVREN     : in std_logic_vector(0 downto 0);
      A_RXDFEKHHOLD        : in std_logic_vector(0 downto 0);
      A_RXDFEKHOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXDFELFHOLD        : in std_logic_vector(0 downto 0);
      A_RXDFELFOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXDFELPMRESET      : in std_logic_vector(0 downto 0);
      A_RXDFETAP10HOLD     : in std_logic_vector(0 downto 0);
      A_RXDFETAP10OVRDEN   : in std_logic_vector(0 downto 0);
      A_RXDFETAP11HOLD     : in std_logic_vector(0 downto 0);
      A_RXDFETAP11OVRDEN   : in std_logic_vector(0 downto 0);
      A_RXDFETAP12HOLD     : in std_logic_vector(0 downto 0);
      A_RXDFETAP12OVRDEN   : in std_logic_vector(0 downto 0);
      A_RXDFETAP13HOLD     : in std_logic_vector(0 downto 0);
      A_RXDFETAP13OVRDEN   : in std_logic_vector(0 downto 0);
      A_RXDFETAP14HOLD     : in std_logic_vector(0 downto 0);
      A_RXDFETAP14OVRDEN   : in std_logic_vector(0 downto 0);
      A_RXDFETAP15HOLD     : in std_logic_vector(0 downto 0);
      A_RXDFETAP15OVRDEN   : in std_logic_vector(0 downto 0);
      A_RXDFETAP2HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP2OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP3HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP3OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP4HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP4OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP5HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP5OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP6HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP6OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP7HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP7OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP8HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP8OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFETAP9HOLD      : in std_logic_vector(0 downto 0);
      A_RXDFETAP9OVRDEN    : in std_logic_vector(0 downto 0);
      A_RXDFEUTHOLD        : in std_logic_vector(0 downto 0);
      A_RXDFEUTOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXDFEVPHOLD        : in std_logic_vector(0 downto 0);
      A_RXDFEVPOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXDFEXYDEN         : in std_logic_vector(0 downto 0);
      A_RXDLYBYPASS        : in std_logic_vector(0 downto 0);
      A_RXDLYEN            : in std_logic_vector(0 downto 0);
      A_RXDLYOVRDEN        : in std_logic_vector(0 downto 0);
      A_RXDLYSRESET        : in std_logic_vector(0 downto 0);
      A_RXLPMEN            : in std_logic_vector(0 downto 0);
      A_RXLPMGCHOLD        : in std_logic_vector(0 downto 0);
      A_RXLPMGCOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXLPMHFHOLD        : in std_logic_vector(0 downto 0);
      A_RXLPMHFOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXLPMLFHOLD        : in std_logic_vector(0 downto 0);
      A_RXLPMLFKLOVRDEN    : in std_logic_vector(0 downto 0);
      A_RXLPMOSHOLD        : in std_logic_vector(0 downto 0);
      A_RXLPMOSOVRDEN      : in std_logic_vector(0 downto 0);
      A_RXMONITORSEL       : in std_logic_vector(1 downto 0);
      A_RXOOBRESET         : in std_logic_vector(0 downto 0);
      A_RXOSCALRESET       : in std_logic_vector(0 downto 0);
      A_RXOSHOLD           : in std_logic_vector(0 downto 0);
      A_RXOSOVRDEN         : in std_logic_vector(0 downto 0);
      A_RXOUTCLKSEL        : in std_logic_vector(127 downto 0);
      A_RXPCSRESET         : in std_logic_vector(0 downto 0);
      A_RXPD               : in std_logic_vector(23 downto 0);
      A_RXPHALIGN          : in std_logic_vector(0 downto 0);
      A_RXPHALIGNEN        : in std_logic_vector(0 downto 0);
      A_RXPHDLYPD          : in std_logic_vector(0 downto 0);
      A_RXPHDLYRESET       : in std_logic_vector(0 downto 0);
      A_RXPLLCLKSEL        : in std_logic_vector(63 downto 0);
      A_RXPMARESET         : in std_logic_vector(0 downto 0);
      A_RXPOLARITY         : in std_logic_vector(0 downto 0);
      A_RXPRBSCNTRESET     : in std_logic_vector(0 downto 0);
      A_RXPRBSSEL          : in std_logic_vector(47 downto 0);
      A_RXPROGDIVRESET     : in std_logic_vector(0 downto 0);
      A_RXSYSCLKSEL        : in std_logic_vector(87 downto 0);
      A_RXTERMINATION      : in std_logic_vector(0 downto 0);
      A_TXBUFDIFFCTRL      : in std_logic_vector(2 downto 0);
      A_TXDCCRESET         : in std_logic_vector(0 downto 0);
      A_TXDEEMPH           : in std_logic_vector(1 downto 0);
      A_TXDIFFCTRL         : in std_logic_vector(4 downto 0);
      A_TXDLYBYPASS        : in std_logic_vector(0 downto 0);
      A_TXDLYEN            : in std_logic_vector(0 downto 0);
      A_TXDLYOVRDEN        : in std_logic_vector(0 downto 0);
      A_TXDLYSRESET        : in std_logic_vector(0 downto 0);
      A_TXELECIDLE         : in std_logic_vector(0 downto 0);
      A_TXINHIBIT          : in std_logic_vector(0 downto 0);
      A_TXMAINCURSOR       : in std_logic_vector(6 downto 0);
      A_TXMARGIN           : in std_logic_vector(2 downto 0);
      A_TXMUXDCDEXHOLD     : in std_logic_vector(0 downto 0);
      A_TXMUXDCDORWREN     : in std_logic_vector(0 downto 0);
      A_TXOUTCLKSEL        : in std_logic_vector(127 downto 0);
      A_TXPCSRESET         : in std_logic_vector(0 downto 0);
      A_TXPD               : in std_logic_vector(23 downto 0);
      A_TXPHALIGN          : in std_logic_vector(0 downto 0);
      A_TXPHALIGNEN        : in std_logic_vector(0 downto 0);
      A_TXPHDLYPD          : in std_logic_vector(0 downto 0);
      A_TXPHDLYRESET       : in std_logic_vector(0 downto 0);
      A_TXPHINIT           : in std_logic_vector(0 downto 0);
      A_TXPHOVRDEN         : in std_logic_vector(0 downto 0);
      A_TXPIPPMOVRDEN      : in std_logic_vector(0 downto 0);
      A_TXPIPPMPD          : in std_logic_vector(0 downto 0);
      A_TXPIPPMSEL         : in std_logic_vector(0 downto 0);
      A_TXPLLCLKSEL        : in std_logic_vector(63 downto 0);
      A_TXPMARESET         : in std_logic_vector(0 downto 0);
      A_TXPOLARITY         : in std_logic_vector(0 downto 0);
      A_TXPOSTCURSOR       : in std_logic_vector(4 downto 0);
      A_TXPRBSFORCEERR     : in std_logic_vector(0 downto 0);
      A_TXPRBSSEL          : in std_logic_vector(95 downto 0);
      A_TXPRECURSOR        : in std_logic_vector(4 downto 0);
      A_TXPROGDIVRESET     : in std_logic_vector(0 downto 0);
      A_TXRESETSEL         : in std_logic_vector(0 downto 0);
      A_TXSWING            : in std_logic_vector(0 downto 0);
      A_TXSYSCLKSEL        : in std_logic_vector(87 downto 0);
      BSR_ENABLE           : in std_logic_vector(1 downto 0);
      CBCC_DATA_SOURCE_SEL : in std_logic_vector(55 downto 0);
      CDR_SWAP_MODE_EN     : in std_logic_vector(0 downto 0);
      CFOK_PWRSVE_EN       : in std_logic_vector(0 downto 0);
      CHAN_BOND_KEEP_ALIGN : in std_logic_vector(39 downto 0);
      CHAN_BOND_MAX_SKEW   : in std_logic_vector(3 downto 0);
      CHAN_BOND_SEQ_1_1    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_1_2    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_1_3    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_1_4    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_1_ENABLE : in std_logic_vector(3 downto 0);
      CHAN_BOND_SEQ_2_1    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_2_2    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_2_3    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_2_4    : in std_logic_vector(9 downto 0);
      CHAN_BOND_SEQ_2_ENABLE : in std_logic_vector(3 downto 0);
      CHAN_BOND_SEQ_2_USE  : in std_logic_vector(39 downto 0);
      CHAN_BOND_SEQ_LEN    : in std_logic_vector(2 downto 0);
      CH_HSPMUX            : in std_logic_vector(15 downto 0);
      CKCAL1_CFG_0         : in std_logic_vector(15 downto 0);
      CKCAL1_CFG_1         : in std_logic_vector(15 downto 0);
      CKCAL1_CFG_2         : in std_logic_vector(15 downto 0);
      CKCAL1_CFG_3         : in std_logic_vector(15 downto 0);
      CKCAL2_CFG_0         : in std_logic_vector(15 downto 0);
      CKCAL2_CFG_1         : in std_logic_vector(15 downto 0);
      CKCAL2_CFG_2         : in std_logic_vector(15 downto 0);
      CKCAL2_CFG_3         : in std_logic_vector(15 downto 0);
      CKCAL2_CFG_4         : in std_logic_vector(15 downto 0);
      CLK_CORRECT_USE      : in std_logic_vector(39 downto 0);
      CLK_COR_KEEP_IDLE    : in std_logic_vector(39 downto 0);
      CLK_COR_MAX_LAT      : in std_logic_vector(5 downto 0);
      CLK_COR_MIN_LAT      : in std_logic_vector(5 downto 0);
      CLK_COR_PRECEDENCE   : in std_logic_vector(39 downto 0);
      CLK_COR_REPEAT_WAIT  : in std_logic_vector(4 downto 0);
      CLK_COR_SEQ_1_1      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_1_2      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_1_3      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_1_4      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_1_ENABLE : in std_logic_vector(3 downto 0);
      CLK_COR_SEQ_2_1      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_2_2      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_2_3      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_2_4      : in std_logic_vector(9 downto 0);
      CLK_COR_SEQ_2_ENABLE : in std_logic_vector(3 downto 0);
      CLK_COR_SEQ_2_USE    : in std_logic_vector(39 downto 0);
      CLK_COR_SEQ_LEN      : in std_logic_vector(2 downto 0);
      CPLL_CFG0            : in std_logic_vector(15 downto 0);
      CPLL_CFG1            : in std_logic_vector(15 downto 0);
      CPLL_CFG2            : in std_logic_vector(15 downto 0);
      CPLL_CFG3            : in std_logic_vector(15 downto 0);
      CPLL_FBDIV           : in std_logic_vector(4 downto 0);
      CPLL_FBDIV_45        : in std_logic_vector(2 downto 0);
      CPLL_INIT_CFG0       : in std_logic_vector(15 downto 0);
      CPLL_LOCK_CFG        : in std_logic_vector(15 downto 0);
      CPLL_REFCLK_DIV      : in std_logic_vector(4 downto 0);
      CSSD_CLK_MASK0       : in std_logic_vector(15 downto 0);
      CSSD_CLK_MASK1       : in std_logic_vector(15 downto 0);
      CSSD_REG0            : in std_logic_vector(15 downto 0);
      CSSD_REG1            : in std_logic_vector(15 downto 0);
      CSSD_REG10           : in std_logic_vector(15 downto 0);
      CSSD_REG2            : in std_logic_vector(15 downto 0);
      CSSD_REG3            : in std_logic_vector(15 downto 0);
      CSSD_REG4            : in std_logic_vector(15 downto 0);
      CSSD_REG5            : in std_logic_vector(15 downto 0);
      CSSD_REG6            : in std_logic_vector(15 downto 0);
      CSSD_REG7            : in std_logic_vector(15 downto 0);
      CSSD_REG8            : in std_logic_vector(15 downto 0);
      CSSD_REG9            : in std_logic_vector(15 downto 0);
      CTLE3_OCAP_EXT_CTRL  : in std_logic_vector(2 downto 0);
      CTLE3_OCAP_EXT_EN    : in std_logic_vector(0 downto 0);
      DDI_CTRL             : in std_logic_vector(1 downto 0);
      DDI_REALIGN_WAIT     : in std_logic_vector(4 downto 0);
      DEC_MCOMMA_DETECT    : in std_logic_vector(39 downto 0);
      DEC_PCOMMA_DETECT    : in std_logic_vector(39 downto 0);
      DEC_VALID_COMMA_ONLY : in std_logic_vector(39 downto 0);
      DELAY_ELEC           : in std_logic_vector(0 downto 0);
      DMONITOR_CFG0        : in std_logic_vector(9 downto 0);
      DMONITOR_CFG1        : in std_logic_vector(7 downto 0);
      ES_CLK_PHASE_SEL     : in std_logic_vector(0 downto 0);
      ES_CONTROL           : in std_logic_vector(5 downto 0);
      ES_ERRDET_EN         : in std_logic_vector(39 downto 0);
      ES_EYE_SCAN_EN       : in std_logic_vector(39 downto 0);
      ES_HORZ_OFFSET       : in std_logic_vector(11 downto 0);
      ES_PRESCALE          : in std_logic_vector(4 downto 0);
      ES_QUALIFIER0        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER1        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER2        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER3        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER4        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER5        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER6        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER7        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER8        : in std_logic_vector(15 downto 0);
      ES_QUALIFIER9        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK0        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK1        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK2        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK3        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK4        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK5        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK6        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK7        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK8        : in std_logic_vector(15 downto 0);
      ES_QUAL_MASK9        : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK0       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK1       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK2       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK3       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK4       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK5       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK6       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK7       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK8       : in std_logic_vector(15 downto 0);
      ES_SDATA_MASK9       : in std_logic_vector(15 downto 0);
      EYESCAN_VP_RANGE     : in std_logic_vector(1 downto 0);
      EYE_SCAN_SWAP_EN     : in std_logic_vector(0 downto 0);
      FTS_DESKEW_SEQ_ENABLE : in std_logic_vector(3 downto 0);
      FTS_LANE_DESKEW_CFG  : in std_logic_vector(3 downto 0);
      FTS_LANE_DESKEW_EN   : in std_logic_vector(39 downto 0);
      GEARBOX_MODE         : in std_logic_vector(4 downto 0);
      GEN_RXUSRCLK         : in std_logic_vector(39 downto 0);
      GEN_TXUSRCLK         : in std_logic_vector(39 downto 0);
      GT_INSTANTIATED      : in std_logic_vector(0 downto 0);
      INT_MASK_CFG0        : in std_logic_vector(15 downto 0);
      INT_MASK_CFG1        : in std_logic_vector(15 downto 0);
      ISCAN_CK_PH_SEL2     : in std_logic_vector(0 downto 0);
      LOCAL_MASTER         : in std_logic_vector(0 downto 0);
      LPBK_BIAS_CTRL       : in std_logic_vector(2 downto 0);
      LPBK_EN_RCAL_B       : in std_logic_vector(0 downto 0);
      LPBK_EXT_RCAL        : in std_logic_vector(3 downto 0);
      LPBK_IND_CTRL0       : in std_logic_vector(2 downto 0);
      LPBK_IND_CTRL1       : in std_logic_vector(2 downto 0);
      LPBK_IND_CTRL2       : in std_logic_vector(2 downto 0);
      LPBK_RG_CTRL         : in std_logic_vector(1 downto 0);
      OOBDIVCTL            : in std_logic_vector(1 downto 0);
      OOB_PWRUP            : in std_logic_vector(0 downto 0);
      PCI3_AUTO_REALIGN    : in std_logic_vector(79 downto 0);
      PCI3_PIPE_RX_ELECIDLE : in std_logic_vector(0 downto 0);
      PCI3_RX_ASYNC_EBUF_BYPASS : in std_logic_vector(1 downto 0);
      PCI3_RX_ELECIDLE_EI2_ENABLE : in std_logic_vector(0 downto 0);
      PCI3_RX_ELECIDLE_H2L_COUNT : in std_logic_vector(5 downto 0);
      PCI3_RX_ELECIDLE_H2L_DISABLE : in std_logic_vector(2 downto 0);
      PCI3_RX_ELECIDLE_HI_COUNT : in std_logic_vector(5 downto 0);
      PCI3_RX_ELECIDLE_LP4_DISABLE : in std_logic_vector(0 downto 0);
      PCI3_RX_FIFO_DISABLE : in std_logic_vector(0 downto 0);
      PCIE3_CLK_COR_EMPTY_THRSH : in std_logic_vector(4 downto 0);
      PCIE3_CLK_COR_FULL_THRSH : in std_logic_vector(5 downto 0);
      PCIE3_CLK_COR_MAX_LAT : in std_logic_vector(4 downto 0);
      PCIE3_CLK_COR_MIN_LAT : in std_logic_vector(4 downto 0);
      PCIE3_CLK_COR_THRSH_TIMER : in std_logic_vector(5 downto 0);
      PCIE_64B_DYN_CLKSW_DIS : in std_logic_vector(39 downto 0);
      PCIE_BUFG_DIV_CTRL   : in std_logic_vector(15 downto 0);
      PCIE_GEN4_64BIT_INT_EN : in std_logic_vector(39 downto 0);
      PCIE_PLL_SEL_MODE_GEN12 : in std_logic_vector(1 downto 0);
      PCIE_PLL_SEL_MODE_GEN3 : in std_logic_vector(1 downto 0);
      PCIE_PLL_SEL_MODE_GEN4 : in std_logic_vector(1 downto 0);
      PCIE_RXPCS_CFG_GEN3  : in std_logic_vector(15 downto 0);
      PCIE_RXPMA_CFG       : in std_logic_vector(15 downto 0);
      PCIE_TXPCS_CFG_GEN3  : in std_logic_vector(15 downto 0);
      PCIE_TXPMA_CFG       : in std_logic_vector(15 downto 0);
      PCS_PCIE_EN          : in std_logic_vector(39 downto 0);
      PCS_RSVD0            : in std_logic_vector(15 downto 0);
      PD_TRANS_TIME_FROM_P2 : in std_logic_vector(11 downto 0);
      PD_TRANS_TIME_NONE_P2 : in std_logic_vector(7 downto 0);
      PD_TRANS_TIME_TO_P2  : in std_logic_vector(7 downto 0);
      PREIQ_FREQ_BST       : in std_logic_vector(1 downto 0);
      RATE_SW_USE_DRP      : in std_logic_vector(0 downto 0);
      RCLK_SIPO_DLY_ENB    : in std_logic_vector(0 downto 0);
      RCLK_SIPO_INV_EN     : in std_logic_vector(0 downto 0);
      RTX_BUF_CML_CTRL     : in std_logic_vector(2 downto 0);
      RTX_BUF_TERM_CTRL    : in std_logic_vector(1 downto 0);
      RXBUFRESET_TIME      : in std_logic_vector(4 downto 0);
      RXBUF_ADDR_MODE      : in std_logic_vector(31 downto 0);
      RXBUF_EIDLE_HI_CNT   : in std_logic_vector(3 downto 0);
      RXBUF_EIDLE_LO_CNT   : in std_logic_vector(3 downto 0);
      RXBUF_EN             : in std_logic_vector(39 downto 0);
      RXBUF_RESET_ON_CB_CHANGE : in std_logic_vector(39 downto 0);
      RXBUF_RESET_ON_COMMAALIGN : in std_logic_vector(39 downto 0);
      RXBUF_RESET_ON_EIDLE : in std_logic_vector(39 downto 0);
      RXBUF_RESET_ON_RATE_CHANGE : in std_logic_vector(39 downto 0);
      RXBUF_THRESH_OVFLW   : in std_logic_vector(5 downto 0);
      RXBUF_THRESH_OVRD    : in std_logic_vector(39 downto 0);
      RXBUF_THRESH_UNDFLW  : in std_logic_vector(5 downto 0);
      RXCDRFREQRESET_TIME  : in std_logic_vector(4 downto 0);
      RXCDRPHRESET_TIME    : in std_logic_vector(4 downto 0);
      RXCDR_CFG0           : in std_logic_vector(15 downto 0);
      RXCDR_CFG0_GEN3      : in std_logic_vector(15 downto 0);
      RXCDR_CFG1           : in std_logic_vector(15 downto 0);
      RXCDR_CFG1_GEN3      : in std_logic_vector(15 downto 0);
      RXCDR_CFG2           : in std_logic_vector(15 downto 0);
      RXCDR_CFG2_GEN2      : in std_logic_vector(9 downto 0);
      RXCDR_CFG2_GEN3      : in std_logic_vector(15 downto 0);
      RXCDR_CFG2_GEN4      : in std_logic_vector(15 downto 0);
      RXCDR_CFG3           : in std_logic_vector(15 downto 0);
      RXCDR_CFG3_GEN2      : in std_logic_vector(5 downto 0);
      RXCDR_CFG3_GEN3      : in std_logic_vector(15 downto 0);
      RXCDR_CFG3_GEN4      : in std_logic_vector(15 downto 0);
      RXCDR_CFG4           : in std_logic_vector(15 downto 0);
      RXCDR_CFG4_GEN3      : in std_logic_vector(15 downto 0);
      RXCDR_CFG5           : in std_logic_vector(15 downto 0);
      RXCDR_CFG5_GEN3      : in std_logic_vector(15 downto 0);
      RXCDR_FR_RESET_ON_EIDLE : in std_logic_vector(0 downto 0);
      RXCDR_HOLD_DURING_EIDLE : in std_logic_vector(0 downto 0);
      RXCDR_LOCK_CFG0      : in std_logic_vector(15 downto 0);
      RXCDR_LOCK_CFG1      : in std_logic_vector(15 downto 0);
      RXCDR_LOCK_CFG2      : in std_logic_vector(15 downto 0);
      RXCDR_LOCK_CFG3      : in std_logic_vector(15 downto 0);
      RXCDR_LOCK_CFG4      : in std_logic_vector(15 downto 0);
      RXCDR_PH_RESET_ON_EIDLE : in std_logic_vector(0 downto 0);
      RXCFOK_CFG0          : in std_logic_vector(15 downto 0);
      RXCFOK_CFG1          : in std_logic_vector(15 downto 0);
      RXCFOK_CFG2          : in std_logic_vector(15 downto 0);
      RXCKCAL1_IQ_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXCKCAL1_I_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXCKCAL1_Q_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXCKCAL2_DX_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXCKCAL2_D_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXCKCAL2_S_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXCKCAL2_X_LOOP_RST_CFG : in std_logic_vector(15 downto 0);
      RXDFELPMRESET_TIME   : in std_logic_vector(6 downto 0);
      RXDFELPM_KL_CFG0     : in std_logic_vector(15 downto 0);
      RXDFELPM_KL_CFG1     : in std_logic_vector(15 downto 0);
      RXDFELPM_KL_CFG2     : in std_logic_vector(15 downto 0);
      RXDFE_CFG0           : in std_logic_vector(15 downto 0);
      RXDFE_CFG1           : in std_logic_vector(15 downto 0);
      RXDFE_GC_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_GC_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_GC_CFG2        : in std_logic_vector(15 downto 0);
      RXDFE_H2_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H2_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H3_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H3_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H4_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H4_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H5_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H5_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H6_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H6_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H7_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H7_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H8_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H8_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_H9_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_H9_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_HA_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_HA_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_HB_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_HB_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_HC_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_HC_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_HD_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_HD_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_HE_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_HE_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_HF_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_HF_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_KH_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_KH_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_KH_CFG2        : in std_logic_vector(15 downto 0);
      RXDFE_KH_CFG3        : in std_logic_vector(15 downto 0);
      RXDFE_OS_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_OS_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_UT_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_UT_CFG1        : in std_logic_vector(15 downto 0);
      RXDFE_UT_CFG2        : in std_logic_vector(15 downto 0);
      RXDFE_VP_CFG0        : in std_logic_vector(15 downto 0);
      RXDFE_VP_CFG1        : in std_logic_vector(15 downto 0);
      RXDLY_CFG            : in std_logic_vector(15 downto 0);
      RXDLY_LCFG           : in std_logic_vector(15 downto 0);
      RXELECIDLE_CFG       : in std_logic_vector(71 downto 0);
      RXGBOX_FIFO_INIT_RD_ADDR : in std_logic_vector(2 downto 0);
      RXGEARBOX_EN         : in std_logic_vector(39 downto 0);
      RXISCANRESET_TIME    : in std_logic_vector(4 downto 0);
      RXLPM_CFG            : in std_logic_vector(15 downto 0);
      RXLPM_GC_CFG         : in std_logic_vector(15 downto 0);
      RXLPM_KH_CFG0        : in std_logic_vector(15 downto 0);
      RXLPM_KH_CFG1        : in std_logic_vector(15 downto 0);
      RXLPM_OS_CFG0        : in std_logic_vector(15 downto 0);
      RXLPM_OS_CFG1        : in std_logic_vector(15 downto 0);
      RXOOB_CFG            : in std_logic_vector(8 downto 0);
      RXOOB_CLK_CFG        : in std_logic_vector(47 downto 0);
      RXOSCALRESET_TIME    : in std_logic_vector(4 downto 0);
      RXOUT_DIV            : in std_logic_vector(5 downto 0);
      RXPCSRESET_TIME      : in std_logic_vector(4 downto 0);
      RXPHBEACON_CFG       : in std_logic_vector(15 downto 0);
      RXPHDLY_CFG          : in std_logic_vector(15 downto 0);
      RXPHSAMP_CFG         : in std_logic_vector(15 downto 0);
      RXPHSLIP_CFG         : in std_logic_vector(15 downto 0);
      RXPH_MONITOR_SEL     : in std_logic_vector(4 downto 0);
      RXPI_CFG0            : in std_logic_vector(15 downto 0);
      RXPI_CFG1            : in std_logic_vector(15 downto 0);
      RXPMACLK_SEL         : in std_logic_vector(63 downto 0);
      RXPMARESET_TIME      : in std_logic_vector(4 downto 0);
      RXPRBS_ERR_LOOPBACK  : in std_logic_vector(0 downto 0);
      RXPRBS_LINKACQ_CNT   : in std_logic_vector(7 downto 0);
      RXREFCLKDIV2_SEL     : in std_logic_vector(0 downto 0);
      RXSLIDE_AUTO_WAIT    : in std_logic_vector(3 downto 0);
      RXSLIDE_MODE         : in std_logic_vector(31 downto 0);
      RXSYNC_MULTILANE     : in std_logic_vector(0 downto 0);
      RXSYNC_OVRD          : in std_logic_vector(0 downto 0);
      RXSYNC_SKIP_DA       : in std_logic_vector(0 downto 0);
      RX_AFE_CM_EN         : in std_logic_vector(0 downto 0);
      RX_BIAS_CFG0         : in std_logic_vector(15 downto 0);
      RX_BUFFER_CFG        : in std_logic_vector(5 downto 0);
      RX_CAPFF_SARC_ENB    : in std_logic_vector(0 downto 0);
      RX_CLK25_DIV         : in std_logic_vector(5 downto 0);
      RX_CLKMUX_EN         : in std_logic_vector(0 downto 0);
      RX_CLK_SLIP_OVRD     : in std_logic_vector(4 downto 0);
      RX_CM_BUF_CFG        : in std_logic_vector(3 downto 0);
      RX_CM_BUF_PD         : in std_logic_vector(0 downto 0);
      RX_CM_SEL            : in std_logic_vector(1 downto 0);
      RX_CM_TRIM           : in std_logic_vector(3 downto 0);
      RX_CTLE_PWR_SAVING   : in std_logic_vector(0 downto 0);
      RX_CTLE_RES_CTRL     : in std_logic_vector(3 downto 0);
      RX_DATA_WIDTH        : in std_logic_vector(7 downto 0);
      RX_DDI_SEL           : in std_logic_vector(5 downto 0);
      RX_DEFER_RESET_BUF_EN : in std_logic_vector(39 downto 0);
      RX_DEGEN_CTRL        : in std_logic_vector(2 downto 0);
      RX_DFECFOKFCDAC      : in std_logic_vector(5 downto 0);
      RX_DFELPM_CFG0       : in std_logic_vector(3 downto 0);
      RX_DFELPM_CFG1       : in std_logic_vector(0 downto 0);
      RX_DFELPM_KLKH_AGC_STUP_EN : in std_logic_vector(0 downto 0);
      RX_DFE_AGC_CFG1      : in std_logic_vector(2 downto 0);
      RX_DFE_KL_LPM_KH_CFG0 : in std_logic_vector(1 downto 0);
      RX_DFE_KL_LPM_KH_CFG1 : in std_logic_vector(2 downto 0);
      RX_DFE_KL_LPM_KL_CFG0 : in std_logic_vector(1 downto 0);
      RX_DFE_KL_LPM_KL_CFG1 : in std_logic_vector(2 downto 0);
      RX_DFE_LPM_HOLD_DURING_EIDLE : in std_logic_vector(0 downto 0);
      RX_DISPERR_SEQ_MATCH : in std_logic_vector(39 downto 0);
      RX_DIVRESET_TIME     : in std_logic_vector(4 downto 0);
      RX_EN_CTLE_RCAL_B    : in std_logic_vector(0 downto 0);
      RX_EN_SUM_RCAL_B     : in std_logic_vector(0 downto 0);
      RX_EYESCAN_VS_CODE   : in std_logic_vector(6 downto 0);
      RX_EYESCAN_VS_NEG_DIR : in std_logic_vector(0 downto 0);
      RX_EYESCAN_VS_RANGE  : in std_logic_vector(1 downto 0);
      RX_EYESCAN_VS_UT_SIGN : in std_logic_vector(0 downto 0);
      RX_FABINT_USRCLK_FLOP : in std_logic_vector(0 downto 0);
      RX_I2V_FILTER_EN     : in std_logic_vector(0 downto 0);
      RX_INT_DATAWIDTH     : in std_logic_vector(1 downto 0);
      RX_PMA_POWER_SAVE    : in std_logic_vector(0 downto 0);
      RX_PMA_RSV0          : in std_logic_vector(15 downto 0);
      RX_PROGDIV_CFG       : in std_logic_vector(63 downto 0);
      RX_PROGDIV_RATE      : in std_logic_vector(15 downto 0);
      RX_RESLOAD_CTRL      : in std_logic_vector(3 downto 0);
      RX_RESLOAD_OVRD      : in std_logic_vector(0 downto 0);
      RX_SAMPLE_PERIOD     : in std_logic_vector(2 downto 0);
      RX_SIG_VALID_DLY     : in std_logic_vector(5 downto 0);
      RX_SUM_DEGEN_AVTT_OVERITE : in std_logic_vector(0 downto 0);
      RX_SUM_DFETAPREP_EN  : in std_logic_vector(0 downto 0);
      RX_SUM_IREF_TUNE     : in std_logic_vector(3 downto 0);
      RX_SUM_PWR_SAVING    : in std_logic_vector(0 downto 0);
      RX_SUM_RES_CTRL      : in std_logic_vector(3 downto 0);
      RX_SUM_VCMTUNE       : in std_logic_vector(3 downto 0);
      RX_SUM_VCM_BIAS_TUNE_EN : in std_logic_vector(0 downto 0);
      RX_SUM_VCM_OVWR      : in std_logic_vector(0 downto 0);
      RX_SUM_VREF_TUNE     : in std_logic_vector(2 downto 0);
      RX_TUNE_AFE_OS       : in std_logic_vector(1 downto 0);
      RX_VREG_CTRL         : in std_logic_vector(2 downto 0);
      RX_VREG_PDB          : in std_logic_vector(0 downto 0);
      RX_VREG_VREFSEL      : in std_logic_vector(1 downto 0);
      RX_WIDEMODE_CDR      : in std_logic_vector(1 downto 0);
      RX_WIDEMODE_CDR_GEN3 : in std_logic_vector(1 downto 0);
      RX_WIDEMODE_CDR_GEN4 : in std_logic_vector(1 downto 0);
      RX_XCLK_SEL          : in std_logic_vector(39 downto 0);
      RX_XMODE_SEL         : in std_logic_vector(0 downto 0);
      SAMPLE_CLK_PHASE     : in std_logic_vector(0 downto 0);
      SAS_12G_MODE         : in std_logic_vector(0 downto 0);
      SATA_BURST_SEQ_LEN   : in std_logic_vector(3 downto 0);
      SATA_BURST_VAL       : in std_logic_vector(2 downto 0);
      SATA_CPLL_CFG        : in std_logic_vector(87 downto 0);
      SATA_EIDLE_VAL       : in std_logic_vector(2 downto 0);
      SHOW_REALIGN_COMMA   : in std_logic_vector(39 downto 0);
      SIM_DEVICE           : in std_logic_vector(159 downto 0);
      SIM_MODE             : in std_logic_vector(47 downto 0);
      SIM_RECEIVER_DETECT_PASS : in std_logic_vector(39 downto 0);
      SIM_RESET_SPEEDUP    : in std_logic_vector(39 downto 0);
      SIM_TX_EIDLE_DRIVE_LEVEL : in std_logic_vector(31 downto 0);
      SRSTMODE             : in std_logic_vector(0 downto 0);
      TAPDLY_SET_TX        : in std_logic_vector(1 downto 0);
      TERM_RCAL_CFG        : in std_logic_vector(14 downto 0);
      TERM_RCAL_OVRD       : in std_logic_vector(2 downto 0);
      TRANS_TIME_RATE      : in std_logic_vector(7 downto 0);
      TST_RSV0             : in std_logic_vector(7 downto 0);
      TST_RSV1             : in std_logic_vector(7 downto 0);
      TXBUF_EN             : in std_logic_vector(39 downto 0);
      TXBUF_RESET_ON_RATE_CHANGE : in std_logic_vector(39 downto 0);
      TXDLY_CFG            : in std_logic_vector(15 downto 0);
      TXDLY_LCFG           : in std_logic_vector(15 downto 0);
      TXDRV_FREQBAND       : in std_logic_vector(1 downto 0);
      TXFE_CFG0            : in std_logic_vector(15 downto 0);
      TXFE_CFG1            : in std_logic_vector(15 downto 0);
      TXFE_CFG2            : in std_logic_vector(15 downto 0);
      TXFE_CFG3            : in std_logic_vector(15 downto 0);
      TXFIFO_ADDR_CFG      : in std_logic_vector(31 downto 0);
      TXGBOX_FIFO_INIT_RD_ADDR : in std_logic_vector(2 downto 0);
      TXGEARBOX_EN         : in std_logic_vector(39 downto 0);
      TXOUTCLKPCS_SEL      : in std_logic_vector(0 downto 0);
      TXOUT_DIV            : in std_logic_vector(5 downto 0);
      TXPCSRESET_TIME      : in std_logic_vector(4 downto 0);
      TXPHDLY_CFG0         : in std_logic_vector(15 downto 0);
      TXPHDLY_CFG1         : in std_logic_vector(15 downto 0);
      TXPH_CFG             : in std_logic_vector(15 downto 0);
      TXPH_CFG2            : in std_logic_vector(15 downto 0);
      TXPH_MONITOR_SEL     : in std_logic_vector(4 downto 0);
      TXPI_CFG0            : in std_logic_vector(15 downto 0);
      TXPI_CFG1            : in std_logic_vector(15 downto 0);
      TXPI_GRAY_SEL        : in std_logic_vector(0 downto 0);
      TXPI_INVSTROBE_SEL   : in std_logic_vector(0 downto 0);
      TXPI_PPM             : in std_logic_vector(0 downto 0);
      TXPI_PPM_CFG         : in std_logic_vector(7 downto 0);
      TXPI_SYNFREQ_PPM     : in std_logic_vector(2 downto 0);
      TXPMARESET_TIME      : in std_logic_vector(4 downto 0);
      TXREFCLKDIV2_SEL     : in std_logic_vector(0 downto 0);
      TXSWBST_BST          : in std_logic_vector(1 downto 0);
      TXSWBST_EN           : in std_logic_vector(0 downto 0);
      TXSWBST_MAG          : in std_logic_vector(2 downto 0);
      TXSYNC_MULTILANE     : in std_logic_vector(0 downto 0);
      TXSYNC_OVRD          : in std_logic_vector(0 downto 0);
      TXSYNC_SKIP_DA       : in std_logic_vector(0 downto 0);
      TX_CLK25_DIV         : in std_logic_vector(5 downto 0);
      TX_CLKMUX_EN         : in std_logic_vector(0 downto 0);
      TX_DATA_WIDTH        : in std_logic_vector(7 downto 0);
      TX_DCC_LOOP_RST_CFG  : in std_logic_vector(15 downto 0);
      TX_DEEMPH0           : in std_logic_vector(5 downto 0);
      TX_DEEMPH1           : in std_logic_vector(5 downto 0);
      TX_DEEMPH2           : in std_logic_vector(5 downto 0);
      TX_DEEMPH3           : in std_logic_vector(5 downto 0);
      TX_DIVRESET_TIME     : in std_logic_vector(4 downto 0);
      TX_DRIVE_MODE        : in std_logic_vector(63 downto 0);
      TX_EIDLE_ASSERT_DELAY : in std_logic_vector(2 downto 0);
      TX_EIDLE_DEASSERT_DELAY : in std_logic_vector(2 downto 0);
      TX_FABINT_USRCLK_FLOP : in std_logic_vector(0 downto 0);
      TX_FIFO_BYP_EN       : in std_logic_vector(0 downto 0);
      TX_IDLE_DATA_ZERO    : in std_logic_vector(0 downto 0);
      TX_INT_DATAWIDTH     : in std_logic_vector(1 downto 0);
      TX_LOOPBACK_DRIVE_HIZ : in std_logic_vector(39 downto 0);
      TX_MAINCURSOR_SEL    : in std_logic_vector(0 downto 0);
      TX_MARGIN_FULL_0     : in std_logic_vector(6 downto 0);
      TX_MARGIN_FULL_1     : in std_logic_vector(6 downto 0);
      TX_MARGIN_FULL_2     : in std_logic_vector(6 downto 0);
      TX_MARGIN_FULL_3     : in std_logic_vector(6 downto 0);
      TX_MARGIN_FULL_4     : in std_logic_vector(6 downto 0);
      TX_MARGIN_LOW_0      : in std_logic_vector(6 downto 0);
      TX_MARGIN_LOW_1      : in std_logic_vector(6 downto 0);
      TX_MARGIN_LOW_2      : in std_logic_vector(6 downto 0);
      TX_MARGIN_LOW_3      : in std_logic_vector(6 downto 0);
      TX_MARGIN_LOW_4      : in std_logic_vector(6 downto 0);
      TX_PHICAL_CFG0       : in std_logic_vector(15 downto 0);
      TX_PHICAL_CFG1       : in std_logic_vector(15 downto 0);
      TX_PI_BIASSET        : in std_logic_vector(1 downto 0);
      TX_PMADATA_OPT       : in std_logic_vector(0 downto 0);
      TX_PMA_POWER_SAVE    : in std_logic_vector(0 downto 0);
      TX_PMA_RSV0          : in std_logic_vector(15 downto 0);
      TX_PMA_RSV1          : in std_logic_vector(15 downto 0);
      TX_PROGCLK_SEL       : in std_logic_vector(47 downto 0);
      TX_PROGDIV_CFG       : in std_logic_vector(63 downto 0);
      TX_PROGDIV_RATE      : in std_logic_vector(15 downto 0);
      TX_RXDETECT_CFG      : in std_logic_vector(13 downto 0);
      TX_RXDETECT_REF      : in std_logic_vector(2 downto 0);
      TX_SAMPLE_PERIOD     : in std_logic_vector(2 downto 0);
      TX_SW_MEAS           : in std_logic_vector(1 downto 0);
      TX_USERPATTERN_DATA0 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA1 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA2 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA3 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA4 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA5 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA6 : in std_logic_vector(9 downto 0);
      TX_USERPATTERN_DATA7 : in std_logic_vector(9 downto 0);
      TX_VREG_CTRL         : in std_logic_vector(2 downto 0);
      TX_VREG_PDB          : in std_logic_vector(0 downto 0);
      TX_VREG_VREFSEL      : in std_logic_vector(1 downto 0);
      TX_XCLK_SEL          : in std_logic_vector(39 downto 0);
      USB_BOTH_BURST_IDLE  : in std_logic_vector(0 downto 0);
      USB_BURSTMAX_U3WAKE  : in std_logic_vector(6 downto 0);
      USB_BURSTMIN_U3WAKE  : in std_logic_vector(6 downto 0);
      USB_CLK_COR_EQ_EN    : in std_logic_vector(0 downto 0);
      USB_EXT_CNTL         : in std_logic_vector(0 downto 0);
      USB_IDLEMAX_POLLING  : in std_logic_vector(9 downto 0);
      USB_IDLEMIN_POLLING  : in std_logic_vector(9 downto 0);
      USB_LFPSPING_BURST   : in std_logic_vector(8 downto 0);
      USB_LFPSPOLLING_BURST : in std_logic_vector(8 downto 0);
      USB_LFPSPOLLING_IDLE_MS : in std_logic_vector(8 downto 0);
      USB_LFPSU1EXIT_BURST : in std_logic_vector(8 downto 0);
      USB_LFPSU2LPEXIT_BURST_MS : in std_logic_vector(8 downto 0);
      USB_LFPSU3WAKE_BURST_MS : in std_logic_vector(8 downto 0);
      USB_LFPS_TPERIOD     : in std_logic_vector(3 downto 0);
      USB_LFPS_TPERIOD_ACCURATE : in std_logic_vector(0 downto 0);
      USB_MODE             : in std_logic_vector(0 downto 0);
      USB_PCIE_ERR_REP_DIS : in std_logic_vector(0 downto 0);
      USB_PING_SATA_MAX_INIT : in std_logic_vector(5 downto 0);
      USB_PING_SATA_MIN_INIT : in std_logic_vector(5 downto 0);
      USB_POLL_SATA_MAX_BURST : in std_logic_vector(5 downto 0);
      USB_POLL_SATA_MIN_BURST : in std_logic_vector(5 downto 0);
      USB_RAW_ELEC         : in std_logic_vector(0 downto 0);
      USB_RXIDLE_P0_CTRL   : in std_logic_vector(0 downto 0);
      USB_TXIDLE_TUNE_ENABLE : in std_logic_vector(0 downto 0);
      USB_U1_SATA_MAX_WAKE : in std_logic_vector(5 downto 0);
      USB_U1_SATA_MIN_WAKE : in std_logic_vector(5 downto 0);
      USB_U2_SAS_MAX_COM   : in std_logic_vector(6 downto 0);
      USB_U2_SAS_MIN_COM   : in std_logic_vector(5 downto 0);
      USE_PCS_CLK_PHASE_SEL : in std_logic_vector(0 downto 0);
      Y_ALL_MODE           : in std_logic_vector(0 downto 0);
      BUFGTCE              : out std_ulogic;
      BUFGTCEMASK          : out std_logic_vector(2 downto 0);
      BUFGTDIV             : out std_logic_vector(8 downto 0);
      BUFGTRESET           : out std_ulogic;
      BUFGTRSTMASK         : out std_logic_vector(2 downto 0);
      CPLLFBCLKLOST        : out std_ulogic;
      CPLLLOCK             : out std_ulogic;
      CPLLREFCLKLOST       : out std_ulogic;
      CSSDSTOPCLKDONE      : out std_ulogic;
      DMONITOROUT          : out std_logic_vector(15 downto 0);
      DMONITOROUTCLK       : out std_ulogic;
      DRPDO                : out std_logic_vector(15 downto 0);
      DRPRDY               : out std_ulogic;
      EYESCANDATAERROR     : out std_ulogic;
      GTPOWERGOOD          : out std_ulogic;
      GTREFCLKMONITOR      : out std_ulogic;
      GTYTXN               : out std_ulogic;
      GTYTXP               : out std_ulogic;
      PCIERATEGEN3         : out std_ulogic;
      PCIERATEIDLE         : out std_ulogic;
      PCIERATEQPLLPD       : out std_logic_vector(1 downto 0);
      PCIERATEQPLLRESET    : out std_logic_vector(1 downto 0);
      PCIESYNCTXSYNCDONE   : out std_ulogic;
      PCIEUSERGEN3RDY      : out std_ulogic;
      PCIEUSERPHYSTATUSRST : out std_ulogic;
      PCIEUSERRATESTART    : out std_ulogic;
      PCSRSVDOUT           : out std_logic_vector(15 downto 0);
      PHYSTATUS            : out std_ulogic;
      PINRSRVDAS           : out std_logic_vector(15 downto 0);
      PMASCANOUT           : out std_logic_vector(17 downto 0);
      POWERPRESENT         : out std_ulogic;
      RESETEXCEPTION       : out std_ulogic;
      RXBUFSTATUS          : out std_logic_vector(2 downto 0);
      RXBYTEISALIGNED      : out std_ulogic;
      RXBYTEREALIGN        : out std_ulogic;
      RXCDRLOCK            : out std_ulogic;
      RXCDRPHDONE          : out std_ulogic;
      RXCHANBONDSEQ        : out std_ulogic;
      RXCHANISALIGNED      : out std_ulogic;
      RXCHANREALIGN        : out std_ulogic;
      RXCHBONDO            : out std_logic_vector(4 downto 0);
      RXCKCALDONE          : out std_ulogic;
      RXCLKCORCNT          : out std_logic_vector(1 downto 0);
      RXCOMINITDET         : out std_ulogic;
      RXCOMMADET           : out std_ulogic;
      RXCOMSASDET          : out std_ulogic;
      RXCOMWAKEDET         : out std_ulogic;
      RXCTRL0              : out std_logic_vector(15 downto 0);
      RXCTRL1              : out std_logic_vector(15 downto 0);
      RXCTRL2              : out std_logic_vector(7 downto 0);
      RXCTRL3              : out std_logic_vector(7 downto 0);
      RXDATA               : out std_logic_vector(127 downto 0);
      RXDATAEXTENDRSVD     : out std_logic_vector(7 downto 0);
      RXDATAVALID          : out std_logic_vector(1 downto 0);
      RXDLYSRESETDONE      : out std_ulogic;
      RXELECIDLE           : out std_ulogic;
      RXHEADER             : out std_logic_vector(5 downto 0);
      RXHEADERVALID        : out std_logic_vector(1 downto 0);
      RXLFPSTRESETDET      : out std_ulogic;
      RXLFPSU2LPEXITDET    : out std_ulogic;
      RXLFPSU3WAKEDET      : out std_ulogic;
      RXMONITOROUT         : out std_logic_vector(7 downto 0);
      RXOSINTDONE          : out std_ulogic;
      RXOSINTSTARTED       : out std_ulogic;
      RXOSINTSTROBEDONE    : out std_ulogic;
      RXOSINTSTROBESTARTED : out std_ulogic;
      RXOUTCLK             : out std_ulogic;
      RXOUTCLKFABRIC       : out std_ulogic;
      RXOUTCLKPCS          : out std_ulogic;
      RXPHALIGNDONE        : out std_ulogic;
      RXPHALIGNERR         : out std_ulogic;
      RXPMARESETDONE       : out std_ulogic;
      RXPRBSERR            : out std_ulogic;
      RXPRBSLOCKED         : out std_ulogic;
      RXPRGDIVRESETDONE    : out std_ulogic;
      RXRATEDONE           : out std_ulogic;
      RXRECCLKOUT          : out std_ulogic;
      RXRESETDONE          : out std_ulogic;
      RXSLIDERDY           : out std_ulogic;
      RXSLIPDONE           : out std_ulogic;
      RXSLIPOUTCLKRDY      : out std_ulogic;
      RXSLIPPMARDY         : out std_ulogic;
      RXSTARTOFSEQ         : out std_logic_vector(1 downto 0);
      RXSTATUS             : out std_logic_vector(2 downto 0);
      RXSYNCDONE           : out std_ulogic;
      RXSYNCOUT            : out std_ulogic;
      RXVALID              : out std_ulogic;
      SCANOUT              : out std_logic_vector(18 downto 0);
      TXBUFSTATUS          : out std_logic_vector(1 downto 0);
      TXCOMFINISH          : out std_ulogic;
      TXDCCDONE            : out std_ulogic;
      TXDLYSRESETDONE      : out std_ulogic;
      TXOUTCLK             : out std_ulogic;
      TXOUTCLKFABRIC       : out std_ulogic;
      TXOUTCLKPCS          : out std_ulogic;
      TXPHALIGNDONE        : out std_ulogic;
      TXPHINITDONE         : out std_ulogic;
      TXPMARESETDONE       : out std_ulogic;
      TXPRGDIVRESETDONE    : out std_ulogic;
      TXRATEDONE           : out std_ulogic;
      TXRESETDONE          : out std_ulogic;
      TXSYNCDONE           : out std_ulogic;
      TXSYNCOUT            : out std_ulogic;
      BSR_SERIAL           : in std_ulogic;
      CDRSTEPDIR           : in std_ulogic;
      CDRSTEPSQ            : in std_ulogic;
      CDRSTEPSX            : in std_ulogic;
      CFGRESET             : in std_ulogic;
      CLKRSVD0             : in std_ulogic;
      CLKRSVD1             : in std_ulogic;
      CPLLFREQLOCK         : in std_ulogic;
      CPLLLOCKDETCLK       : in std_ulogic;
      CPLLLOCKEN           : in std_ulogic;
      CPLLPD               : in std_ulogic;
      CPLLREFCLKSEL        : in std_logic_vector(2 downto 0);
      CPLLRESET            : in std_ulogic;
      CSSDRSTB             : in std_ulogic;
      CSSDSTOPCLK          : in std_ulogic;
      DMONFIFORESET        : in std_ulogic;
      DMONITORCLK          : in std_ulogic;
      DRPADDR              : in std_logic_vector(9 downto 0);
      DRPCLK               : in std_ulogic;
      DRPDI                : in std_logic_vector(15 downto 0);
      DRPEN                : in std_ulogic;
      DRPRST               : in std_ulogic;
      DRPWE                : in std_ulogic;
      EYESCANRESET         : in std_ulogic;
      EYESCANTRIGGER       : in std_ulogic;
      FREQOS               : in std_ulogic;
      GTGREFCLK            : in std_ulogic;
      GTNORTHREFCLK0       : in std_ulogic;
      GTNORTHREFCLK1       : in std_ulogic;
      GTREFCLK0            : in std_ulogic;
      GTREFCLK1            : in std_ulogic;
      GTRSVD               : in std_logic_vector(15 downto 0);
      GTRXRESET            : in std_ulogic;
      GTRXRESETSEL         : in std_ulogic;
      GTSOUTHREFCLK0       : in std_ulogic;
      GTSOUTHREFCLK1       : in std_ulogic;
      GTTXRESET            : in std_ulogic;
      GTTXRESETSEL         : in std_ulogic;
      GTYRXN               : in std_ulogic;
      GTYRXP               : in std_ulogic;
      INCPCTRL             : in std_ulogic;
      LOOPBACK             : in std_logic_vector(2 downto 0);
      PCIEEQRXEQADAPTDONE  : in std_ulogic;
      PCIERSTIDLE          : in std_ulogic;
      PCIERSTTXSYNCSTART   : in std_ulogic;
      PCIEUSERRATEDONE     : in std_ulogic;
      PCSRSVDIN            : in std_logic_vector(15 downto 0);
      PMASCANCLK0          : in std_ulogic;
      PMASCANCLK1          : in std_ulogic;
      PMASCANCLK2          : in std_ulogic;
      PMASCANCLK3          : in std_ulogic;
      PMASCANCLK4          : in std_ulogic;
      PMASCANCLK5          : in std_ulogic;
      PMASCANCLK6          : in std_ulogic;
      PMASCANCLK7          : in std_ulogic;
      PMASCANCLK8          : in std_ulogic;
      PMASCANENB           : in std_ulogic;
      PMASCANIN            : in std_logic_vector(17 downto 0);
      PMASCANMODEB         : in std_ulogic;
      PMASCANRSTEN         : in std_ulogic;
      QPLL0CLK             : in std_ulogic;
      QPLL0FREQLOCK        : in std_ulogic;
      QPLL0REFCLK          : in std_ulogic;
      QPLL1CLK             : in std_ulogic;
      QPLL1FREQLOCK        : in std_ulogic;
      QPLL1REFCLK          : in std_ulogic;
      RESETOVRD            : in std_ulogic;
      RX8B10BEN            : in std_ulogic;
      RXAFECFOKEN          : in std_ulogic;
      RXBUFRESET           : in std_ulogic;
      RXCDRFREQRESET       : in std_ulogic;
      RXCDRHOLD            : in std_ulogic;
      RXCDROVRDEN          : in std_ulogic;
      RXCDRRESET           : in std_ulogic;
      RXCHBONDEN           : in std_ulogic;
      RXCHBONDI            : in std_logic_vector(4 downto 0);
      RXCHBONDLEVEL        : in std_logic_vector(2 downto 0);
      RXCHBONDMASTER       : in std_ulogic;
      RXCHBONDSLAVE        : in std_ulogic;
      RXCKCALRESET         : in std_ulogic;
      RXCKCALSTART         : in std_logic_vector(6 downto 0);
      RXCOMMADETEN         : in std_ulogic;
      RXDFEAGCHOLD         : in std_ulogic;
      RXDFEAGCOVRDEN       : in std_ulogic;
      RXDFECFOKFCNUM       : in std_logic_vector(3 downto 0);
      RXDFECFOKFEN         : in std_ulogic;
      RXDFECFOKFPULSE      : in std_ulogic;
      RXDFECFOKHOLD        : in std_ulogic;
      RXDFECFOKOVREN       : in std_ulogic;
      RXDFEKHHOLD          : in std_ulogic;
      RXDFEKHOVRDEN        : in std_ulogic;
      RXDFELFHOLD          : in std_ulogic;
      RXDFELFOVRDEN        : in std_ulogic;
      RXDFELPMRESET        : in std_ulogic;
      RXDFETAP10HOLD       : in std_ulogic;
      RXDFETAP10OVRDEN     : in std_ulogic;
      RXDFETAP11HOLD       : in std_ulogic;
      RXDFETAP11OVRDEN     : in std_ulogic;
      RXDFETAP12HOLD       : in std_ulogic;
      RXDFETAP12OVRDEN     : in std_ulogic;
      RXDFETAP13HOLD       : in std_ulogic;
      RXDFETAP13OVRDEN     : in std_ulogic;
      RXDFETAP14HOLD       : in std_ulogic;
      RXDFETAP14OVRDEN     : in std_ulogic;
      RXDFETAP15HOLD       : in std_ulogic;
      RXDFETAP15OVRDEN     : in std_ulogic;
      RXDFETAP2HOLD        : in std_ulogic;
      RXDFETAP2OVRDEN      : in std_ulogic;
      RXDFETAP3HOLD        : in std_ulogic;
      RXDFETAP3OVRDEN      : in std_ulogic;
      RXDFETAP4HOLD        : in std_ulogic;
      RXDFETAP4OVRDEN      : in std_ulogic;
      RXDFETAP5HOLD        : in std_ulogic;
      RXDFETAP5OVRDEN      : in std_ulogic;
      RXDFETAP6HOLD        : in std_ulogic;
      RXDFETAP6OVRDEN      : in std_ulogic;
      RXDFETAP7HOLD        : in std_ulogic;
      RXDFETAP7OVRDEN      : in std_ulogic;
      RXDFETAP8HOLD        : in std_ulogic;
      RXDFETAP8OVRDEN      : in std_ulogic;
      RXDFETAP9HOLD        : in std_ulogic;
      RXDFETAP9OVRDEN      : in std_ulogic;
      RXDFEUTHOLD          : in std_ulogic;
      RXDFEUTOVRDEN        : in std_ulogic;
      RXDFEVPHOLD          : in std_ulogic;
      RXDFEVPOVRDEN        : in std_ulogic;
      RXDFEXYDEN           : in std_ulogic;
      RXDLYBYPASS          : in std_ulogic;
      RXDLYEN              : in std_ulogic;
      RXDLYOVRDEN          : in std_ulogic;
      RXDLYSRESET          : in std_ulogic;
      RXELECIDLEMODE       : in std_logic_vector(1 downto 0);
      RXEQTRAINING         : in std_ulogic;
      RXGEARBOXSLIP        : in std_ulogic;
      RXLATCLK             : in std_ulogic;
      RXLPMEN              : in std_ulogic;
      RXLPMGCHOLD          : in std_ulogic;
      RXLPMGCOVRDEN        : in std_ulogic;
      RXLPMHFHOLD          : in std_ulogic;
      RXLPMHFOVRDEN        : in std_ulogic;
      RXLPMLFHOLD          : in std_ulogic;
      RXLPMLFKLOVRDEN      : in std_ulogic;
      RXLPMOSHOLD          : in std_ulogic;
      RXLPMOSOVRDEN        : in std_ulogic;
      RXMCOMMAALIGNEN      : in std_ulogic;
      RXMONITORSEL         : in std_logic_vector(1 downto 0);
      RXOOBRESET           : in std_ulogic;
      RXOSCALRESET         : in std_ulogic;
      RXOSHOLD             : in std_ulogic;
      RXOSOVRDEN           : in std_ulogic;
      RXOUTCLKSEL          : in std_logic_vector(2 downto 0);
      RXPCOMMAALIGNEN      : in std_ulogic;
      RXPCSRESET           : in std_ulogic;
      RXPD                 : in std_logic_vector(1 downto 0);
      RXPHALIGN            : in std_ulogic;
      RXPHALIGNEN          : in std_ulogic;
      RXPHDLYPD            : in std_ulogic;
      RXPHDLYRESET         : in std_ulogic;
      RXPLLCLKSEL          : in std_logic_vector(1 downto 0);
      RXPMARESET           : in std_ulogic;
      RXPOLARITY           : in std_ulogic;
      RXPRBSCNTRESET       : in std_ulogic;
      RXPRBSSEL            : in std_logic_vector(3 downto 0);
      RXPROGDIVRESET       : in std_ulogic;
      RXRATE               : in std_logic_vector(2 downto 0);
      RXRATEMODE           : in std_ulogic;
      RXSLIDE              : in std_ulogic;
      RXSLIPOUTCLK         : in std_ulogic;
      RXSLIPPMA            : in std_ulogic;
      RXSYNCALLIN          : in std_ulogic;
      RXSYNCIN             : in std_ulogic;
      RXSYNCMODE           : in std_ulogic;
      RXSYSCLKSEL          : in std_logic_vector(1 downto 0);
      RXTERMINATION        : in std_ulogic;
      RXUSERRDY            : in std_ulogic;
      RXUSRCLK             : in std_ulogic;
      RXUSRCLK2            : in std_ulogic;
      SARCCLK              : in std_ulogic;
      SCANCLK              : in std_ulogic;
      SCANENB              : in std_ulogic;
      SCANIN               : in std_logic_vector(18 downto 0);
      SCANMODEB            : in std_ulogic;
      SCANRSTB             : in std_ulogic;
      SCANRSTEN            : in std_ulogic;
      SIGVALIDCLK          : in std_ulogic;
      TSTCLK0              : in std_ulogic;
      TSTCLK1              : in std_ulogic;
      TSTIN                : in std_logic_vector(19 downto 0);
      TSTPD                : in std_logic_vector(4 downto 0);
      TSTPDOVRDB           : in std_ulogic;
      TX8B10BBYPASS        : in std_logic_vector(7 downto 0);
      TX8B10BEN            : in std_ulogic;
      TXCOMINIT            : in std_ulogic;
      TXCOMSAS             : in std_ulogic;
      TXCOMWAKE            : in std_ulogic;
      TXCTRL0              : in std_logic_vector(15 downto 0);
      TXCTRL1              : in std_logic_vector(15 downto 0);
      TXCTRL2              : in std_logic_vector(7 downto 0);
      TXDATA               : in std_logic_vector(127 downto 0);
      TXDATAEXTENDRSVD     : in std_logic_vector(7 downto 0);
      TXDCCFORCESTART      : in std_ulogic;
      TXDCCRESET           : in std_ulogic;
      TXDEEMPH             : in std_logic_vector(1 downto 0);
      TXDETECTRX           : in std_ulogic;
      TXDIFFCTRL           : in std_logic_vector(4 downto 0);
      TXDLYBYPASS          : in std_ulogic;
      TXDLYEN              : in std_ulogic;
      TXDLYHOLD            : in std_ulogic;
      TXDLYOVRDEN          : in std_ulogic;
      TXDLYSRESET          : in std_ulogic;
      TXDLYUPDOWN          : in std_ulogic;
      TXELECIDLE           : in std_ulogic;
      TXHEADER             : in std_logic_vector(5 downto 0);
      TXINHIBIT            : in std_ulogic;
      TXLATCLK             : in std_ulogic;
      TXLFPSTRESET         : in std_ulogic;
      TXLFPSU2LPEXIT       : in std_ulogic;
      TXLFPSU3WAKE         : in std_ulogic;
      TXMAINCURSOR         : in std_logic_vector(6 downto 0);
      TXMARGIN             : in std_logic_vector(2 downto 0);
      TXMUXDCDEXHOLD       : in std_ulogic;
      TXMUXDCDORWREN       : in std_ulogic;
      TXONESZEROS          : in std_ulogic;
      TXOUTCLKSEL          : in std_logic_vector(2 downto 0);
      TXPCSRESET           : in std_ulogic;
      TXPD                 : in std_logic_vector(1 downto 0);
      TXPDELECIDLEMODE     : in std_ulogic;
      TXPHALIGN            : in std_ulogic;
      TXPHALIGNEN          : in std_ulogic;
      TXPHDLYPD            : in std_ulogic;
      TXPHDLYRESET         : in std_ulogic;
      TXPHDLYTSTCLK        : in std_ulogic;
      TXPHINIT             : in std_ulogic;
      TXPHOVRDEN           : in std_ulogic;
      TXPIPPMEN            : in std_ulogic;
      TXPIPPMOVRDEN        : in std_ulogic;
      TXPIPPMPD            : in std_ulogic;
      TXPIPPMSEL           : in std_ulogic;
      TXPIPPMSTEPSIZE      : in std_logic_vector(4 downto 0);
      TXPISOPD             : in std_ulogic;
      TXPLLCLKSEL          : in std_logic_vector(1 downto 0);
      TXPMARESET           : in std_ulogic;
      TXPOLARITY           : in std_ulogic;
      TXPOSTCURSOR         : in std_logic_vector(4 downto 0);
      TXPRBSFORCEERR       : in std_ulogic;
      TXPRBSSEL            : in std_logic_vector(3 downto 0);
      TXPRECURSOR          : in std_logic_vector(4 downto 0);
      TXPROGDIVRESET       : in std_ulogic;
      TXRATE               : in std_logic_vector(2 downto 0);
      TXRATEMODE           : in std_ulogic;
      TXSEQUENCE           : in std_logic_vector(6 downto 0);
      TXSWING              : in std_ulogic;
      TXSYNCALLIN          : in std_ulogic;
      TXSYNCIN             : in std_ulogic;
      TXSYNCMODE           : in std_ulogic;
      TXSYSCLKSEL          : in std_logic_vector(1 downto 0);
      TXUSERRDY            : in std_ulogic;
      TXUSRCLK             : in std_ulogic;
      TXUSRCLK2            : in std_ulogic;
      GSR                  : in std_ulogic
    );
  end component;

  constant MODULE_NAME : string := "GTYE4_CHANNEL";
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
  constant ALIGN_COMMA_DOUBLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ALIGN_COMMA_DOUBLE,40);
  constant ALIGN_MCOMMA_DET_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ALIGN_MCOMMA_DET,40);
  constant ALIGN_PCOMMA_DET_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ALIGN_PCOMMA_DET,40);
  constant A_LOOPBACK_BIN : std_logic_vector(79 downto 0) := conv_string_to_slv("NOLOOPBACK",80);
  constant A_RXOUTCLKSEL_BIN : std_logic_vector(127 downto 0) := conv_string_to_slv("DISABLED",128);
  constant A_RXPD_BIN : std_logic_vector(23 downto 0) := conv_string_to_slv("P0",24);
  constant A_RXPLLCLKSEL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv("QPLLCLK1",64);
  constant A_RXPRBSSEL_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv("PRBS7",48);
  constant A_RXSYSCLKSEL_BIN : std_logic_vector(87 downto 0) := conv_string_to_slv("CPLLREFCLK",88);
  constant A_TXOUTCLKSEL_BIN : std_logic_vector(127 downto 0) := conv_string_to_slv("DISABLED",128);
  constant A_TXPD_BIN : std_logic_vector(23 downto 0) := conv_string_to_slv("P0",24);
  constant A_TXPLLCLKSEL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv("QPLLCLK1",64);
  constant A_TXPRBSSEL_BIN : std_logic_vector(95 downto 0) := conv_string_to_slv("PRBS7",96);
  constant A_TXSYSCLKSEL_BIN : std_logic_vector(87 downto 0) := conv_string_to_slv("CPLLREFCLK",88);
  constant CBCC_DATA_SOURCE_SEL_BIN : std_logic_vector(55 downto 0) := conv_string_to_slv(CBCC_DATA_SOURCE_SEL,56);
  constant CHAN_BOND_KEEP_ALIGN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CHAN_BOND_KEEP_ALIGN,40);
  constant CHAN_BOND_SEQ_2_USE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CHAN_BOND_SEQ_2_USE,40);
  constant CLK_CORRECT_USE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_CORRECT_USE,40);
  constant CLK_COR_KEEP_IDLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_COR_KEEP_IDLE,40);
  constant CLK_COR_PRECEDENCE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_COR_PRECEDENCE,40);
  constant CLK_COR_SEQ_2_USE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_COR_SEQ_2_USE,40);
  constant DEC_MCOMMA_DETECT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DEC_MCOMMA_DETECT,40);
  constant DEC_PCOMMA_DETECT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DEC_PCOMMA_DETECT,40);
  constant DEC_VALID_COMMA_ONLY_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DEC_VALID_COMMA_ONLY,40);
  constant ES_ERRDET_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ES_ERRDET_EN,40);
  constant ES_EYE_SCAN_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ES_EYE_SCAN_EN,40);
  constant FTS_LANE_DESKEW_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(FTS_LANE_DESKEW_EN,40);
  constant GEN_RXUSRCLK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
  constant GEN_TXUSRCLK_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
  constant PCI3_AUTO_REALIGN_BIN : std_logic_vector(79 downto 0) := conv_string_to_slv(PCI3_AUTO_REALIGN,80);
  constant PCIE_64B_DYN_CLKSW_DIS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PCIE_64B_DYN_CLKSW_DIS,40);
  constant PCIE_GEN4_64BIT_INT_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PCIE_GEN4_64BIT_INT_EN,40);
  constant PCS_PCIE_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PCS_PCIE_EN,40);
  constant RXBUF_ADDR_MODE_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(RXBUF_ADDR_MODE,32);
  constant RXBUF_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXBUF_EN,40);
  constant RXBUF_RESET_ON_CB_CHANGE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXBUF_RESET_ON_CB_CHANGE,40);
  constant RXBUF_RESET_ON_COMMAALIGN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXBUF_RESET_ON_COMMAALIGN,40);
  constant RXBUF_RESET_ON_EIDLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXBUF_RESET_ON_EIDLE,40);
  constant RXBUF_RESET_ON_RATE_CHANGE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXBUF_RESET_ON_RATE_CHANGE,40);
  constant RXBUF_THRESH_OVRD_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXBUF_THRESH_OVRD,40);
  constant RXELECIDLE_CFG_BIN : std_logic_vector(71 downto 0) := conv_string_to_slv(RXELECIDLE_CFG,72);
  constant RXGEARBOX_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RXGEARBOX_EN,40);
  constant RXOOB_CLK_CFG_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(RXOOB_CLK_CFG,48);
  constant RXPMACLK_SEL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(RXPMACLK_SEL,64);
  constant RXSLIDE_MODE_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(RXSLIDE_MODE,32);
  constant RX_DEFER_RESET_BUF_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_DEFER_RESET_BUF_EN,40);
  constant RX_DISPERR_SEQ_MATCH_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_DISPERR_SEQ_MATCH,40);
  constant RX_XCLK_SEL_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_XCLK_SEL,40);
  constant SATA_CPLL_CFG_BIN : std_logic_vector(87 downto 0) := conv_string_to_slv(SATA_CPLL_CFG,88);
  constant SHOW_REALIGN_COMMA_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SHOW_REALIGN_COMMA,40);
  constant SIM_DEVICE_BIN : std_logic_vector(159 downto 0) := conv_string_to_slv(SIM_DEVICE,160);
  constant SIM_MODE_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(SIM_MODE,48);
  constant SIM_RECEIVER_DETECT_PASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SIM_RECEIVER_DETECT_PASS,40);
  constant SIM_RESET_SPEEDUP_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SIM_RESET_SPEEDUP,40);
  constant SIM_TX_EIDLE_DRIVE_LEVEL_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(SIM_TX_EIDLE_DRIVE_LEVEL,32);
  constant TXBUF_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TXBUF_EN,40);
  constant TXBUF_RESET_ON_RATE_CHANGE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TXBUF_RESET_ON_RATE_CHANGE,40);
  constant TXFIFO_ADDR_CFG_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(TXFIFO_ADDR_CFG,32);
  constant TXGEARBOX_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TXGEARBOX_EN,40);
  constant TX_DRIVE_MODE_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(TX_DRIVE_MODE,64);
  constant TX_LOOPBACK_DRIVE_HIZ_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TX_LOOPBACK_DRIVE_HIZ,40);
  constant TX_PROGCLK_SEL_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(TX_PROGCLK_SEL,48);
  constant TX_XCLK_SEL_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TX_XCLK_SEL,40);

  constant ACJTAG_DEBUG_MODE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ACJTAG_DEBUG_MODE));
  constant ACJTAG_MODE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ACJTAG_MODE));
  constant ACJTAG_RESET_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ACJTAG_RESET));
  constant ADAPT_CFG0_BIN : std_logic_vector(15 downto 0) := ADAPT_CFG0;
  constant ADAPT_CFG1_BIN : std_logic_vector(15 downto 0) := ADAPT_CFG1;
  constant ADAPT_CFG2_BIN : std_logic_vector(15 downto 0) := ADAPT_CFG2;
  constant AEN_CDRSTEPSEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_CPLL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_LOOPBACK_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_MASTER_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_PD_AND_EIDLE_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_POLARITY_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_PRBS_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXCDR_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXDFELPM_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXDFE_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXOUTCLK_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXPHDLY_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXPLLCLK_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RXSYSCLK_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TXMUXDCD_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TXOUTCLK_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TXPHDLY_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TXPI_PPM_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TXPLLCLK_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TXSYSCLK_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_TX_DRIVE_MODE_BIN : std_logic_vector(0 downto 0) := "0";
  constant ALIGN_COMMA_ENABLE_BIN : std_logic_vector(9 downto 0) := ALIGN_COMMA_ENABLE;
  constant ALIGN_COMMA_WORD_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(ALIGN_COMMA_WORD,3));
  constant ALIGN_MCOMMA_VALUE_BIN : std_logic_vector(9 downto 0) := ALIGN_MCOMMA_VALUE;
  constant ALIGN_PCOMMA_VALUE_BIN : std_logic_vector(9 downto 0) := ALIGN_PCOMMA_VALUE;
  constant AMONITOR_CFG_BIN : std_logic_vector(15 downto 0) := X"0FC0";
  constant A_CPLLLOCKEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_CPLLPD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_CPLLRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_EYESCANRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_GTRESETSEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_GTRXRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_GTTXRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXAFECFOKEN_BIN : std_logic_vector(0 downto 0) := "1";
  constant A_RXBUFRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXCDRFREQRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXCDRHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXCDROVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXCDRRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXCKCALRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEAGCHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEAGCOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFECFOKFCNUM_BIN : std_logic_vector(3 downto 0) := "0000";
  constant A_RXDFECFOKFEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFECFOKFPULSE_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFECFOKHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFECFOKOVREN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEKHHOLD_BIN : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(0,1));
  constant A_RXDFEKHOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFELFHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFELFOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFELPMRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP10HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP10OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP11HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP11OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP12HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP12OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP13HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP13OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP14HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP14OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP15HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP15OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP2HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP2OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP3HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP3OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP4HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP4OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP5HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP5OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP6HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP6OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP7HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP7OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP8HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP8OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP9HOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFETAP9OVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEUTHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEUTOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEVPHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEVPOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDFEXYDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDLYBYPASS_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDLYEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDLYOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXDLYSRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMGCHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMGCOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMHFHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMHFOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMLFHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMLFKLOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMOSHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXLPMOSOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXMONITORSEL_BIN : std_logic_vector(1 downto 0) := "00";
  constant A_RXOOBRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXOSCALRESET_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_RXOSCALRESET));
  constant A_RXOSHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXOSOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPCSRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPHALIGNEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPHALIGN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPHDLYPD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPHDLYRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPMARESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPOLARITY_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPRBSCNTRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_RXPROGDIVRESET_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_RXPROGDIVRESET));
  constant A_RXTERMINATION_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_RXTERMINATION));
  constant A_TXBUFDIFFCTRL_BIN : std_logic_vector(2 downto 0) := "100";
  constant A_TXDCCRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXDEEMPH_BIN : std_logic_vector(1 downto 0) := "00";
  constant A_TXDIFFCTRL_BIN : std_logic_vector(4 downto 0) := A_TXDIFFCTRL;
  constant A_TXDLYBYPASS_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXDLYEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXDLYOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXDLYSRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXELECIDLE_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXINHIBIT_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXMAINCURSOR_BIN : std_logic_vector(6 downto 0) := "0000000";
  constant A_TXMARGIN_BIN : std_logic_vector(2 downto 0) := "000";
  constant A_TXMUXDCDEXHOLD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXMUXDCDORWREN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPCSRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPHALIGNEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPHALIGN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPHDLYPD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPHDLYRESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPHINIT_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPHOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPIPPMOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPIPPMPD_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPIPPMSEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPMARESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPOLARITY_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPOSTCURSOR_BIN : std_logic_vector(4 downto 0) := "00000";
  constant A_TXPRBSFORCEERR_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXPRECURSOR_BIN : std_logic_vector(4 downto 0) := "00000";
  constant A_TXPROGDIVRESET_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_TXPROGDIVRESET));
  constant A_TXRESETSEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_TXSWING_BIN : std_logic_vector(0 downto 0) := "0";
  constant BSR_ENABLE_BIN : std_logic_vector(1 downto 0) := "00";
  constant CDR_SWAP_MODE_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(CDR_SWAP_MODE_EN));
  constant CFOK_PWRSVE_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(CFOK_PWRSVE_EN));
  constant CHAN_BOND_MAX_SKEW_BIN : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(CHAN_BOND_MAX_SKEW,4));
  constant CHAN_BOND_SEQ_1_1_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_1_1;
  constant CHAN_BOND_SEQ_1_2_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_1_2;
  constant CHAN_BOND_SEQ_1_3_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_1_3;
  constant CHAN_BOND_SEQ_1_4_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_1_4;
  constant CHAN_BOND_SEQ_1_ENABLE_BIN : std_logic_vector(3 downto 0) := CHAN_BOND_SEQ_1_ENABLE;
  constant CHAN_BOND_SEQ_2_1_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_2_1;
  constant CHAN_BOND_SEQ_2_2_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_2_2;
  constant CHAN_BOND_SEQ_2_3_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_2_3;
  constant CHAN_BOND_SEQ_2_4_BIN : std_logic_vector(9 downto 0) := CHAN_BOND_SEQ_2_4;
  constant CHAN_BOND_SEQ_2_ENABLE_BIN : std_logic_vector(3 downto 0) := CHAN_BOND_SEQ_2_ENABLE;
  constant CHAN_BOND_SEQ_LEN_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(CHAN_BOND_SEQ_LEN,3));
  constant CH_HSPMUX_BIN : std_logic_vector(15 downto 0) := CH_HSPMUX;
  constant CKCAL1_CFG_0_BIN : std_logic_vector(15 downto 0) := CKCAL1_CFG_0;
  constant CKCAL1_CFG_1_BIN : std_logic_vector(15 downto 0) := CKCAL1_CFG_1;
  constant CKCAL1_CFG_2_BIN : std_logic_vector(15 downto 0) := CKCAL1_CFG_2;
  constant CKCAL1_CFG_3_BIN : std_logic_vector(15 downto 0) := CKCAL1_CFG_3;
  constant CKCAL2_CFG_0_BIN : std_logic_vector(15 downto 0) := CKCAL2_CFG_0;
  constant CKCAL2_CFG_1_BIN : std_logic_vector(15 downto 0) := CKCAL2_CFG_1;
  constant CKCAL2_CFG_2_BIN : std_logic_vector(15 downto 0) := CKCAL2_CFG_2;
  constant CKCAL2_CFG_3_BIN : std_logic_vector(15 downto 0) := CKCAL2_CFG_3;
  constant CKCAL2_CFG_4_BIN : std_logic_vector(15 downto 0) := CKCAL2_CFG_4;
  constant CLK_COR_MAX_LAT_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(CLK_COR_MAX_LAT,6));
  constant CLK_COR_MIN_LAT_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(CLK_COR_MIN_LAT,6));
  constant CLK_COR_REPEAT_WAIT_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(CLK_COR_REPEAT_WAIT,5));
  constant CLK_COR_SEQ_1_1_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_1_1;
  constant CLK_COR_SEQ_1_2_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_1_2;
  constant CLK_COR_SEQ_1_3_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_1_3;
  constant CLK_COR_SEQ_1_4_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_1_4;
  constant CLK_COR_SEQ_1_ENABLE_BIN : std_logic_vector(3 downto 0) := CLK_COR_SEQ_1_ENABLE;
  constant CLK_COR_SEQ_2_1_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_2_1;
  constant CLK_COR_SEQ_2_2_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_2_2;
  constant CLK_COR_SEQ_2_3_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_2_3;
  constant CLK_COR_SEQ_2_4_BIN : std_logic_vector(9 downto 0) := CLK_COR_SEQ_2_4;
  constant CLK_COR_SEQ_2_ENABLE_BIN : std_logic_vector(3 downto 0) := CLK_COR_SEQ_2_ENABLE;
  constant CLK_COR_SEQ_LEN_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(CLK_COR_SEQ_LEN,3));
  constant CPLL_CFG0_BIN : std_logic_vector(15 downto 0) := CPLL_CFG0;
  constant CPLL_CFG1_BIN : std_logic_vector(15 downto 0) := CPLL_CFG1;
  constant CPLL_CFG2_BIN : std_logic_vector(15 downto 0) := CPLL_CFG2;
  constant CPLL_CFG3_BIN : std_logic_vector(15 downto 0) := CPLL_CFG3;
  constant CPLL_FBDIV_45_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(CPLL_FBDIV_45,3));
  constant CPLL_FBDIV_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(CPLL_FBDIV,5));
  constant CPLL_INIT_CFG0_BIN : std_logic_vector(15 downto 0) := CPLL_INIT_CFG0;
  constant CPLL_LOCK_CFG_BIN : std_logic_vector(15 downto 0) := CPLL_LOCK_CFG;
  constant CPLL_REFCLK_DIV_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(CPLL_REFCLK_DIV,5));
  constant CSSD_CLK_MASK0_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_CLK_MASK1_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG0_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG10_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG1_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG2_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG3_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG4_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG5_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG6_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG7_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG8_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CSSD_REG9_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant CTLE3_OCAP_EXT_CTRL_BIN : std_logic_vector(2 downto 0) := CTLE3_OCAP_EXT_CTRL;
  constant CTLE3_OCAP_EXT_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(CTLE3_OCAP_EXT_EN));
  constant DDI_CTRL_BIN : std_logic_vector(1 downto 0) := DDI_CTRL;
  constant DDI_REALIGN_WAIT_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(DDI_REALIGN_WAIT,5));
  constant DELAY_ELEC_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(DELAY_ELEC));
  constant DMONITOR_CFG0_BIN : std_logic_vector(9 downto 0) := DMONITOR_CFG0;
  constant DMONITOR_CFG1_BIN : std_logic_vector(7 downto 0) := DMONITOR_CFG1;
  constant ES_CLK_PHASE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ES_CLK_PHASE_SEL));
  constant ES_CONTROL_BIN : std_logic_vector(5 downto 0) := ES_CONTROL;
  constant ES_HORZ_OFFSET_BIN : std_logic_vector(11 downto 0) := ES_HORZ_OFFSET;
  constant ES_PRESCALE_BIN : std_logic_vector(4 downto 0) := ES_PRESCALE;
  constant ES_QUALIFIER0_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER0;
  constant ES_QUALIFIER1_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER1;
  constant ES_QUALIFIER2_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER2;
  constant ES_QUALIFIER3_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER3;
  constant ES_QUALIFIER4_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER4;
  constant ES_QUALIFIER5_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER5;
  constant ES_QUALIFIER6_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER6;
  constant ES_QUALIFIER7_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER7;
  constant ES_QUALIFIER8_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER8;
  constant ES_QUALIFIER9_BIN : std_logic_vector(15 downto 0) := ES_QUALIFIER9;
  constant ES_QUAL_MASK0_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK0;
  constant ES_QUAL_MASK1_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK1;
  constant ES_QUAL_MASK2_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK2;
  constant ES_QUAL_MASK3_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK3;
  constant ES_QUAL_MASK4_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK4;
  constant ES_QUAL_MASK5_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK5;
  constant ES_QUAL_MASK6_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK6;
  constant ES_QUAL_MASK7_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK7;
  constant ES_QUAL_MASK8_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK8;
  constant ES_QUAL_MASK9_BIN : std_logic_vector(15 downto 0) := ES_QUAL_MASK9;
  constant ES_SDATA_MASK0_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK0;
  constant ES_SDATA_MASK1_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK1;
  constant ES_SDATA_MASK2_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK2;
  constant ES_SDATA_MASK3_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK3;
  constant ES_SDATA_MASK4_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK4;
  constant ES_SDATA_MASK5_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK5;
  constant ES_SDATA_MASK6_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK6;
  constant ES_SDATA_MASK7_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK7;
  constant ES_SDATA_MASK8_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK8;
  constant ES_SDATA_MASK9_BIN : std_logic_vector(15 downto 0) := ES_SDATA_MASK9;
  constant EYESCAN_VP_RANGE_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(EYESCAN_VP_RANGE,2));
  constant EYE_SCAN_SWAP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(EYE_SCAN_SWAP_EN));
  constant FTS_DESKEW_SEQ_ENABLE_BIN : std_logic_vector(3 downto 0) := FTS_DESKEW_SEQ_ENABLE;
  constant FTS_LANE_DESKEW_CFG_BIN : std_logic_vector(3 downto 0) := FTS_LANE_DESKEW_CFG;
  constant GEARBOX_MODE_BIN : std_logic_vector(4 downto 0) := GEARBOX_MODE;
  constant GT_INSTANTIATED_BIN : std_logic_vector(0 downto 0) := "1";
  constant INT_MASK_CFG0_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant INT_MASK_CFG1_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant ISCAN_CK_PH_SEL2_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ISCAN_CK_PH_SEL2));
  constant LOCAL_MASTER_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(LOCAL_MASTER));
  constant LPBK_BIAS_CTRL_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(LPBK_BIAS_CTRL,3));
  constant LPBK_EN_RCAL_B_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(LPBK_EN_RCAL_B));
  constant LPBK_EXT_RCAL_BIN : std_logic_vector(3 downto 0) := LPBK_EXT_RCAL;
  constant LPBK_IND_CTRL0_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(LPBK_IND_CTRL0,3));
  constant LPBK_IND_CTRL1_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(LPBK_IND_CTRL1,3));
  constant LPBK_IND_CTRL2_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(LPBK_IND_CTRL2,3));
  constant LPBK_RG_CTRL_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(LPBK_RG_CTRL,2));
  constant OOBDIVCTL_BIN : std_logic_vector(1 downto 0) := OOBDIVCTL;
  constant OOB_PWRUP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(OOB_PWRUP));
  constant PCI3_PIPE_RX_ELECIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(PCI3_PIPE_RX_ELECIDLE));
  constant PCI3_RX_ASYNC_EBUF_BYPASS_BIN : std_logic_vector(1 downto 0) := PCI3_RX_ASYNC_EBUF_BYPASS;
  constant PCI3_RX_ELECIDLE_EI2_ENABLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(PCI3_RX_ELECIDLE_EI2_ENABLE));
  constant PCI3_RX_ELECIDLE_H2L_COUNT_BIN : std_logic_vector(5 downto 0) := PCI3_RX_ELECIDLE_H2L_COUNT;
  constant PCI3_RX_ELECIDLE_H2L_DISABLE_BIN : std_logic_vector(2 downto 0) := PCI3_RX_ELECIDLE_H2L_DISABLE;
  constant PCI3_RX_ELECIDLE_HI_COUNT_BIN : std_logic_vector(5 downto 0) := PCI3_RX_ELECIDLE_HI_COUNT;
  constant PCI3_RX_ELECIDLE_LP4_DISABLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(PCI3_RX_ELECIDLE_LP4_DISABLE));
  constant PCI3_RX_FIFO_DISABLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(PCI3_RX_FIFO_DISABLE));
  constant PCIE3_CLK_COR_EMPTY_THRSH_BIN : std_logic_vector(4 downto 0) := PCIE3_CLK_COR_EMPTY_THRSH;
  constant PCIE3_CLK_COR_FULL_THRSH_BIN : std_logic_vector(5 downto 0) := PCIE3_CLK_COR_FULL_THRSH;
  constant PCIE3_CLK_COR_MAX_LAT_BIN : std_logic_vector(4 downto 0) := PCIE3_CLK_COR_MAX_LAT;
  constant PCIE3_CLK_COR_MIN_LAT_BIN : std_logic_vector(4 downto 0) := PCIE3_CLK_COR_MIN_LAT;
  constant PCIE3_CLK_COR_THRSH_TIMER_BIN : std_logic_vector(5 downto 0) := PCIE3_CLK_COR_THRSH_TIMER;
  constant PCIE_BUFG_DIV_CTRL_BIN : std_logic_vector(15 downto 0) := PCIE_BUFG_DIV_CTRL;
  constant PCIE_PLL_SEL_MODE_GEN12_BIN : std_logic_vector(1 downto 0) := PCIE_PLL_SEL_MODE_GEN12;
  constant PCIE_PLL_SEL_MODE_GEN3_BIN : std_logic_vector(1 downto 0) := PCIE_PLL_SEL_MODE_GEN3;
  constant PCIE_PLL_SEL_MODE_GEN4_BIN : std_logic_vector(1 downto 0) := PCIE_PLL_SEL_MODE_GEN4;
  constant PCIE_RXPCS_CFG_GEN3_BIN : std_logic_vector(15 downto 0) := PCIE_RXPCS_CFG_GEN3;
  constant PCIE_RXPMA_CFG_BIN : std_logic_vector(15 downto 0) := PCIE_RXPMA_CFG;
  constant PCIE_TXPCS_CFG_GEN3_BIN : std_logic_vector(15 downto 0) := PCIE_TXPCS_CFG_GEN3;
  constant PCIE_TXPMA_CFG_BIN : std_logic_vector(15 downto 0) := PCIE_TXPMA_CFG;
  constant PCS_RSVD0_BIN : std_logic_vector(15 downto 0) := PCS_RSVD0;
  constant PD_TRANS_TIME_FROM_P2_BIN : std_logic_vector(11 downto 0) := PD_TRANS_TIME_FROM_P2;
  constant PD_TRANS_TIME_NONE_P2_BIN : std_logic_vector(7 downto 0) := PD_TRANS_TIME_NONE_P2;
  constant PD_TRANS_TIME_TO_P2_BIN : std_logic_vector(7 downto 0) := PD_TRANS_TIME_TO_P2;
  constant PREIQ_FREQ_BST_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(PREIQ_FREQ_BST,2));
  constant RATE_SW_USE_DRP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RATE_SW_USE_DRP));
  constant RCLK_SIPO_DLY_ENB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RCLK_SIPO_DLY_ENB));
  constant RCLK_SIPO_INV_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RCLK_SIPO_INV_EN));
  constant RTX_BUF_CML_CTRL_BIN : std_logic_vector(2 downto 0) := RTX_BUF_CML_CTRL;
  constant RTX_BUF_TERM_CTRL_BIN : std_logic_vector(1 downto 0) := RTX_BUF_TERM_CTRL;
  constant RXBUFRESET_TIME_BIN : std_logic_vector(4 downto 0) := RXBUFRESET_TIME;
  constant RXBUF_EIDLE_HI_CNT_BIN : std_logic_vector(3 downto 0) := RXBUF_EIDLE_HI_CNT;
  constant RXBUF_EIDLE_LO_CNT_BIN : std_logic_vector(3 downto 0) := RXBUF_EIDLE_LO_CNT;
  constant RXBUF_THRESH_OVFLW_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(RXBUF_THRESH_OVFLW,6));
  constant RXBUF_THRESH_UNDFLW_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(RXBUF_THRESH_UNDFLW,6));
  constant RXCDRFREQRESET_TIME_BIN : std_logic_vector(4 downto 0) := RXCDRFREQRESET_TIME;
  constant RXCDRPHRESET_TIME_BIN : std_logic_vector(4 downto 0) := RXCDRPHRESET_TIME;
  constant RXCDR_CFG0_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG0;
  constant RXCDR_CFG0_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG0_GEN3;
  constant RXCDR_CFG1_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG1;
  constant RXCDR_CFG1_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG1_GEN3;
  constant RXCDR_CFG2_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG2;
  constant RXCDR_CFG2_GEN2_BIN : std_logic_vector(9 downto 0) := RXCDR_CFG2_GEN2;
  constant RXCDR_CFG2_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG2_GEN3;
  constant RXCDR_CFG2_GEN4_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG2_GEN4;
  constant RXCDR_CFG3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG3;
  constant RXCDR_CFG3_GEN2_BIN : std_logic_vector(5 downto 0) := RXCDR_CFG3_GEN2;
  constant RXCDR_CFG3_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG3_GEN3;
  constant RXCDR_CFG3_GEN4_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG3_GEN4;
  constant RXCDR_CFG4_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG4;
  constant RXCDR_CFG4_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG4_GEN3;
  constant RXCDR_CFG5_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG5;
  constant RXCDR_CFG5_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG5_GEN3;
  constant RXCDR_FR_RESET_ON_EIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXCDR_FR_RESET_ON_EIDLE));
  constant RXCDR_HOLD_DURING_EIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXCDR_HOLD_DURING_EIDLE));
  constant RXCDR_LOCK_CFG0_BIN : std_logic_vector(15 downto 0) := RXCDR_LOCK_CFG0;
  constant RXCDR_LOCK_CFG1_BIN : std_logic_vector(15 downto 0) := RXCDR_LOCK_CFG1;
  constant RXCDR_LOCK_CFG2_BIN : std_logic_vector(15 downto 0) := RXCDR_LOCK_CFG2;
  constant RXCDR_LOCK_CFG3_BIN : std_logic_vector(15 downto 0) := RXCDR_LOCK_CFG3;
  constant RXCDR_LOCK_CFG4_BIN : std_logic_vector(15 downto 0) := RXCDR_LOCK_CFG4;
  constant RXCDR_PH_RESET_ON_EIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXCDR_PH_RESET_ON_EIDLE));
  constant RXCFOK_CFG0_BIN : std_logic_vector(15 downto 0) := RXCFOK_CFG0;
  constant RXCFOK_CFG1_BIN : std_logic_vector(15 downto 0) := RXCFOK_CFG1;
  constant RXCFOK_CFG2_BIN : std_logic_vector(15 downto 0) := RXCFOK_CFG2;
  constant RXCKCAL1_IQ_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL1_IQ_LOOP_RST_CFG;
  constant RXCKCAL1_I_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL1_I_LOOP_RST_CFG;
  constant RXCKCAL1_Q_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL1_Q_LOOP_RST_CFG;
  constant RXCKCAL2_DX_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL2_DX_LOOP_RST_CFG;
  constant RXCKCAL2_D_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL2_D_LOOP_RST_CFG;
  constant RXCKCAL2_S_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL2_S_LOOP_RST_CFG;
  constant RXCKCAL2_X_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := RXCKCAL2_X_LOOP_RST_CFG;
  constant RXDFELPMRESET_TIME_BIN : std_logic_vector(6 downto 0) := RXDFELPMRESET_TIME;
  constant RXDFELPM_KL_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFELPM_KL_CFG0;
  constant RXDFELPM_KL_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFELPM_KL_CFG1;
  constant RXDFELPM_KL_CFG2_BIN : std_logic_vector(15 downto 0) := RXDFELPM_KL_CFG2;
  constant RXDFE_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_CFG0;
  constant RXDFE_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_CFG1;
  constant RXDFE_GC_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_GC_CFG0;
  constant RXDFE_GC_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_GC_CFG1;
  constant RXDFE_GC_CFG2_BIN : std_logic_vector(15 downto 0) := RXDFE_GC_CFG2;
  constant RXDFE_H2_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H2_CFG0;
  constant RXDFE_H2_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H2_CFG1;
  constant RXDFE_H3_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H3_CFG0;
  constant RXDFE_H3_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H3_CFG1;
  constant RXDFE_H4_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H4_CFG0;
  constant RXDFE_H4_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H4_CFG1;
  constant RXDFE_H5_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H5_CFG0;
  constant RXDFE_H5_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H5_CFG1;
  constant RXDFE_H6_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H6_CFG0;
  constant RXDFE_H6_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H6_CFG1;
  constant RXDFE_H7_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H7_CFG0;
  constant RXDFE_H7_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H7_CFG1;
  constant RXDFE_H8_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H8_CFG0;
  constant RXDFE_H8_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H8_CFG1;
  constant RXDFE_H9_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_H9_CFG0;
  constant RXDFE_H9_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_H9_CFG1;
  constant RXDFE_HA_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_HA_CFG0;
  constant RXDFE_HA_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_HA_CFG1;
  constant RXDFE_HB_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_HB_CFG0;
  constant RXDFE_HB_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_HB_CFG1;
  constant RXDFE_HC_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_HC_CFG0;
  constant RXDFE_HC_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_HC_CFG1;
  constant RXDFE_HD_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_HD_CFG0;
  constant RXDFE_HD_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_HD_CFG1;
  constant RXDFE_HE_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_HE_CFG0;
  constant RXDFE_HE_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_HE_CFG1;
  constant RXDFE_HF_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_HF_CFG0;
  constant RXDFE_HF_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_HF_CFG1;
  constant RXDFE_KH_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_KH_CFG0;
  constant RXDFE_KH_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_KH_CFG1;
  constant RXDFE_KH_CFG2_BIN : std_logic_vector(15 downto 0) := RXDFE_KH_CFG2;
  constant RXDFE_KH_CFG3_BIN : std_logic_vector(15 downto 0) := RXDFE_KH_CFG3;
  constant RXDFE_OS_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_OS_CFG0;
  constant RXDFE_OS_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_OS_CFG1;
  constant RXDFE_UT_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_UT_CFG0;
  constant RXDFE_UT_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_UT_CFG1;
  constant RXDFE_UT_CFG2_BIN : std_logic_vector(15 downto 0) := RXDFE_UT_CFG2;
  constant RXDFE_VP_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_VP_CFG0;
  constant RXDFE_VP_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_VP_CFG1;
  constant RXDLY_CFG_BIN : std_logic_vector(15 downto 0) := RXDLY_CFG;
  constant RXDLY_LCFG_BIN : std_logic_vector(15 downto 0) := RXDLY_LCFG;
  constant RXGBOX_FIFO_INIT_RD_ADDR_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RXGBOX_FIFO_INIT_RD_ADDR,3));
  constant RXISCANRESET_TIME_BIN : std_logic_vector(4 downto 0) := RXISCANRESET_TIME;
  constant RXLPM_CFG_BIN : std_logic_vector(15 downto 0) := RXLPM_CFG;
  constant RXLPM_GC_CFG_BIN : std_logic_vector(15 downto 0) := RXLPM_GC_CFG;
  constant RXLPM_KH_CFG0_BIN : std_logic_vector(15 downto 0) := RXLPM_KH_CFG0;
  constant RXLPM_KH_CFG1_BIN : std_logic_vector(15 downto 0) := RXLPM_KH_CFG1;
  constant RXLPM_OS_CFG0_BIN : std_logic_vector(15 downto 0) := RXLPM_OS_CFG0;
  constant RXLPM_OS_CFG1_BIN : std_logic_vector(15 downto 0) := RXLPM_OS_CFG1;
  constant RXOOB_CFG_BIN : std_logic_vector(8 downto 0) := RXOOB_CFG;
  constant RXOSCALRESET_TIME_BIN : std_logic_vector(4 downto 0) := RXOSCALRESET_TIME;
  constant RXOUT_DIV_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(RXOUT_DIV,6));
  constant RXPCSRESET_TIME_BIN : std_logic_vector(4 downto 0) := RXPCSRESET_TIME;
  constant RXPHBEACON_CFG_BIN : std_logic_vector(15 downto 0) := RXPHBEACON_CFG;
  constant RXPHDLY_CFG_BIN : std_logic_vector(15 downto 0) := RXPHDLY_CFG;
  constant RXPHSAMP_CFG_BIN : std_logic_vector(15 downto 0) := RXPHSAMP_CFG;
  constant RXPHSLIP_CFG_BIN : std_logic_vector(15 downto 0) := RXPHSLIP_CFG;
  constant RXPH_MONITOR_SEL_BIN : std_logic_vector(4 downto 0) := RXPH_MONITOR_SEL;
  constant RXPI_CFG0_BIN : std_logic_vector(15 downto 0) := RXPI_CFG0;
  constant RXPI_CFG1_BIN : std_logic_vector(15 downto 0) := RXPI_CFG1;
  constant RXPMARESET_TIME_BIN : std_logic_vector(4 downto 0) := RXPMARESET_TIME;
  constant RXPRBS_ERR_LOOPBACK_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXPRBS_ERR_LOOPBACK));
  constant RXPRBS_LINKACQ_CNT_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(RXPRBS_LINKACQ_CNT,8));
  constant RXREFCLKDIV2_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXREFCLKDIV2_SEL));
  constant RXSLIDE_AUTO_WAIT_BIN : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(RXSLIDE_AUTO_WAIT,4));
  constant RXSYNC_MULTILANE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXSYNC_MULTILANE));
  constant RXSYNC_OVRD_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXSYNC_OVRD));
  constant RXSYNC_SKIP_DA_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXSYNC_SKIP_DA));
  constant RX_AFE_CM_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_AFE_CM_EN));
  constant RX_BIAS_CFG0_BIN : std_logic_vector(15 downto 0) := RX_BIAS_CFG0;
  constant RX_BUFFER_CFG_BIN : std_logic_vector(5 downto 0) := RX_BUFFER_CFG;
  constant RX_CAPFF_SARC_ENB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CAPFF_SARC_ENB));
  constant RX_CLK25_DIV_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(RX_CLK25_DIV,6));
  constant RX_CLKMUX_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CLKMUX_EN));
  constant RX_CLK_SLIP_OVRD_BIN : std_logic_vector(4 downto 0) := RX_CLK_SLIP_OVRD;
  constant RX_CM_BUF_CFG_BIN : std_logic_vector(3 downto 0) := RX_CM_BUF_CFG;
  constant RX_CM_BUF_PD_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CM_BUF_PD));
  constant RX_CM_SEL_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(RX_CM_SEL,2));
  constant RX_CM_TRIM_BIN : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(RX_CM_TRIM,4));
  constant RX_CTLE_PWR_SAVING_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CTLE_PWR_SAVING));
  constant RX_CTLE_RES_CTRL_BIN : std_logic_vector(3 downto 0) := RX_CTLE_RES_CTRL;
  constant RX_DATA_WIDTH_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(RX_DATA_WIDTH,8));
  constant RX_DDI_SEL_BIN : std_logic_vector(5 downto 0) := RX_DDI_SEL;
  constant RX_DEGEN_CTRL_BIN : std_logic_vector(2 downto 0) := RX_DEGEN_CTRL;
  constant RX_DFECFOKFCDAC_BIN : std_logic_vector(5 downto 0) := "000000";
  constant RX_DFELPM_CFG0_BIN : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(RX_DFELPM_CFG0,4));
  constant RX_DFELPM_CFG1_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DFELPM_CFG1));
  constant RX_DFELPM_KLKH_AGC_STUP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DFELPM_KLKH_AGC_STUP_EN));
  constant RX_DFE_AGC_CFG1_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RX_DFE_AGC_CFG1,3));
  constant RX_DFE_KL_LPM_KH_CFG0_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(RX_DFE_KL_LPM_KH_CFG0,2));
  constant RX_DFE_KL_LPM_KH_CFG1_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RX_DFE_KL_LPM_KH_CFG1,3));
  constant RX_DFE_KL_LPM_KL_CFG0_BIN : std_logic_vector(1 downto 0) := RX_DFE_KL_LPM_KL_CFG0;
  constant RX_DFE_KL_LPM_KL_CFG1_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RX_DFE_KL_LPM_KL_CFG1,3));
  constant RX_DFE_LPM_HOLD_DURING_EIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DFE_LPM_HOLD_DURING_EIDLE));
  constant RX_DIVRESET_TIME_BIN : std_logic_vector(4 downto 0) := RX_DIVRESET_TIME;
  constant RX_EN_CTLE_RCAL_B_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EN_CTLE_RCAL_B));
  constant RX_EN_SUM_RCAL_B_BIN : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(RX_EN_SUM_RCAL_B,1));
  constant RX_EYESCAN_VS_CODE_BIN : std_logic_vector(6 downto 0) := RX_EYESCAN_VS_CODE;
  constant RX_EYESCAN_VS_NEG_DIR_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EYESCAN_VS_NEG_DIR));
  constant RX_EYESCAN_VS_RANGE_BIN : std_logic_vector(1 downto 0) := RX_EYESCAN_VS_RANGE;
  constant RX_EYESCAN_VS_UT_SIGN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EYESCAN_VS_UT_SIGN));
  constant RX_FABINT_USRCLK_FLOP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_FABINT_USRCLK_FLOP));
  constant RX_I2V_FILTER_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_I2V_FILTER_EN));
  constant RX_INT_DATAWIDTH_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(RX_INT_DATAWIDTH,2));
  constant RX_PMA_POWER_SAVE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_PMA_POWER_SAVE));
  constant RX_PMA_RSV0_BIN : std_logic_vector(15 downto 0) := RX_PMA_RSV0;
  constant RX_PROGDIV_CFG_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(RX_PROGDIV_CFG * 1000.0),64));
  constant RX_PROGDIV_RATE_BIN : std_logic_vector(15 downto 0) := RX_PROGDIV_RATE;
  constant RX_RESLOAD_CTRL_BIN : std_logic_vector(3 downto 0) := RX_RESLOAD_CTRL;
  constant RX_RESLOAD_OVRD_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_RESLOAD_OVRD));
  constant RX_SAMPLE_PERIOD_BIN : std_logic_vector(2 downto 0) := RX_SAMPLE_PERIOD;
  constant RX_SIG_VALID_DLY_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(RX_SIG_VALID_DLY,6));
  constant RX_SUM_DEGEN_AVTT_OVERITE_BIN : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(RX_SUM_DEGEN_AVTT_OVERITE,1));
  constant RX_SUM_DFETAPREP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_SUM_DFETAPREP_EN));
  constant RX_SUM_IREF_TUNE_BIN : std_logic_vector(3 downto 0) := RX_SUM_IREF_TUNE;
  constant RX_SUM_PWR_SAVING_BIN : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(RX_SUM_PWR_SAVING,1));
  constant RX_SUM_RES_CTRL_BIN : std_logic_vector(3 downto 0) := RX_SUM_RES_CTRL;
  constant RX_SUM_VCMTUNE_BIN : std_logic_vector(3 downto 0) := RX_SUM_VCMTUNE;
  constant RX_SUM_VCM_BIAS_TUNE_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_SUM_VCM_BIAS_TUNE_EN));
  constant RX_SUM_VCM_OVWR_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_SUM_VCM_OVWR));
  constant RX_SUM_VREF_TUNE_BIN : std_logic_vector(2 downto 0) := RX_SUM_VREF_TUNE;
  constant RX_TUNE_AFE_OS_BIN : std_logic_vector(1 downto 0) := RX_TUNE_AFE_OS;
  constant RX_VREG_CTRL_BIN : std_logic_vector(2 downto 0) := RX_VREG_CTRL;
  constant RX_VREG_PDB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_VREG_PDB));
  constant RX_VREG_VREFSEL_BIN : std_logic_vector(1 downto 0) := "01";
  constant RX_WIDEMODE_CDR_BIN : std_logic_vector(1 downto 0) := RX_WIDEMODE_CDR;
  constant RX_WIDEMODE_CDR_GEN3_BIN : std_logic_vector(1 downto 0) := RX_WIDEMODE_CDR_GEN3;
  constant RX_WIDEMODE_CDR_GEN4_BIN : std_logic_vector(1 downto 0) := RX_WIDEMODE_CDR_GEN4;
  constant RX_XMODE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_XMODE_SEL));
  constant SAMPLE_CLK_PHASE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SAMPLE_CLK_PHASE));
  constant SAS_12G_MODE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SAS_12G_MODE));
  constant SATA_BURST_SEQ_LEN_BIN : std_logic_vector(3 downto 0) := SATA_BURST_SEQ_LEN;
  constant SATA_BURST_VAL_BIN : std_logic_vector(2 downto 0) := SATA_BURST_VAL;
  constant SATA_EIDLE_VAL_BIN : std_logic_vector(2 downto 0) := SATA_EIDLE_VAL;
  constant SRSTMODE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SRSTMODE));
  constant TAPDLY_SET_TX_BIN : std_logic_vector(1 downto 0) := TAPDLY_SET_TX;
  constant TERM_RCAL_CFG_BIN : std_logic_vector(14 downto 0) := TERM_RCAL_CFG;
  constant TERM_RCAL_OVRD_BIN : std_logic_vector(2 downto 0) := TERM_RCAL_OVRD;
  constant TRANS_TIME_RATE_BIN : std_logic_vector(7 downto 0) := TRANS_TIME_RATE;
  constant TST_RSV0_BIN : std_logic_vector(7 downto 0) := TST_RSV0;
  constant TST_RSV1_BIN : std_logic_vector(7 downto 0) := TST_RSV1;
  constant TXDLY_CFG_BIN : std_logic_vector(15 downto 0) := TXDLY_CFG;
  constant TXDLY_LCFG_BIN : std_logic_vector(15 downto 0) := TXDLY_LCFG;
  constant TXDRV_FREQBAND_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TXDRV_FREQBAND,2));
  constant TXFE_CFG0_BIN : std_logic_vector(15 downto 0) := TXFE_CFG0;
  constant TXFE_CFG1_BIN : std_logic_vector(15 downto 0) := TXFE_CFG1;
  constant TXFE_CFG2_BIN : std_logic_vector(15 downto 0) := TXFE_CFG2;
  constant TXFE_CFG3_BIN : std_logic_vector(15 downto 0) := TXFE_CFG3;
  constant TXGBOX_FIFO_INIT_RD_ADDR_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(TXGBOX_FIFO_INIT_RD_ADDR,3));
  constant TXOUTCLKPCS_SEL_BIN : std_logic_vector(0 downto 0) := "0";
  constant TXOUT_DIV_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(TXOUT_DIV,6));
  constant TXPCSRESET_TIME_BIN : std_logic_vector(4 downto 0) := TXPCSRESET_TIME;
  constant TXPHDLY_CFG0_BIN : std_logic_vector(15 downto 0) := TXPHDLY_CFG0;
  constant TXPHDLY_CFG1_BIN : std_logic_vector(15 downto 0) := TXPHDLY_CFG1;
  constant TXPH_CFG2_BIN : std_logic_vector(15 downto 0) := TXPH_CFG2;
  constant TXPH_CFG_BIN : std_logic_vector(15 downto 0) := TXPH_CFG;
  constant TXPH_MONITOR_SEL_BIN : std_logic_vector(4 downto 0) := TXPH_MONITOR_SEL;
  constant TXPI_CFG0_BIN : std_logic_vector(15 downto 0) := TXPI_CFG0;
  constant TXPI_CFG1_BIN : std_logic_vector(15 downto 0) := TXPI_CFG1;
  constant TXPI_GRAY_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_GRAY_SEL));
  constant TXPI_INVSTROBE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_INVSTROBE_SEL));
  constant TXPI_PPM_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_PPM));
  constant TXPI_PPM_CFG_BIN : std_logic_vector(7 downto 0) := TXPI_PPM_CFG;
  constant TXPI_SYNFREQ_PPM_BIN : std_logic_vector(2 downto 0) := TXPI_SYNFREQ_PPM;
  constant TXPMARESET_TIME_BIN : std_logic_vector(4 downto 0) := TXPMARESET_TIME;
  constant TXREFCLKDIV2_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXREFCLKDIV2_SEL));
  constant TXSWBST_BST_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TXSWBST_BST,2));
  constant TXSWBST_EN_BIN : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(TXSWBST_EN,1));
  constant TXSWBST_MAG_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(TXSWBST_MAG,3));
  constant TXSYNC_MULTILANE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXSYNC_MULTILANE));
  constant TXSYNC_OVRD_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXSYNC_OVRD));
  constant TXSYNC_SKIP_DA_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXSYNC_SKIP_DA));
  constant TX_CLK25_DIV_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(TX_CLK25_DIV,6));
  constant TX_CLKMUX_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_CLKMUX_EN));
  constant TX_DATA_WIDTH_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(TX_DATA_WIDTH,8));
  constant TX_DCC_LOOP_RST_CFG_BIN : std_logic_vector(15 downto 0) := TX_DCC_LOOP_RST_CFG;
  constant TX_DEEMPH0_BIN : std_logic_vector(5 downto 0) := TX_DEEMPH0;
  constant TX_DEEMPH1_BIN : std_logic_vector(5 downto 0) := TX_DEEMPH1;
  constant TX_DEEMPH2_BIN : std_logic_vector(5 downto 0) := TX_DEEMPH2;
  constant TX_DEEMPH3_BIN : std_logic_vector(5 downto 0) := TX_DEEMPH3;
  constant TX_DIVRESET_TIME_BIN : std_logic_vector(4 downto 0) := TX_DIVRESET_TIME;
  constant TX_EIDLE_ASSERT_DELAY_BIN : std_logic_vector(2 downto 0) := TX_EIDLE_ASSERT_DELAY;
  constant TX_EIDLE_DEASSERT_DELAY_BIN : std_logic_vector(2 downto 0) := TX_EIDLE_DEASSERT_DELAY;
  constant TX_FABINT_USRCLK_FLOP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_FABINT_USRCLK_FLOP));
  constant TX_FIFO_BYP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_FIFO_BYP_EN));
  constant TX_IDLE_DATA_ZERO_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_IDLE_DATA_ZERO));
  constant TX_INT_DATAWIDTH_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TX_INT_DATAWIDTH,2));
  constant TX_MAINCURSOR_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_MAINCURSOR_SEL));
  constant TX_MARGIN_FULL_0_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_FULL_0;
  constant TX_MARGIN_FULL_1_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_FULL_1;
  constant TX_MARGIN_FULL_2_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_FULL_2;
  constant TX_MARGIN_FULL_3_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_FULL_3;
  constant TX_MARGIN_FULL_4_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_FULL_4;
  constant TX_MARGIN_LOW_0_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_LOW_0;
  constant TX_MARGIN_LOW_1_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_LOW_1;
  constant TX_MARGIN_LOW_2_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_LOW_2;
  constant TX_MARGIN_LOW_3_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_LOW_3;
  constant TX_MARGIN_LOW_4_BIN : std_logic_vector(6 downto 0) := TX_MARGIN_LOW_4;
  constant TX_PHICAL_CFG0_BIN : std_logic_vector(15 downto 0) := TX_PHICAL_CFG0;
  constant TX_PHICAL_CFG1_BIN : std_logic_vector(15 downto 0) := TX_PHICAL_CFG1;
  constant TX_PI_BIASSET_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TX_PI_BIASSET,2));
  constant TX_PMADATA_OPT_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PMADATA_OPT));
  constant TX_PMA_POWER_SAVE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PMA_POWER_SAVE));
  constant TX_PMA_RSV0_BIN : std_logic_vector(15 downto 0) := TX_PMA_RSV0;
  constant TX_PMA_RSV1_BIN : std_logic_vector(15 downto 0) := TX_PMA_RSV1;
  constant TX_PROGDIV_CFG_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(TX_PROGDIV_CFG * 1000.0),64));
  constant TX_PROGDIV_RATE_BIN : std_logic_vector(15 downto 0) := TX_PROGDIV_RATE;
  constant TX_RXDETECT_CFG_BIN : std_logic_vector(13 downto 0) := TX_RXDETECT_CFG;
  constant TX_RXDETECT_REF_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(TX_RXDETECT_REF,3));
  constant TX_SAMPLE_PERIOD_BIN : std_logic_vector(2 downto 0) := TX_SAMPLE_PERIOD;
  constant TX_SW_MEAS_BIN : std_logic_vector(1 downto 0) := TX_SW_MEAS;
  constant TX_USERPATTERN_DATA0_BIN : std_logic_vector(9 downto 0) := "0101111100";
  constant TX_USERPATTERN_DATA1_BIN : std_logic_vector(9 downto 0) := "0101010101";
  constant TX_USERPATTERN_DATA2_BIN : std_logic_vector(9 downto 0) := "1010000011";
  constant TX_USERPATTERN_DATA3_BIN : std_logic_vector(9 downto 0) := "1010101010";
  constant TX_USERPATTERN_DATA4_BIN : std_logic_vector(9 downto 0) := "0101111100";
  constant TX_USERPATTERN_DATA5_BIN : std_logic_vector(9 downto 0) := "0101010101";
  constant TX_USERPATTERN_DATA6_BIN : std_logic_vector(9 downto 0) := "1010000011";
  constant TX_USERPATTERN_DATA7_BIN : std_logic_vector(9 downto 0) := "1010101010";
  constant TX_VREG_CTRL_BIN : std_logic_vector(2 downto 0) := TX_VREG_CTRL;
  constant TX_VREG_PDB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_VREG_PDB));
  constant TX_VREG_VREFSEL_BIN : std_logic_vector(1 downto 0) := TX_VREG_VREFSEL;
  constant USB_BOTH_BURST_IDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_BOTH_BURST_IDLE));
  constant USB_BURSTMAX_U3WAKE_BIN : std_logic_vector(6 downto 0) := USB_BURSTMAX_U3WAKE;
  constant USB_BURSTMIN_U3WAKE_BIN : std_logic_vector(6 downto 0) := USB_BURSTMIN_U3WAKE;
  constant USB_CLK_COR_EQ_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_CLK_COR_EQ_EN));
  constant USB_EXT_CNTL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_EXT_CNTL));
  constant USB_IDLEMAX_POLLING_BIN : std_logic_vector(9 downto 0) := USB_IDLEMAX_POLLING;
  constant USB_IDLEMIN_POLLING_BIN : std_logic_vector(9 downto 0) := USB_IDLEMIN_POLLING;
  constant USB_LFPSPING_BURST_BIN : std_logic_vector(8 downto 0) := USB_LFPSPING_BURST;
  constant USB_LFPSPOLLING_BURST_BIN : std_logic_vector(8 downto 0) := USB_LFPSPOLLING_BURST;
  constant USB_LFPSPOLLING_IDLE_MS_BIN : std_logic_vector(8 downto 0) := USB_LFPSPOLLING_IDLE_MS;
  constant USB_LFPSU1EXIT_BURST_BIN : std_logic_vector(8 downto 0) := USB_LFPSU1EXIT_BURST;
  constant USB_LFPSU2LPEXIT_BURST_MS_BIN : std_logic_vector(8 downto 0) := USB_LFPSU2LPEXIT_BURST_MS;
  constant USB_LFPSU3WAKE_BURST_MS_BIN : std_logic_vector(8 downto 0) := USB_LFPSU3WAKE_BURST_MS;
  constant USB_LFPS_TPERIOD_ACCURATE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_LFPS_TPERIOD_ACCURATE));
  constant USB_LFPS_TPERIOD_BIN : std_logic_vector(3 downto 0) := USB_LFPS_TPERIOD;
  constant USB_MODE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_MODE));
  constant USB_PCIE_ERR_REP_DIS_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_PCIE_ERR_REP_DIS));
  constant USB_PING_SATA_MAX_INIT_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_PING_SATA_MAX_INIT,6));
  constant USB_PING_SATA_MIN_INIT_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_PING_SATA_MIN_INIT,6));
  constant USB_POLL_SATA_MAX_BURST_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_POLL_SATA_MAX_BURST,6));
  constant USB_POLL_SATA_MIN_BURST_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_POLL_SATA_MIN_BURST,6));
  constant USB_RAW_ELEC_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_RAW_ELEC));
  constant USB_RXIDLE_P0_CTRL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_RXIDLE_P0_CTRL));
  constant USB_TXIDLE_TUNE_ENABLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USB_TXIDLE_TUNE_ENABLE));
  constant USB_U1_SATA_MAX_WAKE_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_U1_SATA_MAX_WAKE,6));
  constant USB_U1_SATA_MIN_WAKE_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_U1_SATA_MIN_WAKE,6));
  constant USB_U2_SAS_MAX_COM_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(USB_U2_SAS_MAX_COM,7));
  constant USB_U2_SAS_MIN_COM_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(USB_U2_SAS_MIN_COM,6));
  constant USE_PCS_CLK_PHASE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USE_PCS_CLK_PHASE_SEL));
  constant Y_ALL_MODE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(Y_ALL_MODE));

-- Parameter encodings and registers

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  signal BUFGTCEMASK_out : std_logic_vector(2 downto 0);
  signal BUFGTCE_out : std_ulogic;
  signal BUFGTDIV_out : std_logic_vector(8 downto 0);
  signal BUFGTRESET_out : std_ulogic;
  signal BUFGTRSTMASK_out : std_logic_vector(2 downto 0);
  signal CPLLFBCLKLOST_out : std_ulogic;
  signal CPLLLOCK_out : std_ulogic;
  signal CPLLREFCLKLOST_out : std_ulogic;
  signal CSSDSTOPCLKDONE_out : std_ulogic;
  signal DMONITOROUTCLK_out : std_ulogic;
  signal DMONITOROUT_out : std_logic_vector(15 downto 0);
  signal DRPDO_out : std_logic_vector(15 downto 0);
  signal DRPRDY_out : std_ulogic;
  signal EYESCANDATAERROR_out : std_ulogic;
  signal GTPOWERGOOD_out : std_ulogic;
  signal GTREFCLKMONITOR_out : std_ulogic;
  signal GTYTXN_out : std_ulogic;
  signal GTYTXP_out : std_ulogic;
  signal PCIERATEGEN3_out : std_ulogic;
  signal PCIERATEIDLE_out : std_ulogic;
  signal PCIERATEQPLLPD_out : std_logic_vector(1 downto 0);
  signal PCIERATEQPLLRESET_out : std_logic_vector(1 downto 0);
  signal PCIESYNCTXSYNCDONE_out : std_ulogic;
  signal PCIEUSERGEN3RDY_out : std_ulogic;
  signal PCIEUSERPHYSTATUSRST_out : std_ulogic;
  signal PCIEUSERRATESTART_out : std_ulogic;
  signal PCSRSVDOUT_out : std_logic_vector(15 downto 0);
  signal PHYSTATUS_out : std_ulogic;
  signal PINRSRVDAS_out : std_logic_vector(15 downto 0);
  signal PMASCANOUT_out : std_logic_vector(17 downto 0);
  signal POWERPRESENT_out : std_ulogic;
  signal RESETEXCEPTION_out : std_ulogic;
  signal RXBUFSTATUS_out : std_logic_vector(2 downto 0);
  signal RXBYTEISALIGNED_out : std_ulogic;
  signal RXBYTEREALIGN_out : std_ulogic;
  signal RXCDRLOCK_out : std_ulogic;
  signal RXCDRPHDONE_out : std_ulogic;
  signal RXCHANBONDSEQ_out : std_ulogic;
  signal RXCHANISALIGNED_out : std_ulogic;
  signal RXCHANREALIGN_out : std_ulogic;
  signal RXCHBONDO_out : std_logic_vector(4 downto 0);
  signal RXCKCALDONE_out : std_ulogic;
  signal RXCLKCORCNT_out : std_logic_vector(1 downto 0);
  signal RXCOMINITDET_out : std_ulogic;
  signal RXCOMMADET_out : std_ulogic;
  signal RXCOMSASDET_out : std_ulogic;
  signal RXCOMWAKEDET_out : std_ulogic;
  signal RXCTRL0_out : std_logic_vector(15 downto 0);
  signal RXCTRL1_out : std_logic_vector(15 downto 0);
  signal RXCTRL2_out : std_logic_vector(7 downto 0);
  signal RXCTRL3_out : std_logic_vector(7 downto 0);
  signal RXDATAEXTENDRSVD_out : std_logic_vector(7 downto 0);
  signal RXDATAVALID_out : std_logic_vector(1 downto 0);
  signal RXDATA_out : std_logic_vector(127 downto 0);
  signal RXDLYSRESETDONE_out : std_ulogic;
  signal RXELECIDLE_out : std_ulogic;
  signal RXHEADERVALID_out : std_logic_vector(1 downto 0);
  signal RXHEADER_out : std_logic_vector(5 downto 0);
  signal RXLFPSTRESETDET_out : std_ulogic;
  signal RXLFPSU2LPEXITDET_out : std_ulogic;
  signal RXLFPSU3WAKEDET_out : std_ulogic;
  signal RXMONITOROUT_out : std_logic_vector(7 downto 0);
  signal RXOSINTDONE_out : std_ulogic;
  signal RXOSINTSTARTED_out : std_ulogic;
  signal RXOSINTSTROBEDONE_out : std_ulogic;
  signal RXOSINTSTROBESTARTED_out : std_ulogic;
  signal RXOUTCLKFABRIC_out : std_ulogic;
  signal RXOUTCLKPCS_out : std_ulogic;
  signal RXOUTCLK_out : std_ulogic;
  signal RXPHALIGNDONE_out : std_ulogic;
  signal RXPHALIGNERR_out : std_ulogic;
  signal RXPMARESETDONE_out : std_ulogic;
  signal RXPRBSERR_out : std_ulogic;
  signal RXPRBSLOCKED_out : std_ulogic;
  signal RXPRGDIVRESETDONE_out : std_ulogic;
  signal RXRATEDONE_out : std_ulogic;
  signal RXRECCLKOUT_out : std_ulogic;
  signal RXRESETDONE_out : std_ulogic;
  signal RXSLIDERDY_out : std_ulogic;
  signal RXSLIPDONE_out : std_ulogic;
  signal RXSLIPOUTCLKRDY_out : std_ulogic;
  signal RXSLIPPMARDY_out : std_ulogic;
  signal RXSTARTOFSEQ_out : std_logic_vector(1 downto 0);
  signal RXSTATUS_out : std_logic_vector(2 downto 0);
  signal RXSYNCDONE_out : std_ulogic;
  signal RXSYNCOUT_out : std_ulogic;
  signal RXVALID_out : std_ulogic;
  signal SCANOUT_out : std_logic_vector(18 downto 0);
  signal TXBUFSTATUS_out : std_logic_vector(1 downto 0);
  signal TXCOMFINISH_out : std_ulogic;
  signal TXDCCDONE_out : std_ulogic;
  signal TXDLYSRESETDONE_out : std_ulogic;
  signal TXOUTCLKFABRIC_out : std_ulogic;
  signal TXOUTCLKPCS_out : std_ulogic;
  signal TXOUTCLK_out : std_ulogic;
  signal TXPHALIGNDONE_out : std_ulogic;
  signal TXPHINITDONE_out : std_ulogic;
  signal TXPMARESETDONE_out : std_ulogic;
  signal TXPRGDIVRESETDONE_out : std_ulogic;
  signal TXRATEDONE_out : std_ulogic;
  signal TXRESETDONE_out : std_ulogic;
  signal TXSYNCDONE_out : std_ulogic;
  signal TXSYNCOUT_out : std_ulogic;
  
  signal BSR_SERIAL_in : std_ulogic;
  signal CDRSTEPDIR_in : std_ulogic;
  signal CDRSTEPSQ_in : std_ulogic;
  signal CDRSTEPSX_in : std_ulogic;
  signal CFGRESET_in : std_ulogic;
  signal CLKRSVD0_in : std_ulogic;
  signal CLKRSVD1_in : std_ulogic;
  signal CPLLFREQLOCK_in : std_ulogic;
  signal CPLLLOCKDETCLK_in : std_ulogic;
  signal CPLLLOCKEN_in : std_ulogic;
  signal CPLLPD_in : std_ulogic;
  signal CPLLREFCLKSEL_in : std_logic_vector(2 downto 0);
  signal CPLLRESET_in : std_ulogic;
  signal CSSDRSTB_in : std_ulogic;
  signal CSSDSTOPCLK_in : std_ulogic;
  signal DMONFIFORESET_in : std_ulogic;
  signal DMONITORCLK_in : std_ulogic;
  signal DRPADDR_in : std_logic_vector(9 downto 0);
  signal DRPCLK_in : std_ulogic;
  signal DRPDI_in : std_logic_vector(15 downto 0);
  signal DRPEN_in : std_ulogic;
  signal DRPRST_in : std_ulogic;
  signal DRPWE_in : std_ulogic;
  signal EYESCANRESET_in : std_ulogic;
  signal EYESCANTRIGGER_in : std_ulogic;
  signal FREQOS_in : std_ulogic;
  signal GTGREFCLK_in : std_ulogic;
  signal GTNORTHREFCLK0_in : std_ulogic;
  signal GTNORTHREFCLK1_in : std_ulogic;
  signal GTREFCLK0_in : std_ulogic;
  signal GTREFCLK1_in : std_ulogic;
  signal GTRSVD_in : std_logic_vector(15 downto 0);
  signal GTRXRESETSEL_in : std_ulogic;
  signal GTRXRESET_in : std_ulogic;
  signal GTSOUTHREFCLK0_in : std_ulogic;
  signal GTSOUTHREFCLK1_in : std_ulogic;
  signal GTTXRESETSEL_in : std_ulogic;
  signal GTTXRESET_in : std_ulogic;
  signal GTYRXN_in : std_ulogic;
  signal GTYRXP_in : std_ulogic;
  signal INCPCTRL_in : std_ulogic;
  signal LOOPBACK_in : std_logic_vector(2 downto 0);
  signal PCIEEQRXEQADAPTDONE_in : std_ulogic;
  signal PCIERSTIDLE_in : std_ulogic;
  signal PCIERSTTXSYNCSTART_in : std_ulogic;
  signal PCIEUSERRATEDONE_in : std_ulogic;
  signal PCSRSVDIN_in : std_logic_vector(15 downto 0);
  signal PMASCANCLK0_in : std_ulogic;
  signal PMASCANCLK1_in : std_ulogic;
  signal PMASCANCLK2_in : std_ulogic;
  signal PMASCANCLK3_in : std_ulogic;
  signal PMASCANCLK4_in : std_ulogic;
  signal PMASCANCLK5_in : std_ulogic;
  signal PMASCANCLK6_in : std_ulogic;
  signal PMASCANCLK7_in : std_ulogic;
  signal PMASCANCLK8_in : std_ulogic;
  signal PMASCANENB_in : std_ulogic;
  signal PMASCANIN_in : std_logic_vector(17 downto 0);
  signal PMASCANMODEB_in : std_ulogic;
  signal PMASCANRSTEN_in : std_ulogic;
  signal QPLL0CLK_in : std_ulogic;
  signal QPLL0FREQLOCK_in : std_ulogic;
  signal QPLL0REFCLK_in : std_ulogic;
  signal QPLL1CLK_in : std_ulogic;
  signal QPLL1FREQLOCK_in : std_ulogic;
  signal QPLL1REFCLK_in : std_ulogic;
  signal RESETOVRD_in : std_ulogic;
  signal RX8B10BEN_in : std_ulogic;
  signal RXAFECFOKEN_in : std_ulogic;
  signal RXBUFRESET_in : std_ulogic;
  signal RXCDRFREQRESET_in : std_ulogic;
  signal RXCDRHOLD_in : std_ulogic;
  signal RXCDROVRDEN_in : std_ulogic;
  signal RXCDRRESET_in : std_ulogic;
  signal RXCHBONDEN_in : std_ulogic;
  signal RXCHBONDI_in : std_logic_vector(4 downto 0);
  signal RXCHBONDLEVEL_in : std_logic_vector(2 downto 0);
  signal RXCHBONDMASTER_in : std_ulogic;
  signal RXCHBONDSLAVE_in : std_ulogic;
  signal RXCKCALRESET_in : std_ulogic;
  signal RXCKCALSTART_in : std_logic_vector(6 downto 0);
  signal RXCOMMADETEN_in : std_ulogic;
  signal RXDFEAGCHOLD_in : std_ulogic;
  signal RXDFEAGCOVRDEN_in : std_ulogic;
  signal RXDFECFOKFCNUM_in : std_logic_vector(3 downto 0);
  signal RXDFECFOKFEN_in : std_ulogic;
  signal RXDFECFOKFPULSE_in : std_ulogic;
  signal RXDFECFOKHOLD_in : std_ulogic;
  signal RXDFECFOKOVREN_in : std_ulogic;
  signal RXDFEKHHOLD_in : std_ulogic;
  signal RXDFEKHOVRDEN_in : std_ulogic;
  signal RXDFELFHOLD_in : std_ulogic;
  signal RXDFELFOVRDEN_in : std_ulogic;
  signal RXDFELPMRESET_in : std_ulogic;
  signal RXDFETAP10HOLD_in : std_ulogic;
  signal RXDFETAP10OVRDEN_in : std_ulogic;
  signal RXDFETAP11HOLD_in : std_ulogic;
  signal RXDFETAP11OVRDEN_in : std_ulogic;
  signal RXDFETAP12HOLD_in : std_ulogic;
  signal RXDFETAP12OVRDEN_in : std_ulogic;
  signal RXDFETAP13HOLD_in : std_ulogic;
  signal RXDFETAP13OVRDEN_in : std_ulogic;
  signal RXDFETAP14HOLD_in : std_ulogic;
  signal RXDFETAP14OVRDEN_in : std_ulogic;
  signal RXDFETAP15HOLD_in : std_ulogic;
  signal RXDFETAP15OVRDEN_in : std_ulogic;
  signal RXDFETAP2HOLD_in : std_ulogic;
  signal RXDFETAP2OVRDEN_in : std_ulogic;
  signal RXDFETAP3HOLD_in : std_ulogic;
  signal RXDFETAP3OVRDEN_in : std_ulogic;
  signal RXDFETAP4HOLD_in : std_ulogic;
  signal RXDFETAP4OVRDEN_in : std_ulogic;
  signal RXDFETAP5HOLD_in : std_ulogic;
  signal RXDFETAP5OVRDEN_in : std_ulogic;
  signal RXDFETAP6HOLD_in : std_ulogic;
  signal RXDFETAP6OVRDEN_in : std_ulogic;
  signal RXDFETAP7HOLD_in : std_ulogic;
  signal RXDFETAP7OVRDEN_in : std_ulogic;
  signal RXDFETAP8HOLD_in : std_ulogic;
  signal RXDFETAP8OVRDEN_in : std_ulogic;
  signal RXDFETAP9HOLD_in : std_ulogic;
  signal RXDFETAP9OVRDEN_in : std_ulogic;
  signal RXDFEUTHOLD_in : std_ulogic;
  signal RXDFEUTOVRDEN_in : std_ulogic;
  signal RXDFEVPHOLD_in : std_ulogic;
  signal RXDFEVPOVRDEN_in : std_ulogic;
  signal RXDFEXYDEN_in : std_ulogic;
  signal RXDLYBYPASS_in : std_ulogic;
  signal RXDLYEN_in : std_ulogic;
  signal RXDLYOVRDEN_in : std_ulogic;
  signal RXDLYSRESET_in : std_ulogic;
  signal RXELECIDLEMODE_in : std_logic_vector(1 downto 0);
  signal RXEQTRAINING_in : std_ulogic;
  signal RXGEARBOXSLIP_in : std_ulogic;
  signal RXLATCLK_in : std_ulogic;
  signal RXLPMEN_in : std_ulogic;
  signal RXLPMGCHOLD_in : std_ulogic;
  signal RXLPMGCOVRDEN_in : std_ulogic;
  signal RXLPMHFHOLD_in : std_ulogic;
  signal RXLPMHFOVRDEN_in : std_ulogic;
  signal RXLPMLFHOLD_in : std_ulogic;
  signal RXLPMLFKLOVRDEN_in : std_ulogic;
  signal RXLPMOSHOLD_in : std_ulogic;
  signal RXLPMOSOVRDEN_in : std_ulogic;
  signal RXMCOMMAALIGNEN_in : std_ulogic;
  signal RXMONITORSEL_in : std_logic_vector(1 downto 0);
  signal RXOOBRESET_in : std_ulogic;
  signal RXOSCALRESET_in : std_ulogic;
  signal RXOSHOLD_in : std_ulogic;
  signal RXOSOVRDEN_in : std_ulogic;
  signal RXOUTCLKSEL_in : std_logic_vector(2 downto 0);
  signal RXPCOMMAALIGNEN_in : std_ulogic;
  signal RXPCSRESET_in : std_ulogic;
  signal RXPD_in : std_logic_vector(1 downto 0);
  signal RXPHALIGNEN_in : std_ulogic;
  signal RXPHALIGN_in : std_ulogic;
  signal RXPHDLYPD_in : std_ulogic;
  signal RXPHDLYRESET_in : std_ulogic;
  signal RXPLLCLKSEL_in : std_logic_vector(1 downto 0);
  signal RXPMARESET_in : std_ulogic;
  signal RXPOLARITY_in : std_ulogic;
  signal RXPRBSCNTRESET_in : std_ulogic;
  signal RXPRBSSEL_in : std_logic_vector(3 downto 0);
  signal RXPROGDIVRESET_in : std_ulogic;
  signal RXRATEMODE_in : std_ulogic;
  signal RXRATE_in : std_logic_vector(2 downto 0);
  signal RXSLIDE_in : std_ulogic;
  signal RXSLIPOUTCLK_in : std_ulogic;
  signal RXSLIPPMA_in : std_ulogic;
  signal RXSYNCALLIN_in : std_ulogic;
  signal RXSYNCIN_in : std_ulogic;
  signal RXSYNCMODE_in : std_ulogic;
  signal RXSYSCLKSEL_in : std_logic_vector(1 downto 0);
  signal RXTERMINATION_in : std_ulogic;
  signal RXUSERRDY_in : std_ulogic;
  signal RXUSRCLK2_in : std_ulogic;
  signal RXUSRCLK_in : std_ulogic;
  signal SARCCLK_in : std_ulogic;
  signal SCANCLK_in : std_ulogic;
  signal SCANENB_in : std_ulogic;
  signal SCANIN_in : std_logic_vector(18 downto 0);
  signal SCANMODEB_in : std_ulogic;
  signal SCANRSTB_in : std_ulogic;
  signal SCANRSTEN_in : std_ulogic;
  signal SIGVALIDCLK_in : std_ulogic;
  signal TSTCLK0_in : std_ulogic;
  signal TSTCLK1_in : std_ulogic;
  signal TSTIN_in : std_logic_vector(19 downto 0);
  signal TSTPDOVRDB_in : std_ulogic;
  signal TSTPD_in : std_logic_vector(4 downto 0);
  signal TX8B10BBYPASS_in : std_logic_vector(7 downto 0);
  signal TX8B10BEN_in : std_ulogic;
  signal TXCOMINIT_in : std_ulogic;
  signal TXCOMSAS_in : std_ulogic;
  signal TXCOMWAKE_in : std_ulogic;
  signal TXCTRL0_in : std_logic_vector(15 downto 0);
  signal TXCTRL1_in : std_logic_vector(15 downto 0);
  signal TXCTRL2_in : std_logic_vector(7 downto 0);
  signal TXDATAEXTENDRSVD_in : std_logic_vector(7 downto 0);
  signal TXDATA_in : std_logic_vector(127 downto 0);
  signal TXDCCFORCESTART_in : std_ulogic;
  signal TXDCCRESET_in : std_ulogic;
  signal TXDEEMPH_in : std_logic_vector(1 downto 0);
  signal TXDETECTRX_in : std_ulogic;
  signal TXDIFFCTRL_in : std_logic_vector(4 downto 0);
  signal TXDLYBYPASS_in : std_ulogic;
  signal TXDLYEN_in : std_ulogic;
  signal TXDLYHOLD_in : std_ulogic;
  signal TXDLYOVRDEN_in : std_ulogic;
  signal TXDLYSRESET_in : std_ulogic;
  signal TXDLYUPDOWN_in : std_ulogic;
  signal TXELECIDLE_in : std_ulogic;
  signal TXHEADER_in : std_logic_vector(5 downto 0);
  signal TXINHIBIT_in : std_ulogic;
  signal TXLATCLK_in : std_ulogic;
  signal TXLFPSTRESET_in : std_ulogic;
  signal TXLFPSU2LPEXIT_in : std_ulogic;
  signal TXLFPSU3WAKE_in : std_ulogic;
  signal TXMAINCURSOR_in : std_logic_vector(6 downto 0);
  signal TXMARGIN_in : std_logic_vector(2 downto 0);
  signal TXMUXDCDEXHOLD_in : std_ulogic;
  signal TXMUXDCDORWREN_in : std_ulogic;
  signal TXONESZEROS_in : std_ulogic;
  signal TXOUTCLKSEL_in : std_logic_vector(2 downto 0);
  signal TXPCSRESET_in : std_ulogic;
  signal TXPDELECIDLEMODE_in : std_ulogic;
  signal TXPD_in : std_logic_vector(1 downto 0);
  signal TXPHALIGNEN_in : std_ulogic;
  signal TXPHALIGN_in : std_ulogic;
  signal TXPHDLYPD_in : std_ulogic;
  signal TXPHDLYRESET_in : std_ulogic;
  signal TXPHDLYTSTCLK_in : std_ulogic;
  signal TXPHINIT_in : std_ulogic;
  signal TXPHOVRDEN_in : std_ulogic;
  signal TXPIPPMEN_in : std_ulogic;
  signal TXPIPPMOVRDEN_in : std_ulogic;
  signal TXPIPPMPD_in : std_ulogic;
  signal TXPIPPMSEL_in : std_ulogic;
  signal TXPIPPMSTEPSIZE_in : std_logic_vector(4 downto 0);
  signal TXPISOPD_in : std_ulogic;
  signal TXPLLCLKSEL_in : std_logic_vector(1 downto 0);
  signal TXPMARESET_in : std_ulogic;
  signal TXPOLARITY_in : std_ulogic;
  signal TXPOSTCURSOR_in : std_logic_vector(4 downto 0);
  signal TXPRBSFORCEERR_in : std_ulogic;
  signal TXPRBSSEL_in : std_logic_vector(3 downto 0);
  signal TXPRECURSOR_in : std_logic_vector(4 downto 0);
  signal TXPROGDIVRESET_in : std_ulogic;
  signal TXRATEMODE_in : std_ulogic;
  signal TXRATE_in : std_logic_vector(2 downto 0);
  signal TXSEQUENCE_in : std_logic_vector(6 downto 0);
  signal TXSWING_in : std_ulogic;
  signal TXSYNCALLIN_in : std_ulogic;
  signal TXSYNCIN_in : std_ulogic;
  signal TXSYNCMODE_in : std_ulogic;
  signal TXSYSCLKSEL_in : std_logic_vector(1 downto 0);
  signal TXUSERRDY_in : std_ulogic;
  signal TXUSRCLK2_in : std_ulogic;
  signal TXUSRCLK_in : std_ulogic;
  
  signal gt_intclk : std_ulogic; 
  signal gt_clk_int : std_ulogic; 
  
  -- start behavioral body
  begin
  glblGSR     <= TO_X01(GSR);
  BUFGTCE <= BUFGTCE_out;
  BUFGTCEMASK <= BUFGTCEMASK_out;
  BUFGTDIV <= BUFGTDIV_out;
  BUFGTRESET <= BUFGTRESET_out;
  BUFGTRSTMASK <= BUFGTRSTMASK_out;
  CPLLFBCLKLOST <= CPLLFBCLKLOST_out;
  CPLLLOCK <= CPLLLOCK_out;
  CPLLREFCLKLOST <= CPLLREFCLKLOST_out;
  DMONITOROUT <= DMONITOROUT_out;
  DMONITOROUTCLK <= DMONITOROUTCLK_out;
  DRPDO <= DRPDO_out;
  DRPRDY <= DRPRDY_out;
  EYESCANDATAERROR <= EYESCANDATAERROR_out;
  GTPOWERGOOD <= GTPOWERGOOD_out;
  GTREFCLKMONITOR <= GTREFCLKMONITOR_out;
  GTYTXN <= GTYTXN_out;
  GTYTXP <= GTYTXP_out;
  PCIERATEGEN3 <= PCIERATEGEN3_out;
  PCIERATEIDLE <= PCIERATEIDLE_out;
  PCIERATEQPLLPD <= PCIERATEQPLLPD_out;
  PCIERATEQPLLRESET <= PCIERATEQPLLRESET_out;
  PCIESYNCTXSYNCDONE <= PCIESYNCTXSYNCDONE_out;
  PCIEUSERGEN3RDY <= PCIEUSERGEN3RDY_out;
  PCIEUSERPHYSTATUSRST <= PCIEUSERPHYSTATUSRST_out;
  PCIEUSERRATESTART <= PCIEUSERRATESTART_out;
  PCSRSVDOUT <= PCSRSVDOUT_out;
  PHYSTATUS <= PHYSTATUS_out;
  PINRSRVDAS <= PINRSRVDAS_out;
  POWERPRESENT <= POWERPRESENT_out;
  RESETEXCEPTION <= RESETEXCEPTION_out;
  RXBUFSTATUS <= RXBUFSTATUS_out;
  RXBYTEISALIGNED <= RXBYTEISALIGNED_out;
  RXBYTEREALIGN <= RXBYTEREALIGN_out;
  RXCDRLOCK <= RXCDRLOCK_out;
  RXCDRPHDONE <= RXCDRPHDONE_out;
  RXCHANBONDSEQ <= RXCHANBONDSEQ_out;
  RXCHANISALIGNED <= RXCHANISALIGNED_out;
  RXCHANREALIGN <= RXCHANREALIGN_out;
  RXCHBONDO <= RXCHBONDO_out;
  RXCKCALDONE <= RXCKCALDONE_out;
  RXCLKCORCNT <= RXCLKCORCNT_out;
  RXCOMINITDET <= RXCOMINITDET_out;
  RXCOMMADET <= RXCOMMADET_out;
  RXCOMSASDET <= RXCOMSASDET_out;
  RXCOMWAKEDET <= RXCOMWAKEDET_out;
  RXCTRL0 <= RXCTRL0_out;
  RXCTRL1 <= RXCTRL1_out;
  RXCTRL2 <= RXCTRL2_out;
  RXCTRL3 <= RXCTRL3_out;
  RXDATA <= RXDATA_out;
  RXDATAEXTENDRSVD <= RXDATAEXTENDRSVD_out;
  RXDATAVALID <= RXDATAVALID_out;
  RXDLYSRESETDONE <= RXDLYSRESETDONE_out;
  RXELECIDLE <= RXELECIDLE_out;
  RXHEADER <= RXHEADER_out;
  RXHEADERVALID <= RXHEADERVALID_out;
  RXLFPSTRESETDET <= RXLFPSTRESETDET_out;
  RXLFPSU2LPEXITDET <= RXLFPSU2LPEXITDET_out;
  RXLFPSU3WAKEDET <= RXLFPSU3WAKEDET_out;
  RXMONITOROUT <= RXMONITOROUT_out;
  RXOSINTDONE <= RXOSINTDONE_out;
  RXOSINTSTARTED <= RXOSINTSTARTED_out;
  RXOSINTSTROBEDONE <= RXOSINTSTROBEDONE_out;
  RXOSINTSTROBESTARTED <= RXOSINTSTROBESTARTED_out;
  RXOUTCLK <= RXOUTCLK_out;
  RXOUTCLKFABRIC <= RXOUTCLKFABRIC_out;

  --EL
  --RXOUTCLKPCS <= RXOUTCLKPCS_out;
  RXOUTCLKPCS <= gt_intclk when (RXPD_in = "11") else RXOUTCLKPCS_out;

  RXPHALIGNDONE <= RXPHALIGNDONE_out;
  RXPHALIGNERR <= RXPHALIGNERR_out;
  RXPMARESETDONE <= RXPMARESETDONE_out;
  RXPRBSERR <= RXPRBSERR_out;
  RXPRBSLOCKED <= RXPRBSLOCKED_out;
  RXPRGDIVRESETDONE <= RXPRGDIVRESETDONE_out;
  RXRATEDONE <= RXRATEDONE_out;
  RXRECCLKOUT <= RXRECCLKOUT_out;
  RXRESETDONE <= RXRESETDONE_out;
  RXSLIDERDY <= RXSLIDERDY_out;
  RXSLIPDONE <= RXSLIPDONE_out;
  RXSLIPOUTCLKRDY <= RXSLIPOUTCLKRDY_out;
  RXSLIPPMARDY <= RXSLIPPMARDY_out;
  RXSTARTOFSEQ <= RXSTARTOFSEQ_out;
  RXSTATUS <= RXSTATUS_out;
  RXSYNCDONE <= RXSYNCDONE_out;
  RXSYNCOUT <= RXSYNCOUT_out;
  RXVALID <= RXVALID_out;
  TXBUFSTATUS <= TXBUFSTATUS_out;
  TXCOMFINISH <= TXCOMFINISH_out;
  TXDCCDONE <= TXDCCDONE_out;
  TXDLYSRESETDONE <= TXDLYSRESETDONE_out;

  --EL
  --TXOUTCLK <= TXOUTCLK_out;
  TXOUTCLK <= gt_intclk when ((TXPISOPD_in = '1') and (TXOUTCLKSEL_in = "101")) else TXOUTCLK_out;
 
  TXOUTCLKFABRIC <= TXOUTCLKFABRIC_out;
  TXOUTCLKPCS <= gt_intclk when (TXPISOPD_in = '1') else TXOUTCLKPCS_out;
  TXPHALIGNDONE <= TXPHALIGNDONE_out;
  TXPHINITDONE <= TXPHINITDONE_out;
  TXPMARESETDONE <= TXPMARESETDONE_out;
  TXPRGDIVRESETDONE <= TXPRGDIVRESETDONE_out;
  TXRATEDONE <= TXRATEDONE_out;
  TXRESETDONE <= TXRESETDONE_out;
  TXSYNCDONE <= TXSYNCDONE_out;
  TXSYNCOUT <= TXSYNCOUT_out;
  
  CDRSTEPDIR_in <= '0' when (CDRSTEPDIR = 'U') else CDRSTEPDIR; -- rv 0
  CDRSTEPSQ_in <= '0' when (CDRSTEPSQ = 'U') else CDRSTEPSQ; -- rv 0
  CDRSTEPSX_in <= '0' when (CDRSTEPSX = 'U') else CDRSTEPSX; -- rv 0
  CFGRESET_in <= '0' when (CFGRESET = 'U') else CFGRESET; -- rv 0
  CLKRSVD0_in <= '0' when (CLKRSVD0 = 'U') else CLKRSVD0; -- rv 0
  CLKRSVD1_in <= '0' when (CLKRSVD1 = 'U') else CLKRSVD1; -- rv 0
  CPLLFREQLOCK_in <= '0' when (CPLLFREQLOCK = 'U') else CPLLFREQLOCK; -- rv 0
  CPLLLOCKDETCLK_in <= '0' when (CPLLLOCKDETCLK = 'U') else CPLLLOCKDETCLK; -- rv 0
  CPLLLOCKEN_in <= '0' when (CPLLLOCKEN = 'U') else CPLLLOCKEN; -- rv 0
  CPLLPD_in <= '0' when (CPLLPD = 'U') else CPLLPD; -- rv 0
  CPLLREFCLKSEL_in(0) <= '1' when (CPLLREFCLKSEL(0) = 'U') else CPLLREFCLKSEL(0); -- rv 1
  CPLLREFCLKSEL_in(1) <= '0' when (CPLLREFCLKSEL(1) = 'U') else CPLLREFCLKSEL(1); -- rv 0
  CPLLREFCLKSEL_in(2) <= '0' when (CPLLREFCLKSEL(2) = 'U') else CPLLREFCLKSEL(2); -- rv 0
  CPLLRESET_in <= '0' when (CPLLRESET = 'U') else CPLLRESET; -- rv 0
  DMONFIFORESET_in <= '0' when (DMONFIFORESET = 'U') else DMONFIFORESET; -- rv 0
  DMONITORCLK_in <= '0' when (DMONITORCLK = 'U') else DMONITORCLK; -- rv 0
  DRPADDR_in(0) <= '0' when (DRPADDR(0) = 'U') else DRPADDR(0); -- rv 0
  DRPADDR_in(1) <= '0' when (DRPADDR(1) = 'U') else DRPADDR(1); -- rv 0
  DRPADDR_in(2) <= '0' when (DRPADDR(2) = 'U') else DRPADDR(2); -- rv 0
  DRPADDR_in(3) <= '0' when (DRPADDR(3) = 'U') else DRPADDR(3); -- rv 0
  DRPADDR_in(4) <= '0' when (DRPADDR(4) = 'U') else DRPADDR(4); -- rv 0
  DRPADDR_in(5) <= '0' when (DRPADDR(5) = 'U') else DRPADDR(5); -- rv 0
  DRPADDR_in(6) <= '0' when (DRPADDR(6) = 'U') else DRPADDR(6); -- rv 0
  DRPADDR_in(7) <= '0' when (DRPADDR(7) = 'U') else DRPADDR(7); -- rv 0
  DRPADDR_in(8) <= '0' when (DRPADDR(8) = 'U') else DRPADDR(8); -- rv 0
  DRPADDR_in(9) <= '0' when (DRPADDR(9) = 'U') else DRPADDR(9); -- rv 0
  DRPCLK_in <= '0' when (DRPCLK = 'U') else DRPCLK; -- rv 0
  DRPDI_in(0) <= '0' when (DRPDI(0) = 'U') else DRPDI(0); -- rv 0
  DRPDI_in(1) <= '0' when (DRPDI(1) = 'U') else DRPDI(1); -- rv 0
  DRPDI_in(10) <= '0' when (DRPDI(10) = 'U') else DRPDI(10); -- rv 0
  DRPDI_in(11) <= '0' when (DRPDI(11) = 'U') else DRPDI(11); -- rv 0
  DRPDI_in(12) <= '0' when (DRPDI(12) = 'U') else DRPDI(12); -- rv 0
  DRPDI_in(13) <= '0' when (DRPDI(13) = 'U') else DRPDI(13); -- rv 0
  DRPDI_in(14) <= '0' when (DRPDI(14) = 'U') else DRPDI(14); -- rv 0
  DRPDI_in(15) <= '0' when (DRPDI(15) = 'U') else DRPDI(15); -- rv 0
  DRPDI_in(2) <= '0' when (DRPDI(2) = 'U') else DRPDI(2); -- rv 0
  DRPDI_in(3) <= '0' when (DRPDI(3) = 'U') else DRPDI(3); -- rv 0
  DRPDI_in(4) <= '0' when (DRPDI(4) = 'U') else DRPDI(4); -- rv 0
  DRPDI_in(5) <= '0' when (DRPDI(5) = 'U') else DRPDI(5); -- rv 0
  DRPDI_in(6) <= '0' when (DRPDI(6) = 'U') else DRPDI(6); -- rv 0
  DRPDI_in(7) <= '0' when (DRPDI(7) = 'U') else DRPDI(7); -- rv 0
  DRPDI_in(8) <= '0' when (DRPDI(8) = 'U') else DRPDI(8); -- rv 0
  DRPDI_in(9) <= '0' when (DRPDI(9) = 'U') else DRPDI(9); -- rv 0
  DRPEN_in <= '0' when (DRPEN = 'U') else DRPEN; -- rv 0
  DRPRST_in <= '1' when (DRPRST = 'U') else DRPRST; -- rv 1
  DRPWE_in <= '0' when (DRPWE = 'U') else DRPWE; -- rv 0
  EYESCANRESET_in <= '0' when (EYESCANRESET = 'U') else EYESCANRESET; -- rv 0
  EYESCANTRIGGER_in <= '0' when (EYESCANTRIGGER = 'U') else EYESCANTRIGGER; -- rv 0
  FREQOS_in <= '0' when (FREQOS = 'U') else FREQOS; -- rv 0
  GTGREFCLK_in <= GTGREFCLK;
  GTNORTHREFCLK0_in <= GTNORTHREFCLK0;
  GTNORTHREFCLK1_in <= GTNORTHREFCLK1;
  GTREFCLK0_in <= GTREFCLK0;
  GTREFCLK1_in <= GTREFCLK1;
  GTRSVD_in(0) <= '0' when (GTRSVD(0) = 'U') else GTRSVD(0); -- rv 0
  GTRSVD_in(1) <= '0' when (GTRSVD(1) = 'U') else GTRSVD(1); -- rv 0
  GTRSVD_in(10) <= '0' when (GTRSVD(10) = 'U') else GTRSVD(10); -- rv 0
  GTRSVD_in(11) <= '0' when (GTRSVD(11) = 'U') else GTRSVD(11); -- rv 0
  GTRSVD_in(12) <= '0' when (GTRSVD(12) = 'U') else GTRSVD(12); -- rv 0
  GTRSVD_in(13) <= '0' when (GTRSVD(13) = 'U') else GTRSVD(13); -- rv 0
  GTRSVD_in(14) <= '0' when (GTRSVD(14) = 'U') else GTRSVD(14); -- rv 0
  GTRSVD_in(15) <= '0' when (GTRSVD(15) = 'U') else GTRSVD(15); -- rv 0
  GTRSVD_in(2) <= '0' when (GTRSVD(2) = 'U') else GTRSVD(2); -- rv 0
  GTRSVD_in(3) <= '0' when (GTRSVD(3) = 'U') else GTRSVD(3); -- rv 0
  GTRSVD_in(4) <= '0' when (GTRSVD(4) = 'U') else GTRSVD(4); -- rv 0
  GTRSVD_in(5) <= '0' when (GTRSVD(5) = 'U') else GTRSVD(5); -- rv 0
  GTRSVD_in(6) <= '0' when (GTRSVD(6) = 'U') else GTRSVD(6); -- rv 0
  GTRSVD_in(7) <= '0' when (GTRSVD(7) = 'U') else GTRSVD(7); -- rv 0
  GTRSVD_in(8) <= '0' when (GTRSVD(8) = 'U') else GTRSVD(8); -- rv 0
  GTRSVD_in(9) <= '0' when (GTRSVD(9) = 'U') else GTRSVD(9); -- rv 0
  GTRXRESETSEL_in <= '0' when (GTRXRESETSEL = 'U') else GTRXRESETSEL; -- rv 0
  GTRXRESET_in <= '0' when (GTRXRESET = 'U') else GTRXRESET; -- rv 0
  GTSOUTHREFCLK0_in <= GTSOUTHREFCLK0;
  GTSOUTHREFCLK1_in <= GTSOUTHREFCLK1;
  GTTXRESETSEL_in <= '0' when (GTTXRESETSEL = 'U') else GTTXRESETSEL; -- rv 0
  GTTXRESET_in <= '0' when (GTTXRESET = 'U') else GTTXRESET; -- rv 0
  GTYRXN_in <= GTYRXN;
  GTYRXP_in <= GTYRXP;
  INCPCTRL_in <= '0' when (INCPCTRL = 'U') else INCPCTRL; -- rv 0
  LOOPBACK_in(0) <= '0' when (LOOPBACK(0) = 'U') else LOOPBACK(0); -- rv 0
  LOOPBACK_in(1) <= '0' when (LOOPBACK(1) = 'U') else LOOPBACK(1); -- rv 0
  LOOPBACK_in(2) <= '0' when (LOOPBACK(2) = 'U') else LOOPBACK(2); -- rv 0
  PCIEEQRXEQADAPTDONE_in <= '0' when (PCIEEQRXEQADAPTDONE = 'U') else PCIEEQRXEQADAPTDONE; -- rv 0
  PCIERSTIDLE_in <= '0' when (PCIERSTIDLE = 'U') else PCIERSTIDLE; -- rv 0
  PCIERSTTXSYNCSTART_in <= '0' when (PCIERSTTXSYNCSTART = 'U') else PCIERSTTXSYNCSTART; -- rv 0
  PCIEUSERRATEDONE_in <= '0' when (PCIEUSERRATEDONE = 'U') else PCIEUSERRATEDONE; -- rv 0
  PCSRSVDIN_in(0) <= '1' when (PCSRSVDIN(0) = 'U') else PCSRSVDIN(0); -- rv 1
  PCSRSVDIN_in(1) <= '0' when (PCSRSVDIN(1) = 'U') else PCSRSVDIN(1); -- rv 0
  PCSRSVDIN_in(10) <= '0' when (PCSRSVDIN(10) = 'U') else PCSRSVDIN(10); -- rv 0
  PCSRSVDIN_in(11) <= '0' when (PCSRSVDIN(11) = 'U') else PCSRSVDIN(11); -- rv 0
  PCSRSVDIN_in(12) <= '0' when (PCSRSVDIN(12) = 'U') else PCSRSVDIN(12); -- rv 0
  PCSRSVDIN_in(13) <= '0' when (PCSRSVDIN(13) = 'U') else PCSRSVDIN(13); -- rv 0
  PCSRSVDIN_in(14) <= '0' when (PCSRSVDIN(14) = 'U') else PCSRSVDIN(14); -- rv 0
  PCSRSVDIN_in(15) <= '0' when (PCSRSVDIN(15) = 'U') else PCSRSVDIN(15); -- rv 0
  PCSRSVDIN_in(2) <= '0' when (PCSRSVDIN(2) = 'U') else PCSRSVDIN(2); -- rv 0
  PCSRSVDIN_in(3) <= '0' when (PCSRSVDIN(3) = 'U') else PCSRSVDIN(3); -- rv 0
  PCSRSVDIN_in(4) <= '0' when (PCSRSVDIN(4) = 'U') else PCSRSVDIN(4); -- rv 0
  PCSRSVDIN_in(5) <= '0' when (PCSRSVDIN(5) = 'U') else PCSRSVDIN(5); -- rv 0
  PCSRSVDIN_in(6) <= '0' when (PCSRSVDIN(6) = 'U') else PCSRSVDIN(6); -- rv 0
  PCSRSVDIN_in(7) <= '0' when (PCSRSVDIN(7) = 'U') else PCSRSVDIN(7); -- rv 0
  PCSRSVDIN_in(8) <= '0' when (PCSRSVDIN(8) = 'U') else PCSRSVDIN(8); -- rv 0
  PCSRSVDIN_in(9) <= '0' when (PCSRSVDIN(9) = 'U') else PCSRSVDIN(9); -- rv 0
  QPLL0CLK_in <= QPLL0CLK;
  QPLL0FREQLOCK_in <= '0' when (QPLL0FREQLOCK = 'U') else QPLL0FREQLOCK; -- rv 0
  QPLL0REFCLK_in <= QPLL0REFCLK;
  QPLL1CLK_in <= QPLL1CLK;
  QPLL1FREQLOCK_in <= '0' when (QPLL1FREQLOCK = 'U') else QPLL1FREQLOCK; -- rv 0
  QPLL1REFCLK_in <= QPLL1REFCLK;
  RESETOVRD_in <= '0' when (RESETOVRD = 'U') else RESETOVRD; -- rv 0
  RX8B10BEN_in <= '0' when (RX8B10BEN = 'U') else RX8B10BEN; -- rv 0
  RXAFECFOKEN_in <= '1' when (RXAFECFOKEN = 'U') else RXAFECFOKEN; -- rv 1
  RXBUFRESET_in <= '0' when (RXBUFRESET = 'U') else RXBUFRESET; -- rv 0
  RXCDRFREQRESET_in <= '0' when (RXCDRFREQRESET = 'U') else RXCDRFREQRESET; -- rv 0
  RXCDRHOLD_in <= '0' when (RXCDRHOLD = 'U') else RXCDRHOLD; -- rv 0
  RXCDROVRDEN_in <= '0' when (RXCDROVRDEN = 'U') else RXCDROVRDEN; -- rv 0
  RXCDRRESET_in <= '0' when (RXCDRRESET = 'U') else RXCDRRESET; -- rv 0
  RXCHBONDEN_in <= '0' when (RXCHBONDEN = 'U') else RXCHBONDEN; -- rv 0
  RXCHBONDI_in(0) <= '0' when (RXCHBONDI(0) = 'U') else RXCHBONDI(0); -- rv 0
  RXCHBONDI_in(1) <= '0' when (RXCHBONDI(1) = 'U') else RXCHBONDI(1); -- rv 0
  RXCHBONDI_in(2) <= '0' when (RXCHBONDI(2) = 'U') else RXCHBONDI(2); -- rv 0
  RXCHBONDI_in(3) <= '0' when (RXCHBONDI(3) = 'U') else RXCHBONDI(3); -- rv 0
  RXCHBONDI_in(4) <= '0' when (RXCHBONDI(4) = 'U') else RXCHBONDI(4); -- rv 0
  RXCHBONDLEVEL_in(0) <= '0' when (RXCHBONDLEVEL(0) = 'U') else RXCHBONDLEVEL(0); -- rv 0
  RXCHBONDLEVEL_in(1) <= '0' when (RXCHBONDLEVEL(1) = 'U') else RXCHBONDLEVEL(1); -- rv 0
  RXCHBONDLEVEL_in(2) <= '0' when (RXCHBONDLEVEL(2) = 'U') else RXCHBONDLEVEL(2); -- rv 0
  RXCHBONDMASTER_in <= '0' when (RXCHBONDMASTER = 'U') else RXCHBONDMASTER; -- rv 0
  RXCHBONDSLAVE_in <= '0' when (RXCHBONDSLAVE = 'U') else RXCHBONDSLAVE; -- rv 0
  RXCKCALRESET_in <= '0' when (RXCKCALRESET = 'U') else RXCKCALRESET; -- rv 0
  RXCKCALSTART_in(0) <= '0' when (RXCKCALSTART(0) = 'U') else RXCKCALSTART(0); -- rv 0
  RXCKCALSTART_in(1) <= '0' when (RXCKCALSTART(1) = 'U') else RXCKCALSTART(1); -- rv 0
  RXCKCALSTART_in(2) <= '0' when (RXCKCALSTART(2) = 'U') else RXCKCALSTART(2); -- rv 0
  RXCKCALSTART_in(3) <= '0' when (RXCKCALSTART(3) = 'U') else RXCKCALSTART(3); -- rv 0
  RXCKCALSTART_in(4) <= '0' when (RXCKCALSTART(4) = 'U') else RXCKCALSTART(4); -- rv 0
  RXCKCALSTART_in(5) <= '0' when (RXCKCALSTART(5) = 'U') else RXCKCALSTART(5); -- rv 0
  RXCKCALSTART_in(6) <= '0' when (RXCKCALSTART(6) = 'U') else RXCKCALSTART(6); -- rv 0
  RXCOMMADETEN_in <= '0' when (RXCOMMADETEN = 'U') else RXCOMMADETEN; -- rv 0
  RXDFEAGCHOLD_in <= '0' when (RXDFEAGCHOLD = 'U') else RXDFEAGCHOLD; -- rv 0
  RXDFEAGCOVRDEN_in <= '0' when (RXDFEAGCOVRDEN = 'U') else RXDFEAGCOVRDEN; -- rv 0
  RXDFECFOKFCNUM_in(0) <= '0' when (RXDFECFOKFCNUM(0) = 'U') else RXDFECFOKFCNUM(0); -- rv 0
  RXDFECFOKFCNUM_in(1) <= '1' when (RXDFECFOKFCNUM(1) = 'U') else RXDFECFOKFCNUM(1); -- rv 1
  RXDFECFOKFCNUM_in(2) <= '1' when (RXDFECFOKFCNUM(2) = 'U') else RXDFECFOKFCNUM(2); -- rv 1
  RXDFECFOKFCNUM_in(3) <= '0' when (RXDFECFOKFCNUM(3) = 'U') else RXDFECFOKFCNUM(3); -- rv 0
  RXDFECFOKFEN_in <= '0' when (RXDFECFOKFEN = 'U') else RXDFECFOKFEN; -- rv 0
  RXDFECFOKFPULSE_in <= '0' when (RXDFECFOKFPULSE = 'U') else RXDFECFOKFPULSE; -- rv 0
  RXDFECFOKHOLD_in <= '0' when (RXDFECFOKHOLD = 'U') else RXDFECFOKHOLD; -- rv 0
  RXDFECFOKOVREN_in <= '0' when (RXDFECFOKOVREN = 'U') else RXDFECFOKOVREN; -- rv 0
  RXDFEKHHOLD_in <= '0' when (RXDFEKHHOLD = 'U') else RXDFEKHHOLD; -- rv 0
  RXDFEKHOVRDEN_in <= '0' when (RXDFEKHOVRDEN = 'U') else RXDFEKHOVRDEN; -- rv 0
  RXDFELFHOLD_in <= '0' when (RXDFELFHOLD = 'U') else RXDFELFHOLD; -- rv 0
  RXDFELFOVRDEN_in <= '0' when (RXDFELFOVRDEN = 'U') else RXDFELFOVRDEN; -- rv 0
  RXDFELPMRESET_in <= '0' when (RXDFELPMRESET = 'U') else RXDFELPMRESET; -- rv 0
  RXDFETAP10HOLD_in <= '0' when (RXDFETAP10HOLD = 'U') else RXDFETAP10HOLD; -- rv 0
  RXDFETAP10OVRDEN_in <= '0' when (RXDFETAP10OVRDEN = 'U') else RXDFETAP10OVRDEN; -- rv 0
  RXDFETAP11HOLD_in <= '0' when (RXDFETAP11HOLD = 'U') else RXDFETAP11HOLD; -- rv 0
  RXDFETAP11OVRDEN_in <= '0' when (RXDFETAP11OVRDEN = 'U') else RXDFETAP11OVRDEN; -- rv 0
  RXDFETAP12HOLD_in <= '0' when (RXDFETAP12HOLD = 'U') else RXDFETAP12HOLD; -- rv 0
  RXDFETAP12OVRDEN_in <= '0' when (RXDFETAP12OVRDEN = 'U') else RXDFETAP12OVRDEN; -- rv 0
  RXDFETAP13HOLD_in <= '0' when (RXDFETAP13HOLD = 'U') else RXDFETAP13HOLD; -- rv 0
  RXDFETAP13OVRDEN_in <= '0' when (RXDFETAP13OVRDEN = 'U') else RXDFETAP13OVRDEN; -- rv 0
  RXDFETAP14HOLD_in <= '0' when (RXDFETAP14HOLD = 'U') else RXDFETAP14HOLD; -- rv 0
  RXDFETAP14OVRDEN_in <= '0' when (RXDFETAP14OVRDEN = 'U') else RXDFETAP14OVRDEN; -- rv 0
  RXDFETAP15HOLD_in <= '0' when (RXDFETAP15HOLD = 'U') else RXDFETAP15HOLD; -- rv 0
  RXDFETAP15OVRDEN_in <= '0' when (RXDFETAP15OVRDEN = 'U') else RXDFETAP15OVRDEN; -- rv 0
  RXDFETAP2HOLD_in <= '0' when (RXDFETAP2HOLD = 'U') else RXDFETAP2HOLD; -- rv 0
  RXDFETAP2OVRDEN_in <= '0' when (RXDFETAP2OVRDEN = 'U') else RXDFETAP2OVRDEN; -- rv 0
  RXDFETAP3HOLD_in <= '0' when (RXDFETAP3HOLD = 'U') else RXDFETAP3HOLD; -- rv 0
  RXDFETAP3OVRDEN_in <= '0' when (RXDFETAP3OVRDEN = 'U') else RXDFETAP3OVRDEN; -- rv 0
  RXDFETAP4HOLD_in <= '0' when (RXDFETAP4HOLD = 'U') else RXDFETAP4HOLD; -- rv 0
  RXDFETAP4OVRDEN_in <= '0' when (RXDFETAP4OVRDEN = 'U') else RXDFETAP4OVRDEN; -- rv 0
  RXDFETAP5HOLD_in <= '0' when (RXDFETAP5HOLD = 'U') else RXDFETAP5HOLD; -- rv 0
  RXDFETAP5OVRDEN_in <= '0' when (RXDFETAP5OVRDEN = 'U') else RXDFETAP5OVRDEN; -- rv 0
  RXDFETAP6HOLD_in <= '0' when (RXDFETAP6HOLD = 'U') else RXDFETAP6HOLD; -- rv 0
  RXDFETAP6OVRDEN_in <= '0' when (RXDFETAP6OVRDEN = 'U') else RXDFETAP6OVRDEN; -- rv 0
  RXDFETAP7HOLD_in <= '0' when (RXDFETAP7HOLD = 'U') else RXDFETAP7HOLD; -- rv 0
  RXDFETAP7OVRDEN_in <= '0' when (RXDFETAP7OVRDEN = 'U') else RXDFETAP7OVRDEN; -- rv 0
  RXDFETAP8HOLD_in <= '0' when (RXDFETAP8HOLD = 'U') else RXDFETAP8HOLD; -- rv 0
  RXDFETAP8OVRDEN_in <= '0' when (RXDFETAP8OVRDEN = 'U') else RXDFETAP8OVRDEN; -- rv 0
  RXDFETAP9HOLD_in <= '0' when (RXDFETAP9HOLD = 'U') else RXDFETAP9HOLD; -- rv 0
  RXDFETAP9OVRDEN_in <= '0' when (RXDFETAP9OVRDEN = 'U') else RXDFETAP9OVRDEN; -- rv 0
  RXDFEUTHOLD_in <= '0' when (RXDFEUTHOLD = 'U') else RXDFEUTHOLD; -- rv 0
  RXDFEUTOVRDEN_in <= '0' when (RXDFEUTOVRDEN = 'U') else RXDFEUTOVRDEN; -- rv 0
  RXDFEVPHOLD_in <= '0' when (RXDFEVPHOLD = 'U') else RXDFEVPHOLD; -- rv 0
  RXDFEVPOVRDEN_in <= '0' when (RXDFEVPOVRDEN = 'U') else RXDFEVPOVRDEN; -- rv 0
  RXDFEXYDEN_in <= '0' when (RXDFEXYDEN = 'U') else RXDFEXYDEN; -- rv 0
  RXDLYBYPASS_in <= '0' when (RXDLYBYPASS = 'U') else RXDLYBYPASS; -- rv 0
  RXDLYEN_in <= '0' when (RXDLYEN = 'U') else RXDLYEN; -- rv 0
  RXDLYOVRDEN_in <= '0' when (RXDLYOVRDEN = 'U') else RXDLYOVRDEN; -- rv 0
  RXDLYSRESET_in <= '0' when (RXDLYSRESET = 'U') else RXDLYSRESET; -- rv 0
  RXELECIDLEMODE_in(0) <= '0' when (RXELECIDLEMODE(0) = 'U') else RXELECIDLEMODE(0); -- rv 0
  RXELECIDLEMODE_in(1) <= '0' when (RXELECIDLEMODE(1) = 'U') else RXELECIDLEMODE(1); -- rv 0
  RXEQTRAINING_in <= '0' when (RXEQTRAINING = 'U') else RXEQTRAINING; -- rv 0
  RXGEARBOXSLIP_in <= '0' when (RXGEARBOXSLIP = 'U') else RXGEARBOXSLIP; -- rv 0
  RXLATCLK_in <= '0' when (RXLATCLK = 'U') else RXLATCLK; -- rv 0
  RXLPMEN_in <= '0' when (RXLPMEN = 'U') else RXLPMEN; -- rv 0
  RXLPMGCHOLD_in <= '0' when (RXLPMGCHOLD = 'U') else RXLPMGCHOLD; -- rv 0
  RXLPMGCOVRDEN_in <= '0' when (RXLPMGCOVRDEN = 'U') else RXLPMGCOVRDEN; -- rv 0
  RXLPMHFHOLD_in <= '0' when (RXLPMHFHOLD = 'U') else RXLPMHFHOLD; -- rv 0
  RXLPMHFOVRDEN_in <= '0' when (RXLPMHFOVRDEN = 'U') else RXLPMHFOVRDEN; -- rv 0
  RXLPMLFHOLD_in <= '0' when (RXLPMLFHOLD = 'U') else RXLPMLFHOLD; -- rv 0
  RXLPMLFKLOVRDEN_in <= '0' when (RXLPMLFKLOVRDEN = 'U') else RXLPMLFKLOVRDEN; -- rv 0
  RXLPMOSHOLD_in <= '0' when (RXLPMOSHOLD = 'U') else RXLPMOSHOLD; -- rv 0
  RXLPMOSOVRDEN_in <= '0' when (RXLPMOSOVRDEN = 'U') else RXLPMOSOVRDEN; -- rv 0
  RXMCOMMAALIGNEN_in <= '0' when (RXMCOMMAALIGNEN = 'U') else RXMCOMMAALIGNEN; -- rv 0
  RXMONITORSEL_in(0) <= '0' when (RXMONITORSEL(0) = 'U') else RXMONITORSEL(0); -- rv 0
  RXMONITORSEL_in(1) <= '0' when (RXMONITORSEL(1) = 'U') else RXMONITORSEL(1); -- rv 0
  RXOOBRESET_in <= '0' when (RXOOBRESET = 'U') else RXOOBRESET; -- rv 0
  RXOSCALRESET_in <= '0' when (RXOSCALRESET = 'U') else RXOSCALRESET; -- rv 0
  RXOSHOLD_in <= '0' when (RXOSHOLD = 'U') else RXOSHOLD; -- rv 0
  RXOSOVRDEN_in <= '0' when (RXOSOVRDEN = 'U') else RXOSOVRDEN; -- rv 0
  RXOUTCLKSEL_in(0) <= '0' when (RXOUTCLKSEL(0) = 'U') else RXOUTCLKSEL(0); -- rv 0
  RXOUTCLKSEL_in(1) <= '0' when (RXOUTCLKSEL(1) = 'U') else RXOUTCLKSEL(1); -- rv 0
  RXOUTCLKSEL_in(2) <= '0' when (RXOUTCLKSEL(2) = 'U') else RXOUTCLKSEL(2); -- rv 0
  RXPCOMMAALIGNEN_in <= '0' when (RXPCOMMAALIGNEN = 'U') else RXPCOMMAALIGNEN; -- rv 0
  RXPCSRESET_in <= '0' when (RXPCSRESET = 'U') else RXPCSRESET; -- rv 0
  RXPD_in(0) <= '0' when (RXPD(0) = 'U') else RXPD(0); -- rv 0
  RXPD_in(1) <= '0' when (RXPD(1) = 'U') else RXPD(1); -- rv 0
  RXPHALIGNEN_in <= '0' when (RXPHALIGNEN = 'U') else RXPHALIGNEN; -- rv 0
  RXPHALIGN_in <= '0' when (RXPHALIGN = 'U') else RXPHALIGN; -- rv 0
  RXPHDLYPD_in <= '0' when (RXPHDLYPD = 'U') else RXPHDLYPD; -- rv 0
  RXPHDLYRESET_in <= '0' when (RXPHDLYRESET = 'U') else RXPHDLYRESET; -- rv 0
  RXPLLCLKSEL_in(0) <= '0' when (RXPLLCLKSEL(0) = 'U') else RXPLLCLKSEL(0); -- rv 0
  RXPLLCLKSEL_in(1) <= '0' when (RXPLLCLKSEL(1) = 'U') else RXPLLCLKSEL(1); -- rv 0
  RXPMARESET_in <= '0' when (RXPMARESET = 'U') else RXPMARESET; -- rv 0
  RXPOLARITY_in <= '0' when (RXPOLARITY = 'U') else RXPOLARITY; -- rv 0
  RXPRBSCNTRESET_in <= '0' when (RXPRBSCNTRESET = 'U') else RXPRBSCNTRESET; -- rv 0
  RXPRBSSEL_in(0) <= '0' when (RXPRBSSEL(0) = 'U') else RXPRBSSEL(0); -- rv 0
  RXPRBSSEL_in(1) <= '0' when (RXPRBSSEL(1) = 'U') else RXPRBSSEL(1); -- rv 0
  RXPRBSSEL_in(2) <= '0' when (RXPRBSSEL(2) = 'U') else RXPRBSSEL(2); -- rv 0
  RXPRBSSEL_in(3) <= '0' when (RXPRBSSEL(3) = 'U') else RXPRBSSEL(3); -- rv 0
  RXPROGDIVRESET_in <= '0' when (RXPROGDIVRESET = 'U') else RXPROGDIVRESET; -- rv 0
  RXRATEMODE_in <= '0' when (RXRATEMODE = 'U') else RXRATEMODE; -- rv 0
  RXRATE_in(0) <= '0' when (RXRATE(0) = 'U') else RXRATE(0); -- rv 0
  RXRATE_in(1) <= '0' when (RXRATE(1) = 'U') else RXRATE(1); -- rv 0
  RXRATE_in(2) <= '0' when (RXRATE(2) = 'U') else RXRATE(2); -- rv 0
  RXSLIDE_in <= '0' when (RXSLIDE = 'U') else RXSLIDE; -- rv 0
  RXSLIPOUTCLK_in <= '0' when (RXSLIPOUTCLK = 'U') else RXSLIPOUTCLK; -- rv 0
  RXSLIPPMA_in <= '0' when (RXSLIPPMA = 'U') else RXSLIPPMA; -- rv 0
  RXSYNCALLIN_in <= '0' when (RXSYNCALLIN = 'U') else RXSYNCALLIN; -- rv 0
  RXSYNCIN_in <= '0' when (RXSYNCIN = 'U') else RXSYNCIN; -- rv 0
  RXSYNCMODE_in <= '1' when (RXSYNCMODE = 'U') else RXSYNCMODE; -- rv 1
  RXSYSCLKSEL_in(0) <= '0' when (RXSYSCLKSEL(0) = 'U') else RXSYSCLKSEL(0); -- rv 0
  RXSYSCLKSEL_in(1) <= '0' when (RXSYSCLKSEL(1) = 'U') else RXSYSCLKSEL(1); -- rv 0
  RXTERMINATION_in <= '0' when (RXTERMINATION = 'U') else RXTERMINATION; -- rv 0
  RXUSERRDY_in <= '0' when (RXUSERRDY = 'U') else RXUSERRDY; -- rv 0
  RXUSRCLK2_in <= '0' when (RXUSRCLK2 = 'U') else RXUSRCLK2; -- rv 0
  RXUSRCLK_in <= '0' when (RXUSRCLK = 'U') else RXUSRCLK; -- rv 0
  SIGVALIDCLK_in <= '0' when (SIGVALIDCLK = 'U') else SIGVALIDCLK; -- rv 0
  TSTIN_in(0) <= '0' when (TSTIN(0) = 'U') else TSTIN(0); -- rv 0
  TSTIN_in(1) <= '0' when (TSTIN(1) = 'U') else TSTIN(1); -- rv 0
  TSTIN_in(10) <= '0' when (TSTIN(10) = 'U') else TSTIN(10); -- rv 0
  TSTIN_in(11) <= '0' when (TSTIN(11) = 'U') else TSTIN(11); -- rv 0
  TSTIN_in(12) <= '0' when (TSTIN(12) = 'U') else TSTIN(12); -- rv 0
  TSTIN_in(13) <= '0' when (TSTIN(13) = 'U') else TSTIN(13); -- rv 0
  TSTIN_in(14) <= '0' when (TSTIN(14) = 'U') else TSTIN(14); -- rv 0
  TSTIN_in(15) <= '0' when (TSTIN(15) = 'U') else TSTIN(15); -- rv 0
  TSTIN_in(16) <= '0' when (TSTIN(16) = 'U') else TSTIN(16); -- rv 0
  TSTIN_in(17) <= '0' when (TSTIN(17) = 'U') else TSTIN(17); -- rv 0
  TSTIN_in(18) <= '0' when (TSTIN(18) = 'U') else TSTIN(18); -- rv 0
  TSTIN_in(19) <= '0' when (TSTIN(19) = 'U') else TSTIN(19); -- rv 0
  TSTIN_in(2) <= '0' when (TSTIN(2) = 'U') else TSTIN(2); -- rv 0
  TSTIN_in(3) <= '0' when (TSTIN(3) = 'U') else TSTIN(3); -- rv 0
  TSTIN_in(4) <= '0' when (TSTIN(4) = 'U') else TSTIN(4); -- rv 0
  TSTIN_in(5) <= '0' when (TSTIN(5) = 'U') else TSTIN(5); -- rv 0
  TSTIN_in(6) <= '0' when (TSTIN(6) = 'U') else TSTIN(6); -- rv 0
  TSTIN_in(7) <= '0' when (TSTIN(7) = 'U') else TSTIN(7); -- rv 0
  TSTIN_in(8) <= '0' when (TSTIN(8) = 'U') else TSTIN(8); -- rv 0
  TSTIN_in(9) <= '0' when (TSTIN(9) = 'U') else TSTIN(9); -- rv 0
  TX8B10BBYPASS_in(0) <= '0' when (TX8B10BBYPASS(0) = 'U') else TX8B10BBYPASS(0); -- rv 0
  TX8B10BBYPASS_in(1) <= '0' when (TX8B10BBYPASS(1) = 'U') else TX8B10BBYPASS(1); -- rv 0
  TX8B10BBYPASS_in(2) <= '0' when (TX8B10BBYPASS(2) = 'U') else TX8B10BBYPASS(2); -- rv 0
  TX8B10BBYPASS_in(3) <= '0' when (TX8B10BBYPASS(3) = 'U') else TX8B10BBYPASS(3); -- rv 0
  TX8B10BBYPASS_in(4) <= '0' when (TX8B10BBYPASS(4) = 'U') else TX8B10BBYPASS(4); -- rv 0
  TX8B10BBYPASS_in(5) <= '0' when (TX8B10BBYPASS(5) = 'U') else TX8B10BBYPASS(5); -- rv 0
  TX8B10BBYPASS_in(6) <= '0' when (TX8B10BBYPASS(6) = 'U') else TX8B10BBYPASS(6); -- rv 0
  TX8B10BBYPASS_in(7) <= '0' when (TX8B10BBYPASS(7) = 'U') else TX8B10BBYPASS(7); -- rv 0
  TX8B10BEN_in <= '0' when (TX8B10BEN = 'U') else TX8B10BEN; -- rv 0
  TXCOMINIT_in <= '0' when (TXCOMINIT = 'U') else TXCOMINIT; -- rv 0
  TXCOMSAS_in <= '0' when (TXCOMSAS = 'U') else TXCOMSAS; -- rv 0
  TXCOMWAKE_in <= '0' when (TXCOMWAKE = 'U') else TXCOMWAKE; -- rv 0
  TXCTRL0_in(0) <= '0' when (TXCTRL0(0) = 'U') else TXCTRL0(0); -- rv 0
  TXCTRL0_in(1) <= '0' when (TXCTRL0(1) = 'U') else TXCTRL0(1); -- rv 0
  TXCTRL0_in(10) <= '0' when (TXCTRL0(10) = 'U') else TXCTRL0(10); -- rv 0
  TXCTRL0_in(11) <= '0' when (TXCTRL0(11) = 'U') else TXCTRL0(11); -- rv 0
  TXCTRL0_in(12) <= '0' when (TXCTRL0(12) = 'U') else TXCTRL0(12); -- rv 0
  TXCTRL0_in(13) <= '0' when (TXCTRL0(13) = 'U') else TXCTRL0(13); -- rv 0
  TXCTRL0_in(14) <= '0' when (TXCTRL0(14) = 'U') else TXCTRL0(14); -- rv 0
  TXCTRL0_in(15) <= '0' when (TXCTRL0(15) = 'U') else TXCTRL0(15); -- rv 0
  TXCTRL0_in(2) <= '0' when (TXCTRL0(2) = 'U') else TXCTRL0(2); -- rv 0
  TXCTRL0_in(3) <= '0' when (TXCTRL0(3) = 'U') else TXCTRL0(3); -- rv 0
  TXCTRL0_in(4) <= '0' when (TXCTRL0(4) = 'U') else TXCTRL0(4); -- rv 0
  TXCTRL0_in(5) <= '0' when (TXCTRL0(5) = 'U') else TXCTRL0(5); -- rv 0
  TXCTRL0_in(6) <= '0' when (TXCTRL0(6) = 'U') else TXCTRL0(6); -- rv 0
  TXCTRL0_in(7) <= '0' when (TXCTRL0(7) = 'U') else TXCTRL0(7); -- rv 0
  TXCTRL0_in(8) <= '0' when (TXCTRL0(8) = 'U') else TXCTRL0(8); -- rv 0
  TXCTRL0_in(9) <= '0' when (TXCTRL0(9) = 'U') else TXCTRL0(9); -- rv 0
  TXCTRL1_in(0) <= '0' when (TXCTRL1(0) = 'U') else TXCTRL1(0); -- rv 0
  TXCTRL1_in(1) <= '0' when (TXCTRL1(1) = 'U') else TXCTRL1(1); -- rv 0
  TXCTRL1_in(10) <= '0' when (TXCTRL1(10) = 'U') else TXCTRL1(10); -- rv 0
  TXCTRL1_in(11) <= '0' when (TXCTRL1(11) = 'U') else TXCTRL1(11); -- rv 0
  TXCTRL1_in(12) <= '0' when (TXCTRL1(12) = 'U') else TXCTRL1(12); -- rv 0
  TXCTRL1_in(13) <= '0' when (TXCTRL1(13) = 'U') else TXCTRL1(13); -- rv 0
  TXCTRL1_in(14) <= '0' when (TXCTRL1(14) = 'U') else TXCTRL1(14); -- rv 0
  TXCTRL1_in(15) <= '0' when (TXCTRL1(15) = 'U') else TXCTRL1(15); -- rv 0
  TXCTRL1_in(2) <= '0' when (TXCTRL1(2) = 'U') else TXCTRL1(2); -- rv 0
  TXCTRL1_in(3) <= '0' when (TXCTRL1(3) = 'U') else TXCTRL1(3); -- rv 0
  TXCTRL1_in(4) <= '0' when (TXCTRL1(4) = 'U') else TXCTRL1(4); -- rv 0
  TXCTRL1_in(5) <= '0' when (TXCTRL1(5) = 'U') else TXCTRL1(5); -- rv 0
  TXCTRL1_in(6) <= '0' when (TXCTRL1(6) = 'U') else TXCTRL1(6); -- rv 0
  TXCTRL1_in(7) <= '0' when (TXCTRL1(7) = 'U') else TXCTRL1(7); -- rv 0
  TXCTRL1_in(8) <= '0' when (TXCTRL1(8) = 'U') else TXCTRL1(8); -- rv 0
  TXCTRL1_in(9) <= '0' when (TXCTRL1(9) = 'U') else TXCTRL1(9); -- rv 0
  TXCTRL2_in(0) <= '0' when (TXCTRL2(0) = 'U') else TXCTRL2(0); -- rv 0
  TXCTRL2_in(1) <= '0' when (TXCTRL2(1) = 'U') else TXCTRL2(1); -- rv 0
  TXCTRL2_in(2) <= '0' when (TXCTRL2(2) = 'U') else TXCTRL2(2); -- rv 0
  TXCTRL2_in(3) <= '0' when (TXCTRL2(3) = 'U') else TXCTRL2(3); -- rv 0
  TXCTRL2_in(4) <= '0' when (TXCTRL2(4) = 'U') else TXCTRL2(4); -- rv 0
  TXCTRL2_in(5) <= '0' when (TXCTRL2(5) = 'U') else TXCTRL2(5); -- rv 0
  TXCTRL2_in(6) <= '0' when (TXCTRL2(6) = 'U') else TXCTRL2(6); -- rv 0
  TXCTRL2_in(7) <= '0' when (TXCTRL2(7) = 'U') else TXCTRL2(7); -- rv 0
  TXDATAEXTENDRSVD_in(0) <= '0' when (TXDATAEXTENDRSVD(0) = 'U') else TXDATAEXTENDRSVD(0); -- rv 0
  TXDATAEXTENDRSVD_in(1) <= '0' when (TXDATAEXTENDRSVD(1) = 'U') else TXDATAEXTENDRSVD(1); -- rv 0
  TXDATAEXTENDRSVD_in(2) <= '0' when (TXDATAEXTENDRSVD(2) = 'U') else TXDATAEXTENDRSVD(2); -- rv 0
  TXDATAEXTENDRSVD_in(3) <= '0' when (TXDATAEXTENDRSVD(3) = 'U') else TXDATAEXTENDRSVD(3); -- rv 0
  TXDATAEXTENDRSVD_in(4) <= '0' when (TXDATAEXTENDRSVD(4) = 'U') else TXDATAEXTENDRSVD(4); -- rv 0
  TXDATAEXTENDRSVD_in(5) <= '0' when (TXDATAEXTENDRSVD(5) = 'U') else TXDATAEXTENDRSVD(5); -- rv 0
  TXDATAEXTENDRSVD_in(6) <= '0' when (TXDATAEXTENDRSVD(6) = 'U') else TXDATAEXTENDRSVD(6); -- rv 0
  TXDATAEXTENDRSVD_in(7) <= '0' when (TXDATAEXTENDRSVD(7) = 'U') else TXDATAEXTENDRSVD(7); -- rv 0
  TXDATA_in(0) <= '0' when (TXDATA(0) = 'U') else TXDATA(0); -- rv 0
  TXDATA_in(1) <= '0' when (TXDATA(1) = 'U') else TXDATA(1); -- rv 0
  TXDATA_in(10) <= '0' when (TXDATA(10) = 'U') else TXDATA(10); -- rv 0
  TXDATA_in(100) <= '0' when (TXDATA(100) = 'U') else TXDATA(100); -- rv 0
  TXDATA_in(101) <= '0' when (TXDATA(101) = 'U') else TXDATA(101); -- rv 0
  TXDATA_in(102) <= '0' when (TXDATA(102) = 'U') else TXDATA(102); -- rv 0
  TXDATA_in(103) <= '0' when (TXDATA(103) = 'U') else TXDATA(103); -- rv 0
  TXDATA_in(104) <= '0' when (TXDATA(104) = 'U') else TXDATA(104); -- rv 0
  TXDATA_in(105) <= '0' when (TXDATA(105) = 'U') else TXDATA(105); -- rv 0
  TXDATA_in(106) <= '0' when (TXDATA(106) = 'U') else TXDATA(106); -- rv 0
  TXDATA_in(107) <= '0' when (TXDATA(107) = 'U') else TXDATA(107); -- rv 0
  TXDATA_in(108) <= '0' when (TXDATA(108) = 'U') else TXDATA(108); -- rv 0
  TXDATA_in(109) <= '0' when (TXDATA(109) = 'U') else TXDATA(109); -- rv 0
  TXDATA_in(11) <= '0' when (TXDATA(11) = 'U') else TXDATA(11); -- rv 0
  TXDATA_in(110) <= '0' when (TXDATA(110) = 'U') else TXDATA(110); -- rv 0
  TXDATA_in(111) <= '0' when (TXDATA(111) = 'U') else TXDATA(111); -- rv 0
  TXDATA_in(112) <= '0' when (TXDATA(112) = 'U') else TXDATA(112); -- rv 0
  TXDATA_in(113) <= '0' when (TXDATA(113) = 'U') else TXDATA(113); -- rv 0
  TXDATA_in(114) <= '0' when (TXDATA(114) = 'U') else TXDATA(114); -- rv 0
  TXDATA_in(115) <= '0' when (TXDATA(115) = 'U') else TXDATA(115); -- rv 0
  TXDATA_in(116) <= '0' when (TXDATA(116) = 'U') else TXDATA(116); -- rv 0
  TXDATA_in(117) <= '0' when (TXDATA(117) = 'U') else TXDATA(117); -- rv 0
  TXDATA_in(118) <= '0' when (TXDATA(118) = 'U') else TXDATA(118); -- rv 0
  TXDATA_in(119) <= '0' when (TXDATA(119) = 'U') else TXDATA(119); -- rv 0
  TXDATA_in(12) <= '0' when (TXDATA(12) = 'U') else TXDATA(12); -- rv 0
  TXDATA_in(120) <= '0' when (TXDATA(120) = 'U') else TXDATA(120); -- rv 0
  TXDATA_in(121) <= '0' when (TXDATA(121) = 'U') else TXDATA(121); -- rv 0
  TXDATA_in(122) <= '0' when (TXDATA(122) = 'U') else TXDATA(122); -- rv 0
  TXDATA_in(123) <= '0' when (TXDATA(123) = 'U') else TXDATA(123); -- rv 0
  TXDATA_in(124) <= '0' when (TXDATA(124) = 'U') else TXDATA(124); -- rv 0
  TXDATA_in(125) <= '0' when (TXDATA(125) = 'U') else TXDATA(125); -- rv 0
  TXDATA_in(126) <= '0' when (TXDATA(126) = 'U') else TXDATA(126); -- rv 0
  TXDATA_in(127) <= '0' when (TXDATA(127) = 'U') else TXDATA(127); -- rv 0
  TXDATA_in(13) <= '0' when (TXDATA(13) = 'U') else TXDATA(13); -- rv 0
  TXDATA_in(14) <= '0' when (TXDATA(14) = 'U') else TXDATA(14); -- rv 0
  TXDATA_in(15) <= '0' when (TXDATA(15) = 'U') else TXDATA(15); -- rv 0
  TXDATA_in(16) <= '0' when (TXDATA(16) = 'U') else TXDATA(16); -- rv 0
  TXDATA_in(17) <= '0' when (TXDATA(17) = 'U') else TXDATA(17); -- rv 0
  TXDATA_in(18) <= '0' when (TXDATA(18) = 'U') else TXDATA(18); -- rv 0
  TXDATA_in(19) <= '0' when (TXDATA(19) = 'U') else TXDATA(19); -- rv 0
  TXDATA_in(2) <= '0' when (TXDATA(2) = 'U') else TXDATA(2); -- rv 0
  TXDATA_in(20) <= '0' when (TXDATA(20) = 'U') else TXDATA(20); -- rv 0
  TXDATA_in(21) <= '0' when (TXDATA(21) = 'U') else TXDATA(21); -- rv 0
  TXDATA_in(22) <= '0' when (TXDATA(22) = 'U') else TXDATA(22); -- rv 0
  TXDATA_in(23) <= '0' when (TXDATA(23) = 'U') else TXDATA(23); -- rv 0
  TXDATA_in(24) <= '0' when (TXDATA(24) = 'U') else TXDATA(24); -- rv 0
  TXDATA_in(25) <= '0' when (TXDATA(25) = 'U') else TXDATA(25); -- rv 0
  TXDATA_in(26) <= '0' when (TXDATA(26) = 'U') else TXDATA(26); -- rv 0
  TXDATA_in(27) <= '0' when (TXDATA(27) = 'U') else TXDATA(27); -- rv 0
  TXDATA_in(28) <= '0' when (TXDATA(28) = 'U') else TXDATA(28); -- rv 0
  TXDATA_in(29) <= '0' when (TXDATA(29) = 'U') else TXDATA(29); -- rv 0
  TXDATA_in(3) <= '0' when (TXDATA(3) = 'U') else TXDATA(3); -- rv 0
  TXDATA_in(30) <= '0' when (TXDATA(30) = 'U') else TXDATA(30); -- rv 0
  TXDATA_in(31) <= '0' when (TXDATA(31) = 'U') else TXDATA(31); -- rv 0
  TXDATA_in(32) <= '0' when (TXDATA(32) = 'U') else TXDATA(32); -- rv 0
  TXDATA_in(33) <= '0' when (TXDATA(33) = 'U') else TXDATA(33); -- rv 0
  TXDATA_in(34) <= '0' when (TXDATA(34) = 'U') else TXDATA(34); -- rv 0
  TXDATA_in(35) <= '0' when (TXDATA(35) = 'U') else TXDATA(35); -- rv 0
  TXDATA_in(36) <= '0' when (TXDATA(36) = 'U') else TXDATA(36); -- rv 0
  TXDATA_in(37) <= '0' when (TXDATA(37) = 'U') else TXDATA(37); -- rv 0
  TXDATA_in(38) <= '0' when (TXDATA(38) = 'U') else TXDATA(38); -- rv 0
  TXDATA_in(39) <= '0' when (TXDATA(39) = 'U') else TXDATA(39); -- rv 0
  TXDATA_in(4) <= '0' when (TXDATA(4) = 'U') else TXDATA(4); -- rv 0
  TXDATA_in(40) <= '0' when (TXDATA(40) = 'U') else TXDATA(40); -- rv 0
  TXDATA_in(41) <= '0' when (TXDATA(41) = 'U') else TXDATA(41); -- rv 0
  TXDATA_in(42) <= '0' when (TXDATA(42) = 'U') else TXDATA(42); -- rv 0
  TXDATA_in(43) <= '0' when (TXDATA(43) = 'U') else TXDATA(43); -- rv 0
  TXDATA_in(44) <= '0' when (TXDATA(44) = 'U') else TXDATA(44); -- rv 0
  TXDATA_in(45) <= '0' when (TXDATA(45) = 'U') else TXDATA(45); -- rv 0
  TXDATA_in(46) <= '0' when (TXDATA(46) = 'U') else TXDATA(46); -- rv 0
  TXDATA_in(47) <= '0' when (TXDATA(47) = 'U') else TXDATA(47); -- rv 0
  TXDATA_in(48) <= '0' when (TXDATA(48) = 'U') else TXDATA(48); -- rv 0
  TXDATA_in(49) <= '0' when (TXDATA(49) = 'U') else TXDATA(49); -- rv 0
  TXDATA_in(5) <= '0' when (TXDATA(5) = 'U') else TXDATA(5); -- rv 0
  TXDATA_in(50) <= '0' when (TXDATA(50) = 'U') else TXDATA(50); -- rv 0
  TXDATA_in(51) <= '0' when (TXDATA(51) = 'U') else TXDATA(51); -- rv 0
  TXDATA_in(52) <= '0' when (TXDATA(52) = 'U') else TXDATA(52); -- rv 0
  TXDATA_in(53) <= '0' when (TXDATA(53) = 'U') else TXDATA(53); -- rv 0
  TXDATA_in(54) <= '0' when (TXDATA(54) = 'U') else TXDATA(54); -- rv 0
  TXDATA_in(55) <= '0' when (TXDATA(55) = 'U') else TXDATA(55); -- rv 0
  TXDATA_in(56) <= '0' when (TXDATA(56) = 'U') else TXDATA(56); -- rv 0
  TXDATA_in(57) <= '0' when (TXDATA(57) = 'U') else TXDATA(57); -- rv 0
  TXDATA_in(58) <= '0' when (TXDATA(58) = 'U') else TXDATA(58); -- rv 0
  TXDATA_in(59) <= '0' when (TXDATA(59) = 'U') else TXDATA(59); -- rv 0
  TXDATA_in(6) <= '0' when (TXDATA(6) = 'U') else TXDATA(6); -- rv 0
  TXDATA_in(60) <= '0' when (TXDATA(60) = 'U') else TXDATA(60); -- rv 0
  TXDATA_in(61) <= '0' when (TXDATA(61) = 'U') else TXDATA(61); -- rv 0
  TXDATA_in(62) <= '0' when (TXDATA(62) = 'U') else TXDATA(62); -- rv 0
  TXDATA_in(63) <= '0' when (TXDATA(63) = 'U') else TXDATA(63); -- rv 0
  TXDATA_in(64) <= '0' when (TXDATA(64) = 'U') else TXDATA(64); -- rv 0
  TXDATA_in(65) <= '0' when (TXDATA(65) = 'U') else TXDATA(65); -- rv 0
  TXDATA_in(66) <= '0' when (TXDATA(66) = 'U') else TXDATA(66); -- rv 0
  TXDATA_in(67) <= '0' when (TXDATA(67) = 'U') else TXDATA(67); -- rv 0
  TXDATA_in(68) <= '0' when (TXDATA(68) = 'U') else TXDATA(68); -- rv 0
  TXDATA_in(69) <= '0' when (TXDATA(69) = 'U') else TXDATA(69); -- rv 0
  TXDATA_in(7) <= '0' when (TXDATA(7) = 'U') else TXDATA(7); -- rv 0
  TXDATA_in(70) <= '0' when (TXDATA(70) = 'U') else TXDATA(70); -- rv 0
  TXDATA_in(71) <= '0' when (TXDATA(71) = 'U') else TXDATA(71); -- rv 0
  TXDATA_in(72) <= '0' when (TXDATA(72) = 'U') else TXDATA(72); -- rv 0
  TXDATA_in(73) <= '0' when (TXDATA(73) = 'U') else TXDATA(73); -- rv 0
  TXDATA_in(74) <= '0' when (TXDATA(74) = 'U') else TXDATA(74); -- rv 0
  TXDATA_in(75) <= '0' when (TXDATA(75) = 'U') else TXDATA(75); -- rv 0
  TXDATA_in(76) <= '0' when (TXDATA(76) = 'U') else TXDATA(76); -- rv 0
  TXDATA_in(77) <= '0' when (TXDATA(77) = 'U') else TXDATA(77); -- rv 0
  TXDATA_in(78) <= '0' when (TXDATA(78) = 'U') else TXDATA(78); -- rv 0
  TXDATA_in(79) <= '0' when (TXDATA(79) = 'U') else TXDATA(79); -- rv 0
  TXDATA_in(8) <= '0' when (TXDATA(8) = 'U') else TXDATA(8); -- rv 0
  TXDATA_in(80) <= '0' when (TXDATA(80) = 'U') else TXDATA(80); -- rv 0
  TXDATA_in(81) <= '0' when (TXDATA(81) = 'U') else TXDATA(81); -- rv 0
  TXDATA_in(82) <= '0' when (TXDATA(82) = 'U') else TXDATA(82); -- rv 0
  TXDATA_in(83) <= '0' when (TXDATA(83) = 'U') else TXDATA(83); -- rv 0
  TXDATA_in(84) <= '0' when (TXDATA(84) = 'U') else TXDATA(84); -- rv 0
  TXDATA_in(85) <= '0' when (TXDATA(85) = 'U') else TXDATA(85); -- rv 0
  TXDATA_in(86) <= '0' when (TXDATA(86) = 'U') else TXDATA(86); -- rv 0
  TXDATA_in(87) <= '0' when (TXDATA(87) = 'U') else TXDATA(87); -- rv 0
  TXDATA_in(88) <= '0' when (TXDATA(88) = 'U') else TXDATA(88); -- rv 0
  TXDATA_in(89) <= '0' when (TXDATA(89) = 'U') else TXDATA(89); -- rv 0
  TXDATA_in(9) <= '0' when (TXDATA(9) = 'U') else TXDATA(9); -- rv 0
  TXDATA_in(90) <= '0' when (TXDATA(90) = 'U') else TXDATA(90); -- rv 0
  TXDATA_in(91) <= '0' when (TXDATA(91) = 'U') else TXDATA(91); -- rv 0
  TXDATA_in(92) <= '0' when (TXDATA(92) = 'U') else TXDATA(92); -- rv 0
  TXDATA_in(93) <= '0' when (TXDATA(93) = 'U') else TXDATA(93); -- rv 0
  TXDATA_in(94) <= '0' when (TXDATA(94) = 'U') else TXDATA(94); -- rv 0
  TXDATA_in(95) <= '0' when (TXDATA(95) = 'U') else TXDATA(95); -- rv 0
  TXDATA_in(96) <= '0' when (TXDATA(96) = 'U') else TXDATA(96); -- rv 0
  TXDATA_in(97) <= '0' when (TXDATA(97) = 'U') else TXDATA(97); -- rv 0
  TXDATA_in(98) <= '0' when (TXDATA(98) = 'U') else TXDATA(98); -- rv 0
  TXDATA_in(99) <= '0' when (TXDATA(99) = 'U') else TXDATA(99); -- rv 0
  TXDCCFORCESTART_in <= '0' when (TXDCCFORCESTART = 'U') else TXDCCFORCESTART; -- rv 0
  TXDCCRESET_in <= '0' when (TXDCCRESET = 'U') else TXDCCRESET; -- rv 0
  TXDEEMPH_in(0) <= '0' when (TXDEEMPH(0) = 'U') else TXDEEMPH(0); -- rv 0
  TXDEEMPH_in(1) <= '0' when (TXDEEMPH(1) = 'U') else TXDEEMPH(1); -- rv 0
  TXDETECTRX_in <= '0' when (TXDETECTRX = 'U') else TXDETECTRX; -- rv 0
  TXDIFFCTRL_in(0) <= '0' when (TXDIFFCTRL(0) = 'U') else TXDIFFCTRL(0); -- rv 0
  TXDIFFCTRL_in(1) <= '0' when (TXDIFFCTRL(1) = 'U') else TXDIFFCTRL(1); -- rv 0
  TXDIFFCTRL_in(2) <= '0' when (TXDIFFCTRL(2) = 'U') else TXDIFFCTRL(2); -- rv 0
  TXDIFFCTRL_in(3) <= '0' when (TXDIFFCTRL(3) = 'U') else TXDIFFCTRL(3); -- rv 0
  TXDIFFCTRL_in(4) <= '0' when (TXDIFFCTRL(4) = 'U') else TXDIFFCTRL(4); -- rv 0
  TXDLYBYPASS_in <= '0' when (TXDLYBYPASS = 'U') else TXDLYBYPASS; -- rv 0
  TXDLYEN_in <= '0' when (TXDLYEN = 'U') else TXDLYEN; -- rv 0
  TXDLYHOLD_in <= '0' when (TXDLYHOLD = 'U') else TXDLYHOLD; -- rv 0
  TXDLYOVRDEN_in <= '0' when (TXDLYOVRDEN = 'U') else TXDLYOVRDEN; -- rv 0
  TXDLYSRESET_in <= '0' when (TXDLYSRESET = 'U') else TXDLYSRESET; -- rv 0
  TXDLYUPDOWN_in <= '0' when (TXDLYUPDOWN = 'U') else TXDLYUPDOWN; -- rv 0
  TXELECIDLE_in <= '0' when (TXELECIDLE = 'U') else TXELECIDLE; -- rv 0
  TXHEADER_in(0) <= '0' when (TXHEADER(0) = 'U') else TXHEADER(0); -- rv 0
  TXHEADER_in(1) <= '0' when (TXHEADER(1) = 'U') else TXHEADER(1); -- rv 0
  TXHEADER_in(2) <= '0' when (TXHEADER(2) = 'U') else TXHEADER(2); -- rv 0
  TXHEADER_in(3) <= '0' when (TXHEADER(3) = 'U') else TXHEADER(3); -- rv 0
  TXHEADER_in(4) <= '0' when (TXHEADER(4) = 'U') else TXHEADER(4); -- rv 0
  TXHEADER_in(5) <= '0' when (TXHEADER(5) = 'U') else TXHEADER(5); -- rv 0
  TXINHIBIT_in <= '0' when (TXINHIBIT = 'U') else TXINHIBIT; -- rv 0
  TXLATCLK_in <= '0' when (TXLATCLK = 'U') else TXLATCLK; -- rv 0
  TXLFPSTRESET_in <= '0' when (TXLFPSTRESET = 'U') else TXLFPSTRESET; -- rv 0
  TXLFPSU2LPEXIT_in <= '0' when (TXLFPSU2LPEXIT = 'U') else TXLFPSU2LPEXIT; -- rv 0
  TXLFPSU3WAKE_in <= '0' when (TXLFPSU3WAKE = 'U') else TXLFPSU3WAKE; -- rv 0
  TXMAINCURSOR_in(0) <= '0' when (TXMAINCURSOR(0) = 'U') else TXMAINCURSOR(0); -- rv 0
  TXMAINCURSOR_in(1) <= '0' when (TXMAINCURSOR(1) = 'U') else TXMAINCURSOR(1); -- rv 0
  TXMAINCURSOR_in(2) <= '0' when (TXMAINCURSOR(2) = 'U') else TXMAINCURSOR(2); -- rv 0
  TXMAINCURSOR_in(3) <= '0' when (TXMAINCURSOR(3) = 'U') else TXMAINCURSOR(3); -- rv 0
  TXMAINCURSOR_in(4) <= '0' when (TXMAINCURSOR(4) = 'U') else TXMAINCURSOR(4); -- rv 0
  TXMAINCURSOR_in(5) <= '0' when (TXMAINCURSOR(5) = 'U') else TXMAINCURSOR(5); -- rv 0
  TXMAINCURSOR_in(6) <= '0' when (TXMAINCURSOR(6) = 'U') else TXMAINCURSOR(6); -- rv 0
  TXMARGIN_in(0) <= '0' when (TXMARGIN(0) = 'U') else TXMARGIN(0); -- rv 0
  TXMARGIN_in(1) <= '0' when (TXMARGIN(1) = 'U') else TXMARGIN(1); -- rv 0
  TXMARGIN_in(2) <= '0' when (TXMARGIN(2) = 'U') else TXMARGIN(2); -- rv 0
  TXMUXDCDEXHOLD_in <= '0' when (TXMUXDCDEXHOLD = 'U') else TXMUXDCDEXHOLD; -- rv 0
  TXMUXDCDORWREN_in <= '0' when (TXMUXDCDORWREN = 'U') else TXMUXDCDORWREN; -- rv 0
  TXONESZEROS_in <= '0' when (TXONESZEROS = 'U') else TXONESZEROS; -- rv 0
  TXOUTCLKSEL_in(0) <= '0' when (TXOUTCLKSEL(0) = 'U') else TXOUTCLKSEL(0); -- rv 0
  TXOUTCLKSEL_in(1) <= '0' when (TXOUTCLKSEL(1) = 'U') else TXOUTCLKSEL(1); -- rv 0
  TXOUTCLKSEL_in(2) <= '0' when (TXOUTCLKSEL(2) = 'U') else TXOUTCLKSEL(2); -- rv 0
  TXPCSRESET_in <= '0' when (TXPCSRESET = 'U') else TXPCSRESET; -- rv 0
  TXPDELECIDLEMODE_in <= '0' when (TXPDELECIDLEMODE = 'U') else TXPDELECIDLEMODE; -- rv 0
  TXPD_in(0) <= '0' when (TXPD(0) = 'U') else TXPD(0); -- rv 0
  TXPD_in(1) <= '0' when (TXPD(1) = 'U') else TXPD(1); -- rv 0
  TXPHALIGNEN_in <= '0' when (TXPHALIGNEN = 'U') else TXPHALIGNEN; -- rv 0
  TXPHALIGN_in <= '0' when (TXPHALIGN = 'U') else TXPHALIGN; -- rv 0
  TXPHDLYPD_in <= '0' when (TXPHDLYPD = 'U') else TXPHDLYPD; -- rv 0
  TXPHDLYRESET_in <= '0' when (TXPHDLYRESET = 'U') else TXPHDLYRESET; -- rv 0
  TXPHDLYTSTCLK_in <= '0' when (TXPHDLYTSTCLK = 'U') else TXPHDLYTSTCLK; -- rv 0
  TXPHINIT_in <= '0' when (TXPHINIT = 'U') else TXPHINIT; -- rv 0
  TXPHOVRDEN_in <= '0' when (TXPHOVRDEN = 'U') else TXPHOVRDEN; -- rv 0
  TXPIPPMEN_in <= '0' when (TXPIPPMEN = 'U') else TXPIPPMEN; -- rv 0
  TXPIPPMOVRDEN_in <= '0' when (TXPIPPMOVRDEN = 'U') else TXPIPPMOVRDEN; -- rv 0
  TXPIPPMPD_in <= '0' when (TXPIPPMPD = 'U') else TXPIPPMPD; -- rv 0
  TXPIPPMSEL_in <= '0' when (TXPIPPMSEL = 'U') else TXPIPPMSEL; -- rv 0
  TXPIPPMSTEPSIZE_in(0) <= '0' when (TXPIPPMSTEPSIZE(0) = 'U') else TXPIPPMSTEPSIZE(0); -- rv 0
  TXPIPPMSTEPSIZE_in(1) <= '0' when (TXPIPPMSTEPSIZE(1) = 'U') else TXPIPPMSTEPSIZE(1); -- rv 0
  TXPIPPMSTEPSIZE_in(2) <= '0' when (TXPIPPMSTEPSIZE(2) = 'U') else TXPIPPMSTEPSIZE(2); -- rv 0
  TXPIPPMSTEPSIZE_in(3) <= '0' when (TXPIPPMSTEPSIZE(3) = 'U') else TXPIPPMSTEPSIZE(3); -- rv 0
  TXPIPPMSTEPSIZE_in(4) <= '0' when (TXPIPPMSTEPSIZE(4) = 'U') else TXPIPPMSTEPSIZE(4); -- rv 0
  TXPISOPD_in <= '0' when (TXPISOPD = 'U') else TXPISOPD; -- rv 0
  TXPLLCLKSEL_in(0) <= '0' when (TXPLLCLKSEL(0) = 'U') else TXPLLCLKSEL(0); -- rv 0
  TXPLLCLKSEL_in(1) <= '0' when (TXPLLCLKSEL(1) = 'U') else TXPLLCLKSEL(1); -- rv 0
  TXPMARESET_in <= '0' when (TXPMARESET = 'U') else TXPMARESET; -- rv 0
  TXPOLARITY_in <= '0' when (TXPOLARITY = 'U') else TXPOLARITY; -- rv 0
  TXPOSTCURSOR_in(0) <= '0' when (TXPOSTCURSOR(0) = 'U') else TXPOSTCURSOR(0); -- rv 0
  TXPOSTCURSOR_in(1) <= '0' when (TXPOSTCURSOR(1) = 'U') else TXPOSTCURSOR(1); -- rv 0
  TXPOSTCURSOR_in(2) <= '0' when (TXPOSTCURSOR(2) = 'U') else TXPOSTCURSOR(2); -- rv 0
  TXPOSTCURSOR_in(3) <= '0' when (TXPOSTCURSOR(3) = 'U') else TXPOSTCURSOR(3); -- rv 0
  TXPOSTCURSOR_in(4) <= '0' when (TXPOSTCURSOR(4) = 'U') else TXPOSTCURSOR(4); -- rv 0
  TXPRBSFORCEERR_in <= '0' when (TXPRBSFORCEERR = 'U') else TXPRBSFORCEERR; -- rv 0
  TXPRBSSEL_in(0) <= '0' when (TXPRBSSEL(0) = 'U') else TXPRBSSEL(0); -- rv 0
  TXPRBSSEL_in(1) <= '0' when (TXPRBSSEL(1) = 'U') else TXPRBSSEL(1); -- rv 0
  TXPRBSSEL_in(2) <= '0' when (TXPRBSSEL(2) = 'U') else TXPRBSSEL(2); -- rv 0
  TXPRBSSEL_in(3) <= '0' when (TXPRBSSEL(3) = 'U') else TXPRBSSEL(3); -- rv 0
  TXPRECURSOR_in(0) <= '0' when (TXPRECURSOR(0) = 'U') else TXPRECURSOR(0); -- rv 0
  TXPRECURSOR_in(1) <= '0' when (TXPRECURSOR(1) = 'U') else TXPRECURSOR(1); -- rv 0
  TXPRECURSOR_in(2) <= '0' when (TXPRECURSOR(2) = 'U') else TXPRECURSOR(2); -- rv 0
  TXPRECURSOR_in(3) <= '0' when (TXPRECURSOR(3) = 'U') else TXPRECURSOR(3); -- rv 0
  TXPRECURSOR_in(4) <= '0' when (TXPRECURSOR(4) = 'U') else TXPRECURSOR(4); -- rv 0
  TXPROGDIVRESET_in <= '0' when (TXPROGDIVRESET = 'U') else TXPROGDIVRESET; -- rv 0
  TXRATEMODE_in <= '0' when (TXRATEMODE = 'U') else TXRATEMODE; -- rv 0
  TXRATE_in(0) <= '0' when (TXRATE(0) = 'U') else TXRATE(0); -- rv 0
  TXRATE_in(1) <= '0' when (TXRATE(1) = 'U') else TXRATE(1); -- rv 0
  TXRATE_in(2) <= '0' when (TXRATE(2) = 'U') else TXRATE(2); -- rv 0
  TXSEQUENCE_in(0) <= '0' when (TXSEQUENCE(0) = 'U') else TXSEQUENCE(0); -- rv 0
  TXSEQUENCE_in(1) <= '0' when (TXSEQUENCE(1) = 'U') else TXSEQUENCE(1); -- rv 0
  TXSEQUENCE_in(2) <= '0' when (TXSEQUENCE(2) = 'U') else TXSEQUENCE(2); -- rv 0
  TXSEQUENCE_in(3) <= '0' when (TXSEQUENCE(3) = 'U') else TXSEQUENCE(3); -- rv 0
  TXSEQUENCE_in(4) <= '0' when (TXSEQUENCE(4) = 'U') else TXSEQUENCE(4); -- rv 0
  TXSEQUENCE_in(5) <= '0' when (TXSEQUENCE(5) = 'U') else TXSEQUENCE(5); -- rv 0
  TXSEQUENCE_in(6) <= '0' when (TXSEQUENCE(6) = 'U') else TXSEQUENCE(6); -- rv 0
  TXSWING_in <= '0' when (TXSWING = 'U') else TXSWING; -- rv 0
  TXSYNCALLIN_in <= '0' when (TXSYNCALLIN = 'U') else TXSYNCALLIN; -- rv 0
  TXSYNCIN_in <= '0' when (TXSYNCIN = 'U') else TXSYNCIN; -- rv 0
  TXSYNCMODE_in <= '1' when (TXSYNCMODE = 'U') else TXSYNCMODE; -- rv 1
  TXSYSCLKSEL_in(0) <= '0' when (TXSYSCLKSEL(0) = 'U') else TXSYSCLKSEL(0); -- rv 0
  TXSYSCLKSEL_in(1) <= '0' when (TXSYSCLKSEL(1) = 'U') else TXSYSCLKSEL(1); -- rv 0
  TXUSERRDY_in <= '0' when (TXUSERRDY = 'U') else TXUSERRDY; -- rv 0
  TXUSRCLK2_in <= '0' when (TXUSRCLK2 = 'U') else TXUSRCLK2; -- rv 0
  TXUSRCLK_in <= '0' when (TXUSRCLK = 'U') else TXUSRCLK; -- rv 0
  
  gt_intclk <= gt_clk_int;

  GT_CLK : process 
  begin 
	gt_clk_int <= '0';
	loop
	wait for 10 ns; 
		gt_clk_int <= not gt_clk_int;
	end loop;
  end process;

  PMASCANCLK0_in <= '1'; -- tie off
  PMASCANCLK1_in <= '1'; -- tie off
  PMASCANCLK2_in <= '1'; -- tie off
  PMASCANCLK3_in <= '1'; -- tie off
  PMASCANCLK4_in <= '1'; -- tie off
  PMASCANCLK5_in <= '1'; -- tie off
  PMASCANCLK6_in <= '1'; -- tie off
  PMASCANCLK7_in <= '1'; -- tie off
  PMASCANCLK8_in <= '1'; -- tie off
  SCANCLK_in <= '1'; -- tie off
  TSTCLK0_in <= '1'; -- tie off
  TSTCLK1_in <= '1'; -- tie off

  BSR_SERIAL_in <= '1'; -- tie off
  CSSDRSTB_in <= '1'; -- tie off
  CSSDSTOPCLK_in <= '1'; -- tie off
  PMASCANENB_in <= '1'; -- tie off
  PMASCANIN_in <= "111111111111111111"; -- tie off
  PMASCANMODEB_in <= '1'; -- tie off
  PMASCANRSTEN_in <= '1'; -- tie off
  SARCCLK_in <= '1'; -- tie off
  SCANENB_in <= '1'; -- tie off
  SCANIN_in <= "1111111111111111111"; -- tie off
  SCANMODEB_in <= '1'; -- tie off
  SCANRSTB_in <= '1'; -- tie off
  SCANRSTEN_in <= '1'; -- tie off
  TSTPDOVRDB_in <= '1'; -- tie off
  TSTPD_in <= "11111"; -- tie off
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- ALIGN_COMMA_DOUBLE check
      if((xil_attr_test) or
         ((ALIGN_COMMA_DOUBLE /= "FALSE") and 
          (ALIGN_COMMA_DOUBLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-129] ALIGN_COMMA_DOUBLE attribute is set to """));
        Write ( Message, string'(ALIGN_COMMA_DOUBLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ALIGN_COMMA_WORD check
      if((xil_attr_test) or
         ((ALIGN_COMMA_WORD /= 1) and 
          (ALIGN_COMMA_WORD /= 2) and 
          (ALIGN_COMMA_WORD /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-131] ALIGN_COMMA_WORD attribute is set to "));
        Write ( Message, ALIGN_COMMA_WORD);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ALIGN_MCOMMA_DET check
      if((xil_attr_test) or
         ((ALIGN_MCOMMA_DET /= "TRUE") and 
          (ALIGN_MCOMMA_DET /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-132] ALIGN_MCOMMA_DET attribute is set to """));
        Write ( Message, string'(ALIGN_MCOMMA_DET));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ALIGN_PCOMMA_DET check
      if((xil_attr_test) or
         ((ALIGN_PCOMMA_DET /= "TRUE") and 
          (ALIGN_PCOMMA_DET /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-134] ALIGN_PCOMMA_DET attribute is set to """));
        Write ( Message, string'(ALIGN_PCOMMA_DET));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CBCC_DATA_SOURCE_SEL check
      if((xil_attr_test) or
         ((CBCC_DATA_SOURCE_SEL /= "DECODED") and 
          (CBCC_DATA_SOURCE_SEL /= "ENCODED"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-268] CBCC_DATA_SOURCE_SEL attribute is set to """));
        Write ( Message, string'(CBCC_DATA_SOURCE_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DECODED"" or "));
        Write ( Message, string'("""ENCODED"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CHAN_BOND_KEEP_ALIGN check
      if((xil_attr_test) or
         ((CHAN_BOND_KEEP_ALIGN /= "FALSE") and 
          (CHAN_BOND_KEEP_ALIGN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-271] CHAN_BOND_KEEP_ALIGN attribute is set to """));
        Write ( Message, string'(CHAN_BOND_KEEP_ALIGN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CHAN_BOND_MAX_SKEW check
      if((xil_attr_test) or
         ((CHAN_BOND_MAX_SKEW /= 7) and 
          (CHAN_BOND_MAX_SKEW /= 1) and 
          (CHAN_BOND_MAX_SKEW /= 2) and 
          (CHAN_BOND_MAX_SKEW /= 3) and 
          (CHAN_BOND_MAX_SKEW /= 4) and 
          (CHAN_BOND_MAX_SKEW /= 5) and 
          (CHAN_BOND_MAX_SKEW /= 6) and 
          (CHAN_BOND_MAX_SKEW /= 8) and 
          (CHAN_BOND_MAX_SKEW /= 9) and 
          (CHAN_BOND_MAX_SKEW /= 10) and 
          (CHAN_BOND_MAX_SKEW /= 11) and 
          (CHAN_BOND_MAX_SKEW /= 12) and 
          (CHAN_BOND_MAX_SKEW /= 13) and 
          (CHAN_BOND_MAX_SKEW /= 14))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-272] CHAN_BOND_MAX_SKEW attribute is set to "));
        Write ( Message, CHAN_BOND_MAX_SKEW);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("7, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("9, "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("11, "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("13 or "));
        Write ( Message, string'("14. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CHAN_BOND_SEQ_2_USE check
      if((xil_attr_test) or
         ((CHAN_BOND_SEQ_2_USE /= "FALSE") and 
          (CHAN_BOND_SEQ_2_USE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-283] CHAN_BOND_SEQ_2_USE attribute is set to """));
        Write ( Message, string'(CHAN_BOND_SEQ_2_USE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CHAN_BOND_SEQ_LEN check
      if((xil_attr_test) or
         ((CHAN_BOND_SEQ_LEN /= 2) and 
          (CHAN_BOND_SEQ_LEN /= 1) and 
          (CHAN_BOND_SEQ_LEN /= 3) and 
          (CHAN_BOND_SEQ_LEN /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-284] CHAN_BOND_SEQ_LEN attribute is set to "));
        Write ( Message, CHAN_BOND_SEQ_LEN);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("3 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_CORRECT_USE check
      if((xil_attr_test) or
         ((CLK_CORRECT_USE /= "TRUE") and 
          (CLK_CORRECT_USE /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-295] CLK_CORRECT_USE attribute is set to """));
        Write ( Message, string'(CLK_CORRECT_USE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_COR_KEEP_IDLE check
      if((xil_attr_test) or
         ((CLK_COR_KEEP_IDLE /= "FALSE") and 
          (CLK_COR_KEEP_IDLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-296] CLK_COR_KEEP_IDLE attribute is set to """));
        Write ( Message, string'(CLK_COR_KEEP_IDLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_COR_MAX_LAT check
        if((xil_attr_test) or
           ((CLK_COR_MAX_LAT < 3) or (CLK_COR_MAX_LAT > 60))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-297] CLK_COR_MAX_LAT attribute is set to "));
          Write ( Message, CLK_COR_MAX_LAT);
          Write ( Message, string'(". Legal values for this attribute are 3 to 60. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CLK_COR_MIN_LAT check
        if((xil_attr_test) or
           ((CLK_COR_MIN_LAT < 3) or (CLK_COR_MIN_LAT > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-298] CLK_COR_MIN_LAT attribute is set to "));
          Write ( Message, CLK_COR_MIN_LAT);
          Write ( Message, string'(". Legal values for this attribute are 3 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CLK_COR_PRECEDENCE check
      if((xil_attr_test) or
         ((CLK_COR_PRECEDENCE /= "TRUE") and 
          (CLK_COR_PRECEDENCE /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-299] CLK_COR_PRECEDENCE attribute is set to """));
        Write ( Message, string'(CLK_COR_PRECEDENCE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_COR_REPEAT_WAIT check
        if((xil_attr_test) or
           ((CLK_COR_REPEAT_WAIT < 0) or (CLK_COR_REPEAT_WAIT > 31))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-300] CLK_COR_REPEAT_WAIT attribute is set to "));
          Write ( Message, CLK_COR_REPEAT_WAIT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 31. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- CLK_COR_SEQ_2_USE check
      if((xil_attr_test) or
         ((CLK_COR_SEQ_2_USE /= "FALSE") and 
          (CLK_COR_SEQ_2_USE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-311] CLK_COR_SEQ_2_USE attribute is set to """));
        Write ( Message, string'(CLK_COR_SEQ_2_USE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_COR_SEQ_LEN check
      if((xil_attr_test) or
         ((CLK_COR_SEQ_LEN /= 2) and 
          (CLK_COR_SEQ_LEN /= 1) and 
          (CLK_COR_SEQ_LEN /= 3) and 
          (CLK_COR_SEQ_LEN /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-312] CLK_COR_SEQ_LEN attribute is set to "));
        Write ( Message, CLK_COR_SEQ_LEN);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("3 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CPLL_FBDIV check
      if((xil_attr_test) or
         ((CPLL_FBDIV /= 4) and 
          (CPLL_FBDIV /= 1) and 
          (CPLL_FBDIV /= 2) and 
          (CPLL_FBDIV /= 3) and 
          (CPLL_FBDIV /= 5) and 
          (CPLL_FBDIV /= 6) and 
          (CPLL_FBDIV /= 8) and 
          (CPLL_FBDIV /= 10) and 
          (CPLL_FBDIV /= 12) and 
          (CPLL_FBDIV /= 16) and 
          (CPLL_FBDIV /= 20))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-317] CPLL_FBDIV attribute is set to "));
        Write ( Message, CPLL_FBDIV);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("16 or "));
        Write ( Message, string'("20. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CPLL_FBDIV_45 check
      if((xil_attr_test) or
         ((CPLL_FBDIV_45 /= 4) and 
          (CPLL_FBDIV_45 /= 5))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-318] CPLL_FBDIV_45 attribute is set to "));
        Write ( Message, CPLL_FBDIV_45);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4 or "));
        Write ( Message, string'("5. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CPLL_REFCLK_DIV check
      if((xil_attr_test) or
         ((CPLL_REFCLK_DIV /= 1) and 
          (CPLL_REFCLK_DIV /= 2) and 
          (CPLL_REFCLK_DIV /= 3) and 
          (CPLL_REFCLK_DIV /= 4) and 
          (CPLL_REFCLK_DIV /= 5) and 
          (CPLL_REFCLK_DIV /= 6) and 
          (CPLL_REFCLK_DIV /= 8) and 
          (CPLL_REFCLK_DIV /= 10) and 
          (CPLL_REFCLK_DIV /= 12) and 
          (CPLL_REFCLK_DIV /= 16) and 
          (CPLL_REFCLK_DIV /= 20))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-321] CPLL_REFCLK_DIV attribute is set to "));
        Write ( Message, CPLL_REFCLK_DIV);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("16 or "));
        Write ( Message, string'("20. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DDI_REALIGN_WAIT check
        if((xil_attr_test) or
           ((DDI_REALIGN_WAIT < 0) or (DDI_REALIGN_WAIT > 31))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-338] DDI_REALIGN_WAIT attribute is set to "));
          Write ( Message, DDI_REALIGN_WAIT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 31. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DEC_MCOMMA_DETECT check
      if((xil_attr_test) or
         ((DEC_MCOMMA_DETECT /= "TRUE") and 
          (DEC_MCOMMA_DETECT /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-339] DEC_MCOMMA_DETECT attribute is set to """));
        Write ( Message, string'(DEC_MCOMMA_DETECT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DEC_PCOMMA_DETECT check
      if((xil_attr_test) or
         ((DEC_PCOMMA_DETECT /= "TRUE") and 
          (DEC_PCOMMA_DETECT /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-340] DEC_PCOMMA_DETECT attribute is set to """));
        Write ( Message, string'(DEC_PCOMMA_DETECT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DEC_VALID_COMMA_ONLY check
      if((xil_attr_test) or
         ((DEC_VALID_COMMA_ONLY /= "TRUE") and 
          (DEC_VALID_COMMA_ONLY /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-341] DEC_VALID_COMMA_ONLY attribute is set to """));
        Write ( Message, string'(DEC_VALID_COMMA_ONLY));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ES_ERRDET_EN check
      if((xil_attr_test) or
         ((ES_ERRDET_EN /= "FALSE") and 
          (ES_ERRDET_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-347] ES_ERRDET_EN attribute is set to """));
        Write ( Message, string'(ES_ERRDET_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ES_EYE_SCAN_EN check
      if((xil_attr_test) or
         ((ES_EYE_SCAN_EN /= "FALSE") and 
          (ES_EYE_SCAN_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-348] ES_EYE_SCAN_EN attribute is set to """));
        Write ( Message, string'(ES_EYE_SCAN_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EYESCAN_VP_RANGE check
      if((xil_attr_test) or
         ((EYESCAN_VP_RANGE /= 0) and 
          (EYESCAN_VP_RANGE /= 1) and 
          (EYESCAN_VP_RANGE /= 2) and 
          (EYESCAN_VP_RANGE /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-381] EYESCAN_VP_RANGE attribute is set to "));
        Write ( Message, EYESCAN_VP_RANGE);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- FTS_LANE_DESKEW_EN check
      if((xil_attr_test) or
         ((FTS_LANE_DESKEW_EN /= "FALSE") and 
          (FTS_LANE_DESKEW_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-385] FTS_LANE_DESKEW_EN attribute is set to """));
        Write ( Message, string'(FTS_LANE_DESKEW_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- LPBK_BIAS_CTRL check
      if((xil_attr_test) or
         ((LPBK_BIAS_CTRL /= 4) and 
          (LPBK_BIAS_CTRL /= 0) and 
          (LPBK_BIAS_CTRL /= 1) and 
          (LPBK_BIAS_CTRL /= 2) and 
          (LPBK_BIAS_CTRL /= 3) and 
          (LPBK_BIAS_CTRL /= 5) and 
          (LPBK_BIAS_CTRL /= 6) and 
          (LPBK_BIAS_CTRL /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-394] LPBK_BIAS_CTRL attribute is set to "));
        Write ( Message, LPBK_BIAS_CTRL);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- LPBK_IND_CTRL0 check
      if((xil_attr_test) or
         ((LPBK_IND_CTRL0 /= 5) and 
          (LPBK_IND_CTRL0 /= 0) and 
          (LPBK_IND_CTRL0 /= 1) and 
          (LPBK_IND_CTRL0 /= 2) and 
          (LPBK_IND_CTRL0 /= 3) and 
          (LPBK_IND_CTRL0 /= 4) and 
          (LPBK_IND_CTRL0 /= 6) and 
          (LPBK_IND_CTRL0 /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-397] LPBK_IND_CTRL0 attribute is set to "));
        Write ( Message, LPBK_IND_CTRL0);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- LPBK_IND_CTRL1 check
      if((xil_attr_test) or
         ((LPBK_IND_CTRL1 /= 5) and 
          (LPBK_IND_CTRL1 /= 0) and 
          (LPBK_IND_CTRL1 /= 1) and 
          (LPBK_IND_CTRL1 /= 2) and 
          (LPBK_IND_CTRL1 /= 3) and 
          (LPBK_IND_CTRL1 /= 4) and 
          (LPBK_IND_CTRL1 /= 6) and 
          (LPBK_IND_CTRL1 /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-398] LPBK_IND_CTRL1 attribute is set to "));
        Write ( Message, LPBK_IND_CTRL1);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- LPBK_IND_CTRL2 check
      if((xil_attr_test) or
         ((LPBK_IND_CTRL2 /= 5) and 
          (LPBK_IND_CTRL2 /= 0) and 
          (LPBK_IND_CTRL2 /= 1) and 
          (LPBK_IND_CTRL2 /= 2) and 
          (LPBK_IND_CTRL2 /= 3) and 
          (LPBK_IND_CTRL2 /= 4) and 
          (LPBK_IND_CTRL2 /= 6) and 
          (LPBK_IND_CTRL2 /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-399] LPBK_IND_CTRL2 attribute is set to "));
        Write ( Message, LPBK_IND_CTRL2);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- LPBK_RG_CTRL check
      if((xil_attr_test) or
         ((LPBK_RG_CTRL /= 2) and 
          (LPBK_RG_CTRL /= 0) and 
          (LPBK_RG_CTRL /= 1) and 
          (LPBK_RG_CTRL /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-400] LPBK_RG_CTRL attribute is set to "));
        Write ( Message, LPBK_RG_CTRL);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PCI3_AUTO_REALIGN check
      if((xil_attr_test) or
         ((PCI3_AUTO_REALIGN /= "FRST_SMPL") and 
          (PCI3_AUTO_REALIGN /= "OVR_1K_BLK") and 
          (PCI3_AUTO_REALIGN /= "OVR_8_BLK") and 
          (PCI3_AUTO_REALIGN /= "OVR_64_BLK"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-403] PCI3_AUTO_REALIGN attribute is set to """));
        Write ( Message, string'(PCI3_AUTO_REALIGN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FRST_SMPL"", "));
        Write ( Message, string'("""OVR_1K_BLK"", "));
        Write ( Message, string'("""OVR_8_BLK"" or "));
        Write ( Message, string'("""OVR_64_BLK"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PCIE_64B_DYN_CLKSW_DIS check
      if((xil_attr_test) or
         ((PCIE_64B_DYN_CLKSW_DIS /= "FALSE") and 
          (PCIE_64B_DYN_CLKSW_DIS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-417] PCIE_64B_DYN_CLKSW_DIS attribute is set to """));
        Write ( Message, string'(PCIE_64B_DYN_CLKSW_DIS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PCIE_GEN4_64BIT_INT_EN check
      if((xil_attr_test) or
         ((PCIE_GEN4_64BIT_INT_EN /= "FALSE") and 
          (PCIE_GEN4_64BIT_INT_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-419] PCIE_GEN4_64BIT_INT_EN attribute is set to """));
        Write ( Message, string'(PCIE_GEN4_64BIT_INT_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PCS_PCIE_EN check
      if((xil_attr_test) or
         ((PCS_PCIE_EN /= "FALSE") and 
          (PCS_PCIE_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-427] PCS_PCIE_EN attribute is set to """));
        Write ( Message, string'(PCS_PCIE_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PREIQ_FREQ_BST check
      if((xil_attr_test) or
         ((PREIQ_FREQ_BST /= 0) and 
          (PREIQ_FREQ_BST /= 1) and 
          (PREIQ_FREQ_BST /= 2) and 
          (PREIQ_FREQ_BST /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-432] PREIQ_FREQ_BST attribute is set to "));
        Write ( Message, PREIQ_FREQ_BST);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_ADDR_MODE check
      if((xil_attr_test) or
         ((RXBUF_ADDR_MODE /= "FULL") and 
          (RXBUF_ADDR_MODE /= "FAST"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-439] RXBUF_ADDR_MODE attribute is set to """));
        Write ( Message, string'(RXBUF_ADDR_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FULL"" or "));
        Write ( Message, string'("""FAST"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_EN check
      if((xil_attr_test) or
         ((RXBUF_EN /= "TRUE") and 
          (RXBUF_EN /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-442] RXBUF_EN attribute is set to """));
        Write ( Message, string'(RXBUF_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_RESET_ON_CB_CHANGE check
      if((xil_attr_test) or
         ((RXBUF_RESET_ON_CB_CHANGE /= "TRUE") and 
          (RXBUF_RESET_ON_CB_CHANGE /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-443] RXBUF_RESET_ON_CB_CHANGE attribute is set to """));
        Write ( Message, string'(RXBUF_RESET_ON_CB_CHANGE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_RESET_ON_COMMAALIGN check
      if((xil_attr_test) or
         ((RXBUF_RESET_ON_COMMAALIGN /= "FALSE") and 
          (RXBUF_RESET_ON_COMMAALIGN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-444] RXBUF_RESET_ON_COMMAALIGN attribute is set to """));
        Write ( Message, string'(RXBUF_RESET_ON_COMMAALIGN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_RESET_ON_EIDLE check
      if((xil_attr_test) or
         ((RXBUF_RESET_ON_EIDLE /= "FALSE") and 
          (RXBUF_RESET_ON_EIDLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-445] RXBUF_RESET_ON_EIDLE attribute is set to """));
        Write ( Message, string'(RXBUF_RESET_ON_EIDLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_RESET_ON_RATE_CHANGE check
      if((xil_attr_test) or
         ((RXBUF_RESET_ON_RATE_CHANGE /= "TRUE") and 
          (RXBUF_RESET_ON_RATE_CHANGE /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-446] RXBUF_RESET_ON_RATE_CHANGE attribute is set to """));
        Write ( Message, string'(RXBUF_RESET_ON_RATE_CHANGE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_THRESH_OVFLW check
        if((xil_attr_test) or
           ((RXBUF_THRESH_OVFLW < 0) or (RXBUF_THRESH_OVFLW > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-447] RXBUF_THRESH_OVFLW attribute is set to "));
          Write ( Message, RXBUF_THRESH_OVFLW);
          Write ( Message, string'(". Legal values for this attribute are 0 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- RXBUF_THRESH_OVRD check
      if((xil_attr_test) or
         ((RXBUF_THRESH_OVRD /= "FALSE") and 
          (RXBUF_THRESH_OVRD /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-448] RXBUF_THRESH_OVRD attribute is set to """));
        Write ( Message, string'(RXBUF_THRESH_OVRD));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXBUF_THRESH_UNDFLW check
        if((xil_attr_test) or
           ((RXBUF_THRESH_UNDFLW < 0) or (RXBUF_THRESH_UNDFLW > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-449] RXBUF_THRESH_UNDFLW attribute is set to "));
          Write ( Message, RXBUF_THRESH_UNDFLW);
          Write ( Message, string'(". Legal values for this attribute are 0 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- RXELECIDLE_CFG check
      if((xil_attr_test) or
         ((RXELECIDLE_CFG /= "SIGCFG_4") and 
          (RXELECIDLE_CFG /= "SIGCFG_1") and 
          (RXELECIDLE_CFG /= "SIGCFG_2") and 
          (RXELECIDLE_CFG /= "SIGCFG_3") and 
          (RXELECIDLE_CFG /= "SIGCFG_6") and 
          (RXELECIDLE_CFG /= "SIGCFG_8") and 
          (RXELECIDLE_CFG /= "SIGCFG_12") and 
          (RXELECIDLE_CFG /= "SIGCFG_16"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-536] RXELECIDLE_CFG attribute is set to """));
        Write ( Message, string'(RXELECIDLE_CFG));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SIGCFG_4"", "));
        Write ( Message, string'("""SIGCFG_1"", "));
        Write ( Message, string'("""SIGCFG_2"", "));
        Write ( Message, string'("""SIGCFG_3"", "));
        Write ( Message, string'("""SIGCFG_6"", "));
        Write ( Message, string'("""SIGCFG_8"", "));
        Write ( Message, string'("""SIGCFG_12"" or "));
        Write ( Message, string'("""SIGCFG_16"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXGBOX_FIFO_INIT_RD_ADDR check
      if((xil_attr_test) or
         ((RXGBOX_FIFO_INIT_RD_ADDR /= 4) and 
          (RXGBOX_FIFO_INIT_RD_ADDR /= 2) and 
          (RXGBOX_FIFO_INIT_RD_ADDR /= 3) and 
          (RXGBOX_FIFO_INIT_RD_ADDR /= 5))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-537] RXGBOX_FIFO_INIT_RD_ADDR attribute is set to "));
        Write ( Message, RXGBOX_FIFO_INIT_RD_ADDR);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3 or "));
        Write ( Message, string'("5. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXGEARBOX_EN check
      if((xil_attr_test) or
         ((RXGEARBOX_EN /= "FALSE") and 
          (RXGEARBOX_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-538] RXGEARBOX_EN attribute is set to """));
        Write ( Message, string'(RXGEARBOX_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXOOB_CLK_CFG check
      if((xil_attr_test) or
         ((RXOOB_CLK_CFG /= "PMA") and 
          (RXOOB_CLK_CFG /= "FABRIC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-547] RXOOB_CLK_CFG attribute is set to """));
        Write ( Message, string'(RXOOB_CLK_CFG));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""PMA"" or "));
        Write ( Message, string'("""FABRIC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXOUT_DIV check
      if((xil_attr_test) or
         ((RXOUT_DIV /= 4) and 
          (RXOUT_DIV /= 1) and 
          (RXOUT_DIV /= 2) and 
          (RXOUT_DIV /= 8) and 
          (RXOUT_DIV /= 16) and 
          (RXOUT_DIV /= 32))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-549] RXOUT_DIV attribute is set to "));
        Write ( Message, RXOUT_DIV);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("16 or "));
        Write ( Message, string'("32. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXPMACLK_SEL check
      if((xil_attr_test) or
         ((RXPMACLK_SEL /= "DATA") and 
          (RXPMACLK_SEL /= "CROSSING") and 
          (RXPMACLK_SEL /= "EYESCAN"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-558] RXPMACLK_SEL attribute is set to """));
        Write ( Message, string'(RXPMACLK_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DATA"", "));
        Write ( Message, string'("""CROSSING"" or "));
        Write ( Message, string'("""EYESCAN"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXPRBS_LINKACQ_CNT check
        if((xil_attr_test) or
           ((RXPRBS_LINKACQ_CNT < 15) or (RXPRBS_LINKACQ_CNT > 255))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-561] RXPRBS_LINKACQ_CNT attribute is set to "));
          Write ( Message, RXPRBS_LINKACQ_CNT);
          Write ( Message, string'(". Legal values for this attribute are 15 to 255. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- RXSLIDE_AUTO_WAIT check
      if((xil_attr_test) or
         ((RXSLIDE_AUTO_WAIT /= 7) and 
          (RXSLIDE_AUTO_WAIT /= 1) and 
          (RXSLIDE_AUTO_WAIT /= 2) and 
          (RXSLIDE_AUTO_WAIT /= 3) and 
          (RXSLIDE_AUTO_WAIT /= 4) and 
          (RXSLIDE_AUTO_WAIT /= 5) and 
          (RXSLIDE_AUTO_WAIT /= 6) and 
          (RXSLIDE_AUTO_WAIT /= 8) and 
          (RXSLIDE_AUTO_WAIT /= 9) and 
          (RXSLIDE_AUTO_WAIT /= 10) and 
          (RXSLIDE_AUTO_WAIT /= 11) and 
          (RXSLIDE_AUTO_WAIT /= 12) and 
          (RXSLIDE_AUTO_WAIT /= 13) and 
          (RXSLIDE_AUTO_WAIT /= 14) and 
          (RXSLIDE_AUTO_WAIT /= 15))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-563] RXSLIDE_AUTO_WAIT attribute is set to "));
        Write ( Message, RXSLIDE_AUTO_WAIT);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("7, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("9, "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("11, "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("13, "));
        Write ( Message, string'("14 or "));
        Write ( Message, string'("15. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RXSLIDE_MODE check
      if((xil_attr_test) or
         ((RXSLIDE_MODE /= "OFF") and 
          (RXSLIDE_MODE /= "AUTO") and 
          (RXSLIDE_MODE /= "PCS") and 
          (RXSLIDE_MODE /= "PMA"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-564] RXSLIDE_MODE attribute is set to """));
        Write ( Message, string'(RXSLIDE_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""OFF"", "));
        Write ( Message, string'("""AUTO"", "));
        Write ( Message, string'("""PCS"" or "));
        Write ( Message, string'("""PMA"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_CLK25_DIV check
        if((xil_attr_test) or
           ((RX_CLK25_DIV < 1) or (RX_CLK25_DIV > 32))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-572] RX_CLK25_DIV attribute is set to "));
          Write ( Message, RX_CLK25_DIV);
          Write ( Message, string'(". Legal values for this attribute are 1 to 32. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- RX_CM_SEL check
      if((xil_attr_test) or
         ((RX_CM_SEL /= 2) and 
          (RX_CM_SEL /= 0) and 
          (RX_CM_SEL /= 1) and 
          (RX_CM_SEL /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-577] RX_CM_SEL attribute is set to "));
        Write ( Message, RX_CM_SEL);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_CM_TRIM check
      if((xil_attr_test) or
         ((RX_CM_TRIM /= 12) and 
          (RX_CM_TRIM /= 0) and 
          (RX_CM_TRIM /= 1) and 
          (RX_CM_TRIM /= 2) and 
          (RX_CM_TRIM /= 3) and 
          (RX_CM_TRIM /= 4) and 
          (RX_CM_TRIM /= 5) and 
          (RX_CM_TRIM /= 6) and 
          (RX_CM_TRIM /= 7) and 
          (RX_CM_TRIM /= 8) and 
          (RX_CM_TRIM /= 9) and 
          (RX_CM_TRIM /= 10) and 
          (RX_CM_TRIM /= 11) and 
          (RX_CM_TRIM /= 13) and 
          (RX_CM_TRIM /= 14) and 
          (RX_CM_TRIM /= 15))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-578] RX_CM_TRIM attribute is set to "));
        Write ( Message, RX_CM_TRIM);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("7, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("9, "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("11, "));
        Write ( Message, string'("13, "));
        Write ( Message, string'("14 or "));
        Write ( Message, string'("15. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DATA_WIDTH check
      if((xil_attr_test) or
         ((RX_DATA_WIDTH /= 20) and 
          (RX_DATA_WIDTH /= 16) and 
          (RX_DATA_WIDTH /= 32) and 
          (RX_DATA_WIDTH /= 40) and 
          (RX_DATA_WIDTH /= 64) and 
          (RX_DATA_WIDTH /= 80) and 
          (RX_DATA_WIDTH /= 128) and 
          (RX_DATA_WIDTH /= 160))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-581] RX_DATA_WIDTH attribute is set to "));
        Write ( Message, RX_DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("20, "));
        Write ( Message, string'("16, "));
        Write ( Message, string'("32, "));
        Write ( Message, string'("40, "));
        Write ( Message, string'("64, "));
        Write ( Message, string'("80, "));
        Write ( Message, string'("128 or "));
        Write ( Message, string'("160. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DEFER_RESET_BUF_EN check
      if((xil_attr_test) or
         ((RX_DEFER_RESET_BUF_EN /= "TRUE") and 
          (RX_DEFER_RESET_BUF_EN /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-583] RX_DEFER_RESET_BUF_EN attribute is set to """));
        Write ( Message, string'(RX_DEFER_RESET_BUF_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DFELPM_CFG0 check
      if((xil_attr_test) or
         ((RX_DFELPM_CFG0 /= 10) and 
          (RX_DFELPM_CFG0 /= 0) and 
          (RX_DFELPM_CFG0 /= 1) and 
          (RX_DFELPM_CFG0 /= 11) and 
          (RX_DFELPM_CFG0 /= 12) and 
          (RX_DFELPM_CFG0 /= 13) and 
          (RX_DFELPM_CFG0 /= 14) and 
          (RX_DFELPM_CFG0 /= 15))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-586] RX_DFELPM_CFG0 attribute is set to "));
        Write ( Message, RX_DFELPM_CFG0);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("11, "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("13, "));
        Write ( Message, string'("14 or "));
        Write ( Message, string'("15. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DFE_AGC_CFG1 check
      if((xil_attr_test) or
         ((RX_DFE_AGC_CFG1 /= 4) and 
          (RX_DFE_AGC_CFG1 /= 0) and 
          (RX_DFE_AGC_CFG1 /= 1) and 
          (RX_DFE_AGC_CFG1 /= 2) and 
          (RX_DFE_AGC_CFG1 /= 3) and 
          (RX_DFE_AGC_CFG1 /= 5) and 
          (RX_DFE_AGC_CFG1 /= 6) and 
          (RX_DFE_AGC_CFG1 /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-589] RX_DFE_AGC_CFG1 attribute is set to "));
        Write ( Message, RX_DFE_AGC_CFG1);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DFE_KL_LPM_KH_CFG0 check
      if((xil_attr_test) or
         ((RX_DFE_KL_LPM_KH_CFG0 /= 1) and 
          (RX_DFE_KL_LPM_KH_CFG0 /= 0) and 
          (RX_DFE_KL_LPM_KH_CFG0 /= 2) and 
          (RX_DFE_KL_LPM_KH_CFG0 /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-590] RX_DFE_KL_LPM_KH_CFG0 attribute is set to "));
        Write ( Message, RX_DFE_KL_LPM_KH_CFG0);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DFE_KL_LPM_KH_CFG1 check
      if((xil_attr_test) or
         ((RX_DFE_KL_LPM_KH_CFG1 /= 2) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 0) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 1) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 3) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 4) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 5) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 6) and 
          (RX_DFE_KL_LPM_KH_CFG1 /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-591] RX_DFE_KL_LPM_KH_CFG1 attribute is set to "));
        Write ( Message, RX_DFE_KL_LPM_KH_CFG1);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DFE_KL_LPM_KL_CFG1 check
      if((xil_attr_test) or
         ((RX_DFE_KL_LPM_KL_CFG1 /= 4) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 0) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 1) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 2) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 3) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 5) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 6) and 
          (RX_DFE_KL_LPM_KL_CFG1 /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-593] RX_DFE_KL_LPM_KL_CFG1 attribute is set to "));
        Write ( Message, RX_DFE_KL_LPM_KL_CFG1);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_DISPERR_SEQ_MATCH check
      if((xil_attr_test) or
         ((RX_DISPERR_SEQ_MATCH /= "TRUE") and 
          (RX_DISPERR_SEQ_MATCH /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-595] RX_DISPERR_SEQ_MATCH attribute is set to """));
        Write ( Message, string'(RX_DISPERR_SEQ_MATCH));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_EN_SUM_RCAL_B check
      if((xil_attr_test) or
         ((RX_EN_SUM_RCAL_B /= 0) and 
          (RX_EN_SUM_RCAL_B /= 1))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-598] RX_EN_SUM_RCAL_B attribute is set to "));
        Write ( Message, RX_EN_SUM_RCAL_B);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("1. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_INT_DATAWIDTH check
      if((xil_attr_test) or
         ((RX_INT_DATAWIDTH /= 1) and 
          (RX_INT_DATAWIDTH /= 0) and 
          (RX_INT_DATAWIDTH /= 2))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-605] RX_INT_DATAWIDTH attribute is set to "));
        Write ( Message, RX_INT_DATAWIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("2. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_PROGDIV_CFG check
      if((xil_attr_test) or
         ((RX_PROGDIV_CFG /= 0.0) and 
          (RX_PROGDIV_CFG /= 4.0) and 
          (RX_PROGDIV_CFG /= 5.0) and 
          (RX_PROGDIV_CFG /= 8.0) and 
          (RX_PROGDIV_CFG /= 10.0) and 
          (RX_PROGDIV_CFG /= 16.0) and 
          (RX_PROGDIV_CFG /= 16.5) and 
          (RX_PROGDIV_CFG /= 20.0) and 
          (RX_PROGDIV_CFG /= 32.0) and 
          (RX_PROGDIV_CFG /= 33.0) and 
          (RX_PROGDIV_CFG /= 40.0) and 
          (RX_PROGDIV_CFG /= 64.0) and 
          (RX_PROGDIV_CFG /= 66.0) and 
          (RX_PROGDIV_CFG /= 80.0) and 
          (RX_PROGDIV_CFG /= 100.0) and 
          (RX_PROGDIV_CFG /= 128.0) and 
          (RX_PROGDIV_CFG /= 132.0))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-608] RX_PROGDIV_CFG attribute is set to "));
        Write ( Message, RX_PROGDIV_CFG);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0.0, "));
        Write ( Message, string'("4.0, "));
        Write ( Message, string'("5.0, "));
        Write ( Message, string'("8.0, "));
        Write ( Message, string'("10.0, "));
        Write ( Message, string'("16.0, "));
        Write ( Message, string'("16.5, "));
        Write ( Message, string'("20.0, "));
        Write ( Message, string'("32.0, "));
        Write ( Message, string'("33.0, "));
        Write ( Message, string'("40.0, "));
        Write ( Message, string'("64.0, "));
        Write ( Message, string'("66.0, "));
        Write ( Message, string'("80.0, "));
        Write ( Message, string'("100.0, "));
        Write ( Message, string'("128.0 or "));
        Write ( Message, string'("132.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_SIG_VALID_DLY check
        if((xil_attr_test) or
           ((RX_SIG_VALID_DLY < 1) or (RX_SIG_VALID_DLY > 32))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-613] RX_SIG_VALID_DLY attribute is set to "));
          Write ( Message, RX_SIG_VALID_DLY);
          Write ( Message, string'(". Legal values for this attribute are 1 to 32. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- RX_SUM_DEGEN_AVTT_OVERITE check
      if((xil_attr_test) or
         ((RX_SUM_DEGEN_AVTT_OVERITE /= 0) and 
          (RX_SUM_DEGEN_AVTT_OVERITE /= 1))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-614] RX_SUM_DEGEN_AVTT_OVERITE attribute is set to "));
        Write ( Message, RX_SUM_DEGEN_AVTT_OVERITE);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("1. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_SUM_PWR_SAVING check
      if((xil_attr_test) or
         ((RX_SUM_PWR_SAVING /= 0) and 
          (RX_SUM_PWR_SAVING /= 1))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-617] RX_SUM_PWR_SAVING attribute is set to "));
        Write ( Message, RX_SUM_PWR_SAVING);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("1. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RX_XCLK_SEL check
      if((xil_attr_test) or
         ((RX_XCLK_SEL /= "RXDES") and 
          (RX_XCLK_SEL /= "RXPMA") and 
          (RX_XCLK_SEL /= "RXUSR"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-630] RX_XCLK_SEL attribute is set to """));
        Write ( Message, string'(RX_XCLK_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""RXDES"", "));
        Write ( Message, string'("""RXPMA"" or "));
        Write ( Message, string'("""RXUSR"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SATA_CPLL_CFG check
      if((xil_attr_test) or
         ((SATA_CPLL_CFG /= "VCO_3000MHZ") and 
          (SATA_CPLL_CFG /= "VCO_750MHZ") and 
          (SATA_CPLL_CFG /= "VCO_1500MHZ") and 
          (SATA_CPLL_CFG /= "VCO_6000MHZ"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-636] SATA_CPLL_CFG attribute is set to """));
        Write ( Message, string'(SATA_CPLL_CFG));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""VCO_3000MHZ"", "));
        Write ( Message, string'("""VCO_750MHZ"", "));
        Write ( Message, string'("""VCO_1500MHZ"" or "));
        Write ( Message, string'("""VCO_6000MHZ"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SHOW_REALIGN_COMMA check
      if((xil_attr_test) or
         ((SHOW_REALIGN_COMMA /= "TRUE") and 
          (SHOW_REALIGN_COMMA /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-638] SHOW_REALIGN_COMMA attribute is set to """));
        Write ( Message, string'(SHOW_REALIGN_COMMA));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1p") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-639] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1p"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_MODE check
      if((xil_attr_test) or
         ((SIM_MODE /= "FAST") and 
          (SIM_MODE /= "LEGACY"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-640] SIM_MODE attribute is set to """));
        Write ( Message, string'(SIM_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FAST"" or "));
        Write ( Message, string'("""LEGACY"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_RECEIVER_DETECT_PASS check
      if((xil_attr_test) or
         ((SIM_RECEIVER_DETECT_PASS /= "TRUE") and 
          (SIM_RECEIVER_DETECT_PASS /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-641] SIM_RECEIVER_DETECT_PASS attribute is set to """));
        Write ( Message, string'(SIM_RECEIVER_DETECT_PASS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_RESET_SPEEDUP check
      if((xil_attr_test) or
         ((SIM_RESET_SPEEDUP /= "TRUE") and 
          (SIM_RESET_SPEEDUP /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-642] SIM_RESET_SPEEDUP attribute is set to """));
        Write ( Message, string'(SIM_RESET_SPEEDUP));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_TX_EIDLE_DRIVE_LEVEL check
      if((xil_attr_test) or
         ((SIM_TX_EIDLE_DRIVE_LEVEL /= "Z") and 
          (SIM_TX_EIDLE_DRIVE_LEVEL /= "HIGH") and 
          (SIM_TX_EIDLE_DRIVE_LEVEL /= "LOW") and 
          (SIM_TX_EIDLE_DRIVE_LEVEL /= "X"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-643] SIM_TX_EIDLE_DRIVE_LEVEL attribute is set to """));
        Write ( Message, string'(SIM_TX_EIDLE_DRIVE_LEVEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""Z"", "));
        Write ( Message, string'("""HIGH"", "));
        Write ( Message, string'("""LOW"" or "));
        Write ( Message, string'("""X"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXBUF_EN check
      if((xil_attr_test) or
         ((TXBUF_EN /= "TRUE") and 
          (TXBUF_EN /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-651] TXBUF_EN attribute is set to """));
        Write ( Message, string'(TXBUF_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXBUF_RESET_ON_RATE_CHANGE check
      if((xil_attr_test) or
         ((TXBUF_RESET_ON_RATE_CHANGE /= "FALSE") and 
          (TXBUF_RESET_ON_RATE_CHANGE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-652] TXBUF_RESET_ON_RATE_CHANGE attribute is set to """));
        Write ( Message, string'(TXBUF_RESET_ON_RATE_CHANGE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXDRV_FREQBAND check
      if((xil_attr_test) or
         ((TXDRV_FREQBAND /= 0) and 
          (TXDRV_FREQBAND /= 1) and 
          (TXDRV_FREQBAND /= 2) and 
          (TXDRV_FREQBAND /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-655] TXDRV_FREQBAND attribute is set to "));
        Write ( Message, TXDRV_FREQBAND);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXFIFO_ADDR_CFG check
      if((xil_attr_test) or
         ((TXFIFO_ADDR_CFG /= "LOW") and 
          (TXFIFO_ADDR_CFG /= "HIGH"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-660] TXFIFO_ADDR_CFG attribute is set to """));
        Write ( Message, string'(TXFIFO_ADDR_CFG));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""LOW"" or "));
        Write ( Message, string'("""HIGH"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXGBOX_FIFO_INIT_RD_ADDR check
      if((xil_attr_test) or
         ((TXGBOX_FIFO_INIT_RD_ADDR /= 4) and 
          (TXGBOX_FIFO_INIT_RD_ADDR /= 2) and 
          (TXGBOX_FIFO_INIT_RD_ADDR /= 3) and 
          (TXGBOX_FIFO_INIT_RD_ADDR /= 5) and 
          (TXGBOX_FIFO_INIT_RD_ADDR /= 6))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-661] TXGBOX_FIFO_INIT_RD_ADDR attribute is set to "));
        Write ( Message, TXGBOX_FIFO_INIT_RD_ADDR);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("5 or "));
        Write ( Message, string'("6. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXGEARBOX_EN check
      if((xil_attr_test) or
         ((TXGEARBOX_EN /= "FALSE") and 
          (TXGEARBOX_EN /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-662] TXGEARBOX_EN attribute is set to """));
        Write ( Message, string'(TXGEARBOX_EN));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXOUT_DIV check
      if((xil_attr_test) or
         ((TXOUT_DIV /= 4) and 
          (TXOUT_DIV /= 1) and 
          (TXOUT_DIV /= 2) and 
          (TXOUT_DIV /= 8) and 
          (TXOUT_DIV /= 16) and 
          (TXOUT_DIV /= 32))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-664] TXOUT_DIV attribute is set to "));
        Write ( Message, TXOUT_DIV);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("16 or "));
        Write ( Message, string'("32. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXSWBST_BST check
      if((xil_attr_test) or
         ((TXSWBST_BST /= 1) and 
          (TXSWBST_BST /= 0) and 
          (TXSWBST_BST /= 2) and 
          (TXSWBST_BST /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-680] TXSWBST_BST attribute is set to "));
        Write ( Message, TXSWBST_BST);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXSWBST_EN check
      if((xil_attr_test) or
         ((TXSWBST_EN /= 0) and 
          (TXSWBST_EN /= 1))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-681] TXSWBST_EN attribute is set to "));
        Write ( Message, TXSWBST_EN);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("1. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TXSWBST_MAG check
      if((xil_attr_test) or
         ((TXSWBST_MAG /= 6) and 
          (TXSWBST_MAG /= 0) and 
          (TXSWBST_MAG /= 1) and 
          (TXSWBST_MAG /= 2) and 
          (TXSWBST_MAG /= 3) and 
          (TXSWBST_MAG /= 4) and 
          (TXSWBST_MAG /= 5) and 
          (TXSWBST_MAG /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-682] TXSWBST_MAG attribute is set to "));
        Write ( Message, TXSWBST_MAG);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_CLK25_DIV check
        if((xil_attr_test) or
           ((TX_CLK25_DIV < 1) or (TX_CLK25_DIV > 32))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-686] TX_CLK25_DIV attribute is set to "));
          Write ( Message, TX_CLK25_DIV);
          Write ( Message, string'(". Legal values for this attribute are 1 to 32. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- TX_DATA_WIDTH check
      if((xil_attr_test) or
         ((TX_DATA_WIDTH /= 20) and 
          (TX_DATA_WIDTH /= 16) and 
          (TX_DATA_WIDTH /= 32) and 
          (TX_DATA_WIDTH /= 40) and 
          (TX_DATA_WIDTH /= 64) and 
          (TX_DATA_WIDTH /= 80) and 
          (TX_DATA_WIDTH /= 128) and 
          (TX_DATA_WIDTH /= 160))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-688] TX_DATA_WIDTH attribute is set to "));
        Write ( Message, TX_DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("20, "));
        Write ( Message, string'("16, "));
        Write ( Message, string'("32, "));
        Write ( Message, string'("40, "));
        Write ( Message, string'("64, "));
        Write ( Message, string'("80, "));
        Write ( Message, string'("128 or "));
        Write ( Message, string'("160. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_DRIVE_MODE check
      if((xil_attr_test) or
         ((TX_DRIVE_MODE /= "DIRECT") and 
          (TX_DRIVE_MODE /= "PIPE") and 
          (TX_DRIVE_MODE /= "PIPEGEN3"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-695] TX_DRIVE_MODE attribute is set to """));
        Write ( Message, string'(TX_DRIVE_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DIRECT"", "));
        Write ( Message, string'("""PIPE"" or "));
        Write ( Message, string'("""PIPEGEN3"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_INT_DATAWIDTH check
      if((xil_attr_test) or
         ((TX_INT_DATAWIDTH /= 1) and 
          (TX_INT_DATAWIDTH /= 0) and 
          (TX_INT_DATAWIDTH /= 2))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-701] TX_INT_DATAWIDTH attribute is set to "));
        Write ( Message, TX_INT_DATAWIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("2. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_LOOPBACK_DRIVE_HIZ check
      if((xil_attr_test) or
         ((TX_LOOPBACK_DRIVE_HIZ /= "FALSE") and 
          (TX_LOOPBACK_DRIVE_HIZ /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-702] TX_LOOPBACK_DRIVE_HIZ attribute is set to """));
        Write ( Message, string'(TX_LOOPBACK_DRIVE_HIZ));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_PI_BIASSET check
      if((xil_attr_test) or
         ((TX_PI_BIASSET /= 0) and 
          (TX_PI_BIASSET /= 1) and 
          (TX_PI_BIASSET /= 2) and 
          (TX_PI_BIASSET /= 3))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-716] TX_PI_BIASSET attribute is set to "));
        Write ( Message, TX_PI_BIASSET);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2 or "));
        Write ( Message, string'("3. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_PROGCLK_SEL check
      if((xil_attr_test) or
         ((TX_PROGCLK_SEL /= "POSTPI") and 
          (TX_PROGCLK_SEL /= "CPLL") and 
          (TX_PROGCLK_SEL /= "PREPI"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-721] TX_PROGCLK_SEL attribute is set to """));
        Write ( Message, string'(TX_PROGCLK_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""POSTPI"", "));
        Write ( Message, string'("""CPLL"" or "));
        Write ( Message, string'("""PREPI"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_PROGDIV_CFG check
      if((xil_attr_test) or
         ((TX_PROGDIV_CFG /= 0.0) and 
          (TX_PROGDIV_CFG /= 4.0) and 
          (TX_PROGDIV_CFG /= 5.0) and 
          (TX_PROGDIV_CFG /= 8.0) and 
          (TX_PROGDIV_CFG /= 10.0) and 
          (TX_PROGDIV_CFG /= 16.0) and 
          (TX_PROGDIV_CFG /= 16.5) and 
          (TX_PROGDIV_CFG /= 20.0) and 
          (TX_PROGDIV_CFG /= 32.0) and 
          (TX_PROGDIV_CFG /= 33.0) and 
          (TX_PROGDIV_CFG /= 40.0) and 
          (TX_PROGDIV_CFG /= 64.0) and 
          (TX_PROGDIV_CFG /= 66.0) and 
          (TX_PROGDIV_CFG /= 80.0) and 
          (TX_PROGDIV_CFG /= 100.0) and 
          (TX_PROGDIV_CFG /= 128.0) and 
          (TX_PROGDIV_CFG /= 132.0))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-722] TX_PROGDIV_CFG attribute is set to "));
        Write ( Message, TX_PROGDIV_CFG);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0.0, "));
        Write ( Message, string'("4.0, "));
        Write ( Message, string'("5.0, "));
        Write ( Message, string'("8.0, "));
        Write ( Message, string'("10.0, "));
        Write ( Message, string'("16.0, "));
        Write ( Message, string'("16.5, "));
        Write ( Message, string'("20.0, "));
        Write ( Message, string'("32.0, "));
        Write ( Message, string'("33.0, "));
        Write ( Message, string'("40.0, "));
        Write ( Message, string'("64.0, "));
        Write ( Message, string'("66.0, "));
        Write ( Message, string'("80.0, "));
        Write ( Message, string'("100.0, "));
        Write ( Message, string'("128.0 or "));
        Write ( Message, string'("132.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_RXDETECT_REF check
      if((xil_attr_test) or
         ((TX_RXDETECT_REF /= 3) and 
          (TX_RXDETECT_REF /= 0) and 
          (TX_RXDETECT_REF /= 1) and 
          (TX_RXDETECT_REF /= 2) and 
          (TX_RXDETECT_REF /= 4) and 
          (TX_RXDETECT_REF /= 5) and 
          (TX_RXDETECT_REF /= 6) and 
          (TX_RXDETECT_REF /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-725] TX_RXDETECT_REF attribute is set to "));
        Write ( Message, TX_RXDETECT_REF);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("0, "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6 or "));
        Write ( Message, string'("7. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_XCLK_SEL check
      if((xil_attr_test) or
         ((TX_XCLK_SEL /= "TXOUT") and 
          (TX_XCLK_SEL /= "TXUSR"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-739] TX_XCLK_SEL attribute is set to """));
        Write ( Message, string'(TX_XCLK_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TXOUT"" or "));
        Write ( Message, string'("""TXUSR"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- USB_PING_SATA_MAX_INIT check
        if((xil_attr_test) or
           ((USB_PING_SATA_MAX_INIT < 1) or (USB_PING_SATA_MAX_INIT > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-757] USB_PING_SATA_MAX_INIT attribute is set to "));
          Write ( Message, USB_PING_SATA_MAX_INIT);
          Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_PING_SATA_MIN_INIT check
        if((xil_attr_test) or
           ((USB_PING_SATA_MIN_INIT < 1) or (USB_PING_SATA_MIN_INIT > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-758] USB_PING_SATA_MIN_INIT attribute is set to "));
          Write ( Message, USB_PING_SATA_MIN_INIT);
          Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_POLL_SATA_MAX_BURST check
        if((xil_attr_test) or
           ((USB_POLL_SATA_MAX_BURST < 1) or (USB_POLL_SATA_MAX_BURST > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-759] USB_POLL_SATA_MAX_BURST attribute is set to "));
          Write ( Message, USB_POLL_SATA_MAX_BURST);
          Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_POLL_SATA_MIN_BURST check
        if((xil_attr_test) or
           ((USB_POLL_SATA_MIN_BURST < 1) or (USB_POLL_SATA_MIN_BURST > 61))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-760] USB_POLL_SATA_MIN_BURST attribute is set to "));
          Write ( Message, USB_POLL_SATA_MIN_BURST);
          Write ( Message, string'(". Legal values for this attribute are 1 to 61. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_U1_SATA_MAX_WAKE check
        if((xil_attr_test) or
           ((USB_U1_SATA_MAX_WAKE < 1) or (USB_U1_SATA_MAX_WAKE > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-764] USB_U1_SATA_MAX_WAKE attribute is set to "));
          Write ( Message, USB_U1_SATA_MAX_WAKE);
          Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_U1_SATA_MIN_WAKE check
        if((xil_attr_test) or
           ((USB_U1_SATA_MIN_WAKE < 1) or (USB_U1_SATA_MIN_WAKE > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-765] USB_U1_SATA_MIN_WAKE attribute is set to "));
          Write ( Message, USB_U1_SATA_MIN_WAKE);
          Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_U2_SAS_MAX_COM check
        if((xil_attr_test) or
           ((USB_U2_SAS_MAX_COM < 1) or (USB_U2_SAS_MAX_COM > 127))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-766] USB_U2_SAS_MAX_COM attribute is set to "));
          Write ( Message, USB_U2_SAS_MAX_COM);
          Write ( Message, string'(". Legal values for this attribute are 1 to 127. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USB_U2_SAS_MIN_COM check
        if((xil_attr_test) or
           ((USB_U2_SAS_MIN_COM < 1) or (USB_U2_SAS_MIN_COM > 63))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-767] USB_U2_SAS_MIN_COM attribute is set to "));
          Write ( Message, USB_U2_SAS_MIN_COM);
          Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-210] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE4_CHANNEL_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    SIP_GTYE4_CHANNEL_INST : SIP_GTYE4_CHANNEL
      port map (
        ACJTAG_DEBUG_MODE    => ACJTAG_DEBUG_MODE_BIN,
        ACJTAG_MODE          => ACJTAG_MODE_BIN,
        ACJTAG_RESET         => ACJTAG_RESET_BIN,
        ADAPT_CFG0           => ADAPT_CFG0_BIN,
        ADAPT_CFG1           => ADAPT_CFG1_BIN,
        ADAPT_CFG2           => ADAPT_CFG2_BIN,
        AEN_CDRSTEPSEL       => AEN_CDRSTEPSEL_BIN,
        AEN_CPLL             => AEN_CPLL_BIN,
        AEN_LOOPBACK         => AEN_LOOPBACK_BIN,
        AEN_MASTER           => AEN_MASTER_BIN,
        AEN_PD_AND_EIDLE     => AEN_PD_AND_EIDLE_BIN,
        AEN_POLARITY         => AEN_POLARITY_BIN,
        AEN_PRBS             => AEN_PRBS_BIN,
        AEN_RESET            => AEN_RESET_BIN,
        AEN_RXCDR            => AEN_RXCDR_BIN,
        AEN_RXDFE            => AEN_RXDFE_BIN,
        AEN_RXDFELPM         => AEN_RXDFELPM_BIN,
        AEN_RXOUTCLK_SEL     => AEN_RXOUTCLK_SEL_BIN,
        AEN_RXPHDLY          => AEN_RXPHDLY_BIN,
        AEN_RXPLLCLK_SEL     => AEN_RXPLLCLK_SEL_BIN,
        AEN_RXSYSCLK_SEL     => AEN_RXSYSCLK_SEL_BIN,
        AEN_TXMUXDCD         => AEN_TXMUXDCD_BIN,
        AEN_TXOUTCLK_SEL     => AEN_TXOUTCLK_SEL_BIN,
        AEN_TXPHDLY          => AEN_TXPHDLY_BIN,
        AEN_TXPI_PPM         => AEN_TXPI_PPM_BIN,
        AEN_TXPLLCLK_SEL     => AEN_TXPLLCLK_SEL_BIN,
        AEN_TXSYSCLK_SEL     => AEN_TXSYSCLK_SEL_BIN,
        AEN_TX_DRIVE_MODE    => AEN_TX_DRIVE_MODE_BIN,
        ALIGN_COMMA_DOUBLE   => ALIGN_COMMA_DOUBLE_BIN,
        ALIGN_COMMA_ENABLE   => ALIGN_COMMA_ENABLE_BIN,
        ALIGN_COMMA_WORD     => ALIGN_COMMA_WORD_BIN,
        ALIGN_MCOMMA_DET     => ALIGN_MCOMMA_DET_BIN,
        ALIGN_MCOMMA_VALUE   => ALIGN_MCOMMA_VALUE_BIN,
        ALIGN_PCOMMA_DET     => ALIGN_PCOMMA_DET_BIN,
        ALIGN_PCOMMA_VALUE   => ALIGN_PCOMMA_VALUE_BIN,
        AMONITOR_CFG         => AMONITOR_CFG_BIN,
        A_CPLLLOCKEN         => A_CPLLLOCKEN_BIN,
        A_CPLLPD             => A_CPLLPD_BIN,
        A_CPLLRESET          => A_CPLLRESET_BIN,
        A_EYESCANRESET       => A_EYESCANRESET_BIN,
        A_GTRESETSEL         => A_GTRESETSEL_BIN,
        A_GTRXRESET          => A_GTRXRESET_BIN,
        A_GTTXRESET          => A_GTTXRESET_BIN,
        A_LOOPBACK           => A_LOOPBACK_BIN,
        A_RXAFECFOKEN        => A_RXAFECFOKEN_BIN,
        A_RXBUFRESET         => A_RXBUFRESET_BIN,
        A_RXCDRFREQRESET     => A_RXCDRFREQRESET_BIN,
        A_RXCDRHOLD          => A_RXCDRHOLD_BIN,
        A_RXCDROVRDEN        => A_RXCDROVRDEN_BIN,
        A_RXCDRRESET         => A_RXCDRRESET_BIN,
        A_RXCKCALRESET       => A_RXCKCALRESET_BIN,
        A_RXDFEAGCHOLD       => A_RXDFEAGCHOLD_BIN,
        A_RXDFEAGCOVRDEN     => A_RXDFEAGCOVRDEN_BIN,
        A_RXDFECFOKFCNUM     => A_RXDFECFOKFCNUM_BIN,
        A_RXDFECFOKFEN       => A_RXDFECFOKFEN_BIN,
        A_RXDFECFOKFPULSE    => A_RXDFECFOKFPULSE_BIN,
        A_RXDFECFOKHOLD      => A_RXDFECFOKHOLD_BIN,
        A_RXDFECFOKOVREN     => A_RXDFECFOKOVREN_BIN,
        A_RXDFEKHHOLD        => A_RXDFEKHHOLD_BIN,
        A_RXDFEKHOVRDEN      => A_RXDFEKHOVRDEN_BIN,
        A_RXDFELFHOLD        => A_RXDFELFHOLD_BIN,
        A_RXDFELFOVRDEN      => A_RXDFELFOVRDEN_BIN,
        A_RXDFELPMRESET      => A_RXDFELPMRESET_BIN,
        A_RXDFETAP10HOLD     => A_RXDFETAP10HOLD_BIN,
        A_RXDFETAP10OVRDEN   => A_RXDFETAP10OVRDEN_BIN,
        A_RXDFETAP11HOLD     => A_RXDFETAP11HOLD_BIN,
        A_RXDFETAP11OVRDEN   => A_RXDFETAP11OVRDEN_BIN,
        A_RXDFETAP12HOLD     => A_RXDFETAP12HOLD_BIN,
        A_RXDFETAP12OVRDEN   => A_RXDFETAP12OVRDEN_BIN,
        A_RXDFETAP13HOLD     => A_RXDFETAP13HOLD_BIN,
        A_RXDFETAP13OVRDEN   => A_RXDFETAP13OVRDEN_BIN,
        A_RXDFETAP14HOLD     => A_RXDFETAP14HOLD_BIN,
        A_RXDFETAP14OVRDEN   => A_RXDFETAP14OVRDEN_BIN,
        A_RXDFETAP15HOLD     => A_RXDFETAP15HOLD_BIN,
        A_RXDFETAP15OVRDEN   => A_RXDFETAP15OVRDEN_BIN,
        A_RXDFETAP2HOLD      => A_RXDFETAP2HOLD_BIN,
        A_RXDFETAP2OVRDEN    => A_RXDFETAP2OVRDEN_BIN,
        A_RXDFETAP3HOLD      => A_RXDFETAP3HOLD_BIN,
        A_RXDFETAP3OVRDEN    => A_RXDFETAP3OVRDEN_BIN,
        A_RXDFETAP4HOLD      => A_RXDFETAP4HOLD_BIN,
        A_RXDFETAP4OVRDEN    => A_RXDFETAP4OVRDEN_BIN,
        A_RXDFETAP5HOLD      => A_RXDFETAP5HOLD_BIN,
        A_RXDFETAP5OVRDEN    => A_RXDFETAP5OVRDEN_BIN,
        A_RXDFETAP6HOLD      => A_RXDFETAP6HOLD_BIN,
        A_RXDFETAP6OVRDEN    => A_RXDFETAP6OVRDEN_BIN,
        A_RXDFETAP7HOLD      => A_RXDFETAP7HOLD_BIN,
        A_RXDFETAP7OVRDEN    => A_RXDFETAP7OVRDEN_BIN,
        A_RXDFETAP8HOLD      => A_RXDFETAP8HOLD_BIN,
        A_RXDFETAP8OVRDEN    => A_RXDFETAP8OVRDEN_BIN,
        A_RXDFETAP9HOLD      => A_RXDFETAP9HOLD_BIN,
        A_RXDFETAP9OVRDEN    => A_RXDFETAP9OVRDEN_BIN,
        A_RXDFEUTHOLD        => A_RXDFEUTHOLD_BIN,
        A_RXDFEUTOVRDEN      => A_RXDFEUTOVRDEN_BIN,
        A_RXDFEVPHOLD        => A_RXDFEVPHOLD_BIN,
        A_RXDFEVPOVRDEN      => A_RXDFEVPOVRDEN_BIN,
        A_RXDFEXYDEN         => A_RXDFEXYDEN_BIN,
        A_RXDLYBYPASS        => A_RXDLYBYPASS_BIN,
        A_RXDLYEN            => A_RXDLYEN_BIN,
        A_RXDLYOVRDEN        => A_RXDLYOVRDEN_BIN,
        A_RXDLYSRESET        => A_RXDLYSRESET_BIN,
        A_RXLPMEN            => A_RXLPMEN_BIN,
        A_RXLPMGCHOLD        => A_RXLPMGCHOLD_BIN,
        A_RXLPMGCOVRDEN      => A_RXLPMGCOVRDEN_BIN,
        A_RXLPMHFHOLD        => A_RXLPMHFHOLD_BIN,
        A_RXLPMHFOVRDEN      => A_RXLPMHFOVRDEN_BIN,
        A_RXLPMLFHOLD        => A_RXLPMLFHOLD_BIN,
        A_RXLPMLFKLOVRDEN    => A_RXLPMLFKLOVRDEN_BIN,
        A_RXLPMOSHOLD        => A_RXLPMOSHOLD_BIN,
        A_RXLPMOSOVRDEN      => A_RXLPMOSOVRDEN_BIN,
        A_RXMONITORSEL       => A_RXMONITORSEL_BIN,
        A_RXOOBRESET         => A_RXOOBRESET_BIN,
        A_RXOSCALRESET       => A_RXOSCALRESET_BIN,
        A_RXOSHOLD           => A_RXOSHOLD_BIN,
        A_RXOSOVRDEN         => A_RXOSOVRDEN_BIN,
        A_RXOUTCLKSEL        => A_RXOUTCLKSEL_BIN,
        A_RXPCSRESET         => A_RXPCSRESET_BIN,
        A_RXPD               => A_RXPD_BIN,
        A_RXPHALIGN          => A_RXPHALIGN_BIN,
        A_RXPHALIGNEN        => A_RXPHALIGNEN_BIN,
        A_RXPHDLYPD          => A_RXPHDLYPD_BIN,
        A_RXPHDLYRESET       => A_RXPHDLYRESET_BIN,
        A_RXPLLCLKSEL        => A_RXPLLCLKSEL_BIN,
        A_RXPMARESET         => A_RXPMARESET_BIN,
        A_RXPOLARITY         => A_RXPOLARITY_BIN,
        A_RXPRBSCNTRESET     => A_RXPRBSCNTRESET_BIN,
        A_RXPRBSSEL          => A_RXPRBSSEL_BIN,
        A_RXPROGDIVRESET     => A_RXPROGDIVRESET_BIN,
        A_RXSYSCLKSEL        => A_RXSYSCLKSEL_BIN,
        A_RXTERMINATION      => A_RXTERMINATION_BIN,
        A_TXBUFDIFFCTRL      => A_TXBUFDIFFCTRL_BIN,
        A_TXDCCRESET         => A_TXDCCRESET_BIN,
        A_TXDEEMPH           => A_TXDEEMPH_BIN,
        A_TXDIFFCTRL         => A_TXDIFFCTRL_BIN,
        A_TXDLYBYPASS        => A_TXDLYBYPASS_BIN,
        A_TXDLYEN            => A_TXDLYEN_BIN,
        A_TXDLYOVRDEN        => A_TXDLYOVRDEN_BIN,
        A_TXDLYSRESET        => A_TXDLYSRESET_BIN,
        A_TXELECIDLE         => A_TXELECIDLE_BIN,
        A_TXINHIBIT          => A_TXINHIBIT_BIN,
        A_TXMAINCURSOR       => A_TXMAINCURSOR_BIN,
        A_TXMARGIN           => A_TXMARGIN_BIN,
        A_TXMUXDCDEXHOLD     => A_TXMUXDCDEXHOLD_BIN,
        A_TXMUXDCDORWREN     => A_TXMUXDCDORWREN_BIN,
        A_TXOUTCLKSEL        => A_TXOUTCLKSEL_BIN,
        A_TXPCSRESET         => A_TXPCSRESET_BIN,
        A_TXPD               => A_TXPD_BIN,
        A_TXPHALIGN          => A_TXPHALIGN_BIN,
        A_TXPHALIGNEN        => A_TXPHALIGNEN_BIN,
        A_TXPHDLYPD          => A_TXPHDLYPD_BIN,
        A_TXPHDLYRESET       => A_TXPHDLYRESET_BIN,
        A_TXPHINIT           => A_TXPHINIT_BIN,
        A_TXPHOVRDEN         => A_TXPHOVRDEN_BIN,
        A_TXPIPPMOVRDEN      => A_TXPIPPMOVRDEN_BIN,
        A_TXPIPPMPD          => A_TXPIPPMPD_BIN,
        A_TXPIPPMSEL         => A_TXPIPPMSEL_BIN,
        A_TXPLLCLKSEL        => A_TXPLLCLKSEL_BIN,
        A_TXPMARESET         => A_TXPMARESET_BIN,
        A_TXPOLARITY         => A_TXPOLARITY_BIN,
        A_TXPOSTCURSOR       => A_TXPOSTCURSOR_BIN,
        A_TXPRBSFORCEERR     => A_TXPRBSFORCEERR_BIN,
        A_TXPRBSSEL          => A_TXPRBSSEL_BIN,
        A_TXPRECURSOR        => A_TXPRECURSOR_BIN,
        A_TXPROGDIVRESET     => A_TXPROGDIVRESET_BIN,
        A_TXRESETSEL         => A_TXRESETSEL_BIN,
        A_TXSWING            => A_TXSWING_BIN,
        A_TXSYSCLKSEL        => A_TXSYSCLKSEL_BIN,
        BSR_ENABLE           => BSR_ENABLE_BIN,
        CBCC_DATA_SOURCE_SEL => CBCC_DATA_SOURCE_SEL_BIN,
        CDR_SWAP_MODE_EN     => CDR_SWAP_MODE_EN_BIN,
        CFOK_PWRSVE_EN       => CFOK_PWRSVE_EN_BIN,
        CHAN_BOND_KEEP_ALIGN => CHAN_BOND_KEEP_ALIGN_BIN,
        CHAN_BOND_MAX_SKEW   => CHAN_BOND_MAX_SKEW_BIN,
        CHAN_BOND_SEQ_1_1    => CHAN_BOND_SEQ_1_1_BIN,
        CHAN_BOND_SEQ_1_2    => CHAN_BOND_SEQ_1_2_BIN,
        CHAN_BOND_SEQ_1_3    => CHAN_BOND_SEQ_1_3_BIN,
        CHAN_BOND_SEQ_1_4    => CHAN_BOND_SEQ_1_4_BIN,
        CHAN_BOND_SEQ_1_ENABLE => CHAN_BOND_SEQ_1_ENABLE_BIN,
        CHAN_BOND_SEQ_2_1    => CHAN_BOND_SEQ_2_1_BIN,
        CHAN_BOND_SEQ_2_2    => CHAN_BOND_SEQ_2_2_BIN,
        CHAN_BOND_SEQ_2_3    => CHAN_BOND_SEQ_2_3_BIN,
        CHAN_BOND_SEQ_2_4    => CHAN_BOND_SEQ_2_4_BIN,
        CHAN_BOND_SEQ_2_ENABLE => CHAN_BOND_SEQ_2_ENABLE_BIN,
        CHAN_BOND_SEQ_2_USE  => CHAN_BOND_SEQ_2_USE_BIN,
        CHAN_BOND_SEQ_LEN    => CHAN_BOND_SEQ_LEN_BIN,
        CH_HSPMUX            => CH_HSPMUX_BIN,
        CKCAL1_CFG_0         => CKCAL1_CFG_0_BIN,
        CKCAL1_CFG_1         => CKCAL1_CFG_1_BIN,
        CKCAL1_CFG_2         => CKCAL1_CFG_2_BIN,
        CKCAL1_CFG_3         => CKCAL1_CFG_3_BIN,
        CKCAL2_CFG_0         => CKCAL2_CFG_0_BIN,
        CKCAL2_CFG_1         => CKCAL2_CFG_1_BIN,
        CKCAL2_CFG_2         => CKCAL2_CFG_2_BIN,
        CKCAL2_CFG_3         => CKCAL2_CFG_3_BIN,
        CKCAL2_CFG_4         => CKCAL2_CFG_4_BIN,
        CLK_CORRECT_USE      => CLK_CORRECT_USE_BIN,
        CLK_COR_KEEP_IDLE    => CLK_COR_KEEP_IDLE_BIN,
        CLK_COR_MAX_LAT      => CLK_COR_MAX_LAT_BIN,
        CLK_COR_MIN_LAT      => CLK_COR_MIN_LAT_BIN,
        CLK_COR_PRECEDENCE   => CLK_COR_PRECEDENCE_BIN,
        CLK_COR_REPEAT_WAIT  => CLK_COR_REPEAT_WAIT_BIN,
        CLK_COR_SEQ_1_1      => CLK_COR_SEQ_1_1_BIN,
        CLK_COR_SEQ_1_2      => CLK_COR_SEQ_1_2_BIN,
        CLK_COR_SEQ_1_3      => CLK_COR_SEQ_1_3_BIN,
        CLK_COR_SEQ_1_4      => CLK_COR_SEQ_1_4_BIN,
        CLK_COR_SEQ_1_ENABLE => CLK_COR_SEQ_1_ENABLE_BIN,
        CLK_COR_SEQ_2_1      => CLK_COR_SEQ_2_1_BIN,
        CLK_COR_SEQ_2_2      => CLK_COR_SEQ_2_2_BIN,
        CLK_COR_SEQ_2_3      => CLK_COR_SEQ_2_3_BIN,
        CLK_COR_SEQ_2_4      => CLK_COR_SEQ_2_4_BIN,
        CLK_COR_SEQ_2_ENABLE => CLK_COR_SEQ_2_ENABLE_BIN,
        CLK_COR_SEQ_2_USE    => CLK_COR_SEQ_2_USE_BIN,
        CLK_COR_SEQ_LEN      => CLK_COR_SEQ_LEN_BIN,
        CPLL_CFG0            => CPLL_CFG0_BIN,
        CPLL_CFG1            => CPLL_CFG1_BIN,
        CPLL_CFG2            => CPLL_CFG2_BIN,
        CPLL_CFG3            => CPLL_CFG3_BIN,
        CPLL_FBDIV           => CPLL_FBDIV_BIN,
        CPLL_FBDIV_45        => CPLL_FBDIV_45_BIN,
        CPLL_INIT_CFG0       => CPLL_INIT_CFG0_BIN,
        CPLL_LOCK_CFG        => CPLL_LOCK_CFG_BIN,
        CPLL_REFCLK_DIV      => CPLL_REFCLK_DIV_BIN,
        CSSD_CLK_MASK0       => CSSD_CLK_MASK0_BIN,
        CSSD_CLK_MASK1       => CSSD_CLK_MASK1_BIN,
        CSSD_REG0            => CSSD_REG0_BIN,
        CSSD_REG1            => CSSD_REG1_BIN,
        CSSD_REG10           => CSSD_REG10_BIN,
        CSSD_REG2            => CSSD_REG2_BIN,
        CSSD_REG3            => CSSD_REG3_BIN,
        CSSD_REG4            => CSSD_REG4_BIN,
        CSSD_REG5            => CSSD_REG5_BIN,
        CSSD_REG6            => CSSD_REG6_BIN,
        CSSD_REG7            => CSSD_REG7_BIN,
        CSSD_REG8            => CSSD_REG8_BIN,
        CSSD_REG9            => CSSD_REG9_BIN,
        CTLE3_OCAP_EXT_CTRL  => CTLE3_OCAP_EXT_CTRL_BIN,
        CTLE3_OCAP_EXT_EN    => CTLE3_OCAP_EXT_EN_BIN,
        DDI_CTRL             => DDI_CTRL_BIN,
        DDI_REALIGN_WAIT     => DDI_REALIGN_WAIT_BIN,
        DEC_MCOMMA_DETECT    => DEC_MCOMMA_DETECT_BIN,
        DEC_PCOMMA_DETECT    => DEC_PCOMMA_DETECT_BIN,
        DEC_VALID_COMMA_ONLY => DEC_VALID_COMMA_ONLY_BIN,
        DELAY_ELEC           => DELAY_ELEC_BIN,
        DMONITOR_CFG0        => DMONITOR_CFG0_BIN,
        DMONITOR_CFG1        => DMONITOR_CFG1_BIN,
        ES_CLK_PHASE_SEL     => ES_CLK_PHASE_SEL_BIN,
        ES_CONTROL           => ES_CONTROL_BIN,
        ES_ERRDET_EN         => ES_ERRDET_EN_BIN,
        ES_EYE_SCAN_EN       => ES_EYE_SCAN_EN_BIN,
        ES_HORZ_OFFSET       => ES_HORZ_OFFSET_BIN,
        ES_PRESCALE          => ES_PRESCALE_BIN,
        ES_QUALIFIER0        => ES_QUALIFIER0_BIN,
        ES_QUALIFIER1        => ES_QUALIFIER1_BIN,
        ES_QUALIFIER2        => ES_QUALIFIER2_BIN,
        ES_QUALIFIER3        => ES_QUALIFIER3_BIN,
        ES_QUALIFIER4        => ES_QUALIFIER4_BIN,
        ES_QUALIFIER5        => ES_QUALIFIER5_BIN,
        ES_QUALIFIER6        => ES_QUALIFIER6_BIN,
        ES_QUALIFIER7        => ES_QUALIFIER7_BIN,
        ES_QUALIFIER8        => ES_QUALIFIER8_BIN,
        ES_QUALIFIER9        => ES_QUALIFIER9_BIN,
        ES_QUAL_MASK0        => ES_QUAL_MASK0_BIN,
        ES_QUAL_MASK1        => ES_QUAL_MASK1_BIN,
        ES_QUAL_MASK2        => ES_QUAL_MASK2_BIN,
        ES_QUAL_MASK3        => ES_QUAL_MASK3_BIN,
        ES_QUAL_MASK4        => ES_QUAL_MASK4_BIN,
        ES_QUAL_MASK5        => ES_QUAL_MASK5_BIN,
        ES_QUAL_MASK6        => ES_QUAL_MASK6_BIN,
        ES_QUAL_MASK7        => ES_QUAL_MASK7_BIN,
        ES_QUAL_MASK8        => ES_QUAL_MASK8_BIN,
        ES_QUAL_MASK9        => ES_QUAL_MASK9_BIN,
        ES_SDATA_MASK0       => ES_SDATA_MASK0_BIN,
        ES_SDATA_MASK1       => ES_SDATA_MASK1_BIN,
        ES_SDATA_MASK2       => ES_SDATA_MASK2_BIN,
        ES_SDATA_MASK3       => ES_SDATA_MASK3_BIN,
        ES_SDATA_MASK4       => ES_SDATA_MASK4_BIN,
        ES_SDATA_MASK5       => ES_SDATA_MASK5_BIN,
        ES_SDATA_MASK6       => ES_SDATA_MASK6_BIN,
        ES_SDATA_MASK7       => ES_SDATA_MASK7_BIN,
        ES_SDATA_MASK8       => ES_SDATA_MASK8_BIN,
        ES_SDATA_MASK9       => ES_SDATA_MASK9_BIN,
        EYESCAN_VP_RANGE     => EYESCAN_VP_RANGE_BIN,
        EYE_SCAN_SWAP_EN     => EYE_SCAN_SWAP_EN_BIN,
        FTS_DESKEW_SEQ_ENABLE => FTS_DESKEW_SEQ_ENABLE_BIN,
        FTS_LANE_DESKEW_CFG  => FTS_LANE_DESKEW_CFG_BIN,
        FTS_LANE_DESKEW_EN   => FTS_LANE_DESKEW_EN_BIN,
        GEARBOX_MODE         => GEARBOX_MODE_BIN,
        GEN_RXUSRCLK         => GEN_RXUSRCLK_BIN,
        GEN_TXUSRCLK         => GEN_TXUSRCLK_BIN,
        GT_INSTANTIATED      => GT_INSTANTIATED_BIN,
        INT_MASK_CFG0        => INT_MASK_CFG0_BIN,
        INT_MASK_CFG1        => INT_MASK_CFG1_BIN,
        ISCAN_CK_PH_SEL2     => ISCAN_CK_PH_SEL2_BIN,
        LOCAL_MASTER         => LOCAL_MASTER_BIN,
        LPBK_BIAS_CTRL       => LPBK_BIAS_CTRL_BIN,
        LPBK_EN_RCAL_B       => LPBK_EN_RCAL_B_BIN,
        LPBK_EXT_RCAL        => LPBK_EXT_RCAL_BIN,
        LPBK_IND_CTRL0       => LPBK_IND_CTRL0_BIN,
        LPBK_IND_CTRL1       => LPBK_IND_CTRL1_BIN,
        LPBK_IND_CTRL2       => LPBK_IND_CTRL2_BIN,
        LPBK_RG_CTRL         => LPBK_RG_CTRL_BIN,
        OOBDIVCTL            => OOBDIVCTL_BIN,
        OOB_PWRUP            => OOB_PWRUP_BIN,
        PCI3_AUTO_REALIGN    => PCI3_AUTO_REALIGN_BIN,
        PCI3_PIPE_RX_ELECIDLE => PCI3_PIPE_RX_ELECIDLE_BIN,
        PCI3_RX_ASYNC_EBUF_BYPASS => PCI3_RX_ASYNC_EBUF_BYPASS_BIN,
        PCI3_RX_ELECIDLE_EI2_ENABLE => PCI3_RX_ELECIDLE_EI2_ENABLE_BIN,
        PCI3_RX_ELECIDLE_H2L_COUNT => PCI3_RX_ELECIDLE_H2L_COUNT_BIN,
        PCI3_RX_ELECIDLE_H2L_DISABLE => PCI3_RX_ELECIDLE_H2L_DISABLE_BIN,
        PCI3_RX_ELECIDLE_HI_COUNT => PCI3_RX_ELECIDLE_HI_COUNT_BIN,
        PCI3_RX_ELECIDLE_LP4_DISABLE => PCI3_RX_ELECIDLE_LP4_DISABLE_BIN,
        PCI3_RX_FIFO_DISABLE => PCI3_RX_FIFO_DISABLE_BIN,
        PCIE3_CLK_COR_EMPTY_THRSH => PCIE3_CLK_COR_EMPTY_THRSH_BIN,
        PCIE3_CLK_COR_FULL_THRSH => PCIE3_CLK_COR_FULL_THRSH_BIN,
        PCIE3_CLK_COR_MAX_LAT => PCIE3_CLK_COR_MAX_LAT_BIN,
        PCIE3_CLK_COR_MIN_LAT => PCIE3_CLK_COR_MIN_LAT_BIN,
        PCIE3_CLK_COR_THRSH_TIMER => PCIE3_CLK_COR_THRSH_TIMER_BIN,
        PCIE_64B_DYN_CLKSW_DIS => PCIE_64B_DYN_CLKSW_DIS_BIN,
        PCIE_BUFG_DIV_CTRL   => PCIE_BUFG_DIV_CTRL_BIN,
        PCIE_GEN4_64BIT_INT_EN => PCIE_GEN4_64BIT_INT_EN_BIN,
        PCIE_PLL_SEL_MODE_GEN12 => PCIE_PLL_SEL_MODE_GEN12_BIN,
        PCIE_PLL_SEL_MODE_GEN3 => PCIE_PLL_SEL_MODE_GEN3_BIN,
        PCIE_PLL_SEL_MODE_GEN4 => PCIE_PLL_SEL_MODE_GEN4_BIN,
        PCIE_RXPCS_CFG_GEN3  => PCIE_RXPCS_CFG_GEN3_BIN,
        PCIE_RXPMA_CFG       => PCIE_RXPMA_CFG_BIN,
        PCIE_TXPCS_CFG_GEN3  => PCIE_TXPCS_CFG_GEN3_BIN,
        PCIE_TXPMA_CFG       => PCIE_TXPMA_CFG_BIN,
        PCS_PCIE_EN          => PCS_PCIE_EN_BIN,
        PCS_RSVD0            => PCS_RSVD0_BIN,
        PD_TRANS_TIME_FROM_P2 => PD_TRANS_TIME_FROM_P2_BIN,
        PD_TRANS_TIME_NONE_P2 => PD_TRANS_TIME_NONE_P2_BIN,
        PD_TRANS_TIME_TO_P2  => PD_TRANS_TIME_TO_P2_BIN,
        PREIQ_FREQ_BST       => PREIQ_FREQ_BST_BIN,
        RATE_SW_USE_DRP      => RATE_SW_USE_DRP_BIN,
        RCLK_SIPO_DLY_ENB    => RCLK_SIPO_DLY_ENB_BIN,
        RCLK_SIPO_INV_EN     => RCLK_SIPO_INV_EN_BIN,
        RTX_BUF_CML_CTRL     => RTX_BUF_CML_CTRL_BIN,
        RTX_BUF_TERM_CTRL    => RTX_BUF_TERM_CTRL_BIN,
        RXBUFRESET_TIME      => RXBUFRESET_TIME_BIN,
        RXBUF_ADDR_MODE      => RXBUF_ADDR_MODE_BIN,
        RXBUF_EIDLE_HI_CNT   => RXBUF_EIDLE_HI_CNT_BIN,
        RXBUF_EIDLE_LO_CNT   => RXBUF_EIDLE_LO_CNT_BIN,
        RXBUF_EN             => RXBUF_EN_BIN,
        RXBUF_RESET_ON_CB_CHANGE => RXBUF_RESET_ON_CB_CHANGE_BIN,
        RXBUF_RESET_ON_COMMAALIGN => RXBUF_RESET_ON_COMMAALIGN_BIN,
        RXBUF_RESET_ON_EIDLE => RXBUF_RESET_ON_EIDLE_BIN,
        RXBUF_RESET_ON_RATE_CHANGE => RXBUF_RESET_ON_RATE_CHANGE_BIN,
        RXBUF_THRESH_OVFLW   => RXBUF_THRESH_OVFLW_BIN,
        RXBUF_THRESH_OVRD    => RXBUF_THRESH_OVRD_BIN,
        RXBUF_THRESH_UNDFLW  => RXBUF_THRESH_UNDFLW_BIN,
        RXCDRFREQRESET_TIME  => RXCDRFREQRESET_TIME_BIN,
        RXCDRPHRESET_TIME    => RXCDRPHRESET_TIME_BIN,
        RXCDR_CFG0           => RXCDR_CFG0_BIN,
        RXCDR_CFG0_GEN3      => RXCDR_CFG0_GEN3_BIN,
        RXCDR_CFG1           => RXCDR_CFG1_BIN,
        RXCDR_CFG1_GEN3      => RXCDR_CFG1_GEN3_BIN,
        RXCDR_CFG2           => RXCDR_CFG2_BIN,
        RXCDR_CFG2_GEN2      => RXCDR_CFG2_GEN2_BIN,
        RXCDR_CFG2_GEN3      => RXCDR_CFG2_GEN3_BIN,
        RXCDR_CFG2_GEN4      => RXCDR_CFG2_GEN4_BIN,
        RXCDR_CFG3           => RXCDR_CFG3_BIN,
        RXCDR_CFG3_GEN2      => RXCDR_CFG3_GEN2_BIN,
        RXCDR_CFG3_GEN3      => RXCDR_CFG3_GEN3_BIN,
        RXCDR_CFG3_GEN4      => RXCDR_CFG3_GEN4_BIN,
        RXCDR_CFG4           => RXCDR_CFG4_BIN,
        RXCDR_CFG4_GEN3      => RXCDR_CFG4_GEN3_BIN,
        RXCDR_CFG5           => RXCDR_CFG5_BIN,
        RXCDR_CFG5_GEN3      => RXCDR_CFG5_GEN3_BIN,
        RXCDR_FR_RESET_ON_EIDLE => RXCDR_FR_RESET_ON_EIDLE_BIN,
        RXCDR_HOLD_DURING_EIDLE => RXCDR_HOLD_DURING_EIDLE_BIN,
        RXCDR_LOCK_CFG0      => RXCDR_LOCK_CFG0_BIN,
        RXCDR_LOCK_CFG1      => RXCDR_LOCK_CFG1_BIN,
        RXCDR_LOCK_CFG2      => RXCDR_LOCK_CFG2_BIN,
        RXCDR_LOCK_CFG3      => RXCDR_LOCK_CFG3_BIN,
        RXCDR_LOCK_CFG4      => RXCDR_LOCK_CFG4_BIN,
        RXCDR_PH_RESET_ON_EIDLE => RXCDR_PH_RESET_ON_EIDLE_BIN,
        RXCFOK_CFG0          => RXCFOK_CFG0_BIN,
        RXCFOK_CFG1          => RXCFOK_CFG1_BIN,
        RXCFOK_CFG2          => RXCFOK_CFG2_BIN,
        RXCKCAL1_IQ_LOOP_RST_CFG => RXCKCAL1_IQ_LOOP_RST_CFG_BIN,
        RXCKCAL1_I_LOOP_RST_CFG => RXCKCAL1_I_LOOP_RST_CFG_BIN,
        RXCKCAL1_Q_LOOP_RST_CFG => RXCKCAL1_Q_LOOP_RST_CFG_BIN,
        RXCKCAL2_DX_LOOP_RST_CFG => RXCKCAL2_DX_LOOP_RST_CFG_BIN,
        RXCKCAL2_D_LOOP_RST_CFG => RXCKCAL2_D_LOOP_RST_CFG_BIN,
        RXCKCAL2_S_LOOP_RST_CFG => RXCKCAL2_S_LOOP_RST_CFG_BIN,
        RXCKCAL2_X_LOOP_RST_CFG => RXCKCAL2_X_LOOP_RST_CFG_BIN,
        RXDFELPMRESET_TIME   => RXDFELPMRESET_TIME_BIN,
        RXDFELPM_KL_CFG0     => RXDFELPM_KL_CFG0_BIN,
        RXDFELPM_KL_CFG1     => RXDFELPM_KL_CFG1_BIN,
        RXDFELPM_KL_CFG2     => RXDFELPM_KL_CFG2_BIN,
        RXDFE_CFG0           => RXDFE_CFG0_BIN,
        RXDFE_CFG1           => RXDFE_CFG1_BIN,
        RXDFE_GC_CFG0        => RXDFE_GC_CFG0_BIN,
        RXDFE_GC_CFG1        => RXDFE_GC_CFG1_BIN,
        RXDFE_GC_CFG2        => RXDFE_GC_CFG2_BIN,
        RXDFE_H2_CFG0        => RXDFE_H2_CFG0_BIN,
        RXDFE_H2_CFG1        => RXDFE_H2_CFG1_BIN,
        RXDFE_H3_CFG0        => RXDFE_H3_CFG0_BIN,
        RXDFE_H3_CFG1        => RXDFE_H3_CFG1_BIN,
        RXDFE_H4_CFG0        => RXDFE_H4_CFG0_BIN,
        RXDFE_H4_CFG1        => RXDFE_H4_CFG1_BIN,
        RXDFE_H5_CFG0        => RXDFE_H5_CFG0_BIN,
        RXDFE_H5_CFG1        => RXDFE_H5_CFG1_BIN,
        RXDFE_H6_CFG0        => RXDFE_H6_CFG0_BIN,
        RXDFE_H6_CFG1        => RXDFE_H6_CFG1_BIN,
        RXDFE_H7_CFG0        => RXDFE_H7_CFG0_BIN,
        RXDFE_H7_CFG1        => RXDFE_H7_CFG1_BIN,
        RXDFE_H8_CFG0        => RXDFE_H8_CFG0_BIN,
        RXDFE_H8_CFG1        => RXDFE_H8_CFG1_BIN,
        RXDFE_H9_CFG0        => RXDFE_H9_CFG0_BIN,
        RXDFE_H9_CFG1        => RXDFE_H9_CFG1_BIN,
        RXDFE_HA_CFG0        => RXDFE_HA_CFG0_BIN,
        RXDFE_HA_CFG1        => RXDFE_HA_CFG1_BIN,
        RXDFE_HB_CFG0        => RXDFE_HB_CFG0_BIN,
        RXDFE_HB_CFG1        => RXDFE_HB_CFG1_BIN,
        RXDFE_HC_CFG0        => RXDFE_HC_CFG0_BIN,
        RXDFE_HC_CFG1        => RXDFE_HC_CFG1_BIN,
        RXDFE_HD_CFG0        => RXDFE_HD_CFG0_BIN,
        RXDFE_HD_CFG1        => RXDFE_HD_CFG1_BIN,
        RXDFE_HE_CFG0        => RXDFE_HE_CFG0_BIN,
        RXDFE_HE_CFG1        => RXDFE_HE_CFG1_BIN,
        RXDFE_HF_CFG0        => RXDFE_HF_CFG0_BIN,
        RXDFE_HF_CFG1        => RXDFE_HF_CFG1_BIN,
        RXDFE_KH_CFG0        => RXDFE_KH_CFG0_BIN,
        RXDFE_KH_CFG1        => RXDFE_KH_CFG1_BIN,
        RXDFE_KH_CFG2        => RXDFE_KH_CFG2_BIN,
        RXDFE_KH_CFG3        => RXDFE_KH_CFG3_BIN,
        RXDFE_OS_CFG0        => RXDFE_OS_CFG0_BIN,
        RXDFE_OS_CFG1        => RXDFE_OS_CFG1_BIN,
        RXDFE_UT_CFG0        => RXDFE_UT_CFG0_BIN,
        RXDFE_UT_CFG1        => RXDFE_UT_CFG1_BIN,
        RXDFE_UT_CFG2        => RXDFE_UT_CFG2_BIN,
        RXDFE_VP_CFG0        => RXDFE_VP_CFG0_BIN,
        RXDFE_VP_CFG1        => RXDFE_VP_CFG1_BIN,
        RXDLY_CFG            => RXDLY_CFG_BIN,
        RXDLY_LCFG           => RXDLY_LCFG_BIN,
        RXELECIDLE_CFG       => RXELECIDLE_CFG_BIN,
        RXGBOX_FIFO_INIT_RD_ADDR => RXGBOX_FIFO_INIT_RD_ADDR_BIN,
        RXGEARBOX_EN         => RXGEARBOX_EN_BIN,
        RXISCANRESET_TIME    => RXISCANRESET_TIME_BIN,
        RXLPM_CFG            => RXLPM_CFG_BIN,
        RXLPM_GC_CFG         => RXLPM_GC_CFG_BIN,
        RXLPM_KH_CFG0        => RXLPM_KH_CFG0_BIN,
        RXLPM_KH_CFG1        => RXLPM_KH_CFG1_BIN,
        RXLPM_OS_CFG0        => RXLPM_OS_CFG0_BIN,
        RXLPM_OS_CFG1        => RXLPM_OS_CFG1_BIN,
        RXOOB_CFG            => RXOOB_CFG_BIN,
        RXOOB_CLK_CFG        => RXOOB_CLK_CFG_BIN,
        RXOSCALRESET_TIME    => RXOSCALRESET_TIME_BIN,
        RXOUT_DIV            => RXOUT_DIV_BIN,
        RXPCSRESET_TIME      => RXPCSRESET_TIME_BIN,
        RXPHBEACON_CFG       => RXPHBEACON_CFG_BIN,
        RXPHDLY_CFG          => RXPHDLY_CFG_BIN,
        RXPHSAMP_CFG         => RXPHSAMP_CFG_BIN,
        RXPHSLIP_CFG         => RXPHSLIP_CFG_BIN,
        RXPH_MONITOR_SEL     => RXPH_MONITOR_SEL_BIN,
        RXPI_CFG0            => RXPI_CFG0_BIN,
        RXPI_CFG1            => RXPI_CFG1_BIN,
        RXPMACLK_SEL         => RXPMACLK_SEL_BIN,
        RXPMARESET_TIME      => RXPMARESET_TIME_BIN,
        RXPRBS_ERR_LOOPBACK  => RXPRBS_ERR_LOOPBACK_BIN,
        RXPRBS_LINKACQ_CNT   => RXPRBS_LINKACQ_CNT_BIN,
        RXREFCLKDIV2_SEL     => RXREFCLKDIV2_SEL_BIN,
        RXSLIDE_AUTO_WAIT    => RXSLIDE_AUTO_WAIT_BIN,
        RXSLIDE_MODE         => RXSLIDE_MODE_BIN,
        RXSYNC_MULTILANE     => RXSYNC_MULTILANE_BIN,
        RXSYNC_OVRD          => RXSYNC_OVRD_BIN,
        RXSYNC_SKIP_DA       => RXSYNC_SKIP_DA_BIN,
        RX_AFE_CM_EN         => RX_AFE_CM_EN_BIN,
        RX_BIAS_CFG0         => RX_BIAS_CFG0_BIN,
        RX_BUFFER_CFG        => RX_BUFFER_CFG_BIN,
        RX_CAPFF_SARC_ENB    => RX_CAPFF_SARC_ENB_BIN,
        RX_CLK25_DIV         => RX_CLK25_DIV_BIN,
        RX_CLKMUX_EN         => RX_CLKMUX_EN_BIN,
        RX_CLK_SLIP_OVRD     => RX_CLK_SLIP_OVRD_BIN,
        RX_CM_BUF_CFG        => RX_CM_BUF_CFG_BIN,
        RX_CM_BUF_PD         => RX_CM_BUF_PD_BIN,
        RX_CM_SEL            => RX_CM_SEL_BIN,
        RX_CM_TRIM           => RX_CM_TRIM_BIN,
        RX_CTLE_PWR_SAVING   => RX_CTLE_PWR_SAVING_BIN,
        RX_CTLE_RES_CTRL     => RX_CTLE_RES_CTRL_BIN,
        RX_DATA_WIDTH        => RX_DATA_WIDTH_BIN,
        RX_DDI_SEL           => RX_DDI_SEL_BIN,
        RX_DEFER_RESET_BUF_EN => RX_DEFER_RESET_BUF_EN_BIN,
        RX_DEGEN_CTRL        => RX_DEGEN_CTRL_BIN,
        RX_DFECFOKFCDAC      => RX_DFECFOKFCDAC_BIN,
        RX_DFELPM_CFG0       => RX_DFELPM_CFG0_BIN,
        RX_DFELPM_CFG1       => RX_DFELPM_CFG1_BIN,
        RX_DFELPM_KLKH_AGC_STUP_EN => RX_DFELPM_KLKH_AGC_STUP_EN_BIN,
        RX_DFE_AGC_CFG1      => RX_DFE_AGC_CFG1_BIN,
        RX_DFE_KL_LPM_KH_CFG0 => RX_DFE_KL_LPM_KH_CFG0_BIN,
        RX_DFE_KL_LPM_KH_CFG1 => RX_DFE_KL_LPM_KH_CFG1_BIN,
        RX_DFE_KL_LPM_KL_CFG0 => RX_DFE_KL_LPM_KL_CFG0_BIN,
        RX_DFE_KL_LPM_KL_CFG1 => RX_DFE_KL_LPM_KL_CFG1_BIN,
        RX_DFE_LPM_HOLD_DURING_EIDLE => RX_DFE_LPM_HOLD_DURING_EIDLE_BIN,
        RX_DISPERR_SEQ_MATCH => RX_DISPERR_SEQ_MATCH_BIN,
        RX_DIVRESET_TIME     => RX_DIVRESET_TIME_BIN,
        RX_EN_CTLE_RCAL_B    => RX_EN_CTLE_RCAL_B_BIN,
        RX_EN_SUM_RCAL_B     => RX_EN_SUM_RCAL_B_BIN,
        RX_EYESCAN_VS_CODE   => RX_EYESCAN_VS_CODE_BIN,
        RX_EYESCAN_VS_NEG_DIR => RX_EYESCAN_VS_NEG_DIR_BIN,
        RX_EYESCAN_VS_RANGE  => RX_EYESCAN_VS_RANGE_BIN,
        RX_EYESCAN_VS_UT_SIGN => RX_EYESCAN_VS_UT_SIGN_BIN,
        RX_FABINT_USRCLK_FLOP => RX_FABINT_USRCLK_FLOP_BIN,
        RX_I2V_FILTER_EN     => RX_I2V_FILTER_EN_BIN,
        RX_INT_DATAWIDTH     => RX_INT_DATAWIDTH_BIN,
        RX_PMA_POWER_SAVE    => RX_PMA_POWER_SAVE_BIN,
        RX_PMA_RSV0          => RX_PMA_RSV0_BIN,
        RX_PROGDIV_CFG       => RX_PROGDIV_CFG_BIN,
        RX_PROGDIV_RATE      => RX_PROGDIV_RATE_BIN,
        RX_RESLOAD_CTRL      => RX_RESLOAD_CTRL_BIN,
        RX_RESLOAD_OVRD      => RX_RESLOAD_OVRD_BIN,
        RX_SAMPLE_PERIOD     => RX_SAMPLE_PERIOD_BIN,
        RX_SIG_VALID_DLY     => RX_SIG_VALID_DLY_BIN,
        RX_SUM_DEGEN_AVTT_OVERITE => RX_SUM_DEGEN_AVTT_OVERITE_BIN,
        RX_SUM_DFETAPREP_EN  => RX_SUM_DFETAPREP_EN_BIN,
        RX_SUM_IREF_TUNE     => RX_SUM_IREF_TUNE_BIN,
        RX_SUM_PWR_SAVING    => RX_SUM_PWR_SAVING_BIN,
        RX_SUM_RES_CTRL      => RX_SUM_RES_CTRL_BIN,
        RX_SUM_VCMTUNE       => RX_SUM_VCMTUNE_BIN,
        RX_SUM_VCM_BIAS_TUNE_EN => RX_SUM_VCM_BIAS_TUNE_EN_BIN,
        RX_SUM_VCM_OVWR      => RX_SUM_VCM_OVWR_BIN,
        RX_SUM_VREF_TUNE     => RX_SUM_VREF_TUNE_BIN,
        RX_TUNE_AFE_OS       => RX_TUNE_AFE_OS_BIN,
        RX_VREG_CTRL         => RX_VREG_CTRL_BIN,
        RX_VREG_PDB          => RX_VREG_PDB_BIN,
        RX_VREG_VREFSEL      => RX_VREG_VREFSEL_BIN,
        RX_WIDEMODE_CDR      => RX_WIDEMODE_CDR_BIN,
        RX_WIDEMODE_CDR_GEN3 => RX_WIDEMODE_CDR_GEN3_BIN,
        RX_WIDEMODE_CDR_GEN4 => RX_WIDEMODE_CDR_GEN4_BIN,
        RX_XCLK_SEL          => RX_XCLK_SEL_BIN,
        RX_XMODE_SEL         => RX_XMODE_SEL_BIN,
        SAMPLE_CLK_PHASE     => SAMPLE_CLK_PHASE_BIN,
        SAS_12G_MODE         => SAS_12G_MODE_BIN,
        SATA_BURST_SEQ_LEN   => SATA_BURST_SEQ_LEN_BIN,
        SATA_BURST_VAL       => SATA_BURST_VAL_BIN,
        SATA_CPLL_CFG        => SATA_CPLL_CFG_BIN,
        SATA_EIDLE_VAL       => SATA_EIDLE_VAL_BIN,
        SHOW_REALIGN_COMMA   => SHOW_REALIGN_COMMA_BIN,
        SIM_DEVICE           => SIM_DEVICE_BIN,
        SIM_MODE             => SIM_MODE_BIN,
        SIM_RECEIVER_DETECT_PASS => SIM_RECEIVER_DETECT_PASS_BIN,
        SIM_RESET_SPEEDUP    => SIM_RESET_SPEEDUP_BIN,
        SIM_TX_EIDLE_DRIVE_LEVEL => SIM_TX_EIDLE_DRIVE_LEVEL_BIN,
        SRSTMODE             => SRSTMODE_BIN,
        TAPDLY_SET_TX        => TAPDLY_SET_TX_BIN,
        TERM_RCAL_CFG        => TERM_RCAL_CFG_BIN,
        TERM_RCAL_OVRD       => TERM_RCAL_OVRD_BIN,
        TRANS_TIME_RATE      => TRANS_TIME_RATE_BIN,
        TST_RSV0             => TST_RSV0_BIN,
        TST_RSV1             => TST_RSV1_BIN,
        TXBUF_EN             => TXBUF_EN_BIN,
        TXBUF_RESET_ON_RATE_CHANGE => TXBUF_RESET_ON_RATE_CHANGE_BIN,
        TXDLY_CFG            => TXDLY_CFG_BIN,
        TXDLY_LCFG           => TXDLY_LCFG_BIN,
        TXDRV_FREQBAND       => TXDRV_FREQBAND_BIN,
        TXFE_CFG0            => TXFE_CFG0_BIN,
        TXFE_CFG1            => TXFE_CFG1_BIN,
        TXFE_CFG2            => TXFE_CFG2_BIN,
        TXFE_CFG3            => TXFE_CFG3_BIN,
        TXFIFO_ADDR_CFG      => TXFIFO_ADDR_CFG_BIN,
        TXGBOX_FIFO_INIT_RD_ADDR => TXGBOX_FIFO_INIT_RD_ADDR_BIN,
        TXGEARBOX_EN         => TXGEARBOX_EN_BIN,
        TXOUTCLKPCS_SEL      => TXOUTCLKPCS_SEL_BIN,
        TXOUT_DIV            => TXOUT_DIV_BIN,
        TXPCSRESET_TIME      => TXPCSRESET_TIME_BIN,
        TXPHDLY_CFG0         => TXPHDLY_CFG0_BIN,
        TXPHDLY_CFG1         => TXPHDLY_CFG1_BIN,
        TXPH_CFG             => TXPH_CFG_BIN,
        TXPH_CFG2            => TXPH_CFG2_BIN,
        TXPH_MONITOR_SEL     => TXPH_MONITOR_SEL_BIN,
        TXPI_CFG0            => TXPI_CFG0_BIN,
        TXPI_CFG1            => TXPI_CFG1_BIN,
        TXPI_GRAY_SEL        => TXPI_GRAY_SEL_BIN,
        TXPI_INVSTROBE_SEL   => TXPI_INVSTROBE_SEL_BIN,
        TXPI_PPM             => TXPI_PPM_BIN,
        TXPI_PPM_CFG         => TXPI_PPM_CFG_BIN,
        TXPI_SYNFREQ_PPM     => TXPI_SYNFREQ_PPM_BIN,
        TXPMARESET_TIME      => TXPMARESET_TIME_BIN,
        TXREFCLKDIV2_SEL     => TXREFCLKDIV2_SEL_BIN,
        TXSWBST_BST          => TXSWBST_BST_BIN,
        TXSWBST_EN           => TXSWBST_EN_BIN,
        TXSWBST_MAG          => TXSWBST_MAG_BIN,
        TXSYNC_MULTILANE     => TXSYNC_MULTILANE_BIN,
        TXSYNC_OVRD          => TXSYNC_OVRD_BIN,
        TXSYNC_SKIP_DA       => TXSYNC_SKIP_DA_BIN,
        TX_CLK25_DIV         => TX_CLK25_DIV_BIN,
        TX_CLKMUX_EN         => TX_CLKMUX_EN_BIN,
        TX_DATA_WIDTH        => TX_DATA_WIDTH_BIN,
        TX_DCC_LOOP_RST_CFG  => TX_DCC_LOOP_RST_CFG_BIN,
        TX_DEEMPH0           => TX_DEEMPH0_BIN,
        TX_DEEMPH1           => TX_DEEMPH1_BIN,
        TX_DEEMPH2           => TX_DEEMPH2_BIN,
        TX_DEEMPH3           => TX_DEEMPH3_BIN,
        TX_DIVRESET_TIME     => TX_DIVRESET_TIME_BIN,
        TX_DRIVE_MODE        => TX_DRIVE_MODE_BIN,
        TX_EIDLE_ASSERT_DELAY => TX_EIDLE_ASSERT_DELAY_BIN,
        TX_EIDLE_DEASSERT_DELAY => TX_EIDLE_DEASSERT_DELAY_BIN,
        TX_FABINT_USRCLK_FLOP => TX_FABINT_USRCLK_FLOP_BIN,
        TX_FIFO_BYP_EN       => TX_FIFO_BYP_EN_BIN,
        TX_IDLE_DATA_ZERO    => TX_IDLE_DATA_ZERO_BIN,
        TX_INT_DATAWIDTH     => TX_INT_DATAWIDTH_BIN,
        TX_LOOPBACK_DRIVE_HIZ => TX_LOOPBACK_DRIVE_HIZ_BIN,
        TX_MAINCURSOR_SEL    => TX_MAINCURSOR_SEL_BIN,
        TX_MARGIN_FULL_0     => TX_MARGIN_FULL_0_BIN,
        TX_MARGIN_FULL_1     => TX_MARGIN_FULL_1_BIN,
        TX_MARGIN_FULL_2     => TX_MARGIN_FULL_2_BIN,
        TX_MARGIN_FULL_3     => TX_MARGIN_FULL_3_BIN,
        TX_MARGIN_FULL_4     => TX_MARGIN_FULL_4_BIN,
        TX_MARGIN_LOW_0      => TX_MARGIN_LOW_0_BIN,
        TX_MARGIN_LOW_1      => TX_MARGIN_LOW_1_BIN,
        TX_MARGIN_LOW_2      => TX_MARGIN_LOW_2_BIN,
        TX_MARGIN_LOW_3      => TX_MARGIN_LOW_3_BIN,
        TX_MARGIN_LOW_4      => TX_MARGIN_LOW_4_BIN,
        TX_PHICAL_CFG0       => TX_PHICAL_CFG0_BIN,
        TX_PHICAL_CFG1       => TX_PHICAL_CFG1_BIN,
        TX_PI_BIASSET        => TX_PI_BIASSET_BIN,
        TX_PMADATA_OPT       => TX_PMADATA_OPT_BIN,
        TX_PMA_POWER_SAVE    => TX_PMA_POWER_SAVE_BIN,
        TX_PMA_RSV0          => TX_PMA_RSV0_BIN,
        TX_PMA_RSV1          => TX_PMA_RSV1_BIN,
        TX_PROGCLK_SEL       => TX_PROGCLK_SEL_BIN,
        TX_PROGDIV_CFG       => TX_PROGDIV_CFG_BIN,
        TX_PROGDIV_RATE      => TX_PROGDIV_RATE_BIN,
        TX_RXDETECT_CFG      => TX_RXDETECT_CFG_BIN,
        TX_RXDETECT_REF      => TX_RXDETECT_REF_BIN,
        TX_SAMPLE_PERIOD     => TX_SAMPLE_PERIOD_BIN,
        TX_SW_MEAS           => TX_SW_MEAS_BIN,
        TX_USERPATTERN_DATA0 => TX_USERPATTERN_DATA0_BIN,
        TX_USERPATTERN_DATA1 => TX_USERPATTERN_DATA1_BIN,
        TX_USERPATTERN_DATA2 => TX_USERPATTERN_DATA2_BIN,
        TX_USERPATTERN_DATA3 => TX_USERPATTERN_DATA3_BIN,
        TX_USERPATTERN_DATA4 => TX_USERPATTERN_DATA4_BIN,
        TX_USERPATTERN_DATA5 => TX_USERPATTERN_DATA5_BIN,
        TX_USERPATTERN_DATA6 => TX_USERPATTERN_DATA6_BIN,
        TX_USERPATTERN_DATA7 => TX_USERPATTERN_DATA7_BIN,
        TX_VREG_CTRL         => TX_VREG_CTRL_BIN,
        TX_VREG_PDB          => TX_VREG_PDB_BIN,
        TX_VREG_VREFSEL      => TX_VREG_VREFSEL_BIN,
        TX_XCLK_SEL          => TX_XCLK_SEL_BIN,
        USB_BOTH_BURST_IDLE  => USB_BOTH_BURST_IDLE_BIN,
        USB_BURSTMAX_U3WAKE  => USB_BURSTMAX_U3WAKE_BIN,
        USB_BURSTMIN_U3WAKE  => USB_BURSTMIN_U3WAKE_BIN,
        USB_CLK_COR_EQ_EN    => USB_CLK_COR_EQ_EN_BIN,
        USB_EXT_CNTL         => USB_EXT_CNTL_BIN,
        USB_IDLEMAX_POLLING  => USB_IDLEMAX_POLLING_BIN,
        USB_IDLEMIN_POLLING  => USB_IDLEMIN_POLLING_BIN,
        USB_LFPSPING_BURST   => USB_LFPSPING_BURST_BIN,
        USB_LFPSPOLLING_BURST => USB_LFPSPOLLING_BURST_BIN,
        USB_LFPSPOLLING_IDLE_MS => USB_LFPSPOLLING_IDLE_MS_BIN,
        USB_LFPSU1EXIT_BURST => USB_LFPSU1EXIT_BURST_BIN,
        USB_LFPSU2LPEXIT_BURST_MS => USB_LFPSU2LPEXIT_BURST_MS_BIN,
        USB_LFPSU3WAKE_BURST_MS => USB_LFPSU3WAKE_BURST_MS_BIN,
        USB_LFPS_TPERIOD     => USB_LFPS_TPERIOD_BIN,
        USB_LFPS_TPERIOD_ACCURATE => USB_LFPS_TPERIOD_ACCURATE_BIN,
        USB_MODE             => USB_MODE_BIN,
        USB_PCIE_ERR_REP_DIS => USB_PCIE_ERR_REP_DIS_BIN,
        USB_PING_SATA_MAX_INIT => USB_PING_SATA_MAX_INIT_BIN,
        USB_PING_SATA_MIN_INIT => USB_PING_SATA_MIN_INIT_BIN,
        USB_POLL_SATA_MAX_BURST => USB_POLL_SATA_MAX_BURST_BIN,
        USB_POLL_SATA_MIN_BURST => USB_POLL_SATA_MIN_BURST_BIN,
        USB_RAW_ELEC         => USB_RAW_ELEC_BIN,
        USB_RXIDLE_P0_CTRL   => USB_RXIDLE_P0_CTRL_BIN,
        USB_TXIDLE_TUNE_ENABLE => USB_TXIDLE_TUNE_ENABLE_BIN,
        USB_U1_SATA_MAX_WAKE => USB_U1_SATA_MAX_WAKE_BIN,
        USB_U1_SATA_MIN_WAKE => USB_U1_SATA_MIN_WAKE_BIN,
        USB_U2_SAS_MAX_COM   => USB_U2_SAS_MAX_COM_BIN,
        USB_U2_SAS_MIN_COM   => USB_U2_SAS_MIN_COM_BIN,
        USE_PCS_CLK_PHASE_SEL => USE_PCS_CLK_PHASE_SEL_BIN,
        Y_ALL_MODE           => Y_ALL_MODE_BIN,
        BUFGTCE              => BUFGTCE_out,
        BUFGTCEMASK          => BUFGTCEMASK_out,
        BUFGTDIV             => BUFGTDIV_out,
        BUFGTRESET           => BUFGTRESET_out,
        BUFGTRSTMASK         => BUFGTRSTMASK_out,
        CPLLFBCLKLOST        => CPLLFBCLKLOST_out,
        CPLLLOCK             => CPLLLOCK_out,
        CPLLREFCLKLOST       => CPLLREFCLKLOST_out,
        CSSDSTOPCLKDONE      => CSSDSTOPCLKDONE_out,
        DMONITOROUT          => DMONITOROUT_out,
        DMONITOROUTCLK       => DMONITOROUTCLK_out,
        DRPDO                => DRPDO_out,
        DRPRDY               => DRPRDY_out,
        EYESCANDATAERROR     => EYESCANDATAERROR_out,
        GTPOWERGOOD          => GTPOWERGOOD_out,
        GTREFCLKMONITOR      => GTREFCLKMONITOR_out,
        GTYTXN               => GTYTXN_out,
        GTYTXP               => GTYTXP_out,
        PCIERATEGEN3         => PCIERATEGEN3_out,
        PCIERATEIDLE         => PCIERATEIDLE_out,
        PCIERATEQPLLPD       => PCIERATEQPLLPD_out,
        PCIERATEQPLLRESET    => PCIERATEQPLLRESET_out,
        PCIESYNCTXSYNCDONE   => PCIESYNCTXSYNCDONE_out,
        PCIEUSERGEN3RDY      => PCIEUSERGEN3RDY_out,
        PCIEUSERPHYSTATUSRST => PCIEUSERPHYSTATUSRST_out,
        PCIEUSERRATESTART    => PCIEUSERRATESTART_out,
        PCSRSVDOUT           => PCSRSVDOUT_out,
        PHYSTATUS            => PHYSTATUS_out,
        PINRSRVDAS           => PINRSRVDAS_out,
        PMASCANOUT           => PMASCANOUT_out,
        POWERPRESENT         => POWERPRESENT_out,
        RESETEXCEPTION       => RESETEXCEPTION_out,
        RXBUFSTATUS          => RXBUFSTATUS_out,
        RXBYTEISALIGNED      => RXBYTEISALIGNED_out,
        RXBYTEREALIGN        => RXBYTEREALIGN_out,
        RXCDRLOCK            => RXCDRLOCK_out,
        RXCDRPHDONE          => RXCDRPHDONE_out,
        RXCHANBONDSEQ        => RXCHANBONDSEQ_out,
        RXCHANISALIGNED      => RXCHANISALIGNED_out,
        RXCHANREALIGN        => RXCHANREALIGN_out,
        RXCHBONDO            => RXCHBONDO_out,
        RXCKCALDONE          => RXCKCALDONE_out,
        RXCLKCORCNT          => RXCLKCORCNT_out,
        RXCOMINITDET         => RXCOMINITDET_out,
        RXCOMMADET           => RXCOMMADET_out,
        RXCOMSASDET          => RXCOMSASDET_out,
        RXCOMWAKEDET         => RXCOMWAKEDET_out,
        RXCTRL0              => RXCTRL0_out,
        RXCTRL1              => RXCTRL1_out,
        RXCTRL2              => RXCTRL2_out,
        RXCTRL3              => RXCTRL3_out,
        RXDATA               => RXDATA_out,
        RXDATAEXTENDRSVD     => RXDATAEXTENDRSVD_out,
        RXDATAVALID          => RXDATAVALID_out,
        RXDLYSRESETDONE      => RXDLYSRESETDONE_out,
        RXELECIDLE           => RXELECIDLE_out,
        RXHEADER             => RXHEADER_out,
        RXHEADERVALID        => RXHEADERVALID_out,
        RXLFPSTRESETDET      => RXLFPSTRESETDET_out,
        RXLFPSU2LPEXITDET    => RXLFPSU2LPEXITDET_out,
        RXLFPSU3WAKEDET      => RXLFPSU3WAKEDET_out,
        RXMONITOROUT         => RXMONITOROUT_out,
        RXOSINTDONE          => RXOSINTDONE_out,
        RXOSINTSTARTED       => RXOSINTSTARTED_out,
        RXOSINTSTROBEDONE    => RXOSINTSTROBEDONE_out,
        RXOSINTSTROBESTARTED => RXOSINTSTROBESTARTED_out,
        RXOUTCLK             => RXOUTCLK_out,
        RXOUTCLKFABRIC       => RXOUTCLKFABRIC_out,
        RXOUTCLKPCS          => RXOUTCLKPCS_out,
        RXPHALIGNDONE        => RXPHALIGNDONE_out,
        RXPHALIGNERR         => RXPHALIGNERR_out,
        RXPMARESETDONE       => RXPMARESETDONE_out,
        RXPRBSERR            => RXPRBSERR_out,
        RXPRBSLOCKED         => RXPRBSLOCKED_out,
        RXPRGDIVRESETDONE    => RXPRGDIVRESETDONE_out,
        RXRATEDONE           => RXRATEDONE_out,
        RXRECCLKOUT          => RXRECCLKOUT_out,
        RXRESETDONE          => RXRESETDONE_out,
        RXSLIDERDY           => RXSLIDERDY_out,
        RXSLIPDONE           => RXSLIPDONE_out,
        RXSLIPOUTCLKRDY      => RXSLIPOUTCLKRDY_out,
        RXSLIPPMARDY         => RXSLIPPMARDY_out,
        RXSTARTOFSEQ         => RXSTARTOFSEQ_out,
        RXSTATUS             => RXSTATUS_out,
        RXSYNCDONE           => RXSYNCDONE_out,
        RXSYNCOUT            => RXSYNCOUT_out,
        RXVALID              => RXVALID_out,
        SCANOUT              => SCANOUT_out,
        TXBUFSTATUS          => TXBUFSTATUS_out,
        TXCOMFINISH          => TXCOMFINISH_out,
        TXDCCDONE            => TXDCCDONE_out,
        TXDLYSRESETDONE      => TXDLYSRESETDONE_out,
        TXOUTCLK             => TXOUTCLK_out,
        TXOUTCLKFABRIC       => TXOUTCLKFABRIC_out,
        TXOUTCLKPCS          => TXOUTCLKPCS_out,
        TXPHALIGNDONE        => TXPHALIGNDONE_out,
        TXPHINITDONE         => TXPHINITDONE_out,
        TXPMARESETDONE       => TXPMARESETDONE_out,
        TXPRGDIVRESETDONE    => TXPRGDIVRESETDONE_out,
        TXRATEDONE           => TXRATEDONE_out,
        TXRESETDONE          => TXRESETDONE_out,
        TXSYNCDONE           => TXSYNCDONE_out,
        TXSYNCOUT            => TXSYNCOUT_out,
        BSR_SERIAL           => BSR_SERIAL_in,
        CDRSTEPDIR           => CDRSTEPDIR_in,
        CDRSTEPSQ            => CDRSTEPSQ_in,
        CDRSTEPSX            => CDRSTEPSX_in,
        CFGRESET             => CFGRESET_in,
        CLKRSVD0             => CLKRSVD0_in,
        CLKRSVD1             => CLKRSVD1_in,
        CPLLFREQLOCK         => CPLLFREQLOCK_in,
        CPLLLOCKDETCLK       => CPLLLOCKDETCLK_in,
        CPLLLOCKEN           => CPLLLOCKEN_in,
        CPLLPD               => CPLLPD_in,
        CPLLREFCLKSEL        => CPLLREFCLKSEL_in,
        CPLLRESET            => CPLLRESET_in,
        CSSDRSTB             => CSSDRSTB_in,
        CSSDSTOPCLK          => CSSDSTOPCLK_in,
        DMONFIFORESET        => DMONFIFORESET_in,
        DMONITORCLK          => DMONITORCLK_in,
        DRPADDR              => DRPADDR_in,
        DRPCLK               => DRPCLK_in,
        DRPDI                => DRPDI_in,
        DRPEN                => DRPEN_in,
        DRPRST               => DRPRST_in,
        DRPWE                => DRPWE_in,
        EYESCANRESET         => EYESCANRESET_in,
        EYESCANTRIGGER       => EYESCANTRIGGER_in,
        FREQOS               => FREQOS_in,
        GTGREFCLK            => GTGREFCLK_in,
        GTNORTHREFCLK0       => GTNORTHREFCLK0_in,
        GTNORTHREFCLK1       => GTNORTHREFCLK1_in,
        GTREFCLK0            => GTREFCLK0_in,
        GTREFCLK1            => GTREFCLK1_in,
        GTRSVD               => GTRSVD_in,
        GTRXRESET            => GTRXRESET_in,
        GTRXRESETSEL         => GTRXRESETSEL_in,
        GTSOUTHREFCLK0       => GTSOUTHREFCLK0_in,
        GTSOUTHREFCLK1       => GTSOUTHREFCLK1_in,
        GTTXRESET            => GTTXRESET_in,
        GTTXRESETSEL         => GTTXRESETSEL_in,
        GTYRXN               => GTYRXN_in,
        GTYRXP               => GTYRXP_in,
        INCPCTRL             => INCPCTRL_in,
        LOOPBACK             => LOOPBACK_in,
        PCIEEQRXEQADAPTDONE  => PCIEEQRXEQADAPTDONE_in,
        PCIERSTIDLE          => PCIERSTIDLE_in,
        PCIERSTTXSYNCSTART   => PCIERSTTXSYNCSTART_in,
        PCIEUSERRATEDONE     => PCIEUSERRATEDONE_in,
        PCSRSVDIN            => PCSRSVDIN_in,
        PMASCANCLK0          => PMASCANCLK0_in,
        PMASCANCLK1          => PMASCANCLK1_in,
        PMASCANCLK2          => PMASCANCLK2_in,
        PMASCANCLK3          => PMASCANCLK3_in,
        PMASCANCLK4          => PMASCANCLK4_in,
        PMASCANCLK5          => PMASCANCLK5_in,
        PMASCANCLK6          => PMASCANCLK6_in,
        PMASCANCLK7          => PMASCANCLK7_in,
        PMASCANCLK8          => PMASCANCLK8_in,
        PMASCANENB           => PMASCANENB_in,
        PMASCANIN            => PMASCANIN_in,
        PMASCANMODEB         => PMASCANMODEB_in,
        PMASCANRSTEN         => PMASCANRSTEN_in,
        QPLL0CLK             => QPLL0CLK_in,
        QPLL0FREQLOCK        => QPLL0FREQLOCK_in,
        QPLL0REFCLK          => QPLL0REFCLK_in,
        QPLL1CLK             => QPLL1CLK_in,
        QPLL1FREQLOCK        => QPLL1FREQLOCK_in,
        QPLL1REFCLK          => QPLL1REFCLK_in,
        RESETOVRD            => RESETOVRD_in,
        RX8B10BEN            => RX8B10BEN_in,
        RXAFECFOKEN          => RXAFECFOKEN_in,
        RXBUFRESET           => RXBUFRESET_in,
        RXCDRFREQRESET       => RXCDRFREQRESET_in,
        RXCDRHOLD            => RXCDRHOLD_in,
        RXCDROVRDEN          => RXCDROVRDEN_in,
        RXCDRRESET           => RXCDRRESET_in,
        RXCHBONDEN           => RXCHBONDEN_in,
        RXCHBONDI            => RXCHBONDI_in,
        RXCHBONDLEVEL        => RXCHBONDLEVEL_in,
        RXCHBONDMASTER       => RXCHBONDMASTER_in,
        RXCHBONDSLAVE        => RXCHBONDSLAVE_in,
        RXCKCALRESET         => RXCKCALRESET_in,
        RXCKCALSTART         => RXCKCALSTART_in,
        RXCOMMADETEN         => RXCOMMADETEN_in,
        RXDFEAGCHOLD         => RXDFEAGCHOLD_in,
        RXDFEAGCOVRDEN       => RXDFEAGCOVRDEN_in,
        RXDFECFOKFCNUM       => RXDFECFOKFCNUM_in,
        RXDFECFOKFEN         => RXDFECFOKFEN_in,
        RXDFECFOKFPULSE      => RXDFECFOKFPULSE_in,
        RXDFECFOKHOLD        => RXDFECFOKHOLD_in,
        RXDFECFOKOVREN       => RXDFECFOKOVREN_in,
        RXDFEKHHOLD          => RXDFEKHHOLD_in,
        RXDFEKHOVRDEN        => RXDFEKHOVRDEN_in,
        RXDFELFHOLD          => RXDFELFHOLD_in,
        RXDFELFOVRDEN        => RXDFELFOVRDEN_in,
        RXDFELPMRESET        => RXDFELPMRESET_in,
        RXDFETAP10HOLD       => RXDFETAP10HOLD_in,
        RXDFETAP10OVRDEN     => RXDFETAP10OVRDEN_in,
        RXDFETAP11HOLD       => RXDFETAP11HOLD_in,
        RXDFETAP11OVRDEN     => RXDFETAP11OVRDEN_in,
        RXDFETAP12HOLD       => RXDFETAP12HOLD_in,
        RXDFETAP12OVRDEN     => RXDFETAP12OVRDEN_in,
        RXDFETAP13HOLD       => RXDFETAP13HOLD_in,
        RXDFETAP13OVRDEN     => RXDFETAP13OVRDEN_in,
        RXDFETAP14HOLD       => RXDFETAP14HOLD_in,
        RXDFETAP14OVRDEN     => RXDFETAP14OVRDEN_in,
        RXDFETAP15HOLD       => RXDFETAP15HOLD_in,
        RXDFETAP15OVRDEN     => RXDFETAP15OVRDEN_in,
        RXDFETAP2HOLD        => RXDFETAP2HOLD_in,
        RXDFETAP2OVRDEN      => RXDFETAP2OVRDEN_in,
        RXDFETAP3HOLD        => RXDFETAP3HOLD_in,
        RXDFETAP3OVRDEN      => RXDFETAP3OVRDEN_in,
        RXDFETAP4HOLD        => RXDFETAP4HOLD_in,
        RXDFETAP4OVRDEN      => RXDFETAP4OVRDEN_in,
        RXDFETAP5HOLD        => RXDFETAP5HOLD_in,
        RXDFETAP5OVRDEN      => RXDFETAP5OVRDEN_in,
        RXDFETAP6HOLD        => RXDFETAP6HOLD_in,
        RXDFETAP6OVRDEN      => RXDFETAP6OVRDEN_in,
        RXDFETAP7HOLD        => RXDFETAP7HOLD_in,
        RXDFETAP7OVRDEN      => RXDFETAP7OVRDEN_in,
        RXDFETAP8HOLD        => RXDFETAP8HOLD_in,
        RXDFETAP8OVRDEN      => RXDFETAP8OVRDEN_in,
        RXDFETAP9HOLD        => RXDFETAP9HOLD_in,
        RXDFETAP9OVRDEN      => RXDFETAP9OVRDEN_in,
        RXDFEUTHOLD          => RXDFEUTHOLD_in,
        RXDFEUTOVRDEN        => RXDFEUTOVRDEN_in,
        RXDFEVPHOLD          => RXDFEVPHOLD_in,
        RXDFEVPOVRDEN        => RXDFEVPOVRDEN_in,
        RXDFEXYDEN           => RXDFEXYDEN_in,
        RXDLYBYPASS          => RXDLYBYPASS_in,
        RXDLYEN              => RXDLYEN_in,
        RXDLYOVRDEN          => RXDLYOVRDEN_in,
        RXDLYSRESET          => RXDLYSRESET_in,
        RXELECIDLEMODE       => RXELECIDLEMODE_in,
        RXEQTRAINING         => RXEQTRAINING_in,
        RXGEARBOXSLIP        => RXGEARBOXSLIP_in,
        RXLATCLK             => RXLATCLK_in,
        RXLPMEN              => RXLPMEN_in,
        RXLPMGCHOLD          => RXLPMGCHOLD_in,
        RXLPMGCOVRDEN        => RXLPMGCOVRDEN_in,
        RXLPMHFHOLD          => RXLPMHFHOLD_in,
        RXLPMHFOVRDEN        => RXLPMHFOVRDEN_in,
        RXLPMLFHOLD          => RXLPMLFHOLD_in,
        RXLPMLFKLOVRDEN      => RXLPMLFKLOVRDEN_in,
        RXLPMOSHOLD          => RXLPMOSHOLD_in,
        RXLPMOSOVRDEN        => RXLPMOSOVRDEN_in,
        RXMCOMMAALIGNEN      => RXMCOMMAALIGNEN_in,
        RXMONITORSEL         => RXMONITORSEL_in,
        RXOOBRESET           => RXOOBRESET_in,
        RXOSCALRESET         => RXOSCALRESET_in,
        RXOSHOLD             => RXOSHOLD_in,
        RXOSOVRDEN           => RXOSOVRDEN_in,
        RXOUTCLKSEL          => RXOUTCLKSEL_in,
        RXPCOMMAALIGNEN      => RXPCOMMAALIGNEN_in,
        RXPCSRESET           => RXPCSRESET_in,
        RXPD                 => RXPD_in,
        RXPHALIGN            => RXPHALIGN_in,
        RXPHALIGNEN          => RXPHALIGNEN_in,
        RXPHDLYPD            => RXPHDLYPD_in,
        RXPHDLYRESET         => RXPHDLYRESET_in,
        RXPLLCLKSEL          => RXPLLCLKSEL_in,
        RXPMARESET           => RXPMARESET_in,
        RXPOLARITY           => RXPOLARITY_in,
        RXPRBSCNTRESET       => RXPRBSCNTRESET_in,
        RXPRBSSEL            => RXPRBSSEL_in,
        RXPROGDIVRESET       => RXPROGDIVRESET_in,
        RXRATE               => RXRATE_in,
        RXRATEMODE           => RXRATEMODE_in,
        RXSLIDE              => RXSLIDE_in,
        RXSLIPOUTCLK         => RXSLIPOUTCLK_in,
        RXSLIPPMA            => RXSLIPPMA_in,
        RXSYNCALLIN          => RXSYNCALLIN_in,
        RXSYNCIN             => RXSYNCIN_in,
        RXSYNCMODE           => RXSYNCMODE_in,
        RXSYSCLKSEL          => RXSYSCLKSEL_in,
        RXTERMINATION        => RXTERMINATION_in,
        RXUSERRDY            => RXUSERRDY_in,
        RXUSRCLK             => RXUSRCLK_in,
        RXUSRCLK2            => RXUSRCLK2_in,
        SARCCLK              => SARCCLK_in,
        SCANCLK              => SCANCLK_in,
        SCANENB              => SCANENB_in,
        SCANIN               => SCANIN_in,
        SCANMODEB            => SCANMODEB_in,
        SCANRSTB             => SCANRSTB_in,
        SCANRSTEN            => SCANRSTEN_in,
        SIGVALIDCLK          => SIGVALIDCLK_in,
        TSTCLK0              => TSTCLK0_in,
        TSTCLK1              => TSTCLK1_in,
        TSTIN                => TSTIN_in,
        TSTPD                => TSTPD_in,
        TSTPDOVRDB           => TSTPDOVRDB_in,
        TX8B10BBYPASS        => TX8B10BBYPASS_in,
        TX8B10BEN            => TX8B10BEN_in,
        TXCOMINIT            => TXCOMINIT_in,
        TXCOMSAS             => TXCOMSAS_in,
        TXCOMWAKE            => TXCOMWAKE_in,
        TXCTRL0              => TXCTRL0_in,
        TXCTRL1              => TXCTRL1_in,
        TXCTRL2              => TXCTRL2_in,
        TXDATA               => TXDATA_in,
        TXDATAEXTENDRSVD     => TXDATAEXTENDRSVD_in,
        TXDCCFORCESTART      => TXDCCFORCESTART_in,
        TXDCCRESET           => TXDCCRESET_in,
        TXDEEMPH             => TXDEEMPH_in,
        TXDETECTRX           => TXDETECTRX_in,
        TXDIFFCTRL           => TXDIFFCTRL_in,
        TXDLYBYPASS          => TXDLYBYPASS_in,
        TXDLYEN              => TXDLYEN_in,
        TXDLYHOLD            => TXDLYHOLD_in,
        TXDLYOVRDEN          => TXDLYOVRDEN_in,
        TXDLYSRESET          => TXDLYSRESET_in,
        TXDLYUPDOWN          => TXDLYUPDOWN_in,
        TXELECIDLE           => TXELECIDLE_in,
        TXHEADER             => TXHEADER_in,
        TXINHIBIT            => TXINHIBIT_in,
        TXLATCLK             => TXLATCLK_in,
        TXLFPSTRESET         => TXLFPSTRESET_in,
        TXLFPSU2LPEXIT       => TXLFPSU2LPEXIT_in,
        TXLFPSU3WAKE         => TXLFPSU3WAKE_in,
        TXMAINCURSOR         => TXMAINCURSOR_in,
        TXMARGIN             => TXMARGIN_in,
        TXMUXDCDEXHOLD       => TXMUXDCDEXHOLD_in,
        TXMUXDCDORWREN       => TXMUXDCDORWREN_in,
        TXONESZEROS          => TXONESZEROS_in,
        TXOUTCLKSEL          => TXOUTCLKSEL_in,
        TXPCSRESET           => TXPCSRESET_in,
        TXPD                 => TXPD_in,
        TXPDELECIDLEMODE     => TXPDELECIDLEMODE_in,
        TXPHALIGN            => TXPHALIGN_in,
        TXPHALIGNEN          => TXPHALIGNEN_in,
        TXPHDLYPD            => TXPHDLYPD_in,
        TXPHDLYRESET         => TXPHDLYRESET_in,
        TXPHDLYTSTCLK        => TXPHDLYTSTCLK_in,
        TXPHINIT             => TXPHINIT_in,
        TXPHOVRDEN           => TXPHOVRDEN_in,
        TXPIPPMEN            => TXPIPPMEN_in,
        TXPIPPMOVRDEN        => TXPIPPMOVRDEN_in,
        TXPIPPMPD            => TXPIPPMPD_in,
        TXPIPPMSEL           => TXPIPPMSEL_in,
        TXPIPPMSTEPSIZE      => TXPIPPMSTEPSIZE_in,
        TXPISOPD             => TXPISOPD_in,
        TXPLLCLKSEL          => TXPLLCLKSEL_in,
        TXPMARESET           => TXPMARESET_in,
        TXPOLARITY           => TXPOLARITY_in,
        TXPOSTCURSOR         => TXPOSTCURSOR_in,
        TXPRBSFORCEERR       => TXPRBSFORCEERR_in,
        TXPRBSSEL            => TXPRBSSEL_in,
        TXPRECURSOR          => TXPRECURSOR_in,
        TXPROGDIVRESET       => TXPROGDIVRESET_in,
        TXRATE               => TXRATE_in,
        TXRATEMODE           => TXRATEMODE_in,
        TXSEQUENCE           => TXSEQUENCE_in,
        TXSWING              => TXSWING_in,
        TXSYNCALLIN          => TXSYNCALLIN_in,
        TXSYNCIN             => TXSYNCIN_in,
        TXSYNCMODE           => TXSYNCMODE_in,
        TXSYSCLKSEL          => TXSYSCLKSEL_in,
        TXUSERRDY            => TXUSERRDY_in,
        TXUSRCLK             => TXUSRCLK_in,
        TXUSRCLK2            => TXUSRCLK2_in,
        GSR                  => glblGSR        
      );
  end GTYE4_CHANNEL_V;
