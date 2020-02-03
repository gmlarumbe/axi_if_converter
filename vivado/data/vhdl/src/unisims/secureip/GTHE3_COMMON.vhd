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
-- /___/   /\      Filename    : GTHE3_COMMON.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL GTHE3_COMMON -----

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

entity GTHE3_COMMON is
  generic (
    BIAS_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG3 : std_logic_vector(15 downto 0) := X"0040";
    BIAS_CFG4 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG_RSVD : std_logic_vector(9 downto 0) := "0000000000";
    COMMON_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    COMMON_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    POR_CFG : std_logic_vector(15 downto 0) := X"0004";
    QPLL0_CFG0 : std_logic_vector(15 downto 0) := X"3018";
    QPLL0_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_CFG1_G3 : std_logic_vector(15 downto 0) := X"0020";
    QPLL0_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_CFG2_G3 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_CFG3 : std_logic_vector(15 downto 0) := X"0120";
    QPLL0_CFG4 : std_logic_vector(15 downto 0) := X"0009";
    QPLL0_CP : std_logic_vector(9 downto 0) := "0000011111";
    QPLL0_CP_G3 : std_logic_vector(9 downto 0) := "0000011111";
    QPLL0_FBDIV : integer := 66;
    QPLL0_FBDIV_G3 : integer := 80;
    QPLL0_INIT_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_INIT_CFG1 : std_logic_vector(7 downto 0) := X"00";
    QPLL0_LOCK_CFG : std_logic_vector(15 downto 0) := X"01E8";
    QPLL0_LOCK_CFG_G3 : std_logic_vector(15 downto 0) := X"01E8";
    QPLL0_LPF : std_logic_vector(9 downto 0) := "1111111111";
    QPLL0_LPF_G3 : std_logic_vector(9 downto 0) := "1111111111";
    QPLL0_REFCLK_DIV : integer := 2;
    QPLL0_SDM_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    QPLL0_SDM_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    QPLL0_SDM_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    QPLL1_CFG0 : std_logic_vector(15 downto 0) := X"3018";
    QPLL1_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_CFG1_G3 : std_logic_vector(15 downto 0) := X"0020";
    QPLL1_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_CFG2_G3 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_CFG3 : std_logic_vector(15 downto 0) := X"0120";
    QPLL1_CFG4 : std_logic_vector(15 downto 0) := X"0009";
    QPLL1_CP : std_logic_vector(9 downto 0) := "0000011111";
    QPLL1_CP_G3 : std_logic_vector(9 downto 0) := "0000011111";
    QPLL1_FBDIV : integer := 66;
    QPLL1_FBDIV_G3 : integer := 80;
    QPLL1_INIT_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_INIT_CFG1 : std_logic_vector(7 downto 0) := X"00";
    QPLL1_LOCK_CFG : std_logic_vector(15 downto 0) := X"01E8";
    QPLL1_LOCK_CFG_G3 : std_logic_vector(15 downto 0) := X"21E8";
    QPLL1_LPF : std_logic_vector(9 downto 0) := "1111111111";
    QPLL1_LPF_G3 : std_logic_vector(9 downto 0) := "1111111111";
    QPLL1_REFCLK_DIV : integer := 2;
    QPLL1_SDM_CFG0 : std_logic_vector(15 downto 0) := "0000000000000000";
    QPLL1_SDM_CFG1 : std_logic_vector(15 downto 0) := "0000000000000000";
    QPLL1_SDM_CFG2 : std_logic_vector(15 downto 0) := "0000000000000000";
    RSVD_ATTR0 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR1 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR2 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR3 : std_logic_vector(15 downto 0) := X"0000";
    RXRECCLKOUT0_SEL : std_logic_vector(1 downto 0) := "00";
    RXRECCLKOUT1_SEL : std_logic_vector(1 downto 0) := "00";
    SARC_EN : bit := '1';
    SARC_SEL : bit := '0';
    SDM0DATA1_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM0DATA1_1 : std_logic_vector(8 downto 0) := "000000000";
    SDM0INITSEED0_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM0INITSEED0_1 : std_logic_vector(8 downto 0) := "000000000";
    SDM0_DATA_PIN_SEL : bit := '0';
    SDM0_WIDTH_PIN_SEL : bit := '0';
    SDM1DATA1_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM1DATA1_1 : std_logic_vector(8 downto 0) := "000000000";
    SDM1INITSEED0_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM1INITSEED0_1 : std_logic_vector(8 downto 0) := "000000000";
    SDM1_DATA_PIN_SEL : bit := '0';
    SDM1_WIDTH_PIN_SEL : bit := '0';
    SIM_MODE : string := "FAST";
    SIM_RESET_SPEEDUP : string := "TRUE";
    SIM_VERSION : integer := 2
  );

  port (
    DRPDO                : out std_logic_vector(15 downto 0);
    DRPRDY               : out std_ulogic;
    PMARSVDOUT0          : out std_logic_vector(7 downto 0);
    PMARSVDOUT1          : out std_logic_vector(7 downto 0);
    QPLL0FBCLKLOST       : out std_ulogic;
    QPLL0LOCK            : out std_ulogic;
    QPLL0OUTCLK          : out std_ulogic;
    QPLL0OUTREFCLK       : out std_ulogic;
    QPLL0REFCLKLOST      : out std_ulogic;
    QPLL1FBCLKLOST       : out std_ulogic;
    QPLL1LOCK            : out std_ulogic;
    QPLL1OUTCLK          : out std_ulogic;
    QPLL1OUTREFCLK       : out std_ulogic;
    QPLL1REFCLKLOST      : out std_ulogic;
    QPLLDMONITOR0        : out std_logic_vector(7 downto 0);
    QPLLDMONITOR1        : out std_logic_vector(7 downto 0);
    REFCLKOUTMONITOR0    : out std_ulogic;
    REFCLKOUTMONITOR1    : out std_ulogic;
    RXRECCLK0_SEL        : out std_logic_vector(1 downto 0);
    RXRECCLK1_SEL        : out std_logic_vector(1 downto 0);
    BGBYPASSB            : in std_ulogic;
    BGMONITORENB         : in std_ulogic;
    BGPDB                : in std_ulogic;
    BGRCALOVRD           : in std_logic_vector(4 downto 0);
    BGRCALOVRDENB        : in std_ulogic;
    DRPADDR              : in std_logic_vector(8 downto 0);
    DRPCLK               : in std_ulogic;
    DRPDI                : in std_logic_vector(15 downto 0);
    DRPEN                : in std_ulogic;
    DRPWE                : in std_ulogic;
    GTGREFCLK0           : in std_ulogic;
    GTGREFCLK1           : in std_ulogic;
    GTNORTHREFCLK00      : in std_ulogic;
    GTNORTHREFCLK01      : in std_ulogic;
    GTNORTHREFCLK10      : in std_ulogic;
    GTNORTHREFCLK11      : in std_ulogic;
    GTREFCLK00           : in std_ulogic;
    GTREFCLK01           : in std_ulogic;
    GTREFCLK10           : in std_ulogic;
    GTREFCLK11           : in std_ulogic;
    GTSOUTHREFCLK00      : in std_ulogic;
    GTSOUTHREFCLK01      : in std_ulogic;
    GTSOUTHREFCLK10      : in std_ulogic;
    GTSOUTHREFCLK11      : in std_ulogic;
    PMARSVD0             : in std_logic_vector(7 downto 0);
    PMARSVD1             : in std_logic_vector(7 downto 0);
    QPLL0CLKRSVD0        : in std_ulogic;
    QPLL0CLKRSVD1        : in std_ulogic;
    QPLL0LOCKDETCLK      : in std_ulogic;
    QPLL0LOCKEN          : in std_ulogic;
    QPLL0PD              : in std_ulogic;
    QPLL0REFCLKSEL       : in std_logic_vector(2 downto 0);
    QPLL0RESET           : in std_ulogic;
    QPLL1CLKRSVD0        : in std_ulogic;
    QPLL1CLKRSVD1        : in std_ulogic;
    QPLL1LOCKDETCLK      : in std_ulogic;
    QPLL1LOCKEN          : in std_ulogic;
    QPLL1PD              : in std_ulogic;
    QPLL1REFCLKSEL       : in std_logic_vector(2 downto 0);
    QPLL1RESET           : in std_ulogic;
    QPLLRSVD1            : in std_logic_vector(7 downto 0);
    QPLLRSVD2            : in std_logic_vector(4 downto 0);
    QPLLRSVD3            : in std_logic_vector(4 downto 0);
    QPLLRSVD4            : in std_logic_vector(7 downto 0);
    RCALENB              : in std_ulogic
  );
