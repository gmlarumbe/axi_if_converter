-------------------------------------------------------
--  Copyright (c) 2011 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 11.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      : Tri-Mode Ethernet MAC
-- /___/   /\      Filename    : TEMAC_SINGLE.vhd
-- \   \  /  \     
--  \__ \/\__ \                   
--                                 
-- Revision:
--    08/16/11 - Initial version.
-- End Revision

----- CELL TEMAC_SINGLE -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all; 
use unisim.vpkg.all;

  entity TEMAC_SINGLE is
    generic (
      EMAC_1000BASEX_ENABLE : boolean := FALSE;
      EMAC_ADDRFILTER_ENABLE : boolean := FALSE;
      EMAC_BYTEPHY : boolean := FALSE;
      EMAC_CTRLLENCHECK_DISABLE : boolean := FALSE;
      EMAC_DCRBASEADDR : bit_vector := X"00";
      EMAC_GTLOOPBACK : boolean := FALSE;
      EMAC_HOST_ENABLE : boolean := FALSE;
      EMAC_LINKTIMERVAL : bit_vector := X"000";
      EMAC_LTCHECK_DISABLE : boolean := FALSE;
      EMAC_MDIO_ENABLE : boolean := FALSE;
      EMAC_MDIO_IGNORE_PHYADZERO : boolean := FALSE;
      EMAC_PAUSEADDR : bit_vector := X"000000000000";
      EMAC_PHYINITAUTONEG_ENABLE : boolean := FALSE;
      EMAC_PHYISOLATE : boolean := FALSE;
      EMAC_PHYLOOPBACKMSB : boolean := FALSE;
      EMAC_PHYPOWERDOWN : boolean := FALSE;
      EMAC_PHYRESET : boolean := FALSE;
      EMAC_RGMII_ENABLE : boolean := FALSE;
      EMAC_RX16BITCLIENT_ENABLE : boolean := FALSE;
      EMAC_RXFLOWCTRL_ENABLE : boolean := FALSE;
      EMAC_RXHALFDUPLEX : boolean := FALSE;
      EMAC_RXINBANDFCS_ENABLE : boolean := FALSE;
      EMAC_RXJUMBOFRAME_ENABLE : boolean := FALSE;
      EMAC_RXRESET : boolean := FALSE;
      EMAC_RXVLAN_ENABLE : boolean := FALSE;
      EMAC_RX_ENABLE : boolean := TRUE;
      EMAC_SGMII_ENABLE : boolean := FALSE;
      EMAC_SPEED_LSB : boolean := FALSE;
      EMAC_SPEED_MSB : boolean := FALSE;
      EMAC_TX16BITCLIENT_ENABLE : boolean := FALSE;
      EMAC_TXFLOWCTRL_ENABLE : boolean := FALSE;
      EMAC_TXHALFDUPLEX : boolean := FALSE;
      EMAC_TXIFGADJUST_ENABLE : boolean := FALSE;
      EMAC_TXINBANDFCS_ENABLE : boolean := FALSE;
      EMAC_TXJUMBOFRAME_ENABLE : boolean := FALSE;
      EMAC_TXRESET : boolean := FALSE;
      EMAC_TXVLAN_ENABLE : boolean := FALSE;
      EMAC_TX_ENABLE : boolean := TRUE;
      EMAC_UNICASTADDR : bit_vector := X"000000000000";
      EMAC_UNIDIRECTION_ENABLE : boolean := FALSE;
      EMAC_USECLKEN : boolean := FALSE;
      SIM_VERSION : string := "1.0"
    );

    port (
      DCRHOSTDONEIR        : out std_ulogic;
      EMACCLIENTANINTERRUPT : out std_ulogic;
      EMACCLIENTRXBADFRAME : out std_ulogic;
      EMACCLIENTRXCLIENTCLKOUT : out std_ulogic;
      EMACCLIENTRXD        : out std_logic_vector(15 downto 0);
      EMACCLIENTRXDVLD     : out std_ulogic;
      EMACCLIENTRXDVLDMSW  : out std_ulogic;
      EMACCLIENTRXFRAMEDROP : out std_ulogic;
      EMACCLIENTRXGOODFRAME : out std_ulogic;
      EMACCLIENTRXSTATS    : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSBYTEVLD : out std_ulogic;
      EMACCLIENTRXSTATSVLD : out std_ulogic;
      EMACCLIENTTXACK      : out std_ulogic;
      EMACCLIENTTXCLIENTCLKOUT : out std_ulogic;
      EMACCLIENTTXCOLLISION : out std_ulogic;
      EMACCLIENTTXRETRANSMIT : out std_ulogic;
      EMACCLIENTTXSTATS    : out std_ulogic;
      EMACCLIENTTXSTATSBYTEVLD : out std_ulogic;
      EMACCLIENTTXSTATSVLD : out std_ulogic;
      EMACDCRACK           : out std_ulogic;
      EMACDCRDBUS          : out std_logic_vector(0 to 31);
      EMACPHYENCOMMAALIGN  : out std_ulogic;
      EMACPHYLOOPBACKMSB   : out std_ulogic;
      EMACPHYMCLKOUT       : out std_ulogic;
      EMACPHYMDOUT         : out std_ulogic;
      EMACPHYMDTRI         : out std_ulogic;
      EMACPHYMGTRXRESET    : out std_ulogic;
      EMACPHYMGTTXRESET    : out std_ulogic;
      EMACPHYPOWERDOWN     : out std_ulogic;
      EMACPHYSYNCACQSTATUS : out std_ulogic;
      EMACPHYTXCHARDISPMODE : out std_ulogic;
      EMACPHYTXCHARDISPVAL : out std_ulogic;
      EMACPHYTXCHARISK     : out std_ulogic;
      EMACPHYTXCLK         : out std_ulogic;
      EMACPHYTXD           : out std_logic_vector(7 downto 0);
      EMACPHYTXEN          : out std_ulogic;
      EMACPHYTXER          : out std_ulogic;
      EMACPHYTXGMIIMIICLKOUT : out std_ulogic;
      EMACSPEEDIS10100     : out std_ulogic;
      HOSTMIIMRDY          : out std_ulogic;
      HOSTRDDATA           : out std_logic_vector(31 downto 0);
      CLIENTEMACDCMLOCKED  : in std_ulogic;
      CLIENTEMACPAUSEREQ   : in std_ulogic;
      CLIENTEMACPAUSEVAL   : in std_logic_vector(15 downto 0);
      CLIENTEMACRXCLIENTCLKIN : in std_ulogic;
      CLIENTEMACTXCLIENTCLKIN : in std_ulogic;
      CLIENTEMACTXD        : in std_logic_vector(15 downto 0);
      CLIENTEMACTXDVLD     : in std_ulogic;
      CLIENTEMACTXDVLDMSW  : in std_ulogic;
      CLIENTEMACTXFIRSTBYTE : in std_ulogic;
      CLIENTEMACTXIFGDELAY : in std_logic_vector(7 downto 0);
      CLIENTEMACTXUNDERRUN : in std_ulogic;
      DCREMACABUS          : in std_logic_vector(0 to 9);
      DCREMACCLK           : in std_ulogic;
      DCREMACDBUS          : in std_logic_vector(0 to 31);
      DCREMACENABLE        : in std_ulogic;
      DCREMACREAD          : in std_ulogic;
      DCREMACWRITE         : in std_ulogic;
      HOSTADDR             : in std_logic_vector(9 downto 0);
      HOSTCLK              : in std_ulogic;
      HOSTMIIMSEL          : in std_ulogic;
      HOSTOPCODE           : in std_logic_vector(1 downto 0);
      HOSTREQ              : in std_ulogic;
      HOSTWRDATA           : in std_logic_vector(31 downto 0);
      PHYEMACCOL           : in std_ulogic;
      PHYEMACCRS           : in std_ulogic;
      PHYEMACGTXCLK        : in std_ulogic;
      PHYEMACMCLKIN        : in std_ulogic;
      PHYEMACMDIN          : in std_ulogic;
      PHYEMACMIITXCLK      : in std_ulogic;
      PHYEMACPHYAD         : in std_logic_vector(4 downto 0);
      PHYEMACRXBUFSTATUS   : in std_logic_vector(1 downto 0);
      PHYEMACRXCHARISCOMMA : in std_ulogic;
      PHYEMACRXCHARISK     : in std_ulogic;
      PHYEMACRXCLK         : in std_ulogic;
      PHYEMACRXCLKCORCNT   : in std_logic_vector(2 downto 0);
      PHYEMACRXD           : in std_logic_vector(7 downto 0);
      PHYEMACRXDISPERR     : in std_ulogic;
      PHYEMACRXDV          : in std_ulogic;
      PHYEMACRXER          : in std_ulogic;
      PHYEMACRXNOTINTABLE  : in std_ulogic;
      PHYEMACRXRUNDISP     : in std_ulogic;
      PHYEMACSIGNALDET     : in std_ulogic;
      PHYEMACTXBUFERR      : in std_ulogic;
      PHYEMACTXGMIIMIICLKIN : in std_ulogic;
      RESET                : in std_ulogic      
    );
  end TEMAC_SINGLE;

  architecture TEMAC_SINGLE_V of TEMAC_SINGLE is

  begin
    
--####################################################################
--#####                        Initialization                      ###
--####################################################################
  prcs_init:process
  begin

    assert false
      report "ERROR : The following component TEMAC_SINGLE is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
      severity Failure;

     wait;

  end process prcs_init;

  
 end TEMAC_SINGLE_V;

    
