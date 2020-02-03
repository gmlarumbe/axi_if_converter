-----------------------------------------------------------------------------
--  Copyright (c) 2013 Xilinx Inc.
--  All Right Reserved.
-----------------------------------------------------------------------------
--
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2012.2 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      
-- /___/   /\      Filename    : PCIE_3_1.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-----------------------------------------------------------------------------
--  Revision:
--
--  End Revision:
-----------------------------------------------------------------------------

----- CELL PCIE_3_1 -----

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

entity PCIE_3_1 is
  generic (
    ARI_CAP_ENABLE : string := "FALSE";
    AXISTEN_IF_CC_ALIGNMENT_MODE : string := "FALSE";
    AXISTEN_IF_CC_PARITY_CHK : string := "TRUE";
    AXISTEN_IF_CQ_ALIGNMENT_MODE : string := "FALSE";
    AXISTEN_IF_ENABLE_CLIENT_TAG : string := "FALSE";
    AXISTEN_IF_ENABLE_MSG_ROUTE : std_logic_vector(17 downto 0) := "00" & X"0000";
    AXISTEN_IF_ENABLE_RX_MSG_INTFC : string := "FALSE";
    AXISTEN_IF_RC_ALIGNMENT_MODE : string := "FALSE";
    AXISTEN_IF_RC_STRADDLE : string := "FALSE";
    AXISTEN_IF_RQ_ALIGNMENT_MODE : string := "FALSE";
    AXISTEN_IF_RQ_PARITY_CHK : string := "TRUE";
    AXISTEN_IF_WIDTH : std_logic_vector(1 downto 0) := "10";
    CRM_CORE_CLK_FREQ_500 : string := "TRUE";
    CRM_USER_CLK_FREQ : std_logic_vector(1 downto 0) := "10";
    DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE : string := "FALSE";
    DEBUG_PL_DISABLE_EI_INFER_IN_L0 : string := "FALSE";
    DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS : string := "FALSE";
    DNSTREAM_LINK_NUM : std_logic_vector(7 downto 0) := X"00";
    LL_ACK_TIMEOUT : std_logic_vector(8 downto 0) := "0" & X"00";
    LL_ACK_TIMEOUT_EN : string := "FALSE";
    LL_ACK_TIMEOUT_FUNC : integer := 0;
    LL_CPL_FC_UPDATE_TIMER : std_logic_vector(15 downto 0) := X"0000";
    LL_CPL_FC_UPDATE_TIMER_OVERRIDE : string := "FALSE";
    LL_FC_UPDATE_TIMER : std_logic_vector(15 downto 0) := X"0000";
    LL_FC_UPDATE_TIMER_OVERRIDE : string := "FALSE";
    LL_NP_FC_UPDATE_TIMER : std_logic_vector(15 downto 0) := X"0000";
    LL_NP_FC_UPDATE_TIMER_OVERRIDE : string := "FALSE";
    LL_P_FC_UPDATE_TIMER : std_logic_vector(15 downto 0) := X"0000";
    LL_P_FC_UPDATE_TIMER_OVERRIDE : string := "FALSE";
    LL_REPLAY_TIMEOUT : std_logic_vector(8 downto 0) := "0" & X"00";
    LL_REPLAY_TIMEOUT_EN : string := "FALSE";
    LL_REPLAY_TIMEOUT_FUNC : integer := 0;
    LTR_TX_MESSAGE_MINIMUM_INTERVAL : std_logic_vector(9 downto 0) := "00" & X"FA";
    LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE : string := "FALSE";
    LTR_TX_MESSAGE_ON_LTR_ENABLE : string := "FALSE";
    MCAP_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    MCAP_CONFIGURE_OVERRIDE : string := "FALSE";
    MCAP_ENABLE : string := "FALSE";
    MCAP_EOS_DESIGN_SWITCH : string := "FALSE";
    MCAP_FPGA_BITSTREAM_VERSION : std_logic_vector(31 downto 0) := X"00000000";
    MCAP_GATE_IO_ENABLE_DESIGN_SWITCH : string := "FALSE";
    MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH : string := "FALSE";
    MCAP_INPUT_GATE_DESIGN_SWITCH : string := "FALSE";
    MCAP_INTERRUPT_ON_MCAP_EOS : string := "FALSE";
    MCAP_INTERRUPT_ON_MCAP_ERROR : string := "FALSE";
    MCAP_VSEC_ID : std_logic_vector(15 downto 0) := X"0000";
    MCAP_VSEC_LEN : std_logic_vector(11 downto 0) := X"02C";
    MCAP_VSEC_REV : std_logic_vector(3 downto 0) := X"0";
    PF0_AER_CAP_ECRC_CHECK_CAPABLE : string := "FALSE";
    PF0_AER_CAP_ECRC_GEN_CAPABLE : string := "FALSE";
    PF0_AER_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_ARI_CAP_NEXT_FUNC : std_logic_vector(7 downto 0) := X"00";
    PF0_ARI_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_BAR0_APERTURE_SIZE : std_logic_vector(5 downto 0) := "11" & X"3";
    PF0_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF0_BAR1_APERTURE_SIZE : std_logic_vector(5 downto 0) := "00" & X"0";
    PF0_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF0_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF0_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF0_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF0_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF0_BIST_REGISTER : std_logic_vector(7 downto 0) := X"00";
    PF0_CAPABILITY_POINTER : std_logic_vector(7 downto 0) := X"50";
    PF0_CLASS_CODE : std_logic_vector(23 downto 0) := X"000000";
    PF0_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT : string := "TRUE";
    PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT : string := "TRUE";
    PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT : string := "TRUE";
    PF0_DEV_CAP2_ARI_FORWARD_ENABLE : string := "FALSE";
    PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE : string := "TRUE";
    PF0_DEV_CAP2_LTR_SUPPORT : string := "TRUE";
    PF0_DEV_CAP2_OBFF_SUPPORT : std_logic_vector(1 downto 0) := "00";
    PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT : string := "FALSE";
    PF0_DEV_CAP_ENDPOINT_L0S_LATENCY : integer := 0;
    PF0_DEV_CAP_ENDPOINT_L1_LATENCY : integer := 0;
    PF0_DEV_CAP_EXT_TAG_SUPPORTED : string := "TRUE";
    PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE : string := "TRUE";
    PF0_DEV_CAP_MAX_PAYLOAD_SIZE : std_logic_vector(2 downto 0) := "011";
    PF0_DPA_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_DPA_CAP_SUB_STATE_CONTROL : std_logic_vector(4 downto 0) := "0" & X"0";
    PF0_DPA_CAP_SUB_STATE_CONTROL_EN : string := "TRUE";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : std_logic_vector(7 downto 0) := X"00";
    PF0_DPA_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_DSN_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"10C";
    PF0_EXPANSION_ROM_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_EXPANSION_ROM_ENABLE : string := "FALSE";
    PF0_INTERRUPT_LINE : std_logic_vector(7 downto 0) := X"00";
    PF0_INTERRUPT_PIN : std_logic_vector(2 downto 0) := "001";
    PF0_LINK_CAP_ASPM_SUPPORT : integer := 0;
    PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 : integer := 7;
    PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 : integer := 7;
    PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3 : integer := 7;
    PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1 : integer := 7;
    PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2 : integer := 7;
    PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3 : integer := 7;
    PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 : integer := 7;
    PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 : integer := 7;
    PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3 : integer := 7;
    PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1 : integer := 7;
    PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2 : integer := 7;
    PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3 : integer := 7;
    PF0_LINK_STATUS_SLOT_CLOCK_CONFIG : string := "TRUE";
    PF0_LTR_CAP_MAX_NOSNOOP_LAT : std_logic_vector(9 downto 0) := "00" & X"00";
    PF0_LTR_CAP_MAX_SNOOP_LAT : std_logic_vector(9 downto 0) := "00" & X"00";
    PF0_LTR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_LTR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_MSIX_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF0_MSIX_CAP_PBA_BIR : integer := 0;
    PF0_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    PF0_MSIX_CAP_TABLE_BIR : integer := 0;
    PF0_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    PF0_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF0_MSI_CAP_MULTIMSGCAP : integer := 0;
    PF0_MSI_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF0_MSI_CAP_PERVECMASKCAP : string := "FALSE";
    PF0_PB_CAP_DATA_REG_D0 : std_logic_vector(31 downto 0) := X"00000000";
    PF0_PB_CAP_DATA_REG_D0_SUSTAINED : std_logic_vector(31 downto 0) := X"00000000";
    PF0_PB_CAP_DATA_REG_D1 : std_logic_vector(31 downto 0) := X"00000000";
    PF0_PB_CAP_DATA_REG_D3HOT : std_logic_vector(31 downto 0) := X"00000000";
    PF0_PB_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_PB_CAP_SYSTEM_ALLOCATED : string := "FALSE";
    PF0_PB_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    PF0_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF0_PM_CAP_PMESUPPORT_D0 : string := "TRUE";
    PF0_PM_CAP_PMESUPPORT_D1 : string := "TRUE";
    PF0_PM_CAP_PMESUPPORT_D3HOT : string := "TRUE";
    PF0_PM_CAP_SUPP_D1_STATE : string := "TRUE";
    PF0_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    PF0_PM_CSR_NOSOFTRESET : string := "TRUE";
    PF0_RBAR_CAP_ENABLE : string := "FALSE";
    PF0_RBAR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_RBAR_CAP_SIZE0 : std_logic_vector(19 downto 0) := X"00000";
    PF0_RBAR_CAP_SIZE1 : std_logic_vector(19 downto 0) := X"00000";
    PF0_RBAR_CAP_SIZE2 : std_logic_vector(19 downto 0) := X"00000";
    PF0_RBAR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_RBAR_CONTROL_INDEX0 : std_logic_vector(2 downto 0) := "000";
    PF0_RBAR_CONTROL_INDEX1 : std_logic_vector(2 downto 0) := "000";
    PF0_RBAR_CONTROL_INDEX2 : std_logic_vector(2 downto 0) := "000";
    PF0_RBAR_CONTROL_SIZE0 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF0_RBAR_CONTROL_SIZE1 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF0_RBAR_CONTROL_SIZE2 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF0_RBAR_NUM : std_logic_vector(2 downto 0) := "001";
    PF0_REVISION_ID : std_logic_vector(7 downto 0) := X"00";
    PF0_SECONDARY_PCIE_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_SRIOV_BAR0_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_SRIOV_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF0_SRIOV_BAR1_APERTURE_SIZE : std_logic_vector(4 downto 0) := "0" & X"0";
    PF0_SRIOV_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF0_SRIOV_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_SRIOV_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF0_SRIOV_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_SRIOV_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF0_SRIOV_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_SRIOV_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF0_SRIOV_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF0_SRIOV_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF0_SRIOV_CAP_INITIAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF0_SRIOV_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_SRIOV_CAP_TOTAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF0_SRIOV_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_SRIOV_FIRST_VF_OFFSET : std_logic_vector(15 downto 0) := X"0000";
    PF0_SRIOV_FUNC_DEP_LINK : std_logic_vector(15 downto 0) := X"0000";
    PF0_SRIOV_SUPPORTED_PAGE_SIZE : std_logic_vector(31 downto 0) := X"00000000";
    PF0_SRIOV_VF_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF0_SUBSYSTEM_ID : std_logic_vector(15 downto 0) := X"0000";
    PF0_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    PF0_TPHR_CAP_ENABLE : string := "FALSE";
    PF0_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    PF0_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    PF0_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    PF0_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF0_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF0_VC_CAP_ENABLE : string := "FALSE";
    PF0_VC_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF0_VC_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF1_AER_CAP_ECRC_CHECK_CAPABLE : string := "FALSE";
    PF1_AER_CAP_ECRC_GEN_CAPABLE : string := "FALSE";
    PF1_AER_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_ARI_CAP_NEXT_FUNC : std_logic_vector(7 downto 0) := X"00";
    PF1_BAR0_APERTURE_SIZE : std_logic_vector(5 downto 0) := "11" & X"3";
    PF1_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF1_BAR1_APERTURE_SIZE : std_logic_vector(5 downto 0) := "00" & X"0";
    PF1_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF1_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF1_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF1_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF1_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF1_BIST_REGISTER : std_logic_vector(7 downto 0) := X"00";
    PF1_CAPABILITY_POINTER : std_logic_vector(7 downto 0) := X"50";
    PF1_CLASS_CODE : std_logic_vector(23 downto 0) := X"000000";
    PF1_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF1_DEV_CAP_MAX_PAYLOAD_SIZE : std_logic_vector(2 downto 0) := "011";
    PF1_DPA_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_DPA_CAP_SUB_STATE_CONTROL : std_logic_vector(4 downto 0) := "0" & X"0";
    PF1_DPA_CAP_SUB_STATE_CONTROL_EN : string := "TRUE";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : std_logic_vector(7 downto 0) := X"00";
    PF1_DPA_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF1_DSN_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"10C";
    PF1_EXPANSION_ROM_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_EXPANSION_ROM_ENABLE : string := "FALSE";
    PF1_INTERRUPT_LINE : std_logic_vector(7 downto 0) := X"00";
    PF1_INTERRUPT_PIN : std_logic_vector(2 downto 0) := "001";
    PF1_MSIX_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF1_MSIX_CAP_PBA_BIR : integer := 0;
    PF1_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    PF1_MSIX_CAP_TABLE_BIR : integer := 0;
    PF1_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    PF1_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF1_MSI_CAP_MULTIMSGCAP : integer := 0;
    PF1_MSI_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF1_MSI_CAP_PERVECMASKCAP : string := "FALSE";
    PF1_PB_CAP_DATA_REG_D0 : std_logic_vector(31 downto 0) := X"00000000";
    PF1_PB_CAP_DATA_REG_D0_SUSTAINED : std_logic_vector(31 downto 0) := X"00000000";
    PF1_PB_CAP_DATA_REG_D1 : std_logic_vector(31 downto 0) := X"00000000";
    PF1_PB_CAP_DATA_REG_D3HOT : std_logic_vector(31 downto 0) := X"00000000";
    PF1_PB_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_PB_CAP_SYSTEM_ALLOCATED : string := "FALSE";
    PF1_PB_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF1_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    PF1_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF1_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    PF1_RBAR_CAP_ENABLE : string := "FALSE";
    PF1_RBAR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_RBAR_CAP_SIZE0 : std_logic_vector(19 downto 0) := X"00000";
    PF1_RBAR_CAP_SIZE1 : std_logic_vector(19 downto 0) := X"00000";
    PF1_RBAR_CAP_SIZE2 : std_logic_vector(19 downto 0) := X"00000";
    PF1_RBAR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF1_RBAR_CONTROL_INDEX0 : std_logic_vector(2 downto 0) := "000";
    PF1_RBAR_CONTROL_INDEX1 : std_logic_vector(2 downto 0) := "000";
    PF1_RBAR_CONTROL_INDEX2 : std_logic_vector(2 downto 0) := "000";
    PF1_RBAR_CONTROL_SIZE0 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF1_RBAR_CONTROL_SIZE1 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF1_RBAR_CONTROL_SIZE2 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF1_RBAR_NUM : std_logic_vector(2 downto 0) := "001";
    PF1_REVISION_ID : std_logic_vector(7 downto 0) := X"00";
    PF1_SRIOV_BAR0_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_SRIOV_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF1_SRIOV_BAR1_APERTURE_SIZE : std_logic_vector(4 downto 0) := "0" & X"0";
    PF1_SRIOV_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF1_SRIOV_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_SRIOV_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF1_SRIOV_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_SRIOV_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF1_SRIOV_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_SRIOV_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF1_SRIOV_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF1_SRIOV_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF1_SRIOV_CAP_INITIAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF1_SRIOV_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_SRIOV_CAP_TOTAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF1_SRIOV_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF1_SRIOV_FIRST_VF_OFFSET : std_logic_vector(15 downto 0) := X"0000";
    PF1_SRIOV_FUNC_DEP_LINK : std_logic_vector(15 downto 0) := X"0000";
    PF1_SRIOV_SUPPORTED_PAGE_SIZE : std_logic_vector(31 downto 0) := X"00000000";
    PF1_SRIOV_VF_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF1_SUBSYSTEM_ID : std_logic_vector(15 downto 0) := X"0000";
    PF1_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    PF1_TPHR_CAP_ENABLE : string := "FALSE";
    PF1_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    PF1_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF1_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    PF1_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    PF1_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF1_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF2_AER_CAP_ECRC_CHECK_CAPABLE : string := "FALSE";
    PF2_AER_CAP_ECRC_GEN_CAPABLE : string := "FALSE";
    PF2_AER_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_ARI_CAP_NEXT_FUNC : std_logic_vector(7 downto 0) := X"00";
    PF2_BAR0_APERTURE_SIZE : std_logic_vector(5 downto 0) := "11" & X"3";
    PF2_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF2_BAR1_APERTURE_SIZE : std_logic_vector(5 downto 0) := "00" & X"0";
    PF2_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF2_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF2_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF2_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF2_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF2_BIST_REGISTER : std_logic_vector(7 downto 0) := X"00";
    PF2_CAPABILITY_POINTER : std_logic_vector(7 downto 0) := X"50";
    PF2_CLASS_CODE : std_logic_vector(23 downto 0) := X"000000";
    PF2_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF2_DEV_CAP_MAX_PAYLOAD_SIZE : std_logic_vector(2 downto 0) := "011";
    PF2_DPA_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_DPA_CAP_SUB_STATE_CONTROL : std_logic_vector(4 downto 0) := "0" & X"0";
    PF2_DPA_CAP_SUB_STATE_CONTROL_EN : string := "TRUE";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : std_logic_vector(7 downto 0) := X"00";
    PF2_DPA_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF2_DSN_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"10C";
    PF2_EXPANSION_ROM_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_EXPANSION_ROM_ENABLE : string := "FALSE";
    PF2_INTERRUPT_LINE : std_logic_vector(7 downto 0) := X"00";
    PF2_INTERRUPT_PIN : std_logic_vector(2 downto 0) := "001";
    PF2_MSIX_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF2_MSIX_CAP_PBA_BIR : integer := 0;
    PF2_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    PF2_MSIX_CAP_TABLE_BIR : integer := 0;
    PF2_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    PF2_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF2_MSI_CAP_MULTIMSGCAP : integer := 0;
    PF2_MSI_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF2_MSI_CAP_PERVECMASKCAP : string := "FALSE";
    PF2_PB_CAP_DATA_REG_D0 : std_logic_vector(31 downto 0) := X"00000000";
    PF2_PB_CAP_DATA_REG_D0_SUSTAINED : std_logic_vector(31 downto 0) := X"00000000";
    PF2_PB_CAP_DATA_REG_D1 : std_logic_vector(31 downto 0) := X"00000000";
    PF2_PB_CAP_DATA_REG_D3HOT : std_logic_vector(31 downto 0) := X"00000000";
    PF2_PB_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_PB_CAP_SYSTEM_ALLOCATED : string := "FALSE";
    PF2_PB_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF2_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    PF2_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF2_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    PF2_RBAR_CAP_ENABLE : string := "FALSE";
    PF2_RBAR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_RBAR_CAP_SIZE0 : std_logic_vector(19 downto 0) := X"00000";
    PF2_RBAR_CAP_SIZE1 : std_logic_vector(19 downto 0) := X"00000";
    PF2_RBAR_CAP_SIZE2 : std_logic_vector(19 downto 0) := X"00000";
    PF2_RBAR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF2_RBAR_CONTROL_INDEX0 : std_logic_vector(2 downto 0) := "000";
    PF2_RBAR_CONTROL_INDEX1 : std_logic_vector(2 downto 0) := "000";
    PF2_RBAR_CONTROL_INDEX2 : std_logic_vector(2 downto 0) := "000";
    PF2_RBAR_CONTROL_SIZE0 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF2_RBAR_CONTROL_SIZE1 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF2_RBAR_CONTROL_SIZE2 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF2_RBAR_NUM : std_logic_vector(2 downto 0) := "001";
    PF2_REVISION_ID : std_logic_vector(7 downto 0) := X"00";
    PF2_SRIOV_BAR0_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_SRIOV_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF2_SRIOV_BAR1_APERTURE_SIZE : std_logic_vector(4 downto 0) := "0" & X"0";
    PF2_SRIOV_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF2_SRIOV_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_SRIOV_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF2_SRIOV_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_SRIOV_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF2_SRIOV_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_SRIOV_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF2_SRIOV_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF2_SRIOV_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF2_SRIOV_CAP_INITIAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF2_SRIOV_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_SRIOV_CAP_TOTAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF2_SRIOV_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF2_SRIOV_FIRST_VF_OFFSET : std_logic_vector(15 downto 0) := X"0000";
    PF2_SRIOV_FUNC_DEP_LINK : std_logic_vector(15 downto 0) := X"0000";
    PF2_SRIOV_SUPPORTED_PAGE_SIZE : std_logic_vector(31 downto 0) := X"00000000";
    PF2_SRIOV_VF_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF2_SUBSYSTEM_ID : std_logic_vector(15 downto 0) := X"0000";
    PF2_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    PF2_TPHR_CAP_ENABLE : string := "FALSE";
    PF2_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    PF2_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF2_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    PF2_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    PF2_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF2_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF3_AER_CAP_ECRC_CHECK_CAPABLE : string := "FALSE";
    PF3_AER_CAP_ECRC_GEN_CAPABLE : string := "FALSE";
    PF3_AER_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_ARI_CAP_NEXT_FUNC : std_logic_vector(7 downto 0) := X"00";
    PF3_BAR0_APERTURE_SIZE : std_logic_vector(5 downto 0) := "11" & X"3";
    PF3_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF3_BAR1_APERTURE_SIZE : std_logic_vector(5 downto 0) := "00" & X"0";
    PF3_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF3_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF3_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF3_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF3_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF3_BIST_REGISTER : std_logic_vector(7 downto 0) := X"00";
    PF3_CAPABILITY_POINTER : std_logic_vector(7 downto 0) := X"50";
    PF3_CLASS_CODE : std_logic_vector(23 downto 0) := X"000000";
    PF3_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF3_DEV_CAP_MAX_PAYLOAD_SIZE : std_logic_vector(2 downto 0) := "011";
    PF3_DPA_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_DPA_CAP_SUB_STATE_CONTROL : std_logic_vector(4 downto 0) := "0" & X"0";
    PF3_DPA_CAP_SUB_STATE_CONTROL_EN : string := "TRUE";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : std_logic_vector(7 downto 0) := X"00";
    PF3_DPA_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF3_DSN_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"10C";
    PF3_EXPANSION_ROM_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_EXPANSION_ROM_ENABLE : string := "FALSE";
    PF3_INTERRUPT_LINE : std_logic_vector(7 downto 0) := X"00";
    PF3_INTERRUPT_PIN : std_logic_vector(2 downto 0) := "001";
    PF3_MSIX_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF3_MSIX_CAP_PBA_BIR : integer := 0;
    PF3_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    PF3_MSIX_CAP_TABLE_BIR : integer := 0;
    PF3_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    PF3_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF3_MSI_CAP_MULTIMSGCAP : integer := 0;
    PF3_MSI_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF3_MSI_CAP_PERVECMASKCAP : string := "FALSE";
    PF3_PB_CAP_DATA_REG_D0 : std_logic_vector(31 downto 0) := X"00000000";
    PF3_PB_CAP_DATA_REG_D0_SUSTAINED : std_logic_vector(31 downto 0) := X"00000000";
    PF3_PB_CAP_DATA_REG_D1 : std_logic_vector(31 downto 0) := X"00000000";
    PF3_PB_CAP_DATA_REG_D3HOT : std_logic_vector(31 downto 0) := X"00000000";
    PF3_PB_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_PB_CAP_SYSTEM_ALLOCATED : string := "FALSE";
    PF3_PB_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF3_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    PF3_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    PF3_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    PF3_RBAR_CAP_ENABLE : string := "FALSE";
    PF3_RBAR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_RBAR_CAP_SIZE0 : std_logic_vector(19 downto 0) := X"00000";
    PF3_RBAR_CAP_SIZE1 : std_logic_vector(19 downto 0) := X"00000";
    PF3_RBAR_CAP_SIZE2 : std_logic_vector(19 downto 0) := X"00000";
    PF3_RBAR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF3_RBAR_CONTROL_INDEX0 : std_logic_vector(2 downto 0) := "000";
    PF3_RBAR_CONTROL_INDEX1 : std_logic_vector(2 downto 0) := "000";
    PF3_RBAR_CONTROL_INDEX2 : std_logic_vector(2 downto 0) := "000";
    PF3_RBAR_CONTROL_SIZE0 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF3_RBAR_CONTROL_SIZE1 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF3_RBAR_CONTROL_SIZE2 : std_logic_vector(4 downto 0) := "0" & X"0";
    PF3_RBAR_NUM : std_logic_vector(2 downto 0) := "001";
    PF3_REVISION_ID : std_logic_vector(7 downto 0) := X"00";
    PF3_SRIOV_BAR0_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_SRIOV_BAR0_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF3_SRIOV_BAR1_APERTURE_SIZE : std_logic_vector(4 downto 0) := "0" & X"0";
    PF3_SRIOV_BAR1_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF3_SRIOV_BAR2_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_SRIOV_BAR2_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF3_SRIOV_BAR3_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_SRIOV_BAR3_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF3_SRIOV_BAR4_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_SRIOV_BAR4_CONTROL : std_logic_vector(2 downto 0) := "100";
    PF3_SRIOV_BAR5_APERTURE_SIZE : std_logic_vector(4 downto 0) := "1" & X"3";
    PF3_SRIOV_BAR5_CONTROL : std_logic_vector(2 downto 0) := "000";
    PF3_SRIOV_CAP_INITIAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF3_SRIOV_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_SRIOV_CAP_TOTAL_VF : std_logic_vector(15 downto 0) := X"0000";
    PF3_SRIOV_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PF3_SRIOV_FIRST_VF_OFFSET : std_logic_vector(15 downto 0) := X"0000";
    PF3_SRIOV_FUNC_DEP_LINK : std_logic_vector(15 downto 0) := X"0000";
    PF3_SRIOV_SUPPORTED_PAGE_SIZE : std_logic_vector(31 downto 0) := X"00000000";
    PF3_SRIOV_VF_DEVICE_ID : std_logic_vector(15 downto 0) := X"0000";
    PF3_SUBSYSTEM_ID : std_logic_vector(15 downto 0) := X"0000";
    PF3_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    PF3_TPHR_CAP_ENABLE : string := "FALSE";
    PF3_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    PF3_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    PF3_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    PF3_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    PF3_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    PF3_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 : string := "FALSE";
    PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 : string := "FALSE";
    PL_DISABLE_EI_INFER_IN_L0 : string := "FALSE";
    PL_DISABLE_GEN3_DC_BALANCE : string := "FALSE";
    PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP : string := "TRUE";
    PL_DISABLE_RETRAIN_ON_FRAMING_ERROR : string := "FALSE";
    PL_DISABLE_SCRAMBLING : string := "FALSE";
    PL_DISABLE_SYNC_HEADER_FRAMING_ERROR : string := "FALSE";
    PL_DISABLE_UPCONFIG_CAPABLE : string := "FALSE";
    PL_EQ_ADAPT_DISABLE_COEFF_CHECK : string := "FALSE";
    PL_EQ_ADAPT_DISABLE_PRESET_CHECK : string := "FALSE";
    PL_EQ_ADAPT_ITER_COUNT : std_logic_vector(4 downto 0) := "0" & X"2";
    PL_EQ_ADAPT_REJECT_RETRY_COUNT : std_logic_vector(1 downto 0) := "01";
    PL_EQ_BYPASS_PHASE23 : string := "FALSE";
    PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT : std_logic_vector(2 downto 0) := "011";
    PL_EQ_DEFAULT_GEN3_TX_PRESET : std_logic_vector(3 downto 0) := X"4";
    PL_EQ_PHASE01_RX_ADAPT : string := "FALSE";
    PL_EQ_SHORT_ADAPT_PHASE : string := "FALSE";
    PL_LANE0_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE1_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE2_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE3_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE4_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE5_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE6_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LANE7_EQ_CONTROL : std_logic_vector(15 downto 0) := X"3F00";
    PL_LINK_CAP_MAX_LINK_SPEED : std_logic_vector(2 downto 0) := "100";
    PL_LINK_CAP_MAX_LINK_WIDTH : std_logic_vector(3 downto 0) := X"8";
    PL_N_FTS_COMCLK_GEN1 : integer := 255;
    PL_N_FTS_COMCLK_GEN2 : integer := 255;
    PL_N_FTS_COMCLK_GEN3 : integer := 255;
    PL_N_FTS_GEN1 : integer := 255;
    PL_N_FTS_GEN2 : integer := 255;
    PL_N_FTS_GEN3 : integer := 255;
    PL_REPORT_ALL_PHY_ERRORS : string := "TRUE";
    PL_SIM_FAST_LINK_TRAINING : string := "FALSE";
    PL_UPSTREAM_FACING : string := "TRUE";
    PM_ASPML0S_TIMEOUT : std_logic_vector(15 downto 0) := X"05DC";
    PM_ASPML1_ENTRY_DELAY : std_logic_vector(19 downto 0) := X"00000";
    PM_ENABLE_L23_ENTRY : string := "FALSE";
    PM_ENABLE_SLOT_POWER_CAPTURE : string := "TRUE";
    PM_L1_REENTRY_DELAY : std_logic_vector(31 downto 0) := X"00000000";
    PM_PME_SERVICE_TIMEOUT_DELAY : std_logic_vector(19 downto 0) := X"186A0";
    PM_PME_TURNOFF_ACK_DELAY : std_logic_vector(15 downto 0) := X"0064";
    SIM_JTAG_IDCODE : std_logic_vector(31 downto 0) := X"00000000";
    SIM_VERSION : string := "1.0";
    SPARE_BIT0 : integer := 0;
    SPARE_BIT1 : integer := 0;
    SPARE_BIT2 : integer := 0;
    SPARE_BIT3 : integer := 0;
    SPARE_BIT4 : integer := 0;
    SPARE_BIT5 : integer := 0;
    SPARE_BIT6 : integer := 0;
    SPARE_BIT7 : integer := 0;
    SPARE_BIT8 : integer := 0;
    SPARE_BYTE0 : std_logic_vector(7 downto 0) := X"00";
    SPARE_BYTE1 : std_logic_vector(7 downto 0) := X"00";
    SPARE_BYTE2 : std_logic_vector(7 downto 0) := X"00";
    SPARE_BYTE3 : std_logic_vector(7 downto 0) := X"00";
    SPARE_WORD0 : std_logic_vector(31 downto 0) := X"00000000";
    SPARE_WORD1 : std_logic_vector(31 downto 0) := X"00000000";
    SPARE_WORD2 : std_logic_vector(31 downto 0) := X"00000000";
    SPARE_WORD3 : std_logic_vector(31 downto 0) := X"00000000";
    SRIOV_CAP_ENABLE : string := "FALSE";
    TL_COMPLETION_RAM_SIZE_16K : string := "TRUE";
    TL_COMPL_TIMEOUT_REG0 : std_logic_vector(23 downto 0) := X"BEBC20";
    TL_COMPL_TIMEOUT_REG1 : std_logic_vector(27 downto 0) := X"2FAF080";
    TL_CREDITS_CD : std_logic_vector(11 downto 0) := X"3E0";
    TL_CREDITS_CH : std_logic_vector(7 downto 0) := X"20";
    TL_CREDITS_NPD : std_logic_vector(11 downto 0) := X"028";
    TL_CREDITS_NPH : std_logic_vector(7 downto 0) := X"20";
    TL_CREDITS_PD : std_logic_vector(11 downto 0) := X"198";
    TL_CREDITS_PH : std_logic_vector(7 downto 0) := X"20";
    TL_ENABLE_MESSAGE_RID_CHECK_ENABLE : string := "TRUE";
    TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE : string := "FALSE";
    TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE : string := "FALSE";
    TL_LEGACY_MODE_ENABLE : string := "FALSE";
    TL_PF_ENABLE_REG : std_logic_vector(1 downto 0) := "00";
    TL_TX_MUX_STRICT_PRIORITY : string := "TRUE";
    TWO_LAYER_MODE_DLCMSM_ENABLE : string := "TRUE";
    TWO_LAYER_MODE_ENABLE : string := "FALSE";
    TWO_LAYER_MODE_WIDTH_256 : string := "TRUE";
    VF0_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF0_CAPABILITY_POINTER : std_logic_vector(7 downto 0) := X"50";
    VF0_MSIX_CAP_PBA_BIR : integer := 0;
    VF0_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF0_MSIX_CAP_TABLE_BIR : integer := 0;
    VF0_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF0_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF0_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF0_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF0_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF0_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF0_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF0_TPHR_CAP_ENABLE : string := "FALSE";
    VF0_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF0_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF0_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF0_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF0_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF0_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF1_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF1_MSIX_CAP_PBA_BIR : integer := 0;
    VF1_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF1_MSIX_CAP_TABLE_BIR : integer := 0;
    VF1_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF1_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF1_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF1_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF1_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF1_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF1_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF1_TPHR_CAP_ENABLE : string := "FALSE";
    VF1_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF1_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF1_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF1_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF1_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF1_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF2_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF2_MSIX_CAP_PBA_BIR : integer := 0;
    VF2_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF2_MSIX_CAP_TABLE_BIR : integer := 0;
    VF2_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF2_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF2_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF2_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF2_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF2_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF2_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF2_TPHR_CAP_ENABLE : string := "FALSE";
    VF2_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF2_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF2_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF2_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF2_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF2_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF3_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF3_MSIX_CAP_PBA_BIR : integer := 0;
    VF3_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF3_MSIX_CAP_TABLE_BIR : integer := 0;
    VF3_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF3_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF3_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF3_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF3_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF3_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF3_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF3_TPHR_CAP_ENABLE : string := "FALSE";
    VF3_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF3_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF3_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF3_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF3_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF3_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF4_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF4_MSIX_CAP_PBA_BIR : integer := 0;
    VF4_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF4_MSIX_CAP_TABLE_BIR : integer := 0;
    VF4_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF4_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF4_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF4_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF4_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF4_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF4_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF4_TPHR_CAP_ENABLE : string := "FALSE";
    VF4_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF4_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF4_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF4_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF4_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF4_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF5_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF5_MSIX_CAP_PBA_BIR : integer := 0;
    VF5_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF5_MSIX_CAP_TABLE_BIR : integer := 0;
    VF5_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF5_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF5_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF5_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF5_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF5_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF5_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF5_TPHR_CAP_ENABLE : string := "FALSE";
    VF5_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF5_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF5_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF5_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF5_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF5_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF6_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF6_MSIX_CAP_PBA_BIR : integer := 0;
    VF6_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF6_MSIX_CAP_TABLE_BIR : integer := 0;
    VF6_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF6_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF6_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF6_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF6_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF6_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF6_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF6_TPHR_CAP_ENABLE : string := "FALSE";
    VF6_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF6_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF6_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF6_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF6_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF6_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1";
    VF7_ARI_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF7_MSIX_CAP_PBA_BIR : integer := 0;
    VF7_MSIX_CAP_PBA_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000050";
    VF7_MSIX_CAP_TABLE_BIR : integer := 0;
    VF7_MSIX_CAP_TABLE_OFFSET : std_logic_vector(28 downto 0) := "0" & X"0000040";
    VF7_MSIX_CAP_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF7_MSI_CAP_MULTIMSGCAP : integer := 0;
    VF7_PM_CAP_ID : std_logic_vector(7 downto 0) := X"01";
    VF7_PM_CAP_NEXTPTR : std_logic_vector(7 downto 0) := X"00";
    VF7_PM_CAP_VER_ID : std_logic_vector(2 downto 0) := "011";
    VF7_TPHR_CAP_DEV_SPECIFIC_MODE : string := "TRUE";
    VF7_TPHR_CAP_ENABLE : string := "FALSE";
    VF7_TPHR_CAP_INT_VEC_MODE : string := "TRUE";
    VF7_TPHR_CAP_NEXTPTR : std_logic_vector(11 downto 0) := X"000";
    VF7_TPHR_CAP_ST_MODE_SEL : std_logic_vector(2 downto 0) := "000";
    VF7_TPHR_CAP_ST_TABLE_LOC : std_logic_vector(1 downto 0) := "00";
    VF7_TPHR_CAP_ST_TABLE_SIZE : std_logic_vector(10 downto 0) := "000" & X"00";
    VF7_TPHR_CAP_VER : std_logic_vector(3 downto 0) := X"1"
  );

  port (
    CFGCURRENTSPEED      : out std_logic_vector(2 downto 0);
    CFGDPASUBSTATECHANGE : out std_logic_vector(3 downto 0);
    CFGERRCOROUT         : out std_ulogic;
    CFGERRFATALOUT       : out std_ulogic;
    CFGERRNONFATALOUT    : out std_ulogic;
    CFGEXTFUNCTIONNUMBER : out std_logic_vector(7 downto 0);
    CFGEXTREADRECEIVED   : out std_ulogic;
    CFGEXTREGISTERNUMBER : out std_logic_vector(9 downto 0);
    CFGEXTWRITEBYTEENABLE : out std_logic_vector(3 downto 0);
    CFGEXTWRITEDATA      : out std_logic_vector(31 downto 0);
    CFGEXTWRITERECEIVED  : out std_ulogic;
    CFGFCCPLD            : out std_logic_vector(11 downto 0);
    CFGFCCPLH            : out std_logic_vector(7 downto 0);
    CFGFCNPD             : out std_logic_vector(11 downto 0);
    CFGFCNPH             : out std_logic_vector(7 downto 0);
    CFGFCPD              : out std_logic_vector(11 downto 0);
    CFGFCPH              : out std_logic_vector(7 downto 0);
    CFGFLRINPROCESS      : out std_logic_vector(3 downto 0);
    CFGFUNCTIONPOWERSTATE : out std_logic_vector(11 downto 0);
    CFGFUNCTIONSTATUS    : out std_logic_vector(15 downto 0);
    CFGHOTRESETOUT       : out std_ulogic;
    CFGINTERRUPTMSIDATA  : out std_logic_vector(31 downto 0);
    CFGINTERRUPTMSIENABLE : out std_logic_vector(3 downto 0);
    CFGINTERRUPTMSIFAIL  : out std_ulogic;
    CFGINTERRUPTMSIMASKUPDATE : out std_ulogic;
    CFGINTERRUPTMSIMMENABLE : out std_logic_vector(11 downto 0);
    CFGINTERRUPTMSISENT  : out std_ulogic;
    CFGINTERRUPTMSIVFENABLE : out std_logic_vector(7 downto 0);
    CFGINTERRUPTMSIXENABLE : out std_logic_vector(3 downto 0);
    CFGINTERRUPTMSIXFAIL : out std_ulogic;
    CFGINTERRUPTMSIXMASK : out std_logic_vector(3 downto 0);
    CFGINTERRUPTMSIXSENT : out std_ulogic;
    CFGINTERRUPTMSIXVFENABLE : out std_logic_vector(7 downto 0);
    CFGINTERRUPTMSIXVFMASK : out std_logic_vector(7 downto 0);
    CFGINTERRUPTSENT     : out std_ulogic;
    CFGLINKPOWERSTATE    : out std_logic_vector(1 downto 0);
    CFGLOCALERROR        : out std_ulogic;
    CFGLTRENABLE         : out std_ulogic;
    CFGLTSSMSTATE        : out std_logic_vector(5 downto 0);
    CFGMAXPAYLOAD        : out std_logic_vector(2 downto 0);
    CFGMAXREADREQ        : out std_logic_vector(2 downto 0);
    CFGMGMTREADDATA      : out std_logic_vector(31 downto 0);
    CFGMGMTREADWRITEDONE : out std_ulogic;
    CFGMSGRECEIVED       : out std_ulogic;
    CFGMSGRECEIVEDDATA   : out std_logic_vector(7 downto 0);
    CFGMSGRECEIVEDTYPE   : out std_logic_vector(4 downto 0);
    CFGMSGTRANSMITDONE   : out std_ulogic;
    CFGNEGOTIATEDWIDTH   : out std_logic_vector(3 downto 0);
    CFGOBFFENABLE        : out std_logic_vector(1 downto 0);
    CFGPERFUNCSTATUSDATA : out std_logic_vector(15 downto 0);
    CFGPERFUNCTIONUPDATEDONE : out std_ulogic;
    CFGPHYLINKDOWN       : out std_ulogic;
    CFGPHYLINKSTATUS     : out std_logic_vector(1 downto 0);
    CFGPLSTATUSCHANGE    : out std_ulogic;
    CFGPOWERSTATECHANGEINTERRUPT : out std_ulogic;
    CFGRCBSTATUS         : out std_logic_vector(3 downto 0);
    CFGTPHFUNCTIONNUM    : out std_logic_vector(3 downto 0);
    CFGTPHREQUESTERENABLE : out std_logic_vector(3 downto 0);
    CFGTPHSTMODE         : out std_logic_vector(11 downto 0);
    CFGTPHSTTADDRESS     : out std_logic_vector(4 downto 0);
    CFGTPHSTTREADENABLE  : out std_ulogic;
    CFGTPHSTTWRITEBYTEVALID : out std_logic_vector(3 downto 0);
    CFGTPHSTTWRITEDATA   : out std_logic_vector(31 downto 0);
    CFGTPHSTTWRITEENABLE : out std_ulogic;
    CFGVFFLRINPROCESS    : out std_logic_vector(7 downto 0);
    CFGVFPOWERSTATE      : out std_logic_vector(23 downto 0);
    CFGVFSTATUS          : out std_logic_vector(15 downto 0);
    CFGVFTPHREQUESTERENABLE : out std_logic_vector(7 downto 0);
    CFGVFTPHSTMODE       : out std_logic_vector(23 downto 0);
    CONFMCAPDESIGNSWITCH : out std_ulogic;
    CONFMCAPEOS          : out std_ulogic;
    CONFMCAPINUSEBYPCIE  : out std_ulogic;
    CONFREQREADY         : out std_ulogic;
    CONFRESPRDATA        : out std_logic_vector(31 downto 0);
    CONFRESPVALID        : out std_ulogic;
    DBGDATAOUT           : out std_logic_vector(15 downto 0);
    DBGMCAPCSB           : out std_ulogic;
    DBGMCAPDATA          : out std_logic_vector(31 downto 0);
    DBGMCAPEOS           : out std_ulogic;
    DBGMCAPERROR         : out std_ulogic;
    DBGMCAPMODE          : out std_ulogic;
    DBGMCAPRDATAVALID    : out std_ulogic;
    DBGMCAPRDWRB         : out std_ulogic;
    DBGMCAPRESET         : out std_ulogic;
    DBGPLDATABLOCKRECEIVEDAFTEREDS : out std_ulogic;
    DBGPLGEN3FRAMINGERRORDETECTED : out std_ulogic;
    DBGPLGEN3SYNCHEADERERRORDETECTED : out std_ulogic;
    DBGPLINFERREDRXELECTRICALIDLE : out std_logic_vector(7 downto 0);
    DRPDO                : out std_logic_vector(15 downto 0);
    DRPRDY               : out std_ulogic;
    LL2LMMASTERTLPSENT0  : out std_ulogic;
    LL2LMMASTERTLPSENT1  : out std_ulogic;
    LL2LMMASTERTLPSENTTLPID0 : out std_logic_vector(3 downto 0);
    LL2LMMASTERTLPSENTTLPID1 : out std_logic_vector(3 downto 0);
    LL2LMMAXISRXTDATA    : out std_logic_vector(255 downto 0);
    LL2LMMAXISRXTUSER    : out std_logic_vector(17 downto 0);
    LL2LMMAXISRXTVALID   : out std_logic_vector(7 downto 0);
    LL2LMSAXISTXTREADY   : out std_logic_vector(7 downto 0);
    MAXISCQTDATA         : out std_logic_vector(255 downto 0);
    MAXISCQTKEEP         : out std_logic_vector(7 downto 0);
    MAXISCQTLAST         : out std_ulogic;
    MAXISCQTUSER         : out std_logic_vector(84 downto 0);
    MAXISCQTVALID        : out std_ulogic;
    MAXISRCTDATA         : out std_logic_vector(255 downto 0);
    MAXISRCTKEEP         : out std_logic_vector(7 downto 0);
    MAXISRCTLAST         : out std_ulogic;
    MAXISRCTUSER         : out std_logic_vector(74 downto 0);
    MAXISRCTVALID        : out std_ulogic;
    MICOMPLETIONRAMREADADDRESSAL : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMREADADDRESSAU : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMREADADDRESSBL : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMREADADDRESSBU : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMREADENABLEL : out std_logic_vector(3 downto 0);
    MICOMPLETIONRAMREADENABLEU : out std_logic_vector(3 downto 0);
    MICOMPLETIONRAMWRITEADDRESSAL : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMWRITEADDRESSAU : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMWRITEADDRESSBL : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMWRITEADDRESSBU : out std_logic_vector(9 downto 0);
    MICOMPLETIONRAMWRITEDATAL : out std_logic_vector(71 downto 0);
    MICOMPLETIONRAMWRITEDATAU : out std_logic_vector(71 downto 0);
    MICOMPLETIONRAMWRITEENABLEL : out std_logic_vector(3 downto 0);
    MICOMPLETIONRAMWRITEENABLEU : out std_logic_vector(3 downto 0);
    MIREPLAYRAMADDRESS   : out std_logic_vector(8 downto 0);
    MIREPLAYRAMREADENABLE : out std_logic_vector(1 downto 0);
    MIREPLAYRAMWRITEDATA : out std_logic_vector(143 downto 0);
    MIREPLAYRAMWRITEENABLE : out std_logic_vector(1 downto 0);
    MIREQUESTRAMREADADDRESSA : out std_logic_vector(8 downto 0);
    MIREQUESTRAMREADADDRESSB : out std_logic_vector(8 downto 0);
    MIREQUESTRAMREADENABLE : out std_logic_vector(3 downto 0);
    MIREQUESTRAMWRITEADDRESSA : out std_logic_vector(8 downto 0);
    MIREQUESTRAMWRITEADDRESSB : out std_logic_vector(8 downto 0);
    MIREQUESTRAMWRITEDATA : out std_logic_vector(143 downto 0);
    MIREQUESTRAMWRITEENABLE : out std_logic_vector(3 downto 0);
    PCIECQNPREQCOUNT     : out std_logic_vector(5 downto 0);
    PCIEPERST0B          : out std_ulogic;
    PCIEPERST1B          : out std_ulogic;
    PCIERQSEQNUM         : out std_logic_vector(3 downto 0);
    PCIERQSEQNUMVLD      : out std_ulogic;
    PCIERQTAG            : out std_logic_vector(5 downto 0);
    PCIERQTAGAV          : out std_logic_vector(1 downto 0);
    PCIERQTAGVLD         : out std_ulogic;
    PCIETFCNPDAV         : out std_logic_vector(1 downto 0);
    PCIETFCNPHAV         : out std_logic_vector(1 downto 0);
    PIPERX0EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX0EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX0EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX0EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX0POLARITY      : out std_ulogic;
    PIPERX1EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX1EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX1EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX1EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX1POLARITY      : out std_ulogic;
    PIPERX2EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX2EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX2EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX2EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX2POLARITY      : out std_ulogic;
    PIPERX3EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX3EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX3EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX3EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX3POLARITY      : out std_ulogic;
    PIPERX4EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX4EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX4EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX4EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX4POLARITY      : out std_ulogic;
    PIPERX5EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX5EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX5EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX5EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX5POLARITY      : out std_ulogic;
    PIPERX6EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX6EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX6EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX6EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX6POLARITY      : out std_ulogic;
    PIPERX7EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPERX7EQLPLFFS      : out std_logic_vector(5 downto 0);
    PIPERX7EQLPTXPRESET  : out std_logic_vector(3 downto 0);
    PIPERX7EQPRESET      : out std_logic_vector(2 downto 0);
    PIPERX7POLARITY      : out std_ulogic;
    PIPETX0CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX0COMPLIANCE    : out std_ulogic;
    PIPETX0DATA          : out std_logic_vector(31 downto 0);
    PIPETX0DATAVALID     : out std_ulogic;
    PIPETX0DEEMPH        : out std_ulogic;
    PIPETX0ELECIDLE      : out std_ulogic;
    PIPETX0EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX0EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX0EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX0MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX0POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX0RATE          : out std_logic_vector(1 downto 0);
    PIPETX0RCVRDET       : out std_ulogic;
    PIPETX0RESET         : out std_ulogic;
    PIPETX0STARTBLOCK    : out std_ulogic;
    PIPETX0SWING         : out std_ulogic;
    PIPETX0SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX1CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX1COMPLIANCE    : out std_ulogic;
    PIPETX1DATA          : out std_logic_vector(31 downto 0);
    PIPETX1DATAVALID     : out std_ulogic;
    PIPETX1DEEMPH        : out std_ulogic;
    PIPETX1ELECIDLE      : out std_ulogic;
    PIPETX1EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX1EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX1EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX1MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX1POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX1RATE          : out std_logic_vector(1 downto 0);
    PIPETX1RCVRDET       : out std_ulogic;
    PIPETX1RESET         : out std_ulogic;
    PIPETX1STARTBLOCK    : out std_ulogic;
    PIPETX1SWING         : out std_ulogic;
    PIPETX1SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX2CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX2COMPLIANCE    : out std_ulogic;
    PIPETX2DATA          : out std_logic_vector(31 downto 0);
    PIPETX2DATAVALID     : out std_ulogic;
    PIPETX2DEEMPH        : out std_ulogic;
    PIPETX2ELECIDLE      : out std_ulogic;
    PIPETX2EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX2EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX2EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX2MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX2POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX2RATE          : out std_logic_vector(1 downto 0);
    PIPETX2RCVRDET       : out std_ulogic;
    PIPETX2RESET         : out std_ulogic;
    PIPETX2STARTBLOCK    : out std_ulogic;
    PIPETX2SWING         : out std_ulogic;
    PIPETX2SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX3CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX3COMPLIANCE    : out std_ulogic;
    PIPETX3DATA          : out std_logic_vector(31 downto 0);
    PIPETX3DATAVALID     : out std_ulogic;
    PIPETX3DEEMPH        : out std_ulogic;
    PIPETX3ELECIDLE      : out std_ulogic;
    PIPETX3EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX3EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX3EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX3MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX3POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX3RATE          : out std_logic_vector(1 downto 0);
    PIPETX3RCVRDET       : out std_ulogic;
    PIPETX3RESET         : out std_ulogic;
    PIPETX3STARTBLOCK    : out std_ulogic;
    PIPETX3SWING         : out std_ulogic;
    PIPETX3SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX4CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX4COMPLIANCE    : out std_ulogic;
    PIPETX4DATA          : out std_logic_vector(31 downto 0);
    PIPETX4DATAVALID     : out std_ulogic;
    PIPETX4DEEMPH        : out std_ulogic;
    PIPETX4ELECIDLE      : out std_ulogic;
    PIPETX4EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX4EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX4EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX4MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX4POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX4RATE          : out std_logic_vector(1 downto 0);
    PIPETX4RCVRDET       : out std_ulogic;
    PIPETX4RESET         : out std_ulogic;
    PIPETX4STARTBLOCK    : out std_ulogic;
    PIPETX4SWING         : out std_ulogic;
    PIPETX4SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX5CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX5COMPLIANCE    : out std_ulogic;
    PIPETX5DATA          : out std_logic_vector(31 downto 0);
    PIPETX5DATAVALID     : out std_ulogic;
    PIPETX5DEEMPH        : out std_ulogic;
    PIPETX5ELECIDLE      : out std_ulogic;
    PIPETX5EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX5EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX5EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX5MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX5POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX5RATE          : out std_logic_vector(1 downto 0);
    PIPETX5RCVRDET       : out std_ulogic;
    PIPETX5RESET         : out std_ulogic;
    PIPETX5STARTBLOCK    : out std_ulogic;
    PIPETX5SWING         : out std_ulogic;
    PIPETX5SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX6CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX6COMPLIANCE    : out std_ulogic;
    PIPETX6DATA          : out std_logic_vector(31 downto 0);
    PIPETX6DATAVALID     : out std_ulogic;
    PIPETX6DEEMPH        : out std_ulogic;
    PIPETX6ELECIDLE      : out std_ulogic;
    PIPETX6EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX6EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX6EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX6MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX6POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX6RATE          : out std_logic_vector(1 downto 0);
    PIPETX6RCVRDET       : out std_ulogic;
    PIPETX6RESET         : out std_ulogic;
    PIPETX6STARTBLOCK    : out std_ulogic;
    PIPETX6SWING         : out std_ulogic;
    PIPETX6SYNCHEADER    : out std_logic_vector(1 downto 0);
    PIPETX7CHARISK       : out std_logic_vector(1 downto 0);
    PIPETX7COMPLIANCE    : out std_ulogic;
    PIPETX7DATA          : out std_logic_vector(31 downto 0);
    PIPETX7DATAVALID     : out std_ulogic;
    PIPETX7DEEMPH        : out std_ulogic;
    PIPETX7ELECIDLE      : out std_ulogic;
    PIPETX7EQCONTROL     : out std_logic_vector(1 downto 0);
    PIPETX7EQDEEMPH      : out std_logic_vector(5 downto 0);
    PIPETX7EQPRESET      : out std_logic_vector(3 downto 0);
    PIPETX7MARGIN        : out std_logic_vector(2 downto 0);
    PIPETX7POWERDOWN     : out std_logic_vector(1 downto 0);
    PIPETX7RATE          : out std_logic_vector(1 downto 0);
    PIPETX7RCVRDET       : out std_ulogic;
    PIPETX7RESET         : out std_ulogic;
    PIPETX7STARTBLOCK    : out std_ulogic;
    PIPETX7SWING         : out std_ulogic;
    PIPETX7SYNCHEADER    : out std_logic_vector(1 downto 0);
    PLEQINPROGRESS       : out std_ulogic;
    PLEQPHASE            : out std_logic_vector(1 downto 0);
    SAXISCCTREADY        : out std_logic_vector(3 downto 0);
    SAXISRQTREADY        : out std_logic_vector(3 downto 0);
    SPAREOUT             : out std_logic_vector(31 downto 0);
    CFGCONFIGSPACEENABLE : in std_ulogic;
    CFGDEVID             : in std_logic_vector(15 downto 0);
    CFGDSBUSNUMBER       : in std_logic_vector(7 downto 0);
    CFGDSDEVICENUMBER    : in std_logic_vector(4 downto 0);
    CFGDSFUNCTIONNUMBER  : in std_logic_vector(2 downto 0);
    CFGDSN               : in std_logic_vector(63 downto 0);
    CFGDSPORTNUMBER      : in std_logic_vector(7 downto 0);
    CFGERRCORIN          : in std_ulogic;
    CFGERRUNCORIN        : in std_ulogic;
    CFGEXTREADDATA       : in std_logic_vector(31 downto 0);
    CFGEXTREADDATAVALID  : in std_ulogic;
    CFGFCSEL             : in std_logic_vector(2 downto 0);
    CFGFLRDONE           : in std_logic_vector(3 downto 0);
    CFGHOTRESETIN        : in std_ulogic;
    CFGINTERRUPTINT      : in std_logic_vector(3 downto 0);
    CFGINTERRUPTMSIATTR  : in std_logic_vector(2 downto 0);
    CFGINTERRUPTMSIFUNCTIONNUMBER : in std_logic_vector(3 downto 0);
    CFGINTERRUPTMSIINT   : in std_logic_vector(31 downto 0);
    CFGINTERRUPTMSIPENDINGSTATUS : in std_logic_vector(31 downto 0);
    CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE : in std_ulogic;
    CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM : in std_logic_vector(3 downto 0);
    CFGINTERRUPTMSISELECT : in std_logic_vector(3 downto 0);
    CFGINTERRUPTMSITPHPRESENT : in std_ulogic;
    CFGINTERRUPTMSITPHSTTAG : in std_logic_vector(8 downto 0);
    CFGINTERRUPTMSITPHTYPE : in std_logic_vector(1 downto 0);
    CFGINTERRUPTMSIXADDRESS : in std_logic_vector(63 downto 0);
    CFGINTERRUPTMSIXDATA : in std_logic_vector(31 downto 0);
    CFGINTERRUPTMSIXINT  : in std_ulogic;
    CFGINTERRUPTPENDING  : in std_logic_vector(3 downto 0);
    CFGLINKTRAININGENABLE : in std_ulogic;
    CFGMGMTADDR          : in std_logic_vector(18 downto 0);
    CFGMGMTBYTEENABLE    : in std_logic_vector(3 downto 0);
    CFGMGMTREAD          : in std_ulogic;
    CFGMGMTTYPE1CFGREGACCESS : in std_ulogic;
    CFGMGMTWRITE         : in std_ulogic;
    CFGMGMTWRITEDATA     : in std_logic_vector(31 downto 0);
    CFGMSGTRANSMIT       : in std_ulogic;
    CFGMSGTRANSMITDATA   : in std_logic_vector(31 downto 0);
    CFGMSGTRANSMITTYPE   : in std_logic_vector(2 downto 0);
    CFGPERFUNCSTATUSCONTROL : in std_logic_vector(2 downto 0);
    CFGPERFUNCTIONNUMBER : in std_logic_vector(3 downto 0);
    CFGPERFUNCTIONOUTPUTREQUEST : in std_ulogic;
    CFGPOWERSTATECHANGEACK : in std_ulogic;
    CFGREQPMTRANSITIONL23READY : in std_ulogic;
    CFGREVID             : in std_logic_vector(7 downto 0);
    CFGSUBSYSID          : in std_logic_vector(15 downto 0);
    CFGSUBSYSVENDID      : in std_logic_vector(15 downto 0);
    CFGTPHSTTREADDATA    : in std_logic_vector(31 downto 0);
    CFGTPHSTTREADDATAVALID : in std_ulogic;
    CFGVENDID            : in std_logic_vector(15 downto 0);
    CFGVFFLRDONE         : in std_logic_vector(7 downto 0);
    CONFMCAPREQUESTBYCONF : in std_ulogic;
    CONFREQDATA          : in std_logic_vector(31 downto 0);
    CONFREQREGNUM        : in std_logic_vector(3 downto 0);
    CONFREQTYPE          : in std_logic_vector(1 downto 0);
    CONFREQVALID         : in std_ulogic;
    CORECLK              : in std_ulogic;
    CORECLKMICOMPLETIONRAML : in std_ulogic;
    CORECLKMICOMPLETIONRAMU : in std_ulogic;
    CORECLKMIREPLAYRAM   : in std_ulogic;
    CORECLKMIREQUESTRAM  : in std_ulogic;
    DBGCFGLOCALMGMTREGOVERRIDE : in std_ulogic;
    DBGDATASEL           : in std_logic_vector(3 downto 0);
    DRPADDR              : in std_logic_vector(9 downto 0);
    DRPCLK               : in std_ulogic;
    DRPDI                : in std_logic_vector(15 downto 0);
    DRPEN                : in std_ulogic;
    DRPWE                : in std_ulogic;
    LL2LMSAXISTXTUSER    : in std_logic_vector(13 downto 0);
    LL2LMSAXISTXTVALID   : in std_ulogic;
    LL2LMTXTLPID0        : in std_logic_vector(3 downto 0);
    LL2LMTXTLPID1        : in std_logic_vector(3 downto 0);
    MAXISCQTREADY        : in std_logic_vector(21 downto 0);
    MAXISRCTREADY        : in std_logic_vector(21 downto 0);
    MCAPCLK              : in std_ulogic;
    MCAPPERST0B          : in std_ulogic;
    MCAPPERST1B          : in std_ulogic;
    MGMTRESETN           : in std_ulogic;
    MGMTSTICKYRESETN     : in std_ulogic;
    MICOMPLETIONRAMREADDATA : in std_logic_vector(143 downto 0);
    MIREPLAYRAMREADDATA  : in std_logic_vector(143 downto 0);
    MIREQUESTRAMREADDATA : in std_logic_vector(143 downto 0);
    PCIECQNPREQ          : in std_ulogic;
    PIPECLK              : in std_ulogic;
    PIPEEQFS             : in std_logic_vector(5 downto 0);
    PIPEEQLF             : in std_logic_vector(5 downto 0);
    PIPERESETN           : in std_ulogic;
    PIPERX0CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX0DATA          : in std_logic_vector(31 downto 0);
    PIPERX0DATAVALID     : in std_ulogic;
    PIPERX0ELECIDLE      : in std_ulogic;
    PIPERX0EQDONE        : in std_ulogic;
    PIPERX0EQLPADAPTDONE : in std_ulogic;
    PIPERX0EQLPLFFSSEL   : in std_ulogic;
    PIPERX0EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX0PHYSTATUS     : in std_ulogic;
    PIPERX0STARTBLOCK    : in std_ulogic;
    PIPERX0STATUS        : in std_logic_vector(2 downto 0);
    PIPERX0SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX0VALID         : in std_ulogic;
    PIPERX1CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX1DATA          : in std_logic_vector(31 downto 0);
    PIPERX1DATAVALID     : in std_ulogic;
    PIPERX1ELECIDLE      : in std_ulogic;
    PIPERX1EQDONE        : in std_ulogic;
    PIPERX1EQLPADAPTDONE : in std_ulogic;
    PIPERX1EQLPLFFSSEL   : in std_ulogic;
    PIPERX1EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX1PHYSTATUS     : in std_ulogic;
    PIPERX1STARTBLOCK    : in std_ulogic;
    PIPERX1STATUS        : in std_logic_vector(2 downto 0);
    PIPERX1SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX1VALID         : in std_ulogic;
    PIPERX2CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX2DATA          : in std_logic_vector(31 downto 0);
    PIPERX2DATAVALID     : in std_ulogic;
    PIPERX2ELECIDLE      : in std_ulogic;
    PIPERX2EQDONE        : in std_ulogic;
    PIPERX2EQLPADAPTDONE : in std_ulogic;
    PIPERX2EQLPLFFSSEL   : in std_ulogic;
    PIPERX2EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX2PHYSTATUS     : in std_ulogic;
    PIPERX2STARTBLOCK    : in std_ulogic;
    PIPERX2STATUS        : in std_logic_vector(2 downto 0);
    PIPERX2SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX2VALID         : in std_ulogic;
    PIPERX3CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX3DATA          : in std_logic_vector(31 downto 0);
    PIPERX3DATAVALID     : in std_ulogic;
    PIPERX3ELECIDLE      : in std_ulogic;
    PIPERX3EQDONE        : in std_ulogic;
    PIPERX3EQLPADAPTDONE : in std_ulogic;
    PIPERX3EQLPLFFSSEL   : in std_ulogic;
    PIPERX3EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX3PHYSTATUS     : in std_ulogic;
    PIPERX3STARTBLOCK    : in std_ulogic;
    PIPERX3STATUS        : in std_logic_vector(2 downto 0);
    PIPERX3SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX3VALID         : in std_ulogic;
    PIPERX4CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX4DATA          : in std_logic_vector(31 downto 0);
    PIPERX4DATAVALID     : in std_ulogic;
    PIPERX4ELECIDLE      : in std_ulogic;
    PIPERX4EQDONE        : in std_ulogic;
    PIPERX4EQLPADAPTDONE : in std_ulogic;
    PIPERX4EQLPLFFSSEL   : in std_ulogic;
    PIPERX4EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX4PHYSTATUS     : in std_ulogic;
    PIPERX4STARTBLOCK    : in std_ulogic;
    PIPERX4STATUS        : in std_logic_vector(2 downto 0);
    PIPERX4SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX4VALID         : in std_ulogic;
    PIPERX5CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX5DATA          : in std_logic_vector(31 downto 0);
    PIPERX5DATAVALID     : in std_ulogic;
    PIPERX5ELECIDLE      : in std_ulogic;
    PIPERX5EQDONE        : in std_ulogic;
    PIPERX5EQLPADAPTDONE : in std_ulogic;
    PIPERX5EQLPLFFSSEL   : in std_ulogic;
    PIPERX5EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX5PHYSTATUS     : in std_ulogic;
    PIPERX5STARTBLOCK    : in std_ulogic;
    PIPERX5STATUS        : in std_logic_vector(2 downto 0);
    PIPERX5SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX5VALID         : in std_ulogic;
    PIPERX6CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX6DATA          : in std_logic_vector(31 downto 0);
    PIPERX6DATAVALID     : in std_ulogic;
    PIPERX6ELECIDLE      : in std_ulogic;
    PIPERX6EQDONE        : in std_ulogic;
    PIPERX6EQLPADAPTDONE : in std_ulogic;
    PIPERX6EQLPLFFSSEL   : in std_ulogic;
    PIPERX6EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX6PHYSTATUS     : in std_ulogic;
    PIPERX6STARTBLOCK    : in std_ulogic;
    PIPERX6STATUS        : in std_logic_vector(2 downto 0);
    PIPERX6SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX6VALID         : in std_ulogic;
    PIPERX7CHARISK       : in std_logic_vector(1 downto 0);
    PIPERX7DATA          : in std_logic_vector(31 downto 0);
    PIPERX7DATAVALID     : in std_ulogic;
    PIPERX7ELECIDLE      : in std_ulogic;
    PIPERX7EQDONE        : in std_ulogic;
    PIPERX7EQLPADAPTDONE : in std_ulogic;
    PIPERX7EQLPLFFSSEL   : in std_ulogic;
    PIPERX7EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
    PIPERX7PHYSTATUS     : in std_ulogic;
    PIPERX7STARTBLOCK    : in std_ulogic;
    PIPERX7STATUS        : in std_logic_vector(2 downto 0);
    PIPERX7SYNCHEADER    : in std_logic_vector(1 downto 0);
    PIPERX7VALID         : in std_ulogic;
    PIPETX0EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX0EQDONE        : in std_ulogic;
    PIPETX1EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX1EQDONE        : in std_ulogic;
    PIPETX2EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX2EQDONE        : in std_ulogic;
    PIPETX3EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX3EQDONE        : in std_ulogic;
    PIPETX4EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX4EQDONE        : in std_ulogic;
    PIPETX5EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX5EQDONE        : in std_ulogic;
    PIPETX6EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX6EQDONE        : in std_ulogic;
    PIPETX7EQCOEFF       : in std_logic_vector(17 downto 0);
    PIPETX7EQDONE        : in std_ulogic;
    PLEQRESETEIEOSCOUNT  : in std_ulogic;
    PLGEN2UPSTREAMPREFERDEEMPH : in std_ulogic;
    RESETN               : in std_ulogic;
    SAXISCCTDATA         : in std_logic_vector(255 downto 0);
    SAXISCCTKEEP         : in std_logic_vector(7 downto 0);
    SAXISCCTLAST         : in std_ulogic;
    SAXISCCTUSER         : in std_logic_vector(32 downto 0);
    SAXISCCTVALID        : in std_ulogic;
    SAXISRQTDATA         : in std_logic_vector(255 downto 0);
    SAXISRQTKEEP         : in std_logic_vector(7 downto 0);
    SAXISRQTLAST         : in std_ulogic;
    SAXISRQTUSER         : in std_logic_vector(59 downto 0);
    SAXISRQTVALID        : in std_ulogic;
    SPAREIN              : in std_logic_vector(31 downto 0);
    USERCLK              : in std_ulogic    
  );
end PCIE_3_1;

architecture PCIE_3_1_V of PCIE_3_1 is
  component SIP_PCIE_3_1
    generic (
        MCAP_ENABLE_PAR : string := "TRUE";
        SIM_JTAG_IDCODE : std_logic_vector(31 downto 0) := X"00000000"
    );
    port (
        ARI_CAP_ENABLE       : in std_logic_vector(39 downto 0);
        AXISTEN_IF_CC_ALIGNMENT_MODE : in std_logic_vector(39 downto 0);
        AXISTEN_IF_CC_PARITY_CHK : in std_logic_vector(39 downto 0);
        AXISTEN_IF_CQ_ALIGNMENT_MODE : in std_logic_vector(39 downto 0);
        AXISTEN_IF_ENABLE_CLIENT_TAG : in std_logic_vector(39 downto 0);
        AXISTEN_IF_ENABLE_MSG_ROUTE : in std_logic_vector(17 downto 0);
        AXISTEN_IF_ENABLE_RX_MSG_INTFC : in std_logic_vector(39 downto 0);
        AXISTEN_IF_RC_ALIGNMENT_MODE : in std_logic_vector(39 downto 0);
        AXISTEN_IF_RC_STRADDLE : in std_logic_vector(39 downto 0);
        AXISTEN_IF_RQ_ALIGNMENT_MODE : in std_logic_vector(39 downto 0);
        AXISTEN_IF_RQ_PARITY_CHK : in std_logic_vector(39 downto 0);
        AXISTEN_IF_WIDTH     : in std_logic_vector(1 downto 0);
        CRM_CORE_CLK_FREQ_500 : in std_logic_vector(39 downto 0);
        CRM_USER_CLK_FREQ    : in std_logic_vector(1 downto 0);
        DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE : in std_logic_vector(39 downto 0);
        DEBUG_PL_DISABLE_EI_INFER_IN_L0 : in std_logic_vector(39 downto 0);
        DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS : in std_logic_vector(39 downto 0);
        DNSTREAM_LINK_NUM    : in std_logic_vector(7 downto 0);
        LL_ACK_TIMEOUT       : in std_logic_vector(8 downto 0);
        LL_ACK_TIMEOUT_EN    : in std_logic_vector(39 downto 0);
        LL_ACK_TIMEOUT_FUNC  : in std_logic_vector(1 downto 0);
        LL_CPL_FC_UPDATE_TIMER : in std_logic_vector(15 downto 0);
        LL_CPL_FC_UPDATE_TIMER_OVERRIDE : in std_logic_vector(39 downto 0);
        LL_FC_UPDATE_TIMER   : in std_logic_vector(15 downto 0);
        LL_FC_UPDATE_TIMER_OVERRIDE : in std_logic_vector(39 downto 0);
        LL_NP_FC_UPDATE_TIMER : in std_logic_vector(15 downto 0);
        LL_NP_FC_UPDATE_TIMER_OVERRIDE : in std_logic_vector(39 downto 0);
        LL_P_FC_UPDATE_TIMER : in std_logic_vector(15 downto 0);
        LL_P_FC_UPDATE_TIMER_OVERRIDE : in std_logic_vector(39 downto 0);
        LL_REPLAY_TIMEOUT    : in std_logic_vector(8 downto 0);
        LL_REPLAY_TIMEOUT_EN : in std_logic_vector(39 downto 0);
        LL_REPLAY_TIMEOUT_FUNC : in std_logic_vector(1 downto 0);
        LTR_TX_MESSAGE_MINIMUM_INTERVAL : in std_logic_vector(9 downto 0);
        LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE : in std_logic_vector(39 downto 0);
        LTR_TX_MESSAGE_ON_LTR_ENABLE : in std_logic_vector(39 downto 0);
        MCAP_CAP_NEXTPTR     : in std_logic_vector(11 downto 0);
        MCAP_CONFIGURE_OVERRIDE : in std_logic_vector(39 downto 0);
        MCAP_ENABLE          : in std_logic_vector(39 downto 0);
        MCAP_EOS_DESIGN_SWITCH : in std_logic_vector(39 downto 0);
        MCAP_FPGA_BITSTREAM_VERSION : in std_logic_vector(31 downto 0);
        MCAP_GATE_IO_ENABLE_DESIGN_SWITCH : in std_logic_vector(39 downto 0);
        MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH : in std_logic_vector(39 downto 0);
        MCAP_INPUT_GATE_DESIGN_SWITCH : in std_logic_vector(39 downto 0);
        MCAP_INTERRUPT_ON_MCAP_EOS : in std_logic_vector(39 downto 0);
        MCAP_INTERRUPT_ON_MCAP_ERROR : in std_logic_vector(39 downto 0);
        MCAP_VSEC_ID         : in std_logic_vector(15 downto 0);
        MCAP_VSEC_LEN        : in std_logic_vector(11 downto 0);
        MCAP_VSEC_REV        : in std_logic_vector(3 downto 0);
        PF0_AER_CAP_ECRC_CHECK_CAPABLE : in std_logic_vector(39 downto 0);
        PF0_AER_CAP_ECRC_GEN_CAPABLE : in std_logic_vector(39 downto 0);
        PF0_AER_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF0_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF0_ARI_CAP_NEXT_FUNC : in std_logic_vector(7 downto 0);
        PF0_ARI_CAP_VER      : in std_logic_vector(3 downto 0);
        PF0_BAR0_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF0_BAR0_CONTROL     : in std_logic_vector(2 downto 0);
        PF0_BAR1_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF0_BAR1_CONTROL     : in std_logic_vector(2 downto 0);
        PF0_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_BAR2_CONTROL     : in std_logic_vector(2 downto 0);
        PF0_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_BAR3_CONTROL     : in std_logic_vector(2 downto 0);
        PF0_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_BAR4_CONTROL     : in std_logic_vector(2 downto 0);
        PF0_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_BAR5_CONTROL     : in std_logic_vector(2 downto 0);
        PF0_BIST_REGISTER    : in std_logic_vector(7 downto 0);
        PF0_CAPABILITY_POINTER : in std_logic_vector(7 downto 0);
        PF0_CLASS_CODE       : in std_logic_vector(23 downto 0);
        PF0_DEVICE_ID        : in std_logic_vector(15 downto 0);
        PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP2_ARI_FORWARD_ENABLE : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP2_LTR_SUPPORT : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP2_OBFF_SUPPORT : in std_logic_vector(1 downto 0);
        PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP_ENDPOINT_L0S_LATENCY : in std_logic_vector(2 downto 0);
        PF0_DEV_CAP_ENDPOINT_L1_LATENCY : in std_logic_vector(2 downto 0);
        PF0_DEV_CAP_EXT_TAG_SUPPORTED : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE : in std_logic_vector(39 downto 0);
        PF0_DEV_CAP_MAX_PAYLOAD_SIZE : in std_logic_vector(2 downto 0);
        PF0_DPA_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF0_DPA_CAP_SUB_STATE_CONTROL : in std_logic_vector(4 downto 0);
        PF0_DPA_CAP_SUB_STATE_CONTROL_EN : in std_logic_vector(39 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : in std_logic_vector(7 downto 0);
        PF0_DPA_CAP_VER      : in std_logic_vector(3 downto 0);
        PF0_DSN_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF0_EXPANSION_ROM_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_EXPANSION_ROM_ENABLE : in std_logic_vector(39 downto 0);
        PF0_INTERRUPT_LINE   : in std_logic_vector(7 downto 0);
        PF0_INTERRUPT_PIN    : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_ASPM_SUPPORT : in std_logic_vector(1 downto 0);
        PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2 : in std_logic_vector(2 downto 0);
        PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3 : in std_logic_vector(2 downto 0);
        PF0_LINK_STATUS_SLOT_CLOCK_CONFIG : in std_logic_vector(39 downto 0);
        PF0_LTR_CAP_MAX_NOSNOOP_LAT : in std_logic_vector(9 downto 0);
        PF0_LTR_CAP_MAX_SNOOP_LAT : in std_logic_vector(9 downto 0);
        PF0_LTR_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF0_LTR_CAP_VER      : in std_logic_vector(3 downto 0);
        PF0_MSIX_CAP_NEXTPTR : in std_logic_vector(7 downto 0);
        PF0_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        PF0_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        PF0_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        PF0_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        PF0_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF0_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        PF0_MSI_CAP_NEXTPTR  : in std_logic_vector(7 downto 0);
        PF0_MSI_CAP_PERVECMASKCAP : in std_logic_vector(39 downto 0);
        PF0_PB_CAP_DATA_REG_D0 : in std_logic_vector(31 downto 0);
        PF0_PB_CAP_DATA_REG_D0_SUSTAINED : in std_logic_vector(31 downto 0);
        PF0_PB_CAP_DATA_REG_D1 : in std_logic_vector(31 downto 0);
        PF0_PB_CAP_DATA_REG_D3HOT : in std_logic_vector(31 downto 0);
        PF0_PB_CAP_NEXTPTR   : in std_logic_vector(11 downto 0);
        PF0_PB_CAP_SYSTEM_ALLOCATED : in std_logic_vector(39 downto 0);
        PF0_PB_CAP_VER       : in std_logic_vector(3 downto 0);
        PF0_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        PF0_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        PF0_PM_CAP_PMESUPPORT_D0 : in std_logic_vector(39 downto 0);
        PF0_PM_CAP_PMESUPPORT_D1 : in std_logic_vector(39 downto 0);
        PF0_PM_CAP_PMESUPPORT_D3HOT : in std_logic_vector(39 downto 0);
        PF0_PM_CAP_SUPP_D1_STATE : in std_logic_vector(39 downto 0);
        PF0_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        PF0_PM_CSR_NOSOFTRESET : in std_logic_vector(39 downto 0);
        PF0_RBAR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF0_RBAR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF0_RBAR_CAP_SIZE0   : in std_logic_vector(19 downto 0);
        PF0_RBAR_CAP_SIZE1   : in std_logic_vector(19 downto 0);
        PF0_RBAR_CAP_SIZE2   : in std_logic_vector(19 downto 0);
        PF0_RBAR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF0_RBAR_CONTROL_INDEX0 : in std_logic_vector(2 downto 0);
        PF0_RBAR_CONTROL_INDEX1 : in std_logic_vector(2 downto 0);
        PF0_RBAR_CONTROL_INDEX2 : in std_logic_vector(2 downto 0);
        PF0_RBAR_CONTROL_SIZE0 : in std_logic_vector(4 downto 0);
        PF0_RBAR_CONTROL_SIZE1 : in std_logic_vector(4 downto 0);
        PF0_RBAR_CONTROL_SIZE2 : in std_logic_vector(4 downto 0);
        PF0_RBAR_NUM         : in std_logic_vector(2 downto 0);
        PF0_REVISION_ID      : in std_logic_vector(7 downto 0);
        PF0_SECONDARY_PCIE_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF0_SRIOV_BAR0_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_SRIOV_BAR0_CONTROL : in std_logic_vector(2 downto 0);
        PF0_SRIOV_BAR1_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_SRIOV_BAR1_CONTROL : in std_logic_vector(2 downto 0);
        PF0_SRIOV_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_SRIOV_BAR2_CONTROL : in std_logic_vector(2 downto 0);
        PF0_SRIOV_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_SRIOV_BAR3_CONTROL : in std_logic_vector(2 downto 0);
        PF0_SRIOV_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_SRIOV_BAR4_CONTROL : in std_logic_vector(2 downto 0);
        PF0_SRIOV_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF0_SRIOV_BAR5_CONTROL : in std_logic_vector(2 downto 0);
        PF0_SRIOV_CAP_INITIAL_VF : in std_logic_vector(15 downto 0);
        PF0_SRIOV_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF0_SRIOV_CAP_TOTAL_VF : in std_logic_vector(15 downto 0);
        PF0_SRIOV_CAP_VER    : in std_logic_vector(3 downto 0);
        PF0_SRIOV_FIRST_VF_OFFSET : in std_logic_vector(15 downto 0);
        PF0_SRIOV_FUNC_DEP_LINK : in std_logic_vector(15 downto 0);
        PF0_SRIOV_SUPPORTED_PAGE_SIZE : in std_logic_vector(31 downto 0);
        PF0_SRIOV_VF_DEVICE_ID : in std_logic_vector(15 downto 0);
        PF0_SUBSYSTEM_ID     : in std_logic_vector(15 downto 0);
        PF0_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        PF0_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF0_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        PF0_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF0_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        PF0_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        PF0_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF0_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF0_VC_CAP_ENABLE    : in std_logic_vector(39 downto 0);
        PF0_VC_CAP_NEXTPTR   : in std_logic_vector(11 downto 0);
        PF0_VC_CAP_VER       : in std_logic_vector(3 downto 0);
        PF1_AER_CAP_ECRC_CHECK_CAPABLE : in std_logic_vector(39 downto 0);
        PF1_AER_CAP_ECRC_GEN_CAPABLE : in std_logic_vector(39 downto 0);
        PF1_AER_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF1_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF1_ARI_CAP_NEXT_FUNC : in std_logic_vector(7 downto 0);
        PF1_BAR0_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF1_BAR0_CONTROL     : in std_logic_vector(2 downto 0);
        PF1_BAR1_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF1_BAR1_CONTROL     : in std_logic_vector(2 downto 0);
        PF1_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_BAR2_CONTROL     : in std_logic_vector(2 downto 0);
        PF1_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_BAR3_CONTROL     : in std_logic_vector(2 downto 0);
        PF1_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_BAR4_CONTROL     : in std_logic_vector(2 downto 0);
        PF1_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_BAR5_CONTROL     : in std_logic_vector(2 downto 0);
        PF1_BIST_REGISTER    : in std_logic_vector(7 downto 0);
        PF1_CAPABILITY_POINTER : in std_logic_vector(7 downto 0);
        PF1_CLASS_CODE       : in std_logic_vector(23 downto 0);
        PF1_DEVICE_ID        : in std_logic_vector(15 downto 0);
        PF1_DEV_CAP_MAX_PAYLOAD_SIZE : in std_logic_vector(2 downto 0);
        PF1_DPA_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF1_DPA_CAP_SUB_STATE_CONTROL : in std_logic_vector(4 downto 0);
        PF1_DPA_CAP_SUB_STATE_CONTROL_EN : in std_logic_vector(39 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : in std_logic_vector(7 downto 0);
        PF1_DPA_CAP_VER      : in std_logic_vector(3 downto 0);
        PF1_DSN_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF1_EXPANSION_ROM_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_EXPANSION_ROM_ENABLE : in std_logic_vector(39 downto 0);
        PF1_INTERRUPT_LINE   : in std_logic_vector(7 downto 0);
        PF1_INTERRUPT_PIN    : in std_logic_vector(2 downto 0);
        PF1_MSIX_CAP_NEXTPTR : in std_logic_vector(7 downto 0);
        PF1_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        PF1_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        PF1_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        PF1_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        PF1_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF1_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        PF1_MSI_CAP_NEXTPTR  : in std_logic_vector(7 downto 0);
        PF1_MSI_CAP_PERVECMASKCAP : in std_logic_vector(39 downto 0);
        PF1_PB_CAP_DATA_REG_D0 : in std_logic_vector(31 downto 0);
        PF1_PB_CAP_DATA_REG_D0_SUSTAINED : in std_logic_vector(31 downto 0);
        PF1_PB_CAP_DATA_REG_D1 : in std_logic_vector(31 downto 0);
        PF1_PB_CAP_DATA_REG_D3HOT : in std_logic_vector(31 downto 0);
        PF1_PB_CAP_NEXTPTR   : in std_logic_vector(11 downto 0);
        PF1_PB_CAP_SYSTEM_ALLOCATED : in std_logic_vector(39 downto 0);
        PF1_PB_CAP_VER       : in std_logic_vector(3 downto 0);
        PF1_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        PF1_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        PF1_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        PF1_RBAR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF1_RBAR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF1_RBAR_CAP_SIZE0   : in std_logic_vector(19 downto 0);
        PF1_RBAR_CAP_SIZE1   : in std_logic_vector(19 downto 0);
        PF1_RBAR_CAP_SIZE2   : in std_logic_vector(19 downto 0);
        PF1_RBAR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF1_RBAR_CONTROL_INDEX0 : in std_logic_vector(2 downto 0);
        PF1_RBAR_CONTROL_INDEX1 : in std_logic_vector(2 downto 0);
        PF1_RBAR_CONTROL_INDEX2 : in std_logic_vector(2 downto 0);
        PF1_RBAR_CONTROL_SIZE0 : in std_logic_vector(4 downto 0);
        PF1_RBAR_CONTROL_SIZE1 : in std_logic_vector(4 downto 0);
        PF1_RBAR_CONTROL_SIZE2 : in std_logic_vector(4 downto 0);
        PF1_RBAR_NUM         : in std_logic_vector(2 downto 0);
        PF1_REVISION_ID      : in std_logic_vector(7 downto 0);
        PF1_SRIOV_BAR0_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_SRIOV_BAR0_CONTROL : in std_logic_vector(2 downto 0);
        PF1_SRIOV_BAR1_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_SRIOV_BAR1_CONTROL : in std_logic_vector(2 downto 0);
        PF1_SRIOV_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_SRIOV_BAR2_CONTROL : in std_logic_vector(2 downto 0);
        PF1_SRIOV_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_SRIOV_BAR3_CONTROL : in std_logic_vector(2 downto 0);
        PF1_SRIOV_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_SRIOV_BAR4_CONTROL : in std_logic_vector(2 downto 0);
        PF1_SRIOV_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF1_SRIOV_BAR5_CONTROL : in std_logic_vector(2 downto 0);
        PF1_SRIOV_CAP_INITIAL_VF : in std_logic_vector(15 downto 0);
        PF1_SRIOV_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF1_SRIOV_CAP_TOTAL_VF : in std_logic_vector(15 downto 0);
        PF1_SRIOV_CAP_VER    : in std_logic_vector(3 downto 0);
        PF1_SRIOV_FIRST_VF_OFFSET : in std_logic_vector(15 downto 0);
        PF1_SRIOV_FUNC_DEP_LINK : in std_logic_vector(15 downto 0);
        PF1_SRIOV_SUPPORTED_PAGE_SIZE : in std_logic_vector(31 downto 0);
        PF1_SRIOV_VF_DEVICE_ID : in std_logic_vector(15 downto 0);
        PF1_SUBSYSTEM_ID     : in std_logic_vector(15 downto 0);
        PF1_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        PF1_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF1_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        PF1_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF1_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        PF1_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        PF1_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF1_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF2_AER_CAP_ECRC_CHECK_CAPABLE : in std_logic_vector(39 downto 0);
        PF2_AER_CAP_ECRC_GEN_CAPABLE : in std_logic_vector(39 downto 0);
        PF2_AER_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF2_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF2_ARI_CAP_NEXT_FUNC : in std_logic_vector(7 downto 0);
        PF2_BAR0_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF2_BAR0_CONTROL     : in std_logic_vector(2 downto 0);
        PF2_BAR1_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF2_BAR1_CONTROL     : in std_logic_vector(2 downto 0);
        PF2_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_BAR2_CONTROL     : in std_logic_vector(2 downto 0);
        PF2_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_BAR3_CONTROL     : in std_logic_vector(2 downto 0);
        PF2_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_BAR4_CONTROL     : in std_logic_vector(2 downto 0);
        PF2_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_BAR5_CONTROL     : in std_logic_vector(2 downto 0);
        PF2_BIST_REGISTER    : in std_logic_vector(7 downto 0);
        PF2_CAPABILITY_POINTER : in std_logic_vector(7 downto 0);
        PF2_CLASS_CODE       : in std_logic_vector(23 downto 0);
        PF2_DEVICE_ID        : in std_logic_vector(15 downto 0);
        PF2_DEV_CAP_MAX_PAYLOAD_SIZE : in std_logic_vector(2 downto 0);
        PF2_DPA_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF2_DPA_CAP_SUB_STATE_CONTROL : in std_logic_vector(4 downto 0);
        PF2_DPA_CAP_SUB_STATE_CONTROL_EN : in std_logic_vector(39 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : in std_logic_vector(7 downto 0);
        PF2_DPA_CAP_VER      : in std_logic_vector(3 downto 0);
        PF2_DSN_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF2_EXPANSION_ROM_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_EXPANSION_ROM_ENABLE : in std_logic_vector(39 downto 0);
        PF2_INTERRUPT_LINE   : in std_logic_vector(7 downto 0);
        PF2_INTERRUPT_PIN    : in std_logic_vector(2 downto 0);
        PF2_MSIX_CAP_NEXTPTR : in std_logic_vector(7 downto 0);
        PF2_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        PF2_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        PF2_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        PF2_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        PF2_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF2_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        PF2_MSI_CAP_NEXTPTR  : in std_logic_vector(7 downto 0);
        PF2_MSI_CAP_PERVECMASKCAP : in std_logic_vector(39 downto 0);
        PF2_PB_CAP_DATA_REG_D0 : in std_logic_vector(31 downto 0);
        PF2_PB_CAP_DATA_REG_D0_SUSTAINED : in std_logic_vector(31 downto 0);
        PF2_PB_CAP_DATA_REG_D1 : in std_logic_vector(31 downto 0);
        PF2_PB_CAP_DATA_REG_D3HOT : in std_logic_vector(31 downto 0);
        PF2_PB_CAP_NEXTPTR   : in std_logic_vector(11 downto 0);
        PF2_PB_CAP_SYSTEM_ALLOCATED : in std_logic_vector(39 downto 0);
        PF2_PB_CAP_VER       : in std_logic_vector(3 downto 0);
        PF2_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        PF2_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        PF2_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        PF2_RBAR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF2_RBAR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF2_RBAR_CAP_SIZE0   : in std_logic_vector(19 downto 0);
        PF2_RBAR_CAP_SIZE1   : in std_logic_vector(19 downto 0);
        PF2_RBAR_CAP_SIZE2   : in std_logic_vector(19 downto 0);
        PF2_RBAR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF2_RBAR_CONTROL_INDEX0 : in std_logic_vector(2 downto 0);
        PF2_RBAR_CONTROL_INDEX1 : in std_logic_vector(2 downto 0);
        PF2_RBAR_CONTROL_INDEX2 : in std_logic_vector(2 downto 0);
        PF2_RBAR_CONTROL_SIZE0 : in std_logic_vector(4 downto 0);
        PF2_RBAR_CONTROL_SIZE1 : in std_logic_vector(4 downto 0);
        PF2_RBAR_CONTROL_SIZE2 : in std_logic_vector(4 downto 0);
        PF2_RBAR_NUM         : in std_logic_vector(2 downto 0);
        PF2_REVISION_ID      : in std_logic_vector(7 downto 0);
        PF2_SRIOV_BAR0_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_SRIOV_BAR0_CONTROL : in std_logic_vector(2 downto 0);
        PF2_SRIOV_BAR1_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_SRIOV_BAR1_CONTROL : in std_logic_vector(2 downto 0);
        PF2_SRIOV_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_SRIOV_BAR2_CONTROL : in std_logic_vector(2 downto 0);
        PF2_SRIOV_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_SRIOV_BAR3_CONTROL : in std_logic_vector(2 downto 0);
        PF2_SRIOV_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_SRIOV_BAR4_CONTROL : in std_logic_vector(2 downto 0);
        PF2_SRIOV_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF2_SRIOV_BAR5_CONTROL : in std_logic_vector(2 downto 0);
        PF2_SRIOV_CAP_INITIAL_VF : in std_logic_vector(15 downto 0);
        PF2_SRIOV_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF2_SRIOV_CAP_TOTAL_VF : in std_logic_vector(15 downto 0);
        PF2_SRIOV_CAP_VER    : in std_logic_vector(3 downto 0);
        PF2_SRIOV_FIRST_VF_OFFSET : in std_logic_vector(15 downto 0);
        PF2_SRIOV_FUNC_DEP_LINK : in std_logic_vector(15 downto 0);
        PF2_SRIOV_SUPPORTED_PAGE_SIZE : in std_logic_vector(31 downto 0);
        PF2_SRIOV_VF_DEVICE_ID : in std_logic_vector(15 downto 0);
        PF2_SUBSYSTEM_ID     : in std_logic_vector(15 downto 0);
        PF2_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        PF2_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF2_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        PF2_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF2_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        PF2_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        PF2_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF2_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF3_AER_CAP_ECRC_CHECK_CAPABLE : in std_logic_vector(39 downto 0);
        PF3_AER_CAP_ECRC_GEN_CAPABLE : in std_logic_vector(39 downto 0);
        PF3_AER_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF3_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF3_ARI_CAP_NEXT_FUNC : in std_logic_vector(7 downto 0);
        PF3_BAR0_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF3_BAR0_CONTROL     : in std_logic_vector(2 downto 0);
        PF3_BAR1_APERTURE_SIZE : in std_logic_vector(5 downto 0);
        PF3_BAR1_CONTROL     : in std_logic_vector(2 downto 0);
        PF3_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_BAR2_CONTROL     : in std_logic_vector(2 downto 0);
        PF3_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_BAR3_CONTROL     : in std_logic_vector(2 downto 0);
        PF3_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_BAR4_CONTROL     : in std_logic_vector(2 downto 0);
        PF3_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_BAR5_CONTROL     : in std_logic_vector(2 downto 0);
        PF3_BIST_REGISTER    : in std_logic_vector(7 downto 0);
        PF3_CAPABILITY_POINTER : in std_logic_vector(7 downto 0);
        PF3_CLASS_CODE       : in std_logic_vector(23 downto 0);
        PF3_DEVICE_ID        : in std_logic_vector(15 downto 0);
        PF3_DEV_CAP_MAX_PAYLOAD_SIZE : in std_logic_vector(2 downto 0);
        PF3_DPA_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF3_DPA_CAP_SUB_STATE_CONTROL : in std_logic_vector(4 downto 0);
        PF3_DPA_CAP_SUB_STATE_CONTROL_EN : in std_logic_vector(39 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 : in std_logic_vector(7 downto 0);
        PF3_DPA_CAP_VER      : in std_logic_vector(3 downto 0);
        PF3_DSN_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        PF3_EXPANSION_ROM_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_EXPANSION_ROM_ENABLE : in std_logic_vector(39 downto 0);
        PF3_INTERRUPT_LINE   : in std_logic_vector(7 downto 0);
        PF3_INTERRUPT_PIN    : in std_logic_vector(2 downto 0);
        PF3_MSIX_CAP_NEXTPTR : in std_logic_vector(7 downto 0);
        PF3_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        PF3_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        PF3_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        PF3_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        PF3_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF3_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        PF3_MSI_CAP_NEXTPTR  : in std_logic_vector(7 downto 0);
        PF3_MSI_CAP_PERVECMASKCAP : in std_logic_vector(39 downto 0);
        PF3_PB_CAP_DATA_REG_D0 : in std_logic_vector(31 downto 0);
        PF3_PB_CAP_DATA_REG_D0_SUSTAINED : in std_logic_vector(31 downto 0);
        PF3_PB_CAP_DATA_REG_D1 : in std_logic_vector(31 downto 0);
        PF3_PB_CAP_DATA_REG_D3HOT : in std_logic_vector(31 downto 0);
        PF3_PB_CAP_NEXTPTR   : in std_logic_vector(11 downto 0);
        PF3_PB_CAP_SYSTEM_ALLOCATED : in std_logic_vector(39 downto 0);
        PF3_PB_CAP_VER       : in std_logic_vector(3 downto 0);
        PF3_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        PF3_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        PF3_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        PF3_RBAR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF3_RBAR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF3_RBAR_CAP_SIZE0   : in std_logic_vector(19 downto 0);
        PF3_RBAR_CAP_SIZE1   : in std_logic_vector(19 downto 0);
        PF3_RBAR_CAP_SIZE2   : in std_logic_vector(19 downto 0);
        PF3_RBAR_CAP_VER     : in std_logic_vector(3 downto 0);
        PF3_RBAR_CONTROL_INDEX0 : in std_logic_vector(2 downto 0);
        PF3_RBAR_CONTROL_INDEX1 : in std_logic_vector(2 downto 0);
        PF3_RBAR_CONTROL_INDEX2 : in std_logic_vector(2 downto 0);
        PF3_RBAR_CONTROL_SIZE0 : in std_logic_vector(4 downto 0);
        PF3_RBAR_CONTROL_SIZE1 : in std_logic_vector(4 downto 0);
        PF3_RBAR_CONTROL_SIZE2 : in std_logic_vector(4 downto 0);
        PF3_RBAR_NUM         : in std_logic_vector(2 downto 0);
        PF3_REVISION_ID      : in std_logic_vector(7 downto 0);
        PF3_SRIOV_BAR0_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_SRIOV_BAR0_CONTROL : in std_logic_vector(2 downto 0);
        PF3_SRIOV_BAR1_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_SRIOV_BAR1_CONTROL : in std_logic_vector(2 downto 0);
        PF3_SRIOV_BAR2_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_SRIOV_BAR2_CONTROL : in std_logic_vector(2 downto 0);
        PF3_SRIOV_BAR3_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_SRIOV_BAR3_CONTROL : in std_logic_vector(2 downto 0);
        PF3_SRIOV_BAR4_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_SRIOV_BAR4_CONTROL : in std_logic_vector(2 downto 0);
        PF3_SRIOV_BAR5_APERTURE_SIZE : in std_logic_vector(4 downto 0);
        PF3_SRIOV_BAR5_CONTROL : in std_logic_vector(2 downto 0);
        PF3_SRIOV_CAP_INITIAL_VF : in std_logic_vector(15 downto 0);
        PF3_SRIOV_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF3_SRIOV_CAP_TOTAL_VF : in std_logic_vector(15 downto 0);
        PF3_SRIOV_CAP_VER    : in std_logic_vector(3 downto 0);
        PF3_SRIOV_FIRST_VF_OFFSET : in std_logic_vector(15 downto 0);
        PF3_SRIOV_FUNC_DEP_LINK : in std_logic_vector(15 downto 0);
        PF3_SRIOV_SUPPORTED_PAGE_SIZE : in std_logic_vector(31 downto 0);
        PF3_SRIOV_VF_DEVICE_ID : in std_logic_vector(15 downto 0);
        PF3_SUBSYSTEM_ID     : in std_logic_vector(15 downto 0);
        PF3_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        PF3_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        PF3_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        PF3_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        PF3_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        PF3_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        PF3_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        PF3_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 : in std_logic_vector(39 downto 0);
        PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 : in std_logic_vector(39 downto 0);
        PL_DISABLE_EI_INFER_IN_L0 : in std_logic_vector(39 downto 0);
        PL_DISABLE_GEN3_DC_BALANCE : in std_logic_vector(39 downto 0);
        PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP : in std_logic_vector(39 downto 0);
        PL_DISABLE_RETRAIN_ON_FRAMING_ERROR : in std_logic_vector(39 downto 0);
        PL_DISABLE_SCRAMBLING : in std_logic_vector(39 downto 0);
        PL_DISABLE_SYNC_HEADER_FRAMING_ERROR : in std_logic_vector(39 downto 0);
        PL_DISABLE_UPCONFIG_CAPABLE : in std_logic_vector(39 downto 0);
        PL_EQ_ADAPT_DISABLE_COEFF_CHECK : in std_logic_vector(39 downto 0);
        PL_EQ_ADAPT_DISABLE_PRESET_CHECK : in std_logic_vector(39 downto 0);
        PL_EQ_ADAPT_ITER_COUNT : in std_logic_vector(4 downto 0);
        PL_EQ_ADAPT_REJECT_RETRY_COUNT : in std_logic_vector(1 downto 0);
        PL_EQ_BYPASS_PHASE23 : in std_logic_vector(39 downto 0);
        PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT : in std_logic_vector(2 downto 0);
        PL_EQ_DEFAULT_GEN3_TX_PRESET : in std_logic_vector(3 downto 0);
        PL_EQ_PHASE01_RX_ADAPT : in std_logic_vector(39 downto 0);
        PL_EQ_SHORT_ADAPT_PHASE : in std_logic_vector(39 downto 0);
        PL_LANE0_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE1_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE2_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE3_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE4_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE5_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE6_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LANE7_EQ_CONTROL  : in std_logic_vector(15 downto 0);
        PL_LINK_CAP_MAX_LINK_SPEED : in std_logic_vector(2 downto 0);
        PL_LINK_CAP_MAX_LINK_WIDTH : in std_logic_vector(3 downto 0);
        PL_N_FTS_COMCLK_GEN1 : in std_logic_vector(7 downto 0);
        PL_N_FTS_COMCLK_GEN2 : in std_logic_vector(7 downto 0);
        PL_N_FTS_COMCLK_GEN3 : in std_logic_vector(7 downto 0);
        PL_N_FTS_GEN1        : in std_logic_vector(7 downto 0);
        PL_N_FTS_GEN2        : in std_logic_vector(7 downto 0);
        PL_N_FTS_GEN3        : in std_logic_vector(7 downto 0);
        PL_REPORT_ALL_PHY_ERRORS : in std_logic_vector(39 downto 0);
        PL_SIM_FAST_LINK_TRAINING : in std_logic_vector(39 downto 0);
        PL_UPSTREAM_FACING   : in std_logic_vector(39 downto 0);
        PM_ASPML0S_TIMEOUT   : in std_logic_vector(15 downto 0);
        PM_ASPML1_ENTRY_DELAY : in std_logic_vector(19 downto 0);
        PM_ENABLE_L23_ENTRY  : in std_logic_vector(39 downto 0);
        PM_ENABLE_SLOT_POWER_CAPTURE : in std_logic_vector(39 downto 0);
        PM_L1_REENTRY_DELAY  : in std_logic_vector(31 downto 0);
        PM_PME_SERVICE_TIMEOUT_DELAY : in std_logic_vector(19 downto 0);
        PM_PME_TURNOFF_ACK_DELAY : in std_logic_vector(15 downto 0);
        SPARE_BIT0           : in std_logic_vector(0 downto 0);
        SPARE_BIT1           : in std_logic_vector(0 downto 0);
        SPARE_BIT2           : in std_logic_vector(0 downto 0);
        SPARE_BIT3           : in std_logic_vector(0 downto 0);
        SPARE_BIT4           : in std_logic_vector(0 downto 0);
        SPARE_BIT5           : in std_logic_vector(0 downto 0);
        SPARE_BIT6           : in std_logic_vector(0 downto 0);
        SPARE_BIT7           : in std_logic_vector(0 downto 0);
        SPARE_BIT8           : in std_logic_vector(0 downto 0);
        SPARE_BYTE0          : in std_logic_vector(7 downto 0);
        SPARE_BYTE1          : in std_logic_vector(7 downto 0);
        SPARE_BYTE2          : in std_logic_vector(7 downto 0);
        SPARE_BYTE3          : in std_logic_vector(7 downto 0);
        SPARE_WORD0          : in std_logic_vector(31 downto 0);
        SPARE_WORD1          : in std_logic_vector(31 downto 0);
        SPARE_WORD2          : in std_logic_vector(31 downto 0);
        SPARE_WORD3          : in std_logic_vector(31 downto 0);
        SRIOV_CAP_ENABLE     : in std_logic_vector(39 downto 0);
        TEST_MODE_PIN_CHAR   : in std_logic_vector(39 downto 0);
        TL_COMPLETION_RAM_SIZE_16K : in std_logic_vector(39 downto 0);
        TL_COMPL_TIMEOUT_REG0 : in std_logic_vector(23 downto 0);
        TL_COMPL_TIMEOUT_REG1 : in std_logic_vector(27 downto 0);
        TL_CREDITS_CD        : in std_logic_vector(11 downto 0);
        TL_CREDITS_CH        : in std_logic_vector(7 downto 0);
        TL_CREDITS_NPD       : in std_logic_vector(11 downto 0);
        TL_CREDITS_NPH       : in std_logic_vector(7 downto 0);
        TL_CREDITS_PD        : in std_logic_vector(11 downto 0);
        TL_CREDITS_PH        : in std_logic_vector(7 downto 0);
        TL_ENABLE_MESSAGE_RID_CHECK_ENABLE : in std_logic_vector(39 downto 0);
        TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE : in std_logic_vector(39 downto 0);
        TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE : in std_logic_vector(39 downto 0);
        TL_LEGACY_MODE_ENABLE : in std_logic_vector(39 downto 0);
        TL_PF_ENABLE_REG     : in std_logic_vector(1 downto 0);
        TL_TX_MUX_STRICT_PRIORITY : in std_logic_vector(39 downto 0);
        TWO_LAYER_MODE_DLCMSM_ENABLE : in std_logic_vector(39 downto 0);
        TWO_LAYER_MODE_ENABLE : in std_logic_vector(39 downto 0);
        TWO_LAYER_MODE_WIDTH_256 : in std_logic_vector(39 downto 0);
        VF0_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF0_CAPABILITY_POINTER : in std_logic_vector(7 downto 0);
        VF0_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF0_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF0_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF0_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF0_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF0_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF0_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF0_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF0_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF0_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF0_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF0_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF0_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF0_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF0_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF0_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF0_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF1_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF1_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF1_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF1_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF1_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF1_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF1_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF1_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF1_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF1_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF1_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF1_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF1_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF1_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF1_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF1_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF1_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF1_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF2_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF2_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF2_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF2_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF2_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF2_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF2_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF2_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF2_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF2_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF2_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF2_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF2_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF2_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF2_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF2_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF2_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF2_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF3_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF3_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF3_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF3_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF3_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF3_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF3_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF3_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF3_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF3_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF3_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF3_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF3_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF3_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF3_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF3_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF3_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF3_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF4_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF4_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF4_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF4_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF4_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF4_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF4_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF4_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF4_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF4_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF4_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF4_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF4_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF4_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF4_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF4_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF4_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF4_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF5_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF5_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF5_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF5_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF5_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF5_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF5_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF5_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF5_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF5_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF5_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF5_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF5_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF5_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF5_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF5_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF5_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF5_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF6_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF6_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF6_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF6_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF6_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF6_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF6_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF6_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF6_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF6_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF6_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF6_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF6_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF6_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF6_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF6_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF6_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF6_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        VF7_ARI_CAP_NEXTPTR  : in std_logic_vector(11 downto 0);
        VF7_MSIX_CAP_PBA_BIR : in std_logic_vector(2 downto 0);
        VF7_MSIX_CAP_PBA_OFFSET : in std_logic_vector(28 downto 0);
        VF7_MSIX_CAP_TABLE_BIR : in std_logic_vector(2 downto 0);
        VF7_MSIX_CAP_TABLE_OFFSET : in std_logic_vector(28 downto 0);
        VF7_MSIX_CAP_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF7_MSI_CAP_MULTIMSGCAP : in std_logic_vector(2 downto 0);
        VF7_PM_CAP_ID        : in std_logic_vector(7 downto 0);
        VF7_PM_CAP_NEXTPTR   : in std_logic_vector(7 downto 0);
        VF7_PM_CAP_VER_ID    : in std_logic_vector(2 downto 0);
        VF7_TPHR_CAP_DEV_SPECIFIC_MODE : in std_logic_vector(39 downto 0);
        VF7_TPHR_CAP_ENABLE  : in std_logic_vector(39 downto 0);
        VF7_TPHR_CAP_INT_VEC_MODE : in std_logic_vector(39 downto 0);
        VF7_TPHR_CAP_NEXTPTR : in std_logic_vector(11 downto 0);
        VF7_TPHR_CAP_ST_MODE_SEL : in std_logic_vector(2 downto 0);
        VF7_TPHR_CAP_ST_TABLE_LOC : in std_logic_vector(1 downto 0);
        VF7_TPHR_CAP_ST_TABLE_SIZE : in std_logic_vector(10 downto 0);
        VF7_TPHR_CAP_VER     : in std_logic_vector(3 downto 0);
        CFGCURRENTSPEED      : out std_logic_vector(2 downto 0);
        CFGDPASUBSTATECHANGE : out std_logic_vector(3 downto 0);
        CFGERRCOROUT         : out std_ulogic;
        CFGERRFATALOUT       : out std_ulogic;
        CFGERRNONFATALOUT    : out std_ulogic;
        CFGEXTFUNCTIONNUMBER : out std_logic_vector(7 downto 0);
        CFGEXTREADRECEIVED   : out std_ulogic;
        CFGEXTREGISTERNUMBER : out std_logic_vector(9 downto 0);
        CFGEXTWRITEBYTEENABLE : out std_logic_vector(3 downto 0);
        CFGEXTWRITEDATA      : out std_logic_vector(31 downto 0);
        CFGEXTWRITERECEIVED  : out std_ulogic;
        CFGFCCPLD            : out std_logic_vector(11 downto 0);
        CFGFCCPLH            : out std_logic_vector(7 downto 0);
        CFGFCNPD             : out std_logic_vector(11 downto 0);
        CFGFCNPH             : out std_logic_vector(7 downto 0);
        CFGFCPD              : out std_logic_vector(11 downto 0);
        CFGFCPH              : out std_logic_vector(7 downto 0);
        CFGFLRINPROCESS      : out std_logic_vector(3 downto 0);
        CFGFUNCTIONPOWERSTATE : out std_logic_vector(11 downto 0);
        CFGFUNCTIONSTATUS    : out std_logic_vector(15 downto 0);
        CFGHOTRESETOUT       : out std_ulogic;
        CFGINTERRUPTMSIDATA  : out std_logic_vector(31 downto 0);
        CFGINTERRUPTMSIENABLE : out std_logic_vector(3 downto 0);
        CFGINTERRUPTMSIFAIL  : out std_ulogic;
        CFGINTERRUPTMSIMASKUPDATE : out std_ulogic;
        CFGINTERRUPTMSIMMENABLE : out std_logic_vector(11 downto 0);
        CFGINTERRUPTMSISENT  : out std_ulogic;
        CFGINTERRUPTMSIVFENABLE : out std_logic_vector(7 downto 0);
        CFGINTERRUPTMSIXENABLE : out std_logic_vector(3 downto 0);
        CFGINTERRUPTMSIXFAIL : out std_ulogic;
        CFGINTERRUPTMSIXMASK : out std_logic_vector(3 downto 0);
        CFGINTERRUPTMSIXSENT : out std_ulogic;
        CFGINTERRUPTMSIXVFENABLE : out std_logic_vector(7 downto 0);
        CFGINTERRUPTMSIXVFMASK : out std_logic_vector(7 downto 0);
        CFGINTERRUPTSENT     : out std_ulogic;
        CFGLINKPOWERSTATE    : out std_logic_vector(1 downto 0);
        CFGLOCALERROR        : out std_ulogic;
        CFGLTRENABLE         : out std_ulogic;
        CFGLTSSMSTATE        : out std_logic_vector(5 downto 0);
        CFGMAXPAYLOAD        : out std_logic_vector(2 downto 0);
        CFGMAXREADREQ        : out std_logic_vector(2 downto 0);
        CFGMGMTREADDATA      : out std_logic_vector(31 downto 0);
        CFGMGMTREADWRITEDONE : out std_ulogic;
        CFGMSGRECEIVED       : out std_ulogic;
        CFGMSGRECEIVEDDATA   : out std_logic_vector(7 downto 0);
        CFGMSGRECEIVEDTYPE   : out std_logic_vector(4 downto 0);
        CFGMSGTRANSMITDONE   : out std_ulogic;
        CFGNEGOTIATEDWIDTH   : out std_logic_vector(3 downto 0);
        CFGOBFFENABLE        : out std_logic_vector(1 downto 0);
        CFGPERFUNCSTATUSDATA : out std_logic_vector(15 downto 0);
        CFGPERFUNCTIONUPDATEDONE : out std_ulogic;
        CFGPHYLINKDOWN       : out std_ulogic;
        CFGPHYLINKSTATUS     : out std_logic_vector(1 downto 0);
        CFGPLSTATUSCHANGE    : out std_ulogic;
        CFGPOWERSTATECHANGEINTERRUPT : out std_ulogic;
        CFGRCBSTATUS         : out std_logic_vector(3 downto 0);
        CFGTPHFUNCTIONNUM    : out std_logic_vector(3 downto 0);
        CFGTPHREQUESTERENABLE : out std_logic_vector(3 downto 0);
        CFGTPHSTMODE         : out std_logic_vector(11 downto 0);
        CFGTPHSTTADDRESS     : out std_logic_vector(4 downto 0);
        CFGTPHSTTREADENABLE  : out std_ulogic;
        CFGTPHSTTWRITEBYTEVALID : out std_logic_vector(3 downto 0);
        CFGTPHSTTWRITEDATA   : out std_logic_vector(31 downto 0);
        CFGTPHSTTWRITEENABLE : out std_ulogic;
        CFGVFFLRINPROCESS    : out std_logic_vector(7 downto 0);
        CFGVFPOWERSTATE      : out std_logic_vector(23 downto 0);
        CFGVFSTATUS          : out std_logic_vector(15 downto 0);
        CFGVFTPHREQUESTERENABLE : out std_logic_vector(7 downto 0);
        CFGVFTPHSTMODE       : out std_logic_vector(23 downto 0);
        CONFMCAPDESIGNSWITCH : out std_ulogic;
        CONFMCAPEOS          : out std_ulogic;
        CONFMCAPINUSEBYPCIE  : out std_ulogic;
        CONFREQREADY         : out std_ulogic;
        CONFRESPRDATA        : out std_logic_vector(31 downto 0);
        CONFRESPVALID        : out std_ulogic;
        DBGDATAOUT           : out std_logic_vector(15 downto 0);
        DBGMCAPCSB           : out std_ulogic;
        DBGMCAPDATA          : out std_logic_vector(31 downto 0);
        DBGMCAPEOS           : out std_ulogic;
        DBGMCAPERROR         : out std_ulogic;
        DBGMCAPMODE          : out std_ulogic;
        DBGMCAPRDATAVALID    : out std_ulogic;
        DBGMCAPRDWRB         : out std_ulogic;
        DBGMCAPRESET         : out std_ulogic;
        DBGPLDATABLOCKRECEIVEDAFTEREDS : out std_ulogic;
        DBGPLGEN3FRAMINGERRORDETECTED : out std_ulogic;
        DBGPLGEN3SYNCHEADERERRORDETECTED : out std_ulogic;
        DBGPLINFERREDRXELECTRICALIDLE : out std_logic_vector(7 downto 0);
        DRPDO                : out std_logic_vector(15 downto 0);
        DRPRDY               : out std_ulogic;
        LL2LMMASTERTLPSENT0  : out std_ulogic;
        LL2LMMASTERTLPSENT1  : out std_ulogic;
        LL2LMMASTERTLPSENTTLPID0 : out std_logic_vector(3 downto 0);
        LL2LMMASTERTLPSENTTLPID1 : out std_logic_vector(3 downto 0);
        LL2LMMAXISRXTDATA    : out std_logic_vector(255 downto 0);
        LL2LMMAXISRXTUSER    : out std_logic_vector(17 downto 0);
        LL2LMMAXISRXTVALID   : out std_logic_vector(7 downto 0);
        LL2LMSAXISTXTREADY   : out std_logic_vector(7 downto 0);
        MAXISCQTDATA         : out std_logic_vector(255 downto 0);
        MAXISCQTKEEP         : out std_logic_vector(7 downto 0);
        MAXISCQTLAST         : out std_ulogic;
        MAXISCQTUSER         : out std_logic_vector(84 downto 0);
        MAXISCQTVALID        : out std_ulogic;
        MAXISRCTDATA         : out std_logic_vector(255 downto 0);
        MAXISRCTKEEP         : out std_logic_vector(7 downto 0);
        MAXISRCTLAST         : out std_ulogic;
        MAXISRCTUSER         : out std_logic_vector(74 downto 0);
        MAXISRCTVALID        : out std_ulogic;
        MICOMPLETIONRAMREADADDRESSAL : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMREADADDRESSAU : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMREADADDRESSBL : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMREADADDRESSBU : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMREADENABLEL : out std_logic_vector(3 downto 0);
        MICOMPLETIONRAMREADENABLEU : out std_logic_vector(3 downto 0);
        MICOMPLETIONRAMWRITEADDRESSAL : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMWRITEADDRESSAU : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMWRITEADDRESSBL : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMWRITEADDRESSBU : out std_logic_vector(9 downto 0);
        MICOMPLETIONRAMWRITEDATAL : out std_logic_vector(71 downto 0);
        MICOMPLETIONRAMWRITEDATAU : out std_logic_vector(71 downto 0);
        MICOMPLETIONRAMWRITEENABLEL : out std_logic_vector(3 downto 0);
        MICOMPLETIONRAMWRITEENABLEU : out std_logic_vector(3 downto 0);
        MIREPLAYRAMADDRESS   : out std_logic_vector(8 downto 0);
        MIREPLAYRAMREADENABLE : out std_logic_vector(1 downto 0);
        MIREPLAYRAMWRITEDATA : out std_logic_vector(143 downto 0);
        MIREPLAYRAMWRITEENABLE : out std_logic_vector(1 downto 0);
        MIREQUESTRAMREADADDRESSA : out std_logic_vector(8 downto 0);
        MIREQUESTRAMREADADDRESSB : out std_logic_vector(8 downto 0);
        MIREQUESTRAMREADENABLE : out std_logic_vector(3 downto 0);
        MIREQUESTRAMWRITEADDRESSA : out std_logic_vector(8 downto 0);
        MIREQUESTRAMWRITEADDRESSB : out std_logic_vector(8 downto 0);
        MIREQUESTRAMWRITEDATA : out std_logic_vector(143 downto 0);
        MIREQUESTRAMWRITEENABLE : out std_logic_vector(3 downto 0);
        PCIECQNPREQCOUNT     : out std_logic_vector(5 downto 0);
        PCIEPERST0B          : out std_ulogic;
        PCIEPERST1B          : out std_ulogic;
        PCIERQSEQNUM         : out std_logic_vector(3 downto 0);
        PCIERQSEQNUMVLD      : out std_ulogic;
        PCIERQTAG            : out std_logic_vector(5 downto 0);
        PCIERQTAGAV          : out std_logic_vector(1 downto 0);
        PCIERQTAGVLD         : out std_ulogic;
        PCIETFCNPDAV         : out std_logic_vector(1 downto 0);
        PCIETFCNPHAV         : out std_logic_vector(1 downto 0);
        PIPERX0EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX0EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX0EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX0EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX0POLARITY      : out std_ulogic;
        PIPERX1EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX1EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX1EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX1EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX1POLARITY      : out std_ulogic;
        PIPERX2EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX2EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX2EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX2EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX2POLARITY      : out std_ulogic;
        PIPERX3EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX3EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX3EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX3EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX3POLARITY      : out std_ulogic;
        PIPERX4EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX4EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX4EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX4EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX4POLARITY      : out std_ulogic;
        PIPERX5EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX5EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX5EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX5EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX5POLARITY      : out std_ulogic;
        PIPERX6EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX6EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX6EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX6EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX6POLARITY      : out std_ulogic;
        PIPERX7EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPERX7EQLPLFFS      : out std_logic_vector(5 downto 0);
        PIPERX7EQLPTXPRESET  : out std_logic_vector(3 downto 0);
        PIPERX7EQPRESET      : out std_logic_vector(2 downto 0);
        PIPERX7POLARITY      : out std_ulogic;
        PIPETX0CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX0COMPLIANCE    : out std_ulogic;
        PIPETX0DATA          : out std_logic_vector(31 downto 0);
        PIPETX0DATAVALID     : out std_ulogic;
        PIPETX0DEEMPH        : out std_ulogic;
        PIPETX0ELECIDLE      : out std_ulogic;
        PIPETX0EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX0EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX0EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX0MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX0POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX0RATE          : out std_logic_vector(1 downto 0);
        PIPETX0RCVRDET       : out std_ulogic;
        PIPETX0RESET         : out std_ulogic;
        PIPETX0STARTBLOCK    : out std_ulogic;
        PIPETX0SWING         : out std_ulogic;
        PIPETX0SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX1CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX1COMPLIANCE    : out std_ulogic;
        PIPETX1DATA          : out std_logic_vector(31 downto 0);
        PIPETX1DATAVALID     : out std_ulogic;
        PIPETX1DEEMPH        : out std_ulogic;
        PIPETX1ELECIDLE      : out std_ulogic;
        PIPETX1EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX1EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX1EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX1MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX1POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX1RATE          : out std_logic_vector(1 downto 0);
        PIPETX1RCVRDET       : out std_ulogic;
        PIPETX1RESET         : out std_ulogic;
        PIPETX1STARTBLOCK    : out std_ulogic;
        PIPETX1SWING         : out std_ulogic;
        PIPETX1SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX2CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX2COMPLIANCE    : out std_ulogic;
        PIPETX2DATA          : out std_logic_vector(31 downto 0);
        PIPETX2DATAVALID     : out std_ulogic;
        PIPETX2DEEMPH        : out std_ulogic;
        PIPETX2ELECIDLE      : out std_ulogic;
        PIPETX2EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX2EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX2EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX2MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX2POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX2RATE          : out std_logic_vector(1 downto 0);
        PIPETX2RCVRDET       : out std_ulogic;
        PIPETX2RESET         : out std_ulogic;
        PIPETX2STARTBLOCK    : out std_ulogic;
        PIPETX2SWING         : out std_ulogic;
        PIPETX2SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX3CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX3COMPLIANCE    : out std_ulogic;
        PIPETX3DATA          : out std_logic_vector(31 downto 0);
        PIPETX3DATAVALID     : out std_ulogic;
        PIPETX3DEEMPH        : out std_ulogic;
        PIPETX3ELECIDLE      : out std_ulogic;
        PIPETX3EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX3EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX3EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX3MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX3POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX3RATE          : out std_logic_vector(1 downto 0);
        PIPETX3RCVRDET       : out std_ulogic;
        PIPETX3RESET         : out std_ulogic;
        PIPETX3STARTBLOCK    : out std_ulogic;
        PIPETX3SWING         : out std_ulogic;
        PIPETX3SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX4CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX4COMPLIANCE    : out std_ulogic;
        PIPETX4DATA          : out std_logic_vector(31 downto 0);
        PIPETX4DATAVALID     : out std_ulogic;
        PIPETX4DEEMPH        : out std_ulogic;
        PIPETX4ELECIDLE      : out std_ulogic;
        PIPETX4EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX4EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX4EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX4MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX4POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX4RATE          : out std_logic_vector(1 downto 0);
        PIPETX4RCVRDET       : out std_ulogic;
        PIPETX4RESET         : out std_ulogic;
        PIPETX4STARTBLOCK    : out std_ulogic;
        PIPETX4SWING         : out std_ulogic;
        PIPETX4SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX5CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX5COMPLIANCE    : out std_ulogic;
        PIPETX5DATA          : out std_logic_vector(31 downto 0);
        PIPETX5DATAVALID     : out std_ulogic;
        PIPETX5DEEMPH        : out std_ulogic;
        PIPETX5ELECIDLE      : out std_ulogic;
        PIPETX5EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX5EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX5EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX5MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX5POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX5RATE          : out std_logic_vector(1 downto 0);
        PIPETX5RCVRDET       : out std_ulogic;
        PIPETX5RESET         : out std_ulogic;
        PIPETX5STARTBLOCK    : out std_ulogic;
        PIPETX5SWING         : out std_ulogic;
        PIPETX5SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX6CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX6COMPLIANCE    : out std_ulogic;
        PIPETX6DATA          : out std_logic_vector(31 downto 0);
        PIPETX6DATAVALID     : out std_ulogic;
        PIPETX6DEEMPH        : out std_ulogic;
        PIPETX6ELECIDLE      : out std_ulogic;
        PIPETX6EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX6EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX6EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX6MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX6POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX6RATE          : out std_logic_vector(1 downto 0);
        PIPETX6RCVRDET       : out std_ulogic;
        PIPETX6RESET         : out std_ulogic;
        PIPETX6STARTBLOCK    : out std_ulogic;
        PIPETX6SWING         : out std_ulogic;
        PIPETX6SYNCHEADER    : out std_logic_vector(1 downto 0);
        PIPETX7CHARISK       : out std_logic_vector(1 downto 0);
        PIPETX7COMPLIANCE    : out std_ulogic;
        PIPETX7DATA          : out std_logic_vector(31 downto 0);
        PIPETX7DATAVALID     : out std_ulogic;
        PIPETX7DEEMPH        : out std_ulogic;
        PIPETX7ELECIDLE      : out std_ulogic;
        PIPETX7EQCONTROL     : out std_logic_vector(1 downto 0);
        PIPETX7EQDEEMPH      : out std_logic_vector(5 downto 0);
        PIPETX7EQPRESET      : out std_logic_vector(3 downto 0);
        PIPETX7MARGIN        : out std_logic_vector(2 downto 0);
        PIPETX7POWERDOWN     : out std_logic_vector(1 downto 0);
        PIPETX7RATE          : out std_logic_vector(1 downto 0);
        PIPETX7RCVRDET       : out std_ulogic;
        PIPETX7RESET         : out std_ulogic;
        PIPETX7STARTBLOCK    : out std_ulogic;
        PIPETX7SWING         : out std_ulogic;
        PIPETX7SYNCHEADER    : out std_logic_vector(1 downto 0);
        PLEQINPROGRESS       : out std_ulogic;
        PLEQPHASE            : out std_logic_vector(1 downto 0);
        PMVOUT               : out std_ulogic;
        SAXISCCTREADY        : out std_logic_vector(3 downto 0);
        SAXISRQTREADY        : out std_logic_vector(3 downto 0);
        SCANOUT              : out std_logic_vector(95 downto 0);
        SPAREOUT             : out std_logic_vector(31 downto 0);
        XILUNCONNBOUT        : out std_logic_vector(479 downto 0);
        XILUNCONNOUT         : out std_logic_vector(860 downto 0);
        CFGCONFIGSPACEENABLE : in std_ulogic;
        CFGDEVID             : in std_logic_vector(15 downto 0);
        CFGDSBUSNUMBER       : in std_logic_vector(7 downto 0);
        CFGDSDEVICENUMBER    : in std_logic_vector(4 downto 0);
        CFGDSFUNCTIONNUMBER  : in std_logic_vector(2 downto 0);
        CFGDSN               : in std_logic_vector(63 downto 0);
        CFGDSPORTNUMBER      : in std_logic_vector(7 downto 0);
        CFGERRCORIN          : in std_ulogic;
        CFGERRUNCORIN        : in std_ulogic;
        CFGEXTREADDATA       : in std_logic_vector(31 downto 0);
        CFGEXTREADDATAVALID  : in std_ulogic;
        CFGFCSEL             : in std_logic_vector(2 downto 0);
        CFGFLRDONE           : in std_logic_vector(3 downto 0);
        CFGHOTRESETIN        : in std_ulogic;
        CFGINTERRUPTINT      : in std_logic_vector(3 downto 0);
        CFGINTERRUPTMSIATTR  : in std_logic_vector(2 downto 0);
        CFGINTERRUPTMSIFUNCTIONNUMBER : in std_logic_vector(3 downto 0);
        CFGINTERRUPTMSIINT   : in std_logic_vector(31 downto 0);
        CFGINTERRUPTMSIPENDINGSTATUS : in std_logic_vector(31 downto 0);
        CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE : in std_ulogic;
        CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM : in std_logic_vector(3 downto 0);
        CFGINTERRUPTMSISELECT : in std_logic_vector(3 downto 0);
        CFGINTERRUPTMSITPHPRESENT : in std_ulogic;
        CFGINTERRUPTMSITPHSTTAG : in std_logic_vector(8 downto 0);
        CFGINTERRUPTMSITPHTYPE : in std_logic_vector(1 downto 0);
        CFGINTERRUPTMSIXADDRESS : in std_logic_vector(63 downto 0);
        CFGINTERRUPTMSIXDATA : in std_logic_vector(31 downto 0);
        CFGINTERRUPTMSIXINT  : in std_ulogic;
        CFGINTERRUPTPENDING  : in std_logic_vector(3 downto 0);
        CFGLINKTRAININGENABLE : in std_ulogic;
        CFGMGMTADDR          : in std_logic_vector(18 downto 0);
        CFGMGMTBYTEENABLE    : in std_logic_vector(3 downto 0);
        CFGMGMTREAD          : in std_ulogic;
        CFGMGMTTYPE1CFGREGACCESS : in std_ulogic;
        CFGMGMTWRITE         : in std_ulogic;
        CFGMGMTWRITEDATA     : in std_logic_vector(31 downto 0);
        CFGMSGTRANSMIT       : in std_ulogic;
        CFGMSGTRANSMITDATA   : in std_logic_vector(31 downto 0);
        CFGMSGTRANSMITTYPE   : in std_logic_vector(2 downto 0);
        CFGPERFUNCSTATUSCONTROL : in std_logic_vector(2 downto 0);
        CFGPERFUNCTIONNUMBER : in std_logic_vector(3 downto 0);
        CFGPERFUNCTIONOUTPUTREQUEST : in std_ulogic;
        CFGPOWERSTATECHANGEACK : in std_ulogic;
        CFGREQPMTRANSITIONL23READY : in std_ulogic;
        CFGREVID             : in std_logic_vector(7 downto 0);
        CFGSUBSYSID          : in std_logic_vector(15 downto 0);
        CFGSUBSYSVENDID      : in std_logic_vector(15 downto 0);
        CFGTPHSTTREADDATA    : in std_logic_vector(31 downto 0);
        CFGTPHSTTREADDATAVALID : in std_ulogic;
        CFGVENDID            : in std_logic_vector(15 downto 0);
        CFGVFFLRDONE         : in std_logic_vector(7 downto 0);
        CONFMCAPREQUESTBYCONF : in std_ulogic;
        CONFREQDATA          : in std_logic_vector(31 downto 0);
        CONFREQREGNUM        : in std_logic_vector(3 downto 0);
        CONFREQTYPE          : in std_logic_vector(1 downto 0);
        CONFREQVALID         : in std_ulogic;
        CORECLK              : in std_ulogic;
        CORECLKMICOMPLETIONRAML : in std_ulogic;
        CORECLKMICOMPLETIONRAMU : in std_ulogic;
        CORECLKMIREPLAYRAM   : in std_ulogic;
        CORECLKMIREQUESTRAM  : in std_ulogic;
        DBGCFGLOCALMGMTREGOVERRIDE : in std_ulogic;
        DBGDATASEL           : in std_logic_vector(3 downto 0);
        DRPADDR              : in std_logic_vector(9 downto 0);
        DRPCLK               : in std_ulogic;
        DRPDI                : in std_logic_vector(15 downto 0);
        DRPEN                : in std_ulogic;
        DRPWE                : in std_ulogic;
        LL2LMSAXISTXTUSER    : in std_logic_vector(13 downto 0);
        LL2LMSAXISTXTVALID   : in std_ulogic;
        LL2LMTXTLPID0        : in std_logic_vector(3 downto 0);
        LL2LMTXTLPID1        : in std_logic_vector(3 downto 0);
        MAXISCQTREADY        : in std_logic_vector(21 downto 0);
        MAXISRCTREADY        : in std_logic_vector(21 downto 0);
        MCAPCLK              : in std_ulogic;
        MCAPPERST0B          : in std_ulogic;
        MCAPPERST1B          : in std_ulogic;
        MGMTRESETN           : in std_ulogic;
        MGMTSTICKYRESETN     : in std_ulogic;
        MICOMPLETIONRAMREADDATA : in std_logic_vector(143 downto 0);
        MIREPLAYRAMREADDATA  : in std_logic_vector(143 downto 0);
        MIREQUESTRAMREADDATA : in std_logic_vector(143 downto 0);
        PCIECQNPREQ          : in std_ulogic;
        PIPECLK              : in std_ulogic;
        PIPEEQFS             : in std_logic_vector(5 downto 0);
        PIPEEQLF             : in std_logic_vector(5 downto 0);
        PIPERESETN           : in std_ulogic;
        PIPERX0CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX0DATA          : in std_logic_vector(31 downto 0);
        PIPERX0DATAVALID     : in std_ulogic;
        PIPERX0ELECIDLE      : in std_ulogic;
        PIPERX0EQDONE        : in std_ulogic;
        PIPERX0EQLPADAPTDONE : in std_ulogic;
        PIPERX0EQLPLFFSSEL   : in std_ulogic;
        PIPERX0EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX0PHYSTATUS     : in std_ulogic;
        PIPERX0STARTBLOCK    : in std_ulogic;
        PIPERX0STATUS        : in std_logic_vector(2 downto 0);
        PIPERX0SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX0VALID         : in std_ulogic;
        PIPERX1CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX1DATA          : in std_logic_vector(31 downto 0);
        PIPERX1DATAVALID     : in std_ulogic;
        PIPERX1ELECIDLE      : in std_ulogic;
        PIPERX1EQDONE        : in std_ulogic;
        PIPERX1EQLPADAPTDONE : in std_ulogic;
        PIPERX1EQLPLFFSSEL   : in std_ulogic;
        PIPERX1EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX1PHYSTATUS     : in std_ulogic;
        PIPERX1STARTBLOCK    : in std_ulogic;
        PIPERX1STATUS        : in std_logic_vector(2 downto 0);
        PIPERX1SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX1VALID         : in std_ulogic;
        PIPERX2CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX2DATA          : in std_logic_vector(31 downto 0);
        PIPERX2DATAVALID     : in std_ulogic;
        PIPERX2ELECIDLE      : in std_ulogic;
        PIPERX2EQDONE        : in std_ulogic;
        PIPERX2EQLPADAPTDONE : in std_ulogic;
        PIPERX2EQLPLFFSSEL   : in std_ulogic;
        PIPERX2EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX2PHYSTATUS     : in std_ulogic;
        PIPERX2STARTBLOCK    : in std_ulogic;
        PIPERX2STATUS        : in std_logic_vector(2 downto 0);
        PIPERX2SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX2VALID         : in std_ulogic;
        PIPERX3CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX3DATA          : in std_logic_vector(31 downto 0);
        PIPERX3DATAVALID     : in std_ulogic;
        PIPERX3ELECIDLE      : in std_ulogic;
        PIPERX3EQDONE        : in std_ulogic;
        PIPERX3EQLPADAPTDONE : in std_ulogic;
        PIPERX3EQLPLFFSSEL   : in std_ulogic;
        PIPERX3EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX3PHYSTATUS     : in std_ulogic;
        PIPERX3STARTBLOCK    : in std_ulogic;
        PIPERX3STATUS        : in std_logic_vector(2 downto 0);
        PIPERX3SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX3VALID         : in std_ulogic;
        PIPERX4CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX4DATA          : in std_logic_vector(31 downto 0);
        PIPERX4DATAVALID     : in std_ulogic;
        PIPERX4ELECIDLE      : in std_ulogic;
        PIPERX4EQDONE        : in std_ulogic;
        PIPERX4EQLPADAPTDONE : in std_ulogic;
        PIPERX4EQLPLFFSSEL   : in std_ulogic;
        PIPERX4EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX4PHYSTATUS     : in std_ulogic;
        PIPERX4STARTBLOCK    : in std_ulogic;
        PIPERX4STATUS        : in std_logic_vector(2 downto 0);
        PIPERX4SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX4VALID         : in std_ulogic;
        PIPERX5CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX5DATA          : in std_logic_vector(31 downto 0);
        PIPERX5DATAVALID     : in std_ulogic;
        PIPERX5ELECIDLE      : in std_ulogic;
        PIPERX5EQDONE        : in std_ulogic;
        PIPERX5EQLPADAPTDONE : in std_ulogic;
        PIPERX5EQLPLFFSSEL   : in std_ulogic;
        PIPERX5EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX5PHYSTATUS     : in std_ulogic;
        PIPERX5STARTBLOCK    : in std_ulogic;
        PIPERX5STATUS        : in std_logic_vector(2 downto 0);
        PIPERX5SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX5VALID         : in std_ulogic;
        PIPERX6CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX6DATA          : in std_logic_vector(31 downto 0);
        PIPERX6DATAVALID     : in std_ulogic;
        PIPERX6ELECIDLE      : in std_ulogic;
        PIPERX6EQDONE        : in std_ulogic;
        PIPERX6EQLPADAPTDONE : in std_ulogic;
        PIPERX6EQLPLFFSSEL   : in std_ulogic;
        PIPERX6EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX6PHYSTATUS     : in std_ulogic;
        PIPERX6STARTBLOCK    : in std_ulogic;
        PIPERX6STATUS        : in std_logic_vector(2 downto 0);
        PIPERX6SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX6VALID         : in std_ulogic;
        PIPERX7CHARISK       : in std_logic_vector(1 downto 0);
        PIPERX7DATA          : in std_logic_vector(31 downto 0);
        PIPERX7DATAVALID     : in std_ulogic;
        PIPERX7ELECIDLE      : in std_ulogic;
        PIPERX7EQDONE        : in std_ulogic;
        PIPERX7EQLPADAPTDONE : in std_ulogic;
        PIPERX7EQLPLFFSSEL   : in std_ulogic;
        PIPERX7EQLPNEWTXCOEFFORPRESET : in std_logic_vector(17 downto 0);
        PIPERX7PHYSTATUS     : in std_ulogic;
        PIPERX7STARTBLOCK    : in std_ulogic;
        PIPERX7STATUS        : in std_logic_vector(2 downto 0);
        PIPERX7SYNCHEADER    : in std_logic_vector(1 downto 0);
        PIPERX7VALID         : in std_ulogic;
        PIPETX0EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX0EQDONE        : in std_ulogic;
        PIPETX1EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX1EQDONE        : in std_ulogic;
        PIPETX2EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX2EQDONE        : in std_ulogic;
        PIPETX3EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX3EQDONE        : in std_ulogic;
        PIPETX4EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX4EQDONE        : in std_ulogic;
        PIPETX5EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX5EQDONE        : in std_ulogic;
        PIPETX6EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX6EQDONE        : in std_ulogic;
        PIPETX7EQCOEFF       : in std_logic_vector(17 downto 0);
        PIPETX7EQDONE        : in std_ulogic;
        PLEQRESETEIEOSCOUNT  : in std_ulogic;
        PLGEN2UPSTREAMPREFERDEEMPH : in std_ulogic;
        PMVDIVIDE            : in std_logic_vector(1 downto 0);
        PMVENABLEN           : in std_ulogic;
        PMVSELECT            : in std_logic_vector(2 downto 0);
        RESETN               : in std_ulogic;
        SAXISCCTDATA         : in std_logic_vector(255 downto 0);
        SAXISCCTKEEP         : in std_logic_vector(7 downto 0);
        SAXISCCTLAST         : in std_ulogic;
        SAXISCCTUSER         : in std_logic_vector(32 downto 0);
        SAXISCCTVALID        : in std_ulogic;
        SAXISRQTDATA         : in std_logic_vector(255 downto 0);
        SAXISRQTKEEP         : in std_logic_vector(7 downto 0);
        SAXISRQTLAST         : in std_ulogic;
        SAXISRQTUSER         : in std_logic_vector(59 downto 0);
        SAXISRQTVALID        : in std_ulogic;
        SCANENABLEN          : in std_ulogic;
        SCANIN               : in std_logic_vector(95 downto 0);
        SCANMODEN            : in std_ulogic;
        SPAREIN              : in std_logic_vector(31 downto 0);
        USERCLK              : in std_ulogic;
        XILUNCONNBYP         : in std_logic_vector(1919 downto 0);
        XILUNCONNCLK         : in std_logic_vector(950 downto 0);
        XILUNCONNIN          : in std_logic_vector(3188 downto 0);
        GSR                  : in std_ulogic
      );
    end component;
    
    constant MODULE_NAME : string := "PCIE_3_1";
    constant IN_DELAY : time := 0 ps;
    constant OUT_DELAY : time := 0 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 0 ps;

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
    constant ARI_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(ARI_CAP_ENABLE,40);
    constant AXISTEN_IF_CC_ALIGNMENT_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_CC_ALIGNMENT_MODE,40);
    constant AXISTEN_IF_CC_PARITY_CHK_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_CC_PARITY_CHK,40);
    constant AXISTEN_IF_CQ_ALIGNMENT_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_CQ_ALIGNMENT_MODE,40);
    constant AXISTEN_IF_ENABLE_CLIENT_TAG_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_ENABLE_CLIENT_TAG,40);
    constant AXISTEN_IF_ENABLE_RX_MSG_INTFC_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_ENABLE_RX_MSG_INTFC,40);
    constant AXISTEN_IF_RC_ALIGNMENT_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_RC_ALIGNMENT_MODE,40);
    constant AXISTEN_IF_RC_STRADDLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_RC_STRADDLE,40);
    constant AXISTEN_IF_RQ_ALIGNMENT_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_RQ_ALIGNMENT_MODE,40);
    constant AXISTEN_IF_RQ_PARITY_CHK_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(AXISTEN_IF_RQ_PARITY_CHK,40);
    constant CRM_CORE_CLK_FREQ_500_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(CRM_CORE_CLK_FREQ_500,40);
    constant DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE,40);
    constant DEBUG_PL_DISABLE_EI_INFER_IN_L0_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(DEBUG_PL_DISABLE_EI_INFER_IN_L0,40);
    constant DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS,40);
    constant LL_ACK_TIMEOUT_EN_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LL_ACK_TIMEOUT_EN,40);
    constant LL_CPL_FC_UPDATE_TIMER_OVERRIDE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LL_CPL_FC_UPDATE_TIMER_OVERRIDE,40);
    constant LL_FC_UPDATE_TIMER_OVERRIDE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LL_FC_UPDATE_TIMER_OVERRIDE,40);
    constant LL_NP_FC_UPDATE_TIMER_OVERRIDE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LL_NP_FC_UPDATE_TIMER_OVERRIDE,40);
    constant LL_P_FC_UPDATE_TIMER_OVERRIDE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LL_P_FC_UPDATE_TIMER_OVERRIDE,40);
    constant LL_REPLAY_TIMEOUT_EN_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LL_REPLAY_TIMEOUT_EN,40);
    constant LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE,40);
    constant LTR_TX_MESSAGE_ON_LTR_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(LTR_TX_MESSAGE_ON_LTR_ENABLE,40);
    constant MCAP_CONFIGURE_OVERRIDE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_CONFIGURE_OVERRIDE,40);
    constant MCAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_ENABLE,40);
    constant MCAP_EOS_DESIGN_SWITCH_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_EOS_DESIGN_SWITCH,40);
    constant MCAP_GATE_IO_ENABLE_DESIGN_SWITCH_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_GATE_IO_ENABLE_DESIGN_SWITCH,40);
    constant MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH,40);
    constant MCAP_INPUT_GATE_DESIGN_SWITCH_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_INPUT_GATE_DESIGN_SWITCH,40);
    constant MCAP_INTERRUPT_ON_MCAP_EOS_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_INTERRUPT_ON_MCAP_EOS,40);
    constant MCAP_INTERRUPT_ON_MCAP_ERROR_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(MCAP_INTERRUPT_ON_MCAP_ERROR,40);
    constant PF0_AER_CAP_ECRC_CHECK_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_AER_CAP_ECRC_CHECK_CAPABLE,40);
    constant PF0_AER_CAP_ECRC_GEN_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_AER_CAP_ECRC_GEN_CAPABLE,40);
    constant PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT,40);
    constant PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT,40);
    constant PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT,40);
    constant PF0_DEV_CAP2_ARI_FORWARD_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_ARI_FORWARD_ENABLE,40);
    constant PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE,40);
    constant PF0_DEV_CAP2_LTR_SUPPORT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_LTR_SUPPORT,40);
    constant PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT,40);
    constant PF0_DEV_CAP_EXT_TAG_SUPPORTED_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP_EXT_TAG_SUPPORTED,40);
    constant PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE,40);
    constant PF0_DPA_CAP_SUB_STATE_CONTROL_EN_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_DPA_CAP_SUB_STATE_CONTROL_EN,40);
    constant PF0_EXPANSION_ROM_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_EXPANSION_ROM_ENABLE,40);
    constant PF0_LINK_STATUS_SLOT_CLOCK_CONFIG_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_LINK_STATUS_SLOT_CLOCK_CONFIG,40);
    constant PF0_MSI_CAP_PERVECMASKCAP_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_MSI_CAP_PERVECMASKCAP,40);
    constant PF0_PB_CAP_SYSTEM_ALLOCATED_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_PB_CAP_SYSTEM_ALLOCATED,40);
    constant PF0_PM_CAP_PMESUPPORT_D0_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_PM_CAP_PMESUPPORT_D0,40);
    constant PF0_PM_CAP_PMESUPPORT_D1_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_PM_CAP_PMESUPPORT_D1,40);
    constant PF0_PM_CAP_PMESUPPORT_D3HOT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_PM_CAP_PMESUPPORT_D3HOT,40);
    constant PF0_PM_CAP_SUPP_D1_STATE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_PM_CAP_SUPP_D1_STATE,40);
    constant PF0_PM_CSR_NOSOFTRESET_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_PM_CSR_NOSOFTRESET,40);
    constant PF0_RBAR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_RBAR_CAP_ENABLE,40);
    constant PF0_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant PF0_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_TPHR_CAP_ENABLE,40);
    constant PF0_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_TPHR_CAP_INT_VEC_MODE,40);
    constant PF0_VC_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF0_VC_CAP_ENABLE,40);
    constant PF1_AER_CAP_ECRC_CHECK_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_AER_CAP_ECRC_CHECK_CAPABLE,40);
    constant PF1_AER_CAP_ECRC_GEN_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_AER_CAP_ECRC_GEN_CAPABLE,40);
    constant PF1_DPA_CAP_SUB_STATE_CONTROL_EN_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_DPA_CAP_SUB_STATE_CONTROL_EN,40);
    constant PF1_EXPANSION_ROM_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_EXPANSION_ROM_ENABLE,40);
    constant PF1_MSI_CAP_PERVECMASKCAP_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_MSI_CAP_PERVECMASKCAP,40);
    constant PF1_PB_CAP_SYSTEM_ALLOCATED_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_PB_CAP_SYSTEM_ALLOCATED,40);
    constant PF1_RBAR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_RBAR_CAP_ENABLE,40);
    constant PF1_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant PF1_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_TPHR_CAP_ENABLE,40);
    constant PF1_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF1_TPHR_CAP_INT_VEC_MODE,40);
    constant PF2_AER_CAP_ECRC_CHECK_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_AER_CAP_ECRC_CHECK_CAPABLE,40);
    constant PF2_AER_CAP_ECRC_GEN_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_AER_CAP_ECRC_GEN_CAPABLE,40);
    constant PF2_DPA_CAP_SUB_STATE_CONTROL_EN_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_DPA_CAP_SUB_STATE_CONTROL_EN,40);
    constant PF2_EXPANSION_ROM_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_EXPANSION_ROM_ENABLE,40);
    constant PF2_MSI_CAP_PERVECMASKCAP_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_MSI_CAP_PERVECMASKCAP,40);
    constant PF2_PB_CAP_SYSTEM_ALLOCATED_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_PB_CAP_SYSTEM_ALLOCATED,40);
    constant PF2_RBAR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_RBAR_CAP_ENABLE,40);
    constant PF2_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant PF2_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_TPHR_CAP_ENABLE,40);
    constant PF2_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF2_TPHR_CAP_INT_VEC_MODE,40);
    constant PF3_AER_CAP_ECRC_CHECK_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_AER_CAP_ECRC_CHECK_CAPABLE,40);
    constant PF3_AER_CAP_ECRC_GEN_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_AER_CAP_ECRC_GEN_CAPABLE,40);
    constant PF3_DPA_CAP_SUB_STATE_CONTROL_EN_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_DPA_CAP_SUB_STATE_CONTROL_EN,40);
    constant PF3_EXPANSION_ROM_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_EXPANSION_ROM_ENABLE,40);
    constant PF3_MSI_CAP_PERVECMASKCAP_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_MSI_CAP_PERVECMASKCAP,40);
    constant PF3_PB_CAP_SYSTEM_ALLOCATED_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_PB_CAP_SYSTEM_ALLOCATED,40);
    constant PF3_RBAR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_RBAR_CAP_ENABLE,40);
    constant PF3_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant PF3_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_TPHR_CAP_ENABLE,40);
    constant PF3_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PF3_TPHR_CAP_INT_VEC_MODE,40);
    constant PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3,40);
    constant PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2,40);
    constant PL_DISABLE_EI_INFER_IN_L0_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_EI_INFER_IN_L0,40);
    constant PL_DISABLE_GEN3_DC_BALANCE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_GEN3_DC_BALANCE,40);
    constant PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP,40);
    constant PL_DISABLE_RETRAIN_ON_FRAMING_ERROR_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_RETRAIN_ON_FRAMING_ERROR,40);
    constant PL_DISABLE_SCRAMBLING_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_SCRAMBLING,40);
    constant PL_DISABLE_SYNC_HEADER_FRAMING_ERROR_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_SYNC_HEADER_FRAMING_ERROR,40);
    constant PL_DISABLE_UPCONFIG_CAPABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_DISABLE_UPCONFIG_CAPABLE,40);
    constant PL_EQ_ADAPT_DISABLE_COEFF_CHECK_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_EQ_ADAPT_DISABLE_COEFF_CHECK,40);
    constant PL_EQ_ADAPT_DISABLE_PRESET_CHECK_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_EQ_ADAPT_DISABLE_PRESET_CHECK,40);
    constant PL_EQ_BYPASS_PHASE23_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_EQ_BYPASS_PHASE23,40);
    constant PL_EQ_PHASE01_RX_ADAPT_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_EQ_PHASE01_RX_ADAPT,40);
    constant PL_EQ_SHORT_ADAPT_PHASE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_EQ_SHORT_ADAPT_PHASE,40);
    constant PL_REPORT_ALL_PHY_ERRORS_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_REPORT_ALL_PHY_ERRORS,40);
    constant PL_SIM_FAST_LINK_TRAINING_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_SIM_FAST_LINK_TRAINING,40);
    constant PL_UPSTREAM_FACING_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PL_UPSTREAM_FACING,40);
    constant PM_ENABLE_L23_ENTRY_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PM_ENABLE_L23_ENTRY,40);
    constant PM_ENABLE_SLOT_POWER_CAPTURE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(PM_ENABLE_SLOT_POWER_CAPTURE,40);
    constant SRIOV_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(SRIOV_CAP_ENABLE,40);
    constant TEST_MODE_PIN_CHAR_REG : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant TL_COMPLETION_RAM_SIZE_16K_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TL_COMPLETION_RAM_SIZE_16K,40);
    constant TL_ENABLE_MESSAGE_RID_CHECK_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TL_ENABLE_MESSAGE_RID_CHECK_ENABLE,40);
    constant TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE,40);
    constant TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE,40);
    constant TL_LEGACY_MODE_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TL_LEGACY_MODE_ENABLE,40);
    constant TL_TX_MUX_STRICT_PRIORITY_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TL_TX_MUX_STRICT_PRIORITY,40);
    constant TWO_LAYER_MODE_DLCMSM_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TWO_LAYER_MODE_DLCMSM_ENABLE,40);
    constant TWO_LAYER_MODE_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TWO_LAYER_MODE_ENABLE,40);
    constant TWO_LAYER_MODE_WIDTH_256_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(TWO_LAYER_MODE_WIDTH_256,40);
    constant VF0_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF0_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF0_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF0_TPHR_CAP_ENABLE,40);
    constant VF0_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF0_TPHR_CAP_INT_VEC_MODE,40);
    constant VF1_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF1_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF1_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF1_TPHR_CAP_ENABLE,40);
    constant VF1_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF1_TPHR_CAP_INT_VEC_MODE,40);
    constant VF2_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF2_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF2_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF2_TPHR_CAP_ENABLE,40);
    constant VF2_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF2_TPHR_CAP_INT_VEC_MODE,40);
    constant VF3_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF3_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF3_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF3_TPHR_CAP_ENABLE,40);
    constant VF3_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF3_TPHR_CAP_INT_VEC_MODE,40);
    constant VF4_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF4_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF4_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF4_TPHR_CAP_ENABLE,40);
    constant VF4_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF4_TPHR_CAP_INT_VEC_MODE,40);
    constant VF5_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF5_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF5_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF5_TPHR_CAP_ENABLE,40);
    constant VF5_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF5_TPHR_CAP_INT_VEC_MODE,40);
    constant VF6_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF6_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF6_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF6_TPHR_CAP_ENABLE,40);
    constant VF6_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF6_TPHR_CAP_INT_VEC_MODE,40);
    constant VF7_TPHR_CAP_DEV_SPECIFIC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF7_TPHR_CAP_DEV_SPECIFIC_MODE,40);
    constant VF7_TPHR_CAP_ENABLE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF7_TPHR_CAP_ENABLE,40);
    constant VF7_TPHR_CAP_INT_VEC_MODE_REG : std_logic_vector(39 downto 0) := conv_string_to_slv(VF7_TPHR_CAP_INT_VEC_MODE,40);
    
    constant AXISTEN_IF_ENABLE_MSG_ROUTE_REG : std_logic_vector(17 downto 0) := AXISTEN_IF_ENABLE_MSG_ROUTE;
    constant AXISTEN_IF_WIDTH_REG : std_logic_vector(1 downto 0) := AXISTEN_IF_WIDTH;
    constant CRM_USER_CLK_FREQ_REG : std_logic_vector(1 downto 0) := CRM_USER_CLK_FREQ;
    constant DNSTREAM_LINK_NUM_REG : std_logic_vector(7 downto 0) := DNSTREAM_LINK_NUM;
    constant LL_ACK_TIMEOUT_FUNC_REG : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(LL_ACK_TIMEOUT_FUNC,2));
    constant LL_ACK_TIMEOUT_REG : std_logic_vector(8 downto 0) := LL_ACK_TIMEOUT;
    constant LL_CPL_FC_UPDATE_TIMER_REG : std_logic_vector(15 downto 0) := LL_CPL_FC_UPDATE_TIMER;
    constant LL_FC_UPDATE_TIMER_REG : std_logic_vector(15 downto 0) := LL_FC_UPDATE_TIMER;
    constant LL_NP_FC_UPDATE_TIMER_REG : std_logic_vector(15 downto 0) := LL_NP_FC_UPDATE_TIMER;
    constant LL_P_FC_UPDATE_TIMER_REG : std_logic_vector(15 downto 0) := LL_P_FC_UPDATE_TIMER;
    constant LL_REPLAY_TIMEOUT_FUNC_REG : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(LL_REPLAY_TIMEOUT_FUNC,2));
    constant LL_REPLAY_TIMEOUT_REG : std_logic_vector(8 downto 0) := LL_REPLAY_TIMEOUT;
    constant LTR_TX_MESSAGE_MINIMUM_INTERVAL_REG : std_logic_vector(9 downto 0) := LTR_TX_MESSAGE_MINIMUM_INTERVAL;
    constant MCAP_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := MCAP_CAP_NEXTPTR;
    constant MCAP_FPGA_BITSTREAM_VERSION_REG : std_logic_vector(31 downto 0) := MCAP_FPGA_BITSTREAM_VERSION;
    constant MCAP_VSEC_ID_REG : std_logic_vector(15 downto 0) := MCAP_VSEC_ID;
    constant MCAP_VSEC_LEN_REG : std_logic_vector(11 downto 0) := MCAP_VSEC_LEN;
    constant MCAP_VSEC_REV_REG : std_logic_vector(3 downto 0) := MCAP_VSEC_REV;
    constant PF0_AER_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_AER_CAP_NEXTPTR;
    constant PF0_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_ARI_CAP_NEXTPTR;
    constant PF0_ARI_CAP_NEXT_FUNC_REG : std_logic_vector(7 downto 0) := PF0_ARI_CAP_NEXT_FUNC;
    constant PF0_ARI_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_ARI_CAP_VER;
    constant PF0_BAR0_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF0_BAR0_APERTURE_SIZE;
    constant PF0_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_BAR0_CONTROL;
    constant PF0_BAR1_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF0_BAR1_APERTURE_SIZE;
    constant PF0_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_BAR1_CONTROL;
    constant PF0_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_BAR2_APERTURE_SIZE;
    constant PF0_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_BAR2_CONTROL;
    constant PF0_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_BAR3_APERTURE_SIZE;
    constant PF0_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_BAR3_CONTROL;
    constant PF0_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_BAR4_APERTURE_SIZE;
    constant PF0_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_BAR4_CONTROL;
    constant PF0_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_BAR5_APERTURE_SIZE;
    constant PF0_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_BAR5_CONTROL;
    constant PF0_BIST_REGISTER_REG : std_logic_vector(7 downto 0) := PF0_BIST_REGISTER;
    constant PF0_CAPABILITY_POINTER_REG : std_logic_vector(7 downto 0) := PF0_CAPABILITY_POINTER;
    constant PF0_CLASS_CODE_REG : std_logic_vector(23 downto 0) := PF0_CLASS_CODE;
    constant PF0_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF0_DEVICE_ID;
    constant PF0_DEV_CAP2_OBFF_SUPPORT_REG : std_logic_vector(1 downto 0) := PF0_DEV_CAP2_OBFF_SUPPORT;
    constant PF0_DEV_CAP_ENDPOINT_L0S_LATENCY_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_DEV_CAP_ENDPOINT_L0S_LATENCY,3));
    constant PF0_DEV_CAP_ENDPOINT_L1_LATENCY_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_DEV_CAP_ENDPOINT_L1_LATENCY,3));
    constant PF0_DEV_CAP_MAX_PAYLOAD_SIZE_REG : std_logic_vector(2 downto 0) := PF0_DEV_CAP_MAX_PAYLOAD_SIZE;
    constant PF0_DPA_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_DPA_CAP_NEXTPTR;
    constant PF0_DPA_CAP_SUB_STATE_CONTROL_REG : std_logic_vector(4 downto 0) := PF0_DPA_CAP_SUB_STATE_CONTROL;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
    constant PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG : std_logic_vector(7 downto 0) := PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
    constant PF0_DPA_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_DPA_CAP_VER;
    constant PF0_DSN_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_DSN_CAP_NEXTPTR;
    constant PF0_EXPANSION_ROM_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_EXPANSION_ROM_APERTURE_SIZE;
    constant PF0_INTERRUPT_LINE_REG : std_logic_vector(7 downto 0) := PF0_INTERRUPT_LINE;
    constant PF0_INTERRUPT_PIN_REG : std_logic_vector(2 downto 0) := PF0_INTERRUPT_PIN;
    constant PF0_LINK_CAP_ASPM_SUPPORT_REG : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_ASPM_SUPPORT,2));
    constant PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1,3));
    constant PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2,3));
    constant PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3,3));
    constant PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1,3));
    constant PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2,3));
    constant PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3,3));
    constant PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1,3));
    constant PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2,3));
    constant PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3,3));
    constant PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1,3));
    constant PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2,3));
    constant PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3,3));
    constant PF0_LTR_CAP_MAX_NOSNOOP_LAT_REG : std_logic_vector(9 downto 0) := PF0_LTR_CAP_MAX_NOSNOOP_LAT;
    constant PF0_LTR_CAP_MAX_SNOOP_LAT_REG : std_logic_vector(9 downto 0) := PF0_LTR_CAP_MAX_SNOOP_LAT;
    constant PF0_LTR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_LTR_CAP_NEXTPTR;
    constant PF0_LTR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_LTR_CAP_VER;
    constant PF0_MSIX_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF0_MSIX_CAP_NEXTPTR;
    constant PF0_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_MSIX_CAP_PBA_BIR,3));
    constant PF0_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := PF0_MSIX_CAP_PBA_OFFSET;
    constant PF0_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_MSIX_CAP_TABLE_BIR,3));
    constant PF0_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := PF0_MSIX_CAP_TABLE_OFFSET;
    constant PF0_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF0_MSIX_CAP_TABLE_SIZE;
    constant PF0_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF0_MSI_CAP_MULTIMSGCAP,3));
    constant PF0_MSI_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF0_MSI_CAP_NEXTPTR;
    constant PF0_PB_CAP_DATA_REG_D0_REG : std_logic_vector(31 downto 0) := PF0_PB_CAP_DATA_REG_D0;
    constant PF0_PB_CAP_DATA_REG_D0_SUSTAINED_REG : std_logic_vector(31 downto 0) := PF0_PB_CAP_DATA_REG_D0_SUSTAINED;
    constant PF0_PB_CAP_DATA_REG_D1_REG : std_logic_vector(31 downto 0) := PF0_PB_CAP_DATA_REG_D1;
    constant PF0_PB_CAP_DATA_REG_D3HOT_REG : std_logic_vector(31 downto 0) := PF0_PB_CAP_DATA_REG_D3HOT;
    constant PF0_PB_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_PB_CAP_NEXTPTR;
    constant PF0_PB_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_PB_CAP_VER;
    constant PF0_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := PF0_PM_CAP_ID;
    constant PF0_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF0_PM_CAP_NEXTPTR;
    constant PF0_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := PF0_PM_CAP_VER_ID;
    constant PF0_RBAR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_RBAR_CAP_NEXTPTR;
    constant PF0_RBAR_CAP_SIZE0_REG : std_logic_vector(19 downto 0) := PF0_RBAR_CAP_SIZE0;
    constant PF0_RBAR_CAP_SIZE1_REG : std_logic_vector(19 downto 0) := PF0_RBAR_CAP_SIZE1;
    constant PF0_RBAR_CAP_SIZE2_REG : std_logic_vector(19 downto 0) := PF0_RBAR_CAP_SIZE2;
    constant PF0_RBAR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_RBAR_CAP_VER;
    constant PF0_RBAR_CONTROL_INDEX0_REG : std_logic_vector(2 downto 0) := PF0_RBAR_CONTROL_INDEX0;
    constant PF0_RBAR_CONTROL_INDEX1_REG : std_logic_vector(2 downto 0) := PF0_RBAR_CONTROL_INDEX1;
    constant PF0_RBAR_CONTROL_INDEX2_REG : std_logic_vector(2 downto 0) := PF0_RBAR_CONTROL_INDEX2;
    constant PF0_RBAR_CONTROL_SIZE0_REG : std_logic_vector(4 downto 0) := PF0_RBAR_CONTROL_SIZE0;
    constant PF0_RBAR_CONTROL_SIZE1_REG : std_logic_vector(4 downto 0) := PF0_RBAR_CONTROL_SIZE1;
    constant PF0_RBAR_CONTROL_SIZE2_REG : std_logic_vector(4 downto 0) := PF0_RBAR_CONTROL_SIZE2;
    constant PF0_RBAR_NUM_REG : std_logic_vector(2 downto 0) := PF0_RBAR_NUM;
    constant PF0_REVISION_ID_REG : std_logic_vector(7 downto 0) := PF0_REVISION_ID;
    constant PF0_SECONDARY_PCIE_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_SECONDARY_PCIE_CAP_NEXTPTR;
    constant PF0_SRIOV_BAR0_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_SRIOV_BAR0_APERTURE_SIZE;
    constant PF0_SRIOV_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_SRIOV_BAR0_CONTROL;
    constant PF0_SRIOV_BAR1_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_SRIOV_BAR1_APERTURE_SIZE;
    constant PF0_SRIOV_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_SRIOV_BAR1_CONTROL;
    constant PF0_SRIOV_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_SRIOV_BAR2_APERTURE_SIZE;
    constant PF0_SRIOV_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_SRIOV_BAR2_CONTROL;
    constant PF0_SRIOV_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_SRIOV_BAR3_APERTURE_SIZE;
    constant PF0_SRIOV_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_SRIOV_BAR3_CONTROL;
    constant PF0_SRIOV_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_SRIOV_BAR4_APERTURE_SIZE;
    constant PF0_SRIOV_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_SRIOV_BAR4_CONTROL;
    constant PF0_SRIOV_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF0_SRIOV_BAR5_APERTURE_SIZE;
    constant PF0_SRIOV_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF0_SRIOV_BAR5_CONTROL;
    constant PF0_SRIOV_CAP_INITIAL_VF_REG : std_logic_vector(15 downto 0) := PF0_SRIOV_CAP_INITIAL_VF;
    constant PF0_SRIOV_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_SRIOV_CAP_NEXTPTR;
    constant PF0_SRIOV_CAP_TOTAL_VF_REG : std_logic_vector(15 downto 0) := PF0_SRIOV_CAP_TOTAL_VF;
    constant PF0_SRIOV_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_SRIOV_CAP_VER;
    constant PF0_SRIOV_FIRST_VF_OFFSET_REG : std_logic_vector(15 downto 0) := PF0_SRIOV_FIRST_VF_OFFSET;
    constant PF0_SRIOV_FUNC_DEP_LINK_REG : std_logic_vector(15 downto 0) := PF0_SRIOV_FUNC_DEP_LINK;
    constant PF0_SRIOV_SUPPORTED_PAGE_SIZE_REG : std_logic_vector(31 downto 0) := PF0_SRIOV_SUPPORTED_PAGE_SIZE;
    constant PF0_SRIOV_VF_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF0_SRIOV_VF_DEVICE_ID;
    constant PF0_SUBSYSTEM_ID_REG : std_logic_vector(15 downto 0) := PF0_SUBSYSTEM_ID;
    constant PF0_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_TPHR_CAP_NEXTPTR;
    constant PF0_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := PF0_TPHR_CAP_ST_MODE_SEL;
    constant PF0_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := PF0_TPHR_CAP_ST_TABLE_LOC;
    constant PF0_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF0_TPHR_CAP_ST_TABLE_SIZE;
    constant PF0_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_TPHR_CAP_VER;
    constant PF0_VC_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF0_VC_CAP_NEXTPTR;
    constant PF0_VC_CAP_VER_REG : std_logic_vector(3 downto 0) := PF0_VC_CAP_VER;
    constant PF1_AER_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_AER_CAP_NEXTPTR;
    constant PF1_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_ARI_CAP_NEXTPTR;
    constant PF1_ARI_CAP_NEXT_FUNC_REG : std_logic_vector(7 downto 0) := PF1_ARI_CAP_NEXT_FUNC;
    constant PF1_BAR0_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF1_BAR0_APERTURE_SIZE;
    constant PF1_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_BAR0_CONTROL;
    constant PF1_BAR1_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF1_BAR1_APERTURE_SIZE;
    constant PF1_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_BAR1_CONTROL;
    constant PF1_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_BAR2_APERTURE_SIZE;
    constant PF1_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_BAR2_CONTROL;
    constant PF1_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_BAR3_APERTURE_SIZE;
    constant PF1_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_BAR3_CONTROL;
    constant PF1_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_BAR4_APERTURE_SIZE;
    constant PF1_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_BAR4_CONTROL;
    constant PF1_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_BAR5_APERTURE_SIZE;
    constant PF1_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_BAR5_CONTROL;
    constant PF1_BIST_REGISTER_REG : std_logic_vector(7 downto 0) := PF1_BIST_REGISTER;
    constant PF1_CAPABILITY_POINTER_REG : std_logic_vector(7 downto 0) := PF1_CAPABILITY_POINTER;
    constant PF1_CLASS_CODE_REG : std_logic_vector(23 downto 0) := PF1_CLASS_CODE;
    constant PF1_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF1_DEVICE_ID;
    constant PF1_DEV_CAP_MAX_PAYLOAD_SIZE_REG : std_logic_vector(2 downto 0) := PF1_DEV_CAP_MAX_PAYLOAD_SIZE;
    constant PF1_DPA_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_DPA_CAP_NEXTPTR;
    constant PF1_DPA_CAP_SUB_STATE_CONTROL_REG : std_logic_vector(4 downto 0) := PF1_DPA_CAP_SUB_STATE_CONTROL;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
    constant PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG : std_logic_vector(7 downto 0) := PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
    constant PF1_DPA_CAP_VER_REG : std_logic_vector(3 downto 0) := PF1_DPA_CAP_VER;
    constant PF1_DSN_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_DSN_CAP_NEXTPTR;
    constant PF1_EXPANSION_ROM_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_EXPANSION_ROM_APERTURE_SIZE;
    constant PF1_INTERRUPT_LINE_REG : std_logic_vector(7 downto 0) := PF1_INTERRUPT_LINE;
    constant PF1_INTERRUPT_PIN_REG : std_logic_vector(2 downto 0) := PF1_INTERRUPT_PIN;
    constant PF1_MSIX_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF1_MSIX_CAP_NEXTPTR;
    constant PF1_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF1_MSIX_CAP_PBA_BIR,3));
    constant PF1_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := PF1_MSIX_CAP_PBA_OFFSET;
    constant PF1_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF1_MSIX_CAP_TABLE_BIR,3));
    constant PF1_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := PF1_MSIX_CAP_TABLE_OFFSET;
    constant PF1_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF1_MSIX_CAP_TABLE_SIZE;
    constant PF1_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF1_MSI_CAP_MULTIMSGCAP,3));
    constant PF1_MSI_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF1_MSI_CAP_NEXTPTR;
    constant PF1_PB_CAP_DATA_REG_D0_REG : std_logic_vector(31 downto 0) := PF1_PB_CAP_DATA_REG_D0;
    constant PF1_PB_CAP_DATA_REG_D0_SUSTAINED_REG : std_logic_vector(31 downto 0) := PF1_PB_CAP_DATA_REG_D0_SUSTAINED;
    constant PF1_PB_CAP_DATA_REG_D1_REG : std_logic_vector(31 downto 0) := PF1_PB_CAP_DATA_REG_D1;
    constant PF1_PB_CAP_DATA_REG_D3HOT_REG : std_logic_vector(31 downto 0) := PF1_PB_CAP_DATA_REG_D3HOT;
    constant PF1_PB_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_PB_CAP_NEXTPTR;
    constant PF1_PB_CAP_VER_REG : std_logic_vector(3 downto 0) := PF1_PB_CAP_VER;
    constant PF1_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := PF1_PM_CAP_ID;
    constant PF1_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF1_PM_CAP_NEXTPTR;
    constant PF1_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := PF1_PM_CAP_VER_ID;
    constant PF1_RBAR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_RBAR_CAP_NEXTPTR;
    constant PF1_RBAR_CAP_SIZE0_REG : std_logic_vector(19 downto 0) := PF1_RBAR_CAP_SIZE0;
    constant PF1_RBAR_CAP_SIZE1_REG : std_logic_vector(19 downto 0) := PF1_RBAR_CAP_SIZE1;
    constant PF1_RBAR_CAP_SIZE2_REG : std_logic_vector(19 downto 0) := PF1_RBAR_CAP_SIZE2;
    constant PF1_RBAR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF1_RBAR_CAP_VER;
    constant PF1_RBAR_CONTROL_INDEX0_REG : std_logic_vector(2 downto 0) := PF1_RBAR_CONTROL_INDEX0;
    constant PF1_RBAR_CONTROL_INDEX1_REG : std_logic_vector(2 downto 0) := PF1_RBAR_CONTROL_INDEX1;
    constant PF1_RBAR_CONTROL_INDEX2_REG : std_logic_vector(2 downto 0) := PF1_RBAR_CONTROL_INDEX2;
    constant PF1_RBAR_CONTROL_SIZE0_REG : std_logic_vector(4 downto 0) := PF1_RBAR_CONTROL_SIZE0;
    constant PF1_RBAR_CONTROL_SIZE1_REG : std_logic_vector(4 downto 0) := PF1_RBAR_CONTROL_SIZE1;
    constant PF1_RBAR_CONTROL_SIZE2_REG : std_logic_vector(4 downto 0) := PF1_RBAR_CONTROL_SIZE2;
    constant PF1_RBAR_NUM_REG : std_logic_vector(2 downto 0) := PF1_RBAR_NUM;
    constant PF1_REVISION_ID_REG : std_logic_vector(7 downto 0) := PF1_REVISION_ID;
    constant PF1_SRIOV_BAR0_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_SRIOV_BAR0_APERTURE_SIZE;
    constant PF1_SRIOV_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_SRIOV_BAR0_CONTROL;
    constant PF1_SRIOV_BAR1_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_SRIOV_BAR1_APERTURE_SIZE;
    constant PF1_SRIOV_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_SRIOV_BAR1_CONTROL;
    constant PF1_SRIOV_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_SRIOV_BAR2_APERTURE_SIZE;
    constant PF1_SRIOV_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_SRIOV_BAR2_CONTROL;
    constant PF1_SRIOV_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_SRIOV_BAR3_APERTURE_SIZE;
    constant PF1_SRIOV_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_SRIOV_BAR3_CONTROL;
    constant PF1_SRIOV_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_SRIOV_BAR4_APERTURE_SIZE;
    constant PF1_SRIOV_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_SRIOV_BAR4_CONTROL;
    constant PF1_SRIOV_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF1_SRIOV_BAR5_APERTURE_SIZE;
    constant PF1_SRIOV_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF1_SRIOV_BAR5_CONTROL;
    constant PF1_SRIOV_CAP_INITIAL_VF_REG : std_logic_vector(15 downto 0) := PF1_SRIOV_CAP_INITIAL_VF;
    constant PF1_SRIOV_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_SRIOV_CAP_NEXTPTR;
    constant PF1_SRIOV_CAP_TOTAL_VF_REG : std_logic_vector(15 downto 0) := PF1_SRIOV_CAP_TOTAL_VF;
    constant PF1_SRIOV_CAP_VER_REG : std_logic_vector(3 downto 0) := PF1_SRIOV_CAP_VER;
    constant PF1_SRIOV_FIRST_VF_OFFSET_REG : std_logic_vector(15 downto 0) := PF1_SRIOV_FIRST_VF_OFFSET;
    constant PF1_SRIOV_FUNC_DEP_LINK_REG : std_logic_vector(15 downto 0) := PF1_SRIOV_FUNC_DEP_LINK;
    constant PF1_SRIOV_SUPPORTED_PAGE_SIZE_REG : std_logic_vector(31 downto 0) := PF1_SRIOV_SUPPORTED_PAGE_SIZE;
    constant PF1_SRIOV_VF_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF1_SRIOV_VF_DEVICE_ID;
    constant PF1_SUBSYSTEM_ID_REG : std_logic_vector(15 downto 0) := PF1_SUBSYSTEM_ID;
    constant PF1_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF1_TPHR_CAP_NEXTPTR;
    constant PF1_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := PF1_TPHR_CAP_ST_MODE_SEL;
    constant PF1_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := PF1_TPHR_CAP_ST_TABLE_LOC;
    constant PF1_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF1_TPHR_CAP_ST_TABLE_SIZE;
    constant PF1_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF1_TPHR_CAP_VER;
    constant PF2_AER_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_AER_CAP_NEXTPTR;
    constant PF2_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_ARI_CAP_NEXTPTR;
    constant PF2_ARI_CAP_NEXT_FUNC_REG : std_logic_vector(7 downto 0) := PF2_ARI_CAP_NEXT_FUNC;
    constant PF2_BAR0_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF2_BAR0_APERTURE_SIZE;
    constant PF2_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_BAR0_CONTROL;
    constant PF2_BAR1_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF2_BAR1_APERTURE_SIZE;
    constant PF2_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_BAR1_CONTROL;
    constant PF2_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_BAR2_APERTURE_SIZE;
    constant PF2_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_BAR2_CONTROL;
    constant PF2_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_BAR3_APERTURE_SIZE;
    constant PF2_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_BAR3_CONTROL;
    constant PF2_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_BAR4_APERTURE_SIZE;
    constant PF2_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_BAR4_CONTROL;
    constant PF2_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_BAR5_APERTURE_SIZE;
    constant PF2_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_BAR5_CONTROL;
    constant PF2_BIST_REGISTER_REG : std_logic_vector(7 downto 0) := PF2_BIST_REGISTER;
    constant PF2_CAPABILITY_POINTER_REG : std_logic_vector(7 downto 0) := PF2_CAPABILITY_POINTER;
    constant PF2_CLASS_CODE_REG : std_logic_vector(23 downto 0) := PF2_CLASS_CODE;
    constant PF2_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF2_DEVICE_ID;
    constant PF2_DEV_CAP_MAX_PAYLOAD_SIZE_REG : std_logic_vector(2 downto 0) := PF2_DEV_CAP_MAX_PAYLOAD_SIZE;
    constant PF2_DPA_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_DPA_CAP_NEXTPTR;
    constant PF2_DPA_CAP_SUB_STATE_CONTROL_REG : std_logic_vector(4 downto 0) := PF2_DPA_CAP_SUB_STATE_CONTROL;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
    constant PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG : std_logic_vector(7 downto 0) := PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
    constant PF2_DPA_CAP_VER_REG : std_logic_vector(3 downto 0) := PF2_DPA_CAP_VER;
    constant PF2_DSN_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_DSN_CAP_NEXTPTR;
    constant PF2_EXPANSION_ROM_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_EXPANSION_ROM_APERTURE_SIZE;
    constant PF2_INTERRUPT_LINE_REG : std_logic_vector(7 downto 0) := PF2_INTERRUPT_LINE;
    constant PF2_INTERRUPT_PIN_REG : std_logic_vector(2 downto 0) := PF2_INTERRUPT_PIN;
    constant PF2_MSIX_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF2_MSIX_CAP_NEXTPTR;
    constant PF2_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF2_MSIX_CAP_PBA_BIR,3));
    constant PF2_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := PF2_MSIX_CAP_PBA_OFFSET;
    constant PF2_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF2_MSIX_CAP_TABLE_BIR,3));
    constant PF2_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := PF2_MSIX_CAP_TABLE_OFFSET;
    constant PF2_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF2_MSIX_CAP_TABLE_SIZE;
    constant PF2_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF2_MSI_CAP_MULTIMSGCAP,3));
    constant PF2_MSI_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF2_MSI_CAP_NEXTPTR;
    constant PF2_PB_CAP_DATA_REG_D0_REG : std_logic_vector(31 downto 0) := PF2_PB_CAP_DATA_REG_D0;
    constant PF2_PB_CAP_DATA_REG_D0_SUSTAINED_REG : std_logic_vector(31 downto 0) := PF2_PB_CAP_DATA_REG_D0_SUSTAINED;
    constant PF2_PB_CAP_DATA_REG_D1_REG : std_logic_vector(31 downto 0) := PF2_PB_CAP_DATA_REG_D1;
    constant PF2_PB_CAP_DATA_REG_D3HOT_REG : std_logic_vector(31 downto 0) := PF2_PB_CAP_DATA_REG_D3HOT;
    constant PF2_PB_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_PB_CAP_NEXTPTR;
    constant PF2_PB_CAP_VER_REG : std_logic_vector(3 downto 0) := PF2_PB_CAP_VER;
    constant PF2_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := PF2_PM_CAP_ID;
    constant PF2_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF2_PM_CAP_NEXTPTR;
    constant PF2_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := PF2_PM_CAP_VER_ID;
    constant PF2_RBAR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_RBAR_CAP_NEXTPTR;
    constant PF2_RBAR_CAP_SIZE0_REG : std_logic_vector(19 downto 0) := PF2_RBAR_CAP_SIZE0;
    constant PF2_RBAR_CAP_SIZE1_REG : std_logic_vector(19 downto 0) := PF2_RBAR_CAP_SIZE1;
    constant PF2_RBAR_CAP_SIZE2_REG : std_logic_vector(19 downto 0) := PF2_RBAR_CAP_SIZE2;
    constant PF2_RBAR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF2_RBAR_CAP_VER;
    constant PF2_RBAR_CONTROL_INDEX0_REG : std_logic_vector(2 downto 0) := PF2_RBAR_CONTROL_INDEX0;
    constant PF2_RBAR_CONTROL_INDEX1_REG : std_logic_vector(2 downto 0) := PF2_RBAR_CONTROL_INDEX1;
    constant PF2_RBAR_CONTROL_INDEX2_REG : std_logic_vector(2 downto 0) := PF2_RBAR_CONTROL_INDEX2;
    constant PF2_RBAR_CONTROL_SIZE0_REG : std_logic_vector(4 downto 0) := PF2_RBAR_CONTROL_SIZE0;
    constant PF2_RBAR_CONTROL_SIZE1_REG : std_logic_vector(4 downto 0) := PF2_RBAR_CONTROL_SIZE1;
    constant PF2_RBAR_CONTROL_SIZE2_REG : std_logic_vector(4 downto 0) := PF2_RBAR_CONTROL_SIZE2;
    constant PF2_RBAR_NUM_REG : std_logic_vector(2 downto 0) := PF2_RBAR_NUM;
    constant PF2_REVISION_ID_REG : std_logic_vector(7 downto 0) := PF2_REVISION_ID;
    constant PF2_SRIOV_BAR0_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_SRIOV_BAR0_APERTURE_SIZE;
    constant PF2_SRIOV_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_SRIOV_BAR0_CONTROL;
    constant PF2_SRIOV_BAR1_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_SRIOV_BAR1_APERTURE_SIZE;
    constant PF2_SRIOV_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_SRIOV_BAR1_CONTROL;
    constant PF2_SRIOV_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_SRIOV_BAR2_APERTURE_SIZE;
    constant PF2_SRIOV_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_SRIOV_BAR2_CONTROL;
    constant PF2_SRIOV_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_SRIOV_BAR3_APERTURE_SIZE;
    constant PF2_SRIOV_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_SRIOV_BAR3_CONTROL;
    constant PF2_SRIOV_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_SRIOV_BAR4_APERTURE_SIZE;
    constant PF2_SRIOV_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_SRIOV_BAR4_CONTROL;
    constant PF2_SRIOV_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF2_SRIOV_BAR5_APERTURE_SIZE;
    constant PF2_SRIOV_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF2_SRIOV_BAR5_CONTROL;
    constant PF2_SRIOV_CAP_INITIAL_VF_REG : std_logic_vector(15 downto 0) := PF2_SRIOV_CAP_INITIAL_VF;
    constant PF2_SRIOV_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_SRIOV_CAP_NEXTPTR;
    constant PF2_SRIOV_CAP_TOTAL_VF_REG : std_logic_vector(15 downto 0) := PF2_SRIOV_CAP_TOTAL_VF;
    constant PF2_SRIOV_CAP_VER_REG : std_logic_vector(3 downto 0) := PF2_SRIOV_CAP_VER;
    constant PF2_SRIOV_FIRST_VF_OFFSET_REG : std_logic_vector(15 downto 0) := PF2_SRIOV_FIRST_VF_OFFSET;
    constant PF2_SRIOV_FUNC_DEP_LINK_REG : std_logic_vector(15 downto 0) := PF2_SRIOV_FUNC_DEP_LINK;
    constant PF2_SRIOV_SUPPORTED_PAGE_SIZE_REG : std_logic_vector(31 downto 0) := PF2_SRIOV_SUPPORTED_PAGE_SIZE;
    constant PF2_SRIOV_VF_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF2_SRIOV_VF_DEVICE_ID;
    constant PF2_SUBSYSTEM_ID_REG : std_logic_vector(15 downto 0) := PF2_SUBSYSTEM_ID;
    constant PF2_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF2_TPHR_CAP_NEXTPTR;
    constant PF2_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := PF2_TPHR_CAP_ST_MODE_SEL;
    constant PF2_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := PF2_TPHR_CAP_ST_TABLE_LOC;
    constant PF2_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF2_TPHR_CAP_ST_TABLE_SIZE;
    constant PF2_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF2_TPHR_CAP_VER;
    constant PF3_AER_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_AER_CAP_NEXTPTR;
    constant PF3_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_ARI_CAP_NEXTPTR;
    constant PF3_ARI_CAP_NEXT_FUNC_REG : std_logic_vector(7 downto 0) := PF3_ARI_CAP_NEXT_FUNC;
    constant PF3_BAR0_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF3_BAR0_APERTURE_SIZE;
    constant PF3_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_BAR0_CONTROL;
    constant PF3_BAR1_APERTURE_SIZE_REG : std_logic_vector(5 downto 0) := PF3_BAR1_APERTURE_SIZE;
    constant PF3_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_BAR1_CONTROL;
    constant PF3_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_BAR2_APERTURE_SIZE;
    constant PF3_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_BAR2_CONTROL;
    constant PF3_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_BAR3_APERTURE_SIZE;
    constant PF3_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_BAR3_CONTROL;
    constant PF3_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_BAR4_APERTURE_SIZE;
    constant PF3_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_BAR4_CONTROL;
    constant PF3_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_BAR5_APERTURE_SIZE;
    constant PF3_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_BAR5_CONTROL;
    constant PF3_BIST_REGISTER_REG : std_logic_vector(7 downto 0) := PF3_BIST_REGISTER;
    constant PF3_CAPABILITY_POINTER_REG : std_logic_vector(7 downto 0) := PF3_CAPABILITY_POINTER;
    constant PF3_CLASS_CODE_REG : std_logic_vector(23 downto 0) := PF3_CLASS_CODE;
    constant PF3_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF3_DEVICE_ID;
    constant PF3_DEV_CAP_MAX_PAYLOAD_SIZE_REG : std_logic_vector(2 downto 0) := PF3_DEV_CAP_MAX_PAYLOAD_SIZE;
    constant PF3_DPA_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_DPA_CAP_NEXTPTR;
    constant PF3_DPA_CAP_SUB_STATE_CONTROL_REG : std_logic_vector(4 downto 0) := PF3_DPA_CAP_SUB_STATE_CONTROL;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
    constant PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG : std_logic_vector(7 downto 0) := PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
    constant PF3_DPA_CAP_VER_REG : std_logic_vector(3 downto 0) := PF3_DPA_CAP_VER;
    constant PF3_DSN_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_DSN_CAP_NEXTPTR;
    constant PF3_EXPANSION_ROM_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_EXPANSION_ROM_APERTURE_SIZE;
    constant PF3_INTERRUPT_LINE_REG : std_logic_vector(7 downto 0) := PF3_INTERRUPT_LINE;
    constant PF3_INTERRUPT_PIN_REG : std_logic_vector(2 downto 0) := PF3_INTERRUPT_PIN;
    constant PF3_MSIX_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF3_MSIX_CAP_NEXTPTR;
    constant PF3_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF3_MSIX_CAP_PBA_BIR,3));
    constant PF3_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := PF3_MSIX_CAP_PBA_OFFSET;
    constant PF3_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF3_MSIX_CAP_TABLE_BIR,3));
    constant PF3_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := PF3_MSIX_CAP_TABLE_OFFSET;
    constant PF3_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF3_MSIX_CAP_TABLE_SIZE;
    constant PF3_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PF3_MSI_CAP_MULTIMSGCAP,3));
    constant PF3_MSI_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF3_MSI_CAP_NEXTPTR;
    constant PF3_PB_CAP_DATA_REG_D0_REG : std_logic_vector(31 downto 0) := PF3_PB_CAP_DATA_REG_D0;
    constant PF3_PB_CAP_DATA_REG_D0_SUSTAINED_REG : std_logic_vector(31 downto 0) := PF3_PB_CAP_DATA_REG_D0_SUSTAINED;
    constant PF3_PB_CAP_DATA_REG_D1_REG : std_logic_vector(31 downto 0) := PF3_PB_CAP_DATA_REG_D1;
    constant PF3_PB_CAP_DATA_REG_D3HOT_REG : std_logic_vector(31 downto 0) := PF3_PB_CAP_DATA_REG_D3HOT;
    constant PF3_PB_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_PB_CAP_NEXTPTR;
    constant PF3_PB_CAP_VER_REG : std_logic_vector(3 downto 0) := PF3_PB_CAP_VER;
    constant PF3_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := PF3_PM_CAP_ID;
    constant PF3_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := PF3_PM_CAP_NEXTPTR;
    constant PF3_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := PF3_PM_CAP_VER_ID;
    constant PF3_RBAR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_RBAR_CAP_NEXTPTR;
    constant PF3_RBAR_CAP_SIZE0_REG : std_logic_vector(19 downto 0) := PF3_RBAR_CAP_SIZE0;
    constant PF3_RBAR_CAP_SIZE1_REG : std_logic_vector(19 downto 0) := PF3_RBAR_CAP_SIZE1;
    constant PF3_RBAR_CAP_SIZE2_REG : std_logic_vector(19 downto 0) := PF3_RBAR_CAP_SIZE2;
    constant PF3_RBAR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF3_RBAR_CAP_VER;
    constant PF3_RBAR_CONTROL_INDEX0_REG : std_logic_vector(2 downto 0) := PF3_RBAR_CONTROL_INDEX0;
    constant PF3_RBAR_CONTROL_INDEX1_REG : std_logic_vector(2 downto 0) := PF3_RBAR_CONTROL_INDEX1;
    constant PF3_RBAR_CONTROL_INDEX2_REG : std_logic_vector(2 downto 0) := PF3_RBAR_CONTROL_INDEX2;
    constant PF3_RBAR_CONTROL_SIZE0_REG : std_logic_vector(4 downto 0) := PF3_RBAR_CONTROL_SIZE0;
    constant PF3_RBAR_CONTROL_SIZE1_REG : std_logic_vector(4 downto 0) := PF3_RBAR_CONTROL_SIZE1;
    constant PF3_RBAR_CONTROL_SIZE2_REG : std_logic_vector(4 downto 0) := PF3_RBAR_CONTROL_SIZE2;
    constant PF3_RBAR_NUM_REG : std_logic_vector(2 downto 0) := PF3_RBAR_NUM;
    constant PF3_REVISION_ID_REG : std_logic_vector(7 downto 0) := PF3_REVISION_ID;
    constant PF3_SRIOV_BAR0_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_SRIOV_BAR0_APERTURE_SIZE;
    constant PF3_SRIOV_BAR0_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_SRIOV_BAR0_CONTROL;
    constant PF3_SRIOV_BAR1_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_SRIOV_BAR1_APERTURE_SIZE;
    constant PF3_SRIOV_BAR1_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_SRIOV_BAR1_CONTROL;
    constant PF3_SRIOV_BAR2_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_SRIOV_BAR2_APERTURE_SIZE;
    constant PF3_SRIOV_BAR2_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_SRIOV_BAR2_CONTROL;
    constant PF3_SRIOV_BAR3_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_SRIOV_BAR3_APERTURE_SIZE;
    constant PF3_SRIOV_BAR3_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_SRIOV_BAR3_CONTROL;
    constant PF3_SRIOV_BAR4_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_SRIOV_BAR4_APERTURE_SIZE;
    constant PF3_SRIOV_BAR4_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_SRIOV_BAR4_CONTROL;
    constant PF3_SRIOV_BAR5_APERTURE_SIZE_REG : std_logic_vector(4 downto 0) := PF3_SRIOV_BAR5_APERTURE_SIZE;
    constant PF3_SRIOV_BAR5_CONTROL_REG : std_logic_vector(2 downto 0) := PF3_SRIOV_BAR5_CONTROL;
    constant PF3_SRIOV_CAP_INITIAL_VF_REG : std_logic_vector(15 downto 0) := PF3_SRIOV_CAP_INITIAL_VF;
    constant PF3_SRIOV_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_SRIOV_CAP_NEXTPTR;
    constant PF3_SRIOV_CAP_TOTAL_VF_REG : std_logic_vector(15 downto 0) := PF3_SRIOV_CAP_TOTAL_VF;
    constant PF3_SRIOV_CAP_VER_REG : std_logic_vector(3 downto 0) := PF3_SRIOV_CAP_VER;
    constant PF3_SRIOV_FIRST_VF_OFFSET_REG : std_logic_vector(15 downto 0) := PF3_SRIOV_FIRST_VF_OFFSET;
    constant PF3_SRIOV_FUNC_DEP_LINK_REG : std_logic_vector(15 downto 0) := PF3_SRIOV_FUNC_DEP_LINK;
    constant PF3_SRIOV_SUPPORTED_PAGE_SIZE_REG : std_logic_vector(31 downto 0) := PF3_SRIOV_SUPPORTED_PAGE_SIZE;
    constant PF3_SRIOV_VF_DEVICE_ID_REG : std_logic_vector(15 downto 0) := PF3_SRIOV_VF_DEVICE_ID;
    constant PF3_SUBSYSTEM_ID_REG : std_logic_vector(15 downto 0) := PF3_SUBSYSTEM_ID;
    constant PF3_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := PF3_TPHR_CAP_NEXTPTR;
    constant PF3_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := PF3_TPHR_CAP_ST_MODE_SEL;
    constant PF3_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := PF3_TPHR_CAP_ST_TABLE_LOC;
    constant PF3_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := PF3_TPHR_CAP_ST_TABLE_SIZE;
    constant PF3_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := PF3_TPHR_CAP_VER;
    constant PL_EQ_ADAPT_ITER_COUNT_REG : std_logic_vector(4 downto 0) := PL_EQ_ADAPT_ITER_COUNT;
    constant PL_EQ_ADAPT_REJECT_RETRY_COUNT_REG : std_logic_vector(1 downto 0) := PL_EQ_ADAPT_REJECT_RETRY_COUNT;
    constant PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT_REG : std_logic_vector(2 downto 0) := PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT;
    constant PL_EQ_DEFAULT_GEN3_TX_PRESET_REG : std_logic_vector(3 downto 0) := PL_EQ_DEFAULT_GEN3_TX_PRESET;
    constant PL_LANE0_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE0_EQ_CONTROL;
    constant PL_LANE1_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE1_EQ_CONTROL;
    constant PL_LANE2_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE2_EQ_CONTROL;
    constant PL_LANE3_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE3_EQ_CONTROL;
    constant PL_LANE4_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE4_EQ_CONTROL;
    constant PL_LANE5_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE5_EQ_CONTROL;
    constant PL_LANE6_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE6_EQ_CONTROL;
    constant PL_LANE7_EQ_CONTROL_REG : std_logic_vector(15 downto 0) := PL_LANE7_EQ_CONTROL;
    constant PL_LINK_CAP_MAX_LINK_SPEED_REG : std_logic_vector(2 downto 0) := PL_LINK_CAP_MAX_LINK_SPEED;
    constant PL_LINK_CAP_MAX_LINK_WIDTH_REG : std_logic_vector(3 downto 0) := PL_LINK_CAP_MAX_LINK_WIDTH;
    constant PL_N_FTS_COMCLK_GEN1_REG : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(PL_N_FTS_COMCLK_GEN1,8));
    constant PL_N_FTS_COMCLK_GEN2_REG : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(PL_N_FTS_COMCLK_GEN2,8));
    constant PL_N_FTS_COMCLK_GEN3_REG : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(PL_N_FTS_COMCLK_GEN3,8));
    constant PL_N_FTS_GEN1_REG : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(PL_N_FTS_GEN1,8));
    constant PL_N_FTS_GEN2_REG : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(PL_N_FTS_GEN2,8));
    constant PL_N_FTS_GEN3_REG : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(PL_N_FTS_GEN3,8));
    constant PM_ASPML0S_TIMEOUT_REG : std_logic_vector(15 downto 0) := PM_ASPML0S_TIMEOUT;
    constant PM_ASPML1_ENTRY_DELAY_REG : std_logic_vector(19 downto 0) := PM_ASPML1_ENTRY_DELAY;
    constant PM_L1_REENTRY_DELAY_REG : std_logic_vector(31 downto 0) := PM_L1_REENTRY_DELAY;
    constant PM_PME_SERVICE_TIMEOUT_DELAY_REG : std_logic_vector(19 downto 0) := PM_PME_SERVICE_TIMEOUT_DELAY;
    constant PM_PME_TURNOFF_ACK_DELAY_REG : std_logic_vector(15 downto 0) := PM_PME_TURNOFF_ACK_DELAY;
    constant SPARE_BIT0_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT0,1));
    constant SPARE_BIT1_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT1,1));
    constant SPARE_BIT2_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT2,1));
    constant SPARE_BIT3_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT3,1));
    constant SPARE_BIT4_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT4,1));
    constant SPARE_BIT5_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT5,1));
    constant SPARE_BIT6_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT6,1));
    constant SPARE_BIT7_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT7,1));
    constant SPARE_BIT8_REG : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(SPARE_BIT8,1));
    constant SPARE_BYTE0_REG : std_logic_vector(7 downto 0) := SPARE_BYTE0;
    constant SPARE_BYTE1_REG : std_logic_vector(7 downto 0) := SPARE_BYTE1;
    constant SPARE_BYTE2_REG : std_logic_vector(7 downto 0) := SPARE_BYTE2;
    constant SPARE_BYTE3_REG : std_logic_vector(7 downto 0) := SPARE_BYTE3;
    constant SPARE_WORD0_REG : std_logic_vector(31 downto 0) := SPARE_WORD0;
    constant SPARE_WORD1_REG : std_logic_vector(31 downto 0) := SPARE_WORD1;
    constant SPARE_WORD2_REG : std_logic_vector(31 downto 0) := SPARE_WORD2;
    constant SPARE_WORD3_REG : std_logic_vector(31 downto 0) := SPARE_WORD3;
    constant TL_COMPL_TIMEOUT_REG0_REG : std_logic_vector(23 downto 0) := TL_COMPL_TIMEOUT_REG0;
    constant TL_COMPL_TIMEOUT_REG1_REG : std_logic_vector(27 downto 0) := TL_COMPL_TIMEOUT_REG1;
    constant TL_CREDITS_CD_REG : std_logic_vector(11 downto 0) := TL_CREDITS_CD;
    constant TL_CREDITS_CH_REG : std_logic_vector(7 downto 0) := TL_CREDITS_CH;
    constant TL_CREDITS_NPD_REG : std_logic_vector(11 downto 0) := TL_CREDITS_NPD;
    constant TL_CREDITS_NPH_REG : std_logic_vector(7 downto 0) := TL_CREDITS_NPH;
    constant TL_CREDITS_PD_REG : std_logic_vector(11 downto 0) := TL_CREDITS_PD;
    constant TL_CREDITS_PH_REG : std_logic_vector(7 downto 0) := TL_CREDITS_PH;
    constant TL_PF_ENABLE_REG_REG : std_logic_vector(1 downto 0) := TL_PF_ENABLE_REG;
    constant VF0_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF0_ARI_CAP_NEXTPTR;
    constant VF0_CAPABILITY_POINTER_REG : std_logic_vector(7 downto 0) := VF0_CAPABILITY_POINTER;
    constant VF0_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF0_MSIX_CAP_PBA_BIR,3));
    constant VF0_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF0_MSIX_CAP_PBA_OFFSET;
    constant VF0_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF0_MSIX_CAP_TABLE_BIR,3));
    constant VF0_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF0_MSIX_CAP_TABLE_OFFSET;
    constant VF0_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF0_MSIX_CAP_TABLE_SIZE;
    constant VF0_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF0_MSI_CAP_MULTIMSGCAP,3));
    constant VF0_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF0_PM_CAP_ID;
    constant VF0_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF0_PM_CAP_NEXTPTR;
    constant VF0_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF0_PM_CAP_VER_ID;
    constant VF0_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF0_TPHR_CAP_NEXTPTR;
    constant VF0_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF0_TPHR_CAP_ST_MODE_SEL;
    constant VF0_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF0_TPHR_CAP_ST_TABLE_LOC;
    constant VF0_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF0_TPHR_CAP_ST_TABLE_SIZE;
    constant VF0_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF0_TPHR_CAP_VER;
    constant VF1_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF1_ARI_CAP_NEXTPTR;
    constant VF1_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF1_MSIX_CAP_PBA_BIR,3));
    constant VF1_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF1_MSIX_CAP_PBA_OFFSET;
    constant VF1_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF1_MSIX_CAP_TABLE_BIR,3));
    constant VF1_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF1_MSIX_CAP_TABLE_OFFSET;
    constant VF1_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF1_MSIX_CAP_TABLE_SIZE;
    constant VF1_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF1_MSI_CAP_MULTIMSGCAP,3));
    constant VF1_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF1_PM_CAP_ID;
    constant VF1_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF1_PM_CAP_NEXTPTR;
    constant VF1_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF1_PM_CAP_VER_ID;
    constant VF1_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF1_TPHR_CAP_NEXTPTR;
    constant VF1_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF1_TPHR_CAP_ST_MODE_SEL;
    constant VF1_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF1_TPHR_CAP_ST_TABLE_LOC;
    constant VF1_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF1_TPHR_CAP_ST_TABLE_SIZE;
    constant VF1_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF1_TPHR_CAP_VER;
    constant VF2_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF2_ARI_CAP_NEXTPTR;
    constant VF2_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF2_MSIX_CAP_PBA_BIR,3));
    constant VF2_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF2_MSIX_CAP_PBA_OFFSET;
    constant VF2_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF2_MSIX_CAP_TABLE_BIR,3));
    constant VF2_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF2_MSIX_CAP_TABLE_OFFSET;
    constant VF2_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF2_MSIX_CAP_TABLE_SIZE;
    constant VF2_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF2_MSI_CAP_MULTIMSGCAP,3));
    constant VF2_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF2_PM_CAP_ID;
    constant VF2_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF2_PM_CAP_NEXTPTR;
    constant VF2_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF2_PM_CAP_VER_ID;
    constant VF2_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF2_TPHR_CAP_NEXTPTR;
    constant VF2_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF2_TPHR_CAP_ST_MODE_SEL;
    constant VF2_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF2_TPHR_CAP_ST_TABLE_LOC;
    constant VF2_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF2_TPHR_CAP_ST_TABLE_SIZE;
    constant VF2_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF2_TPHR_CAP_VER;
    constant VF3_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF3_ARI_CAP_NEXTPTR;
    constant VF3_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF3_MSIX_CAP_PBA_BIR,3));
    constant VF3_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF3_MSIX_CAP_PBA_OFFSET;
    constant VF3_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF3_MSIX_CAP_TABLE_BIR,3));
    constant VF3_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF3_MSIX_CAP_TABLE_OFFSET;
    constant VF3_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF3_MSIX_CAP_TABLE_SIZE;
    constant VF3_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF3_MSI_CAP_MULTIMSGCAP,3));
    constant VF3_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF3_PM_CAP_ID;
    constant VF3_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF3_PM_CAP_NEXTPTR;
    constant VF3_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF3_PM_CAP_VER_ID;
    constant VF3_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF3_TPHR_CAP_NEXTPTR;
    constant VF3_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF3_TPHR_CAP_ST_MODE_SEL;
    constant VF3_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF3_TPHR_CAP_ST_TABLE_LOC;
    constant VF3_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF3_TPHR_CAP_ST_TABLE_SIZE;
    constant VF3_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF3_TPHR_CAP_VER;
    constant VF4_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF4_ARI_CAP_NEXTPTR;
    constant VF4_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF4_MSIX_CAP_PBA_BIR,3));
    constant VF4_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF4_MSIX_CAP_PBA_OFFSET;
    constant VF4_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF4_MSIX_CAP_TABLE_BIR,3));
    constant VF4_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF4_MSIX_CAP_TABLE_OFFSET;
    constant VF4_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF4_MSIX_CAP_TABLE_SIZE;
    constant VF4_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF4_MSI_CAP_MULTIMSGCAP,3));
    constant VF4_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF4_PM_CAP_ID;
    constant VF4_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF4_PM_CAP_NEXTPTR;
    constant VF4_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF4_PM_CAP_VER_ID;
    constant VF4_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF4_TPHR_CAP_NEXTPTR;
    constant VF4_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF4_TPHR_CAP_ST_MODE_SEL;
    constant VF4_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF4_TPHR_CAP_ST_TABLE_LOC;
    constant VF4_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF4_TPHR_CAP_ST_TABLE_SIZE;
    constant VF4_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF4_TPHR_CAP_VER;
    constant VF5_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF5_ARI_CAP_NEXTPTR;
    constant VF5_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF5_MSIX_CAP_PBA_BIR,3));
    constant VF5_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF5_MSIX_CAP_PBA_OFFSET;
    constant VF5_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF5_MSIX_CAP_TABLE_BIR,3));
    constant VF5_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF5_MSIX_CAP_TABLE_OFFSET;
    constant VF5_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF5_MSIX_CAP_TABLE_SIZE;
    constant VF5_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF5_MSI_CAP_MULTIMSGCAP,3));
    constant VF5_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF5_PM_CAP_ID;
    constant VF5_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF5_PM_CAP_NEXTPTR;
    constant VF5_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF5_PM_CAP_VER_ID;
    constant VF5_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF5_TPHR_CAP_NEXTPTR;
    constant VF5_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF5_TPHR_CAP_ST_MODE_SEL;
    constant VF5_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF5_TPHR_CAP_ST_TABLE_LOC;
    constant VF5_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF5_TPHR_CAP_ST_TABLE_SIZE;
    constant VF5_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF5_TPHR_CAP_VER;
    constant VF6_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF6_ARI_CAP_NEXTPTR;
    constant VF6_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF6_MSIX_CAP_PBA_BIR,3));
    constant VF6_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF6_MSIX_CAP_PBA_OFFSET;
    constant VF6_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF6_MSIX_CAP_TABLE_BIR,3));
    constant VF6_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF6_MSIX_CAP_TABLE_OFFSET;
    constant VF6_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF6_MSIX_CAP_TABLE_SIZE;
    constant VF6_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF6_MSI_CAP_MULTIMSGCAP,3));
    constant VF6_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF6_PM_CAP_ID;
    constant VF6_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF6_PM_CAP_NEXTPTR;
    constant VF6_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF6_PM_CAP_VER_ID;
    constant VF6_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF6_TPHR_CAP_NEXTPTR;
    constant VF6_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF6_TPHR_CAP_ST_MODE_SEL;
    constant VF6_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF6_TPHR_CAP_ST_TABLE_LOC;
    constant VF6_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF6_TPHR_CAP_ST_TABLE_SIZE;
    constant VF6_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF6_TPHR_CAP_VER;
    constant VF7_ARI_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF7_ARI_CAP_NEXTPTR;
    constant VF7_MSIX_CAP_PBA_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF7_MSIX_CAP_PBA_BIR,3));
    constant VF7_MSIX_CAP_PBA_OFFSET_REG : std_logic_vector(28 downto 0) := VF7_MSIX_CAP_PBA_OFFSET;
    constant VF7_MSIX_CAP_TABLE_BIR_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF7_MSIX_CAP_TABLE_BIR,3));
    constant VF7_MSIX_CAP_TABLE_OFFSET_REG : std_logic_vector(28 downto 0) := VF7_MSIX_CAP_TABLE_OFFSET;
    constant VF7_MSIX_CAP_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF7_MSIX_CAP_TABLE_SIZE;
    constant VF7_MSI_CAP_MULTIMSGCAP_REG : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(VF7_MSI_CAP_MULTIMSGCAP,3));
    constant VF7_PM_CAP_ID_REG : std_logic_vector(7 downto 0) := VF7_PM_CAP_ID;
    constant VF7_PM_CAP_NEXTPTR_REG : std_logic_vector(7 downto 0) := VF7_PM_CAP_NEXTPTR;
    constant VF7_PM_CAP_VER_ID_REG : std_logic_vector(2 downto 0) := VF7_PM_CAP_VER_ID;
    constant VF7_TPHR_CAP_NEXTPTR_REG : std_logic_vector(11 downto 0) := VF7_TPHR_CAP_NEXTPTR;
    constant VF7_TPHR_CAP_ST_MODE_SEL_REG : std_logic_vector(2 downto 0) := VF7_TPHR_CAP_ST_MODE_SEL;
    constant VF7_TPHR_CAP_ST_TABLE_LOC_REG : std_logic_vector(1 downto 0) := VF7_TPHR_CAP_ST_TABLE_LOC;
    constant VF7_TPHR_CAP_ST_TABLE_SIZE_REG : std_logic_vector(10 downto 0) := VF7_TPHR_CAP_ST_TABLE_SIZE;
    constant VF7_TPHR_CAP_VER_REG : std_logic_vector(3 downto 0) := VF7_TPHR_CAP_VER;
    
  -- Parameter encodings and registers

    signal glblGSR      : std_ulogic;
    
    signal attr_err     : std_ulogic := '0';
    
    signal CFGCURRENTSPEED_out : std_logic_vector(2 downto 0);
    signal CFGDPASUBSTATECHANGE_out : std_logic_vector(3 downto 0);
    signal CFGERRCOROUT_out : std_ulogic;
    signal CFGERRFATALOUT_out : std_ulogic;
    signal CFGERRNONFATALOUT_out : std_ulogic;
    signal CFGEXTFUNCTIONNUMBER_out : std_logic_vector(7 downto 0);
    signal CFGEXTREADRECEIVED_out : std_ulogic;
    signal CFGEXTREGISTERNUMBER_out : std_logic_vector(9 downto 0);
    signal CFGEXTWRITEBYTEENABLE_out : std_logic_vector(3 downto 0);
    signal CFGEXTWRITEDATA_out : std_logic_vector(31 downto 0);
    signal CFGEXTWRITERECEIVED_out : std_ulogic;
    signal CFGFCCPLD_out : std_logic_vector(11 downto 0);
    signal CFGFCCPLH_out : std_logic_vector(7 downto 0);
    signal CFGFCNPD_out : std_logic_vector(11 downto 0);
    signal CFGFCNPH_out : std_logic_vector(7 downto 0);
    signal CFGFCPD_out : std_logic_vector(11 downto 0);
    signal CFGFCPH_out : std_logic_vector(7 downto 0);
    signal CFGFLRINPROCESS_out : std_logic_vector(3 downto 0);
    signal CFGFUNCTIONPOWERSTATE_out : std_logic_vector(11 downto 0);
    signal CFGFUNCTIONSTATUS_out : std_logic_vector(15 downto 0);
    signal CFGHOTRESETOUT_out : std_ulogic;
    signal CFGINTERRUPTMSIDATA_out : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSIENABLE_out : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIFAIL_out : std_ulogic;
    signal CFGINTERRUPTMSIMASKUPDATE_out : std_ulogic;
    signal CFGINTERRUPTMSIMMENABLE_out : std_logic_vector(11 downto 0);
    signal CFGINTERRUPTMSISENT_out : std_ulogic;
    signal CFGINTERRUPTMSIVFENABLE_out : std_logic_vector(7 downto 0);
    signal CFGINTERRUPTMSIXENABLE_out : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIXFAIL_out : std_ulogic;
    signal CFGINTERRUPTMSIXMASK_out : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIXSENT_out : std_ulogic;
    signal CFGINTERRUPTMSIXVFENABLE_out : std_logic_vector(7 downto 0);
    signal CFGINTERRUPTMSIXVFMASK_out : std_logic_vector(7 downto 0);
    signal CFGINTERRUPTSENT_out : std_ulogic;
    signal CFGLINKPOWERSTATE_out : std_logic_vector(1 downto 0);
    signal CFGLOCALERROR_out : std_ulogic;
    signal CFGLTRENABLE_out : std_ulogic;
    signal CFGLTSSMSTATE_out : std_logic_vector(5 downto 0);
    signal CFGMAXPAYLOAD_out : std_logic_vector(2 downto 0);
    signal CFGMAXREADREQ_out : std_logic_vector(2 downto 0);
    signal CFGMGMTREADDATA_out : std_logic_vector(31 downto 0);
    signal CFGMGMTREADWRITEDONE_out : std_ulogic;
    signal CFGMSGRECEIVEDDATA_out : std_logic_vector(7 downto 0);
    signal CFGMSGRECEIVEDTYPE_out : std_logic_vector(4 downto 0);
    signal CFGMSGRECEIVED_out : std_ulogic;
    signal CFGMSGTRANSMITDONE_out : std_ulogic;
    signal CFGNEGOTIATEDWIDTH_out : std_logic_vector(3 downto 0);
    signal CFGOBFFENABLE_out : std_logic_vector(1 downto 0);
    signal CFGPERFUNCSTATUSDATA_out : std_logic_vector(15 downto 0);
    signal CFGPERFUNCTIONUPDATEDONE_out : std_ulogic;
    signal CFGPHYLINKDOWN_out : std_ulogic;
    signal CFGPHYLINKSTATUS_out : std_logic_vector(1 downto 0);
    signal CFGPLSTATUSCHANGE_out : std_ulogic;
    signal CFGPOWERSTATECHANGEINTERRUPT_out : std_ulogic;
    signal CFGRCBSTATUS_out : std_logic_vector(3 downto 0);
    signal CFGTPHFUNCTIONNUM_out : std_logic_vector(3 downto 0);
    signal CFGTPHREQUESTERENABLE_out : std_logic_vector(3 downto 0);
    signal CFGTPHSTMODE_out : std_logic_vector(11 downto 0);
    signal CFGTPHSTTADDRESS_out : std_logic_vector(4 downto 0);
    signal CFGTPHSTTREADENABLE_out : std_ulogic;
    signal CFGTPHSTTWRITEBYTEVALID_out : std_logic_vector(3 downto 0);
    signal CFGTPHSTTWRITEDATA_out : std_logic_vector(31 downto 0);
    signal CFGTPHSTTWRITEENABLE_out : std_ulogic;
    signal CFGVFFLRINPROCESS_out : std_logic_vector(7 downto 0);
    signal CFGVFPOWERSTATE_out : std_logic_vector(23 downto 0);
    signal CFGVFSTATUS_out : std_logic_vector(15 downto 0);
    signal CFGVFTPHREQUESTERENABLE_out : std_logic_vector(7 downto 0);
    signal CFGVFTPHSTMODE_out : std_logic_vector(23 downto 0);
    signal CONFMCAPDESIGNSWITCH_out : std_ulogic;
    signal CONFMCAPEOS_out : std_ulogic;
    signal CONFMCAPINUSEBYPCIE_out : std_ulogic;
    signal CONFREQREADY_out : std_ulogic;
    signal CONFRESPRDATA_out : std_logic_vector(31 downto 0);
    signal CONFRESPVALID_out : std_ulogic;
    signal DBGDATAOUT_out : std_logic_vector(15 downto 0);
    signal DBGMCAPCSB_out : std_ulogic;
    signal DBGMCAPDATA_out : std_logic_vector(31 downto 0);
    signal DBGMCAPEOS_out : std_ulogic;
    signal DBGMCAPERROR_out : std_ulogic;
    signal DBGMCAPMODE_out : std_ulogic;
    signal DBGMCAPRDATAVALID_out : std_ulogic;
    signal DBGMCAPRDWRB_out : std_ulogic;
    signal DBGMCAPRESET_out : std_ulogic;
    signal DBGPLDATABLOCKRECEIVEDAFTEREDS_out : std_ulogic;
    signal DBGPLGEN3FRAMINGERRORDETECTED_out : std_ulogic;
    signal DBGPLGEN3SYNCHEADERERRORDETECTED_out : std_ulogic;
    signal DBGPLINFERREDRXELECTRICALIDLE_out : std_logic_vector(7 downto 0);
    signal DRPDO_out : std_logic_vector(15 downto 0);
    signal DRPRDY_out : std_ulogic;
    signal LL2LMMASTERTLPSENT0_out : std_ulogic;
    signal LL2LMMASTERTLPSENT1_out : std_ulogic;
    signal LL2LMMASTERTLPSENTTLPID0_out : std_logic_vector(3 downto 0);
    signal LL2LMMASTERTLPSENTTLPID1_out : std_logic_vector(3 downto 0);
    signal LL2LMMAXISRXTDATA_out : std_logic_vector(255 downto 0);
    signal LL2LMMAXISRXTUSER_out : std_logic_vector(17 downto 0);
    signal LL2LMMAXISRXTVALID_out : std_logic_vector(7 downto 0);
    signal LL2LMSAXISTXTREADY_out : std_logic_vector(7 downto 0);
    signal MAXISCQTDATA_out : std_logic_vector(255 downto 0);
    signal MAXISCQTKEEP_out : std_logic_vector(7 downto 0);
    signal MAXISCQTLAST_out : std_ulogic;
    signal MAXISCQTUSER_out : std_logic_vector(84 downto 0);
    signal MAXISCQTVALID_out : std_ulogic;
    signal MAXISRCTDATA_out : std_logic_vector(255 downto 0);
    signal MAXISRCTKEEP_out : std_logic_vector(7 downto 0);
    signal MAXISRCTLAST_out : std_ulogic;
    signal MAXISRCTUSER_out : std_logic_vector(74 downto 0);
    signal MAXISRCTVALID_out : std_ulogic;
    signal MICOMPLETIONRAMREADADDRESSAL_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADADDRESSAU_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADADDRESSBL_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADADDRESSBU_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADENABLEL_out : std_logic_vector(3 downto 0);
    signal MICOMPLETIONRAMREADENABLEU_out : std_logic_vector(3 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSAL_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSAU_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSBL_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSBU_out : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEDATAL_out : std_logic_vector(71 downto 0);
    signal MICOMPLETIONRAMWRITEDATAU_out : std_logic_vector(71 downto 0);
    signal MICOMPLETIONRAMWRITEENABLEL_out : std_logic_vector(3 downto 0);
    signal MICOMPLETIONRAMWRITEENABLEU_out : std_logic_vector(3 downto 0);
    signal MIREPLAYRAMADDRESS_out : std_logic_vector(8 downto 0);
    signal MIREPLAYRAMREADENABLE_out : std_logic_vector(1 downto 0);
    signal MIREPLAYRAMWRITEDATA_out : std_logic_vector(143 downto 0);
    signal MIREPLAYRAMWRITEENABLE_out : std_logic_vector(1 downto 0);
    signal MIREQUESTRAMREADADDRESSA_out : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMREADADDRESSB_out : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMREADENABLE_out : std_logic_vector(3 downto 0);
    signal MIREQUESTRAMWRITEADDRESSA_out : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMWRITEADDRESSB_out : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMWRITEDATA_out : std_logic_vector(143 downto 0);
    signal MIREQUESTRAMWRITEENABLE_out : std_logic_vector(3 downto 0);
    signal PCIECQNPREQCOUNT_out : std_logic_vector(5 downto 0);
    signal PCIEPERST0B_out : std_ulogic;
    signal PCIEPERST1B_out : std_ulogic;
    signal PCIERQSEQNUMVLD_out : std_ulogic;
    signal PCIERQSEQNUM_out : std_logic_vector(3 downto 0);
    signal PCIERQTAGAV_out : std_logic_vector(1 downto 0);
    signal PCIERQTAGVLD_out : std_ulogic;
    signal PCIERQTAG_out : std_logic_vector(5 downto 0);
    signal PCIETFCNPDAV_out : std_logic_vector(1 downto 0);
    signal PCIETFCNPHAV_out : std_logic_vector(1 downto 0);
    signal PIPERX0EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX0EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX0EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX0EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX0POLARITY_out : std_ulogic;
    signal PIPERX1EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX1EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX1EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX1EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX1POLARITY_out : std_ulogic;
    signal PIPERX2EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX2EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX2EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX2EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX2POLARITY_out : std_ulogic;
    signal PIPERX3EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX3EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX3EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX3EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX3POLARITY_out : std_ulogic;
    signal PIPERX4EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX4EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX4EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX4EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX4POLARITY_out : std_ulogic;
    signal PIPERX5EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX5EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX5EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX5EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX5POLARITY_out : std_ulogic;
    signal PIPERX6EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX6EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX6EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX6EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX6POLARITY_out : std_ulogic;
    signal PIPERX7EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPERX7EQLPLFFS_out : std_logic_vector(5 downto 0);
    signal PIPERX7EQLPTXPRESET_out : std_logic_vector(3 downto 0);
    signal PIPERX7EQPRESET_out : std_logic_vector(2 downto 0);
    signal PIPERX7POLARITY_out : std_ulogic;
    signal PIPETX0CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX0COMPLIANCE_out : std_ulogic;
    signal PIPETX0DATAVALID_out : std_ulogic;
    signal PIPETX0DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX0DEEMPH_out : std_ulogic;
    signal PIPETX0ELECIDLE_out : std_ulogic;
    signal PIPETX0EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX0EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX0EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX0MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX0POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX0RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX0RCVRDET_out : std_ulogic;
    signal PIPETX0RESET_out : std_ulogic;
    signal PIPETX0STARTBLOCK_out : std_ulogic;
    signal PIPETX0SWING_out : std_ulogic;
    signal PIPETX0SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX1CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX1COMPLIANCE_out : std_ulogic;
    signal PIPETX1DATAVALID_out : std_ulogic;
    signal PIPETX1DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX1DEEMPH_out : std_ulogic;
    signal PIPETX1ELECIDLE_out : std_ulogic;
    signal PIPETX1EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX1EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX1EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX1MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX1POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX1RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX1RCVRDET_out : std_ulogic;
    signal PIPETX1RESET_out : std_ulogic;
    signal PIPETX1STARTBLOCK_out : std_ulogic;
    signal PIPETX1SWING_out : std_ulogic;
    signal PIPETX1SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX2CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX2COMPLIANCE_out : std_ulogic;
    signal PIPETX2DATAVALID_out : std_ulogic;
    signal PIPETX2DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX2DEEMPH_out : std_ulogic;
    signal PIPETX2ELECIDLE_out : std_ulogic;
    signal PIPETX2EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX2EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX2EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX2MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX2POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX2RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX2RCVRDET_out : std_ulogic;
    signal PIPETX2RESET_out : std_ulogic;
    signal PIPETX2STARTBLOCK_out : std_ulogic;
    signal PIPETX2SWING_out : std_ulogic;
    signal PIPETX2SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX3CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX3COMPLIANCE_out : std_ulogic;
    signal PIPETX3DATAVALID_out : std_ulogic;
    signal PIPETX3DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX3DEEMPH_out : std_ulogic;
    signal PIPETX3ELECIDLE_out : std_ulogic;
    signal PIPETX3EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX3EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX3EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX3MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX3POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX3RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX3RCVRDET_out : std_ulogic;
    signal PIPETX3RESET_out : std_ulogic;
    signal PIPETX3STARTBLOCK_out : std_ulogic;
    signal PIPETX3SWING_out : std_ulogic;
    signal PIPETX3SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX4CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX4COMPLIANCE_out : std_ulogic;
    signal PIPETX4DATAVALID_out : std_ulogic;
    signal PIPETX4DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX4DEEMPH_out : std_ulogic;
    signal PIPETX4ELECIDLE_out : std_ulogic;
    signal PIPETX4EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX4EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX4EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX4MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX4POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX4RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX4RCVRDET_out : std_ulogic;
    signal PIPETX4RESET_out : std_ulogic;
    signal PIPETX4STARTBLOCK_out : std_ulogic;
    signal PIPETX4SWING_out : std_ulogic;
    signal PIPETX4SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX5CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX5COMPLIANCE_out : std_ulogic;
    signal PIPETX5DATAVALID_out : std_ulogic;
    signal PIPETX5DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX5DEEMPH_out : std_ulogic;
    signal PIPETX5ELECIDLE_out : std_ulogic;
    signal PIPETX5EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX5EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX5EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX5MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX5POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX5RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX5RCVRDET_out : std_ulogic;
    signal PIPETX5RESET_out : std_ulogic;
    signal PIPETX5STARTBLOCK_out : std_ulogic;
    signal PIPETX5SWING_out : std_ulogic;
    signal PIPETX5SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX6CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX6COMPLIANCE_out : std_ulogic;
    signal PIPETX6DATAVALID_out : std_ulogic;
    signal PIPETX6DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX6DEEMPH_out : std_ulogic;
    signal PIPETX6ELECIDLE_out : std_ulogic;
    signal PIPETX6EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX6EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX6EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX6MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX6POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX6RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX6RCVRDET_out : std_ulogic;
    signal PIPETX6RESET_out : std_ulogic;
    signal PIPETX6STARTBLOCK_out : std_ulogic;
    signal PIPETX6SWING_out : std_ulogic;
    signal PIPETX6SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PIPETX7CHARISK_out : std_logic_vector(1 downto 0);
    signal PIPETX7COMPLIANCE_out : std_ulogic;
    signal PIPETX7DATAVALID_out : std_ulogic;
    signal PIPETX7DATA_out : std_logic_vector(31 downto 0);
    signal PIPETX7DEEMPH_out : std_ulogic;
    signal PIPETX7ELECIDLE_out : std_ulogic;
    signal PIPETX7EQCONTROL_out : std_logic_vector(1 downto 0);
    signal PIPETX7EQDEEMPH_out : std_logic_vector(5 downto 0);
    signal PIPETX7EQPRESET_out : std_logic_vector(3 downto 0);
    signal PIPETX7MARGIN_out : std_logic_vector(2 downto 0);
    signal PIPETX7POWERDOWN_out : std_logic_vector(1 downto 0);
    signal PIPETX7RATE_out : std_logic_vector(1 downto 0);
    signal PIPETX7RCVRDET_out : std_ulogic;
    signal PIPETX7RESET_out : std_ulogic;
    signal PIPETX7STARTBLOCK_out : std_ulogic;
    signal PIPETX7SWING_out : std_ulogic;
    signal PIPETX7SYNCHEADER_out : std_logic_vector(1 downto 0);
    signal PLEQINPROGRESS_out : std_ulogic;
    signal PLEQPHASE_out : std_logic_vector(1 downto 0);
    signal PMVOUT_out : std_ulogic;
    signal SAXISCCTREADY_out : std_logic_vector(3 downto 0);
    signal SAXISRQTREADY_out : std_logic_vector(3 downto 0);
    signal SCANOUT_out : std_logic_vector(95 downto 0);
    signal SPAREOUT_out : std_logic_vector(31 downto 0);
    signal XILUNCONNBOUT_out : std_logic_vector(479 downto 0);
    signal XILUNCONNOUT_out : std_logic_vector(860 downto 0);
    
    signal CFGCURRENTSPEED_delay : std_logic_vector(2 downto 0);
    signal CFGDPASUBSTATECHANGE_delay : std_logic_vector(3 downto 0);
    signal CFGERRCOROUT_delay : std_ulogic;
    signal CFGERRFATALOUT_delay : std_ulogic;
    signal CFGERRNONFATALOUT_delay : std_ulogic;
    signal CFGEXTFUNCTIONNUMBER_delay : std_logic_vector(7 downto 0);
    signal CFGEXTREADRECEIVED_delay : std_ulogic;
    signal CFGEXTREGISTERNUMBER_delay : std_logic_vector(9 downto 0);
    signal CFGEXTWRITEBYTEENABLE_delay : std_logic_vector(3 downto 0);
    signal CFGEXTWRITEDATA_delay : std_logic_vector(31 downto 0);
    signal CFGEXTWRITERECEIVED_delay : std_ulogic;
    signal CFGFCCPLD_delay : std_logic_vector(11 downto 0);
    signal CFGFCCPLH_delay : std_logic_vector(7 downto 0);
    signal CFGFCNPD_delay : std_logic_vector(11 downto 0);
    signal CFGFCNPH_delay : std_logic_vector(7 downto 0);
    signal CFGFCPD_delay : std_logic_vector(11 downto 0);
    signal CFGFCPH_delay : std_logic_vector(7 downto 0);
    signal CFGFLRINPROCESS_delay : std_logic_vector(3 downto 0);
    signal CFGFUNCTIONPOWERSTATE_delay : std_logic_vector(11 downto 0);
    signal CFGFUNCTIONSTATUS_delay : std_logic_vector(15 downto 0);
    signal CFGHOTRESETOUT_delay : std_ulogic;
    signal CFGINTERRUPTMSIDATA_delay : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSIENABLE_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIFAIL_delay : std_ulogic;
    signal CFGINTERRUPTMSIMASKUPDATE_delay : std_ulogic;
    signal CFGINTERRUPTMSIMMENABLE_delay : std_logic_vector(11 downto 0);
    signal CFGINTERRUPTMSISENT_delay : std_ulogic;
    signal CFGINTERRUPTMSIVFENABLE_delay : std_logic_vector(7 downto 0);
    signal CFGINTERRUPTMSIXENABLE_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIXFAIL_delay : std_ulogic;
    signal CFGINTERRUPTMSIXMASK_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIXSENT_delay : std_ulogic;
    signal CFGINTERRUPTMSIXVFENABLE_delay : std_logic_vector(7 downto 0);
    signal CFGINTERRUPTMSIXVFMASK_delay : std_logic_vector(7 downto 0);
    signal CFGINTERRUPTSENT_delay : std_ulogic;
    signal CFGLINKPOWERSTATE_delay : std_logic_vector(1 downto 0);
    signal CFGLOCALERROR_delay : std_ulogic;
    signal CFGLTRENABLE_delay : std_ulogic;
    signal CFGLTSSMSTATE_delay : std_logic_vector(5 downto 0);
    signal CFGMAXPAYLOAD_delay : std_logic_vector(2 downto 0);
    signal CFGMAXREADREQ_delay : std_logic_vector(2 downto 0);
    signal CFGMGMTREADDATA_delay : std_logic_vector(31 downto 0);
    signal CFGMGMTREADWRITEDONE_delay : std_ulogic;
    signal CFGMSGRECEIVEDDATA_delay : std_logic_vector(7 downto 0);
    signal CFGMSGRECEIVEDTYPE_delay : std_logic_vector(4 downto 0);
    signal CFGMSGRECEIVED_delay : std_ulogic;
    signal CFGMSGTRANSMITDONE_delay : std_ulogic;
    signal CFGNEGOTIATEDWIDTH_delay : std_logic_vector(3 downto 0);
    signal CFGOBFFENABLE_delay : std_logic_vector(1 downto 0);
    signal CFGPERFUNCSTATUSDATA_delay : std_logic_vector(15 downto 0);
    signal CFGPERFUNCTIONUPDATEDONE_delay : std_ulogic;
    signal CFGPHYLINKDOWN_delay : std_ulogic;
    signal CFGPHYLINKSTATUS_delay : std_logic_vector(1 downto 0);
    signal CFGPLSTATUSCHANGE_delay : std_ulogic;
    signal CFGPOWERSTATECHANGEINTERRUPT_delay : std_ulogic;
    signal CFGRCBSTATUS_delay : std_logic_vector(3 downto 0);
    signal CFGTPHFUNCTIONNUM_delay : std_logic_vector(3 downto 0);
    signal CFGTPHREQUESTERENABLE_delay : std_logic_vector(3 downto 0);
    signal CFGTPHSTMODE_delay : std_logic_vector(11 downto 0);
    signal CFGTPHSTTADDRESS_delay : std_logic_vector(4 downto 0);
    signal CFGTPHSTTREADENABLE_delay : std_ulogic;
    signal CFGTPHSTTWRITEBYTEVALID_delay : std_logic_vector(3 downto 0);
    signal CFGTPHSTTWRITEDATA_delay : std_logic_vector(31 downto 0);
    signal CFGTPHSTTWRITEENABLE_delay : std_ulogic;
    signal CFGVFFLRINPROCESS_delay : std_logic_vector(7 downto 0);
    signal CFGVFPOWERSTATE_delay : std_logic_vector(23 downto 0);
    signal CFGVFSTATUS_delay : std_logic_vector(15 downto 0);
    signal CFGVFTPHREQUESTERENABLE_delay : std_logic_vector(7 downto 0);
    signal CFGVFTPHSTMODE_delay : std_logic_vector(23 downto 0);
    signal CONFMCAPDESIGNSWITCH_delay : std_ulogic;
    signal CONFMCAPEOS_delay : std_ulogic;
    signal CONFMCAPINUSEBYPCIE_delay : std_ulogic;
    signal CONFREQREADY_delay : std_ulogic;
    signal CONFRESPRDATA_delay : std_logic_vector(31 downto 0);
    signal CONFRESPVALID_delay : std_ulogic;
    signal DBGDATAOUT_delay : std_logic_vector(15 downto 0);
    signal DBGMCAPCSB_delay : std_ulogic;
    signal DBGMCAPDATA_delay : std_logic_vector(31 downto 0);
    signal DBGMCAPEOS_delay : std_ulogic;
    signal DBGMCAPERROR_delay : std_ulogic;
    signal DBGMCAPMODE_delay : std_ulogic;
    signal DBGMCAPRDATAVALID_delay : std_ulogic;
    signal DBGMCAPRDWRB_delay : std_ulogic;
    signal DBGMCAPRESET_delay : std_ulogic;
    signal DBGPLDATABLOCKRECEIVEDAFTEREDS_delay : std_ulogic;
    signal DBGPLGEN3FRAMINGERRORDETECTED_delay : std_ulogic;
    signal DBGPLGEN3SYNCHEADERERRORDETECTED_delay : std_ulogic;
    signal DBGPLINFERREDRXELECTRICALIDLE_delay : std_logic_vector(7 downto 0);
    signal DRPDO_delay : std_logic_vector(15 downto 0);
    signal DRPRDY_delay : std_ulogic;
    signal LL2LMMASTERTLPSENT0_delay : std_ulogic;
    signal LL2LMMASTERTLPSENT1_delay : std_ulogic;
    signal LL2LMMASTERTLPSENTTLPID0_delay : std_logic_vector(3 downto 0);
    signal LL2LMMASTERTLPSENTTLPID1_delay : std_logic_vector(3 downto 0);
    signal LL2LMMAXISRXTDATA_delay : std_logic_vector(255 downto 0);
    signal LL2LMMAXISRXTUSER_delay : std_logic_vector(17 downto 0);
    signal LL2LMMAXISRXTVALID_delay : std_logic_vector(7 downto 0);
    signal LL2LMSAXISTXTREADY_delay : std_logic_vector(7 downto 0);
    signal MAXISCQTDATA_delay : std_logic_vector(255 downto 0);
    signal MAXISCQTKEEP_delay : std_logic_vector(7 downto 0);
    signal MAXISCQTLAST_delay : std_ulogic;
    signal MAXISCQTUSER_delay : std_logic_vector(84 downto 0);
    signal MAXISCQTVALID_delay : std_ulogic;
    signal MAXISRCTDATA_delay : std_logic_vector(255 downto 0);
    signal MAXISRCTKEEP_delay : std_logic_vector(7 downto 0);
    signal MAXISRCTLAST_delay : std_ulogic;
    signal MAXISRCTUSER_delay : std_logic_vector(74 downto 0);
    signal MAXISRCTVALID_delay : std_ulogic;
    signal MICOMPLETIONRAMREADADDRESSAL_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADADDRESSAU_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADADDRESSBL_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADADDRESSBU_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMREADENABLEL_delay : std_logic_vector(3 downto 0);
    signal MICOMPLETIONRAMREADENABLEU_delay : std_logic_vector(3 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSAL_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSAU_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSBL_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEADDRESSBU_delay : std_logic_vector(9 downto 0);
    signal MICOMPLETIONRAMWRITEDATAL_delay : std_logic_vector(71 downto 0);
    signal MICOMPLETIONRAMWRITEDATAU_delay : std_logic_vector(71 downto 0);
    signal MICOMPLETIONRAMWRITEENABLEL_delay : std_logic_vector(3 downto 0);
    signal MICOMPLETIONRAMWRITEENABLEU_delay : std_logic_vector(3 downto 0);
    signal MIREPLAYRAMADDRESS_delay : std_logic_vector(8 downto 0);
    signal MIREPLAYRAMREADENABLE_delay : std_logic_vector(1 downto 0);
    signal MIREPLAYRAMWRITEDATA_delay : std_logic_vector(143 downto 0);
    signal MIREPLAYRAMWRITEENABLE_delay : std_logic_vector(1 downto 0);
    signal MIREQUESTRAMREADADDRESSA_delay : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMREADADDRESSB_delay : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMREADENABLE_delay : std_logic_vector(3 downto 0);
    signal MIREQUESTRAMWRITEADDRESSA_delay : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMWRITEADDRESSB_delay : std_logic_vector(8 downto 0);
    signal MIREQUESTRAMWRITEDATA_delay : std_logic_vector(143 downto 0);
    signal MIREQUESTRAMWRITEENABLE_delay : std_logic_vector(3 downto 0);
    signal PCIECQNPREQCOUNT_delay : std_logic_vector(5 downto 0);
    signal PCIEPERST0B_delay : std_ulogic;
    signal PCIEPERST1B_delay : std_ulogic;
    signal PCIERQSEQNUMVLD_delay : std_ulogic;
    signal PCIERQSEQNUM_delay : std_logic_vector(3 downto 0);
    signal PCIERQTAGAV_delay : std_logic_vector(1 downto 0);
    signal PCIERQTAGVLD_delay : std_ulogic;
    signal PCIERQTAG_delay : std_logic_vector(5 downto 0);
    signal PCIETFCNPDAV_delay : std_logic_vector(1 downto 0);
    signal PCIETFCNPHAV_delay : std_logic_vector(1 downto 0);
    signal PIPERX0EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX0EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX0EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX0EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX0POLARITY_delay : std_ulogic;
    signal PIPERX1EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX1EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX1EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX1EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX1POLARITY_delay : std_ulogic;
    signal PIPERX2EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX2EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX2EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX2EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX2POLARITY_delay : std_ulogic;
    signal PIPERX3EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX3EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX3EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX3EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX3POLARITY_delay : std_ulogic;
    signal PIPERX4EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX4EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX4EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX4EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX4POLARITY_delay : std_ulogic;
    signal PIPERX5EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX5EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX5EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX5EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX5POLARITY_delay : std_ulogic;
    signal PIPERX6EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX6EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX6EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX6EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX6POLARITY_delay : std_ulogic;
    signal PIPERX7EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPERX7EQLPLFFS_delay : std_logic_vector(5 downto 0);
    signal PIPERX7EQLPTXPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPERX7EQPRESET_delay : std_logic_vector(2 downto 0);
    signal PIPERX7POLARITY_delay : std_ulogic;
    signal PIPETX0CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX0COMPLIANCE_delay : std_ulogic;
    signal PIPETX0DATAVALID_delay : std_ulogic;
    signal PIPETX0DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX0DEEMPH_delay : std_ulogic;
    signal PIPETX0ELECIDLE_delay : std_ulogic;
    signal PIPETX0EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX0EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX0EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX0MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX0POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX0RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX0RCVRDET_delay : std_ulogic;
    signal PIPETX0RESET_delay : std_ulogic;
    signal PIPETX0STARTBLOCK_delay : std_ulogic;
    signal PIPETX0SWING_delay : std_ulogic;
    signal PIPETX0SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX1CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX1COMPLIANCE_delay : std_ulogic;
    signal PIPETX1DATAVALID_delay : std_ulogic;
    signal PIPETX1DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX1DEEMPH_delay : std_ulogic;
    signal PIPETX1ELECIDLE_delay : std_ulogic;
    signal PIPETX1EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX1EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX1EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX1MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX1POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX1RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX1RCVRDET_delay : std_ulogic;
    signal PIPETX1RESET_delay : std_ulogic;
    signal PIPETX1STARTBLOCK_delay : std_ulogic;
    signal PIPETX1SWING_delay : std_ulogic;
    signal PIPETX1SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX2CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX2COMPLIANCE_delay : std_ulogic;
    signal PIPETX2DATAVALID_delay : std_ulogic;
    signal PIPETX2DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX2DEEMPH_delay : std_ulogic;
    signal PIPETX2ELECIDLE_delay : std_ulogic;
    signal PIPETX2EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX2EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX2EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX2MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX2POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX2RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX2RCVRDET_delay : std_ulogic;
    signal PIPETX2RESET_delay : std_ulogic;
    signal PIPETX2STARTBLOCK_delay : std_ulogic;
    signal PIPETX2SWING_delay : std_ulogic;
    signal PIPETX2SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX3CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX3COMPLIANCE_delay : std_ulogic;
    signal PIPETX3DATAVALID_delay : std_ulogic;
    signal PIPETX3DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX3DEEMPH_delay : std_ulogic;
    signal PIPETX3ELECIDLE_delay : std_ulogic;
    signal PIPETX3EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX3EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX3EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX3MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX3POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX3RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX3RCVRDET_delay : std_ulogic;
    signal PIPETX3RESET_delay : std_ulogic;
    signal PIPETX3STARTBLOCK_delay : std_ulogic;
    signal PIPETX3SWING_delay : std_ulogic;
    signal PIPETX3SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX4CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX4COMPLIANCE_delay : std_ulogic;
    signal PIPETX4DATAVALID_delay : std_ulogic;
    signal PIPETX4DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX4DEEMPH_delay : std_ulogic;
    signal PIPETX4ELECIDLE_delay : std_ulogic;
    signal PIPETX4EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX4EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX4EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX4MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX4POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX4RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX4RCVRDET_delay : std_ulogic;
    signal PIPETX4RESET_delay : std_ulogic;
    signal PIPETX4STARTBLOCK_delay : std_ulogic;
    signal PIPETX4SWING_delay : std_ulogic;
    signal PIPETX4SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX5CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX5COMPLIANCE_delay : std_ulogic;
    signal PIPETX5DATAVALID_delay : std_ulogic;
    signal PIPETX5DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX5DEEMPH_delay : std_ulogic;
    signal PIPETX5ELECIDLE_delay : std_ulogic;
    signal PIPETX5EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX5EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX5EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX5MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX5POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX5RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX5RCVRDET_delay : std_ulogic;
    signal PIPETX5RESET_delay : std_ulogic;
    signal PIPETX5STARTBLOCK_delay : std_ulogic;
    signal PIPETX5SWING_delay : std_ulogic;
    signal PIPETX5SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX6CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX6COMPLIANCE_delay : std_ulogic;
    signal PIPETX6DATAVALID_delay : std_ulogic;
    signal PIPETX6DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX6DEEMPH_delay : std_ulogic;
    signal PIPETX6ELECIDLE_delay : std_ulogic;
    signal PIPETX6EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX6EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX6EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX6MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX6POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX6RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX6RCVRDET_delay : std_ulogic;
    signal PIPETX6RESET_delay : std_ulogic;
    signal PIPETX6STARTBLOCK_delay : std_ulogic;
    signal PIPETX6SWING_delay : std_ulogic;
    signal PIPETX6SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPETX7CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPETX7COMPLIANCE_delay : std_ulogic;
    signal PIPETX7DATAVALID_delay : std_ulogic;
    signal PIPETX7DATA_delay : std_logic_vector(31 downto 0);
    signal PIPETX7DEEMPH_delay : std_ulogic;
    signal PIPETX7ELECIDLE_delay : std_ulogic;
    signal PIPETX7EQCONTROL_delay : std_logic_vector(1 downto 0);
    signal PIPETX7EQDEEMPH_delay : std_logic_vector(5 downto 0);
    signal PIPETX7EQPRESET_delay : std_logic_vector(3 downto 0);
    signal PIPETX7MARGIN_delay : std_logic_vector(2 downto 0);
    signal PIPETX7POWERDOWN_delay : std_logic_vector(1 downto 0);
    signal PIPETX7RATE_delay : std_logic_vector(1 downto 0);
    signal PIPETX7RCVRDET_delay : std_ulogic;
    signal PIPETX7RESET_delay : std_ulogic;
    signal PIPETX7STARTBLOCK_delay : std_ulogic;
    signal PIPETX7SWING_delay : std_ulogic;
    signal PIPETX7SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PLEQINPROGRESS_delay : std_ulogic;
    signal PLEQPHASE_delay : std_logic_vector(1 downto 0);
    signal SAXISCCTREADY_delay : std_logic_vector(3 downto 0);
    signal SAXISRQTREADY_delay : std_logic_vector(3 downto 0);
    signal SPAREOUT_delay : std_logic_vector(31 downto 0);
    
    signal CFGCONFIGSPACEENABLE_delay : std_ulogic;
    signal CFGDEVID_delay : std_logic_vector(15 downto 0);
    signal CFGDSBUSNUMBER_delay : std_logic_vector(7 downto 0);
    signal CFGDSDEVICENUMBER_delay : std_logic_vector(4 downto 0);
    signal CFGDSFUNCTIONNUMBER_delay : std_logic_vector(2 downto 0);
    signal CFGDSN_delay : std_logic_vector(63 downto 0);
    signal CFGDSPORTNUMBER_delay : std_logic_vector(7 downto 0);
    signal CFGERRCORIN_delay : std_ulogic;
    signal CFGERRUNCORIN_delay : std_ulogic;
    signal CFGEXTREADDATAVALID_delay : std_ulogic;
    signal CFGEXTREADDATA_delay : std_logic_vector(31 downto 0);
    signal CFGFCSEL_delay : std_logic_vector(2 downto 0);
    signal CFGFLRDONE_delay : std_logic_vector(3 downto 0);
    signal CFGHOTRESETIN_delay : std_ulogic;
    signal CFGINTERRUPTINT_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIATTR_delay : std_logic_vector(2 downto 0);
    signal CFGINTERRUPTMSIFUNCTIONNUMBER_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIINT_delay : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE_delay : std_ulogic;
    signal CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIPENDINGSTATUS_delay : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSISELECT_delay : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSITPHPRESENT_delay : std_ulogic;
    signal CFGINTERRUPTMSITPHSTTAG_delay : std_logic_vector(8 downto 0);
    signal CFGINTERRUPTMSITPHTYPE_delay : std_logic_vector(1 downto 0);
    signal CFGINTERRUPTMSIXADDRESS_delay : std_logic_vector(63 downto 0);
    signal CFGINTERRUPTMSIXDATA_delay : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSIXINT_delay : std_ulogic;
    signal CFGINTERRUPTPENDING_delay : std_logic_vector(3 downto 0);
    signal CFGLINKTRAININGENABLE_delay : std_ulogic;
    signal CFGMGMTADDR_delay : std_logic_vector(18 downto 0);
    signal CFGMGMTBYTEENABLE_delay : std_logic_vector(3 downto 0);
    signal CFGMGMTREAD_delay : std_ulogic;
    signal CFGMGMTTYPE1CFGREGACCESS_delay : std_ulogic;
    signal CFGMGMTWRITEDATA_delay : std_logic_vector(31 downto 0);
    signal CFGMGMTWRITE_delay : std_ulogic;
    signal CFGMSGTRANSMITDATA_delay : std_logic_vector(31 downto 0);
    signal CFGMSGTRANSMITTYPE_delay : std_logic_vector(2 downto 0);
    signal CFGMSGTRANSMIT_delay : std_ulogic;
    signal CFGPERFUNCSTATUSCONTROL_delay : std_logic_vector(2 downto 0);
    signal CFGPERFUNCTIONNUMBER_delay : std_logic_vector(3 downto 0);
    signal CFGPERFUNCTIONOUTPUTREQUEST_delay : std_ulogic;
    signal CFGPOWERSTATECHANGEACK_delay : std_ulogic;
    signal CFGREQPMTRANSITIONL23READY_delay : std_ulogic;
    signal CFGREVID_delay : std_logic_vector(7 downto 0);
    signal CFGSUBSYSID_delay : std_logic_vector(15 downto 0);
    signal CFGSUBSYSVENDID_delay : std_logic_vector(15 downto 0);
    signal CFGTPHSTTREADDATAVALID_delay : std_ulogic;
    signal CFGTPHSTTREADDATA_delay : std_logic_vector(31 downto 0);
    signal CFGVENDID_delay : std_logic_vector(15 downto 0);
    signal CFGVFFLRDONE_delay : std_logic_vector(7 downto 0);
    signal CONFMCAPREQUESTBYCONF_delay : std_ulogic;
    signal CONFREQDATA_delay : std_logic_vector(31 downto 0);
    signal CONFREQREGNUM_delay : std_logic_vector(3 downto 0);
    signal CONFREQTYPE_delay : std_logic_vector(1 downto 0);
    signal CONFREQVALID_delay : std_ulogic;
    signal CORECLKMICOMPLETIONRAML_delay : std_ulogic;
    signal CORECLKMICOMPLETIONRAMU_delay : std_ulogic;
    signal CORECLKMIREPLAYRAM_delay : std_ulogic;
    signal CORECLKMIREQUESTRAM_delay : std_ulogic;
    signal CORECLK_delay : std_ulogic;
    signal DBGCFGLOCALMGMTREGOVERRIDE_delay : std_ulogic;
    signal DBGDATASEL_delay : std_logic_vector(3 downto 0);
    signal DRPADDR_delay : std_logic_vector(9 downto 0);
    signal DRPCLK_delay : std_ulogic;
    signal DRPDI_delay : std_logic_vector(15 downto 0);
    signal DRPEN_delay : std_ulogic;
    signal DRPWE_delay : std_ulogic;
    signal LL2LMSAXISTXTUSER_delay : std_logic_vector(13 downto 0);
    signal LL2LMSAXISTXTVALID_delay : std_ulogic;
    signal LL2LMTXTLPID0_delay : std_logic_vector(3 downto 0);
    signal LL2LMTXTLPID1_delay : std_logic_vector(3 downto 0);
    signal MAXISCQTREADY_delay : std_logic_vector(21 downto 0);
    signal MAXISRCTREADY_delay : std_logic_vector(21 downto 0);
    signal MCAPCLK_delay : std_ulogic;
    signal MCAPPERST0B_delay : std_ulogic;
    signal MCAPPERST1B_delay : std_ulogic;
    signal MGMTRESETN_delay : std_ulogic;
    signal MGMTSTICKYRESETN_delay : std_ulogic;
    signal MICOMPLETIONRAMREADDATA_delay : std_logic_vector(143 downto 0);
    signal MIREPLAYRAMREADDATA_delay : std_logic_vector(143 downto 0);
    signal MIREQUESTRAMREADDATA_delay : std_logic_vector(143 downto 0);
    signal PCIECQNPREQ_delay : std_ulogic;
    signal PIPECLK_delay : std_ulogic;
    signal PIPEEQFS_delay : std_logic_vector(5 downto 0);
    signal PIPEEQLF_delay : std_logic_vector(5 downto 0);
    signal PIPERESETN_delay : std_ulogic;
    signal PIPERX0CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX0DATAVALID_delay : std_ulogic;
    signal PIPERX0DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX0ELECIDLE_delay : std_ulogic;
    signal PIPERX0EQDONE_delay : std_ulogic;
    signal PIPERX0EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX0EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX0EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX0PHYSTATUS_delay : std_ulogic;
    signal PIPERX0STARTBLOCK_delay : std_ulogic;
    signal PIPERX0STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX0SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX0VALID_delay : std_ulogic;
    signal PIPERX1CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX1DATAVALID_delay : std_ulogic;
    signal PIPERX1DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX1ELECIDLE_delay : std_ulogic;
    signal PIPERX1EQDONE_delay : std_ulogic;
    signal PIPERX1EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX1EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX1EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX1PHYSTATUS_delay : std_ulogic;
    signal PIPERX1STARTBLOCK_delay : std_ulogic;
    signal PIPERX1STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX1SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX1VALID_delay : std_ulogic;
    signal PIPERX2CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX2DATAVALID_delay : std_ulogic;
    signal PIPERX2DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX2ELECIDLE_delay : std_ulogic;
    signal PIPERX2EQDONE_delay : std_ulogic;
    signal PIPERX2EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX2EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX2EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX2PHYSTATUS_delay : std_ulogic;
    signal PIPERX2STARTBLOCK_delay : std_ulogic;
    signal PIPERX2STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX2SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX2VALID_delay : std_ulogic;
    signal PIPERX3CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX3DATAVALID_delay : std_ulogic;
    signal PIPERX3DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX3ELECIDLE_delay : std_ulogic;
    signal PIPERX3EQDONE_delay : std_ulogic;
    signal PIPERX3EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX3EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX3EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX3PHYSTATUS_delay : std_ulogic;
    signal PIPERX3STARTBLOCK_delay : std_ulogic;
    signal PIPERX3STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX3SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX3VALID_delay : std_ulogic;
    signal PIPERX4CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX4DATAVALID_delay : std_ulogic;
    signal PIPERX4DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX4ELECIDLE_delay : std_ulogic;
    signal PIPERX4EQDONE_delay : std_ulogic;
    signal PIPERX4EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX4EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX4EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX4PHYSTATUS_delay : std_ulogic;
    signal PIPERX4STARTBLOCK_delay : std_ulogic;
    signal PIPERX4STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX4SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX4VALID_delay : std_ulogic;
    signal PIPERX5CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX5DATAVALID_delay : std_ulogic;
    signal PIPERX5DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX5ELECIDLE_delay : std_ulogic;
    signal PIPERX5EQDONE_delay : std_ulogic;
    signal PIPERX5EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX5EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX5EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX5PHYSTATUS_delay : std_ulogic;
    signal PIPERX5STARTBLOCK_delay : std_ulogic;
    signal PIPERX5STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX5SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX5VALID_delay : std_ulogic;
    signal PIPERX6CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX6DATAVALID_delay : std_ulogic;
    signal PIPERX6DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX6ELECIDLE_delay : std_ulogic;
    signal PIPERX6EQDONE_delay : std_ulogic;
    signal PIPERX6EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX6EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX6EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX6PHYSTATUS_delay : std_ulogic;
    signal PIPERX6STARTBLOCK_delay : std_ulogic;
    signal PIPERX6STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX6SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX6VALID_delay : std_ulogic;
    signal PIPERX7CHARISK_delay : std_logic_vector(1 downto 0);
    signal PIPERX7DATAVALID_delay : std_ulogic;
    signal PIPERX7DATA_delay : std_logic_vector(31 downto 0);
    signal PIPERX7ELECIDLE_delay : std_ulogic;
    signal PIPERX7EQDONE_delay : std_ulogic;
    signal PIPERX7EQLPADAPTDONE_delay : std_ulogic;
    signal PIPERX7EQLPLFFSSEL_delay : std_ulogic;
    signal PIPERX7EQLPNEWTXCOEFFORPRESET_delay : std_logic_vector(17 downto 0);
    signal PIPERX7PHYSTATUS_delay : std_ulogic;
    signal PIPERX7STARTBLOCK_delay : std_ulogic;
    signal PIPERX7STATUS_delay : std_logic_vector(2 downto 0);
    signal PIPERX7SYNCHEADER_delay : std_logic_vector(1 downto 0);
    signal PIPERX7VALID_delay : std_ulogic;
    signal PIPETX0EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX0EQDONE_delay : std_ulogic;
    signal PIPETX1EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX1EQDONE_delay : std_ulogic;
    signal PIPETX2EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX2EQDONE_delay : std_ulogic;
    signal PIPETX3EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX3EQDONE_delay : std_ulogic;
    signal PIPETX4EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX4EQDONE_delay : std_ulogic;
    signal PIPETX5EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX5EQDONE_delay : std_ulogic;
    signal PIPETX6EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX6EQDONE_delay : std_ulogic;
    signal PIPETX7EQCOEFF_delay : std_logic_vector(17 downto 0);
    signal PIPETX7EQDONE_delay : std_ulogic;
    signal PLEQRESETEIEOSCOUNT_delay : std_ulogic;
    signal PLGEN2UPSTREAMPREFERDEEMPH_delay : std_ulogic;
    signal RESETN_delay : std_ulogic;
    signal SAXISCCTDATA_delay : std_logic_vector(255 downto 0);
    signal SAXISCCTKEEP_delay : std_logic_vector(7 downto 0);
    signal SAXISCCTLAST_delay : std_ulogic;
    signal SAXISCCTUSER_delay : std_logic_vector(32 downto 0);
    signal SAXISCCTVALID_delay : std_ulogic;
    signal SAXISRQTDATA_delay : std_logic_vector(255 downto 0);
    signal SAXISRQTKEEP_delay : std_logic_vector(7 downto 0);
    signal SAXISRQTLAST_delay : std_ulogic;
    signal SAXISRQTUSER_delay : std_logic_vector(59 downto 0);
    signal SAXISRQTVALID_delay : std_ulogic;
    signal SPAREIN_delay : std_logic_vector(31 downto 0);
    signal USERCLK_delay : std_ulogic;
    
    signal CFGCONFIGSPACEENABLE_in : std_ulogic;
    signal CFGDEVID_in : std_logic_vector(15 downto 0);
    signal CFGDSBUSNUMBER_in : std_logic_vector(7 downto 0);
    signal CFGDSDEVICENUMBER_in : std_logic_vector(4 downto 0);
    signal CFGDSFUNCTIONNUMBER_in : std_logic_vector(2 downto 0);
    signal CFGDSN_in : std_logic_vector(63 downto 0);
    signal CFGDSPORTNUMBER_in : std_logic_vector(7 downto 0);
    signal CFGERRCORIN_in : std_ulogic;
    signal CFGERRUNCORIN_in : std_ulogic;
    signal CFGEXTREADDATAVALID_in : std_ulogic;
    signal CFGEXTREADDATA_in : std_logic_vector(31 downto 0);
    signal CFGFCSEL_in : std_logic_vector(2 downto 0);
    signal CFGFLRDONE_in : std_logic_vector(3 downto 0);
    signal CFGHOTRESETIN_in : std_ulogic;
    signal CFGINTERRUPTINT_in : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIATTR_in : std_logic_vector(2 downto 0);
    signal CFGINTERRUPTMSIFUNCTIONNUMBER_in : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIINT_in : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE_in : std_ulogic;
    signal CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM_in : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSIPENDINGSTATUS_in : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSISELECT_in : std_logic_vector(3 downto 0);
    signal CFGINTERRUPTMSITPHPRESENT_in : std_ulogic;
    signal CFGINTERRUPTMSITPHSTTAG_in : std_logic_vector(8 downto 0);
    signal CFGINTERRUPTMSITPHTYPE_in : std_logic_vector(1 downto 0);
    signal CFGINTERRUPTMSIXADDRESS_in : std_logic_vector(63 downto 0);
    signal CFGINTERRUPTMSIXDATA_in : std_logic_vector(31 downto 0);
    signal CFGINTERRUPTMSIXINT_in : std_ulogic;
    signal CFGINTERRUPTPENDING_in : std_logic_vector(3 downto 0);
    signal CFGLINKTRAININGENABLE_in : std_ulogic;
    signal CFGMGMTADDR_in : std_logic_vector(18 downto 0);
    signal CFGMGMTBYTEENABLE_in : std_logic_vector(3 downto 0);
    signal CFGMGMTREAD_in : std_ulogic;
    signal CFGMGMTTYPE1CFGREGACCESS_in : std_ulogic;
    signal CFGMGMTWRITEDATA_in : std_logic_vector(31 downto 0);
    signal CFGMGMTWRITE_in : std_ulogic;
    signal CFGMSGTRANSMITDATA_in : std_logic_vector(31 downto 0);
    signal CFGMSGTRANSMITTYPE_in : std_logic_vector(2 downto 0);
    signal CFGMSGTRANSMIT_in : std_ulogic;
    signal CFGPERFUNCSTATUSCONTROL_in : std_logic_vector(2 downto 0);
    signal CFGPERFUNCTIONNUMBER_in : std_logic_vector(3 downto 0);
    signal CFGPERFUNCTIONOUTPUTREQUEST_in : std_ulogic;
    signal CFGPOWERSTATECHANGEACK_in : std_ulogic;
    signal CFGREQPMTRANSITIONL23READY_in : std_ulogic;
    signal CFGREVID_in : std_logic_vector(7 downto 0);
    signal CFGSUBSYSID_in : std_logic_vector(15 downto 0);
    signal CFGSUBSYSVENDID_in : std_logic_vector(15 downto 0);
    signal CFGTPHSTTREADDATAVALID_in : std_ulogic;
    signal CFGTPHSTTREADDATA_in : std_logic_vector(31 downto 0);
    signal CFGVENDID_in : std_logic_vector(15 downto 0);
    signal CFGVFFLRDONE_in : std_logic_vector(7 downto 0);
    signal CONFMCAPREQUESTBYCONF_in : std_ulogic;
    signal CONFREQDATA_in : std_logic_vector(31 downto 0);
    signal CONFREQREGNUM_in : std_logic_vector(3 downto 0);
    signal CONFREQTYPE_in : std_logic_vector(1 downto 0);
    signal CONFREQVALID_in : std_ulogic;
    signal CORECLKMICOMPLETIONRAML_in : std_ulogic;
    signal CORECLKMICOMPLETIONRAMU_in : std_ulogic;
    signal CORECLKMIREPLAYRAM_in : std_ulogic;
    signal CORECLKMIREQUESTRAM_in : std_ulogic;
    signal CORECLK_in : std_ulogic;
    signal DBGCFGLOCALMGMTREGOVERRIDE_in : std_ulogic;
    signal DBGDATASEL_in : std_logic_vector(3 downto 0);
    signal DRPADDR_in : std_logic_vector(9 downto 0);
    signal DRPCLK_in : std_ulogic;
    signal DRPDI_in : std_logic_vector(15 downto 0);
    signal DRPEN_in : std_ulogic;
    signal DRPWE_in : std_ulogic;
    signal LL2LMSAXISTXTUSER_in : std_logic_vector(13 downto 0);
    signal LL2LMSAXISTXTVALID_in : std_ulogic;
    signal LL2LMTXTLPID0_in : std_logic_vector(3 downto 0);
    signal LL2LMTXTLPID1_in : std_logic_vector(3 downto 0);
    signal MAXISCQTREADY_in : std_logic_vector(21 downto 0);
    signal MAXISRCTREADY_in : std_logic_vector(21 downto 0);
    signal MCAPCLK_in : std_ulogic;
    signal MCAPPERST0B_in : std_ulogic;
    signal MCAPPERST1B_in : std_ulogic;
    signal MGMTRESETN_in : std_ulogic;
    signal MGMTSTICKYRESETN_in : std_ulogic;
    signal MICOMPLETIONRAMREADDATA_in : std_logic_vector(143 downto 0);
    signal MIREPLAYRAMREADDATA_in : std_logic_vector(143 downto 0);
    signal MIREQUESTRAMREADDATA_in : std_logic_vector(143 downto 0);
    signal PCIECQNPREQ_in : std_ulogic;
    signal PIPECLK_in : std_ulogic;
    signal PIPEEQFS_in : std_logic_vector(5 downto 0);
    signal PIPEEQLF_in : std_logic_vector(5 downto 0);
    signal PIPERESETN_in : std_ulogic;
    signal PIPERX0CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX0DATAVALID_in : std_ulogic;
    signal PIPERX0DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX0ELECIDLE_in : std_ulogic;
    signal PIPERX0EQDONE_in : std_ulogic;
    signal PIPERX0EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX0EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX0EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX0PHYSTATUS_in : std_ulogic;
    signal PIPERX0STARTBLOCK_in : std_ulogic;
    signal PIPERX0STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX0SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX0VALID_in : std_ulogic;
    signal PIPERX1CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX1DATAVALID_in : std_ulogic;
    signal PIPERX1DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX1ELECIDLE_in : std_ulogic;
    signal PIPERX1EQDONE_in : std_ulogic;
    signal PIPERX1EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX1EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX1EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX1PHYSTATUS_in : std_ulogic;
    signal PIPERX1STARTBLOCK_in : std_ulogic;
    signal PIPERX1STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX1SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX1VALID_in : std_ulogic;
    signal PIPERX2CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX2DATAVALID_in : std_ulogic;
    signal PIPERX2DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX2ELECIDLE_in : std_ulogic;
    signal PIPERX2EQDONE_in : std_ulogic;
    signal PIPERX2EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX2EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX2EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX2PHYSTATUS_in : std_ulogic;
    signal PIPERX2STARTBLOCK_in : std_ulogic;
    signal PIPERX2STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX2SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX2VALID_in : std_ulogic;
    signal PIPERX3CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX3DATAVALID_in : std_ulogic;
    signal PIPERX3DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX3ELECIDLE_in : std_ulogic;
    signal PIPERX3EQDONE_in : std_ulogic;
    signal PIPERX3EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX3EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX3EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX3PHYSTATUS_in : std_ulogic;
    signal PIPERX3STARTBLOCK_in : std_ulogic;
    signal PIPERX3STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX3SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX3VALID_in : std_ulogic;
    signal PIPERX4CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX4DATAVALID_in : std_ulogic;
    signal PIPERX4DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX4ELECIDLE_in : std_ulogic;
    signal PIPERX4EQDONE_in : std_ulogic;
    signal PIPERX4EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX4EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX4EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX4PHYSTATUS_in : std_ulogic;
    signal PIPERX4STARTBLOCK_in : std_ulogic;
    signal PIPERX4STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX4SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX4VALID_in : std_ulogic;
    signal PIPERX5CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX5DATAVALID_in : std_ulogic;
    signal PIPERX5DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX5ELECIDLE_in : std_ulogic;
    signal PIPERX5EQDONE_in : std_ulogic;
    signal PIPERX5EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX5EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX5EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX5PHYSTATUS_in : std_ulogic;
    signal PIPERX5STARTBLOCK_in : std_ulogic;
    signal PIPERX5STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX5SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX5VALID_in : std_ulogic;
    signal PIPERX6CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX6DATAVALID_in : std_ulogic;
    signal PIPERX6DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX6ELECIDLE_in : std_ulogic;
    signal PIPERX6EQDONE_in : std_ulogic;
    signal PIPERX6EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX6EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX6EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX6PHYSTATUS_in : std_ulogic;
    signal PIPERX6STARTBLOCK_in : std_ulogic;
    signal PIPERX6STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX6SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX6VALID_in : std_ulogic;
    signal PIPERX7CHARISK_in : std_logic_vector(1 downto 0);
    signal PIPERX7DATAVALID_in : std_ulogic;
    signal PIPERX7DATA_in : std_logic_vector(31 downto 0);
    signal PIPERX7ELECIDLE_in : std_ulogic;
    signal PIPERX7EQDONE_in : std_ulogic;
    signal PIPERX7EQLPADAPTDONE_in : std_ulogic;
    signal PIPERX7EQLPLFFSSEL_in : std_ulogic;
    signal PIPERX7EQLPNEWTXCOEFFORPRESET_in : std_logic_vector(17 downto 0);
    signal PIPERX7PHYSTATUS_in : std_ulogic;
    signal PIPERX7STARTBLOCK_in : std_ulogic;
    signal PIPERX7STATUS_in : std_logic_vector(2 downto 0);
    signal PIPERX7SYNCHEADER_in : std_logic_vector(1 downto 0);
    signal PIPERX7VALID_in : std_ulogic;
    signal PIPETX0EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX0EQDONE_in : std_ulogic;
    signal PIPETX1EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX1EQDONE_in : std_ulogic;
    signal PIPETX2EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX2EQDONE_in : std_ulogic;
    signal PIPETX3EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX3EQDONE_in : std_ulogic;
    signal PIPETX4EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX4EQDONE_in : std_ulogic;
    signal PIPETX5EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX5EQDONE_in : std_ulogic;
    signal PIPETX6EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX6EQDONE_in : std_ulogic;
    signal PIPETX7EQCOEFF_in : std_logic_vector(17 downto 0);
    signal PIPETX7EQDONE_in : std_ulogic;
    signal PLEQRESETEIEOSCOUNT_in : std_ulogic;
    signal PLGEN2UPSTREAMPREFERDEEMPH_in : std_ulogic;
    signal PMVDIVIDE_in : std_logic_vector(1 downto 0);
    signal PMVENABLEN_in : std_ulogic;
    signal PMVSELECT_in : std_logic_vector(2 downto 0);
    signal RESETN_in : std_ulogic;
    signal SAXISCCTDATA_in : std_logic_vector(255 downto 0);
    signal SAXISCCTKEEP_in : std_logic_vector(7 downto 0);
    signal SAXISCCTLAST_in : std_ulogic;
    signal SAXISCCTUSER_in : std_logic_vector(32 downto 0);
    signal SAXISCCTVALID_in : std_ulogic;
    signal SAXISRQTDATA_in : std_logic_vector(255 downto 0);
    signal SAXISRQTKEEP_in : std_logic_vector(7 downto 0);
    signal SAXISRQTLAST_in : std_ulogic;
    signal SAXISRQTUSER_in : std_logic_vector(59 downto 0);
    signal SAXISRQTVALID_in : std_ulogic;
    signal SCANENABLEN_in : std_ulogic;
    signal SCANIN_in : std_logic_vector(95 downto 0);
    signal SCANMODEN_in : std_ulogic;
    signal SPAREIN_in : std_logic_vector(31 downto 0);
    signal USERCLK_in : std_ulogic;
    signal XILUNCONNBYP_in : std_logic_vector(1919 downto 0);
    signal XILUNCONNCLK_in : std_logic_vector(950 downto 0);
    signal XILUNCONNIN_in : std_logic_vector(3188 downto 0);
    
    begin
    glblGSR     <= TO_X01(GSR);
    CFGCURRENTSPEED <= CFGCURRENTSPEED_delay after OUT_DELAY;
    CFGDPASUBSTATECHANGE <= CFGDPASUBSTATECHANGE_delay after OUT_DELAY;
    CFGERRCOROUT <= CFGERRCOROUT_delay after OUT_DELAY;
    CFGERRFATALOUT <= CFGERRFATALOUT_delay after OUT_DELAY;
    CFGERRNONFATALOUT <= CFGERRNONFATALOUT_delay after OUT_DELAY;
    CFGEXTFUNCTIONNUMBER <= CFGEXTFUNCTIONNUMBER_delay after OUT_DELAY;
    CFGEXTREADRECEIVED <= CFGEXTREADRECEIVED_delay after OUT_DELAY;
    CFGEXTREGISTERNUMBER <= CFGEXTREGISTERNUMBER_delay after OUT_DELAY;
    CFGEXTWRITEBYTEENABLE <= CFGEXTWRITEBYTEENABLE_delay after OUT_DELAY;
    CFGEXTWRITEDATA <= CFGEXTWRITEDATA_delay after OUT_DELAY;
    CFGEXTWRITERECEIVED <= CFGEXTWRITERECEIVED_delay after OUT_DELAY;
    CFGFCCPLD <= CFGFCCPLD_delay after OUT_DELAY;
    CFGFCCPLH <= CFGFCCPLH_delay after OUT_DELAY;
    CFGFCNPD <= CFGFCNPD_delay after OUT_DELAY;
    CFGFCNPH <= CFGFCNPH_delay after OUT_DELAY;
    CFGFCPD <= CFGFCPD_delay after OUT_DELAY;
    CFGFCPH <= CFGFCPH_delay after OUT_DELAY;
    CFGFLRINPROCESS <= CFGFLRINPROCESS_delay after OUT_DELAY;
    CFGFUNCTIONPOWERSTATE <= CFGFUNCTIONPOWERSTATE_delay after OUT_DELAY;
    CFGFUNCTIONSTATUS <= CFGFUNCTIONSTATUS_delay after OUT_DELAY;
    CFGHOTRESETOUT <= CFGHOTRESETOUT_delay after OUT_DELAY;
    CFGINTERRUPTMSIDATA <= CFGINTERRUPTMSIDATA_delay after OUT_DELAY;
    CFGINTERRUPTMSIENABLE <= CFGINTERRUPTMSIENABLE_delay after OUT_DELAY;
    CFGINTERRUPTMSIFAIL <= CFGINTERRUPTMSIFAIL_delay after OUT_DELAY;
    CFGINTERRUPTMSIMASKUPDATE <= CFGINTERRUPTMSIMASKUPDATE_delay after OUT_DELAY;
    CFGINTERRUPTMSIMMENABLE <= CFGINTERRUPTMSIMMENABLE_delay after OUT_DELAY;
    CFGINTERRUPTMSISENT <= CFGINTERRUPTMSISENT_delay after OUT_DELAY;
    CFGINTERRUPTMSIVFENABLE <= CFGINTERRUPTMSIVFENABLE_delay after OUT_DELAY;
    CFGINTERRUPTMSIXENABLE <= CFGINTERRUPTMSIXENABLE_delay after OUT_DELAY;
    CFGINTERRUPTMSIXFAIL <= CFGINTERRUPTMSIXFAIL_delay after OUT_DELAY;
    CFGINTERRUPTMSIXMASK <= CFGINTERRUPTMSIXMASK_delay after OUT_DELAY;
    CFGINTERRUPTMSIXSENT <= CFGINTERRUPTMSIXSENT_delay after OUT_DELAY;
    CFGINTERRUPTMSIXVFENABLE <= CFGINTERRUPTMSIXVFENABLE_delay after OUT_DELAY;
    CFGINTERRUPTMSIXVFMASK <= CFGINTERRUPTMSIXVFMASK_delay after OUT_DELAY;
    CFGINTERRUPTSENT <= CFGINTERRUPTSENT_delay after OUT_DELAY;
    CFGLINKPOWERSTATE <= CFGLINKPOWERSTATE_delay after OUT_DELAY;
    CFGLOCALERROR <= CFGLOCALERROR_delay after OUT_DELAY;
    CFGLTRENABLE <= CFGLTRENABLE_delay after OUT_DELAY;
    CFGLTSSMSTATE <= CFGLTSSMSTATE_delay after OUT_DELAY;
    CFGMAXPAYLOAD <= CFGMAXPAYLOAD_delay after OUT_DELAY;
    CFGMAXREADREQ <= CFGMAXREADREQ_delay after OUT_DELAY;
    CFGMGMTREADDATA <= CFGMGMTREADDATA_delay after OUT_DELAY;
    CFGMGMTREADWRITEDONE <= CFGMGMTREADWRITEDONE_delay after OUT_DELAY;
    CFGMSGRECEIVED <= CFGMSGRECEIVED_delay after OUT_DELAY;
    CFGMSGRECEIVEDDATA <= CFGMSGRECEIVEDDATA_delay after OUT_DELAY;
    CFGMSGRECEIVEDTYPE <= CFGMSGRECEIVEDTYPE_delay after OUT_DELAY;
    CFGMSGTRANSMITDONE <= CFGMSGTRANSMITDONE_delay after OUT_DELAY;
    CFGNEGOTIATEDWIDTH <= CFGNEGOTIATEDWIDTH_delay after OUT_DELAY;
    CFGOBFFENABLE <= CFGOBFFENABLE_delay after OUT_DELAY;
    CFGPERFUNCSTATUSDATA <= CFGPERFUNCSTATUSDATA_delay after OUT_DELAY;
    CFGPERFUNCTIONUPDATEDONE <= CFGPERFUNCTIONUPDATEDONE_delay after OUT_DELAY;
    CFGPHYLINKDOWN <= CFGPHYLINKDOWN_delay after OUT_DELAY;
    CFGPHYLINKSTATUS <= CFGPHYLINKSTATUS_delay after OUT_DELAY;
    CFGPLSTATUSCHANGE <= CFGPLSTATUSCHANGE_delay after OUT_DELAY;
    CFGPOWERSTATECHANGEINTERRUPT <= CFGPOWERSTATECHANGEINTERRUPT_delay after OUT_DELAY;
    CFGRCBSTATUS <= CFGRCBSTATUS_delay after OUT_DELAY;
    CFGTPHFUNCTIONNUM <= CFGTPHFUNCTIONNUM_delay after OUT_DELAY;
    CFGTPHREQUESTERENABLE <= CFGTPHREQUESTERENABLE_delay after OUT_DELAY;
    CFGTPHSTMODE <= CFGTPHSTMODE_delay after OUT_DELAY;
    CFGTPHSTTADDRESS <= CFGTPHSTTADDRESS_delay after OUT_DELAY;
    CFGTPHSTTREADENABLE <= CFGTPHSTTREADENABLE_delay after OUT_DELAY;
    CFGTPHSTTWRITEBYTEVALID <= CFGTPHSTTWRITEBYTEVALID_delay after OUT_DELAY;
    CFGTPHSTTWRITEDATA <= CFGTPHSTTWRITEDATA_delay after OUT_DELAY;
    CFGTPHSTTWRITEENABLE <= CFGTPHSTTWRITEENABLE_delay after OUT_DELAY;
    CFGVFFLRINPROCESS <= CFGVFFLRINPROCESS_delay after OUT_DELAY;
    CFGVFPOWERSTATE <= CFGVFPOWERSTATE_delay after OUT_DELAY;
    CFGVFSTATUS <= CFGVFSTATUS_delay after OUT_DELAY;
    CFGVFTPHREQUESTERENABLE <= CFGVFTPHREQUESTERENABLE_delay after OUT_DELAY;
    CFGVFTPHSTMODE <= CFGVFTPHSTMODE_delay after OUT_DELAY;
    CONFMCAPDESIGNSWITCH <= CONFMCAPDESIGNSWITCH_delay after OUT_DELAY;
    CONFMCAPEOS <= CONFMCAPEOS_delay after OUT_DELAY;
    CONFMCAPINUSEBYPCIE <= CONFMCAPINUSEBYPCIE_delay after OUT_DELAY;
    CONFREQREADY <= CONFREQREADY_delay after OUT_DELAY;
    CONFRESPRDATA <= CONFRESPRDATA_delay after OUT_DELAY;
    CONFRESPVALID <= CONFRESPVALID_delay after OUT_DELAY;
    DBGDATAOUT <= DBGDATAOUT_delay after OUT_DELAY;
    DBGMCAPCSB <= DBGMCAPCSB_delay after OUT_DELAY;
    DBGMCAPDATA <= DBGMCAPDATA_delay after OUT_DELAY;
    DBGMCAPEOS <= DBGMCAPEOS_delay after OUT_DELAY;
    DBGMCAPERROR <= DBGMCAPERROR_delay after OUT_DELAY;
    DBGMCAPMODE <= DBGMCAPMODE_delay after OUT_DELAY;
    DBGMCAPRDATAVALID <= DBGMCAPRDATAVALID_delay after OUT_DELAY;
    DBGMCAPRDWRB <= DBGMCAPRDWRB_delay after OUT_DELAY;
    DBGMCAPRESET <= DBGMCAPRESET_delay after OUT_DELAY;
    DBGPLDATABLOCKRECEIVEDAFTEREDS <= DBGPLDATABLOCKRECEIVEDAFTEREDS_delay after OUT_DELAY;
    DBGPLGEN3FRAMINGERRORDETECTED <= DBGPLGEN3FRAMINGERRORDETECTED_delay after OUT_DELAY;
    DBGPLGEN3SYNCHEADERERRORDETECTED <= DBGPLGEN3SYNCHEADERERRORDETECTED_delay after OUT_DELAY;
    DBGPLINFERREDRXELECTRICALIDLE <= DBGPLINFERREDRXELECTRICALIDLE_delay after OUT_DELAY;
    DRPDO <= DRPDO_delay after OUT_DELAY;
    DRPRDY <= DRPRDY_delay after OUT_DELAY;
    LL2LMMASTERTLPSENT0 <= LL2LMMASTERTLPSENT0_delay after OUT_DELAY;
    LL2LMMASTERTLPSENT1 <= LL2LMMASTERTLPSENT1_delay after OUT_DELAY;
    LL2LMMASTERTLPSENTTLPID0 <= LL2LMMASTERTLPSENTTLPID0_delay after OUT_DELAY;
    LL2LMMASTERTLPSENTTLPID1 <= LL2LMMASTERTLPSENTTLPID1_delay after OUT_DELAY;
    LL2LMMAXISRXTDATA <= LL2LMMAXISRXTDATA_delay after OUT_DELAY;
    LL2LMMAXISRXTUSER <= LL2LMMAXISRXTUSER_delay after OUT_DELAY;
    LL2LMMAXISRXTVALID <= LL2LMMAXISRXTVALID_delay after OUT_DELAY;
    LL2LMSAXISTXTREADY <= LL2LMSAXISTXTREADY_delay after OUT_DELAY;
    MAXISCQTDATA <= MAXISCQTDATA_delay after OUT_DELAY;
    MAXISCQTKEEP <= MAXISCQTKEEP_delay after OUT_DELAY;
    MAXISCQTLAST <= MAXISCQTLAST_delay after OUT_DELAY;
    MAXISCQTUSER <= MAXISCQTUSER_delay after OUT_DELAY;
    MAXISCQTVALID <= MAXISCQTVALID_delay after OUT_DELAY;
    MAXISRCTDATA <= MAXISRCTDATA_delay after OUT_DELAY;
    MAXISRCTKEEP <= MAXISRCTKEEP_delay after OUT_DELAY;
    MAXISRCTLAST <= MAXISRCTLAST_delay after OUT_DELAY;
    MAXISRCTUSER <= MAXISRCTUSER_delay after OUT_DELAY;
    MAXISRCTVALID <= MAXISRCTVALID_delay after OUT_DELAY;
    MICOMPLETIONRAMREADADDRESSAL <= MICOMPLETIONRAMREADADDRESSAL_delay after OUT_DELAY;
    MICOMPLETIONRAMREADADDRESSAU <= MICOMPLETIONRAMREADADDRESSAU_delay after OUT_DELAY;
    MICOMPLETIONRAMREADADDRESSBL <= MICOMPLETIONRAMREADADDRESSBL_delay after OUT_DELAY;
    MICOMPLETIONRAMREADADDRESSBU <= MICOMPLETIONRAMREADADDRESSBU_delay after OUT_DELAY;
    MICOMPLETIONRAMREADENABLEL <= MICOMPLETIONRAMREADENABLEL_delay after OUT_DELAY;
    MICOMPLETIONRAMREADENABLEU <= MICOMPLETIONRAMREADENABLEU_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEADDRESSAL <= MICOMPLETIONRAMWRITEADDRESSAL_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEADDRESSAU <= MICOMPLETIONRAMWRITEADDRESSAU_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEADDRESSBL <= MICOMPLETIONRAMWRITEADDRESSBL_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEADDRESSBU <= MICOMPLETIONRAMWRITEADDRESSBU_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEDATAL <= MICOMPLETIONRAMWRITEDATAL_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEDATAU <= MICOMPLETIONRAMWRITEDATAU_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEENABLEL <= MICOMPLETIONRAMWRITEENABLEL_delay after OUT_DELAY;
    MICOMPLETIONRAMWRITEENABLEU <= MICOMPLETIONRAMWRITEENABLEU_delay after OUT_DELAY;
    MIREPLAYRAMADDRESS <= MIREPLAYRAMADDRESS_delay after OUT_DELAY;
    MIREPLAYRAMREADENABLE <= MIREPLAYRAMREADENABLE_delay after OUT_DELAY;
    MIREPLAYRAMWRITEDATA <= MIREPLAYRAMWRITEDATA_delay after OUT_DELAY;
    MIREPLAYRAMWRITEENABLE <= MIREPLAYRAMWRITEENABLE_delay after OUT_DELAY;
    MIREQUESTRAMREADADDRESSA <= MIREQUESTRAMREADADDRESSA_delay after OUT_DELAY;
    MIREQUESTRAMREADADDRESSB <= MIREQUESTRAMREADADDRESSB_delay after OUT_DELAY;
    MIREQUESTRAMREADENABLE <= MIREQUESTRAMREADENABLE_delay after OUT_DELAY;
    MIREQUESTRAMWRITEADDRESSA <= MIREQUESTRAMWRITEADDRESSA_delay after OUT_DELAY;
    MIREQUESTRAMWRITEADDRESSB <= MIREQUESTRAMWRITEADDRESSB_delay after OUT_DELAY;
    MIREQUESTRAMWRITEDATA <= MIREQUESTRAMWRITEDATA_delay after OUT_DELAY;
    MIREQUESTRAMWRITEENABLE <= MIREQUESTRAMWRITEENABLE_delay after OUT_DELAY;
    PCIECQNPREQCOUNT <= PCIECQNPREQCOUNT_delay after OUT_DELAY;
    PCIEPERST0B <= PCIEPERST0B_delay after OUT_DELAY;
    PCIEPERST1B <= PCIEPERST1B_delay after OUT_DELAY;
    PCIERQSEQNUM <= PCIERQSEQNUM_delay after OUT_DELAY;
    PCIERQSEQNUMVLD <= PCIERQSEQNUMVLD_delay after OUT_DELAY;
    PCIERQTAG <= PCIERQTAG_delay after OUT_DELAY;
    PCIERQTAGAV <= PCIERQTAGAV_delay after OUT_DELAY;
    PCIERQTAGVLD <= PCIERQTAGVLD_delay after OUT_DELAY;
    PCIETFCNPDAV <= PCIETFCNPDAV_delay after OUT_DELAY;
    PCIETFCNPHAV <= PCIETFCNPHAV_delay after OUT_DELAY;
    PIPERX0EQCONTROL <= PIPERX0EQCONTROL_delay after OUT_DELAY;
    PIPERX0EQLPLFFS <= PIPERX0EQLPLFFS_delay after OUT_DELAY;
    PIPERX0EQLPTXPRESET <= PIPERX0EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX0EQPRESET <= PIPERX0EQPRESET_delay after OUT_DELAY;
    PIPERX0POLARITY <= PIPERX0POLARITY_delay after OUT_DELAY;
    PIPERX1EQCONTROL <= PIPERX1EQCONTROL_delay after OUT_DELAY;
    PIPERX1EQLPLFFS <= PIPERX1EQLPLFFS_delay after OUT_DELAY;
    PIPERX1EQLPTXPRESET <= PIPERX1EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX1EQPRESET <= PIPERX1EQPRESET_delay after OUT_DELAY;
    PIPERX1POLARITY <= PIPERX1POLARITY_delay after OUT_DELAY;
    PIPERX2EQCONTROL <= PIPERX2EQCONTROL_delay after OUT_DELAY;
    PIPERX2EQLPLFFS <= PIPERX2EQLPLFFS_delay after OUT_DELAY;
    PIPERX2EQLPTXPRESET <= PIPERX2EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX2EQPRESET <= PIPERX2EQPRESET_delay after OUT_DELAY;
    PIPERX2POLARITY <= PIPERX2POLARITY_delay after OUT_DELAY;
    PIPERX3EQCONTROL <= PIPERX3EQCONTROL_delay after OUT_DELAY;
    PIPERX3EQLPLFFS <= PIPERX3EQLPLFFS_delay after OUT_DELAY;
    PIPERX3EQLPTXPRESET <= PIPERX3EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX3EQPRESET <= PIPERX3EQPRESET_delay after OUT_DELAY;
    PIPERX3POLARITY <= PIPERX3POLARITY_delay after OUT_DELAY;
    PIPERX4EQCONTROL <= PIPERX4EQCONTROL_delay after OUT_DELAY;
    PIPERX4EQLPLFFS <= PIPERX4EQLPLFFS_delay after OUT_DELAY;
    PIPERX4EQLPTXPRESET <= PIPERX4EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX4EQPRESET <= PIPERX4EQPRESET_delay after OUT_DELAY;
    PIPERX4POLARITY <= PIPERX4POLARITY_delay after OUT_DELAY;
    PIPERX5EQCONTROL <= PIPERX5EQCONTROL_delay after OUT_DELAY;
    PIPERX5EQLPLFFS <= PIPERX5EQLPLFFS_delay after OUT_DELAY;
    PIPERX5EQLPTXPRESET <= PIPERX5EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX5EQPRESET <= PIPERX5EQPRESET_delay after OUT_DELAY;
    PIPERX5POLARITY <= PIPERX5POLARITY_delay after OUT_DELAY;
    PIPERX6EQCONTROL <= PIPERX6EQCONTROL_delay after OUT_DELAY;
    PIPERX6EQLPLFFS <= PIPERX6EQLPLFFS_delay after OUT_DELAY;
    PIPERX6EQLPTXPRESET <= PIPERX6EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX6EQPRESET <= PIPERX6EQPRESET_delay after OUT_DELAY;
    PIPERX6POLARITY <= PIPERX6POLARITY_delay after OUT_DELAY;
    PIPERX7EQCONTROL <= PIPERX7EQCONTROL_delay after OUT_DELAY;
    PIPERX7EQLPLFFS <= PIPERX7EQLPLFFS_delay after OUT_DELAY;
    PIPERX7EQLPTXPRESET <= PIPERX7EQLPTXPRESET_delay after OUT_DELAY;
    PIPERX7EQPRESET <= PIPERX7EQPRESET_delay after OUT_DELAY;
    PIPERX7POLARITY <= PIPERX7POLARITY_delay after OUT_DELAY;
    PIPETX0CHARISK <= PIPETX0CHARISK_delay after OUT_DELAY;
    PIPETX0COMPLIANCE <= PIPETX0COMPLIANCE_delay after OUT_DELAY;
    PIPETX0DATA <= PIPETX0DATA_delay after OUT_DELAY;
    PIPETX0DATAVALID <= PIPETX0DATAVALID_delay after OUT_DELAY;
    PIPETX0DEEMPH <= PIPETX0DEEMPH_delay after OUT_DELAY;
    PIPETX0ELECIDLE <= PIPETX0ELECIDLE_delay after OUT_DELAY;
    PIPETX0EQCONTROL <= PIPETX0EQCONTROL_delay after OUT_DELAY;
    PIPETX0EQDEEMPH <= PIPETX0EQDEEMPH_delay after OUT_DELAY;
    PIPETX0EQPRESET <= PIPETX0EQPRESET_delay after OUT_DELAY;
    PIPETX0MARGIN <= PIPETX0MARGIN_delay after OUT_DELAY;
    PIPETX0POWERDOWN <= PIPETX0POWERDOWN_delay after OUT_DELAY;
    PIPETX0RATE <= PIPETX0RATE_delay after OUT_DELAY;
    PIPETX0RCVRDET <= PIPETX0RCVRDET_delay after OUT_DELAY;
    PIPETX0RESET <= PIPETX0RESET_delay after OUT_DELAY;
    PIPETX0STARTBLOCK <= PIPETX0STARTBLOCK_delay after OUT_DELAY;
    PIPETX0SWING <= PIPETX0SWING_delay after OUT_DELAY;
    PIPETX0SYNCHEADER <= PIPETX0SYNCHEADER_delay after OUT_DELAY;
    PIPETX1CHARISK <= PIPETX1CHARISK_delay after OUT_DELAY;
    PIPETX1COMPLIANCE <= PIPETX1COMPLIANCE_delay after OUT_DELAY;
    PIPETX1DATA <= PIPETX1DATA_delay after OUT_DELAY;
    PIPETX1DATAVALID <= PIPETX1DATAVALID_delay after OUT_DELAY;
    PIPETX1DEEMPH <= PIPETX1DEEMPH_delay after OUT_DELAY;
    PIPETX1ELECIDLE <= PIPETX1ELECIDLE_delay after OUT_DELAY;
    PIPETX1EQCONTROL <= PIPETX1EQCONTROL_delay after OUT_DELAY;
    PIPETX1EQDEEMPH <= PIPETX1EQDEEMPH_delay after OUT_DELAY;
    PIPETX1EQPRESET <= PIPETX1EQPRESET_delay after OUT_DELAY;
    PIPETX1MARGIN <= PIPETX1MARGIN_delay after OUT_DELAY;
    PIPETX1POWERDOWN <= PIPETX1POWERDOWN_delay after OUT_DELAY;
    PIPETX1RATE <= PIPETX1RATE_delay after OUT_DELAY;
    PIPETX1RCVRDET <= PIPETX1RCVRDET_delay after OUT_DELAY;
    PIPETX1RESET <= PIPETX1RESET_delay after OUT_DELAY;
    PIPETX1STARTBLOCK <= PIPETX1STARTBLOCK_delay after OUT_DELAY;
    PIPETX1SWING <= PIPETX1SWING_delay after OUT_DELAY;
    PIPETX1SYNCHEADER <= PIPETX1SYNCHEADER_delay after OUT_DELAY;
    PIPETX2CHARISK <= PIPETX2CHARISK_delay after OUT_DELAY;
    PIPETX2COMPLIANCE <= PIPETX2COMPLIANCE_delay after OUT_DELAY;
    PIPETX2DATA <= PIPETX2DATA_delay after OUT_DELAY;
    PIPETX2DATAVALID <= PIPETX2DATAVALID_delay after OUT_DELAY;
    PIPETX2DEEMPH <= PIPETX2DEEMPH_delay after OUT_DELAY;
    PIPETX2ELECIDLE <= PIPETX2ELECIDLE_delay after OUT_DELAY;
    PIPETX2EQCONTROL <= PIPETX2EQCONTROL_delay after OUT_DELAY;
    PIPETX2EQDEEMPH <= PIPETX2EQDEEMPH_delay after OUT_DELAY;
    PIPETX2EQPRESET <= PIPETX2EQPRESET_delay after OUT_DELAY;
    PIPETX2MARGIN <= PIPETX2MARGIN_delay after OUT_DELAY;
    PIPETX2POWERDOWN <= PIPETX2POWERDOWN_delay after OUT_DELAY;
    PIPETX2RATE <= PIPETX2RATE_delay after OUT_DELAY;
    PIPETX2RCVRDET <= PIPETX2RCVRDET_delay after OUT_DELAY;
    PIPETX2RESET <= PIPETX2RESET_delay after OUT_DELAY;
    PIPETX2STARTBLOCK <= PIPETX2STARTBLOCK_delay after OUT_DELAY;
    PIPETX2SWING <= PIPETX2SWING_delay after OUT_DELAY;
    PIPETX2SYNCHEADER <= PIPETX2SYNCHEADER_delay after OUT_DELAY;
    PIPETX3CHARISK <= PIPETX3CHARISK_delay after OUT_DELAY;
    PIPETX3COMPLIANCE <= PIPETX3COMPLIANCE_delay after OUT_DELAY;
    PIPETX3DATA <= PIPETX3DATA_delay after OUT_DELAY;
    PIPETX3DATAVALID <= PIPETX3DATAVALID_delay after OUT_DELAY;
    PIPETX3DEEMPH <= PIPETX3DEEMPH_delay after OUT_DELAY;
    PIPETX3ELECIDLE <= PIPETX3ELECIDLE_delay after OUT_DELAY;
    PIPETX3EQCONTROL <= PIPETX3EQCONTROL_delay after OUT_DELAY;
    PIPETX3EQDEEMPH <= PIPETX3EQDEEMPH_delay after OUT_DELAY;
    PIPETX3EQPRESET <= PIPETX3EQPRESET_delay after OUT_DELAY;
    PIPETX3MARGIN <= PIPETX3MARGIN_delay after OUT_DELAY;
    PIPETX3POWERDOWN <= PIPETX3POWERDOWN_delay after OUT_DELAY;
    PIPETX3RATE <= PIPETX3RATE_delay after OUT_DELAY;
    PIPETX3RCVRDET <= PIPETX3RCVRDET_delay after OUT_DELAY;
    PIPETX3RESET <= PIPETX3RESET_delay after OUT_DELAY;
    PIPETX3STARTBLOCK <= PIPETX3STARTBLOCK_delay after OUT_DELAY;
    PIPETX3SWING <= PIPETX3SWING_delay after OUT_DELAY;
    PIPETX3SYNCHEADER <= PIPETX3SYNCHEADER_delay after OUT_DELAY;
    PIPETX4CHARISK <= PIPETX4CHARISK_delay after OUT_DELAY;
    PIPETX4COMPLIANCE <= PIPETX4COMPLIANCE_delay after OUT_DELAY;
    PIPETX4DATA <= PIPETX4DATA_delay after OUT_DELAY;
    PIPETX4DATAVALID <= PIPETX4DATAVALID_delay after OUT_DELAY;
    PIPETX4DEEMPH <= PIPETX4DEEMPH_delay after OUT_DELAY;
    PIPETX4ELECIDLE <= PIPETX4ELECIDLE_delay after OUT_DELAY;
    PIPETX4EQCONTROL <= PIPETX4EQCONTROL_delay after OUT_DELAY;
    PIPETX4EQDEEMPH <= PIPETX4EQDEEMPH_delay after OUT_DELAY;
    PIPETX4EQPRESET <= PIPETX4EQPRESET_delay after OUT_DELAY;
    PIPETX4MARGIN <= PIPETX4MARGIN_delay after OUT_DELAY;
    PIPETX4POWERDOWN <= PIPETX4POWERDOWN_delay after OUT_DELAY;
    PIPETX4RATE <= PIPETX4RATE_delay after OUT_DELAY;
    PIPETX4RCVRDET <= PIPETX4RCVRDET_delay after OUT_DELAY;
    PIPETX4RESET <= PIPETX4RESET_delay after OUT_DELAY;
    PIPETX4STARTBLOCK <= PIPETX4STARTBLOCK_delay after OUT_DELAY;
    PIPETX4SWING <= PIPETX4SWING_delay after OUT_DELAY;
    PIPETX4SYNCHEADER <= PIPETX4SYNCHEADER_delay after OUT_DELAY;
    PIPETX5CHARISK <= PIPETX5CHARISK_delay after OUT_DELAY;
    PIPETX5COMPLIANCE <= PIPETX5COMPLIANCE_delay after OUT_DELAY;
    PIPETX5DATA <= PIPETX5DATA_delay after OUT_DELAY;
    PIPETX5DATAVALID <= PIPETX5DATAVALID_delay after OUT_DELAY;
    PIPETX5DEEMPH <= PIPETX5DEEMPH_delay after OUT_DELAY;
    PIPETX5ELECIDLE <= PIPETX5ELECIDLE_delay after OUT_DELAY;
    PIPETX5EQCONTROL <= PIPETX5EQCONTROL_delay after OUT_DELAY;
    PIPETX5EQDEEMPH <= PIPETX5EQDEEMPH_delay after OUT_DELAY;
    PIPETX5EQPRESET <= PIPETX5EQPRESET_delay after OUT_DELAY;
    PIPETX5MARGIN <= PIPETX5MARGIN_delay after OUT_DELAY;
    PIPETX5POWERDOWN <= PIPETX5POWERDOWN_delay after OUT_DELAY;
    PIPETX5RATE <= PIPETX5RATE_delay after OUT_DELAY;
    PIPETX5RCVRDET <= PIPETX5RCVRDET_delay after OUT_DELAY;
    PIPETX5RESET <= PIPETX5RESET_delay after OUT_DELAY;
    PIPETX5STARTBLOCK <= PIPETX5STARTBLOCK_delay after OUT_DELAY;
    PIPETX5SWING <= PIPETX5SWING_delay after OUT_DELAY;
    PIPETX5SYNCHEADER <= PIPETX5SYNCHEADER_delay after OUT_DELAY;
    PIPETX6CHARISK <= PIPETX6CHARISK_delay after OUT_DELAY;
    PIPETX6COMPLIANCE <= PIPETX6COMPLIANCE_delay after OUT_DELAY;
    PIPETX6DATA <= PIPETX6DATA_delay after OUT_DELAY;
    PIPETX6DATAVALID <= PIPETX6DATAVALID_delay after OUT_DELAY;
    PIPETX6DEEMPH <= PIPETX6DEEMPH_delay after OUT_DELAY;
    PIPETX6ELECIDLE <= PIPETX6ELECIDLE_delay after OUT_DELAY;
    PIPETX6EQCONTROL <= PIPETX6EQCONTROL_delay after OUT_DELAY;
    PIPETX6EQDEEMPH <= PIPETX6EQDEEMPH_delay after OUT_DELAY;
    PIPETX6EQPRESET <= PIPETX6EQPRESET_delay after OUT_DELAY;
    PIPETX6MARGIN <= PIPETX6MARGIN_delay after OUT_DELAY;
    PIPETX6POWERDOWN <= PIPETX6POWERDOWN_delay after OUT_DELAY;
    PIPETX6RATE <= PIPETX6RATE_delay after OUT_DELAY;
    PIPETX6RCVRDET <= PIPETX6RCVRDET_delay after OUT_DELAY;
    PIPETX6RESET <= PIPETX6RESET_delay after OUT_DELAY;
    PIPETX6STARTBLOCK <= PIPETX6STARTBLOCK_delay after OUT_DELAY;
    PIPETX6SWING <= PIPETX6SWING_delay after OUT_DELAY;
    PIPETX6SYNCHEADER <= PIPETX6SYNCHEADER_delay after OUT_DELAY;
    PIPETX7CHARISK <= PIPETX7CHARISK_delay after OUT_DELAY;
    PIPETX7COMPLIANCE <= PIPETX7COMPLIANCE_delay after OUT_DELAY;
    PIPETX7DATA <= PIPETX7DATA_delay after OUT_DELAY;
    PIPETX7DATAVALID <= PIPETX7DATAVALID_delay after OUT_DELAY;
    PIPETX7DEEMPH <= PIPETX7DEEMPH_delay after OUT_DELAY;
    PIPETX7ELECIDLE <= PIPETX7ELECIDLE_delay after OUT_DELAY;
    PIPETX7EQCONTROL <= PIPETX7EQCONTROL_delay after OUT_DELAY;
    PIPETX7EQDEEMPH <= PIPETX7EQDEEMPH_delay after OUT_DELAY;
    PIPETX7EQPRESET <= PIPETX7EQPRESET_delay after OUT_DELAY;
    PIPETX7MARGIN <= PIPETX7MARGIN_delay after OUT_DELAY;
    PIPETX7POWERDOWN <= PIPETX7POWERDOWN_delay after OUT_DELAY;
    PIPETX7RATE <= PIPETX7RATE_delay after OUT_DELAY;
    PIPETX7RCVRDET <= PIPETX7RCVRDET_delay after OUT_DELAY;
    PIPETX7RESET <= PIPETX7RESET_delay after OUT_DELAY;
    PIPETX7STARTBLOCK <= PIPETX7STARTBLOCK_delay after OUT_DELAY;
    PIPETX7SWING <= PIPETX7SWING_delay after OUT_DELAY;
    PIPETX7SYNCHEADER <= PIPETX7SYNCHEADER_delay after OUT_DELAY;
    PLEQINPROGRESS <= PLEQINPROGRESS_delay after OUT_DELAY;
    PLEQPHASE <= PLEQPHASE_delay after OUT_DELAY;
    SAXISCCTREADY <= SAXISCCTREADY_delay after OUT_DELAY;
    SAXISRQTREADY <= SAXISRQTREADY_delay after OUT_DELAY;
    SPAREOUT <= SPAREOUT_delay after OUT_DELAY;
    
    CFGCURRENTSPEED_delay <= CFGCURRENTSPEED_out;
    CFGDPASUBSTATECHANGE_delay <= CFGDPASUBSTATECHANGE_out;
    CFGERRCOROUT_delay <= CFGERRCOROUT_out;
    CFGERRFATALOUT_delay <= CFGERRFATALOUT_out;
    CFGERRNONFATALOUT_delay <= CFGERRNONFATALOUT_out;
    CFGEXTFUNCTIONNUMBER_delay <= CFGEXTFUNCTIONNUMBER_out;
    CFGEXTREADRECEIVED_delay <= CFGEXTREADRECEIVED_out;
    CFGEXTREGISTERNUMBER_delay <= CFGEXTREGISTERNUMBER_out;
    CFGEXTWRITEBYTEENABLE_delay <= CFGEXTWRITEBYTEENABLE_out;
    CFGEXTWRITEDATA_delay <= CFGEXTWRITEDATA_out;
    CFGEXTWRITERECEIVED_delay <= CFGEXTWRITERECEIVED_out;
    CFGFCCPLD_delay <= CFGFCCPLD_out;
    CFGFCCPLH_delay <= CFGFCCPLH_out;
    CFGFCNPD_delay <= CFGFCNPD_out;
    CFGFCNPH_delay <= CFGFCNPH_out;
    CFGFCPD_delay <= CFGFCPD_out;
    CFGFCPH_delay <= CFGFCPH_out;
    CFGFLRINPROCESS_delay <= CFGFLRINPROCESS_out;
    CFGFUNCTIONPOWERSTATE_delay <= CFGFUNCTIONPOWERSTATE_out;
    CFGFUNCTIONSTATUS_delay <= CFGFUNCTIONSTATUS_out;
    CFGHOTRESETOUT_delay <= CFGHOTRESETOUT_out;
    CFGINTERRUPTMSIDATA_delay <= CFGINTERRUPTMSIDATA_out;
    CFGINTERRUPTMSIENABLE_delay <= CFGINTERRUPTMSIENABLE_out;
    CFGINTERRUPTMSIFAIL_delay <= CFGINTERRUPTMSIFAIL_out;
    CFGINTERRUPTMSIMASKUPDATE_delay <= CFGINTERRUPTMSIMASKUPDATE_out;
    CFGINTERRUPTMSIMMENABLE_delay <= CFGINTERRUPTMSIMMENABLE_out;
    CFGINTERRUPTMSISENT_delay <= CFGINTERRUPTMSISENT_out;
    CFGINTERRUPTMSIVFENABLE_delay <= CFGINTERRUPTMSIVFENABLE_out;
    CFGINTERRUPTMSIXENABLE_delay <= CFGINTERRUPTMSIXENABLE_out;
    CFGINTERRUPTMSIXFAIL_delay <= CFGINTERRUPTMSIXFAIL_out;
    CFGINTERRUPTMSIXMASK_delay <= CFGINTERRUPTMSIXMASK_out;
    CFGINTERRUPTMSIXSENT_delay <= CFGINTERRUPTMSIXSENT_out;
    CFGINTERRUPTMSIXVFENABLE_delay <= CFGINTERRUPTMSIXVFENABLE_out;
    CFGINTERRUPTMSIXVFMASK_delay <= CFGINTERRUPTMSIXVFMASK_out;
    CFGINTERRUPTSENT_delay <= CFGINTERRUPTSENT_out;
    CFGLINKPOWERSTATE_delay <= CFGLINKPOWERSTATE_out;
    CFGLOCALERROR_delay <= CFGLOCALERROR_out;
    CFGLTRENABLE_delay <= CFGLTRENABLE_out;
    CFGLTSSMSTATE_delay <= CFGLTSSMSTATE_out;
    CFGMAXPAYLOAD_delay <= CFGMAXPAYLOAD_out;
    CFGMAXREADREQ_delay <= CFGMAXREADREQ_out;
    CFGMGMTREADDATA_delay <= CFGMGMTREADDATA_out;
    CFGMGMTREADWRITEDONE_delay <= CFGMGMTREADWRITEDONE_out;
    CFGMSGRECEIVEDDATA_delay <= CFGMSGRECEIVEDDATA_out;
    CFGMSGRECEIVEDTYPE_delay <= CFGMSGRECEIVEDTYPE_out;
    CFGMSGRECEIVED_delay <= CFGMSGRECEIVED_out;
    CFGMSGTRANSMITDONE_delay <= CFGMSGTRANSMITDONE_out;
    CFGNEGOTIATEDWIDTH_delay <= CFGNEGOTIATEDWIDTH_out;
    CFGOBFFENABLE_delay <= CFGOBFFENABLE_out;
    CFGPERFUNCSTATUSDATA_delay <= CFGPERFUNCSTATUSDATA_out;
    CFGPERFUNCTIONUPDATEDONE_delay <= CFGPERFUNCTIONUPDATEDONE_out;
    CFGPHYLINKDOWN_delay <= CFGPHYLINKDOWN_out;
    CFGPHYLINKSTATUS_delay <= CFGPHYLINKSTATUS_out;
    CFGPLSTATUSCHANGE_delay <= CFGPLSTATUSCHANGE_out;
    CFGPOWERSTATECHANGEINTERRUPT_delay <= CFGPOWERSTATECHANGEINTERRUPT_out;
    CFGRCBSTATUS_delay <= CFGRCBSTATUS_out;
    CFGTPHFUNCTIONNUM_delay <= CFGTPHFUNCTIONNUM_out;
    CFGTPHREQUESTERENABLE_delay <= CFGTPHREQUESTERENABLE_out;
    CFGTPHSTMODE_delay <= CFGTPHSTMODE_out;
    CFGTPHSTTADDRESS_delay <= CFGTPHSTTADDRESS_out;
    CFGTPHSTTREADENABLE_delay <= CFGTPHSTTREADENABLE_out;
    CFGTPHSTTWRITEBYTEVALID_delay <= CFGTPHSTTWRITEBYTEVALID_out;
    CFGTPHSTTWRITEDATA_delay <= CFGTPHSTTWRITEDATA_out;
    CFGTPHSTTWRITEENABLE_delay <= CFGTPHSTTWRITEENABLE_out;
    CFGVFFLRINPROCESS_delay <= CFGVFFLRINPROCESS_out;
    CFGVFPOWERSTATE_delay <= CFGVFPOWERSTATE_out;
    CFGVFSTATUS_delay <= CFGVFSTATUS_out;
    CFGVFTPHREQUESTERENABLE_delay <= CFGVFTPHREQUESTERENABLE_out;
    CFGVFTPHSTMODE_delay <= CFGVFTPHSTMODE_out;
    CONFMCAPDESIGNSWITCH_delay <= CONFMCAPDESIGNSWITCH_out;
    CONFMCAPEOS_delay <= CONFMCAPEOS_out;
    CONFMCAPINUSEBYPCIE_delay <= CONFMCAPINUSEBYPCIE_out;
    CONFREQREADY_delay <= CONFREQREADY_out;
    CONFRESPRDATA_delay <= CONFRESPRDATA_out;
    CONFRESPVALID_delay <= CONFRESPVALID_out;
    DBGDATAOUT_delay <= DBGDATAOUT_out;
    DBGMCAPCSB_delay <= DBGMCAPCSB_out;
    DBGMCAPDATA_delay <= DBGMCAPDATA_out;
    DBGMCAPEOS_delay <= DBGMCAPEOS_out;
    DBGMCAPERROR_delay <= DBGMCAPERROR_out;
    DBGMCAPMODE_delay <= DBGMCAPMODE_out;
    DBGMCAPRDATAVALID_delay <= DBGMCAPRDATAVALID_out;
    DBGMCAPRDWRB_delay <= DBGMCAPRDWRB_out;
    DBGMCAPRESET_delay <= DBGMCAPRESET_out;
    DBGPLDATABLOCKRECEIVEDAFTEREDS_delay <= DBGPLDATABLOCKRECEIVEDAFTEREDS_out;
    DBGPLGEN3FRAMINGERRORDETECTED_delay <= DBGPLGEN3FRAMINGERRORDETECTED_out;
    DBGPLGEN3SYNCHEADERERRORDETECTED_delay <= DBGPLGEN3SYNCHEADERERRORDETECTED_out;
    DBGPLINFERREDRXELECTRICALIDLE_delay <= DBGPLINFERREDRXELECTRICALIDLE_out;
    DRPDO_delay <= DRPDO_out;
    DRPRDY_delay <= DRPRDY_out;
    LL2LMMASTERTLPSENT0_delay <= LL2LMMASTERTLPSENT0_out;
    LL2LMMASTERTLPSENT1_delay <= LL2LMMASTERTLPSENT1_out;
    LL2LMMASTERTLPSENTTLPID0_delay <= LL2LMMASTERTLPSENTTLPID0_out;
    LL2LMMASTERTLPSENTTLPID1_delay <= LL2LMMASTERTLPSENTTLPID1_out;
    LL2LMMAXISRXTDATA_delay <= LL2LMMAXISRXTDATA_out;
    LL2LMMAXISRXTUSER_delay <= LL2LMMAXISRXTUSER_out;
    LL2LMMAXISRXTVALID_delay <= LL2LMMAXISRXTVALID_out;
    LL2LMSAXISTXTREADY_delay <= LL2LMSAXISTXTREADY_out;
    MAXISCQTDATA_delay <= MAXISCQTDATA_out;
    MAXISCQTKEEP_delay <= MAXISCQTKEEP_out;
    MAXISCQTLAST_delay <= MAXISCQTLAST_out;
    MAXISCQTUSER_delay <= MAXISCQTUSER_out;
    MAXISCQTVALID_delay <= MAXISCQTVALID_out;
    MAXISRCTDATA_delay <= MAXISRCTDATA_out;
    MAXISRCTKEEP_delay <= MAXISRCTKEEP_out;
    MAXISRCTLAST_delay <= MAXISRCTLAST_out;
    MAXISRCTUSER_delay <= MAXISRCTUSER_out;
    MAXISRCTVALID_delay <= MAXISRCTVALID_out;
    MICOMPLETIONRAMREADADDRESSAL_delay <= MICOMPLETIONRAMREADADDRESSAL_out;
    MICOMPLETIONRAMREADADDRESSAU_delay <= MICOMPLETIONRAMREADADDRESSAU_out;
    MICOMPLETIONRAMREADADDRESSBL_delay <= MICOMPLETIONRAMREADADDRESSBL_out;
    MICOMPLETIONRAMREADADDRESSBU_delay <= MICOMPLETIONRAMREADADDRESSBU_out;
    MICOMPLETIONRAMREADENABLEL_delay <= MICOMPLETIONRAMREADENABLEL_out;
    MICOMPLETIONRAMREADENABLEU_delay <= MICOMPLETIONRAMREADENABLEU_out;
    MICOMPLETIONRAMWRITEADDRESSAL_delay <= MICOMPLETIONRAMWRITEADDRESSAL_out;
    MICOMPLETIONRAMWRITEADDRESSAU_delay <= MICOMPLETIONRAMWRITEADDRESSAU_out;
    MICOMPLETIONRAMWRITEADDRESSBL_delay <= MICOMPLETIONRAMWRITEADDRESSBL_out;
    MICOMPLETIONRAMWRITEADDRESSBU_delay <= MICOMPLETIONRAMWRITEADDRESSBU_out;
    MICOMPLETIONRAMWRITEDATAL_delay <= MICOMPLETIONRAMWRITEDATAL_out;
    MICOMPLETIONRAMWRITEDATAU_delay <= MICOMPLETIONRAMWRITEDATAU_out;
    MICOMPLETIONRAMWRITEENABLEL_delay <= MICOMPLETIONRAMWRITEENABLEL_out;
    MICOMPLETIONRAMWRITEENABLEU_delay <= MICOMPLETIONRAMWRITEENABLEU_out;
    MIREPLAYRAMADDRESS_delay <= MIREPLAYRAMADDRESS_out;
    MIREPLAYRAMREADENABLE_delay <= MIREPLAYRAMREADENABLE_out;
    MIREPLAYRAMWRITEDATA_delay <= MIREPLAYRAMWRITEDATA_out;
    MIREPLAYRAMWRITEENABLE_delay <= MIREPLAYRAMWRITEENABLE_out;
    MIREQUESTRAMREADADDRESSA_delay <= MIREQUESTRAMREADADDRESSA_out;
    MIREQUESTRAMREADADDRESSB_delay <= MIREQUESTRAMREADADDRESSB_out;
    MIREQUESTRAMREADENABLE_delay <= MIREQUESTRAMREADENABLE_out;
    MIREQUESTRAMWRITEADDRESSA_delay <= MIREQUESTRAMWRITEADDRESSA_out;
    MIREQUESTRAMWRITEADDRESSB_delay <= MIREQUESTRAMWRITEADDRESSB_out;
    MIREQUESTRAMWRITEDATA_delay <= MIREQUESTRAMWRITEDATA_out;
    MIREQUESTRAMWRITEENABLE_delay <= MIREQUESTRAMWRITEENABLE_out;
    PCIECQNPREQCOUNT_delay <= PCIECQNPREQCOUNT_out;
    PCIEPERST0B_delay <= PCIEPERST0B_out;
    PCIEPERST1B_delay <= PCIEPERST1B_out;
    PCIERQSEQNUMVLD_delay <= PCIERQSEQNUMVLD_out;
    PCIERQSEQNUM_delay <= PCIERQSEQNUM_out;
    PCIERQTAGAV_delay <= PCIERQTAGAV_out;
    PCIERQTAGVLD_delay <= PCIERQTAGVLD_out;
    PCIERQTAG_delay <= PCIERQTAG_out;
    PCIETFCNPDAV_delay <= PCIETFCNPDAV_out;
    PCIETFCNPHAV_delay <= PCIETFCNPHAV_out;
    PIPERX0EQCONTROL_delay <= PIPERX0EQCONTROL_out;
    PIPERX0EQLPLFFS_delay <= PIPERX0EQLPLFFS_out;
    PIPERX0EQLPTXPRESET_delay <= PIPERX0EQLPTXPRESET_out;
    PIPERX0EQPRESET_delay <= PIPERX0EQPRESET_out;
    PIPERX0POLARITY_delay <= PIPERX0POLARITY_out;
    PIPERX1EQCONTROL_delay <= PIPERX1EQCONTROL_out;
    PIPERX1EQLPLFFS_delay <= PIPERX1EQLPLFFS_out;
    PIPERX1EQLPTXPRESET_delay <= PIPERX1EQLPTXPRESET_out;
    PIPERX1EQPRESET_delay <= PIPERX1EQPRESET_out;
    PIPERX1POLARITY_delay <= PIPERX1POLARITY_out;
    PIPERX2EQCONTROL_delay <= PIPERX2EQCONTROL_out;
    PIPERX2EQLPLFFS_delay <= PIPERX2EQLPLFFS_out;
    PIPERX2EQLPTXPRESET_delay <= PIPERX2EQLPTXPRESET_out;
    PIPERX2EQPRESET_delay <= PIPERX2EQPRESET_out;
    PIPERX2POLARITY_delay <= PIPERX2POLARITY_out;
    PIPERX3EQCONTROL_delay <= PIPERX3EQCONTROL_out;
    PIPERX3EQLPLFFS_delay <= PIPERX3EQLPLFFS_out;
    PIPERX3EQLPTXPRESET_delay <= PIPERX3EQLPTXPRESET_out;
    PIPERX3EQPRESET_delay <= PIPERX3EQPRESET_out;
    PIPERX3POLARITY_delay <= PIPERX3POLARITY_out;
    PIPERX4EQCONTROL_delay <= PIPERX4EQCONTROL_out;
    PIPERX4EQLPLFFS_delay <= PIPERX4EQLPLFFS_out;
    PIPERX4EQLPTXPRESET_delay <= PIPERX4EQLPTXPRESET_out;
    PIPERX4EQPRESET_delay <= PIPERX4EQPRESET_out;
    PIPERX4POLARITY_delay <= PIPERX4POLARITY_out;
    PIPERX5EQCONTROL_delay <= PIPERX5EQCONTROL_out;
    PIPERX5EQLPLFFS_delay <= PIPERX5EQLPLFFS_out;
    PIPERX5EQLPTXPRESET_delay <= PIPERX5EQLPTXPRESET_out;
    PIPERX5EQPRESET_delay <= PIPERX5EQPRESET_out;
    PIPERX5POLARITY_delay <= PIPERX5POLARITY_out;
    PIPERX6EQCONTROL_delay <= PIPERX6EQCONTROL_out;
    PIPERX6EQLPLFFS_delay <= PIPERX6EQLPLFFS_out;
    PIPERX6EQLPTXPRESET_delay <= PIPERX6EQLPTXPRESET_out;
    PIPERX6EQPRESET_delay <= PIPERX6EQPRESET_out;
    PIPERX6POLARITY_delay <= PIPERX6POLARITY_out;
    PIPERX7EQCONTROL_delay <= PIPERX7EQCONTROL_out;
    PIPERX7EQLPLFFS_delay <= PIPERX7EQLPLFFS_out;
    PIPERX7EQLPTXPRESET_delay <= PIPERX7EQLPTXPRESET_out;
    PIPERX7EQPRESET_delay <= PIPERX7EQPRESET_out;
    PIPERX7POLARITY_delay <= PIPERX7POLARITY_out;
    PIPETX0CHARISK_delay <= PIPETX0CHARISK_out;
    PIPETX0COMPLIANCE_delay <= PIPETX0COMPLIANCE_out;
    PIPETX0DATAVALID_delay <= PIPETX0DATAVALID_out;
    PIPETX0DATA_delay <= PIPETX0DATA_out;
    PIPETX0DEEMPH_delay <= PIPETX0DEEMPH_out;
    PIPETX0ELECIDLE_delay <= PIPETX0ELECIDLE_out;
    PIPETX0EQCONTROL_delay <= PIPETX0EQCONTROL_out;
    PIPETX0EQDEEMPH_delay <= PIPETX0EQDEEMPH_out;
    PIPETX0EQPRESET_delay <= PIPETX0EQPRESET_out;
    PIPETX0MARGIN_delay <= PIPETX0MARGIN_out;
    PIPETX0POWERDOWN_delay <= PIPETX0POWERDOWN_out;
    PIPETX0RATE_delay <= PIPETX0RATE_out;
    PIPETX0RCVRDET_delay <= PIPETX0RCVRDET_out;
    PIPETX0RESET_delay <= PIPETX0RESET_out;
    PIPETX0STARTBLOCK_delay <= PIPETX0STARTBLOCK_out;
    PIPETX0SWING_delay <= PIPETX0SWING_out;
    PIPETX0SYNCHEADER_delay <= PIPETX0SYNCHEADER_out;
    PIPETX1CHARISK_delay <= PIPETX1CHARISK_out;
    PIPETX1COMPLIANCE_delay <= PIPETX1COMPLIANCE_out;
    PIPETX1DATAVALID_delay <= PIPETX1DATAVALID_out;
    PIPETX1DATA_delay <= PIPETX1DATA_out;
    PIPETX1DEEMPH_delay <= PIPETX1DEEMPH_out;
    PIPETX1ELECIDLE_delay <= PIPETX1ELECIDLE_out;
    PIPETX1EQCONTROL_delay <= PIPETX1EQCONTROL_out;
    PIPETX1EQDEEMPH_delay <= PIPETX1EQDEEMPH_out;
    PIPETX1EQPRESET_delay <= PIPETX1EQPRESET_out;
    PIPETX1MARGIN_delay <= PIPETX1MARGIN_out;
    PIPETX1POWERDOWN_delay <= PIPETX1POWERDOWN_out;
    PIPETX1RATE_delay <= PIPETX1RATE_out;
    PIPETX1RCVRDET_delay <= PIPETX1RCVRDET_out;
    PIPETX1RESET_delay <= PIPETX1RESET_out;
    PIPETX1STARTBLOCK_delay <= PIPETX1STARTBLOCK_out;
    PIPETX1SWING_delay <= PIPETX1SWING_out;
    PIPETX1SYNCHEADER_delay <= PIPETX1SYNCHEADER_out;
    PIPETX2CHARISK_delay <= PIPETX2CHARISK_out;
    PIPETX2COMPLIANCE_delay <= PIPETX2COMPLIANCE_out;
    PIPETX2DATAVALID_delay <= PIPETX2DATAVALID_out;
    PIPETX2DATA_delay <= PIPETX2DATA_out;
    PIPETX2DEEMPH_delay <= PIPETX2DEEMPH_out;
    PIPETX2ELECIDLE_delay <= PIPETX2ELECIDLE_out;
    PIPETX2EQCONTROL_delay <= PIPETX2EQCONTROL_out;
    PIPETX2EQDEEMPH_delay <= PIPETX2EQDEEMPH_out;
    PIPETX2EQPRESET_delay <= PIPETX2EQPRESET_out;
    PIPETX2MARGIN_delay <= PIPETX2MARGIN_out;
    PIPETX2POWERDOWN_delay <= PIPETX2POWERDOWN_out;
    PIPETX2RATE_delay <= PIPETX2RATE_out;
    PIPETX2RCVRDET_delay <= PIPETX2RCVRDET_out;
    PIPETX2RESET_delay <= PIPETX2RESET_out;
    PIPETX2STARTBLOCK_delay <= PIPETX2STARTBLOCK_out;
    PIPETX2SWING_delay <= PIPETX2SWING_out;
    PIPETX2SYNCHEADER_delay <= PIPETX2SYNCHEADER_out;
    PIPETX3CHARISK_delay <= PIPETX3CHARISK_out;
    PIPETX3COMPLIANCE_delay <= PIPETX3COMPLIANCE_out;
    PIPETX3DATAVALID_delay <= PIPETX3DATAVALID_out;
    PIPETX3DATA_delay <= PIPETX3DATA_out;
    PIPETX3DEEMPH_delay <= PIPETX3DEEMPH_out;
    PIPETX3ELECIDLE_delay <= PIPETX3ELECIDLE_out;
    PIPETX3EQCONTROL_delay <= PIPETX3EQCONTROL_out;
    PIPETX3EQDEEMPH_delay <= PIPETX3EQDEEMPH_out;
    PIPETX3EQPRESET_delay <= PIPETX3EQPRESET_out;
    PIPETX3MARGIN_delay <= PIPETX3MARGIN_out;
    PIPETX3POWERDOWN_delay <= PIPETX3POWERDOWN_out;
    PIPETX3RATE_delay <= PIPETX3RATE_out;
    PIPETX3RCVRDET_delay <= PIPETX3RCVRDET_out;
    PIPETX3RESET_delay <= PIPETX3RESET_out;
    PIPETX3STARTBLOCK_delay <= PIPETX3STARTBLOCK_out;
    PIPETX3SWING_delay <= PIPETX3SWING_out;
    PIPETX3SYNCHEADER_delay <= PIPETX3SYNCHEADER_out;
    PIPETX4CHARISK_delay <= PIPETX4CHARISK_out;
    PIPETX4COMPLIANCE_delay <= PIPETX4COMPLIANCE_out;
    PIPETX4DATAVALID_delay <= PIPETX4DATAVALID_out;
    PIPETX4DATA_delay <= PIPETX4DATA_out;
    PIPETX4DEEMPH_delay <= PIPETX4DEEMPH_out;
    PIPETX4ELECIDLE_delay <= PIPETX4ELECIDLE_out;
    PIPETX4EQCONTROL_delay <= PIPETX4EQCONTROL_out;
    PIPETX4EQDEEMPH_delay <= PIPETX4EQDEEMPH_out;
    PIPETX4EQPRESET_delay <= PIPETX4EQPRESET_out;
    PIPETX4MARGIN_delay <= PIPETX4MARGIN_out;
    PIPETX4POWERDOWN_delay <= PIPETX4POWERDOWN_out;
    PIPETX4RATE_delay <= PIPETX4RATE_out;
    PIPETX4RCVRDET_delay <= PIPETX4RCVRDET_out;
    PIPETX4RESET_delay <= PIPETX4RESET_out;
    PIPETX4STARTBLOCK_delay <= PIPETX4STARTBLOCK_out;
    PIPETX4SWING_delay <= PIPETX4SWING_out;
    PIPETX4SYNCHEADER_delay <= PIPETX4SYNCHEADER_out;
    PIPETX5CHARISK_delay <= PIPETX5CHARISK_out;
    PIPETX5COMPLIANCE_delay <= PIPETX5COMPLIANCE_out;
    PIPETX5DATAVALID_delay <= PIPETX5DATAVALID_out;
    PIPETX5DATA_delay <= PIPETX5DATA_out;
    PIPETX5DEEMPH_delay <= PIPETX5DEEMPH_out;
    PIPETX5ELECIDLE_delay <= PIPETX5ELECIDLE_out;
    PIPETX5EQCONTROL_delay <= PIPETX5EQCONTROL_out;
    PIPETX5EQDEEMPH_delay <= PIPETX5EQDEEMPH_out;
    PIPETX5EQPRESET_delay <= PIPETX5EQPRESET_out;
    PIPETX5MARGIN_delay <= PIPETX5MARGIN_out;
    PIPETX5POWERDOWN_delay <= PIPETX5POWERDOWN_out;
    PIPETX5RATE_delay <= PIPETX5RATE_out;
    PIPETX5RCVRDET_delay <= PIPETX5RCVRDET_out;
    PIPETX5RESET_delay <= PIPETX5RESET_out;
    PIPETX5STARTBLOCK_delay <= PIPETX5STARTBLOCK_out;
    PIPETX5SWING_delay <= PIPETX5SWING_out;
    PIPETX5SYNCHEADER_delay <= PIPETX5SYNCHEADER_out;
    PIPETX6CHARISK_delay <= PIPETX6CHARISK_out;
    PIPETX6COMPLIANCE_delay <= PIPETX6COMPLIANCE_out;
    PIPETX6DATAVALID_delay <= PIPETX6DATAVALID_out;
    PIPETX6DATA_delay <= PIPETX6DATA_out;
    PIPETX6DEEMPH_delay <= PIPETX6DEEMPH_out;
    PIPETX6ELECIDLE_delay <= PIPETX6ELECIDLE_out;
    PIPETX6EQCONTROL_delay <= PIPETX6EQCONTROL_out;
    PIPETX6EQDEEMPH_delay <= PIPETX6EQDEEMPH_out;
    PIPETX6EQPRESET_delay <= PIPETX6EQPRESET_out;
    PIPETX6MARGIN_delay <= PIPETX6MARGIN_out;
    PIPETX6POWERDOWN_delay <= PIPETX6POWERDOWN_out;
    PIPETX6RATE_delay <= PIPETX6RATE_out;
    PIPETX6RCVRDET_delay <= PIPETX6RCVRDET_out;
    PIPETX6RESET_delay <= PIPETX6RESET_out;
    PIPETX6STARTBLOCK_delay <= PIPETX6STARTBLOCK_out;
    PIPETX6SWING_delay <= PIPETX6SWING_out;
    PIPETX6SYNCHEADER_delay <= PIPETX6SYNCHEADER_out;
    PIPETX7CHARISK_delay <= PIPETX7CHARISK_out;
    PIPETX7COMPLIANCE_delay <= PIPETX7COMPLIANCE_out;
    PIPETX7DATAVALID_delay <= PIPETX7DATAVALID_out;
    PIPETX7DATA_delay <= PIPETX7DATA_out;
    PIPETX7DEEMPH_delay <= PIPETX7DEEMPH_out;
    PIPETX7ELECIDLE_delay <= PIPETX7ELECIDLE_out;
    PIPETX7EQCONTROL_delay <= PIPETX7EQCONTROL_out;
    PIPETX7EQDEEMPH_delay <= PIPETX7EQDEEMPH_out;
    PIPETX7EQPRESET_delay <= PIPETX7EQPRESET_out;
    PIPETX7MARGIN_delay <= PIPETX7MARGIN_out;
    PIPETX7POWERDOWN_delay <= PIPETX7POWERDOWN_out;
    PIPETX7RATE_delay <= PIPETX7RATE_out;
    PIPETX7RCVRDET_delay <= PIPETX7RCVRDET_out;
    PIPETX7RESET_delay <= PIPETX7RESET_out;
    PIPETX7STARTBLOCK_delay <= PIPETX7STARTBLOCK_out;
    PIPETX7SWING_delay <= PIPETX7SWING_out;
    PIPETX7SYNCHEADER_delay <= PIPETX7SYNCHEADER_out;
    PLEQINPROGRESS_delay <= PLEQINPROGRESS_out;
    PLEQPHASE_delay <= PLEQPHASE_out;
    SAXISCCTREADY_delay <= SAXISCCTREADY_out;
    SAXISRQTREADY_delay <= SAXISRQTREADY_out;
    SPAREOUT_delay <= SPAREOUT_out;
    
    CORECLKMICOMPLETIONRAML_delay <= CORECLKMICOMPLETIONRAML after INCLK_DELAY;
    CORECLKMICOMPLETIONRAMU_delay <= CORECLKMICOMPLETIONRAMU after INCLK_DELAY;
    CORECLKMIREPLAYRAM_delay <= CORECLKMIREPLAYRAM after INCLK_DELAY;
    CORECLKMIREQUESTRAM_delay <= CORECLKMIREQUESTRAM after INCLK_DELAY;
    CORECLK_delay <= CORECLK after INCLK_DELAY;
    DRPCLK_delay <= DRPCLK after INCLK_DELAY;
    MCAPCLK_delay <= MCAPCLK after INCLK_DELAY;
    PIPECLK_delay <= PIPECLK after INCLK_DELAY;
    USERCLK_delay <= USERCLK after INCLK_DELAY;
    
    CFGCONFIGSPACEENABLE_delay <= CFGCONFIGSPACEENABLE after IN_DELAY;
    CFGDEVID_delay <= CFGDEVID after IN_DELAY;
    CFGDSBUSNUMBER_delay <= CFGDSBUSNUMBER after IN_DELAY;
    CFGDSDEVICENUMBER_delay <= CFGDSDEVICENUMBER after IN_DELAY;
    CFGDSFUNCTIONNUMBER_delay <= CFGDSFUNCTIONNUMBER after IN_DELAY;
    CFGDSN_delay <= CFGDSN after IN_DELAY;
    CFGDSPORTNUMBER_delay <= CFGDSPORTNUMBER after IN_DELAY;
    CFGERRCORIN_delay <= CFGERRCORIN after IN_DELAY;
    CFGERRUNCORIN_delay <= CFGERRUNCORIN after IN_DELAY;
    CFGEXTREADDATAVALID_delay <= CFGEXTREADDATAVALID after IN_DELAY;
    CFGEXTREADDATA_delay <= CFGEXTREADDATA after IN_DELAY;
    CFGFCSEL_delay <= CFGFCSEL after IN_DELAY;
    CFGFLRDONE_delay <= CFGFLRDONE after IN_DELAY;
    CFGHOTRESETIN_delay <= CFGHOTRESETIN after IN_DELAY;
    CFGINTERRUPTINT_delay <= CFGINTERRUPTINT after IN_DELAY;
    CFGINTERRUPTMSIATTR_delay <= CFGINTERRUPTMSIATTR after IN_DELAY;
    CFGINTERRUPTMSIFUNCTIONNUMBER_delay <= CFGINTERRUPTMSIFUNCTIONNUMBER after IN_DELAY;
    CFGINTERRUPTMSIINT_delay <= CFGINTERRUPTMSIINT after IN_DELAY;
    CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE_delay <= CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE after IN_DELAY;
    CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM_delay <= CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM after IN_DELAY;
    CFGINTERRUPTMSIPENDINGSTATUS_delay <= CFGINTERRUPTMSIPENDINGSTATUS after IN_DELAY;
    CFGINTERRUPTMSISELECT_delay <= CFGINTERRUPTMSISELECT after IN_DELAY;
    CFGINTERRUPTMSITPHPRESENT_delay <= CFGINTERRUPTMSITPHPRESENT after IN_DELAY;
    CFGINTERRUPTMSITPHSTTAG_delay <= CFGINTERRUPTMSITPHSTTAG after IN_DELAY;
    CFGINTERRUPTMSITPHTYPE_delay <= CFGINTERRUPTMSITPHTYPE after IN_DELAY;
    CFGINTERRUPTMSIXADDRESS_delay <= CFGINTERRUPTMSIXADDRESS after IN_DELAY;
    CFGINTERRUPTMSIXDATA_delay <= CFGINTERRUPTMSIXDATA after IN_DELAY;
    CFGINTERRUPTMSIXINT_delay <= CFGINTERRUPTMSIXINT after IN_DELAY;
    CFGINTERRUPTPENDING_delay <= CFGINTERRUPTPENDING after IN_DELAY;
    CFGLINKTRAININGENABLE_delay <= CFGLINKTRAININGENABLE after IN_DELAY;
    CFGMGMTADDR_delay <= CFGMGMTADDR after IN_DELAY;
    CFGMGMTBYTEENABLE_delay <= CFGMGMTBYTEENABLE after IN_DELAY;
    CFGMGMTREAD_delay <= CFGMGMTREAD after IN_DELAY;
    CFGMGMTTYPE1CFGREGACCESS_delay <= CFGMGMTTYPE1CFGREGACCESS after IN_DELAY;
    CFGMGMTWRITEDATA_delay <= CFGMGMTWRITEDATA after IN_DELAY;
    CFGMGMTWRITE_delay <= CFGMGMTWRITE after IN_DELAY;
    CFGMSGTRANSMITDATA_delay <= CFGMSGTRANSMITDATA after IN_DELAY;
    CFGMSGTRANSMITTYPE_delay <= CFGMSGTRANSMITTYPE after IN_DELAY;
    CFGMSGTRANSMIT_delay <= CFGMSGTRANSMIT after IN_DELAY;
    CFGPERFUNCSTATUSCONTROL_delay <= CFGPERFUNCSTATUSCONTROL after IN_DELAY;
    CFGPERFUNCTIONNUMBER_delay <= CFGPERFUNCTIONNUMBER after IN_DELAY;
    CFGPERFUNCTIONOUTPUTREQUEST_delay <= CFGPERFUNCTIONOUTPUTREQUEST after IN_DELAY;
    CFGPOWERSTATECHANGEACK_delay <= CFGPOWERSTATECHANGEACK after IN_DELAY;
    CFGREQPMTRANSITIONL23READY_delay <= CFGREQPMTRANSITIONL23READY after IN_DELAY;
    CFGREVID_delay <= CFGREVID after IN_DELAY;
    CFGSUBSYSID_delay <= CFGSUBSYSID after IN_DELAY;
    CFGSUBSYSVENDID_delay <= CFGSUBSYSVENDID after IN_DELAY;
    CFGTPHSTTREADDATAVALID_delay <= CFGTPHSTTREADDATAVALID after IN_DELAY;
    CFGTPHSTTREADDATA_delay <= CFGTPHSTTREADDATA after IN_DELAY;
    CFGVENDID_delay <= CFGVENDID after IN_DELAY;
    CFGVFFLRDONE_delay <= CFGVFFLRDONE after IN_DELAY;
    CONFMCAPREQUESTBYCONF_delay <= CONFMCAPREQUESTBYCONF after IN_DELAY;
    CONFREQDATA_delay <= CONFREQDATA after IN_DELAY;
    CONFREQREGNUM_delay <= CONFREQREGNUM after IN_DELAY;
    CONFREQTYPE_delay <= CONFREQTYPE after IN_DELAY;
    CONFREQVALID_delay <= CONFREQVALID after IN_DELAY;
    DBGCFGLOCALMGMTREGOVERRIDE_delay <= DBGCFGLOCALMGMTREGOVERRIDE after IN_DELAY;
    DBGDATASEL_delay <= DBGDATASEL after IN_DELAY;
    DRPADDR_delay <= DRPADDR after IN_DELAY;
    DRPDI_delay <= DRPDI after IN_DELAY;
    DRPEN_delay <= DRPEN after IN_DELAY;
    DRPWE_delay <= DRPWE after IN_DELAY;
    LL2LMSAXISTXTUSER_delay <= LL2LMSAXISTXTUSER after IN_DELAY;
    LL2LMSAXISTXTVALID_delay <= LL2LMSAXISTXTVALID after IN_DELAY;
    LL2LMTXTLPID0_delay <= LL2LMTXTLPID0 after IN_DELAY;
    LL2LMTXTLPID1_delay <= LL2LMTXTLPID1 after IN_DELAY;
    MAXISCQTREADY_delay <= MAXISCQTREADY after IN_DELAY;
    MAXISRCTREADY_delay <= MAXISRCTREADY after IN_DELAY;
    MCAPPERST0B_delay <= MCAPPERST0B after IN_DELAY;
    MCAPPERST1B_delay <= MCAPPERST1B after IN_DELAY;
    MGMTRESETN_delay <= MGMTRESETN after IN_DELAY;
    MGMTSTICKYRESETN_delay <= MGMTSTICKYRESETN after IN_DELAY;
    MICOMPLETIONRAMREADDATA_delay <= MICOMPLETIONRAMREADDATA after IN_DELAY;
    MIREPLAYRAMREADDATA_delay <= MIREPLAYRAMREADDATA after IN_DELAY;
    MIREQUESTRAMREADDATA_delay <= MIREQUESTRAMREADDATA after IN_DELAY;
    PCIECQNPREQ_delay <= PCIECQNPREQ after IN_DELAY;
    PIPEEQFS_delay <= PIPEEQFS after IN_DELAY;
    PIPEEQLF_delay <= PIPEEQLF after IN_DELAY;
    PIPERESETN_delay <= PIPERESETN after IN_DELAY;
    PIPERX0CHARISK_delay <= PIPERX0CHARISK after IN_DELAY;
    PIPERX0DATAVALID_delay <= PIPERX0DATAVALID after IN_DELAY;
    PIPERX0DATA_delay <= PIPERX0DATA after IN_DELAY;
    PIPERX0ELECIDLE_delay <= PIPERX0ELECIDLE after IN_DELAY;
    PIPERX0EQDONE_delay <= PIPERX0EQDONE after IN_DELAY;
    PIPERX0EQLPADAPTDONE_delay <= PIPERX0EQLPADAPTDONE after IN_DELAY;
    PIPERX0EQLPLFFSSEL_delay <= PIPERX0EQLPLFFSSEL after IN_DELAY;
    PIPERX0EQLPNEWTXCOEFFORPRESET_delay <= PIPERX0EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX0PHYSTATUS_delay <= PIPERX0PHYSTATUS after IN_DELAY;
    PIPERX0STARTBLOCK_delay <= PIPERX0STARTBLOCK after IN_DELAY;
    PIPERX0STATUS_delay <= PIPERX0STATUS after IN_DELAY;
    PIPERX0SYNCHEADER_delay <= PIPERX0SYNCHEADER after IN_DELAY;
    PIPERX0VALID_delay <= PIPERX0VALID after IN_DELAY;
    PIPERX1CHARISK_delay <= PIPERX1CHARISK after IN_DELAY;
    PIPERX1DATAVALID_delay <= PIPERX1DATAVALID after IN_DELAY;
    PIPERX1DATA_delay <= PIPERX1DATA after IN_DELAY;
    PIPERX1ELECIDLE_delay <= PIPERX1ELECIDLE after IN_DELAY;
    PIPERX1EQDONE_delay <= PIPERX1EQDONE after IN_DELAY;
    PIPERX1EQLPADAPTDONE_delay <= PIPERX1EQLPADAPTDONE after IN_DELAY;
    PIPERX1EQLPLFFSSEL_delay <= PIPERX1EQLPLFFSSEL after IN_DELAY;
    PIPERX1EQLPNEWTXCOEFFORPRESET_delay <= PIPERX1EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX1PHYSTATUS_delay <= PIPERX1PHYSTATUS after IN_DELAY;
    PIPERX1STARTBLOCK_delay <= PIPERX1STARTBLOCK after IN_DELAY;
    PIPERX1STATUS_delay <= PIPERX1STATUS after IN_DELAY;
    PIPERX1SYNCHEADER_delay <= PIPERX1SYNCHEADER after IN_DELAY;
    PIPERX1VALID_delay <= PIPERX1VALID after IN_DELAY;
    PIPERX2CHARISK_delay <= PIPERX2CHARISK after IN_DELAY;
    PIPERX2DATAVALID_delay <= PIPERX2DATAVALID after IN_DELAY;
    PIPERX2DATA_delay <= PIPERX2DATA after IN_DELAY;
    PIPERX2ELECIDLE_delay <= PIPERX2ELECIDLE after IN_DELAY;
    PIPERX2EQDONE_delay <= PIPERX2EQDONE after IN_DELAY;
    PIPERX2EQLPADAPTDONE_delay <= PIPERX2EQLPADAPTDONE after IN_DELAY;
    PIPERX2EQLPLFFSSEL_delay <= PIPERX2EQLPLFFSSEL after IN_DELAY;
    PIPERX2EQLPNEWTXCOEFFORPRESET_delay <= PIPERX2EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX2PHYSTATUS_delay <= PIPERX2PHYSTATUS after IN_DELAY;
    PIPERX2STARTBLOCK_delay <= PIPERX2STARTBLOCK after IN_DELAY;
    PIPERX2STATUS_delay <= PIPERX2STATUS after IN_DELAY;
    PIPERX2SYNCHEADER_delay <= PIPERX2SYNCHEADER after IN_DELAY;
    PIPERX2VALID_delay <= PIPERX2VALID after IN_DELAY;
    PIPERX3CHARISK_delay <= PIPERX3CHARISK after IN_DELAY;
    PIPERX3DATAVALID_delay <= PIPERX3DATAVALID after IN_DELAY;
    PIPERX3DATA_delay <= PIPERX3DATA after IN_DELAY;
    PIPERX3ELECIDLE_delay <= PIPERX3ELECIDLE after IN_DELAY;
    PIPERX3EQDONE_delay <= PIPERX3EQDONE after IN_DELAY;
    PIPERX3EQLPADAPTDONE_delay <= PIPERX3EQLPADAPTDONE after IN_DELAY;
    PIPERX3EQLPLFFSSEL_delay <= PIPERX3EQLPLFFSSEL after IN_DELAY;
    PIPERX3EQLPNEWTXCOEFFORPRESET_delay <= PIPERX3EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX3PHYSTATUS_delay <= PIPERX3PHYSTATUS after IN_DELAY;
    PIPERX3STARTBLOCK_delay <= PIPERX3STARTBLOCK after IN_DELAY;
    PIPERX3STATUS_delay <= PIPERX3STATUS after IN_DELAY;
    PIPERX3SYNCHEADER_delay <= PIPERX3SYNCHEADER after IN_DELAY;
    PIPERX3VALID_delay <= PIPERX3VALID after IN_DELAY;
    PIPERX4CHARISK_delay <= PIPERX4CHARISK after IN_DELAY;
    PIPERX4DATAVALID_delay <= PIPERX4DATAVALID after IN_DELAY;
    PIPERX4DATA_delay <= PIPERX4DATA after IN_DELAY;
    PIPERX4ELECIDLE_delay <= PIPERX4ELECIDLE after IN_DELAY;
    PIPERX4EQDONE_delay <= PIPERX4EQDONE after IN_DELAY;
    PIPERX4EQLPADAPTDONE_delay <= PIPERX4EQLPADAPTDONE after IN_DELAY;
    PIPERX4EQLPLFFSSEL_delay <= PIPERX4EQLPLFFSSEL after IN_DELAY;
    PIPERX4EQLPNEWTXCOEFFORPRESET_delay <= PIPERX4EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX4PHYSTATUS_delay <= PIPERX4PHYSTATUS after IN_DELAY;
    PIPERX4STARTBLOCK_delay <= PIPERX4STARTBLOCK after IN_DELAY;
    PIPERX4STATUS_delay <= PIPERX4STATUS after IN_DELAY;
    PIPERX4SYNCHEADER_delay <= PIPERX4SYNCHEADER after IN_DELAY;
    PIPERX4VALID_delay <= PIPERX4VALID after IN_DELAY;
    PIPERX5CHARISK_delay <= PIPERX5CHARISK after IN_DELAY;
    PIPERX5DATAVALID_delay <= PIPERX5DATAVALID after IN_DELAY;
    PIPERX5DATA_delay <= PIPERX5DATA after IN_DELAY;
    PIPERX5ELECIDLE_delay <= PIPERX5ELECIDLE after IN_DELAY;
    PIPERX5EQDONE_delay <= PIPERX5EQDONE after IN_DELAY;
    PIPERX5EQLPADAPTDONE_delay <= PIPERX5EQLPADAPTDONE after IN_DELAY;
    PIPERX5EQLPLFFSSEL_delay <= PIPERX5EQLPLFFSSEL after IN_DELAY;
    PIPERX5EQLPNEWTXCOEFFORPRESET_delay <= PIPERX5EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX5PHYSTATUS_delay <= PIPERX5PHYSTATUS after IN_DELAY;
    PIPERX5STARTBLOCK_delay <= PIPERX5STARTBLOCK after IN_DELAY;
    PIPERX5STATUS_delay <= PIPERX5STATUS after IN_DELAY;
    PIPERX5SYNCHEADER_delay <= PIPERX5SYNCHEADER after IN_DELAY;
    PIPERX5VALID_delay <= PIPERX5VALID after IN_DELAY;
    PIPERX6CHARISK_delay <= PIPERX6CHARISK after IN_DELAY;
    PIPERX6DATAVALID_delay <= PIPERX6DATAVALID after IN_DELAY;
    PIPERX6DATA_delay <= PIPERX6DATA after IN_DELAY;
    PIPERX6ELECIDLE_delay <= PIPERX6ELECIDLE after IN_DELAY;
    PIPERX6EQDONE_delay <= PIPERX6EQDONE after IN_DELAY;
    PIPERX6EQLPADAPTDONE_delay <= PIPERX6EQLPADAPTDONE after IN_DELAY;
    PIPERX6EQLPLFFSSEL_delay <= PIPERX6EQLPLFFSSEL after IN_DELAY;
    PIPERX6EQLPNEWTXCOEFFORPRESET_delay <= PIPERX6EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX6PHYSTATUS_delay <= PIPERX6PHYSTATUS after IN_DELAY;
    PIPERX6STARTBLOCK_delay <= PIPERX6STARTBLOCK after IN_DELAY;
    PIPERX6STATUS_delay <= PIPERX6STATUS after IN_DELAY;
    PIPERX6SYNCHEADER_delay <= PIPERX6SYNCHEADER after IN_DELAY;
    PIPERX6VALID_delay <= PIPERX6VALID after IN_DELAY;
    PIPERX7CHARISK_delay <= PIPERX7CHARISK after IN_DELAY;
    PIPERX7DATAVALID_delay <= PIPERX7DATAVALID after IN_DELAY;
    PIPERX7DATA_delay <= PIPERX7DATA after IN_DELAY;
    PIPERX7ELECIDLE_delay <= PIPERX7ELECIDLE after IN_DELAY;
    PIPERX7EQDONE_delay <= PIPERX7EQDONE after IN_DELAY;
    PIPERX7EQLPADAPTDONE_delay <= PIPERX7EQLPADAPTDONE after IN_DELAY;
    PIPERX7EQLPLFFSSEL_delay <= PIPERX7EQLPLFFSSEL after IN_DELAY;
    PIPERX7EQLPNEWTXCOEFFORPRESET_delay <= PIPERX7EQLPNEWTXCOEFFORPRESET after IN_DELAY;
    PIPERX7PHYSTATUS_delay <= PIPERX7PHYSTATUS after IN_DELAY;
    PIPERX7STARTBLOCK_delay <= PIPERX7STARTBLOCK after IN_DELAY;
    PIPERX7STATUS_delay <= PIPERX7STATUS after IN_DELAY;
    PIPERX7SYNCHEADER_delay <= PIPERX7SYNCHEADER after IN_DELAY;
    PIPERX7VALID_delay <= PIPERX7VALID after IN_DELAY;
    PIPETX0EQCOEFF_delay <= PIPETX0EQCOEFF after IN_DELAY;
    PIPETX0EQDONE_delay <= PIPETX0EQDONE after IN_DELAY;
    PIPETX1EQCOEFF_delay <= PIPETX1EQCOEFF after IN_DELAY;
    PIPETX1EQDONE_delay <= PIPETX1EQDONE after IN_DELAY;
    PIPETX2EQCOEFF_delay <= PIPETX2EQCOEFF after IN_DELAY;
    PIPETX2EQDONE_delay <= PIPETX2EQDONE after IN_DELAY;
    PIPETX3EQCOEFF_delay <= PIPETX3EQCOEFF after IN_DELAY;
    PIPETX3EQDONE_delay <= PIPETX3EQDONE after IN_DELAY;
    PIPETX4EQCOEFF_delay <= PIPETX4EQCOEFF after IN_DELAY;
    PIPETX4EQDONE_delay <= PIPETX4EQDONE after IN_DELAY;
    PIPETX5EQCOEFF_delay <= PIPETX5EQCOEFF after IN_DELAY;
    PIPETX5EQDONE_delay <= PIPETX5EQDONE after IN_DELAY;
    PIPETX6EQCOEFF_delay <= PIPETX6EQCOEFF after IN_DELAY;
    PIPETX6EQDONE_delay <= PIPETX6EQDONE after IN_DELAY;
    PIPETX7EQCOEFF_delay <= PIPETX7EQCOEFF after IN_DELAY;
    PIPETX7EQDONE_delay <= PIPETX7EQDONE after IN_DELAY;
    PLEQRESETEIEOSCOUNT_delay <= PLEQRESETEIEOSCOUNT after IN_DELAY;
    PLGEN2UPSTREAMPREFERDEEMPH_delay <= PLGEN2UPSTREAMPREFERDEEMPH after IN_DELAY;
    RESETN_delay <= RESETN after IN_DELAY;
    SAXISCCTDATA_delay <= SAXISCCTDATA after IN_DELAY;
    SAXISCCTKEEP_delay <= SAXISCCTKEEP after IN_DELAY;
    SAXISCCTLAST_delay <= SAXISCCTLAST after IN_DELAY;
    SAXISCCTUSER_delay <= SAXISCCTUSER after IN_DELAY;
    SAXISCCTVALID_delay <= SAXISCCTVALID after IN_DELAY;
    SAXISRQTDATA_delay <= SAXISRQTDATA after IN_DELAY;
    SAXISRQTKEEP_delay <= SAXISRQTKEEP after IN_DELAY;
    SAXISRQTLAST_delay <= SAXISRQTLAST after IN_DELAY;
    SAXISRQTUSER_delay <= SAXISRQTUSER after IN_DELAY;
    SAXISRQTVALID_delay <= SAXISRQTVALID after IN_DELAY;
    SPAREIN_delay <= SPAREIN after IN_DELAY;
    
    CFGCONFIGSPACEENABLE_in <= CFGCONFIGSPACEENABLE_delay;
    CFGDEVID_in <= CFGDEVID_delay;
    CFGDSBUSNUMBER_in <= CFGDSBUSNUMBER_delay;
    CFGDSDEVICENUMBER_in <= CFGDSDEVICENUMBER_delay;
    CFGDSFUNCTIONNUMBER_in <= CFGDSFUNCTIONNUMBER_delay;
    CFGDSN_in <= CFGDSN_delay;
    CFGDSPORTNUMBER_in <= CFGDSPORTNUMBER_delay;
    CFGERRCORIN_in <= CFGERRCORIN_delay;
    CFGERRUNCORIN_in <= CFGERRUNCORIN_delay;
    CFGEXTREADDATAVALID_in <= CFGEXTREADDATAVALID_delay;
    CFGEXTREADDATA_in <= CFGEXTREADDATA_delay;
    CFGFCSEL_in <= CFGFCSEL_delay;
    CFGFLRDONE_in <= CFGFLRDONE_delay;
    CFGHOTRESETIN_in <= CFGHOTRESETIN_delay;
    CFGINTERRUPTINT_in <= CFGINTERRUPTINT_delay;
    CFGINTERRUPTMSIATTR_in <= CFGINTERRUPTMSIATTR_delay;
    CFGINTERRUPTMSIFUNCTIONNUMBER_in <= CFGINTERRUPTMSIFUNCTIONNUMBER_delay;
    CFGINTERRUPTMSIINT_in <= CFGINTERRUPTMSIINT_delay;
    CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE_in <= CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE_delay;
    CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM_in <= CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM_delay;
    CFGINTERRUPTMSIPENDINGSTATUS_in <= CFGINTERRUPTMSIPENDINGSTATUS_delay;
    CFGINTERRUPTMSISELECT_in <= CFGINTERRUPTMSISELECT_delay;
    CFGINTERRUPTMSITPHPRESENT_in <= CFGINTERRUPTMSITPHPRESENT_delay;
    CFGINTERRUPTMSITPHSTTAG_in <= CFGINTERRUPTMSITPHSTTAG_delay;
    CFGINTERRUPTMSITPHTYPE_in <= CFGINTERRUPTMSITPHTYPE_delay;
    CFGINTERRUPTMSIXADDRESS_in <= CFGINTERRUPTMSIXADDRESS_delay;
    CFGINTERRUPTMSIXDATA_in <= CFGINTERRUPTMSIXDATA_delay;
    CFGINTERRUPTMSIXINT_in <= CFGINTERRUPTMSIXINT_delay;
    CFGINTERRUPTPENDING_in <= CFGINTERRUPTPENDING_delay;
    CFGLINKTRAININGENABLE_in <= CFGLINKTRAININGENABLE_delay;
    CFGMGMTADDR_in <= CFGMGMTADDR_delay;
    CFGMGMTBYTEENABLE_in <= CFGMGMTBYTEENABLE_delay;
    CFGMGMTREAD_in <= CFGMGMTREAD_delay;
    CFGMGMTTYPE1CFGREGACCESS_in <= CFGMGMTTYPE1CFGREGACCESS_delay;
    CFGMGMTWRITEDATA_in <= CFGMGMTWRITEDATA_delay;
    CFGMGMTWRITE_in <= CFGMGMTWRITE_delay;
    CFGMSGTRANSMITDATA_in <= CFGMSGTRANSMITDATA_delay;
    CFGMSGTRANSMITTYPE_in <= CFGMSGTRANSMITTYPE_delay;
    CFGMSGTRANSMIT_in <= CFGMSGTRANSMIT_delay;
    CFGPERFUNCSTATUSCONTROL_in <= CFGPERFUNCSTATUSCONTROL_delay;
    CFGPERFUNCTIONNUMBER_in <= CFGPERFUNCTIONNUMBER_delay;
    CFGPERFUNCTIONOUTPUTREQUEST_in <= CFGPERFUNCTIONOUTPUTREQUEST_delay;
    CFGPOWERSTATECHANGEACK_in <= CFGPOWERSTATECHANGEACK_delay;
    CFGREQPMTRANSITIONL23READY_in <= CFGREQPMTRANSITIONL23READY_delay;
    CFGREVID_in <= CFGREVID_delay;
    CFGSUBSYSID_in <= CFGSUBSYSID_delay;
    CFGSUBSYSVENDID_in <= CFGSUBSYSVENDID_delay;
    CFGTPHSTTREADDATAVALID_in <= CFGTPHSTTREADDATAVALID_delay;
    CFGTPHSTTREADDATA_in <= CFGTPHSTTREADDATA_delay;
    CFGVENDID_in <= CFGVENDID_delay;
    CFGVFFLRDONE_in <= CFGVFFLRDONE_delay;
    CONFMCAPREQUESTBYCONF_in <= CONFMCAPREQUESTBYCONF_delay;
    CONFREQDATA_in <= CONFREQDATA_delay;
    CONFREQREGNUM_in <= CONFREQREGNUM_delay;
    CONFREQTYPE_in <= CONFREQTYPE_delay;
    CONFREQVALID_in <= CONFREQVALID_delay;
    CORECLKMICOMPLETIONRAML_in <= CORECLKMICOMPLETIONRAML_delay;
    CORECLKMICOMPLETIONRAMU_in <= CORECLKMICOMPLETIONRAMU_delay;
    CORECLKMIREPLAYRAM_in <= CORECLKMIREPLAYRAM_delay;
    CORECLKMIREQUESTRAM_in <= CORECLKMIREQUESTRAM_delay;
    CORECLK_in <= CORECLK_delay;
    DBGCFGLOCALMGMTREGOVERRIDE_in <= DBGCFGLOCALMGMTREGOVERRIDE_delay;
    DBGDATASEL_in <= DBGDATASEL_delay;
    DRPADDR_in <= DRPADDR_delay;
    DRPCLK_in <= DRPCLK_delay;
    DRPDI_in <= DRPDI_delay;
    DRPEN_in <= DRPEN_delay;
    DRPWE_in <= DRPWE_delay;
    LL2LMSAXISTXTUSER_in <= LL2LMSAXISTXTUSER_delay;
    LL2LMSAXISTXTVALID_in <= LL2LMSAXISTXTVALID_delay;
    LL2LMTXTLPID0_in <= LL2LMTXTLPID0_delay;
    LL2LMTXTLPID1_in <= LL2LMTXTLPID1_delay;
    MAXISCQTREADY_in <= MAXISCQTREADY_delay;
    MAXISRCTREADY_in <= MAXISRCTREADY_delay;
    MCAPCLK_in <= MCAPCLK_delay;
    MCAPPERST0B_in <= MCAPPERST0B_delay;
    MCAPPERST1B_in <= MCAPPERST1B_delay;
    MGMTRESETN_in <= MGMTRESETN_delay;
    MGMTSTICKYRESETN_in <= MGMTSTICKYRESETN_delay;
    MICOMPLETIONRAMREADDATA_in <= MICOMPLETIONRAMREADDATA_delay;
    MIREPLAYRAMREADDATA_in <= MIREPLAYRAMREADDATA_delay;
    MIREQUESTRAMREADDATA_in <= MIREQUESTRAMREADDATA_delay;
    PCIECQNPREQ_in <= PCIECQNPREQ_delay;
    PIPECLK_in <= PIPECLK_delay;
    PIPEEQFS_in <= PIPEEQFS_delay;
    PIPEEQLF_in <= PIPEEQLF_delay;
    PIPERESETN_in <= PIPERESETN_delay;
    PIPERX0CHARISK_in <= PIPERX0CHARISK_delay;
    PIPERX0DATAVALID_in <= PIPERX0DATAVALID_delay;
    PIPERX0DATA_in <= PIPERX0DATA_delay;
    PIPERX0ELECIDLE_in <= PIPERX0ELECIDLE_delay;
    PIPERX0EQDONE_in <= PIPERX0EQDONE_delay;
    PIPERX0EQLPADAPTDONE_in <= PIPERX0EQLPADAPTDONE_delay;
    PIPERX0EQLPLFFSSEL_in <= PIPERX0EQLPLFFSSEL_delay;
    PIPERX0EQLPNEWTXCOEFFORPRESET_in <= PIPERX0EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX0PHYSTATUS_in <= PIPERX0PHYSTATUS_delay;
    PIPERX0STARTBLOCK_in <= PIPERX0STARTBLOCK_delay;
    PIPERX0STATUS_in <= PIPERX0STATUS_delay;
    PIPERX0SYNCHEADER_in <= PIPERX0SYNCHEADER_delay;
    PIPERX0VALID_in <= PIPERX0VALID_delay;
    PIPERX1CHARISK_in <= PIPERX1CHARISK_delay;
    PIPERX1DATAVALID_in <= PIPERX1DATAVALID_delay;
    PIPERX1DATA_in <= PIPERX1DATA_delay;
    PIPERX1ELECIDLE_in <= PIPERX1ELECIDLE_delay;
    PIPERX1EQDONE_in <= PIPERX1EQDONE_delay;
    PIPERX1EQLPADAPTDONE_in <= PIPERX1EQLPADAPTDONE_delay;
    PIPERX1EQLPLFFSSEL_in <= PIPERX1EQLPLFFSSEL_delay;
    PIPERX1EQLPNEWTXCOEFFORPRESET_in <= PIPERX1EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX1PHYSTATUS_in <= PIPERX1PHYSTATUS_delay;
    PIPERX1STARTBLOCK_in <= PIPERX1STARTBLOCK_delay;
    PIPERX1STATUS_in <= PIPERX1STATUS_delay;
    PIPERX1SYNCHEADER_in <= PIPERX1SYNCHEADER_delay;
    PIPERX1VALID_in <= PIPERX1VALID_delay;
    PIPERX2CHARISK_in <= PIPERX2CHARISK_delay;
    PIPERX2DATAVALID_in <= PIPERX2DATAVALID_delay;
    PIPERX2DATA_in <= PIPERX2DATA_delay;
    PIPERX2ELECIDLE_in <= PIPERX2ELECIDLE_delay;
    PIPERX2EQDONE_in <= PIPERX2EQDONE_delay;
    PIPERX2EQLPADAPTDONE_in <= PIPERX2EQLPADAPTDONE_delay;
    PIPERX2EQLPLFFSSEL_in <= PIPERX2EQLPLFFSSEL_delay;
    PIPERX2EQLPNEWTXCOEFFORPRESET_in <= PIPERX2EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX2PHYSTATUS_in <= PIPERX2PHYSTATUS_delay;
    PIPERX2STARTBLOCK_in <= PIPERX2STARTBLOCK_delay;
    PIPERX2STATUS_in <= PIPERX2STATUS_delay;
    PIPERX2SYNCHEADER_in <= PIPERX2SYNCHEADER_delay;
    PIPERX2VALID_in <= PIPERX2VALID_delay;
    PIPERX3CHARISK_in <= PIPERX3CHARISK_delay;
    PIPERX3DATAVALID_in <= PIPERX3DATAVALID_delay;
    PIPERX3DATA_in <= PIPERX3DATA_delay;
    PIPERX3ELECIDLE_in <= PIPERX3ELECIDLE_delay;
    PIPERX3EQDONE_in <= PIPERX3EQDONE_delay;
    PIPERX3EQLPADAPTDONE_in <= PIPERX3EQLPADAPTDONE_delay;
    PIPERX3EQLPLFFSSEL_in <= PIPERX3EQLPLFFSSEL_delay;
    PIPERX3EQLPNEWTXCOEFFORPRESET_in <= PIPERX3EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX3PHYSTATUS_in <= PIPERX3PHYSTATUS_delay;
    PIPERX3STARTBLOCK_in <= PIPERX3STARTBLOCK_delay;
    PIPERX3STATUS_in <= PIPERX3STATUS_delay;
    PIPERX3SYNCHEADER_in <= PIPERX3SYNCHEADER_delay;
    PIPERX3VALID_in <= PIPERX3VALID_delay;
    PIPERX4CHARISK_in <= PIPERX4CHARISK_delay;
    PIPERX4DATAVALID_in <= PIPERX4DATAVALID_delay;
    PIPERX4DATA_in <= PIPERX4DATA_delay;
    PIPERX4ELECIDLE_in <= PIPERX4ELECIDLE_delay;
    PIPERX4EQDONE_in <= PIPERX4EQDONE_delay;
    PIPERX4EQLPADAPTDONE_in <= PIPERX4EQLPADAPTDONE_delay;
    PIPERX4EQLPLFFSSEL_in <= PIPERX4EQLPLFFSSEL_delay;
    PIPERX4EQLPNEWTXCOEFFORPRESET_in <= PIPERX4EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX4PHYSTATUS_in <= PIPERX4PHYSTATUS_delay;
    PIPERX4STARTBLOCK_in <= PIPERX4STARTBLOCK_delay;
    PIPERX4STATUS_in <= PIPERX4STATUS_delay;
    PIPERX4SYNCHEADER_in <= PIPERX4SYNCHEADER_delay;
    PIPERX4VALID_in <= PIPERX4VALID_delay;
    PIPERX5CHARISK_in <= PIPERX5CHARISK_delay;
    PIPERX5DATAVALID_in <= PIPERX5DATAVALID_delay;
    PIPERX5DATA_in <= PIPERX5DATA_delay;
    PIPERX5ELECIDLE_in <= PIPERX5ELECIDLE_delay;
    PIPERX5EQDONE_in <= PIPERX5EQDONE_delay;
    PIPERX5EQLPADAPTDONE_in <= PIPERX5EQLPADAPTDONE_delay;
    PIPERX5EQLPLFFSSEL_in <= PIPERX5EQLPLFFSSEL_delay;
    PIPERX5EQLPNEWTXCOEFFORPRESET_in <= PIPERX5EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX5PHYSTATUS_in <= PIPERX5PHYSTATUS_delay;
    PIPERX5STARTBLOCK_in <= PIPERX5STARTBLOCK_delay;
    PIPERX5STATUS_in <= PIPERX5STATUS_delay;
    PIPERX5SYNCHEADER_in <= PIPERX5SYNCHEADER_delay;
    PIPERX5VALID_in <= PIPERX5VALID_delay;
    PIPERX6CHARISK_in <= PIPERX6CHARISK_delay;
    PIPERX6DATAVALID_in <= PIPERX6DATAVALID_delay;
    PIPERX6DATA_in <= PIPERX6DATA_delay;
    PIPERX6ELECIDLE_in <= PIPERX6ELECIDLE_delay;
    PIPERX6EQDONE_in <= PIPERX6EQDONE_delay;
    PIPERX6EQLPADAPTDONE_in <= PIPERX6EQLPADAPTDONE_delay;
    PIPERX6EQLPLFFSSEL_in <= PIPERX6EQLPLFFSSEL_delay;
    PIPERX6EQLPNEWTXCOEFFORPRESET_in <= PIPERX6EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX6PHYSTATUS_in <= PIPERX6PHYSTATUS_delay;
    PIPERX6STARTBLOCK_in <= PIPERX6STARTBLOCK_delay;
    PIPERX6STATUS_in <= PIPERX6STATUS_delay;
    PIPERX6SYNCHEADER_in <= PIPERX6SYNCHEADER_delay;
    PIPERX6VALID_in <= PIPERX6VALID_delay;
    PIPERX7CHARISK_in <= PIPERX7CHARISK_delay;
    PIPERX7DATAVALID_in <= PIPERX7DATAVALID_delay;
    PIPERX7DATA_in <= PIPERX7DATA_delay;
    PIPERX7ELECIDLE_in <= PIPERX7ELECIDLE_delay;
    PIPERX7EQDONE_in <= PIPERX7EQDONE_delay;
    PIPERX7EQLPADAPTDONE_in <= PIPERX7EQLPADAPTDONE_delay;
    PIPERX7EQLPLFFSSEL_in <= PIPERX7EQLPLFFSSEL_delay;
    PIPERX7EQLPNEWTXCOEFFORPRESET_in <= PIPERX7EQLPNEWTXCOEFFORPRESET_delay;
    PIPERX7PHYSTATUS_in <= PIPERX7PHYSTATUS_delay;
    PIPERX7STARTBLOCK_in <= PIPERX7STARTBLOCK_delay;
    PIPERX7STATUS_in <= PIPERX7STATUS_delay;
    PIPERX7SYNCHEADER_in <= PIPERX7SYNCHEADER_delay;
    PIPERX7VALID_in <= PIPERX7VALID_delay;
    PIPETX0EQCOEFF_in <= PIPETX0EQCOEFF_delay;
    PIPETX0EQDONE_in <= PIPETX0EQDONE_delay;
    PIPETX1EQCOEFF_in <= PIPETX1EQCOEFF_delay;
    PIPETX1EQDONE_in <= PIPETX1EQDONE_delay;
    PIPETX2EQCOEFF_in <= PIPETX2EQCOEFF_delay;
    PIPETX2EQDONE_in <= PIPETX2EQDONE_delay;
    PIPETX3EQCOEFF_in <= PIPETX3EQCOEFF_delay;
    PIPETX3EQDONE_in <= PIPETX3EQDONE_delay;
    PIPETX4EQCOEFF_in <= PIPETX4EQCOEFF_delay;
    PIPETX4EQDONE_in <= PIPETX4EQDONE_delay;
    PIPETX5EQCOEFF_in <= PIPETX5EQCOEFF_delay;
    PIPETX5EQDONE_in <= PIPETX5EQDONE_delay;
    PIPETX6EQCOEFF_in <= PIPETX6EQCOEFF_delay;
    PIPETX6EQDONE_in <= PIPETX6EQDONE_delay;
    PIPETX7EQCOEFF_in <= PIPETX7EQCOEFF_delay;
    PIPETX7EQDONE_in <= PIPETX7EQDONE_delay;
    PLEQRESETEIEOSCOUNT_in <= PLEQRESETEIEOSCOUNT_delay;
    PLGEN2UPSTREAMPREFERDEEMPH_in <= PLGEN2UPSTREAMPREFERDEEMPH_delay;
    RESETN_in <= RESETN_delay;
    SAXISCCTDATA_in <= SAXISCCTDATA_delay;
    SAXISCCTKEEP_in <= SAXISCCTKEEP_delay;
    SAXISCCTLAST_in <= SAXISCCTLAST_delay;
    SAXISCCTUSER_in <= SAXISCCTUSER_delay;
    SAXISCCTVALID_in <= SAXISCCTVALID_delay;
    SAXISRQTDATA_in <= SAXISRQTDATA_delay;
    SAXISRQTKEEP_in <= SAXISRQTKEEP_delay;
    SAXISRQTLAST_in <= SAXISRQTLAST_delay;
    SAXISRQTUSER_in <= SAXISRQTUSER_delay;
    SAXISRQTVALID_in <= SAXISRQTVALID_delay;
    SPAREIN_in <= SPAREIN_delay;
    USERCLK_in <= USERCLK_delay;
    

    XILUNCONNCLK_in <= "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off

    PMVDIVIDE_in <= "11"; -- tie off
    PMVENABLEN_in <= '1'; -- tie off
    PMVSELECT_in <= "111"; -- tie off
    SCANENABLEN_in <= '1'; -- tie off
    SCANIN_in <= "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
    SCANMODEN_in <= '1'; -- tie off
    XILUNCONNBYP_in <= "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
    XILUNCONNIN_in <= "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
    
    PCIE_3_1_INST : SIP_PCIE_3_1
      generic map (
        MCAP_ENABLE_PAR => MCAP_ENABLE,
        SIM_JTAG_IDCODE => SIM_JTAG_IDCODE
      )
      port map (
        ARI_CAP_ENABLE       => ARI_CAP_ENABLE_REG,
        AXISTEN_IF_CC_ALIGNMENT_MODE => AXISTEN_IF_CC_ALIGNMENT_MODE_REG,
        AXISTEN_IF_CC_PARITY_CHK => AXISTEN_IF_CC_PARITY_CHK_REG,
        AXISTEN_IF_CQ_ALIGNMENT_MODE => AXISTEN_IF_CQ_ALIGNMENT_MODE_REG,
        AXISTEN_IF_ENABLE_CLIENT_TAG => AXISTEN_IF_ENABLE_CLIENT_TAG_REG,
        AXISTEN_IF_ENABLE_MSG_ROUTE => AXISTEN_IF_ENABLE_MSG_ROUTE_REG,
        AXISTEN_IF_ENABLE_RX_MSG_INTFC => AXISTEN_IF_ENABLE_RX_MSG_INTFC_REG,
        AXISTEN_IF_RC_ALIGNMENT_MODE => AXISTEN_IF_RC_ALIGNMENT_MODE_REG,
        AXISTEN_IF_RC_STRADDLE => AXISTEN_IF_RC_STRADDLE_REG,
        AXISTEN_IF_RQ_ALIGNMENT_MODE => AXISTEN_IF_RQ_ALIGNMENT_MODE_REG,
        AXISTEN_IF_RQ_PARITY_CHK => AXISTEN_IF_RQ_PARITY_CHK_REG,
        AXISTEN_IF_WIDTH     => AXISTEN_IF_WIDTH_REG,
        CRM_CORE_CLK_FREQ_500 => CRM_CORE_CLK_FREQ_500_REG,
        CRM_USER_CLK_FREQ    => CRM_USER_CLK_FREQ_REG,
        DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE => DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE_REG,
        DEBUG_PL_DISABLE_EI_INFER_IN_L0 => DEBUG_PL_DISABLE_EI_INFER_IN_L0_REG,
        DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS => DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS_REG,
        DNSTREAM_LINK_NUM    => DNSTREAM_LINK_NUM_REG,
        LL_ACK_TIMEOUT       => LL_ACK_TIMEOUT_REG,
        LL_ACK_TIMEOUT_EN    => LL_ACK_TIMEOUT_EN_REG,
        LL_ACK_TIMEOUT_FUNC  => LL_ACK_TIMEOUT_FUNC_REG,
        LL_CPL_FC_UPDATE_TIMER => LL_CPL_FC_UPDATE_TIMER_REG,
        LL_CPL_FC_UPDATE_TIMER_OVERRIDE => LL_CPL_FC_UPDATE_TIMER_OVERRIDE_REG,
        LL_FC_UPDATE_TIMER   => LL_FC_UPDATE_TIMER_REG,
        LL_FC_UPDATE_TIMER_OVERRIDE => LL_FC_UPDATE_TIMER_OVERRIDE_REG,
        LL_NP_FC_UPDATE_TIMER => LL_NP_FC_UPDATE_TIMER_REG,
        LL_NP_FC_UPDATE_TIMER_OVERRIDE => LL_NP_FC_UPDATE_TIMER_OVERRIDE_REG,
        LL_P_FC_UPDATE_TIMER => LL_P_FC_UPDATE_TIMER_REG,
        LL_P_FC_UPDATE_TIMER_OVERRIDE => LL_P_FC_UPDATE_TIMER_OVERRIDE_REG,
        LL_REPLAY_TIMEOUT    => LL_REPLAY_TIMEOUT_REG,
        LL_REPLAY_TIMEOUT_EN => LL_REPLAY_TIMEOUT_EN_REG,
        LL_REPLAY_TIMEOUT_FUNC => LL_REPLAY_TIMEOUT_FUNC_REG,
        LTR_TX_MESSAGE_MINIMUM_INTERVAL => LTR_TX_MESSAGE_MINIMUM_INTERVAL_REG,
        LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE => LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE_REG,
        LTR_TX_MESSAGE_ON_LTR_ENABLE => LTR_TX_MESSAGE_ON_LTR_ENABLE_REG,
        MCAP_CAP_NEXTPTR     => MCAP_CAP_NEXTPTR_REG,
        MCAP_CONFIGURE_OVERRIDE => MCAP_CONFIGURE_OVERRIDE_REG,
        MCAP_ENABLE          => MCAP_ENABLE_REG,
        MCAP_EOS_DESIGN_SWITCH => MCAP_EOS_DESIGN_SWITCH_REG,
        MCAP_FPGA_BITSTREAM_VERSION => MCAP_FPGA_BITSTREAM_VERSION_REG,
        MCAP_GATE_IO_ENABLE_DESIGN_SWITCH => MCAP_GATE_IO_ENABLE_DESIGN_SWITCH_REG,
        MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH => MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH_REG,
        MCAP_INPUT_GATE_DESIGN_SWITCH => MCAP_INPUT_GATE_DESIGN_SWITCH_REG,
        MCAP_INTERRUPT_ON_MCAP_EOS => MCAP_INTERRUPT_ON_MCAP_EOS_REG,
        MCAP_INTERRUPT_ON_MCAP_ERROR => MCAP_INTERRUPT_ON_MCAP_ERROR_REG,
        MCAP_VSEC_ID         => MCAP_VSEC_ID_REG,
        MCAP_VSEC_LEN        => MCAP_VSEC_LEN_REG,
        MCAP_VSEC_REV        => MCAP_VSEC_REV_REG,
        PF0_AER_CAP_ECRC_CHECK_CAPABLE => PF0_AER_CAP_ECRC_CHECK_CAPABLE_REG,
        PF0_AER_CAP_ECRC_GEN_CAPABLE => PF0_AER_CAP_ECRC_GEN_CAPABLE_REG,
        PF0_AER_CAP_NEXTPTR  => PF0_AER_CAP_NEXTPTR_REG,
        PF0_ARI_CAP_NEXTPTR  => PF0_ARI_CAP_NEXTPTR_REG,
        PF0_ARI_CAP_NEXT_FUNC => PF0_ARI_CAP_NEXT_FUNC_REG,
        PF0_ARI_CAP_VER      => PF0_ARI_CAP_VER_REG,
        PF0_BAR0_APERTURE_SIZE => PF0_BAR0_APERTURE_SIZE_REG,
        PF0_BAR0_CONTROL     => PF0_BAR0_CONTROL_REG,
        PF0_BAR1_APERTURE_SIZE => PF0_BAR1_APERTURE_SIZE_REG,
        PF0_BAR1_CONTROL     => PF0_BAR1_CONTROL_REG,
        PF0_BAR2_APERTURE_SIZE => PF0_BAR2_APERTURE_SIZE_REG,
        PF0_BAR2_CONTROL     => PF0_BAR2_CONTROL_REG,
        PF0_BAR3_APERTURE_SIZE => PF0_BAR3_APERTURE_SIZE_REG,
        PF0_BAR3_CONTROL     => PF0_BAR3_CONTROL_REG,
        PF0_BAR4_APERTURE_SIZE => PF0_BAR4_APERTURE_SIZE_REG,
        PF0_BAR4_CONTROL     => PF0_BAR4_CONTROL_REG,
        PF0_BAR5_APERTURE_SIZE => PF0_BAR5_APERTURE_SIZE_REG,
        PF0_BAR5_CONTROL     => PF0_BAR5_CONTROL_REG,
        PF0_BIST_REGISTER    => PF0_BIST_REGISTER_REG,
        PF0_CAPABILITY_POINTER => PF0_CAPABILITY_POINTER_REG,
        PF0_CLASS_CODE       => PF0_CLASS_CODE_REG,
        PF0_DEVICE_ID        => PF0_DEVICE_ID_REG,
        PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT => PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT_REG,
        PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT => PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT_REG,
        PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT => PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT_REG,
        PF0_DEV_CAP2_ARI_FORWARD_ENABLE => PF0_DEV_CAP2_ARI_FORWARD_ENABLE_REG,
        PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE => PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE_REG,
        PF0_DEV_CAP2_LTR_SUPPORT => PF0_DEV_CAP2_LTR_SUPPORT_REG,
        PF0_DEV_CAP2_OBFF_SUPPORT => PF0_DEV_CAP2_OBFF_SUPPORT_REG,
        PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT => PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT_REG,
        PF0_DEV_CAP_ENDPOINT_L0S_LATENCY => PF0_DEV_CAP_ENDPOINT_L0S_LATENCY_REG,
        PF0_DEV_CAP_ENDPOINT_L1_LATENCY => PF0_DEV_CAP_ENDPOINT_L1_LATENCY_REG,
        PF0_DEV_CAP_EXT_TAG_SUPPORTED => PF0_DEV_CAP_EXT_TAG_SUPPORTED_REG,
        PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE => PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE_REG,
        PF0_DEV_CAP_MAX_PAYLOAD_SIZE => PF0_DEV_CAP_MAX_PAYLOAD_SIZE_REG,
        PF0_DPA_CAP_NEXTPTR  => PF0_DPA_CAP_NEXTPTR_REG,
        PF0_DPA_CAP_SUB_STATE_CONTROL => PF0_DPA_CAP_SUB_STATE_CONTROL_REG,
        PF0_DPA_CAP_SUB_STATE_CONTROL_EN => PF0_DPA_CAP_SUB_STATE_CONTROL_EN_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG,
        PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 => PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG,
        PF0_DPA_CAP_VER      => PF0_DPA_CAP_VER_REG,
        PF0_DSN_CAP_NEXTPTR  => PF0_DSN_CAP_NEXTPTR_REG,
        PF0_EXPANSION_ROM_APERTURE_SIZE => PF0_EXPANSION_ROM_APERTURE_SIZE_REG,
        PF0_EXPANSION_ROM_ENABLE => PF0_EXPANSION_ROM_ENABLE_REG,
        PF0_INTERRUPT_LINE   => PF0_INTERRUPT_LINE_REG,
        PF0_INTERRUPT_PIN    => PF0_INTERRUPT_PIN_REG,
        PF0_LINK_CAP_ASPM_SUPPORT => PF0_LINK_CAP_ASPM_SUPPORT_REG,
        PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 => PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1_REG,
        PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 => PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2_REG,
        PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3 => PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3_REG,
        PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1 => PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1_REG,
        PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2 => PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2_REG,
        PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3 => PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3_REG,
        PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 => PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1_REG,
        PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 => PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2_REG,
        PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3 => PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3_REG,
        PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1 => PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1_REG,
        PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2 => PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2_REG,
        PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3 => PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3_REG,
        PF0_LINK_STATUS_SLOT_CLOCK_CONFIG => PF0_LINK_STATUS_SLOT_CLOCK_CONFIG_REG,
        PF0_LTR_CAP_MAX_NOSNOOP_LAT => PF0_LTR_CAP_MAX_NOSNOOP_LAT_REG,
        PF0_LTR_CAP_MAX_SNOOP_LAT => PF0_LTR_CAP_MAX_SNOOP_LAT_REG,
        PF0_LTR_CAP_NEXTPTR  => PF0_LTR_CAP_NEXTPTR_REG,
        PF0_LTR_CAP_VER      => PF0_LTR_CAP_VER_REG,
        PF0_MSIX_CAP_NEXTPTR => PF0_MSIX_CAP_NEXTPTR_REG,
        PF0_MSIX_CAP_PBA_BIR => PF0_MSIX_CAP_PBA_BIR_REG,
        PF0_MSIX_CAP_PBA_OFFSET => PF0_MSIX_CAP_PBA_OFFSET_REG,
        PF0_MSIX_CAP_TABLE_BIR => PF0_MSIX_CAP_TABLE_BIR_REG,
        PF0_MSIX_CAP_TABLE_OFFSET => PF0_MSIX_CAP_TABLE_OFFSET_REG,
        PF0_MSIX_CAP_TABLE_SIZE => PF0_MSIX_CAP_TABLE_SIZE_REG,
        PF0_MSI_CAP_MULTIMSGCAP => PF0_MSI_CAP_MULTIMSGCAP_REG,
        PF0_MSI_CAP_NEXTPTR  => PF0_MSI_CAP_NEXTPTR_REG,
        PF0_MSI_CAP_PERVECMASKCAP => PF0_MSI_CAP_PERVECMASKCAP_REG,
        PF0_PB_CAP_DATA_REG_D0 => PF0_PB_CAP_DATA_REG_D0_REG,
        PF0_PB_CAP_DATA_REG_D0_SUSTAINED => PF0_PB_CAP_DATA_REG_D0_SUSTAINED_REG,
        PF0_PB_CAP_DATA_REG_D1 => PF0_PB_CAP_DATA_REG_D1_REG,
        PF0_PB_CAP_DATA_REG_D3HOT => PF0_PB_CAP_DATA_REG_D3HOT_REG,
        PF0_PB_CAP_NEXTPTR   => PF0_PB_CAP_NEXTPTR_REG,
        PF0_PB_CAP_SYSTEM_ALLOCATED => PF0_PB_CAP_SYSTEM_ALLOCATED_REG,
        PF0_PB_CAP_VER       => PF0_PB_CAP_VER_REG,
        PF0_PM_CAP_ID        => PF0_PM_CAP_ID_REG,
        PF0_PM_CAP_NEXTPTR   => PF0_PM_CAP_NEXTPTR_REG,
        PF0_PM_CAP_PMESUPPORT_D0 => PF0_PM_CAP_PMESUPPORT_D0_REG,
        PF0_PM_CAP_PMESUPPORT_D1 => PF0_PM_CAP_PMESUPPORT_D1_REG,
        PF0_PM_CAP_PMESUPPORT_D3HOT => PF0_PM_CAP_PMESUPPORT_D3HOT_REG,
        PF0_PM_CAP_SUPP_D1_STATE => PF0_PM_CAP_SUPP_D1_STATE_REG,
        PF0_PM_CAP_VER_ID    => PF0_PM_CAP_VER_ID_REG,
        PF0_PM_CSR_NOSOFTRESET => PF0_PM_CSR_NOSOFTRESET_REG,
        PF0_RBAR_CAP_ENABLE  => PF0_RBAR_CAP_ENABLE_REG,
        PF0_RBAR_CAP_NEXTPTR => PF0_RBAR_CAP_NEXTPTR_REG,
        PF0_RBAR_CAP_SIZE0   => PF0_RBAR_CAP_SIZE0_REG,
        PF0_RBAR_CAP_SIZE1   => PF0_RBAR_CAP_SIZE1_REG,
        PF0_RBAR_CAP_SIZE2   => PF0_RBAR_CAP_SIZE2_REG,
        PF0_RBAR_CAP_VER     => PF0_RBAR_CAP_VER_REG,
        PF0_RBAR_CONTROL_INDEX0 => PF0_RBAR_CONTROL_INDEX0_REG,
        PF0_RBAR_CONTROL_INDEX1 => PF0_RBAR_CONTROL_INDEX1_REG,
        PF0_RBAR_CONTROL_INDEX2 => PF0_RBAR_CONTROL_INDEX2_REG,
        PF0_RBAR_CONTROL_SIZE0 => PF0_RBAR_CONTROL_SIZE0_REG,
        PF0_RBAR_CONTROL_SIZE1 => PF0_RBAR_CONTROL_SIZE1_REG,
        PF0_RBAR_CONTROL_SIZE2 => PF0_RBAR_CONTROL_SIZE2_REG,
        PF0_RBAR_NUM         => PF0_RBAR_NUM_REG,
        PF0_REVISION_ID      => PF0_REVISION_ID_REG,
        PF0_SECONDARY_PCIE_CAP_NEXTPTR => PF0_SECONDARY_PCIE_CAP_NEXTPTR_REG,
        PF0_SRIOV_BAR0_APERTURE_SIZE => PF0_SRIOV_BAR0_APERTURE_SIZE_REG,
        PF0_SRIOV_BAR0_CONTROL => PF0_SRIOV_BAR0_CONTROL_REG,
        PF0_SRIOV_BAR1_APERTURE_SIZE => PF0_SRIOV_BAR1_APERTURE_SIZE_REG,
        PF0_SRIOV_BAR1_CONTROL => PF0_SRIOV_BAR1_CONTROL_REG,
        PF0_SRIOV_BAR2_APERTURE_SIZE => PF0_SRIOV_BAR2_APERTURE_SIZE_REG,
        PF0_SRIOV_BAR2_CONTROL => PF0_SRIOV_BAR2_CONTROL_REG,
        PF0_SRIOV_BAR3_APERTURE_SIZE => PF0_SRIOV_BAR3_APERTURE_SIZE_REG,
        PF0_SRIOV_BAR3_CONTROL => PF0_SRIOV_BAR3_CONTROL_REG,
        PF0_SRIOV_BAR4_APERTURE_SIZE => PF0_SRIOV_BAR4_APERTURE_SIZE_REG,
        PF0_SRIOV_BAR4_CONTROL => PF0_SRIOV_BAR4_CONTROL_REG,
        PF0_SRIOV_BAR5_APERTURE_SIZE => PF0_SRIOV_BAR5_APERTURE_SIZE_REG,
        PF0_SRIOV_BAR5_CONTROL => PF0_SRIOV_BAR5_CONTROL_REG,
        PF0_SRIOV_CAP_INITIAL_VF => PF0_SRIOV_CAP_INITIAL_VF_REG,
        PF0_SRIOV_CAP_NEXTPTR => PF0_SRIOV_CAP_NEXTPTR_REG,
        PF0_SRIOV_CAP_TOTAL_VF => PF0_SRIOV_CAP_TOTAL_VF_REG,
        PF0_SRIOV_CAP_VER    => PF0_SRIOV_CAP_VER_REG,
        PF0_SRIOV_FIRST_VF_OFFSET => PF0_SRIOV_FIRST_VF_OFFSET_REG,
        PF0_SRIOV_FUNC_DEP_LINK => PF0_SRIOV_FUNC_DEP_LINK_REG,
        PF0_SRIOV_SUPPORTED_PAGE_SIZE => PF0_SRIOV_SUPPORTED_PAGE_SIZE_REG,
        PF0_SRIOV_VF_DEVICE_ID => PF0_SRIOV_VF_DEVICE_ID_REG,
        PF0_SUBSYSTEM_ID     => PF0_SUBSYSTEM_ID_REG,
        PF0_TPHR_CAP_DEV_SPECIFIC_MODE => PF0_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        PF0_TPHR_CAP_ENABLE  => PF0_TPHR_CAP_ENABLE_REG,
        PF0_TPHR_CAP_INT_VEC_MODE => PF0_TPHR_CAP_INT_VEC_MODE_REG,
        PF0_TPHR_CAP_NEXTPTR => PF0_TPHR_CAP_NEXTPTR_REG,
        PF0_TPHR_CAP_ST_MODE_SEL => PF0_TPHR_CAP_ST_MODE_SEL_REG,
        PF0_TPHR_CAP_ST_TABLE_LOC => PF0_TPHR_CAP_ST_TABLE_LOC_REG,
        PF0_TPHR_CAP_ST_TABLE_SIZE => PF0_TPHR_CAP_ST_TABLE_SIZE_REG,
        PF0_TPHR_CAP_VER     => PF0_TPHR_CAP_VER_REG,
        PF0_VC_CAP_ENABLE    => PF0_VC_CAP_ENABLE_REG,
        PF0_VC_CAP_NEXTPTR   => PF0_VC_CAP_NEXTPTR_REG,
        PF0_VC_CAP_VER       => PF0_VC_CAP_VER_REG,
        PF1_AER_CAP_ECRC_CHECK_CAPABLE => PF1_AER_CAP_ECRC_CHECK_CAPABLE_REG,
        PF1_AER_CAP_ECRC_GEN_CAPABLE => PF1_AER_CAP_ECRC_GEN_CAPABLE_REG,
        PF1_AER_CAP_NEXTPTR  => PF1_AER_CAP_NEXTPTR_REG,
        PF1_ARI_CAP_NEXTPTR  => PF1_ARI_CAP_NEXTPTR_REG,
        PF1_ARI_CAP_NEXT_FUNC => PF1_ARI_CAP_NEXT_FUNC_REG,
        PF1_BAR0_APERTURE_SIZE => PF1_BAR0_APERTURE_SIZE_REG,
        PF1_BAR0_CONTROL     => PF1_BAR0_CONTROL_REG,
        PF1_BAR1_APERTURE_SIZE => PF1_BAR1_APERTURE_SIZE_REG,
        PF1_BAR1_CONTROL     => PF1_BAR1_CONTROL_REG,
        PF1_BAR2_APERTURE_SIZE => PF1_BAR2_APERTURE_SIZE_REG,
        PF1_BAR2_CONTROL     => PF1_BAR2_CONTROL_REG,
        PF1_BAR3_APERTURE_SIZE => PF1_BAR3_APERTURE_SIZE_REG,
        PF1_BAR3_CONTROL     => PF1_BAR3_CONTROL_REG,
        PF1_BAR4_APERTURE_SIZE => PF1_BAR4_APERTURE_SIZE_REG,
        PF1_BAR4_CONTROL     => PF1_BAR4_CONTROL_REG,
        PF1_BAR5_APERTURE_SIZE => PF1_BAR5_APERTURE_SIZE_REG,
        PF1_BAR5_CONTROL     => PF1_BAR5_CONTROL_REG,
        PF1_BIST_REGISTER    => PF1_BIST_REGISTER_REG,
        PF1_CAPABILITY_POINTER => PF1_CAPABILITY_POINTER_REG,
        PF1_CLASS_CODE       => PF1_CLASS_CODE_REG,
        PF1_DEVICE_ID        => PF1_DEVICE_ID_REG,
        PF1_DEV_CAP_MAX_PAYLOAD_SIZE => PF1_DEV_CAP_MAX_PAYLOAD_SIZE_REG,
        PF1_DPA_CAP_NEXTPTR  => PF1_DPA_CAP_NEXTPTR_REG,
        PF1_DPA_CAP_SUB_STATE_CONTROL => PF1_DPA_CAP_SUB_STATE_CONTROL_REG,
        PF1_DPA_CAP_SUB_STATE_CONTROL_EN => PF1_DPA_CAP_SUB_STATE_CONTROL_EN_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG,
        PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 => PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG,
        PF1_DPA_CAP_VER      => PF1_DPA_CAP_VER_REG,
        PF1_DSN_CAP_NEXTPTR  => PF1_DSN_CAP_NEXTPTR_REG,
        PF1_EXPANSION_ROM_APERTURE_SIZE => PF1_EXPANSION_ROM_APERTURE_SIZE_REG,
        PF1_EXPANSION_ROM_ENABLE => PF1_EXPANSION_ROM_ENABLE_REG,
        PF1_INTERRUPT_LINE   => PF1_INTERRUPT_LINE_REG,
        PF1_INTERRUPT_PIN    => PF1_INTERRUPT_PIN_REG,
        PF1_MSIX_CAP_NEXTPTR => PF1_MSIX_CAP_NEXTPTR_REG,
        PF1_MSIX_CAP_PBA_BIR => PF1_MSIX_CAP_PBA_BIR_REG,
        PF1_MSIX_CAP_PBA_OFFSET => PF1_MSIX_CAP_PBA_OFFSET_REG,
        PF1_MSIX_CAP_TABLE_BIR => PF1_MSIX_CAP_TABLE_BIR_REG,
        PF1_MSIX_CAP_TABLE_OFFSET => PF1_MSIX_CAP_TABLE_OFFSET_REG,
        PF1_MSIX_CAP_TABLE_SIZE => PF1_MSIX_CAP_TABLE_SIZE_REG,
        PF1_MSI_CAP_MULTIMSGCAP => PF1_MSI_CAP_MULTIMSGCAP_REG,
        PF1_MSI_CAP_NEXTPTR  => PF1_MSI_CAP_NEXTPTR_REG,
        PF1_MSI_CAP_PERVECMASKCAP => PF1_MSI_CAP_PERVECMASKCAP_REG,
        PF1_PB_CAP_DATA_REG_D0 => PF1_PB_CAP_DATA_REG_D0_REG,
        PF1_PB_CAP_DATA_REG_D0_SUSTAINED => PF1_PB_CAP_DATA_REG_D0_SUSTAINED_REG,
        PF1_PB_CAP_DATA_REG_D1 => PF1_PB_CAP_DATA_REG_D1_REG,
        PF1_PB_CAP_DATA_REG_D3HOT => PF1_PB_CAP_DATA_REG_D3HOT_REG,
        PF1_PB_CAP_NEXTPTR   => PF1_PB_CAP_NEXTPTR_REG,
        PF1_PB_CAP_SYSTEM_ALLOCATED => PF1_PB_CAP_SYSTEM_ALLOCATED_REG,
        PF1_PB_CAP_VER       => PF1_PB_CAP_VER_REG,
        PF1_PM_CAP_ID        => PF1_PM_CAP_ID_REG,
        PF1_PM_CAP_NEXTPTR   => PF1_PM_CAP_NEXTPTR_REG,
        PF1_PM_CAP_VER_ID    => PF1_PM_CAP_VER_ID_REG,
        PF1_RBAR_CAP_ENABLE  => PF1_RBAR_CAP_ENABLE_REG,
        PF1_RBAR_CAP_NEXTPTR => PF1_RBAR_CAP_NEXTPTR_REG,
        PF1_RBAR_CAP_SIZE0   => PF1_RBAR_CAP_SIZE0_REG,
        PF1_RBAR_CAP_SIZE1   => PF1_RBAR_CAP_SIZE1_REG,
        PF1_RBAR_CAP_SIZE2   => PF1_RBAR_CAP_SIZE2_REG,
        PF1_RBAR_CAP_VER     => PF1_RBAR_CAP_VER_REG,
        PF1_RBAR_CONTROL_INDEX0 => PF1_RBAR_CONTROL_INDEX0_REG,
        PF1_RBAR_CONTROL_INDEX1 => PF1_RBAR_CONTROL_INDEX1_REG,
        PF1_RBAR_CONTROL_INDEX2 => PF1_RBAR_CONTROL_INDEX2_REG,
        PF1_RBAR_CONTROL_SIZE0 => PF1_RBAR_CONTROL_SIZE0_REG,
        PF1_RBAR_CONTROL_SIZE1 => PF1_RBAR_CONTROL_SIZE1_REG,
        PF1_RBAR_CONTROL_SIZE2 => PF1_RBAR_CONTROL_SIZE2_REG,
        PF1_RBAR_NUM         => PF1_RBAR_NUM_REG,
        PF1_REVISION_ID      => PF1_REVISION_ID_REG,
        PF1_SRIOV_BAR0_APERTURE_SIZE => PF1_SRIOV_BAR0_APERTURE_SIZE_REG,
        PF1_SRIOV_BAR0_CONTROL => PF1_SRIOV_BAR0_CONTROL_REG,
        PF1_SRIOV_BAR1_APERTURE_SIZE => PF1_SRIOV_BAR1_APERTURE_SIZE_REG,
        PF1_SRIOV_BAR1_CONTROL => PF1_SRIOV_BAR1_CONTROL_REG,
        PF1_SRIOV_BAR2_APERTURE_SIZE => PF1_SRIOV_BAR2_APERTURE_SIZE_REG,
        PF1_SRIOV_BAR2_CONTROL => PF1_SRIOV_BAR2_CONTROL_REG,
        PF1_SRIOV_BAR3_APERTURE_SIZE => PF1_SRIOV_BAR3_APERTURE_SIZE_REG,
        PF1_SRIOV_BAR3_CONTROL => PF1_SRIOV_BAR3_CONTROL_REG,
        PF1_SRIOV_BAR4_APERTURE_SIZE => PF1_SRIOV_BAR4_APERTURE_SIZE_REG,
        PF1_SRIOV_BAR4_CONTROL => PF1_SRIOV_BAR4_CONTROL_REG,
        PF1_SRIOV_BAR5_APERTURE_SIZE => PF1_SRIOV_BAR5_APERTURE_SIZE_REG,
        PF1_SRIOV_BAR5_CONTROL => PF1_SRIOV_BAR5_CONTROL_REG,
        PF1_SRIOV_CAP_INITIAL_VF => PF1_SRIOV_CAP_INITIAL_VF_REG,
        PF1_SRIOV_CAP_NEXTPTR => PF1_SRIOV_CAP_NEXTPTR_REG,
        PF1_SRIOV_CAP_TOTAL_VF => PF1_SRIOV_CAP_TOTAL_VF_REG,
        PF1_SRIOV_CAP_VER    => PF1_SRIOV_CAP_VER_REG,
        PF1_SRIOV_FIRST_VF_OFFSET => PF1_SRIOV_FIRST_VF_OFFSET_REG,
        PF1_SRIOV_FUNC_DEP_LINK => PF1_SRIOV_FUNC_DEP_LINK_REG,
        PF1_SRIOV_SUPPORTED_PAGE_SIZE => PF1_SRIOV_SUPPORTED_PAGE_SIZE_REG,
        PF1_SRIOV_VF_DEVICE_ID => PF1_SRIOV_VF_DEVICE_ID_REG,
        PF1_SUBSYSTEM_ID     => PF1_SUBSYSTEM_ID_REG,
        PF1_TPHR_CAP_DEV_SPECIFIC_MODE => PF1_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        PF1_TPHR_CAP_ENABLE  => PF1_TPHR_CAP_ENABLE_REG,
        PF1_TPHR_CAP_INT_VEC_MODE => PF1_TPHR_CAP_INT_VEC_MODE_REG,
        PF1_TPHR_CAP_NEXTPTR => PF1_TPHR_CAP_NEXTPTR_REG,
        PF1_TPHR_CAP_ST_MODE_SEL => PF1_TPHR_CAP_ST_MODE_SEL_REG,
        PF1_TPHR_CAP_ST_TABLE_LOC => PF1_TPHR_CAP_ST_TABLE_LOC_REG,
        PF1_TPHR_CAP_ST_TABLE_SIZE => PF1_TPHR_CAP_ST_TABLE_SIZE_REG,
        PF1_TPHR_CAP_VER     => PF1_TPHR_CAP_VER_REG,
        PF2_AER_CAP_ECRC_CHECK_CAPABLE => PF2_AER_CAP_ECRC_CHECK_CAPABLE_REG,
        PF2_AER_CAP_ECRC_GEN_CAPABLE => PF2_AER_CAP_ECRC_GEN_CAPABLE_REG,
        PF2_AER_CAP_NEXTPTR  => PF2_AER_CAP_NEXTPTR_REG,
        PF2_ARI_CAP_NEXTPTR  => PF2_ARI_CAP_NEXTPTR_REG,
        PF2_ARI_CAP_NEXT_FUNC => PF2_ARI_CAP_NEXT_FUNC_REG,
        PF2_BAR0_APERTURE_SIZE => PF2_BAR0_APERTURE_SIZE_REG,
        PF2_BAR0_CONTROL     => PF2_BAR0_CONTROL_REG,
        PF2_BAR1_APERTURE_SIZE => PF2_BAR1_APERTURE_SIZE_REG,
        PF2_BAR1_CONTROL     => PF2_BAR1_CONTROL_REG,
        PF2_BAR2_APERTURE_SIZE => PF2_BAR2_APERTURE_SIZE_REG,
        PF2_BAR2_CONTROL     => PF2_BAR2_CONTROL_REG,
        PF2_BAR3_APERTURE_SIZE => PF2_BAR3_APERTURE_SIZE_REG,
        PF2_BAR3_CONTROL     => PF2_BAR3_CONTROL_REG,
        PF2_BAR4_APERTURE_SIZE => PF2_BAR4_APERTURE_SIZE_REG,
        PF2_BAR4_CONTROL     => PF2_BAR4_CONTROL_REG,
        PF2_BAR5_APERTURE_SIZE => PF2_BAR5_APERTURE_SIZE_REG,
        PF2_BAR5_CONTROL     => PF2_BAR5_CONTROL_REG,
        PF2_BIST_REGISTER    => PF2_BIST_REGISTER_REG,
        PF2_CAPABILITY_POINTER => PF2_CAPABILITY_POINTER_REG,
        PF2_CLASS_CODE       => PF2_CLASS_CODE_REG,
        PF2_DEVICE_ID        => PF2_DEVICE_ID_REG,
        PF2_DEV_CAP_MAX_PAYLOAD_SIZE => PF2_DEV_CAP_MAX_PAYLOAD_SIZE_REG,
        PF2_DPA_CAP_NEXTPTR  => PF2_DPA_CAP_NEXTPTR_REG,
        PF2_DPA_CAP_SUB_STATE_CONTROL => PF2_DPA_CAP_SUB_STATE_CONTROL_REG,
        PF2_DPA_CAP_SUB_STATE_CONTROL_EN => PF2_DPA_CAP_SUB_STATE_CONTROL_EN_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG,
        PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 => PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG,
        PF2_DPA_CAP_VER      => PF2_DPA_CAP_VER_REG,
        PF2_DSN_CAP_NEXTPTR  => PF2_DSN_CAP_NEXTPTR_REG,
        PF2_EXPANSION_ROM_APERTURE_SIZE => PF2_EXPANSION_ROM_APERTURE_SIZE_REG,
        PF2_EXPANSION_ROM_ENABLE => PF2_EXPANSION_ROM_ENABLE_REG,
        PF2_INTERRUPT_LINE   => PF2_INTERRUPT_LINE_REG,
        PF2_INTERRUPT_PIN    => PF2_INTERRUPT_PIN_REG,
        PF2_MSIX_CAP_NEXTPTR => PF2_MSIX_CAP_NEXTPTR_REG,
        PF2_MSIX_CAP_PBA_BIR => PF2_MSIX_CAP_PBA_BIR_REG,
        PF2_MSIX_CAP_PBA_OFFSET => PF2_MSIX_CAP_PBA_OFFSET_REG,
        PF2_MSIX_CAP_TABLE_BIR => PF2_MSIX_CAP_TABLE_BIR_REG,
        PF2_MSIX_CAP_TABLE_OFFSET => PF2_MSIX_CAP_TABLE_OFFSET_REG,
        PF2_MSIX_CAP_TABLE_SIZE => PF2_MSIX_CAP_TABLE_SIZE_REG,
        PF2_MSI_CAP_MULTIMSGCAP => PF2_MSI_CAP_MULTIMSGCAP_REG,
        PF2_MSI_CAP_NEXTPTR  => PF2_MSI_CAP_NEXTPTR_REG,
        PF2_MSI_CAP_PERVECMASKCAP => PF2_MSI_CAP_PERVECMASKCAP_REG,
        PF2_PB_CAP_DATA_REG_D0 => PF2_PB_CAP_DATA_REG_D0_REG,
        PF2_PB_CAP_DATA_REG_D0_SUSTAINED => PF2_PB_CAP_DATA_REG_D0_SUSTAINED_REG,
        PF2_PB_CAP_DATA_REG_D1 => PF2_PB_CAP_DATA_REG_D1_REG,
        PF2_PB_CAP_DATA_REG_D3HOT => PF2_PB_CAP_DATA_REG_D3HOT_REG,
        PF2_PB_CAP_NEXTPTR   => PF2_PB_CAP_NEXTPTR_REG,
        PF2_PB_CAP_SYSTEM_ALLOCATED => PF2_PB_CAP_SYSTEM_ALLOCATED_REG,
        PF2_PB_CAP_VER       => PF2_PB_CAP_VER_REG,
        PF2_PM_CAP_ID        => PF2_PM_CAP_ID_REG,
        PF2_PM_CAP_NEXTPTR   => PF2_PM_CAP_NEXTPTR_REG,
        PF2_PM_CAP_VER_ID    => PF2_PM_CAP_VER_ID_REG,
        PF2_RBAR_CAP_ENABLE  => PF2_RBAR_CAP_ENABLE_REG,
        PF2_RBAR_CAP_NEXTPTR => PF2_RBAR_CAP_NEXTPTR_REG,
        PF2_RBAR_CAP_SIZE0   => PF2_RBAR_CAP_SIZE0_REG,
        PF2_RBAR_CAP_SIZE1   => PF2_RBAR_CAP_SIZE1_REG,
        PF2_RBAR_CAP_SIZE2   => PF2_RBAR_CAP_SIZE2_REG,
        PF2_RBAR_CAP_VER     => PF2_RBAR_CAP_VER_REG,
        PF2_RBAR_CONTROL_INDEX0 => PF2_RBAR_CONTROL_INDEX0_REG,
        PF2_RBAR_CONTROL_INDEX1 => PF2_RBAR_CONTROL_INDEX1_REG,
        PF2_RBAR_CONTROL_INDEX2 => PF2_RBAR_CONTROL_INDEX2_REG,
        PF2_RBAR_CONTROL_SIZE0 => PF2_RBAR_CONTROL_SIZE0_REG,
        PF2_RBAR_CONTROL_SIZE1 => PF2_RBAR_CONTROL_SIZE1_REG,
        PF2_RBAR_CONTROL_SIZE2 => PF2_RBAR_CONTROL_SIZE2_REG,
        PF2_RBAR_NUM         => PF2_RBAR_NUM_REG,
        PF2_REVISION_ID      => PF2_REVISION_ID_REG,
        PF2_SRIOV_BAR0_APERTURE_SIZE => PF2_SRIOV_BAR0_APERTURE_SIZE_REG,
        PF2_SRIOV_BAR0_CONTROL => PF2_SRIOV_BAR0_CONTROL_REG,
        PF2_SRIOV_BAR1_APERTURE_SIZE => PF2_SRIOV_BAR1_APERTURE_SIZE_REG,
        PF2_SRIOV_BAR1_CONTROL => PF2_SRIOV_BAR1_CONTROL_REG,
        PF2_SRIOV_BAR2_APERTURE_SIZE => PF2_SRIOV_BAR2_APERTURE_SIZE_REG,
        PF2_SRIOV_BAR2_CONTROL => PF2_SRIOV_BAR2_CONTROL_REG,
        PF2_SRIOV_BAR3_APERTURE_SIZE => PF2_SRIOV_BAR3_APERTURE_SIZE_REG,
        PF2_SRIOV_BAR3_CONTROL => PF2_SRIOV_BAR3_CONTROL_REG,
        PF2_SRIOV_BAR4_APERTURE_SIZE => PF2_SRIOV_BAR4_APERTURE_SIZE_REG,
        PF2_SRIOV_BAR4_CONTROL => PF2_SRIOV_BAR4_CONTROL_REG,
        PF2_SRIOV_BAR5_APERTURE_SIZE => PF2_SRIOV_BAR5_APERTURE_SIZE_REG,
        PF2_SRIOV_BAR5_CONTROL => PF2_SRIOV_BAR5_CONTROL_REG,
        PF2_SRIOV_CAP_INITIAL_VF => PF2_SRIOV_CAP_INITIAL_VF_REG,
        PF2_SRIOV_CAP_NEXTPTR => PF2_SRIOV_CAP_NEXTPTR_REG,
        PF2_SRIOV_CAP_TOTAL_VF => PF2_SRIOV_CAP_TOTAL_VF_REG,
        PF2_SRIOV_CAP_VER    => PF2_SRIOV_CAP_VER_REG,
        PF2_SRIOV_FIRST_VF_OFFSET => PF2_SRIOV_FIRST_VF_OFFSET_REG,
        PF2_SRIOV_FUNC_DEP_LINK => PF2_SRIOV_FUNC_DEP_LINK_REG,
        PF2_SRIOV_SUPPORTED_PAGE_SIZE => PF2_SRIOV_SUPPORTED_PAGE_SIZE_REG,
        PF2_SRIOV_VF_DEVICE_ID => PF2_SRIOV_VF_DEVICE_ID_REG,
        PF2_SUBSYSTEM_ID     => PF2_SUBSYSTEM_ID_REG,
        PF2_TPHR_CAP_DEV_SPECIFIC_MODE => PF2_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        PF2_TPHR_CAP_ENABLE  => PF2_TPHR_CAP_ENABLE_REG,
        PF2_TPHR_CAP_INT_VEC_MODE => PF2_TPHR_CAP_INT_VEC_MODE_REG,
        PF2_TPHR_CAP_NEXTPTR => PF2_TPHR_CAP_NEXTPTR_REG,
        PF2_TPHR_CAP_ST_MODE_SEL => PF2_TPHR_CAP_ST_MODE_SEL_REG,
        PF2_TPHR_CAP_ST_TABLE_LOC => PF2_TPHR_CAP_ST_TABLE_LOC_REG,
        PF2_TPHR_CAP_ST_TABLE_SIZE => PF2_TPHR_CAP_ST_TABLE_SIZE_REG,
        PF2_TPHR_CAP_VER     => PF2_TPHR_CAP_VER_REG,
        PF3_AER_CAP_ECRC_CHECK_CAPABLE => PF3_AER_CAP_ECRC_CHECK_CAPABLE_REG,
        PF3_AER_CAP_ECRC_GEN_CAPABLE => PF3_AER_CAP_ECRC_GEN_CAPABLE_REG,
        PF3_AER_CAP_NEXTPTR  => PF3_AER_CAP_NEXTPTR_REG,
        PF3_ARI_CAP_NEXTPTR  => PF3_ARI_CAP_NEXTPTR_REG,
        PF3_ARI_CAP_NEXT_FUNC => PF3_ARI_CAP_NEXT_FUNC_REG,
        PF3_BAR0_APERTURE_SIZE => PF3_BAR0_APERTURE_SIZE_REG,
        PF3_BAR0_CONTROL     => PF3_BAR0_CONTROL_REG,
        PF3_BAR1_APERTURE_SIZE => PF3_BAR1_APERTURE_SIZE_REG,
        PF3_BAR1_CONTROL     => PF3_BAR1_CONTROL_REG,
        PF3_BAR2_APERTURE_SIZE => PF3_BAR2_APERTURE_SIZE_REG,
        PF3_BAR2_CONTROL     => PF3_BAR2_CONTROL_REG,
        PF3_BAR3_APERTURE_SIZE => PF3_BAR3_APERTURE_SIZE_REG,
        PF3_BAR3_CONTROL     => PF3_BAR3_CONTROL_REG,
        PF3_BAR4_APERTURE_SIZE => PF3_BAR4_APERTURE_SIZE_REG,
        PF3_BAR4_CONTROL     => PF3_BAR4_CONTROL_REG,
        PF3_BAR5_APERTURE_SIZE => PF3_BAR5_APERTURE_SIZE_REG,
        PF3_BAR5_CONTROL     => PF3_BAR5_CONTROL_REG,
        PF3_BIST_REGISTER    => PF3_BIST_REGISTER_REG,
        PF3_CAPABILITY_POINTER => PF3_CAPABILITY_POINTER_REG,
        PF3_CLASS_CODE       => PF3_CLASS_CODE_REG,
        PF3_DEVICE_ID        => PF3_DEVICE_ID_REG,
        PF3_DEV_CAP_MAX_PAYLOAD_SIZE => PF3_DEV_CAP_MAX_PAYLOAD_SIZE_REG,
        PF3_DPA_CAP_NEXTPTR  => PF3_DPA_CAP_NEXTPTR_REG,
        PF3_DPA_CAP_SUB_STATE_CONTROL => PF3_DPA_CAP_SUB_STATE_CONTROL_REG,
        PF3_DPA_CAP_SUB_STATE_CONTROL_EN => PF3_DPA_CAP_SUB_STATE_CONTROL_EN_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_REG,
        PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 => PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_REG,
        PF3_DPA_CAP_VER      => PF3_DPA_CAP_VER_REG,
        PF3_DSN_CAP_NEXTPTR  => PF3_DSN_CAP_NEXTPTR_REG,
        PF3_EXPANSION_ROM_APERTURE_SIZE => PF3_EXPANSION_ROM_APERTURE_SIZE_REG,
        PF3_EXPANSION_ROM_ENABLE => PF3_EXPANSION_ROM_ENABLE_REG,
        PF3_INTERRUPT_LINE   => PF3_INTERRUPT_LINE_REG,
        PF3_INTERRUPT_PIN    => PF3_INTERRUPT_PIN_REG,
        PF3_MSIX_CAP_NEXTPTR => PF3_MSIX_CAP_NEXTPTR_REG,
        PF3_MSIX_CAP_PBA_BIR => PF3_MSIX_CAP_PBA_BIR_REG,
        PF3_MSIX_CAP_PBA_OFFSET => PF3_MSIX_CAP_PBA_OFFSET_REG,
        PF3_MSIX_CAP_TABLE_BIR => PF3_MSIX_CAP_TABLE_BIR_REG,
        PF3_MSIX_CAP_TABLE_OFFSET => PF3_MSIX_CAP_TABLE_OFFSET_REG,
        PF3_MSIX_CAP_TABLE_SIZE => PF3_MSIX_CAP_TABLE_SIZE_REG,
        PF3_MSI_CAP_MULTIMSGCAP => PF3_MSI_CAP_MULTIMSGCAP_REG,
        PF3_MSI_CAP_NEXTPTR  => PF3_MSI_CAP_NEXTPTR_REG,
        PF3_MSI_CAP_PERVECMASKCAP => PF3_MSI_CAP_PERVECMASKCAP_REG,
        PF3_PB_CAP_DATA_REG_D0 => PF3_PB_CAP_DATA_REG_D0_REG,
        PF3_PB_CAP_DATA_REG_D0_SUSTAINED => PF3_PB_CAP_DATA_REG_D0_SUSTAINED_REG,
        PF3_PB_CAP_DATA_REG_D1 => PF3_PB_CAP_DATA_REG_D1_REG,
        PF3_PB_CAP_DATA_REG_D3HOT => PF3_PB_CAP_DATA_REG_D3HOT_REG,
        PF3_PB_CAP_NEXTPTR   => PF3_PB_CAP_NEXTPTR_REG,
        PF3_PB_CAP_SYSTEM_ALLOCATED => PF3_PB_CAP_SYSTEM_ALLOCATED_REG,
        PF3_PB_CAP_VER       => PF3_PB_CAP_VER_REG,
        PF3_PM_CAP_ID        => PF3_PM_CAP_ID_REG,
        PF3_PM_CAP_NEXTPTR   => PF3_PM_CAP_NEXTPTR_REG,
        PF3_PM_CAP_VER_ID    => PF3_PM_CAP_VER_ID_REG,
        PF3_RBAR_CAP_ENABLE  => PF3_RBAR_CAP_ENABLE_REG,
        PF3_RBAR_CAP_NEXTPTR => PF3_RBAR_CAP_NEXTPTR_REG,
        PF3_RBAR_CAP_SIZE0   => PF3_RBAR_CAP_SIZE0_REG,
        PF3_RBAR_CAP_SIZE1   => PF3_RBAR_CAP_SIZE1_REG,
        PF3_RBAR_CAP_SIZE2   => PF3_RBAR_CAP_SIZE2_REG,
        PF3_RBAR_CAP_VER     => PF3_RBAR_CAP_VER_REG,
        PF3_RBAR_CONTROL_INDEX0 => PF3_RBAR_CONTROL_INDEX0_REG,
        PF3_RBAR_CONTROL_INDEX1 => PF3_RBAR_CONTROL_INDEX1_REG,
        PF3_RBAR_CONTROL_INDEX2 => PF3_RBAR_CONTROL_INDEX2_REG,
        PF3_RBAR_CONTROL_SIZE0 => PF3_RBAR_CONTROL_SIZE0_REG,
        PF3_RBAR_CONTROL_SIZE1 => PF3_RBAR_CONTROL_SIZE1_REG,
        PF3_RBAR_CONTROL_SIZE2 => PF3_RBAR_CONTROL_SIZE2_REG,
        PF3_RBAR_NUM         => PF3_RBAR_NUM_REG,
        PF3_REVISION_ID      => PF3_REVISION_ID_REG,
        PF3_SRIOV_BAR0_APERTURE_SIZE => PF3_SRIOV_BAR0_APERTURE_SIZE_REG,
        PF3_SRIOV_BAR0_CONTROL => PF3_SRIOV_BAR0_CONTROL_REG,
        PF3_SRIOV_BAR1_APERTURE_SIZE => PF3_SRIOV_BAR1_APERTURE_SIZE_REG,
        PF3_SRIOV_BAR1_CONTROL => PF3_SRIOV_BAR1_CONTROL_REG,
        PF3_SRIOV_BAR2_APERTURE_SIZE => PF3_SRIOV_BAR2_APERTURE_SIZE_REG,
        PF3_SRIOV_BAR2_CONTROL => PF3_SRIOV_BAR2_CONTROL_REG,
        PF3_SRIOV_BAR3_APERTURE_SIZE => PF3_SRIOV_BAR3_APERTURE_SIZE_REG,
        PF3_SRIOV_BAR3_CONTROL => PF3_SRIOV_BAR3_CONTROL_REG,
        PF3_SRIOV_BAR4_APERTURE_SIZE => PF3_SRIOV_BAR4_APERTURE_SIZE_REG,
        PF3_SRIOV_BAR4_CONTROL => PF3_SRIOV_BAR4_CONTROL_REG,
        PF3_SRIOV_BAR5_APERTURE_SIZE => PF3_SRIOV_BAR5_APERTURE_SIZE_REG,
        PF3_SRIOV_BAR5_CONTROL => PF3_SRIOV_BAR5_CONTROL_REG,
        PF3_SRIOV_CAP_INITIAL_VF => PF3_SRIOV_CAP_INITIAL_VF_REG,
        PF3_SRIOV_CAP_NEXTPTR => PF3_SRIOV_CAP_NEXTPTR_REG,
        PF3_SRIOV_CAP_TOTAL_VF => PF3_SRIOV_CAP_TOTAL_VF_REG,
        PF3_SRIOV_CAP_VER    => PF3_SRIOV_CAP_VER_REG,
        PF3_SRIOV_FIRST_VF_OFFSET => PF3_SRIOV_FIRST_VF_OFFSET_REG,
        PF3_SRIOV_FUNC_DEP_LINK => PF3_SRIOV_FUNC_DEP_LINK_REG,
        PF3_SRIOV_SUPPORTED_PAGE_SIZE => PF3_SRIOV_SUPPORTED_PAGE_SIZE_REG,
        PF3_SRIOV_VF_DEVICE_ID => PF3_SRIOV_VF_DEVICE_ID_REG,
        PF3_SUBSYSTEM_ID     => PF3_SUBSYSTEM_ID_REG,
        PF3_TPHR_CAP_DEV_SPECIFIC_MODE => PF3_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        PF3_TPHR_CAP_ENABLE  => PF3_TPHR_CAP_ENABLE_REG,
        PF3_TPHR_CAP_INT_VEC_MODE => PF3_TPHR_CAP_INT_VEC_MODE_REG,
        PF3_TPHR_CAP_NEXTPTR => PF3_TPHR_CAP_NEXTPTR_REG,
        PF3_TPHR_CAP_ST_MODE_SEL => PF3_TPHR_CAP_ST_MODE_SEL_REG,
        PF3_TPHR_CAP_ST_TABLE_LOC => PF3_TPHR_CAP_ST_TABLE_LOC_REG,
        PF3_TPHR_CAP_ST_TABLE_SIZE => PF3_TPHR_CAP_ST_TABLE_SIZE_REG,
        PF3_TPHR_CAP_VER     => PF3_TPHR_CAP_VER_REG,
        PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 => PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3_REG,
        PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 => PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2_REG,
        PL_DISABLE_EI_INFER_IN_L0 => PL_DISABLE_EI_INFER_IN_L0_REG,
        PL_DISABLE_GEN3_DC_BALANCE => PL_DISABLE_GEN3_DC_BALANCE_REG,
        PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP => PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP_REG,
        PL_DISABLE_RETRAIN_ON_FRAMING_ERROR => PL_DISABLE_RETRAIN_ON_FRAMING_ERROR_REG,
        PL_DISABLE_SCRAMBLING => PL_DISABLE_SCRAMBLING_REG,
        PL_DISABLE_SYNC_HEADER_FRAMING_ERROR => PL_DISABLE_SYNC_HEADER_FRAMING_ERROR_REG,
        PL_DISABLE_UPCONFIG_CAPABLE => PL_DISABLE_UPCONFIG_CAPABLE_REG,
        PL_EQ_ADAPT_DISABLE_COEFF_CHECK => PL_EQ_ADAPT_DISABLE_COEFF_CHECK_REG,
        PL_EQ_ADAPT_DISABLE_PRESET_CHECK => PL_EQ_ADAPT_DISABLE_PRESET_CHECK_REG,
        PL_EQ_ADAPT_ITER_COUNT => PL_EQ_ADAPT_ITER_COUNT_REG,
        PL_EQ_ADAPT_REJECT_RETRY_COUNT => PL_EQ_ADAPT_REJECT_RETRY_COUNT_REG,
        PL_EQ_BYPASS_PHASE23 => PL_EQ_BYPASS_PHASE23_REG,
        PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT => PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT_REG,
        PL_EQ_DEFAULT_GEN3_TX_PRESET => PL_EQ_DEFAULT_GEN3_TX_PRESET_REG,
        PL_EQ_PHASE01_RX_ADAPT => PL_EQ_PHASE01_RX_ADAPT_REG,
        PL_EQ_SHORT_ADAPT_PHASE => PL_EQ_SHORT_ADAPT_PHASE_REG,
        PL_LANE0_EQ_CONTROL  => PL_LANE0_EQ_CONTROL_REG,
        PL_LANE1_EQ_CONTROL  => PL_LANE1_EQ_CONTROL_REG,
        PL_LANE2_EQ_CONTROL  => PL_LANE2_EQ_CONTROL_REG,
        PL_LANE3_EQ_CONTROL  => PL_LANE3_EQ_CONTROL_REG,
        PL_LANE4_EQ_CONTROL  => PL_LANE4_EQ_CONTROL_REG,
        PL_LANE5_EQ_CONTROL  => PL_LANE5_EQ_CONTROL_REG,
        PL_LANE6_EQ_CONTROL  => PL_LANE6_EQ_CONTROL_REG,
        PL_LANE7_EQ_CONTROL  => PL_LANE7_EQ_CONTROL_REG,
        PL_LINK_CAP_MAX_LINK_SPEED => PL_LINK_CAP_MAX_LINK_SPEED_REG,
        PL_LINK_CAP_MAX_LINK_WIDTH => PL_LINK_CAP_MAX_LINK_WIDTH_REG,
        PL_N_FTS_COMCLK_GEN1 => PL_N_FTS_COMCLK_GEN1_REG,
        PL_N_FTS_COMCLK_GEN2 => PL_N_FTS_COMCLK_GEN2_REG,
        PL_N_FTS_COMCLK_GEN3 => PL_N_FTS_COMCLK_GEN3_REG,
        PL_N_FTS_GEN1        => PL_N_FTS_GEN1_REG,
        PL_N_FTS_GEN2        => PL_N_FTS_GEN2_REG,
        PL_N_FTS_GEN3        => PL_N_FTS_GEN3_REG,
        PL_REPORT_ALL_PHY_ERRORS => PL_REPORT_ALL_PHY_ERRORS_REG,
        PL_SIM_FAST_LINK_TRAINING => PL_SIM_FAST_LINK_TRAINING_REG,
        PL_UPSTREAM_FACING   => PL_UPSTREAM_FACING_REG,
        PM_ASPML0S_TIMEOUT   => PM_ASPML0S_TIMEOUT_REG,
        PM_ASPML1_ENTRY_DELAY => PM_ASPML1_ENTRY_DELAY_REG,
        PM_ENABLE_L23_ENTRY  => PM_ENABLE_L23_ENTRY_REG,
        PM_ENABLE_SLOT_POWER_CAPTURE => PM_ENABLE_SLOT_POWER_CAPTURE_REG,
        PM_L1_REENTRY_DELAY  => PM_L1_REENTRY_DELAY_REG,
        PM_PME_SERVICE_TIMEOUT_DELAY => PM_PME_SERVICE_TIMEOUT_DELAY_REG,
        PM_PME_TURNOFF_ACK_DELAY => PM_PME_TURNOFF_ACK_DELAY_REG,
        SPARE_BIT0           => SPARE_BIT0_REG,
        SPARE_BIT1           => SPARE_BIT1_REG,
        SPARE_BIT2           => SPARE_BIT2_REG,
        SPARE_BIT3           => SPARE_BIT3_REG,
        SPARE_BIT4           => SPARE_BIT4_REG,
        SPARE_BIT5           => SPARE_BIT5_REG,
        SPARE_BIT6           => SPARE_BIT6_REG,
        SPARE_BIT7           => SPARE_BIT7_REG,
        SPARE_BIT8           => SPARE_BIT8_REG,
        SPARE_BYTE0          => SPARE_BYTE0_REG,
        SPARE_BYTE1          => SPARE_BYTE1_REG,
        SPARE_BYTE2          => SPARE_BYTE2_REG,
        SPARE_BYTE3          => SPARE_BYTE3_REG,
        SPARE_WORD0          => SPARE_WORD0_REG,
        SPARE_WORD1          => SPARE_WORD1_REG,
        SPARE_WORD2          => SPARE_WORD2_REG,
        SPARE_WORD3          => SPARE_WORD3_REG,
        SRIOV_CAP_ENABLE     => SRIOV_CAP_ENABLE_REG,
        TEST_MODE_PIN_CHAR   => TEST_MODE_PIN_CHAR_REG,
        TL_COMPLETION_RAM_SIZE_16K => TL_COMPLETION_RAM_SIZE_16K_REG,
        TL_COMPL_TIMEOUT_REG0 => TL_COMPL_TIMEOUT_REG0_REG,
        TL_COMPL_TIMEOUT_REG1 => TL_COMPL_TIMEOUT_REG1_REG,
        TL_CREDITS_CD        => TL_CREDITS_CD_REG,
        TL_CREDITS_CH        => TL_CREDITS_CH_REG,
        TL_CREDITS_NPD       => TL_CREDITS_NPD_REG,
        TL_CREDITS_NPH       => TL_CREDITS_NPH_REG,
        TL_CREDITS_PD        => TL_CREDITS_PD_REG,
        TL_CREDITS_PH        => TL_CREDITS_PH_REG,
        TL_ENABLE_MESSAGE_RID_CHECK_ENABLE => TL_ENABLE_MESSAGE_RID_CHECK_ENABLE_REG,
        TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE => TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE_REG,
        TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE => TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE_REG,
        TL_LEGACY_MODE_ENABLE => TL_LEGACY_MODE_ENABLE_REG,
        TL_PF_ENABLE_REG     => TL_PF_ENABLE_REG_REG,
        TL_TX_MUX_STRICT_PRIORITY => TL_TX_MUX_STRICT_PRIORITY_REG,
        TWO_LAYER_MODE_DLCMSM_ENABLE => TWO_LAYER_MODE_DLCMSM_ENABLE_REG,
        TWO_LAYER_MODE_ENABLE => TWO_LAYER_MODE_ENABLE_REG,
        TWO_LAYER_MODE_WIDTH_256 => TWO_LAYER_MODE_WIDTH_256_REG,
        VF0_ARI_CAP_NEXTPTR  => VF0_ARI_CAP_NEXTPTR_REG,
        VF0_CAPABILITY_POINTER => VF0_CAPABILITY_POINTER_REG,
        VF0_MSIX_CAP_PBA_BIR => VF0_MSIX_CAP_PBA_BIR_REG,
        VF0_MSIX_CAP_PBA_OFFSET => VF0_MSIX_CAP_PBA_OFFSET_REG,
        VF0_MSIX_CAP_TABLE_BIR => VF0_MSIX_CAP_TABLE_BIR_REG,
        VF0_MSIX_CAP_TABLE_OFFSET => VF0_MSIX_CAP_TABLE_OFFSET_REG,
        VF0_MSIX_CAP_TABLE_SIZE => VF0_MSIX_CAP_TABLE_SIZE_REG,
        VF0_MSI_CAP_MULTIMSGCAP => VF0_MSI_CAP_MULTIMSGCAP_REG,
        VF0_PM_CAP_ID        => VF0_PM_CAP_ID_REG,
        VF0_PM_CAP_NEXTPTR   => VF0_PM_CAP_NEXTPTR_REG,
        VF0_PM_CAP_VER_ID    => VF0_PM_CAP_VER_ID_REG,
        VF0_TPHR_CAP_DEV_SPECIFIC_MODE => VF0_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF0_TPHR_CAP_ENABLE  => VF0_TPHR_CAP_ENABLE_REG,
        VF0_TPHR_CAP_INT_VEC_MODE => VF0_TPHR_CAP_INT_VEC_MODE_REG,
        VF0_TPHR_CAP_NEXTPTR => VF0_TPHR_CAP_NEXTPTR_REG,
        VF0_TPHR_CAP_ST_MODE_SEL => VF0_TPHR_CAP_ST_MODE_SEL_REG,
        VF0_TPHR_CAP_ST_TABLE_LOC => VF0_TPHR_CAP_ST_TABLE_LOC_REG,
        VF0_TPHR_CAP_ST_TABLE_SIZE => VF0_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF0_TPHR_CAP_VER     => VF0_TPHR_CAP_VER_REG,
        VF1_ARI_CAP_NEXTPTR  => VF1_ARI_CAP_NEXTPTR_REG,
        VF1_MSIX_CAP_PBA_BIR => VF1_MSIX_CAP_PBA_BIR_REG,
        VF1_MSIX_CAP_PBA_OFFSET => VF1_MSIX_CAP_PBA_OFFSET_REG,
        VF1_MSIX_CAP_TABLE_BIR => VF1_MSIX_CAP_TABLE_BIR_REG,
        VF1_MSIX_CAP_TABLE_OFFSET => VF1_MSIX_CAP_TABLE_OFFSET_REG,
        VF1_MSIX_CAP_TABLE_SIZE => VF1_MSIX_CAP_TABLE_SIZE_REG,
        VF1_MSI_CAP_MULTIMSGCAP => VF1_MSI_CAP_MULTIMSGCAP_REG,
        VF1_PM_CAP_ID        => VF1_PM_CAP_ID_REG,
        VF1_PM_CAP_NEXTPTR   => VF1_PM_CAP_NEXTPTR_REG,
        VF1_PM_CAP_VER_ID    => VF1_PM_CAP_VER_ID_REG,
        VF1_TPHR_CAP_DEV_SPECIFIC_MODE => VF1_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF1_TPHR_CAP_ENABLE  => VF1_TPHR_CAP_ENABLE_REG,
        VF1_TPHR_CAP_INT_VEC_MODE => VF1_TPHR_CAP_INT_VEC_MODE_REG,
        VF1_TPHR_CAP_NEXTPTR => VF1_TPHR_CAP_NEXTPTR_REG,
        VF1_TPHR_CAP_ST_MODE_SEL => VF1_TPHR_CAP_ST_MODE_SEL_REG,
        VF1_TPHR_CAP_ST_TABLE_LOC => VF1_TPHR_CAP_ST_TABLE_LOC_REG,
        VF1_TPHR_CAP_ST_TABLE_SIZE => VF1_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF1_TPHR_CAP_VER     => VF1_TPHR_CAP_VER_REG,
        VF2_ARI_CAP_NEXTPTR  => VF2_ARI_CAP_NEXTPTR_REG,
        VF2_MSIX_CAP_PBA_BIR => VF2_MSIX_CAP_PBA_BIR_REG,
        VF2_MSIX_CAP_PBA_OFFSET => VF2_MSIX_CAP_PBA_OFFSET_REG,
        VF2_MSIX_CAP_TABLE_BIR => VF2_MSIX_CAP_TABLE_BIR_REG,
        VF2_MSIX_CAP_TABLE_OFFSET => VF2_MSIX_CAP_TABLE_OFFSET_REG,
        VF2_MSIX_CAP_TABLE_SIZE => VF2_MSIX_CAP_TABLE_SIZE_REG,
        VF2_MSI_CAP_MULTIMSGCAP => VF2_MSI_CAP_MULTIMSGCAP_REG,
        VF2_PM_CAP_ID        => VF2_PM_CAP_ID_REG,
        VF2_PM_CAP_NEXTPTR   => VF2_PM_CAP_NEXTPTR_REG,
        VF2_PM_CAP_VER_ID    => VF2_PM_CAP_VER_ID_REG,
        VF2_TPHR_CAP_DEV_SPECIFIC_MODE => VF2_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF2_TPHR_CAP_ENABLE  => VF2_TPHR_CAP_ENABLE_REG,
        VF2_TPHR_CAP_INT_VEC_MODE => VF2_TPHR_CAP_INT_VEC_MODE_REG,
        VF2_TPHR_CAP_NEXTPTR => VF2_TPHR_CAP_NEXTPTR_REG,
        VF2_TPHR_CAP_ST_MODE_SEL => VF2_TPHR_CAP_ST_MODE_SEL_REG,
        VF2_TPHR_CAP_ST_TABLE_LOC => VF2_TPHR_CAP_ST_TABLE_LOC_REG,
        VF2_TPHR_CAP_ST_TABLE_SIZE => VF2_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF2_TPHR_CAP_VER     => VF2_TPHR_CAP_VER_REG,
        VF3_ARI_CAP_NEXTPTR  => VF3_ARI_CAP_NEXTPTR_REG,
        VF3_MSIX_CAP_PBA_BIR => VF3_MSIX_CAP_PBA_BIR_REG,
        VF3_MSIX_CAP_PBA_OFFSET => VF3_MSIX_CAP_PBA_OFFSET_REG,
        VF3_MSIX_CAP_TABLE_BIR => VF3_MSIX_CAP_TABLE_BIR_REG,
        VF3_MSIX_CAP_TABLE_OFFSET => VF3_MSIX_CAP_TABLE_OFFSET_REG,
        VF3_MSIX_CAP_TABLE_SIZE => VF3_MSIX_CAP_TABLE_SIZE_REG,
        VF3_MSI_CAP_MULTIMSGCAP => VF3_MSI_CAP_MULTIMSGCAP_REG,
        VF3_PM_CAP_ID        => VF3_PM_CAP_ID_REG,
        VF3_PM_CAP_NEXTPTR   => VF3_PM_CAP_NEXTPTR_REG,
        VF3_PM_CAP_VER_ID    => VF3_PM_CAP_VER_ID_REG,
        VF3_TPHR_CAP_DEV_SPECIFIC_MODE => VF3_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF3_TPHR_CAP_ENABLE  => VF3_TPHR_CAP_ENABLE_REG,
        VF3_TPHR_CAP_INT_VEC_MODE => VF3_TPHR_CAP_INT_VEC_MODE_REG,
        VF3_TPHR_CAP_NEXTPTR => VF3_TPHR_CAP_NEXTPTR_REG,
        VF3_TPHR_CAP_ST_MODE_SEL => VF3_TPHR_CAP_ST_MODE_SEL_REG,
        VF3_TPHR_CAP_ST_TABLE_LOC => VF3_TPHR_CAP_ST_TABLE_LOC_REG,
        VF3_TPHR_CAP_ST_TABLE_SIZE => VF3_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF3_TPHR_CAP_VER     => VF3_TPHR_CAP_VER_REG,
        VF4_ARI_CAP_NEXTPTR  => VF4_ARI_CAP_NEXTPTR_REG,
        VF4_MSIX_CAP_PBA_BIR => VF4_MSIX_CAP_PBA_BIR_REG,
        VF4_MSIX_CAP_PBA_OFFSET => VF4_MSIX_CAP_PBA_OFFSET_REG,
        VF4_MSIX_CAP_TABLE_BIR => VF4_MSIX_CAP_TABLE_BIR_REG,
        VF4_MSIX_CAP_TABLE_OFFSET => VF4_MSIX_CAP_TABLE_OFFSET_REG,
        VF4_MSIX_CAP_TABLE_SIZE => VF4_MSIX_CAP_TABLE_SIZE_REG,
        VF4_MSI_CAP_MULTIMSGCAP => VF4_MSI_CAP_MULTIMSGCAP_REG,
        VF4_PM_CAP_ID        => VF4_PM_CAP_ID_REG,
        VF4_PM_CAP_NEXTPTR   => VF4_PM_CAP_NEXTPTR_REG,
        VF4_PM_CAP_VER_ID    => VF4_PM_CAP_VER_ID_REG,
        VF4_TPHR_CAP_DEV_SPECIFIC_MODE => VF4_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF4_TPHR_CAP_ENABLE  => VF4_TPHR_CAP_ENABLE_REG,
        VF4_TPHR_CAP_INT_VEC_MODE => VF4_TPHR_CAP_INT_VEC_MODE_REG,
        VF4_TPHR_CAP_NEXTPTR => VF4_TPHR_CAP_NEXTPTR_REG,
        VF4_TPHR_CAP_ST_MODE_SEL => VF4_TPHR_CAP_ST_MODE_SEL_REG,
        VF4_TPHR_CAP_ST_TABLE_LOC => VF4_TPHR_CAP_ST_TABLE_LOC_REG,
        VF4_TPHR_CAP_ST_TABLE_SIZE => VF4_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF4_TPHR_CAP_VER     => VF4_TPHR_CAP_VER_REG,
        VF5_ARI_CAP_NEXTPTR  => VF5_ARI_CAP_NEXTPTR_REG,
        VF5_MSIX_CAP_PBA_BIR => VF5_MSIX_CAP_PBA_BIR_REG,
        VF5_MSIX_CAP_PBA_OFFSET => VF5_MSIX_CAP_PBA_OFFSET_REG,
        VF5_MSIX_CAP_TABLE_BIR => VF5_MSIX_CAP_TABLE_BIR_REG,
        VF5_MSIX_CAP_TABLE_OFFSET => VF5_MSIX_CAP_TABLE_OFFSET_REG,
        VF5_MSIX_CAP_TABLE_SIZE => VF5_MSIX_CAP_TABLE_SIZE_REG,
        VF5_MSI_CAP_MULTIMSGCAP => VF5_MSI_CAP_MULTIMSGCAP_REG,
        VF5_PM_CAP_ID        => VF5_PM_CAP_ID_REG,
        VF5_PM_CAP_NEXTPTR   => VF5_PM_CAP_NEXTPTR_REG,
        VF5_PM_CAP_VER_ID    => VF5_PM_CAP_VER_ID_REG,
        VF5_TPHR_CAP_DEV_SPECIFIC_MODE => VF5_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF5_TPHR_CAP_ENABLE  => VF5_TPHR_CAP_ENABLE_REG,
        VF5_TPHR_CAP_INT_VEC_MODE => VF5_TPHR_CAP_INT_VEC_MODE_REG,
        VF5_TPHR_CAP_NEXTPTR => VF5_TPHR_CAP_NEXTPTR_REG,
        VF5_TPHR_CAP_ST_MODE_SEL => VF5_TPHR_CAP_ST_MODE_SEL_REG,
        VF5_TPHR_CAP_ST_TABLE_LOC => VF5_TPHR_CAP_ST_TABLE_LOC_REG,
        VF5_TPHR_CAP_ST_TABLE_SIZE => VF5_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF5_TPHR_CAP_VER     => VF5_TPHR_CAP_VER_REG,
        VF6_ARI_CAP_NEXTPTR  => VF6_ARI_CAP_NEXTPTR_REG,
        VF6_MSIX_CAP_PBA_BIR => VF6_MSIX_CAP_PBA_BIR_REG,
        VF6_MSIX_CAP_PBA_OFFSET => VF6_MSIX_CAP_PBA_OFFSET_REG,
        VF6_MSIX_CAP_TABLE_BIR => VF6_MSIX_CAP_TABLE_BIR_REG,
        VF6_MSIX_CAP_TABLE_OFFSET => VF6_MSIX_CAP_TABLE_OFFSET_REG,
        VF6_MSIX_CAP_TABLE_SIZE => VF6_MSIX_CAP_TABLE_SIZE_REG,
        VF6_MSI_CAP_MULTIMSGCAP => VF6_MSI_CAP_MULTIMSGCAP_REG,
        VF6_PM_CAP_ID        => VF6_PM_CAP_ID_REG,
        VF6_PM_CAP_NEXTPTR   => VF6_PM_CAP_NEXTPTR_REG,
        VF6_PM_CAP_VER_ID    => VF6_PM_CAP_VER_ID_REG,
        VF6_TPHR_CAP_DEV_SPECIFIC_MODE => VF6_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF6_TPHR_CAP_ENABLE  => VF6_TPHR_CAP_ENABLE_REG,
        VF6_TPHR_CAP_INT_VEC_MODE => VF6_TPHR_CAP_INT_VEC_MODE_REG,
        VF6_TPHR_CAP_NEXTPTR => VF6_TPHR_CAP_NEXTPTR_REG,
        VF6_TPHR_CAP_ST_MODE_SEL => VF6_TPHR_CAP_ST_MODE_SEL_REG,
        VF6_TPHR_CAP_ST_TABLE_LOC => VF6_TPHR_CAP_ST_TABLE_LOC_REG,
        VF6_TPHR_CAP_ST_TABLE_SIZE => VF6_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF6_TPHR_CAP_VER     => VF6_TPHR_CAP_VER_REG,
        VF7_ARI_CAP_NEXTPTR  => VF7_ARI_CAP_NEXTPTR_REG,
        VF7_MSIX_CAP_PBA_BIR => VF7_MSIX_CAP_PBA_BIR_REG,
        VF7_MSIX_CAP_PBA_OFFSET => VF7_MSIX_CAP_PBA_OFFSET_REG,
        VF7_MSIX_CAP_TABLE_BIR => VF7_MSIX_CAP_TABLE_BIR_REG,
        VF7_MSIX_CAP_TABLE_OFFSET => VF7_MSIX_CAP_TABLE_OFFSET_REG,
        VF7_MSIX_CAP_TABLE_SIZE => VF7_MSIX_CAP_TABLE_SIZE_REG,
        VF7_MSI_CAP_MULTIMSGCAP => VF7_MSI_CAP_MULTIMSGCAP_REG,
        VF7_PM_CAP_ID        => VF7_PM_CAP_ID_REG,
        VF7_PM_CAP_NEXTPTR   => VF7_PM_CAP_NEXTPTR_REG,
        VF7_PM_CAP_VER_ID    => VF7_PM_CAP_VER_ID_REG,
        VF7_TPHR_CAP_DEV_SPECIFIC_MODE => VF7_TPHR_CAP_DEV_SPECIFIC_MODE_REG,
        VF7_TPHR_CAP_ENABLE  => VF7_TPHR_CAP_ENABLE_REG,
        VF7_TPHR_CAP_INT_VEC_MODE => VF7_TPHR_CAP_INT_VEC_MODE_REG,
        VF7_TPHR_CAP_NEXTPTR => VF7_TPHR_CAP_NEXTPTR_REG,
        VF7_TPHR_CAP_ST_MODE_SEL => VF7_TPHR_CAP_ST_MODE_SEL_REG,
        VF7_TPHR_CAP_ST_TABLE_LOC => VF7_TPHR_CAP_ST_TABLE_LOC_REG,
        VF7_TPHR_CAP_ST_TABLE_SIZE => VF7_TPHR_CAP_ST_TABLE_SIZE_REG,
        VF7_TPHR_CAP_VER     => VF7_TPHR_CAP_VER_REG,
        CFGCURRENTSPEED      => CFGCURRENTSPEED_out,
        CFGDPASUBSTATECHANGE => CFGDPASUBSTATECHANGE_out,
        CFGERRCOROUT         => CFGERRCOROUT_out,
        CFGERRFATALOUT       => CFGERRFATALOUT_out,
        CFGERRNONFATALOUT    => CFGERRNONFATALOUT_out,
        CFGEXTFUNCTIONNUMBER => CFGEXTFUNCTIONNUMBER_out,
        CFGEXTREADRECEIVED   => CFGEXTREADRECEIVED_out,
        CFGEXTREGISTERNUMBER => CFGEXTREGISTERNUMBER_out,
        CFGEXTWRITEBYTEENABLE => CFGEXTWRITEBYTEENABLE_out,
        CFGEXTWRITEDATA      => CFGEXTWRITEDATA_out,
        CFGEXTWRITERECEIVED  => CFGEXTWRITERECEIVED_out,
        CFGFCCPLD            => CFGFCCPLD_out,
        CFGFCCPLH            => CFGFCCPLH_out,
        CFGFCNPD             => CFGFCNPD_out,
        CFGFCNPH             => CFGFCNPH_out,
        CFGFCPD              => CFGFCPD_out,
        CFGFCPH              => CFGFCPH_out,
        CFGFLRINPROCESS      => CFGFLRINPROCESS_out,
        CFGFUNCTIONPOWERSTATE => CFGFUNCTIONPOWERSTATE_out,
        CFGFUNCTIONSTATUS    => CFGFUNCTIONSTATUS_out,
        CFGHOTRESETOUT       => CFGHOTRESETOUT_out,
        CFGINTERRUPTMSIDATA  => CFGINTERRUPTMSIDATA_out,
        CFGINTERRUPTMSIENABLE => CFGINTERRUPTMSIENABLE_out,
        CFGINTERRUPTMSIFAIL  => CFGINTERRUPTMSIFAIL_out,
        CFGINTERRUPTMSIMASKUPDATE => CFGINTERRUPTMSIMASKUPDATE_out,
        CFGINTERRUPTMSIMMENABLE => CFGINTERRUPTMSIMMENABLE_out,
        CFGINTERRUPTMSISENT  => CFGINTERRUPTMSISENT_out,
        CFGINTERRUPTMSIVFENABLE => CFGINTERRUPTMSIVFENABLE_out,
        CFGINTERRUPTMSIXENABLE => CFGINTERRUPTMSIXENABLE_out,
        CFGINTERRUPTMSIXFAIL => CFGINTERRUPTMSIXFAIL_out,
        CFGINTERRUPTMSIXMASK => CFGINTERRUPTMSIXMASK_out,
        CFGINTERRUPTMSIXSENT => CFGINTERRUPTMSIXSENT_out,
        CFGINTERRUPTMSIXVFENABLE => CFGINTERRUPTMSIXVFENABLE_out,
        CFGINTERRUPTMSIXVFMASK => CFGINTERRUPTMSIXVFMASK_out,
        CFGINTERRUPTSENT     => CFGINTERRUPTSENT_out,
        CFGLINKPOWERSTATE    => CFGLINKPOWERSTATE_out,
        CFGLOCALERROR        => CFGLOCALERROR_out,
        CFGLTRENABLE         => CFGLTRENABLE_out,
        CFGLTSSMSTATE        => CFGLTSSMSTATE_out,
        CFGMAXPAYLOAD        => CFGMAXPAYLOAD_out,
        CFGMAXREADREQ        => CFGMAXREADREQ_out,
        CFGMGMTREADDATA      => CFGMGMTREADDATA_out,
        CFGMGMTREADWRITEDONE => CFGMGMTREADWRITEDONE_out,
        CFGMSGRECEIVED       => CFGMSGRECEIVED_out,
        CFGMSGRECEIVEDDATA   => CFGMSGRECEIVEDDATA_out,
        CFGMSGRECEIVEDTYPE   => CFGMSGRECEIVEDTYPE_out,
        CFGMSGTRANSMITDONE   => CFGMSGTRANSMITDONE_out,
        CFGNEGOTIATEDWIDTH   => CFGNEGOTIATEDWIDTH_out,
        CFGOBFFENABLE        => CFGOBFFENABLE_out,
        CFGPERFUNCSTATUSDATA => CFGPERFUNCSTATUSDATA_out,
        CFGPERFUNCTIONUPDATEDONE => CFGPERFUNCTIONUPDATEDONE_out,
        CFGPHYLINKDOWN       => CFGPHYLINKDOWN_out,
        CFGPHYLINKSTATUS     => CFGPHYLINKSTATUS_out,
        CFGPLSTATUSCHANGE    => CFGPLSTATUSCHANGE_out,
        CFGPOWERSTATECHANGEINTERRUPT => CFGPOWERSTATECHANGEINTERRUPT_out,
        CFGRCBSTATUS         => CFGRCBSTATUS_out,
        CFGTPHFUNCTIONNUM    => CFGTPHFUNCTIONNUM_out,
        CFGTPHREQUESTERENABLE => CFGTPHREQUESTERENABLE_out,
        CFGTPHSTMODE         => CFGTPHSTMODE_out,
        CFGTPHSTTADDRESS     => CFGTPHSTTADDRESS_out,
        CFGTPHSTTREADENABLE  => CFGTPHSTTREADENABLE_out,
        CFGTPHSTTWRITEBYTEVALID => CFGTPHSTTWRITEBYTEVALID_out,
        CFGTPHSTTWRITEDATA   => CFGTPHSTTWRITEDATA_out,
        CFGTPHSTTWRITEENABLE => CFGTPHSTTWRITEENABLE_out,
        CFGVFFLRINPROCESS    => CFGVFFLRINPROCESS_out,
        CFGVFPOWERSTATE      => CFGVFPOWERSTATE_out,
        CFGVFSTATUS          => CFGVFSTATUS_out,
        CFGVFTPHREQUESTERENABLE => CFGVFTPHREQUESTERENABLE_out,
        CFGVFTPHSTMODE       => CFGVFTPHSTMODE_out,
        CONFMCAPDESIGNSWITCH => CONFMCAPDESIGNSWITCH_out,
        CONFMCAPEOS          => CONFMCAPEOS_out,
        CONFMCAPINUSEBYPCIE  => CONFMCAPINUSEBYPCIE_out,
        CONFREQREADY         => CONFREQREADY_out,
        CONFRESPRDATA        => CONFRESPRDATA_out,
        CONFRESPVALID        => CONFRESPVALID_out,
        DBGDATAOUT           => DBGDATAOUT_out,
        DBGMCAPCSB           => DBGMCAPCSB_out,
        DBGMCAPDATA          => DBGMCAPDATA_out,
        DBGMCAPEOS           => DBGMCAPEOS_out,
        DBGMCAPERROR         => DBGMCAPERROR_out,
        DBGMCAPMODE          => DBGMCAPMODE_out,
        DBGMCAPRDATAVALID    => DBGMCAPRDATAVALID_out,
        DBGMCAPRDWRB         => DBGMCAPRDWRB_out,
        DBGMCAPRESET         => DBGMCAPRESET_out,
        DBGPLDATABLOCKRECEIVEDAFTEREDS => DBGPLDATABLOCKRECEIVEDAFTEREDS_out,
        DBGPLGEN3FRAMINGERRORDETECTED => DBGPLGEN3FRAMINGERRORDETECTED_out,
        DBGPLGEN3SYNCHEADERERRORDETECTED => DBGPLGEN3SYNCHEADERERRORDETECTED_out,
        DBGPLINFERREDRXELECTRICALIDLE => DBGPLINFERREDRXELECTRICALIDLE_out,
        DRPDO                => DRPDO_out,
        DRPRDY               => DRPRDY_out,
        LL2LMMASTERTLPSENT0  => LL2LMMASTERTLPSENT0_out,
        LL2LMMASTERTLPSENT1  => LL2LMMASTERTLPSENT1_out,
        LL2LMMASTERTLPSENTTLPID0 => LL2LMMASTERTLPSENTTLPID0_out,
        LL2LMMASTERTLPSENTTLPID1 => LL2LMMASTERTLPSENTTLPID1_out,
        LL2LMMAXISRXTDATA    => LL2LMMAXISRXTDATA_out,
        LL2LMMAXISRXTUSER    => LL2LMMAXISRXTUSER_out,
        LL2LMMAXISRXTVALID   => LL2LMMAXISRXTVALID_out,
        LL2LMSAXISTXTREADY   => LL2LMSAXISTXTREADY_out,
        MAXISCQTDATA         => MAXISCQTDATA_out,
        MAXISCQTKEEP         => MAXISCQTKEEP_out,
        MAXISCQTLAST         => MAXISCQTLAST_out,
        MAXISCQTUSER         => MAXISCQTUSER_out,
        MAXISCQTVALID        => MAXISCQTVALID_out,
        MAXISRCTDATA         => MAXISRCTDATA_out,
        MAXISRCTKEEP         => MAXISRCTKEEP_out,
        MAXISRCTLAST         => MAXISRCTLAST_out,
        MAXISRCTUSER         => MAXISRCTUSER_out,
        MAXISRCTVALID        => MAXISRCTVALID_out,
        MICOMPLETIONRAMREADADDRESSAL => MICOMPLETIONRAMREADADDRESSAL_out,
        MICOMPLETIONRAMREADADDRESSAU => MICOMPLETIONRAMREADADDRESSAU_out,
        MICOMPLETIONRAMREADADDRESSBL => MICOMPLETIONRAMREADADDRESSBL_out,
        MICOMPLETIONRAMREADADDRESSBU => MICOMPLETIONRAMREADADDRESSBU_out,
        MICOMPLETIONRAMREADENABLEL => MICOMPLETIONRAMREADENABLEL_out,
        MICOMPLETIONRAMREADENABLEU => MICOMPLETIONRAMREADENABLEU_out,
        MICOMPLETIONRAMWRITEADDRESSAL => MICOMPLETIONRAMWRITEADDRESSAL_out,
        MICOMPLETIONRAMWRITEADDRESSAU => MICOMPLETIONRAMWRITEADDRESSAU_out,
        MICOMPLETIONRAMWRITEADDRESSBL => MICOMPLETIONRAMWRITEADDRESSBL_out,
        MICOMPLETIONRAMWRITEADDRESSBU => MICOMPLETIONRAMWRITEADDRESSBU_out,
        MICOMPLETIONRAMWRITEDATAL => MICOMPLETIONRAMWRITEDATAL_out,
        MICOMPLETIONRAMWRITEDATAU => MICOMPLETIONRAMWRITEDATAU_out,
        MICOMPLETIONRAMWRITEENABLEL => MICOMPLETIONRAMWRITEENABLEL_out,
        MICOMPLETIONRAMWRITEENABLEU => MICOMPLETIONRAMWRITEENABLEU_out,
        MIREPLAYRAMADDRESS   => MIREPLAYRAMADDRESS_out,
        MIREPLAYRAMREADENABLE => MIREPLAYRAMREADENABLE_out,
        MIREPLAYRAMWRITEDATA => MIREPLAYRAMWRITEDATA_out,
        MIREPLAYRAMWRITEENABLE => MIREPLAYRAMWRITEENABLE_out,
        MIREQUESTRAMREADADDRESSA => MIREQUESTRAMREADADDRESSA_out,
        MIREQUESTRAMREADADDRESSB => MIREQUESTRAMREADADDRESSB_out,
        MIREQUESTRAMREADENABLE => MIREQUESTRAMREADENABLE_out,
        MIREQUESTRAMWRITEADDRESSA => MIREQUESTRAMWRITEADDRESSA_out,
        MIREQUESTRAMWRITEADDRESSB => MIREQUESTRAMWRITEADDRESSB_out,
        MIREQUESTRAMWRITEDATA => MIREQUESTRAMWRITEDATA_out,
        MIREQUESTRAMWRITEENABLE => MIREQUESTRAMWRITEENABLE_out,
        PCIECQNPREQCOUNT     => PCIECQNPREQCOUNT_out,
        PCIEPERST0B          => PCIEPERST0B_out,
        PCIEPERST1B          => PCIEPERST1B_out,
        PCIERQSEQNUM         => PCIERQSEQNUM_out,
        PCIERQSEQNUMVLD      => PCIERQSEQNUMVLD_out,
        PCIERQTAG            => PCIERQTAG_out,
        PCIERQTAGAV          => PCIERQTAGAV_out,
        PCIERQTAGVLD         => PCIERQTAGVLD_out,
        PCIETFCNPDAV         => PCIETFCNPDAV_out,
        PCIETFCNPHAV         => PCIETFCNPHAV_out,
        PIPERX0EQCONTROL     => PIPERX0EQCONTROL_out,
        PIPERX0EQLPLFFS      => PIPERX0EQLPLFFS_out,
        PIPERX0EQLPTXPRESET  => PIPERX0EQLPTXPRESET_out,
        PIPERX0EQPRESET      => PIPERX0EQPRESET_out,
        PIPERX0POLARITY      => PIPERX0POLARITY_out,
        PIPERX1EQCONTROL     => PIPERX1EQCONTROL_out,
        PIPERX1EQLPLFFS      => PIPERX1EQLPLFFS_out,
        PIPERX1EQLPTXPRESET  => PIPERX1EQLPTXPRESET_out,
        PIPERX1EQPRESET      => PIPERX1EQPRESET_out,
        PIPERX1POLARITY      => PIPERX1POLARITY_out,
        PIPERX2EQCONTROL     => PIPERX2EQCONTROL_out,
        PIPERX2EQLPLFFS      => PIPERX2EQLPLFFS_out,
        PIPERX2EQLPTXPRESET  => PIPERX2EQLPTXPRESET_out,
        PIPERX2EQPRESET      => PIPERX2EQPRESET_out,
        PIPERX2POLARITY      => PIPERX2POLARITY_out,
        PIPERX3EQCONTROL     => PIPERX3EQCONTROL_out,
        PIPERX3EQLPLFFS      => PIPERX3EQLPLFFS_out,
        PIPERX3EQLPTXPRESET  => PIPERX3EQLPTXPRESET_out,
        PIPERX3EQPRESET      => PIPERX3EQPRESET_out,
        PIPERX3POLARITY      => PIPERX3POLARITY_out,
        PIPERX4EQCONTROL     => PIPERX4EQCONTROL_out,
        PIPERX4EQLPLFFS      => PIPERX4EQLPLFFS_out,
        PIPERX4EQLPTXPRESET  => PIPERX4EQLPTXPRESET_out,
        PIPERX4EQPRESET      => PIPERX4EQPRESET_out,
        PIPERX4POLARITY      => PIPERX4POLARITY_out,
        PIPERX5EQCONTROL     => PIPERX5EQCONTROL_out,
        PIPERX5EQLPLFFS      => PIPERX5EQLPLFFS_out,
        PIPERX5EQLPTXPRESET  => PIPERX5EQLPTXPRESET_out,
        PIPERX5EQPRESET      => PIPERX5EQPRESET_out,
        PIPERX5POLARITY      => PIPERX5POLARITY_out,
        PIPERX6EQCONTROL     => PIPERX6EQCONTROL_out,
        PIPERX6EQLPLFFS      => PIPERX6EQLPLFFS_out,
        PIPERX6EQLPTXPRESET  => PIPERX6EQLPTXPRESET_out,
        PIPERX6EQPRESET      => PIPERX6EQPRESET_out,
        PIPERX6POLARITY      => PIPERX6POLARITY_out,
        PIPERX7EQCONTROL     => PIPERX7EQCONTROL_out,
        PIPERX7EQLPLFFS      => PIPERX7EQLPLFFS_out,
        PIPERX7EQLPTXPRESET  => PIPERX7EQLPTXPRESET_out,
        PIPERX7EQPRESET      => PIPERX7EQPRESET_out,
        PIPERX7POLARITY      => PIPERX7POLARITY_out,
        PIPETX0CHARISK       => PIPETX0CHARISK_out,
        PIPETX0COMPLIANCE    => PIPETX0COMPLIANCE_out,
        PIPETX0DATA          => PIPETX0DATA_out,
        PIPETX0DATAVALID     => PIPETX0DATAVALID_out,
        PIPETX0DEEMPH        => PIPETX0DEEMPH_out,
        PIPETX0ELECIDLE      => PIPETX0ELECIDLE_out,
        PIPETX0EQCONTROL     => PIPETX0EQCONTROL_out,
        PIPETX0EQDEEMPH      => PIPETX0EQDEEMPH_out,
        PIPETX0EQPRESET      => PIPETX0EQPRESET_out,
        PIPETX0MARGIN        => PIPETX0MARGIN_out,
        PIPETX0POWERDOWN     => PIPETX0POWERDOWN_out,
        PIPETX0RATE          => PIPETX0RATE_out,
        PIPETX0RCVRDET       => PIPETX0RCVRDET_out,
        PIPETX0RESET         => PIPETX0RESET_out,
        PIPETX0STARTBLOCK    => PIPETX0STARTBLOCK_out,
        PIPETX0SWING         => PIPETX0SWING_out,
        PIPETX0SYNCHEADER    => PIPETX0SYNCHEADER_out,
        PIPETX1CHARISK       => PIPETX1CHARISK_out,
        PIPETX1COMPLIANCE    => PIPETX1COMPLIANCE_out,
        PIPETX1DATA          => PIPETX1DATA_out,
        PIPETX1DATAVALID     => PIPETX1DATAVALID_out,
        PIPETX1DEEMPH        => PIPETX1DEEMPH_out,
        PIPETX1ELECIDLE      => PIPETX1ELECIDLE_out,
        PIPETX1EQCONTROL     => PIPETX1EQCONTROL_out,
        PIPETX1EQDEEMPH      => PIPETX1EQDEEMPH_out,
        PIPETX1EQPRESET      => PIPETX1EQPRESET_out,
        PIPETX1MARGIN        => PIPETX1MARGIN_out,
        PIPETX1POWERDOWN     => PIPETX1POWERDOWN_out,
        PIPETX1RATE          => PIPETX1RATE_out,
        PIPETX1RCVRDET       => PIPETX1RCVRDET_out,
        PIPETX1RESET         => PIPETX1RESET_out,
        PIPETX1STARTBLOCK    => PIPETX1STARTBLOCK_out,
        PIPETX1SWING         => PIPETX1SWING_out,
        PIPETX1SYNCHEADER    => PIPETX1SYNCHEADER_out,
        PIPETX2CHARISK       => PIPETX2CHARISK_out,
        PIPETX2COMPLIANCE    => PIPETX2COMPLIANCE_out,
        PIPETX2DATA          => PIPETX2DATA_out,
        PIPETX2DATAVALID     => PIPETX2DATAVALID_out,
        PIPETX2DEEMPH        => PIPETX2DEEMPH_out,
        PIPETX2ELECIDLE      => PIPETX2ELECIDLE_out,
        PIPETX2EQCONTROL     => PIPETX2EQCONTROL_out,
        PIPETX2EQDEEMPH      => PIPETX2EQDEEMPH_out,
        PIPETX2EQPRESET      => PIPETX2EQPRESET_out,
        PIPETX2MARGIN        => PIPETX2MARGIN_out,
        PIPETX2POWERDOWN     => PIPETX2POWERDOWN_out,
        PIPETX2RATE          => PIPETX2RATE_out,
        PIPETX2RCVRDET       => PIPETX2RCVRDET_out,
        PIPETX2RESET         => PIPETX2RESET_out,
        PIPETX2STARTBLOCK    => PIPETX2STARTBLOCK_out,
        PIPETX2SWING         => PIPETX2SWING_out,
        PIPETX2SYNCHEADER    => PIPETX2SYNCHEADER_out,
        PIPETX3CHARISK       => PIPETX3CHARISK_out,
        PIPETX3COMPLIANCE    => PIPETX3COMPLIANCE_out,
        PIPETX3DATA          => PIPETX3DATA_out,
        PIPETX3DATAVALID     => PIPETX3DATAVALID_out,
        PIPETX3DEEMPH        => PIPETX3DEEMPH_out,
        PIPETX3ELECIDLE      => PIPETX3ELECIDLE_out,
        PIPETX3EQCONTROL     => PIPETX3EQCONTROL_out,
        PIPETX3EQDEEMPH      => PIPETX3EQDEEMPH_out,
        PIPETX3EQPRESET      => PIPETX3EQPRESET_out,
        PIPETX3MARGIN        => PIPETX3MARGIN_out,
        PIPETX3POWERDOWN     => PIPETX3POWERDOWN_out,
        PIPETX3RATE          => PIPETX3RATE_out,
        PIPETX3RCVRDET       => PIPETX3RCVRDET_out,
        PIPETX3RESET         => PIPETX3RESET_out,
        PIPETX3STARTBLOCK    => PIPETX3STARTBLOCK_out,
        PIPETX3SWING         => PIPETX3SWING_out,
        PIPETX3SYNCHEADER    => PIPETX3SYNCHEADER_out,
        PIPETX4CHARISK       => PIPETX4CHARISK_out,
        PIPETX4COMPLIANCE    => PIPETX4COMPLIANCE_out,
        PIPETX4DATA          => PIPETX4DATA_out,
        PIPETX4DATAVALID     => PIPETX4DATAVALID_out,
        PIPETX4DEEMPH        => PIPETX4DEEMPH_out,
        PIPETX4ELECIDLE      => PIPETX4ELECIDLE_out,
        PIPETX4EQCONTROL     => PIPETX4EQCONTROL_out,
        PIPETX4EQDEEMPH      => PIPETX4EQDEEMPH_out,
        PIPETX4EQPRESET      => PIPETX4EQPRESET_out,
        PIPETX4MARGIN        => PIPETX4MARGIN_out,
        PIPETX4POWERDOWN     => PIPETX4POWERDOWN_out,
        PIPETX4RATE          => PIPETX4RATE_out,
        PIPETX4RCVRDET       => PIPETX4RCVRDET_out,
        PIPETX4RESET         => PIPETX4RESET_out,
        PIPETX4STARTBLOCK    => PIPETX4STARTBLOCK_out,
        PIPETX4SWING         => PIPETX4SWING_out,
        PIPETX4SYNCHEADER    => PIPETX4SYNCHEADER_out,
        PIPETX5CHARISK       => PIPETX5CHARISK_out,
        PIPETX5COMPLIANCE    => PIPETX5COMPLIANCE_out,
        PIPETX5DATA          => PIPETX5DATA_out,
        PIPETX5DATAVALID     => PIPETX5DATAVALID_out,
        PIPETX5DEEMPH        => PIPETX5DEEMPH_out,
        PIPETX5ELECIDLE      => PIPETX5ELECIDLE_out,
        PIPETX5EQCONTROL     => PIPETX5EQCONTROL_out,
        PIPETX5EQDEEMPH      => PIPETX5EQDEEMPH_out,
        PIPETX5EQPRESET      => PIPETX5EQPRESET_out,
        PIPETX5MARGIN        => PIPETX5MARGIN_out,
        PIPETX5POWERDOWN     => PIPETX5POWERDOWN_out,
        PIPETX5RATE          => PIPETX5RATE_out,
        PIPETX5RCVRDET       => PIPETX5RCVRDET_out,
        PIPETX5RESET         => PIPETX5RESET_out,
        PIPETX5STARTBLOCK    => PIPETX5STARTBLOCK_out,
        PIPETX5SWING         => PIPETX5SWING_out,
        PIPETX5SYNCHEADER    => PIPETX5SYNCHEADER_out,
        PIPETX6CHARISK       => PIPETX6CHARISK_out,
        PIPETX6COMPLIANCE    => PIPETX6COMPLIANCE_out,
        PIPETX6DATA          => PIPETX6DATA_out,
        PIPETX6DATAVALID     => PIPETX6DATAVALID_out,
        PIPETX6DEEMPH        => PIPETX6DEEMPH_out,
        PIPETX6ELECIDLE      => PIPETX6ELECIDLE_out,
        PIPETX6EQCONTROL     => PIPETX6EQCONTROL_out,
        PIPETX6EQDEEMPH      => PIPETX6EQDEEMPH_out,
        PIPETX6EQPRESET      => PIPETX6EQPRESET_out,
        PIPETX6MARGIN        => PIPETX6MARGIN_out,
        PIPETX6POWERDOWN     => PIPETX6POWERDOWN_out,
        PIPETX6RATE          => PIPETX6RATE_out,
        PIPETX6RCVRDET       => PIPETX6RCVRDET_out,
        PIPETX6RESET         => PIPETX6RESET_out,
        PIPETX6STARTBLOCK    => PIPETX6STARTBLOCK_out,
        PIPETX6SWING         => PIPETX6SWING_out,
        PIPETX6SYNCHEADER    => PIPETX6SYNCHEADER_out,
        PIPETX7CHARISK       => PIPETX7CHARISK_out,
        PIPETX7COMPLIANCE    => PIPETX7COMPLIANCE_out,
        PIPETX7DATA          => PIPETX7DATA_out,
        PIPETX7DATAVALID     => PIPETX7DATAVALID_out,
        PIPETX7DEEMPH        => PIPETX7DEEMPH_out,
        PIPETX7ELECIDLE      => PIPETX7ELECIDLE_out,
        PIPETX7EQCONTROL     => PIPETX7EQCONTROL_out,
        PIPETX7EQDEEMPH      => PIPETX7EQDEEMPH_out,
        PIPETX7EQPRESET      => PIPETX7EQPRESET_out,
        PIPETX7MARGIN        => PIPETX7MARGIN_out,
        PIPETX7POWERDOWN     => PIPETX7POWERDOWN_out,
        PIPETX7RATE          => PIPETX7RATE_out,
        PIPETX7RCVRDET       => PIPETX7RCVRDET_out,
        PIPETX7RESET         => PIPETX7RESET_out,
        PIPETX7STARTBLOCK    => PIPETX7STARTBLOCK_out,
        PIPETX7SWING         => PIPETX7SWING_out,
        PIPETX7SYNCHEADER    => PIPETX7SYNCHEADER_out,
        PLEQINPROGRESS       => PLEQINPROGRESS_out,
        PLEQPHASE            => PLEQPHASE_out,
        PMVOUT               => PMVOUT_out,
        SAXISCCTREADY        => SAXISCCTREADY_out,
        SAXISRQTREADY        => SAXISRQTREADY_out,
        SCANOUT              => SCANOUT_out,
        SPAREOUT             => SPAREOUT_out,
        XILUNCONNBOUT        => XILUNCONNBOUT_out,
        XILUNCONNOUT         => XILUNCONNOUT_out,
        CFGCONFIGSPACEENABLE => CFGCONFIGSPACEENABLE_in,
        CFGDEVID             => CFGDEVID_in,
        CFGDSBUSNUMBER       => CFGDSBUSNUMBER_in,
        CFGDSDEVICENUMBER    => CFGDSDEVICENUMBER_in,
        CFGDSFUNCTIONNUMBER  => CFGDSFUNCTIONNUMBER_in,
        CFGDSN               => CFGDSN_in,
        CFGDSPORTNUMBER      => CFGDSPORTNUMBER_in,
        CFGERRCORIN          => CFGERRCORIN_in,
        CFGERRUNCORIN        => CFGERRUNCORIN_in,
        CFGEXTREADDATA       => CFGEXTREADDATA_in,
        CFGEXTREADDATAVALID  => CFGEXTREADDATAVALID_in,
        CFGFCSEL             => CFGFCSEL_in,
        CFGFLRDONE           => CFGFLRDONE_in,
        CFGHOTRESETIN        => CFGHOTRESETIN_in,
        CFGINTERRUPTINT      => CFGINTERRUPTINT_in,
        CFGINTERRUPTMSIATTR  => CFGINTERRUPTMSIATTR_in,
        CFGINTERRUPTMSIFUNCTIONNUMBER => CFGINTERRUPTMSIFUNCTIONNUMBER_in,
        CFGINTERRUPTMSIINT   => CFGINTERRUPTMSIINT_in,
        CFGINTERRUPTMSIPENDINGSTATUS => CFGINTERRUPTMSIPENDINGSTATUS_in,
        CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE => CFGINTERRUPTMSIPENDINGSTATUSDATAENABLE_in,
        CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM => CFGINTERRUPTMSIPENDINGSTATUSFUNCTIONNUM_in,
        CFGINTERRUPTMSISELECT => CFGINTERRUPTMSISELECT_in,
        CFGINTERRUPTMSITPHPRESENT => CFGINTERRUPTMSITPHPRESENT_in,
        CFGINTERRUPTMSITPHSTTAG => CFGINTERRUPTMSITPHSTTAG_in,
        CFGINTERRUPTMSITPHTYPE => CFGINTERRUPTMSITPHTYPE_in,
        CFGINTERRUPTMSIXADDRESS => CFGINTERRUPTMSIXADDRESS_in,
        CFGINTERRUPTMSIXDATA => CFGINTERRUPTMSIXDATA_in,
        CFGINTERRUPTMSIXINT  => CFGINTERRUPTMSIXINT_in,
        CFGINTERRUPTPENDING  => CFGINTERRUPTPENDING_in,
        CFGLINKTRAININGENABLE => CFGLINKTRAININGENABLE_in,
        CFGMGMTADDR          => CFGMGMTADDR_in,
        CFGMGMTBYTEENABLE    => CFGMGMTBYTEENABLE_in,
        CFGMGMTREAD          => CFGMGMTREAD_in,
        CFGMGMTTYPE1CFGREGACCESS => CFGMGMTTYPE1CFGREGACCESS_in,
        CFGMGMTWRITE         => CFGMGMTWRITE_in,
        CFGMGMTWRITEDATA     => CFGMGMTWRITEDATA_in,
        CFGMSGTRANSMIT       => CFGMSGTRANSMIT_in,
        CFGMSGTRANSMITDATA   => CFGMSGTRANSMITDATA_in,
        CFGMSGTRANSMITTYPE   => CFGMSGTRANSMITTYPE_in,
        CFGPERFUNCSTATUSCONTROL => CFGPERFUNCSTATUSCONTROL_in,
        CFGPERFUNCTIONNUMBER => CFGPERFUNCTIONNUMBER_in,
        CFGPERFUNCTIONOUTPUTREQUEST => CFGPERFUNCTIONOUTPUTREQUEST_in,
        CFGPOWERSTATECHANGEACK => CFGPOWERSTATECHANGEACK_in,
        CFGREQPMTRANSITIONL23READY => CFGREQPMTRANSITIONL23READY_in,
        CFGREVID             => CFGREVID_in,
        CFGSUBSYSID          => CFGSUBSYSID_in,
        CFGSUBSYSVENDID      => CFGSUBSYSVENDID_in,
        CFGTPHSTTREADDATA    => CFGTPHSTTREADDATA_in,
        CFGTPHSTTREADDATAVALID => CFGTPHSTTREADDATAVALID_in,
        CFGVENDID            => CFGVENDID_in,
        CFGVFFLRDONE         => CFGVFFLRDONE_in,
        CONFMCAPREQUESTBYCONF => CONFMCAPREQUESTBYCONF_in,
        CONFREQDATA          => CONFREQDATA_in,
        CONFREQREGNUM        => CONFREQREGNUM_in,
        CONFREQTYPE          => CONFREQTYPE_in,
        CONFREQVALID         => CONFREQVALID_in,
        CORECLK              => CORECLK_in,
        CORECLKMICOMPLETIONRAML => CORECLKMICOMPLETIONRAML_in,
        CORECLKMICOMPLETIONRAMU => CORECLKMICOMPLETIONRAMU_in,
        CORECLKMIREPLAYRAM   => CORECLKMIREPLAYRAM_in,
        CORECLKMIREQUESTRAM  => CORECLKMIREQUESTRAM_in,
        DBGCFGLOCALMGMTREGOVERRIDE => DBGCFGLOCALMGMTREGOVERRIDE_in,
        DBGDATASEL           => DBGDATASEL_in,
        DRPADDR              => DRPADDR_in,
        DRPCLK               => DRPCLK_in,
        DRPDI                => DRPDI_in,
        DRPEN                => DRPEN_in,
        DRPWE                => DRPWE_in,
        LL2LMSAXISTXTUSER    => LL2LMSAXISTXTUSER_in,
        LL2LMSAXISTXTVALID   => LL2LMSAXISTXTVALID_in,
        LL2LMTXTLPID0        => LL2LMTXTLPID0_in,
        LL2LMTXTLPID1        => LL2LMTXTLPID1_in,
        MAXISCQTREADY        => MAXISCQTREADY_in,
        MAXISRCTREADY        => MAXISRCTREADY_in,
        MCAPCLK              => MCAPCLK_in,
        MCAPPERST0B          => MCAPPERST0B_in,
        MCAPPERST1B          => MCAPPERST1B_in,
        MGMTRESETN           => MGMTRESETN_in,
        MGMTSTICKYRESETN     => MGMTSTICKYRESETN_in,
        MICOMPLETIONRAMREADDATA => MICOMPLETIONRAMREADDATA_in,
        MIREPLAYRAMREADDATA  => MIREPLAYRAMREADDATA_in,
        MIREQUESTRAMREADDATA => MIREQUESTRAMREADDATA_in,
        PCIECQNPREQ          => PCIECQNPREQ_in,
        PIPECLK              => PIPECLK_in,
        PIPEEQFS             => PIPEEQFS_in,
        PIPEEQLF             => PIPEEQLF_in,
        PIPERESETN           => PIPERESETN_in,
        PIPERX0CHARISK       => PIPERX0CHARISK_in,
        PIPERX0DATA          => PIPERX0DATA_in,
        PIPERX0DATAVALID     => PIPERX0DATAVALID_in,
        PIPERX0ELECIDLE      => PIPERX0ELECIDLE_in,
        PIPERX0EQDONE        => PIPERX0EQDONE_in,
        PIPERX0EQLPADAPTDONE => PIPERX0EQLPADAPTDONE_in,
        PIPERX0EQLPLFFSSEL   => PIPERX0EQLPLFFSSEL_in,
        PIPERX0EQLPNEWTXCOEFFORPRESET => PIPERX0EQLPNEWTXCOEFFORPRESET_in,
        PIPERX0PHYSTATUS     => PIPERX0PHYSTATUS_in,
        PIPERX0STARTBLOCK    => PIPERX0STARTBLOCK_in,
        PIPERX0STATUS        => PIPERX0STATUS_in,
        PIPERX0SYNCHEADER    => PIPERX0SYNCHEADER_in,
        PIPERX0VALID         => PIPERX0VALID_in,
        PIPERX1CHARISK       => PIPERX1CHARISK_in,
        PIPERX1DATA          => PIPERX1DATA_in,
        PIPERX1DATAVALID     => PIPERX1DATAVALID_in,
        PIPERX1ELECIDLE      => PIPERX1ELECIDLE_in,
        PIPERX1EQDONE        => PIPERX1EQDONE_in,
        PIPERX1EQLPADAPTDONE => PIPERX1EQLPADAPTDONE_in,
        PIPERX1EQLPLFFSSEL   => PIPERX1EQLPLFFSSEL_in,
        PIPERX1EQLPNEWTXCOEFFORPRESET => PIPERX1EQLPNEWTXCOEFFORPRESET_in,
        PIPERX1PHYSTATUS     => PIPERX1PHYSTATUS_in,
        PIPERX1STARTBLOCK    => PIPERX1STARTBLOCK_in,
        PIPERX1STATUS        => PIPERX1STATUS_in,
        PIPERX1SYNCHEADER    => PIPERX1SYNCHEADER_in,
        PIPERX1VALID         => PIPERX1VALID_in,
        PIPERX2CHARISK       => PIPERX2CHARISK_in,
        PIPERX2DATA          => PIPERX2DATA_in,
        PIPERX2DATAVALID     => PIPERX2DATAVALID_in,
        PIPERX2ELECIDLE      => PIPERX2ELECIDLE_in,
        PIPERX2EQDONE        => PIPERX2EQDONE_in,
        PIPERX2EQLPADAPTDONE => PIPERX2EQLPADAPTDONE_in,
        PIPERX2EQLPLFFSSEL   => PIPERX2EQLPLFFSSEL_in,
        PIPERX2EQLPNEWTXCOEFFORPRESET => PIPERX2EQLPNEWTXCOEFFORPRESET_in,
        PIPERX2PHYSTATUS     => PIPERX2PHYSTATUS_in,
        PIPERX2STARTBLOCK    => PIPERX2STARTBLOCK_in,
        PIPERX2STATUS        => PIPERX2STATUS_in,
        PIPERX2SYNCHEADER    => PIPERX2SYNCHEADER_in,
        PIPERX2VALID         => PIPERX2VALID_in,
        PIPERX3CHARISK       => PIPERX3CHARISK_in,
        PIPERX3DATA          => PIPERX3DATA_in,
        PIPERX3DATAVALID     => PIPERX3DATAVALID_in,
        PIPERX3ELECIDLE      => PIPERX3ELECIDLE_in,
        PIPERX3EQDONE        => PIPERX3EQDONE_in,
        PIPERX3EQLPADAPTDONE => PIPERX3EQLPADAPTDONE_in,
        PIPERX3EQLPLFFSSEL   => PIPERX3EQLPLFFSSEL_in,
        PIPERX3EQLPNEWTXCOEFFORPRESET => PIPERX3EQLPNEWTXCOEFFORPRESET_in,
        PIPERX3PHYSTATUS     => PIPERX3PHYSTATUS_in,
        PIPERX3STARTBLOCK    => PIPERX3STARTBLOCK_in,
        PIPERX3STATUS        => PIPERX3STATUS_in,
        PIPERX3SYNCHEADER    => PIPERX3SYNCHEADER_in,
        PIPERX3VALID         => PIPERX3VALID_in,
        PIPERX4CHARISK       => PIPERX4CHARISK_in,
        PIPERX4DATA          => PIPERX4DATA_in,
        PIPERX4DATAVALID     => PIPERX4DATAVALID_in,
        PIPERX4ELECIDLE      => PIPERX4ELECIDLE_in,
        PIPERX4EQDONE        => PIPERX4EQDONE_in,
        PIPERX4EQLPADAPTDONE => PIPERX4EQLPADAPTDONE_in,
        PIPERX4EQLPLFFSSEL   => PIPERX4EQLPLFFSSEL_in,
        PIPERX4EQLPNEWTXCOEFFORPRESET => PIPERX4EQLPNEWTXCOEFFORPRESET_in,
        PIPERX4PHYSTATUS     => PIPERX4PHYSTATUS_in,
        PIPERX4STARTBLOCK    => PIPERX4STARTBLOCK_in,
        PIPERX4STATUS        => PIPERX4STATUS_in,
        PIPERX4SYNCHEADER    => PIPERX4SYNCHEADER_in,
        PIPERX4VALID         => PIPERX4VALID_in,
        PIPERX5CHARISK       => PIPERX5CHARISK_in,
        PIPERX5DATA          => PIPERX5DATA_in,
        PIPERX5DATAVALID     => PIPERX5DATAVALID_in,
        PIPERX5ELECIDLE      => PIPERX5ELECIDLE_in,
        PIPERX5EQDONE        => PIPERX5EQDONE_in,
        PIPERX5EQLPADAPTDONE => PIPERX5EQLPADAPTDONE_in,
        PIPERX5EQLPLFFSSEL   => PIPERX5EQLPLFFSSEL_in,
        PIPERX5EQLPNEWTXCOEFFORPRESET => PIPERX5EQLPNEWTXCOEFFORPRESET_in,
        PIPERX5PHYSTATUS     => PIPERX5PHYSTATUS_in,
        PIPERX5STARTBLOCK    => PIPERX5STARTBLOCK_in,
        PIPERX5STATUS        => PIPERX5STATUS_in,
        PIPERX5SYNCHEADER    => PIPERX5SYNCHEADER_in,
        PIPERX5VALID         => PIPERX5VALID_in,
        PIPERX6CHARISK       => PIPERX6CHARISK_in,
        PIPERX6DATA          => PIPERX6DATA_in,
        PIPERX6DATAVALID     => PIPERX6DATAVALID_in,
        PIPERX6ELECIDLE      => PIPERX6ELECIDLE_in,
        PIPERX6EQDONE        => PIPERX6EQDONE_in,
        PIPERX6EQLPADAPTDONE => PIPERX6EQLPADAPTDONE_in,
        PIPERX6EQLPLFFSSEL   => PIPERX6EQLPLFFSSEL_in,
        PIPERX6EQLPNEWTXCOEFFORPRESET => PIPERX6EQLPNEWTXCOEFFORPRESET_in,
        PIPERX6PHYSTATUS     => PIPERX6PHYSTATUS_in,
        PIPERX6STARTBLOCK    => PIPERX6STARTBLOCK_in,
        PIPERX6STATUS        => PIPERX6STATUS_in,
        PIPERX6SYNCHEADER    => PIPERX6SYNCHEADER_in,
        PIPERX6VALID         => PIPERX6VALID_in,
        PIPERX7CHARISK       => PIPERX7CHARISK_in,
        PIPERX7DATA          => PIPERX7DATA_in,
        PIPERX7DATAVALID     => PIPERX7DATAVALID_in,
        PIPERX7ELECIDLE      => PIPERX7ELECIDLE_in,
        PIPERX7EQDONE        => PIPERX7EQDONE_in,
        PIPERX7EQLPADAPTDONE => PIPERX7EQLPADAPTDONE_in,
        PIPERX7EQLPLFFSSEL   => PIPERX7EQLPLFFSSEL_in,
        PIPERX7EQLPNEWTXCOEFFORPRESET => PIPERX7EQLPNEWTXCOEFFORPRESET_in,
        PIPERX7PHYSTATUS     => PIPERX7PHYSTATUS_in,
        PIPERX7STARTBLOCK    => PIPERX7STARTBLOCK_in,
        PIPERX7STATUS        => PIPERX7STATUS_in,
        PIPERX7SYNCHEADER    => PIPERX7SYNCHEADER_in,
        PIPERX7VALID         => PIPERX7VALID_in,
        PIPETX0EQCOEFF       => PIPETX0EQCOEFF_in,
        PIPETX0EQDONE        => PIPETX0EQDONE_in,
        PIPETX1EQCOEFF       => PIPETX1EQCOEFF_in,
        PIPETX1EQDONE        => PIPETX1EQDONE_in,
        PIPETX2EQCOEFF       => PIPETX2EQCOEFF_in,
        PIPETX2EQDONE        => PIPETX2EQDONE_in,
        PIPETX3EQCOEFF       => PIPETX3EQCOEFF_in,
        PIPETX3EQDONE        => PIPETX3EQDONE_in,
        PIPETX4EQCOEFF       => PIPETX4EQCOEFF_in,
        PIPETX4EQDONE        => PIPETX4EQDONE_in,
        PIPETX5EQCOEFF       => PIPETX5EQCOEFF_in,
        PIPETX5EQDONE        => PIPETX5EQDONE_in,
        PIPETX6EQCOEFF       => PIPETX6EQCOEFF_in,
        PIPETX6EQDONE        => PIPETX6EQDONE_in,
        PIPETX7EQCOEFF       => PIPETX7EQCOEFF_in,
        PIPETX7EQDONE        => PIPETX7EQDONE_in,
        PLEQRESETEIEOSCOUNT  => PLEQRESETEIEOSCOUNT_in,
        PLGEN2UPSTREAMPREFERDEEMPH => PLGEN2UPSTREAMPREFERDEEMPH_in,
        PMVDIVIDE            => PMVDIVIDE_in,
        PMVENABLEN           => PMVENABLEN_in,
        PMVSELECT            => PMVSELECT_in,
        RESETN               => RESETN_in,
        SAXISCCTDATA         => SAXISCCTDATA_in,
        SAXISCCTKEEP         => SAXISCCTKEEP_in,
        SAXISCCTLAST         => SAXISCCTLAST_in,
        SAXISCCTUSER         => SAXISCCTUSER_in,
        SAXISCCTVALID        => SAXISCCTVALID_in,
        SAXISRQTDATA         => SAXISRQTDATA_in,
        SAXISRQTKEEP         => SAXISRQTKEEP_in,
        SAXISRQTLAST         => SAXISRQTLAST_in,
        SAXISRQTUSER         => SAXISRQTUSER_in,
        SAXISRQTVALID        => SAXISRQTVALID_in,
        SCANENABLEN          => SCANENABLEN_in,
        SCANIN               => SCANIN_in,
        SCANMODEN            => SCANMODEN_in,
        SPAREIN              => SPAREIN_in,
        USERCLK              => USERCLK_in,
        XILUNCONNBYP         => XILUNCONNBYP_in,
        XILUNCONNCLK         => XILUNCONNCLK_in,
        XILUNCONNIN          => XILUNCONNIN_in,
        GSR                  => glblGSR        
      );
  
  INIPROC : process
  begin
-------- ARI_CAP_ENABLE check
  -- case ARI_CAP_ENABLE is
    if((ARI_CAP_ENABLE = "FALSE") or (ARI_CAP_ENABLE = "false")) then
      null;
    elsif((ARI_CAP_ENABLE = "TRUE") or (ARI_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : ARI_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_CC_ALIGNMENT_MODE check
  -- case AXISTEN_IF_CC_ALIGNMENT_MODE is
    if((AXISTEN_IF_CC_ALIGNMENT_MODE = "FALSE") or (AXISTEN_IF_CC_ALIGNMENT_MODE = "false")) then
      null;
    elsif((AXISTEN_IF_CC_ALIGNMENT_MODE = "TRUE") or (AXISTEN_IF_CC_ALIGNMENT_MODE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_CC_ALIGNMENT_MODE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_CC_PARITY_CHK check
  -- case AXISTEN_IF_CC_PARITY_CHK is
    if((AXISTEN_IF_CC_PARITY_CHK = "TRUE") or (AXISTEN_IF_CC_PARITY_CHK = "true")) then
      null;
    elsif((AXISTEN_IF_CC_PARITY_CHK = "FALSE") or (AXISTEN_IF_CC_PARITY_CHK = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_CC_PARITY_CHK is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_CQ_ALIGNMENT_MODE check
  -- case AXISTEN_IF_CQ_ALIGNMENT_MODE is
    if((AXISTEN_IF_CQ_ALIGNMENT_MODE = "FALSE") or (AXISTEN_IF_CQ_ALIGNMENT_MODE = "false")) then
      null;
    elsif((AXISTEN_IF_CQ_ALIGNMENT_MODE = "TRUE") or (AXISTEN_IF_CQ_ALIGNMENT_MODE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_CQ_ALIGNMENT_MODE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_ENABLE_CLIENT_TAG check
  -- case AXISTEN_IF_ENABLE_CLIENT_TAG is
    if((AXISTEN_IF_ENABLE_CLIENT_TAG = "FALSE") or (AXISTEN_IF_ENABLE_CLIENT_TAG = "false")) then
      null;
    elsif((AXISTEN_IF_ENABLE_CLIENT_TAG = "TRUE") or (AXISTEN_IF_ENABLE_CLIENT_TAG = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_ENABLE_CLIENT_TAG is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_ENABLE_MSG_ROUTE check
  -- AXISTEN_IF_ENABLE_MSG_ROUTE_BIN <= AXISTEN_IF_ENABLE_MSG_ROUTE;
-------- AXISTEN_IF_ENABLE_RX_MSG_INTFC check
  -- case AXISTEN_IF_ENABLE_RX_MSG_INTFC is
    if((AXISTEN_IF_ENABLE_RX_MSG_INTFC = "FALSE") or (AXISTEN_IF_ENABLE_RX_MSG_INTFC = "false")) then
      null;
    elsif((AXISTEN_IF_ENABLE_RX_MSG_INTFC = "TRUE") or (AXISTEN_IF_ENABLE_RX_MSG_INTFC = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_ENABLE_RX_MSG_INTFC is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_RC_ALIGNMENT_MODE check
  -- case AXISTEN_IF_RC_ALIGNMENT_MODE is
    if((AXISTEN_IF_RC_ALIGNMENT_MODE = "FALSE") or (AXISTEN_IF_RC_ALIGNMENT_MODE = "false")) then
      null;
    elsif((AXISTEN_IF_RC_ALIGNMENT_MODE = "TRUE") or (AXISTEN_IF_RC_ALIGNMENT_MODE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_RC_ALIGNMENT_MODE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_RC_STRADDLE check
  -- case AXISTEN_IF_RC_STRADDLE is
    if((AXISTEN_IF_RC_STRADDLE = "FALSE") or (AXISTEN_IF_RC_STRADDLE = "false")) then
      null;
    elsif((AXISTEN_IF_RC_STRADDLE = "TRUE") or (AXISTEN_IF_RC_STRADDLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_RC_STRADDLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_RQ_ALIGNMENT_MODE check
  -- case AXISTEN_IF_RQ_ALIGNMENT_MODE is
    if((AXISTEN_IF_RQ_ALIGNMENT_MODE = "FALSE") or (AXISTEN_IF_RQ_ALIGNMENT_MODE = "false")) then
      null;
    elsif((AXISTEN_IF_RQ_ALIGNMENT_MODE = "TRUE") or (AXISTEN_IF_RQ_ALIGNMENT_MODE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_RQ_ALIGNMENT_MODE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_RQ_PARITY_CHK check
  -- case AXISTEN_IF_RQ_PARITY_CHK is
    if((AXISTEN_IF_RQ_PARITY_CHK = "TRUE") or (AXISTEN_IF_RQ_PARITY_CHK = "true")) then
      null;
    elsif((AXISTEN_IF_RQ_PARITY_CHK = "FALSE") or (AXISTEN_IF_RQ_PARITY_CHK = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : AXISTEN_IF_RQ_PARITY_CHK is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- AXISTEN_IF_WIDTH check
  -- AXISTEN_IF_WIDTH_BIN <= AXISTEN_IF_WIDTH;
-------- CRM_CORE_CLK_FREQ_500 check
  -- case CRM_CORE_CLK_FREQ_500 is
    if((CRM_CORE_CLK_FREQ_500 = "TRUE") or (CRM_CORE_CLK_FREQ_500 = "true")) then
      null;
    elsif((CRM_CORE_CLK_FREQ_500 = "FALSE") or (CRM_CORE_CLK_FREQ_500 = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : CRM_CORE_CLK_FREQ_500 is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- CRM_USER_CLK_FREQ check
  -- CRM_USER_CLK_FREQ_BIN <= CRM_USER_CLK_FREQ;
-------- DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE check
  -- case DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE is
    if((DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE = "FALSE") or (DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE = "false")) then
      null;
    elsif((DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE = "TRUE") or (DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : DEBUG_CFG_LOCAL_MGMT_REG_ACCESS_OVERRIDE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- DEBUG_PL_DISABLE_EI_INFER_IN_L0 check
  -- case DEBUG_PL_DISABLE_EI_INFER_IN_L0 is
    if((DEBUG_PL_DISABLE_EI_INFER_IN_L0 = "FALSE") or (DEBUG_PL_DISABLE_EI_INFER_IN_L0 = "false")) then
      null;
    elsif((DEBUG_PL_DISABLE_EI_INFER_IN_L0 = "TRUE") or (DEBUG_PL_DISABLE_EI_INFER_IN_L0 = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : DEBUG_PL_DISABLE_EI_INFER_IN_L0 is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS check
  -- case DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS is
    if((DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS = "FALSE") or (DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS = "false")) then
      null;
    elsif((DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS = "TRUE") or (DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : DEBUG_TL_DISABLE_RX_TLP_ORDER_CHECKS is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- DNSTREAM_LINK_NUM check
  -- DNSTREAM_LINK_NUM_BIN <= DNSTREAM_LINK_NUM;
-------- LL_ACK_TIMEOUT check
  -- LL_ACK_TIMEOUT_BIN <= LL_ACK_TIMEOUT;
-------- LL_ACK_TIMEOUT_EN check
  -- case LL_ACK_TIMEOUT_EN is
    if((LL_ACK_TIMEOUT_EN = "FALSE") or (LL_ACK_TIMEOUT_EN = "false")) then
      null;
    elsif((LL_ACK_TIMEOUT_EN = "TRUE") or (LL_ACK_TIMEOUT_EN = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LL_ACK_TIMEOUT_EN is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LL_ACK_TIMEOUT_FUNC check
  case LL_ACK_TIMEOUT_FUNC is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : LL_ACK_TIMEOUT_FUNC is not in range 0 .. 3." severity warning;
    end case;
-------- LL_CPL_FC_UPDATE_TIMER check
  -- LL_CPL_FC_UPDATE_TIMER_BIN <= LL_CPL_FC_UPDATE_TIMER;
-------- LL_CPL_FC_UPDATE_TIMER_OVERRIDE check
  -- case LL_CPL_FC_UPDATE_TIMER_OVERRIDE is
    if((LL_CPL_FC_UPDATE_TIMER_OVERRIDE = "FALSE") or (LL_CPL_FC_UPDATE_TIMER_OVERRIDE = "false")) then
      null;
    elsif((LL_CPL_FC_UPDATE_TIMER_OVERRIDE = "TRUE") or (LL_CPL_FC_UPDATE_TIMER_OVERRIDE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LL_CPL_FC_UPDATE_TIMER_OVERRIDE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LL_FC_UPDATE_TIMER check
  -- LL_FC_UPDATE_TIMER_BIN <= LL_FC_UPDATE_TIMER;
-------- LL_FC_UPDATE_TIMER_OVERRIDE check
  -- case LL_FC_UPDATE_TIMER_OVERRIDE is
    if((LL_FC_UPDATE_TIMER_OVERRIDE = "FALSE") or (LL_FC_UPDATE_TIMER_OVERRIDE = "false")) then
      null;
    elsif((LL_FC_UPDATE_TIMER_OVERRIDE = "TRUE") or (LL_FC_UPDATE_TIMER_OVERRIDE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LL_FC_UPDATE_TIMER_OVERRIDE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LL_NP_FC_UPDATE_TIMER check
  -- LL_NP_FC_UPDATE_TIMER_BIN <= LL_NP_FC_UPDATE_TIMER;
-------- LL_NP_FC_UPDATE_TIMER_OVERRIDE check
  -- case LL_NP_FC_UPDATE_TIMER_OVERRIDE is
    if((LL_NP_FC_UPDATE_TIMER_OVERRIDE = "FALSE") or (LL_NP_FC_UPDATE_TIMER_OVERRIDE = "false")) then
      null;
    elsif((LL_NP_FC_UPDATE_TIMER_OVERRIDE = "TRUE") or (LL_NP_FC_UPDATE_TIMER_OVERRIDE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LL_NP_FC_UPDATE_TIMER_OVERRIDE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LL_P_FC_UPDATE_TIMER check
  -- LL_P_FC_UPDATE_TIMER_BIN <= LL_P_FC_UPDATE_TIMER;
-------- LL_P_FC_UPDATE_TIMER_OVERRIDE check
  -- case LL_P_FC_UPDATE_TIMER_OVERRIDE is
    if((LL_P_FC_UPDATE_TIMER_OVERRIDE = "FALSE") or (LL_P_FC_UPDATE_TIMER_OVERRIDE = "false")) then
      null;
    elsif((LL_P_FC_UPDATE_TIMER_OVERRIDE = "TRUE") or (LL_P_FC_UPDATE_TIMER_OVERRIDE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LL_P_FC_UPDATE_TIMER_OVERRIDE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LL_REPLAY_TIMEOUT check
  -- LL_REPLAY_TIMEOUT_BIN <= LL_REPLAY_TIMEOUT;
-------- LL_REPLAY_TIMEOUT_EN check
  -- case LL_REPLAY_TIMEOUT_EN is
    if((LL_REPLAY_TIMEOUT_EN = "FALSE") or (LL_REPLAY_TIMEOUT_EN = "false")) then
      null;
    elsif((LL_REPLAY_TIMEOUT_EN = "TRUE") or (LL_REPLAY_TIMEOUT_EN = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LL_REPLAY_TIMEOUT_EN is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LL_REPLAY_TIMEOUT_FUNC check
  case LL_REPLAY_TIMEOUT_FUNC is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : LL_REPLAY_TIMEOUT_FUNC is not in range 0 .. 3." severity warning;
    end case;
-------- LTR_TX_MESSAGE_MINIMUM_INTERVAL check
  -- LTR_TX_MESSAGE_MINIMUM_INTERVAL_BIN <= LTR_TX_MESSAGE_MINIMUM_INTERVAL;
-------- LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE check
  -- case LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE is
    if((LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE = "FALSE") or (LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE = "false")) then
      null;
    elsif((LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE = "TRUE") or (LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LTR_TX_MESSAGE_ON_FUNC_POWER_STATE_CHANGE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- LTR_TX_MESSAGE_ON_LTR_ENABLE check
  -- case LTR_TX_MESSAGE_ON_LTR_ENABLE is
    if((LTR_TX_MESSAGE_ON_LTR_ENABLE = "FALSE") or (LTR_TX_MESSAGE_ON_LTR_ENABLE = "false")) then
      null;
    elsif((LTR_TX_MESSAGE_ON_LTR_ENABLE = "TRUE") or (LTR_TX_MESSAGE_ON_LTR_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : LTR_TX_MESSAGE_ON_LTR_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_CAP_NEXTPTR check
  -- MCAP_CAP_NEXTPTR_BIN <= MCAP_CAP_NEXTPTR;
-------- MCAP_CONFIGURE_OVERRIDE check
  -- case MCAP_CONFIGURE_OVERRIDE is
    if((MCAP_CONFIGURE_OVERRIDE = "FALSE") or (MCAP_CONFIGURE_OVERRIDE = "false")) then
      null;
    elsif((MCAP_CONFIGURE_OVERRIDE = "TRUE") or (MCAP_CONFIGURE_OVERRIDE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_CONFIGURE_OVERRIDE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_ENABLE check
  -- case MCAP_ENABLE is
    if((MCAP_ENABLE = "FALSE") or (MCAP_ENABLE = "false")) then
      null;
    elsif((MCAP_ENABLE = "TRUE") or (MCAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_EOS_DESIGN_SWITCH check
  -- case MCAP_EOS_DESIGN_SWITCH is
    if((MCAP_EOS_DESIGN_SWITCH = "FALSE") or (MCAP_EOS_DESIGN_SWITCH = "false")) then
      null;
    elsif((MCAP_EOS_DESIGN_SWITCH = "TRUE") or (MCAP_EOS_DESIGN_SWITCH = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_EOS_DESIGN_SWITCH is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_FPGA_BITSTREAM_VERSION check
  -- MCAP_FPGA_BITSTREAM_VERSION_BIN <= MCAP_FPGA_BITSTREAM_VERSION;
-------- MCAP_GATE_IO_ENABLE_DESIGN_SWITCH check
  -- case MCAP_GATE_IO_ENABLE_DESIGN_SWITCH is
    if((MCAP_GATE_IO_ENABLE_DESIGN_SWITCH = "FALSE") or (MCAP_GATE_IO_ENABLE_DESIGN_SWITCH = "false")) then
      null;
    elsif((MCAP_GATE_IO_ENABLE_DESIGN_SWITCH = "TRUE") or (MCAP_GATE_IO_ENABLE_DESIGN_SWITCH = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_GATE_IO_ENABLE_DESIGN_SWITCH is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH check
  -- case MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH is
    if((MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH = "FALSE") or (MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH = "false")) then
      null;
    elsif((MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH = "TRUE") or (MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_GATE_MEM_ENABLE_DESIGN_SWITCH is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_INPUT_GATE_DESIGN_SWITCH check
  -- case MCAP_INPUT_GATE_DESIGN_SWITCH is
    if((MCAP_INPUT_GATE_DESIGN_SWITCH = "FALSE") or (MCAP_INPUT_GATE_DESIGN_SWITCH = "false")) then
      null;
    elsif((MCAP_INPUT_GATE_DESIGN_SWITCH = "TRUE") or (MCAP_INPUT_GATE_DESIGN_SWITCH = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_INPUT_GATE_DESIGN_SWITCH is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_INTERRUPT_ON_MCAP_EOS check
  -- case MCAP_INTERRUPT_ON_MCAP_EOS is
    if((MCAP_INTERRUPT_ON_MCAP_EOS = "FALSE") or (MCAP_INTERRUPT_ON_MCAP_EOS = "false")) then
      null;
    elsif((MCAP_INTERRUPT_ON_MCAP_EOS = "TRUE") or (MCAP_INTERRUPT_ON_MCAP_EOS = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_INTERRUPT_ON_MCAP_EOS is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_INTERRUPT_ON_MCAP_ERROR check
  -- case MCAP_INTERRUPT_ON_MCAP_ERROR is
    if((MCAP_INTERRUPT_ON_MCAP_ERROR = "FALSE") or (MCAP_INTERRUPT_ON_MCAP_ERROR = "false")) then
      null;
    elsif((MCAP_INTERRUPT_ON_MCAP_ERROR = "TRUE") or (MCAP_INTERRUPT_ON_MCAP_ERROR = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : MCAP_INTERRUPT_ON_MCAP_ERROR is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- MCAP_VSEC_ID check
  -- MCAP_VSEC_ID_BIN <= MCAP_VSEC_ID;
-------- MCAP_VSEC_LEN check
  -- MCAP_VSEC_LEN_BIN <= MCAP_VSEC_LEN;
-------- MCAP_VSEC_REV check
  -- MCAP_VSEC_REV_BIN <= MCAP_VSEC_REV;
-------- PF0_AER_CAP_ECRC_CHECK_CAPABLE check
  -- case PF0_AER_CAP_ECRC_CHECK_CAPABLE is
    if((PF0_AER_CAP_ECRC_CHECK_CAPABLE = "FALSE") or (PF0_AER_CAP_ECRC_CHECK_CAPABLE = "false")) then
      null;
    elsif((PF0_AER_CAP_ECRC_CHECK_CAPABLE = "TRUE") or (PF0_AER_CAP_ECRC_CHECK_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_AER_CAP_ECRC_CHECK_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_AER_CAP_ECRC_GEN_CAPABLE check
  -- case PF0_AER_CAP_ECRC_GEN_CAPABLE is
    if((PF0_AER_CAP_ECRC_GEN_CAPABLE = "FALSE") or (PF0_AER_CAP_ECRC_GEN_CAPABLE = "false")) then
      null;
    elsif((PF0_AER_CAP_ECRC_GEN_CAPABLE = "TRUE") or (PF0_AER_CAP_ECRC_GEN_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_AER_CAP_ECRC_GEN_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_AER_CAP_NEXTPTR check
  -- PF0_AER_CAP_NEXTPTR_BIN <= PF0_AER_CAP_NEXTPTR;
-------- PF0_ARI_CAP_NEXTPTR check
  -- PF0_ARI_CAP_NEXTPTR_BIN <= PF0_ARI_CAP_NEXTPTR;
-------- PF0_ARI_CAP_NEXT_FUNC check
  -- PF0_ARI_CAP_NEXT_FUNC_BIN <= PF0_ARI_CAP_NEXT_FUNC;
-------- PF0_ARI_CAP_VER check
  -- PF0_ARI_CAP_VER_BIN <= PF0_ARI_CAP_VER;
-------- PF0_BAR0_APERTURE_SIZE check
  -- PF0_BAR0_APERTURE_SIZE_BIN <= PF0_BAR0_APERTURE_SIZE;
-------- PF0_BAR0_CONTROL check
  -- PF0_BAR0_CONTROL_BIN <= PF0_BAR0_CONTROL;
-------- PF0_BAR1_APERTURE_SIZE check
  -- PF0_BAR1_APERTURE_SIZE_BIN <= PF0_BAR1_APERTURE_SIZE;
-------- PF0_BAR1_CONTROL check
  -- PF0_BAR1_CONTROL_BIN <= PF0_BAR1_CONTROL;
-------- PF0_BAR2_APERTURE_SIZE check
  -- PF0_BAR2_APERTURE_SIZE_BIN <= PF0_BAR2_APERTURE_SIZE;
-------- PF0_BAR2_CONTROL check
  -- PF0_BAR2_CONTROL_BIN <= PF0_BAR2_CONTROL;
-------- PF0_BAR3_APERTURE_SIZE check
  -- PF0_BAR3_APERTURE_SIZE_BIN <= PF0_BAR3_APERTURE_SIZE;
-------- PF0_BAR3_CONTROL check
  -- PF0_BAR3_CONTROL_BIN <= PF0_BAR3_CONTROL;
-------- PF0_BAR4_APERTURE_SIZE check
  -- PF0_BAR4_APERTURE_SIZE_BIN <= PF0_BAR4_APERTURE_SIZE;
-------- PF0_BAR4_CONTROL check
  -- PF0_BAR4_CONTROL_BIN <= PF0_BAR4_CONTROL;
-------- PF0_BAR5_APERTURE_SIZE check
  -- PF0_BAR5_APERTURE_SIZE_BIN <= PF0_BAR5_APERTURE_SIZE;
-------- PF0_BAR5_CONTROL check
  -- PF0_BAR5_CONTROL_BIN <= PF0_BAR5_CONTROL;
-------- PF0_BIST_REGISTER check
  -- PF0_BIST_REGISTER_BIN <= PF0_BIST_REGISTER;
-------- PF0_CAPABILITY_POINTER check
  -- PF0_CAPABILITY_POINTER_BIN <= PF0_CAPABILITY_POINTER;
-------- PF0_CLASS_CODE check
  -- PF0_CLASS_CODE_BIN <= PF0_CLASS_CODE;
-------- PF0_DEVICE_ID check
  -- PF0_DEVICE_ID_BIN <= PF0_DEVICE_ID;
-------- PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT check
  -- case PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT is
    if((PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT = "TRUE") or (PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT = "true")) then
      null;
    elsif((PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT = "FALSE") or (PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT check
  -- case PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT is
    if((PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT = "TRUE") or (PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT = "true")) then
      null;
    elsif((PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT = "FALSE") or (PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT check
  -- case PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT is
    if((PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT = "TRUE") or (PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT = "true")) then
      null;
    elsif((PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT = "FALSE") or (PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP2_ARI_FORWARD_ENABLE check
  -- case PF0_DEV_CAP2_ARI_FORWARD_ENABLE is
    if((PF0_DEV_CAP2_ARI_FORWARD_ENABLE = "FALSE") or (PF0_DEV_CAP2_ARI_FORWARD_ENABLE = "false")) then
      null;
    elsif((PF0_DEV_CAP2_ARI_FORWARD_ENABLE = "TRUE") or (PF0_DEV_CAP2_ARI_FORWARD_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_ARI_FORWARD_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE check
  -- case PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE is
    if((PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE = "TRUE") or (PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE = "true")) then
      null;
    elsif((PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE = "FALSE") or (PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_CPL_TIMEOUT_DISABLE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP2_LTR_SUPPORT check
  -- case PF0_DEV_CAP2_LTR_SUPPORT is
    if((PF0_DEV_CAP2_LTR_SUPPORT = "TRUE") or (PF0_DEV_CAP2_LTR_SUPPORT = "true")) then
      null;
    elsif((PF0_DEV_CAP2_LTR_SUPPORT = "FALSE") or (PF0_DEV_CAP2_LTR_SUPPORT = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_LTR_SUPPORT is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP2_OBFF_SUPPORT check
  -- PF0_DEV_CAP2_OBFF_SUPPORT_BIN <= PF0_DEV_CAP2_OBFF_SUPPORT;
-------- PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT check
  -- case PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT is
    if((PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT = "FALSE") or (PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT = "false")) then
      null;
    elsif((PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT = "TRUE") or (PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP_ENDPOINT_L0S_LATENCY check
  case PF0_DEV_CAP_ENDPOINT_L0S_LATENCY is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP_ENDPOINT_L0S_LATENCY is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_DEV_CAP_ENDPOINT_L1_LATENCY check
  case PF0_DEV_CAP_ENDPOINT_L1_LATENCY is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP_ENDPOINT_L1_LATENCY is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_DEV_CAP_EXT_TAG_SUPPORTED check
  -- case PF0_DEV_CAP_EXT_TAG_SUPPORTED is
    if((PF0_DEV_CAP_EXT_TAG_SUPPORTED = "TRUE") or (PF0_DEV_CAP_EXT_TAG_SUPPORTED = "true")) then
      null;
    elsif((PF0_DEV_CAP_EXT_TAG_SUPPORTED = "FALSE") or (PF0_DEV_CAP_EXT_TAG_SUPPORTED = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP_EXT_TAG_SUPPORTED is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE check
  -- case PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE is
    if((PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE = "TRUE") or (PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE = "true")) then
      null;
    elsif((PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE = "FALSE") or (PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DEV_CAP_MAX_PAYLOAD_SIZE check
  -- PF0_DEV_CAP_MAX_PAYLOAD_SIZE_BIN <= PF0_DEV_CAP_MAX_PAYLOAD_SIZE;
-------- PF0_DPA_CAP_NEXTPTR check
  -- PF0_DPA_CAP_NEXTPTR_BIN <= PF0_DPA_CAP_NEXTPTR;
-------- PF0_DPA_CAP_SUB_STATE_CONTROL check
  -- PF0_DPA_CAP_SUB_STATE_CONTROL_BIN <= PF0_DPA_CAP_SUB_STATE_CONTROL;
-------- PF0_DPA_CAP_SUB_STATE_CONTROL_EN check
  -- case PF0_DPA_CAP_SUB_STATE_CONTROL_EN is
    if((PF0_DPA_CAP_SUB_STATE_CONTROL_EN = "TRUE") or (PF0_DPA_CAP_SUB_STATE_CONTROL_EN = "true")) then
      null;
    elsif((PF0_DPA_CAP_SUB_STATE_CONTROL_EN = "FALSE") or (PF0_DPA_CAP_SUB_STATE_CONTROL_EN = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_DPA_CAP_SUB_STATE_CONTROL_EN is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
-------- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 check
  -- PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_BIN <= PF0_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
-------- PF0_DPA_CAP_VER check
  -- PF0_DPA_CAP_VER_BIN <= PF0_DPA_CAP_VER;
-------- PF0_DSN_CAP_NEXTPTR check
  -- PF0_DSN_CAP_NEXTPTR_BIN <= PF0_DSN_CAP_NEXTPTR;
-------- PF0_EXPANSION_ROM_APERTURE_SIZE check
  -- PF0_EXPANSION_ROM_APERTURE_SIZE_BIN <= PF0_EXPANSION_ROM_APERTURE_SIZE;
-------- PF0_EXPANSION_ROM_ENABLE check
  -- case PF0_EXPANSION_ROM_ENABLE is
    if((PF0_EXPANSION_ROM_ENABLE = "FALSE") or (PF0_EXPANSION_ROM_ENABLE = "false")) then
      null;
    elsif((PF0_EXPANSION_ROM_ENABLE = "TRUE") or (PF0_EXPANSION_ROM_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_EXPANSION_ROM_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_INTERRUPT_LINE check
  -- PF0_INTERRUPT_LINE_BIN <= PF0_INTERRUPT_LINE;
-------- PF0_INTERRUPT_PIN check
  -- PF0_INTERRUPT_PIN_BIN <= PF0_INTERRUPT_PIN;
-------- PF0_LINK_CAP_ASPM_SUPPORT check
  case PF0_LINK_CAP_ASPM_SUPPORT is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_ASPM_SUPPORT is not in range 0 .. 3." severity warning;
    end case;
-------- PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 check
  case PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 check
  case PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3 check
  case PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN3 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1 check
  case PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN1 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2 check
  case PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN2 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3 check
  case PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L0S_EXIT_LATENCY_GEN3 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 check
  case PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 check
  case PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3 check
  case PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN3 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1 check
  case PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L1_EXIT_LATENCY_GEN1 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2 check
  case PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L1_EXIT_LATENCY_GEN2 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3 check
  case PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3 is
    when  7   =>  null;
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_CAP_L1_EXIT_LATENCY_GEN3 is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_LINK_STATUS_SLOT_CLOCK_CONFIG check
  -- case PF0_LINK_STATUS_SLOT_CLOCK_CONFIG is
    if((PF0_LINK_STATUS_SLOT_CLOCK_CONFIG = "TRUE") or (PF0_LINK_STATUS_SLOT_CLOCK_CONFIG = "true")) then
      null;
    elsif((PF0_LINK_STATUS_SLOT_CLOCK_CONFIG = "FALSE") or (PF0_LINK_STATUS_SLOT_CLOCK_CONFIG = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_LINK_STATUS_SLOT_CLOCK_CONFIG is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_LTR_CAP_MAX_NOSNOOP_LAT check
  -- PF0_LTR_CAP_MAX_NOSNOOP_LAT_BIN <= PF0_LTR_CAP_MAX_NOSNOOP_LAT;
-------- PF0_LTR_CAP_MAX_SNOOP_LAT check
  -- PF0_LTR_CAP_MAX_SNOOP_LAT_BIN <= PF0_LTR_CAP_MAX_SNOOP_LAT;
-------- PF0_LTR_CAP_NEXTPTR check
  -- PF0_LTR_CAP_NEXTPTR_BIN <= PF0_LTR_CAP_NEXTPTR;
-------- PF0_LTR_CAP_VER check
  -- PF0_LTR_CAP_VER_BIN <= PF0_LTR_CAP_VER;
-------- PF0_MSIX_CAP_NEXTPTR check
  -- PF0_MSIX_CAP_NEXTPTR_BIN <= PF0_MSIX_CAP_NEXTPTR;
-------- PF0_MSIX_CAP_PBA_BIR check
  case PF0_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_MSIX_CAP_PBA_OFFSET check
  -- PF0_MSIX_CAP_PBA_OFFSET_BIN <= PF0_MSIX_CAP_PBA_OFFSET;
-------- PF0_MSIX_CAP_TABLE_BIR check
  case PF0_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_MSIX_CAP_TABLE_OFFSET check
  -- PF0_MSIX_CAP_TABLE_OFFSET_BIN <= PF0_MSIX_CAP_TABLE_OFFSET;
-------- PF0_MSIX_CAP_TABLE_SIZE check
  -- PF0_MSIX_CAP_TABLE_SIZE_BIN <= PF0_MSIX_CAP_TABLE_SIZE;
-------- PF0_MSI_CAP_MULTIMSGCAP check
  case PF0_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF0_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- PF0_MSI_CAP_NEXTPTR check
  -- PF0_MSI_CAP_NEXTPTR_BIN <= PF0_MSI_CAP_NEXTPTR;
-------- PF0_MSI_CAP_PERVECMASKCAP check
  -- case PF0_MSI_CAP_PERVECMASKCAP is
    if((PF0_MSI_CAP_PERVECMASKCAP = "FALSE") or (PF0_MSI_CAP_PERVECMASKCAP = "false")) then
      null;
    elsif((PF0_MSI_CAP_PERVECMASKCAP = "TRUE") or (PF0_MSI_CAP_PERVECMASKCAP = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_MSI_CAP_PERVECMASKCAP is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_PB_CAP_DATA_REG_D0 check
  -- PF0_PB_CAP_DATA_REG_D0_BIN <= PF0_PB_CAP_DATA_REG_D0;
-------- PF0_PB_CAP_DATA_REG_D0_SUSTAINED check
  -- PF0_PB_CAP_DATA_REG_D0_SUSTAINED_BIN <= PF0_PB_CAP_DATA_REG_D0_SUSTAINED;
-------- PF0_PB_CAP_DATA_REG_D1 check
  -- PF0_PB_CAP_DATA_REG_D1_BIN <= PF0_PB_CAP_DATA_REG_D1;
-------- PF0_PB_CAP_DATA_REG_D3HOT check
  -- PF0_PB_CAP_DATA_REG_D3HOT_BIN <= PF0_PB_CAP_DATA_REG_D3HOT;
-------- PF0_PB_CAP_NEXTPTR check
  -- PF0_PB_CAP_NEXTPTR_BIN <= PF0_PB_CAP_NEXTPTR;
-------- PF0_PB_CAP_SYSTEM_ALLOCATED check
  -- case PF0_PB_CAP_SYSTEM_ALLOCATED is
    if((PF0_PB_CAP_SYSTEM_ALLOCATED = "FALSE") or (PF0_PB_CAP_SYSTEM_ALLOCATED = "false")) then
      null;
    elsif((PF0_PB_CAP_SYSTEM_ALLOCATED = "TRUE") or (PF0_PB_CAP_SYSTEM_ALLOCATED = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_PB_CAP_SYSTEM_ALLOCATED is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_PB_CAP_VER check
  -- PF0_PB_CAP_VER_BIN <= PF0_PB_CAP_VER;
-------- PF0_PM_CAP_ID check
  -- PF0_PM_CAP_ID_BIN <= PF0_PM_CAP_ID;
-------- PF0_PM_CAP_NEXTPTR check
  -- PF0_PM_CAP_NEXTPTR_BIN <= PF0_PM_CAP_NEXTPTR;
-------- PF0_PM_CAP_PMESUPPORT_D0 check
  -- case PF0_PM_CAP_PMESUPPORT_D0 is
    if((PF0_PM_CAP_PMESUPPORT_D0 = "TRUE") or (PF0_PM_CAP_PMESUPPORT_D0 = "true")) then
      null;
    elsif((PF0_PM_CAP_PMESUPPORT_D0 = "FALSE") or (PF0_PM_CAP_PMESUPPORT_D0 = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_PM_CAP_PMESUPPORT_D0 is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_PM_CAP_PMESUPPORT_D1 check
  -- case PF0_PM_CAP_PMESUPPORT_D1 is
    if((PF0_PM_CAP_PMESUPPORT_D1 = "TRUE") or (PF0_PM_CAP_PMESUPPORT_D1 = "true")) then
      null;
    elsif((PF0_PM_CAP_PMESUPPORT_D1 = "FALSE") or (PF0_PM_CAP_PMESUPPORT_D1 = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_PM_CAP_PMESUPPORT_D1 is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_PM_CAP_PMESUPPORT_D3HOT check
  -- case PF0_PM_CAP_PMESUPPORT_D3HOT is
    if((PF0_PM_CAP_PMESUPPORT_D3HOT = "TRUE") or (PF0_PM_CAP_PMESUPPORT_D3HOT = "true")) then
      null;
    elsif((PF0_PM_CAP_PMESUPPORT_D3HOT = "FALSE") or (PF0_PM_CAP_PMESUPPORT_D3HOT = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_PM_CAP_PMESUPPORT_D3HOT is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_PM_CAP_SUPP_D1_STATE check
  -- case PF0_PM_CAP_SUPP_D1_STATE is
    if((PF0_PM_CAP_SUPP_D1_STATE = "TRUE") or (PF0_PM_CAP_SUPP_D1_STATE = "true")) then
      null;
    elsif((PF0_PM_CAP_SUPP_D1_STATE = "FALSE") or (PF0_PM_CAP_SUPP_D1_STATE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_PM_CAP_SUPP_D1_STATE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_PM_CAP_VER_ID check
  -- PF0_PM_CAP_VER_ID_BIN <= PF0_PM_CAP_VER_ID;
-------- PF0_PM_CSR_NOSOFTRESET check
  -- case PF0_PM_CSR_NOSOFTRESET is
    if((PF0_PM_CSR_NOSOFTRESET = "TRUE") or (PF0_PM_CSR_NOSOFTRESET = "true")) then
      null;
    elsif((PF0_PM_CSR_NOSOFTRESET = "FALSE") or (PF0_PM_CSR_NOSOFTRESET = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_PM_CSR_NOSOFTRESET is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_RBAR_CAP_ENABLE check
  -- case PF0_RBAR_CAP_ENABLE is
    if((PF0_RBAR_CAP_ENABLE = "FALSE") or (PF0_RBAR_CAP_ENABLE = "false")) then
      null;
    elsif((PF0_RBAR_CAP_ENABLE = "TRUE") or (PF0_RBAR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_RBAR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_RBAR_CAP_NEXTPTR check
  -- PF0_RBAR_CAP_NEXTPTR_BIN <= PF0_RBAR_CAP_NEXTPTR;
-------- PF0_RBAR_CAP_SIZE0 check
  -- PF0_RBAR_CAP_SIZE0_BIN <= PF0_RBAR_CAP_SIZE0;
-------- PF0_RBAR_CAP_SIZE1 check
  -- PF0_RBAR_CAP_SIZE1_BIN <= PF0_RBAR_CAP_SIZE1;
-------- PF0_RBAR_CAP_SIZE2 check
  -- PF0_RBAR_CAP_SIZE2_BIN <= PF0_RBAR_CAP_SIZE2;
-------- PF0_RBAR_CAP_VER check
  -- PF0_RBAR_CAP_VER_BIN <= PF0_RBAR_CAP_VER;
-------- PF0_RBAR_CONTROL_INDEX0 check
  -- PF0_RBAR_CONTROL_INDEX0_BIN <= PF0_RBAR_CONTROL_INDEX0;
-------- PF0_RBAR_CONTROL_INDEX1 check
  -- PF0_RBAR_CONTROL_INDEX1_BIN <= PF0_RBAR_CONTROL_INDEX1;
-------- PF0_RBAR_CONTROL_INDEX2 check
  -- PF0_RBAR_CONTROL_INDEX2_BIN <= PF0_RBAR_CONTROL_INDEX2;
-------- PF0_RBAR_CONTROL_SIZE0 check
  -- PF0_RBAR_CONTROL_SIZE0_BIN <= PF0_RBAR_CONTROL_SIZE0;
-------- PF0_RBAR_CONTROL_SIZE1 check
  -- PF0_RBAR_CONTROL_SIZE1_BIN <= PF0_RBAR_CONTROL_SIZE1;
-------- PF0_RBAR_CONTROL_SIZE2 check
  -- PF0_RBAR_CONTROL_SIZE2_BIN <= PF0_RBAR_CONTROL_SIZE2;
-------- PF0_RBAR_NUM check
  -- PF0_RBAR_NUM_BIN <= PF0_RBAR_NUM;
-------- PF0_REVISION_ID check
  -- PF0_REVISION_ID_BIN <= PF0_REVISION_ID;
-------- PF0_SECONDARY_PCIE_CAP_NEXTPTR check
  -- PF0_SECONDARY_PCIE_CAP_NEXTPTR_BIN <= PF0_SECONDARY_PCIE_CAP_NEXTPTR;
-------- PF0_SRIOV_BAR0_APERTURE_SIZE check
  -- PF0_SRIOV_BAR0_APERTURE_SIZE_BIN <= PF0_SRIOV_BAR0_APERTURE_SIZE;
-------- PF0_SRIOV_BAR0_CONTROL check
  -- PF0_SRIOV_BAR0_CONTROL_BIN <= PF0_SRIOV_BAR0_CONTROL;
-------- PF0_SRIOV_BAR1_APERTURE_SIZE check
  -- PF0_SRIOV_BAR1_APERTURE_SIZE_BIN <= PF0_SRIOV_BAR1_APERTURE_SIZE;
-------- PF0_SRIOV_BAR1_CONTROL check
  -- PF0_SRIOV_BAR1_CONTROL_BIN <= PF0_SRIOV_BAR1_CONTROL;
-------- PF0_SRIOV_BAR2_APERTURE_SIZE check
  -- PF0_SRIOV_BAR2_APERTURE_SIZE_BIN <= PF0_SRIOV_BAR2_APERTURE_SIZE;
-------- PF0_SRIOV_BAR2_CONTROL check
  -- PF0_SRIOV_BAR2_CONTROL_BIN <= PF0_SRIOV_BAR2_CONTROL;
-------- PF0_SRIOV_BAR3_APERTURE_SIZE check
  -- PF0_SRIOV_BAR3_APERTURE_SIZE_BIN <= PF0_SRIOV_BAR3_APERTURE_SIZE;
-------- PF0_SRIOV_BAR3_CONTROL check
  -- PF0_SRIOV_BAR3_CONTROL_BIN <= PF0_SRIOV_BAR3_CONTROL;
-------- PF0_SRIOV_BAR4_APERTURE_SIZE check
  -- PF0_SRIOV_BAR4_APERTURE_SIZE_BIN <= PF0_SRIOV_BAR4_APERTURE_SIZE;
-------- PF0_SRIOV_BAR4_CONTROL check
  -- PF0_SRIOV_BAR4_CONTROL_BIN <= PF0_SRIOV_BAR4_CONTROL;
-------- PF0_SRIOV_BAR5_APERTURE_SIZE check
  -- PF0_SRIOV_BAR5_APERTURE_SIZE_BIN <= PF0_SRIOV_BAR5_APERTURE_SIZE;
-------- PF0_SRIOV_BAR5_CONTROL check
  -- PF0_SRIOV_BAR5_CONTROL_BIN <= PF0_SRIOV_BAR5_CONTROL;
-------- PF0_SRIOV_CAP_INITIAL_VF check
  -- PF0_SRIOV_CAP_INITIAL_VF_BIN <= PF0_SRIOV_CAP_INITIAL_VF;
-------- PF0_SRIOV_CAP_NEXTPTR check
  -- PF0_SRIOV_CAP_NEXTPTR_BIN <= PF0_SRIOV_CAP_NEXTPTR;
-------- PF0_SRIOV_CAP_TOTAL_VF check
  -- PF0_SRIOV_CAP_TOTAL_VF_BIN <= PF0_SRIOV_CAP_TOTAL_VF;
-------- PF0_SRIOV_CAP_VER check
  -- PF0_SRIOV_CAP_VER_BIN <= PF0_SRIOV_CAP_VER;
-------- PF0_SRIOV_FIRST_VF_OFFSET check
  -- PF0_SRIOV_FIRST_VF_OFFSET_BIN <= PF0_SRIOV_FIRST_VF_OFFSET;
-------- PF0_SRIOV_FUNC_DEP_LINK check
  -- PF0_SRIOV_FUNC_DEP_LINK_BIN <= PF0_SRIOV_FUNC_DEP_LINK;
-------- PF0_SRIOV_SUPPORTED_PAGE_SIZE check
  -- PF0_SRIOV_SUPPORTED_PAGE_SIZE_BIN <= PF0_SRIOV_SUPPORTED_PAGE_SIZE;
-------- PF0_SRIOV_VF_DEVICE_ID check
  -- PF0_SRIOV_VF_DEVICE_ID_BIN <= PF0_SRIOV_VF_DEVICE_ID;
-------- PF0_SUBSYSTEM_ID check
  -- PF0_SUBSYSTEM_ID_BIN <= PF0_SUBSYSTEM_ID;
-------- PF0_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case PF0_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((PF0_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (PF0_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((PF0_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (PF0_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_TPHR_CAP_ENABLE check
  -- case PF0_TPHR_CAP_ENABLE is
    if((PF0_TPHR_CAP_ENABLE = "FALSE") or (PF0_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((PF0_TPHR_CAP_ENABLE = "TRUE") or (PF0_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_TPHR_CAP_INT_VEC_MODE check
  -- case PF0_TPHR_CAP_INT_VEC_MODE is
    if((PF0_TPHR_CAP_INT_VEC_MODE = "TRUE") or (PF0_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((PF0_TPHR_CAP_INT_VEC_MODE = "FALSE") or (PF0_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF0_TPHR_CAP_NEXTPTR check
  -- PF0_TPHR_CAP_NEXTPTR_BIN <= PF0_TPHR_CAP_NEXTPTR;
-------- PF0_TPHR_CAP_ST_MODE_SEL check
  -- PF0_TPHR_CAP_ST_MODE_SEL_BIN <= PF0_TPHR_CAP_ST_MODE_SEL;
-------- PF0_TPHR_CAP_ST_TABLE_LOC check
  -- PF0_TPHR_CAP_ST_TABLE_LOC_BIN <= PF0_TPHR_CAP_ST_TABLE_LOC;
-------- PF0_TPHR_CAP_ST_TABLE_SIZE check
  -- PF0_TPHR_CAP_ST_TABLE_SIZE_BIN <= PF0_TPHR_CAP_ST_TABLE_SIZE;
-------- PF0_TPHR_CAP_VER check
  -- PF0_TPHR_CAP_VER_BIN <= PF0_TPHR_CAP_VER;
-------- PF0_VC_CAP_ENABLE check
  -- case PF0_VC_CAP_ENABLE is
    if((PF0_VC_CAP_ENABLE = "FALSE") or (PF0_VC_CAP_ENABLE = "false")) then
      null;
    elsif((PF0_VC_CAP_ENABLE = "TRUE") or (PF0_VC_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF0_VC_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF0_VC_CAP_NEXTPTR check
  -- PF0_VC_CAP_NEXTPTR_BIN <= PF0_VC_CAP_NEXTPTR;
-------- PF0_VC_CAP_VER check
  -- PF0_VC_CAP_VER_BIN <= PF0_VC_CAP_VER;
-------- PF1_AER_CAP_ECRC_CHECK_CAPABLE check
  -- case PF1_AER_CAP_ECRC_CHECK_CAPABLE is
    if((PF1_AER_CAP_ECRC_CHECK_CAPABLE = "FALSE") or (PF1_AER_CAP_ECRC_CHECK_CAPABLE = "false")) then
      null;
    elsif((PF1_AER_CAP_ECRC_CHECK_CAPABLE = "TRUE") or (PF1_AER_CAP_ECRC_CHECK_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_AER_CAP_ECRC_CHECK_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_AER_CAP_ECRC_GEN_CAPABLE check
  -- case PF1_AER_CAP_ECRC_GEN_CAPABLE is
    if((PF1_AER_CAP_ECRC_GEN_CAPABLE = "FALSE") or (PF1_AER_CAP_ECRC_GEN_CAPABLE = "false")) then
      null;
    elsif((PF1_AER_CAP_ECRC_GEN_CAPABLE = "TRUE") or (PF1_AER_CAP_ECRC_GEN_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_AER_CAP_ECRC_GEN_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_AER_CAP_NEXTPTR check
  -- PF1_AER_CAP_NEXTPTR_BIN <= PF1_AER_CAP_NEXTPTR;
-------- PF1_ARI_CAP_NEXTPTR check
  -- PF1_ARI_CAP_NEXTPTR_BIN <= PF1_ARI_CAP_NEXTPTR;
-------- PF1_ARI_CAP_NEXT_FUNC check
  -- PF1_ARI_CAP_NEXT_FUNC_BIN <= PF1_ARI_CAP_NEXT_FUNC;
-------- PF1_BAR0_APERTURE_SIZE check
  -- PF1_BAR0_APERTURE_SIZE_BIN <= PF1_BAR0_APERTURE_SIZE;
-------- PF1_BAR0_CONTROL check
  -- PF1_BAR0_CONTROL_BIN <= PF1_BAR0_CONTROL;
-------- PF1_BAR1_APERTURE_SIZE check
  -- PF1_BAR1_APERTURE_SIZE_BIN <= PF1_BAR1_APERTURE_SIZE;
-------- PF1_BAR1_CONTROL check
  -- PF1_BAR1_CONTROL_BIN <= PF1_BAR1_CONTROL;
-------- PF1_BAR2_APERTURE_SIZE check
  -- PF1_BAR2_APERTURE_SIZE_BIN <= PF1_BAR2_APERTURE_SIZE;
-------- PF1_BAR2_CONTROL check
  -- PF1_BAR2_CONTROL_BIN <= PF1_BAR2_CONTROL;
-------- PF1_BAR3_APERTURE_SIZE check
  -- PF1_BAR3_APERTURE_SIZE_BIN <= PF1_BAR3_APERTURE_SIZE;
-------- PF1_BAR3_CONTROL check
  -- PF1_BAR3_CONTROL_BIN <= PF1_BAR3_CONTROL;
-------- PF1_BAR4_APERTURE_SIZE check
  -- PF1_BAR4_APERTURE_SIZE_BIN <= PF1_BAR4_APERTURE_SIZE;
-------- PF1_BAR4_CONTROL check
  -- PF1_BAR4_CONTROL_BIN <= PF1_BAR4_CONTROL;
-------- PF1_BAR5_APERTURE_SIZE check
  -- PF1_BAR5_APERTURE_SIZE_BIN <= PF1_BAR5_APERTURE_SIZE;
-------- PF1_BAR5_CONTROL check
  -- PF1_BAR5_CONTROL_BIN <= PF1_BAR5_CONTROL;
-------- PF1_BIST_REGISTER check
  -- PF1_BIST_REGISTER_BIN <= PF1_BIST_REGISTER;
-------- PF1_CAPABILITY_POINTER check
  -- PF1_CAPABILITY_POINTER_BIN <= PF1_CAPABILITY_POINTER;
-------- PF1_CLASS_CODE check
  -- PF1_CLASS_CODE_BIN <= PF1_CLASS_CODE;
-------- PF1_DEVICE_ID check
  -- PF1_DEVICE_ID_BIN <= PF1_DEVICE_ID;
-------- PF1_DEV_CAP_MAX_PAYLOAD_SIZE check
  -- PF1_DEV_CAP_MAX_PAYLOAD_SIZE_BIN <= PF1_DEV_CAP_MAX_PAYLOAD_SIZE;
-------- PF1_DPA_CAP_NEXTPTR check
  -- PF1_DPA_CAP_NEXTPTR_BIN <= PF1_DPA_CAP_NEXTPTR;
-------- PF1_DPA_CAP_SUB_STATE_CONTROL check
  -- PF1_DPA_CAP_SUB_STATE_CONTROL_BIN <= PF1_DPA_CAP_SUB_STATE_CONTROL;
-------- PF1_DPA_CAP_SUB_STATE_CONTROL_EN check
  -- case PF1_DPA_CAP_SUB_STATE_CONTROL_EN is
    if((PF1_DPA_CAP_SUB_STATE_CONTROL_EN = "TRUE") or (PF1_DPA_CAP_SUB_STATE_CONTROL_EN = "true")) then
      null;
    elsif((PF1_DPA_CAP_SUB_STATE_CONTROL_EN = "FALSE") or (PF1_DPA_CAP_SUB_STATE_CONTROL_EN = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_DPA_CAP_SUB_STATE_CONTROL_EN is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
-------- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 check
  -- PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_BIN <= PF1_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
-------- PF1_DPA_CAP_VER check
  -- PF1_DPA_CAP_VER_BIN <= PF1_DPA_CAP_VER;
-------- PF1_DSN_CAP_NEXTPTR check
  -- PF1_DSN_CAP_NEXTPTR_BIN <= PF1_DSN_CAP_NEXTPTR;
-------- PF1_EXPANSION_ROM_APERTURE_SIZE check
  -- PF1_EXPANSION_ROM_APERTURE_SIZE_BIN <= PF1_EXPANSION_ROM_APERTURE_SIZE;
-------- PF1_EXPANSION_ROM_ENABLE check
  -- case PF1_EXPANSION_ROM_ENABLE is
    if((PF1_EXPANSION_ROM_ENABLE = "FALSE") or (PF1_EXPANSION_ROM_ENABLE = "false")) then
      null;
    elsif((PF1_EXPANSION_ROM_ENABLE = "TRUE") or (PF1_EXPANSION_ROM_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_EXPANSION_ROM_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_INTERRUPT_LINE check
  -- PF1_INTERRUPT_LINE_BIN <= PF1_INTERRUPT_LINE;
-------- PF1_INTERRUPT_PIN check
  -- PF1_INTERRUPT_PIN_BIN <= PF1_INTERRUPT_PIN;
-------- PF1_MSIX_CAP_NEXTPTR check
  -- PF1_MSIX_CAP_NEXTPTR_BIN <= PF1_MSIX_CAP_NEXTPTR;
-------- PF1_MSIX_CAP_PBA_BIR check
  case PF1_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF1_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF1_MSIX_CAP_PBA_OFFSET check
  -- PF1_MSIX_CAP_PBA_OFFSET_BIN <= PF1_MSIX_CAP_PBA_OFFSET;
-------- PF1_MSIX_CAP_TABLE_BIR check
  case PF1_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF1_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF1_MSIX_CAP_TABLE_OFFSET check
  -- PF1_MSIX_CAP_TABLE_OFFSET_BIN <= PF1_MSIX_CAP_TABLE_OFFSET;
-------- PF1_MSIX_CAP_TABLE_SIZE check
  -- PF1_MSIX_CAP_TABLE_SIZE_BIN <= PF1_MSIX_CAP_TABLE_SIZE;
-------- PF1_MSI_CAP_MULTIMSGCAP check
  case PF1_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF1_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- PF1_MSI_CAP_NEXTPTR check
  -- PF1_MSI_CAP_NEXTPTR_BIN <= PF1_MSI_CAP_NEXTPTR;
-------- PF1_MSI_CAP_PERVECMASKCAP check
  -- case PF1_MSI_CAP_PERVECMASKCAP is
    if((PF1_MSI_CAP_PERVECMASKCAP = "FALSE") or (PF1_MSI_CAP_PERVECMASKCAP = "false")) then
      null;
    elsif((PF1_MSI_CAP_PERVECMASKCAP = "TRUE") or (PF1_MSI_CAP_PERVECMASKCAP = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_MSI_CAP_PERVECMASKCAP is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_PB_CAP_DATA_REG_D0 check
  -- PF1_PB_CAP_DATA_REG_D0_BIN <= PF1_PB_CAP_DATA_REG_D0;
-------- PF1_PB_CAP_DATA_REG_D0_SUSTAINED check
  -- PF1_PB_CAP_DATA_REG_D0_SUSTAINED_BIN <= PF1_PB_CAP_DATA_REG_D0_SUSTAINED;
-------- PF1_PB_CAP_DATA_REG_D1 check
  -- PF1_PB_CAP_DATA_REG_D1_BIN <= PF1_PB_CAP_DATA_REG_D1;
-------- PF1_PB_CAP_DATA_REG_D3HOT check
  -- PF1_PB_CAP_DATA_REG_D3HOT_BIN <= PF1_PB_CAP_DATA_REG_D3HOT;
-------- PF1_PB_CAP_NEXTPTR check
  -- PF1_PB_CAP_NEXTPTR_BIN <= PF1_PB_CAP_NEXTPTR;
-------- PF1_PB_CAP_SYSTEM_ALLOCATED check
  -- case PF1_PB_CAP_SYSTEM_ALLOCATED is
    if((PF1_PB_CAP_SYSTEM_ALLOCATED = "FALSE") or (PF1_PB_CAP_SYSTEM_ALLOCATED = "false")) then
      null;
    elsif((PF1_PB_CAP_SYSTEM_ALLOCATED = "TRUE") or (PF1_PB_CAP_SYSTEM_ALLOCATED = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_PB_CAP_SYSTEM_ALLOCATED is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_PB_CAP_VER check
  -- PF1_PB_CAP_VER_BIN <= PF1_PB_CAP_VER;
-------- PF1_PM_CAP_ID check
  -- PF1_PM_CAP_ID_BIN <= PF1_PM_CAP_ID;
-------- PF1_PM_CAP_NEXTPTR check
  -- PF1_PM_CAP_NEXTPTR_BIN <= PF1_PM_CAP_NEXTPTR;
-------- PF1_PM_CAP_VER_ID check
  -- PF1_PM_CAP_VER_ID_BIN <= PF1_PM_CAP_VER_ID;
-------- PF1_RBAR_CAP_ENABLE check
  -- case PF1_RBAR_CAP_ENABLE is
    if((PF1_RBAR_CAP_ENABLE = "FALSE") or (PF1_RBAR_CAP_ENABLE = "false")) then
      null;
    elsif((PF1_RBAR_CAP_ENABLE = "TRUE") or (PF1_RBAR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_RBAR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_RBAR_CAP_NEXTPTR check
  -- PF1_RBAR_CAP_NEXTPTR_BIN <= PF1_RBAR_CAP_NEXTPTR;
-------- PF1_RBAR_CAP_SIZE0 check
  -- PF1_RBAR_CAP_SIZE0_BIN <= PF1_RBAR_CAP_SIZE0;
-------- PF1_RBAR_CAP_SIZE1 check
  -- PF1_RBAR_CAP_SIZE1_BIN <= PF1_RBAR_CAP_SIZE1;
-------- PF1_RBAR_CAP_SIZE2 check
  -- PF1_RBAR_CAP_SIZE2_BIN <= PF1_RBAR_CAP_SIZE2;
-------- PF1_RBAR_CAP_VER check
  -- PF1_RBAR_CAP_VER_BIN <= PF1_RBAR_CAP_VER;
-------- PF1_RBAR_CONTROL_INDEX0 check
  -- PF1_RBAR_CONTROL_INDEX0_BIN <= PF1_RBAR_CONTROL_INDEX0;
-------- PF1_RBAR_CONTROL_INDEX1 check
  -- PF1_RBAR_CONTROL_INDEX1_BIN <= PF1_RBAR_CONTROL_INDEX1;
-------- PF1_RBAR_CONTROL_INDEX2 check
  -- PF1_RBAR_CONTROL_INDEX2_BIN <= PF1_RBAR_CONTROL_INDEX2;
-------- PF1_RBAR_CONTROL_SIZE0 check
  -- PF1_RBAR_CONTROL_SIZE0_BIN <= PF1_RBAR_CONTROL_SIZE0;
-------- PF1_RBAR_CONTROL_SIZE1 check
  -- PF1_RBAR_CONTROL_SIZE1_BIN <= PF1_RBAR_CONTROL_SIZE1;
-------- PF1_RBAR_CONTROL_SIZE2 check
  -- PF1_RBAR_CONTROL_SIZE2_BIN <= PF1_RBAR_CONTROL_SIZE2;
-------- PF1_RBAR_NUM check
  -- PF1_RBAR_NUM_BIN <= PF1_RBAR_NUM;
-------- PF1_REVISION_ID check
  -- PF1_REVISION_ID_BIN <= PF1_REVISION_ID;
-------- PF1_SRIOV_BAR0_APERTURE_SIZE check
  -- PF1_SRIOV_BAR0_APERTURE_SIZE_BIN <= PF1_SRIOV_BAR0_APERTURE_SIZE;
-------- PF1_SRIOV_BAR0_CONTROL check
  -- PF1_SRIOV_BAR0_CONTROL_BIN <= PF1_SRIOV_BAR0_CONTROL;
-------- PF1_SRIOV_BAR1_APERTURE_SIZE check
  -- PF1_SRIOV_BAR1_APERTURE_SIZE_BIN <= PF1_SRIOV_BAR1_APERTURE_SIZE;
-------- PF1_SRIOV_BAR1_CONTROL check
  -- PF1_SRIOV_BAR1_CONTROL_BIN <= PF1_SRIOV_BAR1_CONTROL;
-------- PF1_SRIOV_BAR2_APERTURE_SIZE check
  -- PF1_SRIOV_BAR2_APERTURE_SIZE_BIN <= PF1_SRIOV_BAR2_APERTURE_SIZE;
-------- PF1_SRIOV_BAR2_CONTROL check
  -- PF1_SRIOV_BAR2_CONTROL_BIN <= PF1_SRIOV_BAR2_CONTROL;
-------- PF1_SRIOV_BAR3_APERTURE_SIZE check
  -- PF1_SRIOV_BAR3_APERTURE_SIZE_BIN <= PF1_SRIOV_BAR3_APERTURE_SIZE;
-------- PF1_SRIOV_BAR3_CONTROL check
  -- PF1_SRIOV_BAR3_CONTROL_BIN <= PF1_SRIOV_BAR3_CONTROL;
-------- PF1_SRIOV_BAR4_APERTURE_SIZE check
  -- PF1_SRIOV_BAR4_APERTURE_SIZE_BIN <= PF1_SRIOV_BAR4_APERTURE_SIZE;
-------- PF1_SRIOV_BAR4_CONTROL check
  -- PF1_SRIOV_BAR4_CONTROL_BIN <= PF1_SRIOV_BAR4_CONTROL;
-------- PF1_SRIOV_BAR5_APERTURE_SIZE check
  -- PF1_SRIOV_BAR5_APERTURE_SIZE_BIN <= PF1_SRIOV_BAR5_APERTURE_SIZE;
-------- PF1_SRIOV_BAR5_CONTROL check
  -- PF1_SRIOV_BAR5_CONTROL_BIN <= PF1_SRIOV_BAR5_CONTROL;
-------- PF1_SRIOV_CAP_INITIAL_VF check
  -- PF1_SRIOV_CAP_INITIAL_VF_BIN <= PF1_SRIOV_CAP_INITIAL_VF;
-------- PF1_SRIOV_CAP_NEXTPTR check
  -- PF1_SRIOV_CAP_NEXTPTR_BIN <= PF1_SRIOV_CAP_NEXTPTR;
-------- PF1_SRIOV_CAP_TOTAL_VF check
  -- PF1_SRIOV_CAP_TOTAL_VF_BIN <= PF1_SRIOV_CAP_TOTAL_VF;
-------- PF1_SRIOV_CAP_VER check
  -- PF1_SRIOV_CAP_VER_BIN <= PF1_SRIOV_CAP_VER;
-------- PF1_SRIOV_FIRST_VF_OFFSET check
  -- PF1_SRIOV_FIRST_VF_OFFSET_BIN <= PF1_SRIOV_FIRST_VF_OFFSET;
-------- PF1_SRIOV_FUNC_DEP_LINK check
  -- PF1_SRIOV_FUNC_DEP_LINK_BIN <= PF1_SRIOV_FUNC_DEP_LINK;
-------- PF1_SRIOV_SUPPORTED_PAGE_SIZE check
  -- PF1_SRIOV_SUPPORTED_PAGE_SIZE_BIN <= PF1_SRIOV_SUPPORTED_PAGE_SIZE;
-------- PF1_SRIOV_VF_DEVICE_ID check
  -- PF1_SRIOV_VF_DEVICE_ID_BIN <= PF1_SRIOV_VF_DEVICE_ID;
-------- PF1_SUBSYSTEM_ID check
  -- PF1_SUBSYSTEM_ID_BIN <= PF1_SUBSYSTEM_ID;
-------- PF1_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case PF1_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((PF1_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (PF1_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((PF1_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (PF1_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF1_TPHR_CAP_ENABLE check
  -- case PF1_TPHR_CAP_ENABLE is
    if((PF1_TPHR_CAP_ENABLE = "FALSE") or (PF1_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((PF1_TPHR_CAP_ENABLE = "TRUE") or (PF1_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF1_TPHR_CAP_INT_VEC_MODE check
  -- case PF1_TPHR_CAP_INT_VEC_MODE is
    if((PF1_TPHR_CAP_INT_VEC_MODE = "TRUE") or (PF1_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((PF1_TPHR_CAP_INT_VEC_MODE = "FALSE") or (PF1_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF1_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF1_TPHR_CAP_NEXTPTR check
  -- PF1_TPHR_CAP_NEXTPTR_BIN <= PF1_TPHR_CAP_NEXTPTR;
-------- PF1_TPHR_CAP_ST_MODE_SEL check
  -- PF1_TPHR_CAP_ST_MODE_SEL_BIN <= PF1_TPHR_CAP_ST_MODE_SEL;
-------- PF1_TPHR_CAP_ST_TABLE_LOC check
  -- PF1_TPHR_CAP_ST_TABLE_LOC_BIN <= PF1_TPHR_CAP_ST_TABLE_LOC;
-------- PF1_TPHR_CAP_ST_TABLE_SIZE check
  -- PF1_TPHR_CAP_ST_TABLE_SIZE_BIN <= PF1_TPHR_CAP_ST_TABLE_SIZE;
-------- PF1_TPHR_CAP_VER check
  -- PF1_TPHR_CAP_VER_BIN <= PF1_TPHR_CAP_VER;
-------- PF2_AER_CAP_ECRC_CHECK_CAPABLE check
  -- case PF2_AER_CAP_ECRC_CHECK_CAPABLE is
    if((PF2_AER_CAP_ECRC_CHECK_CAPABLE = "FALSE") or (PF2_AER_CAP_ECRC_CHECK_CAPABLE = "false")) then
      null;
    elsif((PF2_AER_CAP_ECRC_CHECK_CAPABLE = "TRUE") or (PF2_AER_CAP_ECRC_CHECK_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_AER_CAP_ECRC_CHECK_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_AER_CAP_ECRC_GEN_CAPABLE check
  -- case PF2_AER_CAP_ECRC_GEN_CAPABLE is
    if((PF2_AER_CAP_ECRC_GEN_CAPABLE = "FALSE") or (PF2_AER_CAP_ECRC_GEN_CAPABLE = "false")) then
      null;
    elsif((PF2_AER_CAP_ECRC_GEN_CAPABLE = "TRUE") or (PF2_AER_CAP_ECRC_GEN_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_AER_CAP_ECRC_GEN_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_AER_CAP_NEXTPTR check
  -- PF2_AER_CAP_NEXTPTR_BIN <= PF2_AER_CAP_NEXTPTR;
-------- PF2_ARI_CAP_NEXTPTR check
  -- PF2_ARI_CAP_NEXTPTR_BIN <= PF2_ARI_CAP_NEXTPTR;
-------- PF2_ARI_CAP_NEXT_FUNC check
  -- PF2_ARI_CAP_NEXT_FUNC_BIN <= PF2_ARI_CAP_NEXT_FUNC;
-------- PF2_BAR0_APERTURE_SIZE check
  -- PF2_BAR0_APERTURE_SIZE_BIN <= PF2_BAR0_APERTURE_SIZE;
-------- PF2_BAR0_CONTROL check
  -- PF2_BAR0_CONTROL_BIN <= PF2_BAR0_CONTROL;
-------- PF2_BAR1_APERTURE_SIZE check
  -- PF2_BAR1_APERTURE_SIZE_BIN <= PF2_BAR1_APERTURE_SIZE;
-------- PF2_BAR1_CONTROL check
  -- PF2_BAR1_CONTROL_BIN <= PF2_BAR1_CONTROL;
-------- PF2_BAR2_APERTURE_SIZE check
  -- PF2_BAR2_APERTURE_SIZE_BIN <= PF2_BAR2_APERTURE_SIZE;
-------- PF2_BAR2_CONTROL check
  -- PF2_BAR2_CONTROL_BIN <= PF2_BAR2_CONTROL;
-------- PF2_BAR3_APERTURE_SIZE check
  -- PF2_BAR3_APERTURE_SIZE_BIN <= PF2_BAR3_APERTURE_SIZE;
-------- PF2_BAR3_CONTROL check
  -- PF2_BAR3_CONTROL_BIN <= PF2_BAR3_CONTROL;
-------- PF2_BAR4_APERTURE_SIZE check
  -- PF2_BAR4_APERTURE_SIZE_BIN <= PF2_BAR4_APERTURE_SIZE;
-------- PF2_BAR4_CONTROL check
  -- PF2_BAR4_CONTROL_BIN <= PF2_BAR4_CONTROL;
-------- PF2_BAR5_APERTURE_SIZE check
  -- PF2_BAR5_APERTURE_SIZE_BIN <= PF2_BAR5_APERTURE_SIZE;
-------- PF2_BAR5_CONTROL check
  -- PF2_BAR5_CONTROL_BIN <= PF2_BAR5_CONTROL;
-------- PF2_BIST_REGISTER check
  -- PF2_BIST_REGISTER_BIN <= PF2_BIST_REGISTER;
-------- PF2_CAPABILITY_POINTER check
  -- PF2_CAPABILITY_POINTER_BIN <= PF2_CAPABILITY_POINTER;
-------- PF2_CLASS_CODE check
  -- PF2_CLASS_CODE_BIN <= PF2_CLASS_CODE;
-------- PF2_DEVICE_ID check
  -- PF2_DEVICE_ID_BIN <= PF2_DEVICE_ID;
-------- PF2_DEV_CAP_MAX_PAYLOAD_SIZE check
  -- PF2_DEV_CAP_MAX_PAYLOAD_SIZE_BIN <= PF2_DEV_CAP_MAX_PAYLOAD_SIZE;
-------- PF2_DPA_CAP_NEXTPTR check
  -- PF2_DPA_CAP_NEXTPTR_BIN <= PF2_DPA_CAP_NEXTPTR;
-------- PF2_DPA_CAP_SUB_STATE_CONTROL check
  -- PF2_DPA_CAP_SUB_STATE_CONTROL_BIN <= PF2_DPA_CAP_SUB_STATE_CONTROL;
-------- PF2_DPA_CAP_SUB_STATE_CONTROL_EN check
  -- case PF2_DPA_CAP_SUB_STATE_CONTROL_EN is
    if((PF2_DPA_CAP_SUB_STATE_CONTROL_EN = "TRUE") or (PF2_DPA_CAP_SUB_STATE_CONTROL_EN = "true")) then
      null;
    elsif((PF2_DPA_CAP_SUB_STATE_CONTROL_EN = "FALSE") or (PF2_DPA_CAP_SUB_STATE_CONTROL_EN = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_DPA_CAP_SUB_STATE_CONTROL_EN is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
-------- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 check
  -- PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_BIN <= PF2_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
-------- PF2_DPA_CAP_VER check
  -- PF2_DPA_CAP_VER_BIN <= PF2_DPA_CAP_VER;
-------- PF2_DSN_CAP_NEXTPTR check
  -- PF2_DSN_CAP_NEXTPTR_BIN <= PF2_DSN_CAP_NEXTPTR;
-------- PF2_EXPANSION_ROM_APERTURE_SIZE check
  -- PF2_EXPANSION_ROM_APERTURE_SIZE_BIN <= PF2_EXPANSION_ROM_APERTURE_SIZE;
-------- PF2_EXPANSION_ROM_ENABLE check
  -- case PF2_EXPANSION_ROM_ENABLE is
    if((PF2_EXPANSION_ROM_ENABLE = "FALSE") or (PF2_EXPANSION_ROM_ENABLE = "false")) then
      null;
    elsif((PF2_EXPANSION_ROM_ENABLE = "TRUE") or (PF2_EXPANSION_ROM_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_EXPANSION_ROM_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_INTERRUPT_LINE check
  -- PF2_INTERRUPT_LINE_BIN <= PF2_INTERRUPT_LINE;
-------- PF2_INTERRUPT_PIN check
  -- PF2_INTERRUPT_PIN_BIN <= PF2_INTERRUPT_PIN;
-------- PF2_MSIX_CAP_NEXTPTR check
  -- PF2_MSIX_CAP_NEXTPTR_BIN <= PF2_MSIX_CAP_NEXTPTR;
-------- PF2_MSIX_CAP_PBA_BIR check
  case PF2_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF2_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF2_MSIX_CAP_PBA_OFFSET check
  -- PF2_MSIX_CAP_PBA_OFFSET_BIN <= PF2_MSIX_CAP_PBA_OFFSET;
-------- PF2_MSIX_CAP_TABLE_BIR check
  case PF2_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF2_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF2_MSIX_CAP_TABLE_OFFSET check
  -- PF2_MSIX_CAP_TABLE_OFFSET_BIN <= PF2_MSIX_CAP_TABLE_OFFSET;
-------- PF2_MSIX_CAP_TABLE_SIZE check
  -- PF2_MSIX_CAP_TABLE_SIZE_BIN <= PF2_MSIX_CAP_TABLE_SIZE;
-------- PF2_MSI_CAP_MULTIMSGCAP check
  case PF2_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF2_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- PF2_MSI_CAP_NEXTPTR check
  -- PF2_MSI_CAP_NEXTPTR_BIN <= PF2_MSI_CAP_NEXTPTR;
-------- PF2_MSI_CAP_PERVECMASKCAP check
  -- case PF2_MSI_CAP_PERVECMASKCAP is
    if((PF2_MSI_CAP_PERVECMASKCAP = "FALSE") or (PF2_MSI_CAP_PERVECMASKCAP = "false")) then
      null;
    elsif((PF2_MSI_CAP_PERVECMASKCAP = "TRUE") or (PF2_MSI_CAP_PERVECMASKCAP = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_MSI_CAP_PERVECMASKCAP is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_PB_CAP_DATA_REG_D0 check
  -- PF2_PB_CAP_DATA_REG_D0_BIN <= PF2_PB_CAP_DATA_REG_D0;
-------- PF2_PB_CAP_DATA_REG_D0_SUSTAINED check
  -- PF2_PB_CAP_DATA_REG_D0_SUSTAINED_BIN <= PF2_PB_CAP_DATA_REG_D0_SUSTAINED;
-------- PF2_PB_CAP_DATA_REG_D1 check
  -- PF2_PB_CAP_DATA_REG_D1_BIN <= PF2_PB_CAP_DATA_REG_D1;
-------- PF2_PB_CAP_DATA_REG_D3HOT check
  -- PF2_PB_CAP_DATA_REG_D3HOT_BIN <= PF2_PB_CAP_DATA_REG_D3HOT;
-------- PF2_PB_CAP_NEXTPTR check
  -- PF2_PB_CAP_NEXTPTR_BIN <= PF2_PB_CAP_NEXTPTR;
-------- PF2_PB_CAP_SYSTEM_ALLOCATED check
  -- case PF2_PB_CAP_SYSTEM_ALLOCATED is
    if((PF2_PB_CAP_SYSTEM_ALLOCATED = "FALSE") or (PF2_PB_CAP_SYSTEM_ALLOCATED = "false")) then
      null;
    elsif((PF2_PB_CAP_SYSTEM_ALLOCATED = "TRUE") or (PF2_PB_CAP_SYSTEM_ALLOCATED = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_PB_CAP_SYSTEM_ALLOCATED is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_PB_CAP_VER check
  -- PF2_PB_CAP_VER_BIN <= PF2_PB_CAP_VER;
-------- PF2_PM_CAP_ID check
  -- PF2_PM_CAP_ID_BIN <= PF2_PM_CAP_ID;
-------- PF2_PM_CAP_NEXTPTR check
  -- PF2_PM_CAP_NEXTPTR_BIN <= PF2_PM_CAP_NEXTPTR;
-------- PF2_PM_CAP_VER_ID check
  -- PF2_PM_CAP_VER_ID_BIN <= PF2_PM_CAP_VER_ID;
-------- PF2_RBAR_CAP_ENABLE check
  -- case PF2_RBAR_CAP_ENABLE is
    if((PF2_RBAR_CAP_ENABLE = "FALSE") or (PF2_RBAR_CAP_ENABLE = "false")) then
      null;
    elsif((PF2_RBAR_CAP_ENABLE = "TRUE") or (PF2_RBAR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_RBAR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_RBAR_CAP_NEXTPTR check
  -- PF2_RBAR_CAP_NEXTPTR_BIN <= PF2_RBAR_CAP_NEXTPTR;
-------- PF2_RBAR_CAP_SIZE0 check
  -- PF2_RBAR_CAP_SIZE0_BIN <= PF2_RBAR_CAP_SIZE0;
-------- PF2_RBAR_CAP_SIZE1 check
  -- PF2_RBAR_CAP_SIZE1_BIN <= PF2_RBAR_CAP_SIZE1;
-------- PF2_RBAR_CAP_SIZE2 check
  -- PF2_RBAR_CAP_SIZE2_BIN <= PF2_RBAR_CAP_SIZE2;
-------- PF2_RBAR_CAP_VER check
  -- PF2_RBAR_CAP_VER_BIN <= PF2_RBAR_CAP_VER;
-------- PF2_RBAR_CONTROL_INDEX0 check
  -- PF2_RBAR_CONTROL_INDEX0_BIN <= PF2_RBAR_CONTROL_INDEX0;
-------- PF2_RBAR_CONTROL_INDEX1 check
  -- PF2_RBAR_CONTROL_INDEX1_BIN <= PF2_RBAR_CONTROL_INDEX1;
-------- PF2_RBAR_CONTROL_INDEX2 check
  -- PF2_RBAR_CONTROL_INDEX2_BIN <= PF2_RBAR_CONTROL_INDEX2;
-------- PF2_RBAR_CONTROL_SIZE0 check
  -- PF2_RBAR_CONTROL_SIZE0_BIN <= PF2_RBAR_CONTROL_SIZE0;
-------- PF2_RBAR_CONTROL_SIZE1 check
  -- PF2_RBAR_CONTROL_SIZE1_BIN <= PF2_RBAR_CONTROL_SIZE1;
-------- PF2_RBAR_CONTROL_SIZE2 check
  -- PF2_RBAR_CONTROL_SIZE2_BIN <= PF2_RBAR_CONTROL_SIZE2;
-------- PF2_RBAR_NUM check
  -- PF2_RBAR_NUM_BIN <= PF2_RBAR_NUM;
-------- PF2_REVISION_ID check
  -- PF2_REVISION_ID_BIN <= PF2_REVISION_ID;
-------- PF2_SRIOV_BAR0_APERTURE_SIZE check
  -- PF2_SRIOV_BAR0_APERTURE_SIZE_BIN <= PF2_SRIOV_BAR0_APERTURE_SIZE;
-------- PF2_SRIOV_BAR0_CONTROL check
  -- PF2_SRIOV_BAR0_CONTROL_BIN <= PF2_SRIOV_BAR0_CONTROL;
-------- PF2_SRIOV_BAR1_APERTURE_SIZE check
  -- PF2_SRIOV_BAR1_APERTURE_SIZE_BIN <= PF2_SRIOV_BAR1_APERTURE_SIZE;
-------- PF2_SRIOV_BAR1_CONTROL check
  -- PF2_SRIOV_BAR1_CONTROL_BIN <= PF2_SRIOV_BAR1_CONTROL;
-------- PF2_SRIOV_BAR2_APERTURE_SIZE check
  -- PF2_SRIOV_BAR2_APERTURE_SIZE_BIN <= PF2_SRIOV_BAR2_APERTURE_SIZE;
-------- PF2_SRIOV_BAR2_CONTROL check
  -- PF2_SRIOV_BAR2_CONTROL_BIN <= PF2_SRIOV_BAR2_CONTROL;
-------- PF2_SRIOV_BAR3_APERTURE_SIZE check
  -- PF2_SRIOV_BAR3_APERTURE_SIZE_BIN <= PF2_SRIOV_BAR3_APERTURE_SIZE;
-------- PF2_SRIOV_BAR3_CONTROL check
  -- PF2_SRIOV_BAR3_CONTROL_BIN <= PF2_SRIOV_BAR3_CONTROL;
-------- PF2_SRIOV_BAR4_APERTURE_SIZE check
  -- PF2_SRIOV_BAR4_APERTURE_SIZE_BIN <= PF2_SRIOV_BAR4_APERTURE_SIZE;
-------- PF2_SRIOV_BAR4_CONTROL check
  -- PF2_SRIOV_BAR4_CONTROL_BIN <= PF2_SRIOV_BAR4_CONTROL;
-------- PF2_SRIOV_BAR5_APERTURE_SIZE check
  -- PF2_SRIOV_BAR5_APERTURE_SIZE_BIN <= PF2_SRIOV_BAR5_APERTURE_SIZE;
-------- PF2_SRIOV_BAR5_CONTROL check
  -- PF2_SRIOV_BAR5_CONTROL_BIN <= PF2_SRIOV_BAR5_CONTROL;
-------- PF2_SRIOV_CAP_INITIAL_VF check
  -- PF2_SRIOV_CAP_INITIAL_VF_BIN <= PF2_SRIOV_CAP_INITIAL_VF;
-------- PF2_SRIOV_CAP_NEXTPTR check
  -- PF2_SRIOV_CAP_NEXTPTR_BIN <= PF2_SRIOV_CAP_NEXTPTR;
-------- PF2_SRIOV_CAP_TOTAL_VF check
  -- PF2_SRIOV_CAP_TOTAL_VF_BIN <= PF2_SRIOV_CAP_TOTAL_VF;
-------- PF2_SRIOV_CAP_VER check
  -- PF2_SRIOV_CAP_VER_BIN <= PF2_SRIOV_CAP_VER;
-------- PF2_SRIOV_FIRST_VF_OFFSET check
  -- PF2_SRIOV_FIRST_VF_OFFSET_BIN <= PF2_SRIOV_FIRST_VF_OFFSET;
-------- PF2_SRIOV_FUNC_DEP_LINK check
  -- PF2_SRIOV_FUNC_DEP_LINK_BIN <= PF2_SRIOV_FUNC_DEP_LINK;
-------- PF2_SRIOV_SUPPORTED_PAGE_SIZE check
  -- PF2_SRIOV_SUPPORTED_PAGE_SIZE_BIN <= PF2_SRIOV_SUPPORTED_PAGE_SIZE;
-------- PF2_SRIOV_VF_DEVICE_ID check
  -- PF2_SRIOV_VF_DEVICE_ID_BIN <= PF2_SRIOV_VF_DEVICE_ID;
-------- PF2_SUBSYSTEM_ID check
  -- PF2_SUBSYSTEM_ID_BIN <= PF2_SUBSYSTEM_ID;
-------- PF2_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case PF2_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((PF2_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (PF2_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((PF2_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (PF2_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF2_TPHR_CAP_ENABLE check
  -- case PF2_TPHR_CAP_ENABLE is
    if((PF2_TPHR_CAP_ENABLE = "FALSE") or (PF2_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((PF2_TPHR_CAP_ENABLE = "TRUE") or (PF2_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF2_TPHR_CAP_INT_VEC_MODE check
  -- case PF2_TPHR_CAP_INT_VEC_MODE is
    if((PF2_TPHR_CAP_INT_VEC_MODE = "TRUE") or (PF2_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((PF2_TPHR_CAP_INT_VEC_MODE = "FALSE") or (PF2_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF2_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF2_TPHR_CAP_NEXTPTR check
  -- PF2_TPHR_CAP_NEXTPTR_BIN <= PF2_TPHR_CAP_NEXTPTR;
-------- PF2_TPHR_CAP_ST_MODE_SEL check
  -- PF2_TPHR_CAP_ST_MODE_SEL_BIN <= PF2_TPHR_CAP_ST_MODE_SEL;
-------- PF2_TPHR_CAP_ST_TABLE_LOC check
  -- PF2_TPHR_CAP_ST_TABLE_LOC_BIN <= PF2_TPHR_CAP_ST_TABLE_LOC;
-------- PF2_TPHR_CAP_ST_TABLE_SIZE check
  -- PF2_TPHR_CAP_ST_TABLE_SIZE_BIN <= PF2_TPHR_CAP_ST_TABLE_SIZE;
-------- PF2_TPHR_CAP_VER check
  -- PF2_TPHR_CAP_VER_BIN <= PF2_TPHR_CAP_VER;
-------- PF3_AER_CAP_ECRC_CHECK_CAPABLE check
  -- case PF3_AER_CAP_ECRC_CHECK_CAPABLE is
    if((PF3_AER_CAP_ECRC_CHECK_CAPABLE = "FALSE") or (PF3_AER_CAP_ECRC_CHECK_CAPABLE = "false")) then
      null;
    elsif((PF3_AER_CAP_ECRC_CHECK_CAPABLE = "TRUE") or (PF3_AER_CAP_ECRC_CHECK_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_AER_CAP_ECRC_CHECK_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_AER_CAP_ECRC_GEN_CAPABLE check
  -- case PF3_AER_CAP_ECRC_GEN_CAPABLE is
    if((PF3_AER_CAP_ECRC_GEN_CAPABLE = "FALSE") or (PF3_AER_CAP_ECRC_GEN_CAPABLE = "false")) then
      null;
    elsif((PF3_AER_CAP_ECRC_GEN_CAPABLE = "TRUE") or (PF3_AER_CAP_ECRC_GEN_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_AER_CAP_ECRC_GEN_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_AER_CAP_NEXTPTR check
  -- PF3_AER_CAP_NEXTPTR_BIN <= PF3_AER_CAP_NEXTPTR;
-------- PF3_ARI_CAP_NEXTPTR check
  -- PF3_ARI_CAP_NEXTPTR_BIN <= PF3_ARI_CAP_NEXTPTR;
-------- PF3_ARI_CAP_NEXT_FUNC check
  -- PF3_ARI_CAP_NEXT_FUNC_BIN <= PF3_ARI_CAP_NEXT_FUNC;
-------- PF3_BAR0_APERTURE_SIZE check
  -- PF3_BAR0_APERTURE_SIZE_BIN <= PF3_BAR0_APERTURE_SIZE;
-------- PF3_BAR0_CONTROL check
  -- PF3_BAR0_CONTROL_BIN <= PF3_BAR0_CONTROL;
-------- PF3_BAR1_APERTURE_SIZE check
  -- PF3_BAR1_APERTURE_SIZE_BIN <= PF3_BAR1_APERTURE_SIZE;
-------- PF3_BAR1_CONTROL check
  -- PF3_BAR1_CONTROL_BIN <= PF3_BAR1_CONTROL;
-------- PF3_BAR2_APERTURE_SIZE check
  -- PF3_BAR2_APERTURE_SIZE_BIN <= PF3_BAR2_APERTURE_SIZE;
-------- PF3_BAR2_CONTROL check
  -- PF3_BAR2_CONTROL_BIN <= PF3_BAR2_CONTROL;
-------- PF3_BAR3_APERTURE_SIZE check
  -- PF3_BAR3_APERTURE_SIZE_BIN <= PF3_BAR3_APERTURE_SIZE;
-------- PF3_BAR3_CONTROL check
  -- PF3_BAR3_CONTROL_BIN <= PF3_BAR3_CONTROL;
-------- PF3_BAR4_APERTURE_SIZE check
  -- PF3_BAR4_APERTURE_SIZE_BIN <= PF3_BAR4_APERTURE_SIZE;
-------- PF3_BAR4_CONTROL check
  -- PF3_BAR4_CONTROL_BIN <= PF3_BAR4_CONTROL;
-------- PF3_BAR5_APERTURE_SIZE check
  -- PF3_BAR5_APERTURE_SIZE_BIN <= PF3_BAR5_APERTURE_SIZE;
-------- PF3_BAR5_CONTROL check
  -- PF3_BAR5_CONTROL_BIN <= PF3_BAR5_CONTROL;
-------- PF3_BIST_REGISTER check
  -- PF3_BIST_REGISTER_BIN <= PF3_BIST_REGISTER;
-------- PF3_CAPABILITY_POINTER check
  -- PF3_CAPABILITY_POINTER_BIN <= PF3_CAPABILITY_POINTER;
-------- PF3_CLASS_CODE check
  -- PF3_CLASS_CODE_BIN <= PF3_CLASS_CODE;
-------- PF3_DEVICE_ID check
  -- PF3_DEVICE_ID_BIN <= PF3_DEVICE_ID;
-------- PF3_DEV_CAP_MAX_PAYLOAD_SIZE check
  -- PF3_DEV_CAP_MAX_PAYLOAD_SIZE_BIN <= PF3_DEV_CAP_MAX_PAYLOAD_SIZE;
-------- PF3_DPA_CAP_NEXTPTR check
  -- PF3_DPA_CAP_NEXTPTR_BIN <= PF3_DPA_CAP_NEXTPTR;
-------- PF3_DPA_CAP_SUB_STATE_CONTROL check
  -- PF3_DPA_CAP_SUB_STATE_CONTROL_BIN <= PF3_DPA_CAP_SUB_STATE_CONTROL;
-------- PF3_DPA_CAP_SUB_STATE_CONTROL_EN check
  -- case PF3_DPA_CAP_SUB_STATE_CONTROL_EN is
    if((PF3_DPA_CAP_SUB_STATE_CONTROL_EN = "TRUE") or (PF3_DPA_CAP_SUB_STATE_CONTROL_EN = "true")) then
      null;
    elsif((PF3_DPA_CAP_SUB_STATE_CONTROL_EN = "FALSE") or (PF3_DPA_CAP_SUB_STATE_CONTROL_EN = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_DPA_CAP_SUB_STATE_CONTROL_EN is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION0;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION1;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION2;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION3;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION4;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION5;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION6;
-------- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7 check
  -- PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7_BIN <= PF3_DPA_CAP_SUB_STATE_POWER_ALLOCATION7;
-------- PF3_DPA_CAP_VER check
  -- PF3_DPA_CAP_VER_BIN <= PF3_DPA_CAP_VER;
-------- PF3_DSN_CAP_NEXTPTR check
  -- PF3_DSN_CAP_NEXTPTR_BIN <= PF3_DSN_CAP_NEXTPTR;
-------- PF3_EXPANSION_ROM_APERTURE_SIZE check
  -- PF3_EXPANSION_ROM_APERTURE_SIZE_BIN <= PF3_EXPANSION_ROM_APERTURE_SIZE;
-------- PF3_EXPANSION_ROM_ENABLE check
  -- case PF3_EXPANSION_ROM_ENABLE is
    if((PF3_EXPANSION_ROM_ENABLE = "FALSE") or (PF3_EXPANSION_ROM_ENABLE = "false")) then
      null;
    elsif((PF3_EXPANSION_ROM_ENABLE = "TRUE") or (PF3_EXPANSION_ROM_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_EXPANSION_ROM_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_INTERRUPT_LINE check
  -- PF3_INTERRUPT_LINE_BIN <= PF3_INTERRUPT_LINE;
-------- PF3_INTERRUPT_PIN check
  -- PF3_INTERRUPT_PIN_BIN <= PF3_INTERRUPT_PIN;
-------- PF3_MSIX_CAP_NEXTPTR check
  -- PF3_MSIX_CAP_NEXTPTR_BIN <= PF3_MSIX_CAP_NEXTPTR;
-------- PF3_MSIX_CAP_PBA_BIR check
  case PF3_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF3_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF3_MSIX_CAP_PBA_OFFSET check
  -- PF3_MSIX_CAP_PBA_OFFSET_BIN <= PF3_MSIX_CAP_PBA_OFFSET;
-------- PF3_MSIX_CAP_TABLE_BIR check
  case PF3_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF3_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- PF3_MSIX_CAP_TABLE_OFFSET check
  -- PF3_MSIX_CAP_TABLE_OFFSET_BIN <= PF3_MSIX_CAP_TABLE_OFFSET;
-------- PF3_MSIX_CAP_TABLE_SIZE check
  -- PF3_MSIX_CAP_TABLE_SIZE_BIN <= PF3_MSIX_CAP_TABLE_SIZE;
-------- PF3_MSI_CAP_MULTIMSGCAP check
  case PF3_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : PF3_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- PF3_MSI_CAP_NEXTPTR check
  -- PF3_MSI_CAP_NEXTPTR_BIN <= PF3_MSI_CAP_NEXTPTR;
-------- PF3_MSI_CAP_PERVECMASKCAP check
  -- case PF3_MSI_CAP_PERVECMASKCAP is
    if((PF3_MSI_CAP_PERVECMASKCAP = "FALSE") or (PF3_MSI_CAP_PERVECMASKCAP = "false")) then
      null;
    elsif((PF3_MSI_CAP_PERVECMASKCAP = "TRUE") or (PF3_MSI_CAP_PERVECMASKCAP = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_MSI_CAP_PERVECMASKCAP is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_PB_CAP_DATA_REG_D0 check
  -- PF3_PB_CAP_DATA_REG_D0_BIN <= PF3_PB_CAP_DATA_REG_D0;
-------- PF3_PB_CAP_DATA_REG_D0_SUSTAINED check
  -- PF3_PB_CAP_DATA_REG_D0_SUSTAINED_BIN <= PF3_PB_CAP_DATA_REG_D0_SUSTAINED;
-------- PF3_PB_CAP_DATA_REG_D1 check
  -- PF3_PB_CAP_DATA_REG_D1_BIN <= PF3_PB_CAP_DATA_REG_D1;
-------- PF3_PB_CAP_DATA_REG_D3HOT check
  -- PF3_PB_CAP_DATA_REG_D3HOT_BIN <= PF3_PB_CAP_DATA_REG_D3HOT;
-------- PF3_PB_CAP_NEXTPTR check
  -- PF3_PB_CAP_NEXTPTR_BIN <= PF3_PB_CAP_NEXTPTR;
-------- PF3_PB_CAP_SYSTEM_ALLOCATED check
  -- case PF3_PB_CAP_SYSTEM_ALLOCATED is
    if((PF3_PB_CAP_SYSTEM_ALLOCATED = "FALSE") or (PF3_PB_CAP_SYSTEM_ALLOCATED = "false")) then
      null;
    elsif((PF3_PB_CAP_SYSTEM_ALLOCATED = "TRUE") or (PF3_PB_CAP_SYSTEM_ALLOCATED = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_PB_CAP_SYSTEM_ALLOCATED is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_PB_CAP_VER check
  -- PF3_PB_CAP_VER_BIN <= PF3_PB_CAP_VER;
-------- PF3_PM_CAP_ID check
  -- PF3_PM_CAP_ID_BIN <= PF3_PM_CAP_ID;
-------- PF3_PM_CAP_NEXTPTR check
  -- PF3_PM_CAP_NEXTPTR_BIN <= PF3_PM_CAP_NEXTPTR;
-------- PF3_PM_CAP_VER_ID check
  -- PF3_PM_CAP_VER_ID_BIN <= PF3_PM_CAP_VER_ID;
-------- PF3_RBAR_CAP_ENABLE check
  -- case PF3_RBAR_CAP_ENABLE is
    if((PF3_RBAR_CAP_ENABLE = "FALSE") or (PF3_RBAR_CAP_ENABLE = "false")) then
      null;
    elsif((PF3_RBAR_CAP_ENABLE = "TRUE") or (PF3_RBAR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_RBAR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_RBAR_CAP_NEXTPTR check
  -- PF3_RBAR_CAP_NEXTPTR_BIN <= PF3_RBAR_CAP_NEXTPTR;
-------- PF3_RBAR_CAP_SIZE0 check
  -- PF3_RBAR_CAP_SIZE0_BIN <= PF3_RBAR_CAP_SIZE0;
-------- PF3_RBAR_CAP_SIZE1 check
  -- PF3_RBAR_CAP_SIZE1_BIN <= PF3_RBAR_CAP_SIZE1;
-------- PF3_RBAR_CAP_SIZE2 check
  -- PF3_RBAR_CAP_SIZE2_BIN <= PF3_RBAR_CAP_SIZE2;
-------- PF3_RBAR_CAP_VER check
  -- PF3_RBAR_CAP_VER_BIN <= PF3_RBAR_CAP_VER;
-------- PF3_RBAR_CONTROL_INDEX0 check
  -- PF3_RBAR_CONTROL_INDEX0_BIN <= PF3_RBAR_CONTROL_INDEX0;
-------- PF3_RBAR_CONTROL_INDEX1 check
  -- PF3_RBAR_CONTROL_INDEX1_BIN <= PF3_RBAR_CONTROL_INDEX1;
-------- PF3_RBAR_CONTROL_INDEX2 check
  -- PF3_RBAR_CONTROL_INDEX2_BIN <= PF3_RBAR_CONTROL_INDEX2;
-------- PF3_RBAR_CONTROL_SIZE0 check
  -- PF3_RBAR_CONTROL_SIZE0_BIN <= PF3_RBAR_CONTROL_SIZE0;
-------- PF3_RBAR_CONTROL_SIZE1 check
  -- PF3_RBAR_CONTROL_SIZE1_BIN <= PF3_RBAR_CONTROL_SIZE1;
-------- PF3_RBAR_CONTROL_SIZE2 check
  -- PF3_RBAR_CONTROL_SIZE2_BIN <= PF3_RBAR_CONTROL_SIZE2;
-------- PF3_RBAR_NUM check
  -- PF3_RBAR_NUM_BIN <= PF3_RBAR_NUM;
-------- PF3_REVISION_ID check
  -- PF3_REVISION_ID_BIN <= PF3_REVISION_ID;
-------- PF3_SRIOV_BAR0_APERTURE_SIZE check
  -- PF3_SRIOV_BAR0_APERTURE_SIZE_BIN <= PF3_SRIOV_BAR0_APERTURE_SIZE;
-------- PF3_SRIOV_BAR0_CONTROL check
  -- PF3_SRIOV_BAR0_CONTROL_BIN <= PF3_SRIOV_BAR0_CONTROL;
-------- PF3_SRIOV_BAR1_APERTURE_SIZE check
  -- PF3_SRIOV_BAR1_APERTURE_SIZE_BIN <= PF3_SRIOV_BAR1_APERTURE_SIZE;
-------- PF3_SRIOV_BAR1_CONTROL check
  -- PF3_SRIOV_BAR1_CONTROL_BIN <= PF3_SRIOV_BAR1_CONTROL;
-------- PF3_SRIOV_BAR2_APERTURE_SIZE check
  -- PF3_SRIOV_BAR2_APERTURE_SIZE_BIN <= PF3_SRIOV_BAR2_APERTURE_SIZE;
-------- PF3_SRIOV_BAR2_CONTROL check
  -- PF3_SRIOV_BAR2_CONTROL_BIN <= PF3_SRIOV_BAR2_CONTROL;
-------- PF3_SRIOV_BAR3_APERTURE_SIZE check
  -- PF3_SRIOV_BAR3_APERTURE_SIZE_BIN <= PF3_SRIOV_BAR3_APERTURE_SIZE;
-------- PF3_SRIOV_BAR3_CONTROL check
  -- PF3_SRIOV_BAR3_CONTROL_BIN <= PF3_SRIOV_BAR3_CONTROL;
-------- PF3_SRIOV_BAR4_APERTURE_SIZE check
  -- PF3_SRIOV_BAR4_APERTURE_SIZE_BIN <= PF3_SRIOV_BAR4_APERTURE_SIZE;
-------- PF3_SRIOV_BAR4_CONTROL check
  -- PF3_SRIOV_BAR4_CONTROL_BIN <= PF3_SRIOV_BAR4_CONTROL;
-------- PF3_SRIOV_BAR5_APERTURE_SIZE check
  -- PF3_SRIOV_BAR5_APERTURE_SIZE_BIN <= PF3_SRIOV_BAR5_APERTURE_SIZE;
-------- PF3_SRIOV_BAR5_CONTROL check
  -- PF3_SRIOV_BAR5_CONTROL_BIN <= PF3_SRIOV_BAR5_CONTROL;
-------- PF3_SRIOV_CAP_INITIAL_VF check
  -- PF3_SRIOV_CAP_INITIAL_VF_BIN <= PF3_SRIOV_CAP_INITIAL_VF;
-------- PF3_SRIOV_CAP_NEXTPTR check
  -- PF3_SRIOV_CAP_NEXTPTR_BIN <= PF3_SRIOV_CAP_NEXTPTR;
-------- PF3_SRIOV_CAP_TOTAL_VF check
  -- PF3_SRIOV_CAP_TOTAL_VF_BIN <= PF3_SRIOV_CAP_TOTAL_VF;
-------- PF3_SRIOV_CAP_VER check
  -- PF3_SRIOV_CAP_VER_BIN <= PF3_SRIOV_CAP_VER;
-------- PF3_SRIOV_FIRST_VF_OFFSET check
  -- PF3_SRIOV_FIRST_VF_OFFSET_BIN <= PF3_SRIOV_FIRST_VF_OFFSET;
-------- PF3_SRIOV_FUNC_DEP_LINK check
  -- PF3_SRIOV_FUNC_DEP_LINK_BIN <= PF3_SRIOV_FUNC_DEP_LINK;
-------- PF3_SRIOV_SUPPORTED_PAGE_SIZE check
  -- PF3_SRIOV_SUPPORTED_PAGE_SIZE_BIN <= PF3_SRIOV_SUPPORTED_PAGE_SIZE;
-------- PF3_SRIOV_VF_DEVICE_ID check
  -- PF3_SRIOV_VF_DEVICE_ID_BIN <= PF3_SRIOV_VF_DEVICE_ID;
-------- PF3_SUBSYSTEM_ID check
  -- PF3_SUBSYSTEM_ID_BIN <= PF3_SUBSYSTEM_ID;
-------- PF3_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case PF3_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((PF3_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (PF3_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((PF3_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (PF3_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF3_TPHR_CAP_ENABLE check
  -- case PF3_TPHR_CAP_ENABLE is
    if((PF3_TPHR_CAP_ENABLE = "FALSE") or (PF3_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((PF3_TPHR_CAP_ENABLE = "TRUE") or (PF3_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PF3_TPHR_CAP_INT_VEC_MODE check
  -- case PF3_TPHR_CAP_INT_VEC_MODE is
    if((PF3_TPHR_CAP_INT_VEC_MODE = "TRUE") or (PF3_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((PF3_TPHR_CAP_INT_VEC_MODE = "FALSE") or (PF3_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PF3_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PF3_TPHR_CAP_NEXTPTR check
  -- PF3_TPHR_CAP_NEXTPTR_BIN <= PF3_TPHR_CAP_NEXTPTR;
-------- PF3_TPHR_CAP_ST_MODE_SEL check
  -- PF3_TPHR_CAP_ST_MODE_SEL_BIN <= PF3_TPHR_CAP_ST_MODE_SEL;
-------- PF3_TPHR_CAP_ST_TABLE_LOC check
  -- PF3_TPHR_CAP_ST_TABLE_LOC_BIN <= PF3_TPHR_CAP_ST_TABLE_LOC;
-------- PF3_TPHR_CAP_ST_TABLE_SIZE check
  -- PF3_TPHR_CAP_ST_TABLE_SIZE_BIN <= PF3_TPHR_CAP_ST_TABLE_SIZE;
-------- PF3_TPHR_CAP_VER check
  -- PF3_TPHR_CAP_VER_BIN <= PF3_TPHR_CAP_VER;
-------- PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 check
  -- case PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 is
    if((PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 = "FALSE") or (PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 = "false")) then
      null;
    elsif((PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 = "TRUE") or (PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_AUTO_EQ_SPEED_CHANGE_TO_GEN3 is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 check
  -- case PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 is
    if((PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 = "FALSE") or (PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 = "false")) then
      null;
    elsif((PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 = "TRUE") or (PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_AUTO_SPEED_CHANGE_TO_GEN2 is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_EI_INFER_IN_L0 check
  -- case PL_DISABLE_EI_INFER_IN_L0 is
    if((PL_DISABLE_EI_INFER_IN_L0 = "FALSE") or (PL_DISABLE_EI_INFER_IN_L0 = "false")) then
      null;
    elsif((PL_DISABLE_EI_INFER_IN_L0 = "TRUE") or (PL_DISABLE_EI_INFER_IN_L0 = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_EI_INFER_IN_L0 is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_GEN3_DC_BALANCE check
  -- case PL_DISABLE_GEN3_DC_BALANCE is
    if((PL_DISABLE_GEN3_DC_BALANCE = "FALSE") or (PL_DISABLE_GEN3_DC_BALANCE = "false")) then
      null;
    elsif((PL_DISABLE_GEN3_DC_BALANCE = "TRUE") or (PL_DISABLE_GEN3_DC_BALANCE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_GEN3_DC_BALANCE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP check
  -- case PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP is
    if((PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP = "TRUE") or (PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP = "true")) then
      null;
    elsif((PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP = "FALSE") or (PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_GEN3_LFSR_UPDATE_ON_SKP is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_RETRAIN_ON_FRAMING_ERROR check
  -- case PL_DISABLE_RETRAIN_ON_FRAMING_ERROR is
    if((PL_DISABLE_RETRAIN_ON_FRAMING_ERROR = "FALSE") or (PL_DISABLE_RETRAIN_ON_FRAMING_ERROR = "false")) then
      null;
    elsif((PL_DISABLE_RETRAIN_ON_FRAMING_ERROR = "TRUE") or (PL_DISABLE_RETRAIN_ON_FRAMING_ERROR = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_RETRAIN_ON_FRAMING_ERROR is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_SCRAMBLING check
  -- case PL_DISABLE_SCRAMBLING is
    if((PL_DISABLE_SCRAMBLING = "FALSE") or (PL_DISABLE_SCRAMBLING = "false")) then
      null;
    elsif((PL_DISABLE_SCRAMBLING = "TRUE") or (PL_DISABLE_SCRAMBLING = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_SCRAMBLING is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_SYNC_HEADER_FRAMING_ERROR check
  -- case PL_DISABLE_SYNC_HEADER_FRAMING_ERROR is
    if((PL_DISABLE_SYNC_HEADER_FRAMING_ERROR = "FALSE") or (PL_DISABLE_SYNC_HEADER_FRAMING_ERROR = "false")) then
      null;
    elsif((PL_DISABLE_SYNC_HEADER_FRAMING_ERROR = "TRUE") or (PL_DISABLE_SYNC_HEADER_FRAMING_ERROR = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_SYNC_HEADER_FRAMING_ERROR is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_DISABLE_UPCONFIG_CAPABLE check
  -- case PL_DISABLE_UPCONFIG_CAPABLE is
    if((PL_DISABLE_UPCONFIG_CAPABLE = "FALSE") or (PL_DISABLE_UPCONFIG_CAPABLE = "false")) then
      null;
    elsif((PL_DISABLE_UPCONFIG_CAPABLE = "TRUE") or (PL_DISABLE_UPCONFIG_CAPABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_DISABLE_UPCONFIG_CAPABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_EQ_ADAPT_DISABLE_COEFF_CHECK check
  -- case PL_EQ_ADAPT_DISABLE_COEFF_CHECK is
    if((PL_EQ_ADAPT_DISABLE_COEFF_CHECK = "FALSE") or (PL_EQ_ADAPT_DISABLE_COEFF_CHECK = "false")) then
      null;
    elsif((PL_EQ_ADAPT_DISABLE_COEFF_CHECK = "TRUE") or (PL_EQ_ADAPT_DISABLE_COEFF_CHECK = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_EQ_ADAPT_DISABLE_COEFF_CHECK is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_EQ_ADAPT_DISABLE_PRESET_CHECK check
  -- case PL_EQ_ADAPT_DISABLE_PRESET_CHECK is
    if((PL_EQ_ADAPT_DISABLE_PRESET_CHECK = "FALSE") or (PL_EQ_ADAPT_DISABLE_PRESET_CHECK = "false")) then
      null;
    elsif((PL_EQ_ADAPT_DISABLE_PRESET_CHECK = "TRUE") or (PL_EQ_ADAPT_DISABLE_PRESET_CHECK = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_EQ_ADAPT_DISABLE_PRESET_CHECK is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_EQ_ADAPT_ITER_COUNT check
  -- PL_EQ_ADAPT_ITER_COUNT_BIN <= PL_EQ_ADAPT_ITER_COUNT;
-------- PL_EQ_ADAPT_REJECT_RETRY_COUNT check
  -- PL_EQ_ADAPT_REJECT_RETRY_COUNT_BIN <= PL_EQ_ADAPT_REJECT_RETRY_COUNT;
-------- PL_EQ_BYPASS_PHASE23 check
  -- case PL_EQ_BYPASS_PHASE23 is
    if((PL_EQ_BYPASS_PHASE23 = "FALSE") or (PL_EQ_BYPASS_PHASE23 = "false")) then
      null;
    elsif((PL_EQ_BYPASS_PHASE23 = "TRUE") or (PL_EQ_BYPASS_PHASE23 = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_EQ_BYPASS_PHASE23 is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT check
  -- PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT_BIN <= PL_EQ_DEFAULT_GEN3_RX_PRESET_HINT;
-------- PL_EQ_DEFAULT_GEN3_TX_PRESET check
  -- PL_EQ_DEFAULT_GEN3_TX_PRESET_BIN <= PL_EQ_DEFAULT_GEN3_TX_PRESET;
-------- PL_EQ_PHASE01_RX_ADAPT check
  -- case PL_EQ_PHASE01_RX_ADAPT is
    if((PL_EQ_PHASE01_RX_ADAPT = "FALSE") or (PL_EQ_PHASE01_RX_ADAPT = "false")) then
      null;
    elsif((PL_EQ_PHASE01_RX_ADAPT = "TRUE") or (PL_EQ_PHASE01_RX_ADAPT = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_EQ_PHASE01_RX_ADAPT is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_EQ_SHORT_ADAPT_PHASE check
  -- case PL_EQ_SHORT_ADAPT_PHASE is
    if((PL_EQ_SHORT_ADAPT_PHASE = "FALSE") or (PL_EQ_SHORT_ADAPT_PHASE = "false")) then
      null;
    elsif((PL_EQ_SHORT_ADAPT_PHASE = "TRUE") or (PL_EQ_SHORT_ADAPT_PHASE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_EQ_SHORT_ADAPT_PHASE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_LANE0_EQ_CONTROL check
  -- PL_LANE0_EQ_CONTROL_BIN <= PL_LANE0_EQ_CONTROL;
-------- PL_LANE1_EQ_CONTROL check
  -- PL_LANE1_EQ_CONTROL_BIN <= PL_LANE1_EQ_CONTROL;
-------- PL_LANE2_EQ_CONTROL check
  -- PL_LANE2_EQ_CONTROL_BIN <= PL_LANE2_EQ_CONTROL;
-------- PL_LANE3_EQ_CONTROL check
  -- PL_LANE3_EQ_CONTROL_BIN <= PL_LANE3_EQ_CONTROL;
-------- PL_LANE4_EQ_CONTROL check
  -- PL_LANE4_EQ_CONTROL_BIN <= PL_LANE4_EQ_CONTROL;
-------- PL_LANE5_EQ_CONTROL check
  -- PL_LANE5_EQ_CONTROL_BIN <= PL_LANE5_EQ_CONTROL;
-------- PL_LANE6_EQ_CONTROL check
  -- PL_LANE6_EQ_CONTROL_BIN <= PL_LANE6_EQ_CONTROL;
-------- PL_LANE7_EQ_CONTROL check
  -- PL_LANE7_EQ_CONTROL_BIN <= PL_LANE7_EQ_CONTROL;
-------- PL_LINK_CAP_MAX_LINK_SPEED check
  -- PL_LINK_CAP_MAX_LINK_SPEED_BIN <= PL_LINK_CAP_MAX_LINK_SPEED;
-------- PL_LINK_CAP_MAX_LINK_WIDTH check
  -- PL_LINK_CAP_MAX_LINK_WIDTH_BIN <= PL_LINK_CAP_MAX_LINK_WIDTH;
-------- PL_N_FTS_COMCLK_GEN1 check
  if ((PL_N_FTS_COMCLK_GEN1 >= 0) and (PL_N_FTS_COMCLK_GEN1 <= 255)) then
    null;
  else
    attr_err <= '1';
    assert FALSE report "Error : PL_N_FTS_COMCLK_GEN1 is not in range 0 .. 255." severity warning;
  end if;
-------- PL_N_FTS_COMCLK_GEN2 check
  if ((PL_N_FTS_COMCLK_GEN2 >= 0) and (PL_N_FTS_COMCLK_GEN2 <= 255)) then
    null;
  else
    attr_err <= '1';
    assert FALSE report "Error : PL_N_FTS_COMCLK_GEN2 is not in range 0 .. 255." severity warning;
  end if;
-------- PL_N_FTS_COMCLK_GEN3 check
  if ((PL_N_FTS_COMCLK_GEN3 >= 0) and (PL_N_FTS_COMCLK_GEN3 <= 255)) then
    null;
  else
    attr_err <= '1';
    assert FALSE report "Error : PL_N_FTS_COMCLK_GEN3 is not in range 0 .. 255." severity warning;
  end if;
-------- PL_N_FTS_GEN1 check
  if ((PL_N_FTS_GEN1 >= 0) and (PL_N_FTS_GEN1 <= 255)) then
    null;
  else
    attr_err <= '1';
    assert FALSE report "Error : PL_N_FTS_GEN1 is not in range 0 .. 255." severity warning;
  end if;
-------- PL_N_FTS_GEN2 check
  if ((PL_N_FTS_GEN2 >= 0) and (PL_N_FTS_GEN2 <= 255)) then
    null;
  else
    attr_err <= '1';
    assert FALSE report "Error : PL_N_FTS_GEN2 is not in range 0 .. 255." severity warning;
  end if;
-------- PL_N_FTS_GEN3 check
  if ((PL_N_FTS_GEN3 >= 0) and (PL_N_FTS_GEN3 <= 255)) then
    null;
  else
    attr_err <= '1';
    assert FALSE report "Error : PL_N_FTS_GEN3 is not in range 0 .. 255." severity warning;
  end if;
-------- PL_REPORT_ALL_PHY_ERRORS check
  -- case PL_REPORT_ALL_PHY_ERRORS is
    if((PL_REPORT_ALL_PHY_ERRORS = "TRUE") or (PL_REPORT_ALL_PHY_ERRORS = "true")) then
      null;
    elsif((PL_REPORT_ALL_PHY_ERRORS = "FALSE") or (PL_REPORT_ALL_PHY_ERRORS = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_REPORT_ALL_PHY_ERRORS is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PL_SIM_FAST_LINK_TRAINING check
  -- case PL_SIM_FAST_LINK_TRAINING is
    if((PL_SIM_FAST_LINK_TRAINING = "FALSE") or (PL_SIM_FAST_LINK_TRAINING = "false")) then
      null;
    elsif((PL_SIM_FAST_LINK_TRAINING = "TRUE") or (PL_SIM_FAST_LINK_TRAINING = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_SIM_FAST_LINK_TRAINING is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PL_UPSTREAM_FACING check
  -- case PL_UPSTREAM_FACING is
    if((PL_UPSTREAM_FACING = "TRUE") or (PL_UPSTREAM_FACING = "true")) then
      null;
    elsif((PL_UPSTREAM_FACING = "FALSE") or (PL_UPSTREAM_FACING = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PL_UPSTREAM_FACING is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PM_ASPML0S_TIMEOUT check
  -- PM_ASPML0S_TIMEOUT_BIN <= PM_ASPML0S_TIMEOUT;
-------- PM_ASPML1_ENTRY_DELAY check
  -- PM_ASPML1_ENTRY_DELAY_BIN <= PM_ASPML1_ENTRY_DELAY;
-------- PM_ENABLE_L23_ENTRY check
  -- case PM_ENABLE_L23_ENTRY is
    if((PM_ENABLE_L23_ENTRY = "FALSE") or (PM_ENABLE_L23_ENTRY = "false")) then
      null;
    elsif((PM_ENABLE_L23_ENTRY = "TRUE") or (PM_ENABLE_L23_ENTRY = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PM_ENABLE_L23_ENTRY is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- PM_ENABLE_SLOT_POWER_CAPTURE check
  -- case PM_ENABLE_SLOT_POWER_CAPTURE is
    if((PM_ENABLE_SLOT_POWER_CAPTURE = "TRUE") or (PM_ENABLE_SLOT_POWER_CAPTURE = "true")) then
      null;
    elsif((PM_ENABLE_SLOT_POWER_CAPTURE = "FALSE") or (PM_ENABLE_SLOT_POWER_CAPTURE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : PM_ENABLE_SLOT_POWER_CAPTURE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- PM_L1_REENTRY_DELAY check
  -- PM_L1_REENTRY_DELAY_BIN <= PM_L1_REENTRY_DELAY;
-------- PM_PME_SERVICE_TIMEOUT_DELAY check
  -- PM_PME_SERVICE_TIMEOUT_DELAY_BIN <= PM_PME_SERVICE_TIMEOUT_DELAY;
-------- PM_PME_TURNOFF_ACK_DELAY check
  -- PM_PME_TURNOFF_ACK_DELAY_BIN <= PM_PME_TURNOFF_ACK_DELAY;
-------- SIM_JTAG_IDCODE check
  -- SIM_JTAG_IDCODE_BIN <= SIM_JTAG_IDCODE;
-------- SIM_VERSION check
  -- case SIM_VERSION is
    if((SIM_VERSION = "1.0") or (SIM_VERSION = "1.0")) then
      null;
    elsif((SIM_VERSION = "1.1") or (SIM_VERSION = "1.1")) then
      null;
    elsif((SIM_VERSION = "1.2") or (SIM_VERSION = "1.2")) then
      null;
    elsif((SIM_VERSION = "1.3") or (SIM_VERSION = "1.3")) then
      null;
    elsif((SIM_VERSION = "2.0") or (SIM_VERSION = "2.0")) then
      null;
    elsif((SIM_VERSION = "3.0") or (SIM_VERSION = "3.0")) then
      null;
    elsif((SIM_VERSION = "4.0") or (SIM_VERSION = "4.0")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : SIM_VERSION is not 1.0, 1.1, 1.2, 1.3, 2.0, 3.0, 4.0." severity warning;
    end if;
  -- end case;
-------- SPARE_BIT0 check
  case SPARE_BIT0 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT0 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT1 check
  case SPARE_BIT1 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT1 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT2 check
  case SPARE_BIT2 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT2 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT3 check
  case SPARE_BIT3 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT3 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT4 check
  case SPARE_BIT4 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT4 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT5 check
  case SPARE_BIT5 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT5 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT6 check
  case SPARE_BIT6 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT6 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT7 check
  case SPARE_BIT7 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT7 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BIT8 check
  case SPARE_BIT8 is
    when  0   =>  null;
    when  1   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : SPARE_BIT8 is not in range 0 .. 1." severity warning;
    end case;
-------- SPARE_BYTE0 check
  -- SPARE_BYTE0_BIN <= SPARE_BYTE0;
-------- SPARE_BYTE1 check
  -- SPARE_BYTE1_BIN <= SPARE_BYTE1;
-------- SPARE_BYTE2 check
  -- SPARE_BYTE2_BIN <= SPARE_BYTE2;
-------- SPARE_BYTE3 check
  -- SPARE_BYTE3_BIN <= SPARE_BYTE3;
-------- SPARE_WORD0 check
  -- SPARE_WORD0_BIN <= SPARE_WORD0;
-------- SPARE_WORD1 check
  -- SPARE_WORD1_BIN <= SPARE_WORD1;
-------- SPARE_WORD2 check
  -- SPARE_WORD2_BIN <= SPARE_WORD2;
-------- SPARE_WORD3 check
  -- SPARE_WORD3_BIN <= SPARE_WORD3;
-------- SRIOV_CAP_ENABLE check
  -- case SRIOV_CAP_ENABLE is
    if((SRIOV_CAP_ENABLE = "FALSE") or (SRIOV_CAP_ENABLE = "false")) then
      null;
    elsif((SRIOV_CAP_ENABLE = "TRUE") or (SRIOV_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : SRIOV_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- TL_COMPLETION_RAM_SIZE_16K check
  -- case TL_COMPLETION_RAM_SIZE_16K is
    if((TL_COMPLETION_RAM_SIZE_16K = "TRUE") or (TL_COMPLETION_RAM_SIZE_16K = "true")) then
      null;
    elsif((TL_COMPLETION_RAM_SIZE_16K = "FALSE") or (TL_COMPLETION_RAM_SIZE_16K = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TL_COMPLETION_RAM_SIZE_16K is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- TL_COMPL_TIMEOUT_REG0 check
  -- TL_COMPL_TIMEOUT_REG0_BIN <= TL_COMPL_TIMEOUT_REG0;
-------- TL_COMPL_TIMEOUT_REG1 check
  -- TL_COMPL_TIMEOUT_REG1_BIN <= TL_COMPL_TIMEOUT_REG1;
-------- TL_CREDITS_CD check
  -- TL_CREDITS_CD_BIN <= TL_CREDITS_CD;
-------- TL_CREDITS_CH check
  -- TL_CREDITS_CH_BIN <= TL_CREDITS_CH;
-------- TL_CREDITS_NPD check
  -- TL_CREDITS_NPD_BIN <= TL_CREDITS_NPD;
-------- TL_CREDITS_NPH check
  -- TL_CREDITS_NPH_BIN <= TL_CREDITS_NPH;
-------- TL_CREDITS_PD check
  -- TL_CREDITS_PD_BIN <= TL_CREDITS_PD;
-------- TL_CREDITS_PH check
  -- TL_CREDITS_PH_BIN <= TL_CREDITS_PH;
-------- TL_ENABLE_MESSAGE_RID_CHECK_ENABLE check
  -- case TL_ENABLE_MESSAGE_RID_CHECK_ENABLE is
    if((TL_ENABLE_MESSAGE_RID_CHECK_ENABLE = "TRUE") or (TL_ENABLE_MESSAGE_RID_CHECK_ENABLE = "true")) then
      null;
    elsif((TL_ENABLE_MESSAGE_RID_CHECK_ENABLE = "FALSE") or (TL_ENABLE_MESSAGE_RID_CHECK_ENABLE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TL_ENABLE_MESSAGE_RID_CHECK_ENABLE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE check
  -- case TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE is
    if((TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE = "FALSE") or (TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE = "false")) then
      null;
    elsif((TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE = "TRUE") or (TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TL_EXTENDED_CFG_EXTEND_INTERFACE_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE check
  -- case TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE is
    if((TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE = "FALSE") or (TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE = "false")) then
      null;
    elsif((TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE = "TRUE") or (TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TL_LEGACY_CFG_EXTEND_INTERFACE_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- TL_LEGACY_MODE_ENABLE check
  -- case TL_LEGACY_MODE_ENABLE is
    if((TL_LEGACY_MODE_ENABLE = "FALSE") or (TL_LEGACY_MODE_ENABLE = "false")) then
      null;
    elsif((TL_LEGACY_MODE_ENABLE = "TRUE") or (TL_LEGACY_MODE_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TL_LEGACY_MODE_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- TL_PF_ENABLE_REG check
  -- TL_PF_ENABLE_REG_BIN <= TL_PF_ENABLE_REG;
-------- TL_TX_MUX_STRICT_PRIORITY check
  -- case TL_TX_MUX_STRICT_PRIORITY is
    if((TL_TX_MUX_STRICT_PRIORITY = "TRUE") or (TL_TX_MUX_STRICT_PRIORITY = "true")) then
      null;
    elsif((TL_TX_MUX_STRICT_PRIORITY = "FALSE") or (TL_TX_MUX_STRICT_PRIORITY = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TL_TX_MUX_STRICT_PRIORITY is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- TWO_LAYER_MODE_DLCMSM_ENABLE check
  -- case TWO_LAYER_MODE_DLCMSM_ENABLE is
    if((TWO_LAYER_MODE_DLCMSM_ENABLE = "TRUE") or (TWO_LAYER_MODE_DLCMSM_ENABLE = "true")) then
      null;
    elsif((TWO_LAYER_MODE_DLCMSM_ENABLE = "FALSE") or (TWO_LAYER_MODE_DLCMSM_ENABLE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TWO_LAYER_MODE_DLCMSM_ENABLE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- TWO_LAYER_MODE_ENABLE check
  -- case TWO_LAYER_MODE_ENABLE is
    if((TWO_LAYER_MODE_ENABLE = "FALSE") or (TWO_LAYER_MODE_ENABLE = "false")) then
      null;
    elsif((TWO_LAYER_MODE_ENABLE = "TRUE") or (TWO_LAYER_MODE_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TWO_LAYER_MODE_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- TWO_LAYER_MODE_WIDTH_256 check
  -- case TWO_LAYER_MODE_WIDTH_256 is
    if((TWO_LAYER_MODE_WIDTH_256 = "TRUE") or (TWO_LAYER_MODE_WIDTH_256 = "true")) then
      null;
    elsif((TWO_LAYER_MODE_WIDTH_256 = "FALSE") or (TWO_LAYER_MODE_WIDTH_256 = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : TWO_LAYER_MODE_WIDTH_256 is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF0_ARI_CAP_NEXTPTR check
  -- VF0_ARI_CAP_NEXTPTR_BIN <= VF0_ARI_CAP_NEXTPTR;
-------- VF0_CAPABILITY_POINTER check
  -- VF0_CAPABILITY_POINTER_BIN <= VF0_CAPABILITY_POINTER;
-------- VF0_MSIX_CAP_PBA_BIR check
  case VF0_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF0_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF0_MSIX_CAP_PBA_OFFSET check
  -- VF0_MSIX_CAP_PBA_OFFSET_BIN <= VF0_MSIX_CAP_PBA_OFFSET;
-------- VF0_MSIX_CAP_TABLE_BIR check
  case VF0_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF0_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF0_MSIX_CAP_TABLE_OFFSET check
  -- VF0_MSIX_CAP_TABLE_OFFSET_BIN <= VF0_MSIX_CAP_TABLE_OFFSET;
-------- VF0_MSIX_CAP_TABLE_SIZE check
  -- VF0_MSIX_CAP_TABLE_SIZE_BIN <= VF0_MSIX_CAP_TABLE_SIZE;
-------- VF0_MSI_CAP_MULTIMSGCAP check
  case VF0_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF0_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF0_PM_CAP_ID check
  -- VF0_PM_CAP_ID_BIN <= VF0_PM_CAP_ID;
-------- VF0_PM_CAP_NEXTPTR check
  -- VF0_PM_CAP_NEXTPTR_BIN <= VF0_PM_CAP_NEXTPTR;
-------- VF0_PM_CAP_VER_ID check
  -- VF0_PM_CAP_VER_ID_BIN <= VF0_PM_CAP_VER_ID;
-------- VF0_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF0_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF0_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF0_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF0_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF0_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF0_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF0_TPHR_CAP_ENABLE check
  -- case VF0_TPHR_CAP_ENABLE is
    if((VF0_TPHR_CAP_ENABLE = "FALSE") or (VF0_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF0_TPHR_CAP_ENABLE = "TRUE") or (VF0_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF0_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF0_TPHR_CAP_INT_VEC_MODE check
  -- case VF0_TPHR_CAP_INT_VEC_MODE is
    if((VF0_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF0_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF0_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF0_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF0_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF0_TPHR_CAP_NEXTPTR check
  -- VF0_TPHR_CAP_NEXTPTR_BIN <= VF0_TPHR_CAP_NEXTPTR;
-------- VF0_TPHR_CAP_ST_MODE_SEL check
  -- VF0_TPHR_CAP_ST_MODE_SEL_BIN <= VF0_TPHR_CAP_ST_MODE_SEL;
-------- VF0_TPHR_CAP_ST_TABLE_LOC check
  -- VF0_TPHR_CAP_ST_TABLE_LOC_BIN <= VF0_TPHR_CAP_ST_TABLE_LOC;
-------- VF0_TPHR_CAP_ST_TABLE_SIZE check
  -- VF0_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF0_TPHR_CAP_ST_TABLE_SIZE;
-------- VF0_TPHR_CAP_VER check
  -- VF0_TPHR_CAP_VER_BIN <= VF0_TPHR_CAP_VER;
-------- VF1_ARI_CAP_NEXTPTR check
  -- VF1_ARI_CAP_NEXTPTR_BIN <= VF1_ARI_CAP_NEXTPTR;
-------- VF1_MSIX_CAP_PBA_BIR check
  case VF1_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF1_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF1_MSIX_CAP_PBA_OFFSET check
  -- VF1_MSIX_CAP_PBA_OFFSET_BIN <= VF1_MSIX_CAP_PBA_OFFSET;
-------- VF1_MSIX_CAP_TABLE_BIR check
  case VF1_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF1_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF1_MSIX_CAP_TABLE_OFFSET check
  -- VF1_MSIX_CAP_TABLE_OFFSET_BIN <= VF1_MSIX_CAP_TABLE_OFFSET;
-------- VF1_MSIX_CAP_TABLE_SIZE check
  -- VF1_MSIX_CAP_TABLE_SIZE_BIN <= VF1_MSIX_CAP_TABLE_SIZE;
-------- VF1_MSI_CAP_MULTIMSGCAP check
  case VF1_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF1_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF1_PM_CAP_ID check
  -- VF1_PM_CAP_ID_BIN <= VF1_PM_CAP_ID;
-------- VF1_PM_CAP_NEXTPTR check
  -- VF1_PM_CAP_NEXTPTR_BIN <= VF1_PM_CAP_NEXTPTR;
-------- VF1_PM_CAP_VER_ID check
  -- VF1_PM_CAP_VER_ID_BIN <= VF1_PM_CAP_VER_ID;
-------- VF1_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF1_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF1_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF1_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF1_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF1_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF1_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF1_TPHR_CAP_ENABLE check
  -- case VF1_TPHR_CAP_ENABLE is
    if((VF1_TPHR_CAP_ENABLE = "FALSE") or (VF1_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF1_TPHR_CAP_ENABLE = "TRUE") or (VF1_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF1_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF1_TPHR_CAP_INT_VEC_MODE check
  -- case VF1_TPHR_CAP_INT_VEC_MODE is
    if((VF1_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF1_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF1_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF1_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF1_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF1_TPHR_CAP_NEXTPTR check
  -- VF1_TPHR_CAP_NEXTPTR_BIN <= VF1_TPHR_CAP_NEXTPTR;
-------- VF1_TPHR_CAP_ST_MODE_SEL check
  -- VF1_TPHR_CAP_ST_MODE_SEL_BIN <= VF1_TPHR_CAP_ST_MODE_SEL;
-------- VF1_TPHR_CAP_ST_TABLE_LOC check
  -- VF1_TPHR_CAP_ST_TABLE_LOC_BIN <= VF1_TPHR_CAP_ST_TABLE_LOC;
-------- VF1_TPHR_CAP_ST_TABLE_SIZE check
  -- VF1_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF1_TPHR_CAP_ST_TABLE_SIZE;
-------- VF1_TPHR_CAP_VER check
  -- VF1_TPHR_CAP_VER_BIN <= VF1_TPHR_CAP_VER;
-------- VF2_ARI_CAP_NEXTPTR check
  -- VF2_ARI_CAP_NEXTPTR_BIN <= VF2_ARI_CAP_NEXTPTR;
-------- VF2_MSIX_CAP_PBA_BIR check
  case VF2_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF2_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF2_MSIX_CAP_PBA_OFFSET check
  -- VF2_MSIX_CAP_PBA_OFFSET_BIN <= VF2_MSIX_CAP_PBA_OFFSET;
-------- VF2_MSIX_CAP_TABLE_BIR check
  case VF2_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF2_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF2_MSIX_CAP_TABLE_OFFSET check
  -- VF2_MSIX_CAP_TABLE_OFFSET_BIN <= VF2_MSIX_CAP_TABLE_OFFSET;
-------- VF2_MSIX_CAP_TABLE_SIZE check
  -- VF2_MSIX_CAP_TABLE_SIZE_BIN <= VF2_MSIX_CAP_TABLE_SIZE;
-------- VF2_MSI_CAP_MULTIMSGCAP check
  case VF2_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF2_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF2_PM_CAP_ID check
  -- VF2_PM_CAP_ID_BIN <= VF2_PM_CAP_ID;
-------- VF2_PM_CAP_NEXTPTR check
  -- VF2_PM_CAP_NEXTPTR_BIN <= VF2_PM_CAP_NEXTPTR;
-------- VF2_PM_CAP_VER_ID check
  -- VF2_PM_CAP_VER_ID_BIN <= VF2_PM_CAP_VER_ID;
-------- VF2_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF2_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF2_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF2_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF2_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF2_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF2_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF2_TPHR_CAP_ENABLE check
  -- case VF2_TPHR_CAP_ENABLE is
    if((VF2_TPHR_CAP_ENABLE = "FALSE") or (VF2_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF2_TPHR_CAP_ENABLE = "TRUE") or (VF2_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF2_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF2_TPHR_CAP_INT_VEC_MODE check
  -- case VF2_TPHR_CAP_INT_VEC_MODE is
    if((VF2_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF2_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF2_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF2_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF2_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF2_TPHR_CAP_NEXTPTR check
  -- VF2_TPHR_CAP_NEXTPTR_BIN <= VF2_TPHR_CAP_NEXTPTR;
-------- VF2_TPHR_CAP_ST_MODE_SEL check
  -- VF2_TPHR_CAP_ST_MODE_SEL_BIN <= VF2_TPHR_CAP_ST_MODE_SEL;
-------- VF2_TPHR_CAP_ST_TABLE_LOC check
  -- VF2_TPHR_CAP_ST_TABLE_LOC_BIN <= VF2_TPHR_CAP_ST_TABLE_LOC;
-------- VF2_TPHR_CAP_ST_TABLE_SIZE check
  -- VF2_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF2_TPHR_CAP_ST_TABLE_SIZE;
-------- VF2_TPHR_CAP_VER check
  -- VF2_TPHR_CAP_VER_BIN <= VF2_TPHR_CAP_VER;
-------- VF3_ARI_CAP_NEXTPTR check
  -- VF3_ARI_CAP_NEXTPTR_BIN <= VF3_ARI_CAP_NEXTPTR;
-------- VF3_MSIX_CAP_PBA_BIR check
  case VF3_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF3_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF3_MSIX_CAP_PBA_OFFSET check
  -- VF3_MSIX_CAP_PBA_OFFSET_BIN <= VF3_MSIX_CAP_PBA_OFFSET;
-------- VF3_MSIX_CAP_TABLE_BIR check
  case VF3_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF3_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF3_MSIX_CAP_TABLE_OFFSET check
  -- VF3_MSIX_CAP_TABLE_OFFSET_BIN <= VF3_MSIX_CAP_TABLE_OFFSET;
-------- VF3_MSIX_CAP_TABLE_SIZE check
  -- VF3_MSIX_CAP_TABLE_SIZE_BIN <= VF3_MSIX_CAP_TABLE_SIZE;
-------- VF3_MSI_CAP_MULTIMSGCAP check
  case VF3_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF3_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF3_PM_CAP_ID check
  -- VF3_PM_CAP_ID_BIN <= VF3_PM_CAP_ID;
-------- VF3_PM_CAP_NEXTPTR check
  -- VF3_PM_CAP_NEXTPTR_BIN <= VF3_PM_CAP_NEXTPTR;
-------- VF3_PM_CAP_VER_ID check
  -- VF3_PM_CAP_VER_ID_BIN <= VF3_PM_CAP_VER_ID;
-------- VF3_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF3_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF3_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF3_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF3_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF3_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF3_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF3_TPHR_CAP_ENABLE check
  -- case VF3_TPHR_CAP_ENABLE is
    if((VF3_TPHR_CAP_ENABLE = "FALSE") or (VF3_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF3_TPHR_CAP_ENABLE = "TRUE") or (VF3_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF3_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF3_TPHR_CAP_INT_VEC_MODE check
  -- case VF3_TPHR_CAP_INT_VEC_MODE is
    if((VF3_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF3_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF3_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF3_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF3_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF3_TPHR_CAP_NEXTPTR check
  -- VF3_TPHR_CAP_NEXTPTR_BIN <= VF3_TPHR_CAP_NEXTPTR;
-------- VF3_TPHR_CAP_ST_MODE_SEL check
  -- VF3_TPHR_CAP_ST_MODE_SEL_BIN <= VF3_TPHR_CAP_ST_MODE_SEL;
-------- VF3_TPHR_CAP_ST_TABLE_LOC check
  -- VF3_TPHR_CAP_ST_TABLE_LOC_BIN <= VF3_TPHR_CAP_ST_TABLE_LOC;
-------- VF3_TPHR_CAP_ST_TABLE_SIZE check
  -- VF3_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF3_TPHR_CAP_ST_TABLE_SIZE;
-------- VF3_TPHR_CAP_VER check
  -- VF3_TPHR_CAP_VER_BIN <= VF3_TPHR_CAP_VER;
-------- VF4_ARI_CAP_NEXTPTR check
  -- VF4_ARI_CAP_NEXTPTR_BIN <= VF4_ARI_CAP_NEXTPTR;
-------- VF4_MSIX_CAP_PBA_BIR check
  case VF4_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF4_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF4_MSIX_CAP_PBA_OFFSET check
  -- VF4_MSIX_CAP_PBA_OFFSET_BIN <= VF4_MSIX_CAP_PBA_OFFSET;
-------- VF4_MSIX_CAP_TABLE_BIR check
  case VF4_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF4_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF4_MSIX_CAP_TABLE_OFFSET check
  -- VF4_MSIX_CAP_TABLE_OFFSET_BIN <= VF4_MSIX_CAP_TABLE_OFFSET;
-------- VF4_MSIX_CAP_TABLE_SIZE check
  -- VF4_MSIX_CAP_TABLE_SIZE_BIN <= VF4_MSIX_CAP_TABLE_SIZE;
-------- VF4_MSI_CAP_MULTIMSGCAP check
  case VF4_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF4_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF4_PM_CAP_ID check
  -- VF4_PM_CAP_ID_BIN <= VF4_PM_CAP_ID;
-------- VF4_PM_CAP_NEXTPTR check
  -- VF4_PM_CAP_NEXTPTR_BIN <= VF4_PM_CAP_NEXTPTR;
-------- VF4_PM_CAP_VER_ID check
  -- VF4_PM_CAP_VER_ID_BIN <= VF4_PM_CAP_VER_ID;
-------- VF4_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF4_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF4_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF4_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF4_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF4_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF4_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF4_TPHR_CAP_ENABLE check
  -- case VF4_TPHR_CAP_ENABLE is
    if((VF4_TPHR_CAP_ENABLE = "FALSE") or (VF4_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF4_TPHR_CAP_ENABLE = "TRUE") or (VF4_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF4_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF4_TPHR_CAP_INT_VEC_MODE check
  -- case VF4_TPHR_CAP_INT_VEC_MODE is
    if((VF4_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF4_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF4_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF4_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF4_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF4_TPHR_CAP_NEXTPTR check
  -- VF4_TPHR_CAP_NEXTPTR_BIN <= VF4_TPHR_CAP_NEXTPTR;
-------- VF4_TPHR_CAP_ST_MODE_SEL check
  -- VF4_TPHR_CAP_ST_MODE_SEL_BIN <= VF4_TPHR_CAP_ST_MODE_SEL;
-------- VF4_TPHR_CAP_ST_TABLE_LOC check
  -- VF4_TPHR_CAP_ST_TABLE_LOC_BIN <= VF4_TPHR_CAP_ST_TABLE_LOC;
-------- VF4_TPHR_CAP_ST_TABLE_SIZE check
  -- VF4_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF4_TPHR_CAP_ST_TABLE_SIZE;
-------- VF4_TPHR_CAP_VER check
  -- VF4_TPHR_CAP_VER_BIN <= VF4_TPHR_CAP_VER;
-------- VF5_ARI_CAP_NEXTPTR check
  -- VF5_ARI_CAP_NEXTPTR_BIN <= VF5_ARI_CAP_NEXTPTR;
-------- VF5_MSIX_CAP_PBA_BIR check
  case VF5_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF5_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF5_MSIX_CAP_PBA_OFFSET check
  -- VF5_MSIX_CAP_PBA_OFFSET_BIN <= VF5_MSIX_CAP_PBA_OFFSET;
-------- VF5_MSIX_CAP_TABLE_BIR check
  case VF5_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF5_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF5_MSIX_CAP_TABLE_OFFSET check
  -- VF5_MSIX_CAP_TABLE_OFFSET_BIN <= VF5_MSIX_CAP_TABLE_OFFSET;
-------- VF5_MSIX_CAP_TABLE_SIZE check
  -- VF5_MSIX_CAP_TABLE_SIZE_BIN <= VF5_MSIX_CAP_TABLE_SIZE;
-------- VF5_MSI_CAP_MULTIMSGCAP check
  case VF5_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF5_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF5_PM_CAP_ID check
  -- VF5_PM_CAP_ID_BIN <= VF5_PM_CAP_ID;
-------- VF5_PM_CAP_NEXTPTR check
  -- VF5_PM_CAP_NEXTPTR_BIN <= VF5_PM_CAP_NEXTPTR;
-------- VF5_PM_CAP_VER_ID check
  -- VF5_PM_CAP_VER_ID_BIN <= VF5_PM_CAP_VER_ID;
-------- VF5_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF5_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF5_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF5_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF5_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF5_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF5_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF5_TPHR_CAP_ENABLE check
  -- case VF5_TPHR_CAP_ENABLE is
    if((VF5_TPHR_CAP_ENABLE = "FALSE") or (VF5_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF5_TPHR_CAP_ENABLE = "TRUE") or (VF5_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF5_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF5_TPHR_CAP_INT_VEC_MODE check
  -- case VF5_TPHR_CAP_INT_VEC_MODE is
    if((VF5_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF5_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF5_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF5_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF5_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF5_TPHR_CAP_NEXTPTR check
  -- VF5_TPHR_CAP_NEXTPTR_BIN <= VF5_TPHR_CAP_NEXTPTR;
-------- VF5_TPHR_CAP_ST_MODE_SEL check
  -- VF5_TPHR_CAP_ST_MODE_SEL_BIN <= VF5_TPHR_CAP_ST_MODE_SEL;
-------- VF5_TPHR_CAP_ST_TABLE_LOC check
  -- VF5_TPHR_CAP_ST_TABLE_LOC_BIN <= VF5_TPHR_CAP_ST_TABLE_LOC;
-------- VF5_TPHR_CAP_ST_TABLE_SIZE check
  -- VF5_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF5_TPHR_CAP_ST_TABLE_SIZE;
-------- VF5_TPHR_CAP_VER check
  -- VF5_TPHR_CAP_VER_BIN <= VF5_TPHR_CAP_VER;
-------- VF6_ARI_CAP_NEXTPTR check
  -- VF6_ARI_CAP_NEXTPTR_BIN <= VF6_ARI_CAP_NEXTPTR;
-------- VF6_MSIX_CAP_PBA_BIR check
  case VF6_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF6_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF6_MSIX_CAP_PBA_OFFSET check
  -- VF6_MSIX_CAP_PBA_OFFSET_BIN <= VF6_MSIX_CAP_PBA_OFFSET;
-------- VF6_MSIX_CAP_TABLE_BIR check
  case VF6_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF6_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF6_MSIX_CAP_TABLE_OFFSET check
  -- VF6_MSIX_CAP_TABLE_OFFSET_BIN <= VF6_MSIX_CAP_TABLE_OFFSET;
-------- VF6_MSIX_CAP_TABLE_SIZE check
  -- VF6_MSIX_CAP_TABLE_SIZE_BIN <= VF6_MSIX_CAP_TABLE_SIZE;
-------- VF6_MSI_CAP_MULTIMSGCAP check
  case VF6_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF6_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF6_PM_CAP_ID check
  -- VF6_PM_CAP_ID_BIN <= VF6_PM_CAP_ID;
-------- VF6_PM_CAP_NEXTPTR check
  -- VF6_PM_CAP_NEXTPTR_BIN <= VF6_PM_CAP_NEXTPTR;
-------- VF6_PM_CAP_VER_ID check
  -- VF6_PM_CAP_VER_ID_BIN <= VF6_PM_CAP_VER_ID;
-------- VF6_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF6_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF6_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF6_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF6_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF6_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF6_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF6_TPHR_CAP_ENABLE check
  -- case VF6_TPHR_CAP_ENABLE is
    if((VF6_TPHR_CAP_ENABLE = "FALSE") or (VF6_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF6_TPHR_CAP_ENABLE = "TRUE") or (VF6_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF6_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF6_TPHR_CAP_INT_VEC_MODE check
  -- case VF6_TPHR_CAP_INT_VEC_MODE is
    if((VF6_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF6_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF6_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF6_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF6_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF6_TPHR_CAP_NEXTPTR check
  -- VF6_TPHR_CAP_NEXTPTR_BIN <= VF6_TPHR_CAP_NEXTPTR;
-------- VF6_TPHR_CAP_ST_MODE_SEL check
  -- VF6_TPHR_CAP_ST_MODE_SEL_BIN <= VF6_TPHR_CAP_ST_MODE_SEL;
-------- VF6_TPHR_CAP_ST_TABLE_LOC check
  -- VF6_TPHR_CAP_ST_TABLE_LOC_BIN <= VF6_TPHR_CAP_ST_TABLE_LOC;
-------- VF6_TPHR_CAP_ST_TABLE_SIZE check
  -- VF6_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF6_TPHR_CAP_ST_TABLE_SIZE;
-------- VF6_TPHR_CAP_VER check
  -- VF6_TPHR_CAP_VER_BIN <= VF6_TPHR_CAP_VER;
-------- VF7_ARI_CAP_NEXTPTR check
  -- VF7_ARI_CAP_NEXTPTR_BIN <= VF7_ARI_CAP_NEXTPTR;
-------- VF7_MSIX_CAP_PBA_BIR check
  case VF7_MSIX_CAP_PBA_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF7_MSIX_CAP_PBA_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF7_MSIX_CAP_PBA_OFFSET check
  -- VF7_MSIX_CAP_PBA_OFFSET_BIN <= VF7_MSIX_CAP_PBA_OFFSET;
-------- VF7_MSIX_CAP_TABLE_BIR check
  case VF7_MSIX_CAP_TABLE_BIR is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF7_MSIX_CAP_TABLE_BIR is not in range 0 .. 7." severity warning;
    end case;
-------- VF7_MSIX_CAP_TABLE_OFFSET check
  -- VF7_MSIX_CAP_TABLE_OFFSET_BIN <= VF7_MSIX_CAP_TABLE_OFFSET;
-------- VF7_MSIX_CAP_TABLE_SIZE check
  -- VF7_MSIX_CAP_TABLE_SIZE_BIN <= VF7_MSIX_CAP_TABLE_SIZE;
-------- VF7_MSI_CAP_MULTIMSGCAP check
  case VF7_MSI_CAP_MULTIMSGCAP is
    when  0   =>  null;
    when  1   =>  null;
    when  2   =>  null;
    when  3   =>  null;
    when  4   =>  null;
    when  5   =>  null;
    when  6   =>  null;
    when  7   =>  null;
    when others  =>
      attr_err <= '1';
      assert FALSE report "Error : VF7_MSI_CAP_MULTIMSGCAP is not in range 0 .. 7." severity warning;
    end case;
-------- VF7_PM_CAP_ID check
  -- VF7_PM_CAP_ID_BIN <= VF7_PM_CAP_ID;
-------- VF7_PM_CAP_NEXTPTR check
  -- VF7_PM_CAP_NEXTPTR_BIN <= VF7_PM_CAP_NEXTPTR;
-------- VF7_PM_CAP_VER_ID check
  -- VF7_PM_CAP_VER_ID_BIN <= VF7_PM_CAP_VER_ID;
-------- VF7_TPHR_CAP_DEV_SPECIFIC_MODE check
  -- case VF7_TPHR_CAP_DEV_SPECIFIC_MODE is
    if((VF7_TPHR_CAP_DEV_SPECIFIC_MODE = "TRUE") or (VF7_TPHR_CAP_DEV_SPECIFIC_MODE = "true")) then
      null;
    elsif((VF7_TPHR_CAP_DEV_SPECIFIC_MODE = "FALSE") or (VF7_TPHR_CAP_DEV_SPECIFIC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF7_TPHR_CAP_DEV_SPECIFIC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF7_TPHR_CAP_ENABLE check
  -- case VF7_TPHR_CAP_ENABLE is
    if((VF7_TPHR_CAP_ENABLE = "FALSE") or (VF7_TPHR_CAP_ENABLE = "false")) then
      null;
    elsif((VF7_TPHR_CAP_ENABLE = "TRUE") or (VF7_TPHR_CAP_ENABLE = "true")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF7_TPHR_CAP_ENABLE is not FALSE, TRUE." severity warning;
    end if;
  -- end case;
-------- VF7_TPHR_CAP_INT_VEC_MODE check
  -- case VF7_TPHR_CAP_INT_VEC_MODE is
    if((VF7_TPHR_CAP_INT_VEC_MODE = "TRUE") or (VF7_TPHR_CAP_INT_VEC_MODE = "true")) then
      null;
    elsif((VF7_TPHR_CAP_INT_VEC_MODE = "FALSE") or (VF7_TPHR_CAP_INT_VEC_MODE = "false")) then
      null;
    else
      attr_err <= '1';
      assert FALSE report "Error : VF7_TPHR_CAP_INT_VEC_MODE is not TRUE, FALSE." severity warning;
    end if;
  -- end case;
-------- VF7_TPHR_CAP_NEXTPTR check
  -- VF7_TPHR_CAP_NEXTPTR_BIN <= VF7_TPHR_CAP_NEXTPTR;
-------- VF7_TPHR_CAP_ST_MODE_SEL check
  -- VF7_TPHR_CAP_ST_MODE_SEL_BIN <= VF7_TPHR_CAP_ST_MODE_SEL;
-------- VF7_TPHR_CAP_ST_TABLE_LOC check
  -- VF7_TPHR_CAP_ST_TABLE_LOC_BIN <= VF7_TPHR_CAP_ST_TABLE_LOC;
-------- VF7_TPHR_CAP_ST_TABLE_SIZE check
  -- VF7_TPHR_CAP_ST_TABLE_SIZE_BIN <= VF7_TPHR_CAP_ST_TABLE_SIZE;
-------- VF7_TPHR_CAP_VER check
  -- VF7_TPHR_CAP_VER_BIN <= VF7_TPHR_CAP_VER;
  if  (attr_err = '1') then
    assert FALSE
    report "Error : Attribute Error(s) encountered"
    severity error;
  end if;
  wait;
  end process INIPROC;
end PCIE_3_1_V;