end GTHE3_COMMON;

architecture GTHE3_COMMON_V of GTHE3_COMMON is
  component SIP_GTHE3_COMMON
    generic (
        SIM_RESET_SPEEDUP : string := "TRUE";
        SIM_VERSION : integer := 2
      );
    port (
        AEN_BGBS0            : in std_logic_vector(0 downto 0);
        AEN_BGBS1            : in std_logic_vector(0 downto 0);
        AEN_MASTER0          : in std_logic_vector(0 downto 0);
        AEN_MASTER1          : in std_logic_vector(0 downto 0);
        AEN_PD0              : in std_logic_vector(0 downto 0);
        AEN_PD1              : in std_logic_vector(0 downto 0);
        AEN_QPLL0            : in std_logic_vector(0 downto 0);
        AEN_QPLL1            : in std_logic_vector(0 downto 0);
        AEN_REFCLK0          : in std_logic_vector(0 downto 0);
        AEN_REFCLK1          : in std_logic_vector(0 downto 0);
        AEN_RESET0           : in std_logic_vector(0 downto 0);
        AEN_RESET1           : in std_logic_vector(0 downto 0);
        AQDMUXSEL1           : in std_logic_vector(3 downto 0);
        AVCC_SENSE_SEL       : in std_logic_vector(3 downto 0);
        AVTT_SENSE_SEL       : in std_logic_vector(3 downto 0);
        A_BGMONITOREN        : in std_logic_vector(0 downto 0);
        A_BGPD               : in std_logic_vector(0 downto 0);
        A_GTREFCLKPD0        : in std_logic_vector(0 downto 0);
        A_GTREFCLKPD1        : in std_logic_vector(0 downto 0);
        A_QPLL0LOCKEN        : in std_logic_vector(0 downto 0);
        A_QPLL0PD            : in std_logic_vector(0 downto 0);
        A_QPLL0RESET         : in std_logic_vector(0 downto 0);
        A_QPLL1LOCKEN        : in std_logic_vector(0 downto 0);
        A_QPLL1PD            : in std_logic_vector(0 downto 0);
        A_QPLL1RESET         : in std_logic_vector(0 downto 0);
        BIAS_CFG0            : in std_logic_vector(15 downto 0);
        BIAS_CFG1            : in std_logic_vector(15 downto 0);
        BIAS_CFG2            : in std_logic_vector(15 downto 0);
        BIAS_CFG3            : in std_logic_vector(15 downto 0);
        BIAS_CFG4            : in std_logic_vector(15 downto 0);
        BIAS_CFG_RSVD        : in std_logic_vector(9 downto 0);
        COMMON_AMUX_SEL0     : in std_logic_vector(1 downto 0);
        COMMON_AMUX_SEL1     : in std_logic_vector(1 downto 0);
        COMMON_CFG0          : in std_logic_vector(15 downto 0);
        COMMON_CFG1          : in std_logic_vector(15 downto 0);
        COMMON_INSTANTIATED  : in std_logic_vector(0 downto 0);
        POR_CFG              : in std_logic_vector(15 downto 0);
        PPF0_CFG             : in std_logic_vector(15 downto 0);
        PPF1_CFG             : in std_logic_vector(15 downto 0);
        QPLL0_AMONITOR_SEL   : in std_logic_vector(2 downto 0);
        QPLL0_CFG0           : in std_logic_vector(15 downto 0);
        QPLL0_CFG1           : in std_logic_vector(15 downto 0);
        QPLL0_CFG1_G3        : in std_logic_vector(15 downto 0);
        QPLL0_CFG2           : in std_logic_vector(15 downto 0);
        QPLL0_CFG2_G3        : in std_logic_vector(15 downto 0);
        QPLL0_CFG3           : in std_logic_vector(15 downto 0);
        QPLL0_CFG4           : in std_logic_vector(15 downto 0);
        QPLL0_CP             : in std_logic_vector(9 downto 0);
        QPLL0_CP_G3          : in std_logic_vector(9 downto 0);
        QPLL0_FBDIV          : in std_logic_vector(7 downto 0);
        QPLL0_FBDIV_G3       : in std_logic_vector(7 downto 0);
        QPLL0_INIT_CFG0      : in std_logic_vector(15 downto 0);
        QPLL0_INIT_CFG1      : in std_logic_vector(7 downto 0);
        QPLL0_LOCK_CFG       : in std_logic_vector(15 downto 0);
        QPLL0_LOCK_CFG_G3    : in std_logic_vector(15 downto 0);
        QPLL0_LPF            : in std_logic_vector(9 downto 0);
        QPLL0_LPF_G3         : in std_logic_vector(9 downto 0);
        QPLL0_REFCLK_DIV     : in std_logic_vector(4 downto 0);
        QPLL0_SDM_CFG0       : in std_logic_vector(15 downto 0);
        QPLL0_SDM_CFG1       : in std_logic_vector(15 downto 0);
        QPLL0_SDM_CFG2       : in std_logic_vector(15 downto 0);
        QPLL1_AMONITOR_SEL   : in std_logic_vector(2 downto 0);
        QPLL1_CFG0           : in std_logic_vector(15 downto 0);
        QPLL1_CFG1           : in std_logic_vector(15 downto 0);
        QPLL1_CFG1_G3        : in std_logic_vector(15 downto 0);
        QPLL1_CFG2           : in std_logic_vector(15 downto 0);
        QPLL1_CFG2_G3        : in std_logic_vector(15 downto 0);
        QPLL1_CFG3           : in std_logic_vector(15 downto 0);
        QPLL1_CFG4           : in std_logic_vector(15 downto 0);
        QPLL1_CP             : in std_logic_vector(9 downto 0);
        QPLL1_CP_G3          : in std_logic_vector(9 downto 0);
        QPLL1_FBDIV          : in std_logic_vector(7 downto 0);
        QPLL1_FBDIV_G3       : in std_logic_vector(7 downto 0);
        QPLL1_INIT_CFG0      : in std_logic_vector(15 downto 0);
        QPLL1_INIT_CFG1      : in std_logic_vector(7 downto 0);
        QPLL1_LOCK_CFG       : in std_logic_vector(15 downto 0);
        QPLL1_LOCK_CFG_G3    : in std_logic_vector(15 downto 0);
        QPLL1_LPF            : in std_logic_vector(9 downto 0);
        QPLL1_LPF_G3         : in std_logic_vector(9 downto 0);
        QPLL1_REFCLK_DIV     : in std_logic_vector(4 downto 0);
        QPLL1_SDM_CFG0       : in std_logic_vector(15 downto 0);
        QPLL1_SDM_CFG1       : in std_logic_vector(15 downto 0);
        QPLL1_SDM_CFG2       : in std_logic_vector(15 downto 0);
        RCALSAP_TESTEN       : in std_logic_vector(0 downto 0);
        RCAL_APROBE          : in std_logic_vector(0 downto 0);
        REFCLK0_EN_DC_COUP   : in std_logic_vector(0 downto 0);
        REFCLK0_VCM_HIGH     : in std_logic_vector(0 downto 0);
        REFCLK0_VCM_LOW      : in std_logic_vector(0 downto 0);
        REFCLK1_EN_DC_COUP   : in std_logic_vector(0 downto 0);
        REFCLK1_VCM_HIGH     : in std_logic_vector(0 downto 0);
        REFCLK1_VCM_LOW      : in std_logic_vector(0 downto 0);
        RSVD_ATTR0           : in std_logic_vector(15 downto 0);
        RSVD_ATTR1           : in std_logic_vector(15 downto 0);
        RSVD_ATTR2           : in std_logic_vector(15 downto 0);
        RSVD_ATTR3           : in std_logic_vector(15 downto 0);
        RXRECCLKOUT0_SEL     : in std_logic_vector(1 downto 0);
        RXRECCLKOUT1_SEL     : in std_logic_vector(1 downto 0);
        SARC_EN              : in std_logic_vector(0 downto 0);
        SARC_SEL             : in std_logic_vector(0 downto 0);
        SDM0DATA1_0          : in std_logic_vector(15 downto 0);
        SDM0DATA1_1          : in std_logic_vector(8 downto 0);
        SDM0INITSEED0_0      : in std_logic_vector(15 downto 0);
        SDM0INITSEED0_1      : in std_logic_vector(8 downto 0);
        SDM0_DATA_PIN_SEL    : in std_logic_vector(0 downto 0);
        SDM0_WIDTH_PIN_SEL   : in std_logic_vector(0 downto 0);
        SDM1DATA1_0          : in std_logic_vector(15 downto 0);
        SDM1DATA1_1          : in std_logic_vector(8 downto 0);
        SDM1INITSEED0_0      : in std_logic_vector(15 downto 0);
        SDM1INITSEED0_1      : in std_logic_vector(8 downto 0);
        SDM1_DATA_PIN_SEL    : in std_logic_vector(0 downto 0);
        SDM1_WIDTH_PIN_SEL   : in std_logic_vector(0 downto 0);
        VCCAUX_SENSE_SEL     : in std_logic_vector(1 downto 0);
        DRPDO                : out std_logic_vector(15 downto 0);
        DRPRDY               : out std_ulogic;
        PMARSVDOUT0          : out std_logic_vector(7 downto 0);
        PMARSVDOUT1          : out std_logic_vector(7 downto 0);
        PMASCANOUT           : out std_logic_vector(7 downto 0);
        QPLL0FBCLKLOST       : out std_ulogic;
        QPLL0LOCK            : out std_ulogic;
        QPLL0OUTCLK          : out std_ulogic;
        QPLL0OUTREFCLK       : out std_ulogic;
        QPLL0REFCLKLOST      : out std_ulogic;
        QPLL1FBCLKLOST       : out std_ulogic;
        QPLL1LOCK            : out std_ulogic;
        QPLL1OUTCLK          : out std_ulogic;
        QPLL1OUTREFCLK       : out std_ulogic;
        QPLL1REFCLKLOST      : out std_ulogic;
        QPLLDMONITOR0        : out std_logic_vector(7 downto 0);
        QPLLDMONITOR1        : out std_logic_vector(7 downto 0);
        REFCLKOUTMONITOR0    : out std_ulogic;
        REFCLKOUTMONITOR1    : out std_ulogic;
        RXRECCLK0_SEL        : out std_logic_vector(1 downto 0);
        RXRECCLK1_SEL        : out std_logic_vector(1 downto 0);
        SARCCLK              : out std_logic_vector(3 downto 0);
        BGBYPASSB            : in std_ulogic;
        BGMONITORENB         : in std_ulogic;
        BGPDB                : in std_ulogic;
        BGRCALOVRD           : in std_logic_vector(4 downto 0);
        BGRCALOVRDENB        : in std_ulogic;
        DRPADDR              : in std_logic_vector(8 downto 0);
        DRPCLK               : in std_ulogic;
        DRPDI                : in std_logic_vector(15 downto 0);
        DRPEN                : in std_ulogic;
        DRPWE                : in std_ulogic;
        GTGREFCLK0           : in std_ulogic;
        GTGREFCLK1           : in std_ulogic;
        GTNORTHREFCLK00      : in std_ulogic;
        GTNORTHREFCLK01      : in std_ulogic;
        GTNORTHREFCLK10      : in std_ulogic;
        GTNORTHREFCLK11      : in std_ulogic;
        GTREFCLK00           : in std_ulogic;
        GTREFCLK01           : in std_ulogic;
        GTREFCLK10           : in std_ulogic;
        GTREFCLK11           : in std_ulogic;
        GTSOUTHREFCLK00      : in std_ulogic;
        GTSOUTHREFCLK01      : in std_ulogic;
        GTSOUTHREFCLK10      : in std_ulogic;
        GTSOUTHREFCLK11      : in std_ulogic;
        PMARSVD0             : in std_logic_vector(7 downto 0);
        PMARSVD1             : in std_logic_vector(7 downto 0);
        PMASCANCLK           : in std_logic_vector(7 downto 0);
        PMASCANENB           : in std_ulogic;
        PMASCANIN            : in std_logic_vector(7 downto 0);
        QDPMASCANMODEB       : in std_ulogic;
        QDPMASCANRSTEN       : in std_ulogic;
        QPLL0CLKRSVD0        : in std_ulogic;
        QPLL0CLKRSVD1        : in std_ulogic;
        QPLL0LOCKDETCLK      : in std_ulogic;
        QPLL0LOCKEN          : in std_ulogic;
        QPLL0PD              : in std_ulogic;
        QPLL0REFCLKSEL       : in std_logic_vector(2 downto 0);
        QPLL0RESET           : in std_ulogic;
        QPLL1CLKRSVD0        : in std_ulogic;
        QPLL1CLKRSVD1        : in std_ulogic;
        QPLL1LOCKDETCLK      : in std_ulogic;
        QPLL1LOCKEN          : in std_ulogic;
        QPLL1PD              : in std_ulogic;
        QPLL1REFCLKSEL       : in std_logic_vector(2 downto 0);
        QPLL1RESET           : in std_ulogic;
        QPLLRSVD1            : in std_logic_vector(7 downto 0);
        QPLLRSVD2            : in std_logic_vector(4 downto 0);
        QPLLRSVD3            : in std_logic_vector(4 downto 0);
        QPLLRSVD4            : in std_logic_vector(7 downto 0);
        RCALENB              : in std_ulogic;
        RXRECCLK             : in std_logic_vector(3 downto 0);
        GSR                  : in std_ulogic
      );
    end component;

    constant MODULE_NAME : string := "GTHE3_COMMON";
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
    constant SIM_RESET_SPEEDUP_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SIM_RESET_SPEEDUP,40);

    constant AEN_BGBS0_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_BGBS1_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_MASTER0_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_MASTER1_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_PD0_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_PD1_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_QPLL0_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_QPLL1_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_REFCLK0_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_REFCLK1_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_RESET0_BIN : std_logic_vector(0 downto 0) := "0";
    constant AEN_RESET1_BIN : std_logic_vector(0 downto 0) := "0";
    constant AQDMUXSEL1_BIN : std_logic_vector(3 downto 0) := "0000";
    constant AVCC_SENSE_SEL_BIN : std_logic_vector(3 downto 0) := "0000";
    constant AVTT_SENSE_SEL_BIN : std_logic_vector(3 downto 0) := "0000";
    constant A_BGMONITOREN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_BGPD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_GTREFCLKPD0_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_GTREFCLKPD1_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_QPLL0LOCKEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_QPLL0PD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_QPLL0RESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_QPLL1LOCKEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_QPLL1PD_BIN : std_logic_vector(0 downto 0) := "0";
    constant A_QPLL1RESET_BIN : std_logic_vector(0 downto 0) := "0";
    constant BIAS_CFG0_BIN : std_logic_vector(15 downto 0) := BIAS_CFG0;
    constant BIAS_CFG1_BIN : std_logic_vector(15 downto 0) := BIAS_CFG1;
    constant BIAS_CFG2_BIN : std_logic_vector(15 downto 0) := BIAS_CFG2;
    constant BIAS_CFG3_BIN : std_logic_vector(15 downto 0) := BIAS_CFG3;
    constant BIAS_CFG4_BIN : std_logic_vector(15 downto 0) := BIAS_CFG4;
    constant BIAS_CFG_RSVD_BIN : std_logic_vector(9 downto 0) := BIAS_CFG_RSVD;
    constant COMMON_AMUX_SEL0_BIN : std_logic_vector(1 downto 0) := "00";
    constant COMMON_AMUX_SEL1_BIN : std_logic_vector(1 downto 0) := "00";
    constant COMMON_CFG0_BIN : std_logic_vector(15 downto 0) := COMMON_CFG0;
    constant COMMON_CFG1_BIN : std_logic_vector(15 downto 0) := COMMON_CFG1;
    constant COMMON_INSTANTIATED_BIN : std_logic_vector(0 downto 0) := "1";
    constant POR_CFG_BIN : std_logic_vector(15 downto 0) := POR_CFG;
    constant PPF0_CFG_BIN : std_logic_vector(15 downto 0) := X"0000";
    constant PPF1_CFG_BIN : std_logic_vector(15 downto 0) := X"0000";
    constant QPLL0_AMONITOR_SEL_BIN : std_logic_vector(2 downto 0) := "000";
    constant QPLL0_CFG0_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG0;
    constant QPLL0_CFG1_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG1;
    constant QPLL0_CFG1_G3_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG1_G3;
    constant QPLL0_CFG2_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG2;
    constant QPLL0_CFG2_G3_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG2_G3;
    constant QPLL0_CFG3_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG3;
    constant QPLL0_CFG4_BIN : std_logic_vector(15 downto 0) := QPLL0_CFG4;
    constant QPLL0_CP_BIN : std_logic_vector(9 downto 0) := QPLL0_CP;
    constant QPLL0_CP_G3_BIN : std_logic_vector(9 downto 0) := QPLL0_CP_G3;
    constant QPLL0_FBDIV_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(QPLL0_FBDIV,8));
    constant QPLL0_FBDIV_G3_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(QPLL0_FBDIV_G3,8));
    constant QPLL0_INIT_CFG0_BIN : std_logic_vector(15 downto 0) := QPLL0_INIT_CFG0;
    constant QPLL0_INIT_CFG1_BIN : std_logic_vector(7 downto 0) := QPLL0_INIT_CFG1;
    constant QPLL0_LOCK_CFG_BIN : std_logic_vector(15 downto 0) := QPLL0_LOCK_CFG;
    constant QPLL0_LOCK_CFG_G3_BIN : std_logic_vector(15 downto 0) := QPLL0_LOCK_CFG_G3;
    constant QPLL0_LPF_BIN : std_logic_vector(9 downto 0) := QPLL0_LPF;
    constant QPLL0_LPF_G3_BIN : std_logic_vector(9 downto 0) := QPLL0_LPF_G3;
    constant QPLL0_REFCLK_DIV_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(QPLL0_REFCLK_DIV,5));
    constant QPLL0_SDM_CFG0_BIN : std_logic_vector(15 downto 0) := QPLL0_SDM_CFG0;
    constant QPLL0_SDM_CFG1_BIN : std_logic_vector(15 downto 0) := QPLL0_SDM_CFG1;
    constant QPLL0_SDM_CFG2_BIN : std_logic_vector(15 downto 0) := QPLL0_SDM_CFG2;
    constant QPLL1_AMONITOR_SEL_BIN : std_logic_vector(2 downto 0) := "000";
    constant QPLL1_CFG0_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG0;
    constant QPLL1_CFG1_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG1;
    constant QPLL1_CFG1_G3_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG1_G3;
    constant QPLL1_CFG2_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG2;
    constant QPLL1_CFG2_G3_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG2_G3;
    constant QPLL1_CFG3_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG3;
    constant QPLL1_CFG4_BIN : std_logic_vector(15 downto 0) := QPLL1_CFG4;
    constant QPLL1_CP_BIN : std_logic_vector(9 downto 0) := QPLL1_CP;
    constant QPLL1_CP_G3_BIN : std_logic_vector(9 downto 0) := QPLL1_CP_G3;
    constant QPLL1_FBDIV_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(QPLL1_FBDIV,8));
    constant QPLL1_FBDIV_G3_BIN : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(QPLL1_FBDIV_G3,8));
    constant QPLL1_INIT_CFG0_BIN : std_logic_vector(15 downto 0) := QPLL1_INIT_CFG0;
    constant QPLL1_INIT_CFG1_BIN : std_logic_vector(7 downto 0) := QPLL1_INIT_CFG1;
    constant QPLL1_LOCK_CFG_BIN : std_logic_vector(15 downto 0) := QPLL1_LOCK_CFG;
    constant QPLL1_LOCK_CFG_G3_BIN : std_logic_vector(15 downto 0) := QPLL1_LOCK_CFG_G3;
    constant QPLL1_LPF_BIN : std_logic_vector(9 downto 0) := QPLL1_LPF;
    constant QPLL1_LPF_G3_BIN : std_logic_vector(9 downto 0) := QPLL1_LPF_G3;
    constant QPLL1_REFCLK_DIV_BIN : std_logic_vector(4 downto 0) := std_logic_vector(to_unsigned(QPLL1_REFCLK_DIV,5));
    constant QPLL1_SDM_CFG0_BIN : std_logic_vector(15 downto 0) := QPLL1_SDM_CFG0;
    constant QPLL1_SDM_CFG1_BIN : std_logic_vector(15 downto 0) := QPLL1_SDM_CFG1;
    constant QPLL1_SDM_CFG2_BIN : std_logic_vector(15 downto 0) := QPLL1_SDM_CFG2;
    constant RCALSAP_TESTEN_BIN : std_logic_vector(0 downto 0) := "0";
    constant RCAL_APROBE_BIN : std_logic_vector(0 downto 0) := "0";
    constant REFCLK0_EN_DC_COUP_BIN : std_logic_vector(0 downto 0) := "0";
    constant REFCLK0_VCM_HIGH_BIN : std_logic_vector(0 downto 0) := "0";
    constant REFCLK0_VCM_LOW_BIN : std_logic_vector(0 downto 0) := "0";
    constant REFCLK1_EN_DC_COUP_BIN : std_logic_vector(0 downto 0) := "0";
    constant REFCLK1_VCM_HIGH_BIN : std_logic_vector(0 downto 0) := "0";
    constant REFCLK1_VCM_LOW_BIN : std_logic_vector(0 downto 0) := "0";
    constant RSVD_ATTR0_BIN : std_logic_vector(15 downto 0) := RSVD_ATTR0;
    constant RSVD_ATTR1_BIN : std_logic_vector(15 downto 0) := RSVD_ATTR1;
    constant RSVD_ATTR2_BIN : std_logic_vector(15 downto 0) := RSVD_ATTR2;
    constant RSVD_ATTR3_BIN : std_logic_vector(15 downto 0) := RSVD_ATTR3;
    constant RXRECCLKOUT0_SEL_BIN : std_logic_vector(1 downto 0) := RXRECCLKOUT0_SEL;
    constant RXRECCLKOUT1_SEL_BIN : std_logic_vector(1 downto 0) := RXRECCLKOUT1_SEL;
    constant SARC_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SARC_EN));
    constant SARC_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SARC_SEL));
    constant SDM0DATA1_0_BIN : std_logic_vector(15 downto 0) := SDM0DATA1_0;
    constant SDM0DATA1_1_BIN : std_logic_vector(8 downto 0) := SDM0DATA1_1;
    constant SDM0INITSEED0_0_BIN : std_logic_vector(15 downto 0) := SDM0INITSEED0_0;
    constant SDM0INITSEED0_1_BIN : std_logic_vector(8 downto 0) := SDM0INITSEED0_1;
    constant SDM0_DATA_PIN_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SDM0_DATA_PIN_SEL));
    constant SDM0_WIDTH_PIN_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SDM0_WIDTH_PIN_SEL));
    constant SDM1DATA1_0_BIN : std_logic_vector(15 downto 0) := SDM1DATA1_0;
    constant SDM1DATA1_1_BIN : std_logic_vector(8 downto 0) := SDM1DATA1_1;
    constant SDM1INITSEED0_0_BIN : std_logic_vector(15 downto 0) := SDM1INITSEED0_0;
    constant SDM1INITSEED0_1_BIN : std_logic_vector(8 downto 0) := SDM1INITSEED0_1;
    constant SDM1_DATA_PIN_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SDM1_DATA_PIN_SEL));
    constant SDM1_WIDTH_PIN_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SDM1_WIDTH_PIN_SEL));
    constant SIM_VERSION_BIN : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(SIM_VERSION,2));
    constant VCCAUX_SENSE_SEL_BIN : std_logic_vector(1 downto 0) := "00";

  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed

    signal DRPDO_out : std_logic_vector(15 downto 0);
    signal DRPRDY_out : std_ulogic;
    signal PMARSVDOUT0_out : std_logic_vector(7 downto 0);
    signal PMARSVDOUT1_out : std_logic_vector(7 downto 0);
    signal PMASCANOUT_out : std_logic_vector(7 downto 0);
    signal QPLL0FBCLKLOST_out : std_ulogic;
    signal QPLL0LOCK_out : std_ulogic;
    signal QPLL0OUTCLK_out : std_ulogic;
    signal QPLL0OUTREFCLK_out : std_ulogic;
    signal QPLL0REFCLKLOST_out : std_ulogic;
    signal QPLL1FBCLKLOST_out : std_ulogic;
    signal QPLL1LOCK_out : std_ulogic;
    signal QPLL1OUTCLK_out : std_ulogic;
    signal QPLL1OUTREFCLK_out : std_ulogic;
    signal QPLL1REFCLKLOST_out : std_ulogic;
    signal QPLLDMONITOR0_out : std_logic_vector(7 downto 0);
    signal QPLLDMONITOR1_out : std_logic_vector(7 downto 0);
    signal REFCLKOUTMONITOR0_out : std_ulogic;
    signal REFCLKOUTMONITOR1_out : std_ulogic;
    signal RXRECCLK0_SEL_out : std_logic_vector(1 downto 0);
    signal RXRECCLK1_SEL_out : std_logic_vector(1 downto 0);
    signal SARCCLK_out : std_logic_vector(3 downto 0);
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal BGBYPASSB_in : std_ulogic;
    signal BGMONITORENB_in : std_ulogic;
    signal BGPDB_in : std_ulogic;
    signal BGRCALOVRDENB_in : std_ulogic;
    signal BGRCALOVRD_in : std_logic_vector(4 downto 0);
    signal DRPADDR_in : std_logic_vector(8 downto 0);
    signal DRPCLK_in : std_ulogic;
    signal DRPDI_in : std_logic_vector(15 downto 0);
    signal DRPEN_in : std_ulogic;
    signal DRPWE_in : std_ulogic;
    signal GTGREFCLK0_in : std_ulogic;
    signal GTGREFCLK1_in : std_ulogic;
    signal GTNORTHREFCLK00_in : std_ulogic;
    signal GTNORTHREFCLK01_in : std_ulogic;
    signal GTNORTHREFCLK10_in : std_ulogic;
    signal GTNORTHREFCLK11_in : std_ulogic;
    signal GTREFCLK00_in : std_ulogic;
    signal GTREFCLK01_in : std_ulogic;
    signal GTREFCLK10_in : std_ulogic;
    signal GTREFCLK11_in : std_ulogic;
    signal GTSOUTHREFCLK00_in : std_ulogic;
    signal GTSOUTHREFCLK01_in : std_ulogic;
    signal GTSOUTHREFCLK10_in : std_ulogic;
    signal GTSOUTHREFCLK11_in : std_ulogic;
    signal PMARSVD0_in : std_logic_vector(7 downto 0);
    signal PMARSVD1_in : std_logic_vector(7 downto 0);
    signal PMASCANCLK_in : std_logic_vector(7 downto 0);
    signal PMASCANENB_in : std_ulogic;
    signal PMASCANIN_in : std_logic_vector(7 downto 0);
    signal QDPMASCANMODEB_in : std_ulogic;
    signal QDPMASCANRSTEN_in : std_ulogic;
    signal QPLL0CLKRSVD0_in : std_ulogic;
    signal QPLL0CLKRSVD1_in : std_ulogic;
    signal QPLL0LOCKDETCLK_in : std_ulogic;
    signal QPLL0LOCKEN_in : std_ulogic;
    signal QPLL0PD_in : std_ulogic;
    signal QPLL0REFCLKSEL_in : std_logic_vector(2 downto 0);
    signal QPLL0RESET_in : std_ulogic;
    signal QPLL1CLKRSVD0_in : std_ulogic;
    signal QPLL1CLKRSVD1_in : std_ulogic;
    signal QPLL1LOCKDETCLK_in : std_ulogic;
    signal QPLL1LOCKEN_in : std_ulogic;
    signal QPLL1PD_in : std_ulogic;
    signal QPLL1REFCLKSEL_in : std_logic_vector(2 downto 0);
    signal QPLL1RESET_in : std_ulogic;
    signal QPLLRSVD1_in : std_logic_vector(7 downto 0);
    signal QPLLRSVD2_in : std_logic_vector(4 downto 0);
    signal QPLLRSVD3_in : std_logic_vector(4 downto 0);
    signal QPLLRSVD4_in : std_logic_vector(7 downto 0);
    signal RCALENB_in : std_ulogic;
    signal RXRECCLK_in : std_logic_vector(3 downto 0);
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    DRPDO <= DRPDO_out after OUT_DELAY;
    DRPRDY <= DRPRDY_out after OUT_DELAY;
    PMARSVDOUT0 <= PMARSVDOUT0_out after OUT_DELAY;
    PMARSVDOUT1 <= PMARSVDOUT1_out after OUT_DELAY;
    QPLL0FBCLKLOST <= QPLL0FBCLKLOST_out after OUT_DELAY;
    QPLL0LOCK <= QPLL0LOCK_out after OUT_DELAY;
    QPLL0OUTCLK <= QPLL0OUTCLK_out after OUT_DELAY;
    QPLL0OUTREFCLK <= QPLL0OUTREFCLK_out after OUT_DELAY;
    QPLL0REFCLKLOST <= QPLL0REFCLKLOST_out after OUT_DELAY;
    QPLL1FBCLKLOST <= QPLL1FBCLKLOST_out after OUT_DELAY;
    QPLL1LOCK <= QPLL1LOCK_out after OUT_DELAY;
    QPLL1OUTCLK <= QPLL1OUTCLK_out after OUT_DELAY;
    QPLL1OUTREFCLK <= QPLL1OUTREFCLK_out after OUT_DELAY;
    QPLL1REFCLKLOST <= QPLL1REFCLKLOST_out after OUT_DELAY;
    QPLLDMONITOR0 <= QPLLDMONITOR0_out after OUT_DELAY;
    QPLLDMONITOR1 <= QPLLDMONITOR1_out after OUT_DELAY;
    REFCLKOUTMONITOR0 <= REFCLKOUTMONITOR0_out after OUT_DELAY;
    REFCLKOUTMONITOR1 <= REFCLKOUTMONITOR1_out after OUT_DELAY;
    RXRECCLK0_SEL <= RXRECCLK0_SEL_out after OUT_DELAY;
    RXRECCLK1_SEL <= RXRECCLK1_SEL_out after OUT_DELAY;
    
    BGBYPASSB_in <= BGBYPASSB;
    BGMONITORENB_in <= BGMONITORENB;
    BGPDB_in <= BGPDB;
    BGRCALOVRDENB_in <= BGRCALOVRDENB;
    BGRCALOVRD_in <= BGRCALOVRD;
    DRPADDR_in(0) <= '0' when (DRPADDR(0) = 'Z') else DRPADDR(0); -- rv 0
    DRPADDR_in(1) <= '0' when (DRPADDR(1) = 'Z') else DRPADDR(1); -- rv 0
    DRPADDR_in(2) <= '0' when (DRPADDR(2) = 'Z') else DRPADDR(2); -- rv 0
    DRPADDR_in(3) <= '0' when (DRPADDR(3) = 'Z') else DRPADDR(3); -- rv 0
    DRPADDR_in(4) <= '0' when (DRPADDR(4) = 'Z') else DRPADDR(4); -- rv 0
    DRPADDR_in(5) <= '0' when (DRPADDR(5) = 'Z') else DRPADDR(5); -- rv 0
    DRPADDR_in(6) <= '0' when (DRPADDR(6) = 'Z') else DRPADDR(6); -- rv 0
    DRPADDR_in(7) <= '0' when (DRPADDR(7) = 'Z') else DRPADDR(7); -- rv 0
    DRPADDR_in(8) <= '0' when (DRPADDR(8) = 'Z') else DRPADDR(8); -- rv 0
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
    GTGREFCLK0_in <= GTGREFCLK0;
    GTGREFCLK1_in <= GTGREFCLK1;
    GTNORTHREFCLK00_in <= GTNORTHREFCLK00;
    GTNORTHREFCLK01_in <= GTNORTHREFCLK01;
    GTNORTHREFCLK10_in <= GTNORTHREFCLK10;
    GTNORTHREFCLK11_in <= GTNORTHREFCLK11;
    GTREFCLK00_in <= GTREFCLK00;
    GTREFCLK01_in <= GTREFCLK01;
    GTREFCLK10_in <= GTREFCLK10;
    GTREFCLK11_in <= GTREFCLK11;
    GTSOUTHREFCLK00_in <= GTSOUTHREFCLK00;
    GTSOUTHREFCLK01_in <= GTSOUTHREFCLK01;
    GTSOUTHREFCLK10_in <= GTSOUTHREFCLK10;
    GTSOUTHREFCLK11_in <= GTSOUTHREFCLK11;
    PMARSVD0_in(0) <= '0' when (PMARSVD0(0) = 'Z') else PMARSVD0(0); -- rv 0
    PMARSVD0_in(1) <= '0' when (PMARSVD0(1) = 'Z') else PMARSVD0(1); -- rv 0
    PMARSVD0_in(2) <= '0' when (PMARSVD0(2) = 'Z') else PMARSVD0(2); -- rv 0
    PMARSVD0_in(3) <= '0' when (PMARSVD0(3) = 'Z') else PMARSVD0(3); -- rv 0
    PMARSVD0_in(4) <= '0' when (PMARSVD0(4) = 'Z') else PMARSVD0(4); -- rv 0
    PMARSVD0_in(5) <= '0' when (PMARSVD0(5) = 'Z') else PMARSVD0(5); -- rv 0
    PMARSVD0_in(6) <= '0' when (PMARSVD0(6) = 'Z') else PMARSVD0(6); -- rv 0
    PMARSVD0_in(7) <= '0' when (PMARSVD0(7) = 'Z') else PMARSVD0(7); -- rv 0
    PMARSVD1_in(0) <= '0' when (PMARSVD1(0) = 'Z') else PMARSVD1(0); -- rv 0
    PMARSVD1_in(1) <= '0' when (PMARSVD1(1) = 'Z') else PMARSVD1(1); -- rv 0
    PMARSVD1_in(2) <= '0' when (PMARSVD1(2) = 'Z') else PMARSVD1(2); -- rv 0
    PMARSVD1_in(3) <= '0' when (PMARSVD1(3) = 'Z') else PMARSVD1(3); -- rv 0
    PMARSVD1_in(4) <= '0' when (PMARSVD1(4) = 'Z') else PMARSVD1(4); -- rv 0
    PMARSVD1_in(5) <= '0' when (PMARSVD1(5) = 'Z') else PMARSVD1(5); -- rv 0
    PMARSVD1_in(6) <= '0' when (PMARSVD1(6) = 'Z') else PMARSVD1(6); -- rv 0
    PMARSVD1_in(7) <= '0' when (PMARSVD1(7) = 'Z') else PMARSVD1(7); -- rv 0
    QPLL0CLKRSVD0_in <= '1' when (QPLL0CLKRSVD0 = 'Z') else QPLL0CLKRSVD0; -- rv 1
    QPLL0CLKRSVD1_in <= '1' when (QPLL0CLKRSVD1 = 'Z') else QPLL0CLKRSVD1; -- rv 1
    QPLL0LOCKDETCLK_in <= '1' when (QPLL0LOCKDETCLK = 'Z') else QPLL0LOCKDETCLK; -- rv 1
    QPLL0LOCKEN_in <= '0' when (QPLL0LOCKEN = 'Z') else QPLL0LOCKEN; -- rv 0
    QPLL0PD_in <= '0' when (QPLL0PD = 'Z') else QPLL0PD; -- rv 0
    QPLL0REFCLKSEL_in(0) <= '1' when (QPLL0REFCLKSEL(0) = 'Z') else QPLL0REFCLKSEL(0); -- rv 1
    QPLL0REFCLKSEL_in(1) <= '0' when (QPLL0REFCLKSEL(1) = 'Z') else QPLL0REFCLKSEL(1); -- rv 0
    QPLL0REFCLKSEL_in(2) <= '0' when (QPLL0REFCLKSEL(2) = 'Z') else QPLL0REFCLKSEL(2); -- rv 0
    QPLL0RESET_in <= '0' when (QPLL0RESET = 'Z') else QPLL0RESET; -- rv 0
    QPLL1CLKRSVD0_in <= '1' when (QPLL1CLKRSVD0 = 'Z') else QPLL1CLKRSVD0; -- rv 1
    QPLL1CLKRSVD1_in <= '1' when (QPLL1CLKRSVD1 = 'Z') else QPLL1CLKRSVD1; -- rv 1
    QPLL1LOCKDETCLK_in <= '1' when (QPLL1LOCKDETCLK = 'Z') else QPLL1LOCKDETCLK; -- rv 1
    QPLL1LOCKEN_in <= '0' when (QPLL1LOCKEN = 'Z') else QPLL1LOCKEN; -- rv 0
    QPLL1PD_in <= '0' when (QPLL1PD = 'Z') else QPLL1PD; -- rv 0
    QPLL1REFCLKSEL_in(0) <= '1' when (QPLL1REFCLKSEL(0) = 'Z') else QPLL1REFCLKSEL(0); -- rv 1
    QPLL1REFCLKSEL_in(1) <= '0' when (QPLL1REFCLKSEL(1) = 'Z') else QPLL1REFCLKSEL(1); -- rv 0
    QPLL1REFCLKSEL_in(2) <= '0' when (QPLL1REFCLKSEL(2) = 'Z') else QPLL1REFCLKSEL(2); -- rv 0
    QPLL1RESET_in <= '0' when (QPLL1RESET = 'Z') else QPLL1RESET; -- rv 0
    QPLLRSVD1_in(0) <= '0' when (QPLLRSVD1(0) = 'Z') else QPLLRSVD1(0); -- rv 0
    QPLLRSVD1_in(1) <= '0' when (QPLLRSVD1(1) = 'Z') else QPLLRSVD1(1); -- rv 0
    QPLLRSVD1_in(2) <= '0' when (QPLLRSVD1(2) = 'Z') else QPLLRSVD1(2); -- rv 0
    QPLLRSVD1_in(3) <= '0' when (QPLLRSVD1(3) = 'Z') else QPLLRSVD1(3); -- rv 0
    QPLLRSVD1_in(4) <= '0' when (QPLLRSVD1(4) = 'Z') else QPLLRSVD1(4); -- rv 0
    QPLLRSVD1_in(5) <= '0' when (QPLLRSVD1(5) = 'Z') else QPLLRSVD1(5); -- rv 0
    QPLLRSVD1_in(6) <= '0' when (QPLLRSVD1(6) = 'Z') else QPLLRSVD1(6); -- rv 0
    QPLLRSVD1_in(7) <= '0' when (QPLLRSVD1(7) = 'Z') else QPLLRSVD1(7); -- rv 0
    QPLLRSVD2_in(0) <= '0' when (QPLLRSVD2(0) = 'Z') else QPLLRSVD2(0); -- rv 0
    QPLLRSVD2_in(1) <= '0' when (QPLLRSVD2(1) = 'Z') else QPLLRSVD2(1); -- rv 0
    QPLLRSVD2_in(2) <= '0' when (QPLLRSVD2(2) = 'Z') else QPLLRSVD2(2); -- rv 0
    QPLLRSVD2_in(3) <= '0' when (QPLLRSVD2(3) = 'Z') else QPLLRSVD2(3); -- rv 0
    QPLLRSVD2_in(4) <= '0' when (QPLLRSVD2(4) = 'Z') else QPLLRSVD2(4); -- rv 0
    QPLLRSVD3_in(0) <= '0' when (QPLLRSVD3(0) = 'Z') else QPLLRSVD3(0); -- rv 0
    QPLLRSVD3_in(1) <= '0' when (QPLLRSVD3(1) = 'Z') else QPLLRSVD3(1); -- rv 0
    QPLLRSVD3_in(2) <= '0' when (QPLLRSVD3(2) = 'Z') else QPLLRSVD3(2); -- rv 0
    QPLLRSVD3_in(3) <= '0' when (QPLLRSVD3(3) = 'Z') else QPLLRSVD3(3); -- rv 0
    QPLLRSVD3_in(4) <= '0' when (QPLLRSVD3(4) = 'Z') else QPLLRSVD3(4); -- rv 0
    QPLLRSVD4_in(0) <= '0' when (QPLLRSVD4(0) = 'Z') else QPLLRSVD4(0); -- rv 0
    QPLLRSVD4_in(1) <= '0' when (QPLLRSVD4(1) = 'Z') else QPLLRSVD4(1); -- rv 0
    QPLLRSVD4_in(2) <= '0' when (QPLLRSVD4(2) = 'Z') else QPLLRSVD4(2); -- rv 0
    QPLLRSVD4_in(3) <= '0' when (QPLLRSVD4(3) = 'Z') else QPLLRSVD4(3); -- rv 0
    QPLLRSVD4_in(4) <= '0' when (QPLLRSVD4(4) = 'Z') else QPLLRSVD4(4); -- rv 0
    QPLLRSVD4_in(5) <= '0' when (QPLLRSVD4(5) = 'Z') else QPLLRSVD4(5); -- rv 0
    QPLLRSVD4_in(6) <= '0' when (QPLLRSVD4(6) = 'Z') else QPLLRSVD4(6); -- rv 0
    QPLLRSVD4_in(7) <= '0' when (QPLLRSVD4(7) = 'Z') else QPLLRSVD4(7); -- rv 0
    RCALENB_in <= RCALENB;
    

    PMASCANCLK_in <= "11111111"; -- tie off

    PMASCANENB_in <= '1'; -- tie off
    PMASCANIN_in <= "11111111"; -- tie off
    QDPMASCANMODEB_in <= '1'; -- tie off
    QDPMASCANRSTEN_in <= '1'; -- tie off
    RXRECCLK_in <= "1111"; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- QPLL0_FBDIV check
    if ((QPLL0_FBDIV < 16) or (QPLL0_FBDIV > 160)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-150] QPLL0_FBDIV attribute is set to "));
      Write ( Message, QPLL0_FBDIV);
      Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- QPLL0_FBDIV_G3 check
    if ((QPLL0_FBDIV_G3 < 16) or (QPLL0_FBDIV_G3 > 160)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-151] QPLL0_FBDIV_G3 attribute is set to "));
      Write ( Message, QPLL0_FBDIV_G3);
      Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- QPLL0_REFCLK_DIV check
  if((xil_attr_test) or
     ((QPLL0_REFCLK_DIV /= 2) and 
      (QPLL0_REFCLK_DIV /= 1) and 
      (QPLL0_REFCLK_DIV /= 3) and 
      (QPLL0_REFCLK_DIV /= 4) and 
      (QPLL0_REFCLK_DIV /= 5) and 
      (QPLL0_REFCLK_DIV /= 6) and 
      (QPLL0_REFCLK_DIV /= 8) and 
      (QPLL0_REFCLK_DIV /= 10) and 
      (QPLL0_REFCLK_DIV /= 12) and 
      (QPLL0_REFCLK_DIV /= 16) and 
      (QPLL0_REFCLK_DIV /= 20))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-158] QPLL0_REFCLK_DIV attribute is set to "));
    Write ( Message, QPLL0_REFCLK_DIV);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1, "));
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
    Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- QPLL1_FBDIV check
    if ((QPLL1_FBDIV < 16) or (QPLL1_FBDIV > 160)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-172] QPLL1_FBDIV attribute is set to "));
      Write ( Message, QPLL1_FBDIV);
      Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- QPLL1_FBDIV_G3 check
    if ((QPLL1_FBDIV_G3 < 16) or (QPLL1_FBDIV_G3 > 160)) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-173] QPLL1_FBDIV_G3 attribute is set to "));
      Write ( Message, QPLL1_FBDIV_G3);
      Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    -------- QPLL1_REFCLK_DIV check
  if((xil_attr_test) or
     ((QPLL1_REFCLK_DIV /= 2) and 
      (QPLL1_REFCLK_DIV /= 1) and 
      (QPLL1_REFCLK_DIV /= 3) and 
      (QPLL1_REFCLK_DIV /= 4) and 
      (QPLL1_REFCLK_DIV /= 5) and 
      (QPLL1_REFCLK_DIV /= 6) and 
      (QPLL1_REFCLK_DIV /= 8) and 
      (QPLL1_REFCLK_DIV /= 10) and 
      (QPLL1_REFCLK_DIV /= 12) and 
      (QPLL1_REFCLK_DIV /= 16) and 
      (QPLL1_REFCLK_DIV /= 20))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-180] QPLL1_REFCLK_DIV attribute is set to "));
    Write ( Message, QPLL1_REFCLK_DIV);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1, "));
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
    Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
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
    Write ( Message, string'("-212] SIM_RESET_SPEEDUP attribute is set to """));
    Write ( Message, string'(SIM_RESET_SPEEDUP));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
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
    Write ( Message, string'("-213] SIM_VERSION attribute is set to "));
    Write ( Message, SIM_VERSION);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2, "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("3. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-174] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTHE3_COMMON_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    GTHE3_COMMON_INST : SIP_GTHE3_COMMON
      generic map (
        SIM_RESET_SPEEDUP    => SIM_RESET_SPEEDUP,
        SIM_VERSION          => SIM_VERSION
      )
      port map (
        AEN_BGBS0            => AEN_BGBS0_BIN,
        AEN_BGBS1            => AEN_BGBS1_BIN,
        AEN_MASTER0          => AEN_MASTER0_BIN,
        AEN_MASTER1          => AEN_MASTER1_BIN,
        AEN_PD0              => AEN_PD0_BIN,
        AEN_PD1              => AEN_PD1_BIN,
        AEN_QPLL0            => AEN_QPLL0_BIN,
        AEN_QPLL1            => AEN_QPLL1_BIN,
        AEN_REFCLK0          => AEN_REFCLK0_BIN,
        AEN_REFCLK1          => AEN_REFCLK1_BIN,
        AEN_RESET0           => AEN_RESET0_BIN,
        AEN_RESET1           => AEN_RESET1_BIN,
        AQDMUXSEL1           => AQDMUXSEL1_BIN,
        AVCC_SENSE_SEL       => AVCC_SENSE_SEL_BIN,
        AVTT_SENSE_SEL       => AVTT_SENSE_SEL_BIN,
        A_BGMONITOREN        => A_BGMONITOREN_BIN,
        A_BGPD               => A_BGPD_BIN,
        A_GTREFCLKPD0        => A_GTREFCLKPD0_BIN,
        A_GTREFCLKPD1        => A_GTREFCLKPD1_BIN,
        A_QPLL0LOCKEN        => A_QPLL0LOCKEN_BIN,
        A_QPLL0PD            => A_QPLL0PD_BIN,
        A_QPLL0RESET         => A_QPLL0RESET_BIN,
        A_QPLL1LOCKEN        => A_QPLL1LOCKEN_BIN,
        A_QPLL1PD            => A_QPLL1PD_BIN,
        A_QPLL1RESET         => A_QPLL1RESET_BIN,
        BIAS_CFG0            => BIAS_CFG0_BIN,
        BIAS_CFG1            => BIAS_CFG1_BIN,
        BIAS_CFG2            => BIAS_CFG2_BIN,
        BIAS_CFG3            => BIAS_CFG3_BIN,
        BIAS_CFG4            => BIAS_CFG4_BIN,
        BIAS_CFG_RSVD        => BIAS_CFG_RSVD_BIN,
        COMMON_AMUX_SEL0     => COMMON_AMUX_SEL0_BIN,
        COMMON_AMUX_SEL1     => COMMON_AMUX_SEL1_BIN,
        COMMON_CFG0          => COMMON_CFG0_BIN,
        COMMON_CFG1          => COMMON_CFG1_BIN,
        COMMON_INSTANTIATED  => COMMON_INSTANTIATED_BIN,
        POR_CFG              => POR_CFG_BIN,
        PPF0_CFG             => PPF0_CFG_BIN,
        PPF1_CFG             => PPF1_CFG_BIN,
        QPLL0_AMONITOR_SEL   => QPLL0_AMONITOR_SEL_BIN,
        QPLL0_CFG0           => QPLL0_CFG0_BIN,
        QPLL0_CFG1           => QPLL0_CFG1_BIN,
        QPLL0_CFG1_G3        => QPLL0_CFG1_G3_BIN,
        QPLL0_CFG2           => QPLL0_CFG2_BIN,
        QPLL0_CFG2_G3        => QPLL0_CFG2_G3_BIN,
        QPLL0_CFG3           => QPLL0_CFG3_BIN,
        QPLL0_CFG4           => QPLL0_CFG4_BIN,
        QPLL0_CP             => QPLL0_CP_BIN,
        QPLL0_CP_G3          => QPLL0_CP_G3_BIN,
        QPLL0_FBDIV          => QPLL0_FBDIV_BIN,
        QPLL0_FBDIV_G3       => QPLL0_FBDIV_G3_BIN,
        QPLL0_INIT_CFG0      => QPLL0_INIT_CFG0_BIN,
        QPLL0_INIT_CFG1      => QPLL0_INIT_CFG1_BIN,
        QPLL0_LOCK_CFG       => QPLL0_LOCK_CFG_BIN,
        QPLL0_LOCK_CFG_G3    => QPLL0_LOCK_CFG_G3_BIN,
        QPLL0_LPF            => QPLL0_LPF_BIN,
        QPLL0_LPF_G3         => QPLL0_LPF_G3_BIN,
        QPLL0_REFCLK_DIV     => QPLL0_REFCLK_DIV_BIN,
        QPLL0_SDM_CFG0       => QPLL0_SDM_CFG0_BIN,
        QPLL0_SDM_CFG1       => QPLL0_SDM_CFG1_BIN,
        QPLL0_SDM_CFG2       => QPLL0_SDM_CFG2_BIN,
        QPLL1_AMONITOR_SEL   => QPLL1_AMONITOR_SEL_BIN,
        QPLL1_CFG0           => QPLL1_CFG0_BIN,
        QPLL1_CFG1           => QPLL1_CFG1_BIN,
        QPLL1_CFG1_G3        => QPLL1_CFG1_G3_BIN,
        QPLL1_CFG2           => QPLL1_CFG2_BIN,
        QPLL1_CFG2_G3        => QPLL1_CFG2_G3_BIN,
        QPLL1_CFG3           => QPLL1_CFG3_BIN,
        QPLL1_CFG4           => QPLL1_CFG4_BIN,
        QPLL1_CP             => QPLL1_CP_BIN,
        QPLL1_CP_G3          => QPLL1_CP_G3_BIN,
        QPLL1_FBDIV          => QPLL1_FBDIV_BIN,
        QPLL1_FBDIV_G3       => QPLL1_FBDIV_G3_BIN,
        QPLL1_INIT_CFG0      => QPLL1_INIT_CFG0_BIN,
        QPLL1_INIT_CFG1      => QPLL1_INIT_CFG1_BIN,
        QPLL1_LOCK_CFG       => QPLL1_LOCK_CFG_BIN,
        QPLL1_LOCK_CFG_G3    => QPLL1_LOCK_CFG_G3_BIN,
        QPLL1_LPF            => QPLL1_LPF_BIN,
        QPLL1_LPF_G3         => QPLL1_LPF_G3_BIN,
        QPLL1_REFCLK_DIV     => QPLL1_REFCLK_DIV_BIN,
        QPLL1_SDM_CFG0       => QPLL1_SDM_CFG0_BIN,
        QPLL1_SDM_CFG1       => QPLL1_SDM_CFG1_BIN,
        QPLL1_SDM_CFG2       => QPLL1_SDM_CFG2_BIN,
        RCALSAP_TESTEN       => RCALSAP_TESTEN_BIN,
        RCAL_APROBE          => RCAL_APROBE_BIN,
        REFCLK0_EN_DC_COUP   => REFCLK0_EN_DC_COUP_BIN,
        REFCLK0_VCM_HIGH     => REFCLK0_VCM_HIGH_BIN,
        REFCLK0_VCM_LOW      => REFCLK0_VCM_LOW_BIN,
        REFCLK1_EN_DC_COUP   => REFCLK1_EN_DC_COUP_BIN,
        REFCLK1_VCM_HIGH     => REFCLK1_VCM_HIGH_BIN,
        REFCLK1_VCM_LOW      => REFCLK1_VCM_LOW_BIN,
        RSVD_ATTR0           => RSVD_ATTR0_BIN,
        RSVD_ATTR1           => RSVD_ATTR1_BIN,
        RSVD_ATTR2           => RSVD_ATTR2_BIN,
        RSVD_ATTR3           => RSVD_ATTR3_BIN,
        RXRECCLKOUT0_SEL     => RXRECCLKOUT0_SEL_BIN,
        RXRECCLKOUT1_SEL     => RXRECCLKOUT1_SEL_BIN,
        SARC_EN              => SARC_EN_BIN,
        SARC_SEL             => SARC_SEL_BIN,
        SDM0DATA1_0          => SDM0DATA1_0_BIN,
        SDM0DATA1_1          => SDM0DATA1_1_BIN,
        SDM0INITSEED0_0      => SDM0INITSEED0_0_BIN,
        SDM0INITSEED0_1      => SDM0INITSEED0_1_BIN,
        SDM0_DATA_PIN_SEL    => SDM0_DATA_PIN_SEL_BIN,
        SDM0_WIDTH_PIN_SEL   => SDM0_WIDTH_PIN_SEL_BIN,
        SDM1DATA1_0          => SDM1DATA1_0_BIN,
        SDM1DATA1_1          => SDM1DATA1_1_BIN,
        SDM1INITSEED0_0      => SDM1INITSEED0_0_BIN,
        SDM1INITSEED0_1      => SDM1INITSEED0_1_BIN,
        SDM1_DATA_PIN_SEL    => SDM1_DATA_PIN_SEL_BIN,
        SDM1_WIDTH_PIN_SEL   => SDM1_WIDTH_PIN_SEL_BIN,
        VCCAUX_SENSE_SEL     => VCCAUX_SENSE_SEL_BIN,
        DRPDO                => DRPDO_out,
        DRPRDY               => DRPRDY_out,
        PMARSVDOUT0          => PMARSVDOUT0_out,
        PMARSVDOUT1          => PMARSVDOUT1_out,
        PMASCANOUT           => PMASCANOUT_out,
        QPLL0FBCLKLOST       => QPLL0FBCLKLOST_out,
        QPLL0LOCK            => QPLL0LOCK_out,
        QPLL0OUTCLK          => QPLL0OUTCLK_out,
        QPLL0OUTREFCLK       => QPLL0OUTREFCLK_out,
        QPLL0REFCLKLOST      => QPLL0REFCLKLOST_out,
        QPLL1FBCLKLOST       => QPLL1FBCLKLOST_out,
        QPLL1LOCK            => QPLL1LOCK_out,
        QPLL1OUTCLK          => QPLL1OUTCLK_out,
        QPLL1OUTREFCLK       => QPLL1OUTREFCLK_out,
        QPLL1REFCLKLOST      => QPLL1REFCLKLOST_out,
        QPLLDMONITOR0        => QPLLDMONITOR0_out,
        QPLLDMONITOR1        => QPLLDMONITOR1_out,
        REFCLKOUTMONITOR0    => REFCLKOUTMONITOR0_out,
        REFCLKOUTMONITOR1    => REFCLKOUTMONITOR1_out,
        RXRECCLK0_SEL        => RXRECCLK0_SEL_out,
        RXRECCLK1_SEL        => RXRECCLK1_SEL_out,
        SARCCLK              => SARCCLK_out,
        BGBYPASSB            => BGBYPASSB_in,
        BGMONITORENB         => BGMONITORENB_in,
        BGPDB                => BGPDB_in,
        BGRCALOVRD           => BGRCALOVRD_in,
        BGRCALOVRDENB        => BGRCALOVRDENB_in,
        DRPADDR              => DRPADDR_in,
        DRPCLK               => DRPCLK_in,
        DRPDI                => DRPDI_in,
        DRPEN                => DRPEN_in,
        DRPWE                => DRPWE_in,
        GTGREFCLK0           => GTGREFCLK0_in,
        GTGREFCLK1           => GTGREFCLK1_in,
        GTNORTHREFCLK00      => GTNORTHREFCLK00_in,
        GTNORTHREFCLK01      => GTNORTHREFCLK01_in,
        GTNORTHREFCLK10      => GTNORTHREFCLK10_in,
        GTNORTHREFCLK11      => GTNORTHREFCLK11_in,
        GTREFCLK00           => GTREFCLK00_in,
        GTREFCLK01           => GTREFCLK01_in,
        GTREFCLK10           => GTREFCLK10_in,
        GTREFCLK11           => GTREFCLK11_in,
        GTSOUTHREFCLK00      => GTSOUTHREFCLK00_in,
        GTSOUTHREFCLK01      => GTSOUTHREFCLK01_in,
        GTSOUTHREFCLK10      => GTSOUTHREFCLK10_in,
        GTSOUTHREFCLK11      => GTSOUTHREFCLK11_in,
        PMARSVD0             => PMARSVD0_in,
        PMARSVD1             => PMARSVD1_in,
        PMASCANCLK           => PMASCANCLK_in,
        PMASCANENB           => PMASCANENB_in,
        PMASCANIN            => PMASCANIN_in,
        QDPMASCANMODEB       => QDPMASCANMODEB_in,
        QDPMASCANRSTEN       => QDPMASCANRSTEN_in,
        QPLL0CLKRSVD0        => QPLL0CLKRSVD0_in,
        QPLL0CLKRSVD1        => QPLL0CLKRSVD1_in,
        QPLL0LOCKDETCLK      => QPLL0LOCKDETCLK_in,
        QPLL0LOCKEN          => QPLL0LOCKEN_in,
        QPLL0PD              => QPLL0PD_in,
        QPLL0REFCLKSEL       => QPLL0REFCLKSEL_in,
        QPLL0RESET           => QPLL0RESET_in,
        QPLL1CLKRSVD0        => QPLL1CLKRSVD0_in,
        QPLL1CLKRSVD1        => QPLL1CLKRSVD1_in,
        QPLL1LOCKDETCLK      => QPLL1LOCKDETCLK_in,
        QPLL1LOCKEN          => QPLL1LOCKEN_in,
        QPLL1PD              => QPLL1PD_in,
        QPLL1REFCLKSEL       => QPLL1REFCLKSEL_in,
        QPLL1RESET           => QPLL1RESET_in,
        QPLLRSVD1            => QPLLRSVD1_in,
        QPLLRSVD2            => QPLLRSVD2_in,
        QPLLRSVD3            => QPLLRSVD3_in,
        QPLLRSVD4            => QPLLRSVD4_in,
        RCALENB              => RCALENB_in,
        RXRECCLK             => RXRECCLK_in,
        GSR                  => glblGSR        
      );
  end GTHE3_COMMON_V;
