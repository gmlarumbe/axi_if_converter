-------------------------------------------------------
--  Copyright (c) 2011 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : Xilinx Simulation Library Component
--  /   /                      : Gigabit Transciever
-- /___/   /\      Filename    : GTXE1.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
-- Revision:
--    08/16/11 - Initial version.
-- End Revision

----- CELL GTXE1 -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all; 
use unisim.vpkg.all;

  entity GTXE1 is
    generic (
      AC_CAP_DIS : boolean := TRUE;
      ALIGN_COMMA_WORD : integer := 1;
      BGTEST_CFG : bit_vector := "00";
      BIAS_CFG : bit_vector := X"00000";
      CDR_PH_ADJ_TIME : bit_vector := "10100";
      CHAN_BOND_1_MAX_SKEW : integer := 7;
      CHAN_BOND_2_MAX_SKEW : integer := 1;
      CHAN_BOND_KEEP_ALIGN : boolean := FALSE;
      CHAN_BOND_SEQ_1_1 : bit_vector := "0101111100";
      CHAN_BOND_SEQ_1_2 : bit_vector := "0001001010";
      CHAN_BOND_SEQ_1_3 : bit_vector := "0001001010";
      CHAN_BOND_SEQ_1_4 : bit_vector := "0110111100";
      CHAN_BOND_SEQ_1_ENABLE : bit_vector := "1111";
      CHAN_BOND_SEQ_2_1 : bit_vector := "0100111100";
      CHAN_BOND_SEQ_2_2 : bit_vector := "0100111100";
      CHAN_BOND_SEQ_2_3 : bit_vector := "0110111100";
      CHAN_BOND_SEQ_2_4 : bit_vector := "0100111100";
      CHAN_BOND_SEQ_2_CFG : bit_vector := "00000";
      CHAN_BOND_SEQ_2_ENABLE : bit_vector := "1111";
      CHAN_BOND_SEQ_2_USE : boolean := FALSE;
      CHAN_BOND_SEQ_LEN : integer := 1;
      CLK_CORRECT_USE : boolean := TRUE;
      CLK_COR_ADJ_LEN : integer := 1;
      CLK_COR_DET_LEN : integer := 1;
      CLK_COR_INSERT_IDLE_FLAG : boolean := FALSE;
      CLK_COR_KEEP_IDLE : boolean := FALSE;
      CLK_COR_MAX_LAT : integer := 20;
      CLK_COR_MIN_LAT : integer := 18;
      CLK_COR_PRECEDENCE : boolean := TRUE;
      CLK_COR_REPEAT_WAIT : integer := 0;
      CLK_COR_SEQ_1_1 : bit_vector := "0100011100";
      CLK_COR_SEQ_1_2 : bit_vector := "0000000000";
      CLK_COR_SEQ_1_3 : bit_vector := "0000000000";
      CLK_COR_SEQ_1_4 : bit_vector := "0000000000";
      CLK_COR_SEQ_1_ENABLE : bit_vector := "1111";
      CLK_COR_SEQ_2_1 : bit_vector := "0000000000";
      CLK_COR_SEQ_2_2 : bit_vector := "0000000000";
      CLK_COR_SEQ_2_3 : bit_vector := "0000000000";
      CLK_COR_SEQ_2_4 : bit_vector := "0000000000";
      CLK_COR_SEQ_2_ENABLE : bit_vector := "1111";
      CLK_COR_SEQ_2_USE : boolean := FALSE;
      CM_TRIM : bit_vector := "01";
      COMMA_10B_ENABLE : bit_vector := "1111111111";
      COMMA_DOUBLE : boolean := FALSE;
      COM_BURST_VAL : bit_vector := "1111";
      DEC_MCOMMA_DETECT : boolean := TRUE;
      DEC_PCOMMA_DETECT : boolean := TRUE;
      DEC_VALID_COMMA_ONLY : boolean := TRUE;
      DFE_CAL_TIME : bit_vector := "01100";
      DFE_CFG : bit_vector := "00011011";
      GEARBOX_ENDEC : bit_vector := "000";
      GEN_RXUSRCLK : boolean := TRUE;
      GEN_TXUSRCLK : boolean := TRUE;
      GTX_CFG_PWRUP : boolean := TRUE;
      MCOMMA_10B_VALUE : bit_vector := "1010000011";
      MCOMMA_DETECT : boolean := TRUE;
      OOBDETECT_THRESHOLD : bit_vector := "011";
      PCI_EXPRESS_MODE : boolean := FALSE;
      PCOMMA_10B_VALUE : bit_vector := "0101111100";
      PCOMMA_DETECT : boolean := TRUE;
      PMA_CAS_CLK_EN : boolean := FALSE;
      PMA_CDR_SCAN : bit_vector := X"640404C";
      PMA_CFG : bit_vector :=  X"0040000040000000003";
      PMA_RXSYNC_CFG : bit_vector := X"00";
      PMA_RX_CFG : bit_vector := X"05CE048";
      PMA_TX_CFG : bit_vector := X"00082";
      POWER_SAVE : bit_vector := "0000110100";
      RCV_TERM_GND : boolean := FALSE;
      RCV_TERM_VTTRX : boolean := TRUE;
      RXGEARBOX_USE : boolean := FALSE;
      RXPLL_COM_CFG : bit_vector := X"21680A";
      RXPLL_CP_CFG : bit_vector := X"00";
      RXPLL_DIVSEL45_FB : integer := 5;
      RXPLL_DIVSEL_FB : integer := 2;
      RXPLL_DIVSEL_OUT : integer := 1;
      RXPLL_DIVSEL_REF : integer := 1;
      RXPLL_LKDET_CFG : bit_vector := "111";
      RXPRBSERR_LOOPBACK : bit := '0';
      RXRECCLK_CTRL : string := "RXRECCLKPCS";
      RXRECCLK_DLY : bit_vector := "0000000000";
      RXUSRCLK_DLY : bit_vector := X"0000";
      RX_BUFFER_USE : boolean := TRUE;
      RX_CLK25_DIVIDER : integer := 6;
      RX_DATA_WIDTH : integer := 20;
      RX_DECODE_SEQ_MATCH : boolean := TRUE;
      RX_DLYALIGN_CTRINC : bit_vector := "0100";
      RX_DLYALIGN_EDGESET : bit_vector := "00110";
      RX_DLYALIGN_LPFINC : bit_vector := "0111";
      RX_DLYALIGN_MONSEL : bit_vector := "000";
      RX_DLYALIGN_OVRDSETTING : bit_vector := "00000000";
      RX_EN_IDLE_HOLD_CDR : boolean := FALSE;
      RX_EN_IDLE_HOLD_DFE : boolean := TRUE;
      RX_EN_IDLE_RESET_BUF : boolean := TRUE;
      RX_EN_IDLE_RESET_FR : boolean := TRUE;
      RX_EN_IDLE_RESET_PH : boolean := TRUE;
      RX_EN_MODE_RESET_BUF : boolean := TRUE;
      RX_EN_RATE_RESET_BUF : boolean := TRUE;
      RX_EN_REALIGN_RESET_BUF : boolean := FALSE;
      RX_EN_REALIGN_RESET_BUF2 : boolean := FALSE;
      RX_EYE_OFFSET : bit_vector := X"4C";
      RX_EYE_SCANMODE : bit_vector := "00";
      RX_FIFO_ADDR_MODE : string := "FULL";
      RX_IDLE_HI_CNT : bit_vector := "1000";
      RX_IDLE_LO_CNT : bit_vector := "0000";
      RX_LOSS_OF_SYNC_FSM : boolean := FALSE;
      RX_LOS_INVALID_INCR : integer := 1;
      RX_LOS_THRESHOLD : integer := 4;
      RX_OVERSAMPLE_MODE : boolean := FALSE;
      RX_SLIDE_AUTO_WAIT : integer := 5;
      RX_SLIDE_MODE : string := "OFF";
      RX_XCLK_SEL : string := "RXREC";
      SAS_MAX_COMSAS : integer := 52;
      SAS_MIN_COMSAS : integer := 40;
      SATA_BURST_VAL : bit_vector := "100";
      SATA_IDLE_VAL : bit_vector := "100";
      SATA_MAX_BURST : integer := 7;
      SATA_MAX_INIT : integer := 22;
      SATA_MAX_WAKE : integer := 7;
      SATA_MIN_BURST : integer := 4;
      SATA_MIN_INIT : integer := 12;
      SATA_MIN_WAKE : integer := 4;
      SHOW_REALIGN_COMMA : boolean := TRUE;
      SIM_GTXRESET_SPEEDUP : integer := 1;
      SIM_RECEIVER_DETECT_PASS : boolean := TRUE;
      SIM_RXREFCLK_SOURCE : bit_vector := "000";
      SIM_TXREFCLK_SOURCE : bit_vector := "000";
      SIM_TX_ELEC_IDLE_LEVEL : string := "X";
      SIM_VERSION : string := "2.0";
      TERMINATION_CTRL : bit_vector := "10100";
      TERMINATION_OVRD : boolean := FALSE;
      TRANS_TIME_FROM_P2 : bit_vector := X"03C";
      TRANS_TIME_NON_P2 : bit_vector := X"19";
      TRANS_TIME_RATE : bit_vector := X"0E";
      TRANS_TIME_TO_P2 : bit_vector := X"064";
      TST_ATTR : bit_vector := X"00000000";
      TXDRIVE_LOOPBACK_HIZ : boolean := FALSE;
      TXDRIVE_LOOPBACK_PD : boolean := FALSE;
      TXGEARBOX_USE : boolean := FALSE;
      TXOUTCLK_CTRL : string := "TXOUTCLKPCS";
      TXOUTCLK_DLY : bit_vector := "0000000000";
      TXPLL_COM_CFG : bit_vector := X"21680A";
      TXPLL_CP_CFG : bit_vector := X"00";
      TXPLL_DIVSEL45_FB : integer := 5;
      TXPLL_DIVSEL_FB : integer := 2;
      TXPLL_DIVSEL_OUT : integer := 1;
      TXPLL_DIVSEL_REF : integer := 1;
      TXPLL_LKDET_CFG : bit_vector := "111";
      TXPLL_SATA : bit_vector := "00";
      TX_BUFFER_USE : boolean := TRUE;
      TX_BYTECLK_CFG : bit_vector := X"00";
      TX_CLK25_DIVIDER : integer := 6;
      TX_CLK_SOURCE : string := "RXPLL";
      TX_DATA_WIDTH : integer := 20;
      TX_DEEMPH_0 : bit_vector := "11010";
      TX_DEEMPH_1 : bit_vector := "10000";
      TX_DETECT_RX_CFG : bit_vector := X"1832";
      TX_DLYALIGN_CTRINC : bit_vector := "0100";
      TX_DLYALIGN_LPFINC : bit_vector := "0110";
      TX_DLYALIGN_MONSEL : bit_vector := "000";
      TX_DLYALIGN_OVRDSETTING : bit_vector := "10000000";
      TX_DRIVE_MODE : string := "DIRECT";
      TX_EN_RATE_RESET_BUF : boolean := TRUE;
      TX_IDLE_ASSERT_DELAY : bit_vector := "100";
      TX_IDLE_DEASSERT_DELAY : bit_vector := "010";
      TX_MARGIN_FULL_0 : bit_vector := "1001110";
      TX_MARGIN_FULL_1 : bit_vector := "1001001";
      TX_MARGIN_FULL_2 : bit_vector := "1000101";
      TX_MARGIN_FULL_3 : bit_vector := "1000010";
      TX_MARGIN_FULL_4 : bit_vector := "1000000";
      TX_MARGIN_LOW_0 : bit_vector := "1000110";
      TX_MARGIN_LOW_1 : bit_vector := "1000100";
      TX_MARGIN_LOW_2 : bit_vector := "1000010";
      TX_MARGIN_LOW_3 : bit_vector := "1000000";
      TX_MARGIN_LOW_4 : bit_vector := "1000000";
      TX_OVERSAMPLE_MODE : boolean := FALSE;
      TX_PMADATA_OPT : bit := '0';
      TX_TDCC_CFG : bit_vector := "11";
      TX_USRCLK_CFG : bit_vector := X"00";
      TX_XCLK_SEL : string := "TXUSR"
    );

    port (
      COMFINISH            : out std_ulogic;
      COMINITDET           : out std_ulogic;
      COMSASDET            : out std_ulogic;
      COMWAKEDET           : out std_ulogic;
      DFECLKDLYADJMON      : out std_logic_vector(5 downto 0);
      DFEEYEDACMON         : out std_logic_vector(4 downto 0);
      DFESENSCAL           : out std_logic_vector(2 downto 0);
      DFETAP1MONITOR       : out std_logic_vector(4 downto 0);
      DFETAP2MONITOR       : out std_logic_vector(4 downto 0);
      DFETAP3MONITOR       : out std_logic_vector(3 downto 0);
      DFETAP4MONITOR       : out std_logic_vector(3 downto 0);
      DRDY                 : out std_ulogic;
      DRPDO                : out std_logic_vector(15 downto 0);
      MGTREFCLKFAB         : out std_logic_vector(1 downto 0);
      PHYSTATUS            : out std_ulogic;
      RXBUFSTATUS          : out std_logic_vector(2 downto 0);
      RXBYTEISALIGNED      : out std_ulogic;
      RXBYTEREALIGN        : out std_ulogic;
      RXCHANBONDSEQ        : out std_ulogic;
      RXCHANISALIGNED      : out std_ulogic;
      RXCHANREALIGN        : out std_ulogic;
      RXCHARISCOMMA        : out std_logic_vector(3 downto 0);
      RXCHARISK            : out std_logic_vector(3 downto 0);
      RXCHBONDO            : out std_logic_vector(3 downto 0);
      RXCLKCORCNT          : out std_logic_vector(2 downto 0);
      RXCOMMADET           : out std_ulogic;
      RXDATA               : out std_logic_vector(31 downto 0);
      RXDATAVALID          : out std_ulogic;
      RXDISPERR            : out std_logic_vector(3 downto 0);
      RXDLYALIGNMONITOR    : out std_logic_vector(7 downto 0);
      RXELECIDLE           : out std_ulogic;
      RXHEADER             : out std_logic_vector(2 downto 0);
      RXHEADERVALID        : out std_ulogic;
      RXLOSSOFSYNC         : out std_logic_vector(1 downto 0);
      RXNOTINTABLE         : out std_logic_vector(3 downto 0);
      RXOVERSAMPLEERR      : out std_ulogic;
      RXPLLLKDET           : out std_ulogic;
      RXPRBSERR            : out std_ulogic;
      RXRATEDONE           : out std_ulogic;
      RXRECCLK             : out std_ulogic;
      RXRECCLKPCS          : out std_ulogic;
      RXRESETDONE          : out std_ulogic;
      RXRUNDISP            : out std_logic_vector(3 downto 0);
      RXSTARTOFSEQ         : out std_ulogic;
      RXSTATUS             : out std_logic_vector(2 downto 0);
      RXVALID              : out std_ulogic;
      TSTOUT               : out std_logic_vector(9 downto 0);
      TXBUFSTATUS          : out std_logic_vector(1 downto 0);
      TXDLYALIGNMONITOR    : out std_logic_vector(7 downto 0);
      TXGEARBOXREADY       : out std_ulogic;
      TXKERR               : out std_logic_vector(3 downto 0);
      TXN                  : out std_ulogic;
      TXOUTCLK             : out std_ulogic;
      TXOUTCLKPCS          : out std_ulogic;
      TXP                  : out std_ulogic;
      TXPLLLKDET           : out std_ulogic;
      TXRATEDONE           : out std_ulogic;
      TXRESETDONE          : out std_ulogic;
      TXRUNDISP            : out std_logic_vector(3 downto 0);

      
      DADDR                : in std_logic_vector(7 downto 0);
      DCLK                 : in std_ulogic;
      DEN                  : in std_ulogic;
      DFECLKDLYADJ         : in std_logic_vector(5 downto 0);
      DFEDLYOVRD           : in std_ulogic;
      DFETAP1              : in std_logic_vector(4 downto 0);
      DFETAP2              : in std_logic_vector(4 downto 0);
      DFETAP3              : in std_logic_vector(3 downto 0);
      DFETAP4              : in std_logic_vector(3 downto 0);
      DFETAPOVRD           : in std_ulogic;
      DI                   : in std_logic_vector(15 downto 0);
      DWE                  : in std_ulogic;
      GATERXELECIDLE       : in std_ulogic;
      GREFCLKRX            : in std_ulogic;
      GREFCLKTX            : in std_ulogic;
      GTXRXRESET           : in std_ulogic;
      GTXTEST              : in std_logic_vector(12 downto 0);
      GTXTXRESET           : in std_ulogic;
      IGNORESIGDET         : in std_ulogic;
      LOOPBACK             : in std_logic_vector(2 downto 0);
      MGTREFCLKRX          : in std_logic_vector(1 downto 0);
      MGTREFCLKTX          : in std_logic_vector(1 downto 0);
      NORTHREFCLKRX        : in std_logic_vector(1 downto 0);
      NORTHREFCLKTX        : in std_logic_vector(1 downto 0);
      PERFCLKRX            : in std_ulogic;
      PERFCLKTX            : in std_ulogic;
      PLLRXRESET           : in std_ulogic;
      PLLTXRESET           : in std_ulogic;
      PRBSCNTRESET         : in std_ulogic;
      RXBUFRESET           : in std_ulogic;
      RXCDRRESET           : in std_ulogic;
      RXCHBONDI            : in std_logic_vector(3 downto 0);
      RXCHBONDLEVEL        : in std_logic_vector(2 downto 0);
      RXCHBONDMASTER       : in std_ulogic;
      RXCHBONDSLAVE        : in std_ulogic;
      RXCOMMADETUSE        : in std_ulogic;
      RXDEC8B10BUSE        : in std_ulogic;
      RXDLYALIGNDISABLE    : in std_ulogic;
      RXDLYALIGNMONENB     : in std_ulogic := 'H';
      RXDLYALIGNOVERRIDE   : in std_ulogic;
      RXDLYALIGNRESET      : in std_ulogic;
      RXDLYALIGNSWPPRECURB : in std_ulogic;
      RXDLYALIGNUPDSW      : in std_ulogic;
      RXENCHANSYNC         : in std_ulogic;
      RXENMCOMMAALIGN      : in std_ulogic;
      RXENPCOMMAALIGN      : in std_ulogic;
      RXENPMAPHASEALIGN    : in std_ulogic;
      RXENPRBSTST          : in std_logic_vector(2 downto 0);
      RXENSAMPLEALIGN      : in std_ulogic;
      RXEQMIX              : in std_logic_vector(9 downto 0);
      RXGEARBOXSLIP        : in std_ulogic;
      RXN                  : in std_ulogic;
      RXP                  : in std_ulogic;
      RXPLLLKDETEN         : in std_ulogic;
      RXPLLPOWERDOWN       : in std_ulogic;
      RXPLLREFSELDY        : in std_logic_vector(2 downto 0);
      RXPMASETPHASE        : in std_ulogic;
      RXPOLARITY           : in std_ulogic;
      RXPOWERDOWN          : in std_logic_vector(1 downto 0);
      RXRATE               : in std_logic_vector(1 downto 0);
      RXRESET              : in std_ulogic;
      RXSLIDE              : in std_ulogic;
      RXUSRCLK             : in std_ulogic;
      RXUSRCLK2            : in std_ulogic;
      SOUTHREFCLKRX        : in std_logic_vector(1 downto 0);
      SOUTHREFCLKTX        : in std_logic_vector(1 downto 0);
      TSTCLK0              : in std_ulogic;
      TSTCLK1              : in std_ulogic;
      TSTIN                : in std_logic_vector(19 downto 0);
      TXBUFDIFFCTRL        : in std_logic_vector(2 downto 0);
      TXBYPASS8B10B        : in std_logic_vector(3 downto 0);
      TXCHARDISPMODE       : in std_logic_vector(3 downto 0);
      TXCHARDISPVAL        : in std_logic_vector(3 downto 0);
      TXCHARISK            : in std_logic_vector(3 downto 0);
      TXCOMINIT            : in std_ulogic;
      TXCOMSAS             : in std_ulogic;
      TXCOMWAKE            : in std_ulogic;
      TXDATA               : in std_logic_vector(31 downto 0);
      TXDEEMPH             : in std_ulogic;
      TXDETECTRX           : in std_ulogic;
      TXDIFFCTRL           : in std_logic_vector(3 downto 0);
      TXDLYALIGNDISABLE    : in std_ulogic;
      TXDLYALIGNMONENB     : in std_ulogic := 'H';
      TXDLYALIGNOVERRIDE   : in std_ulogic;
      TXDLYALIGNRESET      : in std_ulogic;
      TXDLYALIGNUPDSW      : in std_ulogic;
      TXELECIDLE           : in std_ulogic;
      TXENC8B10BUSE        : in std_ulogic;
      TXENPMAPHASEALIGN    : in std_ulogic;
      TXENPRBSTST          : in std_logic_vector(2 downto 0);
      TXHEADER             : in std_logic_vector(2 downto 0);
      TXINHIBIT            : in std_ulogic;
      TXMARGIN             : in std_logic_vector(2 downto 0);
      TXPDOWNASYNCH        : in std_ulogic;
      TXPLLLKDETEN         : in std_ulogic;
      TXPLLPOWERDOWN       : in std_ulogic;
      TXPLLREFSELDY        : in std_logic_vector(2 downto 0);
      TXPMASETPHASE        : in std_ulogic;
      TXPOLARITY           : in std_ulogic;
      TXPOSTEMPHASIS       : in std_logic_vector(4 downto 0);
      TXPOWERDOWN          : in std_logic_vector(1 downto 0);
      TXPRBSFORCEERR       : in std_ulogic;
      TXPREEMPHASIS        : in std_logic_vector(3 downto 0);
      TXRATE               : in std_logic_vector(1 downto 0);
      TXRESET              : in std_ulogic;
      TXSEQUENCE           : in std_logic_vector(6 downto 0);
      TXSTARTSEQ           : in std_ulogic;
      TXSWING              : in std_ulogic;
      TXUSRCLK             : in std_ulogic;
      TXUSRCLK2            : in std_ulogic;
      USRCODEERR           : in std_ulogic      
    );
  end GTXE1;

  architecture GTXE1_V of GTXE1 is

  begin
      
--####################################################################
--#####                        Initialization                      ###
--####################################################################
      prcs_init:process
        begin

            assert false
                report "ERROR : The following component GTXE1 is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
                severity Failure;

              wait;

          end process prcs_init;
  
  end GTXE1_V;
