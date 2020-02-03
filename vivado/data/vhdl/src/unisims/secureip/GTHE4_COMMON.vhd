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
-- /___/   /\      Filename    : GTHE4_COMMON.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- 
-- End Revision
-------------------------------------------------------------------------------

----- CELL GTHE4_COMMON -----

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

entity GTHE4_COMMON is
  generic (
    AEN_QPLL0_FBDIV : bit := '1';
    AEN_QPLL1_FBDIV : bit := '1';
    AEN_SDM0TOGGLE : bit := '0';
    AEN_SDM1TOGGLE : bit := '0';
    A_SDM0TOGGLE : bit := '0';
    A_SDM1DATA_HIGH : std_logic_vector(8 downto 0) := "000000000";
    A_SDM1DATA_LOW : std_logic_vector(15 downto 0) := "0000000000000000";
    A_SDM1TOGGLE : bit := '0';
    BIAS_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG3 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG4 : std_logic_vector(15 downto 0) := X"0000";
    BIAS_CFG_RSVD : std_logic_vector(15 downto 0) := X"0000";
    COMMON_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    COMMON_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    POR_CFG : std_logic_vector(15 downto 0) := X"0000";
    PPF0_CFG : std_logic_vector(15 downto 0) := X"0F00";
    PPF1_CFG : std_logic_vector(15 downto 0) := X"0F00";
    QPLL0CLKOUT_RATE : string := "FULL";
    QPLL0_CFG0 : std_logic_vector(15 downto 0) := X"391C";
    QPLL0_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_CFG1_G3 : std_logic_vector(15 downto 0) := X"0020";
    QPLL0_CFG2 : std_logic_vector(15 downto 0) := X"0F80";
    QPLL0_CFG2_G3 : std_logic_vector(15 downto 0) := X"0F80";
    QPLL0_CFG3 : std_logic_vector(15 downto 0) := X"0120";
    QPLL0_CFG4 : std_logic_vector(15 downto 0) := X"0002";
    QPLL0_CP : std_logic_vector(9 downto 0) := "0000011111";
    QPLL0_CP_G3 : std_logic_vector(9 downto 0) := "0000011111";
    QPLL0_FBDIV : integer := 66;
    QPLL0_FBDIV_G3 : integer := 80;
    QPLL0_INIT_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_INIT_CFG1 : std_logic_vector(7 downto 0) := X"00";
    QPLL0_LOCK_CFG : std_logic_vector(15 downto 0) := X"01E8";
    QPLL0_LOCK_CFG_G3 : std_logic_vector(15 downto 0) := X"21E8";
    QPLL0_LPF : std_logic_vector(9 downto 0) := "1011111111";
    QPLL0_LPF_G3 : std_logic_vector(9 downto 0) := "1111111111";
    QPLL0_PCI_EN : bit := '0';
    QPLL0_RATE_SW_USE_DRP : bit := '0';
    QPLL0_REFCLK_DIV : integer := 1;
    QPLL0_SDM_CFG0 : std_logic_vector(15 downto 0) := X"0040";
    QPLL0_SDM_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    QPLL0_SDM_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1CLKOUT_RATE : string := "FULL";
    QPLL1_CFG0 : std_logic_vector(15 downto 0) := X"691C";
    QPLL1_CFG1 : std_logic_vector(15 downto 0) := X"0020";
    QPLL1_CFG1_G3 : std_logic_vector(15 downto 0) := X"0020";
    QPLL1_CFG2 : std_logic_vector(15 downto 0) := X"0F80";
    QPLL1_CFG2_G3 : std_logic_vector(15 downto 0) := X"0F80";
    QPLL1_CFG3 : std_logic_vector(15 downto 0) := X"0120";
    QPLL1_CFG4 : std_logic_vector(15 downto 0) := X"0002";
    QPLL1_CP : std_logic_vector(9 downto 0) := "0000011111";
    QPLL1_CP_G3 : std_logic_vector(9 downto 0) := "0000011111";
    QPLL1_FBDIV : integer := 66;
    QPLL1_FBDIV_G3 : integer := 80;
    QPLL1_INIT_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_INIT_CFG1 : std_logic_vector(7 downto 0) := X"00";
    QPLL1_LOCK_CFG : std_logic_vector(15 downto 0) := X"01E8";
    QPLL1_LOCK_CFG_G3 : std_logic_vector(15 downto 0) := X"21E8";
    QPLL1_LPF : std_logic_vector(9 downto 0) := "1011111111";
    QPLL1_LPF_G3 : std_logic_vector(9 downto 0) := "1111111111";
    QPLL1_PCI_EN : bit := '0';
    QPLL1_RATE_SW_USE_DRP : bit := '0';
    QPLL1_REFCLK_DIV : integer := 1;
    QPLL1_SDM_CFG0 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_SDM_CFG1 : std_logic_vector(15 downto 0) := X"0000";
    QPLL1_SDM_CFG2 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR0 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR1 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR2 : std_logic_vector(15 downto 0) := X"0000";
    RSVD_ATTR3 : std_logic_vector(15 downto 0) := X"0000";
    RXRECCLKOUT0_SEL : std_logic_vector(1 downto 0) := "00";
    RXRECCLKOUT1_SEL : std_logic_vector(1 downto 0) := "00";
    SARC_ENB : bit := '0';
    SARC_SEL : bit := '0';
    SDM0INITSEED0_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM0INITSEED0_1 : std_logic_vector(8 downto 0) := "000000000";
    SDM1INITSEED0_0 : std_logic_vector(15 downto 0) := "0000000000000000";
    SDM1INITSEED0_1 : std_logic_vector(8 downto 0) := "000000000";
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    SIM_MODE : string := "FAST";
    SIM_RESET_SPEEDUP : string := "TRUE"
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
    RXRECCLK0SEL         : out std_logic_vector(1 downto 0);
    RXRECCLK1SEL         : out std_logic_vector(1 downto 0);
    SDM0FINALOUT         : out std_logic_vector(3 downto 0);
    SDM0TESTDATA         : out std_logic_vector(14 downto 0);
    SDM1FINALOUT         : out std_logic_vector(3 downto 0);
    SDM1TESTDATA         : out std_logic_vector(14 downto 0);
    TCONGPO              : out std_logic_vector(9 downto 0);
    TCONRSVDOUT0         : out std_ulogic;
    BGBYPASSB            : in std_ulogic;
    BGMONITORENB         : in std_ulogic;
    BGPDB                : in std_ulogic;
    BGRCALOVRD           : in std_logic_vector(4 downto 0);
    BGRCALOVRDENB        : in std_ulogic;
    DRPADDR              : in std_logic_vector(15 downto 0);
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
    PCIERATEQPLL0        : in std_logic_vector(2 downto 0);
    PCIERATEQPLL1        : in std_logic_vector(2 downto 0);
    PMARSVD0             : in std_logic_vector(7 downto 0);
    PMARSVD1             : in std_logic_vector(7 downto 0);
    QPLL0CLKRSVD0        : in std_ulogic;
    QPLL0CLKRSVD1        : in std_ulogic;
    QPLL0FBDIV           : in std_logic_vector(7 downto 0);
    QPLL0LOCKDETCLK      : in std_ulogic;
    QPLL0LOCKEN          : in std_ulogic;
    QPLL0PD              : in std_ulogic;
    QPLL0REFCLKSEL       : in std_logic_vector(2 downto 0);
    QPLL0RESET           : in std_ulogic;
    QPLL1CLKRSVD0        : in std_ulogic;
    QPLL1CLKRSVD1        : in std_ulogic;
    QPLL1FBDIV           : in std_logic_vector(7 downto 0);
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
    SDM0DATA             : in std_logic_vector(24 downto 0);
    SDM0RESET            : in std_ulogic;
    SDM0TOGGLE           : in std_ulogic;
    SDM0WIDTH            : in std_logic_vector(1 downto 0);
    SDM1DATA             : in std_logic_vector(24 downto 0);
    SDM1RESET            : in std_ulogic;
    SDM1TOGGLE           : in std_ulogic;
    SDM1WIDTH            : in std_logic_vector(1 downto 0);
    TCONGPI              : in std_logic_vector(9 downto 0);
    TCONPOWERUP          : in std_ulogic;
    TCONRESET            : in std_logic_vector(1 downto 0);
    TCONRSVDIN1          : in std_logic_vector(1 downto 0)
  );
