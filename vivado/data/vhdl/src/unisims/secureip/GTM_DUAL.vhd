-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2019.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        GTM_DUAL
-- /___/   /\      Filename    : GTM_DUAL.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL GTM_DUAL -----

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

entity GTM_DUAL is
  generic (
    A_CFG : std_logic_vector(15 downto 0) := "0000100001000000";
    A_SDM_DATA_CFG0 : std_logic_vector(15 downto 0) := "0000000011010000";
    A_SDM_DATA_CFG1 : std_logic_vector(15 downto 0) := "0000000011010000";
    BIAS_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    BIAS_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    BIAS_CFG2 : std_logic_vector(15 downto 0) := "0001000000000000";
    BIAS_CFG3 : std_logic_vector(15 downto 0) := "0000000000000001";
    BIAS_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    BIAS_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    BIAS_CFG6 : std_logic_vector(15 downto 0) := "0000000010000000";
    BIAS_CFG7 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_A_CH_CFG0 : std_logic_vector(15 downto 0) := "0000000000000011";
    CH0_A_CH_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_A_CH_CFG2 : std_logic_vector(15 downto 0) := "0111101111110000";
    CH0_A_CH_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_A_CH_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_A_CH_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_A_CH_CFG6 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RST_LP_CFG0 : std_logic_vector(15 downto 0) := "0001000000010000";
    CH0_RST_LP_CFG1 : std_logic_vector(15 downto 0) := "0011001000010000";
    CH0_RST_LP_CFG2 : std_logic_vector(15 downto 0) := "0110010100000100";
    CH0_RST_LP_CFG3 : std_logic_vector(15 downto 0) := "0011001000010000";
    CH0_RST_LP_CFG4 : std_logic_vector(15 downto 0) := "0000000001000100";
    CH0_RST_LP_ID_CFG0 : std_logic_vector(15 downto 0) := "0011000001110000";
    CH0_RST_LP_ID_CFG1 : std_logic_vector(15 downto 0) := "0001000000010000";
    CH0_RST_TIME_CFG0 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH0_RST_TIME_CFG1 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH0_RST_TIME_CFG2 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH0_RST_TIME_CFG3 : std_logic_vector(15 downto 0) := "0000010000100000";
    CH0_RST_TIME_CFG4 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH0_RST_TIME_CFG5 : std_logic_vector(15 downto 0) := "0000000000000001";
    CH0_RST_TIME_CFG6 : std_logic_vector(15 downto 0) := "0000000000100001";
    CH0_RX_ADC_CFG0 : std_logic_vector(15 downto 0) := "0011010010001111";
    CH0_RX_ADC_CFG1 : std_logic_vector(15 downto 0) := "0011111001010101";
    CH0_RX_ANA_CFG0 : std_logic_vector(15 downto 0) := "1000000000011101";
    CH0_RX_ANA_CFG1 : std_logic_vector(15 downto 0) := "1110100010000000";
    CH0_RX_ANA_CFG2 : std_logic_vector(15 downto 0) := "0000000010001010";
    CH0_RX_APT_CFG0A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG0B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG10A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG10B : std_logic_vector(15 downto 0) := "0000000001010000";
    CH0_RX_APT_CFG11A : std_logic_vector(15 downto 0) := "0000000001000000";
    CH0_RX_APT_CFG11B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG12A : std_logic_vector(15 downto 0) := "0000000001010000";
    CH0_RX_APT_CFG12B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG13A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG13B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG14A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG14B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG15A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG15B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH0_RX_APT_CFG16A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG16B : std_logic_vector(15 downto 0) := "0010000000000000";
    CH0_RX_APT_CFG17A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG17B : std_logic_vector(15 downto 0) := "0001000001000000";
    CH0_RX_APT_CFG18A : std_logic_vector(15 downto 0) := "0000100000100000";
    CH0_RX_APT_CFG18B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG19A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG19B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH0_RX_APT_CFG1A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG1B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG20A : std_logic_vector(15 downto 0) := "1110000000100000";
    CH0_RX_APT_CFG20B : std_logic_vector(15 downto 0) := "0000000001000000";
    CH0_RX_APT_CFG21A : std_logic_vector(15 downto 0) := "0001000000000100";
    CH0_RX_APT_CFG21B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG22A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG22B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG23A : std_logic_vector(15 downto 0) := "0000100000000000";
    CH0_RX_APT_CFG23B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG24A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG24B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG25A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG25B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG26A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG26B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG27A : std_logic_vector(15 downto 0) := "0100000000000000";
    CH0_RX_APT_CFG27B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG28A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_APT_CFG28B : std_logic_vector(15 downto 0) := "1000000000000000";
    CH0_RX_APT_CFG2A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG2B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG3A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG3B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG4A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG4B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG5A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG5B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG6A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG6B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG7A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG7B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG8A : std_logic_vector(15 downto 0) := "0000100000000000";
    CH0_RX_APT_CFG8B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH0_RX_APT_CFG9A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CFG9B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH0_RX_APT_CTRL_CFG2 : std_logic_vector(15 downto 0) := "0000000000000100";
    CH0_RX_APT_CTRL_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CAL_CFG0A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CAL_CFG0B : std_logic_vector(15 downto 0) := "0011001100110000";
    CH0_RX_CAL_CFG1A : std_logic_vector(15 downto 0) := "1110111011100001";
    CH0_RX_CAL_CFG1B : std_logic_vector(15 downto 0) := "1111111100000100";
    CH0_RX_CAL_CFG2A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CAL_CFG2B : std_logic_vector(15 downto 0) := "0011000000000000";
    CH0_RX_CDR_CFG0A : std_logic_vector(15 downto 0) := "0000000000000011";
    CH0_RX_CDR_CFG0B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CDR_CFG1A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CDR_CFG1B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CDR_CFG2A : std_logic_vector(15 downto 0) := "1001000101100100";
    CH0_RX_CDR_CFG2B : std_logic_vector(15 downto 0) := "0000000100100100";
    CH0_RX_CDR_CFG3A : std_logic_vector(15 downto 0) := "0101110011110110";
    CH0_RX_CDR_CFG3B : std_logic_vector(15 downto 0) := "0000000000001011";
    CH0_RX_CDR_CFG4A : std_logic_vector(15 downto 0) := "0000000000000110";
    CH0_RX_CDR_CFG4B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_CLKGN_CFG0 : std_logic_vector(15 downto 0) := "1100000000000000";
    CH0_RX_CLKGN_CFG1 : std_logic_vector(15 downto 0) := "0000000110000000";
    CH0_RX_CTLE_CFG0 : std_logic_vector(15 downto 0) := "0011010010001000";
    CH0_RX_CTLE_CFG1 : std_logic_vector(15 downto 0) := "0010000000100010";
    CH0_RX_CTLE_CFG2 : std_logic_vector(15 downto 0) := "0000101000000000";
    CH0_RX_CTLE_CFG3 : std_logic_vector(15 downto 0) := "1111001001000000";
    CH0_RX_DSP_CFG : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_MON_CFG : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_RX_PAD_CFG0 : std_logic_vector(15 downto 0) := "0001111000000000";
    CH0_RX_PAD_CFG1 : std_logic_vector(15 downto 0) := "0001100000001010";
    CH0_RX_PCS_CFG0 : std_logic_vector(15 downto 0) := "0000000100000000";
    CH0_RX_PCS_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_ANA_CFG0 : std_logic_vector(15 downto 0) := "0000001010101111";
    CH0_TX_ANA_CFG1 : std_logic_vector(15 downto 0) := "0000000100000000";
    CH0_TX_ANA_CFG2 : std_logic_vector(15 downto 0) := "1000000000010100";
    CH0_TX_ANA_CFG3 : std_logic_vector(15 downto 0) := "0000101000100010";
    CH0_TX_ANA_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_CAL_CFG0 : std_logic_vector(15 downto 0) := "0000000000100000";
    CH0_TX_CAL_CFG1 : std_logic_vector(15 downto 0) := "0000000001000000";
    CH0_TX_DRV_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_DRV_CFG1 : std_logic_vector(15 downto 0) := "0000000000100111";
    CH0_TX_DRV_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_DRV_CFG3 : std_logic_vector(15 downto 0) := "0110110000000000";
    CH0_TX_DRV_CFG4 : std_logic_vector(15 downto 0) := "0000000011000101";
    CH0_TX_DRV_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_LPBK_CFG0 : std_logic_vector(15 downto 0) := "0000000000000011";
    CH0_TX_LPBK_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG0 : std_logic_vector(15 downto 0) := "0000000101100000";
    CH0_TX_PCS_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG10 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG11 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG12 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG13 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG14 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG15 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG16 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG17 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG6 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG7 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG8 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH0_TX_PCS_CFG9 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_A_CH_CFG0 : std_logic_vector(15 downto 0) := "0000000000000011";
    CH1_A_CH_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_A_CH_CFG2 : std_logic_vector(15 downto 0) := "0111101111110000";
    CH1_A_CH_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_A_CH_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_A_CH_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_A_CH_CFG6 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RST_LP_CFG0 : std_logic_vector(15 downto 0) := "0001000000010000";
    CH1_RST_LP_CFG1 : std_logic_vector(15 downto 0) := "0011001000010000";
    CH1_RST_LP_CFG2 : std_logic_vector(15 downto 0) := "0110010100000100";
    CH1_RST_LP_CFG3 : std_logic_vector(15 downto 0) := "0011001000010000";
    CH1_RST_LP_CFG4 : std_logic_vector(15 downto 0) := "0000000001000100";
    CH1_RST_LP_ID_CFG0 : std_logic_vector(15 downto 0) := "0011000001110000";
    CH1_RST_LP_ID_CFG1 : std_logic_vector(15 downto 0) := "0001000000010000";
    CH1_RST_TIME_CFG0 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH1_RST_TIME_CFG1 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH1_RST_TIME_CFG2 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH1_RST_TIME_CFG3 : std_logic_vector(15 downto 0) := "0000010000100000";
    CH1_RST_TIME_CFG4 : std_logic_vector(15 downto 0) := "0000010000100001";
    CH1_RST_TIME_CFG5 : std_logic_vector(15 downto 0) := "0000000000000001";
    CH1_RST_TIME_CFG6 : std_logic_vector(15 downto 0) := "0000000000100001";
    CH1_RX_ADC_CFG0 : std_logic_vector(15 downto 0) := "0011010010001111";
    CH1_RX_ADC_CFG1 : std_logic_vector(15 downto 0) := "0011111001010101";
    CH1_RX_ANA_CFG0 : std_logic_vector(15 downto 0) := "1000000000011101";
    CH1_RX_ANA_CFG1 : std_logic_vector(15 downto 0) := "1110100010000000";
    CH1_RX_ANA_CFG2 : std_logic_vector(15 downto 0) := "0000000010001010";
    CH1_RX_APT_CFG0A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG0B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG10A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG10B : std_logic_vector(15 downto 0) := "0000000001010000";
    CH1_RX_APT_CFG11A : std_logic_vector(15 downto 0) := "0000000001000000";
    CH1_RX_APT_CFG11B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG12A : std_logic_vector(15 downto 0) := "0000000001010000";
    CH1_RX_APT_CFG12B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG13A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG13B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG14A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG14B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG15A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG15B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH1_RX_APT_CFG16A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG16B : std_logic_vector(15 downto 0) := "0010000000000000";
    CH1_RX_APT_CFG17A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG17B : std_logic_vector(15 downto 0) := "0001000001000000";
    CH1_RX_APT_CFG18A : std_logic_vector(15 downto 0) := "0000100000100000";
    CH1_RX_APT_CFG18B : std_logic_vector(15 downto 0) := "0000100010000000";
    CH1_RX_APT_CFG19A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG19B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH1_RX_APT_CFG1A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG1B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG20A : std_logic_vector(15 downto 0) := "1110000000100000";
    CH1_RX_APT_CFG20B : std_logic_vector(15 downto 0) := "0000000001000000";
    CH1_RX_APT_CFG21A : std_logic_vector(15 downto 0) := "0001000000000100";
    CH1_RX_APT_CFG21B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG22A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG22B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG23A : std_logic_vector(15 downto 0) := "0000100000000000";
    CH1_RX_APT_CFG23B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH1_RX_APT_CFG24A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG24B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG25A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG25B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG26A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG26B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG27A : std_logic_vector(15 downto 0) := "0100000000000000";
    CH1_RX_APT_CFG27B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG28A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_APT_CFG28B : std_logic_vector(15 downto 0) := "1000000000000000";
    CH1_RX_APT_CFG2A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG2B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG3A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG3B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG4A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG4B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG5A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG5B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG6A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG6B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG7A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG7B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG8A : std_logic_vector(15 downto 0) := "0000100000000000";
    CH1_RX_APT_CFG8B : std_logic_vector(15 downto 0) := "0000100000000000";
    CH1_RX_APT_CFG9A : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CFG9B : std_logic_vector(15 downto 0) := "0000000001110000";
    CH1_RX_APT_CTRL_CFG2 : std_logic_vector(15 downto 0) := "0000000000000100";
    CH1_RX_APT_CTRL_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CAL_CFG0A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CAL_CFG0B : std_logic_vector(15 downto 0) := "0011001100110000";
    CH1_RX_CAL_CFG1A : std_logic_vector(15 downto 0) := "1110111011100001";
    CH1_RX_CAL_CFG1B : std_logic_vector(15 downto 0) := "1111111100000100";
    CH1_RX_CAL_CFG2A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CAL_CFG2B : std_logic_vector(15 downto 0) := "0011000000000000";
    CH1_RX_CDR_CFG0A : std_logic_vector(15 downto 0) := "0000000000000011";
    CH1_RX_CDR_CFG0B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CDR_CFG1A : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CDR_CFG1B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CDR_CFG2A : std_logic_vector(15 downto 0) := "1001000101100100";
    CH1_RX_CDR_CFG2B : std_logic_vector(15 downto 0) := "0000000100100100";
    CH1_RX_CDR_CFG3A : std_logic_vector(15 downto 0) := "0101110011110110";
    CH1_RX_CDR_CFG3B : std_logic_vector(15 downto 0) := "0000000000001011";
    CH1_RX_CDR_CFG4A : std_logic_vector(15 downto 0) := "0000000000000110";
    CH1_RX_CDR_CFG4B : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_CLKGN_CFG0 : std_logic_vector(15 downto 0) := "1100000000000000";
    CH1_RX_CLKGN_CFG1 : std_logic_vector(15 downto 0) := "0000000110000000";
    CH1_RX_CTLE_CFG0 : std_logic_vector(15 downto 0) := "0011010010001000";
    CH1_RX_CTLE_CFG1 : std_logic_vector(15 downto 0) := "0010000000100010";
    CH1_RX_CTLE_CFG2 : std_logic_vector(15 downto 0) := "0000101000000000";
    CH1_RX_CTLE_CFG3 : std_logic_vector(15 downto 0) := "1111001001000000";
    CH1_RX_DSP_CFG : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_MON_CFG : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_RX_PAD_CFG0 : std_logic_vector(15 downto 0) := "0001111000000000";
    CH1_RX_PAD_CFG1 : std_logic_vector(15 downto 0) := "0001100000001010";
    CH1_RX_PCS_CFG0 : std_logic_vector(15 downto 0) := "0000000100000000";
    CH1_RX_PCS_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_ANA_CFG0 : std_logic_vector(15 downto 0) := "0000001010101111";
    CH1_TX_ANA_CFG1 : std_logic_vector(15 downto 0) := "0000000100000000";
    CH1_TX_ANA_CFG2 : std_logic_vector(15 downto 0) := "1000000000010100";
    CH1_TX_ANA_CFG3 : std_logic_vector(15 downto 0) := "0000101000100010";
    CH1_TX_ANA_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_CAL_CFG0 : std_logic_vector(15 downto 0) := "0000000000100000";
    CH1_TX_CAL_CFG1 : std_logic_vector(15 downto 0) := "0000000001000000";
    CH1_TX_DRV_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_DRV_CFG1 : std_logic_vector(15 downto 0) := "0000000000100111";
    CH1_TX_DRV_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_DRV_CFG3 : std_logic_vector(15 downto 0) := "0110110000000000";
    CH1_TX_DRV_CFG4 : std_logic_vector(15 downto 0) := "0000000011000101";
    CH1_TX_DRV_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_LPBK_CFG0 : std_logic_vector(15 downto 0) := "0000000000000011";
    CH1_TX_LPBK_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG0 : std_logic_vector(15 downto 0) := "0000000101100000";
    CH1_TX_PCS_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG10 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG11 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG12 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG13 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG14 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG15 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG16 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG17 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG6 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG7 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG8 : std_logic_vector(15 downto 0) := "0000000000000000";
    CH1_TX_PCS_CFG9 : std_logic_vector(15 downto 0) := "0000000000000000";
    DATARATE : real := 10.000;
    DRPEN_CFG : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG10 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG11 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG12 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG13 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG14 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG15 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG16 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG17 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG18 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG19 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG20 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG21 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG22 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG23 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG24 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG25 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG26 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG27 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG3 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG4 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG5 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG6 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG7 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG8 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_CFG9 : std_logic_vector(15 downto 0) := "0000000000000000";
    FEC_MODE : string := "BYPASS";
    INS_LOSS_NYQ : real := 20.000;
    INTERFACE_WIDTH : integer := 64;
    MODULATION_MODE : string := "NRZ";
    PLL_CFG0 : std_logic_vector(15 downto 0) := "0001100111110000";
    PLL_CFG1 : std_logic_vector(15 downto 0) := "0000111101110000";
    PLL_CFG2 : std_logic_vector(15 downto 0) := "1000000111101000";
    PLL_CFG3 : std_logic_vector(15 downto 0) := "0100000000000000";
    PLL_CFG4 : std_logic_vector(15 downto 0) := "0111111111101010";
    PLL_CFG5 : std_logic_vector(15 downto 0) := "0100101100111000";
    PLL_CFG6 : std_logic_vector(15 downto 0) := "0000000000100101";
    PLL_CRS_CTRL_CFG0 : std_logic_vector(15 downto 0) := "0000101100100000";
    PLL_CRS_CTRL_CFG1 : std_logic_vector(15 downto 0) := "1100010111010100";
    PLL_IPS_PIN_EN : bit := '1';
    PLL_IPS_REFCLK_SEL : integer := 0;
    RCALSAP_TESTEN : bit := '0';
    RCAL_APROBE : bit := '0';
    RST_CFG : std_logic_vector(15 downto 0) := "0000000000000010";
    RST_PLL_CFG0 : std_logic_vector(15 downto 0) := "0111011000010100";
    SAP_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM_CFG0 : std_logic_vector(15 downto 0) := "0001100001000000";
    SDM_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM_SEED_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM_SEED_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    SIM_DEVICE : string := "ULTRASCALE_PLUS_ES1";
    TX_AMPLITUDE_SWING : integer := 250
  );
  
  port (
    CH0_AXISTDATA        : out std_logic_vector(27 downto 0);
    CH0_AXISTLAST        : out std_ulogic;
    CH0_AXISTVALID       : out std_ulogic;
    CH0_DMONITOROUT      : out std_logic_vector(31 downto 0);
    CH0_DMONITOROUTCLK   : out std_ulogic;
    CH0_GTMTXN           : out std_ulogic;
    CH0_GTMTXP           : out std_ulogic;
    CH0_PCSRSVDOUT       : out std_logic_vector(15 downto 0);
    CH0_PMARSVDOUT       : out std_logic_vector(15 downto 0);
    CH0_RESETEXCEPTION   : out std_ulogic;
    CH0_RXBUFSTATUS      : out std_logic_vector(2 downto 0);
    CH0_RXDATA           : out std_logic_vector(255 downto 0);
    CH0_RXDATAFLAGS      : out std_logic_vector(3 downto 0);
    CH0_RXDATAISAM       : out std_ulogic;
    CH0_RXDATASTART      : out std_ulogic;
    CH0_RXOUTCLK         : out std_ulogic;
    CH0_RXPMARESETDONE   : out std_ulogic;
    CH0_RXPRBSERR        : out std_ulogic;
    CH0_RXPRBSLOCKED     : out std_ulogic;
    CH0_RXPRGDIVRESETDONE : out std_ulogic;
    CH0_RXPROGDIVCLK     : out std_ulogic;
    CH0_RXRESETDONE      : out std_ulogic;
    CH0_TXBUFSTATUS      : out std_logic_vector(1 downto 0);
    CH0_TXOUTCLK         : out std_ulogic;
    CH0_TXPMARESETDONE   : out std_ulogic;
    CH0_TXPRGDIVRESETDONE : out std_ulogic;
    CH0_TXPROGDIVCLK     : out std_ulogic;
    CH0_TXRESETDONE      : out std_ulogic;
    CH1_AXISTDATA        : out std_logic_vector(27 downto 0);
    CH1_AXISTLAST        : out std_ulogic;
    CH1_AXISTVALID       : out std_ulogic;
    CH1_DMONITOROUT      : out std_logic_vector(31 downto 0);
    CH1_DMONITOROUTCLK   : out std_ulogic;
    CH1_GTMTXN           : out std_ulogic;
    CH1_GTMTXP           : out std_ulogic;
    CH1_PCSRSVDOUT       : out std_logic_vector(15 downto 0);
    CH1_PMARSVDOUT       : out std_logic_vector(15 downto 0);
    CH1_RESETEXCEPTION   : out std_ulogic;
    CH1_RXBUFSTATUS      : out std_logic_vector(2 downto 0);
    CH1_RXDATA           : out std_logic_vector(255 downto 0);
    CH1_RXDATAFLAGS      : out std_logic_vector(3 downto 0);
    CH1_RXDATAISAM       : out std_ulogic;
    CH1_RXDATASTART      : out std_ulogic;
    CH1_RXOUTCLK         : out std_ulogic;
    CH1_RXPMARESETDONE   : out std_ulogic;
    CH1_RXPRBSERR        : out std_ulogic;
    CH1_RXPRBSLOCKED     : out std_ulogic;
    CH1_RXPRGDIVRESETDONE : out std_ulogic;
    CH1_RXPROGDIVCLK     : out std_ulogic;
    CH1_RXRESETDONE      : out std_ulogic;
    CH1_TXBUFSTATUS      : out std_logic_vector(1 downto 0);
    CH1_TXOUTCLK         : out std_ulogic;
    CH1_TXPMARESETDONE   : out std_ulogic;
    CH1_TXPRGDIVRESETDONE : out std_ulogic;
    CH1_TXPROGDIVCLK     : out std_ulogic;
    CH1_TXRESETDONE      : out std_ulogic;
    CLKTESTSIG2PAD       : out std_ulogic;
    DMONITOROUTPLLCLK    : out std_ulogic;
    DRPDO                : out std_logic_vector(15 downto 0);
    DRPRDY               : out std_ulogic;
    FECRX0ALIGNED        : out std_ulogic;
    FECRX0CORRCWINC      : out std_ulogic;
    FECRX0CWINC          : out std_ulogic;
    FECRX0UNCORRCWINC    : out std_ulogic;
    FECRX1ALIGNED        : out std_ulogic;
    FECRX1CORRCWINC      : out std_ulogic;
    FECRX1CWINC          : out std_ulogic;
    FECRX1UNCORRCWINC    : out std_ulogic;
    FECRXLN0BITERR0TO1INC : out std_logic_vector(7 downto 0);
    FECRXLN0BITERR1TO0INC : out std_logic_vector(7 downto 0);
    FECRXLN0DLY          : out std_logic_vector(14 downto 0);
    FECRXLN0ERRCNTINC    : out std_logic_vector(3 downto 0);
    FECRXLN0MAPPING      : out std_logic_vector(1 downto 0);
    FECRXLN1BITERR0TO1INC : out std_logic_vector(7 downto 0);
    FECRXLN1BITERR1TO0INC : out std_logic_vector(7 downto 0);
    FECRXLN1DLY          : out std_logic_vector(14 downto 0);
    FECRXLN1ERRCNTINC    : out std_logic_vector(3 downto 0);
    FECRXLN1MAPPING      : out std_logic_vector(1 downto 0);
    FECRXLN2BITERR0TO1INC : out std_logic_vector(7 downto 0);
    FECRXLN2BITERR1TO0INC : out std_logic_vector(7 downto 0);
    FECRXLN2DLY          : out std_logic_vector(14 downto 0);
    FECRXLN2ERRCNTINC    : out std_logic_vector(3 downto 0);
    FECRXLN2MAPPING      : out std_logic_vector(1 downto 0);
    FECRXLN3BITERR0TO1INC : out std_logic_vector(7 downto 0);
    FECRXLN3BITERR1TO0INC : out std_logic_vector(7 downto 0);
    FECRXLN3DLY          : out std_logic_vector(14 downto 0);
    FECRXLN3ERRCNTINC    : out std_logic_vector(3 downto 0);
    FECRXLN3MAPPING      : out std_logic_vector(1 downto 0);
    FECTRXLN0LOCK        : out std_ulogic;
    FECTRXLN1LOCK        : out std_ulogic;
    FECTRXLN2LOCK        : out std_ulogic;
    FECTRXLN3LOCK        : out std_ulogic;
    GTPOWERGOOD          : out std_ulogic;
    PLLFBCLKLOST         : out std_ulogic;
    PLLLOCK              : out std_ulogic;
    PLLREFCLKLOST        : out std_ulogic;
    PLLREFCLKMONITOR     : out std_ulogic;
    PLLRESETDONE         : out std_ulogic;
    PLLRSVDOUT           : out std_logic_vector(15 downto 0);
    RCALCMP              : out std_ulogic;
    RCALOUT              : out std_logic_vector(4 downto 0);
    RXRECCLK0            : out std_ulogic;
    RXRECCLK1            : out std_ulogic;
    BGBYPASSB            : in std_ulogic;
    BGMONITORENB         : in std_ulogic;
    BGPDB                : in std_ulogic;
    BGRCALOVRD           : in std_logic_vector(4 downto 0);
    BGRCALOVRDENB        : in std_ulogic;
    CH0_AXISEN           : in std_ulogic;
    CH0_AXISRST          : in std_ulogic;
    CH0_AXISTRDY         : in std_ulogic;
    CH0_CFGRESET         : in std_ulogic;
    CH0_DMONFIFORESET    : in std_ulogic;
    CH0_DMONITORCLK      : in std_ulogic;
    CH0_GTMRXN           : in std_ulogic;
    CH0_GTMRXP           : in std_ulogic;
    CH0_GTRXRESET        : in std_ulogic;
    CH0_GTTXRESET        : in std_ulogic;
    CH0_LOOPBACK         : in std_logic_vector(2 downto 0);
    CH0_PCSRSVDIN        : in std_logic_vector(15 downto 0);
    CH0_PMARSVDIN        : in std_logic_vector(15 downto 0);
    CH0_RESETOVRD        : in std_ulogic;
    CH0_RXADAPTRESET     : in std_ulogic;
    CH0_RXADCCALRESET    : in std_ulogic;
    CH0_RXADCCLKGENRESET : in std_ulogic;
    CH0_RXBUFRESET       : in std_ulogic;
    CH0_RXCDRFREQOS      : in std_ulogic;
    CH0_RXCDRFRRESET     : in std_ulogic;
    CH0_RXCDRHOLD        : in std_ulogic;
    CH0_RXCDRINCPCTRL    : in std_ulogic;
    CH0_RXCDROVRDEN      : in std_ulogic;
    CH0_RXCDRPHRESET     : in std_ulogic;
    CH0_RXDFERESET       : in std_ulogic;
    CH0_RXDSPRESET       : in std_ulogic;
    CH0_RXEQTRAINING     : in std_ulogic;
    CH0_RXEYESCANRESET   : in std_ulogic;
    CH0_RXFECRESET       : in std_ulogic;
    CH0_RXOUTCLKSEL      : in std_logic_vector(2 downto 0);
    CH0_RXPCSRESET       : in std_ulogic;
    CH0_RXPCSRESETMASK   : in std_logic_vector(3 downto 0);
    CH0_RXPMARESET       : in std_ulogic;
    CH0_RXPMARESETMASK   : in std_logic_vector(7 downto 0);
    CH0_RXPOLARITY       : in std_ulogic;
    CH0_RXPRBSCNTSTOP    : in std_ulogic;
    CH0_RXPRBSCSCNTRST   : in std_ulogic;
    CH0_RXPRBSPTN        : in std_logic_vector(3 downto 0);
    CH0_RXPROGDIVRESET   : in std_ulogic;
    CH0_RXQPRBSEN        : in std_ulogic;
    CH0_RXRESETMODE      : in std_logic_vector(1 downto 0);
    CH0_RXSPCSEQADV      : in std_ulogic;
    CH0_RXUSRCLK         : in std_ulogic;
    CH0_RXUSRCLK2        : in std_ulogic;
    CH0_RXUSRRDY         : in std_ulogic;
    CH0_RXUSRSTART       : in std_ulogic;
    CH0_RXUSRSTOP        : in std_ulogic;
    CH0_TXCKALRESET      : in std_ulogic;
    CH0_TXCTLFIRDAT      : in std_logic_vector(5 downto 0);
    CH0_TXDATA           : in std_logic_vector(255 downto 0);
    CH0_TXDATASTART      : in std_ulogic;
    CH0_TXDRVAMP         : in std_logic_vector(4 downto 0);
    CH0_TXEMPMAIN        : in std_logic_vector(5 downto 0);
    CH0_TXEMPPOST        : in std_logic_vector(4 downto 0);
    CH0_TXEMPPRE         : in std_logic_vector(4 downto 0);
    CH0_TXEMPPRE2        : in std_logic_vector(3 downto 0);
    CH0_TXFECRESET       : in std_ulogic;
    CH0_TXINHIBIT        : in std_ulogic;
    CH0_TXMUXDCDEXHOLD   : in std_ulogic;
    CH0_TXMUXDCDORWREN   : in std_ulogic;
    CH0_TXOUTCLKSEL      : in std_logic_vector(2 downto 0);
    CH0_TXPCSRESET       : in std_ulogic;
    CH0_TXPCSRESETMASK   : in std_logic_vector(1 downto 0);
    CH0_TXPMARESET       : in std_ulogic;
    CH0_TXPMARESETMASK   : in std_logic_vector(1 downto 0);
    CH0_TXPOLARITY       : in std_ulogic;
    CH0_TXPRBSINERR      : in std_ulogic;
    CH0_TXPRBSPTN        : in std_logic_vector(3 downto 0);
    CH0_TXPROGDIVRESET   : in std_ulogic;
    CH0_TXQPRBSEN        : in std_ulogic;
    CH0_TXRESETMODE      : in std_logic_vector(1 downto 0);
    CH0_TXSPCSEQADV      : in std_ulogic;
    CH0_TXUSRCLK         : in std_ulogic;
    CH0_TXUSRCLK2        : in std_ulogic;
    CH0_TXUSRRDY         : in std_ulogic;
    CH1_AXISEN           : in std_ulogic;
    CH1_AXISRST          : in std_ulogic;
    CH1_AXISTRDY         : in std_ulogic;
    CH1_CFGRESET         : in std_ulogic;
    CH1_DMONFIFORESET    : in std_ulogic;
    CH1_DMONITORCLK      : in std_ulogic;
    CH1_GTMRXN           : in std_ulogic;
    CH1_GTMRXP           : in std_ulogic;
    CH1_GTRXRESET        : in std_ulogic;
    CH1_GTTXRESET        : in std_ulogic;
    CH1_LOOPBACK         : in std_logic_vector(2 downto 0);
    CH1_PCSRSVDIN        : in std_logic_vector(15 downto 0);
    CH1_PMARSVDIN        : in std_logic_vector(15 downto 0);
    CH1_RESETOVRD        : in std_ulogic;
    CH1_RXADAPTRESET     : in std_ulogic;
    CH1_RXADCCALRESET    : in std_ulogic;
    CH1_RXADCCLKGENRESET : in std_ulogic;
    CH1_RXBUFRESET       : in std_ulogic;
    CH1_RXCDRFREQOS      : in std_ulogic;
    CH1_RXCDRFRRESET     : in std_ulogic;
    CH1_RXCDRHOLD        : in std_ulogic;
    CH1_RXCDRINCPCTRL    : in std_ulogic;
    CH1_RXCDROVRDEN      : in std_ulogic;
    CH1_RXCDRPHRESET     : in std_ulogic;
    CH1_RXDFERESET       : in std_ulogic;
    CH1_RXDSPRESET       : in std_ulogic;
    CH1_RXEQTRAINING     : in std_ulogic;
    CH1_RXEYESCANRESET   : in std_ulogic;
    CH1_RXFECRESET       : in std_ulogic;
    CH1_RXOUTCLKSEL      : in std_logic_vector(2 downto 0);
    CH1_RXPCSRESET       : in std_ulogic;
    CH1_RXPCSRESETMASK   : in std_logic_vector(3 downto 0);
    CH1_RXPMARESET       : in std_ulogic;
    CH1_RXPMARESETMASK   : in std_logic_vector(7 downto 0);
    CH1_RXPOLARITY       : in std_ulogic;
    CH1_RXPRBSCNTSTOP    : in std_ulogic;
    CH1_RXPRBSCSCNTRST   : in std_ulogic;
    CH1_RXPRBSPTN        : in std_logic_vector(3 downto 0);
    CH1_RXPROGDIVRESET   : in std_ulogic;
    CH1_RXQPRBSEN        : in std_ulogic;
    CH1_RXRESETMODE      : in std_logic_vector(1 downto 0);
    CH1_RXSPCSEQADV      : in std_ulogic;
    CH1_RXUSRCLK         : in std_ulogic;
    CH1_RXUSRCLK2        : in std_ulogic;
    CH1_RXUSRRDY         : in std_ulogic;
    CH1_RXUSRSTART       : in std_ulogic;
    CH1_RXUSRSTOP        : in std_ulogic;
    CH1_TXCKALRESET      : in std_ulogic;
    CH1_TXCTLFIRDAT      : in std_logic_vector(5 downto 0);
    CH1_TXDATA           : in std_logic_vector(255 downto 0);
    CH1_TXDATASTART      : in std_ulogic;
    CH1_TXDRVAMP         : in std_logic_vector(4 downto 0);
    CH1_TXEMPMAIN        : in std_logic_vector(5 downto 0);
    CH1_TXEMPPOST        : in std_logic_vector(4 downto 0);
    CH1_TXEMPPRE         : in std_logic_vector(4 downto 0);
    CH1_TXEMPPRE2        : in std_logic_vector(3 downto 0);
    CH1_TXFECRESET       : in std_ulogic;
    CH1_TXINHIBIT        : in std_ulogic;
    CH1_TXMUXDCDEXHOLD   : in std_ulogic;
    CH1_TXMUXDCDORWREN   : in std_ulogic;
    CH1_TXOUTCLKSEL      : in std_logic_vector(2 downto 0);
    CH1_TXPCSRESET       : in std_ulogic;
    CH1_TXPCSRESETMASK   : in std_logic_vector(1 downto 0);
    CH1_TXPMARESET       : in std_ulogic;
    CH1_TXPMARESETMASK   : in std_logic_vector(1 downto 0);
    CH1_TXPOLARITY       : in std_ulogic;
    CH1_TXPRBSINERR      : in std_ulogic;
    CH1_TXPRBSPTN        : in std_logic_vector(3 downto 0);
    CH1_TXPROGDIVRESET   : in std_ulogic;
    CH1_TXQPRBSEN        : in std_ulogic;
    CH1_TXRESETMODE      : in std_logic_vector(1 downto 0);
    CH1_TXSPCSEQADV      : in std_ulogic;
    CH1_TXUSRCLK         : in std_ulogic;
    CH1_TXUSRCLK2        : in std_ulogic;
    CH1_TXUSRRDY         : in std_ulogic;
    DRPADDR              : in std_logic_vector(10 downto 0);
    DRPCLK               : in std_ulogic;
    DRPDI                : in std_logic_vector(15 downto 0);
    DRPEN                : in std_ulogic;
    DRPRST               : in std_ulogic;
    DRPWE                : in std_ulogic;
    FECCTRLRX0BITSLIPFS  : in std_ulogic;
    FECCTRLRX1BITSLIPFS  : in std_ulogic;
    GTGREFCLK2PLL        : in std_ulogic;
    GTNORTHREFCLK        : in std_ulogic;
    GTREFCLK             : in std_ulogic;
    GTSOUTHREFCLK        : in std_ulogic;
    PLLFBDIV             : in std_logic_vector(7 downto 0);
    PLLMONCLK            : in std_ulogic;
    PLLPD                : in std_ulogic;
    PLLREFCLKSEL         : in std_logic_vector(2 downto 0);
    PLLRESET             : in std_ulogic;
    PLLRESETBYPASSMODE   : in std_ulogic;
    PLLRESETMASK         : in std_logic_vector(1 downto 0);
    PLLRSVDIN            : in std_logic_vector(15 downto 0);
    RCALENB              : in std_ulogic;
    SDMDATA              : in std_logic_vector(25 downto 0);
    SDMTOGGLE            : in std_ulogic
  );
end GTM_DUAL;

architecture GTM_DUAL_V of GTM_DUAL is
  component SIP_GTM_DUAL
    port (
      A_CFG                : in std_logic_vector(15 downto 0);
      A_SDM_DATA_CFG0      : in std_logic_vector(15 downto 0);
      A_SDM_DATA_CFG1      : in std_logic_vector(15 downto 0);
      BIAS_CFG0            : in std_logic_vector(15 downto 0);
      BIAS_CFG1            : in std_logic_vector(15 downto 0);
      BIAS_CFG2            : in std_logic_vector(15 downto 0);
      BIAS_CFG3            : in std_logic_vector(15 downto 0);
      BIAS_CFG4            : in std_logic_vector(15 downto 0);
      BIAS_CFG5            : in std_logic_vector(15 downto 0);
      BIAS_CFG6            : in std_logic_vector(15 downto 0);
      BIAS_CFG7            : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG0        : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG1        : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG2        : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG3        : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG4        : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG5        : in std_logic_vector(15 downto 0);
      CH0_A_CH_CFG6        : in std_logic_vector(15 downto 0);
      CH0_RST_LP_CFG0      : in std_logic_vector(15 downto 0);
      CH0_RST_LP_CFG1      : in std_logic_vector(15 downto 0);
      CH0_RST_LP_CFG2      : in std_logic_vector(15 downto 0);
      CH0_RST_LP_CFG3      : in std_logic_vector(15 downto 0);
      CH0_RST_LP_CFG4      : in std_logic_vector(15 downto 0);
      CH0_RST_LP_ID_CFG0   : in std_logic_vector(15 downto 0);
      CH0_RST_LP_ID_CFG1   : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG0    : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG1    : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG2    : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG3    : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG4    : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG5    : in std_logic_vector(15 downto 0);
      CH0_RST_TIME_CFG6    : in std_logic_vector(15 downto 0);
      CH0_RX_ADC_CFG0      : in std_logic_vector(15 downto 0);
      CH0_RX_ADC_CFG1      : in std_logic_vector(15 downto 0);
      CH0_RX_ANA_CFG0      : in std_logic_vector(15 downto 0);
      CH0_RX_ANA_CFG1      : in std_logic_vector(15 downto 0);
      CH0_RX_ANA_CFG2      : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG0A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG0B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG10A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG10B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG11A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG11B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG12A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG12B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG13A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG13B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG14A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG14B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG15A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG15B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG16A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG16B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG17A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG17B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG18A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG18B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG19A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG19B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG1A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG1B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG20A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG20B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG21A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG21B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG22A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG22B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG23A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG23B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG24A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG24B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG25A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG25B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG26A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG26B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG27A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG27B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG28A    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG28B    : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG2A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG2B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG3A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG3B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG4A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG4B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG5A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG5B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG6A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG6B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG7A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG7B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG8A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG8B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG9A     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CFG9B     : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CTRL_CFG2 : in std_logic_vector(15 downto 0);
      CH0_RX_APT_CTRL_CFG3 : in std_logic_vector(15 downto 0);
      CH0_RX_CAL_CFG0A     : in std_logic_vector(15 downto 0);
      CH0_RX_CAL_CFG0B     : in std_logic_vector(15 downto 0);
      CH0_RX_CAL_CFG1A     : in std_logic_vector(15 downto 0);
      CH0_RX_CAL_CFG1B     : in std_logic_vector(15 downto 0);
      CH0_RX_CAL_CFG2A     : in std_logic_vector(15 downto 0);
      CH0_RX_CAL_CFG2B     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG0A     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG0B     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG1A     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG1B     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG2A     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG2B     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG3A     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG3B     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG4A     : in std_logic_vector(15 downto 0);
      CH0_RX_CDR_CFG4B     : in std_logic_vector(15 downto 0);
      CH0_RX_CLKGN_CFG0    : in std_logic_vector(15 downto 0);
      CH0_RX_CLKGN_CFG1    : in std_logic_vector(15 downto 0);
      CH0_RX_CTLE_CFG0     : in std_logic_vector(15 downto 0);
      CH0_RX_CTLE_CFG1     : in std_logic_vector(15 downto 0);
      CH0_RX_CTLE_CFG2     : in std_logic_vector(15 downto 0);
      CH0_RX_CTLE_CFG3     : in std_logic_vector(15 downto 0);
      CH0_RX_DSP_CFG       : in std_logic_vector(15 downto 0);
      CH0_RX_MON_CFG       : in std_logic_vector(15 downto 0);
      CH0_RX_PAD_CFG0      : in std_logic_vector(15 downto 0);
      CH0_RX_PAD_CFG1      : in std_logic_vector(15 downto 0);
      CH0_RX_PCS_CFG0      : in std_logic_vector(15 downto 0);
      CH0_RX_PCS_CFG1      : in std_logic_vector(15 downto 0);
      CH0_TX_ANA_CFG0      : in std_logic_vector(15 downto 0);
      CH0_TX_ANA_CFG1      : in std_logic_vector(15 downto 0);
      CH0_TX_ANA_CFG2      : in std_logic_vector(15 downto 0);
      CH0_TX_ANA_CFG3      : in std_logic_vector(15 downto 0);
      CH0_TX_ANA_CFG4      : in std_logic_vector(15 downto 0);
      CH0_TX_CAL_CFG0      : in std_logic_vector(15 downto 0);
      CH0_TX_CAL_CFG1      : in std_logic_vector(15 downto 0);
      CH0_TX_DRV_CFG0      : in std_logic_vector(15 downto 0);
      CH0_TX_DRV_CFG1      : in std_logic_vector(15 downto 0);
      CH0_TX_DRV_CFG2      : in std_logic_vector(15 downto 0);
      CH0_TX_DRV_CFG3      : in std_logic_vector(15 downto 0);
      CH0_TX_DRV_CFG4      : in std_logic_vector(15 downto 0);
      CH0_TX_DRV_CFG5      : in std_logic_vector(15 downto 0);
      CH0_TX_LPBK_CFG0     : in std_logic_vector(15 downto 0);
      CH0_TX_LPBK_CFG1     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG0      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG1      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG10     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG11     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG12     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG13     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG14     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG15     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG16     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG17     : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG2      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG3      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG4      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG5      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG6      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG7      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG8      : in std_logic_vector(15 downto 0);
      CH0_TX_PCS_CFG9      : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG0        : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG1        : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG2        : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG3        : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG4        : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG5        : in std_logic_vector(15 downto 0);
      CH1_A_CH_CFG6        : in std_logic_vector(15 downto 0);
      CH1_RST_LP_CFG0      : in std_logic_vector(15 downto 0);
      CH1_RST_LP_CFG1      : in std_logic_vector(15 downto 0);
      CH1_RST_LP_CFG2      : in std_logic_vector(15 downto 0);
      CH1_RST_LP_CFG3      : in std_logic_vector(15 downto 0);
      CH1_RST_LP_CFG4      : in std_logic_vector(15 downto 0);
      CH1_RST_LP_ID_CFG0   : in std_logic_vector(15 downto 0);
      CH1_RST_LP_ID_CFG1   : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG0    : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG1    : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG2    : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG3    : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG4    : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG5    : in std_logic_vector(15 downto 0);
      CH1_RST_TIME_CFG6    : in std_logic_vector(15 downto 0);
      CH1_RX_ADC_CFG0      : in std_logic_vector(15 downto 0);
      CH1_RX_ADC_CFG1      : in std_logic_vector(15 downto 0);
      CH1_RX_ANA_CFG0      : in std_logic_vector(15 downto 0);
      CH1_RX_ANA_CFG1      : in std_logic_vector(15 downto 0);
      CH1_RX_ANA_CFG2      : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG0A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG0B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG10A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG10B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG11A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG11B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG12A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG12B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG13A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG13B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG14A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG14B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG15A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG15B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG16A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG16B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG17A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG17B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG18A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG18B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG19A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG19B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG1A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG1B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG20A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG20B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG21A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG21B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG22A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG22B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG23A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG23B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG24A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG24B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG25A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG25B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG26A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG26B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG27A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG27B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG28A    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG28B    : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG2A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG2B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG3A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG3B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG4A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG4B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG5A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG5B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG6A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG6B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG7A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG7B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG8A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG8B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG9A     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CFG9B     : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CTRL_CFG2 : in std_logic_vector(15 downto 0);
      CH1_RX_APT_CTRL_CFG3 : in std_logic_vector(15 downto 0);
      CH1_RX_CAL_CFG0A     : in std_logic_vector(15 downto 0);
      CH1_RX_CAL_CFG0B     : in std_logic_vector(15 downto 0);
      CH1_RX_CAL_CFG1A     : in std_logic_vector(15 downto 0);
      CH1_RX_CAL_CFG1B     : in std_logic_vector(15 downto 0);
      CH1_RX_CAL_CFG2A     : in std_logic_vector(15 downto 0);
      CH1_RX_CAL_CFG2B     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG0A     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG0B     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG1A     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG1B     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG2A     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG2B     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG3A     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG3B     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG4A     : in std_logic_vector(15 downto 0);
      CH1_RX_CDR_CFG4B     : in std_logic_vector(15 downto 0);
      CH1_RX_CLKGN_CFG0    : in std_logic_vector(15 downto 0);
      CH1_RX_CLKGN_CFG1    : in std_logic_vector(15 downto 0);
      CH1_RX_CTLE_CFG0     : in std_logic_vector(15 downto 0);
      CH1_RX_CTLE_CFG1     : in std_logic_vector(15 downto 0);
      CH1_RX_CTLE_CFG2     : in std_logic_vector(15 downto 0);
      CH1_RX_CTLE_CFG3     : in std_logic_vector(15 downto 0);
      CH1_RX_DSP_CFG       : in std_logic_vector(15 downto 0);
      CH1_RX_MON_CFG       : in std_logic_vector(15 downto 0);
      CH1_RX_PAD_CFG0      : in std_logic_vector(15 downto 0);
      CH1_RX_PAD_CFG1      : in std_logic_vector(15 downto 0);
      CH1_RX_PCS_CFG0      : in std_logic_vector(15 downto 0);
      CH1_RX_PCS_CFG1      : in std_logic_vector(15 downto 0);
      CH1_TX_ANA_CFG0      : in std_logic_vector(15 downto 0);
      CH1_TX_ANA_CFG1      : in std_logic_vector(15 downto 0);
      CH1_TX_ANA_CFG2      : in std_logic_vector(15 downto 0);
      CH1_TX_ANA_CFG3      : in std_logic_vector(15 downto 0);
      CH1_TX_ANA_CFG4      : in std_logic_vector(15 downto 0);
      CH1_TX_CAL_CFG0      : in std_logic_vector(15 downto 0);
      CH1_TX_CAL_CFG1      : in std_logic_vector(15 downto 0);
      CH1_TX_DRV_CFG0      : in std_logic_vector(15 downto 0);
      CH1_TX_DRV_CFG1      : in std_logic_vector(15 downto 0);
      CH1_TX_DRV_CFG2      : in std_logic_vector(15 downto 0);
      CH1_TX_DRV_CFG3      : in std_logic_vector(15 downto 0);
      CH1_TX_DRV_CFG4      : in std_logic_vector(15 downto 0);
      CH1_TX_DRV_CFG5      : in std_logic_vector(15 downto 0);
      CH1_TX_LPBK_CFG0     : in std_logic_vector(15 downto 0);
      CH1_TX_LPBK_CFG1     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG0      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG1      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG10     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG11     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG12     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG13     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG14     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG15     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG16     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG17     : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG2      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG3      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG4      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG5      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG6      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG7      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG8      : in std_logic_vector(15 downto 0);
      CH1_TX_PCS_CFG9      : in std_logic_vector(15 downto 0);
      DRPEN_CFG            : in std_logic_vector(15 downto 0);
      FEC_CFG0             : in std_logic_vector(15 downto 0);
      FEC_CFG1             : in std_logic_vector(15 downto 0);
      FEC_CFG10            : in std_logic_vector(15 downto 0);
      FEC_CFG11            : in std_logic_vector(15 downto 0);
      FEC_CFG12            : in std_logic_vector(15 downto 0);
      FEC_CFG13            : in std_logic_vector(15 downto 0);
      FEC_CFG14            : in std_logic_vector(15 downto 0);
      FEC_CFG15            : in std_logic_vector(15 downto 0);
      FEC_CFG16            : in std_logic_vector(15 downto 0);
      FEC_CFG17            : in std_logic_vector(15 downto 0);
      FEC_CFG18            : in std_logic_vector(15 downto 0);
      FEC_CFG19            : in std_logic_vector(15 downto 0);
      FEC_CFG2             : in std_logic_vector(15 downto 0);
      FEC_CFG20            : in std_logic_vector(15 downto 0);
      FEC_CFG21            : in std_logic_vector(15 downto 0);
      FEC_CFG22            : in std_logic_vector(15 downto 0);
      FEC_CFG23            : in std_logic_vector(15 downto 0);
      FEC_CFG24            : in std_logic_vector(15 downto 0);
      FEC_CFG25            : in std_logic_vector(15 downto 0);
      FEC_CFG26            : in std_logic_vector(15 downto 0);
      FEC_CFG27            : in std_logic_vector(15 downto 0);
      FEC_CFG3             : in std_logic_vector(15 downto 0);
      FEC_CFG4             : in std_logic_vector(15 downto 0);
      FEC_CFG5             : in std_logic_vector(15 downto 0);
      FEC_CFG6             : in std_logic_vector(15 downto 0);
      FEC_CFG7             : in std_logic_vector(15 downto 0);
      FEC_CFG8             : in std_logic_vector(15 downto 0);
      FEC_CFG9             : in std_logic_vector(15 downto 0);
      PLL_CFG0             : in std_logic_vector(15 downto 0);
      PLL_CFG1             : in std_logic_vector(15 downto 0);
      PLL_CFG2             : in std_logic_vector(15 downto 0);
      PLL_CFG3             : in std_logic_vector(15 downto 0);
      PLL_CFG4             : in std_logic_vector(15 downto 0);
      PLL_CFG5             : in std_logic_vector(15 downto 0);
      PLL_CFG6             : in std_logic_vector(15 downto 0);
      PLL_CRS_CTRL_CFG0    : in std_logic_vector(15 downto 0);
      PLL_CRS_CTRL_CFG1    : in std_logic_vector(15 downto 0);
      PLL_IPS_PIN_EN       : in std_logic_vector(0 downto 0);
      PLL_IPS_REFCLK_SEL   : in std_logic_vector(2 downto 0);
      RCALSAP_TESTEN       : in std_logic_vector(0 downto 0);
      RCAL_APROBE          : in std_logic_vector(0 downto 0);
      RST_CFG              : in std_logic_vector(15 downto 0);
      RST_PLL_CFG0         : in std_logic_vector(15 downto 0);
      SAP_CFG0             : in std_logic_vector(15 downto 0);
      SDM_CFG0             : in std_logic_vector(15 downto 0);
      SDM_CFG1             : in std_logic_vector(15 downto 0);
      SDM_CFG2             : in std_logic_vector(15 downto 0);
      SDM_SEED_CFG0        : in std_logic_vector(15 downto 0);
      SDM_SEED_CFG1        : in std_logic_vector(15 downto 0);
      SIM_DEVICE           : in std_logic_vector(151 downto 0);
      CH0_AXISTDATA        : out std_logic_vector(27 downto 0);
      CH0_AXISTLAST        : out std_ulogic;
      CH0_AXISTVALID       : out std_ulogic;
      CH0_DMONITOROUT      : out std_logic_vector(31 downto 0);
      CH0_DMONITOROUTCLK   : out std_ulogic;
      --CH0_GTMTXN           : out std_ulogic;
      --CH0_GTMTXP           : out std_ulogic;
      CH0_GTMTXN           : out integer;
      CH0_GTMTXP           : out integer;
      CH0_PCSRSVDOUT       : out std_logic_vector(15 downto 0);
      CH0_PCSSCANOUT       : out std_logic_vector(14 downto 0);
      CH0_PMARSVDOUT       : out std_logic_vector(15 downto 0);
      CH0_PMASCANOUT       : out std_logic_vector(24 downto 0);
      CH0_RESETEXCEPTION   : out std_ulogic;
      CH0_RXBUFSTATUS      : out std_logic_vector(2 downto 0);
      CH0_RXDATA           : out std_logic_vector(255 downto 0);
      CH0_RXDATAFLAGS      : out std_logic_vector(3 downto 0);
      CH0_RXDATAISAM       : out std_ulogic;
      CH0_RXDATASTART      : out std_ulogic;
      CH0_RXOUTCLK         : out std_ulogic;
      CH0_RXPMARESETDONE   : out std_ulogic;
      CH0_RXPRBSERR        : out std_ulogic;
      CH0_RXPRBSLOCKED     : out std_ulogic;
      CH0_RXPRGDIVRESETDONE : out std_ulogic;
      CH0_RXPROGDIVCLK     : out std_ulogic;
      CH0_RXRESETDONE      : out std_ulogic;
      CH0_TXBUFSTATUS      : out std_logic_vector(1 downto 0);
      CH0_TXOUTCLK         : out std_ulogic;
      CH0_TXPMARESETDONE   : out std_ulogic;
      CH0_TXPRGDIVRESETDONE : out std_ulogic;
      CH0_TXPROGDIVCLK     : out std_ulogic;
      CH0_TXRESETDONE      : out std_ulogic;
      CH1_AXISTDATA        : out std_logic_vector(27 downto 0);
      CH1_AXISTLAST        : out std_ulogic;
      CH1_AXISTVALID       : out std_ulogic;
      CH1_DMONITOROUT      : out std_logic_vector(31 downto 0);
      CH1_DMONITOROUTCLK   : out std_ulogic;
      --CH1_GTMTXN           : out std_ulogic;
      --CH1_GTMTXP           : out std_ulogic;
      CH1_GTMTXN           : out integer;
      CH1_GTMTXP           : out integer;
      CH1_PCSRSVDOUT       : out std_logic_vector(15 downto 0);
      CH1_PCSSCANOUT       : out std_logic_vector(14 downto 0);
      CH1_PMARSVDOUT       : out std_logic_vector(15 downto 0);
      CH1_PMASCANOUT       : out std_logic_vector(24 downto 0);
      CH1_RESETEXCEPTION   : out std_ulogic;
      CH1_RXBUFSTATUS      : out std_logic_vector(2 downto 0);
      CH1_RXDATA           : out std_logic_vector(255 downto 0);
      CH1_RXDATAFLAGS      : out std_logic_vector(3 downto 0);
      CH1_RXDATAISAM       : out std_ulogic;
      CH1_RXDATASTART      : out std_ulogic;
      CH1_RXOUTCLK         : out std_ulogic;
      CH1_RXPMARESETDONE   : out std_ulogic;
      CH1_RXPRBSERR        : out std_ulogic;
      CH1_RXPRBSLOCKED     : out std_ulogic;
      CH1_RXPRGDIVRESETDONE : out std_ulogic;
      CH1_RXPROGDIVCLK     : out std_ulogic;
      CH1_RXRESETDONE      : out std_ulogic;
      CH1_TXBUFSTATUS      : out std_logic_vector(1 downto 0);
      CH1_TXOUTCLK         : out std_ulogic;
      CH1_TXPMARESETDONE   : out std_ulogic;
      CH1_TXPRGDIVRESETDONE : out std_ulogic;
      CH1_TXPROGDIVCLK     : out std_ulogic;
      CH1_TXRESETDONE      : out std_ulogic;
      CLKTESTSIG2PAD       : out std_ulogic;
      DMONITOROUTPLLCLK    : out std_ulogic;
      DRPDO                : out std_logic_vector(15 downto 0);
      DRPRDY               : out std_ulogic;
      FECRX0ALIGNED        : out std_ulogic;
      FECRX0CORRCWINC      : out std_ulogic;
      FECRX0CWINC          : out std_ulogic;
      FECRX0UNCORRCWINC    : out std_ulogic;
      FECRX1ALIGNED        : out std_ulogic;
      FECRX1CORRCWINC      : out std_ulogic;
      FECRX1CWINC          : out std_ulogic;
      FECRX1UNCORRCWINC    : out std_ulogic;
      FECRXLN0BITERR0TO1INC : out std_logic_vector(7 downto 0);
      FECRXLN0BITERR1TO0INC : out std_logic_vector(7 downto 0);
      FECRXLN0DLY          : out std_logic_vector(14 downto 0);
      FECRXLN0ERRCNTINC    : out std_logic_vector(3 downto 0);
      FECRXLN0MAPPING      : out std_logic_vector(1 downto 0);
      FECRXLN1BITERR0TO1INC : out std_logic_vector(7 downto 0);
      FECRXLN1BITERR1TO0INC : out std_logic_vector(7 downto 0);
      FECRXLN1DLY          : out std_logic_vector(14 downto 0);
      FECRXLN1ERRCNTINC    : out std_logic_vector(3 downto 0);
      FECRXLN1MAPPING      : out std_logic_vector(1 downto 0);
      FECRXLN2BITERR0TO1INC : out std_logic_vector(7 downto 0);
      FECRXLN2BITERR1TO0INC : out std_logic_vector(7 downto 0);
      FECRXLN2DLY          : out std_logic_vector(14 downto 0);
      FECRXLN2ERRCNTINC    : out std_logic_vector(3 downto 0);
      FECRXLN2MAPPING      : out std_logic_vector(1 downto 0);
      FECRXLN3BITERR0TO1INC : out std_logic_vector(7 downto 0);
      FECRXLN3BITERR1TO0INC : out std_logic_vector(7 downto 0);
      FECRXLN3DLY          : out std_logic_vector(14 downto 0);
      FECRXLN3ERRCNTINC    : out std_logic_vector(3 downto 0);
      FECRXLN3MAPPING      : out std_logic_vector(1 downto 0);
      FECSCANOUT           : out std_logic_vector(199 downto 0);
      FECTRXLN0LOCK        : out std_ulogic;
      FECTRXLN1LOCK        : out std_ulogic;
      FECTRXLN2LOCK        : out std_ulogic;
      FECTRXLN3LOCK        : out std_ulogic;
      GTPOWERGOOD          : out std_ulogic;
      PLLFBCLKLOST         : out std_ulogic;
      PLLLOCK              : out std_ulogic;
      PLLREFCLKLOST        : out std_ulogic;
      PLLREFCLKMONITOR     : out std_ulogic;
      PLLRESETDONE         : out std_ulogic;
      PLLRSVDOUT           : out std_logic_vector(15 downto 0);
      PLLSCANOUT           : out std_logic_vector(7 downto 0);
      RCALCMP              : out std_ulogic;
      RCALOUT              : out std_logic_vector(4 downto 0);
      REFCLK2BUFG          : out std_ulogic;
      REFCLKPDB_SA         : out std_ulogic;
      RXRECCLK0            : out std_ulogic;
      RXRECCLK1            : out std_ulogic;
      BGBYPASSB            : in std_ulogic;
      BGMONITORENB         : in std_ulogic;
      BGPDB                : in std_ulogic;
      BGRCALOVRD           : in std_logic_vector(4 downto 0);
      BGRCALOVRDENB        : in std_ulogic;
      CH0_AXISEN           : in std_ulogic;
      CH0_AXISRST          : in std_ulogic;
      CH0_AXISTRDY         : in std_ulogic;
      CH0_BSRSERIAL        : in std_ulogic;
      CH0_CFGRESET         : in std_ulogic;
      CH0_DMONFIFORESET    : in std_ulogic;
      CH0_DMONITORCLK      : in std_ulogic;
      --CH0_GTMRXN           : in std_ulogic;
      --CH0_GTMRXP           : in std_ulogic;
      CH0_GTMRXN           : in integer;
      CH0_GTMRXP           : in integer;
      CH0_GTRXRESET        : in std_ulogic;
      CH0_GTTXRESET        : in std_ulogic;
      CH0_LOOPBACK         : in std_logic_vector(2 downto 0);
      CH0_PCSRSVDIN        : in std_logic_vector(15 downto 0);
      CH0_PCSSCANCLK       : in std_logic_vector(1 downto 0);
      CH0_PCSSCANENB       : in std_ulogic;
      CH0_PCSSCANIN        : in std_logic_vector(14 downto 0);
      CH0_PCSSCANMODEB     : in std_ulogic;
      CH0_PCSSCANRSTB      : in std_ulogic;
      CH0_PCSSCANRSTEN     : in std_ulogic;
      CH0_PMARSVDIN        : in std_logic_vector(15 downto 0);
      CH0_PMASCANCLK       : in std_logic_vector(8 downto 0);
      CH0_PMASCANENB       : in std_ulogic;
      CH0_PMASCANIN        : in std_logic_vector(24 downto 0);
      CH0_PMASCANMODEB     : in std_ulogic;
      CH0_PMASCANRSTEN     : in std_ulogic;
      CH0_RESETOVRD        : in std_ulogic;
      CH0_RXADAPTRESET     : in std_ulogic;
      CH0_RXADCCALRESET    : in std_ulogic;
      CH0_RXADCCLKGENRESET : in std_ulogic;
      CH0_RXBUFRESET       : in std_ulogic;
      CH0_RXCDRFREQOS      : in std_ulogic;
      CH0_RXCDRFRRESET     : in std_ulogic;
      CH0_RXCDRHOLD        : in std_ulogic;
      CH0_RXCDRINCPCTRL    : in std_ulogic;
      CH0_RXCDROVRDEN      : in std_ulogic;
      CH0_RXCDRPHRESET     : in std_ulogic;
      CH0_RXDFERESET       : in std_ulogic;
      CH0_RXDSPRESET       : in std_ulogic;
      CH0_RXEQTRAINING     : in std_ulogic;
      CH0_RXEYESCANRESET   : in std_ulogic;
      CH0_RXFECRESET       : in std_ulogic;
      CH0_RXOUTCLKSEL      : in std_logic_vector(2 downto 0);
      CH0_RXPCSRESET       : in std_ulogic;
      CH0_RXPCSRESETMASK   : in std_logic_vector(3 downto 0);
      CH0_RXPMARESET       : in std_ulogic;
      CH0_RXPMARESETMASK   : in std_logic_vector(7 downto 0);
      CH0_RXPOLARITY       : in std_ulogic;
      CH0_RXPRBSCNTSTOP    : in std_ulogic;
      CH0_RXPRBSCSCNTRST   : in std_ulogic;
      CH0_RXPRBSPTN        : in std_logic_vector(3 downto 0);
      CH0_RXPROGDIVRESET   : in std_ulogic;
      CH0_RXQPRBSEN        : in std_ulogic;
      CH0_RXRESETMODE      : in std_logic_vector(1 downto 0);
      CH0_RXSPCSEQADV      : in std_ulogic;
      CH0_RXUSRCLK         : in std_ulogic;
      CH0_RXUSRCLK2        : in std_ulogic;
      CH0_RXUSRRDY         : in std_ulogic;
      CH0_RXUSRSTART       : in std_ulogic;
      CH0_RXUSRSTOP        : in std_ulogic;
      CH0_TSTCLK0          : in std_ulogic;
      CH0_TSTCLK1          : in std_ulogic;
      CH0_TXCKALRESET      : in std_ulogic;
      CH0_TXCTLFIRDAT      : in std_logic_vector(5 downto 0);
      CH0_TXDATA           : in std_logic_vector(255 downto 0);
      CH0_TXDATASTART      : in std_ulogic;
      CH0_TXDRVAMP         : in std_logic_vector(4 downto 0);
      CH0_TXEMPMAIN        : in std_logic_vector(5 downto 0);
      CH0_TXEMPPOST        : in std_logic_vector(4 downto 0);
      CH0_TXEMPPRE         : in std_logic_vector(4 downto 0);
      CH0_TXEMPPRE2        : in std_logic_vector(3 downto 0);
      CH0_TXFECRESET       : in std_ulogic;
      CH0_TXINHIBIT        : in std_ulogic;
      CH0_TXMUXDCDEXHOLD   : in std_ulogic;
      CH0_TXMUXDCDORWREN   : in std_ulogic;
      CH0_TXOUTCLKSEL      : in std_logic_vector(2 downto 0);
      CH0_TXPCSRESET       : in std_ulogic;
      CH0_TXPCSRESETMASK   : in std_logic_vector(1 downto 0);
      CH0_TXPMARESET       : in std_ulogic;
      CH0_TXPMARESETMASK   : in std_logic_vector(1 downto 0);
      CH0_TXPOLARITY       : in std_ulogic;
      CH0_TXPRBSINERR      : in std_ulogic;
      CH0_TXPRBSPTN        : in std_logic_vector(3 downto 0);
      CH0_TXPROGDIVRESET   : in std_ulogic;
      CH0_TXQPRBSEN        : in std_ulogic;
      CH0_TXRESETMODE      : in std_logic_vector(1 downto 0);
      CH0_TXSPCSEQADV      : in std_ulogic;
      CH0_TXUSRCLK         : in std_ulogic;
      CH0_TXUSRCLK2        : in std_ulogic;
      CH0_TXUSRRDY         : in std_ulogic;
      CH1_AXISEN           : in std_ulogic;
      CH1_AXISRST          : in std_ulogic;
      CH1_AXISTRDY         : in std_ulogic;
      CH1_BSRSERIAL        : in std_ulogic;
      CH1_CFGRESET         : in std_ulogic;
      CH1_DMONFIFORESET    : in std_ulogic;
      CH1_DMONITORCLK      : in std_ulogic;
      --CH1_GTMRXN           : in std_ulogic;
      --CH1_GTMRXP           : in std_ulogic;
      CH1_GTMRXN           : in integer;
      CH1_GTMRXP           : in integer;
      CH1_GTRXRESET        : in std_ulogic;
      CH1_GTTXRESET        : in std_ulogic;
      CH1_LOOPBACK         : in std_logic_vector(2 downto 0);
      CH1_PCSRSVDIN        : in std_logic_vector(15 downto 0);
      CH1_PCSSCANCLK       : in std_logic_vector(1 downto 0);
      CH1_PCSSCANENB       : in std_ulogic;
      CH1_PCSSCANIN        : in std_logic_vector(14 downto 0);
      CH1_PCSSCANMODEB     : in std_ulogic;
      CH1_PCSSCANRSTB      : in std_ulogic;
      CH1_PCSSCANRSTEN     : in std_ulogic;
      CH1_PMARSVDIN        : in std_logic_vector(15 downto 0);
      CH1_PMASCANCLK       : in std_logic_vector(8 downto 0);
      CH1_PMASCANENB       : in std_ulogic;
      CH1_PMASCANIN        : in std_logic_vector(24 downto 0);
      CH1_PMASCANMODEB     : in std_ulogic;
      CH1_PMASCANRSTEN     : in std_ulogic;
      CH1_RESETOVRD        : in std_ulogic;
      CH1_RXADAPTRESET     : in std_ulogic;
      CH1_RXADCCALRESET    : in std_ulogic;
      CH1_RXADCCLKGENRESET : in std_ulogic;
      CH1_RXBUFRESET       : in std_ulogic;
      CH1_RXCDRFREQOS      : in std_ulogic;
      CH1_RXCDRFRRESET     : in std_ulogic;
      CH1_RXCDRHOLD        : in std_ulogic;
      CH1_RXCDRINCPCTRL    : in std_ulogic;
      CH1_RXCDROVRDEN      : in std_ulogic;
      CH1_RXCDRPHRESET     : in std_ulogic;
      CH1_RXDFERESET       : in std_ulogic;
      CH1_RXDSPRESET       : in std_ulogic;
      CH1_RXEQTRAINING     : in std_ulogic;
      CH1_RXEYESCANRESET   : in std_ulogic;
      CH1_RXFECRESET       : in std_ulogic;
      CH1_RXOUTCLKSEL      : in std_logic_vector(2 downto 0);
      CH1_RXPCSRESET       : in std_ulogic;
      CH1_RXPCSRESETMASK   : in std_logic_vector(3 downto 0);
      CH1_RXPMARESET       : in std_ulogic;
      CH1_RXPMARESETMASK   : in std_logic_vector(7 downto 0);
      CH1_RXPOLARITY       : in std_ulogic;
      CH1_RXPRBSCNTSTOP    : in std_ulogic;
      CH1_RXPRBSCSCNTRST   : in std_ulogic;
      CH1_RXPRBSPTN        : in std_logic_vector(3 downto 0);
      CH1_RXPROGDIVRESET   : in std_ulogic;
      CH1_RXQPRBSEN        : in std_ulogic;
      CH1_RXRESETMODE      : in std_logic_vector(1 downto 0);
      CH1_RXSPCSEQADV      : in std_ulogic;
      CH1_RXUSRCLK         : in std_ulogic;
      CH1_RXUSRCLK2        : in std_ulogic;
      CH1_RXUSRRDY         : in std_ulogic;
      CH1_RXUSRSTART       : in std_ulogic;
      CH1_RXUSRSTOP        : in std_ulogic;
      CH1_TSTCLK0          : in std_ulogic;
      CH1_TSTCLK1          : in std_ulogic;
      CH1_TXCKALRESET      : in std_ulogic;
      CH1_TXCTLFIRDAT      : in std_logic_vector(5 downto 0);
      CH1_TXDATA           : in std_logic_vector(255 downto 0);
      CH1_TXDATASTART      : in std_ulogic;
      CH1_TXDRVAMP         : in std_logic_vector(4 downto 0);
      CH1_TXEMPMAIN        : in std_logic_vector(5 downto 0);
      CH1_TXEMPPOST        : in std_logic_vector(4 downto 0);
      CH1_TXEMPPRE         : in std_logic_vector(4 downto 0);
      CH1_TXEMPPRE2        : in std_logic_vector(3 downto 0);
      CH1_TXFECRESET       : in std_ulogic;
      CH1_TXINHIBIT        : in std_ulogic;
      CH1_TXMUXDCDEXHOLD   : in std_ulogic;
      CH1_TXMUXDCDORWREN   : in std_ulogic;
      CH1_TXOUTCLKSEL      : in std_logic_vector(2 downto 0);
      CH1_TXPCSRESET       : in std_ulogic;
      CH1_TXPCSRESETMASK   : in std_logic_vector(1 downto 0);
      CH1_TXPMARESET       : in std_ulogic;
      CH1_TXPMARESETMASK   : in std_logic_vector(1 downto 0);
      CH1_TXPOLARITY       : in std_ulogic;
      CH1_TXPRBSINERR      : in std_ulogic;
      CH1_TXPRBSPTN        : in std_logic_vector(3 downto 0);
      CH1_TXPROGDIVRESET   : in std_ulogic;
      CH1_TXQPRBSEN        : in std_ulogic;
      CH1_TXRESETMODE      : in std_logic_vector(1 downto 0);
      CH1_TXSPCSEQADV      : in std_ulogic;
      CH1_TXUSRCLK         : in std_ulogic;
      CH1_TXUSRCLK2        : in std_ulogic;
      CH1_TXUSRRDY         : in std_ulogic;
      CLKTESTSIG           : in std_ulogic;
      DRPADDR              : in std_logic_vector(10 downto 0);
      DRPCLK               : in std_ulogic;
      DRPDI                : in std_logic_vector(15 downto 0);
      DRPEN                : in std_ulogic;
      DRPRST               : in std_ulogic;
      DRPWE                : in std_ulogic;
      FECCTRLRX0BITSLIPFS  : in std_ulogic;
      FECCTRLRX1BITSLIPFS  : in std_ulogic;
      FECSCANCLK           : in std_ulogic;
      FECSCANENB           : in std_ulogic;
      FECSCANIN            : in std_logic_vector(199 downto 0);
      FECSCANMODEB         : in std_ulogic;
      FECSCANRSTB          : in std_ulogic;
      GTGREFCLK2PLL        : in std_ulogic;
      GTNORTHREFCLK        : in std_ulogic;
      GTREFCLK             : in std_ulogic;
      GTREFCLKPD           : in std_ulogic;
      GTSOUTHREFCLK        : in std_ulogic;
      PLLFBDIV             : in std_logic_vector(7 downto 0);
      PLLMONCLK            : in std_ulogic;
      PLLPD                : in std_ulogic;
      PLLREFCLKSEL         : in std_logic_vector(2 downto 0);
      PLLRESET             : in std_ulogic;
      PLLRESETBYPASSMODE   : in std_ulogic;
      PLLRESETMASK         : in std_logic_vector(1 downto 0);
      PLLRSVDIN            : in std_logic_vector(15 downto 0);
      PLLSCANCLK           : in std_logic_vector(3 downto 0);
      PLLSCANENB           : in std_ulogic;
      PLLSCANIN            : in std_logic_vector(7 downto 0);
      PLLSCANMODEB         : in std_ulogic;
      PLLSCANRSTEN         : in std_ulogic;
      RCALENB              : in std_ulogic;
      RCALSEL              : in std_logic_vector(1 downto 0);
      REFCLK2HROW          : in std_ulogic;
      SDMDATA              : in std_logic_vector(25 downto 0);
      SDMTOGGLE            : in std_ulogic;
      GSR                  : in std_ulogic
    );
  end component;
  

  constant MODULE_NAME : string := "GTM_DUAL";
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
  constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);

  constant A_CFG_BIN : std_logic_vector(15 downto 0) := A_CFG;
  constant A_SDM_DATA_CFG0_BIN : std_logic_vector(15 downto 0) := A_SDM_DATA_CFG0;
  constant A_SDM_DATA_CFG1_BIN : std_logic_vector(15 downto 0) := A_SDM_DATA_CFG1;
  constant BIAS_CFG0_BIN : std_logic_vector(15 downto 0) := BIAS_CFG0;
  constant BIAS_CFG1_BIN : std_logic_vector(15 downto 0) := BIAS_CFG1;
  constant BIAS_CFG2_BIN : std_logic_vector(15 downto 0) := BIAS_CFG2;
  constant BIAS_CFG3_BIN : std_logic_vector(15 downto 0) := BIAS_CFG3;
  constant BIAS_CFG4_BIN : std_logic_vector(15 downto 0) := BIAS_CFG4;
  constant BIAS_CFG5_BIN : std_logic_vector(15 downto 0) := BIAS_CFG5;
  constant BIAS_CFG6_BIN : std_logic_vector(15 downto 0) := BIAS_CFG6;
  constant BIAS_CFG7_BIN : std_logic_vector(15 downto 0) := BIAS_CFG7;
  constant CH0_A_CH_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG0;
  constant CH0_A_CH_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG1;
  constant CH0_A_CH_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG2;
  constant CH0_A_CH_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG3;
  constant CH0_A_CH_CFG4_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG4;
  constant CH0_A_CH_CFG5_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG5;
  constant CH0_A_CH_CFG6_BIN : std_logic_vector(15 downto 0) := CH0_A_CH_CFG6;
  constant CH0_RST_LP_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_CFG0;
  constant CH0_RST_LP_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_CFG1;
  constant CH0_RST_LP_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_CFG2;
  constant CH0_RST_LP_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_CFG3;
  constant CH0_RST_LP_CFG4_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_CFG4;
  constant CH0_RST_LP_ID_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_ID_CFG0;
  constant CH0_RST_LP_ID_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RST_LP_ID_CFG1;
  constant CH0_RST_TIME_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG0;
  constant CH0_RST_TIME_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG1;
  constant CH0_RST_TIME_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG2;
  constant CH0_RST_TIME_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG3;
  constant CH0_RST_TIME_CFG4_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG4;
  constant CH0_RST_TIME_CFG5_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG5;
  constant CH0_RST_TIME_CFG6_BIN : std_logic_vector(15 downto 0) := CH0_RST_TIME_CFG6;
  constant CH0_RX_ADC_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RX_ADC_CFG0;
  constant CH0_RX_ADC_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RX_ADC_CFG1;
  constant CH0_RX_ANA_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RX_ANA_CFG0;
  constant CH0_RX_ANA_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RX_ANA_CFG1;
  constant CH0_RX_ANA_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_RX_ANA_CFG2;
  constant CH0_RX_APT_CFG0A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG0A;
  constant CH0_RX_APT_CFG0B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG0B;
  constant CH0_RX_APT_CFG10A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG10A;
  constant CH0_RX_APT_CFG10B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG10B;
  constant CH0_RX_APT_CFG11A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG11A;
  constant CH0_RX_APT_CFG11B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG11B;
  constant CH0_RX_APT_CFG12A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG12A;
  constant CH0_RX_APT_CFG12B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG12B;
  constant CH0_RX_APT_CFG13A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG13A;
  constant CH0_RX_APT_CFG13B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG13B;
  constant CH0_RX_APT_CFG14A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG14A;
  constant CH0_RX_APT_CFG14B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG14B;
  constant CH0_RX_APT_CFG15A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG15A;
  constant CH0_RX_APT_CFG15B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG15B;
  constant CH0_RX_APT_CFG16A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG16A;
  constant CH0_RX_APT_CFG16B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG16B;
  constant CH0_RX_APT_CFG17A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG17A;
  constant CH0_RX_APT_CFG17B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG17B;
  constant CH0_RX_APT_CFG18A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG18A;
  constant CH0_RX_APT_CFG18B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG18B;
  constant CH0_RX_APT_CFG19A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG19A;
  constant CH0_RX_APT_CFG19B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG19B;
  constant CH0_RX_APT_CFG1A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG1A;
  constant CH0_RX_APT_CFG1B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG1B;
  constant CH0_RX_APT_CFG20A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG20A;
  constant CH0_RX_APT_CFG20B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG20B;
  constant CH0_RX_APT_CFG21A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG21A;
  constant CH0_RX_APT_CFG21B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG21B;
  constant CH0_RX_APT_CFG22A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG22A;
  constant CH0_RX_APT_CFG22B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG22B;
  constant CH0_RX_APT_CFG23A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG23A;
  constant CH0_RX_APT_CFG23B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG23B;
  constant CH0_RX_APT_CFG24A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG24A;
  constant CH0_RX_APT_CFG24B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG24B;
  constant CH0_RX_APT_CFG25A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG25A;
  constant CH0_RX_APT_CFG25B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG25B;
  constant CH0_RX_APT_CFG26A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG26A;
  constant CH0_RX_APT_CFG26B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG26B;
  constant CH0_RX_APT_CFG27A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG27A;
  constant CH0_RX_APT_CFG27B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG27B;
  constant CH0_RX_APT_CFG28A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG28A;
  constant CH0_RX_APT_CFG28B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG28B;
  constant CH0_RX_APT_CFG2A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG2A;
  constant CH0_RX_APT_CFG2B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG2B;
  constant CH0_RX_APT_CFG3A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG3A;
  constant CH0_RX_APT_CFG3B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG3B;
  constant CH0_RX_APT_CFG4A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG4A;
  constant CH0_RX_APT_CFG4B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG4B;
  constant CH0_RX_APT_CFG5A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG5A;
  constant CH0_RX_APT_CFG5B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG5B;
  constant CH0_RX_APT_CFG6A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG6A;
  constant CH0_RX_APT_CFG6B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG6B;
  constant CH0_RX_APT_CFG7A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG7A;
  constant CH0_RX_APT_CFG7B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG7B;
  constant CH0_RX_APT_CFG8A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG8A;
  constant CH0_RX_APT_CFG8B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG8B;
  constant CH0_RX_APT_CFG9A_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG9A;
  constant CH0_RX_APT_CFG9B_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CFG9B;
  constant CH0_RX_APT_CTRL_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CTRL_CFG2;
  constant CH0_RX_APT_CTRL_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_RX_APT_CTRL_CFG3;
  constant CH0_RX_CAL_CFG0A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CAL_CFG0A;
  constant CH0_RX_CAL_CFG0B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CAL_CFG0B;
  constant CH0_RX_CAL_CFG1A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CAL_CFG1A;
  constant CH0_RX_CAL_CFG1B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CAL_CFG1B;
  constant CH0_RX_CAL_CFG2A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CAL_CFG2A;
  constant CH0_RX_CAL_CFG2B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CAL_CFG2B;
  constant CH0_RX_CDR_CFG0A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG0A;
  constant CH0_RX_CDR_CFG0B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG0B;
  constant CH0_RX_CDR_CFG1A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG1A;
  constant CH0_RX_CDR_CFG1B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG1B;
  constant CH0_RX_CDR_CFG2A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG2A;
  constant CH0_RX_CDR_CFG2B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG2B;
  constant CH0_RX_CDR_CFG3A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG3A;
  constant CH0_RX_CDR_CFG3B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG3B;
  constant CH0_RX_CDR_CFG4A_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG4A;
  constant CH0_RX_CDR_CFG4B_BIN : std_logic_vector(15 downto 0) := CH0_RX_CDR_CFG4B;
  constant CH0_RX_CLKGN_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RX_CLKGN_CFG0;
  constant CH0_RX_CLKGN_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RX_CLKGN_CFG1;
  constant CH0_RX_CTLE_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RX_CTLE_CFG0;
  constant CH0_RX_CTLE_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RX_CTLE_CFG1;
  constant CH0_RX_CTLE_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_RX_CTLE_CFG2;
  constant CH0_RX_CTLE_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_RX_CTLE_CFG3;
  constant CH0_RX_DSP_CFG_BIN : std_logic_vector(15 downto 0) := CH0_RX_DSP_CFG;
  constant CH0_RX_MON_CFG_BIN : std_logic_vector(15 downto 0) := CH0_RX_MON_CFG;
  constant CH0_RX_PAD_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RX_PAD_CFG0;
  constant CH0_RX_PAD_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RX_PAD_CFG1;
  constant CH0_RX_PCS_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_RX_PCS_CFG0;
  constant CH0_RX_PCS_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_RX_PCS_CFG1;
  constant CH0_TX_ANA_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_TX_ANA_CFG0;
  constant CH0_TX_ANA_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_TX_ANA_CFG1;
  constant CH0_TX_ANA_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_TX_ANA_CFG2;
  constant CH0_TX_ANA_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_TX_ANA_CFG3;
  constant CH0_TX_ANA_CFG4_BIN : std_logic_vector(15 downto 0) := CH0_TX_ANA_CFG4;
  constant CH0_TX_CAL_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_TX_CAL_CFG0;
  constant CH0_TX_CAL_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_TX_CAL_CFG1;
  constant CH0_TX_DRV_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_TX_DRV_CFG0;
  constant CH0_TX_DRV_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_TX_DRV_CFG1;
  constant CH0_TX_DRV_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_TX_DRV_CFG2;
  constant CH0_TX_DRV_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_TX_DRV_CFG3;
  constant CH0_TX_DRV_CFG4_BIN : std_logic_vector(15 downto 0) := CH0_TX_DRV_CFG4;
  constant CH0_TX_DRV_CFG5_BIN : std_logic_vector(15 downto 0) := CH0_TX_DRV_CFG5;
  constant CH0_TX_LPBK_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_TX_LPBK_CFG0;
  constant CH0_TX_LPBK_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_TX_LPBK_CFG1;
  constant CH0_TX_PCS_CFG0_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG0;
  constant CH0_TX_PCS_CFG10_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG10;
  constant CH0_TX_PCS_CFG11_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG11;
  constant CH0_TX_PCS_CFG12_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG12;
  constant CH0_TX_PCS_CFG13_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG13;
  constant CH0_TX_PCS_CFG14_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG14;
  constant CH0_TX_PCS_CFG15_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG15;
  constant CH0_TX_PCS_CFG16_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG16;
  constant CH0_TX_PCS_CFG17_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG17;
  constant CH0_TX_PCS_CFG1_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG1;
  constant CH0_TX_PCS_CFG2_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG2;
  constant CH0_TX_PCS_CFG3_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG3;
  constant CH0_TX_PCS_CFG4_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG4;
  constant CH0_TX_PCS_CFG5_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG5;
  constant CH0_TX_PCS_CFG6_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG6;
  constant CH0_TX_PCS_CFG7_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG7;
  constant CH0_TX_PCS_CFG8_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG8;
  constant CH0_TX_PCS_CFG9_BIN : std_logic_vector(15 downto 0) := CH0_TX_PCS_CFG9;
  constant CH1_A_CH_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG0;
  constant CH1_A_CH_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG1;
  constant CH1_A_CH_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG2;
  constant CH1_A_CH_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG3;
  constant CH1_A_CH_CFG4_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG4;
  constant CH1_A_CH_CFG5_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG5;
  constant CH1_A_CH_CFG6_BIN : std_logic_vector(15 downto 0) := CH1_A_CH_CFG6;
  constant CH1_RST_LP_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_CFG0;
  constant CH1_RST_LP_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_CFG1;
  constant CH1_RST_LP_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_CFG2;
  constant CH1_RST_LP_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_CFG3;
  constant CH1_RST_LP_CFG4_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_CFG4;
  constant CH1_RST_LP_ID_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_ID_CFG0;
  constant CH1_RST_LP_ID_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RST_LP_ID_CFG1;
  constant CH1_RST_TIME_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG0;
  constant CH1_RST_TIME_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG1;
  constant CH1_RST_TIME_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG2;
  constant CH1_RST_TIME_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG3;
  constant CH1_RST_TIME_CFG4_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG4;
  constant CH1_RST_TIME_CFG5_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG5;
  constant CH1_RST_TIME_CFG6_BIN : std_logic_vector(15 downto 0) := CH1_RST_TIME_CFG6;
  constant CH1_RX_ADC_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RX_ADC_CFG0;
  constant CH1_RX_ADC_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RX_ADC_CFG1;
  constant CH1_RX_ANA_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RX_ANA_CFG0;
  constant CH1_RX_ANA_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RX_ANA_CFG1;
  constant CH1_RX_ANA_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_RX_ANA_CFG2;
  constant CH1_RX_APT_CFG0A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG0A;
  constant CH1_RX_APT_CFG0B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG0B;
  constant CH1_RX_APT_CFG10A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG10A;
  constant CH1_RX_APT_CFG10B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG10B;
  constant CH1_RX_APT_CFG11A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG11A;
  constant CH1_RX_APT_CFG11B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG11B;
  constant CH1_RX_APT_CFG12A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG12A;
  constant CH1_RX_APT_CFG12B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG12B;
  constant CH1_RX_APT_CFG13A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG13A;
  constant CH1_RX_APT_CFG13B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG13B;
  constant CH1_RX_APT_CFG14A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG14A;
  constant CH1_RX_APT_CFG14B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG14B;
  constant CH1_RX_APT_CFG15A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG15A;
  constant CH1_RX_APT_CFG15B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG15B;
  constant CH1_RX_APT_CFG16A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG16A;
  constant CH1_RX_APT_CFG16B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG16B;
  constant CH1_RX_APT_CFG17A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG17A;
  constant CH1_RX_APT_CFG17B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG17B;
  constant CH1_RX_APT_CFG18A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG18A;
  constant CH1_RX_APT_CFG18B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG18B;
  constant CH1_RX_APT_CFG19A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG19A;
  constant CH1_RX_APT_CFG19B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG19B;
  constant CH1_RX_APT_CFG1A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG1A;
  constant CH1_RX_APT_CFG1B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG1B;
  constant CH1_RX_APT_CFG20A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG20A;
  constant CH1_RX_APT_CFG20B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG20B;
  constant CH1_RX_APT_CFG21A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG21A;
  constant CH1_RX_APT_CFG21B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG21B;
  constant CH1_RX_APT_CFG22A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG22A;
  constant CH1_RX_APT_CFG22B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG22B;
  constant CH1_RX_APT_CFG23A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG23A;
  constant CH1_RX_APT_CFG23B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG23B;
  constant CH1_RX_APT_CFG24A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG24A;
  constant CH1_RX_APT_CFG24B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG24B;
  constant CH1_RX_APT_CFG25A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG25A;
  constant CH1_RX_APT_CFG25B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG25B;
  constant CH1_RX_APT_CFG26A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG26A;
  constant CH1_RX_APT_CFG26B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG26B;
  constant CH1_RX_APT_CFG27A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG27A;
  constant CH1_RX_APT_CFG27B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG27B;
  constant CH1_RX_APT_CFG28A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG28A;
  constant CH1_RX_APT_CFG28B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG28B;
  constant CH1_RX_APT_CFG2A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG2A;
  constant CH1_RX_APT_CFG2B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG2B;
  constant CH1_RX_APT_CFG3A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG3A;
  constant CH1_RX_APT_CFG3B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG3B;
  constant CH1_RX_APT_CFG4A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG4A;
  constant CH1_RX_APT_CFG4B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG4B;
  constant CH1_RX_APT_CFG5A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG5A;
  constant CH1_RX_APT_CFG5B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG5B;
  constant CH1_RX_APT_CFG6A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG6A;
  constant CH1_RX_APT_CFG6B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG6B;
  constant CH1_RX_APT_CFG7A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG7A;
  constant CH1_RX_APT_CFG7B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG7B;
  constant CH1_RX_APT_CFG8A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG8A;
  constant CH1_RX_APT_CFG8B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG8B;
  constant CH1_RX_APT_CFG9A_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG9A;
  constant CH1_RX_APT_CFG9B_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CFG9B;
  constant CH1_RX_APT_CTRL_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CTRL_CFG2;
  constant CH1_RX_APT_CTRL_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_RX_APT_CTRL_CFG3;
  constant CH1_RX_CAL_CFG0A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CAL_CFG0A;
  constant CH1_RX_CAL_CFG0B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CAL_CFG0B;
  constant CH1_RX_CAL_CFG1A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CAL_CFG1A;
  constant CH1_RX_CAL_CFG1B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CAL_CFG1B;
  constant CH1_RX_CAL_CFG2A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CAL_CFG2A;
  constant CH1_RX_CAL_CFG2B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CAL_CFG2B;
  constant CH1_RX_CDR_CFG0A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG0A;
  constant CH1_RX_CDR_CFG0B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG0B;
  constant CH1_RX_CDR_CFG1A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG1A;
  constant CH1_RX_CDR_CFG1B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG1B;
  constant CH1_RX_CDR_CFG2A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG2A;
  constant CH1_RX_CDR_CFG2B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG2B;
  constant CH1_RX_CDR_CFG3A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG3A;
  constant CH1_RX_CDR_CFG3B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG3B;
  constant CH1_RX_CDR_CFG4A_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG4A;
  constant CH1_RX_CDR_CFG4B_BIN : std_logic_vector(15 downto 0) := CH1_RX_CDR_CFG4B;
  constant CH1_RX_CLKGN_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RX_CLKGN_CFG0;
  constant CH1_RX_CLKGN_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RX_CLKGN_CFG1;
  constant CH1_RX_CTLE_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RX_CTLE_CFG0;
  constant CH1_RX_CTLE_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RX_CTLE_CFG1;
  constant CH1_RX_CTLE_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_RX_CTLE_CFG2;
  constant CH1_RX_CTLE_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_RX_CTLE_CFG3;
  constant CH1_RX_DSP_CFG_BIN : std_logic_vector(15 downto 0) := CH1_RX_DSP_CFG;
  constant CH1_RX_MON_CFG_BIN : std_logic_vector(15 downto 0) := CH1_RX_MON_CFG;
  constant CH1_RX_PAD_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RX_PAD_CFG0;
  constant CH1_RX_PAD_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RX_PAD_CFG1;
  constant CH1_RX_PCS_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_RX_PCS_CFG0;
  constant CH1_RX_PCS_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_RX_PCS_CFG1;
  constant CH1_TX_ANA_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_TX_ANA_CFG0;
  constant CH1_TX_ANA_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_TX_ANA_CFG1;
  constant CH1_TX_ANA_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_TX_ANA_CFG2;
  constant CH1_TX_ANA_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_TX_ANA_CFG3;
  constant CH1_TX_ANA_CFG4_BIN : std_logic_vector(15 downto 0) := CH1_TX_ANA_CFG4;
  constant CH1_TX_CAL_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_TX_CAL_CFG0;
  constant CH1_TX_CAL_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_TX_CAL_CFG1;
  constant CH1_TX_DRV_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_TX_DRV_CFG0;
  constant CH1_TX_DRV_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_TX_DRV_CFG1;
  constant CH1_TX_DRV_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_TX_DRV_CFG2;
  constant CH1_TX_DRV_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_TX_DRV_CFG3;
  constant CH1_TX_DRV_CFG4_BIN : std_logic_vector(15 downto 0) := CH1_TX_DRV_CFG4;
  constant CH1_TX_DRV_CFG5_BIN : std_logic_vector(15 downto 0) := CH1_TX_DRV_CFG5;
  constant CH1_TX_LPBK_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_TX_LPBK_CFG0;
  constant CH1_TX_LPBK_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_TX_LPBK_CFG1;
  constant CH1_TX_PCS_CFG0_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG0;
  constant CH1_TX_PCS_CFG10_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG10;
  constant CH1_TX_PCS_CFG11_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG11;
  constant CH1_TX_PCS_CFG12_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG12;
  constant CH1_TX_PCS_CFG13_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG13;
  constant CH1_TX_PCS_CFG14_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG14;
  constant CH1_TX_PCS_CFG15_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG15;
  constant CH1_TX_PCS_CFG16_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG16;
  constant CH1_TX_PCS_CFG17_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG17;
  constant CH1_TX_PCS_CFG1_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG1;
  constant CH1_TX_PCS_CFG2_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG2;
  constant CH1_TX_PCS_CFG3_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG3;
  constant CH1_TX_PCS_CFG4_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG4;
  constant CH1_TX_PCS_CFG5_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG5;
  constant CH1_TX_PCS_CFG6_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG6;
  constant CH1_TX_PCS_CFG7_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG7;
  constant CH1_TX_PCS_CFG8_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG8;
  constant CH1_TX_PCS_CFG9_BIN : std_logic_vector(15 downto 0) := CH1_TX_PCS_CFG9;
  constant DRPEN_CFG_BIN : std_logic_vector(15 downto 0) := DRPEN_CFG;
  constant FEC_CFG0_BIN : std_logic_vector(15 downto 0) := FEC_CFG0;
  constant FEC_CFG10_BIN : std_logic_vector(15 downto 0) := FEC_CFG10;
  constant FEC_CFG11_BIN : std_logic_vector(15 downto 0) := FEC_CFG11;
  constant FEC_CFG12_BIN : std_logic_vector(15 downto 0) := FEC_CFG12;
  constant FEC_CFG13_BIN : std_logic_vector(15 downto 0) := FEC_CFG13;
  constant FEC_CFG14_BIN : std_logic_vector(15 downto 0) := FEC_CFG14;
  constant FEC_CFG15_BIN : std_logic_vector(15 downto 0) := FEC_CFG15;
  constant FEC_CFG16_BIN : std_logic_vector(15 downto 0) := FEC_CFG16;
  constant FEC_CFG17_BIN : std_logic_vector(15 downto 0) := FEC_CFG17;
  constant FEC_CFG18_BIN : std_logic_vector(15 downto 0) := FEC_CFG18;
  constant FEC_CFG19_BIN : std_logic_vector(15 downto 0) := FEC_CFG19;
  constant FEC_CFG1_BIN : std_logic_vector(15 downto 0) := FEC_CFG1;
  constant FEC_CFG20_BIN : std_logic_vector(15 downto 0) := FEC_CFG20;
  constant FEC_CFG21_BIN : std_logic_vector(15 downto 0) := FEC_CFG21;
  constant FEC_CFG22_BIN : std_logic_vector(15 downto 0) := FEC_CFG22;
  constant FEC_CFG23_BIN : std_logic_vector(15 downto 0) := FEC_CFG23;
  constant FEC_CFG24_BIN : std_logic_vector(15 downto 0) := FEC_CFG24;
  constant FEC_CFG25_BIN : std_logic_vector(15 downto 0) := FEC_CFG25;
  constant FEC_CFG26_BIN : std_logic_vector(15 downto 0) := FEC_CFG26;
  constant FEC_CFG27_BIN : std_logic_vector(15 downto 0) := FEC_CFG27;
  constant FEC_CFG2_BIN : std_logic_vector(15 downto 0) := FEC_CFG2;
  constant FEC_CFG3_BIN : std_logic_vector(15 downto 0) := FEC_CFG3;
  constant FEC_CFG4_BIN : std_logic_vector(15 downto 0) := FEC_CFG4;
  constant FEC_CFG5_BIN : std_logic_vector(15 downto 0) := FEC_CFG5;
  constant FEC_CFG6_BIN : std_logic_vector(15 downto 0) := FEC_CFG6;
  constant FEC_CFG7_BIN : std_logic_vector(15 downto 0) := FEC_CFG7;
  constant FEC_CFG8_BIN : std_logic_vector(15 downto 0) := FEC_CFG8;
  constant FEC_CFG9_BIN : std_logic_vector(15 downto 0) := FEC_CFG9;
  constant PLL_CFG0_BIN : std_logic_vector(15 downto 0) := PLL_CFG0;
  constant PLL_CFG1_BIN : std_logic_vector(15 downto 0) := PLL_CFG1;
  constant PLL_CFG2_BIN : std_logic_vector(15 downto 0) := PLL_CFG2;
  constant PLL_CFG3_BIN : std_logic_vector(15 downto 0) := PLL_CFG3;
  constant PLL_CFG4_BIN : std_logic_vector(15 downto 0) := PLL_CFG4;
  constant PLL_CFG5_BIN : std_logic_vector(15 downto 0) := PLL_CFG5;
  constant PLL_CFG6_BIN : std_logic_vector(15 downto 0) := PLL_CFG6;
  constant PLL_CRS_CTRL_CFG0_BIN : std_logic_vector(15 downto 0) := PLL_CRS_CTRL_CFG0;
  constant PLL_CRS_CTRL_CFG1_BIN : std_logic_vector(15 downto 0) := PLL_CRS_CTRL_CFG1;
  constant PLL_IPS_PIN_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(PLL_IPS_PIN_EN));
  constant PLL_IPS_REFCLK_SEL_BIN : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(PLL_IPS_REFCLK_SEL,3));
  constant RCALSAP_TESTEN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RCALSAP_TESTEN));
  constant RCAL_APROBE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(RCAL_APROBE));
  constant RST_CFG_BIN : std_logic_vector(15 downto 0) := RST_CFG;
  constant RST_PLL_CFG0_BIN : std_logic_vector(15 downto 0) := RST_PLL_CFG0;
  constant SAP_CFG0_BIN : std_logic_vector(15 downto 0) := SAP_CFG0;
  constant SDM_CFG0_BIN : std_logic_vector(15 downto 0) := SDM_CFG0;
  constant SDM_CFG1_BIN : std_logic_vector(15 downto 0) := SDM_CFG1;
  constant SDM_CFG2_BIN : std_logic_vector(15 downto 0) := SDM_CFG2;
  constant SDM_SEED_CFG0_BIN : std_logic_vector(15 downto 0) := SDM_SEED_CFG0;
  constant SDM_SEED_CFG1_BIN : std_logic_vector(15 downto 0) := SDM_SEED_CFG1;


-- Parameter encodings and registers

  signal CH0_GTMTXN_integer : integer;
  signal CH0_GTMTXP_integer : integer;
  signal CH1_GTMTXN_integer : integer;
  signal CH1_GTMTXP_integer : integer;
  signal CH0_GTMRXN_integer : integer;
  signal CH0_GTMRXP_integer : integer;
  signal CH1_GTMRXN_integer : integer;
  signal CH1_GTMRXP_integer : integer;




  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal CH0_AXISTDATA_out : std_logic_vector(27 downto 0);
  signal CH0_AXISTLAST_out : std_ulogic;
  signal CH0_AXISTVALID_out : std_ulogic;
  signal CH0_DMONITOROUTCLK_out : std_ulogic;
  signal CH0_DMONITOROUT_out : std_logic_vector(31 downto 0);
  signal CH0_GTMTXN_out : std_ulogic;
  signal CH0_GTMTXP_out : std_ulogic;
  signal CH0_PCSRSVDOUT_out : std_logic_vector(15 downto 0);
  signal CH0_PCSSCANOUT_out : std_logic_vector(14 downto 0);
  signal CH0_PMARSVDOUT_out : std_logic_vector(15 downto 0);
  signal CH0_PMASCANOUT_out : std_logic_vector(24 downto 0);
  signal CH0_RESETEXCEPTION_out : std_ulogic;
  signal CH0_RXBUFSTATUS_out : std_logic_vector(2 downto 0);
  signal CH0_RXDATAFLAGS_out : std_logic_vector(3 downto 0);
  signal CH0_RXDATAISAM_out : std_ulogic;
  signal CH0_RXDATASTART_out : std_ulogic;
  signal CH0_RXDATA_out : std_logic_vector(255 downto 0);
  signal CH0_RXOUTCLK_out : std_ulogic;
  signal CH0_RXPMARESETDONE_out : std_ulogic;
  signal CH0_RXPRBSERR_out : std_ulogic;
  signal CH0_RXPRBSLOCKED_out : std_ulogic;
  signal CH0_RXPRGDIVRESETDONE_out : std_ulogic;
  signal CH0_RXPROGDIVCLK_out : std_ulogic;
  signal CH0_RXRESETDONE_out : std_ulogic;
  signal CH0_TXBUFSTATUS_out : std_logic_vector(1 downto 0);
  signal CH0_TXOUTCLK_out : std_ulogic;
  signal CH0_TXPMARESETDONE_out : std_ulogic;
  signal CH0_TXPRGDIVRESETDONE_out : std_ulogic;
  signal CH0_TXPROGDIVCLK_out : std_ulogic;
  signal CH0_TXRESETDONE_out : std_ulogic;
  signal CH1_AXISTDATA_out : std_logic_vector(27 downto 0);
  signal CH1_AXISTLAST_out : std_ulogic;
  signal CH1_AXISTVALID_out : std_ulogic;
  signal CH1_DMONITOROUTCLK_out : std_ulogic;
  signal CH1_DMONITOROUT_out : std_logic_vector(31 downto 0);
  signal CH1_GTMTXN_out : std_ulogic;
  signal CH1_GTMTXP_out : std_ulogic;
  signal CH1_PCSRSVDOUT_out : std_logic_vector(15 downto 0);
  signal CH1_PCSSCANOUT_out : std_logic_vector(14 downto 0);
  signal CH1_PMARSVDOUT_out : std_logic_vector(15 downto 0);
  signal CH1_PMASCANOUT_out : std_logic_vector(24 downto 0);
  signal CH1_RESETEXCEPTION_out : std_ulogic;
  signal CH1_RXBUFSTATUS_out : std_logic_vector(2 downto 0);
  signal CH1_RXDATAFLAGS_out : std_logic_vector(3 downto 0);
  signal CH1_RXDATAISAM_out : std_ulogic;
  signal CH1_RXDATASTART_out : std_ulogic;
  signal CH1_RXDATA_out : std_logic_vector(255 downto 0);
  signal CH1_RXOUTCLK_out : std_ulogic;
  signal CH1_RXPMARESETDONE_out : std_ulogic;
  signal CH1_RXPRBSERR_out : std_ulogic;
  signal CH1_RXPRBSLOCKED_out : std_ulogic;
  signal CH1_RXPRGDIVRESETDONE_out : std_ulogic;
  signal CH1_RXPROGDIVCLK_out : std_ulogic;
  signal CH1_RXRESETDONE_out : std_ulogic;
  signal CH1_TXBUFSTATUS_out : std_logic_vector(1 downto 0);
  signal CH1_TXOUTCLK_out : std_ulogic;
  signal CH1_TXPMARESETDONE_out : std_ulogic;
  signal CH1_TXPRGDIVRESETDONE_out : std_ulogic;
  signal CH1_TXPROGDIVCLK_out : std_ulogic;
  signal CH1_TXRESETDONE_out : std_ulogic;
  signal CLKTESTSIG2PAD_out : std_ulogic;
  signal DMONITOROUTPLLCLK_out : std_ulogic;
  signal DRPDO_out : std_logic_vector(15 downto 0);
  signal DRPRDY_out : std_ulogic;
  signal FECRX0ALIGNED_out : std_ulogic;
  signal FECRX0CORRCWINC_out : std_ulogic;
  signal FECRX0CWINC_out : std_ulogic;
  signal FECRX0UNCORRCWINC_out : std_ulogic;
  signal FECRX1ALIGNED_out : std_ulogic;
  signal FECRX1CORRCWINC_out : std_ulogic;
  signal FECRX1CWINC_out : std_ulogic;
  signal FECRX1UNCORRCWINC_out : std_ulogic;
  signal FECRXLN0BITERR0TO1INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN0BITERR1TO0INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN0DLY_out : std_logic_vector(14 downto 0);
  signal FECRXLN0ERRCNTINC_out : std_logic_vector(3 downto 0);
  signal FECRXLN0MAPPING_out : std_logic_vector(1 downto 0);
  signal FECRXLN1BITERR0TO1INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN1BITERR1TO0INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN1DLY_out : std_logic_vector(14 downto 0);
  signal FECRXLN1ERRCNTINC_out : std_logic_vector(3 downto 0);
  signal FECRXLN1MAPPING_out : std_logic_vector(1 downto 0);
  signal FECRXLN2BITERR0TO1INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN2BITERR1TO0INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN2DLY_out : std_logic_vector(14 downto 0);
  signal FECRXLN2ERRCNTINC_out : std_logic_vector(3 downto 0);
  signal FECRXLN2MAPPING_out : std_logic_vector(1 downto 0);
  signal FECRXLN3BITERR0TO1INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN3BITERR1TO0INC_out : std_logic_vector(7 downto 0);
  signal FECRXLN3DLY_out : std_logic_vector(14 downto 0);
  signal FECRXLN3ERRCNTINC_out : std_logic_vector(3 downto 0);
  signal FECRXLN3MAPPING_out : std_logic_vector(1 downto 0);
  signal FECSCANOUT_out : std_logic_vector(199 downto 0);
  signal FECTRXLN0LOCK_out : std_ulogic;
  signal FECTRXLN1LOCK_out : std_ulogic;
  signal FECTRXLN2LOCK_out : std_ulogic;
  signal FECTRXLN3LOCK_out : std_ulogic;
  signal GTPOWERGOOD_out : std_ulogic;
  signal PLLFBCLKLOST_out : std_ulogic;
  signal PLLLOCK_out : std_ulogic;
  signal PLLREFCLKLOST_out : std_ulogic;
  signal PLLREFCLKMONITOR_out : std_ulogic;
  signal PLLRESETDONE_out : std_ulogic;
  signal PLLRSVDOUT_out : std_logic_vector(15 downto 0);
  signal PLLSCANOUT_out : std_logic_vector(7 downto 0);
  signal RCALCMP_out : std_ulogic;
  signal RCALOUT_out : std_logic_vector(4 downto 0);
  signal REFCLK2BUFG_out : std_ulogic;
  signal REFCLKPDB_SA_out : std_ulogic;
  signal RXRECCLK0_out : std_ulogic;
  signal RXRECCLK1_out : std_ulogic;
  
  signal BGBYPASSB_in : std_ulogic;
  signal BGMONITORENB_in : std_ulogic;
  signal BGPDB_in : std_ulogic;
  signal BGRCALOVRDENB_in : std_ulogic;
  signal BGRCALOVRD_in : std_logic_vector(4 downto 0);
  signal CH0_AXISEN_in : std_ulogic;
  signal CH0_AXISRST_in : std_ulogic;
  signal CH0_AXISTRDY_in : std_ulogic;
  signal CH0_BSRSERIAL_in : std_ulogic;
  signal CH0_CFGRESET_in : std_ulogic;
  signal CH0_DMONFIFORESET_in : std_ulogic;
  signal CH0_DMONITORCLK_in : std_ulogic;
  signal CH0_GTMRXN_in : std_ulogic;
  signal CH0_GTMRXP_in : std_ulogic;
  signal CH0_GTRXRESET_in : std_ulogic;
  signal CH0_GTTXRESET_in : std_ulogic;
  signal CH0_LOOPBACK_in : std_logic_vector(2 downto 0);
  signal CH0_PCSRSVDIN_in : std_logic_vector(15 downto 0);
  signal CH0_PCSSCANCLK_in : std_logic_vector(1 downto 0);
  signal CH0_PCSSCANENB_in : std_ulogic;
  signal CH0_PCSSCANIN_in : std_logic_vector(14 downto 0);
  signal CH0_PCSSCANMODEB_in : std_ulogic;
  signal CH0_PCSSCANRSTB_in : std_ulogic;
  signal CH0_PCSSCANRSTEN_in : std_ulogic;
  signal CH0_PMARSVDIN_in : std_logic_vector(15 downto 0);
  signal CH0_PMASCANCLK_in : std_logic_vector(8 downto 0);
  signal CH0_PMASCANENB_in : std_ulogic;
  signal CH0_PMASCANIN_in : std_logic_vector(24 downto 0);
  signal CH0_PMASCANMODEB_in : std_ulogic;
  signal CH0_PMASCANRSTEN_in : std_ulogic;
  signal CH0_RESETOVRD_in : std_ulogic;
  signal CH0_RXADAPTRESET_in : std_ulogic;
  signal CH0_RXADCCALRESET_in : std_ulogic;
  signal CH0_RXADCCLKGENRESET_in : std_ulogic;
  signal CH0_RXBUFRESET_in : std_ulogic;
  signal CH0_RXCDRFREQOS_in : std_ulogic;
  signal CH0_RXCDRFRRESET_in : std_ulogic;
  signal CH0_RXCDRHOLD_in : std_ulogic;
  signal CH0_RXCDRINCPCTRL_in : std_ulogic;
  signal CH0_RXCDROVRDEN_in : std_ulogic;
  signal CH0_RXCDRPHRESET_in : std_ulogic;
  signal CH0_RXDFERESET_in : std_ulogic;
  signal CH0_RXDSPRESET_in : std_ulogic;
  signal CH0_RXEQTRAINING_in : std_ulogic;
  signal CH0_RXEYESCANRESET_in : std_ulogic;
  signal CH0_RXFECRESET_in : std_ulogic;
  signal CH0_RXOUTCLKSEL_in : std_logic_vector(2 downto 0);
  signal CH0_RXPCSRESETMASK_in : std_logic_vector(3 downto 0);
  signal CH0_RXPCSRESET_in : std_ulogic;
  signal CH0_RXPMARESETMASK_in : std_logic_vector(7 downto 0);
  signal CH0_RXPMARESET_in : std_ulogic;
  signal CH0_RXPOLARITY_in : std_ulogic;
  signal CH0_RXPRBSCNTSTOP_in : std_ulogic;
  signal CH0_RXPRBSCSCNTRST_in : std_ulogic;
  signal CH0_RXPRBSPTN_in : std_logic_vector(3 downto 0);
  signal CH0_RXPROGDIVRESET_in : std_ulogic;
  signal CH0_RXQPRBSEN_in : std_ulogic;
  signal CH0_RXRESETMODE_in : std_logic_vector(1 downto 0);
  signal CH0_RXSPCSEQADV_in : std_ulogic;
  signal CH0_RXUSRCLK2_in : std_ulogic;
  signal CH0_RXUSRCLK_in : std_ulogic;
  signal CH0_RXUSRRDY_in : std_ulogic;
  signal CH0_RXUSRSTART_in : std_ulogic;
  signal CH0_RXUSRSTOP_in : std_ulogic;
  signal CH0_TSTCLK0_in : std_ulogic;
  signal CH0_TSTCLK1_in : std_ulogic;
  signal CH0_TXCKALRESET_in : std_ulogic;
  signal CH0_TXCTLFIRDAT_in : std_logic_vector(5 downto 0);
  signal CH0_TXDATASTART_in : std_ulogic;
  signal CH0_TXDATA_in : std_logic_vector(255 downto 0);
  signal CH0_TXDRVAMP_in : std_logic_vector(4 downto 0);
  signal CH0_TXEMPMAIN_in : std_logic_vector(5 downto 0);
  signal CH0_TXEMPPOST_in : std_logic_vector(4 downto 0);
  signal CH0_TXEMPPRE2_in : std_logic_vector(3 downto 0);
  signal CH0_TXEMPPRE_in : std_logic_vector(4 downto 0);
  signal CH0_TXFECRESET_in : std_ulogic;
  signal CH0_TXINHIBIT_in : std_ulogic;
  signal CH0_TXMUXDCDEXHOLD_in : std_ulogic;
  signal CH0_TXMUXDCDORWREN_in : std_ulogic;
  signal CH0_TXOUTCLKSEL_in : std_logic_vector(2 downto 0);
  signal CH0_TXPCSRESETMASK_in : std_logic_vector(1 downto 0);
  signal CH0_TXPCSRESET_in : std_ulogic;
  signal CH0_TXPMARESETMASK_in : std_logic_vector(1 downto 0);
  signal CH0_TXPMARESET_in : std_ulogic;
  signal CH0_TXPOLARITY_in : std_ulogic;
  signal CH0_TXPRBSINERR_in : std_ulogic;
  signal CH0_TXPRBSPTN_in : std_logic_vector(3 downto 0);
  signal CH0_TXPROGDIVRESET_in : std_ulogic;
  signal CH0_TXQPRBSEN_in : std_ulogic;
  signal CH0_TXRESETMODE_in : std_logic_vector(1 downto 0);
  signal CH0_TXSPCSEQADV_in : std_ulogic;
  signal CH0_TXUSRCLK2_in : std_ulogic;
  signal CH0_TXUSRCLK_in : std_ulogic;
  signal CH0_TXUSRRDY_in : std_ulogic;
  signal CH1_AXISEN_in : std_ulogic;
  signal CH1_AXISRST_in : std_ulogic;
  signal CH1_AXISTRDY_in : std_ulogic;
  signal CH1_BSRSERIAL_in : std_ulogic;
  signal CH1_CFGRESET_in : std_ulogic;
  signal CH1_DMONFIFORESET_in : std_ulogic;
  signal CH1_DMONITORCLK_in : std_ulogic;
  signal CH1_GTMRXN_in : std_ulogic;
  signal CH1_GTMRXP_in : std_ulogic;
  signal CH1_GTRXRESET_in : std_ulogic;
  signal CH1_GTTXRESET_in : std_ulogic;
  signal CH1_LOOPBACK_in : std_logic_vector(2 downto 0);
  signal CH1_PCSRSVDIN_in : std_logic_vector(15 downto 0);
  signal CH1_PCSSCANCLK_in : std_logic_vector(1 downto 0);
  signal CH1_PCSSCANENB_in : std_ulogic;
  signal CH1_PCSSCANIN_in : std_logic_vector(14 downto 0);
  signal CH1_PCSSCANMODEB_in : std_ulogic;
  signal CH1_PCSSCANRSTB_in : std_ulogic;
  signal CH1_PCSSCANRSTEN_in : std_ulogic;
  signal CH1_PMARSVDIN_in : std_logic_vector(15 downto 0);
  signal CH1_PMASCANCLK_in : std_logic_vector(8 downto 0);
  signal CH1_PMASCANENB_in : std_ulogic;
  signal CH1_PMASCANIN_in : std_logic_vector(24 downto 0);
  signal CH1_PMASCANMODEB_in : std_ulogic;
  signal CH1_PMASCANRSTEN_in : std_ulogic;
  signal CH1_RESETOVRD_in : std_ulogic;
  signal CH1_RXADAPTRESET_in : std_ulogic;
  signal CH1_RXADCCALRESET_in : std_ulogic;
  signal CH1_RXADCCLKGENRESET_in : std_ulogic;
  signal CH1_RXBUFRESET_in : std_ulogic;
  signal CH1_RXCDRFREQOS_in : std_ulogic;
  signal CH1_RXCDRFRRESET_in : std_ulogic;
  signal CH1_RXCDRHOLD_in : std_ulogic;
  signal CH1_RXCDRINCPCTRL_in : std_ulogic;
  signal CH1_RXCDROVRDEN_in : std_ulogic;
  signal CH1_RXCDRPHRESET_in : std_ulogic;
  signal CH1_RXDFERESET_in : std_ulogic;
  signal CH1_RXDSPRESET_in : std_ulogic;
  signal CH1_RXEQTRAINING_in : std_ulogic;
  signal CH1_RXEYESCANRESET_in : std_ulogic;
  signal CH1_RXFECRESET_in : std_ulogic;
  signal CH1_RXOUTCLKSEL_in : std_logic_vector(2 downto 0);
  signal CH1_RXPCSRESETMASK_in : std_logic_vector(3 downto 0);
  signal CH1_RXPCSRESET_in : std_ulogic;
  signal CH1_RXPMARESETMASK_in : std_logic_vector(7 downto 0);
  signal CH1_RXPMARESET_in : std_ulogic;
  signal CH1_RXPOLARITY_in : std_ulogic;
  signal CH1_RXPRBSCNTSTOP_in : std_ulogic;
  signal CH1_RXPRBSCSCNTRST_in : std_ulogic;
  signal CH1_RXPRBSPTN_in : std_logic_vector(3 downto 0);
  signal CH1_RXPROGDIVRESET_in : std_ulogic;
  signal CH1_RXQPRBSEN_in : std_ulogic;
  signal CH1_RXRESETMODE_in : std_logic_vector(1 downto 0);
  signal CH1_RXSPCSEQADV_in : std_ulogic;
  signal CH1_RXUSRCLK2_in : std_ulogic;
  signal CH1_RXUSRCLK_in : std_ulogic;
  signal CH1_RXUSRRDY_in : std_ulogic;
  signal CH1_RXUSRSTART_in : std_ulogic;
  signal CH1_RXUSRSTOP_in : std_ulogic;
  signal CH1_TSTCLK0_in : std_ulogic;
  signal CH1_TSTCLK1_in : std_ulogic;
  signal CH1_TXCKALRESET_in : std_ulogic;
  signal CH1_TXCTLFIRDAT_in : std_logic_vector(5 downto 0);
  signal CH1_TXDATASTART_in : std_ulogic;
  signal CH1_TXDATA_in : std_logic_vector(255 downto 0);
  signal CH1_TXDRVAMP_in : std_logic_vector(4 downto 0);
  signal CH1_TXEMPMAIN_in : std_logic_vector(5 downto 0);
  signal CH1_TXEMPPOST_in : std_logic_vector(4 downto 0);
  signal CH1_TXEMPPRE2_in : std_logic_vector(3 downto 0);
  signal CH1_TXEMPPRE_in : std_logic_vector(4 downto 0);
  signal CH1_TXFECRESET_in : std_ulogic;
  signal CH1_TXINHIBIT_in : std_ulogic;
  signal CH1_TXMUXDCDEXHOLD_in : std_ulogic;
  signal CH1_TXMUXDCDORWREN_in : std_ulogic;
  signal CH1_TXOUTCLKSEL_in : std_logic_vector(2 downto 0);
  signal CH1_TXPCSRESETMASK_in : std_logic_vector(1 downto 0);
  signal CH1_TXPCSRESET_in : std_ulogic;
  signal CH1_TXPMARESETMASK_in : std_logic_vector(1 downto 0);
  signal CH1_TXPMARESET_in : std_ulogic;
  signal CH1_TXPOLARITY_in : std_ulogic;
  signal CH1_TXPRBSINERR_in : std_ulogic;
  signal CH1_TXPRBSPTN_in : std_logic_vector(3 downto 0);
  signal CH1_TXPROGDIVRESET_in : std_ulogic;
  signal CH1_TXQPRBSEN_in : std_ulogic;
  signal CH1_TXRESETMODE_in : std_logic_vector(1 downto 0);
  signal CH1_TXSPCSEQADV_in : std_ulogic;
  signal CH1_TXUSRCLK2_in : std_ulogic;
  signal CH1_TXUSRCLK_in : std_ulogic;
  signal CH1_TXUSRRDY_in : std_ulogic;
  signal CLKTESTSIG_in : std_ulogic;
  signal DRPADDR_in : std_logic_vector(10 downto 0);
  signal DRPCLK_in : std_ulogic;
  signal DRPDI_in : std_logic_vector(15 downto 0);
  signal DRPEN_in : std_ulogic;
  signal DRPRST_in : std_ulogic;
  signal DRPWE_in : std_ulogic;
  signal FECCTRLRX0BITSLIPFS_in : std_ulogic;
  signal FECCTRLRX1BITSLIPFS_in : std_ulogic;
  signal FECSCANCLK_in : std_ulogic;
  signal FECSCANENB_in : std_ulogic;
  signal FECSCANIN_in : std_logic_vector(199 downto 0);
  signal FECSCANMODEB_in : std_ulogic;
  signal FECSCANRSTB_in : std_ulogic;
  signal GTGREFCLK2PLL_in : std_ulogic;
  signal GTNORTHREFCLK_in : std_ulogic;
  signal GTREFCLKPD_in : std_ulogic;
  signal GTREFCLK_in : std_ulogic;
  signal GTSOUTHREFCLK_in : std_ulogic;
  signal PLLFBDIV_in : std_logic_vector(7 downto 0);
  signal PLLMONCLK_in : std_ulogic;
  signal PLLPD_in : std_ulogic;
  signal PLLREFCLKSEL_in : std_logic_vector(2 downto 0);
  signal PLLRESETBYPASSMODE_in : std_ulogic;
  signal PLLRESETMASK_in : std_logic_vector(1 downto 0);
  signal PLLRESET_in : std_ulogic;
  signal PLLRSVDIN_in : std_logic_vector(15 downto 0);
  signal PLLSCANCLK_in : std_logic_vector(3 downto 0);
  signal PLLSCANENB_in : std_ulogic;
  signal PLLSCANIN_in : std_logic_vector(7 downto 0);
  signal PLLSCANMODEB_in : std_ulogic;
  signal PLLSCANRSTEN_in : std_ulogic;
  signal RCALENB_in : std_ulogic;
  signal RCALSEL_in : std_logic_vector(1 downto 0);
  signal REFCLK2HROW_in : std_ulogic;
  signal SDMDATA_in : std_logic_vector(25 downto 0);
  signal SDMTOGGLE_in : std_ulogic;
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  CH0_AXISTDATA <= CH0_AXISTDATA_out;
  CH0_AXISTLAST <= CH0_AXISTLAST_out;
  CH0_AXISTVALID <= CH0_AXISTVALID_out;
  CH0_DMONITOROUT <= CH0_DMONITOROUT_out;
  CH0_DMONITOROUTCLK <= CH0_DMONITOROUTCLK_out;
  CH0_GTMTXN <= CH0_GTMTXN_out;
  CH0_GTMTXP <= CH0_GTMTXP_out;
  CH0_PCSRSVDOUT <= CH0_PCSRSVDOUT_out;
  CH0_PMARSVDOUT <= CH0_PMARSVDOUT_out;
  CH0_RESETEXCEPTION <= CH0_RESETEXCEPTION_out;
  CH0_RXBUFSTATUS <= CH0_RXBUFSTATUS_out;
  CH0_RXDATA <= CH0_RXDATA_out;
  CH0_RXDATAFLAGS <= CH0_RXDATAFLAGS_out;
  CH0_RXDATAISAM <= CH0_RXDATAISAM_out;
  CH0_RXDATASTART <= CH0_RXDATASTART_out;
  CH0_RXOUTCLK <= CH0_RXOUTCLK_out;
  CH0_RXPMARESETDONE <= CH0_RXPMARESETDONE_out;
  CH0_RXPRBSERR <= CH0_RXPRBSERR_out;
  CH0_RXPRBSLOCKED <= CH0_RXPRBSLOCKED_out;
  CH0_RXPRGDIVRESETDONE <= CH0_RXPRGDIVRESETDONE_out;
  CH0_RXPROGDIVCLK <= CH0_RXPROGDIVCLK_out;
  CH0_RXRESETDONE <= CH0_RXRESETDONE_out;
  CH0_TXBUFSTATUS <= CH0_TXBUFSTATUS_out;
  CH0_TXOUTCLK <= CH0_TXOUTCLK_out;
  CH0_TXPMARESETDONE <= CH0_TXPMARESETDONE_out;
  CH0_TXPRGDIVRESETDONE <= CH0_TXPRGDIVRESETDONE_out;
  CH0_TXPROGDIVCLK <= CH0_TXPROGDIVCLK_out;
  CH0_TXRESETDONE <= CH0_TXRESETDONE_out;
  CH1_AXISTDATA <= CH1_AXISTDATA_out;
  CH1_AXISTLAST <= CH1_AXISTLAST_out;
  CH1_AXISTVALID <= CH1_AXISTVALID_out;
  CH1_DMONITOROUT <= CH1_DMONITOROUT_out;
  CH1_DMONITOROUTCLK <= CH1_DMONITOROUTCLK_out;
  CH1_GTMTXN <= CH1_GTMTXN_out;
  CH1_GTMTXP <= CH1_GTMTXP_out;
  CH1_PCSRSVDOUT <= CH1_PCSRSVDOUT_out;
  CH1_PMARSVDOUT <= CH1_PMARSVDOUT_out;
  CH1_RESETEXCEPTION <= CH1_RESETEXCEPTION_out;
  CH1_RXBUFSTATUS <= CH1_RXBUFSTATUS_out;
  CH1_RXDATA <= CH1_RXDATA_out;
  CH1_RXDATAFLAGS <= CH1_RXDATAFLAGS_out;
  CH1_RXDATAISAM <= CH1_RXDATAISAM_out;
  CH1_RXDATASTART <= CH1_RXDATASTART_out;
  CH1_RXOUTCLK <= CH1_RXOUTCLK_out;
  CH1_RXPMARESETDONE <= CH1_RXPMARESETDONE_out;
  CH1_RXPRBSERR <= CH1_RXPRBSERR_out;
  CH1_RXPRBSLOCKED <= CH1_RXPRBSLOCKED_out;
  CH1_RXPRGDIVRESETDONE <= CH1_RXPRGDIVRESETDONE_out;
  CH1_RXPROGDIVCLK <= CH1_RXPROGDIVCLK_out;
  CH1_RXRESETDONE <= CH1_RXRESETDONE_out;
  CH1_TXBUFSTATUS <= CH1_TXBUFSTATUS_out;
  CH1_TXOUTCLK <= CH1_TXOUTCLK_out;
  CH1_TXPMARESETDONE <= CH1_TXPMARESETDONE_out;
  CH1_TXPRGDIVRESETDONE <= CH1_TXPRGDIVRESETDONE_out;
  CH1_TXPROGDIVCLK <= CH1_TXPROGDIVCLK_out;
  CH1_TXRESETDONE <= CH1_TXRESETDONE_out;
  CLKTESTSIG2PAD <= CLKTESTSIG2PAD_out;
  DMONITOROUTPLLCLK <= DMONITOROUTPLLCLK_out;
  DRPDO <= DRPDO_out;
  DRPRDY <= DRPRDY_out;
  FECRX0ALIGNED <= FECRX0ALIGNED_out;
  FECRX0CORRCWINC <= FECRX0CORRCWINC_out;
  FECRX0CWINC <= FECRX0CWINC_out;
  FECRX0UNCORRCWINC <= FECRX0UNCORRCWINC_out;
  FECRX1ALIGNED <= FECRX1ALIGNED_out;
  FECRX1CORRCWINC <= FECRX1CORRCWINC_out;
  FECRX1CWINC <= FECRX1CWINC_out;
  FECRX1UNCORRCWINC <= FECRX1UNCORRCWINC_out;
  FECRXLN0BITERR0TO1INC <= FECRXLN0BITERR0TO1INC_out;
  FECRXLN0BITERR1TO0INC <= FECRXLN0BITERR1TO0INC_out;
  FECRXLN0DLY <= FECRXLN0DLY_out;
  FECRXLN0ERRCNTINC <= FECRXLN0ERRCNTINC_out;
  FECRXLN0MAPPING <= FECRXLN0MAPPING_out;
  FECRXLN1BITERR0TO1INC <= FECRXLN1BITERR0TO1INC_out;
  FECRXLN1BITERR1TO0INC <= FECRXLN1BITERR1TO0INC_out;
  FECRXLN1DLY <= FECRXLN1DLY_out;
  FECRXLN1ERRCNTINC <= FECRXLN1ERRCNTINC_out;
  FECRXLN1MAPPING <= FECRXLN1MAPPING_out;
  FECRXLN2BITERR0TO1INC <= FECRXLN2BITERR0TO1INC_out;
  FECRXLN2BITERR1TO0INC <= FECRXLN2BITERR1TO0INC_out;
  FECRXLN2DLY <= FECRXLN2DLY_out;
  FECRXLN2ERRCNTINC <= FECRXLN2ERRCNTINC_out;
  FECRXLN2MAPPING <= FECRXLN2MAPPING_out;
  FECRXLN3BITERR0TO1INC <= FECRXLN3BITERR0TO1INC_out;
  FECRXLN3BITERR1TO0INC <= FECRXLN3BITERR1TO0INC_out;
  FECRXLN3DLY <= FECRXLN3DLY_out;
  FECRXLN3ERRCNTINC <= FECRXLN3ERRCNTINC_out;
  FECRXLN3MAPPING <= FECRXLN3MAPPING_out;
  FECTRXLN0LOCK <= FECTRXLN0LOCK_out;
  FECTRXLN1LOCK <= FECTRXLN1LOCK_out;
  FECTRXLN2LOCK <= FECTRXLN2LOCK_out;
  FECTRXLN3LOCK <= FECTRXLN3LOCK_out;
  GTPOWERGOOD <= GTPOWERGOOD_out;
  PLLFBCLKLOST <= PLLFBCLKLOST_out;
  PLLLOCK <= PLLLOCK_out;
  PLLREFCLKLOST <= PLLREFCLKLOST_out;
  PLLREFCLKMONITOR <= PLLREFCLKMONITOR_out;
  PLLRESETDONE <= PLLRESETDONE_out;
  PLLRSVDOUT <= PLLRSVDOUT_out;
  RCALCMP <= RCALCMP_out;
  RCALOUT <= RCALOUT_out;
  RXRECCLK0 <= RXRECCLK0_out;
  RXRECCLK1 <= RXRECCLK1_out;
  
  BGBYPASSB_in <= BGBYPASSB;
  BGMONITORENB_in <= BGMONITORENB;
  BGPDB_in <= BGPDB;
  BGRCALOVRDENB_in <= '1' when (BGRCALOVRDENB = 'U') else BGRCALOVRDENB; -- rv 1
  BGRCALOVRD_in <= BGRCALOVRD;
  CH0_AXISEN_in <= '0' when (CH0_AXISEN = 'U') else CH0_AXISEN; -- rv 0
  CH0_AXISRST_in <= '0' when (CH0_AXISRST = 'U') else CH0_AXISRST; -- rv 0
  CH0_AXISTRDY_in <= '0' when (CH0_AXISTRDY = 'U') else CH0_AXISTRDY; -- rv 0
  CH0_CFGRESET_in <= '0' when (CH0_CFGRESET = 'U') else CH0_CFGRESET; -- rv 0
  CH0_DMONFIFORESET_in <= '0' when (CH0_DMONFIFORESET = 'U') else CH0_DMONFIFORESET; -- rv 0
  CH0_DMONITORCLK_in <= '0' when (CH0_DMONITORCLK = 'U') else CH0_DMONITORCLK; -- rv 0
  CH0_GTMRXN_in <= CH0_GTMRXN;
  CH0_GTMRXP_in <= CH0_GTMRXP;
  CH0_GTRXRESET_in <= '0' when (CH0_GTRXRESET = 'U') else CH0_GTRXRESET; -- rv 0
  CH0_GTTXRESET_in <= '0' when (CH0_GTTXRESET = 'U') else CH0_GTTXRESET; -- rv 0
  CH0_LOOPBACK_in(0) <= '0' when (CH0_LOOPBACK(0) = 'U') else CH0_LOOPBACK(0); -- rv 0
  CH0_LOOPBACK_in(1) <= '0' when (CH0_LOOPBACK(1) = 'U') else CH0_LOOPBACK(1); -- rv 0
  CH0_LOOPBACK_in(2) <= '0' when (CH0_LOOPBACK(2) = 'U') else CH0_LOOPBACK(2); -- rv 0
  CH0_PCSRSVDIN_in(0) <= '0' when (CH0_PCSRSVDIN(0) = 'U') else CH0_PCSRSVDIN(0); -- rv 0
  CH0_PCSRSVDIN_in(1) <= '0' when (CH0_PCSRSVDIN(1) = 'U') else CH0_PCSRSVDIN(1); -- rv 0
  CH0_PCSRSVDIN_in(10) <= '0' when (CH0_PCSRSVDIN(10) = 'U') else CH0_PCSRSVDIN(10); -- rv 0
  CH0_PCSRSVDIN_in(11) <= '0' when (CH0_PCSRSVDIN(11) = 'U') else CH0_PCSRSVDIN(11); -- rv 0
  CH0_PCSRSVDIN_in(12) <= '0' when (CH0_PCSRSVDIN(12) = 'U') else CH0_PCSRSVDIN(12); -- rv 0
  CH0_PCSRSVDIN_in(13) <= '0' when (CH0_PCSRSVDIN(13) = 'U') else CH0_PCSRSVDIN(13); -- rv 0
  CH0_PCSRSVDIN_in(14) <= '0' when (CH0_PCSRSVDIN(14) = 'U') else CH0_PCSRSVDIN(14); -- rv 0
  CH0_PCSRSVDIN_in(15) <= '0' when (CH0_PCSRSVDIN(15) = 'U') else CH0_PCSRSVDIN(15); -- rv 0
  CH0_PCSRSVDIN_in(2) <= '0' when (CH0_PCSRSVDIN(2) = 'U') else CH0_PCSRSVDIN(2); -- rv 0
  CH0_PCSRSVDIN_in(3) <= '0' when (CH0_PCSRSVDIN(3) = 'U') else CH0_PCSRSVDIN(3); -- rv 0
  CH0_PCSRSVDIN_in(4) <= '0' when (CH0_PCSRSVDIN(4) = 'U') else CH0_PCSRSVDIN(4); -- rv 0
  CH0_PCSRSVDIN_in(5) <= '0' when (CH0_PCSRSVDIN(5) = 'U') else CH0_PCSRSVDIN(5); -- rv 0
  CH0_PCSRSVDIN_in(6) <= '0' when (CH0_PCSRSVDIN(6) = 'U') else CH0_PCSRSVDIN(6); -- rv 0
  CH0_PCSRSVDIN_in(7) <= '0' when (CH0_PCSRSVDIN(7) = 'U') else CH0_PCSRSVDIN(7); -- rv 0
  CH0_PCSRSVDIN_in(8) <= '0' when (CH0_PCSRSVDIN(8) = 'U') else CH0_PCSRSVDIN(8); -- rv 0
  CH0_PCSRSVDIN_in(9) <= '0' when (CH0_PCSRSVDIN(9) = 'U') else CH0_PCSRSVDIN(9); -- rv 0
  CH0_PMARSVDIN_in(0) <= '1' when (CH0_PMARSVDIN(0) = 'U') else CH0_PMARSVDIN(0); -- rv 1
  CH0_PMARSVDIN_in(1) <= '0' when (CH0_PMARSVDIN(1) = 'U') else CH0_PMARSVDIN(1); -- rv 0
  CH0_PMARSVDIN_in(10) <= '0' when (CH0_PMARSVDIN(10) = 'U') else CH0_PMARSVDIN(10); -- rv 0
  CH0_PMARSVDIN_in(11) <= '0' when (CH0_PMARSVDIN(11) = 'U') else CH0_PMARSVDIN(11); -- rv 0
  CH0_PMARSVDIN_in(12) <= '0' when (CH0_PMARSVDIN(12) = 'U') else CH0_PMARSVDIN(12); -- rv 0
  CH0_PMARSVDIN_in(13) <= '0' when (CH0_PMARSVDIN(13) = 'U') else CH0_PMARSVDIN(13); -- rv 0
  CH0_PMARSVDIN_in(14) <= '0' when (CH0_PMARSVDIN(14) = 'U') else CH0_PMARSVDIN(14); -- rv 0
  CH0_PMARSVDIN_in(15) <= '0' when (CH0_PMARSVDIN(15) = 'U') else CH0_PMARSVDIN(15); -- rv 0
  CH0_PMARSVDIN_in(2) <= '0' when (CH0_PMARSVDIN(2) = 'U') else CH0_PMARSVDIN(2); -- rv 0
  CH0_PMARSVDIN_in(3) <= '0' when (CH0_PMARSVDIN(3) = 'U') else CH0_PMARSVDIN(3); -- rv 0
  CH0_PMARSVDIN_in(4) <= '0' when (CH0_PMARSVDIN(4) = 'U') else CH0_PMARSVDIN(4); -- rv 0
  CH0_PMARSVDIN_in(5) <= '0' when (CH0_PMARSVDIN(5) = 'U') else CH0_PMARSVDIN(5); -- rv 0
  CH0_PMARSVDIN_in(6) <= '0' when (CH0_PMARSVDIN(6) = 'U') else CH0_PMARSVDIN(6); -- rv 0
  CH0_PMARSVDIN_in(7) <= '0' when (CH0_PMARSVDIN(7) = 'U') else CH0_PMARSVDIN(7); -- rv 0
  CH0_PMARSVDIN_in(8) <= '0' when (CH0_PMARSVDIN(8) = 'U') else CH0_PMARSVDIN(8); -- rv 0
  CH0_PMARSVDIN_in(9) <= '0' when (CH0_PMARSVDIN(9) = 'U') else CH0_PMARSVDIN(9); -- rv 0
  CH0_RESETOVRD_in <= '0' when (CH0_RESETOVRD = 'U') else CH0_RESETOVRD; -- rv 0
  CH0_RXADAPTRESET_in <= '0' when (CH0_RXADAPTRESET = 'U') else CH0_RXADAPTRESET; -- rv 0
  CH0_RXADCCALRESET_in <= '0' when (CH0_RXADCCALRESET = 'U') else CH0_RXADCCALRESET; -- rv 0
  CH0_RXADCCLKGENRESET_in <= '0' when (CH0_RXADCCLKGENRESET = 'U') else CH0_RXADCCLKGENRESET; -- rv 0
  CH0_RXBUFRESET_in <= '0' when (CH0_RXBUFRESET = 'U') else CH0_RXBUFRESET; -- rv 0
  CH0_RXCDRFREQOS_in <= '0' when (CH0_RXCDRFREQOS = 'U') else CH0_RXCDRFREQOS; -- rv 0
  CH0_RXCDRFRRESET_in <= '0' when (CH0_RXCDRFRRESET = 'U') else CH0_RXCDRFRRESET; -- rv 0
  CH0_RXCDRHOLD_in <= '0' when (CH0_RXCDRHOLD = 'U') else CH0_RXCDRHOLD; -- rv 0
  CH0_RXCDRINCPCTRL_in <= '0' when (CH0_RXCDRINCPCTRL = 'U') else CH0_RXCDRINCPCTRL; -- rv 0
  CH0_RXCDROVRDEN_in <= '0' when (CH0_RXCDROVRDEN = 'U') else CH0_RXCDROVRDEN; -- rv 0
  CH0_RXCDRPHRESET_in <= '0' when (CH0_RXCDRPHRESET = 'U') else CH0_RXCDRPHRESET; -- rv 0
  CH0_RXDFERESET_in <= '0' when (CH0_RXDFERESET = 'U') else CH0_RXDFERESET; -- rv 0
  CH0_RXDSPRESET_in <= '0' when (CH0_RXDSPRESET = 'U') else CH0_RXDSPRESET; -- rv 0
  CH0_RXEQTRAINING_in <= '0' when (CH0_RXEQTRAINING = 'U') else CH0_RXEQTRAINING; -- rv 0
  CH0_RXEYESCANRESET_in <= '0' when (CH0_RXEYESCANRESET = 'U') else CH0_RXEYESCANRESET; -- rv 0
  CH0_RXFECRESET_in <= '0' when (CH0_RXFECRESET = 'U') else CH0_RXFECRESET; -- rv 0
  CH0_RXOUTCLKSEL_in(0) <= '0' when (CH0_RXOUTCLKSEL(0) = 'U') else CH0_RXOUTCLKSEL(0); -- rv 0
  CH0_RXOUTCLKSEL_in(1) <= '0' when (CH0_RXOUTCLKSEL(1) = 'U') else CH0_RXOUTCLKSEL(1); -- rv 0
  CH0_RXOUTCLKSEL_in(2) <= '0' when (CH0_RXOUTCLKSEL(2) = 'U') else CH0_RXOUTCLKSEL(2); -- rv 0
  CH0_RXPCSRESETMASK_in(0) <= '0' when (CH0_RXPCSRESETMASK(0) = 'U') else CH0_RXPCSRESETMASK(0); -- rv 0
  CH0_RXPCSRESETMASK_in(1) <= '0' when (CH0_RXPCSRESETMASK(1) = 'U') else CH0_RXPCSRESETMASK(1); -- rv 0
  CH0_RXPCSRESETMASK_in(2) <= '0' when (CH0_RXPCSRESETMASK(2) = 'U') else CH0_RXPCSRESETMASK(2); -- rv 0
  CH0_RXPCSRESETMASK_in(3) <= '0' when (CH0_RXPCSRESETMASK(3) = 'U') else CH0_RXPCSRESETMASK(3); -- rv 0
  CH0_RXPCSRESET_in <= '0' when (CH0_RXPCSRESET = 'U') else CH0_RXPCSRESET; -- rv 0
  CH0_RXPMARESETMASK_in(0) <= '0' when (CH0_RXPMARESETMASK(0) = 'U') else CH0_RXPMARESETMASK(0); -- rv 0
  CH0_RXPMARESETMASK_in(1) <= '0' when (CH0_RXPMARESETMASK(1) = 'U') else CH0_RXPMARESETMASK(1); -- rv 0
  CH0_RXPMARESETMASK_in(2) <= '0' when (CH0_RXPMARESETMASK(2) = 'U') else CH0_RXPMARESETMASK(2); -- rv 0
  CH0_RXPMARESETMASK_in(3) <= '0' when (CH0_RXPMARESETMASK(3) = 'U') else CH0_RXPMARESETMASK(3); -- rv 0
  CH0_RXPMARESETMASK_in(4) <= '0' when (CH0_RXPMARESETMASK(4) = 'U') else CH0_RXPMARESETMASK(4); -- rv 0
  CH0_RXPMARESETMASK_in(5) <= '0' when (CH0_RXPMARESETMASK(5) = 'U') else CH0_RXPMARESETMASK(5); -- rv 0
  CH0_RXPMARESETMASK_in(6) <= '0' when (CH0_RXPMARESETMASK(6) = 'U') else CH0_RXPMARESETMASK(6); -- rv 0
  CH0_RXPMARESETMASK_in(7) <= '0' when (CH0_RXPMARESETMASK(7) = 'U') else CH0_RXPMARESETMASK(7); -- rv 0
  CH0_RXPMARESET_in <= '0' when (CH0_RXPMARESET = 'U') else CH0_RXPMARESET; -- rv 0
  CH0_RXPOLARITY_in <= '0' when (CH0_RXPOLARITY = 'U') else CH0_RXPOLARITY; -- rv 0
  CH0_RXPRBSCNTSTOP_in <= '0' when (CH0_RXPRBSCNTSTOP = 'U') else CH0_RXPRBSCNTSTOP; -- rv 0
  CH0_RXPRBSCSCNTRST_in <= '0' when (CH0_RXPRBSCSCNTRST = 'U') else CH0_RXPRBSCSCNTRST; -- rv 0
  CH0_RXPRBSPTN_in(0) <= '0' when (CH0_RXPRBSPTN(0) = 'U') else CH0_RXPRBSPTN(0); -- rv 0
  CH0_RXPRBSPTN_in(1) <= '0' when (CH0_RXPRBSPTN(1) = 'U') else CH0_RXPRBSPTN(1); -- rv 0
  CH0_RXPRBSPTN_in(2) <= '0' when (CH0_RXPRBSPTN(2) = 'U') else CH0_RXPRBSPTN(2); -- rv 0
  CH0_RXPRBSPTN_in(3) <= '0' when (CH0_RXPRBSPTN(3) = 'U') else CH0_RXPRBSPTN(3); -- rv 0
  CH0_RXPROGDIVRESET_in <= '0' when (CH0_RXPROGDIVRESET = 'U') else CH0_RXPROGDIVRESET; -- rv 0
  CH0_RXQPRBSEN_in <= '0' when (CH0_RXQPRBSEN = 'U') else CH0_RXQPRBSEN; -- rv 0
  CH0_RXRESETMODE_in(0) <= '0' when (CH0_RXRESETMODE(0) = 'U') else CH0_RXRESETMODE(0); -- rv 0
  CH0_RXRESETMODE_in(1) <= '0' when (CH0_RXRESETMODE(1) = 'U') else CH0_RXRESETMODE(1); -- rv 0
  CH0_RXSPCSEQADV_in <= '0' when (CH0_RXSPCSEQADV = 'U') else CH0_RXSPCSEQADV; -- rv 0
  CH0_RXUSRCLK2_in <= '0' when (CH0_RXUSRCLK2 = 'U') else CH0_RXUSRCLK2; -- rv 0
  CH0_RXUSRCLK_in <= '0' when (CH0_RXUSRCLK = 'U') else CH0_RXUSRCLK; -- rv 0
  CH0_RXUSRRDY_in <= '0' when (CH0_RXUSRRDY = 'U') else CH0_RXUSRRDY; -- rv 0
  CH0_RXUSRSTART_in <= '0' when (CH0_RXUSRSTART = 'U') else CH0_RXUSRSTART; -- rv 0
  CH0_RXUSRSTOP_in <= '0' when (CH0_RXUSRSTOP = 'U') else CH0_RXUSRSTOP; -- rv 0
  CH0_TXCKALRESET_in <= '0' when (CH0_TXCKALRESET = 'U') else CH0_TXCKALRESET; -- rv 0
  CH0_TXCTLFIRDAT_in(0) <= '0' when (CH0_TXCTLFIRDAT(0) = 'U') else CH0_TXCTLFIRDAT(0); -- rv 0
  CH0_TXCTLFIRDAT_in(1) <= '0' when (CH0_TXCTLFIRDAT(1) = 'U') else CH0_TXCTLFIRDAT(1); -- rv 0
  CH0_TXCTLFIRDAT_in(2) <= '0' when (CH0_TXCTLFIRDAT(2) = 'U') else CH0_TXCTLFIRDAT(2); -- rv 0
  CH0_TXCTLFIRDAT_in(3) <= '0' when (CH0_TXCTLFIRDAT(3) = 'U') else CH0_TXCTLFIRDAT(3); -- rv 0
  CH0_TXCTLFIRDAT_in(4) <= '0' when (CH0_TXCTLFIRDAT(4) = 'U') else CH0_TXCTLFIRDAT(4); -- rv 0
  CH0_TXCTLFIRDAT_in(5) <= '0' when (CH0_TXCTLFIRDAT(5) = 'U') else CH0_TXCTLFIRDAT(5); -- rv 0
  CH0_TXDATASTART_in <= '0' when (CH0_TXDATASTART = 'U') else CH0_TXDATASTART; -- rv 0
  CH0_TXDATA_in(0) <= '0' when (CH0_TXDATA(0) = 'U') else CH0_TXDATA(0); -- rv 0
  CH0_TXDATA_in(1) <= '0' when (CH0_TXDATA(1) = 'U') else CH0_TXDATA(1); -- rv 0
  CH0_TXDATA_in(10) <= '0' when (CH0_TXDATA(10) = 'U') else CH0_TXDATA(10); -- rv 0
  CH0_TXDATA_in(100) <= '0' when (CH0_TXDATA(100) = 'U') else CH0_TXDATA(100); -- rv 0
  CH0_TXDATA_in(101) <= '0' when (CH0_TXDATA(101) = 'U') else CH0_TXDATA(101); -- rv 0
  CH0_TXDATA_in(102) <= '0' when (CH0_TXDATA(102) = 'U') else CH0_TXDATA(102); -- rv 0
  CH0_TXDATA_in(103) <= '0' when (CH0_TXDATA(103) = 'U') else CH0_TXDATA(103); -- rv 0
  CH0_TXDATA_in(104) <= '0' when (CH0_TXDATA(104) = 'U') else CH0_TXDATA(104); -- rv 0
  CH0_TXDATA_in(105) <= '0' when (CH0_TXDATA(105) = 'U') else CH0_TXDATA(105); -- rv 0
  CH0_TXDATA_in(106) <= '0' when (CH0_TXDATA(106) = 'U') else CH0_TXDATA(106); -- rv 0
  CH0_TXDATA_in(107) <= '0' when (CH0_TXDATA(107) = 'U') else CH0_TXDATA(107); -- rv 0
  CH0_TXDATA_in(108) <= '0' when (CH0_TXDATA(108) = 'U') else CH0_TXDATA(108); -- rv 0
  CH0_TXDATA_in(109) <= '0' when (CH0_TXDATA(109) = 'U') else CH0_TXDATA(109); -- rv 0
  CH0_TXDATA_in(11) <= '0' when (CH0_TXDATA(11) = 'U') else CH0_TXDATA(11); -- rv 0
  CH0_TXDATA_in(110) <= '0' when (CH0_TXDATA(110) = 'U') else CH0_TXDATA(110); -- rv 0
  CH0_TXDATA_in(111) <= '0' when (CH0_TXDATA(111) = 'U') else CH0_TXDATA(111); -- rv 0
  CH0_TXDATA_in(112) <= '0' when (CH0_TXDATA(112) = 'U') else CH0_TXDATA(112); -- rv 0
  CH0_TXDATA_in(113) <= '0' when (CH0_TXDATA(113) = 'U') else CH0_TXDATA(113); -- rv 0
  CH0_TXDATA_in(114) <= '0' when (CH0_TXDATA(114) = 'U') else CH0_TXDATA(114); -- rv 0
  CH0_TXDATA_in(115) <= '0' when (CH0_TXDATA(115) = 'U') else CH0_TXDATA(115); -- rv 0
  CH0_TXDATA_in(116) <= '0' when (CH0_TXDATA(116) = 'U') else CH0_TXDATA(116); -- rv 0
  CH0_TXDATA_in(117) <= '0' when (CH0_TXDATA(117) = 'U') else CH0_TXDATA(117); -- rv 0
  CH0_TXDATA_in(118) <= '0' when (CH0_TXDATA(118) = 'U') else CH0_TXDATA(118); -- rv 0
  CH0_TXDATA_in(119) <= '0' when (CH0_TXDATA(119) = 'U') else CH0_TXDATA(119); -- rv 0
  CH0_TXDATA_in(12) <= '0' when (CH0_TXDATA(12) = 'U') else CH0_TXDATA(12); -- rv 0
  CH0_TXDATA_in(120) <= '0' when (CH0_TXDATA(120) = 'U') else CH0_TXDATA(120); -- rv 0
  CH0_TXDATA_in(121) <= '0' when (CH0_TXDATA(121) = 'U') else CH0_TXDATA(121); -- rv 0
  CH0_TXDATA_in(122) <= '0' when (CH0_TXDATA(122) = 'U') else CH0_TXDATA(122); -- rv 0
  CH0_TXDATA_in(123) <= '0' when (CH0_TXDATA(123) = 'U') else CH0_TXDATA(123); -- rv 0
  CH0_TXDATA_in(124) <= '0' when (CH0_TXDATA(124) = 'U') else CH0_TXDATA(124); -- rv 0
  CH0_TXDATA_in(125) <= '0' when (CH0_TXDATA(125) = 'U') else CH0_TXDATA(125); -- rv 0
  CH0_TXDATA_in(126) <= '0' when (CH0_TXDATA(126) = 'U') else CH0_TXDATA(126); -- rv 0
  CH0_TXDATA_in(127) <= '0' when (CH0_TXDATA(127) = 'U') else CH0_TXDATA(127); -- rv 0
  CH0_TXDATA_in(128) <= '0' when (CH0_TXDATA(128) = 'U') else CH0_TXDATA(128); -- rv 0
  CH0_TXDATA_in(129) <= '0' when (CH0_TXDATA(129) = 'U') else CH0_TXDATA(129); -- rv 0
  CH0_TXDATA_in(13) <= '0' when (CH0_TXDATA(13) = 'U') else CH0_TXDATA(13); -- rv 0
  CH0_TXDATA_in(130) <= '0' when (CH0_TXDATA(130) = 'U') else CH0_TXDATA(130); -- rv 0
  CH0_TXDATA_in(131) <= '0' when (CH0_TXDATA(131) = 'U') else CH0_TXDATA(131); -- rv 0
  CH0_TXDATA_in(132) <= '0' when (CH0_TXDATA(132) = 'U') else CH0_TXDATA(132); -- rv 0
  CH0_TXDATA_in(133) <= '0' when (CH0_TXDATA(133) = 'U') else CH0_TXDATA(133); -- rv 0
  CH0_TXDATA_in(134) <= '0' when (CH0_TXDATA(134) = 'U') else CH0_TXDATA(134); -- rv 0
  CH0_TXDATA_in(135) <= '0' when (CH0_TXDATA(135) = 'U') else CH0_TXDATA(135); -- rv 0
  CH0_TXDATA_in(136) <= '0' when (CH0_TXDATA(136) = 'U') else CH0_TXDATA(136); -- rv 0
  CH0_TXDATA_in(137) <= '0' when (CH0_TXDATA(137) = 'U') else CH0_TXDATA(137); -- rv 0
  CH0_TXDATA_in(138) <= '0' when (CH0_TXDATA(138) = 'U') else CH0_TXDATA(138); -- rv 0
  CH0_TXDATA_in(139) <= '0' when (CH0_TXDATA(139) = 'U') else CH0_TXDATA(139); -- rv 0
  CH0_TXDATA_in(14) <= '0' when (CH0_TXDATA(14) = 'U') else CH0_TXDATA(14); -- rv 0
  CH0_TXDATA_in(140) <= '0' when (CH0_TXDATA(140) = 'U') else CH0_TXDATA(140); -- rv 0
  CH0_TXDATA_in(141) <= '0' when (CH0_TXDATA(141) = 'U') else CH0_TXDATA(141); -- rv 0
  CH0_TXDATA_in(142) <= '0' when (CH0_TXDATA(142) = 'U') else CH0_TXDATA(142); -- rv 0
  CH0_TXDATA_in(143) <= '0' when (CH0_TXDATA(143) = 'U') else CH0_TXDATA(143); -- rv 0
  CH0_TXDATA_in(144) <= '0' when (CH0_TXDATA(144) = 'U') else CH0_TXDATA(144); -- rv 0
  CH0_TXDATA_in(145) <= '0' when (CH0_TXDATA(145) = 'U') else CH0_TXDATA(145); -- rv 0
  CH0_TXDATA_in(146) <= '0' when (CH0_TXDATA(146) = 'U') else CH0_TXDATA(146); -- rv 0
  CH0_TXDATA_in(147) <= '0' when (CH0_TXDATA(147) = 'U') else CH0_TXDATA(147); -- rv 0
  CH0_TXDATA_in(148) <= '0' when (CH0_TXDATA(148) = 'U') else CH0_TXDATA(148); -- rv 0
  CH0_TXDATA_in(149) <= '0' when (CH0_TXDATA(149) = 'U') else CH0_TXDATA(149); -- rv 0
  CH0_TXDATA_in(15) <= '0' when (CH0_TXDATA(15) = 'U') else CH0_TXDATA(15); -- rv 0
  CH0_TXDATA_in(150) <= '0' when (CH0_TXDATA(150) = 'U') else CH0_TXDATA(150); -- rv 0
  CH0_TXDATA_in(151) <= '0' when (CH0_TXDATA(151) = 'U') else CH0_TXDATA(151); -- rv 0
  CH0_TXDATA_in(152) <= '0' when (CH0_TXDATA(152) = 'U') else CH0_TXDATA(152); -- rv 0
  CH0_TXDATA_in(153) <= '0' when (CH0_TXDATA(153) = 'U') else CH0_TXDATA(153); -- rv 0
  CH0_TXDATA_in(154) <= '0' when (CH0_TXDATA(154) = 'U') else CH0_TXDATA(154); -- rv 0
  CH0_TXDATA_in(155) <= '0' when (CH0_TXDATA(155) = 'U') else CH0_TXDATA(155); -- rv 0
  CH0_TXDATA_in(156) <= '0' when (CH0_TXDATA(156) = 'U') else CH0_TXDATA(156); -- rv 0
  CH0_TXDATA_in(157) <= '0' when (CH0_TXDATA(157) = 'U') else CH0_TXDATA(157); -- rv 0
  CH0_TXDATA_in(158) <= '0' when (CH0_TXDATA(158) = 'U') else CH0_TXDATA(158); -- rv 0
  CH0_TXDATA_in(159) <= '0' when (CH0_TXDATA(159) = 'U') else CH0_TXDATA(159); -- rv 0
  CH0_TXDATA_in(16) <= '0' when (CH0_TXDATA(16) = 'U') else CH0_TXDATA(16); -- rv 0
  CH0_TXDATA_in(160) <= '0' when (CH0_TXDATA(160) = 'U') else CH0_TXDATA(160); -- rv 0
  CH0_TXDATA_in(161) <= '0' when (CH0_TXDATA(161) = 'U') else CH0_TXDATA(161); -- rv 0
  CH0_TXDATA_in(162) <= '0' when (CH0_TXDATA(162) = 'U') else CH0_TXDATA(162); -- rv 0
  CH0_TXDATA_in(163) <= '0' when (CH0_TXDATA(163) = 'U') else CH0_TXDATA(163); -- rv 0
  CH0_TXDATA_in(164) <= '0' when (CH0_TXDATA(164) = 'U') else CH0_TXDATA(164); -- rv 0
  CH0_TXDATA_in(165) <= '0' when (CH0_TXDATA(165) = 'U') else CH0_TXDATA(165); -- rv 0
  CH0_TXDATA_in(166) <= '0' when (CH0_TXDATA(166) = 'U') else CH0_TXDATA(166); -- rv 0
  CH0_TXDATA_in(167) <= '0' when (CH0_TXDATA(167) = 'U') else CH0_TXDATA(167); -- rv 0
  CH0_TXDATA_in(168) <= '0' when (CH0_TXDATA(168) = 'U') else CH0_TXDATA(168); -- rv 0
  CH0_TXDATA_in(169) <= '0' when (CH0_TXDATA(169) = 'U') else CH0_TXDATA(169); -- rv 0
  CH0_TXDATA_in(17) <= '0' when (CH0_TXDATA(17) = 'U') else CH0_TXDATA(17); -- rv 0
  CH0_TXDATA_in(170) <= '0' when (CH0_TXDATA(170) = 'U') else CH0_TXDATA(170); -- rv 0
  CH0_TXDATA_in(171) <= '0' when (CH0_TXDATA(171) = 'U') else CH0_TXDATA(171); -- rv 0
  CH0_TXDATA_in(172) <= '0' when (CH0_TXDATA(172) = 'U') else CH0_TXDATA(172); -- rv 0
  CH0_TXDATA_in(173) <= '0' when (CH0_TXDATA(173) = 'U') else CH0_TXDATA(173); -- rv 0
  CH0_TXDATA_in(174) <= '0' when (CH0_TXDATA(174) = 'U') else CH0_TXDATA(174); -- rv 0
  CH0_TXDATA_in(175) <= '0' when (CH0_TXDATA(175) = 'U') else CH0_TXDATA(175); -- rv 0
  CH0_TXDATA_in(176) <= '0' when (CH0_TXDATA(176) = 'U') else CH0_TXDATA(176); -- rv 0
  CH0_TXDATA_in(177) <= '0' when (CH0_TXDATA(177) = 'U') else CH0_TXDATA(177); -- rv 0
  CH0_TXDATA_in(178) <= '0' when (CH0_TXDATA(178) = 'U') else CH0_TXDATA(178); -- rv 0
  CH0_TXDATA_in(179) <= '0' when (CH0_TXDATA(179) = 'U') else CH0_TXDATA(179); -- rv 0
  CH0_TXDATA_in(18) <= '0' when (CH0_TXDATA(18) = 'U') else CH0_TXDATA(18); -- rv 0
  CH0_TXDATA_in(180) <= '0' when (CH0_TXDATA(180) = 'U') else CH0_TXDATA(180); -- rv 0
  CH0_TXDATA_in(181) <= '0' when (CH0_TXDATA(181) = 'U') else CH0_TXDATA(181); -- rv 0
  CH0_TXDATA_in(182) <= '0' when (CH0_TXDATA(182) = 'U') else CH0_TXDATA(182); -- rv 0
  CH0_TXDATA_in(183) <= '0' when (CH0_TXDATA(183) = 'U') else CH0_TXDATA(183); -- rv 0
  CH0_TXDATA_in(184) <= '0' when (CH0_TXDATA(184) = 'U') else CH0_TXDATA(184); -- rv 0
  CH0_TXDATA_in(185) <= '0' when (CH0_TXDATA(185) = 'U') else CH0_TXDATA(185); -- rv 0
  CH0_TXDATA_in(186) <= '0' when (CH0_TXDATA(186) = 'U') else CH0_TXDATA(186); -- rv 0
  CH0_TXDATA_in(187) <= '0' when (CH0_TXDATA(187) = 'U') else CH0_TXDATA(187); -- rv 0
  CH0_TXDATA_in(188) <= '0' when (CH0_TXDATA(188) = 'U') else CH0_TXDATA(188); -- rv 0
  CH0_TXDATA_in(189) <= '0' when (CH0_TXDATA(189) = 'U') else CH0_TXDATA(189); -- rv 0
  CH0_TXDATA_in(19) <= '0' when (CH0_TXDATA(19) = 'U') else CH0_TXDATA(19); -- rv 0
  CH0_TXDATA_in(190) <= '0' when (CH0_TXDATA(190) = 'U') else CH0_TXDATA(190); -- rv 0
  CH0_TXDATA_in(191) <= '0' when (CH0_TXDATA(191) = 'U') else CH0_TXDATA(191); -- rv 0
  CH0_TXDATA_in(192) <= '0' when (CH0_TXDATA(192) = 'U') else CH0_TXDATA(192); -- rv 0
  CH0_TXDATA_in(193) <= '0' when (CH0_TXDATA(193) = 'U') else CH0_TXDATA(193); -- rv 0
  CH0_TXDATA_in(194) <= '0' when (CH0_TXDATA(194) = 'U') else CH0_TXDATA(194); -- rv 0
  CH0_TXDATA_in(195) <= '0' when (CH0_TXDATA(195) = 'U') else CH0_TXDATA(195); -- rv 0
  CH0_TXDATA_in(196) <= '0' when (CH0_TXDATA(196) = 'U') else CH0_TXDATA(196); -- rv 0
  CH0_TXDATA_in(197) <= '0' when (CH0_TXDATA(197) = 'U') else CH0_TXDATA(197); -- rv 0
  CH0_TXDATA_in(198) <= '0' when (CH0_TXDATA(198) = 'U') else CH0_TXDATA(198); -- rv 0
  CH0_TXDATA_in(199) <= '0' when (CH0_TXDATA(199) = 'U') else CH0_TXDATA(199); -- rv 0
  CH0_TXDATA_in(2) <= '0' when (CH0_TXDATA(2) = 'U') else CH0_TXDATA(2); -- rv 0
  CH0_TXDATA_in(20) <= '0' when (CH0_TXDATA(20) = 'U') else CH0_TXDATA(20); -- rv 0
  CH0_TXDATA_in(200) <= '0' when (CH0_TXDATA(200) = 'U') else CH0_TXDATA(200); -- rv 0
  CH0_TXDATA_in(201) <= '0' when (CH0_TXDATA(201) = 'U') else CH0_TXDATA(201); -- rv 0
  CH0_TXDATA_in(202) <= '0' when (CH0_TXDATA(202) = 'U') else CH0_TXDATA(202); -- rv 0
  CH0_TXDATA_in(203) <= '0' when (CH0_TXDATA(203) = 'U') else CH0_TXDATA(203); -- rv 0
  CH0_TXDATA_in(204) <= '0' when (CH0_TXDATA(204) = 'U') else CH0_TXDATA(204); -- rv 0
  CH0_TXDATA_in(205) <= '0' when (CH0_TXDATA(205) = 'U') else CH0_TXDATA(205); -- rv 0
  CH0_TXDATA_in(206) <= '0' when (CH0_TXDATA(206) = 'U') else CH0_TXDATA(206); -- rv 0
  CH0_TXDATA_in(207) <= '0' when (CH0_TXDATA(207) = 'U') else CH0_TXDATA(207); -- rv 0
  CH0_TXDATA_in(208) <= '0' when (CH0_TXDATA(208) = 'U') else CH0_TXDATA(208); -- rv 0
  CH0_TXDATA_in(209) <= '0' when (CH0_TXDATA(209) = 'U') else CH0_TXDATA(209); -- rv 0
  CH0_TXDATA_in(21) <= '0' when (CH0_TXDATA(21) = 'U') else CH0_TXDATA(21); -- rv 0
  CH0_TXDATA_in(210) <= '0' when (CH0_TXDATA(210) = 'U') else CH0_TXDATA(210); -- rv 0
  CH0_TXDATA_in(211) <= '0' when (CH0_TXDATA(211) = 'U') else CH0_TXDATA(211); -- rv 0
  CH0_TXDATA_in(212) <= '0' when (CH0_TXDATA(212) = 'U') else CH0_TXDATA(212); -- rv 0
  CH0_TXDATA_in(213) <= '0' when (CH0_TXDATA(213) = 'U') else CH0_TXDATA(213); -- rv 0
  CH0_TXDATA_in(214) <= '0' when (CH0_TXDATA(214) = 'U') else CH0_TXDATA(214); -- rv 0
  CH0_TXDATA_in(215) <= '0' when (CH0_TXDATA(215) = 'U') else CH0_TXDATA(215); -- rv 0
  CH0_TXDATA_in(216) <= '0' when (CH0_TXDATA(216) = 'U') else CH0_TXDATA(216); -- rv 0
  CH0_TXDATA_in(217) <= '0' when (CH0_TXDATA(217) = 'U') else CH0_TXDATA(217); -- rv 0
  CH0_TXDATA_in(218) <= '0' when (CH0_TXDATA(218) = 'U') else CH0_TXDATA(218); -- rv 0
  CH0_TXDATA_in(219) <= '0' when (CH0_TXDATA(219) = 'U') else CH0_TXDATA(219); -- rv 0
  CH0_TXDATA_in(22) <= '0' when (CH0_TXDATA(22) = 'U') else CH0_TXDATA(22); -- rv 0
  CH0_TXDATA_in(220) <= '0' when (CH0_TXDATA(220) = 'U') else CH0_TXDATA(220); -- rv 0
  CH0_TXDATA_in(221) <= '0' when (CH0_TXDATA(221) = 'U') else CH0_TXDATA(221); -- rv 0
  CH0_TXDATA_in(222) <= '0' when (CH0_TXDATA(222) = 'U') else CH0_TXDATA(222); -- rv 0
  CH0_TXDATA_in(223) <= '0' when (CH0_TXDATA(223) = 'U') else CH0_TXDATA(223); -- rv 0
  CH0_TXDATA_in(224) <= '0' when (CH0_TXDATA(224) = 'U') else CH0_TXDATA(224); -- rv 0
  CH0_TXDATA_in(225) <= '0' when (CH0_TXDATA(225) = 'U') else CH0_TXDATA(225); -- rv 0
  CH0_TXDATA_in(226) <= '0' when (CH0_TXDATA(226) = 'U') else CH0_TXDATA(226); -- rv 0
  CH0_TXDATA_in(227) <= '0' when (CH0_TXDATA(227) = 'U') else CH0_TXDATA(227); -- rv 0
  CH0_TXDATA_in(228) <= '0' when (CH0_TXDATA(228) = 'U') else CH0_TXDATA(228); -- rv 0
  CH0_TXDATA_in(229) <= '0' when (CH0_TXDATA(229) = 'U') else CH0_TXDATA(229); -- rv 0
  CH0_TXDATA_in(23) <= '0' when (CH0_TXDATA(23) = 'U') else CH0_TXDATA(23); -- rv 0
  CH0_TXDATA_in(230) <= '0' when (CH0_TXDATA(230) = 'U') else CH0_TXDATA(230); -- rv 0
  CH0_TXDATA_in(231) <= '0' when (CH0_TXDATA(231) = 'U') else CH0_TXDATA(231); -- rv 0
  CH0_TXDATA_in(232) <= '0' when (CH0_TXDATA(232) = 'U') else CH0_TXDATA(232); -- rv 0
  CH0_TXDATA_in(233) <= '0' when (CH0_TXDATA(233) = 'U') else CH0_TXDATA(233); -- rv 0
  CH0_TXDATA_in(234) <= '0' when (CH0_TXDATA(234) = 'U') else CH0_TXDATA(234); -- rv 0
  CH0_TXDATA_in(235) <= '0' when (CH0_TXDATA(235) = 'U') else CH0_TXDATA(235); -- rv 0
  CH0_TXDATA_in(236) <= '0' when (CH0_TXDATA(236) = 'U') else CH0_TXDATA(236); -- rv 0
  CH0_TXDATA_in(237) <= '0' when (CH0_TXDATA(237) = 'U') else CH0_TXDATA(237); -- rv 0
  CH0_TXDATA_in(238) <= '0' when (CH0_TXDATA(238) = 'U') else CH0_TXDATA(238); -- rv 0
  CH0_TXDATA_in(239) <= '0' when (CH0_TXDATA(239) = 'U') else CH0_TXDATA(239); -- rv 0
  CH0_TXDATA_in(24) <= '0' when (CH0_TXDATA(24) = 'U') else CH0_TXDATA(24); -- rv 0
  CH0_TXDATA_in(240) <= '0' when (CH0_TXDATA(240) = 'U') else CH0_TXDATA(240); -- rv 0
  CH0_TXDATA_in(241) <= '0' when (CH0_TXDATA(241) = 'U') else CH0_TXDATA(241); -- rv 0
  CH0_TXDATA_in(242) <= '0' when (CH0_TXDATA(242) = 'U') else CH0_TXDATA(242); -- rv 0
  CH0_TXDATA_in(243) <= '0' when (CH0_TXDATA(243) = 'U') else CH0_TXDATA(243); -- rv 0
  CH0_TXDATA_in(244) <= '0' when (CH0_TXDATA(244) = 'U') else CH0_TXDATA(244); -- rv 0
  CH0_TXDATA_in(245) <= '0' when (CH0_TXDATA(245) = 'U') else CH0_TXDATA(245); -- rv 0
  CH0_TXDATA_in(246) <= '0' when (CH0_TXDATA(246) = 'U') else CH0_TXDATA(246); -- rv 0
  CH0_TXDATA_in(247) <= '0' when (CH0_TXDATA(247) = 'U') else CH0_TXDATA(247); -- rv 0
  CH0_TXDATA_in(248) <= '0' when (CH0_TXDATA(248) = 'U') else CH0_TXDATA(248); -- rv 0
  CH0_TXDATA_in(249) <= '0' when (CH0_TXDATA(249) = 'U') else CH0_TXDATA(249); -- rv 0
  CH0_TXDATA_in(25) <= '0' when (CH0_TXDATA(25) = 'U') else CH0_TXDATA(25); -- rv 0
  CH0_TXDATA_in(250) <= '0' when (CH0_TXDATA(250) = 'U') else CH0_TXDATA(250); -- rv 0
  CH0_TXDATA_in(251) <= '0' when (CH0_TXDATA(251) = 'U') else CH0_TXDATA(251); -- rv 0
  CH0_TXDATA_in(252) <= '0' when (CH0_TXDATA(252) = 'U') else CH0_TXDATA(252); -- rv 0
  CH0_TXDATA_in(253) <= '0' when (CH0_TXDATA(253) = 'U') else CH0_TXDATA(253); -- rv 0
  CH0_TXDATA_in(254) <= '0' when (CH0_TXDATA(254) = 'U') else CH0_TXDATA(254); -- rv 0
  CH0_TXDATA_in(255) <= '0' when (CH0_TXDATA(255) = 'U') else CH0_TXDATA(255); -- rv 0
  CH0_TXDATA_in(26) <= '0' when (CH0_TXDATA(26) = 'U') else CH0_TXDATA(26); -- rv 0
  CH0_TXDATA_in(27) <= '0' when (CH0_TXDATA(27) = 'U') else CH0_TXDATA(27); -- rv 0
  CH0_TXDATA_in(28) <= '0' when (CH0_TXDATA(28) = 'U') else CH0_TXDATA(28); -- rv 0
  CH0_TXDATA_in(29) <= '0' when (CH0_TXDATA(29) = 'U') else CH0_TXDATA(29); -- rv 0
  CH0_TXDATA_in(3) <= '0' when (CH0_TXDATA(3) = 'U') else CH0_TXDATA(3); -- rv 0
  CH0_TXDATA_in(30) <= '0' when (CH0_TXDATA(30) = 'U') else CH0_TXDATA(30); -- rv 0
  CH0_TXDATA_in(31) <= '0' when (CH0_TXDATA(31) = 'U') else CH0_TXDATA(31); -- rv 0
  CH0_TXDATA_in(32) <= '0' when (CH0_TXDATA(32) = 'U') else CH0_TXDATA(32); -- rv 0
  CH0_TXDATA_in(33) <= '0' when (CH0_TXDATA(33) = 'U') else CH0_TXDATA(33); -- rv 0
  CH0_TXDATA_in(34) <= '0' when (CH0_TXDATA(34) = 'U') else CH0_TXDATA(34); -- rv 0
  CH0_TXDATA_in(35) <= '0' when (CH0_TXDATA(35) = 'U') else CH0_TXDATA(35); -- rv 0
  CH0_TXDATA_in(36) <= '0' when (CH0_TXDATA(36) = 'U') else CH0_TXDATA(36); -- rv 0
  CH0_TXDATA_in(37) <= '0' when (CH0_TXDATA(37) = 'U') else CH0_TXDATA(37); -- rv 0
  CH0_TXDATA_in(38) <= '0' when (CH0_TXDATA(38) = 'U') else CH0_TXDATA(38); -- rv 0
  CH0_TXDATA_in(39) <= '0' when (CH0_TXDATA(39) = 'U') else CH0_TXDATA(39); -- rv 0
  CH0_TXDATA_in(4) <= '0' when (CH0_TXDATA(4) = 'U') else CH0_TXDATA(4); -- rv 0
  CH0_TXDATA_in(40) <= '0' when (CH0_TXDATA(40) = 'U') else CH0_TXDATA(40); -- rv 0
  CH0_TXDATA_in(41) <= '0' when (CH0_TXDATA(41) = 'U') else CH0_TXDATA(41); -- rv 0
  CH0_TXDATA_in(42) <= '0' when (CH0_TXDATA(42) = 'U') else CH0_TXDATA(42); -- rv 0
  CH0_TXDATA_in(43) <= '0' when (CH0_TXDATA(43) = 'U') else CH0_TXDATA(43); -- rv 0
  CH0_TXDATA_in(44) <= '0' when (CH0_TXDATA(44) = 'U') else CH0_TXDATA(44); -- rv 0
  CH0_TXDATA_in(45) <= '0' when (CH0_TXDATA(45) = 'U') else CH0_TXDATA(45); -- rv 0
  CH0_TXDATA_in(46) <= '0' when (CH0_TXDATA(46) = 'U') else CH0_TXDATA(46); -- rv 0
  CH0_TXDATA_in(47) <= '0' when (CH0_TXDATA(47) = 'U') else CH0_TXDATA(47); -- rv 0
  CH0_TXDATA_in(48) <= '0' when (CH0_TXDATA(48) = 'U') else CH0_TXDATA(48); -- rv 0
  CH0_TXDATA_in(49) <= '0' when (CH0_TXDATA(49) = 'U') else CH0_TXDATA(49); -- rv 0
  CH0_TXDATA_in(5) <= '0' when (CH0_TXDATA(5) = 'U') else CH0_TXDATA(5); -- rv 0
  CH0_TXDATA_in(50) <= '0' when (CH0_TXDATA(50) = 'U') else CH0_TXDATA(50); -- rv 0
  CH0_TXDATA_in(51) <= '0' when (CH0_TXDATA(51) = 'U') else CH0_TXDATA(51); -- rv 0
  CH0_TXDATA_in(52) <= '0' when (CH0_TXDATA(52) = 'U') else CH0_TXDATA(52); -- rv 0
  CH0_TXDATA_in(53) <= '0' when (CH0_TXDATA(53) = 'U') else CH0_TXDATA(53); -- rv 0
  CH0_TXDATA_in(54) <= '0' when (CH0_TXDATA(54) = 'U') else CH0_TXDATA(54); -- rv 0
  CH0_TXDATA_in(55) <= '0' when (CH0_TXDATA(55) = 'U') else CH0_TXDATA(55); -- rv 0
  CH0_TXDATA_in(56) <= '0' when (CH0_TXDATA(56) = 'U') else CH0_TXDATA(56); -- rv 0
  CH0_TXDATA_in(57) <= '0' when (CH0_TXDATA(57) = 'U') else CH0_TXDATA(57); -- rv 0
  CH0_TXDATA_in(58) <= '0' when (CH0_TXDATA(58) = 'U') else CH0_TXDATA(58); -- rv 0
  CH0_TXDATA_in(59) <= '0' when (CH0_TXDATA(59) = 'U') else CH0_TXDATA(59); -- rv 0
  CH0_TXDATA_in(6) <= '0' when (CH0_TXDATA(6) = 'U') else CH0_TXDATA(6); -- rv 0
  CH0_TXDATA_in(60) <= '0' when (CH0_TXDATA(60) = 'U') else CH0_TXDATA(60); -- rv 0
  CH0_TXDATA_in(61) <= '0' when (CH0_TXDATA(61) = 'U') else CH0_TXDATA(61); -- rv 0
  CH0_TXDATA_in(62) <= '0' when (CH0_TXDATA(62) = 'U') else CH0_TXDATA(62); -- rv 0
  CH0_TXDATA_in(63) <= '0' when (CH0_TXDATA(63) = 'U') else CH0_TXDATA(63); -- rv 0
  CH0_TXDATA_in(64) <= '0' when (CH0_TXDATA(64) = 'U') else CH0_TXDATA(64); -- rv 0
  CH0_TXDATA_in(65) <= '0' when (CH0_TXDATA(65) = 'U') else CH0_TXDATA(65); -- rv 0
  CH0_TXDATA_in(66) <= '0' when (CH0_TXDATA(66) = 'U') else CH0_TXDATA(66); -- rv 0
  CH0_TXDATA_in(67) <= '0' when (CH0_TXDATA(67) = 'U') else CH0_TXDATA(67); -- rv 0
  CH0_TXDATA_in(68) <= '0' when (CH0_TXDATA(68) = 'U') else CH0_TXDATA(68); -- rv 0
  CH0_TXDATA_in(69) <= '0' when (CH0_TXDATA(69) = 'U') else CH0_TXDATA(69); -- rv 0
  CH0_TXDATA_in(7) <= '0' when (CH0_TXDATA(7) = 'U') else CH0_TXDATA(7); -- rv 0
  CH0_TXDATA_in(70) <= '0' when (CH0_TXDATA(70) = 'U') else CH0_TXDATA(70); -- rv 0
  CH0_TXDATA_in(71) <= '0' when (CH0_TXDATA(71) = 'U') else CH0_TXDATA(71); -- rv 0
  CH0_TXDATA_in(72) <= '0' when (CH0_TXDATA(72) = 'U') else CH0_TXDATA(72); -- rv 0
  CH0_TXDATA_in(73) <= '0' when (CH0_TXDATA(73) = 'U') else CH0_TXDATA(73); -- rv 0
  CH0_TXDATA_in(74) <= '0' when (CH0_TXDATA(74) = 'U') else CH0_TXDATA(74); -- rv 0
  CH0_TXDATA_in(75) <= '0' when (CH0_TXDATA(75) = 'U') else CH0_TXDATA(75); -- rv 0
  CH0_TXDATA_in(76) <= '0' when (CH0_TXDATA(76) = 'U') else CH0_TXDATA(76); -- rv 0
  CH0_TXDATA_in(77) <= '0' when (CH0_TXDATA(77) = 'U') else CH0_TXDATA(77); -- rv 0
  CH0_TXDATA_in(78) <= '0' when (CH0_TXDATA(78) = 'U') else CH0_TXDATA(78); -- rv 0
  CH0_TXDATA_in(79) <= '0' when (CH0_TXDATA(79) = 'U') else CH0_TXDATA(79); -- rv 0
  CH0_TXDATA_in(8) <= '0' when (CH0_TXDATA(8) = 'U') else CH0_TXDATA(8); -- rv 0
  CH0_TXDATA_in(80) <= '0' when (CH0_TXDATA(80) = 'U') else CH0_TXDATA(80); -- rv 0
  CH0_TXDATA_in(81) <= '0' when (CH0_TXDATA(81) = 'U') else CH0_TXDATA(81); -- rv 0
  CH0_TXDATA_in(82) <= '0' when (CH0_TXDATA(82) = 'U') else CH0_TXDATA(82); -- rv 0
  CH0_TXDATA_in(83) <= '0' when (CH0_TXDATA(83) = 'U') else CH0_TXDATA(83); -- rv 0
  CH0_TXDATA_in(84) <= '0' when (CH0_TXDATA(84) = 'U') else CH0_TXDATA(84); -- rv 0
  CH0_TXDATA_in(85) <= '0' when (CH0_TXDATA(85) = 'U') else CH0_TXDATA(85); -- rv 0
  CH0_TXDATA_in(86) <= '0' when (CH0_TXDATA(86) = 'U') else CH0_TXDATA(86); -- rv 0
  CH0_TXDATA_in(87) <= '0' when (CH0_TXDATA(87) = 'U') else CH0_TXDATA(87); -- rv 0
  CH0_TXDATA_in(88) <= '0' when (CH0_TXDATA(88) = 'U') else CH0_TXDATA(88); -- rv 0
  CH0_TXDATA_in(89) <= '0' when (CH0_TXDATA(89) = 'U') else CH0_TXDATA(89); -- rv 0
  CH0_TXDATA_in(9) <= '0' when (CH0_TXDATA(9) = 'U') else CH0_TXDATA(9); -- rv 0
  CH0_TXDATA_in(90) <= '0' when (CH0_TXDATA(90) = 'U') else CH0_TXDATA(90); -- rv 0
  CH0_TXDATA_in(91) <= '0' when (CH0_TXDATA(91) = 'U') else CH0_TXDATA(91); -- rv 0
  CH0_TXDATA_in(92) <= '0' when (CH0_TXDATA(92) = 'U') else CH0_TXDATA(92); -- rv 0
  CH0_TXDATA_in(93) <= '0' when (CH0_TXDATA(93) = 'U') else CH0_TXDATA(93); -- rv 0
  CH0_TXDATA_in(94) <= '0' when (CH0_TXDATA(94) = 'U') else CH0_TXDATA(94); -- rv 0
  CH0_TXDATA_in(95) <= '0' when (CH0_TXDATA(95) = 'U') else CH0_TXDATA(95); -- rv 0
  CH0_TXDATA_in(96) <= '0' when (CH0_TXDATA(96) = 'U') else CH0_TXDATA(96); -- rv 0
  CH0_TXDATA_in(97) <= '0' when (CH0_TXDATA(97) = 'U') else CH0_TXDATA(97); -- rv 0
  CH0_TXDATA_in(98) <= '0' when (CH0_TXDATA(98) = 'U') else CH0_TXDATA(98); -- rv 0
  CH0_TXDATA_in(99) <= '0' when (CH0_TXDATA(99) = 'U') else CH0_TXDATA(99); -- rv 0
  CH0_TXDRVAMP_in(0) <= '0' when (CH0_TXDRVAMP(0) = 'U') else CH0_TXDRVAMP(0); -- rv 0
  CH0_TXDRVAMP_in(1) <= '0' when (CH0_TXDRVAMP(1) = 'U') else CH0_TXDRVAMP(1); -- rv 0
  CH0_TXDRVAMP_in(2) <= '0' when (CH0_TXDRVAMP(2) = 'U') else CH0_TXDRVAMP(2); -- rv 0
  CH0_TXDRVAMP_in(3) <= '0' when (CH0_TXDRVAMP(3) = 'U') else CH0_TXDRVAMP(3); -- rv 0
  CH0_TXDRVAMP_in(4) <= '0' when (CH0_TXDRVAMP(4) = 'U') else CH0_TXDRVAMP(4); -- rv 0
  CH0_TXEMPMAIN_in(0) <= '0' when (CH0_TXEMPMAIN(0) = 'U') else CH0_TXEMPMAIN(0); -- rv 0
  CH0_TXEMPMAIN_in(1) <= '0' when (CH0_TXEMPMAIN(1) = 'U') else CH0_TXEMPMAIN(1); -- rv 0
  CH0_TXEMPMAIN_in(2) <= '0' when (CH0_TXEMPMAIN(2) = 'U') else CH0_TXEMPMAIN(2); -- rv 0
  CH0_TXEMPMAIN_in(3) <= '0' when (CH0_TXEMPMAIN(3) = 'U') else CH0_TXEMPMAIN(3); -- rv 0
  CH0_TXEMPMAIN_in(4) <= '0' when (CH0_TXEMPMAIN(4) = 'U') else CH0_TXEMPMAIN(4); -- rv 0
  CH0_TXEMPMAIN_in(5) <= '0' when (CH0_TXEMPMAIN(5) = 'U') else CH0_TXEMPMAIN(5); -- rv 0
  CH0_TXEMPPOST_in(0) <= '0' when (CH0_TXEMPPOST(0) = 'U') else CH0_TXEMPPOST(0); -- rv 0
  CH0_TXEMPPOST_in(1) <= '0' when (CH0_TXEMPPOST(1) = 'U') else CH0_TXEMPPOST(1); -- rv 0
  CH0_TXEMPPOST_in(2) <= '0' when (CH0_TXEMPPOST(2) = 'U') else CH0_TXEMPPOST(2); -- rv 0
  CH0_TXEMPPOST_in(3) <= '0' when (CH0_TXEMPPOST(3) = 'U') else CH0_TXEMPPOST(3); -- rv 0
  CH0_TXEMPPOST_in(4) <= '0' when (CH0_TXEMPPOST(4) = 'U') else CH0_TXEMPPOST(4); -- rv 0
  CH0_TXEMPPRE2_in(0) <= '0' when (CH0_TXEMPPRE2(0) = 'U') else CH0_TXEMPPRE2(0); -- rv 0
  CH0_TXEMPPRE2_in(1) <= '0' when (CH0_TXEMPPRE2(1) = 'U') else CH0_TXEMPPRE2(1); -- rv 0
  CH0_TXEMPPRE2_in(2) <= '0' when (CH0_TXEMPPRE2(2) = 'U') else CH0_TXEMPPRE2(2); -- rv 0
  CH0_TXEMPPRE2_in(3) <= '0' when (CH0_TXEMPPRE2(3) = 'U') else CH0_TXEMPPRE2(3); -- rv 0
  CH0_TXEMPPRE_in(0) <= '0' when (CH0_TXEMPPRE(0) = 'U') else CH0_TXEMPPRE(0); -- rv 0
  CH0_TXEMPPRE_in(1) <= '0' when (CH0_TXEMPPRE(1) = 'U') else CH0_TXEMPPRE(1); -- rv 0
  CH0_TXEMPPRE_in(2) <= '0' when (CH0_TXEMPPRE(2) = 'U') else CH0_TXEMPPRE(2); -- rv 0
  CH0_TXEMPPRE_in(3) <= '0' when (CH0_TXEMPPRE(3) = 'U') else CH0_TXEMPPRE(3); -- rv 0
  CH0_TXEMPPRE_in(4) <= '0' when (CH0_TXEMPPRE(4) = 'U') else CH0_TXEMPPRE(4); -- rv 0
  CH0_TXFECRESET_in <= '0' when (CH0_TXFECRESET = 'U') else CH0_TXFECRESET; -- rv 0
  CH0_TXINHIBIT_in <= '0' when (CH0_TXINHIBIT = 'U') else CH0_TXINHIBIT; -- rv 0
  CH0_TXMUXDCDEXHOLD_in <= '0' when (CH0_TXMUXDCDEXHOLD = 'U') else CH0_TXMUXDCDEXHOLD; -- rv 0
  CH0_TXMUXDCDORWREN_in <= '0' when (CH0_TXMUXDCDORWREN = 'U') else CH0_TXMUXDCDORWREN; -- rv 0
  CH0_TXOUTCLKSEL_in(0) <= '0' when (CH0_TXOUTCLKSEL(0) = 'U') else CH0_TXOUTCLKSEL(0); -- rv 0
  CH0_TXOUTCLKSEL_in(1) <= '0' when (CH0_TXOUTCLKSEL(1) = 'U') else CH0_TXOUTCLKSEL(1); -- rv 0
  CH0_TXOUTCLKSEL_in(2) <= '0' when (CH0_TXOUTCLKSEL(2) = 'U') else CH0_TXOUTCLKSEL(2); -- rv 0
  CH0_TXPCSRESETMASK_in(0) <= '0' when (CH0_TXPCSRESETMASK(0) = 'U') else CH0_TXPCSRESETMASK(0); -- rv 0
  CH0_TXPCSRESETMASK_in(1) <= '0' when (CH0_TXPCSRESETMASK(1) = 'U') else CH0_TXPCSRESETMASK(1); -- rv 0
  CH0_TXPCSRESET_in <= '0' when (CH0_TXPCSRESET = 'U') else CH0_TXPCSRESET; -- rv 0
  CH0_TXPMARESETMASK_in(0) <= '0' when (CH0_TXPMARESETMASK(0) = 'U') else CH0_TXPMARESETMASK(0); -- rv 0
  CH0_TXPMARESETMASK_in(1) <= '0' when (CH0_TXPMARESETMASK(1) = 'U') else CH0_TXPMARESETMASK(1); -- rv 0
  CH0_TXPMARESET_in <= '0' when (CH0_TXPMARESET = 'U') else CH0_TXPMARESET; -- rv 0
  CH0_TXPOLARITY_in <= '0' when (CH0_TXPOLARITY = 'U') else CH0_TXPOLARITY; -- rv 0
  CH0_TXPRBSINERR_in <= '0' when (CH0_TXPRBSINERR = 'U') else CH0_TXPRBSINERR; -- rv 0
  CH0_TXPRBSPTN_in(0) <= '0' when (CH0_TXPRBSPTN(0) = 'U') else CH0_TXPRBSPTN(0); -- rv 0
  CH0_TXPRBSPTN_in(1) <= '0' when (CH0_TXPRBSPTN(1) = 'U') else CH0_TXPRBSPTN(1); -- rv 0
  CH0_TXPRBSPTN_in(2) <= '0' when (CH0_TXPRBSPTN(2) = 'U') else CH0_TXPRBSPTN(2); -- rv 0
  CH0_TXPRBSPTN_in(3) <= '0' when (CH0_TXPRBSPTN(3) = 'U') else CH0_TXPRBSPTN(3); -- rv 0
  CH0_TXPROGDIVRESET_in <= '0' when (CH0_TXPROGDIVRESET = 'U') else CH0_TXPROGDIVRESET; -- rv 0
  CH0_TXQPRBSEN_in <= '0' when (CH0_TXQPRBSEN = 'U') else CH0_TXQPRBSEN; -- rv 0
  CH0_TXRESETMODE_in(0) <= '0' when (CH0_TXRESETMODE(0) = 'U') else CH0_TXRESETMODE(0); -- rv 0
  CH0_TXRESETMODE_in(1) <= '0' when (CH0_TXRESETMODE(1) = 'U') else CH0_TXRESETMODE(1); -- rv 0
  CH0_TXSPCSEQADV_in <= '0' when (CH0_TXSPCSEQADV = 'U') else CH0_TXSPCSEQADV; -- rv 0
  CH0_TXUSRCLK2_in <= '0' when (CH0_TXUSRCLK2 = 'U') else CH0_TXUSRCLK2; -- rv 0
  CH0_TXUSRCLK_in <= '0' when (CH0_TXUSRCLK = 'U') else CH0_TXUSRCLK; -- rv 0
  CH0_TXUSRRDY_in <= '0' when (CH0_TXUSRRDY = 'U') else CH0_TXUSRRDY; -- rv 0
  CH1_AXISEN_in <= '0' when (CH1_AXISEN = 'U') else CH1_AXISEN; -- rv 0
  CH1_AXISRST_in <= '0' when (CH1_AXISRST = 'U') else CH1_AXISRST; -- rv 0
  CH1_AXISTRDY_in <= '0' when (CH1_AXISTRDY = 'U') else CH1_AXISTRDY; -- rv 0
  CH1_CFGRESET_in <= '0' when (CH1_CFGRESET = 'U') else CH1_CFGRESET; -- rv 0
  CH1_DMONFIFORESET_in <= '0' when (CH1_DMONFIFORESET = 'U') else CH1_DMONFIFORESET; -- rv 0
  CH1_DMONITORCLK_in <= '0' when (CH1_DMONITORCLK = 'U') else CH1_DMONITORCLK; -- rv 0
  CH1_GTMRXN_in <= CH1_GTMRXN;
  CH1_GTMRXP_in <= CH1_GTMRXP;
  CH1_GTRXRESET_in <= '0' when (CH1_GTRXRESET = 'U') else CH1_GTRXRESET; -- rv 0
  CH1_GTTXRESET_in <= '0' when (CH1_GTTXRESET = 'U') else CH1_GTTXRESET; -- rv 0
  CH1_LOOPBACK_in(0) <= '0' when (CH1_LOOPBACK(0) = 'U') else CH1_LOOPBACK(0); -- rv 0
  CH1_LOOPBACK_in(1) <= '0' when (CH1_LOOPBACK(1) = 'U') else CH1_LOOPBACK(1); -- rv 0
  CH1_LOOPBACK_in(2) <= '0' when (CH1_LOOPBACK(2) = 'U') else CH1_LOOPBACK(2); -- rv 0
  CH1_PCSRSVDIN_in(0) <= '0' when (CH1_PCSRSVDIN(0) = 'U') else CH1_PCSRSVDIN(0); -- rv 0
  CH1_PCSRSVDIN_in(1) <= '0' when (CH1_PCSRSVDIN(1) = 'U') else CH1_PCSRSVDIN(1); -- rv 0
  CH1_PCSRSVDIN_in(10) <= '0' when (CH1_PCSRSVDIN(10) = 'U') else CH1_PCSRSVDIN(10); -- rv 0
  CH1_PCSRSVDIN_in(11) <= '0' when (CH1_PCSRSVDIN(11) = 'U') else CH1_PCSRSVDIN(11); -- rv 0
  CH1_PCSRSVDIN_in(12) <= '0' when (CH1_PCSRSVDIN(12) = 'U') else CH1_PCSRSVDIN(12); -- rv 0
  CH1_PCSRSVDIN_in(13) <= '0' when (CH1_PCSRSVDIN(13) = 'U') else CH1_PCSRSVDIN(13); -- rv 0
  CH1_PCSRSVDIN_in(14) <= '0' when (CH1_PCSRSVDIN(14) = 'U') else CH1_PCSRSVDIN(14); -- rv 0
  CH1_PCSRSVDIN_in(15) <= '0' when (CH1_PCSRSVDIN(15) = 'U') else CH1_PCSRSVDIN(15); -- rv 0
  CH1_PCSRSVDIN_in(2) <= '0' when (CH1_PCSRSVDIN(2) = 'U') else CH1_PCSRSVDIN(2); -- rv 0
  CH1_PCSRSVDIN_in(3) <= '0' when (CH1_PCSRSVDIN(3) = 'U') else CH1_PCSRSVDIN(3); -- rv 0
  CH1_PCSRSVDIN_in(4) <= '0' when (CH1_PCSRSVDIN(4) = 'U') else CH1_PCSRSVDIN(4); -- rv 0
  CH1_PCSRSVDIN_in(5) <= '0' when (CH1_PCSRSVDIN(5) = 'U') else CH1_PCSRSVDIN(5); -- rv 0
  CH1_PCSRSVDIN_in(6) <= '0' when (CH1_PCSRSVDIN(6) = 'U') else CH1_PCSRSVDIN(6); -- rv 0
  CH1_PCSRSVDIN_in(7) <= '0' when (CH1_PCSRSVDIN(7) = 'U') else CH1_PCSRSVDIN(7); -- rv 0
  CH1_PCSRSVDIN_in(8) <= '0' when (CH1_PCSRSVDIN(8) = 'U') else CH1_PCSRSVDIN(8); -- rv 0
  CH1_PCSRSVDIN_in(9) <= '0' when (CH1_PCSRSVDIN(9) = 'U') else CH1_PCSRSVDIN(9); -- rv 0
  CH1_PMARSVDIN_in(0) <= '1' when (CH1_PMARSVDIN(0) = 'U') else CH1_PMARSVDIN(0); -- rv 1
  CH1_PMARSVDIN_in(1) <= '0' when (CH1_PMARSVDIN(1) = 'U') else CH1_PMARSVDIN(1); -- rv 0
  CH1_PMARSVDIN_in(10) <= '0' when (CH1_PMARSVDIN(10) = 'U') else CH1_PMARSVDIN(10); -- rv 0
  CH1_PMARSVDIN_in(11) <= '0' when (CH1_PMARSVDIN(11) = 'U') else CH1_PMARSVDIN(11); -- rv 0
  CH1_PMARSVDIN_in(12) <= '0' when (CH1_PMARSVDIN(12) = 'U') else CH1_PMARSVDIN(12); -- rv 0
  CH1_PMARSVDIN_in(13) <= '0' when (CH1_PMARSVDIN(13) = 'U') else CH1_PMARSVDIN(13); -- rv 0
  CH1_PMARSVDIN_in(14) <= '0' when (CH1_PMARSVDIN(14) = 'U') else CH1_PMARSVDIN(14); -- rv 0
  CH1_PMARSVDIN_in(15) <= '0' when (CH1_PMARSVDIN(15) = 'U') else CH1_PMARSVDIN(15); -- rv 0
  CH1_PMARSVDIN_in(2) <= '0' when (CH1_PMARSVDIN(2) = 'U') else CH1_PMARSVDIN(2); -- rv 0
  CH1_PMARSVDIN_in(3) <= '0' when (CH1_PMARSVDIN(3) = 'U') else CH1_PMARSVDIN(3); -- rv 0
  CH1_PMARSVDIN_in(4) <= '0' when (CH1_PMARSVDIN(4) = 'U') else CH1_PMARSVDIN(4); -- rv 0
  CH1_PMARSVDIN_in(5) <= '0' when (CH1_PMARSVDIN(5) = 'U') else CH1_PMARSVDIN(5); -- rv 0
  CH1_PMARSVDIN_in(6) <= '0' when (CH1_PMARSVDIN(6) = 'U') else CH1_PMARSVDIN(6); -- rv 0
  CH1_PMARSVDIN_in(7) <= '0' when (CH1_PMARSVDIN(7) = 'U') else CH1_PMARSVDIN(7); -- rv 0
  CH1_PMARSVDIN_in(8) <= '0' when (CH1_PMARSVDIN(8) = 'U') else CH1_PMARSVDIN(8); -- rv 0
  CH1_PMARSVDIN_in(9) <= '0' when (CH1_PMARSVDIN(9) = 'U') else CH1_PMARSVDIN(9); -- rv 0
  CH1_RESETOVRD_in <= '0' when (CH1_RESETOVRD = 'U') else CH1_RESETOVRD; -- rv 0
  CH1_RXADAPTRESET_in <= '0' when (CH1_RXADAPTRESET = 'U') else CH1_RXADAPTRESET; -- rv 0
  CH1_RXADCCALRESET_in <= '0' when (CH1_RXADCCALRESET = 'U') else CH1_RXADCCALRESET; -- rv 0
  CH1_RXADCCLKGENRESET_in <= '0' when (CH1_RXADCCLKGENRESET = 'U') else CH1_RXADCCLKGENRESET; -- rv 0
  CH1_RXBUFRESET_in <= '0' when (CH1_RXBUFRESET = 'U') else CH1_RXBUFRESET; -- rv 0
  CH1_RXCDRFREQOS_in <= '0' when (CH1_RXCDRFREQOS = 'U') else CH1_RXCDRFREQOS; -- rv 0
  CH1_RXCDRFRRESET_in <= '0' when (CH1_RXCDRFRRESET = 'U') else CH1_RXCDRFRRESET; -- rv 0
  CH1_RXCDRHOLD_in <= '0' when (CH1_RXCDRHOLD = 'U') else CH1_RXCDRHOLD; -- rv 0
  CH1_RXCDRINCPCTRL_in <= '0' when (CH1_RXCDRINCPCTRL = 'U') else CH1_RXCDRINCPCTRL; -- rv 0
  CH1_RXCDROVRDEN_in <= '0' when (CH1_RXCDROVRDEN = 'U') else CH1_RXCDROVRDEN; -- rv 0
  CH1_RXCDRPHRESET_in <= '0' when (CH1_RXCDRPHRESET = 'U') else CH1_RXCDRPHRESET; -- rv 0
  CH1_RXDFERESET_in <= '0' when (CH1_RXDFERESET = 'U') else CH1_RXDFERESET; -- rv 0
  CH1_RXDSPRESET_in <= '0' when (CH1_RXDSPRESET = 'U') else CH1_RXDSPRESET; -- rv 0
  CH1_RXEQTRAINING_in <= '0' when (CH1_RXEQTRAINING = 'U') else CH1_RXEQTRAINING; -- rv 0
  CH1_RXEYESCANRESET_in <= '0' when (CH1_RXEYESCANRESET = 'U') else CH1_RXEYESCANRESET; -- rv 0
  CH1_RXFECRESET_in <= '0' when (CH1_RXFECRESET = 'U') else CH1_RXFECRESET; -- rv 0
  CH1_RXOUTCLKSEL_in(0) <= '0' when (CH1_RXOUTCLKSEL(0) = 'U') else CH1_RXOUTCLKSEL(0); -- rv 0
  CH1_RXOUTCLKSEL_in(1) <= '0' when (CH1_RXOUTCLKSEL(1) = 'U') else CH1_RXOUTCLKSEL(1); -- rv 0
  CH1_RXOUTCLKSEL_in(2) <= '0' when (CH1_RXOUTCLKSEL(2) = 'U') else CH1_RXOUTCLKSEL(2); -- rv 0
  CH1_RXPCSRESETMASK_in(0) <= '0' when (CH1_RXPCSRESETMASK(0) = 'U') else CH1_RXPCSRESETMASK(0); -- rv 0
  CH1_RXPCSRESETMASK_in(1) <= '0' when (CH1_RXPCSRESETMASK(1) = 'U') else CH1_RXPCSRESETMASK(1); -- rv 0
  CH1_RXPCSRESETMASK_in(2) <= '0' when (CH1_RXPCSRESETMASK(2) = 'U') else CH1_RXPCSRESETMASK(2); -- rv 0
  CH1_RXPCSRESETMASK_in(3) <= '0' when (CH1_RXPCSRESETMASK(3) = 'U') else CH1_RXPCSRESETMASK(3); -- rv 0
  CH1_RXPCSRESET_in <= '0' when (CH1_RXPCSRESET = 'U') else CH1_RXPCSRESET; -- rv 0
  CH1_RXPMARESETMASK_in(0) <= '0' when (CH1_RXPMARESETMASK(0) = 'U') else CH1_RXPMARESETMASK(0); -- rv 0
  CH1_RXPMARESETMASK_in(1) <= '0' when (CH1_RXPMARESETMASK(1) = 'U') else CH1_RXPMARESETMASK(1); -- rv 0
  CH1_RXPMARESETMASK_in(2) <= '0' when (CH1_RXPMARESETMASK(2) = 'U') else CH1_RXPMARESETMASK(2); -- rv 0
  CH1_RXPMARESETMASK_in(3) <= '0' when (CH1_RXPMARESETMASK(3) = 'U') else CH1_RXPMARESETMASK(3); -- rv 0
  CH1_RXPMARESETMASK_in(4) <= '0' when (CH1_RXPMARESETMASK(4) = 'U') else CH1_RXPMARESETMASK(4); -- rv 0
  CH1_RXPMARESETMASK_in(5) <= '0' when (CH1_RXPMARESETMASK(5) = 'U') else CH1_RXPMARESETMASK(5); -- rv 0
  CH1_RXPMARESETMASK_in(6) <= '0' when (CH1_RXPMARESETMASK(6) = 'U') else CH1_RXPMARESETMASK(6); -- rv 0
  CH1_RXPMARESETMASK_in(7) <= '0' when (CH1_RXPMARESETMASK(7) = 'U') else CH1_RXPMARESETMASK(7); -- rv 0
  CH1_RXPMARESET_in <= '0' when (CH1_RXPMARESET = 'U') else CH1_RXPMARESET; -- rv 0
  CH1_RXPOLARITY_in <= '0' when (CH1_RXPOLARITY = 'U') else CH1_RXPOLARITY; -- rv 0
  CH1_RXPRBSCNTSTOP_in <= '0' when (CH1_RXPRBSCNTSTOP = 'U') else CH1_RXPRBSCNTSTOP; -- rv 0
  CH1_RXPRBSCSCNTRST_in <= '0' when (CH1_RXPRBSCSCNTRST = 'U') else CH1_RXPRBSCSCNTRST; -- rv 0
  CH1_RXPRBSPTN_in(0) <= '0' when (CH1_RXPRBSPTN(0) = 'U') else CH1_RXPRBSPTN(0); -- rv 0
  CH1_RXPRBSPTN_in(1) <= '0' when (CH1_RXPRBSPTN(1) = 'U') else CH1_RXPRBSPTN(1); -- rv 0
  CH1_RXPRBSPTN_in(2) <= '0' when (CH1_RXPRBSPTN(2) = 'U') else CH1_RXPRBSPTN(2); -- rv 0
  CH1_RXPRBSPTN_in(3) <= '0' when (CH1_RXPRBSPTN(3) = 'U') else CH1_RXPRBSPTN(3); -- rv 0
  CH1_RXPROGDIVRESET_in <= '0' when (CH1_RXPROGDIVRESET = 'U') else CH1_RXPROGDIVRESET; -- rv 0
  CH1_RXQPRBSEN_in <= '0' when (CH1_RXQPRBSEN = 'U') else CH1_RXQPRBSEN; -- rv 0
  CH1_RXRESETMODE_in(0) <= '0' when (CH1_RXRESETMODE(0) = 'U') else CH1_RXRESETMODE(0); -- rv 0
  CH1_RXRESETMODE_in(1) <= '0' when (CH1_RXRESETMODE(1) = 'U') else CH1_RXRESETMODE(1); -- rv 0
  CH1_RXSPCSEQADV_in <= '0' when (CH1_RXSPCSEQADV = 'U') else CH1_RXSPCSEQADV; -- rv 0
  CH1_RXUSRCLK2_in <= '0' when (CH1_RXUSRCLK2 = 'U') else CH1_RXUSRCLK2; -- rv 0
  CH1_RXUSRCLK_in <= '0' when (CH1_RXUSRCLK = 'U') else CH1_RXUSRCLK; -- rv 0
  CH1_RXUSRRDY_in <= '0' when (CH1_RXUSRRDY = 'U') else CH1_RXUSRRDY; -- rv 0
  CH1_RXUSRSTART_in <= '0' when (CH1_RXUSRSTART = 'U') else CH1_RXUSRSTART; -- rv 0
  CH1_RXUSRSTOP_in <= '0' when (CH1_RXUSRSTOP = 'U') else CH1_RXUSRSTOP; -- rv 0
  CH1_TXCKALRESET_in <= '0' when (CH1_TXCKALRESET = 'U') else CH1_TXCKALRESET; -- rv 0
  CH1_TXCTLFIRDAT_in(0) <= '0' when (CH1_TXCTLFIRDAT(0) = 'U') else CH1_TXCTLFIRDAT(0); -- rv 0
  CH1_TXCTLFIRDAT_in(1) <= '0' when (CH1_TXCTLFIRDAT(1) = 'U') else CH1_TXCTLFIRDAT(1); -- rv 0
  CH1_TXCTLFIRDAT_in(2) <= '0' when (CH1_TXCTLFIRDAT(2) = 'U') else CH1_TXCTLFIRDAT(2); -- rv 0
  CH1_TXCTLFIRDAT_in(3) <= '0' when (CH1_TXCTLFIRDAT(3) = 'U') else CH1_TXCTLFIRDAT(3); -- rv 0
  CH1_TXCTLFIRDAT_in(4) <= '0' when (CH1_TXCTLFIRDAT(4) = 'U') else CH1_TXCTLFIRDAT(4); -- rv 0
  CH1_TXCTLFIRDAT_in(5) <= '0' when (CH1_TXCTLFIRDAT(5) = 'U') else CH1_TXCTLFIRDAT(5); -- rv 0
  CH1_TXDATASTART_in <= '0' when (CH1_TXDATASTART = 'U') else CH1_TXDATASTART; -- rv 0
  CH1_TXDATA_in(0) <= '0' when (CH1_TXDATA(0) = 'U') else CH1_TXDATA(0); -- rv 0
  CH1_TXDATA_in(1) <= '0' when (CH1_TXDATA(1) = 'U') else CH1_TXDATA(1); -- rv 0
  CH1_TXDATA_in(10) <= '0' when (CH1_TXDATA(10) = 'U') else CH1_TXDATA(10); -- rv 0
  CH1_TXDATA_in(100) <= '0' when (CH1_TXDATA(100) = 'U') else CH1_TXDATA(100); -- rv 0
  CH1_TXDATA_in(101) <= '0' when (CH1_TXDATA(101) = 'U') else CH1_TXDATA(101); -- rv 0
  CH1_TXDATA_in(102) <= '0' when (CH1_TXDATA(102) = 'U') else CH1_TXDATA(102); -- rv 0
  CH1_TXDATA_in(103) <= '0' when (CH1_TXDATA(103) = 'U') else CH1_TXDATA(103); -- rv 0
  CH1_TXDATA_in(104) <= '0' when (CH1_TXDATA(104) = 'U') else CH1_TXDATA(104); -- rv 0
  CH1_TXDATA_in(105) <= '0' when (CH1_TXDATA(105) = 'U') else CH1_TXDATA(105); -- rv 0
  CH1_TXDATA_in(106) <= '0' when (CH1_TXDATA(106) = 'U') else CH1_TXDATA(106); -- rv 0
  CH1_TXDATA_in(107) <= '0' when (CH1_TXDATA(107) = 'U') else CH1_TXDATA(107); -- rv 0
  CH1_TXDATA_in(108) <= '0' when (CH1_TXDATA(108) = 'U') else CH1_TXDATA(108); -- rv 0
  CH1_TXDATA_in(109) <= '0' when (CH1_TXDATA(109) = 'U') else CH1_TXDATA(109); -- rv 0
  CH1_TXDATA_in(11) <= '0' when (CH1_TXDATA(11) = 'U') else CH1_TXDATA(11); -- rv 0
  CH1_TXDATA_in(110) <= '0' when (CH1_TXDATA(110) = 'U') else CH1_TXDATA(110); -- rv 0
  CH1_TXDATA_in(111) <= '0' when (CH1_TXDATA(111) = 'U') else CH1_TXDATA(111); -- rv 0
  CH1_TXDATA_in(112) <= '0' when (CH1_TXDATA(112) = 'U') else CH1_TXDATA(112); -- rv 0
  CH1_TXDATA_in(113) <= '0' when (CH1_TXDATA(113) = 'U') else CH1_TXDATA(113); -- rv 0
  CH1_TXDATA_in(114) <= '0' when (CH1_TXDATA(114) = 'U') else CH1_TXDATA(114); -- rv 0
  CH1_TXDATA_in(115) <= '0' when (CH1_TXDATA(115) = 'U') else CH1_TXDATA(115); -- rv 0
  CH1_TXDATA_in(116) <= '0' when (CH1_TXDATA(116) = 'U') else CH1_TXDATA(116); -- rv 0
  CH1_TXDATA_in(117) <= '0' when (CH1_TXDATA(117) = 'U') else CH1_TXDATA(117); -- rv 0
  CH1_TXDATA_in(118) <= '0' when (CH1_TXDATA(118) = 'U') else CH1_TXDATA(118); -- rv 0
  CH1_TXDATA_in(119) <= '0' when (CH1_TXDATA(119) = 'U') else CH1_TXDATA(119); -- rv 0
  CH1_TXDATA_in(12) <= '0' when (CH1_TXDATA(12) = 'U') else CH1_TXDATA(12); -- rv 0
  CH1_TXDATA_in(120) <= '0' when (CH1_TXDATA(120) = 'U') else CH1_TXDATA(120); -- rv 0
  CH1_TXDATA_in(121) <= '0' when (CH1_TXDATA(121) = 'U') else CH1_TXDATA(121); -- rv 0
  CH1_TXDATA_in(122) <= '0' when (CH1_TXDATA(122) = 'U') else CH1_TXDATA(122); -- rv 0
  CH1_TXDATA_in(123) <= '0' when (CH1_TXDATA(123) = 'U') else CH1_TXDATA(123); -- rv 0
  CH1_TXDATA_in(124) <= '0' when (CH1_TXDATA(124) = 'U') else CH1_TXDATA(124); -- rv 0
  CH1_TXDATA_in(125) <= '0' when (CH1_TXDATA(125) = 'U') else CH1_TXDATA(125); -- rv 0
  CH1_TXDATA_in(126) <= '0' when (CH1_TXDATA(126) = 'U') else CH1_TXDATA(126); -- rv 0
  CH1_TXDATA_in(127) <= '0' when (CH1_TXDATA(127) = 'U') else CH1_TXDATA(127); -- rv 0
  CH1_TXDATA_in(128) <= '0' when (CH1_TXDATA(128) = 'U') else CH1_TXDATA(128); -- rv 0
  CH1_TXDATA_in(129) <= '0' when (CH1_TXDATA(129) = 'U') else CH1_TXDATA(129); -- rv 0
  CH1_TXDATA_in(13) <= '0' when (CH1_TXDATA(13) = 'U') else CH1_TXDATA(13); -- rv 0
  CH1_TXDATA_in(130) <= '0' when (CH1_TXDATA(130) = 'U') else CH1_TXDATA(130); -- rv 0
  CH1_TXDATA_in(131) <= '0' when (CH1_TXDATA(131) = 'U') else CH1_TXDATA(131); -- rv 0
  CH1_TXDATA_in(132) <= '0' when (CH1_TXDATA(132) = 'U') else CH1_TXDATA(132); -- rv 0
  CH1_TXDATA_in(133) <= '0' when (CH1_TXDATA(133) = 'U') else CH1_TXDATA(133); -- rv 0
  CH1_TXDATA_in(134) <= '0' when (CH1_TXDATA(134) = 'U') else CH1_TXDATA(134); -- rv 0
  CH1_TXDATA_in(135) <= '0' when (CH1_TXDATA(135) = 'U') else CH1_TXDATA(135); -- rv 0
  CH1_TXDATA_in(136) <= '0' when (CH1_TXDATA(136) = 'U') else CH1_TXDATA(136); -- rv 0
  CH1_TXDATA_in(137) <= '0' when (CH1_TXDATA(137) = 'U') else CH1_TXDATA(137); -- rv 0
  CH1_TXDATA_in(138) <= '0' when (CH1_TXDATA(138) = 'U') else CH1_TXDATA(138); -- rv 0
  CH1_TXDATA_in(139) <= '0' when (CH1_TXDATA(139) = 'U') else CH1_TXDATA(139); -- rv 0
  CH1_TXDATA_in(14) <= '0' when (CH1_TXDATA(14) = 'U') else CH1_TXDATA(14); -- rv 0
  CH1_TXDATA_in(140) <= '0' when (CH1_TXDATA(140) = 'U') else CH1_TXDATA(140); -- rv 0
  CH1_TXDATA_in(141) <= '0' when (CH1_TXDATA(141) = 'U') else CH1_TXDATA(141); -- rv 0
  CH1_TXDATA_in(142) <= '0' when (CH1_TXDATA(142) = 'U') else CH1_TXDATA(142); -- rv 0
  CH1_TXDATA_in(143) <= '0' when (CH1_TXDATA(143) = 'U') else CH1_TXDATA(143); -- rv 0
  CH1_TXDATA_in(144) <= '0' when (CH1_TXDATA(144) = 'U') else CH1_TXDATA(144); -- rv 0
  CH1_TXDATA_in(145) <= '0' when (CH1_TXDATA(145) = 'U') else CH1_TXDATA(145); -- rv 0
  CH1_TXDATA_in(146) <= '0' when (CH1_TXDATA(146) = 'U') else CH1_TXDATA(146); -- rv 0
  CH1_TXDATA_in(147) <= '0' when (CH1_TXDATA(147) = 'U') else CH1_TXDATA(147); -- rv 0
  CH1_TXDATA_in(148) <= '0' when (CH1_TXDATA(148) = 'U') else CH1_TXDATA(148); -- rv 0
  CH1_TXDATA_in(149) <= '0' when (CH1_TXDATA(149) = 'U') else CH1_TXDATA(149); -- rv 0
  CH1_TXDATA_in(15) <= '0' when (CH1_TXDATA(15) = 'U') else CH1_TXDATA(15); -- rv 0
  CH1_TXDATA_in(150) <= '0' when (CH1_TXDATA(150) = 'U') else CH1_TXDATA(150); -- rv 0
  CH1_TXDATA_in(151) <= '0' when (CH1_TXDATA(151) = 'U') else CH1_TXDATA(151); -- rv 0
  CH1_TXDATA_in(152) <= '0' when (CH1_TXDATA(152) = 'U') else CH1_TXDATA(152); -- rv 0
  CH1_TXDATA_in(153) <= '0' when (CH1_TXDATA(153) = 'U') else CH1_TXDATA(153); -- rv 0
  CH1_TXDATA_in(154) <= '0' when (CH1_TXDATA(154) = 'U') else CH1_TXDATA(154); -- rv 0
  CH1_TXDATA_in(155) <= '0' when (CH1_TXDATA(155) = 'U') else CH1_TXDATA(155); -- rv 0
  CH1_TXDATA_in(156) <= '0' when (CH1_TXDATA(156) = 'U') else CH1_TXDATA(156); -- rv 0
  CH1_TXDATA_in(157) <= '0' when (CH1_TXDATA(157) = 'U') else CH1_TXDATA(157); -- rv 0
  CH1_TXDATA_in(158) <= '0' when (CH1_TXDATA(158) = 'U') else CH1_TXDATA(158); -- rv 0
  CH1_TXDATA_in(159) <= '0' when (CH1_TXDATA(159) = 'U') else CH1_TXDATA(159); -- rv 0
  CH1_TXDATA_in(16) <= '0' when (CH1_TXDATA(16) = 'U') else CH1_TXDATA(16); -- rv 0
  CH1_TXDATA_in(160) <= '0' when (CH1_TXDATA(160) = 'U') else CH1_TXDATA(160); -- rv 0
  CH1_TXDATA_in(161) <= '0' when (CH1_TXDATA(161) = 'U') else CH1_TXDATA(161); -- rv 0
  CH1_TXDATA_in(162) <= '0' when (CH1_TXDATA(162) = 'U') else CH1_TXDATA(162); -- rv 0
  CH1_TXDATA_in(163) <= '0' when (CH1_TXDATA(163) = 'U') else CH1_TXDATA(163); -- rv 0
  CH1_TXDATA_in(164) <= '0' when (CH1_TXDATA(164) = 'U') else CH1_TXDATA(164); -- rv 0
  CH1_TXDATA_in(165) <= '0' when (CH1_TXDATA(165) = 'U') else CH1_TXDATA(165); -- rv 0
  CH1_TXDATA_in(166) <= '0' when (CH1_TXDATA(166) = 'U') else CH1_TXDATA(166); -- rv 0
  CH1_TXDATA_in(167) <= '0' when (CH1_TXDATA(167) = 'U') else CH1_TXDATA(167); -- rv 0
  CH1_TXDATA_in(168) <= '0' when (CH1_TXDATA(168) = 'U') else CH1_TXDATA(168); -- rv 0
  CH1_TXDATA_in(169) <= '0' when (CH1_TXDATA(169) = 'U') else CH1_TXDATA(169); -- rv 0
  CH1_TXDATA_in(17) <= '0' when (CH1_TXDATA(17) = 'U') else CH1_TXDATA(17); -- rv 0
  CH1_TXDATA_in(170) <= '0' when (CH1_TXDATA(170) = 'U') else CH1_TXDATA(170); -- rv 0
  CH1_TXDATA_in(171) <= '0' when (CH1_TXDATA(171) = 'U') else CH1_TXDATA(171); -- rv 0
  CH1_TXDATA_in(172) <= '0' when (CH1_TXDATA(172) = 'U') else CH1_TXDATA(172); -- rv 0
  CH1_TXDATA_in(173) <= '0' when (CH1_TXDATA(173) = 'U') else CH1_TXDATA(173); -- rv 0
  CH1_TXDATA_in(174) <= '0' when (CH1_TXDATA(174) = 'U') else CH1_TXDATA(174); -- rv 0
  CH1_TXDATA_in(175) <= '0' when (CH1_TXDATA(175) = 'U') else CH1_TXDATA(175); -- rv 0
  CH1_TXDATA_in(176) <= '0' when (CH1_TXDATA(176) = 'U') else CH1_TXDATA(176); -- rv 0
  CH1_TXDATA_in(177) <= '0' when (CH1_TXDATA(177) = 'U') else CH1_TXDATA(177); -- rv 0
  CH1_TXDATA_in(178) <= '0' when (CH1_TXDATA(178) = 'U') else CH1_TXDATA(178); -- rv 0
  CH1_TXDATA_in(179) <= '0' when (CH1_TXDATA(179) = 'U') else CH1_TXDATA(179); -- rv 0
  CH1_TXDATA_in(18) <= '0' when (CH1_TXDATA(18) = 'U') else CH1_TXDATA(18); -- rv 0
  CH1_TXDATA_in(180) <= '0' when (CH1_TXDATA(180) = 'U') else CH1_TXDATA(180); -- rv 0
  CH1_TXDATA_in(181) <= '0' when (CH1_TXDATA(181) = 'U') else CH1_TXDATA(181); -- rv 0
  CH1_TXDATA_in(182) <= '0' when (CH1_TXDATA(182) = 'U') else CH1_TXDATA(182); -- rv 0
  CH1_TXDATA_in(183) <= '0' when (CH1_TXDATA(183) = 'U') else CH1_TXDATA(183); -- rv 0
  CH1_TXDATA_in(184) <= '0' when (CH1_TXDATA(184) = 'U') else CH1_TXDATA(184); -- rv 0
  CH1_TXDATA_in(185) <= '0' when (CH1_TXDATA(185) = 'U') else CH1_TXDATA(185); -- rv 0
  CH1_TXDATA_in(186) <= '0' when (CH1_TXDATA(186) = 'U') else CH1_TXDATA(186); -- rv 0
  CH1_TXDATA_in(187) <= '0' when (CH1_TXDATA(187) = 'U') else CH1_TXDATA(187); -- rv 0
  CH1_TXDATA_in(188) <= '0' when (CH1_TXDATA(188) = 'U') else CH1_TXDATA(188); -- rv 0
  CH1_TXDATA_in(189) <= '0' when (CH1_TXDATA(189) = 'U') else CH1_TXDATA(189); -- rv 0
  CH1_TXDATA_in(19) <= '0' when (CH1_TXDATA(19) = 'U') else CH1_TXDATA(19); -- rv 0
  CH1_TXDATA_in(190) <= '0' when (CH1_TXDATA(190) = 'U') else CH1_TXDATA(190); -- rv 0
  CH1_TXDATA_in(191) <= '0' when (CH1_TXDATA(191) = 'U') else CH1_TXDATA(191); -- rv 0
  CH1_TXDATA_in(192) <= '0' when (CH1_TXDATA(192) = 'U') else CH1_TXDATA(192); -- rv 0
  CH1_TXDATA_in(193) <= '0' when (CH1_TXDATA(193) = 'U') else CH1_TXDATA(193); -- rv 0
  CH1_TXDATA_in(194) <= '0' when (CH1_TXDATA(194) = 'U') else CH1_TXDATA(194); -- rv 0
  CH1_TXDATA_in(195) <= '0' when (CH1_TXDATA(195) = 'U') else CH1_TXDATA(195); -- rv 0
  CH1_TXDATA_in(196) <= '0' when (CH1_TXDATA(196) = 'U') else CH1_TXDATA(196); -- rv 0
  CH1_TXDATA_in(197) <= '0' when (CH1_TXDATA(197) = 'U') else CH1_TXDATA(197); -- rv 0
  CH1_TXDATA_in(198) <= '0' when (CH1_TXDATA(198) = 'U') else CH1_TXDATA(198); -- rv 0
  CH1_TXDATA_in(199) <= '0' when (CH1_TXDATA(199) = 'U') else CH1_TXDATA(199); -- rv 0
  CH1_TXDATA_in(2) <= '0' when (CH1_TXDATA(2) = 'U') else CH1_TXDATA(2); -- rv 0
  CH1_TXDATA_in(20) <= '0' when (CH1_TXDATA(20) = 'U') else CH1_TXDATA(20); -- rv 0
  CH1_TXDATA_in(200) <= '0' when (CH1_TXDATA(200) = 'U') else CH1_TXDATA(200); -- rv 0
  CH1_TXDATA_in(201) <= '0' when (CH1_TXDATA(201) = 'U') else CH1_TXDATA(201); -- rv 0
  CH1_TXDATA_in(202) <= '0' when (CH1_TXDATA(202) = 'U') else CH1_TXDATA(202); -- rv 0
  CH1_TXDATA_in(203) <= '0' when (CH1_TXDATA(203) = 'U') else CH1_TXDATA(203); -- rv 0
  CH1_TXDATA_in(204) <= '0' when (CH1_TXDATA(204) = 'U') else CH1_TXDATA(204); -- rv 0
  CH1_TXDATA_in(205) <= '0' when (CH1_TXDATA(205) = 'U') else CH1_TXDATA(205); -- rv 0
  CH1_TXDATA_in(206) <= '0' when (CH1_TXDATA(206) = 'U') else CH1_TXDATA(206); -- rv 0
  CH1_TXDATA_in(207) <= '0' when (CH1_TXDATA(207) = 'U') else CH1_TXDATA(207); -- rv 0
  CH1_TXDATA_in(208) <= '0' when (CH1_TXDATA(208) = 'U') else CH1_TXDATA(208); -- rv 0
  CH1_TXDATA_in(209) <= '0' when (CH1_TXDATA(209) = 'U') else CH1_TXDATA(209); -- rv 0
  CH1_TXDATA_in(21) <= '0' when (CH1_TXDATA(21) = 'U') else CH1_TXDATA(21); -- rv 0
  CH1_TXDATA_in(210) <= '0' when (CH1_TXDATA(210) = 'U') else CH1_TXDATA(210); -- rv 0
  CH1_TXDATA_in(211) <= '0' when (CH1_TXDATA(211) = 'U') else CH1_TXDATA(211); -- rv 0
  CH1_TXDATA_in(212) <= '0' when (CH1_TXDATA(212) = 'U') else CH1_TXDATA(212); -- rv 0
  CH1_TXDATA_in(213) <= '0' when (CH1_TXDATA(213) = 'U') else CH1_TXDATA(213); -- rv 0
  CH1_TXDATA_in(214) <= '0' when (CH1_TXDATA(214) = 'U') else CH1_TXDATA(214); -- rv 0
  CH1_TXDATA_in(215) <= '0' when (CH1_TXDATA(215) = 'U') else CH1_TXDATA(215); -- rv 0
  CH1_TXDATA_in(216) <= '0' when (CH1_TXDATA(216) = 'U') else CH1_TXDATA(216); -- rv 0
  CH1_TXDATA_in(217) <= '0' when (CH1_TXDATA(217) = 'U') else CH1_TXDATA(217); -- rv 0
  CH1_TXDATA_in(218) <= '0' when (CH1_TXDATA(218) = 'U') else CH1_TXDATA(218); -- rv 0
  CH1_TXDATA_in(219) <= '0' when (CH1_TXDATA(219) = 'U') else CH1_TXDATA(219); -- rv 0
  CH1_TXDATA_in(22) <= '0' when (CH1_TXDATA(22) = 'U') else CH1_TXDATA(22); -- rv 0
  CH1_TXDATA_in(220) <= '0' when (CH1_TXDATA(220) = 'U') else CH1_TXDATA(220); -- rv 0
  CH1_TXDATA_in(221) <= '0' when (CH1_TXDATA(221) = 'U') else CH1_TXDATA(221); -- rv 0
  CH1_TXDATA_in(222) <= '0' when (CH1_TXDATA(222) = 'U') else CH1_TXDATA(222); -- rv 0
  CH1_TXDATA_in(223) <= '0' when (CH1_TXDATA(223) = 'U') else CH1_TXDATA(223); -- rv 0
  CH1_TXDATA_in(224) <= '0' when (CH1_TXDATA(224) = 'U') else CH1_TXDATA(224); -- rv 0
  CH1_TXDATA_in(225) <= '0' when (CH1_TXDATA(225) = 'U') else CH1_TXDATA(225); -- rv 0
  CH1_TXDATA_in(226) <= '0' when (CH1_TXDATA(226) = 'U') else CH1_TXDATA(226); -- rv 0
  CH1_TXDATA_in(227) <= '0' when (CH1_TXDATA(227) = 'U') else CH1_TXDATA(227); -- rv 0
  CH1_TXDATA_in(228) <= '0' when (CH1_TXDATA(228) = 'U') else CH1_TXDATA(228); -- rv 0
  CH1_TXDATA_in(229) <= '0' when (CH1_TXDATA(229) = 'U') else CH1_TXDATA(229); -- rv 0
  CH1_TXDATA_in(23) <= '0' when (CH1_TXDATA(23) = 'U') else CH1_TXDATA(23); -- rv 0
  CH1_TXDATA_in(230) <= '0' when (CH1_TXDATA(230) = 'U') else CH1_TXDATA(230); -- rv 0
  CH1_TXDATA_in(231) <= '0' when (CH1_TXDATA(231) = 'U') else CH1_TXDATA(231); -- rv 0
  CH1_TXDATA_in(232) <= '0' when (CH1_TXDATA(232) = 'U') else CH1_TXDATA(232); -- rv 0
  CH1_TXDATA_in(233) <= '0' when (CH1_TXDATA(233) = 'U') else CH1_TXDATA(233); -- rv 0
  CH1_TXDATA_in(234) <= '0' when (CH1_TXDATA(234) = 'U') else CH1_TXDATA(234); -- rv 0
  CH1_TXDATA_in(235) <= '0' when (CH1_TXDATA(235) = 'U') else CH1_TXDATA(235); -- rv 0
  CH1_TXDATA_in(236) <= '0' when (CH1_TXDATA(236) = 'U') else CH1_TXDATA(236); -- rv 0
  CH1_TXDATA_in(237) <= '0' when (CH1_TXDATA(237) = 'U') else CH1_TXDATA(237); -- rv 0
  CH1_TXDATA_in(238) <= '0' when (CH1_TXDATA(238) = 'U') else CH1_TXDATA(238); -- rv 0
  CH1_TXDATA_in(239) <= '0' when (CH1_TXDATA(239) = 'U') else CH1_TXDATA(239); -- rv 0
  CH1_TXDATA_in(24) <= '0' when (CH1_TXDATA(24) = 'U') else CH1_TXDATA(24); -- rv 0
  CH1_TXDATA_in(240) <= '0' when (CH1_TXDATA(240) = 'U') else CH1_TXDATA(240); -- rv 0
  CH1_TXDATA_in(241) <= '0' when (CH1_TXDATA(241) = 'U') else CH1_TXDATA(241); -- rv 0
  CH1_TXDATA_in(242) <= '0' when (CH1_TXDATA(242) = 'U') else CH1_TXDATA(242); -- rv 0
  CH1_TXDATA_in(243) <= '0' when (CH1_TXDATA(243) = 'U') else CH1_TXDATA(243); -- rv 0
  CH1_TXDATA_in(244) <= '0' when (CH1_TXDATA(244) = 'U') else CH1_TXDATA(244); -- rv 0
  CH1_TXDATA_in(245) <= '0' when (CH1_TXDATA(245) = 'U') else CH1_TXDATA(245); -- rv 0
  CH1_TXDATA_in(246) <= '0' when (CH1_TXDATA(246) = 'U') else CH1_TXDATA(246); -- rv 0
  CH1_TXDATA_in(247) <= '0' when (CH1_TXDATA(247) = 'U') else CH1_TXDATA(247); -- rv 0
  CH1_TXDATA_in(248) <= '0' when (CH1_TXDATA(248) = 'U') else CH1_TXDATA(248); -- rv 0
  CH1_TXDATA_in(249) <= '0' when (CH1_TXDATA(249) = 'U') else CH1_TXDATA(249); -- rv 0
  CH1_TXDATA_in(25) <= '0' when (CH1_TXDATA(25) = 'U') else CH1_TXDATA(25); -- rv 0
  CH1_TXDATA_in(250) <= '0' when (CH1_TXDATA(250) = 'U') else CH1_TXDATA(250); -- rv 0
  CH1_TXDATA_in(251) <= '0' when (CH1_TXDATA(251) = 'U') else CH1_TXDATA(251); -- rv 0
  CH1_TXDATA_in(252) <= '0' when (CH1_TXDATA(252) = 'U') else CH1_TXDATA(252); -- rv 0
  CH1_TXDATA_in(253) <= '0' when (CH1_TXDATA(253) = 'U') else CH1_TXDATA(253); -- rv 0
  CH1_TXDATA_in(254) <= '0' when (CH1_TXDATA(254) = 'U') else CH1_TXDATA(254); -- rv 0
  CH1_TXDATA_in(255) <= '0' when (CH1_TXDATA(255) = 'U') else CH1_TXDATA(255); -- rv 0
  CH1_TXDATA_in(26) <= '0' when (CH1_TXDATA(26) = 'U') else CH1_TXDATA(26); -- rv 0
  CH1_TXDATA_in(27) <= '0' when (CH1_TXDATA(27) = 'U') else CH1_TXDATA(27); -- rv 0
  CH1_TXDATA_in(28) <= '0' when (CH1_TXDATA(28) = 'U') else CH1_TXDATA(28); -- rv 0
  CH1_TXDATA_in(29) <= '0' when (CH1_TXDATA(29) = 'U') else CH1_TXDATA(29); -- rv 0
  CH1_TXDATA_in(3) <= '0' when (CH1_TXDATA(3) = 'U') else CH1_TXDATA(3); -- rv 0
  CH1_TXDATA_in(30) <= '0' when (CH1_TXDATA(30) = 'U') else CH1_TXDATA(30); -- rv 0
  CH1_TXDATA_in(31) <= '0' when (CH1_TXDATA(31) = 'U') else CH1_TXDATA(31); -- rv 0
  CH1_TXDATA_in(32) <= '0' when (CH1_TXDATA(32) = 'U') else CH1_TXDATA(32); -- rv 0
  CH1_TXDATA_in(33) <= '0' when (CH1_TXDATA(33) = 'U') else CH1_TXDATA(33); -- rv 0
  CH1_TXDATA_in(34) <= '0' when (CH1_TXDATA(34) = 'U') else CH1_TXDATA(34); -- rv 0
  CH1_TXDATA_in(35) <= '0' when (CH1_TXDATA(35) = 'U') else CH1_TXDATA(35); -- rv 0
  CH1_TXDATA_in(36) <= '0' when (CH1_TXDATA(36) = 'U') else CH1_TXDATA(36); -- rv 0
  CH1_TXDATA_in(37) <= '0' when (CH1_TXDATA(37) = 'U') else CH1_TXDATA(37); -- rv 0
  CH1_TXDATA_in(38) <= '0' when (CH1_TXDATA(38) = 'U') else CH1_TXDATA(38); -- rv 0
  CH1_TXDATA_in(39) <= '0' when (CH1_TXDATA(39) = 'U') else CH1_TXDATA(39); -- rv 0
  CH1_TXDATA_in(4) <= '0' when (CH1_TXDATA(4) = 'U') else CH1_TXDATA(4); -- rv 0
  CH1_TXDATA_in(40) <= '0' when (CH1_TXDATA(40) = 'U') else CH1_TXDATA(40); -- rv 0
  CH1_TXDATA_in(41) <= '0' when (CH1_TXDATA(41) = 'U') else CH1_TXDATA(41); -- rv 0
  CH1_TXDATA_in(42) <= '0' when (CH1_TXDATA(42) = 'U') else CH1_TXDATA(42); -- rv 0
  CH1_TXDATA_in(43) <= '0' when (CH1_TXDATA(43) = 'U') else CH1_TXDATA(43); -- rv 0
  CH1_TXDATA_in(44) <= '0' when (CH1_TXDATA(44) = 'U') else CH1_TXDATA(44); -- rv 0
  CH1_TXDATA_in(45) <= '0' when (CH1_TXDATA(45) = 'U') else CH1_TXDATA(45); -- rv 0
  CH1_TXDATA_in(46) <= '0' when (CH1_TXDATA(46) = 'U') else CH1_TXDATA(46); -- rv 0
  CH1_TXDATA_in(47) <= '0' when (CH1_TXDATA(47) = 'U') else CH1_TXDATA(47); -- rv 0
  CH1_TXDATA_in(48) <= '0' when (CH1_TXDATA(48) = 'U') else CH1_TXDATA(48); -- rv 0
  CH1_TXDATA_in(49) <= '0' when (CH1_TXDATA(49) = 'U') else CH1_TXDATA(49); -- rv 0
  CH1_TXDATA_in(5) <= '0' when (CH1_TXDATA(5) = 'U') else CH1_TXDATA(5); -- rv 0
  CH1_TXDATA_in(50) <= '0' when (CH1_TXDATA(50) = 'U') else CH1_TXDATA(50); -- rv 0
  CH1_TXDATA_in(51) <= '0' when (CH1_TXDATA(51) = 'U') else CH1_TXDATA(51); -- rv 0
  CH1_TXDATA_in(52) <= '0' when (CH1_TXDATA(52) = 'U') else CH1_TXDATA(52); -- rv 0
  CH1_TXDATA_in(53) <= '0' when (CH1_TXDATA(53) = 'U') else CH1_TXDATA(53); -- rv 0
  CH1_TXDATA_in(54) <= '0' when (CH1_TXDATA(54) = 'U') else CH1_TXDATA(54); -- rv 0
  CH1_TXDATA_in(55) <= '0' when (CH1_TXDATA(55) = 'U') else CH1_TXDATA(55); -- rv 0
  CH1_TXDATA_in(56) <= '0' when (CH1_TXDATA(56) = 'U') else CH1_TXDATA(56); -- rv 0
  CH1_TXDATA_in(57) <= '0' when (CH1_TXDATA(57) = 'U') else CH1_TXDATA(57); -- rv 0
  CH1_TXDATA_in(58) <= '0' when (CH1_TXDATA(58) = 'U') else CH1_TXDATA(58); -- rv 0
  CH1_TXDATA_in(59) <= '0' when (CH1_TXDATA(59) = 'U') else CH1_TXDATA(59); -- rv 0
  CH1_TXDATA_in(6) <= '0' when (CH1_TXDATA(6) = 'U') else CH1_TXDATA(6); -- rv 0
  CH1_TXDATA_in(60) <= '0' when (CH1_TXDATA(60) = 'U') else CH1_TXDATA(60); -- rv 0
  CH1_TXDATA_in(61) <= '0' when (CH1_TXDATA(61) = 'U') else CH1_TXDATA(61); -- rv 0
  CH1_TXDATA_in(62) <= '0' when (CH1_TXDATA(62) = 'U') else CH1_TXDATA(62); -- rv 0
  CH1_TXDATA_in(63) <= '0' when (CH1_TXDATA(63) = 'U') else CH1_TXDATA(63); -- rv 0
  CH1_TXDATA_in(64) <= '0' when (CH1_TXDATA(64) = 'U') else CH1_TXDATA(64); -- rv 0
  CH1_TXDATA_in(65) <= '0' when (CH1_TXDATA(65) = 'U') else CH1_TXDATA(65); -- rv 0
  CH1_TXDATA_in(66) <= '0' when (CH1_TXDATA(66) = 'U') else CH1_TXDATA(66); -- rv 0
  CH1_TXDATA_in(67) <= '0' when (CH1_TXDATA(67) = 'U') else CH1_TXDATA(67); -- rv 0
  CH1_TXDATA_in(68) <= '0' when (CH1_TXDATA(68) = 'U') else CH1_TXDATA(68); -- rv 0
  CH1_TXDATA_in(69) <= '0' when (CH1_TXDATA(69) = 'U') else CH1_TXDATA(69); -- rv 0
  CH1_TXDATA_in(7) <= '0' when (CH1_TXDATA(7) = 'U') else CH1_TXDATA(7); -- rv 0
  CH1_TXDATA_in(70) <= '0' when (CH1_TXDATA(70) = 'U') else CH1_TXDATA(70); -- rv 0
  CH1_TXDATA_in(71) <= '0' when (CH1_TXDATA(71) = 'U') else CH1_TXDATA(71); -- rv 0
  CH1_TXDATA_in(72) <= '0' when (CH1_TXDATA(72) = 'U') else CH1_TXDATA(72); -- rv 0
  CH1_TXDATA_in(73) <= '0' when (CH1_TXDATA(73) = 'U') else CH1_TXDATA(73); -- rv 0
  CH1_TXDATA_in(74) <= '0' when (CH1_TXDATA(74) = 'U') else CH1_TXDATA(74); -- rv 0
  CH1_TXDATA_in(75) <= '0' when (CH1_TXDATA(75) = 'U') else CH1_TXDATA(75); -- rv 0
  CH1_TXDATA_in(76) <= '0' when (CH1_TXDATA(76) = 'U') else CH1_TXDATA(76); -- rv 0
  CH1_TXDATA_in(77) <= '0' when (CH1_TXDATA(77) = 'U') else CH1_TXDATA(77); -- rv 0
  CH1_TXDATA_in(78) <= '0' when (CH1_TXDATA(78) = 'U') else CH1_TXDATA(78); -- rv 0
  CH1_TXDATA_in(79) <= '0' when (CH1_TXDATA(79) = 'U') else CH1_TXDATA(79); -- rv 0
  CH1_TXDATA_in(8) <= '0' when (CH1_TXDATA(8) = 'U') else CH1_TXDATA(8); -- rv 0
  CH1_TXDATA_in(80) <= '0' when (CH1_TXDATA(80) = 'U') else CH1_TXDATA(80); -- rv 0
  CH1_TXDATA_in(81) <= '0' when (CH1_TXDATA(81) = 'U') else CH1_TXDATA(81); -- rv 0
  CH1_TXDATA_in(82) <= '0' when (CH1_TXDATA(82) = 'U') else CH1_TXDATA(82); -- rv 0
  CH1_TXDATA_in(83) <= '0' when (CH1_TXDATA(83) = 'U') else CH1_TXDATA(83); -- rv 0
  CH1_TXDATA_in(84) <= '0' when (CH1_TXDATA(84) = 'U') else CH1_TXDATA(84); -- rv 0
  CH1_TXDATA_in(85) <= '0' when (CH1_TXDATA(85) = 'U') else CH1_TXDATA(85); -- rv 0
  CH1_TXDATA_in(86) <= '0' when (CH1_TXDATA(86) = 'U') else CH1_TXDATA(86); -- rv 0
  CH1_TXDATA_in(87) <= '0' when (CH1_TXDATA(87) = 'U') else CH1_TXDATA(87); -- rv 0
  CH1_TXDATA_in(88) <= '0' when (CH1_TXDATA(88) = 'U') else CH1_TXDATA(88); -- rv 0
  CH1_TXDATA_in(89) <= '0' when (CH1_TXDATA(89) = 'U') else CH1_TXDATA(89); -- rv 0
  CH1_TXDATA_in(9) <= '0' when (CH1_TXDATA(9) = 'U') else CH1_TXDATA(9); -- rv 0
  CH1_TXDATA_in(90) <= '0' when (CH1_TXDATA(90) = 'U') else CH1_TXDATA(90); -- rv 0
  CH1_TXDATA_in(91) <= '0' when (CH1_TXDATA(91) = 'U') else CH1_TXDATA(91); -- rv 0
  CH1_TXDATA_in(92) <= '0' when (CH1_TXDATA(92) = 'U') else CH1_TXDATA(92); -- rv 0
  CH1_TXDATA_in(93) <= '0' when (CH1_TXDATA(93) = 'U') else CH1_TXDATA(93); -- rv 0
  CH1_TXDATA_in(94) <= '0' when (CH1_TXDATA(94) = 'U') else CH1_TXDATA(94); -- rv 0
  CH1_TXDATA_in(95) <= '0' when (CH1_TXDATA(95) = 'U') else CH1_TXDATA(95); -- rv 0
  CH1_TXDATA_in(96) <= '0' when (CH1_TXDATA(96) = 'U') else CH1_TXDATA(96); -- rv 0
  CH1_TXDATA_in(97) <= '0' when (CH1_TXDATA(97) = 'U') else CH1_TXDATA(97); -- rv 0
  CH1_TXDATA_in(98) <= '0' when (CH1_TXDATA(98) = 'U') else CH1_TXDATA(98); -- rv 0
  CH1_TXDATA_in(99) <= '0' when (CH1_TXDATA(99) = 'U') else CH1_TXDATA(99); -- rv 0
  CH1_TXDRVAMP_in(0) <= '0' when (CH1_TXDRVAMP(0) = 'U') else CH1_TXDRVAMP(0); -- rv 0
  CH1_TXDRVAMP_in(1) <= '0' when (CH1_TXDRVAMP(1) = 'U') else CH1_TXDRVAMP(1); -- rv 0
  CH1_TXDRVAMP_in(2) <= '0' when (CH1_TXDRVAMP(2) = 'U') else CH1_TXDRVAMP(2); -- rv 0
  CH1_TXDRVAMP_in(3) <= '0' when (CH1_TXDRVAMP(3) = 'U') else CH1_TXDRVAMP(3); -- rv 0
  CH1_TXDRVAMP_in(4) <= '0' when (CH1_TXDRVAMP(4) = 'U') else CH1_TXDRVAMP(4); -- rv 0
  CH1_TXEMPMAIN_in(0) <= '0' when (CH1_TXEMPMAIN(0) = 'U') else CH1_TXEMPMAIN(0); -- rv 0
  CH1_TXEMPMAIN_in(1) <= '0' when (CH1_TXEMPMAIN(1) = 'U') else CH1_TXEMPMAIN(1); -- rv 0
  CH1_TXEMPMAIN_in(2) <= '0' when (CH1_TXEMPMAIN(2) = 'U') else CH1_TXEMPMAIN(2); -- rv 0
  CH1_TXEMPMAIN_in(3) <= '0' when (CH1_TXEMPMAIN(3) = 'U') else CH1_TXEMPMAIN(3); -- rv 0
  CH1_TXEMPMAIN_in(4) <= '0' when (CH1_TXEMPMAIN(4) = 'U') else CH1_TXEMPMAIN(4); -- rv 0
  CH1_TXEMPMAIN_in(5) <= '0' when (CH1_TXEMPMAIN(5) = 'U') else CH1_TXEMPMAIN(5); -- rv 0
  CH1_TXEMPPOST_in(0) <= '0' when (CH1_TXEMPPOST(0) = 'U') else CH1_TXEMPPOST(0); -- rv 0
  CH1_TXEMPPOST_in(1) <= '0' when (CH1_TXEMPPOST(1) = 'U') else CH1_TXEMPPOST(1); -- rv 0
  CH1_TXEMPPOST_in(2) <= '0' when (CH1_TXEMPPOST(2) = 'U') else CH1_TXEMPPOST(2); -- rv 0
  CH1_TXEMPPOST_in(3) <= '0' when (CH1_TXEMPPOST(3) = 'U') else CH1_TXEMPPOST(3); -- rv 0
  CH1_TXEMPPOST_in(4) <= '0' when (CH1_TXEMPPOST(4) = 'U') else CH1_TXEMPPOST(4); -- rv 0
  CH1_TXEMPPRE2_in(0) <= '0' when (CH1_TXEMPPRE2(0) = 'U') else CH1_TXEMPPRE2(0); -- rv 0
  CH1_TXEMPPRE2_in(1) <= '0' when (CH1_TXEMPPRE2(1) = 'U') else CH1_TXEMPPRE2(1); -- rv 0
  CH1_TXEMPPRE2_in(2) <= '0' when (CH1_TXEMPPRE2(2) = 'U') else CH1_TXEMPPRE2(2); -- rv 0
  CH1_TXEMPPRE2_in(3) <= '0' when (CH1_TXEMPPRE2(3) = 'U') else CH1_TXEMPPRE2(3); -- rv 0
  CH1_TXEMPPRE_in(0) <= '0' when (CH1_TXEMPPRE(0) = 'U') else CH1_TXEMPPRE(0); -- rv 0
  CH1_TXEMPPRE_in(1) <= '0' when (CH1_TXEMPPRE(1) = 'U') else CH1_TXEMPPRE(1); -- rv 0
  CH1_TXEMPPRE_in(2) <= '0' when (CH1_TXEMPPRE(2) = 'U') else CH1_TXEMPPRE(2); -- rv 0
  CH1_TXEMPPRE_in(3) <= '0' when (CH1_TXEMPPRE(3) = 'U') else CH1_TXEMPPRE(3); -- rv 0
  CH1_TXEMPPRE_in(4) <= '0' when (CH1_TXEMPPRE(4) = 'U') else CH1_TXEMPPRE(4); -- rv 0
  CH1_TXFECRESET_in <= '0' when (CH1_TXFECRESET = 'U') else CH1_TXFECRESET; -- rv 0
  CH1_TXINHIBIT_in <= '0' when (CH1_TXINHIBIT = 'U') else CH1_TXINHIBIT; -- rv 0
  CH1_TXMUXDCDEXHOLD_in <= '0' when (CH1_TXMUXDCDEXHOLD = 'U') else CH1_TXMUXDCDEXHOLD; -- rv 0
  CH1_TXMUXDCDORWREN_in <= '0' when (CH1_TXMUXDCDORWREN = 'U') else CH1_TXMUXDCDORWREN; -- rv 0
  CH1_TXOUTCLKSEL_in(0) <= '0' when (CH1_TXOUTCLKSEL(0) = 'U') else CH1_TXOUTCLKSEL(0); -- rv 0
  CH1_TXOUTCLKSEL_in(1) <= '0' when (CH1_TXOUTCLKSEL(1) = 'U') else CH1_TXOUTCLKSEL(1); -- rv 0
  CH1_TXOUTCLKSEL_in(2) <= '0' when (CH1_TXOUTCLKSEL(2) = 'U') else CH1_TXOUTCLKSEL(2); -- rv 0
  CH1_TXPCSRESETMASK_in(0) <= '0' when (CH1_TXPCSRESETMASK(0) = 'U') else CH1_TXPCSRESETMASK(0); -- rv 0
  CH1_TXPCSRESETMASK_in(1) <= '0' when (CH1_TXPCSRESETMASK(1) = 'U') else CH1_TXPCSRESETMASK(1); -- rv 0
  CH1_TXPCSRESET_in <= '0' when (CH1_TXPCSRESET = 'U') else CH1_TXPCSRESET; -- rv 0
  CH1_TXPMARESETMASK_in(0) <= '0' when (CH1_TXPMARESETMASK(0) = 'U') else CH1_TXPMARESETMASK(0); -- rv 0
  CH1_TXPMARESETMASK_in(1) <= '0' when (CH1_TXPMARESETMASK(1) = 'U') else CH1_TXPMARESETMASK(1); -- rv 0
  CH1_TXPMARESET_in <= '0' when (CH1_TXPMARESET = 'U') else CH1_TXPMARESET; -- rv 0
  CH1_TXPOLARITY_in <= '0' when (CH1_TXPOLARITY = 'U') else CH1_TXPOLARITY; -- rv 0
  CH1_TXPRBSINERR_in <= '0' when (CH1_TXPRBSINERR = 'U') else CH1_TXPRBSINERR; -- rv 0
  CH1_TXPRBSPTN_in(0) <= '0' when (CH1_TXPRBSPTN(0) = 'U') else CH1_TXPRBSPTN(0); -- rv 0
  CH1_TXPRBSPTN_in(1) <= '0' when (CH1_TXPRBSPTN(1) = 'U') else CH1_TXPRBSPTN(1); -- rv 0
  CH1_TXPRBSPTN_in(2) <= '0' when (CH1_TXPRBSPTN(2) = 'U') else CH1_TXPRBSPTN(2); -- rv 0
  CH1_TXPRBSPTN_in(3) <= '0' when (CH1_TXPRBSPTN(3) = 'U') else CH1_TXPRBSPTN(3); -- rv 0
  CH1_TXPROGDIVRESET_in <= '0' when (CH1_TXPROGDIVRESET = 'U') else CH1_TXPROGDIVRESET; -- rv 0
  CH1_TXQPRBSEN_in <= '0' when (CH1_TXQPRBSEN = 'U') else CH1_TXQPRBSEN; -- rv 0
  CH1_TXRESETMODE_in(0) <= '0' when (CH1_TXRESETMODE(0) = 'U') else CH1_TXRESETMODE(0); -- rv 0
  CH1_TXRESETMODE_in(1) <= '0' when (CH1_TXRESETMODE(1) = 'U') else CH1_TXRESETMODE(1); -- rv 0
  CH1_TXSPCSEQADV_in <= '0' when (CH1_TXSPCSEQADV = 'U') else CH1_TXSPCSEQADV; -- rv 0
  CH1_TXUSRCLK2_in <= '0' when (CH1_TXUSRCLK2 = 'U') else CH1_TXUSRCLK2; -- rv 0
  CH1_TXUSRCLK_in <= '0' when (CH1_TXUSRCLK = 'U') else CH1_TXUSRCLK; -- rv 0
  CH1_TXUSRRDY_in <= '0' when (CH1_TXUSRRDY = 'U') else CH1_TXUSRRDY; -- rv 0
  DRPADDR_in(0) <= '0' when (DRPADDR(0) = 'U') else DRPADDR(0); -- rv 0
  DRPADDR_in(1) <= '0' when (DRPADDR(1) = 'U') else DRPADDR(1); -- rv 0
  DRPADDR_in(10) <= '0' when (DRPADDR(10) = 'U') else DRPADDR(10); -- rv 0
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
  DRPRST_in <= '0' when (DRPRST = 'U') else DRPRST; -- rv 0
  DRPWE_in <= '0' when (DRPWE = 'U') else DRPWE; -- rv 0
  FECCTRLRX0BITSLIPFS_in <= '0' when (FECCTRLRX0BITSLIPFS = 'U') else FECCTRLRX0BITSLIPFS; -- rv 0
  FECCTRLRX1BITSLIPFS_in <= '0' when (FECCTRLRX1BITSLIPFS = 'U') else FECCTRLRX1BITSLIPFS; -- rv 0
  GTGREFCLK2PLL_in <= GTGREFCLK2PLL;
  GTNORTHREFCLK_in <= GTNORTHREFCLK;
  GTREFCLK_in <= GTREFCLK;
  GTSOUTHREFCLK_in <= GTSOUTHREFCLK;
  PLLFBDIV_in(0) <= '0' when (PLLFBDIV(0) = 'U') else PLLFBDIV(0); -- rv 0
  PLLFBDIV_in(1) <= '0' when (PLLFBDIV(1) = 'U') else PLLFBDIV(1); -- rv 0
  PLLFBDIV_in(2) <= '0' when (PLLFBDIV(2) = 'U') else PLLFBDIV(2); -- rv 0
  PLLFBDIV_in(3) <= '0' when (PLLFBDIV(3) = 'U') else PLLFBDIV(3); -- rv 0
  PLLFBDIV_in(4) <= '0' when (PLLFBDIV(4) = 'U') else PLLFBDIV(4); -- rv 0
  PLLFBDIV_in(5) <= '0' when (PLLFBDIV(5) = 'U') else PLLFBDIV(5); -- rv 0
  PLLFBDIV_in(6) <= '0' when (PLLFBDIV(6) = 'U') else PLLFBDIV(6); -- rv 0
  PLLFBDIV_in(7) <= '0' when (PLLFBDIV(7) = 'U') else PLLFBDIV(7); -- rv 0
  PLLMONCLK_in <= '1' when (PLLMONCLK = 'U') else PLLMONCLK; -- rv 1
  PLLPD_in <= '0' when (PLLPD = 'U') else PLLPD; -- rv 0
  PLLREFCLKSEL_in(0) <= '1' when (PLLREFCLKSEL(0) = 'U') else PLLREFCLKSEL(0); -- rv 1
  PLLREFCLKSEL_in(1) <= '0' when (PLLREFCLKSEL(1) = 'U') else PLLREFCLKSEL(1); -- rv 0
  PLLREFCLKSEL_in(2) <= '0' when (PLLREFCLKSEL(2) = 'U') else PLLREFCLKSEL(2); -- rv 0
  PLLRESETBYPASSMODE_in <= '0' when (PLLRESETBYPASSMODE = 'U') else PLLRESETBYPASSMODE; -- rv 0
  PLLRESETMASK_in(0) <= '0' when (PLLRESETMASK(0) = 'U') else PLLRESETMASK(0); -- rv 0
  PLLRESETMASK_in(1) <= '0' when (PLLRESETMASK(1) = 'U') else PLLRESETMASK(1); -- rv 0
  PLLRESET_in <= '1' when (PLLRESET = 'U') else PLLRESET; -- rv 1
  PLLRSVDIN_in(0) <= '1' when (PLLRSVDIN(0) = 'U') else PLLRSVDIN(0); -- rv 1
  PLLRSVDIN_in(1) <= '0' when (PLLRSVDIN(1) = 'U') else PLLRSVDIN(1); -- rv 0
  PLLRSVDIN_in(10) <= '0' when (PLLRSVDIN(10) = 'U') else PLLRSVDIN(10); -- rv 0
  PLLRSVDIN_in(11) <= '0' when (PLLRSVDIN(11) = 'U') else PLLRSVDIN(11); -- rv 0
  PLLRSVDIN_in(12) <= '0' when (PLLRSVDIN(12) = 'U') else PLLRSVDIN(12); -- rv 0
  PLLRSVDIN_in(13) <= '0' when (PLLRSVDIN(13) = 'U') else PLLRSVDIN(13); -- rv 0
  PLLRSVDIN_in(14) <= '0' when (PLLRSVDIN(14) = 'U') else PLLRSVDIN(14); -- rv 0
  PLLRSVDIN_in(15) <= '0' when (PLLRSVDIN(15) = 'U') else PLLRSVDIN(15); -- rv 0
  PLLRSVDIN_in(2) <= '0' when (PLLRSVDIN(2) = 'U') else PLLRSVDIN(2); -- rv 0
  PLLRSVDIN_in(3) <= '0' when (PLLRSVDIN(3) = 'U') else PLLRSVDIN(3); -- rv 0
  PLLRSVDIN_in(4) <= '0' when (PLLRSVDIN(4) = 'U') else PLLRSVDIN(4); -- rv 0
  PLLRSVDIN_in(5) <= '0' when (PLLRSVDIN(5) = 'U') else PLLRSVDIN(5); -- rv 0
  PLLRSVDIN_in(6) <= '0' when (PLLRSVDIN(6) = 'U') else PLLRSVDIN(6); -- rv 0
  PLLRSVDIN_in(7) <= '0' when (PLLRSVDIN(7) = 'U') else PLLRSVDIN(7); -- rv 0
  PLLRSVDIN_in(8) <= '0' when (PLLRSVDIN(8) = 'U') else PLLRSVDIN(8); -- rv 0
  PLLRSVDIN_in(9) <= '0' when (PLLRSVDIN(9) = 'U') else PLLRSVDIN(9); -- rv 0
  RCALENB_in <= RCALENB;
  SDMDATA_in(0) <= '0' when (SDMDATA(0) = 'U') else SDMDATA(0); -- rv 0
  SDMDATA_in(1) <= '0' when (SDMDATA(1) = 'U') else SDMDATA(1); -- rv 0
  SDMDATA_in(10) <= '0' when (SDMDATA(10) = 'U') else SDMDATA(10); -- rv 0
  SDMDATA_in(11) <= '0' when (SDMDATA(11) = 'U') else SDMDATA(11); -- rv 0
  SDMDATA_in(12) <= '0' when (SDMDATA(12) = 'U') else SDMDATA(12); -- rv 0
  SDMDATA_in(13) <= '0' when (SDMDATA(13) = 'U') else SDMDATA(13); -- rv 0
  SDMDATA_in(14) <= '0' when (SDMDATA(14) = 'U') else SDMDATA(14); -- rv 0
  SDMDATA_in(15) <= '0' when (SDMDATA(15) = 'U') else SDMDATA(15); -- rv 0
  SDMDATA_in(16) <= '0' when (SDMDATA(16) = 'U') else SDMDATA(16); -- rv 0
  SDMDATA_in(17) <= '0' when (SDMDATA(17) = 'U') else SDMDATA(17); -- rv 0
  SDMDATA_in(18) <= '0' when (SDMDATA(18) = 'U') else SDMDATA(18); -- rv 0
  SDMDATA_in(19) <= '0' when (SDMDATA(19) = 'U') else SDMDATA(19); -- rv 0
  SDMDATA_in(2) <= '0' when (SDMDATA(2) = 'U') else SDMDATA(2); -- rv 0
  SDMDATA_in(20) <= '0' when (SDMDATA(20) = 'U') else SDMDATA(20); -- rv 0
  SDMDATA_in(21) <= '0' when (SDMDATA(21) = 'U') else SDMDATA(21); -- rv 0
  SDMDATA_in(22) <= '0' when (SDMDATA(22) = 'U') else SDMDATA(22); -- rv 0
  SDMDATA_in(23) <= '0' when (SDMDATA(23) = 'U') else SDMDATA(23); -- rv 0
  SDMDATA_in(24) <= '0' when (SDMDATA(24) = 'U') else SDMDATA(24); -- rv 0
  SDMDATA_in(25) <= '0' when (SDMDATA(25) = 'U') else SDMDATA(25); -- rv 0
  SDMDATA_in(3) <= '0' when (SDMDATA(3) = 'U') else SDMDATA(3); -- rv 0
  SDMDATA_in(4) <= '0' when (SDMDATA(4) = 'U') else SDMDATA(4); -- rv 0
  SDMDATA_in(5) <= '0' when (SDMDATA(5) = 'U') else SDMDATA(5); -- rv 0
  SDMDATA_in(6) <= '0' when (SDMDATA(6) = 'U') else SDMDATA(6); -- rv 0
  SDMDATA_in(7) <= '0' when (SDMDATA(7) = 'U') else SDMDATA(7); -- rv 0
  SDMDATA_in(8) <= '0' when (SDMDATA(8) = 'U') else SDMDATA(8); -- rv 0
  SDMDATA_in(9) <= '0' when (SDMDATA(9) = 'U') else SDMDATA(9); -- rv 0
  SDMTOGGLE_in <= '0' when (SDMTOGGLE = 'U') else SDMTOGGLE; -- rv 0
  
  CH0_PCSSCANCLK_in <= "11"; -- tie off
  CH0_PMASCANCLK_in <= "111111111"; -- tie off
  CH0_TSTCLK0_in <= '1'; -- tie off
  CH0_TSTCLK1_in <= '1'; -- tie off
  CH1_PCSSCANCLK_in <= "11"; -- tie off
  CH1_PMASCANCLK_in <= "111111111"; -- tie off
  CH1_TSTCLK0_in <= '1'; -- tie off
  CH1_TSTCLK1_in <= '1'; -- tie off
  CLKTESTSIG_in <= '1'; -- tie off
  FECSCANCLK_in <= '1'; -- tie off
  PLLSCANCLK_in <= "1111"; -- tie off

  CH0_BSRSERIAL_in <= '1'; -- tie off
  CH0_PCSSCANENB_in <= '1'; -- tie off
  CH0_PCSSCANIN_in <= "111111111111111"; -- tie off
  CH0_PCSSCANMODEB_in <= '1'; -- tie off
  CH0_PCSSCANRSTB_in <= '1'; -- tie off
  CH0_PCSSCANRSTEN_in <= '1'; -- tie off
  CH0_PMASCANENB_in <= '1'; -- tie off
  CH0_PMASCANIN_in <= "1111111111111111111111111"; -- tie off
  CH0_PMASCANMODEB_in <= '1'; -- tie off
  CH0_PMASCANRSTEN_in <= '1'; -- tie off
  CH1_BSRSERIAL_in <= '1'; -- tie off
  CH1_PCSSCANENB_in <= '1'; -- tie off
  CH1_PCSSCANIN_in <= "111111111111111"; -- tie off
  CH1_PCSSCANMODEB_in <= '1'; -- tie off
  CH1_PCSSCANRSTB_in <= '1'; -- tie off
  CH1_PCSSCANRSTEN_in <= '1'; -- tie off
  CH1_PMASCANENB_in <= '1'; -- tie off
  CH1_PMASCANIN_in <= "1111111111111111111111111"; -- tie off
  CH1_PMASCANMODEB_in <= '1'; -- tie off
  CH1_PMASCANRSTEN_in <= '1'; -- tie off
  FECSCANENB_in <= '1'; -- tie off
  FECSCANIN_in <= "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
  FECSCANMODEB_in <= '1'; -- tie off
  FECSCANRSTB_in <= '1'; -- tie off
  GTREFCLKPD_in <= '1'; -- tie off
  PLLSCANENB_in <= '1'; -- tie off
  PLLSCANIN_in <= "11111111"; -- tie off
  PLLSCANMODEB_in <= '1'; -- tie off
  PLLSCANRSTEN_in <= '1'; -- tie off
  RCALSEL_in <= "11"; -- tie off
  REFCLK2HROW_in <= '1'; -- tie off

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DATARATE check
        if((xil_attr_test) or
           ((DATARATE < 9.800) or (DATARATE > 58.000))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-406] DATARATE attribute is set to "));
          Write ( Message, DATARATE);
          Write ( Message, string'(". Legal values for this attribute are 9.800 to 58.000. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- FEC_MODE check
      if((xil_attr_test) or
         ((FEC_MODE /= "BYPASS") and 
          (FEC_MODE /= "KP4"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-436] FEC_MODE attribute is set to """));
        Write ( Message, string'(FEC_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""BYPASS"" or "));
        Write ( Message, string'("""KP4"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- INS_LOSS_NYQ check
        if((xil_attr_test) or
           ((INS_LOSS_NYQ < 0.000) or (INS_LOSS_NYQ > 60.000))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-437] INS_LOSS_NYQ attribute is set to "));
          Write ( Message, INS_LOSS_NYQ);
          Write ( Message, string'(". Legal values for this attribute are 0.000 to 60.000. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- INTERFACE_WIDTH check
        if((xil_attr_test) or
           ((INTERFACE_WIDTH < 64) or (INTERFACE_WIDTH > 256))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-438] INTERFACE_WIDTH attribute is set to "));
          Write ( Message, INTERFACE_WIDTH);
          Write ( Message, string'(". Legal values for this attribute are 64 to 256. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- MODULATION_MODE check
      if((xil_attr_test) or
         ((MODULATION_MODE /= "NRZ") and 
          (MODULATION_MODE /= "PAM4"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-439] MODULATION_MODE attribute is set to """));
        Write ( Message, string'(MODULATION_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""NRZ"" or "));
        Write ( Message, string'("""PAM4"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PLL_IPS_REFCLK_SEL check
      if((xil_attr_test) or
         ((PLL_IPS_REFCLK_SEL /= 0) and 
          (PLL_IPS_REFCLK_SEL /= 1) and 
          (PLL_IPS_REFCLK_SEL /= 2) and 
          (PLL_IPS_REFCLK_SEL /= 3) and 
          (PLL_IPS_REFCLK_SEL /= 4) and 
          (PLL_IPS_REFCLK_SEL /= 5) and 
          (PLL_IPS_REFCLK_SEL /= 6) and 
          (PLL_IPS_REFCLK_SEL /= 7))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-450] PLL_IPS_REFCLK_SEL attribute is set to "));
        Write ( Message, PLL_IPS_REFCLK_SEL);
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
        Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-461] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- TX_AMPLITUDE_SWING check
        if((xil_attr_test) or
           ((TX_AMPLITUDE_SWING < 250) or (TX_AMPLITUDE_SWING > 1025))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-462] TX_AMPLITUDE_SWING attribute is set to "));
          Write ( Message, TX_AMPLITUDE_SWING);
          Write ( Message, string'(". Legal values for this attribute are 250 to 1025. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-109] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTM_DUAL_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    
    SIP_GTM_DUAL_INST : SIP_GTM_DUAL
      port map (
        A_CFG                => A_CFG_BIN,
        A_SDM_DATA_CFG0      => A_SDM_DATA_CFG0_BIN,
        A_SDM_DATA_CFG1      => A_SDM_DATA_CFG1_BIN,
        BIAS_CFG0            => BIAS_CFG0_BIN,
        BIAS_CFG1            => BIAS_CFG1_BIN,
        BIAS_CFG2            => BIAS_CFG2_BIN,
        BIAS_CFG3            => BIAS_CFG3_BIN,
        BIAS_CFG4            => BIAS_CFG4_BIN,
        BIAS_CFG5            => BIAS_CFG5_BIN,
        BIAS_CFG6            => BIAS_CFG6_BIN,
        BIAS_CFG7            => BIAS_CFG7_BIN,
        CH0_A_CH_CFG0        => CH0_A_CH_CFG0_BIN,
        CH0_A_CH_CFG1        => CH0_A_CH_CFG1_BIN,
        CH0_A_CH_CFG2        => CH0_A_CH_CFG2_BIN,
        CH0_A_CH_CFG3        => CH0_A_CH_CFG3_BIN,
        CH0_A_CH_CFG4        => CH0_A_CH_CFG4_BIN,
        CH0_A_CH_CFG5        => CH0_A_CH_CFG5_BIN,
        CH0_A_CH_CFG6        => CH0_A_CH_CFG6_BIN,
        CH0_RST_LP_CFG0      => CH0_RST_LP_CFG0_BIN,
        CH0_RST_LP_CFG1      => CH0_RST_LP_CFG1_BIN,
        CH0_RST_LP_CFG2      => CH0_RST_LP_CFG2_BIN,
        CH0_RST_LP_CFG3      => CH0_RST_LP_CFG3_BIN,
        CH0_RST_LP_CFG4      => CH0_RST_LP_CFG4_BIN,
        CH0_RST_LP_ID_CFG0   => CH0_RST_LP_ID_CFG0_BIN,
        CH0_RST_LP_ID_CFG1   => CH0_RST_LP_ID_CFG1_BIN,
        CH0_RST_TIME_CFG0    => CH0_RST_TIME_CFG0_BIN,
        CH0_RST_TIME_CFG1    => CH0_RST_TIME_CFG1_BIN,
        CH0_RST_TIME_CFG2    => CH0_RST_TIME_CFG2_BIN,
        CH0_RST_TIME_CFG3    => CH0_RST_TIME_CFG3_BIN,
        CH0_RST_TIME_CFG4    => CH0_RST_TIME_CFG4_BIN,
        CH0_RST_TIME_CFG5    => CH0_RST_TIME_CFG5_BIN,
        CH0_RST_TIME_CFG6    => CH0_RST_TIME_CFG6_BIN,
        CH0_RX_ADC_CFG0      => CH0_RX_ADC_CFG0_BIN,
        CH0_RX_ADC_CFG1      => CH0_RX_ADC_CFG1_BIN,
        CH0_RX_ANA_CFG0      => CH0_RX_ANA_CFG0_BIN,
        CH0_RX_ANA_CFG1      => CH0_RX_ANA_CFG1_BIN,
        CH0_RX_ANA_CFG2      => CH0_RX_ANA_CFG2_BIN,
        CH0_RX_APT_CFG0A     => CH0_RX_APT_CFG0A_BIN,
        CH0_RX_APT_CFG0B     => CH0_RX_APT_CFG0B_BIN,
        CH0_RX_APT_CFG10A    => CH0_RX_APT_CFG10A_BIN,
        CH0_RX_APT_CFG10B    => CH0_RX_APT_CFG10B_BIN,
        CH0_RX_APT_CFG11A    => CH0_RX_APT_CFG11A_BIN,
        CH0_RX_APT_CFG11B    => CH0_RX_APT_CFG11B_BIN,
        CH0_RX_APT_CFG12A    => CH0_RX_APT_CFG12A_BIN,
        CH0_RX_APT_CFG12B    => CH0_RX_APT_CFG12B_BIN,
        CH0_RX_APT_CFG13A    => CH0_RX_APT_CFG13A_BIN,
        CH0_RX_APT_CFG13B    => CH0_RX_APT_CFG13B_BIN,
        CH0_RX_APT_CFG14A    => CH0_RX_APT_CFG14A_BIN,
        CH0_RX_APT_CFG14B    => CH0_RX_APT_CFG14B_BIN,
        CH0_RX_APT_CFG15A    => CH0_RX_APT_CFG15A_BIN,
        CH0_RX_APT_CFG15B    => CH0_RX_APT_CFG15B_BIN,
        CH0_RX_APT_CFG16A    => CH0_RX_APT_CFG16A_BIN,
        CH0_RX_APT_CFG16B    => CH0_RX_APT_CFG16B_BIN,
        CH0_RX_APT_CFG17A    => CH0_RX_APT_CFG17A_BIN,
        CH0_RX_APT_CFG17B    => CH0_RX_APT_CFG17B_BIN,
        CH0_RX_APT_CFG18A    => CH0_RX_APT_CFG18A_BIN,
        CH0_RX_APT_CFG18B    => CH0_RX_APT_CFG18B_BIN,
        CH0_RX_APT_CFG19A    => CH0_RX_APT_CFG19A_BIN,
        CH0_RX_APT_CFG19B    => CH0_RX_APT_CFG19B_BIN,
        CH0_RX_APT_CFG1A     => CH0_RX_APT_CFG1A_BIN,
        CH0_RX_APT_CFG1B     => CH0_RX_APT_CFG1B_BIN,
        CH0_RX_APT_CFG20A    => CH0_RX_APT_CFG20A_BIN,
        CH0_RX_APT_CFG20B    => CH0_RX_APT_CFG20B_BIN,
        CH0_RX_APT_CFG21A    => CH0_RX_APT_CFG21A_BIN,
        CH0_RX_APT_CFG21B    => CH0_RX_APT_CFG21B_BIN,
        CH0_RX_APT_CFG22A    => CH0_RX_APT_CFG22A_BIN,
        CH0_RX_APT_CFG22B    => CH0_RX_APT_CFG22B_BIN,
        CH0_RX_APT_CFG23A    => CH0_RX_APT_CFG23A_BIN,
        CH0_RX_APT_CFG23B    => CH0_RX_APT_CFG23B_BIN,
        CH0_RX_APT_CFG24A    => CH0_RX_APT_CFG24A_BIN,
        CH0_RX_APT_CFG24B    => CH0_RX_APT_CFG24B_BIN,
        CH0_RX_APT_CFG25A    => CH0_RX_APT_CFG25A_BIN,
        CH0_RX_APT_CFG25B    => CH0_RX_APT_CFG25B_BIN,
        CH0_RX_APT_CFG26A    => CH0_RX_APT_CFG26A_BIN,
        CH0_RX_APT_CFG26B    => CH0_RX_APT_CFG26B_BIN,
        CH0_RX_APT_CFG27A    => CH0_RX_APT_CFG27A_BIN,
        CH0_RX_APT_CFG27B    => CH0_RX_APT_CFG27B_BIN,
        CH0_RX_APT_CFG28A    => CH0_RX_APT_CFG28A_BIN,
        CH0_RX_APT_CFG28B    => CH0_RX_APT_CFG28B_BIN,
        CH0_RX_APT_CFG2A     => CH0_RX_APT_CFG2A_BIN,
        CH0_RX_APT_CFG2B     => CH0_RX_APT_CFG2B_BIN,
        CH0_RX_APT_CFG3A     => CH0_RX_APT_CFG3A_BIN,
        CH0_RX_APT_CFG3B     => CH0_RX_APT_CFG3B_BIN,
        CH0_RX_APT_CFG4A     => CH0_RX_APT_CFG4A_BIN,
        CH0_RX_APT_CFG4B     => CH0_RX_APT_CFG4B_BIN,
        CH0_RX_APT_CFG5A     => CH0_RX_APT_CFG5A_BIN,
        CH0_RX_APT_CFG5B     => CH0_RX_APT_CFG5B_BIN,
        CH0_RX_APT_CFG6A     => CH0_RX_APT_CFG6A_BIN,
        CH0_RX_APT_CFG6B     => CH0_RX_APT_CFG6B_BIN,
        CH0_RX_APT_CFG7A     => CH0_RX_APT_CFG7A_BIN,
        CH0_RX_APT_CFG7B     => CH0_RX_APT_CFG7B_BIN,
        CH0_RX_APT_CFG8A     => CH0_RX_APT_CFG8A_BIN,
        CH0_RX_APT_CFG8B     => CH0_RX_APT_CFG8B_BIN,
        CH0_RX_APT_CFG9A     => CH0_RX_APT_CFG9A_BIN,
        CH0_RX_APT_CFG9B     => CH0_RX_APT_CFG9B_BIN,
        CH0_RX_APT_CTRL_CFG2 => CH0_RX_APT_CTRL_CFG2_BIN,
        CH0_RX_APT_CTRL_CFG3 => CH0_RX_APT_CTRL_CFG3_BIN,
        CH0_RX_CAL_CFG0A     => CH0_RX_CAL_CFG0A_BIN,
        CH0_RX_CAL_CFG0B     => CH0_RX_CAL_CFG0B_BIN,
        CH0_RX_CAL_CFG1A     => CH0_RX_CAL_CFG1A_BIN,
        CH0_RX_CAL_CFG1B     => CH0_RX_CAL_CFG1B_BIN,
        CH0_RX_CAL_CFG2A     => CH0_RX_CAL_CFG2A_BIN,
        CH0_RX_CAL_CFG2B     => CH0_RX_CAL_CFG2B_BIN,
        CH0_RX_CDR_CFG0A     => CH0_RX_CDR_CFG0A_BIN,
        CH0_RX_CDR_CFG0B     => CH0_RX_CDR_CFG0B_BIN,
        CH0_RX_CDR_CFG1A     => CH0_RX_CDR_CFG1A_BIN,
        CH0_RX_CDR_CFG1B     => CH0_RX_CDR_CFG1B_BIN,
        CH0_RX_CDR_CFG2A     => CH0_RX_CDR_CFG2A_BIN,
        CH0_RX_CDR_CFG2B     => CH0_RX_CDR_CFG2B_BIN,
        CH0_RX_CDR_CFG3A     => CH0_RX_CDR_CFG3A_BIN,
        CH0_RX_CDR_CFG3B     => CH0_RX_CDR_CFG3B_BIN,
        CH0_RX_CDR_CFG4A     => CH0_RX_CDR_CFG4A_BIN,
        CH0_RX_CDR_CFG4B     => CH0_RX_CDR_CFG4B_BIN,
        CH0_RX_CLKGN_CFG0    => CH0_RX_CLKGN_CFG0_BIN,
        CH0_RX_CLKGN_CFG1    => CH0_RX_CLKGN_CFG1_BIN,
        CH0_RX_CTLE_CFG0     => CH0_RX_CTLE_CFG0_BIN,
        CH0_RX_CTLE_CFG1     => CH0_RX_CTLE_CFG1_BIN,
        CH0_RX_CTLE_CFG2     => CH0_RX_CTLE_CFG2_BIN,
        CH0_RX_CTLE_CFG3     => CH0_RX_CTLE_CFG3_BIN,
        CH0_RX_DSP_CFG       => CH0_RX_DSP_CFG_BIN,
        CH0_RX_MON_CFG       => CH0_RX_MON_CFG_BIN,
        CH0_RX_PAD_CFG0      => CH0_RX_PAD_CFG0_BIN,
        CH0_RX_PAD_CFG1      => CH0_RX_PAD_CFG1_BIN,
        CH0_RX_PCS_CFG0      => CH0_RX_PCS_CFG0_BIN,
        CH0_RX_PCS_CFG1      => CH0_RX_PCS_CFG1_BIN,
        CH0_TX_ANA_CFG0      => CH0_TX_ANA_CFG0_BIN,
        CH0_TX_ANA_CFG1      => CH0_TX_ANA_CFG1_BIN,
        CH0_TX_ANA_CFG2      => CH0_TX_ANA_CFG2_BIN,
        CH0_TX_ANA_CFG3      => CH0_TX_ANA_CFG3_BIN,
        CH0_TX_ANA_CFG4      => CH0_TX_ANA_CFG4_BIN,
        CH0_TX_CAL_CFG0      => CH0_TX_CAL_CFG0_BIN,
        CH0_TX_CAL_CFG1      => CH0_TX_CAL_CFG1_BIN,
        CH0_TX_DRV_CFG0      => CH0_TX_DRV_CFG0_BIN,
        CH0_TX_DRV_CFG1      => CH0_TX_DRV_CFG1_BIN,
        CH0_TX_DRV_CFG2      => CH0_TX_DRV_CFG2_BIN,
        CH0_TX_DRV_CFG3      => CH0_TX_DRV_CFG3_BIN,
        CH0_TX_DRV_CFG4      => CH0_TX_DRV_CFG4_BIN,
        CH0_TX_DRV_CFG5      => CH0_TX_DRV_CFG5_BIN,
        CH0_TX_LPBK_CFG0     => CH0_TX_LPBK_CFG0_BIN,
        CH0_TX_LPBK_CFG1     => CH0_TX_LPBK_CFG1_BIN,
        CH0_TX_PCS_CFG0      => CH0_TX_PCS_CFG0_BIN,
        CH0_TX_PCS_CFG1      => CH0_TX_PCS_CFG1_BIN,
        CH0_TX_PCS_CFG10     => CH0_TX_PCS_CFG10_BIN,
        CH0_TX_PCS_CFG11     => CH0_TX_PCS_CFG11_BIN,
        CH0_TX_PCS_CFG12     => CH0_TX_PCS_CFG12_BIN,
        CH0_TX_PCS_CFG13     => CH0_TX_PCS_CFG13_BIN,
        CH0_TX_PCS_CFG14     => CH0_TX_PCS_CFG14_BIN,
        CH0_TX_PCS_CFG15     => CH0_TX_PCS_CFG15_BIN,
        CH0_TX_PCS_CFG16     => CH0_TX_PCS_CFG16_BIN,
        CH0_TX_PCS_CFG17     => CH0_TX_PCS_CFG17_BIN,
        CH0_TX_PCS_CFG2      => CH0_TX_PCS_CFG2_BIN,
        CH0_TX_PCS_CFG3      => CH0_TX_PCS_CFG3_BIN,
        CH0_TX_PCS_CFG4      => CH0_TX_PCS_CFG4_BIN,
        CH0_TX_PCS_CFG5      => CH0_TX_PCS_CFG5_BIN,
        CH0_TX_PCS_CFG6      => CH0_TX_PCS_CFG6_BIN,
        CH0_TX_PCS_CFG7      => CH0_TX_PCS_CFG7_BIN,
        CH0_TX_PCS_CFG8      => CH0_TX_PCS_CFG8_BIN,
        CH0_TX_PCS_CFG9      => CH0_TX_PCS_CFG9_BIN,
        CH1_A_CH_CFG0        => CH1_A_CH_CFG0_BIN,
        CH1_A_CH_CFG1        => CH1_A_CH_CFG1_BIN,
        CH1_A_CH_CFG2        => CH1_A_CH_CFG2_BIN,
        CH1_A_CH_CFG3        => CH1_A_CH_CFG3_BIN,
        CH1_A_CH_CFG4        => CH1_A_CH_CFG4_BIN,
        CH1_A_CH_CFG5        => CH1_A_CH_CFG5_BIN,
        CH1_A_CH_CFG6        => CH1_A_CH_CFG6_BIN,
        CH1_RST_LP_CFG0      => CH1_RST_LP_CFG0_BIN,
        CH1_RST_LP_CFG1      => CH1_RST_LP_CFG1_BIN,
        CH1_RST_LP_CFG2      => CH1_RST_LP_CFG2_BIN,
        CH1_RST_LP_CFG3      => CH1_RST_LP_CFG3_BIN,
        CH1_RST_LP_CFG4      => CH1_RST_LP_CFG4_BIN,
        CH1_RST_LP_ID_CFG0   => CH1_RST_LP_ID_CFG0_BIN,
        CH1_RST_LP_ID_CFG1   => CH1_RST_LP_ID_CFG1_BIN,
        CH1_RST_TIME_CFG0    => CH1_RST_TIME_CFG0_BIN,
        CH1_RST_TIME_CFG1    => CH1_RST_TIME_CFG1_BIN,
        CH1_RST_TIME_CFG2    => CH1_RST_TIME_CFG2_BIN,
        CH1_RST_TIME_CFG3    => CH1_RST_TIME_CFG3_BIN,
        CH1_RST_TIME_CFG4    => CH1_RST_TIME_CFG4_BIN,
        CH1_RST_TIME_CFG5    => CH1_RST_TIME_CFG5_BIN,
        CH1_RST_TIME_CFG6    => CH1_RST_TIME_CFG6_BIN,
        CH1_RX_ADC_CFG0      => CH1_RX_ADC_CFG0_BIN,
        CH1_RX_ADC_CFG1      => CH1_RX_ADC_CFG1_BIN,
        CH1_RX_ANA_CFG0      => CH1_RX_ANA_CFG0_BIN,
        CH1_RX_ANA_CFG1      => CH1_RX_ANA_CFG1_BIN,
        CH1_RX_ANA_CFG2      => CH1_RX_ANA_CFG2_BIN,
        CH1_RX_APT_CFG0A     => CH1_RX_APT_CFG0A_BIN,
        CH1_RX_APT_CFG0B     => CH1_RX_APT_CFG0B_BIN,
        CH1_RX_APT_CFG10A    => CH1_RX_APT_CFG10A_BIN,
        CH1_RX_APT_CFG10B    => CH1_RX_APT_CFG10B_BIN,
        CH1_RX_APT_CFG11A    => CH1_RX_APT_CFG11A_BIN,
        CH1_RX_APT_CFG11B    => CH1_RX_APT_CFG11B_BIN,
        CH1_RX_APT_CFG12A    => CH1_RX_APT_CFG12A_BIN,
        CH1_RX_APT_CFG12B    => CH1_RX_APT_CFG12B_BIN,
        CH1_RX_APT_CFG13A    => CH1_RX_APT_CFG13A_BIN,
        CH1_RX_APT_CFG13B    => CH1_RX_APT_CFG13B_BIN,
        CH1_RX_APT_CFG14A    => CH1_RX_APT_CFG14A_BIN,
        CH1_RX_APT_CFG14B    => CH1_RX_APT_CFG14B_BIN,
        CH1_RX_APT_CFG15A    => CH1_RX_APT_CFG15A_BIN,
        CH1_RX_APT_CFG15B    => CH1_RX_APT_CFG15B_BIN,
        CH1_RX_APT_CFG16A    => CH1_RX_APT_CFG16A_BIN,
        CH1_RX_APT_CFG16B    => CH1_RX_APT_CFG16B_BIN,
        CH1_RX_APT_CFG17A    => CH1_RX_APT_CFG17A_BIN,
        CH1_RX_APT_CFG17B    => CH1_RX_APT_CFG17B_BIN,
        CH1_RX_APT_CFG18A    => CH1_RX_APT_CFG18A_BIN,
        CH1_RX_APT_CFG18B    => CH1_RX_APT_CFG18B_BIN,
        CH1_RX_APT_CFG19A    => CH1_RX_APT_CFG19A_BIN,
        CH1_RX_APT_CFG19B    => CH1_RX_APT_CFG19B_BIN,
        CH1_RX_APT_CFG1A     => CH1_RX_APT_CFG1A_BIN,
        CH1_RX_APT_CFG1B     => CH1_RX_APT_CFG1B_BIN,
        CH1_RX_APT_CFG20A    => CH1_RX_APT_CFG20A_BIN,
        CH1_RX_APT_CFG20B    => CH1_RX_APT_CFG20B_BIN,
        CH1_RX_APT_CFG21A    => CH1_RX_APT_CFG21A_BIN,
        CH1_RX_APT_CFG21B    => CH1_RX_APT_CFG21B_BIN,
        CH1_RX_APT_CFG22A    => CH1_RX_APT_CFG22A_BIN,
        CH1_RX_APT_CFG22B    => CH1_RX_APT_CFG22B_BIN,
        CH1_RX_APT_CFG23A    => CH1_RX_APT_CFG23A_BIN,
        CH1_RX_APT_CFG23B    => CH1_RX_APT_CFG23B_BIN,
        CH1_RX_APT_CFG24A    => CH1_RX_APT_CFG24A_BIN,
        CH1_RX_APT_CFG24B    => CH1_RX_APT_CFG24B_BIN,
        CH1_RX_APT_CFG25A    => CH1_RX_APT_CFG25A_BIN,
        CH1_RX_APT_CFG25B    => CH1_RX_APT_CFG25B_BIN,
        CH1_RX_APT_CFG26A    => CH1_RX_APT_CFG26A_BIN,
        CH1_RX_APT_CFG26B    => CH1_RX_APT_CFG26B_BIN,
        CH1_RX_APT_CFG27A    => CH1_RX_APT_CFG27A_BIN,
        CH1_RX_APT_CFG27B    => CH1_RX_APT_CFG27B_BIN,
        CH1_RX_APT_CFG28A    => CH1_RX_APT_CFG28A_BIN,
        CH1_RX_APT_CFG28B    => CH1_RX_APT_CFG28B_BIN,
        CH1_RX_APT_CFG2A     => CH1_RX_APT_CFG2A_BIN,
        CH1_RX_APT_CFG2B     => CH1_RX_APT_CFG2B_BIN,
        CH1_RX_APT_CFG3A     => CH1_RX_APT_CFG3A_BIN,
        CH1_RX_APT_CFG3B     => CH1_RX_APT_CFG3B_BIN,
        CH1_RX_APT_CFG4A     => CH1_RX_APT_CFG4A_BIN,
        CH1_RX_APT_CFG4B     => CH1_RX_APT_CFG4B_BIN,
        CH1_RX_APT_CFG5A     => CH1_RX_APT_CFG5A_BIN,
        CH1_RX_APT_CFG5B     => CH1_RX_APT_CFG5B_BIN,
        CH1_RX_APT_CFG6A     => CH1_RX_APT_CFG6A_BIN,
        CH1_RX_APT_CFG6B     => CH1_RX_APT_CFG6B_BIN,
        CH1_RX_APT_CFG7A     => CH1_RX_APT_CFG7A_BIN,
        CH1_RX_APT_CFG7B     => CH1_RX_APT_CFG7B_BIN,
        CH1_RX_APT_CFG8A     => CH1_RX_APT_CFG8A_BIN,
        CH1_RX_APT_CFG8B     => CH1_RX_APT_CFG8B_BIN,
        CH1_RX_APT_CFG9A     => CH1_RX_APT_CFG9A_BIN,
        CH1_RX_APT_CFG9B     => CH1_RX_APT_CFG9B_BIN,
        CH1_RX_APT_CTRL_CFG2 => CH1_RX_APT_CTRL_CFG2_BIN,
        CH1_RX_APT_CTRL_CFG3 => CH1_RX_APT_CTRL_CFG3_BIN,
        CH1_RX_CAL_CFG0A     => CH1_RX_CAL_CFG0A_BIN,
        CH1_RX_CAL_CFG0B     => CH1_RX_CAL_CFG0B_BIN,
        CH1_RX_CAL_CFG1A     => CH1_RX_CAL_CFG1A_BIN,
        CH1_RX_CAL_CFG1B     => CH1_RX_CAL_CFG1B_BIN,
        CH1_RX_CAL_CFG2A     => CH1_RX_CAL_CFG2A_BIN,
        CH1_RX_CAL_CFG2B     => CH1_RX_CAL_CFG2B_BIN,
        CH1_RX_CDR_CFG0A     => CH1_RX_CDR_CFG0A_BIN,
        CH1_RX_CDR_CFG0B     => CH1_RX_CDR_CFG0B_BIN,
        CH1_RX_CDR_CFG1A     => CH1_RX_CDR_CFG1A_BIN,
        CH1_RX_CDR_CFG1B     => CH1_RX_CDR_CFG1B_BIN,
        CH1_RX_CDR_CFG2A     => CH1_RX_CDR_CFG2A_BIN,
        CH1_RX_CDR_CFG2B     => CH1_RX_CDR_CFG2B_BIN,
        CH1_RX_CDR_CFG3A     => CH1_RX_CDR_CFG3A_BIN,
        CH1_RX_CDR_CFG3B     => CH1_RX_CDR_CFG3B_BIN,
        CH1_RX_CDR_CFG4A     => CH1_RX_CDR_CFG4A_BIN,
        CH1_RX_CDR_CFG4B     => CH1_RX_CDR_CFG4B_BIN,
        CH1_RX_CLKGN_CFG0    => CH1_RX_CLKGN_CFG0_BIN,
        CH1_RX_CLKGN_CFG1    => CH1_RX_CLKGN_CFG1_BIN,
        CH1_RX_CTLE_CFG0     => CH1_RX_CTLE_CFG0_BIN,
        CH1_RX_CTLE_CFG1     => CH1_RX_CTLE_CFG1_BIN,
        CH1_RX_CTLE_CFG2     => CH1_RX_CTLE_CFG2_BIN,
        CH1_RX_CTLE_CFG3     => CH1_RX_CTLE_CFG3_BIN,
        CH1_RX_DSP_CFG       => CH1_RX_DSP_CFG_BIN,
        CH1_RX_MON_CFG       => CH1_RX_MON_CFG_BIN,
        CH1_RX_PAD_CFG0      => CH1_RX_PAD_CFG0_BIN,
        CH1_RX_PAD_CFG1      => CH1_RX_PAD_CFG1_BIN,
        CH1_RX_PCS_CFG0      => CH1_RX_PCS_CFG0_BIN,
        CH1_RX_PCS_CFG1      => CH1_RX_PCS_CFG1_BIN,
        CH1_TX_ANA_CFG0      => CH1_TX_ANA_CFG0_BIN,
        CH1_TX_ANA_CFG1      => CH1_TX_ANA_CFG1_BIN,
        CH1_TX_ANA_CFG2      => CH1_TX_ANA_CFG2_BIN,
        CH1_TX_ANA_CFG3      => CH1_TX_ANA_CFG3_BIN,
        CH1_TX_ANA_CFG4      => CH1_TX_ANA_CFG4_BIN,
        CH1_TX_CAL_CFG0      => CH1_TX_CAL_CFG0_BIN,
        CH1_TX_CAL_CFG1      => CH1_TX_CAL_CFG1_BIN,
        CH1_TX_DRV_CFG0      => CH1_TX_DRV_CFG0_BIN,
        CH1_TX_DRV_CFG1      => CH1_TX_DRV_CFG1_BIN,
        CH1_TX_DRV_CFG2      => CH1_TX_DRV_CFG2_BIN,
        CH1_TX_DRV_CFG3      => CH1_TX_DRV_CFG3_BIN,
        CH1_TX_DRV_CFG4      => CH1_TX_DRV_CFG4_BIN,
        CH1_TX_DRV_CFG5      => CH1_TX_DRV_CFG5_BIN,
        CH1_TX_LPBK_CFG0     => CH1_TX_LPBK_CFG0_BIN,
        CH1_TX_LPBK_CFG1     => CH1_TX_LPBK_CFG1_BIN,
        CH1_TX_PCS_CFG0      => CH1_TX_PCS_CFG0_BIN,
        CH1_TX_PCS_CFG1      => CH1_TX_PCS_CFG1_BIN,
        CH1_TX_PCS_CFG10     => CH1_TX_PCS_CFG10_BIN,
        CH1_TX_PCS_CFG11     => CH1_TX_PCS_CFG11_BIN,
        CH1_TX_PCS_CFG12     => CH1_TX_PCS_CFG12_BIN,
        CH1_TX_PCS_CFG13     => CH1_TX_PCS_CFG13_BIN,
        CH1_TX_PCS_CFG14     => CH1_TX_PCS_CFG14_BIN,
        CH1_TX_PCS_CFG15     => CH1_TX_PCS_CFG15_BIN,
        CH1_TX_PCS_CFG16     => CH1_TX_PCS_CFG16_BIN,
        CH1_TX_PCS_CFG17     => CH1_TX_PCS_CFG17_BIN,
        CH1_TX_PCS_CFG2      => CH1_TX_PCS_CFG2_BIN,
        CH1_TX_PCS_CFG3      => CH1_TX_PCS_CFG3_BIN,
        CH1_TX_PCS_CFG4      => CH1_TX_PCS_CFG4_BIN,
        CH1_TX_PCS_CFG5      => CH1_TX_PCS_CFG5_BIN,
        CH1_TX_PCS_CFG6      => CH1_TX_PCS_CFG6_BIN,
        CH1_TX_PCS_CFG7      => CH1_TX_PCS_CFG7_BIN,
        CH1_TX_PCS_CFG8      => CH1_TX_PCS_CFG8_BIN,
        CH1_TX_PCS_CFG9      => CH1_TX_PCS_CFG9_BIN,
        DRPEN_CFG            => DRPEN_CFG_BIN,
        FEC_CFG0             => FEC_CFG0_BIN,
        FEC_CFG1             => FEC_CFG1_BIN,
        FEC_CFG10            => FEC_CFG10_BIN,
        FEC_CFG11            => FEC_CFG11_BIN,
        FEC_CFG12            => FEC_CFG12_BIN,
        FEC_CFG13            => FEC_CFG13_BIN,
        FEC_CFG14            => FEC_CFG14_BIN,
        FEC_CFG15            => FEC_CFG15_BIN,
        FEC_CFG16            => FEC_CFG16_BIN,
        FEC_CFG17            => FEC_CFG17_BIN,
        FEC_CFG18            => FEC_CFG18_BIN,
        FEC_CFG19            => FEC_CFG19_BIN,
        FEC_CFG2             => FEC_CFG2_BIN,
        FEC_CFG20            => FEC_CFG20_BIN,
        FEC_CFG21            => FEC_CFG21_BIN,
        FEC_CFG22            => FEC_CFG22_BIN,
        FEC_CFG23            => FEC_CFG23_BIN,
        FEC_CFG24            => FEC_CFG24_BIN,
        FEC_CFG25            => FEC_CFG25_BIN,
        FEC_CFG26            => FEC_CFG26_BIN,
        FEC_CFG27            => FEC_CFG27_BIN,
        FEC_CFG3             => FEC_CFG3_BIN,
        FEC_CFG4             => FEC_CFG4_BIN,
        FEC_CFG5             => FEC_CFG5_BIN,
        FEC_CFG6             => FEC_CFG6_BIN,
        FEC_CFG7             => FEC_CFG7_BIN,
        FEC_CFG8             => FEC_CFG8_BIN,
        FEC_CFG9             => FEC_CFG9_BIN,
        PLL_CFG0             => PLL_CFG0_BIN,
        PLL_CFG1             => PLL_CFG1_BIN,
        PLL_CFG2             => PLL_CFG2_BIN,
        PLL_CFG3             => PLL_CFG3_BIN,
        PLL_CFG4             => PLL_CFG4_BIN,
        PLL_CFG5             => PLL_CFG5_BIN,
        PLL_CFG6             => PLL_CFG6_BIN,
        PLL_CRS_CTRL_CFG0    => PLL_CRS_CTRL_CFG0_BIN,
        PLL_CRS_CTRL_CFG1    => PLL_CRS_CTRL_CFG1_BIN,
        PLL_IPS_PIN_EN       => PLL_IPS_PIN_EN_BIN,
        PLL_IPS_REFCLK_SEL   => PLL_IPS_REFCLK_SEL_BIN,
        RCALSAP_TESTEN       => RCALSAP_TESTEN_BIN,
        RCAL_APROBE          => RCAL_APROBE_BIN,
        RST_CFG              => RST_CFG_BIN,
        RST_PLL_CFG0         => RST_PLL_CFG0_BIN,
        SAP_CFG0             => SAP_CFG0_BIN,
        SDM_CFG0             => SDM_CFG0_BIN,
        SDM_CFG1             => SDM_CFG1_BIN,
        SDM_CFG2             => SDM_CFG2_BIN,
        SDM_SEED_CFG0        => SDM_SEED_CFG0_BIN,
        SDM_SEED_CFG1        => SDM_SEED_CFG1_BIN,
        SIM_DEVICE           => SIM_DEVICE_BIN,
        CH0_AXISTDATA        => CH0_AXISTDATA_out,
        CH0_AXISTLAST        => CH0_AXISTLAST_out,
        CH0_AXISTVALID       => CH0_AXISTVALID_out,
        CH0_DMONITOROUT      => CH0_DMONITOROUT_out,
        CH0_DMONITOROUTCLK   => CH0_DMONITOROUTCLK_out,
        --CH0_GTMTXN           => CH0_GTMTXN_out,
        --CH0_GTMTXP           => CH0_GTMTXP_out,
        CH0_GTMTXN           => CH0_GTMTXN_integer,
        CH0_GTMTXP           => CH0_GTMTXP_integer,
        CH0_PCSRSVDOUT       => CH0_PCSRSVDOUT_out,
        CH0_PCSSCANOUT       => CH0_PCSSCANOUT_out,
        CH0_PMARSVDOUT       => CH0_PMARSVDOUT_out,
        CH0_PMASCANOUT       => CH0_PMASCANOUT_out,
        CH0_RESETEXCEPTION   => CH0_RESETEXCEPTION_out,
        CH0_RXBUFSTATUS      => CH0_RXBUFSTATUS_out,
        CH0_RXDATA           => CH0_RXDATA_out,
        CH0_RXDATAFLAGS      => CH0_RXDATAFLAGS_out,
        CH0_RXDATAISAM       => CH0_RXDATAISAM_out,
        CH0_RXDATASTART      => CH0_RXDATASTART_out,
        CH0_RXOUTCLK         => CH0_RXOUTCLK_out,
        CH0_RXPMARESETDONE   => CH0_RXPMARESETDONE_out,
        CH0_RXPRBSERR        => CH0_RXPRBSERR_out,
        CH0_RXPRBSLOCKED     => CH0_RXPRBSLOCKED_out,
        CH0_RXPRGDIVRESETDONE => CH0_RXPRGDIVRESETDONE_out,
        CH0_RXPROGDIVCLK     => CH0_RXPROGDIVCLK_out,
        CH0_RXRESETDONE      => CH0_RXRESETDONE_out,
        CH0_TXBUFSTATUS      => CH0_TXBUFSTATUS_out,
        CH0_TXOUTCLK         => CH0_TXOUTCLK_out,
        CH0_TXPMARESETDONE   => CH0_TXPMARESETDONE_out,
        CH0_TXPRGDIVRESETDONE => CH0_TXPRGDIVRESETDONE_out,
        CH0_TXPROGDIVCLK     => CH0_TXPROGDIVCLK_out,
        CH0_TXRESETDONE      => CH0_TXRESETDONE_out,
        CH1_AXISTDATA        => CH1_AXISTDATA_out,
        CH1_AXISTLAST        => CH1_AXISTLAST_out,
        CH1_AXISTVALID       => CH1_AXISTVALID_out,
        CH1_DMONITOROUT      => CH1_DMONITOROUT_out,
        CH1_DMONITOROUTCLK   => CH1_DMONITOROUTCLK_out,
        --CH1_GTMTXN           => CH1_GTMTXN_out,
        --CH1_GTMTXP           => CH1_GTMTXP_out,
        CH1_GTMTXN           => CH1_GTMTXN_integer,
        CH1_GTMTXP           => CH1_GTMTXP_integer,
        CH1_PCSRSVDOUT       => CH1_PCSRSVDOUT_out,
        CH1_PCSSCANOUT       => CH1_PCSSCANOUT_out,
        CH1_PMARSVDOUT       => CH1_PMARSVDOUT_out,
        CH1_PMASCANOUT       => CH1_PMASCANOUT_out,
        CH1_RESETEXCEPTION   => CH1_RESETEXCEPTION_out,
        CH1_RXBUFSTATUS      => CH1_RXBUFSTATUS_out,
        CH1_RXDATA           => CH1_RXDATA_out,
        CH1_RXDATAFLAGS      => CH1_RXDATAFLAGS_out,
        CH1_RXDATAISAM       => CH1_RXDATAISAM_out,
        CH1_RXDATASTART      => CH1_RXDATASTART_out,
        CH1_RXOUTCLK         => CH1_RXOUTCLK_out,
        CH1_RXPMARESETDONE   => CH1_RXPMARESETDONE_out,
        CH1_RXPRBSERR        => CH1_RXPRBSERR_out,
        CH1_RXPRBSLOCKED     => CH1_RXPRBSLOCKED_out,
        CH1_RXPRGDIVRESETDONE => CH1_RXPRGDIVRESETDONE_out,
        CH1_RXPROGDIVCLK     => CH1_RXPROGDIVCLK_out,
        CH1_RXRESETDONE      => CH1_RXRESETDONE_out,
        CH1_TXBUFSTATUS      => CH1_TXBUFSTATUS_out,
        CH1_TXOUTCLK         => CH1_TXOUTCLK_out,
        CH1_TXPMARESETDONE   => CH1_TXPMARESETDONE_out,
        CH1_TXPRGDIVRESETDONE => CH1_TXPRGDIVRESETDONE_out,
        CH1_TXPROGDIVCLK     => CH1_TXPROGDIVCLK_out,
        CH1_TXRESETDONE      => CH1_TXRESETDONE_out,
        CLKTESTSIG2PAD       => CLKTESTSIG2PAD_out,
        DMONITOROUTPLLCLK    => DMONITOROUTPLLCLK_out,
        DRPDO                => DRPDO_out,
        DRPRDY               => DRPRDY_out,
        FECRX0ALIGNED        => FECRX0ALIGNED_out,
        FECRX0CORRCWINC      => FECRX0CORRCWINC_out,
        FECRX0CWINC          => FECRX0CWINC_out,
        FECRX0UNCORRCWINC    => FECRX0UNCORRCWINC_out,
        FECRX1ALIGNED        => FECRX1ALIGNED_out,
        FECRX1CORRCWINC      => FECRX1CORRCWINC_out,
        FECRX1CWINC          => FECRX1CWINC_out,
        FECRX1UNCORRCWINC    => FECRX1UNCORRCWINC_out,
        FECRXLN0BITERR0TO1INC => FECRXLN0BITERR0TO1INC_out,
        FECRXLN0BITERR1TO0INC => FECRXLN0BITERR1TO0INC_out,
        FECRXLN0DLY          => FECRXLN0DLY_out,
        FECRXLN0ERRCNTINC    => FECRXLN0ERRCNTINC_out,
        FECRXLN0MAPPING      => FECRXLN0MAPPING_out,
        FECRXLN1BITERR0TO1INC => FECRXLN1BITERR0TO1INC_out,
        FECRXLN1BITERR1TO0INC => FECRXLN1BITERR1TO0INC_out,
        FECRXLN1DLY          => FECRXLN1DLY_out,
        FECRXLN1ERRCNTINC    => FECRXLN1ERRCNTINC_out,
        FECRXLN1MAPPING      => FECRXLN1MAPPING_out,
        FECRXLN2BITERR0TO1INC => FECRXLN2BITERR0TO1INC_out,
        FECRXLN2BITERR1TO0INC => FECRXLN2BITERR1TO0INC_out,
        FECRXLN2DLY          => FECRXLN2DLY_out,
        FECRXLN2ERRCNTINC    => FECRXLN2ERRCNTINC_out,
        FECRXLN2MAPPING      => FECRXLN2MAPPING_out,
        FECRXLN3BITERR0TO1INC => FECRXLN3BITERR0TO1INC_out,
        FECRXLN3BITERR1TO0INC => FECRXLN3BITERR1TO0INC_out,
        FECRXLN3DLY          => FECRXLN3DLY_out,
        FECRXLN3ERRCNTINC    => FECRXLN3ERRCNTINC_out,
        FECRXLN3MAPPING      => FECRXLN3MAPPING_out,
        FECSCANOUT           => FECSCANOUT_out,
        FECTRXLN0LOCK        => FECTRXLN0LOCK_out,
        FECTRXLN1LOCK        => FECTRXLN1LOCK_out,
        FECTRXLN2LOCK        => FECTRXLN2LOCK_out,
        FECTRXLN3LOCK        => FECTRXLN3LOCK_out,
        GTPOWERGOOD          => GTPOWERGOOD_out,
        PLLFBCLKLOST         => PLLFBCLKLOST_out,
        PLLLOCK              => PLLLOCK_out,
        PLLREFCLKLOST        => PLLREFCLKLOST_out,
        PLLREFCLKMONITOR     => PLLREFCLKMONITOR_out,
        PLLRESETDONE         => PLLRESETDONE_out,
        PLLRSVDOUT           => PLLRSVDOUT_out,
        PLLSCANOUT           => PLLSCANOUT_out,
        RCALCMP              => RCALCMP_out,
        RCALOUT              => RCALOUT_out,
        REFCLK2BUFG          => REFCLK2BUFG_out,
        REFCLKPDB_SA         => REFCLKPDB_SA_out,
        RXRECCLK0            => RXRECCLK0_out,
        RXRECCLK1            => RXRECCLK1_out,
        BGBYPASSB            => BGBYPASSB_in,
        BGMONITORENB         => BGMONITORENB_in,
        BGPDB                => BGPDB_in,
        BGRCALOVRD           => BGRCALOVRD_in,
        BGRCALOVRDENB        => BGRCALOVRDENB_in,
        CH0_AXISEN           => CH0_AXISEN_in,
        CH0_AXISRST          => CH0_AXISRST_in,
        CH0_AXISTRDY         => CH0_AXISTRDY_in,
        CH0_BSRSERIAL        => CH0_BSRSERIAL_in,
        CH0_CFGRESET         => CH0_CFGRESET_in,
        CH0_DMONFIFORESET    => CH0_DMONFIFORESET_in,
        CH0_DMONITORCLK      => CH0_DMONITORCLK_in,
        --CH0_GTMRXN           => CH0_GTMRXN_in,
        --CH0_GTMRXP           => CH0_GTMRXP_in,
        CH0_GTMRXN           => CH0_GTMRXN_integer,
        CH0_GTMRXP           => CH0_GTMRXP_integer,
        CH0_GTRXRESET        => CH0_GTRXRESET_in,
        CH0_GTTXRESET        => CH0_GTTXRESET_in,
        CH0_LOOPBACK         => CH0_LOOPBACK_in,
        CH0_PCSRSVDIN        => CH0_PCSRSVDIN_in,
        CH0_PCSSCANCLK       => CH0_PCSSCANCLK_in,
        CH0_PCSSCANENB       => CH0_PCSSCANENB_in,
        CH0_PCSSCANIN        => CH0_PCSSCANIN_in,
        CH0_PCSSCANMODEB     => CH0_PCSSCANMODEB_in,
        CH0_PCSSCANRSTB      => CH0_PCSSCANRSTB_in,
        CH0_PCSSCANRSTEN     => CH0_PCSSCANRSTEN_in,
        CH0_PMARSVDIN        => CH0_PMARSVDIN_in,
        CH0_PMASCANCLK       => CH0_PMASCANCLK_in,
        CH0_PMASCANENB       => CH0_PMASCANENB_in,
        CH0_PMASCANIN        => CH0_PMASCANIN_in,
        CH0_PMASCANMODEB     => CH0_PMASCANMODEB_in,
        CH0_PMASCANRSTEN     => CH0_PMASCANRSTEN_in,
        CH0_RESETOVRD        => CH0_RESETOVRD_in,
        CH0_RXADAPTRESET     => CH0_RXADAPTRESET_in,
        CH0_RXADCCALRESET    => CH0_RXADCCALRESET_in,
        CH0_RXADCCLKGENRESET => CH0_RXADCCLKGENRESET_in,
        CH0_RXBUFRESET       => CH0_RXBUFRESET_in,
        CH0_RXCDRFREQOS      => CH0_RXCDRFREQOS_in,
        CH0_RXCDRFRRESET     => CH0_RXCDRFRRESET_in,
        CH0_RXCDRHOLD        => CH0_RXCDRHOLD_in,
        CH0_RXCDRINCPCTRL    => CH0_RXCDRINCPCTRL_in,
        CH0_RXCDROVRDEN      => CH0_RXCDROVRDEN_in,
        CH0_RXCDRPHRESET     => CH0_RXCDRPHRESET_in,
        CH0_RXDFERESET       => CH0_RXDFERESET_in,
        CH0_RXDSPRESET       => CH0_RXDSPRESET_in,
        CH0_RXEQTRAINING     => CH0_RXEQTRAINING_in,
        CH0_RXEYESCANRESET   => CH0_RXEYESCANRESET_in,
        CH0_RXFECRESET       => CH0_RXFECRESET_in,
        CH0_RXOUTCLKSEL      => CH0_RXOUTCLKSEL_in,
        CH0_RXPCSRESET       => CH0_RXPCSRESET_in,
        CH0_RXPCSRESETMASK   => CH0_RXPCSRESETMASK_in,
        CH0_RXPMARESET       => CH0_RXPMARESET_in,
        CH0_RXPMARESETMASK   => CH0_RXPMARESETMASK_in,
        CH0_RXPOLARITY       => CH0_RXPOLARITY_in,
        CH0_RXPRBSCNTSTOP    => CH0_RXPRBSCNTSTOP_in,
        CH0_RXPRBSCSCNTRST   => CH0_RXPRBSCSCNTRST_in,
        CH0_RXPRBSPTN        => CH0_RXPRBSPTN_in,
        CH0_RXPROGDIVRESET   => CH0_RXPROGDIVRESET_in,
        CH0_RXQPRBSEN        => CH0_RXQPRBSEN_in,
        CH0_RXRESETMODE      => CH0_RXRESETMODE_in,
        CH0_RXSPCSEQADV      => CH0_RXSPCSEQADV_in,
        CH0_RXUSRCLK         => CH0_RXUSRCLK_in,
        CH0_RXUSRCLK2        => CH0_RXUSRCLK2_in,
        CH0_RXUSRRDY         => CH0_RXUSRRDY_in,
        CH0_RXUSRSTART       => CH0_RXUSRSTART_in,
        CH0_RXUSRSTOP        => CH0_RXUSRSTOP_in,
        CH0_TSTCLK0          => CH0_TSTCLK0_in,
        CH0_TSTCLK1          => CH0_TSTCLK1_in,
        CH0_TXCKALRESET      => CH0_TXCKALRESET_in,
        CH0_TXCTLFIRDAT      => CH0_TXCTLFIRDAT_in,
        CH0_TXDATA           => CH0_TXDATA_in,
        CH0_TXDATASTART      => CH0_TXDATASTART_in,
        CH0_TXDRVAMP         => CH0_TXDRVAMP_in,
        CH0_TXEMPMAIN        => CH0_TXEMPMAIN_in,
        CH0_TXEMPPOST        => CH0_TXEMPPOST_in,
        CH0_TXEMPPRE         => CH0_TXEMPPRE_in,
        CH0_TXEMPPRE2        => CH0_TXEMPPRE2_in,
        CH0_TXFECRESET       => CH0_TXFECRESET_in,
        CH0_TXINHIBIT        => CH0_TXINHIBIT_in,
        CH0_TXMUXDCDEXHOLD   => CH0_TXMUXDCDEXHOLD_in,
        CH0_TXMUXDCDORWREN   => CH0_TXMUXDCDORWREN_in,
        CH0_TXOUTCLKSEL      => CH0_TXOUTCLKSEL_in,
        CH0_TXPCSRESET       => CH0_TXPCSRESET_in,
        CH0_TXPCSRESETMASK   => CH0_TXPCSRESETMASK_in,
        CH0_TXPMARESET       => CH0_TXPMARESET_in,
        CH0_TXPMARESETMASK   => CH0_TXPMARESETMASK_in,
        CH0_TXPOLARITY       => CH0_TXPOLARITY_in,
        CH0_TXPRBSINERR      => CH0_TXPRBSINERR_in,
        CH0_TXPRBSPTN        => CH0_TXPRBSPTN_in,
        CH0_TXPROGDIVRESET   => CH0_TXPROGDIVRESET_in,
        CH0_TXQPRBSEN        => CH0_TXQPRBSEN_in,
        CH0_TXRESETMODE      => CH0_TXRESETMODE_in,
        CH0_TXSPCSEQADV      => CH0_TXSPCSEQADV_in,
        CH0_TXUSRCLK         => CH0_TXUSRCLK_in,
        CH0_TXUSRCLK2        => CH0_TXUSRCLK2_in,
        CH0_TXUSRRDY         => CH0_TXUSRRDY_in,
        CH1_AXISEN           => CH1_AXISEN_in,
        CH1_AXISRST          => CH1_AXISRST_in,
        CH1_AXISTRDY         => CH1_AXISTRDY_in,
        CH1_BSRSERIAL        => CH1_BSRSERIAL_in,
        CH1_CFGRESET         => CH1_CFGRESET_in,
        CH1_DMONFIFORESET    => CH1_DMONFIFORESET_in,
        CH1_DMONITORCLK      => CH1_DMONITORCLK_in,
        --CH1_GTMRXN           => CH1_GTMRXN_in,
        --CH1_GTMRXP           => CH1_GTMRXP_in,
        CH1_GTMRXN           => CH1_GTMRXN_integer,
        CH1_GTMRXP           => CH1_GTMRXP_integer,
        CH1_GTRXRESET        => CH1_GTRXRESET_in,
        CH1_GTTXRESET        => CH1_GTTXRESET_in,
        CH1_LOOPBACK         => CH1_LOOPBACK_in,
        CH1_PCSRSVDIN        => CH1_PCSRSVDIN_in,
        CH1_PCSSCANCLK       => CH1_PCSSCANCLK_in,
        CH1_PCSSCANENB       => CH1_PCSSCANENB_in,
        CH1_PCSSCANIN        => CH1_PCSSCANIN_in,
        CH1_PCSSCANMODEB     => CH1_PCSSCANMODEB_in,
        CH1_PCSSCANRSTB      => CH1_PCSSCANRSTB_in,
        CH1_PCSSCANRSTEN     => CH1_PCSSCANRSTEN_in,
        CH1_PMARSVDIN        => CH1_PMARSVDIN_in,
        CH1_PMASCANCLK       => CH1_PMASCANCLK_in,
        CH1_PMASCANENB       => CH1_PMASCANENB_in,
        CH1_PMASCANIN        => CH1_PMASCANIN_in,
        CH1_PMASCANMODEB     => CH1_PMASCANMODEB_in,
        CH1_PMASCANRSTEN     => CH1_PMASCANRSTEN_in,
        CH1_RESETOVRD        => CH1_RESETOVRD_in,
        CH1_RXADAPTRESET     => CH1_RXADAPTRESET_in,
        CH1_RXADCCALRESET    => CH1_RXADCCALRESET_in,
        CH1_RXADCCLKGENRESET => CH1_RXADCCLKGENRESET_in,
        CH1_RXBUFRESET       => CH1_RXBUFRESET_in,
        CH1_RXCDRFREQOS      => CH1_RXCDRFREQOS_in,
        CH1_RXCDRFRRESET     => CH1_RXCDRFRRESET_in,
        CH1_RXCDRHOLD        => CH1_RXCDRHOLD_in,
        CH1_RXCDRINCPCTRL    => CH1_RXCDRINCPCTRL_in,
        CH1_RXCDROVRDEN      => CH1_RXCDROVRDEN_in,
        CH1_RXCDRPHRESET     => CH1_RXCDRPHRESET_in,
        CH1_RXDFERESET       => CH1_RXDFERESET_in,
        CH1_RXDSPRESET       => CH1_RXDSPRESET_in,
        CH1_RXEQTRAINING     => CH1_RXEQTRAINING_in,
        CH1_RXEYESCANRESET   => CH1_RXEYESCANRESET_in,
        CH1_RXFECRESET       => CH1_RXFECRESET_in,
        CH1_RXOUTCLKSEL      => CH1_RXOUTCLKSEL_in,
        CH1_RXPCSRESET       => CH1_RXPCSRESET_in,
        CH1_RXPCSRESETMASK   => CH1_RXPCSRESETMASK_in,
        CH1_RXPMARESET       => CH1_RXPMARESET_in,
        CH1_RXPMARESETMASK   => CH1_RXPMARESETMASK_in,
        CH1_RXPOLARITY       => CH1_RXPOLARITY_in,
        CH1_RXPRBSCNTSTOP    => CH1_RXPRBSCNTSTOP_in,
        CH1_RXPRBSCSCNTRST   => CH1_RXPRBSCSCNTRST_in,
        CH1_RXPRBSPTN        => CH1_RXPRBSPTN_in,
        CH1_RXPROGDIVRESET   => CH1_RXPROGDIVRESET_in,
        CH1_RXQPRBSEN        => CH1_RXQPRBSEN_in,
        CH1_RXRESETMODE      => CH1_RXRESETMODE_in,
        CH1_RXSPCSEQADV      => CH1_RXSPCSEQADV_in,
        CH1_RXUSRCLK         => CH1_RXUSRCLK_in,
        CH1_RXUSRCLK2        => CH1_RXUSRCLK2_in,
        CH1_RXUSRRDY         => CH1_RXUSRRDY_in,
        CH1_RXUSRSTART       => CH1_RXUSRSTART_in,
        CH1_RXUSRSTOP        => CH1_RXUSRSTOP_in,
        CH1_TSTCLK0          => CH1_TSTCLK0_in,
        CH1_TSTCLK1          => CH1_TSTCLK1_in,
        CH1_TXCKALRESET      => CH1_TXCKALRESET_in,
        CH1_TXCTLFIRDAT      => CH1_TXCTLFIRDAT_in,
        CH1_TXDATA           => CH1_TXDATA_in,
        CH1_TXDATASTART      => CH1_TXDATASTART_in,
        CH1_TXDRVAMP         => CH1_TXDRVAMP_in,
        CH1_TXEMPMAIN        => CH1_TXEMPMAIN_in,
        CH1_TXEMPPOST        => CH1_TXEMPPOST_in,
        CH1_TXEMPPRE         => CH1_TXEMPPRE_in,
        CH1_TXEMPPRE2        => CH1_TXEMPPRE2_in,
        CH1_TXFECRESET       => CH1_TXFECRESET_in,
        CH1_TXINHIBIT        => CH1_TXINHIBIT_in,
        CH1_TXMUXDCDEXHOLD   => CH1_TXMUXDCDEXHOLD_in,
        CH1_TXMUXDCDORWREN   => CH1_TXMUXDCDORWREN_in,
        CH1_TXOUTCLKSEL      => CH1_TXOUTCLKSEL_in,
        CH1_TXPCSRESET       => CH1_TXPCSRESET_in,
        CH1_TXPCSRESETMASK   => CH1_TXPCSRESETMASK_in,
        CH1_TXPMARESET       => CH1_TXPMARESET_in,
        CH1_TXPMARESETMASK   => CH1_TXPMARESETMASK_in,
        CH1_TXPOLARITY       => CH1_TXPOLARITY_in,
        CH1_TXPRBSINERR      => CH1_TXPRBSINERR_in,
        CH1_TXPRBSPTN        => CH1_TXPRBSPTN_in,
        CH1_TXPROGDIVRESET   => CH1_TXPROGDIVRESET_in,
        CH1_TXQPRBSEN        => CH1_TXQPRBSEN_in,
        CH1_TXRESETMODE      => CH1_TXRESETMODE_in,
        CH1_TXSPCSEQADV      => CH1_TXSPCSEQADV_in,
        CH1_TXUSRCLK         => CH1_TXUSRCLK_in,
        CH1_TXUSRCLK2        => CH1_TXUSRCLK2_in,
        CH1_TXUSRRDY         => CH1_TXUSRRDY_in,
        CLKTESTSIG           => CLKTESTSIG_in,
        DRPADDR              => DRPADDR_in,
        DRPCLK               => DRPCLK_in,
        DRPDI                => DRPDI_in,
        DRPEN                => DRPEN_in,
        DRPRST               => DRPRST_in,
        DRPWE                => DRPWE_in,
        FECCTRLRX0BITSLIPFS  => FECCTRLRX0BITSLIPFS_in,
        FECCTRLRX1BITSLIPFS  => FECCTRLRX1BITSLIPFS_in,
        FECSCANCLK           => FECSCANCLK_in,
        FECSCANENB           => FECSCANENB_in,
        FECSCANIN            => FECSCANIN_in,
        FECSCANMODEB         => FECSCANMODEB_in,
        FECSCANRSTB          => FECSCANRSTB_in,
        GTGREFCLK2PLL        => GTGREFCLK2PLL_in,
        GTNORTHREFCLK        => GTNORTHREFCLK_in,
        GTREFCLK             => GTREFCLK_in,
        GTREFCLKPD           => GTREFCLKPD_in,
        GTSOUTHREFCLK        => GTSOUTHREFCLK_in,
        PLLFBDIV             => PLLFBDIV_in,
        PLLMONCLK            => PLLMONCLK_in,
        PLLPD                => PLLPD_in,
        PLLREFCLKSEL         => PLLREFCLKSEL_in,
        PLLRESET             => PLLRESET_in,
        PLLRESETBYPASSMODE   => PLLRESETBYPASSMODE_in,
        PLLRESETMASK         => PLLRESETMASK_in,
        PLLRSVDIN            => PLLRSVDIN_in,
        PLLSCANCLK           => PLLSCANCLK_in,
        PLLSCANENB           => PLLSCANENB_in,
        PLLSCANIN            => PLLSCANIN_in,
        PLLSCANMODEB         => PLLSCANMODEB_in,
        PLLSCANRSTEN         => PLLSCANRSTEN_in,
        RCALENB              => RCALENB_in,
        RCALSEL              => RCALSEL_in,
        REFCLK2HROW          => REFCLK2HROW_in,
        SDMDATA              => SDMDATA_in,
        SDMTOGGLE            => SDMTOGGLE_in,
        GSR                  => glblGSR        
      );
  end GTM_DUAL_V;
