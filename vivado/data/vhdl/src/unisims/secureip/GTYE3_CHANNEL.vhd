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
-- /___/   /\      Filename    : GTYE3_CHANNEL.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL GTYE3_CHANNEL -----

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

entity GTYE3_CHANNEL is
  generic (
    ACJTAG_DEBUG_MODE : bit := '0';
    ACJTAG_MODE : bit := '0';
    ACJTAG_RESET : bit := '0';
    ADAPT_CFG0 : std_logic_vector(15 downto 0) := X"9200";
    ADAPT_CFG1 : std_logic_vector(15 downto 0) := X"801C";
    ADAPT_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    ALIGN_COMMA_DOUBLE : string := "FALSE";
    ALIGN_COMMA_ENABLE : std_logic_vector(9 downto 0) := "0001111111";
    ALIGN_COMMA_WORD : integer := 1;
    ALIGN_MCOMMA_DET : string := "TRUE";
    ALIGN_MCOMMA_VALUE : std_logic_vector(9 downto 0) := "1010000011";
    ALIGN_PCOMMA_DET : string := "TRUE";
    ALIGN_PCOMMA_VALUE : std_logic_vector(9 downto 0) := "0101111100";
    AUTO_BW_SEL_BYPASS : bit := '0';
    A_RXOSCALRESET : bit := '0';
    A_RXPROGDIVRESET : bit := '0';
    A_TXDIFFCTRL : std_logic_vector(4 downto 0) := "01100";
    A_TXPROGDIVRESET : bit := '0';
    CAPBYPASS_FORCE : bit := '0';
    CBCC_DATA_SOURCE_SEL : string := "DECODED";
    CDR_SWAP_MODE_EN : bit := '0';
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
    CH_HSPMUX : std_logic_vector(15 downto 0) := X"0000";
    CKCAL1_CFG_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL1_CFG_1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL1_CFG_2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL1_CFG_3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL2_CFG_4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CKCAL_RSVD0 : std_logic_vector(15 downto 0) := X"4000";
    CKCAL_RSVD1 : std_logic_vector(15 downto 0) := X"0000";
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
    CPLL_CFG0 : std_logic_vector(15 downto 0) := X"20FA";
    CPLL_CFG1 : std_logic_vector(15 downto 0) := X"24AA";
    CPLL_CFG2 : std_logic_vector(15 downto 0) := X"F007";
    CPLL_CFG3 : std_logic_vector(5 downto 0) := "00" & X"0";
    CPLL_FBDIV : integer := 4;
    CPLL_FBDIV_45 : integer := 4;
    CPLL_INIT_CFG0 : std_logic_vector(15 downto 0) := X"001E";
    CPLL_INIT_CFG1 : std_logic_vector(7 downto 0) := X"00";
    CPLL_LOCK_CFG : std_logic_vector(15 downto 0) := X"01E8";
    CPLL_REFCLK_DIV : integer := 1;
    CTLE3_OCAP_EXT_CTRL : std_logic_vector(2 downto 0) := "000";
    CTLE3_OCAP_EXT_EN : bit := '0';
    DDI_CTRL : std_logic_vector(1 downto 0) := "00";
    DDI_REALIGN_WAIT : integer := 15;
    DEC_MCOMMA_DETECT : string := "TRUE";
    DEC_PCOMMA_DETECT : string := "TRUE";
    DEC_VALID_COMMA_ONLY : string := "TRUE";
    DFE_D_X_REL_POS : bit := '0';
    DFE_VCM_COMP_EN : bit := '0';
    DMONITOR_CFG0 : std_logic_vector(9 downto 0) := "00" & X"00";
    DMONITOR_CFG1 : std_logic_vector(7 downto 0) := X"00";
    ES_CLK_PHASE_SEL : bit := '0';
    ES_CONTROL : std_logic_vector(5 downto 0) := "000000";
    ES_ERRDET_EN : string := "FALSE";
    ES_EYE_SCAN_EN : string := "FALSE";
    ES_HORZ_OFFSET : std_logic_vector(11 downto 0) := X"000";
    ES_PMA_CFG : std_logic_vector(9 downto 0) := "0000000000";
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
    EVODD_PHI_CFG : std_logic_vector(10 downto 0) := "00000000000";
    EYE_SCAN_SWAP_EN : bit := '0';
    FTS_DESKEW_SEQ_ENABLE : std_logic_vector(3 downto 0) := "1111";
    FTS_LANE_DESKEW_CFG : std_logic_vector(3 downto 0) := "1111";
    FTS_LANE_DESKEW_EN : string := "FALSE";
    GEARBOX_MODE : std_logic_vector(4 downto 0) := "00000";
    GM_BIAS_SELECT : bit := '0';
    ISCAN_CK_PH_SEL2 : bit := '0';
    LOCAL_MASTER : bit := '0';
    LOOP0_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP10_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP11_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP12_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP13_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP1_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP2_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP3_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP4_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP5_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP6_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP7_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP8_CFG : std_logic_vector(15 downto 0) := X"0000";
    LOOP9_CFG : std_logic_vector(15 downto 0) := X"0000";
    LPBK_BIAS_CTRL : std_logic_vector(2 downto 0) := "000";
    LPBK_EN_RCAL_B : bit := '0';
    LPBK_EXT_RCAL : std_logic_vector(3 downto 0) := "0000";
    LPBK_RG_CTRL : std_logic_vector(3 downto 0) := "0000";
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
    PCIE_BUFG_DIV_CTRL : std_logic_vector(15 downto 0) := X"0000";
    PCIE_RXPCS_CFG_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    PCIE_RXPMA_CFG : std_logic_vector(15 downto 0) := X"0000";
    PCIE_TXPCS_CFG_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    PCIE_TXPMA_CFG : std_logic_vector(15 downto 0) := X"0000";
    PCS_PCIE_EN : string := "FALSE";
    PCS_RSVD0 : std_logic_vector(15 downto 0) := "0000000000000000";
    PCS_RSVD1 : std_logic_vector(2 downto 0) := "000";
    PD_TRANS_TIME_FROM_P2 : std_logic_vector(11 downto 0) := X"03C";
    PD_TRANS_TIME_NONE_P2 : std_logic_vector(7 downto 0) := X"19";
    PD_TRANS_TIME_TO_P2 : std_logic_vector(7 downto 0) := X"64";
    PLL_SEL_MODE_GEN12 : std_logic_vector(1 downto 0) := "00";
    PLL_SEL_MODE_GEN3 : std_logic_vector(1 downto 0) := "00";
    PMA_RSV0 : std_logic_vector(15 downto 0) := X"00E0";
    PMA_RSV1 : std_logic_vector(15 downto 0) := X"000A";
    PREIQ_FREQ_BST : integer := 0;
    PROCESS_PAR : std_logic_vector(2 downto 0) := "010";
    RATE_SW_USE_DRP : bit := '0';
    RESET_POWERSAVE_DISABLE : bit := '0';
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
    RXCDRFREQRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXCDRPHRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXCDR_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG0_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG1 : std_logic_vector(15 downto 0) := X"0300";
    RXCDR_CFG1_GEN3 : std_logic_vector(15 downto 0) := X"0300";
    RXCDR_CFG2 : std_logic_vector(15 downto 0) := X"0060";
    RXCDR_CFG2_GEN3 : std_logic_vector(15 downto 0) := X"0060";
    RXCDR_CFG3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG3_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG4 : std_logic_vector(15 downto 0) := X"0002";
    RXCDR_CFG4_GEN3 : std_logic_vector(15 downto 0) := X"0002";
    RXCDR_CFG5 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_CFG5_GEN3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_FR_RESET_ON_EIDLE : bit := '0';
    RXCDR_HOLD_DURING_EIDLE : bit := '0';
    RXCDR_LOCK_CFG0 : std_logic_vector(15 downto 0) := X"0001";
    RXCDR_LOCK_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_LOCK_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_LOCK_CFG3 : std_logic_vector(15 downto 0) := X"0000";
    RXCDR_PH_RESET_ON_EIDLE : bit := '0';
    RXCFOKDONE_SRC : std_logic_vector(1 downto 0) := "00";
    RXCFOK_CFG0 : std_logic_vector(15 downto 0) := X"3E00";
    RXCFOK_CFG1 : std_logic_vector(15 downto 0) := X"0042";
    RXCFOK_CFG2 : std_logic_vector(15 downto 0) := X"002D";
    RXDFELPMRESET_TIME : std_logic_vector(6 downto 0) := "0001111";
    RXDFELPM_KL_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFELPM_KL_CFG1 : std_logic_vector(15 downto 0) := X"0022";
    RXDFELPM_KL_CFG2 : std_logic_vector(15 downto 0) := X"0100";
    RXDFE_CFG0 : std_logic_vector(15 downto 0) := X"4C00";
    RXDFE_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_GC_CFG0 : std_logic_vector(15 downto 0) := X"1E00";
    RXDFE_GC_CFG1 : std_logic_vector(15 downto 0) := X"1900";
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
    RXDFE_OS_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_OS_CFG1 : std_logic_vector(15 downto 0) := X"0200";
    RXDFE_PWR_SAVING : bit := '0';
    RXDFE_UT_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_UT_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXDFE_VP_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXDFE_VP_CFG1 : std_logic_vector(15 downto 0) := X"0022";
    RXDLY_CFG : std_logic_vector(15 downto 0) := X"001F";
    RXDLY_LCFG : std_logic_vector(15 downto 0) := X"0030";
    RXELECIDLE_CFG : string := "SIGCFG_4";
    RXGBOX_FIFO_INIT_RD_ADDR : integer := 4;
    RXGEARBOX_EN : string := "FALSE";
    RXISCANRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXLPM_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXLPM_GC_CFG : std_logic_vector(15 downto 0) := X"0200";
    RXLPM_KH_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    RXLPM_KH_CFG1 : std_logic_vector(15 downto 0) := X"0002";
    RXLPM_OS_CFG0 : std_logic_vector(15 downto 0) := X"0400";
    RXLPM_OS_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    RXOOB_CFG : std_logic_vector(8 downto 0) := "000000110";
    RXOOB_CLK_CFG : string := "PMA";
    RXOSCALRESET_TIME : std_logic_vector(4 downto 0) := "00011";
    RXOUT_DIV : integer := 4;
    RXPCSRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXPHBEACON_CFG : std_logic_vector(15 downto 0) := X"0000";
    RXPHDLY_CFG : std_logic_vector(15 downto 0) := X"2020";
    RXPHSAMP_CFG : std_logic_vector(15 downto 0) := X"2100";
    RXPHSLIP_CFG : std_logic_vector(15 downto 0) := X"9933";
    RXPH_MONITOR_SEL : std_logic_vector(4 downto 0) := "00000";
    RXPI_AUTO_BW_SEL_BYPASS : bit := '0';
    RXPI_CFG : std_logic_vector(15 downto 0) := X"0100";
    RXPI_LPM : bit := '0';
    RXPI_RSV0 : std_logic_vector(15 downto 0) := X"0000";
    RXPI_SEL_LC : std_logic_vector(1 downto 0) := "00";
    RXPI_STARTCODE : std_logic_vector(1 downto 0) := "00";
    RXPI_VREFSEL : bit := '0';
    RXPMACLK_SEL : string := "DATA";
    RXPMARESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RXPRBS_ERR_LOOPBACK : bit := '0';
    RXPRBS_LINKACQ_CNT : integer := 15;
    RXSLIDE_AUTO_WAIT : integer := 7;
    RXSLIDE_MODE : string := "OFF";
    RXSYNC_MULTILANE : bit := '0';
    RXSYNC_OVRD : bit := '0';
    RXSYNC_SKIP_DA : bit := '0';
    RX_AFE_CM_EN : bit := '0';
    RX_BIAS_CFG0 : std_logic_vector(15 downto 0) := X"1534";
    RX_BUFFER_CFG : std_logic_vector(5 downto 0) := "000000";
    RX_CAPFF_SARC_ENB : bit := '0';
    RX_CLK25_DIV : integer := 8;
    RX_CLKMUX_EN : bit := '1';
    RX_CLK_SLIP_OVRD : std_logic_vector(4 downto 0) := "00000";
    RX_CM_BUF_CFG : std_logic_vector(3 downto 0) := "1010";
    RX_CM_BUF_PD : bit := '0';
    RX_CM_SEL : integer := 3;
    RX_CM_TRIM : integer := 10;
    RX_CTLE1_KHKL : bit := '0';
    RX_CTLE2_KHKL : bit := '0';
    RX_CTLE3_AGC : bit := '0';
    RX_DATA_WIDTH : integer := 20;
    RX_DDI_SEL : std_logic_vector(5 downto 0) := "000000";
    RX_DEFER_RESET_BUF_EN : string := "TRUE";
    RX_DEGEN_CTRL : std_logic_vector(2 downto 0) := "011";
    RX_DFELPM_CFG0 : integer := 0;
    RX_DFELPM_CFG1 : bit := '1';
    RX_DFELPM_KLKH_AGC_STUP_EN : bit := '1';
    RX_DFE_AGC_CFG0 : std_logic_vector(1 downto 0) := "00";
    RX_DFE_AGC_CFG1 : integer := 2;
    RX_DFE_KL_LPM_KH_CFG0 : integer := 1;
    RX_DFE_KL_LPM_KH_CFG1 : integer := 2;
    RX_DFE_KL_LPM_KL_CFG0 : std_logic_vector(1 downto 0) := "01";
    RX_DFE_KL_LPM_KL_CFG1 : std_logic_vector(2 downto 0) := "010";
    RX_DFE_LPM_HOLD_DURING_EIDLE : bit := '0';
    RX_DISPERR_SEQ_MATCH : string := "TRUE";
    RX_DIV2_MODE_B : bit := '0';
    RX_DIVRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    RX_EN_CTLE_RCAL_B : bit := '0';
    RX_EN_HI_LR : bit := '0';
    RX_EXT_RL_CTRL : std_logic_vector(8 downto 0) := "000000000";
    RX_EYESCAN_VS_CODE : std_logic_vector(6 downto 0) := "0000000";
    RX_EYESCAN_VS_NEG_DIR : bit := '0';
    RX_EYESCAN_VS_RANGE : std_logic_vector(1 downto 0) := "00";
    RX_EYESCAN_VS_UT_SIGN : bit := '0';
    RX_FABINT_USRCLK_FLOP : bit := '0';
    RX_INT_DATAWIDTH : integer := 1;
    RX_PMA_POWER_SAVE : bit := '0';
    RX_PROGDIV_CFG : real := 0.0;
    RX_PROGDIV_RATE : std_logic_vector(15 downto 0) := X"0001";
    RX_RESLOAD_CTRL : std_logic_vector(3 downto 0) := "0000";
    RX_RESLOAD_OVRD : bit := '0';
    RX_SAMPLE_PERIOD : std_logic_vector(2 downto 0) := "101";
    RX_SIG_VALID_DLY : integer := 11;
    RX_SUM_DFETAPREP_EN : bit := '0';
    RX_SUM_IREF_TUNE : std_logic_vector(3 downto 0) := "0000";
    RX_SUM_VCMTUNE : std_logic_vector(3 downto 0) := "1000";
    RX_SUM_VCM_OVWR : bit := '0';
    RX_SUM_VREF_TUNE : std_logic_vector(2 downto 0) := "100";
    RX_TUNE_AFE_OS : std_logic_vector(1 downto 0) := "00";
    RX_VREG_CTRL : std_logic_vector(2 downto 0) := "101";
    RX_VREG_PDB : bit := '1';
    RX_WIDEMODE_CDR : std_logic_vector(1 downto 0) := "01";
    RX_XCLK_SEL : string := "RXDES";
    RX_XMODE_SEL : bit := '0';
    SAS_MAX_COM : integer := 64;
    SAS_MIN_COM : integer := 36;
    SATA_BURST_SEQ_LEN : std_logic_vector(3 downto 0) := "1111";
    SATA_BURST_VAL : std_logic_vector(2 downto 0) := "100";
    SATA_CPLL_CFG : string := "VCO_3000MHZ";
    SATA_EIDLE_VAL : std_logic_vector(2 downto 0) := "100";
    SATA_MAX_BURST : integer := 8;
    SATA_MAX_INIT : integer := 21;
    SATA_MAX_WAKE : integer := 7;
    SATA_MIN_BURST : integer := 4;
    SATA_MIN_INIT : integer := 12;
    SATA_MIN_WAKE : integer := 4;
    SHOW_REALIGN_COMMA : string := "TRUE";
    SIM_MODE : string := "FAST";
    SIM_RECEIVER_DETECT_PASS : string := "TRUE";
    SIM_RESET_SPEEDUP : string := "TRUE";
    SIM_TX_EIDLE_DRIVE_LEVEL : bit := '0';
    SIM_VERSION : integer := 2;
    TAPDLY_SET_TX : std_logic_vector(1 downto 0) := "00";
    TEMPERATURE_PAR : std_logic_vector(3 downto 0) := "0010";
    TERM_RCAL_CFG : std_logic_vector(14 downto 0) := "100001000010000";
    TERM_RCAL_OVRD : std_logic_vector(2 downto 0) := "000";
    TRANS_TIME_RATE : std_logic_vector(7 downto 0) := X"0E";
    TST_RSV0 : std_logic_vector(7 downto 0) := X"00";
    TST_RSV1 : std_logic_vector(7 downto 0) := X"00";
    TXBUF_EN : string := "TRUE";
    TXBUF_RESET_ON_RATE_CHANGE : string := "FALSE";
    TXDLY_CFG : std_logic_vector(15 downto 0) := X"001F";
    TXDLY_LCFG : std_logic_vector(15 downto 0) := X"0030";
    TXFIFO_ADDR_CFG : string := "LOW";
    TXGBOX_FIFO_INIT_RD_ADDR : integer := 4;
    TXGEARBOX_EN : string := "FALSE";
    TXOUT_DIV : integer := 4;
    TXPCSRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    TXPHDLY_CFG0 : std_logic_vector(15 downto 0) := X"2020";
    TXPHDLY_CFG1 : std_logic_vector(15 downto 0) := X"0001";
    TXPH_CFG : std_logic_vector(15 downto 0) := X"0123";
    TXPH_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    TXPH_MONITOR_SEL : std_logic_vector(4 downto 0) := "00000";
    TXPI_CFG0 : std_logic_vector(1 downto 0) := "00";
    TXPI_CFG1 : std_logic_vector(1 downto 0) := "00";
    TXPI_CFG2 : std_logic_vector(1 downto 0) := "00";
    TXPI_CFG3 : bit := '0';
    TXPI_CFG4 : bit := '1';
    TXPI_CFG5 : std_logic_vector(2 downto 0) := "000";
    TXPI_GRAY_SEL : bit := '0';
    TXPI_INVSTROBE_SEL : bit := '0';
    TXPI_LPM : bit := '0';
    TXPI_PPMCLK_SEL : string := "TXUSRCLK2";
    TXPI_PPM_CFG : std_logic_vector(7 downto 0) := "00000000";
    TXPI_RSV0 : std_logic_vector(15 downto 0) := X"0000";
    TXPI_SYNFREQ_PPM : std_logic_vector(2 downto 0) := "000";
    TXPI_VREFSEL : bit := '0';
    TXPMARESET_TIME : std_logic_vector(4 downto 0) := "00001";
    TXSYNC_MULTILANE : bit := '0';
    TXSYNC_OVRD : bit := '0';
    TXSYNC_SKIP_DA : bit := '0';
    TX_CLK25_DIV : integer := 8;
    TX_CLKMUX_EN : bit := '1';
    TX_CLKREG_PDB : bit := '0';
    TX_CLKREG_SET : std_logic_vector(2 downto 0) := "000";
    TX_DATA_WIDTH : integer := 20;
    TX_DCD_CFG : std_logic_vector(5 downto 0) := "000010";
    TX_DCD_EN : bit := '0';
    TX_DEEMPH0 : std_logic_vector(5 downto 0) := "000000";
    TX_DEEMPH1 : std_logic_vector(5 downto 0) := "000000";
    TX_DIVRESET_TIME : std_logic_vector(4 downto 0) := "00001";
    TX_DRIVE_MODE : string := "DIRECT";
    TX_DRVMUX_CTRL : integer := 2;
    TX_EIDLE_ASSERT_DELAY : std_logic_vector(2 downto 0) := "110";
    TX_EIDLE_DEASSERT_DELAY : std_logic_vector(2 downto 0) := "100";
    TX_EML_PHI_TUNE : bit := '0';
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
    TX_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    TX_PHICAL_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    TX_PHICAL_CFG1 : std_logic_vector(15 downto 0) := X"7E00";
    TX_PHICAL_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    TX_PI_BIASSET : integer := 0;
    TX_PI_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    TX_PI_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    TX_PI_DIV2_MODE_B : bit := '0';
    TX_PI_SEL_QPLL0 : bit := '0';
    TX_PI_SEL_QPLL1 : bit := '0';
    TX_PMADATA_OPT : bit := '0';
    TX_PMA_POWER_SAVE : bit := '0';
    TX_PREDRV_CTRL : integer := 2;
    TX_PROGCLK_SEL : string := "POSTPI";
    TX_PROGDIV_CFG : real := 0.0;
    TX_PROGDIV_RATE : std_logic_vector(15 downto 0) := X"0001";
    TX_RXDETECT_CFG : std_logic_vector(13 downto 0) := "00" & X"032";
    TX_RXDETECT_REF : integer := 3;
    TX_SAMPLE_PERIOD : std_logic_vector(2 downto 0) := "101";
    TX_SARC_LPBK_ENB : bit := '0';
    TX_XCLK_SEL : string := "TXOUT";
    USE_PCS_CLK_PHASE_SEL : bit := '0'
  );

  port (
    BUFGTCE              : out std_logic_vector(2 downto 0);
    BUFGTCEMASK          : out std_logic_vector(2 downto 0);
    BUFGTDIV             : out std_logic_vector(8 downto 0);
    BUFGTRESET           : out std_logic_vector(2 downto 0);
    BUFGTRSTMASK         : out std_logic_vector(2 downto 0);
    CPLLFBCLKLOST        : out std_ulogic;
    CPLLLOCK             : out std_ulogic;
    CPLLREFCLKLOST       : out std_ulogic;
    DMONITOROUT          : out std_logic_vector(16 downto 0);
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
    PINRSRVDAS           : out std_logic_vector(7 downto 0);
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
    RXMONITOROUT         : out std_logic_vector(6 downto 0);
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
    DRPWE                : in std_ulogic;
    ELPCALDVORWREN       : in std_ulogic;
    ELPCALPAORWREN       : in std_ulogic;
    EVODDPHICALDONE      : in std_ulogic;
    EVODDPHICALSTART     : in std_ulogic;
    EVODDPHIDRDEN        : in std_ulogic;
    EVODDPHIDWREN        : in std_ulogic;
    EVODDPHIXRDEN        : in std_ulogic;
    EVODDPHIXWREN        : in std_ulogic;
    EYESCANMODE          : in std_ulogic;
    EYESCANRESET         : in std_ulogic;
    EYESCANTRIGGER       : in std_ulogic;
    GTGREFCLK            : in std_ulogic;
    GTNORTHREFCLK0       : in std_ulogic;
    GTNORTHREFCLK1       : in std_ulogic;
    GTREFCLK0            : in std_ulogic;
    GTREFCLK1            : in std_ulogic;
    GTRESETSEL           : in std_ulogic;
    GTRSVD               : in std_logic_vector(15 downto 0);
    GTRXRESET            : in std_ulogic;
    GTSOUTHREFCLK0       : in std_ulogic;
    GTSOUTHREFCLK1       : in std_ulogic;
    GTTXRESET            : in std_ulogic;
    GTYRXN               : in std_ulogic;
    GTYRXP               : in std_ulogic;
    LOOPBACK             : in std_logic_vector(2 downto 0);
    LOOPRSVD             : in std_logic_vector(15 downto 0);
    LPBKRXTXSEREN        : in std_ulogic;
    LPBKTXRXSEREN        : in std_ulogic;
    PCIEEQRXEQADAPTDONE  : in std_ulogic;
    PCIERSTIDLE          : in std_ulogic;
    PCIERSTTXSYNCSTART   : in std_ulogic;
    PCIEUSERRATEDONE     : in std_ulogic;
    PCSRSVDIN            : in std_logic_vector(15 downto 0);
    PCSRSVDIN2           : in std_logic_vector(4 downto 0);
    PMARSVDIN            : in std_logic_vector(4 downto 0);
    QPLL0CLK             : in std_ulogic;
    QPLL0REFCLK          : in std_ulogic;
    QPLL1CLK             : in std_ulogic;
    QPLL1REFCLK          : in std_ulogic;
    RESETOVRD            : in std_ulogic;
    RSTCLKENTX           : in std_ulogic;
    RX8B10BEN            : in std_ulogic;
    RXBUFRESET           : in std_ulogic;
    RXCDRFREQRESET       : in std_ulogic;
    RXCDRHOLD            : in std_ulogic;
    RXCDROVRDEN          : in std_ulogic;
    RXCDRRESET           : in std_ulogic;
    RXCDRRESETRSV        : in std_ulogic;
    RXCHBONDEN           : in std_ulogic;
    RXCHBONDI            : in std_logic_vector(4 downto 0);
    RXCHBONDLEVEL        : in std_logic_vector(2 downto 0);
    RXCHBONDMASTER       : in std_ulogic;
    RXCHBONDSLAVE        : in std_ulogic;
    RXCKCALRESET         : in std_ulogic;
    RXCOMMADETEN         : in std_ulogic;
    RXDCCFORCESTART      : in std_ulogic;
    RXDFEAGCHOLD         : in std_ulogic;
    RXDFEAGCOVRDEN       : in std_ulogic;
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
    RXDFEVSEN            : in std_ulogic;
    RXDFEXYDEN           : in std_ulogic;
    RXDLYBYPASS          : in std_ulogic;
    RXDLYEN              : in std_ulogic;
    RXDLYOVRDEN          : in std_ulogic;
    RXDLYSRESET          : in std_ulogic;
    RXELECIDLEMODE       : in std_logic_vector(1 downto 0);
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
    RXOSINTCFG           : in std_logic_vector(3 downto 0);
    RXOSINTEN            : in std_ulogic;
    RXOSINTHOLD          : in std_ulogic;
    RXOSINTOVRDEN        : in std_ulogic;
    RXOSINTSTROBE        : in std_ulogic;
    RXOSINTTESTOVRDEN    : in std_ulogic;
    RXOSOVRDEN           : in std_ulogic;
    RXOUTCLKSEL          : in std_logic_vector(2 downto 0);
    RXPCOMMAALIGNEN      : in std_ulogic;
    RXPCSRESET           : in std_ulogic;
    RXPD                 : in std_logic_vector(1 downto 0);
    RXPHALIGN            : in std_ulogic;
    RXPHALIGNEN          : in std_ulogic;
    RXPHDLYPD            : in std_ulogic;
    RXPHDLYRESET         : in std_ulogic;
    RXPHOVRDEN           : in std_ulogic;
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
    RXUSERRDY            : in std_ulogic;
    RXUSRCLK             : in std_ulogic;
    RXUSRCLK2            : in std_ulogic;
    SIGVALIDCLK          : in std_ulogic;
    TSTIN                : in std_logic_vector(19 downto 0);
    TX8B10BBYPASS        : in std_logic_vector(7 downto 0);
    TX8B10BEN            : in std_ulogic;
    TXBUFDIFFCTRL        : in std_logic_vector(2 downto 0);
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
    TXDEEMPH             : in std_ulogic;
    TXDETECTRX           : in std_ulogic;
    TXDIFFCTRL           : in std_logic_vector(4 downto 0);
    TXDIFFPD             : in std_ulogic;
    TXDLYBYPASS          : in std_ulogic;
    TXDLYEN              : in std_ulogic;
    TXDLYHOLD            : in std_ulogic;
    TXDLYOVRDEN          : in std_ulogic;
    TXDLYSRESET          : in std_ulogic;
    TXDLYUPDOWN          : in std_ulogic;
    TXELECIDLE           : in std_ulogic;
    TXELFORCESTART       : in std_ulogic;
    TXHEADER             : in std_logic_vector(5 downto 0);
    TXINHIBIT            : in std_ulogic;
    TXLATCLK             : in std_ulogic;
    TXMAINCURSOR         : in std_logic_vector(6 downto 0);
    TXMARGIN             : in std_logic_vector(2 downto 0);
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
end GTYE3_CHANNEL;

architecture GTYE3_CHANNEL_V of GTYE3_CHANNEL is
  component SIP_GTYE3_CHANNEL
    generic (
--        SIM_MODE : string := "FAST";
        SIM_RECEIVER_DETECT_PASS : string := "TRUE";
        SIM_RESET_SPEEDUP : string := "TRUE";
        SIM_TX_EIDLE_DRIVE_LEVEL : bit := '0';
        SIM_VERSION : integer := 2
      );
    port (
        ACJTAG_DEBUG_MODE    : in std_logic_vector(0 downto 0);
        ACJTAG_MODE          : in std_logic_vector(0 downto 0);
        ACJTAG_RESET         : in std_logic_vector(0 downto 0);
        ADAPT_CFG0           : in std_logic_vector(15 downto 0);
        ADAPT_CFG1           : in std_logic_vector(15 downto 0);
        ADAPT_CFG2           : in std_logic_vector(15 downto 0);
        AEN_CDRSTEPSEL       : in std_logic_vector(0 downto 0);
        AEN_CPLL             : in std_logic_vector(0 downto 0);
        AEN_ELPCAL           : in std_logic_vector(0 downto 0);
        AEN_EYESCAN          : in std_logic_vector(0 downto 0);
        AEN_LOOPBACK         : in std_logic_vector(0 downto 0);
        AEN_MASTER           : in std_logic_vector(0 downto 0);
        AEN_MUXDCD           : in std_logic_vector(0 downto 0);
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
        AUTO_BW_SEL_BYPASS   : in std_logic_vector(0 downto 0);
        A_AFECFOKEN          : in std_logic_vector(0 downto 0);
        A_CPLLLOCKEN         : in std_logic_vector(0 downto 0);
        A_CPLLPD             : in std_logic_vector(0 downto 0);
        A_CPLLRESET          : in std_logic_vector(0 downto 0);
        A_DFECFOKFCDAC       : in std_logic_vector(5 downto 0);
        A_DFECFOKFCNUM       : in std_logic_vector(3 downto 0);
        A_DFECFOKFPULSE      : in std_logic_vector(0 downto 0);
        A_DFECFOKHOLD        : in std_logic_vector(0 downto 0);
        A_DFECFOKOVREN       : in std_logic_vector(0 downto 0);
        A_ELPCALDVORWREN     : in std_logic_vector(0 downto 0);
        A_ELPCALPAORWREN     : in std_logic_vector(0 downto 0);
        A_EYESCANMODE        : in std_logic_vector(0 downto 0);
        A_EYESCANRESET       : in std_logic_vector(0 downto 0);
        A_GTRESETSEL         : in std_logic_vector(0 downto 0);
        A_GTRXRESET          : in std_logic_vector(0 downto 0);
        A_GTTXRESET          : in std_logic_vector(0 downto 0);
        A_LOOPBACK           : in std_logic_vector(79 downto 0);
        A_LPMGCHOLD          : in std_logic_vector(0 downto 0);
        A_LPMGCOVREN         : in std_logic_vector(0 downto 0);
        A_LPMOSHOLD          : in std_logic_vector(0 downto 0);
        A_LPMOSOVREN         : in std_logic_vector(0 downto 0);
        A_MUXDCDEXHOLD       : in std_logic_vector(0 downto 0);
        A_MUXDCDORWREN       : in std_logic_vector(0 downto 0);
        A_RXBUFRESET         : in std_logic_vector(0 downto 0);
        A_RXCDRFREQRESET     : in std_logic_vector(0 downto 0);
        A_RXCDRHOLD          : in std_logic_vector(0 downto 0);
        A_RXCDROVRDEN        : in std_logic_vector(0 downto 0);
        A_RXCDRRESET         : in std_logic_vector(0 downto 0);
        A_RXDFEAGCHOLD       : in std_logic_vector(0 downto 0);
        A_RXDFEAGCOVRDEN     : in std_logic_vector(0 downto 0);
        A_RXDFECFOKFEN       : in std_logic_vector(0 downto 0);
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
        A_RXDFEVSEN          : in std_logic_vector(0 downto 0);
        A_RXDFEXYDEN         : in std_logic_vector(0 downto 0);
        A_RXDLYBYPASS        : in std_logic_vector(0 downto 0);
        A_RXDLYEN            : in std_logic_vector(0 downto 0);
        A_RXDLYOVRDEN        : in std_logic_vector(0 downto 0);
        A_RXDLYSRESET        : in std_logic_vector(0 downto 0);
        A_RXLPMEN            : in std_logic_vector(0 downto 0);
        A_RXLPMHFHOLD        : in std_logic_vector(0 downto 0);
        A_RXLPMHFOVRDEN      : in std_logic_vector(0 downto 0);
        A_RXLPMLFHOLD        : in std_logic_vector(0 downto 0);
        A_RXLPMLFKLOVRDEN    : in std_logic_vector(0 downto 0);
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
        A_RXPHOVRDEN         : in std_logic_vector(0 downto 0);
        A_RXPLLCLKSEL        : in std_logic_vector(63 downto 0);
        A_RXPMARESET         : in std_logic_vector(0 downto 0);
        A_RXPOLARITY         : in std_logic_vector(0 downto 0);
        A_RXPRBSCNTRESET     : in std_logic_vector(0 downto 0);
        A_RXPRBSSEL          : in std_logic_vector(47 downto 0);
        A_RXPROGDIVRESET     : in std_logic_vector(0 downto 0);
        A_RXSYSCLKSEL        : in std_logic_vector(87 downto 0);
        A_TXBUFDIFFCTRL      : in std_logic_vector(2 downto 0);
        A_TXDEEMPH           : in std_logic_vector(0 downto 0);
        A_TXDIFFCTRL         : in std_logic_vector(4 downto 0);
        A_TXDLYBYPASS        : in std_logic_vector(0 downto 0);
        A_TXDLYEN            : in std_logic_vector(0 downto 0);
        A_TXDLYOVRDEN        : in std_logic_vector(0 downto 0);
        A_TXDLYSRESET        : in std_logic_vector(0 downto 0);
        A_TXELECIDLE         : in std_logic_vector(0 downto 0);
        A_TXINHIBIT          : in std_logic_vector(0 downto 0);
        A_TXMAINCURSOR       : in std_logic_vector(6 downto 0);
        A_TXMARGIN           : in std_logic_vector(2 downto 0);
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
        A_TXSWING            : in std_logic_vector(0 downto 0);
        A_TXSYSCLKSEL        : in std_logic_vector(87 downto 0);
        CAPBYPASS_FORCE      : in std_logic_vector(0 downto 0);
        CBCC_DATA_SOURCE_SEL : in std_logic_vector(55 downto 0);
        CDR_SWAP_MODE_EN     : in std_logic_vector(0 downto 0);
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
        CKCAL_RSVD0          : in std_logic_vector(15 downto 0);
        CKCAL_RSVD1          : in std_logic_vector(15 downto 0);
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
        CPLL_CFG3            : in std_logic_vector(5 downto 0);
        CPLL_FBDIV           : in std_logic_vector(4 downto 0);
        CPLL_FBDIV_45        : in std_logic_vector(2 downto 0);
        CPLL_INIT_CFG0       : in std_logic_vector(15 downto 0);
        CPLL_INIT_CFG1       : in std_logic_vector(7 downto 0);
        CPLL_LOCK_CFG        : in std_logic_vector(15 downto 0);
        CPLL_REFCLK_DIV      : in std_logic_vector(4 downto 0);
        CTLE3_OCAP_EXT_CTRL  : in std_logic_vector(2 downto 0);
        CTLE3_OCAP_EXT_EN    : in std_logic_vector(0 downto 0);
        DDI_CTRL             : in std_logic_vector(1 downto 0);
        DDI_REALIGN_WAIT     : in std_logic_vector(4 downto 0);
        DEC_MCOMMA_DETECT    : in std_logic_vector(39 downto 0);
        DEC_PCOMMA_DETECT    : in std_logic_vector(39 downto 0);
        DEC_VALID_COMMA_ONLY : in std_logic_vector(39 downto 0);
        DFE_D_X_REL_POS      : in std_logic_vector(0 downto 0);
        DFE_VCM_COMP_EN      : in std_logic_vector(0 downto 0);
        DMONITOR_CFG0        : in std_logic_vector(9 downto 0);
        DMONITOR_CFG1        : in std_logic_vector(7 downto 0);
        ES_CLK_PHASE_SEL     : in std_logic_vector(0 downto 0);
        ES_CONTROL           : in std_logic_vector(5 downto 0);
        ES_ERRDET_EN         : in std_logic_vector(39 downto 0);
        ES_EYE_SCAN_EN       : in std_logic_vector(39 downto 0);
        ES_HORZ_OFFSET       : in std_logic_vector(11 downto 0);
        ES_PMA_CFG           : in std_logic_vector(9 downto 0);
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
        EVODD_PHI_CFG        : in std_logic_vector(10 downto 0);
        EYE_SCAN_SWAP_EN     : in std_logic_vector(0 downto 0);
        FTS_DESKEW_SEQ_ENABLE : in std_logic_vector(3 downto 0);
        FTS_LANE_DESKEW_CFG  : in std_logic_vector(3 downto 0);
        FTS_LANE_DESKEW_EN   : in std_logic_vector(39 downto 0);
        GEARBOX_MODE         : in std_logic_vector(4 downto 0);
        GEN_RXUSRCLK         : in std_logic_vector(39 downto 0);
        GEN_TXUSRCLK         : in std_logic_vector(39 downto 0);
        GM_BIAS_SELECT       : in std_logic_vector(0 downto 0);
        GT_INSTANTIATED      : in std_logic_vector(0 downto 0);
        ISCAN_CK_PH_SEL2     : in std_logic_vector(0 downto 0);
        LOCAL_MASTER         : in std_logic_vector(0 downto 0);
        LOOP0_CFG            : in std_logic_vector(15 downto 0);
        LOOP10_CFG           : in std_logic_vector(15 downto 0);
        LOOP11_CFG           : in std_logic_vector(15 downto 0);
        LOOP12_CFG           : in std_logic_vector(15 downto 0);
        LOOP13_CFG           : in std_logic_vector(15 downto 0);
        LOOP1_CFG            : in std_logic_vector(15 downto 0);
        LOOP2_CFG            : in std_logic_vector(15 downto 0);
        LOOP3_CFG            : in std_logic_vector(15 downto 0);
        LOOP4_CFG            : in std_logic_vector(15 downto 0);
        LOOP5_CFG            : in std_logic_vector(15 downto 0);
        LOOP6_CFG            : in std_logic_vector(15 downto 0);
        LOOP7_CFG            : in std_logic_vector(15 downto 0);
        LOOP8_CFG            : in std_logic_vector(15 downto 0);
        LOOP9_CFG            : in std_logic_vector(15 downto 0);
        LPBK_BIAS_CTRL       : in std_logic_vector(2 downto 0);
        LPBK_EN_RCAL_B       : in std_logic_vector(0 downto 0);
        LPBK_EXT_RCAL        : in std_logic_vector(3 downto 0);
        LPBK_RG_CTRL         : in std_logic_vector(3 downto 0);
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
        PCIE_BUFG_DIV_CTRL   : in std_logic_vector(15 downto 0);
        PCIE_RXPCS_CFG_GEN3  : in std_logic_vector(15 downto 0);
        PCIE_RXPMA_CFG       : in std_logic_vector(15 downto 0);
        PCIE_TXPCS_CFG_GEN3  : in std_logic_vector(15 downto 0);
        PCIE_TXPMA_CFG       : in std_logic_vector(15 downto 0);
        PCS_PCIE_EN          : in std_logic_vector(39 downto 0);
        PCS_RSVD0            : in std_logic_vector(15 downto 0);
        PCS_RSVD1            : in std_logic_vector(2 downto 0);
        PD_TRANS_TIME_FROM_P2 : in std_logic_vector(11 downto 0);
        PD_TRANS_TIME_NONE_P2 : in std_logic_vector(7 downto 0);
        PD_TRANS_TIME_TO_P2  : in std_logic_vector(7 downto 0);
        PLL_SEL_MODE_GEN12   : in std_logic_vector(1 downto 0);
        PLL_SEL_MODE_GEN3    : in std_logic_vector(1 downto 0);
        PMA_RSV0             : in std_logic_vector(15 downto 0);
        PMA_RSV1             : in std_logic_vector(15 downto 0);
        PREIQ_FREQ_BST       : in std_logic_vector(1 downto 0);
        PROCESS_PAR          : in std_logic_vector(2 downto 0);
        RATE_SW_USE_DRP      : in std_logic_vector(0 downto 0);
        RESET_POWERSAVE_DISABLE : in std_logic_vector(0 downto 0);
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
        RXCDR_CFG2_GEN3      : in std_logic_vector(15 downto 0);
        RXCDR_CFG3           : in std_logic_vector(15 downto 0);
        RXCDR_CFG3_GEN3      : in std_logic_vector(15 downto 0);
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
        RXCDR_PH_RESET_ON_EIDLE : in std_logic_vector(0 downto 0);
        RXCFOKDONE_SRC       : in std_logic_vector(1 downto 0);
        RXCFOK_CFG0          : in std_logic_vector(15 downto 0);
        RXCFOK_CFG1          : in std_logic_vector(15 downto 0);
        RXCFOK_CFG2          : in std_logic_vector(15 downto 0);
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
        RXDFE_OS_CFG0        : in std_logic_vector(15 downto 0);
        RXDFE_OS_CFG1        : in std_logic_vector(15 downto 0);
        RXDFE_PWR_SAVING     : in std_logic_vector(0 downto 0);
        RXDFE_UT_CFG0        : in std_logic_vector(15 downto 0);
        RXDFE_UT_CFG1        : in std_logic_vector(15 downto 0);
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
        RXPI_AUTO_BW_SEL_BYPASS : in std_logic_vector(0 downto 0);
        RXPI_CFG             : in std_logic_vector(15 downto 0);
        RXPI_LPM             : in std_logic_vector(0 downto 0);
        RXPI_RSV0            : in std_logic_vector(15 downto 0);
        RXPI_SEL_LC          : in std_logic_vector(1 downto 0);
        RXPI_STARTCODE       : in std_logic_vector(1 downto 0);
        RXPI_VREFSEL         : in std_logic_vector(0 downto 0);
        RXPLL_SEL            : in std_logic_vector(39 downto 0);
        RXPMACLK_SEL         : in std_logic_vector(63 downto 0);
        RXPMARESET_TIME      : in std_logic_vector(4 downto 0);
        RXPRBS_ERR_LOOPBACK  : in std_logic_vector(0 downto 0);
        RXPRBS_LINKACQ_CNT   : in std_logic_vector(7 downto 0);
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
        RX_CTLE1_KHKL        : in std_logic_vector(0 downto 0);
        RX_CTLE2_KHKL        : in std_logic_vector(0 downto 0);
        RX_CTLE3_AGC         : in std_logic_vector(0 downto 0);
        RX_DATA_WIDTH        : in std_logic_vector(7 downto 0);
        RX_DDI_SEL           : in std_logic_vector(5 downto 0);
        RX_DEFER_RESET_BUF_EN : in std_logic_vector(39 downto 0);
        RX_DEGEN_CTRL        : in std_logic_vector(2 downto 0);
        RX_DFELPM_CFG0       : in std_logic_vector(2 downto 0);
        RX_DFELPM_CFG1       : in std_logic_vector(0 downto 0);
        RX_DFELPM_KLKH_AGC_STUP_EN : in std_logic_vector(0 downto 0);
        RX_DFE_AGC_CFG0      : in std_logic_vector(1 downto 0);
        RX_DFE_AGC_CFG1      : in std_logic_vector(2 downto 0);
        RX_DFE_KL_LPM_KH_CFG0 : in std_logic_vector(1 downto 0);
        RX_DFE_KL_LPM_KH_CFG1 : in std_logic_vector(2 downto 0);
        RX_DFE_KL_LPM_KL_CFG0 : in std_logic_vector(1 downto 0);
        RX_DFE_KL_LPM_KL_CFG1 : in std_logic_vector(2 downto 0);
        RX_DFE_LPM_HOLD_DURING_EIDLE : in std_logic_vector(0 downto 0);
        RX_DISPERR_SEQ_MATCH : in std_logic_vector(39 downto 0);
        RX_DIV2_MODE_B       : in std_logic_vector(0 downto 0);
        RX_DIVRESET_TIME     : in std_logic_vector(4 downto 0);
        RX_EN_CTLE_RCAL_B    : in std_logic_vector(0 downto 0);
        RX_EN_HI_LR          : in std_logic_vector(0 downto 0);
        RX_EXT_RL_CTRL       : in std_logic_vector(8 downto 0);
        RX_EYESCAN_VS_CODE   : in std_logic_vector(6 downto 0);
        RX_EYESCAN_VS_NEG_DIR : in std_logic_vector(0 downto 0);
        RX_EYESCAN_VS_RANGE  : in std_logic_vector(1 downto 0);
        RX_EYESCAN_VS_UT_SIGN : in std_logic_vector(0 downto 0);
        RX_FABINT_USRCLK_FLOP : in std_logic_vector(0 downto 0);
        RX_INT_DATAWIDTH     : in std_logic_vector(1 downto 0);
        RX_PMA_POWER_SAVE    : in std_logic_vector(0 downto 0);
        RX_PROGDIV_CFG       : in std_logic_vector(63 downto 0);
        RX_PROGDIV_RATE      : in std_logic_vector(15 downto 0);
        RX_RESLOAD_CTRL      : in std_logic_vector(3 downto 0);
        RX_RESLOAD_OVRD      : in std_logic_vector(0 downto 0);
        RX_SAMPLE_PERIOD     : in std_logic_vector(2 downto 0);
        RX_SIG_VALID_DLY     : in std_logic_vector(5 downto 0);
        RX_SUM_DFETAPREP_EN  : in std_logic_vector(0 downto 0);
        RX_SUM_IREF_TUNE     : in std_logic_vector(3 downto 0);
        RX_SUM_VCMTUNE       : in std_logic_vector(3 downto 0);
        RX_SUM_VCM_OVWR      : in std_logic_vector(0 downto 0);
        RX_SUM_VREF_TUNE     : in std_logic_vector(2 downto 0);
        RX_TUNE_AFE_OS       : in std_logic_vector(1 downto 0);
        RX_VREG_CTRL         : in std_logic_vector(2 downto 0);
        RX_VREG_PDB          : in std_logic_vector(0 downto 0);
        RX_WIDEMODE_CDR      : in std_logic_vector(1 downto 0);
        RX_XCLK_SEL          : in std_logic_vector(39 downto 0);
        RX_XMODE_SEL         : in std_logic_vector(0 downto 0);
        SAS_MAX_COM          : in std_logic_vector(6 downto 0);
        SAS_MIN_COM          : in std_logic_vector(5 downto 0);
        SATA_BURST_SEQ_LEN   : in std_logic_vector(3 downto 0);
        SATA_BURST_VAL       : in std_logic_vector(2 downto 0);
        SATA_CPLL_CFG        : in std_logic_vector(87 downto 0);
        SATA_EIDLE_VAL       : in std_logic_vector(2 downto 0);
        SATA_MAX_BURST       : in std_logic_vector(5 downto 0);
        SATA_MAX_INIT        : in std_logic_vector(5 downto 0);
        SATA_MAX_WAKE        : in std_logic_vector(5 downto 0);
        SATA_MIN_BURST       : in std_logic_vector(5 downto 0);
        SATA_MIN_INIT        : in std_logic_vector(5 downto 0);
        SATA_MIN_WAKE        : in std_logic_vector(5 downto 0);
        SHOW_REALIGN_COMMA   : in std_logic_vector(39 downto 0);
        TAPDLY_SET_TX        : in std_logic_vector(1 downto 0);
        TEMPERATURE_PAR      : in std_logic_vector(3 downto 0);
        TERM_RCAL_CFG        : in std_logic_vector(14 downto 0);
        TERM_RCAL_OVRD       : in std_logic_vector(2 downto 0);
        TRANS_TIME_RATE      : in std_logic_vector(7 downto 0);
        TST_RSV0             : in std_logic_vector(7 downto 0);
        TST_RSV1             : in std_logic_vector(7 downto 0);
        TXBUF_EN             : in std_logic_vector(39 downto 0);
        TXBUF_RESET_ON_RATE_CHANGE : in std_logic_vector(39 downto 0);
        TXDLY_CFG            : in std_logic_vector(15 downto 0);
        TXDLY_LCFG           : in std_logic_vector(15 downto 0);
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
        TXPI_CFG0            : in std_logic_vector(1 downto 0);
        TXPI_CFG1            : in std_logic_vector(1 downto 0);
        TXPI_CFG2            : in std_logic_vector(1 downto 0);
        TXPI_CFG3            : in std_logic_vector(0 downto 0);
        TXPI_CFG4            : in std_logic_vector(0 downto 0);
        TXPI_CFG5            : in std_logic_vector(2 downto 0);
        TXPI_GRAY_SEL        : in std_logic_vector(0 downto 0);
        TXPI_INVSTROBE_SEL   : in std_logic_vector(0 downto 0);
        TXPI_LPM             : in std_logic_vector(0 downto 0);
        TXPI_PPMCLK_SEL      : in std_logic_vector(71 downto 0);
        TXPI_PPM_CFG         : in std_logic_vector(7 downto 0);
        TXPI_RSV0            : in std_logic_vector(15 downto 0);
        TXPI_SYNFREQ_PPM     : in std_logic_vector(2 downto 0);
        TXPI_VREFSEL         : in std_logic_vector(0 downto 0);
        TXPMARESET_TIME      : in std_logic_vector(4 downto 0);
        TXSYNC_MULTILANE     : in std_logic_vector(0 downto 0);
        TXSYNC_OVRD          : in std_logic_vector(0 downto 0);
        TXSYNC_SKIP_DA       : in std_logic_vector(0 downto 0);
        TX_CLK25_DIV         : in std_logic_vector(5 downto 0);
        TX_CLKMUX_EN         : in std_logic_vector(0 downto 0);
        TX_CLKREG_PDB        : in std_logic_vector(0 downto 0);
        TX_CLKREG_SET        : in std_logic_vector(2 downto 0);
        TX_DATA_WIDTH        : in std_logic_vector(7 downto 0);
        TX_DCD_CFG           : in std_logic_vector(5 downto 0);
        TX_DCD_EN            : in std_logic_vector(0 downto 0);
        TX_DEEMPH0           : in std_logic_vector(5 downto 0);
        TX_DEEMPH1           : in std_logic_vector(5 downto 0);
        TX_DIVRESET_TIME     : in std_logic_vector(4 downto 0);
        TX_DRIVE_MODE        : in std_logic_vector(63 downto 0);
        TX_DRVMUX_CTRL       : in std_logic_vector(1 downto 0);
        TX_EIDLE_ASSERT_DELAY : in std_logic_vector(2 downto 0);
        TX_EIDLE_DEASSERT_DELAY : in std_logic_vector(2 downto 0);
        TX_EML_PHI_TUNE      : in std_logic_vector(0 downto 0);
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
        TX_MODE_SEL          : in std_logic_vector(2 downto 0);
        TX_PHICAL_CFG0       : in std_logic_vector(15 downto 0);
        TX_PHICAL_CFG1       : in std_logic_vector(15 downto 0);
        TX_PHICAL_CFG2       : in std_logic_vector(15 downto 0);
        TX_PI_BIASSET        : in std_logic_vector(1 downto 0);
        TX_PI_CFG0           : in std_logic_vector(15 downto 0);
        TX_PI_CFG1           : in std_logic_vector(15 downto 0);
        TX_PI_DIV2_MODE_B    : in std_logic_vector(0 downto 0);
        TX_PI_SEL_QPLL0      : in std_logic_vector(0 downto 0);
        TX_PI_SEL_QPLL1      : in std_logic_vector(0 downto 0);
        TX_PMADATA_OPT       : in std_logic_vector(0 downto 0);
        TX_PMA_POWER_SAVE    : in std_logic_vector(0 downto 0);
        TX_PREDRV_CTRL       : in std_logic_vector(1 downto 0);
        TX_PROGCLK_SEL       : in std_logic_vector(47 downto 0);
        TX_PROGDIV_CFG       : in std_logic_vector(63 downto 0);
        TX_PROGDIV_RATE      : in std_logic_vector(15 downto 0);
        TX_RXDETECT_CFG      : in std_logic_vector(13 downto 0);
        TX_RXDETECT_REF      : in std_logic_vector(2 downto 0);
        TX_SAMPLE_PERIOD     : in std_logic_vector(2 downto 0);
        TX_SARC_LPBK_ENB     : in std_logic_vector(0 downto 0);
        TX_USERPATTERN_DATA0 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA1 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA2 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA3 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA4 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA5 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA6 : in std_logic_vector(9 downto 0);
        TX_USERPATTERN_DATA7 : in std_logic_vector(9 downto 0);
        TX_XCLK_SEL          : in std_logic_vector(39 downto 0);
        USE_PCS_CLK_PHASE_SEL : in std_logic_vector(0 downto 0);
        BUFGTCE              : out std_logic_vector(2 downto 0);
        BUFGTCEMASK          : out std_logic_vector(2 downto 0);
        BUFGTDIV             : out std_logic_vector(8 downto 0);
        BUFGTRESET           : out std_logic_vector(2 downto 0);
        BUFGTRSTMASK         : out std_logic_vector(2 downto 0);
        CPLLFBCLKLOST        : out std_ulogic;
        CPLLLOCK             : out std_ulogic;
        CPLLREFCLKLOST       : out std_ulogic;
        DMONITOROUT          : out std_logic_vector(16 downto 0);
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
        PINRSRVDAS           : out std_logic_vector(7 downto 0);
        PMASCANOUT           : out std_logic_vector(11 downto 0);
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
        RXMONITOROUT         : out std_logic_vector(6 downto 0);
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
        CDRSTEPDIR           : in std_ulogic;
        CDRSTEPSQ            : in std_ulogic;
        CDRSTEPSX            : in std_ulogic;
        CFGRESET             : in std_ulogic;
        CLKRSVD0             : in std_ulogic;
        CLKRSVD1             : in std_ulogic;
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
        DRPWE                : in std_ulogic;
        ELPCALDVORWREN       : in std_ulogic;
        ELPCALPAORWREN       : in std_ulogic;
        EVODDPHICALDONE      : in std_ulogic;
        EVODDPHICALSTART     : in std_ulogic;
        EVODDPHIDRDEN        : in std_ulogic;
        EVODDPHIDWREN        : in std_ulogic;
        EVODDPHIXRDEN        : in std_ulogic;
        EVODDPHIXWREN        : in std_ulogic;
        EYESCANMODE          : in std_ulogic;
        EYESCANRESET         : in std_ulogic;
        EYESCANTRIGGER       : in std_ulogic;
        GTGREFCLK            : in std_ulogic;
        GTNORTHREFCLK0       : in std_ulogic;
        GTNORTHREFCLK1       : in std_ulogic;
        GTREFCLK0            : in std_ulogic;
        GTREFCLK1            : in std_ulogic;
        GTRESETSEL           : in std_ulogic;
        GTRSVD               : in std_logic_vector(15 downto 0);
        GTRXRESET            : in std_ulogic;
        GTSOUTHREFCLK0       : in std_ulogic;
        GTSOUTHREFCLK1       : in std_ulogic;
        GTTXRESET            : in std_ulogic;
        GTYRXN               : in std_ulogic;
        GTYRXP               : in std_ulogic;
        LOOPBACK             : in std_logic_vector(2 downto 0);
        LOOPRSVD             : in std_logic_vector(15 downto 0);
        LPBKRXTXSEREN        : in std_ulogic;
        LPBKTXRXSEREN        : in std_ulogic;
        PCIEEQRXEQADAPTDONE  : in std_ulogic;
        PCIERSTIDLE          : in std_ulogic;
        PCIERSTTXSYNCSTART   : in std_ulogic;
        PCIEUSERRATEDONE     : in std_ulogic;
        PCSRSVDIN            : in std_logic_vector(15 downto 0);
        PCSRSVDIN2           : in std_logic_vector(4 downto 0);
        PMARSVDIN            : in std_logic_vector(4 downto 0);
        PMASCANCLK0          : in std_ulogic;
        PMASCANCLK1          : in std_ulogic;
        PMASCANCLK2          : in std_ulogic;
        PMASCANCLK3          : in std_ulogic;
        PMASCANCLK4          : in std_ulogic;
        PMASCANCLK5          : in std_ulogic;
        PMASCANENB           : in std_ulogic;
        PMASCANIN            : in std_logic_vector(11 downto 0);
        PMASCANMODEB         : in std_ulogic;
        PMASCANRSTEN         : in std_ulogic;
        QPLL0CLK             : in std_ulogic;
        QPLL0REFCLK          : in std_ulogic;
        QPLL1CLK             : in std_ulogic;
        QPLL1REFCLK          : in std_ulogic;
        RESETOVRD            : in std_ulogic;
        RSTCLKENTX           : in std_ulogic;
        RX8B10BEN            : in std_ulogic;
        RXBUFRESET           : in std_ulogic;
        RXCDRFREQRESET       : in std_ulogic;
        RXCDRHOLD            : in std_ulogic;
        RXCDROVRDEN          : in std_ulogic;
        RXCDRRESET           : in std_ulogic;
        RXCDRRESETRSV        : in std_ulogic;
        RXCHBONDEN           : in std_ulogic;
        RXCHBONDI            : in std_logic_vector(4 downto 0);
        RXCHBONDLEVEL        : in std_logic_vector(2 downto 0);
        RXCHBONDMASTER       : in std_ulogic;
        RXCHBONDSLAVE        : in std_ulogic;
        RXCKCALRESET         : in std_ulogic;
        RXCOMMADETEN         : in std_ulogic;
        RXDCCFORCESTART      : in std_ulogic;
        RXDFEAGCHOLD         : in std_ulogic;
        RXDFEAGCOVRDEN       : in std_ulogic;
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
        RXDFEVSEN            : in std_ulogic;
        RXDFEXYDEN           : in std_ulogic;
        RXDLYBYPASS          : in std_ulogic;
        RXDLYEN              : in std_ulogic;
        RXDLYOVRDEN          : in std_ulogic;
        RXDLYSRESET          : in std_ulogic;
        RXELECIDLEMODE       : in std_logic_vector(1 downto 0);
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
        RXOSINTCFG           : in std_logic_vector(3 downto 0);
        RXOSINTEN            : in std_ulogic;
        RXOSINTHOLD          : in std_ulogic;
        RXOSINTOVRDEN        : in std_ulogic;
        RXOSINTSTROBE        : in std_ulogic;
        RXOSINTTESTOVRDEN    : in std_ulogic;
        RXOSOVRDEN           : in std_ulogic;
        RXOUTCLKSEL          : in std_logic_vector(2 downto 0);
        RXPCOMMAALIGNEN      : in std_ulogic;
        RXPCSRESET           : in std_ulogic;
        RXPD                 : in std_logic_vector(1 downto 0);
        RXPHALIGN            : in std_ulogic;
        RXPHALIGNEN          : in std_ulogic;
        RXPHDLYPD            : in std_ulogic;
        RXPHDLYRESET         : in std_ulogic;
        RXPHOVRDEN           : in std_ulogic;
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
        RXUSERRDY            : in std_ulogic;
        RXUSRCLK             : in std_ulogic;
        RXUSRCLK2            : in std_ulogic;
        SARCCLK              : in std_ulogic;
        SCANCLK              : in std_ulogic;
        SCANENB              : in std_ulogic;
        SCANIN               : in std_logic_vector(18 downto 0);
        SCANMODEB            : in std_ulogic;
        SIGVALIDCLK          : in std_ulogic;
        TSTCLK0              : in std_ulogic;
        TSTCLK1              : in std_ulogic;
        TSTIN                : in std_logic_vector(19 downto 0);
        TSTPD                : in std_logic_vector(4 downto 0);
        TSTPDOVRDB           : in std_ulogic;
        TX8B10BBYPASS        : in std_logic_vector(7 downto 0);
        TX8B10BEN            : in std_ulogic;
        TXBUFDIFFCTRL        : in std_logic_vector(2 downto 0);
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
        TXDEEMPH             : in std_ulogic;
        TXDETECTRX           : in std_ulogic;
        TXDIFFCTRL           : in std_logic_vector(4 downto 0);
        TXDIFFPD             : in std_ulogic;
        TXDLYBYPASS          : in std_ulogic;
        TXDLYEN              : in std_ulogic;
        TXDLYHOLD            : in std_ulogic;
        TXDLYOVRDEN          : in std_ulogic;
        TXDLYSRESET          : in std_ulogic;
        TXDLYUPDOWN          : in std_ulogic;
        TXELECIDLE           : in std_ulogic;
        TXELFORCESTART       : in std_ulogic;
        TXHEADER             : in std_logic_vector(5 downto 0);
        TXINHIBIT            : in std_ulogic;
        TXLATCLK             : in std_ulogic;
        TXMAINCURSOR         : in std_logic_vector(6 downto 0);
        TXMARGIN             : in std_logic_vector(2 downto 0);
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

    constant MODULE_NAME : string := "GTYE3_CHANNEL";
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
    constant A_LOOPBACK_BIN : std_logic_vector(79 downto 0) := conv_string_to_slv("NoLoopBack",80);
    constant A_RXOUTCLKSEL_BIN : std_logic_vector(127 downto 0) := conv_string_to_slv("Disabled",128);
    constant A_RXPD_BIN : std_logic_vector(23 downto 0) := conv_string_to_slv("P0",24);
    constant A_RXPLLCLKSEL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv("CPLLCLK",64);
    constant A_RXPRBSSEL_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv("PRBS7",48);
    constant A_RXSYSCLKSEL_BIN : std_logic_vector(87 downto 0) := conv_string_to_slv("CPLLREFCLK",88);
    constant A_TXOUTCLKSEL_BIN : std_logic_vector(127 downto 0) := conv_string_to_slv("Disabled",128);
    constant A_TXPD_BIN : std_logic_vector(23 downto 0) := conv_string_to_slv("P0",24);
    constant A_TXPLLCLKSEL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv("CPLLCLK",64);
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
    constant RXPLL_SEL_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("CPLL",40);
    constant RXPMACLK_SEL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv(RXPMACLK_SEL,64);
    constant RXSLIDE_MODE_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(RXSLIDE_MODE,32);
    constant RX_DEFER_RESET_BUF_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_DEFER_RESET_BUF_EN,40);
    constant RX_DISPERR_SEQ_MATCH_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_DISPERR_SEQ_MATCH,40);
    constant RX_XCLK_SEL_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(RX_XCLK_SEL,40);
    constant SATA_CPLL_CFG_BIN : std_logic_vector(87 downto 0) := conv_string_to_slv(SATA_CPLL_CFG,88);
    constant SHOW_REALIGN_COMMA_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SHOW_REALIGN_COMMA,40);
    constant SIM_MODE_BIN : std_logic_vector(79 downto 0) := conv_string_to_slv(SIM_MODE,80);
    constant SIM_RECEIVER_DETECT_PASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SIM_RECEIVER_DETECT_PASS,40);
    constant SIM_RESET_SPEEDUP_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SIM_RESET_SPEEDUP,40);
    constant TXBUF_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TXBUF_EN,40);
    constant TXBUF_RESET_ON_RATE_CHANGE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TXBUF_RESET_ON_RATE_CHANGE,40);
    constant TXFIFO_ADDR_CFG_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(TXFIFO_ADDR_CFG,32);
    constant TXGEARBOX_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(TXGEARBOX_EN,40);
    constant TXPI_PPMCLK_SEL_BIN : std_logic_vector(71 downto 0) := conv_string_to_slv(TXPI_PPMCLK_SEL,72);
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
    constant AEN_ELPCAL_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_EYESCAN_BIN : std_logic_vector(0 downto 0) := "1";
    constant AEN_LOOPBACK_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_MASTER_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_MUXDCD_BIN : std_logic_vector(0 downto 0) := "0";
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
    constant AMONITOR_CFG_BIN : std_logic_vector(15 downto 0) := X"0000";
    constant AUTO_BW_SEL_BYPASS_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(AUTO_BW_SEL_BYPASS));
    constant A_AFECFOKEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_CPLLLOCKEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_CPLLPD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_CPLLRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_DFECFOKFCDAC_BIN : std_logic_vector(5 downto 0) := "000000";
    constant A_DFECFOKFCNUM_BIN : std_logic_vector(3 downto 0) := "0000";
    constant A_DFECFOKFPULSE_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_DFECFOKHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_DFECFOKOVREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_ELPCALDVORWREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_ELPCALPAORWREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_EYESCANMODE_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_EYESCANRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_GTRESETSEL_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_GTRXRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_GTTXRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_LPMGCHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_LPMGCOVREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_LPMOSHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_LPMOSOVREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_MUXDCDEXHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_MUXDCDORWREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXBUFRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXCDRFREQRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXCDRHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXCDROVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXCDRRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDFEAGCHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDFEAGCOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDFECFOKFEN_BIN : std_logic_vector(0 downto 0) := "0";
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
    constant A_RXDFEVSEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDFEXYDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDLYBYPASS_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDLYEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDLYOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXDLYSRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXLPMEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXLPMHFHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXLPMHFOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXLPMLFHOLD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXLPMLFKLOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
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
    constant A_RXPHOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXPMARESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXPOLARITY_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXPRBSCNTRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_RXPROGDIVRESET_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_RXPROGDIVRESET));
    constant A_TXBUFDIFFCTRL_BIN : std_logic_vector(2 downto 0) := "100";
    constant A_TXDEEMPH_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXDIFFCTRL_BIN : std_logic_vector(4 downto 0) := A_TXDIFFCTRL;
    constant A_TXDLYBYPASS_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXDLYEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXDLYOVRDEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXDLYSRESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXELECIDLE_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXINHIBIT_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_TXMAINCURSOR_BIN : std_logic_vector(6 downto 0) := "0000000";
    constant A_TXMARGIN_BIN : std_logic_vector(2 downto 0) := "000";
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
    constant A_TXSWING_BIN : std_logic_vector(0 downto 0) := "0";
    constant CAPBYPASS_FORCE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(CAPBYPASS_FORCE));
    constant CDR_SWAP_MODE_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(CDR_SWAP_MODE_EN));
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
    constant CKCAL_RSVD0_BIN : std_logic_vector(15 downto 0) := CKCAL_RSVD0;
    constant CKCAL_RSVD1_BIN : std_logic_vector(15 downto 0) := CKCAL_RSVD1;
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
    constant CPLL_CFG3_BIN : std_logic_vector(5 downto 0) := CPLL_CFG3;
    constant CPLL_FBDIV_45_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(CPLL_FBDIV_45,3));
    constant CPLL_FBDIV_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(CPLL_FBDIV,5));
    constant CPLL_INIT_CFG0_BIN : std_logic_vector(15 downto 0) := CPLL_INIT_CFG0;
    constant CPLL_INIT_CFG1_BIN : std_logic_vector(7 downto 0) := CPLL_INIT_CFG1;
    constant CPLL_LOCK_CFG_BIN : std_logic_vector(15 downto 0) := CPLL_LOCK_CFG;
    constant CPLL_REFCLK_DIV_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(CPLL_REFCLK_DIV,5));
    constant CTLE3_OCAP_EXT_CTRL_BIN : std_logic_vector(2 downto 0) := CTLE3_OCAP_EXT_CTRL;
    constant CTLE3_OCAP_EXT_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(CTLE3_OCAP_EXT_EN));
    constant DDI_CTRL_BIN : std_logic_vector(1 downto 0) := DDI_CTRL;
    constant DDI_REALIGN_WAIT_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(DDI_REALIGN_WAIT,5));
    constant DFE_D_X_REL_POS_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(DFE_D_X_REL_POS));
    constant DFE_VCM_COMP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(DFE_VCM_COMP_EN));
    constant DMONITOR_CFG0_BIN : std_logic_vector(9 downto 0) := DMONITOR_CFG0;
    constant DMONITOR_CFG1_BIN : std_logic_vector(7 downto 0) := DMONITOR_CFG1;
    constant ES_CLK_PHASE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ES_CLK_PHASE_SEL));
    constant ES_CONTROL_BIN : std_logic_vector(5 downto 0) := ES_CONTROL;
    constant ES_HORZ_OFFSET_BIN : std_logic_vector(11 downto 0) := ES_HORZ_OFFSET;
    constant ES_PMA_CFG_BIN : std_logic_vector(9 downto 0) := ES_PMA_CFG;
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
    constant EVODD_PHI_CFG_BIN : std_logic_vector(10 downto 0) := EVODD_PHI_CFG;
    constant EYE_SCAN_SWAP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(EYE_SCAN_SWAP_EN));
    constant FTS_DESKEW_SEQ_ENABLE_BIN : std_logic_vector(3 downto 0) := FTS_DESKEW_SEQ_ENABLE;
    constant FTS_LANE_DESKEW_CFG_BIN : std_logic_vector(3 downto 0) := FTS_LANE_DESKEW_CFG;
    constant GEARBOX_MODE_BIN : std_logic_vector(4 downto 0) := GEARBOX_MODE;
    constant GM_BIAS_SELECT_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(GM_BIAS_SELECT));
    constant GT_INSTANTIATED_BIN : std_logic_vector(0 downto 0) := "1";
    constant ISCAN_CK_PH_SEL2_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(ISCAN_CK_PH_SEL2));
    constant LOCAL_MASTER_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(LOCAL_MASTER));
    constant LOOP0_CFG_BIN : std_logic_vector(15 downto 0) := LOOP0_CFG;
    constant LOOP10_CFG_BIN : std_logic_vector(15 downto 0) := LOOP10_CFG;
    constant LOOP11_CFG_BIN : std_logic_vector(15 downto 0) := LOOP11_CFG;
    constant LOOP12_CFG_BIN : std_logic_vector(15 downto 0) := LOOP12_CFG;
    constant LOOP13_CFG_BIN : std_logic_vector(15 downto 0) := LOOP13_CFG;
    constant LOOP1_CFG_BIN : std_logic_vector(15 downto 0) := LOOP1_CFG;
    constant LOOP2_CFG_BIN : std_logic_vector(15 downto 0) := LOOP2_CFG;
    constant LOOP3_CFG_BIN : std_logic_vector(15 downto 0) := LOOP3_CFG;
    constant LOOP4_CFG_BIN : std_logic_vector(15 downto 0) := LOOP4_CFG;
    constant LOOP5_CFG_BIN : std_logic_vector(15 downto 0) := LOOP5_CFG;
    constant LOOP6_CFG_BIN : std_logic_vector(15 downto 0) := LOOP6_CFG;
    constant LOOP7_CFG_BIN : std_logic_vector(15 downto 0) := LOOP7_CFG;
    constant LOOP8_CFG_BIN : std_logic_vector(15 downto 0) := LOOP8_CFG;
    constant LOOP9_CFG_BIN : std_logic_vector(15 downto 0) := LOOP9_CFG;
    constant LPBK_BIAS_CTRL_BIN : std_logic_vector(2 downto 0) := LPBK_BIAS_CTRL;
    constant LPBK_EN_RCAL_B_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(LPBK_EN_RCAL_B));
    constant LPBK_EXT_RCAL_BIN : std_logic_vector(3 downto 0) := LPBK_EXT_RCAL;
    constant LPBK_RG_CTRL_BIN : std_logic_vector(3 downto 0) := LPBK_RG_CTRL;
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
    constant PCIE_BUFG_DIV_CTRL_BIN : std_logic_vector(15 downto 0) := PCIE_BUFG_DIV_CTRL;
    constant PCIE_RXPCS_CFG_GEN3_BIN : std_logic_vector(15 downto 0) := PCIE_RXPCS_CFG_GEN3;
    constant PCIE_RXPMA_CFG_BIN : std_logic_vector(15 downto 0) := PCIE_RXPMA_CFG;
    constant PCIE_TXPCS_CFG_GEN3_BIN : std_logic_vector(15 downto 0) := PCIE_TXPCS_CFG_GEN3;
    constant PCIE_TXPMA_CFG_BIN : std_logic_vector(15 downto 0) := PCIE_TXPMA_CFG;
    constant PCS_RSVD0_BIN : std_logic_vector(15 downto 0) := PCS_RSVD0;
    constant PCS_RSVD1_BIN : std_logic_vector(2 downto 0) := PCS_RSVD1;
    constant PD_TRANS_TIME_FROM_P2_BIN : std_logic_vector(11 downto 0) := PD_TRANS_TIME_FROM_P2;
    constant PD_TRANS_TIME_NONE_P2_BIN : std_logic_vector(7 downto 0) := PD_TRANS_TIME_NONE_P2;
    constant PD_TRANS_TIME_TO_P2_BIN : std_logic_vector(7 downto 0) := PD_TRANS_TIME_TO_P2;
    constant PLL_SEL_MODE_GEN12_BIN : std_logic_vector(1 downto 0) := PLL_SEL_MODE_GEN12;
    constant PLL_SEL_MODE_GEN3_BIN : std_logic_vector(1 downto 0) := PLL_SEL_MODE_GEN3;
    constant PMA_RSV0_BIN : std_logic_vector(15 downto 0) := PMA_RSV0;
    constant PMA_RSV1_BIN : std_logic_vector(15 downto 0) := PMA_RSV1;
    constant PREIQ_FREQ_BST_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(PREIQ_FREQ_BST,2));
    constant PROCESS_PAR_BIN : std_logic_vector(2 downto 0) := PROCESS_PAR;
    constant RATE_SW_USE_DRP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RATE_SW_USE_DRP));
    constant RESET_POWERSAVE_DISABLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RESET_POWERSAVE_DISABLE));
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
    constant RXCDR_CFG2_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG2_GEN3;
    constant RXCDR_CFG3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG3;
    constant RXCDR_CFG3_GEN3_BIN : std_logic_vector(15 downto 0) := RXCDR_CFG3_GEN3;
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
    constant RXCDR_PH_RESET_ON_EIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXCDR_PH_RESET_ON_EIDLE));
    constant RXCFOKDONE_SRC_BIN : std_logic_vector(1 downto 0) := RXCFOKDONE_SRC;
    constant RXCFOK_CFG0_BIN : std_logic_vector(15 downto 0) := RXCFOK_CFG0;
    constant RXCFOK_CFG1_BIN : std_logic_vector(15 downto 0) := RXCFOK_CFG1;
    constant RXCFOK_CFG2_BIN : std_logic_vector(15 downto 0) := RXCFOK_CFG2;
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
    constant RXDFE_OS_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_OS_CFG0;
    constant RXDFE_OS_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_OS_CFG1;
    constant RXDFE_PWR_SAVING_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXDFE_PWR_SAVING));
    constant RXDFE_UT_CFG0_BIN : std_logic_vector(15 downto 0) := RXDFE_UT_CFG0;
    constant RXDFE_UT_CFG1_BIN : std_logic_vector(15 downto 0) := RXDFE_UT_CFG1;
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
    constant RXPI_AUTO_BW_SEL_BYPASS_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXPI_AUTO_BW_SEL_BYPASS));
    constant RXPI_CFG_BIN : std_logic_vector(15 downto 0) := RXPI_CFG;
    constant RXPI_LPM_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXPI_LPM));
    constant RXPI_RSV0_BIN : std_logic_vector(15 downto 0) := RXPI_RSV0;
    constant RXPI_SEL_LC_BIN : std_logic_vector(1 downto 0) := RXPI_SEL_LC;
    constant RXPI_STARTCODE_BIN : std_logic_vector(1 downto 0) := RXPI_STARTCODE;
    constant RXPI_VREFSEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXPI_VREFSEL));
    constant RXPMARESET_TIME_BIN : std_logic_vector(4 downto 0) := RXPMARESET_TIME;
    constant RXPRBS_ERR_LOOPBACK_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RXPRBS_ERR_LOOPBACK));
    constant RXPRBS_LINKACQ_CNT_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(RXPRBS_LINKACQ_CNT,8));
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
    constant RX_CTLE1_KHKL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CTLE1_KHKL));
    constant RX_CTLE2_KHKL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CTLE2_KHKL));
    constant RX_CTLE3_AGC_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_CTLE3_AGC));
    constant RX_DATA_WIDTH_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(RX_DATA_WIDTH,8));
    constant RX_DDI_SEL_BIN : std_logic_vector(5 downto 0) := RX_DDI_SEL;
    constant RX_DEGEN_CTRL_BIN : std_logic_vector(2 downto 0) := RX_DEGEN_CTRL;
    constant RX_DFELPM_CFG0_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RX_DFELPM_CFG0,3));
    constant RX_DFELPM_CFG1_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DFELPM_CFG1));
    constant RX_DFELPM_KLKH_AGC_STUP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DFELPM_KLKH_AGC_STUP_EN));
    constant RX_DFE_AGC_CFG0_BIN : std_logic_vector(1 downto 0) := RX_DFE_AGC_CFG0;
    constant RX_DFE_AGC_CFG1_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RX_DFE_AGC_CFG1,3));
    constant RX_DFE_KL_LPM_KH_CFG0_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(RX_DFE_KL_LPM_KH_CFG0,2));
    constant RX_DFE_KL_LPM_KH_CFG1_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(RX_DFE_KL_LPM_KH_CFG1,3));
    constant RX_DFE_KL_LPM_KL_CFG0_BIN : std_logic_vector(1 downto 0) := RX_DFE_KL_LPM_KL_CFG0;
    constant RX_DFE_KL_LPM_KL_CFG1_BIN : std_logic_vector(2 downto 0) := RX_DFE_KL_LPM_KL_CFG1;
    constant RX_DFE_LPM_HOLD_DURING_EIDLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DFE_LPM_HOLD_DURING_EIDLE));
    constant RX_DIV2_MODE_B_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_DIV2_MODE_B));
    constant RX_DIVRESET_TIME_BIN : std_logic_vector(4 downto 0) := RX_DIVRESET_TIME;
    constant RX_EN_CTLE_RCAL_B_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EN_CTLE_RCAL_B));
    constant RX_EN_HI_LR_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EN_HI_LR));
    constant RX_EXT_RL_CTRL_BIN : std_logic_vector(8 downto 0) := RX_EXT_RL_CTRL;
    constant RX_EYESCAN_VS_CODE_BIN : std_logic_vector(6 downto 0) := RX_EYESCAN_VS_CODE;
    constant RX_EYESCAN_VS_NEG_DIR_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EYESCAN_VS_NEG_DIR));
    constant RX_EYESCAN_VS_RANGE_BIN : std_logic_vector(1 downto 0) := RX_EYESCAN_VS_RANGE;
    constant RX_EYESCAN_VS_UT_SIGN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_EYESCAN_VS_UT_SIGN));
    constant RX_FABINT_USRCLK_FLOP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_FABINT_USRCLK_FLOP));
    constant RX_INT_DATAWIDTH_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(RX_INT_DATAWIDTH,2));
    constant RX_PMA_POWER_SAVE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_PMA_POWER_SAVE));
    constant RX_PROGDIV_CFG_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(RX_PROGDIV_CFG * 1000.0),64));
    constant RX_PROGDIV_RATE_BIN : std_logic_vector(15 downto 0) := RX_PROGDIV_RATE;
    constant RX_RESLOAD_CTRL_BIN : std_logic_vector(3 downto 0) := RX_RESLOAD_CTRL;
    constant RX_RESLOAD_OVRD_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_RESLOAD_OVRD));
    constant RX_SAMPLE_PERIOD_BIN : std_logic_vector(2 downto 0) := RX_SAMPLE_PERIOD;
    constant RX_SIG_VALID_DLY_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(RX_SIG_VALID_DLY,6));
    constant RX_SUM_DFETAPREP_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_SUM_DFETAPREP_EN));
    constant RX_SUM_IREF_TUNE_BIN : std_logic_vector(3 downto 0) := RX_SUM_IREF_TUNE;
    constant RX_SUM_VCMTUNE_BIN : std_logic_vector(3 downto 0) := RX_SUM_VCMTUNE;
    constant RX_SUM_VCM_OVWR_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_SUM_VCM_OVWR));
    constant RX_SUM_VREF_TUNE_BIN : std_logic_vector(2 downto 0) := RX_SUM_VREF_TUNE;
    constant RX_TUNE_AFE_OS_BIN : std_logic_vector(1 downto 0) := RX_TUNE_AFE_OS;
    constant RX_VREG_CTRL_BIN : std_logic_vector(2 downto 0) := RX_VREG_CTRL;
    constant RX_VREG_PDB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_VREG_PDB));
    constant RX_WIDEMODE_CDR_BIN : std_logic_vector(1 downto 0) := RX_WIDEMODE_CDR;
    constant RX_XMODE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RX_XMODE_SEL));
    constant SAS_MAX_COM_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(SAS_MAX_COM,7));
    constant SAS_MIN_COM_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SAS_MIN_COM,6));
    constant SATA_BURST_SEQ_LEN_BIN : std_logic_vector(3 downto 0) := SATA_BURST_SEQ_LEN;
    constant SATA_BURST_VAL_BIN : std_logic_vector(2 downto 0) := SATA_BURST_VAL;
    constant SATA_EIDLE_VAL_BIN : std_logic_vector(2 downto 0) := SATA_EIDLE_VAL;
    constant SATA_MAX_BURST_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SATA_MAX_BURST,6));
    constant SATA_MAX_INIT_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SATA_MAX_INIT,6));
    constant SATA_MAX_WAKE_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SATA_MAX_WAKE,6));
    constant SATA_MIN_BURST_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SATA_MIN_BURST,6));
    constant SATA_MIN_INIT_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SATA_MIN_INIT,6));
    constant SATA_MIN_WAKE_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(SATA_MIN_WAKE,6));
    constant SIM_TX_EIDLE_DRIVE_LEVEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SIM_TX_EIDLE_DRIVE_LEVEL));
    constant SIM_VERSION_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(SIM_VERSION,2));
    constant TAPDLY_SET_TX_BIN : std_logic_vector(1 downto 0) := TAPDLY_SET_TX;
    constant TEMPERATURE_PAR_BIN : std_logic_vector(3 downto 0) := TEMPERATURE_PAR;
    constant TERM_RCAL_CFG_BIN : std_logic_vector(14 downto 0) := TERM_RCAL_CFG;
    constant TERM_RCAL_OVRD_BIN : std_logic_vector(2 downto 0) := TERM_RCAL_OVRD;
    constant TRANS_TIME_RATE_BIN : std_logic_vector(7 downto 0) := TRANS_TIME_RATE;
    constant TST_RSV0_BIN : std_logic_vector(7 downto 0) := TST_RSV0;
    constant TST_RSV1_BIN : std_logic_vector(7 downto 0) := TST_RSV1;
    constant TXDLY_CFG_BIN : std_logic_vector(15 downto 0) := TXDLY_CFG;
    constant TXDLY_LCFG_BIN : std_logic_vector(15 downto 0) := TXDLY_LCFG;
    constant TXGBOX_FIFO_INIT_RD_ADDR_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(TXGBOX_FIFO_INIT_RD_ADDR,3));
    constant TXOUTCLKPCS_SEL_BIN : std_logic_vector(0 downto 0) := "0";
    constant TXOUT_DIV_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(TXOUT_DIV,6));
    constant TXPCSRESET_TIME_BIN : std_logic_vector(4 downto 0) := TXPCSRESET_TIME;
    constant TXPHDLY_CFG0_BIN : std_logic_vector(15 downto 0) := TXPHDLY_CFG0;
    constant TXPHDLY_CFG1_BIN : std_logic_vector(15 downto 0) := TXPHDLY_CFG1;
    constant TXPH_CFG2_BIN : std_logic_vector(15 downto 0) := TXPH_CFG2;
    constant TXPH_CFG_BIN : std_logic_vector(15 downto 0) := TXPH_CFG;
    constant TXPH_MONITOR_SEL_BIN : std_logic_vector(4 downto 0) := TXPH_MONITOR_SEL;
    constant TXPI_CFG0_BIN : std_logic_vector(1 downto 0) := TXPI_CFG0;
    constant TXPI_CFG1_BIN : std_logic_vector(1 downto 0) := TXPI_CFG1;
    constant TXPI_CFG2_BIN : std_logic_vector(1 downto 0) := TXPI_CFG2;
    constant TXPI_CFG3_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_CFG3));
    constant TXPI_CFG4_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_CFG4));
    constant TXPI_CFG5_BIN : std_logic_vector(2 downto 0) := TXPI_CFG5;
    constant TXPI_GRAY_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_GRAY_SEL));
    constant TXPI_INVSTROBE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_INVSTROBE_SEL));
    constant TXPI_LPM_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_LPM));
    constant TXPI_PPM_CFG_BIN : std_logic_vector(7 downto 0) := TXPI_PPM_CFG;
    constant TXPI_RSV0_BIN : std_logic_vector(15 downto 0) := TXPI_RSV0;
    constant TXPI_SYNFREQ_PPM_BIN : std_logic_vector(2 downto 0) := TXPI_SYNFREQ_PPM;
    constant TXPI_VREFSEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXPI_VREFSEL));
    constant TXPMARESET_TIME_BIN : std_logic_vector(4 downto 0) := TXPMARESET_TIME;
    constant TXSYNC_MULTILANE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXSYNC_MULTILANE));
    constant TXSYNC_OVRD_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXSYNC_OVRD));
    constant TXSYNC_SKIP_DA_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TXSYNC_SKIP_DA));
    constant TX_CLK25_DIV_BIN : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(TX_CLK25_DIV,6));
    constant TX_CLKMUX_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_CLKMUX_EN));
    constant TX_CLKREG_PDB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_CLKREG_PDB));
    constant TX_CLKREG_SET_BIN : std_logic_vector(2 downto 0) := TX_CLKREG_SET;
    constant TX_DATA_WIDTH_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(TX_DATA_WIDTH,8));
    constant TX_DCD_CFG_BIN : std_logic_vector(5 downto 0) := TX_DCD_CFG;
    constant TX_DCD_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_DCD_EN));
    constant TX_DEEMPH0_BIN : std_logic_vector(5 downto 0) := TX_DEEMPH0;
    constant TX_DEEMPH1_BIN : std_logic_vector(5 downto 0) := TX_DEEMPH1;
    constant TX_DIVRESET_TIME_BIN : std_logic_vector(4 downto 0) := TX_DIVRESET_TIME;
    constant TX_DRVMUX_CTRL_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TX_DRVMUX_CTRL,2));
    constant TX_EIDLE_ASSERT_DELAY_BIN : std_logic_vector(2 downto 0) := TX_EIDLE_ASSERT_DELAY;
    constant TX_EIDLE_DEASSERT_DELAY_BIN : std_logic_vector(2 downto 0) := TX_EIDLE_DEASSERT_DELAY;
    constant TX_EML_PHI_TUNE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_EML_PHI_TUNE));
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
    constant TX_MODE_SEL_BIN : std_logic_vector(2 downto 0) := TX_MODE_SEL;
    constant TX_PHICAL_CFG0_BIN : std_logic_vector(15 downto 0) := TX_PHICAL_CFG0;
    constant TX_PHICAL_CFG1_BIN : std_logic_vector(15 downto 0) := TX_PHICAL_CFG1;
    constant TX_PHICAL_CFG2_BIN : std_logic_vector(15 downto 0) := TX_PHICAL_CFG2;
    constant TX_PI_BIASSET_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TX_PI_BIASSET,2));
    constant TX_PI_CFG0_BIN : std_logic_vector(15 downto 0) := TX_PI_CFG0;
    constant TX_PI_CFG1_BIN : std_logic_vector(15 downto 0) := TX_PI_CFG1;
    constant TX_PI_DIV2_MODE_B_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PI_DIV2_MODE_B));
    constant TX_PI_SEL_QPLL0_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PI_SEL_QPLL0));
    constant TX_PI_SEL_QPLL1_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PI_SEL_QPLL1));
    constant TX_PMADATA_OPT_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PMADATA_OPT));
    constant TX_PMA_POWER_SAVE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_PMA_POWER_SAVE));
    constant TX_PREDRV_CTRL_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(TX_PREDRV_CTRL,2));
    constant TX_PROGDIV_CFG_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(TX_PROGDIV_CFG * 1000.0),64));
    constant TX_PROGDIV_RATE_BIN : std_logic_vector(15 downto 0) := TX_PROGDIV_RATE;
    constant TX_RXDETECT_CFG_BIN : std_logic_vector(13 downto 0) := TX_RXDETECT_CFG;
    constant TX_RXDETECT_REF_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(TX_RXDETECT_REF,3));
    constant TX_SAMPLE_PERIOD_BIN : std_logic_vector(2 downto 0) := TX_SAMPLE_PERIOD;
    constant TX_SARC_LPBK_ENB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(TX_SARC_LPBK_ENB));
    constant TX_USERPATTERN_DATA0_BIN : std_logic_vector(9 downto 0) := "0101111100";
    constant TX_USERPATTERN_DATA1_BIN : std_logic_vector(9 downto 0) := "0101010101";
    constant TX_USERPATTERN_DATA2_BIN : std_logic_vector(9 downto 0) := "1010000011";
    constant TX_USERPATTERN_DATA3_BIN : std_logic_vector(9 downto 0) := "1010101010";
    constant TX_USERPATTERN_DATA4_BIN : std_logic_vector(9 downto 0) := "0101111100";
    constant TX_USERPATTERN_DATA5_BIN : std_logic_vector(9 downto 0) := "0101010101";
    constant TX_USERPATTERN_DATA6_BIN : std_logic_vector(9 downto 0) := "1010000011";
    constant TX_USERPATTERN_DATA7_BIN : std_logic_vector(9 downto 0) := "1010101010";
    constant USE_PCS_CLK_PHASE_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(USE_PCS_CLK_PHASE_SEL));

  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed

    signal BUFGTCEMASK_out : std_logic_vector(2 downto 0);
    signal BUFGTCE_out : std_logic_vector(2 downto 0);
    signal BUFGTDIV_out : std_logic_vector(8 downto 0);
    signal BUFGTRESET_out : std_logic_vector(2 downto 0);
    signal BUFGTRSTMASK_out : std_logic_vector(2 downto 0);
    signal CPLLFBCLKLOST_out : std_ulogic;
    signal CPLLLOCK_out : std_ulogic;
    signal CPLLREFCLKLOST_out : std_ulogic;
    signal DMONITOROUT_out : std_logic_vector(16 downto 0);
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
    signal PINRSRVDAS_out : std_logic_vector(7 downto 0);
    signal PMASCANOUT_out : std_logic_vector(11 downto 0);
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
    signal RXMONITOROUT_out : std_logic_vector(6 downto 0);
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
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CDRSTEPDIR_in : std_ulogic;
    signal CDRSTEPSQ_in : std_ulogic;
    signal CDRSTEPSX_in : std_ulogic;
    signal CFGRESET_in : std_ulogic;
    signal CLKRSVD0_in : std_ulogic;
    signal CLKRSVD1_in : std_ulogic;
    signal CPLLLOCKDETCLK_in : std_ulogic;
    signal CPLLLOCKEN_in : std_ulogic;
    signal CPLLPD_in : std_ulogic;
    signal CPLLREFCLKSEL_in : std_logic_vector(2 downto 0);
    signal CPLLRESET_in : std_ulogic;
    signal DMONFIFORESET_in : std_ulogic;
    signal DMONITORCLK_in : std_ulogic;
    signal DRPADDR_in : std_logic_vector(9 downto 0);
    signal DRPCLK_in : std_ulogic;
    signal DRPDI_in : std_logic_vector(15 downto 0);
    signal DRPEN_in : std_ulogic;
    signal DRPWE_in : std_ulogic;
    signal ELPCALDVORWREN_in : std_ulogic;
    signal ELPCALPAORWREN_in : std_ulogic;
    signal EVODDPHICALDONE_in : std_ulogic;
    signal EVODDPHICALSTART_in : std_ulogic;
    signal EVODDPHIDRDEN_in : std_ulogic;
    signal EVODDPHIDWREN_in : std_ulogic;
    signal EVODDPHIXRDEN_in : std_ulogic;
    signal EVODDPHIXWREN_in : std_ulogic;
    signal EYESCANMODE_in : std_ulogic;
    signal EYESCANRESET_in : std_ulogic;
    signal EYESCANTRIGGER_in : std_ulogic;
    signal GTGREFCLK_in : std_ulogic;
    signal GTNORTHREFCLK0_in : std_ulogic;
    signal GTNORTHREFCLK1_in : std_ulogic;
    signal GTREFCLK0_in : std_ulogic;
    signal GTREFCLK1_in : std_ulogic;
    signal GTRESETSEL_in : std_ulogic;
    signal GTRSVD_in : std_logic_vector(15 downto 0);
    signal GTRXRESET_in : std_ulogic;
    signal GTSOUTHREFCLK0_in : std_ulogic;
    signal GTSOUTHREFCLK1_in : std_ulogic;
    signal GTTXRESET_in : std_ulogic;
    signal GTYRXN_in : std_ulogic;
    signal GTYRXP_in : std_ulogic;
    signal LOOPBACK_in : std_logic_vector(2 downto 0);
    signal LOOPRSVD_in : std_logic_vector(15 downto 0);
    signal LPBKRXTXSEREN_in : std_ulogic;
    signal LPBKTXRXSEREN_in : std_ulogic;
    signal PCIEEQRXEQADAPTDONE_in : std_ulogic;
    signal PCIERSTIDLE_in : std_ulogic;
    signal PCIERSTTXSYNCSTART_in : std_ulogic;
    signal PCIEUSERRATEDONE_in : std_ulogic;
    signal PCSRSVDIN2_in : std_logic_vector(4 downto 0);
    signal PCSRSVDIN_in : std_logic_vector(15 downto 0);
    signal PMARSVDIN_in : std_logic_vector(4 downto 0);
    signal PMASCANCLK0_in : std_ulogic;
    signal PMASCANCLK1_in : std_ulogic;
    signal PMASCANCLK2_in : std_ulogic;
    signal PMASCANCLK3_in : std_ulogic;
    signal PMASCANCLK4_in : std_ulogic;
    signal PMASCANCLK5_in : std_ulogic;
    signal PMASCANENB_in : std_ulogic;
    signal PMASCANIN_in : std_logic_vector(11 downto 0);
    signal PMASCANMODEB_in : std_ulogic;
    signal PMASCANRSTEN_in : std_ulogic;
    signal QPLL0CLK_in : std_ulogic;
    signal QPLL0REFCLK_in : std_ulogic;
    signal QPLL1CLK_in : std_ulogic;
    signal QPLL1REFCLK_in : std_ulogic;
    signal RESETOVRD_in : std_ulogic;
    signal RSTCLKENTX_in : std_ulogic;
    signal RX8B10BEN_in : std_ulogic;
    signal RXBUFRESET_in : std_ulogic;
    signal RXCDRFREQRESET_in : std_ulogic;
    signal RXCDRHOLD_in : std_ulogic;
    signal RXCDROVRDEN_in : std_ulogic;
    signal RXCDRRESETRSV_in : std_ulogic;
    signal RXCDRRESET_in : std_ulogic;
    signal RXCHBONDEN_in : std_ulogic;
    signal RXCHBONDI_in : std_logic_vector(4 downto 0);
    signal RXCHBONDLEVEL_in : std_logic_vector(2 downto 0);
    signal RXCHBONDMASTER_in : std_ulogic;
    signal RXCHBONDSLAVE_in : std_ulogic;
    signal RXCKCALRESET_in : std_ulogic;
    signal RXCOMMADETEN_in : std_ulogic;
    signal RXDCCFORCESTART_in : std_ulogic;
    signal RXDFEAGCHOLD_in : std_ulogic;
    signal RXDFEAGCOVRDEN_in : std_ulogic;
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
    signal RXDFEVSEN_in : std_ulogic;
    signal RXDFEXYDEN_in : std_ulogic;
    signal RXDLYBYPASS_in : std_ulogic;
    signal RXDLYEN_in : std_ulogic;
    signal RXDLYOVRDEN_in : std_ulogic;
    signal RXDLYSRESET_in : std_ulogic;
    signal RXELECIDLEMODE_in : std_logic_vector(1 downto 0);
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
    signal RXOSINTCFG_in : std_logic_vector(3 downto 0);
    signal RXOSINTEN_in : std_ulogic;
    signal RXOSINTHOLD_in : std_ulogic;
    signal RXOSINTOVRDEN_in : std_ulogic;
    signal RXOSINTSTROBE_in : std_ulogic;
    signal RXOSINTTESTOVRDEN_in : std_ulogic;
    signal RXOSOVRDEN_in : std_ulogic;
    signal RXOUTCLKSEL_in : std_logic_vector(2 downto 0);
    signal RXPCOMMAALIGNEN_in : std_ulogic;
    signal RXPCSRESET_in : std_ulogic;
    signal RXPD_in : std_logic_vector(1 downto 0);
    signal RXPHALIGNEN_in : std_ulogic;
    signal RXPHALIGN_in : std_ulogic;
    signal RXPHDLYPD_in : std_ulogic;
    signal RXPHDLYRESET_in : std_ulogic;
    signal RXPHOVRDEN_in : std_ulogic;
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
    signal RXUSERRDY_in : std_ulogic;
    signal RXUSRCLK2_in : std_ulogic;
    signal RXUSRCLK_in : std_ulogic;
    signal SARCCLK_in : std_ulogic;
    signal SCANCLK_in : std_ulogic;
    signal SCANENB_in : std_ulogic;
    signal SCANIN_in : std_logic_vector(18 downto 0);
    signal SCANMODEB_in : std_ulogic;
    signal SIGVALIDCLK_in : std_ulogic;
    signal TSTCLK0_in : std_ulogic;
    signal TSTCLK1_in : std_ulogic;
    signal TSTIN_in : std_logic_vector(19 downto 0);
    signal TSTPDOVRDB_in : std_ulogic;
    signal TSTPD_in : std_logic_vector(4 downto 0);
    signal TX8B10BBYPASS_in : std_logic_vector(7 downto 0);
    signal TX8B10BEN_in : std_ulogic;
    signal TXBUFDIFFCTRL_in : std_logic_vector(2 downto 0);
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
    signal TXDEEMPH_in : std_ulogic;
    signal TXDETECTRX_in : std_ulogic;
    signal TXDIFFCTRL_in : std_logic_vector(4 downto 0);
    signal TXDIFFPD_in : std_ulogic;
    signal TXDLYBYPASS_in : std_ulogic;
    signal TXDLYEN_in : std_ulogic;
    signal TXDLYHOLD_in : std_ulogic;
    signal TXDLYOVRDEN_in : std_ulogic;
    signal TXDLYSRESET_in : std_ulogic;
    signal TXDLYUPDOWN_in : std_ulogic;
    signal TXELECIDLE_in : std_ulogic;
    signal TXELFORCESTART_in : std_ulogic;
    signal TXHEADER_in : std_logic_vector(5 downto 0);
    signal TXINHIBIT_in : std_ulogic;
    signal TXLATCLK_in : std_ulogic;
    signal TXMAINCURSOR_in : std_logic_vector(6 downto 0);
    signal TXMARGIN_in : std_logic_vector(2 downto 0);
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
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    BUFGTCE <= BUFGTCE_out after OUT_DELAY;
    BUFGTCEMASK <= BUFGTCEMASK_out after OUT_DELAY;
    BUFGTDIV <= BUFGTDIV_out after OUT_DELAY;
    BUFGTRESET <= BUFGTRESET_out after OUT_DELAY;
    BUFGTRSTMASK <= BUFGTRSTMASK_out after OUT_DELAY;
    CPLLFBCLKLOST <= CPLLFBCLKLOST_out after OUT_DELAY;
    CPLLLOCK <= CPLLLOCK_out after OUT_DELAY;
    CPLLREFCLKLOST <= CPLLREFCLKLOST_out after OUT_DELAY;
    DMONITOROUT <= DMONITOROUT_out after OUT_DELAY;
    DRPDO <= DRPDO_out after OUT_DELAY;
    DRPRDY <= DRPRDY_out after OUT_DELAY;
    EYESCANDATAERROR <= EYESCANDATAERROR_out after OUT_DELAY;
    GTPOWERGOOD <= GTPOWERGOOD_out after OUT_DELAY;
    GTREFCLKMONITOR <= GTREFCLKMONITOR_out after OUT_DELAY;
    GTYTXN <= GTYTXN_out after OUT_DELAY;
    GTYTXP <= GTYTXP_out after OUT_DELAY;
    PCIERATEGEN3 <= PCIERATEGEN3_out after OUT_DELAY;
    PCIERATEIDLE <= PCIERATEIDLE_out after OUT_DELAY;
    PCIERATEQPLLPD <= PCIERATEQPLLPD_out after OUT_DELAY;
    PCIERATEQPLLRESET <= PCIERATEQPLLRESET_out after OUT_DELAY;
    PCIESYNCTXSYNCDONE <= PCIESYNCTXSYNCDONE_out after OUT_DELAY;
    PCIEUSERGEN3RDY <= PCIEUSERGEN3RDY_out after OUT_DELAY;
    PCIEUSERPHYSTATUSRST <= PCIEUSERPHYSTATUSRST_out after OUT_DELAY;
    PCIEUSERRATESTART <= PCIEUSERRATESTART_out after OUT_DELAY;
    PCSRSVDOUT <= PCSRSVDOUT_out after OUT_DELAY;
    PHYSTATUS <= PHYSTATUS_out after OUT_DELAY;
    PINRSRVDAS <= PINRSRVDAS_out after OUT_DELAY;
    RESETEXCEPTION <= RESETEXCEPTION_out after OUT_DELAY;
    RXBUFSTATUS <= RXBUFSTATUS_out after OUT_DELAY;
    RXBYTEISALIGNED <= RXBYTEISALIGNED_out after OUT_DELAY;
    RXBYTEREALIGN <= RXBYTEREALIGN_out after OUT_DELAY;
    RXCDRLOCK <= RXCDRLOCK_out after OUT_DELAY;
    RXCDRPHDONE <= RXCDRPHDONE_out after OUT_DELAY;
    RXCHANBONDSEQ <= RXCHANBONDSEQ_out after OUT_DELAY;
    RXCHANISALIGNED <= RXCHANISALIGNED_out after OUT_DELAY;
    RXCHANREALIGN <= RXCHANREALIGN_out after OUT_DELAY;
    RXCHBONDO <= RXCHBONDO_out after OUT_DELAY;
    RXCKCALDONE <= RXCKCALDONE_out after OUT_DELAY;
    RXCLKCORCNT <= RXCLKCORCNT_out after OUT_DELAY;
    RXCOMINITDET <= RXCOMINITDET_out after OUT_DELAY;
    RXCOMMADET <= RXCOMMADET_out after OUT_DELAY;
    RXCOMSASDET <= RXCOMSASDET_out after OUT_DELAY;
    RXCOMWAKEDET <= RXCOMWAKEDET_out after OUT_DELAY;
    RXCTRL0 <= RXCTRL0_out after OUT_DELAY;
    RXCTRL1 <= RXCTRL1_out after OUT_DELAY;
    RXCTRL2 <= RXCTRL2_out after OUT_DELAY;
    RXCTRL3 <= RXCTRL3_out after OUT_DELAY;
    RXDATA <= RXDATA_out after OUT_DELAY;
    RXDATAEXTENDRSVD <= RXDATAEXTENDRSVD_out after OUT_DELAY;
    RXDATAVALID <= RXDATAVALID_out after OUT_DELAY;
    RXDLYSRESETDONE <= RXDLYSRESETDONE_out after OUT_DELAY;
    RXELECIDLE <= RXELECIDLE_out after OUT_DELAY;
    RXHEADER <= RXHEADER_out after OUT_DELAY;
    RXHEADERVALID <= RXHEADERVALID_out after OUT_DELAY;
    RXMONITOROUT <= RXMONITOROUT_out after OUT_DELAY;
    RXOSINTDONE <= RXOSINTDONE_out after OUT_DELAY;
    RXOSINTSTARTED <= RXOSINTSTARTED_out after OUT_DELAY;
    RXOSINTSTROBEDONE <= RXOSINTSTROBEDONE_out after OUT_DELAY;
    RXOSINTSTROBESTARTED <= RXOSINTSTROBESTARTED_out after OUT_DELAY;
    RXOUTCLK <= RXOUTCLK_out after OUT_DELAY;
    RXOUTCLKFABRIC <= RXOUTCLKFABRIC_out after OUT_DELAY;
    RXOUTCLKPCS <= RXOUTCLKPCS_out after OUT_DELAY;
    RXPHALIGNDONE <= RXPHALIGNDONE_out after OUT_DELAY;
    RXPHALIGNERR <= RXPHALIGNERR_out after OUT_DELAY;
    RXPMARESETDONE <= RXPMARESETDONE_out after OUT_DELAY;
    RXPRBSERR <= RXPRBSERR_out after OUT_DELAY;
    RXPRBSLOCKED <= RXPRBSLOCKED_out after OUT_DELAY;
    RXPRGDIVRESETDONE <= RXPRGDIVRESETDONE_out after OUT_DELAY;
    RXRATEDONE <= RXRATEDONE_out after OUT_DELAY;
    RXRECCLKOUT <= RXRECCLKOUT_out after OUT_DELAY;
    RXRESETDONE <= RXRESETDONE_out after OUT_DELAY;
    RXSLIDERDY <= RXSLIDERDY_out after OUT_DELAY;
    RXSLIPDONE <= RXSLIPDONE_out after OUT_DELAY;
    RXSLIPOUTCLKRDY <= RXSLIPOUTCLKRDY_out after OUT_DELAY;
    RXSLIPPMARDY <= RXSLIPPMARDY_out after OUT_DELAY;
    RXSTARTOFSEQ <= RXSTARTOFSEQ_out after OUT_DELAY;
    RXSTATUS <= RXSTATUS_out after OUT_DELAY;
    RXSYNCDONE <= RXSYNCDONE_out after OUT_DELAY;
    RXSYNCOUT <= RXSYNCOUT_out after OUT_DELAY;
    RXVALID <= RXVALID_out after OUT_DELAY;
    TXBUFSTATUS <= TXBUFSTATUS_out after OUT_DELAY;
    TXCOMFINISH <= TXCOMFINISH_out after OUT_DELAY;
    TXDCCDONE <= TXDCCDONE_out after OUT_DELAY;
    TXDLYSRESETDONE <= TXDLYSRESETDONE_out after OUT_DELAY;
    TXOUTCLK <= TXOUTCLK_out after OUT_DELAY;
    TXOUTCLKFABRIC <= TXOUTCLKFABRIC_out after OUT_DELAY;
    TXOUTCLKPCS <= TXOUTCLKPCS_out after OUT_DELAY;
    TXPHALIGNDONE <= TXPHALIGNDONE_out after OUT_DELAY;
    TXPHINITDONE <= TXPHINITDONE_out after OUT_DELAY;
    TXPMARESETDONE <= TXPMARESETDONE_out after OUT_DELAY;
    TXPRGDIVRESETDONE <= TXPRGDIVRESETDONE_out after OUT_DELAY;
    TXRATEDONE <= TXRATEDONE_out after OUT_DELAY;
    TXRESETDONE <= TXRESETDONE_out after OUT_DELAY;
    TXSYNCDONE <= TXSYNCDONE_out after OUT_DELAY;
    TXSYNCOUT <= TXSYNCOUT_out after OUT_DELAY;
    
    CDRSTEPDIR_in <= '0' when (CDRSTEPDIR = 'Z') else CDRSTEPDIR; -- rv 0
    CDRSTEPSQ_in <= '0' when (CDRSTEPSQ = 'Z') else CDRSTEPSQ; -- rv 0
    CDRSTEPSX_in <= '0' when (CDRSTEPSX = 'Z') else CDRSTEPSX; -- rv 0
    CFGRESET_in <= '0' when (CFGRESET = 'Z') else CFGRESET; -- rv 0
    CLKRSVD0_in <= '0' when (CLKRSVD0 = 'Z') else CLKRSVD0; -- rv 0
    CLKRSVD1_in <= '0' when (CLKRSVD1 = 'Z') else CLKRSVD1; -- rv 0
    CPLLLOCKDETCLK_in <= '0' when (CPLLLOCKDETCLK = 'Z') else CPLLLOCKDETCLK; -- rv 0
    CPLLLOCKEN_in <= '0' when (CPLLLOCKEN = 'Z') else CPLLLOCKEN; -- rv 0
    CPLLPD_in <= '0' when (CPLLPD = 'Z') else CPLLPD; -- rv 0
    CPLLREFCLKSEL_in(0) <= '1' when (CPLLREFCLKSEL(0) = 'Z') else CPLLREFCLKSEL(0); -- rv 1
    CPLLREFCLKSEL_in(1) <= '0' when (CPLLREFCLKSEL(1) = 'Z') else CPLLREFCLKSEL(1); -- rv 0
    CPLLREFCLKSEL_in(2) <= '0' when (CPLLREFCLKSEL(2) = 'Z') else CPLLREFCLKSEL(2); -- rv 0
    CPLLRESET_in <= '0' when (CPLLRESET = 'Z') else CPLLRESET; -- rv 0
    DMONFIFORESET_in <= '0' when (DMONFIFORESET = 'Z') else DMONFIFORESET; -- rv 0
    DMONITORCLK_in <= '0' when (DMONITORCLK = 'Z') else DMONITORCLK; -- rv 0
    DRPADDR_in(0) <= '0' when (DRPADDR(0) = 'Z') else DRPADDR(0); -- rv 0
    DRPADDR_in(1) <= '0' when (DRPADDR(1) = 'Z') else DRPADDR(1); -- rv 0
    DRPADDR_in(2) <= '0' when (DRPADDR(2) = 'Z') else DRPADDR(2); -- rv 0
    DRPADDR_in(3) <= '0' when (DRPADDR(3) = 'Z') else DRPADDR(3); -- rv 0
    DRPADDR_in(4) <= '0' when (DRPADDR(4) = 'Z') else DRPADDR(4); -- rv 0
    DRPADDR_in(5) <= '0' when (DRPADDR(5) = 'Z') else DRPADDR(5); -- rv 0
    DRPADDR_in(6) <= '0' when (DRPADDR(6) = 'Z') else DRPADDR(6); -- rv 0
    DRPADDR_in(7) <= '0' when (DRPADDR(7) = 'Z') else DRPADDR(7); -- rv 0
    DRPADDR_in(8) <= '0' when (DRPADDR(8) = 'Z') else DRPADDR(8); -- rv 0
    DRPADDR_in(9) <= '0' when (DRPADDR(9) = 'Z') else DRPADDR(9); -- rv 0
    DRPCLK_in <= '0' when (DRPCLK = 'Z') else DRPCLK; -- rv 0
    DRPDI_in(0) <= '0' when (DRPDI(0) = 'Z') else DRPDI(0); -- rv 0
    DRPDI_in(1) <= '0' when (DRPDI(1) = 'Z') else DRPDI(1); -- rv 0
    DRPDI_in(10) <= '0' when (DRPDI(10) = 'Z') else DRPDI(10); -- rv 0
    DRPDI_in(11) <= '0' when (DRPDI(11) = 'Z') else DRPDI(11); -- rv 0
    DRPDI_in(12) <= '0' when (DRPDI(12) = 'Z') else DRPDI(12); -- rv 0
    DRPDI_in(13) <= '0' when (DRPDI(13) = 'Z') else DRPDI(13); -- rv 0
    DRPDI_in(14) <= '0' when (DRPDI(14) = 'Z') else DRPDI(14); -- rv 0
    DRPDI_in(15) <= '0' when (DRPDI(15) = 'Z') else DRPDI(15); -- rv 0
    DRPDI_in(2) <= '0' when (DRPDI(2) = 'Z') else DRPDI(2); -- rv 0
    DRPDI_in(3) <= '0' when (DRPDI(3) = 'Z') else DRPDI(3); -- rv 0
    DRPDI_in(4) <= '0' when (DRPDI(4) = 'Z') else DRPDI(4); -- rv 0
    DRPDI_in(5) <= '0' when (DRPDI(5) = 'Z') else DRPDI(5); -- rv 0
    DRPDI_in(6) <= '0' when (DRPDI(6) = 'Z') else DRPDI(6); -- rv 0
    DRPDI_in(7) <= '0' when (DRPDI(7) = 'Z') else DRPDI(7); -- rv 0
    DRPDI_in(8) <= '0' when (DRPDI(8) = 'Z') else DRPDI(8); -- rv 0
    DRPDI_in(9) <= '0' when (DRPDI(9) = 'Z') else DRPDI(9); -- rv 0
    DRPEN_in <= '0' when (DRPEN = 'Z') else DRPEN; -- rv 0
    DRPWE_in <= '0' when (DRPWE = 'Z') else DRPWE; -- rv 0
    ELPCALDVORWREN_in <= '0' when (ELPCALDVORWREN = 'Z') else ELPCALDVORWREN; -- rv 0
    ELPCALPAORWREN_in <= '0' when (ELPCALPAORWREN = 'Z') else ELPCALPAORWREN; -- rv 0
    EVODDPHICALDONE_in <= '0' when (EVODDPHICALDONE = 'Z') else EVODDPHICALDONE; -- rv 0
    EVODDPHICALSTART_in <= '0' when (EVODDPHICALSTART = 'Z') else EVODDPHICALSTART; -- rv 0
    EVODDPHIDRDEN_in <= '0' when (EVODDPHIDRDEN = 'Z') else EVODDPHIDRDEN; -- rv 0
    EVODDPHIDWREN_in <= '0' when (EVODDPHIDWREN = 'Z') else EVODDPHIDWREN; -- rv 0
    EVODDPHIXRDEN_in <= '0' when (EVODDPHIXRDEN = 'Z') else EVODDPHIXRDEN; -- rv 0
    EVODDPHIXWREN_in <= '0' when (EVODDPHIXWREN = 'Z') else EVODDPHIXWREN; -- rv 0
    EYESCANMODE_in <= '0' when (EYESCANMODE = 'Z') else EYESCANMODE; -- rv 0
    EYESCANRESET_in <= '0' when (EYESCANRESET = 'Z') else EYESCANRESET; -- rv 0
    EYESCANTRIGGER_in <= '0' when (EYESCANTRIGGER = 'Z') else EYESCANTRIGGER; -- rv 0
    GTGREFCLK_in <= GTGREFCLK;
    GTNORTHREFCLK0_in <= GTNORTHREFCLK0;
    GTNORTHREFCLK1_in <= GTNORTHREFCLK1;
    GTREFCLK0_in <= GTREFCLK0;
    GTREFCLK1_in <= GTREFCLK1;
    GTRESETSEL_in <= '0' when (GTRESETSEL = 'Z') else GTRESETSEL; -- rv 0
    GTRSVD_in(0) <= '0' when (GTRSVD(0) = 'Z') else GTRSVD(0); -- rv 0
    GTRSVD_in(1) <= '0' when (GTRSVD(1) = 'Z') else GTRSVD(1); -- rv 0
    GTRSVD_in(10) <= '0' when (GTRSVD(10) = 'Z') else GTRSVD(10); -- rv 0
    GTRSVD_in(11) <= '0' when (GTRSVD(11) = 'Z') else GTRSVD(11); -- rv 0
    GTRSVD_in(12) <= '0' when (GTRSVD(12) = 'Z') else GTRSVD(12); -- rv 0
    GTRSVD_in(13) <= '0' when (GTRSVD(13) = 'Z') else GTRSVD(13); -- rv 0
    GTRSVD_in(14) <= '0' when (GTRSVD(14) = 'Z') else GTRSVD(14); -- rv 0
    GTRSVD_in(15) <= '0' when (GTRSVD(15) = 'Z') else GTRSVD(15); -- rv 0
    GTRSVD_in(2) <= '0' when (GTRSVD(2) = 'Z') else GTRSVD(2); -- rv 0
    GTRSVD_in(3) <= '0' when (GTRSVD(3) = 'Z') else GTRSVD(3); -- rv 0
    GTRSVD_in(4) <= '0' when (GTRSVD(4) = 'Z') else GTRSVD(4); -- rv 0
    GTRSVD_in(5) <= '0' when (GTRSVD(5) = 'Z') else GTRSVD(5); -- rv 0
    GTRSVD_in(6) <= '0' when (GTRSVD(6) = 'Z') else GTRSVD(6); -- rv 0
    GTRSVD_in(7) <= '0' when (GTRSVD(7) = 'Z') else GTRSVD(7); -- rv 0
    GTRSVD_in(8) <= '0' when (GTRSVD(8) = 'Z') else GTRSVD(8); -- rv 0
    GTRSVD_in(9) <= '0' when (GTRSVD(9) = 'Z') else GTRSVD(9); -- rv 0
    GTRXRESET_in <= '0' when (GTRXRESET = 'Z') else GTRXRESET; -- rv 0
    GTSOUTHREFCLK0_in <= GTSOUTHREFCLK0;
    GTSOUTHREFCLK1_in <= GTSOUTHREFCLK1;
    GTTXRESET_in <= '0' when (GTTXRESET = 'Z') else GTTXRESET; -- rv 0
    GTYRXN_in <= GTYRXN;
    GTYRXP_in <= GTYRXP;
    LOOPBACK_in(0) <= '0' when (LOOPBACK(0) = 'Z') else LOOPBACK(0); -- rv 0
    LOOPBACK_in(1) <= '0' when (LOOPBACK(1) = 'Z') else LOOPBACK(1); -- rv 0
    LOOPBACK_in(2) <= '0' when (LOOPBACK(2) = 'Z') else LOOPBACK(2); -- rv 0
    LOOPRSVD_in(0) <= '0' when (LOOPRSVD(0) = 'Z') else LOOPRSVD(0); -- rv 0
    LOOPRSVD_in(1) <= '0' when (LOOPRSVD(1) = 'Z') else LOOPRSVD(1); -- rv 0
    LOOPRSVD_in(10) <= '0' when (LOOPRSVD(10) = 'Z') else LOOPRSVD(10); -- rv 0
    LOOPRSVD_in(11) <= '0' when (LOOPRSVD(11) = 'Z') else LOOPRSVD(11); -- rv 0
    LOOPRSVD_in(12) <= '0' when (LOOPRSVD(12) = 'Z') else LOOPRSVD(12); -- rv 0
    LOOPRSVD_in(13) <= '0' when (LOOPRSVD(13) = 'Z') else LOOPRSVD(13); -- rv 0
    LOOPRSVD_in(14) <= '0' when (LOOPRSVD(14) = 'Z') else LOOPRSVD(14); -- rv 0
    LOOPRSVD_in(15) <= '0' when (LOOPRSVD(15) = 'Z') else LOOPRSVD(15); -- rv 0
    LOOPRSVD_in(2) <= '0' when (LOOPRSVD(2) = 'Z') else LOOPRSVD(2); -- rv 0
    LOOPRSVD_in(3) <= '0' when (LOOPRSVD(3) = 'Z') else LOOPRSVD(3); -- rv 0
    LOOPRSVD_in(4) <= '0' when (LOOPRSVD(4) = 'Z') else LOOPRSVD(4); -- rv 0
    LOOPRSVD_in(5) <= '0' when (LOOPRSVD(5) = 'Z') else LOOPRSVD(5); -- rv 0
    LOOPRSVD_in(6) <= '0' when (LOOPRSVD(6) = 'Z') else LOOPRSVD(6); -- rv 0
    LOOPRSVD_in(7) <= '0' when (LOOPRSVD(7) = 'Z') else LOOPRSVD(7); -- rv 0
    LOOPRSVD_in(8) <= '0' when (LOOPRSVD(8) = 'Z') else LOOPRSVD(8); -- rv 0
    LOOPRSVD_in(9) <= '0' when (LOOPRSVD(9) = 'Z') else LOOPRSVD(9); -- rv 0
    LPBKRXTXSEREN_in <= '0' when (LPBKRXTXSEREN = 'Z') else LPBKRXTXSEREN; -- rv 0
    LPBKTXRXSEREN_in <= '0' when (LPBKTXRXSEREN = 'Z') else LPBKTXRXSEREN; -- rv 0
    PCIEEQRXEQADAPTDONE_in <= '0' when (PCIEEQRXEQADAPTDONE = 'Z') else PCIEEQRXEQADAPTDONE; -- rv 0
    PCIERSTIDLE_in <= '0' when (PCIERSTIDLE = 'Z') else PCIERSTIDLE; -- rv 0
    PCIERSTTXSYNCSTART_in <= '0' when (PCIERSTTXSYNCSTART = 'Z') else PCIERSTTXSYNCSTART; -- rv 0
    PCIEUSERRATEDONE_in <= '0' when (PCIEUSERRATEDONE = 'Z') else PCIEUSERRATEDONE; -- rv 0
    PCSRSVDIN2_in(0) <= '0' when (PCSRSVDIN2(0) = 'Z') else PCSRSVDIN2(0); -- rv 0
    PCSRSVDIN2_in(1) <= '0' when (PCSRSVDIN2(1) = 'Z') else PCSRSVDIN2(1); -- rv 0
    PCSRSVDIN2_in(2) <= '0' when (PCSRSVDIN2(2) = 'Z') else PCSRSVDIN2(2); -- rv 0
    PCSRSVDIN2_in(3) <= '0' when (PCSRSVDIN2(3) = 'Z') else PCSRSVDIN2(3); -- rv 0
    PCSRSVDIN2_in(4) <= '0' when (PCSRSVDIN2(4) = 'Z') else PCSRSVDIN2(4); -- rv 0
    PCSRSVDIN_in(0) <= '0' when (PCSRSVDIN(0) = 'Z') else PCSRSVDIN(0); -- rv 0
    PCSRSVDIN_in(1) <= '0' when (PCSRSVDIN(1) = 'Z') else PCSRSVDIN(1); -- rv 0
    PCSRSVDIN_in(10) <= '0' when (PCSRSVDIN(10) = 'Z') else PCSRSVDIN(10); -- rv 0
    PCSRSVDIN_in(11) <= '0' when (PCSRSVDIN(11) = 'Z') else PCSRSVDIN(11); -- rv 0
    PCSRSVDIN_in(12) <= '0' when (PCSRSVDIN(12) = 'Z') else PCSRSVDIN(12); -- rv 0
    PCSRSVDIN_in(13) <= '0' when (PCSRSVDIN(13) = 'Z') else PCSRSVDIN(13); -- rv 0
    PCSRSVDIN_in(14) <= '0' when (PCSRSVDIN(14) = 'Z') else PCSRSVDIN(14); -- rv 0
    PCSRSVDIN_in(15) <= '0' when (PCSRSVDIN(15) = 'Z') else PCSRSVDIN(15); -- rv 0
    PCSRSVDIN_in(2) <= '0' when (PCSRSVDIN(2) = 'Z') else PCSRSVDIN(2); -- rv 0
    PCSRSVDIN_in(3) <= '0' when (PCSRSVDIN(3) = 'Z') else PCSRSVDIN(3); -- rv 0
    PCSRSVDIN_in(4) <= '0' when (PCSRSVDIN(4) = 'Z') else PCSRSVDIN(4); -- rv 0
    PCSRSVDIN_in(5) <= '0' when (PCSRSVDIN(5) = 'Z') else PCSRSVDIN(5); -- rv 0
    PCSRSVDIN_in(6) <= '0' when (PCSRSVDIN(6) = 'Z') else PCSRSVDIN(6); -- rv 0
    PCSRSVDIN_in(7) <= '0' when (PCSRSVDIN(7) = 'Z') else PCSRSVDIN(7); -- rv 0
    PCSRSVDIN_in(8) <= '0' when (PCSRSVDIN(8) = 'Z') else PCSRSVDIN(8); -- rv 0
    PCSRSVDIN_in(9) <= '0' when (PCSRSVDIN(9) = 'Z') else PCSRSVDIN(9); -- rv 0
    PMARSVDIN_in(0) <= '0' when (PMARSVDIN(0) = 'Z') else PMARSVDIN(0); -- rv 0
    PMARSVDIN_in(1) <= '0' when (PMARSVDIN(1) = 'Z') else PMARSVDIN(1); -- rv 0
    PMARSVDIN_in(2) <= '0' when (PMARSVDIN(2) = 'Z') else PMARSVDIN(2); -- rv 0
    PMARSVDIN_in(3) <= '0' when (PMARSVDIN(3) = 'Z') else PMARSVDIN(3); -- rv 0
    PMARSVDIN_in(4) <= '0' when (PMARSVDIN(4) = 'Z') else PMARSVDIN(4); -- rv 0
    QPLL0CLK_in <= QPLL0CLK;
    QPLL0REFCLK_in <= QPLL0REFCLK;
    QPLL1CLK_in <= QPLL1CLK;
    QPLL1REFCLK_in <= QPLL1REFCLK;
    RESETOVRD_in <= '0' when (RESETOVRD = 'Z') else RESETOVRD; -- rv 0
    RSTCLKENTX_in <= '0' when (RSTCLKENTX = 'Z') else RSTCLKENTX; -- rv 0
    RX8B10BEN_in <= '0' when (RX8B10BEN = 'Z') else RX8B10BEN; -- rv 0
    RXBUFRESET_in <= '0' when (RXBUFRESET = 'Z') else RXBUFRESET; -- rv 0
    RXCDRFREQRESET_in <= '0' when (RXCDRFREQRESET = 'Z') else RXCDRFREQRESET; -- rv 0
    RXCDRHOLD_in <= '0' when (RXCDRHOLD = 'Z') else RXCDRHOLD; -- rv 0
    RXCDROVRDEN_in <= '0' when (RXCDROVRDEN = 'Z') else RXCDROVRDEN; -- rv 0
    RXCDRRESETRSV_in <= '0' when (RXCDRRESETRSV = 'Z') else RXCDRRESETRSV; -- rv 0
    RXCDRRESET_in <= '0' when (RXCDRRESET = 'Z') else RXCDRRESET; -- rv 0
    RXCHBONDEN_in <= '0' when (RXCHBONDEN = 'Z') else RXCHBONDEN; -- rv 0
    RXCHBONDI_in(0) <= '0' when (RXCHBONDI(0) = 'Z') else RXCHBONDI(0); -- rv 0
    RXCHBONDI_in(1) <= '0' when (RXCHBONDI(1) = 'Z') else RXCHBONDI(1); -- rv 0
    RXCHBONDI_in(2) <= '0' when (RXCHBONDI(2) = 'Z') else RXCHBONDI(2); -- rv 0
    RXCHBONDI_in(3) <= '0' when (RXCHBONDI(3) = 'Z') else RXCHBONDI(3); -- rv 0
    RXCHBONDI_in(4) <= '0' when (RXCHBONDI(4) = 'Z') else RXCHBONDI(4); -- rv 0
    RXCHBONDLEVEL_in(0) <= '0' when (RXCHBONDLEVEL(0) = 'Z') else RXCHBONDLEVEL(0); -- rv 0
    RXCHBONDLEVEL_in(1) <= '0' when (RXCHBONDLEVEL(1) = 'Z') else RXCHBONDLEVEL(1); -- rv 0
    RXCHBONDLEVEL_in(2) <= '0' when (RXCHBONDLEVEL(2) = 'Z') else RXCHBONDLEVEL(2); -- rv 0
    RXCHBONDMASTER_in <= '0' when (RXCHBONDMASTER = 'Z') else RXCHBONDMASTER; -- rv 0
    RXCHBONDSLAVE_in <= '0' when (RXCHBONDSLAVE = 'Z') else RXCHBONDSLAVE; -- rv 0
    RXCKCALRESET_in <= '0' when (RXCKCALRESET = 'Z') else RXCKCALRESET; -- rv 0
    RXCOMMADETEN_in <= '0' when (RXCOMMADETEN = 'Z') else RXCOMMADETEN; -- rv 0
    RXDCCFORCESTART_in <= '0' when (RXDCCFORCESTART = 'Z') else RXDCCFORCESTART; -- rv 0
    RXDFEAGCHOLD_in <= '0' when (RXDFEAGCHOLD = 'Z') else RXDFEAGCHOLD; -- rv 0
    RXDFEAGCOVRDEN_in <= '0' when (RXDFEAGCOVRDEN = 'Z') else RXDFEAGCOVRDEN; -- rv 0
    RXDFELFHOLD_in <= '0' when (RXDFELFHOLD = 'Z') else RXDFELFHOLD; -- rv 0
    RXDFELFOVRDEN_in <= '0' when (RXDFELFOVRDEN = 'Z') else RXDFELFOVRDEN; -- rv 0
    RXDFELPMRESET_in <= '0' when (RXDFELPMRESET = 'Z') else RXDFELPMRESET; -- rv 0
    RXDFETAP10HOLD_in <= '0' when (RXDFETAP10HOLD = 'Z') else RXDFETAP10HOLD; -- rv 0
    RXDFETAP10OVRDEN_in <= '0' when (RXDFETAP10OVRDEN = 'Z') else RXDFETAP10OVRDEN; -- rv 0
    RXDFETAP11HOLD_in <= '0' when (RXDFETAP11HOLD = 'Z') else RXDFETAP11HOLD; -- rv 0
    RXDFETAP11OVRDEN_in <= '0' when (RXDFETAP11OVRDEN = 'Z') else RXDFETAP11OVRDEN; -- rv 0
    RXDFETAP12HOLD_in <= '0' when (RXDFETAP12HOLD = 'Z') else RXDFETAP12HOLD; -- rv 0
    RXDFETAP12OVRDEN_in <= '0' when (RXDFETAP12OVRDEN = 'Z') else RXDFETAP12OVRDEN; -- rv 0
    RXDFETAP13HOLD_in <= '0' when (RXDFETAP13HOLD = 'Z') else RXDFETAP13HOLD; -- rv 0
    RXDFETAP13OVRDEN_in <= '0' when (RXDFETAP13OVRDEN = 'Z') else RXDFETAP13OVRDEN; -- rv 0
    RXDFETAP14HOLD_in <= '0' when (RXDFETAP14HOLD = 'Z') else RXDFETAP14HOLD; -- rv 0
    RXDFETAP14OVRDEN_in <= '0' when (RXDFETAP14OVRDEN = 'Z') else RXDFETAP14OVRDEN; -- rv 0
    RXDFETAP15HOLD_in <= '0' when (RXDFETAP15HOLD = 'Z') else RXDFETAP15HOLD; -- rv 0
    RXDFETAP15OVRDEN_in <= '0' when (RXDFETAP15OVRDEN = 'Z') else RXDFETAP15OVRDEN; -- rv 0
    RXDFETAP2HOLD_in <= '0' when (RXDFETAP2HOLD = 'Z') else RXDFETAP2HOLD; -- rv 0
    RXDFETAP2OVRDEN_in <= '0' when (RXDFETAP2OVRDEN = 'Z') else RXDFETAP2OVRDEN; -- rv 0
    RXDFETAP3HOLD_in <= '0' when (RXDFETAP3HOLD = 'Z') else RXDFETAP3HOLD; -- rv 0
    RXDFETAP3OVRDEN_in <= '0' when (RXDFETAP3OVRDEN = 'Z') else RXDFETAP3OVRDEN; -- rv 0
    RXDFETAP4HOLD_in <= '0' when (RXDFETAP4HOLD = 'Z') else RXDFETAP4HOLD; -- rv 0
    RXDFETAP4OVRDEN_in <= '0' when (RXDFETAP4OVRDEN = 'Z') else RXDFETAP4OVRDEN; -- rv 0
    RXDFETAP5HOLD_in <= '0' when (RXDFETAP5HOLD = 'Z') else RXDFETAP5HOLD; -- rv 0
    RXDFETAP5OVRDEN_in <= '0' when (RXDFETAP5OVRDEN = 'Z') else RXDFETAP5OVRDEN; -- rv 0
    RXDFETAP6HOLD_in <= '0' when (RXDFETAP6HOLD = 'Z') else RXDFETAP6HOLD; -- rv 0
    RXDFETAP6OVRDEN_in <= '0' when (RXDFETAP6OVRDEN = 'Z') else RXDFETAP6OVRDEN; -- rv 0
    RXDFETAP7HOLD_in <= '0' when (RXDFETAP7HOLD = 'Z') else RXDFETAP7HOLD; -- rv 0
    RXDFETAP7OVRDEN_in <= '0' when (RXDFETAP7OVRDEN = 'Z') else RXDFETAP7OVRDEN; -- rv 0
    RXDFETAP8HOLD_in <= '0' when (RXDFETAP8HOLD = 'Z') else RXDFETAP8HOLD; -- rv 0
    RXDFETAP8OVRDEN_in <= '0' when (RXDFETAP8OVRDEN = 'Z') else RXDFETAP8OVRDEN; -- rv 0
    RXDFETAP9HOLD_in <= '0' when (RXDFETAP9HOLD = 'Z') else RXDFETAP9HOLD; -- rv 0
    RXDFETAP9OVRDEN_in <= '0' when (RXDFETAP9OVRDEN = 'Z') else RXDFETAP9OVRDEN; -- rv 0
    RXDFEUTHOLD_in <= '0' when (RXDFEUTHOLD = 'Z') else RXDFEUTHOLD; -- rv 0
    RXDFEUTOVRDEN_in <= '0' when (RXDFEUTOVRDEN = 'Z') else RXDFEUTOVRDEN; -- rv 0
    RXDFEVPHOLD_in <= '0' when (RXDFEVPHOLD = 'Z') else RXDFEVPHOLD; -- rv 0
    RXDFEVPOVRDEN_in <= '0' when (RXDFEVPOVRDEN = 'Z') else RXDFEVPOVRDEN; -- rv 0
    RXDFEVSEN_in <= '0' when (RXDFEVSEN = 'Z') else RXDFEVSEN; -- rv 0
    RXDFEXYDEN_in <= '0' when (RXDFEXYDEN = 'Z') else RXDFEXYDEN; -- rv 0
    RXDLYBYPASS_in <= '0' when (RXDLYBYPASS = 'Z') else RXDLYBYPASS; -- rv 0
    RXDLYEN_in <= '0' when (RXDLYEN = 'Z') else RXDLYEN; -- rv 0
    RXDLYOVRDEN_in <= '0' when (RXDLYOVRDEN = 'Z') else RXDLYOVRDEN; -- rv 0
    RXDLYSRESET_in <= '0' when (RXDLYSRESET = 'Z') else RXDLYSRESET; -- rv 0
    RXELECIDLEMODE_in(0) <= '0' when (RXELECIDLEMODE(0) = 'Z') else RXELECIDLEMODE(0); -- rv 0
    RXELECIDLEMODE_in(1) <= '0' when (RXELECIDLEMODE(1) = 'Z') else RXELECIDLEMODE(1); -- rv 0
    RXGEARBOXSLIP_in <= '0' when (RXGEARBOXSLIP = 'Z') else RXGEARBOXSLIP; -- rv 0
    RXLATCLK_in <= '0' when (RXLATCLK = 'Z') else RXLATCLK; -- rv 0
    RXLPMEN_in <= '0' when (RXLPMEN = 'Z') else RXLPMEN; -- rv 0
    RXLPMGCHOLD_in <= '0' when (RXLPMGCHOLD = 'Z') else RXLPMGCHOLD; -- rv 0
    RXLPMGCOVRDEN_in <= '0' when (RXLPMGCOVRDEN = 'Z') else RXLPMGCOVRDEN; -- rv 0
    RXLPMHFHOLD_in <= '0' when (RXLPMHFHOLD = 'Z') else RXLPMHFHOLD; -- rv 0
    RXLPMHFOVRDEN_in <= '0' when (RXLPMHFOVRDEN = 'Z') else RXLPMHFOVRDEN; -- rv 0
    RXLPMLFHOLD_in <= '0' when (RXLPMLFHOLD = 'Z') else RXLPMLFHOLD; -- rv 0
    RXLPMLFKLOVRDEN_in <= '0' when (RXLPMLFKLOVRDEN = 'Z') else RXLPMLFKLOVRDEN; -- rv 0
    RXLPMOSHOLD_in <= '0' when (RXLPMOSHOLD = 'Z') else RXLPMOSHOLD; -- rv 0
    RXLPMOSOVRDEN_in <= '0' when (RXLPMOSOVRDEN = 'Z') else RXLPMOSOVRDEN; -- rv 0
    RXMCOMMAALIGNEN_in <= '0' when (RXMCOMMAALIGNEN = 'Z') else RXMCOMMAALIGNEN; -- rv 0
    RXMONITORSEL_in(0) <= '0' when (RXMONITORSEL(0) = 'Z') else RXMONITORSEL(0); -- rv 0
    RXMONITORSEL_in(1) <= '0' when (RXMONITORSEL(1) = 'Z') else RXMONITORSEL(1); -- rv 0
    RXOOBRESET_in <= '0' when (RXOOBRESET = 'Z') else RXOOBRESET; -- rv 0
    RXOSCALRESET_in <= '0' when (RXOSCALRESET = 'Z') else RXOSCALRESET; -- rv 0
    RXOSHOLD_in <= '0' when (RXOSHOLD = 'Z') else RXOSHOLD; -- rv 0
    RXOSINTCFG_in(0) <= '0' when (RXOSINTCFG(0) = 'Z') else RXOSINTCFG(0); -- rv 0
    RXOSINTCFG_in(1) <= '1' when (RXOSINTCFG(1) = 'Z') else RXOSINTCFG(1); -- rv 1
    RXOSINTCFG_in(2) <= '1' when (RXOSINTCFG(2) = 'Z') else RXOSINTCFG(2); -- rv 1
    RXOSINTCFG_in(3) <= '0' when (RXOSINTCFG(3) = 'Z') else RXOSINTCFG(3); -- rv 0
    RXOSINTEN_in <= '1' when (RXOSINTEN = 'Z') else RXOSINTEN; -- rv 1
    RXOSINTHOLD_in <= '0' when (RXOSINTHOLD = 'Z') else RXOSINTHOLD; -- rv 0
    RXOSINTOVRDEN_in <= '0' when (RXOSINTOVRDEN = 'Z') else RXOSINTOVRDEN; -- rv 0
    RXOSINTSTROBE_in <= '0' when (RXOSINTSTROBE = 'Z') else RXOSINTSTROBE; -- rv 0
    RXOSINTTESTOVRDEN_in <= '0' when (RXOSINTTESTOVRDEN = 'Z') else RXOSINTTESTOVRDEN; -- rv 0
    RXOSOVRDEN_in <= '0' when (RXOSOVRDEN = 'Z') else RXOSOVRDEN; -- rv 0
    RXOUTCLKSEL_in(0) <= '0' when (RXOUTCLKSEL(0) = 'Z') else RXOUTCLKSEL(0); -- rv 0
    RXOUTCLKSEL_in(1) <= '0' when (RXOUTCLKSEL(1) = 'Z') else RXOUTCLKSEL(1); -- rv 0
    RXOUTCLKSEL_in(2) <= '0' when (RXOUTCLKSEL(2) = 'Z') else RXOUTCLKSEL(2); -- rv 0
    RXPCOMMAALIGNEN_in <= '0' when (RXPCOMMAALIGNEN = 'Z') else RXPCOMMAALIGNEN; -- rv 0
    RXPCSRESET_in <= '0' when (RXPCSRESET = 'Z') else RXPCSRESET; -- rv 0
    RXPD_in(0) <= '0' when (RXPD(0) = 'Z') else RXPD(0); -- rv 0
    RXPD_in(1) <= '0' when (RXPD(1) = 'Z') else RXPD(1); -- rv 0
    RXPHALIGNEN_in <= '0' when (RXPHALIGNEN = 'Z') else RXPHALIGNEN; -- rv 0
    RXPHALIGN_in <= '0' when (RXPHALIGN = 'Z') else RXPHALIGN; -- rv 0
    RXPHDLYPD_in <= '0' when (RXPHDLYPD = 'Z') else RXPHDLYPD; -- rv 0
    RXPHDLYRESET_in <= '0' when (RXPHDLYRESET = 'Z') else RXPHDLYRESET; -- rv 0
    RXPHOVRDEN_in <= '0' when (RXPHOVRDEN = 'Z') else RXPHOVRDEN; -- rv 0
    RXPLLCLKSEL_in(0) <= '0' when (RXPLLCLKSEL(0) = 'Z') else RXPLLCLKSEL(0); -- rv 0
    RXPLLCLKSEL_in(1) <= '0' when (RXPLLCLKSEL(1) = 'Z') else RXPLLCLKSEL(1); -- rv 0
    RXPMARESET_in <= '0' when (RXPMARESET = 'Z') else RXPMARESET; -- rv 0
    RXPOLARITY_in <= '0' when (RXPOLARITY = 'Z') else RXPOLARITY; -- rv 0
    RXPRBSCNTRESET_in <= '0' when (RXPRBSCNTRESET = 'Z') else RXPRBSCNTRESET; -- rv 0
    RXPRBSSEL_in(0) <= '0' when (RXPRBSSEL(0) = 'Z') else RXPRBSSEL(0); -- rv 0
    RXPRBSSEL_in(1) <= '0' when (RXPRBSSEL(1) = 'Z') else RXPRBSSEL(1); -- rv 0
    RXPRBSSEL_in(2) <= '0' when (RXPRBSSEL(2) = 'Z') else RXPRBSSEL(2); -- rv 0
    RXPRBSSEL_in(3) <= '0' when (RXPRBSSEL(3) = 'Z') else RXPRBSSEL(3); -- rv 0
    RXPROGDIVRESET_in <= '0' when (RXPROGDIVRESET = 'Z') else RXPROGDIVRESET; -- rv 0
    RXRATEMODE_in <= '0' when (RXRATEMODE = 'Z') else RXRATEMODE; -- rv 0
    RXRATE_in(0) <= '0' when (RXRATE(0) = 'Z') else RXRATE(0); -- rv 0
    RXRATE_in(1) <= '0' when (RXRATE(1) = 'Z') else RXRATE(1); -- rv 0
    RXRATE_in(2) <= '0' when (RXRATE(2) = 'Z') else RXRATE(2); -- rv 0
    RXSLIDE_in <= '0' when (RXSLIDE = 'Z') else RXSLIDE; -- rv 0
    RXSLIPOUTCLK_in <= '0' when (RXSLIPOUTCLK = 'Z') else RXSLIPOUTCLK; -- rv 0
    RXSLIPPMA_in <= '0' when (RXSLIPPMA = 'Z') else RXSLIPPMA; -- rv 0
    RXSYNCALLIN_in <= '0' when (RXSYNCALLIN = 'Z') else RXSYNCALLIN; -- rv 0
    RXSYNCIN_in <= '0' when (RXSYNCIN = 'Z') else RXSYNCIN; -- rv 0
    RXSYNCMODE_in <= '1' when (RXSYNCMODE = 'Z') else RXSYNCMODE; -- rv 1
    RXSYSCLKSEL_in(0) <= '0' when (RXSYSCLKSEL(0) = 'Z') else RXSYSCLKSEL(0); -- rv 0
    RXSYSCLKSEL_in(1) <= '0' when (RXSYSCLKSEL(1) = 'Z') else RXSYSCLKSEL(1); -- rv 0
    RXUSERRDY_in <= '0' when (RXUSERRDY = 'Z') else RXUSERRDY; -- rv 0
    RXUSRCLK2_in <= '0' when (RXUSRCLK2 = 'Z') else RXUSRCLK2; -- rv 0
    RXUSRCLK_in <= '0' when (RXUSRCLK = 'Z') else RXUSRCLK; -- rv 0
    SIGVALIDCLK_in <= '0' when (SIGVALIDCLK = 'Z') else SIGVALIDCLK; -- rv 0
    TSTIN_in(0) <= '0' when (TSTIN(0) = 'Z') else TSTIN(0); -- rv 0
    TSTIN_in(1) <= '0' when (TSTIN(1) = 'Z') else TSTIN(1); -- rv 0
    TSTIN_in(10) <= '0' when (TSTIN(10) = 'Z') else TSTIN(10); -- rv 0
    TSTIN_in(11) <= '0' when (TSTIN(11) = 'Z') else TSTIN(11); -- rv 0
    TSTIN_in(12) <= '0' when (TSTIN(12) = 'Z') else TSTIN(12); -- rv 0
    TSTIN_in(13) <= '0' when (TSTIN(13) = 'Z') else TSTIN(13); -- rv 0
    TSTIN_in(14) <= '0' when (TSTIN(14) = 'Z') else TSTIN(14); -- rv 0
    TSTIN_in(15) <= '0' when (TSTIN(15) = 'Z') else TSTIN(15); -- rv 0
    TSTIN_in(16) <= '0' when (TSTIN(16) = 'Z') else TSTIN(16); -- rv 0
    TSTIN_in(17) <= '0' when (TSTIN(17) = 'Z') else TSTIN(17); -- rv 0
    TSTIN_in(18) <= '0' when (TSTIN(18) = 'Z') else TSTIN(18); -- rv 0
    TSTIN_in(19) <= '0' when (TSTIN(19) = 'Z') else TSTIN(19); -- rv 0
    TSTIN_in(2) <= '0' when (TSTIN(2) = 'Z') else TSTIN(2); -- rv 0
    TSTIN_in(3) <= '0' when (TSTIN(3) = 'Z') else TSTIN(3); -- rv 0
    TSTIN_in(4) <= '0' when (TSTIN(4) = 'Z') else TSTIN(4); -- rv 0
    TSTIN_in(5) <= '0' when (TSTIN(5) = 'Z') else TSTIN(5); -- rv 0
    TSTIN_in(6) <= '0' when (TSTIN(6) = 'Z') else TSTIN(6); -- rv 0
    TSTIN_in(7) <= '0' when (TSTIN(7) = 'Z') else TSTIN(7); -- rv 0
    TSTIN_in(8) <= '0' when (TSTIN(8) = 'Z') else TSTIN(8); -- rv 0
    TSTIN_in(9) <= '0' when (TSTIN(9) = 'Z') else TSTIN(9); -- rv 0
    TX8B10BBYPASS_in(0) <= '0' when (TX8B10BBYPASS(0) = 'Z') else TX8B10BBYPASS(0); -- rv 0
    TX8B10BBYPASS_in(1) <= '0' when (TX8B10BBYPASS(1) = 'Z') else TX8B10BBYPASS(1); -- rv 0
    TX8B10BBYPASS_in(2) <= '0' when (TX8B10BBYPASS(2) = 'Z') else TX8B10BBYPASS(2); -- rv 0
    TX8B10BBYPASS_in(3) <= '0' when (TX8B10BBYPASS(3) = 'Z') else TX8B10BBYPASS(3); -- rv 0
    TX8B10BBYPASS_in(4) <= '0' when (TX8B10BBYPASS(4) = 'Z') else TX8B10BBYPASS(4); -- rv 0
    TX8B10BBYPASS_in(5) <= '0' when (TX8B10BBYPASS(5) = 'Z') else TX8B10BBYPASS(5); -- rv 0
    TX8B10BBYPASS_in(6) <= '0' when (TX8B10BBYPASS(6) = 'Z') else TX8B10BBYPASS(6); -- rv 0
    TX8B10BBYPASS_in(7) <= '0' when (TX8B10BBYPASS(7) = 'Z') else TX8B10BBYPASS(7); -- rv 0
    TX8B10BEN_in <= '0' when (TX8B10BEN = 'Z') else TX8B10BEN; -- rv 0
    TXBUFDIFFCTRL_in(0) <= '0' when (TXBUFDIFFCTRL(0) = 'Z') else TXBUFDIFFCTRL(0); -- rv 0
    TXBUFDIFFCTRL_in(1) <= '0' when (TXBUFDIFFCTRL(1) = 'Z') else TXBUFDIFFCTRL(1); -- rv 0
    TXBUFDIFFCTRL_in(2) <= '0' when (TXBUFDIFFCTRL(2) = 'Z') else TXBUFDIFFCTRL(2); -- rv 0
    TXCOMINIT_in <= '0' when (TXCOMINIT = 'Z') else TXCOMINIT; -- rv 0
    TXCOMSAS_in <= '0' when (TXCOMSAS = 'Z') else TXCOMSAS; -- rv 0
    TXCOMWAKE_in <= '0' when (TXCOMWAKE = 'Z') else TXCOMWAKE; -- rv 0
    TXCTRL0_in(0) <= '0' when (TXCTRL0(0) = 'Z') else TXCTRL0(0); -- rv 0
    TXCTRL0_in(1) <= '0' when (TXCTRL0(1) = 'Z') else TXCTRL0(1); -- rv 0
    TXCTRL0_in(10) <= '0' when (TXCTRL0(10) = 'Z') else TXCTRL0(10); -- rv 0
    TXCTRL0_in(11) <= '0' when (TXCTRL0(11) = 'Z') else TXCTRL0(11); -- rv 0
    TXCTRL0_in(12) <= '0' when (TXCTRL0(12) = 'Z') else TXCTRL0(12); -- rv 0
    TXCTRL0_in(13) <= '0' when (TXCTRL0(13) = 'Z') else TXCTRL0(13); -- rv 0
    TXCTRL0_in(14) <= '0' when (TXCTRL0(14) = 'Z') else TXCTRL0(14); -- rv 0
    TXCTRL0_in(15) <= '0' when (TXCTRL0(15) = 'Z') else TXCTRL0(15); -- rv 0
    TXCTRL0_in(2) <= '0' when (TXCTRL0(2) = 'Z') else TXCTRL0(2); -- rv 0
    TXCTRL0_in(3) <= '0' when (TXCTRL0(3) = 'Z') else TXCTRL0(3); -- rv 0
    TXCTRL0_in(4) <= '0' when (TXCTRL0(4) = 'Z') else TXCTRL0(4); -- rv 0
    TXCTRL0_in(5) <= '0' when (TXCTRL0(5) = 'Z') else TXCTRL0(5); -- rv 0
    TXCTRL0_in(6) <= '0' when (TXCTRL0(6) = 'Z') else TXCTRL0(6); -- rv 0
    TXCTRL0_in(7) <= '0' when (TXCTRL0(7) = 'Z') else TXCTRL0(7); -- rv 0
    TXCTRL0_in(8) <= '0' when (TXCTRL0(8) = 'Z') else TXCTRL0(8); -- rv 0
    TXCTRL0_in(9) <= '0' when (TXCTRL0(9) = 'Z') else TXCTRL0(9); -- rv 0
    TXCTRL1_in(0) <= '0' when (TXCTRL1(0) = 'Z') else TXCTRL1(0); -- rv 0
    TXCTRL1_in(1) <= '0' when (TXCTRL1(1) = 'Z') else TXCTRL1(1); -- rv 0
    TXCTRL1_in(10) <= '0' when (TXCTRL1(10) = 'Z') else TXCTRL1(10); -- rv 0
    TXCTRL1_in(11) <= '0' when (TXCTRL1(11) = 'Z') else TXCTRL1(11); -- rv 0
    TXCTRL1_in(12) <= '0' when (TXCTRL1(12) = 'Z') else TXCTRL1(12); -- rv 0
    TXCTRL1_in(13) <= '0' when (TXCTRL1(13) = 'Z') else TXCTRL1(13); -- rv 0
    TXCTRL1_in(14) <= '0' when (TXCTRL1(14) = 'Z') else TXCTRL1(14); -- rv 0
    TXCTRL1_in(15) <= '0' when (TXCTRL1(15) = 'Z') else TXCTRL1(15); -- rv 0
    TXCTRL1_in(2) <= '0' when (TXCTRL1(2) = 'Z') else TXCTRL1(2); -- rv 0
    TXCTRL1_in(3) <= '0' when (TXCTRL1(3) = 'Z') else TXCTRL1(3); -- rv 0
    TXCTRL1_in(4) <= '0' when (TXCTRL1(4) = 'Z') else TXCTRL1(4); -- rv 0
    TXCTRL1_in(5) <= '0' when (TXCTRL1(5) = 'Z') else TXCTRL1(5); -- rv 0
    TXCTRL1_in(6) <= '0' when (TXCTRL1(6) = 'Z') else TXCTRL1(6); -- rv 0
    TXCTRL1_in(7) <= '0' when (TXCTRL1(7) = 'Z') else TXCTRL1(7); -- rv 0
    TXCTRL1_in(8) <= '0' when (TXCTRL1(8) = 'Z') else TXCTRL1(8); -- rv 0
    TXCTRL1_in(9) <= '0' when (TXCTRL1(9) = 'Z') else TXCTRL1(9); -- rv 0
    TXCTRL2_in(0) <= '0' when (TXCTRL2(0) = 'Z') else TXCTRL2(0); -- rv 0
    TXCTRL2_in(1) <= '0' when (TXCTRL2(1) = 'Z') else TXCTRL2(1); -- rv 0
    TXCTRL2_in(2) <= '0' when (TXCTRL2(2) = 'Z') else TXCTRL2(2); -- rv 0
    TXCTRL2_in(3) <= '0' when (TXCTRL2(3) = 'Z') else TXCTRL2(3); -- rv 0
    TXCTRL2_in(4) <= '0' when (TXCTRL2(4) = 'Z') else TXCTRL2(4); -- rv 0
    TXCTRL2_in(5) <= '0' when (TXCTRL2(5) = 'Z') else TXCTRL2(5); -- rv 0
    TXCTRL2_in(6) <= '0' when (TXCTRL2(6) = 'Z') else TXCTRL2(6); -- rv 0
    TXCTRL2_in(7) <= '0' when (TXCTRL2(7) = 'Z') else TXCTRL2(7); -- rv 0
    TXDATAEXTENDRSVD_in(0) <= '0' when (TXDATAEXTENDRSVD(0) = 'Z') else TXDATAEXTENDRSVD(0); -- rv 0
    TXDATAEXTENDRSVD_in(1) <= '0' when (TXDATAEXTENDRSVD(1) = 'Z') else TXDATAEXTENDRSVD(1); -- rv 0
    TXDATAEXTENDRSVD_in(2) <= '0' when (TXDATAEXTENDRSVD(2) = 'Z') else TXDATAEXTENDRSVD(2); -- rv 0
    TXDATAEXTENDRSVD_in(3) <= '0' when (TXDATAEXTENDRSVD(3) = 'Z') else TXDATAEXTENDRSVD(3); -- rv 0
    TXDATAEXTENDRSVD_in(4) <= '0' when (TXDATAEXTENDRSVD(4) = 'Z') else TXDATAEXTENDRSVD(4); -- rv 0
    TXDATAEXTENDRSVD_in(5) <= '0' when (TXDATAEXTENDRSVD(5) = 'Z') else TXDATAEXTENDRSVD(5); -- rv 0
    TXDATAEXTENDRSVD_in(6) <= '0' when (TXDATAEXTENDRSVD(6) = 'Z') else TXDATAEXTENDRSVD(6); -- rv 0
    TXDATAEXTENDRSVD_in(7) <= '0' when (TXDATAEXTENDRSVD(7) = 'Z') else TXDATAEXTENDRSVD(7); -- rv 0
    TXDATA_in(0) <= '0' when (TXDATA(0) = 'Z') else TXDATA(0); -- rv 0
    TXDATA_in(1) <= '0' when (TXDATA(1) = 'Z') else TXDATA(1); -- rv 0
    TXDATA_in(10) <= '0' when (TXDATA(10) = 'Z') else TXDATA(10); -- rv 0
    TXDATA_in(100) <= '0' when (TXDATA(100) = 'Z') else TXDATA(100); -- rv 0
    TXDATA_in(101) <= '0' when (TXDATA(101) = 'Z') else TXDATA(101); -- rv 0
    TXDATA_in(102) <= '0' when (TXDATA(102) = 'Z') else TXDATA(102); -- rv 0
    TXDATA_in(103) <= '0' when (TXDATA(103) = 'Z') else TXDATA(103); -- rv 0
    TXDATA_in(104) <= '0' when (TXDATA(104) = 'Z') else TXDATA(104); -- rv 0
    TXDATA_in(105) <= '0' when (TXDATA(105) = 'Z') else TXDATA(105); -- rv 0
    TXDATA_in(106) <= '0' when (TXDATA(106) = 'Z') else TXDATA(106); -- rv 0
    TXDATA_in(107) <= '0' when (TXDATA(107) = 'Z') else TXDATA(107); -- rv 0
    TXDATA_in(108) <= '0' when (TXDATA(108) = 'Z') else TXDATA(108); -- rv 0
    TXDATA_in(109) <= '0' when (TXDATA(109) = 'Z') else TXDATA(109); -- rv 0
    TXDATA_in(11) <= '0' when (TXDATA(11) = 'Z') else TXDATA(11); -- rv 0
    TXDATA_in(110) <= '0' when (TXDATA(110) = 'Z') else TXDATA(110); -- rv 0
    TXDATA_in(111) <= '0' when (TXDATA(111) = 'Z') else TXDATA(111); -- rv 0
    TXDATA_in(112) <= '0' when (TXDATA(112) = 'Z') else TXDATA(112); -- rv 0
    TXDATA_in(113) <= '0' when (TXDATA(113) = 'Z') else TXDATA(113); -- rv 0
    TXDATA_in(114) <= '0' when (TXDATA(114) = 'Z') else TXDATA(114); -- rv 0
    TXDATA_in(115) <= '0' when (TXDATA(115) = 'Z') else TXDATA(115); -- rv 0
    TXDATA_in(116) <= '0' when (TXDATA(116) = 'Z') else TXDATA(116); -- rv 0
    TXDATA_in(117) <= '0' when (TXDATA(117) = 'Z') else TXDATA(117); -- rv 0
    TXDATA_in(118) <= '0' when (TXDATA(118) = 'Z') else TXDATA(118); -- rv 0
    TXDATA_in(119) <= '0' when (TXDATA(119) = 'Z') else TXDATA(119); -- rv 0
    TXDATA_in(12) <= '0' when (TXDATA(12) = 'Z') else TXDATA(12); -- rv 0
    TXDATA_in(120) <= '0' when (TXDATA(120) = 'Z') else TXDATA(120); -- rv 0
    TXDATA_in(121) <= '0' when (TXDATA(121) = 'Z') else TXDATA(121); -- rv 0
    TXDATA_in(122) <= '0' when (TXDATA(122) = 'Z') else TXDATA(122); -- rv 0
    TXDATA_in(123) <= '0' when (TXDATA(123) = 'Z') else TXDATA(123); -- rv 0
    TXDATA_in(124) <= '0' when (TXDATA(124) = 'Z') else TXDATA(124); -- rv 0
    TXDATA_in(125) <= '0' when (TXDATA(125) = 'Z') else TXDATA(125); -- rv 0
    TXDATA_in(126) <= '0' when (TXDATA(126) = 'Z') else TXDATA(126); -- rv 0
    TXDATA_in(127) <= '0' when (TXDATA(127) = 'Z') else TXDATA(127); -- rv 0
    TXDATA_in(13) <= '0' when (TXDATA(13) = 'Z') else TXDATA(13); -- rv 0
    TXDATA_in(14) <= '0' when (TXDATA(14) = 'Z') else TXDATA(14); -- rv 0
    TXDATA_in(15) <= '0' when (TXDATA(15) = 'Z') else TXDATA(15); -- rv 0
    TXDATA_in(16) <= '0' when (TXDATA(16) = 'Z') else TXDATA(16); -- rv 0
    TXDATA_in(17) <= '0' when (TXDATA(17) = 'Z') else TXDATA(17); -- rv 0
    TXDATA_in(18) <= '0' when (TXDATA(18) = 'Z') else TXDATA(18); -- rv 0
    TXDATA_in(19) <= '0' when (TXDATA(19) = 'Z') else TXDATA(19); -- rv 0
    TXDATA_in(2) <= '0' when (TXDATA(2) = 'Z') else TXDATA(2); -- rv 0
    TXDATA_in(20) <= '0' when (TXDATA(20) = 'Z') else TXDATA(20); -- rv 0
    TXDATA_in(21) <= '0' when (TXDATA(21) = 'Z') else TXDATA(21); -- rv 0
    TXDATA_in(22) <= '0' when (TXDATA(22) = 'Z') else TXDATA(22); -- rv 0
    TXDATA_in(23) <= '0' when (TXDATA(23) = 'Z') else TXDATA(23); -- rv 0
    TXDATA_in(24) <= '0' when (TXDATA(24) = 'Z') else TXDATA(24); -- rv 0
    TXDATA_in(25) <= '0' when (TXDATA(25) = 'Z') else TXDATA(25); -- rv 0
    TXDATA_in(26) <= '0' when (TXDATA(26) = 'Z') else TXDATA(26); -- rv 0
    TXDATA_in(27) <= '0' when (TXDATA(27) = 'Z') else TXDATA(27); -- rv 0
    TXDATA_in(28) <= '0' when (TXDATA(28) = 'Z') else TXDATA(28); -- rv 0
    TXDATA_in(29) <= '0' when (TXDATA(29) = 'Z') else TXDATA(29); -- rv 0
    TXDATA_in(3) <= '0' when (TXDATA(3) = 'Z') else TXDATA(3); -- rv 0
    TXDATA_in(30) <= '0' when (TXDATA(30) = 'Z') else TXDATA(30); -- rv 0
    TXDATA_in(31) <= '0' when (TXDATA(31) = 'Z') else TXDATA(31); -- rv 0
    TXDATA_in(32) <= '0' when (TXDATA(32) = 'Z') else TXDATA(32); -- rv 0
    TXDATA_in(33) <= '0' when (TXDATA(33) = 'Z') else TXDATA(33); -- rv 0
    TXDATA_in(34) <= '0' when (TXDATA(34) = 'Z') else TXDATA(34); -- rv 0
    TXDATA_in(35) <= '0' when (TXDATA(35) = 'Z') else TXDATA(35); -- rv 0
    TXDATA_in(36) <= '0' when (TXDATA(36) = 'Z') else TXDATA(36); -- rv 0
    TXDATA_in(37) <= '0' when (TXDATA(37) = 'Z') else TXDATA(37); -- rv 0
    TXDATA_in(38) <= '0' when (TXDATA(38) = 'Z') else TXDATA(38); -- rv 0
    TXDATA_in(39) <= '0' when (TXDATA(39) = 'Z') else TXDATA(39); -- rv 0
    TXDATA_in(4) <= '0' when (TXDATA(4) = 'Z') else TXDATA(4); -- rv 0
    TXDATA_in(40) <= '0' when (TXDATA(40) = 'Z') else TXDATA(40); -- rv 0
    TXDATA_in(41) <= '0' when (TXDATA(41) = 'Z') else TXDATA(41); -- rv 0
    TXDATA_in(42) <= '0' when (TXDATA(42) = 'Z') else TXDATA(42); -- rv 0
    TXDATA_in(43) <= '0' when (TXDATA(43) = 'Z') else TXDATA(43); -- rv 0
    TXDATA_in(44) <= '0' when (TXDATA(44) = 'Z') else TXDATA(44); -- rv 0
    TXDATA_in(45) <= '0' when (TXDATA(45) = 'Z') else TXDATA(45); -- rv 0
    TXDATA_in(46) <= '0' when (TXDATA(46) = 'Z') else TXDATA(46); -- rv 0
    TXDATA_in(47) <= '0' when (TXDATA(47) = 'Z') else TXDATA(47); -- rv 0
    TXDATA_in(48) <= '0' when (TXDATA(48) = 'Z') else TXDATA(48); -- rv 0
    TXDATA_in(49) <= '0' when (TXDATA(49) = 'Z') else TXDATA(49); -- rv 0
    TXDATA_in(5) <= '0' when (TXDATA(5) = 'Z') else TXDATA(5); -- rv 0
    TXDATA_in(50) <= '0' when (TXDATA(50) = 'Z') else TXDATA(50); -- rv 0
    TXDATA_in(51) <= '0' when (TXDATA(51) = 'Z') else TXDATA(51); -- rv 0
    TXDATA_in(52) <= '0' when (TXDATA(52) = 'Z') else TXDATA(52); -- rv 0
    TXDATA_in(53) <= '0' when (TXDATA(53) = 'Z') else TXDATA(53); -- rv 0
    TXDATA_in(54) <= '0' when (TXDATA(54) = 'Z') else TXDATA(54); -- rv 0
    TXDATA_in(55) <= '0' when (TXDATA(55) = 'Z') else TXDATA(55); -- rv 0
    TXDATA_in(56) <= '0' when (TXDATA(56) = 'Z') else TXDATA(56); -- rv 0
    TXDATA_in(57) <= '0' when (TXDATA(57) = 'Z') else TXDATA(57); -- rv 0
    TXDATA_in(58) <= '0' when (TXDATA(58) = 'Z') else TXDATA(58); -- rv 0
    TXDATA_in(59) <= '0' when (TXDATA(59) = 'Z') else TXDATA(59); -- rv 0
    TXDATA_in(6) <= '0' when (TXDATA(6) = 'Z') else TXDATA(6); -- rv 0
    TXDATA_in(60) <= '0' when (TXDATA(60) = 'Z') else TXDATA(60); -- rv 0
    TXDATA_in(61) <= '0' when (TXDATA(61) = 'Z') else TXDATA(61); -- rv 0
    TXDATA_in(62) <= '0' when (TXDATA(62) = 'Z') else TXDATA(62); -- rv 0
    TXDATA_in(63) <= '0' when (TXDATA(63) = 'Z') else TXDATA(63); -- rv 0
    TXDATA_in(64) <= '0' when (TXDATA(64) = 'Z') else TXDATA(64); -- rv 0
    TXDATA_in(65) <= '0' when (TXDATA(65) = 'Z') else TXDATA(65); -- rv 0
    TXDATA_in(66) <= '0' when (TXDATA(66) = 'Z') else TXDATA(66); -- rv 0
    TXDATA_in(67) <= '0' when (TXDATA(67) = 'Z') else TXDATA(67); -- rv 0
    TXDATA_in(68) <= '0' when (TXDATA(68) = 'Z') else TXDATA(68); -- rv 0
    TXDATA_in(69) <= '0' when (TXDATA(69) = 'Z') else TXDATA(69); -- rv 0
    TXDATA_in(7) <= '0' when (TXDATA(7) = 'Z') else TXDATA(7); -- rv 0
    TXDATA_in(70) <= '0' when (TXDATA(70) = 'Z') else TXDATA(70); -- rv 0
    TXDATA_in(71) <= '0' when (TXDATA(71) = 'Z') else TXDATA(71); -- rv 0
    TXDATA_in(72) <= '0' when (TXDATA(72) = 'Z') else TXDATA(72); -- rv 0
    TXDATA_in(73) <= '0' when (TXDATA(73) = 'Z') else TXDATA(73); -- rv 0
    TXDATA_in(74) <= '0' when (TXDATA(74) = 'Z') else TXDATA(74); -- rv 0
    TXDATA_in(75) <= '0' when (TXDATA(75) = 'Z') else TXDATA(75); -- rv 0
    TXDATA_in(76) <= '0' when (TXDATA(76) = 'Z') else TXDATA(76); -- rv 0
    TXDATA_in(77) <= '0' when (TXDATA(77) = 'Z') else TXDATA(77); -- rv 0
    TXDATA_in(78) <= '0' when (TXDATA(78) = 'Z') else TXDATA(78); -- rv 0
    TXDATA_in(79) <= '0' when (TXDATA(79) = 'Z') else TXDATA(79); -- rv 0
    TXDATA_in(8) <= '0' when (TXDATA(8) = 'Z') else TXDATA(8); -- rv 0
    TXDATA_in(80) <= '0' when (TXDATA(80) = 'Z') else TXDATA(80); -- rv 0
    TXDATA_in(81) <= '0' when (TXDATA(81) = 'Z') else TXDATA(81); -- rv 0
    TXDATA_in(82) <= '0' when (TXDATA(82) = 'Z') else TXDATA(82); -- rv 0
    TXDATA_in(83) <= '0' when (TXDATA(83) = 'Z') else TXDATA(83); -- rv 0
    TXDATA_in(84) <= '0' when (TXDATA(84) = 'Z') else TXDATA(84); -- rv 0
    TXDATA_in(85) <= '0' when (TXDATA(85) = 'Z') else TXDATA(85); -- rv 0
    TXDATA_in(86) <= '0' when (TXDATA(86) = 'Z') else TXDATA(86); -- rv 0
    TXDATA_in(87) <= '0' when (TXDATA(87) = 'Z') else TXDATA(87); -- rv 0
    TXDATA_in(88) <= '0' when (TXDATA(88) = 'Z') else TXDATA(88); -- rv 0
    TXDATA_in(89) <= '0' when (TXDATA(89) = 'Z') else TXDATA(89); -- rv 0
    TXDATA_in(9) <= '0' when (TXDATA(9) = 'Z') else TXDATA(9); -- rv 0
    TXDATA_in(90) <= '0' when (TXDATA(90) = 'Z') else TXDATA(90); -- rv 0
    TXDATA_in(91) <= '0' when (TXDATA(91) = 'Z') else TXDATA(91); -- rv 0
    TXDATA_in(92) <= '0' when (TXDATA(92) = 'Z') else TXDATA(92); -- rv 0
    TXDATA_in(93) <= '0' when (TXDATA(93) = 'Z') else TXDATA(93); -- rv 0
    TXDATA_in(94) <= '0' when (TXDATA(94) = 'Z') else TXDATA(94); -- rv 0
    TXDATA_in(95) <= '0' when (TXDATA(95) = 'Z') else TXDATA(95); -- rv 0
    TXDATA_in(96) <= '0' when (TXDATA(96) = 'Z') else TXDATA(96); -- rv 0
    TXDATA_in(97) <= '0' when (TXDATA(97) = 'Z') else TXDATA(97); -- rv 0
    TXDATA_in(98) <= '0' when (TXDATA(98) = 'Z') else TXDATA(98); -- rv 0
    TXDATA_in(99) <= '0' when (TXDATA(99) = 'Z') else TXDATA(99); -- rv 0
    TXDCCFORCESTART_in <= '0' when (TXDCCFORCESTART = 'Z') else TXDCCFORCESTART; -- rv 0
    TXDCCRESET_in <= '0' when (TXDCCRESET = 'Z') else TXDCCRESET; -- rv 0
    TXDEEMPH_in <= '0' when (TXDEEMPH = 'Z') else TXDEEMPH; -- rv 0
    TXDETECTRX_in <= '0' when (TXDETECTRX = 'Z') else TXDETECTRX; -- rv 0
    TXDIFFCTRL_in(0) <= '0' when (TXDIFFCTRL(0) = 'Z') else TXDIFFCTRL(0); -- rv 0
    TXDIFFCTRL_in(1) <= '0' when (TXDIFFCTRL(1) = 'Z') else TXDIFFCTRL(1); -- rv 0
    TXDIFFCTRL_in(2) <= '0' when (TXDIFFCTRL(2) = 'Z') else TXDIFFCTRL(2); -- rv 0
    TXDIFFCTRL_in(3) <= '0' when (TXDIFFCTRL(3) = 'Z') else TXDIFFCTRL(3); -- rv 0
    TXDIFFCTRL_in(4) <= '0' when (TXDIFFCTRL(4) = 'Z') else TXDIFFCTRL(4); -- rv 0
    TXDIFFPD_in <= '0' when (TXDIFFPD = 'Z') else TXDIFFPD; -- rv 0
    TXDLYBYPASS_in <= '0' when (TXDLYBYPASS = 'Z') else TXDLYBYPASS; -- rv 0
    TXDLYEN_in <= '0' when (TXDLYEN = 'Z') else TXDLYEN; -- rv 0
    TXDLYHOLD_in <= '0' when (TXDLYHOLD = 'Z') else TXDLYHOLD; -- rv 0
    TXDLYOVRDEN_in <= '0' when (TXDLYOVRDEN = 'Z') else TXDLYOVRDEN; -- rv 0
    TXDLYSRESET_in <= '0' when (TXDLYSRESET = 'Z') else TXDLYSRESET; -- rv 0
    TXDLYUPDOWN_in <= '0' when (TXDLYUPDOWN = 'Z') else TXDLYUPDOWN; -- rv 0
    TXELECIDLE_in <= '0' when (TXELECIDLE = 'Z') else TXELECIDLE; -- rv 0
    TXELFORCESTART_in <= '0' when (TXELFORCESTART = 'Z') else TXELFORCESTART; -- rv 0
    TXHEADER_in(0) <= '0' when (TXHEADER(0) = 'Z') else TXHEADER(0); -- rv 0
    TXHEADER_in(1) <= '0' when (TXHEADER(1) = 'Z') else TXHEADER(1); -- rv 0
    TXHEADER_in(2) <= '0' when (TXHEADER(2) = 'Z') else TXHEADER(2); -- rv 0
    TXHEADER_in(3) <= '0' when (TXHEADER(3) = 'Z') else TXHEADER(3); -- rv 0
    TXHEADER_in(4) <= '0' when (TXHEADER(4) = 'Z') else TXHEADER(4); -- rv 0
    TXHEADER_in(5) <= '0' when (TXHEADER(5) = 'Z') else TXHEADER(5); -- rv 0
    TXINHIBIT_in <= '0' when (TXINHIBIT = 'Z') else TXINHIBIT; -- rv 0
    TXLATCLK_in <= '0' when (TXLATCLK = 'Z') else TXLATCLK; -- rv 0
    TXMAINCURSOR_in(0) <= '0' when (TXMAINCURSOR(0) = 'Z') else TXMAINCURSOR(0); -- rv 0
    TXMAINCURSOR_in(1) <= '0' when (TXMAINCURSOR(1) = 'Z') else TXMAINCURSOR(1); -- rv 0
    TXMAINCURSOR_in(2) <= '0' when (TXMAINCURSOR(2) = 'Z') else TXMAINCURSOR(2); -- rv 0
    TXMAINCURSOR_in(3) <= '0' when (TXMAINCURSOR(3) = 'Z') else TXMAINCURSOR(3); -- rv 0
    TXMAINCURSOR_in(4) <= '0' when (TXMAINCURSOR(4) = 'Z') else TXMAINCURSOR(4); -- rv 0
    TXMAINCURSOR_in(5) <= '0' when (TXMAINCURSOR(5) = 'Z') else TXMAINCURSOR(5); -- rv 0
    TXMAINCURSOR_in(6) <= '0' when (TXMAINCURSOR(6) = 'Z') else TXMAINCURSOR(6); -- rv 0
    TXMARGIN_in(0) <= '0' when (TXMARGIN(0) = 'Z') else TXMARGIN(0); -- rv 0
    TXMARGIN_in(1) <= '0' when (TXMARGIN(1) = 'Z') else TXMARGIN(1); -- rv 0
    TXMARGIN_in(2) <= '0' when (TXMARGIN(2) = 'Z') else TXMARGIN(2); -- rv 0
    TXOUTCLKSEL_in(0) <= '0' when (TXOUTCLKSEL(0) = 'Z') else TXOUTCLKSEL(0); -- rv 0
    TXOUTCLKSEL_in(1) <= '0' when (TXOUTCLKSEL(1) = 'Z') else TXOUTCLKSEL(1); -- rv 0
    TXOUTCLKSEL_in(2) <= '0' when (TXOUTCLKSEL(2) = 'Z') else TXOUTCLKSEL(2); -- rv 0
    TXPCSRESET_in <= '0' when (TXPCSRESET = 'Z') else TXPCSRESET; -- rv 0
    TXPDELECIDLEMODE_in <= '0' when (TXPDELECIDLEMODE = 'Z') else TXPDELECIDLEMODE; -- rv 0
    TXPD_in(0) <= '0' when (TXPD(0) = 'Z') else TXPD(0); -- rv 0
    TXPD_in(1) <= '0' when (TXPD(1) = 'Z') else TXPD(1); -- rv 0
    TXPHALIGNEN_in <= '0' when (TXPHALIGNEN = 'Z') else TXPHALIGNEN; -- rv 0
    TXPHALIGN_in <= '0' when (TXPHALIGN = 'Z') else TXPHALIGN; -- rv 0
    TXPHDLYPD_in <= '0' when (TXPHDLYPD = 'Z') else TXPHDLYPD; -- rv 0
    TXPHDLYRESET_in <= '0' when (TXPHDLYRESET = 'Z') else TXPHDLYRESET; -- rv 0
    TXPHDLYTSTCLK_in <= '0' when (TXPHDLYTSTCLK = 'Z') else TXPHDLYTSTCLK; -- rv 0
    TXPHINIT_in <= '0' when (TXPHINIT = 'Z') else TXPHINIT; -- rv 0
    TXPHOVRDEN_in <= '0' when (TXPHOVRDEN = 'Z') else TXPHOVRDEN; -- rv 0
    TXPIPPMEN_in <= '0' when (TXPIPPMEN = 'Z') else TXPIPPMEN; -- rv 0
    TXPIPPMOVRDEN_in <= '0' when (TXPIPPMOVRDEN = 'Z') else TXPIPPMOVRDEN; -- rv 0
    TXPIPPMPD_in <= '0' when (TXPIPPMPD = 'Z') else TXPIPPMPD; -- rv 0
    TXPIPPMSEL_in <= '0' when (TXPIPPMSEL = 'Z') else TXPIPPMSEL; -- rv 0
    TXPIPPMSTEPSIZE_in(0) <= '0' when (TXPIPPMSTEPSIZE(0) = 'Z') else TXPIPPMSTEPSIZE(0); -- rv 0
    TXPIPPMSTEPSIZE_in(1) <= '0' when (TXPIPPMSTEPSIZE(1) = 'Z') else TXPIPPMSTEPSIZE(1); -- rv 0
    TXPIPPMSTEPSIZE_in(2) <= '0' when (TXPIPPMSTEPSIZE(2) = 'Z') else TXPIPPMSTEPSIZE(2); -- rv 0
    TXPIPPMSTEPSIZE_in(3) <= '0' when (TXPIPPMSTEPSIZE(3) = 'Z') else TXPIPPMSTEPSIZE(3); -- rv 0
    TXPIPPMSTEPSIZE_in(4) <= '0' when (TXPIPPMSTEPSIZE(4) = 'Z') else TXPIPPMSTEPSIZE(4); -- rv 0
    TXPISOPD_in <= '0' when (TXPISOPD = 'Z') else TXPISOPD; -- rv 0
    TXPLLCLKSEL_in(0) <= '0' when (TXPLLCLKSEL(0) = 'Z') else TXPLLCLKSEL(0); -- rv 0
    TXPLLCLKSEL_in(1) <= '0' when (TXPLLCLKSEL(1) = 'Z') else TXPLLCLKSEL(1); -- rv 0
    TXPMARESET_in <= '0' when (TXPMARESET = 'Z') else TXPMARESET; -- rv 0
    TXPOLARITY_in <= '0' when (TXPOLARITY = 'Z') else TXPOLARITY; -- rv 0
    TXPOSTCURSOR_in(0) <= '0' when (TXPOSTCURSOR(0) = 'Z') else TXPOSTCURSOR(0); -- rv 0
    TXPOSTCURSOR_in(1) <= '0' when (TXPOSTCURSOR(1) = 'Z') else TXPOSTCURSOR(1); -- rv 0
    TXPOSTCURSOR_in(2) <= '0' when (TXPOSTCURSOR(2) = 'Z') else TXPOSTCURSOR(2); -- rv 0
    TXPOSTCURSOR_in(3) <= '0' when (TXPOSTCURSOR(3) = 'Z') else TXPOSTCURSOR(3); -- rv 0
    TXPOSTCURSOR_in(4) <= '0' when (TXPOSTCURSOR(4) = 'Z') else TXPOSTCURSOR(4); -- rv 0
    TXPRBSFORCEERR_in <= '0' when (TXPRBSFORCEERR = 'Z') else TXPRBSFORCEERR; -- rv 0
    TXPRBSSEL_in(0) <= '0' when (TXPRBSSEL(0) = 'Z') else TXPRBSSEL(0); -- rv 0
    TXPRBSSEL_in(1) <= '0' when (TXPRBSSEL(1) = 'Z') else TXPRBSSEL(1); -- rv 0
    TXPRBSSEL_in(2) <= '0' when (TXPRBSSEL(2) = 'Z') else TXPRBSSEL(2); -- rv 0
    TXPRBSSEL_in(3) <= '0' when (TXPRBSSEL(3) = 'Z') else TXPRBSSEL(3); -- rv 0
    TXPRECURSOR_in(0) <= '0' when (TXPRECURSOR(0) = 'Z') else TXPRECURSOR(0); -- rv 0
    TXPRECURSOR_in(1) <= '0' when (TXPRECURSOR(1) = 'Z') else TXPRECURSOR(1); -- rv 0
    TXPRECURSOR_in(2) <= '0' when (TXPRECURSOR(2) = 'Z') else TXPRECURSOR(2); -- rv 0
    TXPRECURSOR_in(3) <= '0' when (TXPRECURSOR(3) = 'Z') else TXPRECURSOR(3); -- rv 0
    TXPRECURSOR_in(4) <= '0' when (TXPRECURSOR(4) = 'Z') else TXPRECURSOR(4); -- rv 0
    TXPROGDIVRESET_in <= '0' when (TXPROGDIVRESET = 'Z') else TXPROGDIVRESET; -- rv 0
    TXRATEMODE_in <= '0' when (TXRATEMODE = 'Z') else TXRATEMODE; -- rv 0
    TXRATE_in(0) <= '0' when (TXRATE(0) = 'Z') else TXRATE(0); -- rv 0
    TXRATE_in(1) <= '0' when (TXRATE(1) = 'Z') else TXRATE(1); -- rv 0
    TXRATE_in(2) <= '0' when (TXRATE(2) = 'Z') else TXRATE(2); -- rv 0
    TXSEQUENCE_in(0) <= '0' when (TXSEQUENCE(0) = 'Z') else TXSEQUENCE(0); -- rv 0
    TXSEQUENCE_in(1) <= '0' when (TXSEQUENCE(1) = 'Z') else TXSEQUENCE(1); -- rv 0
    TXSEQUENCE_in(2) <= '0' when (TXSEQUENCE(2) = 'Z') else TXSEQUENCE(2); -- rv 0
    TXSEQUENCE_in(3) <= '0' when (TXSEQUENCE(3) = 'Z') else TXSEQUENCE(3); -- rv 0
    TXSEQUENCE_in(4) <= '0' when (TXSEQUENCE(4) = 'Z') else TXSEQUENCE(4); -- rv 0
    TXSEQUENCE_in(5) <= '0' when (TXSEQUENCE(5) = 'Z') else TXSEQUENCE(5); -- rv 0
    TXSEQUENCE_in(6) <= '0' when (TXSEQUENCE(6) = 'Z') else TXSEQUENCE(6); -- rv 0
    TXSWING_in <= '0' when (TXSWING = 'Z') else TXSWING; -- rv 0
    TXSYNCALLIN_in <= '0' when (TXSYNCALLIN = 'Z') else TXSYNCALLIN; -- rv 0
    TXSYNCIN_in <= '0' when (TXSYNCIN = 'Z') else TXSYNCIN; -- rv 0
    TXSYNCMODE_in <= '1' when (TXSYNCMODE = 'Z') else TXSYNCMODE; -- rv 1
    TXSYSCLKSEL_in(0) <= '0' when (TXSYSCLKSEL(0) = 'Z') else TXSYSCLKSEL(0); -- rv 0
    TXSYSCLKSEL_in(1) <= '0' when (TXSYSCLKSEL(1) = 'Z') else TXSYSCLKSEL(1); -- rv 0
    TXUSERRDY_in <= '0' when (TXUSERRDY = 'Z') else TXUSERRDY; -- rv 0
    TXUSRCLK2_in <= '0' when (TXUSRCLK2 = 'Z') else TXUSRCLK2; -- rv 0
    TXUSRCLK_in <= '0' when (TXUSRCLK = 'Z') else TXUSRCLK; -- rv 0
    

    PMASCANCLK0_in <= '1'; -- tie off
    PMASCANCLK1_in <= '1'; -- tie off
    PMASCANCLK2_in <= '1'; -- tie off
    PMASCANCLK3_in <= '1'; -- tie off
    PMASCANCLK4_in <= '1'; -- tie off
    PMASCANCLK5_in <= '1'; -- tie off
    SCANCLK_in <= '1'; -- tie off
    TSTCLK0_in <= '1'; -- tie off
    TSTCLK1_in <= '1'; -- tie off

    PMASCANENB_in <= '1'; -- tie off
    PMASCANIN_in <= "111111111111"; -- tie off
    PMASCANMODEB_in <= '1'; -- tie off
    PMASCANRSTEN_in <= '1'; -- tie off
    SARCCLK_in <= '1'; -- tie off
    SCANENB_in <= '1'; -- tie off
    SCANIN_in <= "1111111111111111111"; -- tie off
    SCANMODEB_in <= '1'; -- tie off
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
    Write ( Message, string'("-131] ALIGN_COMMA_DOUBLE attribute is set to """));
    Write ( Message, string'(ALIGN_COMMA_DOUBLE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-133] ALIGN_COMMA_WORD attribute is set to "));
    Write ( Message, ALIGN_COMMA_WORD);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("2 or "));
    Write ( Message, string'("4. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-134] ALIGN_MCOMMA_DET attribute is set to """));
    Write ( Message, string'(ALIGN_MCOMMA_DET));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-136] ALIGN_PCOMMA_DET attribute is set to """));
    Write ( Message, string'(ALIGN_PCOMMA_DET));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-271] CBCC_DATA_SOURCE_SEL attribute is set to """));
    Write ( Message, string'(CBCC_DATA_SOURCE_SEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DECODED"" or "));
    Write ( Message, string'("""ENCODED"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-273] CHAN_BOND_KEEP_ALIGN attribute is set to """));
    Write ( Message, string'(CHAN_BOND_KEEP_ALIGN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-274] CHAN_BOND_MAX_SKEW attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-285] CHAN_BOND_SEQ_2_USE attribute is set to """));
    Write ( Message, string'(CHAN_BOND_SEQ_2_USE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-286] CHAN_BOND_SEQ_LEN attribute is set to "));
    Write ( Message, CHAN_BOND_SEQ_LEN);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("3 or "));
    Write ( Message, string'("4. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-299] CLK_CORRECT_USE attribute is set to """));
    Write ( Message, string'(CLK_CORRECT_USE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-300] CLK_COR_KEEP_IDLE attribute is set to """));
    Write ( Message, string'(CLK_COR_KEEP_IDLE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- CLK_COR_MAX_LAT check
    if ((CLK_COR_MAX_LAT < 3) or (CLK_COR_MAX_LAT > 60)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-301] CLK_COR_MAX_LAT attribute is set to "));
      Write ( Message, CLK_COR_MAX_LAT);
      Write ( Message, string'(". Legal values for this attribute are 3 to 60. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- CLK_COR_MIN_LAT check
    if ((CLK_COR_MIN_LAT < 3) or (CLK_COR_MIN_LAT > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-302] CLK_COR_MIN_LAT attribute is set to "));
      Write ( Message, CLK_COR_MIN_LAT);
      Write ( Message, string'(". Legal values for this attribute are 3 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-303] CLK_COR_PRECEDENCE attribute is set to """));
    Write ( Message, string'(CLK_COR_PRECEDENCE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- CLK_COR_REPEAT_WAIT check
    if ((CLK_COR_REPEAT_WAIT < 0) or (CLK_COR_REPEAT_WAIT > 31)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-304] CLK_COR_REPEAT_WAIT attribute is set to "));
      Write ( Message, CLK_COR_REPEAT_WAIT);
      Write ( Message, string'(". Legal values for this attribute are 0 to 31. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-315] CLK_COR_SEQ_2_USE attribute is set to """));
    Write ( Message, string'(CLK_COR_SEQ_2_USE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-316] CLK_COR_SEQ_LEN attribute is set to "));
    Write ( Message, CLK_COR_SEQ_LEN);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("3 or "));
    Write ( Message, string'("4. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-321] CPLL_FBDIV attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-322] CPLL_FBDIV_45 attribute is set to "));
    Write ( Message, CPLL_FBDIV_45);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("4 or "));
    Write ( Message, string'("5. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-326] CPLL_REFCLK_DIV attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DDI_REALIGN_WAIT check
    if ((DDI_REALIGN_WAIT < 0) or (DDI_REALIGN_WAIT > 31)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-330] DDI_REALIGN_WAIT attribute is set to "));
      Write ( Message, DDI_REALIGN_WAIT);
      Write ( Message, string'(". Legal values for this attribute are 0 to 31. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-331] DEC_MCOMMA_DETECT attribute is set to """));
    Write ( Message, string'(DEC_MCOMMA_DETECT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-332] DEC_PCOMMA_DETECT attribute is set to """));
    Write ( Message, string'(DEC_PCOMMA_DETECT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-333] DEC_VALID_COMMA_ONLY attribute is set to """));
    Write ( Message, string'(DEC_VALID_COMMA_ONLY));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-340] ES_ERRDET_EN attribute is set to """));
    Write ( Message, string'(ES_ERRDET_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-341] ES_EYE_SCAN_EN attribute is set to """));
    Write ( Message, string'(ES_EYE_SCAN_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-379] FTS_LANE_DESKEW_EN attribute is set to """));
    Write ( Message, string'(FTS_LANE_DESKEW_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-407] PCI3_AUTO_REALIGN attribute is set to """));
    Write ( Message, string'(PCI3_AUTO_REALIGN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FRST_SMPL"", "));
    Write ( Message, string'("""OVR_1K_BLK"", "));
    Write ( Message, string'("""OVR_8_BLK"" or "));
    Write ( Message, string'("""OVR_64_BLK"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-421] PCS_PCIE_EN attribute is set to """));
    Write ( Message, string'(PCS_PCIE_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-431] PREIQ_FREQ_BST attribute is set to "));
    Write ( Message, PREIQ_FREQ_BST);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("2 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-436] RXBUF_ADDR_MODE attribute is set to """));
    Write ( Message, string'(RXBUF_ADDR_MODE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FULL"" or "));
    Write ( Message, string'("""FAST"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-439] RXBUF_EN attribute is set to """));
    Write ( Message, string'(RXBUF_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-440] RXBUF_RESET_ON_CB_CHANGE attribute is set to """));
    Write ( Message, string'(RXBUF_RESET_ON_CB_CHANGE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-441] RXBUF_RESET_ON_COMMAALIGN attribute is set to """));
    Write ( Message, string'(RXBUF_RESET_ON_COMMAALIGN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-442] RXBUF_RESET_ON_EIDLE attribute is set to """));
    Write ( Message, string'(RXBUF_RESET_ON_EIDLE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-443] RXBUF_RESET_ON_RATE_CHANGE attribute is set to """));
    Write ( Message, string'(RXBUF_RESET_ON_RATE_CHANGE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RXBUF_THRESH_OVFLW check
    if ((RXBUF_THRESH_OVFLW < 0) or (RXBUF_THRESH_OVFLW > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-444] RXBUF_THRESH_OVFLW attribute is set to "));
      Write ( Message, RXBUF_THRESH_OVFLW);
      Write ( Message, string'(". Legal values for this attribute are 0 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-445] RXBUF_THRESH_OVRD attribute is set to """));
    Write ( Message, string'(RXBUF_THRESH_OVRD));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RXBUF_THRESH_UNDFLW check
    if ((RXBUF_THRESH_UNDFLW < 0) or (RXBUF_THRESH_UNDFLW > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-446] RXBUF_THRESH_UNDFLW attribute is set to "));
      Write ( Message, RXBUF_THRESH_UNDFLW);
      Write ( Message, string'(". Legal values for this attribute are 0 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-518] RXELECIDLE_CFG attribute is set to """));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-519] RXGBOX_FIFO_INIT_RD_ADDR attribute is set to "));
    Write ( Message, RXGBOX_FIFO_INIT_RD_ADDR);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("4, "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("3 or "));
    Write ( Message, string'("5. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-520] RXGEARBOX_EN attribute is set to """));
    Write ( Message, string'(RXGEARBOX_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-529] RXOOB_CLK_CFG attribute is set to """));
    Write ( Message, string'(RXOOB_CLK_CFG));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""PMA"" or "));
    Write ( Message, string'("""FABRIC"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-531] RXOUT_DIV attribute is set to "));
    Write ( Message, RXOUT_DIV);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("4, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("8, "));
    Write ( Message, string'("16 or "));
    Write ( Message, string'("32. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-546] RXPMACLK_SEL attribute is set to """));
    Write ( Message, string'(RXPMACLK_SEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DATA"", "));
    Write ( Message, string'("""CROSSING"" or "));
    Write ( Message, string'("""EYESCAN"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RXPRBS_LINKACQ_CNT check
    if ((RXPRBS_LINKACQ_CNT < 15) or (RXPRBS_LINKACQ_CNT > 255)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-549] RXPRBS_LINKACQ_CNT attribute is set to "));
      Write ( Message, RXPRBS_LINKACQ_CNT);
      Write ( Message, string'(". Legal values for this attribute are 15 to 255. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-550] RXSLIDE_AUTO_WAIT attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-551] RXSLIDE_MODE attribute is set to """));
    Write ( Message, string'(RXSLIDE_MODE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""OFF"", "));
    Write ( Message, string'("""AUTO"", "));
    Write ( Message, string'("""PCS"" or "));
    Write ( Message, string'("""PMA"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RX_CLK25_DIV check
    if ((RX_CLK25_DIV < 1) or (RX_CLK25_DIV > 32)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-559] RX_CLK25_DIV attribute is set to "));
      Write ( Message, RX_CLK25_DIV);
      Write ( Message, string'(". Legal values for this attribute are 1 to 32. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- RX_CM_SEL check
  if((xil_attr_test) or
     ((RX_CM_SEL /= 3) and 
      (RX_CM_SEL /= 0) and 
      (RX_CM_SEL /= 1) and 
      (RX_CM_SEL /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-564] RX_CM_SEL attribute is set to "));
    Write ( Message, RX_CM_SEL);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("3, "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RX_CM_TRIM check
  if((xil_attr_test) or
     ((RX_CM_TRIM /= 10) and 
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
      (RX_CM_TRIM /= 11) and 
      (RX_CM_TRIM /= 12) and 
      (RX_CM_TRIM /= 13) and 
      (RX_CM_TRIM /= 14) and 
      (RX_CM_TRIM /= 15))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-565] RX_CM_TRIM attribute is set to "));
    Write ( Message, RX_CM_TRIM);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("10, "));
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
    Write ( Message, string'("11, "));
    Write ( Message, string'("12, "));
    Write ( Message, string'("13, "));
    Write ( Message, string'("14 or "));
    Write ( Message, string'("15. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-569] RX_DATA_WIDTH attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-571] RX_DEFER_RESET_BUF_EN attribute is set to """));
    Write ( Message, string'(RX_DEFER_RESET_BUF_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RX_DFELPM_CFG0 check
  if((xil_attr_test) or
     ((RX_DFELPM_CFG0 /= 0) and 
      (RX_DFELPM_CFG0 /= 1) and 
      (RX_DFELPM_CFG0 /= 2) and 
      (RX_DFELPM_CFG0 /= 3) and 
      (RX_DFELPM_CFG0 /= 4) and 
      (RX_DFELPM_CFG0 /= 5) and 
      (RX_DFELPM_CFG0 /= 6) and 
      (RX_DFELPM_CFG0 /= 7))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-573] RX_DFELPM_CFG0 attribute is set to "));
    Write ( Message, RX_DFELPM_CFG0);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("3, "));
    Write ( Message, string'("4, "));
    Write ( Message, string'("5, "));
    Write ( Message, string'("6 or "));
    Write ( Message, string'("7. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RX_DFE_AGC_CFG1 check
  if((xil_attr_test) or
     ((RX_DFE_AGC_CFG1 /= 2) and 
      (RX_DFE_AGC_CFG1 /= 0) and 
      (RX_DFE_AGC_CFG1 /= 1) and 
      (RX_DFE_AGC_CFG1 /= 3) and 
      (RX_DFE_AGC_CFG1 /= 4) and 
      (RX_DFE_AGC_CFG1 /= 5) and 
      (RX_DFE_AGC_CFG1 /= 6) and 
      (RX_DFE_AGC_CFG1 /= 7))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-577] RX_DFE_AGC_CFG1 attribute is set to "));
    Write ( Message, RX_DFE_AGC_CFG1);
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-578] RX_DFE_KL_LPM_KH_CFG0 attribute is set to "));
    Write ( Message, RX_DFE_KL_LPM_KH_CFG0);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("2 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RX_DFE_KL_LPM_KH_CFG1 check
  if((xil_attr_test) or
     ((RX_DFE_KL_LPM_KH_CFG1 /= 2) and 
      (RX_DFE_KL_LPM_KH_CFG1 /= 1) and 
      (RX_DFE_KL_LPM_KH_CFG1 /= 3) and 
      (RX_DFE_KL_LPM_KH_CFG1 /= 4) and 
      (RX_DFE_KL_LPM_KH_CFG1 /= 5) and 
      (RX_DFE_KL_LPM_KH_CFG1 /= 6) and 
      (RX_DFE_KL_LPM_KH_CFG1 /= 7))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-579] RX_DFE_KL_LPM_KH_CFG1 attribute is set to "));
    Write ( Message, RX_DFE_KL_LPM_KH_CFG1);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("3, "));
    Write ( Message, string'("4, "));
    Write ( Message, string'("5, "));
    Write ( Message, string'("6 or "));
    Write ( Message, string'("7. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-583] RX_DISPERR_SEQ_MATCH attribute is set to """));
    Write ( Message, string'(RX_DISPERR_SEQ_MATCH));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-594] RX_INT_DATAWIDTH attribute is set to "));
    Write ( Message, RX_INT_DATAWIDTH);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
      (RX_PROGDIV_CFG /= 100.0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-596] RX_PROGDIV_CFG attribute is set to "));
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
    Write ( Message, string'("80.0 or "));
    Write ( Message, string'("100.0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RX_SIG_VALID_DLY check
    if ((RX_SIG_VALID_DLY < 1) or (RX_SIG_VALID_DLY > 32)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-601] RX_SIG_VALID_DLY attribute is set to "));
      Write ( Message, RX_SIG_VALID_DLY);
      Write ( Message, string'(". Legal values for this attribute are 1 to 32. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-611] RX_XCLK_SEL attribute is set to """));
    Write ( Message, string'(RX_XCLK_SEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""RXDES"", "));
    Write ( Message, string'("""RXPMA"" or "));
    Write ( Message, string'("""RXUSR"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SAS_MAX_COM check
    if ((SAS_MAX_COM < 1) or (SAS_MAX_COM > 127)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-613] SAS_MAX_COM attribute is set to "));
      Write ( Message, SAS_MAX_COM);
      Write ( Message, string'(". Legal values for this attribute are 1 to 127. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SAS_MIN_COM check
    if ((SAS_MIN_COM < 1) or (SAS_MIN_COM > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-614] SAS_MIN_COM attribute is set to "));
      Write ( Message, SAS_MIN_COM);
      Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SATA_CPLL_CFG check
  if((xil_attr_test) or
     ((SATA_CPLL_CFG /= "VCO_3000MHZ") and 
      (SATA_CPLL_CFG /= "VCO_750MHZ") and 
      (SATA_CPLL_CFG /= "VCO_1500MHZ"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-617] SATA_CPLL_CFG attribute is set to """));
    Write ( Message, string'(SATA_CPLL_CFG));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""VCO_3000MHZ"", "));
    Write ( Message, string'("""VCO_750MHZ"" or "));
    Write ( Message, string'("""VCO_1500MHZ"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SATA_MAX_BURST check
    if ((SATA_MAX_BURST < 1) or (SATA_MAX_BURST > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-619] SATA_MAX_BURST attribute is set to "));
      Write ( Message, SATA_MAX_BURST);
      Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SATA_MAX_INIT check
    if ((SATA_MAX_INIT < 1) or (SATA_MAX_INIT > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-620] SATA_MAX_INIT attribute is set to "));
      Write ( Message, SATA_MAX_INIT);
      Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SATA_MAX_WAKE check
    if ((SATA_MAX_WAKE < 1) or (SATA_MAX_WAKE > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-621] SATA_MAX_WAKE attribute is set to "));
      Write ( Message, SATA_MAX_WAKE);
      Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SATA_MIN_BURST check
    if ((SATA_MIN_BURST < 1) or (SATA_MIN_BURST > 61)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-622] SATA_MIN_BURST attribute is set to "));
      Write ( Message, SATA_MIN_BURST);
      Write ( Message, string'(". Legal values for this attribute are 1 to 61. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SATA_MIN_INIT check
    if ((SATA_MIN_INIT < 1) or (SATA_MIN_INIT > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-623] SATA_MIN_INIT attribute is set to "));
      Write ( Message, SATA_MIN_INIT);
      Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- SATA_MIN_WAKE check
    if ((SATA_MIN_WAKE < 1) or (SATA_MIN_WAKE > 63)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-624] SATA_MIN_WAKE attribute is set to "));
      Write ( Message, SATA_MIN_WAKE);
      Write ( Message, string'(". Legal values for this attribute are 1 to 63. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-625] SHOW_REALIGN_COMMA attribute is set to """));
    Write ( Message, string'(SHOW_REALIGN_COMMA));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SIM_MODE check
  if((xil_attr_test) or
     (SIM_MODE /= "FAST")) then 
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-626] SIM_MODE attribute is set to """));
    Write ( Message, string'(SIM_MODE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FAST"", "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-627] SIM_RECEIVER_DETECT_PASS attribute is set to """));
    Write ( Message, string'(SIM_RECEIVER_DETECT_PASS));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-628] SIM_RESET_SPEEDUP attribute is set to """));
    Write ( Message, string'(SIM_RESET_SPEEDUP));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SIM_VERSION check
  if((xil_attr_test) or
     ((SIM_VERSION /= 2) and 
      (SIM_VERSION /= 1) and 
      (SIM_VERSION /= 3))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-630] SIM_VERSION attribute is set to "));
    Write ( Message, SIM_VERSION);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-638] TXBUF_EN attribute is set to """));
    Write ( Message, string'(TXBUF_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-639] TXBUF_RESET_ON_RATE_CHANGE attribute is set to """));
    Write ( Message, string'(TXBUF_RESET_ON_RATE_CHANGE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-642] TXFIFO_ADDR_CFG attribute is set to """));
    Write ( Message, string'(TXFIFO_ADDR_CFG));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""LOW"" or "));
    Write ( Message, string'("""HIGH"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-643] TXGBOX_FIFO_INIT_RD_ADDR attribute is set to "));
    Write ( Message, TXGBOX_FIFO_INIT_RD_ADDR);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("4, "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("3, "));
    Write ( Message, string'("5 or "));
    Write ( Message, string'("6. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-644] TXGEARBOX_EN attribute is set to """));
    Write ( Message, string'(TXGEARBOX_EN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-646] TXOUT_DIV attribute is set to "));
    Write ( Message, TXOUT_DIV);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("4, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("8, "));
    Write ( Message, string'("16 or "));
    Write ( Message, string'("32. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- TXPI_PPMCLK_SEL check
  if((xil_attr_test) or
     ((TXPI_PPMCLK_SEL /= "TXUSRCLK2") and 
      (TXPI_PPMCLK_SEL /= "TXUSRCLK"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-662] TXPI_PPMCLK_SEL attribute is set to """));
    Write ( Message, string'(TXPI_PPMCLK_SEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TXUSRCLK2"" or "));
    Write ( Message, string'("""TXUSRCLK"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- TX_CLK25_DIV check
    if ((TX_CLK25_DIV < 1) or (TX_CLK25_DIV > 32)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-671] TX_CLK25_DIV attribute is set to "));
      Write ( Message, TX_CLK25_DIV);
      Write ( Message, string'(". Legal values for this attribute are 1 to 32. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-675] TX_DATA_WIDTH attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-681] TX_DRIVE_MODE attribute is set to """));
    Write ( Message, string'(TX_DRIVE_MODE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DIRECT"", "));
    Write ( Message, string'("""PIPE"" or "));
    Write ( Message, string'("""PIPEGEN3"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- TX_DRVMUX_CTRL check
  if((xil_attr_test) or
     ((TX_DRVMUX_CTRL /= 2) and 
      (TX_DRVMUX_CTRL /= 0) and 
      (TX_DRVMUX_CTRL /= 1) and 
      (TX_DRVMUX_CTRL /= 3))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-682] TX_DRVMUX_CTRL attribute is set to "));
    Write ( Message, TX_DRVMUX_CTRL);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-689] TX_INT_DATAWIDTH attribute is set to "));
    Write ( Message, TX_INT_DATAWIDTH);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-690] TX_LOOPBACK_DRIVE_HIZ attribute is set to """));
    Write ( Message, string'(TX_LOOPBACK_DRIVE_HIZ));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-706] TX_PI_BIASSET attribute is set to "));
    Write ( Message, TX_PI_BIASSET);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("2 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- TX_PREDRV_CTRL check
  if((xil_attr_test) or
     ((TX_PREDRV_CTRL /= 2) and 
      (TX_PREDRV_CTRL /= 0) and 
      (TX_PREDRV_CTRL /= 1) and 
      (TX_PREDRV_CTRL /= 3))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-714] TX_PREDRV_CTRL attribute is set to "));
    Write ( Message, TX_PREDRV_CTRL);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("0, "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-715] TX_PROGCLK_SEL attribute is set to """));
    Write ( Message, string'(TX_PROGCLK_SEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""POSTPI"", "));
    Write ( Message, string'("""CPLL"" or "));
    Write ( Message, string'("""PREPI"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
      (TX_PROGDIV_CFG /= 100.0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-716] TX_PROGDIV_CFG attribute is set to "));
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
    Write ( Message, string'("80.0 or "));
    Write ( Message, string'("100.0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-719] TX_RXDETECT_REF attribute is set to "));
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
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
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
    Write ( Message, string'("-730] TX_XCLK_SEL attribute is set to """));
    Write ( Message, string'(TX_XCLK_SEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TXOUT"" or "));
    Write ( Message, string'("""TXUSR"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-568] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTYE3_CHANNEL_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    GTYE3_CHANNEL_INST : SIP_GTYE3_CHANNEL
      generic map (
--        SIM_MODE             => SIM_MODE,
        SIM_RECEIVER_DETECT_PASS => SIM_RECEIVER_DETECT_PASS,
        SIM_RESET_SPEEDUP    => SIM_RESET_SPEEDUP,
        SIM_TX_EIDLE_DRIVE_LEVEL => SIM_TX_EIDLE_DRIVE_LEVEL,
        SIM_VERSION          => SIM_VERSION
      )
      port map (
        ACJTAG_DEBUG_MODE    => ACJTAG_DEBUG_MODE_BIN,
        ACJTAG_MODE          => ACJTAG_MODE_BIN,
        ACJTAG_RESET         => ACJTAG_RESET_BIN,
        ADAPT_CFG0           => ADAPT_CFG0_BIN,
        ADAPT_CFG1           => ADAPT_CFG1_BIN,
        ADAPT_CFG2           => ADAPT_CFG2_BIN,
        AEN_CDRSTEPSEL       => AEN_CDRSTEPSEL_BIN,
        AEN_CPLL             => AEN_CPLL_BIN,
        AEN_ELPCAL           => AEN_ELPCAL_BIN,
        AEN_EYESCAN          => AEN_EYESCAN_BIN,
        AEN_LOOPBACK         => AEN_LOOPBACK_BIN,
        AEN_MASTER           => AEN_MASTER_BIN,
        AEN_MUXDCD           => AEN_MUXDCD_BIN,
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
        AUTO_BW_SEL_BYPASS   => AUTO_BW_SEL_BYPASS_BIN,
        A_AFECFOKEN          => A_AFECFOKEN_BIN,
        A_CPLLLOCKEN         => A_CPLLLOCKEN_BIN,
        A_CPLLPD             => A_CPLLPD_BIN,
        A_CPLLRESET          => A_CPLLRESET_BIN,
        A_DFECFOKFCDAC       => A_DFECFOKFCDAC_BIN,
        A_DFECFOKFCNUM       => A_DFECFOKFCNUM_BIN,
        A_DFECFOKFPULSE      => A_DFECFOKFPULSE_BIN,
        A_DFECFOKHOLD        => A_DFECFOKHOLD_BIN,
        A_DFECFOKOVREN       => A_DFECFOKOVREN_BIN,
        A_ELPCALDVORWREN     => A_ELPCALDVORWREN_BIN,
        A_ELPCALPAORWREN     => A_ELPCALPAORWREN_BIN,
        A_EYESCANMODE        => A_EYESCANMODE_BIN,
        A_EYESCANRESET       => A_EYESCANRESET_BIN,
        A_GTRESETSEL         => A_GTRESETSEL_BIN,
        A_GTRXRESET          => A_GTRXRESET_BIN,
        A_GTTXRESET          => A_GTTXRESET_BIN,
        A_LOOPBACK           => A_LOOPBACK_BIN,
        A_LPMGCHOLD          => A_LPMGCHOLD_BIN,
        A_LPMGCOVREN         => A_LPMGCOVREN_BIN,
        A_LPMOSHOLD          => A_LPMOSHOLD_BIN,
        A_LPMOSOVREN         => A_LPMOSOVREN_BIN,
        A_MUXDCDEXHOLD       => A_MUXDCDEXHOLD_BIN,
        A_MUXDCDORWREN       => A_MUXDCDORWREN_BIN,
        A_RXBUFRESET         => A_RXBUFRESET_BIN,
        A_RXCDRFREQRESET     => A_RXCDRFREQRESET_BIN,
        A_RXCDRHOLD          => A_RXCDRHOLD_BIN,
        A_RXCDROVRDEN        => A_RXCDROVRDEN_BIN,
        A_RXCDRRESET         => A_RXCDRRESET_BIN,
        A_RXDFEAGCHOLD       => A_RXDFEAGCHOLD_BIN,
        A_RXDFEAGCOVRDEN     => A_RXDFEAGCOVRDEN_BIN,
        A_RXDFECFOKFEN       => A_RXDFECFOKFEN_BIN,
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
        A_RXDFEVSEN          => A_RXDFEVSEN_BIN,
        A_RXDFEXYDEN         => A_RXDFEXYDEN_BIN,
        A_RXDLYBYPASS        => A_RXDLYBYPASS_BIN,
        A_RXDLYEN            => A_RXDLYEN_BIN,
        A_RXDLYOVRDEN        => A_RXDLYOVRDEN_BIN,
        A_RXDLYSRESET        => A_RXDLYSRESET_BIN,
        A_RXLPMEN            => A_RXLPMEN_BIN,
        A_RXLPMHFHOLD        => A_RXLPMHFHOLD_BIN,
        A_RXLPMHFOVRDEN      => A_RXLPMHFOVRDEN_BIN,
        A_RXLPMLFHOLD        => A_RXLPMLFHOLD_BIN,
        A_RXLPMLFKLOVRDEN    => A_RXLPMLFKLOVRDEN_BIN,
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
        A_RXPHOVRDEN         => A_RXPHOVRDEN_BIN,
        A_RXPLLCLKSEL        => A_RXPLLCLKSEL_BIN,
        A_RXPMARESET         => A_RXPMARESET_BIN,
        A_RXPOLARITY         => A_RXPOLARITY_BIN,
        A_RXPRBSCNTRESET     => A_RXPRBSCNTRESET_BIN,
        A_RXPRBSSEL          => A_RXPRBSSEL_BIN,
        A_RXPROGDIVRESET     => A_RXPROGDIVRESET_BIN,
        A_RXSYSCLKSEL        => A_RXSYSCLKSEL_BIN,
        A_TXBUFDIFFCTRL      => A_TXBUFDIFFCTRL_BIN,
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
        A_TXSWING            => A_TXSWING_BIN,
        A_TXSYSCLKSEL        => A_TXSYSCLKSEL_BIN,
        CAPBYPASS_FORCE      => CAPBYPASS_FORCE_BIN,
        CBCC_DATA_SOURCE_SEL => CBCC_DATA_SOURCE_SEL_BIN,
        CDR_SWAP_MODE_EN     => CDR_SWAP_MODE_EN_BIN,
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
        CKCAL_RSVD0          => CKCAL_RSVD0_BIN,
        CKCAL_RSVD1          => CKCAL_RSVD1_BIN,
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
        CPLL_INIT_CFG1       => CPLL_INIT_CFG1_BIN,
        CPLL_LOCK_CFG        => CPLL_LOCK_CFG_BIN,
        CPLL_REFCLK_DIV      => CPLL_REFCLK_DIV_BIN,
        CTLE3_OCAP_EXT_CTRL  => CTLE3_OCAP_EXT_CTRL_BIN,
        CTLE3_OCAP_EXT_EN    => CTLE3_OCAP_EXT_EN_BIN,
        DDI_CTRL             => DDI_CTRL_BIN,
        DDI_REALIGN_WAIT     => DDI_REALIGN_WAIT_BIN,
        DEC_MCOMMA_DETECT    => DEC_MCOMMA_DETECT_BIN,
        DEC_PCOMMA_DETECT    => DEC_PCOMMA_DETECT_BIN,
        DEC_VALID_COMMA_ONLY => DEC_VALID_COMMA_ONLY_BIN,
        DFE_D_X_REL_POS      => DFE_D_X_REL_POS_BIN,
        DFE_VCM_COMP_EN      => DFE_VCM_COMP_EN_BIN,
        DMONITOR_CFG0        => DMONITOR_CFG0_BIN,
        DMONITOR_CFG1        => DMONITOR_CFG1_BIN,
        ES_CLK_PHASE_SEL     => ES_CLK_PHASE_SEL_BIN,
        ES_CONTROL           => ES_CONTROL_BIN,
        ES_ERRDET_EN         => ES_ERRDET_EN_BIN,
        ES_EYE_SCAN_EN       => ES_EYE_SCAN_EN_BIN,
        ES_HORZ_OFFSET       => ES_HORZ_OFFSET_BIN,
        ES_PMA_CFG           => ES_PMA_CFG_BIN,
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
        EVODD_PHI_CFG        => EVODD_PHI_CFG_BIN,
        EYE_SCAN_SWAP_EN     => EYE_SCAN_SWAP_EN_BIN,
        FTS_DESKEW_SEQ_ENABLE => FTS_DESKEW_SEQ_ENABLE_BIN,
        FTS_LANE_DESKEW_CFG  => FTS_LANE_DESKEW_CFG_BIN,
        FTS_LANE_DESKEW_EN   => FTS_LANE_DESKEW_EN_BIN,
        GEARBOX_MODE         => GEARBOX_MODE_BIN,
        GEN_RXUSRCLK         => GEN_RXUSRCLK_BIN,
        GEN_TXUSRCLK         => GEN_TXUSRCLK_BIN,
        GM_BIAS_SELECT       => GM_BIAS_SELECT_BIN,
        GT_INSTANTIATED      => GT_INSTANTIATED_BIN,
        ISCAN_CK_PH_SEL2     => ISCAN_CK_PH_SEL2_BIN,
        LOCAL_MASTER         => LOCAL_MASTER_BIN,
        LOOP0_CFG            => LOOP0_CFG_BIN,
        LOOP10_CFG           => LOOP10_CFG_BIN,
        LOOP11_CFG           => LOOP11_CFG_BIN,
        LOOP12_CFG           => LOOP12_CFG_BIN,
        LOOP13_CFG           => LOOP13_CFG_BIN,
        LOOP1_CFG            => LOOP1_CFG_BIN,
        LOOP2_CFG            => LOOP2_CFG_BIN,
        LOOP3_CFG            => LOOP3_CFG_BIN,
        LOOP4_CFG            => LOOP4_CFG_BIN,
        LOOP5_CFG            => LOOP5_CFG_BIN,
        LOOP6_CFG            => LOOP6_CFG_BIN,
        LOOP7_CFG            => LOOP7_CFG_BIN,
        LOOP8_CFG            => LOOP8_CFG_BIN,
        LOOP9_CFG            => LOOP9_CFG_BIN,
        LPBK_BIAS_CTRL       => LPBK_BIAS_CTRL_BIN,
        LPBK_EN_RCAL_B       => LPBK_EN_RCAL_B_BIN,
        LPBK_EXT_RCAL        => LPBK_EXT_RCAL_BIN,
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
        PCIE_BUFG_DIV_CTRL   => PCIE_BUFG_DIV_CTRL_BIN,
        PCIE_RXPCS_CFG_GEN3  => PCIE_RXPCS_CFG_GEN3_BIN,
        PCIE_RXPMA_CFG       => PCIE_RXPMA_CFG_BIN,
        PCIE_TXPCS_CFG_GEN3  => PCIE_TXPCS_CFG_GEN3_BIN,
        PCIE_TXPMA_CFG       => PCIE_TXPMA_CFG_BIN,
        PCS_PCIE_EN          => PCS_PCIE_EN_BIN,
        PCS_RSVD0            => PCS_RSVD0_BIN,
        PCS_RSVD1            => PCS_RSVD1_BIN,
        PD_TRANS_TIME_FROM_P2 => PD_TRANS_TIME_FROM_P2_BIN,
        PD_TRANS_TIME_NONE_P2 => PD_TRANS_TIME_NONE_P2_BIN,
        PD_TRANS_TIME_TO_P2  => PD_TRANS_TIME_TO_P2_BIN,
        PLL_SEL_MODE_GEN12   => PLL_SEL_MODE_GEN12_BIN,
        PLL_SEL_MODE_GEN3    => PLL_SEL_MODE_GEN3_BIN,
        PMA_RSV0             => PMA_RSV0_BIN,
        PMA_RSV1             => PMA_RSV1_BIN,
        PREIQ_FREQ_BST       => PREIQ_FREQ_BST_BIN,
        PROCESS_PAR          => PROCESS_PAR_BIN,
        RATE_SW_USE_DRP      => RATE_SW_USE_DRP_BIN,
        RESET_POWERSAVE_DISABLE => RESET_POWERSAVE_DISABLE_BIN,
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
        RXCDR_CFG2_GEN3      => RXCDR_CFG2_GEN3_BIN,
        RXCDR_CFG3           => RXCDR_CFG3_BIN,
        RXCDR_CFG3_GEN3      => RXCDR_CFG3_GEN3_BIN,
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
        RXCDR_PH_RESET_ON_EIDLE => RXCDR_PH_RESET_ON_EIDLE_BIN,
        RXCFOKDONE_SRC       => RXCFOKDONE_SRC_BIN,
        RXCFOK_CFG0          => RXCFOK_CFG0_BIN,
        RXCFOK_CFG1          => RXCFOK_CFG1_BIN,
        RXCFOK_CFG2          => RXCFOK_CFG2_BIN,
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
        RXDFE_OS_CFG0        => RXDFE_OS_CFG0_BIN,
        RXDFE_OS_CFG1        => RXDFE_OS_CFG1_BIN,
        RXDFE_PWR_SAVING     => RXDFE_PWR_SAVING_BIN,
        RXDFE_UT_CFG0        => RXDFE_UT_CFG0_BIN,
        RXDFE_UT_CFG1        => RXDFE_UT_CFG1_BIN,
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
        RXPI_AUTO_BW_SEL_BYPASS => RXPI_AUTO_BW_SEL_BYPASS_BIN,
        RXPI_CFG             => RXPI_CFG_BIN,
        RXPI_LPM             => RXPI_LPM_BIN,
        RXPI_RSV0            => RXPI_RSV0_BIN,
        RXPI_SEL_LC          => RXPI_SEL_LC_BIN,
        RXPI_STARTCODE       => RXPI_STARTCODE_BIN,
        RXPI_VREFSEL         => RXPI_VREFSEL_BIN,
        RXPLL_SEL            => RXPLL_SEL_BIN,
        RXPMACLK_SEL         => RXPMACLK_SEL_BIN,
        RXPMARESET_TIME      => RXPMARESET_TIME_BIN,
        RXPRBS_ERR_LOOPBACK  => RXPRBS_ERR_LOOPBACK_BIN,
        RXPRBS_LINKACQ_CNT   => RXPRBS_LINKACQ_CNT_BIN,
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
        RX_CTLE1_KHKL        => RX_CTLE1_KHKL_BIN,
        RX_CTLE2_KHKL        => RX_CTLE2_KHKL_BIN,
        RX_CTLE3_AGC         => RX_CTLE3_AGC_BIN,
        RX_DATA_WIDTH        => RX_DATA_WIDTH_BIN,
        RX_DDI_SEL           => RX_DDI_SEL_BIN,
        RX_DEFER_RESET_BUF_EN => RX_DEFER_RESET_BUF_EN_BIN,
        RX_DEGEN_CTRL        => RX_DEGEN_CTRL_BIN,
        RX_DFELPM_CFG0       => RX_DFELPM_CFG0_BIN,
        RX_DFELPM_CFG1       => RX_DFELPM_CFG1_BIN,
        RX_DFELPM_KLKH_AGC_STUP_EN => RX_DFELPM_KLKH_AGC_STUP_EN_BIN,
        RX_DFE_AGC_CFG0      => RX_DFE_AGC_CFG0_BIN,
        RX_DFE_AGC_CFG1      => RX_DFE_AGC_CFG1_BIN,
        RX_DFE_KL_LPM_KH_CFG0 => RX_DFE_KL_LPM_KH_CFG0_BIN,
        RX_DFE_KL_LPM_KH_CFG1 => RX_DFE_KL_LPM_KH_CFG1_BIN,
        RX_DFE_KL_LPM_KL_CFG0 => RX_DFE_KL_LPM_KL_CFG0_BIN,
        RX_DFE_KL_LPM_KL_CFG1 => RX_DFE_KL_LPM_KL_CFG1_BIN,
        RX_DFE_LPM_HOLD_DURING_EIDLE => RX_DFE_LPM_HOLD_DURING_EIDLE_BIN,
        RX_DISPERR_SEQ_MATCH => RX_DISPERR_SEQ_MATCH_BIN,
        RX_DIV2_MODE_B       => RX_DIV2_MODE_B_BIN,
        RX_DIVRESET_TIME     => RX_DIVRESET_TIME_BIN,
        RX_EN_CTLE_RCAL_B    => RX_EN_CTLE_RCAL_B_BIN,
        RX_EN_HI_LR          => RX_EN_HI_LR_BIN,
        RX_EXT_RL_CTRL       => RX_EXT_RL_CTRL_BIN,
        RX_EYESCAN_VS_CODE   => RX_EYESCAN_VS_CODE_BIN,
        RX_EYESCAN_VS_NEG_DIR => RX_EYESCAN_VS_NEG_DIR_BIN,
        RX_EYESCAN_VS_RANGE  => RX_EYESCAN_VS_RANGE_BIN,
        RX_EYESCAN_VS_UT_SIGN => RX_EYESCAN_VS_UT_SIGN_BIN,
        RX_FABINT_USRCLK_FLOP => RX_FABINT_USRCLK_FLOP_BIN,
        RX_INT_DATAWIDTH     => RX_INT_DATAWIDTH_BIN,
        RX_PMA_POWER_SAVE    => RX_PMA_POWER_SAVE_BIN,
        RX_PROGDIV_CFG       => RX_PROGDIV_CFG_BIN,
        RX_PROGDIV_RATE      => RX_PROGDIV_RATE_BIN,
        RX_RESLOAD_CTRL      => RX_RESLOAD_CTRL_BIN,
        RX_RESLOAD_OVRD      => RX_RESLOAD_OVRD_BIN,
        RX_SAMPLE_PERIOD     => RX_SAMPLE_PERIOD_BIN,
        RX_SIG_VALID_DLY     => RX_SIG_VALID_DLY_BIN,
        RX_SUM_DFETAPREP_EN  => RX_SUM_DFETAPREP_EN_BIN,
        RX_SUM_IREF_TUNE     => RX_SUM_IREF_TUNE_BIN,
        RX_SUM_VCMTUNE       => RX_SUM_VCMTUNE_BIN,
        RX_SUM_VCM_OVWR      => RX_SUM_VCM_OVWR_BIN,
        RX_SUM_VREF_TUNE     => RX_SUM_VREF_TUNE_BIN,
        RX_TUNE_AFE_OS       => RX_TUNE_AFE_OS_BIN,
        RX_VREG_CTRL         => RX_VREG_CTRL_BIN,
        RX_VREG_PDB          => RX_VREG_PDB_BIN,
        RX_WIDEMODE_CDR      => RX_WIDEMODE_CDR_BIN,
        RX_XCLK_SEL          => RX_XCLK_SEL_BIN,
        RX_XMODE_SEL         => RX_XMODE_SEL_BIN,
        SAS_MAX_COM          => SAS_MAX_COM_BIN,
        SAS_MIN_COM          => SAS_MIN_COM_BIN,
        SATA_BURST_SEQ_LEN   => SATA_BURST_SEQ_LEN_BIN,
        SATA_BURST_VAL       => SATA_BURST_VAL_BIN,
        SATA_CPLL_CFG        => SATA_CPLL_CFG_BIN,
        SATA_EIDLE_VAL       => SATA_EIDLE_VAL_BIN,
        SATA_MAX_BURST       => SATA_MAX_BURST_BIN,
        SATA_MAX_INIT        => SATA_MAX_INIT_BIN,
        SATA_MAX_WAKE        => SATA_MAX_WAKE_BIN,
        SATA_MIN_BURST       => SATA_MIN_BURST_BIN,
        SATA_MIN_INIT        => SATA_MIN_INIT_BIN,
        SATA_MIN_WAKE        => SATA_MIN_WAKE_BIN,
        SHOW_REALIGN_COMMA   => SHOW_REALIGN_COMMA_BIN,
        TAPDLY_SET_TX        => TAPDLY_SET_TX_BIN,
        TEMPERATURE_PAR      => TEMPERATURE_PAR_BIN,
        TERM_RCAL_CFG        => TERM_RCAL_CFG_BIN,
        TERM_RCAL_OVRD       => TERM_RCAL_OVRD_BIN,
        TRANS_TIME_RATE      => TRANS_TIME_RATE_BIN,
        TST_RSV0             => TST_RSV0_BIN,
        TST_RSV1             => TST_RSV1_BIN,
        TXBUF_EN             => TXBUF_EN_BIN,
        TXBUF_RESET_ON_RATE_CHANGE => TXBUF_RESET_ON_RATE_CHANGE_BIN,
        TXDLY_CFG            => TXDLY_CFG_BIN,
        TXDLY_LCFG           => TXDLY_LCFG_BIN,
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
        TXPI_CFG2            => TXPI_CFG2_BIN,
        TXPI_CFG3            => TXPI_CFG3_BIN,
        TXPI_CFG4            => TXPI_CFG4_BIN,
        TXPI_CFG5            => TXPI_CFG5_BIN,
        TXPI_GRAY_SEL        => TXPI_GRAY_SEL_BIN,
        TXPI_INVSTROBE_SEL   => TXPI_INVSTROBE_SEL_BIN,
        TXPI_LPM             => TXPI_LPM_BIN,
        TXPI_PPMCLK_SEL      => TXPI_PPMCLK_SEL_BIN,
        TXPI_PPM_CFG         => TXPI_PPM_CFG_BIN,
        TXPI_RSV0            => TXPI_RSV0_BIN,
        TXPI_SYNFREQ_PPM     => TXPI_SYNFREQ_PPM_BIN,
        TXPI_VREFSEL         => TXPI_VREFSEL_BIN,
        TXPMARESET_TIME      => TXPMARESET_TIME_BIN,
        TXSYNC_MULTILANE     => TXSYNC_MULTILANE_BIN,
        TXSYNC_OVRD          => TXSYNC_OVRD_BIN,
        TXSYNC_SKIP_DA       => TXSYNC_SKIP_DA_BIN,
        TX_CLK25_DIV         => TX_CLK25_DIV_BIN,
        TX_CLKMUX_EN         => TX_CLKMUX_EN_BIN,
        TX_CLKREG_PDB        => TX_CLKREG_PDB_BIN,
        TX_CLKREG_SET        => TX_CLKREG_SET_BIN,
        TX_DATA_WIDTH        => TX_DATA_WIDTH_BIN,
        TX_DCD_CFG           => TX_DCD_CFG_BIN,
        TX_DCD_EN            => TX_DCD_EN_BIN,
        TX_DEEMPH0           => TX_DEEMPH0_BIN,
        TX_DEEMPH1           => TX_DEEMPH1_BIN,
        TX_DIVRESET_TIME     => TX_DIVRESET_TIME_BIN,
        TX_DRIVE_MODE        => TX_DRIVE_MODE_BIN,
        TX_DRVMUX_CTRL       => TX_DRVMUX_CTRL_BIN,
        TX_EIDLE_ASSERT_DELAY => TX_EIDLE_ASSERT_DELAY_BIN,
        TX_EIDLE_DEASSERT_DELAY => TX_EIDLE_DEASSERT_DELAY_BIN,
        TX_EML_PHI_TUNE      => TX_EML_PHI_TUNE_BIN,
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
        TX_MODE_SEL          => TX_MODE_SEL_BIN,
        TX_PHICAL_CFG0       => TX_PHICAL_CFG0_BIN,
        TX_PHICAL_CFG1       => TX_PHICAL_CFG1_BIN,
        TX_PHICAL_CFG2       => TX_PHICAL_CFG2_BIN,
        TX_PI_BIASSET        => TX_PI_BIASSET_BIN,
        TX_PI_CFG0           => TX_PI_CFG0_BIN,
        TX_PI_CFG1           => TX_PI_CFG1_BIN,
        TX_PI_DIV2_MODE_B    => TX_PI_DIV2_MODE_B_BIN,
        TX_PI_SEL_QPLL0      => TX_PI_SEL_QPLL0_BIN,
        TX_PI_SEL_QPLL1      => TX_PI_SEL_QPLL1_BIN,
        TX_PMADATA_OPT       => TX_PMADATA_OPT_BIN,
        TX_PMA_POWER_SAVE    => TX_PMA_POWER_SAVE_BIN,
        TX_PREDRV_CTRL       => TX_PREDRV_CTRL_BIN,
        TX_PROGCLK_SEL       => TX_PROGCLK_SEL_BIN,
        TX_PROGDIV_CFG       => TX_PROGDIV_CFG_BIN,
        TX_PROGDIV_RATE      => TX_PROGDIV_RATE_BIN,
        TX_RXDETECT_CFG      => TX_RXDETECT_CFG_BIN,
        TX_RXDETECT_REF      => TX_RXDETECT_REF_BIN,
        TX_SAMPLE_PERIOD     => TX_SAMPLE_PERIOD_BIN,
        TX_SARC_LPBK_ENB     => TX_SARC_LPBK_ENB_BIN,
        TX_USERPATTERN_DATA0 => TX_USERPATTERN_DATA0_BIN,
        TX_USERPATTERN_DATA1 => TX_USERPATTERN_DATA1_BIN,
        TX_USERPATTERN_DATA2 => TX_USERPATTERN_DATA2_BIN,
        TX_USERPATTERN_DATA3 => TX_USERPATTERN_DATA3_BIN,
        TX_USERPATTERN_DATA4 => TX_USERPATTERN_DATA4_BIN,
        TX_USERPATTERN_DATA5 => TX_USERPATTERN_DATA5_BIN,
        TX_USERPATTERN_DATA6 => TX_USERPATTERN_DATA6_BIN,
        TX_USERPATTERN_DATA7 => TX_USERPATTERN_DATA7_BIN,
        TX_XCLK_SEL          => TX_XCLK_SEL_BIN,
        USE_PCS_CLK_PHASE_SEL => USE_PCS_CLK_PHASE_SEL_BIN,
        BUFGTCE              => BUFGTCE_out,
        BUFGTCEMASK          => BUFGTCEMASK_out,
        BUFGTDIV             => BUFGTDIV_out,
        BUFGTRESET           => BUFGTRESET_out,
        BUFGTRSTMASK         => BUFGTRSTMASK_out,
        CPLLFBCLKLOST        => CPLLFBCLKLOST_out,
        CPLLLOCK             => CPLLLOCK_out,
        CPLLREFCLKLOST       => CPLLREFCLKLOST_out,
        DMONITOROUT          => DMONITOROUT_out,
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
        CDRSTEPDIR           => CDRSTEPDIR_in,
        CDRSTEPSQ            => CDRSTEPSQ_in,
        CDRSTEPSX            => CDRSTEPSX_in,
        CFGRESET             => CFGRESET_in,
        CLKRSVD0             => CLKRSVD0_in,
        CLKRSVD1             => CLKRSVD1_in,
        CPLLLOCKDETCLK       => CPLLLOCKDETCLK_in,
        CPLLLOCKEN           => CPLLLOCKEN_in,
        CPLLPD               => CPLLPD_in,
        CPLLREFCLKSEL        => CPLLREFCLKSEL_in,
        CPLLRESET            => CPLLRESET_in,
        DMONFIFORESET        => DMONFIFORESET_in,
        DMONITORCLK          => DMONITORCLK_in,
        DRPADDR              => DRPADDR_in,
        DRPCLK               => DRPCLK_in,
        DRPDI                => DRPDI_in,
        DRPEN                => DRPEN_in,
        DRPWE                => DRPWE_in,
        ELPCALDVORWREN       => ELPCALDVORWREN_in,
        ELPCALPAORWREN       => ELPCALPAORWREN_in,
        EVODDPHICALDONE      => EVODDPHICALDONE_in,
        EVODDPHICALSTART     => EVODDPHICALSTART_in,
        EVODDPHIDRDEN        => EVODDPHIDRDEN_in,
        EVODDPHIDWREN        => EVODDPHIDWREN_in,
        EVODDPHIXRDEN        => EVODDPHIXRDEN_in,
        EVODDPHIXWREN        => EVODDPHIXWREN_in,
        EYESCANMODE          => EYESCANMODE_in,
        EYESCANRESET         => EYESCANRESET_in,
        EYESCANTRIGGER       => EYESCANTRIGGER_in,
        GTGREFCLK            => GTGREFCLK_in,
        GTNORTHREFCLK0       => GTNORTHREFCLK0_in,
        GTNORTHREFCLK1       => GTNORTHREFCLK1_in,
        GTREFCLK0            => GTREFCLK0_in,
        GTREFCLK1            => GTREFCLK1_in,
        GTRESETSEL           => GTRESETSEL_in,
        GTRSVD               => GTRSVD_in,
        GTRXRESET            => GTRXRESET_in,
        GTSOUTHREFCLK0       => GTSOUTHREFCLK0_in,
        GTSOUTHREFCLK1       => GTSOUTHREFCLK1_in,
        GTTXRESET            => GTTXRESET_in,
        GTYRXN               => GTYRXN_in,
        GTYRXP               => GTYRXP_in,
        LOOPBACK             => LOOPBACK_in,
        LOOPRSVD             => LOOPRSVD_in,
        LPBKRXTXSEREN        => LPBKRXTXSEREN_in,
        LPBKTXRXSEREN        => LPBKTXRXSEREN_in,
        PCIEEQRXEQADAPTDONE  => PCIEEQRXEQADAPTDONE_in,
        PCIERSTIDLE          => PCIERSTIDLE_in,
        PCIERSTTXSYNCSTART   => PCIERSTTXSYNCSTART_in,
        PCIEUSERRATEDONE     => PCIEUSERRATEDONE_in,
        PCSRSVDIN            => PCSRSVDIN_in,
        PCSRSVDIN2           => PCSRSVDIN2_in,
        PMARSVDIN            => PMARSVDIN_in,
        PMASCANCLK0          => PMASCANCLK0_in,
        PMASCANCLK1          => PMASCANCLK1_in,
        PMASCANCLK2          => PMASCANCLK2_in,
        PMASCANCLK3          => PMASCANCLK3_in,
        PMASCANCLK4          => PMASCANCLK4_in,
        PMASCANCLK5          => PMASCANCLK5_in,
        PMASCANENB           => PMASCANENB_in,
        PMASCANIN            => PMASCANIN_in,
        PMASCANMODEB         => PMASCANMODEB_in,
        PMASCANRSTEN         => PMASCANRSTEN_in,
        QPLL0CLK             => QPLL0CLK_in,
        QPLL0REFCLK          => QPLL0REFCLK_in,
        QPLL1CLK             => QPLL1CLK_in,
        QPLL1REFCLK          => QPLL1REFCLK_in,
        RESETOVRD            => RESETOVRD_in,
        RSTCLKENTX           => RSTCLKENTX_in,
        RX8B10BEN            => RX8B10BEN_in,
        RXBUFRESET           => RXBUFRESET_in,
        RXCDRFREQRESET       => RXCDRFREQRESET_in,
        RXCDRHOLD            => RXCDRHOLD_in,
        RXCDROVRDEN          => RXCDROVRDEN_in,
        RXCDRRESET           => RXCDRRESET_in,
        RXCDRRESETRSV        => RXCDRRESETRSV_in,
        RXCHBONDEN           => RXCHBONDEN_in,
        RXCHBONDI            => RXCHBONDI_in,
        RXCHBONDLEVEL        => RXCHBONDLEVEL_in,
        RXCHBONDMASTER       => RXCHBONDMASTER_in,
        RXCHBONDSLAVE        => RXCHBONDSLAVE_in,
        RXCKCALRESET         => RXCKCALRESET_in,
        RXCOMMADETEN         => RXCOMMADETEN_in,
        RXDCCFORCESTART      => RXDCCFORCESTART_in,
        RXDFEAGCHOLD         => RXDFEAGCHOLD_in,
        RXDFEAGCOVRDEN       => RXDFEAGCOVRDEN_in,
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
        RXDFEVSEN            => RXDFEVSEN_in,
        RXDFEXYDEN           => RXDFEXYDEN_in,
        RXDLYBYPASS          => RXDLYBYPASS_in,
        RXDLYEN              => RXDLYEN_in,
        RXDLYOVRDEN          => RXDLYOVRDEN_in,
        RXDLYSRESET          => RXDLYSRESET_in,
        RXELECIDLEMODE       => RXELECIDLEMODE_in,
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
        RXOSINTCFG           => RXOSINTCFG_in,
        RXOSINTEN            => RXOSINTEN_in,
        RXOSINTHOLD          => RXOSINTHOLD_in,
        RXOSINTOVRDEN        => RXOSINTOVRDEN_in,
        RXOSINTSTROBE        => RXOSINTSTROBE_in,
        RXOSINTTESTOVRDEN    => RXOSINTTESTOVRDEN_in,
        RXOSOVRDEN           => RXOSOVRDEN_in,
        RXOUTCLKSEL          => RXOUTCLKSEL_in,
        RXPCOMMAALIGNEN      => RXPCOMMAALIGNEN_in,
        RXPCSRESET           => RXPCSRESET_in,
        RXPD                 => RXPD_in,
        RXPHALIGN            => RXPHALIGN_in,
        RXPHALIGNEN          => RXPHALIGNEN_in,
        RXPHDLYPD            => RXPHDLYPD_in,
        RXPHDLYRESET         => RXPHDLYRESET_in,
        RXPHOVRDEN           => RXPHOVRDEN_in,
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
        RXUSERRDY            => RXUSERRDY_in,
        RXUSRCLK             => RXUSRCLK_in,
        RXUSRCLK2            => RXUSRCLK2_in,
        SARCCLK              => SARCCLK_in,
        SCANCLK              => SCANCLK_in,
        SCANENB              => SCANENB_in,
        SCANIN               => SCANIN_in,
        SCANMODEB            => SCANMODEB_in,
        SIGVALIDCLK          => SIGVALIDCLK_in,
        TSTCLK0              => TSTCLK0_in,
        TSTCLK1              => TSTCLK1_in,
        TSTIN                => TSTIN_in,
        TSTPD                => TSTPD_in,
        TSTPDOVRDB           => TSTPDOVRDB_in,
        TX8B10BBYPASS        => TX8B10BBYPASS_in,
        TX8B10BEN            => TX8B10BEN_in,
        TXBUFDIFFCTRL        => TXBUFDIFFCTRL_in,
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
        TXDIFFPD             => TXDIFFPD_in,
        TXDLYBYPASS          => TXDLYBYPASS_in,
        TXDLYEN              => TXDLYEN_in,
        TXDLYHOLD            => TXDLYHOLD_in,
        TXDLYOVRDEN          => TXDLYOVRDEN_in,
        TXDLYSRESET          => TXDLYSRESET_in,
        TXDLYUPDOWN          => TXDLYUPDOWN_in,
        TXELECIDLE           => TXELECIDLE_in,
        TXELFORCESTART       => TXELFORCESTART_in,
        TXHEADER             => TXHEADER_in,
        TXINHIBIT            => TXINHIBIT_in,
        TXLATCLK             => TXLATCLK_in,
        TXMAINCURSOR         => TXMAINCURSOR_in,
        TXMARGIN             => TXMARGIN_in,
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
  end GTYE3_CHANNEL_V;