end GTHE4_COMMON;

architecture GTHE4_COMMON_V of GTHE4_COMMON is
  component SIP_GTHE4_COMMON
    port (
      AEN_BGBS0            : in std_logic_vector(0 downto 0);
      AEN_BGBS1            : in std_logic_vector(0 downto 0);
      AEN_MASTER0          : in std_logic_vector(0 downto 0);
      AEN_MASTER1          : in std_logic_vector(0 downto 0);
      AEN_PD0              : in std_logic_vector(0 downto 0);
      AEN_PD1              : in std_logic_vector(0 downto 0);
      AEN_QPLL0            : in std_logic_vector(0 downto 0);
      AEN_QPLL0_FBDIV      : in std_logic_vector(0 downto 0);
      AEN_QPLL1            : in std_logic_vector(0 downto 0);
      AEN_QPLL1_FBDIV      : in std_logic_vector(0 downto 0);
      AEN_REFCLK0          : in std_logic_vector(0 downto 0);
      AEN_REFCLK1          : in std_logic_vector(0 downto 0);
      AEN_RESET0           : in std_logic_vector(0 downto 0);
      AEN_RESET1           : in std_logic_vector(0 downto 0);
      AEN_SDM0DATA         : in std_logic_vector(0 downto 0);
      AEN_SDM0RESET        : in std_logic_vector(0 downto 0);
      AEN_SDM0TOGGLE       : in std_logic_vector(0 downto 0);
      AEN_SDM0WIDTH        : in std_logic_vector(0 downto 0);
      AEN_SDM1DATA         : in std_logic_vector(0 downto 0);
      AEN_SDM1RESET        : in std_logic_vector(0 downto 0);
      AEN_SDM1TOGGLE       : in std_logic_vector(0 downto 0);
      AEN_SDM1WIDTH        : in std_logic_vector(0 downto 0);
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
      A_SDM0DATA_HIGH      : in std_logic_vector(8 downto 0);
      A_SDM0DATA_LOW       : in std_logic_vector(15 downto 0);
      A_SDM0RESET          : in std_logic_vector(0 downto 0);
      A_SDM0TOGGLE         : in std_logic_vector(0 downto 0);
      A_SDM1DATA_HIGH      : in std_logic_vector(8 downto 0);
      A_SDM1DATA_LOW       : in std_logic_vector(15 downto 0);
      A_SDM1RESET          : in std_logic_vector(0 downto 0);
      A_SDM1TOGGLE         : in std_logic_vector(0 downto 0);
      BIAS_CFG0            : in std_logic_vector(15 downto 0);
      BIAS_CFG1            : in std_logic_vector(15 downto 0);
      BIAS_CFG2            : in std_logic_vector(15 downto 0);
      BIAS_CFG3            : in std_logic_vector(15 downto 0);
      BIAS_CFG4            : in std_logic_vector(15 downto 0);
      BIAS_CFG_RSVD        : in std_logic_vector(15 downto 0);
      COMMON_AMUX_SEL0     : in std_logic_vector(1 downto 0);
      COMMON_AMUX_SEL1     : in std_logic_vector(1 downto 0);
      COMMON_CFG0          : in std_logic_vector(15 downto 0);
      COMMON_CFG1          : in std_logic_vector(15 downto 0);
      COMMON_INSTANTIATED  : in std_logic_vector(0 downto 0);
      POR_CFG              : in std_logic_vector(15 downto 0);
      PPF0_CFG             : in std_logic_vector(15 downto 0);
      PPF1_CFG             : in std_logic_vector(15 downto 0);
      QPLL0CLKOUT_RATE     : in std_logic_vector(31 downto 0);
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
      QPLL0_PCI_EN         : in std_logic_vector(0 downto 0);
      QPLL0_RATE_SW_USE_DRP : in std_logic_vector(0 downto 0);
      QPLL0_REFCLK_DIV     : in std_logic_vector(4 downto 0);
      QPLL0_SDM_CFG0       : in std_logic_vector(15 downto 0);
      QPLL0_SDM_CFG1       : in std_logic_vector(15 downto 0);
      QPLL0_SDM_CFG2       : in std_logic_vector(15 downto 0);
      QPLL1CLKOUT_RATE     : in std_logic_vector(31 downto 0);
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
      QPLL1_PCI_EN         : in std_logic_vector(0 downto 0);
      QPLL1_RATE_SW_USE_DRP : in std_logic_vector(0 downto 0);
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
      SARC_ENB             : in std_logic_vector(0 downto 0);
      SARC_SEL             : in std_logic_vector(0 downto 0);
      SDM0INITSEED0_0      : in std_logic_vector(15 downto 0);
      SDM0INITSEED0_1      : in std_logic_vector(8 downto 0);
      SDM1INITSEED0_0      : in std_logic_vector(15 downto 0);
      SDM1INITSEED0_1      : in std_logic_vector(8 downto 0);
      SIM_DEVICE           : in std_logic_vector(159 downto 0);
      SIM_MODE             : in std_logic_vector(47 downto 0);
      SIM_RESET_SPEEDUP    : in std_logic_vector(39 downto 0);
      VCCAUX_SENSE_SEL     : in std_logic_vector(1 downto 0);
      CSSDSTOPCLKDONE0     : out std_ulogic;
      CSSDSTOPCLKDONE1     : out std_ulogic;
      DRPDO                : out std_logic_vector(15 downto 0);
      DRPRDY               : out std_ulogic;
      PMARSVDOUT0          : out std_logic_vector(7 downto 0);
      PMARSVDOUT1          : out std_logic_vector(7 downto 0);
      PMASCANOUT           : out std_logic_vector(9 downto 0);
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
      RXRECCLK0SEL         : out std_logic_vector(1 downto 0);
      RXRECCLK1SEL         : out std_logic_vector(1 downto 0);
      SARCCLK              : out std_logic_vector(3 downto 0);
      SDM0FINALOUT         : out std_logic_vector(3 downto 0);
      SDM0TESTDATA         : out std_logic_vector(14 downto 0);
      SDM1FINALOUT         : out std_logic_vector(3 downto 0);
      SDM1TESTDATA         : out std_logic_vector(14 downto 0);
      TCONGPO              : out std_logic_vector(9 downto 0);
      TCONRSVDOUT0         : out std_ulogic;
      TCONTDO              : out std_ulogic;
      BGBYPASSB            : in std_ulogic;
      BGMONITORENB         : in std_ulogic;
      BGPDB                : in std_ulogic;
      BGRCALOVRD           : in std_logic_vector(4 downto 0);
      BGRCALOVRDENB        : in std_ulogic;
      CSSDSTOPCLK0         : in std_ulogic;
      CSSDSTOPCLK1         : in std_ulogic;
      DRPADDR              : in std_logic_vector(15 downto 0);
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
      PCIERATEQPLL0        : in std_logic_vector(2 downto 0);
      PCIERATEQPLL1        : in std_logic_vector(2 downto 0);
      PMARSVD0             : in std_logic_vector(7 downto 0);
      PMARSVD1             : in std_logic_vector(7 downto 0);
      PMASCANCLK           : in std_logic_vector(9 downto 0);
      PMASCANENB           : in std_ulogic;
      PMASCANIN            : in std_logic_vector(9 downto 0);
      QDPMASCANMODEB       : in std_ulogic;
      QDPMASCANRSTEN       : in std_ulogic;
      QPLL0CLKRSVD0        : in std_ulogic;
      QPLL0CLKRSVD1        : in std_ulogic;
      QPLL0FBDIV           : in std_logic_vector(7 downto 0);
      QPLL0LOCKDETCLK      : in std_ulogic;
      QPLL0LOCKEN          : in std_ulogic;
      QPLL0PD              : in std_ulogic;
      QPLL0REFCLKSEL       : in std_logic_vector(2 downto 0);
      QPLL0RESET           : in std_ulogic;
      QPLL1CLKRSVD0        : in std_ulogic;
      QPLL1CLKRSVD1        : in std_ulogic;
      QPLL1FBDIV           : in std_logic_vector(7 downto 0);
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
      SDM0DATA             : in std_logic_vector(24 downto 0);
      SDM0RESET            : in std_ulogic;
      SDM0TOGGLE           : in std_ulogic;
      SDM0WIDTH            : in std_logic_vector(1 downto 0);
      SDM1DATA             : in std_logic_vector(24 downto 0);
      SDM1RESET            : in std_ulogic;
      SDM1TOGGLE           : in std_ulogic;
      SDM1WIDTH            : in std_logic_vector(1 downto 0);
      TCONGPI              : in std_logic_vector(9 downto 0);
      TCONMBISTMODE        : in std_ulogic;
      TCONPOWERUP          : in std_ulogic;
      TCONRESET            : in std_logic_vector(1 downto 0);
      TCONRSVDIN0          : in std_logic_vector(4 downto 0);
      TCONRSVDIN1          : in std_logic_vector(1 downto 0);
      TCONSPD              : in std_logic_vector(1 downto 0);
      TCONTCK              : in std_ulogic;
      TCONTDI              : in std_ulogic;
      TCONTMS              : in std_ulogic;
      TCONTRST             : in std_ulogic;
      GSR                  : in std_ulogic
    );
  end component;

  constant MODULE_NAME : string := "GTHE4_COMMON";
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
  constant QPLL0CLKOUT_RATE_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(QPLL0CLKOUT_RATE,32);
  constant QPLL1CLKOUT_RATE_BIN : std_logic_vector(31 downto 0) := conv_string_to_slv(QPLL1CLKOUT_RATE,32);
  constant SIM_DEVICE_BIN : std_logic_vector(159 downto 0) := conv_string_to_slv(SIM_DEVICE,160);
  constant SIM_MODE_BIN : std_logic_vector(47 downto 0) := conv_string_to_slv(SIM_MODE,48);
  constant SIM_RESET_SPEEDUP_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SIM_RESET_SPEEDUP,40);

  constant AEN_BGBS0_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_BGBS1_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_MASTER0_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_MASTER1_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_PD0_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_PD1_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_QPLL0_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_QPLL0_FBDIV_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(AEN_QPLL0_FBDIV));
  constant AEN_QPLL1_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_QPLL1_FBDIV_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(AEN_QPLL1_FBDIV));
  constant AEN_REFCLK0_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_REFCLK1_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RESET0_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_RESET1_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_SDM0DATA_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_SDM0RESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_SDM0TOGGLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(AEN_SDM0TOGGLE));
  constant AEN_SDM0WIDTH_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_SDM1DATA_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_SDM1RESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant AEN_SDM1TOGGLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(AEN_SDM1TOGGLE));
  constant AEN_SDM1WIDTH_BIN : std_logic_vector(0 downto 0) := "0";
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
  constant A_SDM0DATA_HIGH_BIN : std_logic_vector(8 downto 0) := "000000000";
  constant A_SDM0DATA_LOW_BIN : std_logic_vector(15 downto 0) := "0000000000000000";
  constant A_SDM0RESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_SDM0TOGGLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_SDM0TOGGLE));
  constant A_SDM1DATA_HIGH_BIN : std_logic_vector(8 downto 0) := A_SDM1DATA_HIGH;
  constant A_SDM1DATA_LOW_BIN : std_logic_vector(15 downto 0) := A_SDM1DATA_LOW;
  constant A_SDM1RESET_BIN : std_logic_vector(0 downto 0) := "0";
  constant A_SDM1TOGGLE_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(A_SDM1TOGGLE));
  constant BIAS_CFG0_BIN : std_logic_vector(15 downto 0) := BIAS_CFG0;
  constant BIAS_CFG1_BIN : std_logic_vector(15 downto 0) := BIAS_CFG1;
  constant BIAS_CFG2_BIN : std_logic_vector(15 downto 0) := BIAS_CFG2;
  constant BIAS_CFG3_BIN : std_logic_vector(15 downto 0) := BIAS_CFG3;
  constant BIAS_CFG4_BIN : std_logic_vector(15 downto 0) := BIAS_CFG4;
  constant BIAS_CFG_RSVD_BIN : std_logic_vector(15 downto 0) := BIAS_CFG_RSVD;
  constant COMMON_AMUX_SEL0_BIN : std_logic_vector(1 downto 0) := "00";
  constant COMMON_AMUX_SEL1_BIN : std_logic_vector(1 downto 0) := "00";
  constant COMMON_CFG0_BIN : std_logic_vector(15 downto 0) := COMMON_CFG0;
  constant COMMON_CFG1_BIN : std_logic_vector(15 downto 0) := COMMON_CFG1;
  constant COMMON_INSTANTIATED_BIN : std_logic_vector(0 downto 0) := "1";
  constant POR_CFG_BIN : std_logic_vector(15 downto 0) := POR_CFG;
  constant PPF0_CFG_BIN : std_logic_vector(15 downto 0) := PPF0_CFG;
  constant PPF1_CFG_BIN : std_logic_vector(15 downto 0) := PPF1_CFG;
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
  constant QPLL0_PCI_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(QPLL0_PCI_EN));
  constant QPLL0_RATE_SW_USE_DRP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(QPLL0_RATE_SW_USE_DRP));
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
  constant QPLL1_PCI_EN_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(QPLL1_PCI_EN));
  constant QPLL1_RATE_SW_USE_DRP_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(QPLL1_RATE_SW_USE_DRP));
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
  constant SARC_ENB_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SARC_ENB));
  constant SARC_SEL_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(SARC_SEL));
  constant SDM0INITSEED0_0_BIN : std_logic_vector(15 downto 0) := SDM0INITSEED0_0;
  constant SDM0INITSEED0_1_BIN : std_logic_vector(8 downto 0) := SDM0INITSEED0_1;
  constant SDM1INITSEED0_0_BIN : std_logic_vector(15 downto 0) := SDM1INITSEED0_0;
  constant SDM1INITSEED0_1_BIN : std_logic_vector(8 downto 0) := SDM1INITSEED0_1;
  constant VCCAUX_SENSE_SEL_BIN : std_logic_vector(1 downto 0) := "00";

-- Parameter encodings and registers

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  signal CSSDSTOPCLKDONE0_out : std_ulogic;
  signal CSSDSTOPCLKDONE1_out : std_ulogic;
  signal DRPDO_out : std_logic_vector(15 downto 0);
  signal DRPRDY_out : std_ulogic;
  signal PMARSVDOUT0_out : std_logic_vector(7 downto 0);
  signal PMARSVDOUT1_out : std_logic_vector(7 downto 0);
  signal PMASCANOUT_out : std_logic_vector(9 downto 0);
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
  signal RXRECCLK0SEL_out : std_logic_vector(1 downto 0);
  signal RXRECCLK1SEL_out : std_logic_vector(1 downto 0);
  signal SARCCLK_out : std_logic_vector(3 downto 0);
  signal SDM0FINALOUT_out : std_logic_vector(3 downto 0);
  signal SDM0TESTDATA_out : std_logic_vector(14 downto 0);
  signal SDM1FINALOUT_out : std_logic_vector(3 downto 0);
  signal SDM1TESTDATA_out : std_logic_vector(14 downto 0);
  signal TCONGPO_out : std_logic_vector(9 downto 0);
  signal TCONRSVDOUT0_out : std_ulogic;
  signal TCONTDO_out : std_ulogic;
  
  signal BGBYPASSB_in : std_ulogic;
  signal BGMONITORENB_in : std_ulogic;
  signal BGPDB_in : std_ulogic;
  signal BGRCALOVRDENB_in : std_ulogic;
  signal BGRCALOVRD_in : std_logic_vector(4 downto 0);
  signal CSSDSTOPCLK0_in : std_ulogic;
  signal CSSDSTOPCLK1_in : std_ulogic;
  signal DRPADDR_in : std_logic_vector(15 downto 0);
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
  signal PCIERATEQPLL0_in : std_logic_vector(2 downto 0);
  signal PCIERATEQPLL1_in : std_logic_vector(2 downto 0);
  signal PMARSVD0_in : std_logic_vector(7 downto 0);
  signal PMARSVD1_in : std_logic_vector(7 downto 0);
  signal PMASCANCLK_in : std_logic_vector(9 downto 0);
  signal PMASCANENB_in : std_ulogic;
  signal PMASCANIN_in : std_logic_vector(9 downto 0);
  signal QDPMASCANMODEB_in : std_ulogic;
  signal QDPMASCANRSTEN_in : std_ulogic;
  signal QPLL0CLKRSVD0_in : std_ulogic;
  signal QPLL0CLKRSVD1_in : std_ulogic;
  signal QPLL0FBDIV_in : std_logic_vector(7 downto 0);
  signal QPLL0LOCKDETCLK_in : std_ulogic;
  signal QPLL0LOCKEN_in : std_ulogic;
  signal QPLL0PD_in : std_ulogic;
  signal QPLL0REFCLKSEL_in : std_logic_vector(2 downto 0);
  signal QPLL0RESET_in : std_ulogic;
  signal QPLL1CLKRSVD0_in : std_ulogic;
  signal QPLL1CLKRSVD1_in : std_ulogic;
  signal QPLL1FBDIV_in : std_logic_vector(7 downto 0);
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
  signal SDM0DATA_in : std_logic_vector(24 downto 0);
  signal SDM0RESET_in : std_ulogic;
  signal SDM0TOGGLE_in : std_ulogic;
  signal SDM0WIDTH_in : std_logic_vector(1 downto 0);
  signal SDM1DATA_in : std_logic_vector(24 downto 0);
  signal SDM1RESET_in : std_ulogic;
  signal SDM1TOGGLE_in : std_ulogic;
  signal SDM1WIDTH_in : std_logic_vector(1 downto 0);
  signal TCONGPI_in : std_logic_vector(9 downto 0);
  signal TCONMBISTMODE_in : std_ulogic;
  signal TCONPOWERUP_in : std_ulogic;
  signal TCONRESET_in : std_logic_vector(1 downto 0);
  signal TCONRSVDIN0_in : std_logic_vector(4 downto 0);
  signal TCONRSVDIN1_in : std_logic_vector(1 downto 0);
  signal TCONSPD_in : std_logic_vector(1 downto 0);
  signal TCONTCK_in : std_ulogic;
  signal TCONTDI_in : std_ulogic;
  signal TCONTMS_in : std_ulogic;
  signal TCONTRST_in : std_ulogic;
  
  -- start behavioral body
  begin
  glblGSR     <= TO_X01(GSR);
  DRPDO <= DRPDO_out;
  DRPRDY <= DRPRDY_out;
  PMARSVDOUT0 <= PMARSVDOUT0_out;
  PMARSVDOUT1 <= PMARSVDOUT1_out;
  QPLL0FBCLKLOST <= QPLL0FBCLKLOST_out;
  QPLL0LOCK <= QPLL0LOCK_out;
  QPLL0OUTCLK <= QPLL0OUTCLK_out;
  QPLL0OUTREFCLK <= QPLL0OUTREFCLK_out;
  QPLL0REFCLKLOST <= QPLL0REFCLKLOST_out;
  QPLL1FBCLKLOST <= QPLL1FBCLKLOST_out;
  QPLL1LOCK <= QPLL1LOCK_out;
  QPLL1OUTCLK <= QPLL1OUTCLK_out;
  QPLL1OUTREFCLK <= QPLL1OUTREFCLK_out;
  QPLL1REFCLKLOST <= QPLL1REFCLKLOST_out;
  QPLLDMONITOR0 <= QPLLDMONITOR0_out;
  QPLLDMONITOR1 <= QPLLDMONITOR1_out;
  REFCLKOUTMONITOR0 <= REFCLKOUTMONITOR0_out;
  REFCLKOUTMONITOR1 <= REFCLKOUTMONITOR1_out;
  RXRECCLK0SEL <= RXRECCLK0SEL_out;
  RXRECCLK1SEL <= RXRECCLK1SEL_out;
  SDM0FINALOUT <= SDM0FINALOUT_out;
  SDM0TESTDATA <= SDM0TESTDATA_out;
  SDM1FINALOUT <= SDM1FINALOUT_out;
  SDM1TESTDATA <= SDM1TESTDATA_out;
  TCONGPO <= TCONGPO_out;
  TCONRSVDOUT0 <= TCONRSVDOUT0_out;
  
  BGBYPASSB_in <= BGBYPASSB;
  BGMONITORENB_in <= BGMONITORENB;
  BGPDB_in <= BGPDB;
  BGRCALOVRDENB_in <= '1' when (BGRCALOVRDENB = 'U') else BGRCALOVRDENB; -- rv 1
  BGRCALOVRD_in <= BGRCALOVRD;
  DRPADDR_in(0) <= '0' when (DRPADDR(0) = 'U') else DRPADDR(0); -- rv 0
  DRPADDR_in(1) <= '0' when (DRPADDR(1) = 'U') else DRPADDR(1); -- rv 0
  DRPADDR_in(10) <= '0' when (DRPADDR(10) = 'U') else DRPADDR(10); -- rv 0
  DRPADDR_in(11) <= '0' when (DRPADDR(11) = 'U') else DRPADDR(11); -- rv 0
  DRPADDR_in(12) <= '0' when (DRPADDR(12) = 'U') else DRPADDR(12); -- rv 0
  DRPADDR_in(13) <= '0' when (DRPADDR(13) = 'U') else DRPADDR(13); -- rv 0
  DRPADDR_in(14) <= '0' when (DRPADDR(14) = 'U') else DRPADDR(14); -- rv 0
  DRPADDR_in(15) <= '0' when (DRPADDR(15) = 'U') else DRPADDR(15); -- rv 0
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
  DRPWE_in <= '0' when (DRPWE = 'U') else DRPWE; -- rv 0
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
  PCIERATEQPLL0_in(0) <= '0' when (PCIERATEQPLL0(0) = 'U') else PCIERATEQPLL0(0); -- rv 0
  PCIERATEQPLL0_in(1) <= '0' when (PCIERATEQPLL0(1) = 'U') else PCIERATEQPLL0(1); -- rv 0
  PCIERATEQPLL0_in(2) <= '0' when (PCIERATEQPLL0(2) = 'U') else PCIERATEQPLL0(2); -- rv 0
  PCIERATEQPLL1_in(0) <= '0' when (PCIERATEQPLL1(0) = 'U') else PCIERATEQPLL1(0); -- rv 0
  PCIERATEQPLL1_in(1) <= '0' when (PCIERATEQPLL1(1) = 'U') else PCIERATEQPLL1(1); -- rv 0
  PCIERATEQPLL1_in(2) <= '0' when (PCIERATEQPLL1(2) = 'U') else PCIERATEQPLL1(2); -- rv 0
  PMARSVD0_in(0) <= '0' when (PMARSVD0(0) = 'U') else PMARSVD0(0); -- rv 0
  PMARSVD0_in(1) <= '0' when (PMARSVD0(1) = 'U') else PMARSVD0(1); -- rv 0
  PMARSVD0_in(2) <= '0' when (PMARSVD0(2) = 'U') else PMARSVD0(2); -- rv 0
  PMARSVD0_in(3) <= '0' when (PMARSVD0(3) = 'U') else PMARSVD0(3); -- rv 0
  PMARSVD0_in(4) <= '0' when (PMARSVD0(4) = 'U') else PMARSVD0(4); -- rv 0
  PMARSVD0_in(5) <= '0' when (PMARSVD0(5) = 'U') else PMARSVD0(5); -- rv 0
  PMARSVD0_in(6) <= '0' when (PMARSVD0(6) = 'U') else PMARSVD0(6); -- rv 0
  PMARSVD0_in(7) <= '0' when (PMARSVD0(7) = 'U') else PMARSVD0(7); -- rv 0
  PMARSVD1_in(0) <= '0' when (PMARSVD1(0) = 'U') else PMARSVD1(0); -- rv 0
  PMARSVD1_in(1) <= '0' when (PMARSVD1(1) = 'U') else PMARSVD1(1); -- rv 0
  PMARSVD1_in(2) <= '0' when (PMARSVD1(2) = 'U') else PMARSVD1(2); -- rv 0
  PMARSVD1_in(3) <= '0' when (PMARSVD1(3) = 'U') else PMARSVD1(3); -- rv 0
  PMARSVD1_in(4) <= '0' when (PMARSVD1(4) = 'U') else PMARSVD1(4); -- rv 0
  PMARSVD1_in(5) <= '0' when (PMARSVD1(5) = 'U') else PMARSVD1(5); -- rv 0
  PMARSVD1_in(6) <= '0' when (PMARSVD1(6) = 'U') else PMARSVD1(6); -- rv 0
  PMARSVD1_in(7) <= '0' when (PMARSVD1(7) = 'U') else PMARSVD1(7); -- rv 0
  QPLL0CLKRSVD0_in <= '0' when (QPLL0CLKRSVD0 = 'U') else QPLL0CLKRSVD0; -- rv 0
  QPLL0CLKRSVD1_in <= '0' when (QPLL0CLKRSVD1 = 'U') else QPLL0CLKRSVD1; -- rv 0
  QPLL0FBDIV_in(0) <= '0' when (QPLL0FBDIV(0) = 'U') else QPLL0FBDIV(0); -- rv 0
  QPLL0FBDIV_in(1) <= '0' when (QPLL0FBDIV(1) = 'U') else QPLL0FBDIV(1); -- rv 0
  QPLL0FBDIV_in(2) <= '0' when (QPLL0FBDIV(2) = 'U') else QPLL0FBDIV(2); -- rv 0
  QPLL0FBDIV_in(3) <= '0' when (QPLL0FBDIV(3) = 'U') else QPLL0FBDIV(3); -- rv 0
  QPLL0FBDIV_in(4) <= '0' when (QPLL0FBDIV(4) = 'U') else QPLL0FBDIV(4); -- rv 0
  QPLL0FBDIV_in(5) <= '0' when (QPLL0FBDIV(5) = 'U') else QPLL0FBDIV(5); -- rv 0
  QPLL0FBDIV_in(6) <= '0' when (QPLL0FBDIV(6) = 'U') else QPLL0FBDIV(6); -- rv 0
  QPLL0FBDIV_in(7) <= '0' when (QPLL0FBDIV(7) = 'U') else QPLL0FBDIV(7); -- rv 0
  QPLL0LOCKDETCLK_in <= '0' when (QPLL0LOCKDETCLK = 'U') else QPLL0LOCKDETCLK; -- rv 0
  QPLL0LOCKEN_in <= '0' when (QPLL0LOCKEN = 'U') else QPLL0LOCKEN; -- rv 0
  QPLL0PD_in <= '0' when (QPLL0PD = 'U') else QPLL0PD; -- rv 0
  QPLL0REFCLKSEL_in(0) <= '1' when (QPLL0REFCLKSEL(0) = 'U') else QPLL0REFCLKSEL(0); -- rv 1
  QPLL0REFCLKSEL_in(1) <= '0' when (QPLL0REFCLKSEL(1) = 'U') else QPLL0REFCLKSEL(1); -- rv 0
  QPLL0REFCLKSEL_in(2) <= '0' when (QPLL0REFCLKSEL(2) = 'U') else QPLL0REFCLKSEL(2); -- rv 0
  QPLL0RESET_in <= '1' when (QPLL0RESET = 'U') else QPLL0RESET; -- rv 1
  QPLL1CLKRSVD0_in <= '0' when (QPLL1CLKRSVD0 = 'U') else QPLL1CLKRSVD0; -- rv 0
  QPLL1CLKRSVD1_in <= '0' when (QPLL1CLKRSVD1 = 'U') else QPLL1CLKRSVD1; -- rv 0
  QPLL1FBDIV_in(0) <= '0' when (QPLL1FBDIV(0) = 'U') else QPLL1FBDIV(0); -- rv 0
  QPLL1FBDIV_in(1) <= '0' when (QPLL1FBDIV(1) = 'U') else QPLL1FBDIV(1); -- rv 0
  QPLL1FBDIV_in(2) <= '0' when (QPLL1FBDIV(2) = 'U') else QPLL1FBDIV(2); -- rv 0
  QPLL1FBDIV_in(3) <= '0' when (QPLL1FBDIV(3) = 'U') else QPLL1FBDIV(3); -- rv 0
  QPLL1FBDIV_in(4) <= '0' when (QPLL1FBDIV(4) = 'U') else QPLL1FBDIV(4); -- rv 0
  QPLL1FBDIV_in(5) <= '0' when (QPLL1FBDIV(5) = 'U') else QPLL1FBDIV(5); -- rv 0
  QPLL1FBDIV_in(6) <= '0' when (QPLL1FBDIV(6) = 'U') else QPLL1FBDIV(6); -- rv 0
  QPLL1FBDIV_in(7) <= '0' when (QPLL1FBDIV(7) = 'U') else QPLL1FBDIV(7); -- rv 0
  QPLL1LOCKDETCLK_in <= '0' when (QPLL1LOCKDETCLK = 'U') else QPLL1LOCKDETCLK; -- rv 0
  QPLL1LOCKEN_in <= '0' when (QPLL1LOCKEN = 'U') else QPLL1LOCKEN; -- rv 0
  QPLL1PD_in <= '0' when (QPLL1PD = 'U') else QPLL1PD; -- rv 0
  QPLL1REFCLKSEL_in(0) <= '1' when (QPLL1REFCLKSEL(0) = 'U') else QPLL1REFCLKSEL(0); -- rv 1
  QPLL1REFCLKSEL_in(1) <= '0' when (QPLL1REFCLKSEL(1) = 'U') else QPLL1REFCLKSEL(1); -- rv 0
  QPLL1REFCLKSEL_in(2) <= '0' when (QPLL1REFCLKSEL(2) = 'U') else QPLL1REFCLKSEL(2); -- rv 0
  QPLL1RESET_in <= '1' when (QPLL1RESET = 'U') else QPLL1RESET; -- rv 1
  QPLLRSVD1_in(0) <= '0' when (QPLLRSVD1(0) = 'U') else QPLLRSVD1(0); -- rv 0
  QPLLRSVD1_in(1) <= '0' when (QPLLRSVD1(1) = 'U') else QPLLRSVD1(1); -- rv 0
  QPLLRSVD1_in(2) <= '0' when (QPLLRSVD1(2) = 'U') else QPLLRSVD1(2); -- rv 0
  QPLLRSVD1_in(3) <= '0' when (QPLLRSVD1(3) = 'U') else QPLLRSVD1(3); -- rv 0
  QPLLRSVD1_in(4) <= '0' when (QPLLRSVD1(4) = 'U') else QPLLRSVD1(4); -- rv 0
  QPLLRSVD1_in(5) <= '0' when (QPLLRSVD1(5) = 'U') else QPLLRSVD1(5); -- rv 0
  QPLLRSVD1_in(6) <= '0' when (QPLLRSVD1(6) = 'U') else QPLLRSVD1(6); -- rv 0
  QPLLRSVD1_in(7) <= '0' when (QPLLRSVD1(7) = 'U') else QPLLRSVD1(7); -- rv 0
  QPLLRSVD2_in(0) <= '0' when (QPLLRSVD2(0) = 'U') else QPLLRSVD2(0); -- rv 0
  QPLLRSVD2_in(1) <= '0' when (QPLLRSVD2(1) = 'U') else QPLLRSVD2(1); -- rv 0
  QPLLRSVD2_in(2) <= '0' when (QPLLRSVD2(2) = 'U') else QPLLRSVD2(2); -- rv 0
  QPLLRSVD2_in(3) <= '0' when (QPLLRSVD2(3) = 'U') else QPLLRSVD2(3); -- rv 0
  QPLLRSVD2_in(4) <= '0' when (QPLLRSVD2(4) = 'U') else QPLLRSVD2(4); -- rv 0
  QPLLRSVD3_in(0) <= '0' when (QPLLRSVD3(0) = 'U') else QPLLRSVD3(0); -- rv 0
  QPLLRSVD3_in(1) <= '0' when (QPLLRSVD3(1) = 'U') else QPLLRSVD3(1); -- rv 0
  QPLLRSVD3_in(2) <= '0' when (QPLLRSVD3(2) = 'U') else QPLLRSVD3(2); -- rv 0
  QPLLRSVD3_in(3) <= '0' when (QPLLRSVD3(3) = 'U') else QPLLRSVD3(3); -- rv 0
  QPLLRSVD3_in(4) <= '0' when (QPLLRSVD3(4) = 'U') else QPLLRSVD3(4); -- rv 0
  QPLLRSVD4_in(0) <= '0' when (QPLLRSVD4(0) = 'U') else QPLLRSVD4(0); -- rv 0
  QPLLRSVD4_in(1) <= '0' when (QPLLRSVD4(1) = 'U') else QPLLRSVD4(1); -- rv 0
  QPLLRSVD4_in(2) <= '0' when (QPLLRSVD4(2) = 'U') else QPLLRSVD4(2); -- rv 0
  QPLLRSVD4_in(3) <= '0' when (QPLLRSVD4(3) = 'U') else QPLLRSVD4(3); -- rv 0
  QPLLRSVD4_in(4) <= '0' when (QPLLRSVD4(4) = 'U') else QPLLRSVD4(4); -- rv 0
  QPLLRSVD4_in(5) <= '0' when (QPLLRSVD4(5) = 'U') else QPLLRSVD4(5); -- rv 0
  QPLLRSVD4_in(6) <= '0' when (QPLLRSVD4(6) = 'U') else QPLLRSVD4(6); -- rv 0
  QPLLRSVD4_in(7) <= '0' when (QPLLRSVD4(7) = 'U') else QPLLRSVD4(7); -- rv 0
  RCALENB_in <= RCALENB;
  SDM0DATA_in(0) <= '0' when (SDM0DATA(0) = 'U') else SDM0DATA(0); -- rv 0
  SDM0DATA_in(1) <= '0' when (SDM0DATA(1) = 'U') else SDM0DATA(1); -- rv 0
  SDM0DATA_in(10) <= '0' when (SDM0DATA(10) = 'U') else SDM0DATA(10); -- rv 0
  SDM0DATA_in(11) <= '0' when (SDM0DATA(11) = 'U') else SDM0DATA(11); -- rv 0
  SDM0DATA_in(12) <= '0' when (SDM0DATA(12) = 'U') else SDM0DATA(12); -- rv 0
  SDM0DATA_in(13) <= '0' when (SDM0DATA(13) = 'U') else SDM0DATA(13); -- rv 0
  SDM0DATA_in(14) <= '0' when (SDM0DATA(14) = 'U') else SDM0DATA(14); -- rv 0
  SDM0DATA_in(15) <= '0' when (SDM0DATA(15) = 'U') else SDM0DATA(15); -- rv 0
  SDM0DATA_in(16) <= '0' when (SDM0DATA(16) = 'U') else SDM0DATA(16); -- rv 0
  SDM0DATA_in(17) <= '0' when (SDM0DATA(17) = 'U') else SDM0DATA(17); -- rv 0
  SDM0DATA_in(18) <= '0' when (SDM0DATA(18) = 'U') else SDM0DATA(18); -- rv 0
  SDM0DATA_in(19) <= '0' when (SDM0DATA(19) = 'U') else SDM0DATA(19); -- rv 0
  SDM0DATA_in(2) <= '0' when (SDM0DATA(2) = 'U') else SDM0DATA(2); -- rv 0
  SDM0DATA_in(20) <= '0' when (SDM0DATA(20) = 'U') else SDM0DATA(20); -- rv 0
  SDM0DATA_in(21) <= '0' when (SDM0DATA(21) = 'U') else SDM0DATA(21); -- rv 0
  SDM0DATA_in(22) <= '0' when (SDM0DATA(22) = 'U') else SDM0DATA(22); -- rv 0
  SDM0DATA_in(23) <= '0' when (SDM0DATA(23) = 'U') else SDM0DATA(23); -- rv 0
  SDM0DATA_in(24) <= '0' when (SDM0DATA(24) = 'U') else SDM0DATA(24); -- rv 0
  SDM0DATA_in(3) <= '0' when (SDM0DATA(3) = 'U') else SDM0DATA(3); -- rv 0
  SDM0DATA_in(4) <= '0' when (SDM0DATA(4) = 'U') else SDM0DATA(4); -- rv 0
  SDM0DATA_in(5) <= '0' when (SDM0DATA(5) = 'U') else SDM0DATA(5); -- rv 0
  SDM0DATA_in(6) <= '0' when (SDM0DATA(6) = 'U') else SDM0DATA(6); -- rv 0
  SDM0DATA_in(7) <= '0' when (SDM0DATA(7) = 'U') else SDM0DATA(7); -- rv 0
  SDM0DATA_in(8) <= '0' when (SDM0DATA(8) = 'U') else SDM0DATA(8); -- rv 0
  SDM0DATA_in(9) <= '0' when (SDM0DATA(9) = 'U') else SDM0DATA(9); -- rv 0
  SDM0RESET_in <= '1' when (SDM0RESET = 'U') else SDM0RESET; -- rv 1
  SDM0TOGGLE_in <= '0' when (SDM0TOGGLE = 'U') else SDM0TOGGLE; -- rv 0
  SDM0WIDTH_in(0) <= '0' when (SDM0WIDTH(0) = 'U') else SDM0WIDTH(0); -- rv 0
  SDM0WIDTH_in(1) <= '0' when (SDM0WIDTH(1) = 'U') else SDM0WIDTH(1); -- rv 0
  SDM1DATA_in(0) <= '0' when (SDM1DATA(0) = 'U') else SDM1DATA(0); -- rv 0
  SDM1DATA_in(1) <= '0' when (SDM1DATA(1) = 'U') else SDM1DATA(1); -- rv 0
  SDM1DATA_in(10) <= '0' when (SDM1DATA(10) = 'U') else SDM1DATA(10); -- rv 0
  SDM1DATA_in(11) <= '0' when (SDM1DATA(11) = 'U') else SDM1DATA(11); -- rv 0
  SDM1DATA_in(12) <= '0' when (SDM1DATA(12) = 'U') else SDM1DATA(12); -- rv 0
  SDM1DATA_in(13) <= '0' when (SDM1DATA(13) = 'U') else SDM1DATA(13); -- rv 0
  SDM1DATA_in(14) <= '0' when (SDM1DATA(14) = 'U') else SDM1DATA(14); -- rv 0
  SDM1DATA_in(15) <= '0' when (SDM1DATA(15) = 'U') else SDM1DATA(15); -- rv 0
  SDM1DATA_in(16) <= '0' when (SDM1DATA(16) = 'U') else SDM1DATA(16); -- rv 0
  SDM1DATA_in(17) <= '0' when (SDM1DATA(17) = 'U') else SDM1DATA(17); -- rv 0
  SDM1DATA_in(18) <= '0' when (SDM1DATA(18) = 'U') else SDM1DATA(18); -- rv 0
  SDM1DATA_in(19) <= '0' when (SDM1DATA(19) = 'U') else SDM1DATA(19); -- rv 0
  SDM1DATA_in(2) <= '0' when (SDM1DATA(2) = 'U') else SDM1DATA(2); -- rv 0
  SDM1DATA_in(20) <= '0' when (SDM1DATA(20) = 'U') else SDM1DATA(20); -- rv 0
  SDM1DATA_in(21) <= '0' when (SDM1DATA(21) = 'U') else SDM1DATA(21); -- rv 0
  SDM1DATA_in(22) <= '0' when (SDM1DATA(22) = 'U') else SDM1DATA(22); -- rv 0
  SDM1DATA_in(23) <= '0' when (SDM1DATA(23) = 'U') else SDM1DATA(23); -- rv 0
  SDM1DATA_in(24) <= '0' when (SDM1DATA(24) = 'U') else SDM1DATA(24); -- rv 0
  SDM1DATA_in(3) <= '0' when (SDM1DATA(3) = 'U') else SDM1DATA(3); -- rv 0
  SDM1DATA_in(4) <= '0' when (SDM1DATA(4) = 'U') else SDM1DATA(4); -- rv 0
  SDM1DATA_in(5) <= '0' when (SDM1DATA(5) = 'U') else SDM1DATA(5); -- rv 0
  SDM1DATA_in(6) <= '0' when (SDM1DATA(6) = 'U') else SDM1DATA(6); -- rv 0
  SDM1DATA_in(7) <= '0' when (SDM1DATA(7) = 'U') else SDM1DATA(7); -- rv 0
  SDM1DATA_in(8) <= '0' when (SDM1DATA(8) = 'U') else SDM1DATA(8); -- rv 0
  SDM1DATA_in(9) <= '0' when (SDM1DATA(9) = 'U') else SDM1DATA(9); -- rv 0
  SDM1RESET_in <= '1' when (SDM1RESET = 'U') else SDM1RESET; -- rv 1
  SDM1TOGGLE_in <= '0' when (SDM1TOGGLE = 'U') else SDM1TOGGLE; -- rv 0
  SDM1WIDTH_in(0) <= '0' when (SDM1WIDTH(0) = 'U') else SDM1WIDTH(0); -- rv 0
  SDM1WIDTH_in(1) <= '0' when (SDM1WIDTH(1) = 'U') else SDM1WIDTH(1); -- rv 0
  TCONGPI_in(0) <= '0' when (TCONGPI(0) = 'U') else TCONGPI(0); -- rv 0
  TCONGPI_in(1) <= '0' when (TCONGPI(1) = 'U') else TCONGPI(1); -- rv 0
  TCONGPI_in(2) <= '0' when (TCONGPI(2) = 'U') else TCONGPI(2); -- rv 0
  TCONGPI_in(3) <= '0' when (TCONGPI(3) = 'U') else TCONGPI(3); -- rv 0
  TCONGPI_in(4) <= '0' when (TCONGPI(4) = 'U') else TCONGPI(4); -- rv 0
  TCONGPI_in(5) <= '0' when (TCONGPI(5) = 'U') else TCONGPI(5); -- rv 0
  TCONGPI_in(6) <= '0' when (TCONGPI(6) = 'U') else TCONGPI(6); -- rv 0
  TCONGPI_in(7) <= '0' when (TCONGPI(7) = 'U') else TCONGPI(7); -- rv 0
  TCONGPI_in(8) <= '0' when (TCONGPI(8) = 'U') else TCONGPI(8); -- rv 0
  TCONGPI_in(9) <= '0' when (TCONGPI(9) = 'U') else TCONGPI(9); -- rv 0
  TCONPOWERUP_in <= '0' when (TCONPOWERUP = 'U') else TCONPOWERUP; -- rv 0
  TCONRESET_in(0) <= '0' when (TCONRESET(0) = 'U') else TCONRESET(0); -- rv 0
  TCONRESET_in(1) <= '0' when (TCONRESET(1) = 'U') else TCONRESET(1); -- rv 0
  TCONRSVDIN1_in(0) <= '0' when (TCONRSVDIN1(0) = 'U') else TCONRSVDIN1(0); -- rv 0
  TCONRSVDIN1_in(1) <= '0' when (TCONRSVDIN1(1) = 'U') else TCONRSVDIN1(1); -- rv 0
  

  PMASCANCLK_in <= "1111111111"; -- tie off

  CSSDSTOPCLK0_in <= '1'; -- tie off
  CSSDSTOPCLK1_in <= '1'; -- tie off
  PMASCANENB_in <= '1'; -- tie off
  PMASCANIN_in <= "1111111111"; -- tie off
  QDPMASCANMODEB_in <= '1'; -- tie off
  QDPMASCANRSTEN_in <= '1'; -- tie off
  RXRECCLK_in <= "1111"; -- tie off
  TCONMBISTMODE_in <= '1'; -- tie off
  TCONRSVDIN0_in <= "11111"; -- tie off
  TCONSPD_in <= "11"; -- tie off
  TCONTCK_in <= '1'; -- tie off
  TCONTDI_in <= '1'; -- tie off
  TCONTMS_in <= '1'; -- tie off
  TCONTRST_in <= '1'; -- tie off
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- QPLL0CLKOUT_RATE check
      if((xil_attr_test) or
         ((QPLL0CLKOUT_RATE /= "FULL") and 
          (QPLL0CLKOUT_RATE /= "HALF"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-158] QPLL0CLKOUT_RATE attribute is set to """));
        Write ( Message, string'(QPLL0CLKOUT_RATE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FULL"" or "));
        Write ( Message, string'("""HALF"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- QPLL0_FBDIV check
        if((xil_attr_test) or
           ((QPLL0_FBDIV < 16) or (QPLL0_FBDIV > 160))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-169] QPLL0_FBDIV attribute is set to "));
          Write ( Message, QPLL0_FBDIV);
          Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- QPLL0_FBDIV_G3 check
        if((xil_attr_test) or
           ((QPLL0_FBDIV_G3 < 16) or (QPLL0_FBDIV_G3 > 160))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-170] QPLL0_FBDIV_G3 attribute is set to "));
          Write ( Message, QPLL0_FBDIV_G3);
          Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- QPLL0_REFCLK_DIV check
      if((xil_attr_test) or
         ((QPLL0_REFCLK_DIV /= 1) and 
          (QPLL0_REFCLK_DIV /= 2) and 
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
        Write ( Message, string'("-179] QPLL0_REFCLK_DIV attribute is set to "));
        Write ( Message, QPLL0_REFCLK_DIV);
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
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- QPLL1CLKOUT_RATE check
      if((xil_attr_test) or
         ((QPLL1CLKOUT_RATE /= "FULL") and 
          (QPLL1CLKOUT_RATE /= "HALF"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-183] QPLL1CLKOUT_RATE attribute is set to """));
        Write ( Message, string'(QPLL1CLKOUT_RATE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FULL"" or "));
        Write ( Message, string'("""HALF"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- QPLL1_FBDIV check
        if((xil_attr_test) or
           ((QPLL1_FBDIV < 16) or (QPLL1_FBDIV > 160))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-194] QPLL1_FBDIV attribute is set to "));
          Write ( Message, QPLL1_FBDIV);
          Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- QPLL1_FBDIV_G3 check
        if((xil_attr_test) or
           ((QPLL1_FBDIV_G3 < 16) or (QPLL1_FBDIV_G3 > 160))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-195] QPLL1_FBDIV_G3 attribute is set to "));
          Write ( Message, QPLL1_FBDIV_G3);
          Write ( Message, string'(". Legal values for this attribute are 16 to 160. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- QPLL1_REFCLK_DIV check
      if((xil_attr_test) or
         ((QPLL1_REFCLK_DIV /= 1) and 
          (QPLL1_REFCLK_DIV /= 2) and 
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
        Write ( Message, string'("-204] QPLL1_REFCLK_DIV attribute is set to "));
        Write ( Message, QPLL1_REFCLK_DIV);
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
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
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
        Write ( Message, string'("-228] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1p"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
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
        Write ( Message, string'("-229] SIM_MODE attribute is set to """));
        Write ( Message, string'(SIM_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FAST"" or "));
        Write ( Message, string'("""LEGACY"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
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
        Write ( Message, string'("-230] SIM_RESET_SPEEDUP attribute is set to """));
        Write ( Message, string'(SIM_RESET_SPEEDUP));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-112] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(GTHE4_COMMON_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    SIP_GTHE4_COMMON_INST : SIP_GTHE4_COMMON
      port map (
        AEN_BGBS0            => AEN_BGBS0_BIN,
        AEN_BGBS1            => AEN_BGBS1_BIN,
        AEN_MASTER0          => AEN_MASTER0_BIN,
        AEN_MASTER1          => AEN_MASTER1_BIN,
        AEN_PD0              => AEN_PD0_BIN,
        AEN_PD1              => AEN_PD1_BIN,
        AEN_QPLL0            => AEN_QPLL0_BIN,
        AEN_QPLL0_FBDIV      => AEN_QPLL0_FBDIV_BIN,
        AEN_QPLL1            => AEN_QPLL1_BIN,
        AEN_QPLL1_FBDIV      => AEN_QPLL1_FBDIV_BIN,
        AEN_REFCLK0          => AEN_REFCLK0_BIN,
        AEN_REFCLK1          => AEN_REFCLK1_BIN,
        AEN_RESET0           => AEN_RESET0_BIN,
        AEN_RESET1           => AEN_RESET1_BIN,
        AEN_SDM0DATA         => AEN_SDM0DATA_BIN,
        AEN_SDM0RESET        => AEN_SDM0RESET_BIN,
        AEN_SDM0TOGGLE       => AEN_SDM0TOGGLE_BIN,
        AEN_SDM0WIDTH        => AEN_SDM0WIDTH_BIN,
        AEN_SDM1DATA         => AEN_SDM1DATA_BIN,
        AEN_SDM1RESET        => AEN_SDM1RESET_BIN,
        AEN_SDM1TOGGLE       => AEN_SDM1TOGGLE_BIN,
        AEN_SDM1WIDTH        => AEN_SDM1WIDTH_BIN,
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
        A_SDM0DATA_HIGH      => A_SDM0DATA_HIGH_BIN,
        A_SDM0DATA_LOW       => A_SDM0DATA_LOW_BIN,
        A_SDM0RESET          => A_SDM0RESET_BIN,
        A_SDM0TOGGLE         => A_SDM0TOGGLE_BIN,
        A_SDM1DATA_HIGH      => A_SDM1DATA_HIGH_BIN,
        A_SDM1DATA_LOW       => A_SDM1DATA_LOW_BIN,
        A_SDM1RESET          => A_SDM1RESET_BIN,
        A_SDM1TOGGLE         => A_SDM1TOGGLE_BIN,
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
        QPLL0CLKOUT_RATE     => QPLL0CLKOUT_RATE_BIN,
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
        QPLL0_PCI_EN         => QPLL0_PCI_EN_BIN,
        QPLL0_RATE_SW_USE_DRP => QPLL0_RATE_SW_USE_DRP_BIN,
        QPLL0_REFCLK_DIV     => QPLL0_REFCLK_DIV_BIN,
        QPLL0_SDM_CFG0       => QPLL0_SDM_CFG0_BIN,
        QPLL0_SDM_CFG1       => QPLL0_SDM_CFG1_BIN,
        QPLL0_SDM_CFG2       => QPLL0_SDM_CFG2_BIN,
        QPLL1CLKOUT_RATE     => QPLL1CLKOUT_RATE_BIN,
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
        QPLL1_PCI_EN         => QPLL1_PCI_EN_BIN,
        QPLL1_RATE_SW_USE_DRP => QPLL1_RATE_SW_USE_DRP_BIN,
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
        SARC_ENB             => SARC_ENB_BIN,
        SARC_SEL             => SARC_SEL_BIN,
        SDM0INITSEED0_0      => SDM0INITSEED0_0_BIN,
        SDM0INITSEED0_1      => SDM0INITSEED0_1_BIN,
        SDM1INITSEED0_0      => SDM1INITSEED0_0_BIN,
        SDM1INITSEED0_1      => SDM1INITSEED0_1_BIN,
        SIM_DEVICE           => SIM_DEVICE_BIN,
        SIM_MODE             => SIM_MODE_BIN,
        SIM_RESET_SPEEDUP    => SIM_RESET_SPEEDUP_BIN,
        VCCAUX_SENSE_SEL     => VCCAUX_SENSE_SEL_BIN,
        CSSDSTOPCLKDONE0     => CSSDSTOPCLKDONE0_out,
        CSSDSTOPCLKDONE1     => CSSDSTOPCLKDONE1_out,
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
        RXRECCLK0SEL         => RXRECCLK0SEL_out,
        RXRECCLK1SEL         => RXRECCLK1SEL_out,
        SARCCLK              => SARCCLK_out,
        SDM0FINALOUT         => SDM0FINALOUT_out,
        SDM0TESTDATA         => SDM0TESTDATA_out,
        SDM1FINALOUT         => SDM1FINALOUT_out,
        SDM1TESTDATA         => SDM1TESTDATA_out,
        TCONGPO              => TCONGPO_out,
        TCONRSVDOUT0         => TCONRSVDOUT0_out,
        TCONTDO              => TCONTDO_out,
        BGBYPASSB            => BGBYPASSB_in,
        BGMONITORENB         => BGMONITORENB_in,
        BGPDB                => BGPDB_in,
        BGRCALOVRD           => BGRCALOVRD_in,
        BGRCALOVRDENB        => BGRCALOVRDENB_in,
        CSSDSTOPCLK0         => CSSDSTOPCLK0_in,
        CSSDSTOPCLK1         => CSSDSTOPCLK1_in,
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
        PCIERATEQPLL0        => PCIERATEQPLL0_in,
        PCIERATEQPLL1        => PCIERATEQPLL1_in,
        PMARSVD0             => PMARSVD0_in,
        PMARSVD1             => PMARSVD1_in,
        PMASCANCLK           => PMASCANCLK_in,
        PMASCANENB           => PMASCANENB_in,
        PMASCANIN            => PMASCANIN_in,
        QDPMASCANMODEB       => QDPMASCANMODEB_in,
        QDPMASCANRSTEN       => QDPMASCANRSTEN_in,
        QPLL0CLKRSVD0        => QPLL0CLKRSVD0_in,
        QPLL0CLKRSVD1        => QPLL0CLKRSVD1_in,
        QPLL0FBDIV           => QPLL0FBDIV_in,
        QPLL0LOCKDETCLK      => QPLL0LOCKDETCLK_in,
        QPLL0LOCKEN          => QPLL0LOCKEN_in,
        QPLL0PD              => QPLL0PD_in,
        QPLL0REFCLKSEL       => QPLL0REFCLKSEL_in,
        QPLL0RESET           => QPLL0RESET_in,
        QPLL1CLKRSVD0        => QPLL1CLKRSVD0_in,
        QPLL1CLKRSVD1        => QPLL1CLKRSVD1_in,
        QPLL1FBDIV           => QPLL1FBDIV_in,
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
        SDM0DATA             => SDM0DATA_in,
        SDM0RESET            => SDM0RESET_in,
        SDM0TOGGLE           => SDM0TOGGLE_in,
        SDM0WIDTH            => SDM0WIDTH_in,
        SDM1DATA             => SDM1DATA_in,
        SDM1RESET            => SDM1RESET_in,
        SDM1TOGGLE           => SDM1TOGGLE_in,
        SDM1WIDTH            => SDM1WIDTH_in,
        TCONGPI              => TCONGPI_in,
        TCONMBISTMODE        => TCONMBISTMODE_in,
        TCONPOWERUP          => TCONPOWERUP_in,
        TCONRESET            => TCONRESET_in,
        TCONRSVDIN0          => TCONRSVDIN0_in,
        TCONRSVDIN1          => TCONRSVDIN1_in,
        TCONSPD              => TCONSPD_in,
        TCONTCK              => TCONTCK_in,
        TCONTDI              => TCONTDI_in,
        TCONTMS              => TCONTMS_in,
        TCONTRST             => TCONTRST_in,
        GSR                  => glblGSR        
      );
  end GTHE4_COMMON_V;
