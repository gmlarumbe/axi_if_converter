-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        HBM_TWO_STACK_INTF
-- /___/   /\      Filename    : HBM_TWO_STACK_INTF.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL HBM_TWO_STACK_INTF -----

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

entity HBM_TWO_STACK_INTF is
  generic (
    CLK_SEL_00 : string := "FALSE";
    CLK_SEL_01 : string := "FALSE";
    CLK_SEL_02 : string := "FALSE";
    CLK_SEL_03 : string := "FALSE";
    CLK_SEL_04 : string := "FALSE";
    CLK_SEL_05 : string := "FALSE";
    CLK_SEL_06 : string := "FALSE";
    CLK_SEL_07 : string := "FALSE";
    CLK_SEL_08 : string := "FALSE";
    CLK_SEL_09 : string := "FALSE";
    CLK_SEL_10 : string := "FALSE";
    CLK_SEL_11 : string := "FALSE";
    CLK_SEL_12 : string := "FALSE";
    CLK_SEL_13 : string := "FALSE";
    CLK_SEL_14 : string := "FALSE";
    CLK_SEL_15 : string := "FALSE";
    CLK_SEL_16 : string := "FALSE";
    CLK_SEL_17 : string := "FALSE";
    CLK_SEL_18 : string := "FALSE";
    CLK_SEL_19 : string := "FALSE";
    CLK_SEL_20 : string := "FALSE";
    CLK_SEL_21 : string := "FALSE";
    CLK_SEL_22 : string := "FALSE";
    CLK_SEL_23 : string := "FALSE";
    CLK_SEL_24 : string := "FALSE";
    CLK_SEL_25 : string := "FALSE";
    CLK_SEL_26 : string := "FALSE";
    CLK_SEL_27 : string := "FALSE";
    CLK_SEL_28 : string := "FALSE";
    CLK_SEL_29 : string := "FALSE";
    CLK_SEL_30 : string := "FALSE";
    CLK_SEL_31 : string := "FALSE";
    DATARATE_00 : integer := 1800;
    DATARATE_01 : integer := 1800;
    DATARATE_02 : integer := 1800;
    DATARATE_03 : integer := 1800;
    DATARATE_04 : integer := 1800;
    DATARATE_05 : integer := 1800;
    DATARATE_06 : integer := 1800;
    DATARATE_07 : integer := 1800;
    DATARATE_08 : integer := 1800;
    DATARATE_09 : integer := 1800;
    DATARATE_10 : integer := 1800;
    DATARATE_11 : integer := 1800;
    DATARATE_12 : integer := 1800;
    DATARATE_13 : integer := 1800;
    DATARATE_14 : integer := 1800;
    DATARATE_15 : integer := 1800;
    DA_LOCKOUT_0 : string := "FALSE";
    DA_LOCKOUT_1 : string := "FALSE";
    IS_APB_0_PCLK_INVERTED : bit := '0';
    IS_APB_0_PRESET_N_INVERTED : bit := '0';
    IS_APB_1_PCLK_INVERTED : bit := '0';
    IS_APB_1_PRESET_N_INVERTED : bit := '0';
    IS_AXI_00_ACLK_INVERTED : bit := '0';
    IS_AXI_00_ARESET_N_INVERTED : bit := '0';
    IS_AXI_01_ACLK_INVERTED : bit := '0';
    IS_AXI_01_ARESET_N_INVERTED : bit := '0';
    IS_AXI_02_ACLK_INVERTED : bit := '0';
    IS_AXI_02_ARESET_N_INVERTED : bit := '0';
    IS_AXI_03_ACLK_INVERTED : bit := '0';
    IS_AXI_03_ARESET_N_INVERTED : bit := '0';
    IS_AXI_04_ACLK_INVERTED : bit := '0';
    IS_AXI_04_ARESET_N_INVERTED : bit := '0';
    IS_AXI_05_ACLK_INVERTED : bit := '0';
    IS_AXI_05_ARESET_N_INVERTED : bit := '0';
    IS_AXI_06_ACLK_INVERTED : bit := '0';
    IS_AXI_06_ARESET_N_INVERTED : bit := '0';
    IS_AXI_07_ACLK_INVERTED : bit := '0';
    IS_AXI_07_ARESET_N_INVERTED : bit := '0';
    IS_AXI_08_ACLK_INVERTED : bit := '0';
    IS_AXI_08_ARESET_N_INVERTED : bit := '0';
    IS_AXI_09_ACLK_INVERTED : bit := '0';
    IS_AXI_09_ARESET_N_INVERTED : bit := '0';
    IS_AXI_10_ACLK_INVERTED : bit := '0';
    IS_AXI_10_ARESET_N_INVERTED : bit := '0';
    IS_AXI_11_ACLK_INVERTED : bit := '0';
    IS_AXI_11_ARESET_N_INVERTED : bit := '0';
    IS_AXI_12_ACLK_INVERTED : bit := '0';
    IS_AXI_12_ARESET_N_INVERTED : bit := '0';
    IS_AXI_13_ACLK_INVERTED : bit := '0';
    IS_AXI_13_ARESET_N_INVERTED : bit := '0';
    IS_AXI_14_ACLK_INVERTED : bit := '0';
    IS_AXI_14_ARESET_N_INVERTED : bit := '0';
    IS_AXI_15_ACLK_INVERTED : bit := '0';
    IS_AXI_15_ARESET_N_INVERTED : bit := '0';
    IS_AXI_16_ACLK_INVERTED : bit := '0';
    IS_AXI_16_ARESET_N_INVERTED : bit := '0';
    IS_AXI_17_ACLK_INVERTED : bit := '0';
    IS_AXI_17_ARESET_N_INVERTED : bit := '0';
    IS_AXI_18_ACLK_INVERTED : bit := '0';
    IS_AXI_18_ARESET_N_INVERTED : bit := '0';
    IS_AXI_19_ACLK_INVERTED : bit := '0';
    IS_AXI_19_ARESET_N_INVERTED : bit := '0';
    IS_AXI_20_ACLK_INVERTED : bit := '0';
    IS_AXI_20_ARESET_N_INVERTED : bit := '0';
    IS_AXI_21_ACLK_INVERTED : bit := '0';
    IS_AXI_21_ARESET_N_INVERTED : bit := '0';
    IS_AXI_22_ACLK_INVERTED : bit := '0';
    IS_AXI_22_ARESET_N_INVERTED : bit := '0';
    IS_AXI_23_ACLK_INVERTED : bit := '0';
    IS_AXI_23_ARESET_N_INVERTED : bit := '0';
    IS_AXI_24_ACLK_INVERTED : bit := '0';
    IS_AXI_24_ARESET_N_INVERTED : bit := '0';
    IS_AXI_25_ACLK_INVERTED : bit := '0';
    IS_AXI_25_ARESET_N_INVERTED : bit := '0';
    IS_AXI_26_ACLK_INVERTED : bit := '0';
    IS_AXI_26_ARESET_N_INVERTED : bit := '0';
    IS_AXI_27_ACLK_INVERTED : bit := '0';
    IS_AXI_27_ARESET_N_INVERTED : bit := '0';
    IS_AXI_28_ACLK_INVERTED : bit := '0';
    IS_AXI_28_ARESET_N_INVERTED : bit := '0';
    IS_AXI_29_ACLK_INVERTED : bit := '0';
    IS_AXI_29_ARESET_N_INVERTED : bit := '0';
    IS_AXI_30_ACLK_INVERTED : bit := '0';
    IS_AXI_30_ARESET_N_INVERTED : bit := '0';
    IS_AXI_31_ACLK_INVERTED : bit := '0';
    IS_AXI_31_ARESET_N_INVERTED : bit := '0';
    MC_ENABLE_00 : string := "FALSE";
    MC_ENABLE_01 : string := "FALSE";
    MC_ENABLE_02 : string := "FALSE";
    MC_ENABLE_03 : string := "FALSE";
    MC_ENABLE_04 : string := "FALSE";
    MC_ENABLE_05 : string := "FALSE";
    MC_ENABLE_06 : string := "FALSE";
    MC_ENABLE_07 : string := "FALSE";
    MC_ENABLE_08 : string := "FALSE";
    MC_ENABLE_09 : string := "FALSE";
    MC_ENABLE_10 : string := "FALSE";
    MC_ENABLE_11 : string := "FALSE";
    MC_ENABLE_12 : string := "FALSE";
    MC_ENABLE_13 : string := "FALSE";
    MC_ENABLE_14 : string := "FALSE";
    MC_ENABLE_15 : string := "FALSE";
    MC_ENABLE_APB_00 : string := "FALSE";
    MC_ENABLE_APB_01 : string := "FALSE";
    PAGEHIT_PERCENT_00 : integer := 75;
    PAGEHIT_PERCENT_01 : integer := 75;
    PHY_ENABLE_00 : string := "FALSE";
    PHY_ENABLE_01 : string := "FALSE";
    PHY_ENABLE_02 : string := "FALSE";
    PHY_ENABLE_03 : string := "FALSE";
    PHY_ENABLE_04 : string := "FALSE";
    PHY_ENABLE_05 : string := "FALSE";
    PHY_ENABLE_06 : string := "FALSE";
    PHY_ENABLE_07 : string := "FALSE";
    PHY_ENABLE_08 : string := "FALSE";
    PHY_ENABLE_09 : string := "FALSE";
    PHY_ENABLE_10 : string := "FALSE";
    PHY_ENABLE_11 : string := "FALSE";
    PHY_ENABLE_12 : string := "FALSE";
    PHY_ENABLE_13 : string := "FALSE";
    PHY_ENABLE_14 : string := "FALSE";
    PHY_ENABLE_15 : string := "FALSE";
    PHY_ENABLE_16 : string := "FALSE";
    PHY_ENABLE_17 : string := "FALSE";
    PHY_ENABLE_18 : string := "FALSE";
    PHY_ENABLE_19 : string := "FALSE";
    PHY_ENABLE_20 : string := "FALSE";
    PHY_ENABLE_21 : string := "FALSE";
    PHY_ENABLE_22 : string := "FALSE";
    PHY_ENABLE_23 : string := "FALSE";
    PHY_ENABLE_24 : string := "FALSE";
    PHY_ENABLE_25 : string := "FALSE";
    PHY_ENABLE_26 : string := "FALSE";
    PHY_ENABLE_27 : string := "FALSE";
    PHY_ENABLE_28 : string := "FALSE";
    PHY_ENABLE_29 : string := "FALSE";
    PHY_ENABLE_30 : string := "FALSE";
    PHY_ENABLE_31 : string := "FALSE";
    PHY_ENABLE_APB_00 : string := "FALSE";
    PHY_ENABLE_APB_01 : string := "FALSE";
    PHY_PCLK_INVERT_01 : string := "FALSE";
    PHY_PCLK_INVERT_02 : string := "FALSE";
    READ_PERCENT_00 : integer := 50;
    READ_PERCENT_01 : integer := 50;
    READ_PERCENT_02 : integer := 50;
    READ_PERCENT_03 : integer := 50;
    READ_PERCENT_04 : integer := 50;
    READ_PERCENT_05 : integer := 50;
    READ_PERCENT_06 : integer := 50;
    READ_PERCENT_07 : integer := 50;
    READ_PERCENT_08 : integer := 50;
    READ_PERCENT_09 : integer := 50;
    READ_PERCENT_10 : integer := 50;
    READ_PERCENT_11 : integer := 50;
    READ_PERCENT_12 : integer := 50;
    READ_PERCENT_13 : integer := 50;
    READ_PERCENT_14 : integer := 50;
    READ_PERCENT_15 : integer := 50;
    READ_PERCENT_16 : integer := 50;
    READ_PERCENT_17 : integer := 50;
    READ_PERCENT_18 : integer := 50;
    READ_PERCENT_19 : integer := 50;
    READ_PERCENT_20 : integer := 50;
    READ_PERCENT_21 : integer := 50;
    READ_PERCENT_22 : integer := 50;
    READ_PERCENT_23 : integer := 50;
    READ_PERCENT_24 : integer := 50;
    READ_PERCENT_25 : integer := 50;
    READ_PERCENT_26 : integer := 50;
    READ_PERCENT_27 : integer := 50;
    READ_PERCENT_28 : integer := 50;
    READ_PERCENT_29 : integer := 50;
    READ_PERCENT_30 : integer := 50;
    READ_PERCENT_31 : integer := 50;
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    SWITCH_ENABLE_00 : string := "FALSE";
    SWITCH_ENABLE_01 : string := "FALSE";
    WRITE_PERCENT_00 : integer := 50;
    WRITE_PERCENT_01 : integer := 50;
    WRITE_PERCENT_02 : integer := 50;
    WRITE_PERCENT_03 : integer := 50;
    WRITE_PERCENT_04 : integer := 50;
    WRITE_PERCENT_05 : integer := 50;
    WRITE_PERCENT_06 : integer := 50;
    WRITE_PERCENT_07 : integer := 50;
    WRITE_PERCENT_08 : integer := 50;
    WRITE_PERCENT_09 : integer := 50;
    WRITE_PERCENT_10 : integer := 50;
    WRITE_PERCENT_11 : integer := 50;
    WRITE_PERCENT_12 : integer := 50;
    WRITE_PERCENT_13 : integer := 50;
    WRITE_PERCENT_14 : integer := 50;
    WRITE_PERCENT_15 : integer := 50;
    WRITE_PERCENT_16 : integer := 50;
    WRITE_PERCENT_17 : integer := 50;
    WRITE_PERCENT_18 : integer := 50;
    WRITE_PERCENT_19 : integer := 50;
    WRITE_PERCENT_20 : integer := 50;
    WRITE_PERCENT_21 : integer := 50;
    WRITE_PERCENT_22 : integer := 50;
    WRITE_PERCENT_23 : integer := 50;
    WRITE_PERCENT_24 : integer := 50;
    WRITE_PERCENT_25 : integer := 50;
    WRITE_PERCENT_26 : integer := 50;
    WRITE_PERCENT_27 : integer := 50;
    WRITE_PERCENT_28 : integer := 50;
    WRITE_PERCENT_29 : integer := 50;
    WRITE_PERCENT_30 : integer := 50;
    WRITE_PERCENT_31 : integer := 50
  );
  
  port (
    APB_0_PRDATA         : out std_logic_vector(31 downto 0);
    APB_0_PREADY         : out std_ulogic;
    APB_0_PSLVERR        : out std_ulogic;
    APB_1_PRDATA         : out std_logic_vector(31 downto 0);
    APB_1_PREADY         : out std_ulogic;
    APB_1_PSLVERR        : out std_ulogic;
    AXI_00_ARREADY       : out std_ulogic;
    AXI_00_AWREADY       : out std_ulogic;
    AXI_00_BID           : out std_logic_vector(5 downto 0);
    AXI_00_BRESP         : out std_logic_vector(1 downto 0);
    AXI_00_BVALID        : out std_ulogic;
    AXI_00_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_00_DFI_CLK_BUF   : out std_ulogic;
    AXI_00_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_00_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_00_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_00_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_00_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_00_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_00_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_00_DFI_RST_N_BUF : out std_ulogic;
    AXI_00_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_00_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_00_RDATA         : out std_logic_vector(255 downto 0);
    AXI_00_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_00_RID           : out std_logic_vector(5 downto 0);
    AXI_00_RLAST         : out std_ulogic;
    AXI_00_RRESP         : out std_logic_vector(1 downto 0);
    AXI_00_RVALID        : out std_ulogic;
    AXI_00_WREADY        : out std_ulogic;
    AXI_01_ARREADY       : out std_ulogic;
    AXI_01_AWREADY       : out std_ulogic;
    AXI_01_BID           : out std_logic_vector(5 downto 0);
    AXI_01_BRESP         : out std_logic_vector(1 downto 0);
    AXI_01_BVALID        : out std_ulogic;
    AXI_01_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_01_DFI_CLK_BUF   : out std_ulogic;
    AXI_01_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_01_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_01_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_01_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_01_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_01_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_01_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_01_DFI_RST_N_BUF : out std_ulogic;
    AXI_01_RDATA         : out std_logic_vector(255 downto 0);
    AXI_01_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_01_RID           : out std_logic_vector(5 downto 0);
    AXI_01_RLAST         : out std_ulogic;
    AXI_01_RRESP         : out std_logic_vector(1 downto 0);
    AXI_01_RVALID        : out std_ulogic;
    AXI_01_WREADY        : out std_ulogic;
    AXI_02_ARREADY       : out std_ulogic;
    AXI_02_AWREADY       : out std_ulogic;
    AXI_02_BID           : out std_logic_vector(5 downto 0);
    AXI_02_BRESP         : out std_logic_vector(1 downto 0);
    AXI_02_BVALID        : out std_ulogic;
    AXI_02_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_02_DFI_CLK_BUF   : out std_ulogic;
    AXI_02_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_02_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_02_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_02_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_02_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_02_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_02_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_02_DFI_RST_N_BUF : out std_ulogic;
    AXI_02_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_02_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_02_RDATA         : out std_logic_vector(255 downto 0);
    AXI_02_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_02_RID           : out std_logic_vector(5 downto 0);
    AXI_02_RLAST         : out std_ulogic;
    AXI_02_RRESP         : out std_logic_vector(1 downto 0);
    AXI_02_RVALID        : out std_ulogic;
    AXI_02_WREADY        : out std_ulogic;
    AXI_03_ARREADY       : out std_ulogic;
    AXI_03_AWREADY       : out std_ulogic;
    AXI_03_BID           : out std_logic_vector(5 downto 0);
    AXI_03_BRESP         : out std_logic_vector(1 downto 0);
    AXI_03_BVALID        : out std_ulogic;
    AXI_03_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_03_DFI_CLK_BUF   : out std_ulogic;
    AXI_03_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_03_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_03_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_03_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_03_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_03_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_03_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_03_DFI_RST_N_BUF : out std_ulogic;
    AXI_03_RDATA         : out std_logic_vector(255 downto 0);
    AXI_03_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_03_RID           : out std_logic_vector(5 downto 0);
    AXI_03_RLAST         : out std_ulogic;
    AXI_03_RRESP         : out std_logic_vector(1 downto 0);
    AXI_03_RVALID        : out std_ulogic;
    AXI_03_WREADY        : out std_ulogic;
    AXI_04_ARREADY       : out std_ulogic;
    AXI_04_AWREADY       : out std_ulogic;
    AXI_04_BID           : out std_logic_vector(5 downto 0);
    AXI_04_BRESP         : out std_logic_vector(1 downto 0);
    AXI_04_BVALID        : out std_ulogic;
    AXI_04_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_04_DFI_CLK_BUF   : out std_ulogic;
    AXI_04_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_04_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_04_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_04_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_04_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_04_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_04_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_04_DFI_RST_N_BUF : out std_ulogic;
    AXI_04_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_04_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_04_RDATA         : out std_logic_vector(255 downto 0);
    AXI_04_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_04_RID           : out std_logic_vector(5 downto 0);
    AXI_04_RLAST         : out std_ulogic;
    AXI_04_RRESP         : out std_logic_vector(1 downto 0);
    AXI_04_RVALID        : out std_ulogic;
    AXI_04_WREADY        : out std_ulogic;
    AXI_05_ARREADY       : out std_ulogic;
    AXI_05_AWREADY       : out std_ulogic;
    AXI_05_BID           : out std_logic_vector(5 downto 0);
    AXI_05_BRESP         : out std_logic_vector(1 downto 0);
    AXI_05_BVALID        : out std_ulogic;
    AXI_05_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_05_DFI_CLK_BUF   : out std_ulogic;
    AXI_05_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_05_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_05_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_05_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_05_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_05_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_05_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_05_DFI_RST_N_BUF : out std_ulogic;
    AXI_05_RDATA         : out std_logic_vector(255 downto 0);
    AXI_05_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_05_RID           : out std_logic_vector(5 downto 0);
    AXI_05_RLAST         : out std_ulogic;
    AXI_05_RRESP         : out std_logic_vector(1 downto 0);
    AXI_05_RVALID        : out std_ulogic;
    AXI_05_WREADY        : out std_ulogic;
    AXI_06_ARREADY       : out std_ulogic;
    AXI_06_AWREADY       : out std_ulogic;
    AXI_06_BID           : out std_logic_vector(5 downto 0);
    AXI_06_BRESP         : out std_logic_vector(1 downto 0);
    AXI_06_BVALID        : out std_ulogic;
    AXI_06_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_06_DFI_CLK_BUF   : out std_ulogic;
    AXI_06_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_06_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_06_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_06_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_06_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_06_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_06_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_06_DFI_RST_N_BUF : out std_ulogic;
    AXI_06_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_06_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_06_RDATA         : out std_logic_vector(255 downto 0);
    AXI_06_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_06_RID           : out std_logic_vector(5 downto 0);
    AXI_06_RLAST         : out std_ulogic;
    AXI_06_RRESP         : out std_logic_vector(1 downto 0);
    AXI_06_RVALID        : out std_ulogic;
    AXI_06_WREADY        : out std_ulogic;
    AXI_07_ARREADY       : out std_ulogic;
    AXI_07_AWREADY       : out std_ulogic;
    AXI_07_BID           : out std_logic_vector(5 downto 0);
    AXI_07_BRESP         : out std_logic_vector(1 downto 0);
    AXI_07_BVALID        : out std_ulogic;
    AXI_07_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_07_DFI_CLK_BUF   : out std_ulogic;
    AXI_07_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_07_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_07_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_07_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_07_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_07_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_07_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_07_DFI_RST_N_BUF : out std_ulogic;
    AXI_07_RDATA         : out std_logic_vector(255 downto 0);
    AXI_07_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_07_RID           : out std_logic_vector(5 downto 0);
    AXI_07_RLAST         : out std_ulogic;
    AXI_07_RRESP         : out std_logic_vector(1 downto 0);
    AXI_07_RVALID        : out std_ulogic;
    AXI_07_WREADY        : out std_ulogic;
    AXI_08_ARREADY       : out std_ulogic;
    AXI_08_AWREADY       : out std_ulogic;
    AXI_08_BID           : out std_logic_vector(5 downto 0);
    AXI_08_BRESP         : out std_logic_vector(1 downto 0);
    AXI_08_BVALID        : out std_ulogic;
    AXI_08_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_08_DFI_CLK_BUF   : out std_ulogic;
    AXI_08_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_08_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_08_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_08_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_08_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_08_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_08_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_08_DFI_RST_N_BUF : out std_ulogic;
    AXI_08_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_08_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_08_RDATA         : out std_logic_vector(255 downto 0);
    AXI_08_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_08_RID           : out std_logic_vector(5 downto 0);
    AXI_08_RLAST         : out std_ulogic;
    AXI_08_RRESP         : out std_logic_vector(1 downto 0);
    AXI_08_RVALID        : out std_ulogic;
    AXI_08_WREADY        : out std_ulogic;
    AXI_09_ARREADY       : out std_ulogic;
    AXI_09_AWREADY       : out std_ulogic;
    AXI_09_BID           : out std_logic_vector(5 downto 0);
    AXI_09_BRESP         : out std_logic_vector(1 downto 0);
    AXI_09_BVALID        : out std_ulogic;
    AXI_09_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_09_DFI_CLK_BUF   : out std_ulogic;
    AXI_09_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_09_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_09_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_09_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_09_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_09_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_09_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_09_DFI_RST_N_BUF : out std_ulogic;
    AXI_09_RDATA         : out std_logic_vector(255 downto 0);
    AXI_09_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_09_RID           : out std_logic_vector(5 downto 0);
    AXI_09_RLAST         : out std_ulogic;
    AXI_09_RRESP         : out std_logic_vector(1 downto 0);
    AXI_09_RVALID        : out std_ulogic;
    AXI_09_WREADY        : out std_ulogic;
    AXI_10_ARREADY       : out std_ulogic;
    AXI_10_AWREADY       : out std_ulogic;
    AXI_10_BID           : out std_logic_vector(5 downto 0);
    AXI_10_BRESP         : out std_logic_vector(1 downto 0);
    AXI_10_BVALID        : out std_ulogic;
    AXI_10_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_10_DFI_CLK_BUF   : out std_ulogic;
    AXI_10_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_10_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_10_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_10_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_10_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_10_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_10_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_10_DFI_RST_N_BUF : out std_ulogic;
    AXI_10_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_10_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_10_RDATA         : out std_logic_vector(255 downto 0);
    AXI_10_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_10_RID           : out std_logic_vector(5 downto 0);
    AXI_10_RLAST         : out std_ulogic;
    AXI_10_RRESP         : out std_logic_vector(1 downto 0);
    AXI_10_RVALID        : out std_ulogic;
    AXI_10_WREADY        : out std_ulogic;
    AXI_11_ARREADY       : out std_ulogic;
    AXI_11_AWREADY       : out std_ulogic;
    AXI_11_BID           : out std_logic_vector(5 downto 0);
    AXI_11_BRESP         : out std_logic_vector(1 downto 0);
    AXI_11_BVALID        : out std_ulogic;
    AXI_11_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_11_DFI_CLK_BUF   : out std_ulogic;
    AXI_11_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_11_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_11_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_11_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_11_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_11_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_11_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_11_DFI_RST_N_BUF : out std_ulogic;
    AXI_11_RDATA         : out std_logic_vector(255 downto 0);
    AXI_11_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_11_RID           : out std_logic_vector(5 downto 0);
    AXI_11_RLAST         : out std_ulogic;
    AXI_11_RRESP         : out std_logic_vector(1 downto 0);
    AXI_11_RVALID        : out std_ulogic;
    AXI_11_WREADY        : out std_ulogic;
    AXI_12_ARREADY       : out std_ulogic;
    AXI_12_AWREADY       : out std_ulogic;
    AXI_12_BID           : out std_logic_vector(5 downto 0);
    AXI_12_BRESP         : out std_logic_vector(1 downto 0);
    AXI_12_BVALID        : out std_ulogic;
    AXI_12_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_12_DFI_CLK_BUF   : out std_ulogic;
    AXI_12_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_12_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_12_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_12_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_12_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_12_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_12_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_12_DFI_RST_N_BUF : out std_ulogic;
    AXI_12_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_12_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_12_RDATA         : out std_logic_vector(255 downto 0);
    AXI_12_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_12_RID           : out std_logic_vector(5 downto 0);
    AXI_12_RLAST         : out std_ulogic;
    AXI_12_RRESP         : out std_logic_vector(1 downto 0);
    AXI_12_RVALID        : out std_ulogic;
    AXI_12_WREADY        : out std_ulogic;
    AXI_13_ARREADY       : out std_ulogic;
    AXI_13_AWREADY       : out std_ulogic;
    AXI_13_BID           : out std_logic_vector(5 downto 0);
    AXI_13_BRESP         : out std_logic_vector(1 downto 0);
    AXI_13_BVALID        : out std_ulogic;
    AXI_13_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_13_DFI_CLK_BUF   : out std_ulogic;
    AXI_13_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_13_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_13_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_13_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_13_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_13_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_13_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_13_DFI_RST_N_BUF : out std_ulogic;
    AXI_13_RDATA         : out std_logic_vector(255 downto 0);
    AXI_13_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_13_RID           : out std_logic_vector(5 downto 0);
    AXI_13_RLAST         : out std_ulogic;
    AXI_13_RRESP         : out std_logic_vector(1 downto 0);
    AXI_13_RVALID        : out std_ulogic;
    AXI_13_WREADY        : out std_ulogic;
    AXI_14_ARREADY       : out std_ulogic;
    AXI_14_AWREADY       : out std_ulogic;
    AXI_14_BID           : out std_logic_vector(5 downto 0);
    AXI_14_BRESP         : out std_logic_vector(1 downto 0);
    AXI_14_BVALID        : out std_ulogic;
    AXI_14_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_14_DFI_CLK_BUF   : out std_ulogic;
    AXI_14_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_14_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_14_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_14_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_14_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_14_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_14_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_14_DFI_RST_N_BUF : out std_ulogic;
    AXI_14_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_14_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_14_RDATA         : out std_logic_vector(255 downto 0);
    AXI_14_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_14_RID           : out std_logic_vector(5 downto 0);
    AXI_14_RLAST         : out std_ulogic;
    AXI_14_RRESP         : out std_logic_vector(1 downto 0);
    AXI_14_RVALID        : out std_ulogic;
    AXI_14_WREADY        : out std_ulogic;
    AXI_15_ARREADY       : out std_ulogic;
    AXI_15_AWREADY       : out std_ulogic;
    AXI_15_BID           : out std_logic_vector(5 downto 0);
    AXI_15_BRESP         : out std_logic_vector(1 downto 0);
    AXI_15_BVALID        : out std_ulogic;
    AXI_15_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_15_DFI_CLK_BUF   : out std_ulogic;
    AXI_15_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_15_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_15_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_15_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_15_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_15_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_15_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_15_DFI_RST_N_BUF : out std_ulogic;
    AXI_15_RDATA         : out std_logic_vector(255 downto 0);
    AXI_15_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_15_RID           : out std_logic_vector(5 downto 0);
    AXI_15_RLAST         : out std_ulogic;
    AXI_15_RRESP         : out std_logic_vector(1 downto 0);
    AXI_15_RVALID        : out std_ulogic;
    AXI_15_WREADY        : out std_ulogic;
    AXI_16_ARREADY       : out std_ulogic;
    AXI_16_AWREADY       : out std_ulogic;
    AXI_16_BID           : out std_logic_vector(5 downto 0);
    AXI_16_BRESP         : out std_logic_vector(1 downto 0);
    AXI_16_BVALID        : out std_ulogic;
    AXI_16_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_16_DFI_CLK_BUF   : out std_ulogic;
    AXI_16_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_16_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_16_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_16_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_16_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_16_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_16_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_16_DFI_RST_N_BUF : out std_ulogic;
    AXI_16_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_16_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_16_RDATA         : out std_logic_vector(255 downto 0);
    AXI_16_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_16_RID           : out std_logic_vector(5 downto 0);
    AXI_16_RLAST         : out std_ulogic;
    AXI_16_RRESP         : out std_logic_vector(1 downto 0);
    AXI_16_RVALID        : out std_ulogic;
    AXI_16_WREADY        : out std_ulogic;
    AXI_17_ARREADY       : out std_ulogic;
    AXI_17_AWREADY       : out std_ulogic;
    AXI_17_BID           : out std_logic_vector(5 downto 0);
    AXI_17_BRESP         : out std_logic_vector(1 downto 0);
    AXI_17_BVALID        : out std_ulogic;
    AXI_17_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_17_DFI_CLK_BUF   : out std_ulogic;
    AXI_17_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_17_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_17_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_17_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_17_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_17_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_17_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_17_DFI_RST_N_BUF : out std_ulogic;
    AXI_17_RDATA         : out std_logic_vector(255 downto 0);
    AXI_17_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_17_RID           : out std_logic_vector(5 downto 0);
    AXI_17_RLAST         : out std_ulogic;
    AXI_17_RRESP         : out std_logic_vector(1 downto 0);
    AXI_17_RVALID        : out std_ulogic;
    AXI_17_WREADY        : out std_ulogic;
    AXI_18_ARREADY       : out std_ulogic;
    AXI_18_AWREADY       : out std_ulogic;
    AXI_18_BID           : out std_logic_vector(5 downto 0);
    AXI_18_BRESP         : out std_logic_vector(1 downto 0);
    AXI_18_BVALID        : out std_ulogic;
    AXI_18_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_18_DFI_CLK_BUF   : out std_ulogic;
    AXI_18_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_18_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_18_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_18_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_18_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_18_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_18_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_18_DFI_RST_N_BUF : out std_ulogic;
    AXI_18_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_18_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_18_RDATA         : out std_logic_vector(255 downto 0);
    AXI_18_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_18_RID           : out std_logic_vector(5 downto 0);
    AXI_18_RLAST         : out std_ulogic;
    AXI_18_RRESP         : out std_logic_vector(1 downto 0);
    AXI_18_RVALID        : out std_ulogic;
    AXI_18_WREADY        : out std_ulogic;
    AXI_19_ARREADY       : out std_ulogic;
    AXI_19_AWREADY       : out std_ulogic;
    AXI_19_BID           : out std_logic_vector(5 downto 0);
    AXI_19_BRESP         : out std_logic_vector(1 downto 0);
    AXI_19_BVALID        : out std_ulogic;
    AXI_19_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_19_DFI_CLK_BUF   : out std_ulogic;
    AXI_19_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_19_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_19_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_19_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_19_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_19_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_19_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_19_DFI_RST_N_BUF : out std_ulogic;
    AXI_19_RDATA         : out std_logic_vector(255 downto 0);
    AXI_19_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_19_RID           : out std_logic_vector(5 downto 0);
    AXI_19_RLAST         : out std_ulogic;
    AXI_19_RRESP         : out std_logic_vector(1 downto 0);
    AXI_19_RVALID        : out std_ulogic;
    AXI_19_WREADY        : out std_ulogic;
    AXI_20_ARREADY       : out std_ulogic;
    AXI_20_AWREADY       : out std_ulogic;
    AXI_20_BID           : out std_logic_vector(5 downto 0);
    AXI_20_BRESP         : out std_logic_vector(1 downto 0);
    AXI_20_BVALID        : out std_ulogic;
    AXI_20_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_20_DFI_CLK_BUF   : out std_ulogic;
    AXI_20_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_20_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_20_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_20_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_20_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_20_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_20_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_20_DFI_RST_N_BUF : out std_ulogic;
    AXI_20_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_20_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_20_RDATA         : out std_logic_vector(255 downto 0);
    AXI_20_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_20_RID           : out std_logic_vector(5 downto 0);
    AXI_20_RLAST         : out std_ulogic;
    AXI_20_RRESP         : out std_logic_vector(1 downto 0);
    AXI_20_RVALID        : out std_ulogic;
    AXI_20_WREADY        : out std_ulogic;
    AXI_21_ARREADY       : out std_ulogic;
    AXI_21_AWREADY       : out std_ulogic;
    AXI_21_BID           : out std_logic_vector(5 downto 0);
    AXI_21_BRESP         : out std_logic_vector(1 downto 0);
    AXI_21_BVALID        : out std_ulogic;
    AXI_21_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_21_DFI_CLK_BUF   : out std_ulogic;
    AXI_21_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_21_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_21_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_21_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_21_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_21_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_21_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_21_DFI_RST_N_BUF : out std_ulogic;
    AXI_21_RDATA         : out std_logic_vector(255 downto 0);
    AXI_21_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_21_RID           : out std_logic_vector(5 downto 0);
    AXI_21_RLAST         : out std_ulogic;
    AXI_21_RRESP         : out std_logic_vector(1 downto 0);
    AXI_21_RVALID        : out std_ulogic;
    AXI_21_WREADY        : out std_ulogic;
    AXI_22_ARREADY       : out std_ulogic;
    AXI_22_AWREADY       : out std_ulogic;
    AXI_22_BID           : out std_logic_vector(5 downto 0);
    AXI_22_BRESP         : out std_logic_vector(1 downto 0);
    AXI_22_BVALID        : out std_ulogic;
    AXI_22_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_22_DFI_CLK_BUF   : out std_ulogic;
    AXI_22_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_22_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_22_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_22_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_22_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_22_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_22_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_22_DFI_RST_N_BUF : out std_ulogic;
    AXI_22_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_22_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_22_RDATA         : out std_logic_vector(255 downto 0);
    AXI_22_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_22_RID           : out std_logic_vector(5 downto 0);
    AXI_22_RLAST         : out std_ulogic;
    AXI_22_RRESP         : out std_logic_vector(1 downto 0);
    AXI_22_RVALID        : out std_ulogic;
    AXI_22_WREADY        : out std_ulogic;
    AXI_23_ARREADY       : out std_ulogic;
    AXI_23_AWREADY       : out std_ulogic;
    AXI_23_BID           : out std_logic_vector(5 downto 0);
    AXI_23_BRESP         : out std_logic_vector(1 downto 0);
    AXI_23_BVALID        : out std_ulogic;
    AXI_23_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_23_DFI_CLK_BUF   : out std_ulogic;
    AXI_23_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_23_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_23_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_23_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_23_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_23_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_23_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_23_DFI_RST_N_BUF : out std_ulogic;
    AXI_23_RDATA         : out std_logic_vector(255 downto 0);
    AXI_23_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_23_RID           : out std_logic_vector(5 downto 0);
    AXI_23_RLAST         : out std_ulogic;
    AXI_23_RRESP         : out std_logic_vector(1 downto 0);
    AXI_23_RVALID        : out std_ulogic;
    AXI_23_WREADY        : out std_ulogic;
    AXI_24_ARREADY       : out std_ulogic;
    AXI_24_AWREADY       : out std_ulogic;
    AXI_24_BID           : out std_logic_vector(5 downto 0);
    AXI_24_BRESP         : out std_logic_vector(1 downto 0);
    AXI_24_BVALID        : out std_ulogic;
    AXI_24_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_24_DFI_CLK_BUF   : out std_ulogic;
    AXI_24_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_24_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_24_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_24_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_24_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_24_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_24_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_24_DFI_RST_N_BUF : out std_ulogic;
    AXI_24_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_24_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_24_RDATA         : out std_logic_vector(255 downto 0);
    AXI_24_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_24_RID           : out std_logic_vector(5 downto 0);
    AXI_24_RLAST         : out std_ulogic;
    AXI_24_RRESP         : out std_logic_vector(1 downto 0);
    AXI_24_RVALID        : out std_ulogic;
    AXI_24_WREADY        : out std_ulogic;
    AXI_25_ARREADY       : out std_ulogic;
    AXI_25_AWREADY       : out std_ulogic;
    AXI_25_BID           : out std_logic_vector(5 downto 0);
    AXI_25_BRESP         : out std_logic_vector(1 downto 0);
    AXI_25_BVALID        : out std_ulogic;
    AXI_25_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_25_DFI_CLK_BUF   : out std_ulogic;
    AXI_25_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_25_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_25_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_25_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_25_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_25_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_25_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_25_DFI_RST_N_BUF : out std_ulogic;
    AXI_25_RDATA         : out std_logic_vector(255 downto 0);
    AXI_25_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_25_RID           : out std_logic_vector(5 downto 0);
    AXI_25_RLAST         : out std_ulogic;
    AXI_25_RRESP         : out std_logic_vector(1 downto 0);
    AXI_25_RVALID        : out std_ulogic;
    AXI_25_WREADY        : out std_ulogic;
    AXI_26_ARREADY       : out std_ulogic;
    AXI_26_AWREADY       : out std_ulogic;
    AXI_26_BID           : out std_logic_vector(5 downto 0);
    AXI_26_BRESP         : out std_logic_vector(1 downto 0);
    AXI_26_BVALID        : out std_ulogic;
    AXI_26_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_26_DFI_CLK_BUF   : out std_ulogic;
    AXI_26_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_26_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_26_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_26_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_26_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_26_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_26_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_26_DFI_RST_N_BUF : out std_ulogic;
    AXI_26_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_26_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_26_RDATA         : out std_logic_vector(255 downto 0);
    AXI_26_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_26_RID           : out std_logic_vector(5 downto 0);
    AXI_26_RLAST         : out std_ulogic;
    AXI_26_RRESP         : out std_logic_vector(1 downto 0);
    AXI_26_RVALID        : out std_ulogic;
    AXI_26_WREADY        : out std_ulogic;
    AXI_27_ARREADY       : out std_ulogic;
    AXI_27_AWREADY       : out std_ulogic;
    AXI_27_BID           : out std_logic_vector(5 downto 0);
    AXI_27_BRESP         : out std_logic_vector(1 downto 0);
    AXI_27_BVALID        : out std_ulogic;
    AXI_27_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_27_DFI_CLK_BUF   : out std_ulogic;
    AXI_27_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_27_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_27_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_27_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_27_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_27_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_27_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_27_DFI_RST_N_BUF : out std_ulogic;
    AXI_27_RDATA         : out std_logic_vector(255 downto 0);
    AXI_27_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_27_RID           : out std_logic_vector(5 downto 0);
    AXI_27_RLAST         : out std_ulogic;
    AXI_27_RRESP         : out std_logic_vector(1 downto 0);
    AXI_27_RVALID        : out std_ulogic;
    AXI_27_WREADY        : out std_ulogic;
    AXI_28_ARREADY       : out std_ulogic;
    AXI_28_AWREADY       : out std_ulogic;
    AXI_28_BID           : out std_logic_vector(5 downto 0);
    AXI_28_BRESP         : out std_logic_vector(1 downto 0);
    AXI_28_BVALID        : out std_ulogic;
    AXI_28_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_28_DFI_CLK_BUF   : out std_ulogic;
    AXI_28_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_28_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_28_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_28_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_28_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_28_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_28_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_28_DFI_RST_N_BUF : out std_ulogic;
    AXI_28_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_28_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_28_RDATA         : out std_logic_vector(255 downto 0);
    AXI_28_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_28_RID           : out std_logic_vector(5 downto 0);
    AXI_28_RLAST         : out std_ulogic;
    AXI_28_RRESP         : out std_logic_vector(1 downto 0);
    AXI_28_RVALID        : out std_ulogic;
    AXI_28_WREADY        : out std_ulogic;
    AXI_29_ARREADY       : out std_ulogic;
    AXI_29_AWREADY       : out std_ulogic;
    AXI_29_BID           : out std_logic_vector(5 downto 0);
    AXI_29_BRESP         : out std_logic_vector(1 downto 0);
    AXI_29_BVALID        : out std_ulogic;
    AXI_29_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_29_DFI_CLK_BUF   : out std_ulogic;
    AXI_29_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_29_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_29_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_29_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_29_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_29_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_29_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_29_DFI_RST_N_BUF : out std_ulogic;
    AXI_29_RDATA         : out std_logic_vector(255 downto 0);
    AXI_29_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_29_RID           : out std_logic_vector(5 downto 0);
    AXI_29_RLAST         : out std_ulogic;
    AXI_29_RRESP         : out std_logic_vector(1 downto 0);
    AXI_29_RVALID        : out std_ulogic;
    AXI_29_WREADY        : out std_ulogic;
    AXI_30_ARREADY       : out std_ulogic;
    AXI_30_AWREADY       : out std_ulogic;
    AXI_30_BID           : out std_logic_vector(5 downto 0);
    AXI_30_BRESP         : out std_logic_vector(1 downto 0);
    AXI_30_BVALID        : out std_ulogic;
    AXI_30_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_30_DFI_CLK_BUF   : out std_ulogic;
    AXI_30_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_30_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_30_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_30_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_30_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_30_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_30_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_30_DFI_RST_N_BUF : out std_ulogic;
    AXI_30_MC_STATUS     : out std_logic_vector(5 downto 0);
    AXI_30_PHY_STATUS    : out std_logic_vector(7 downto 0);
    AXI_30_RDATA         : out std_logic_vector(255 downto 0);
    AXI_30_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_30_RID           : out std_logic_vector(5 downto 0);
    AXI_30_RLAST         : out std_ulogic;
    AXI_30_RRESP         : out std_logic_vector(1 downto 0);
    AXI_30_RVALID        : out std_ulogic;
    AXI_30_WREADY        : out std_ulogic;
    AXI_31_ARREADY       : out std_ulogic;
    AXI_31_AWREADY       : out std_ulogic;
    AXI_31_BID           : out std_logic_vector(5 downto 0);
    AXI_31_BRESP         : out std_logic_vector(1 downto 0);
    AXI_31_BVALID        : out std_ulogic;
    AXI_31_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
    AXI_31_DFI_CLK_BUF   : out std_ulogic;
    AXI_31_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
    AXI_31_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
    AXI_31_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
    AXI_31_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
    AXI_31_DFI_INIT_COMPLETE : out std_ulogic;
    AXI_31_DFI_PHYUPD_REQ : out std_ulogic;
    AXI_31_DFI_PHY_LP_STATE : out std_ulogic;
    AXI_31_DFI_RST_N_BUF : out std_ulogic;
    AXI_31_RDATA         : out std_logic_vector(255 downto 0);
    AXI_31_RDATA_PARITY  : out std_logic_vector(31 downto 0);
    AXI_31_RID           : out std_logic_vector(5 downto 0);
    AXI_31_RLAST         : out std_ulogic;
    AXI_31_RRESP         : out std_logic_vector(1 downto 0);
    AXI_31_RVALID        : out std_ulogic;
    AXI_31_WREADY        : out std_ulogic;
    DRAM_0_STAT_CATTRIP  : out std_ulogic;
    DRAM_0_STAT_TEMP     : out std_logic_vector(2 downto 0);
    DRAM_1_STAT_CATTRIP  : out std_ulogic;
    DRAM_1_STAT_TEMP     : out std_logic_vector(2 downto 0);
    APB_0_PADDR          : in std_logic_vector(21 downto 0);
    APB_0_PCLK           : in std_ulogic;
    APB_0_PENABLE        : in std_ulogic;
    APB_0_PRESET_N       : in std_ulogic;
    APB_0_PSEL           : in std_ulogic;
    APB_0_PWDATA         : in std_logic_vector(31 downto 0);
    APB_0_PWRITE         : in std_ulogic;
    APB_1_PADDR          : in std_logic_vector(21 downto 0);
    APB_1_PCLK           : in std_ulogic;
    APB_1_PENABLE        : in std_ulogic;
    APB_1_PRESET_N       : in std_ulogic;
    APB_1_PSEL           : in std_ulogic;
    APB_1_PWDATA         : in std_logic_vector(31 downto 0);
    APB_1_PWRITE         : in std_ulogic;
    AXI_00_ACLK          : in std_ulogic;
    AXI_00_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_00_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_00_ARESET_N      : in std_ulogic;
    AXI_00_ARID          : in std_logic_vector(5 downto 0);
    AXI_00_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_00_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_00_ARVALID       : in std_ulogic;
    AXI_00_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_00_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_00_AWID          : in std_logic_vector(5 downto 0);
    AXI_00_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_00_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_00_AWVALID       : in std_ulogic;
    AXI_00_BREADY        : in std_ulogic;
    AXI_00_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_00_RREADY        : in std_ulogic;
    AXI_00_WDATA         : in std_logic_vector(255 downto 0);
    AXI_00_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_00_WLAST         : in std_ulogic;
    AXI_00_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_00_WVALID        : in std_ulogic;
    AXI_01_ACLK          : in std_ulogic;
    AXI_01_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_01_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_01_ARESET_N      : in std_ulogic;
    AXI_01_ARID          : in std_logic_vector(5 downto 0);
    AXI_01_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_01_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_01_ARVALID       : in std_ulogic;
    AXI_01_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_01_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_01_AWID          : in std_logic_vector(5 downto 0);
    AXI_01_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_01_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_01_AWVALID       : in std_ulogic;
    AXI_01_BREADY        : in std_ulogic;
    AXI_01_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_01_RREADY        : in std_ulogic;
    AXI_01_WDATA         : in std_logic_vector(255 downto 0);
    AXI_01_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_01_WLAST         : in std_ulogic;
    AXI_01_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_01_WVALID        : in std_ulogic;
    AXI_02_ACLK          : in std_ulogic;
    AXI_02_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_02_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_02_ARESET_N      : in std_ulogic;
    AXI_02_ARID          : in std_logic_vector(5 downto 0);
    AXI_02_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_02_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_02_ARVALID       : in std_ulogic;
    AXI_02_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_02_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_02_AWID          : in std_logic_vector(5 downto 0);
    AXI_02_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_02_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_02_AWVALID       : in std_ulogic;
    AXI_02_BREADY        : in std_ulogic;
    AXI_02_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_02_RREADY        : in std_ulogic;
    AXI_02_WDATA         : in std_logic_vector(255 downto 0);
    AXI_02_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_02_WLAST         : in std_ulogic;
    AXI_02_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_02_WVALID        : in std_ulogic;
    AXI_03_ACLK          : in std_ulogic;
    AXI_03_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_03_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_03_ARESET_N      : in std_ulogic;
    AXI_03_ARID          : in std_logic_vector(5 downto 0);
    AXI_03_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_03_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_03_ARVALID       : in std_ulogic;
    AXI_03_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_03_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_03_AWID          : in std_logic_vector(5 downto 0);
    AXI_03_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_03_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_03_AWVALID       : in std_ulogic;
    AXI_03_BREADY        : in std_ulogic;
    AXI_03_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_03_RREADY        : in std_ulogic;
    AXI_03_WDATA         : in std_logic_vector(255 downto 0);
    AXI_03_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_03_WLAST         : in std_ulogic;
    AXI_03_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_03_WVALID        : in std_ulogic;
    AXI_04_ACLK          : in std_ulogic;
    AXI_04_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_04_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_04_ARESET_N      : in std_ulogic;
    AXI_04_ARID          : in std_logic_vector(5 downto 0);
    AXI_04_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_04_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_04_ARVALID       : in std_ulogic;
    AXI_04_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_04_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_04_AWID          : in std_logic_vector(5 downto 0);
    AXI_04_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_04_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_04_AWVALID       : in std_ulogic;
    AXI_04_BREADY        : in std_ulogic;
    AXI_04_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_04_RREADY        : in std_ulogic;
    AXI_04_WDATA         : in std_logic_vector(255 downto 0);
    AXI_04_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_04_WLAST         : in std_ulogic;
    AXI_04_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_04_WVALID        : in std_ulogic;
    AXI_05_ACLK          : in std_ulogic;
    AXI_05_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_05_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_05_ARESET_N      : in std_ulogic;
    AXI_05_ARID          : in std_logic_vector(5 downto 0);
    AXI_05_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_05_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_05_ARVALID       : in std_ulogic;
    AXI_05_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_05_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_05_AWID          : in std_logic_vector(5 downto 0);
    AXI_05_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_05_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_05_AWVALID       : in std_ulogic;
    AXI_05_BREADY        : in std_ulogic;
    AXI_05_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_05_RREADY        : in std_ulogic;
    AXI_05_WDATA         : in std_logic_vector(255 downto 0);
    AXI_05_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_05_WLAST         : in std_ulogic;
    AXI_05_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_05_WVALID        : in std_ulogic;
    AXI_06_ACLK          : in std_ulogic;
    AXI_06_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_06_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_06_ARESET_N      : in std_ulogic;
    AXI_06_ARID          : in std_logic_vector(5 downto 0);
    AXI_06_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_06_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_06_ARVALID       : in std_ulogic;
    AXI_06_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_06_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_06_AWID          : in std_logic_vector(5 downto 0);
    AXI_06_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_06_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_06_AWVALID       : in std_ulogic;
    AXI_06_BREADY        : in std_ulogic;
    AXI_06_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_06_RREADY        : in std_ulogic;
    AXI_06_WDATA         : in std_logic_vector(255 downto 0);
    AXI_06_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_06_WLAST         : in std_ulogic;
    AXI_06_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_06_WVALID        : in std_ulogic;
    AXI_07_ACLK          : in std_ulogic;
    AXI_07_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_07_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_07_ARESET_N      : in std_ulogic;
    AXI_07_ARID          : in std_logic_vector(5 downto 0);
    AXI_07_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_07_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_07_ARVALID       : in std_ulogic;
    AXI_07_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_07_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_07_AWID          : in std_logic_vector(5 downto 0);
    AXI_07_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_07_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_07_AWVALID       : in std_ulogic;
    AXI_07_BREADY        : in std_ulogic;
    AXI_07_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_07_RREADY        : in std_ulogic;
    AXI_07_WDATA         : in std_logic_vector(255 downto 0);
    AXI_07_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_07_WLAST         : in std_ulogic;
    AXI_07_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_07_WVALID        : in std_ulogic;
    AXI_08_ACLK          : in std_ulogic;
    AXI_08_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_08_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_08_ARESET_N      : in std_ulogic;
    AXI_08_ARID          : in std_logic_vector(5 downto 0);
    AXI_08_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_08_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_08_ARVALID       : in std_ulogic;
    AXI_08_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_08_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_08_AWID          : in std_logic_vector(5 downto 0);
    AXI_08_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_08_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_08_AWVALID       : in std_ulogic;
    AXI_08_BREADY        : in std_ulogic;
    AXI_08_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_08_RREADY        : in std_ulogic;
    AXI_08_WDATA         : in std_logic_vector(255 downto 0);
    AXI_08_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_08_WLAST         : in std_ulogic;
    AXI_08_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_08_WVALID        : in std_ulogic;
    AXI_09_ACLK          : in std_ulogic;
    AXI_09_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_09_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_09_ARESET_N      : in std_ulogic;
    AXI_09_ARID          : in std_logic_vector(5 downto 0);
    AXI_09_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_09_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_09_ARVALID       : in std_ulogic;
    AXI_09_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_09_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_09_AWID          : in std_logic_vector(5 downto 0);
    AXI_09_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_09_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_09_AWVALID       : in std_ulogic;
    AXI_09_BREADY        : in std_ulogic;
    AXI_09_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_09_RREADY        : in std_ulogic;
    AXI_09_WDATA         : in std_logic_vector(255 downto 0);
    AXI_09_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_09_WLAST         : in std_ulogic;
    AXI_09_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_09_WVALID        : in std_ulogic;
    AXI_10_ACLK          : in std_ulogic;
    AXI_10_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_10_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_10_ARESET_N      : in std_ulogic;
    AXI_10_ARID          : in std_logic_vector(5 downto 0);
    AXI_10_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_10_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_10_ARVALID       : in std_ulogic;
    AXI_10_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_10_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_10_AWID          : in std_logic_vector(5 downto 0);
    AXI_10_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_10_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_10_AWVALID       : in std_ulogic;
    AXI_10_BREADY        : in std_ulogic;
    AXI_10_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_10_RREADY        : in std_ulogic;
    AXI_10_WDATA         : in std_logic_vector(255 downto 0);
    AXI_10_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_10_WLAST         : in std_ulogic;
    AXI_10_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_10_WVALID        : in std_ulogic;
    AXI_11_ACLK          : in std_ulogic;
    AXI_11_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_11_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_11_ARESET_N      : in std_ulogic;
    AXI_11_ARID          : in std_logic_vector(5 downto 0);
    AXI_11_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_11_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_11_ARVALID       : in std_ulogic;
    AXI_11_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_11_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_11_AWID          : in std_logic_vector(5 downto 0);
    AXI_11_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_11_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_11_AWVALID       : in std_ulogic;
    AXI_11_BREADY        : in std_ulogic;
    AXI_11_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_11_RREADY        : in std_ulogic;
    AXI_11_WDATA         : in std_logic_vector(255 downto 0);
    AXI_11_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_11_WLAST         : in std_ulogic;
    AXI_11_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_11_WVALID        : in std_ulogic;
    AXI_12_ACLK          : in std_ulogic;
    AXI_12_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_12_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_12_ARESET_N      : in std_ulogic;
    AXI_12_ARID          : in std_logic_vector(5 downto 0);
    AXI_12_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_12_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_12_ARVALID       : in std_ulogic;
    AXI_12_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_12_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_12_AWID          : in std_logic_vector(5 downto 0);
    AXI_12_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_12_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_12_AWVALID       : in std_ulogic;
    AXI_12_BREADY        : in std_ulogic;
    AXI_12_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_12_RREADY        : in std_ulogic;
    AXI_12_WDATA         : in std_logic_vector(255 downto 0);
    AXI_12_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_12_WLAST         : in std_ulogic;
    AXI_12_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_12_WVALID        : in std_ulogic;
    AXI_13_ACLK          : in std_ulogic;
    AXI_13_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_13_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_13_ARESET_N      : in std_ulogic;
    AXI_13_ARID          : in std_logic_vector(5 downto 0);
    AXI_13_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_13_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_13_ARVALID       : in std_ulogic;
    AXI_13_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_13_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_13_AWID          : in std_logic_vector(5 downto 0);
    AXI_13_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_13_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_13_AWVALID       : in std_ulogic;
    AXI_13_BREADY        : in std_ulogic;
    AXI_13_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_13_RREADY        : in std_ulogic;
    AXI_13_WDATA         : in std_logic_vector(255 downto 0);
    AXI_13_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_13_WLAST         : in std_ulogic;
    AXI_13_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_13_WVALID        : in std_ulogic;
    AXI_14_ACLK          : in std_ulogic;
    AXI_14_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_14_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_14_ARESET_N      : in std_ulogic;
    AXI_14_ARID          : in std_logic_vector(5 downto 0);
    AXI_14_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_14_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_14_ARVALID       : in std_ulogic;
    AXI_14_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_14_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_14_AWID          : in std_logic_vector(5 downto 0);
    AXI_14_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_14_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_14_AWVALID       : in std_ulogic;
    AXI_14_BREADY        : in std_ulogic;
    AXI_14_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_14_RREADY        : in std_ulogic;
    AXI_14_WDATA         : in std_logic_vector(255 downto 0);
    AXI_14_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_14_WLAST         : in std_ulogic;
    AXI_14_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_14_WVALID        : in std_ulogic;
    AXI_15_ACLK          : in std_ulogic;
    AXI_15_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_15_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_15_ARESET_N      : in std_ulogic;
    AXI_15_ARID          : in std_logic_vector(5 downto 0);
    AXI_15_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_15_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_15_ARVALID       : in std_ulogic;
    AXI_15_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_15_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_15_AWID          : in std_logic_vector(5 downto 0);
    AXI_15_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_15_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_15_AWVALID       : in std_ulogic;
    AXI_15_BREADY        : in std_ulogic;
    AXI_15_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_15_RREADY        : in std_ulogic;
    AXI_15_WDATA         : in std_logic_vector(255 downto 0);
    AXI_15_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_15_WLAST         : in std_ulogic;
    AXI_15_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_15_WVALID        : in std_ulogic;
    AXI_16_ACLK          : in std_ulogic;
    AXI_16_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_16_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_16_ARESET_N      : in std_ulogic;
    AXI_16_ARID          : in std_logic_vector(5 downto 0);
    AXI_16_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_16_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_16_ARVALID       : in std_ulogic;
    AXI_16_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_16_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_16_AWID          : in std_logic_vector(5 downto 0);
    AXI_16_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_16_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_16_AWVALID       : in std_ulogic;
    AXI_16_BREADY        : in std_ulogic;
    AXI_16_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_16_RREADY        : in std_ulogic;
    AXI_16_WDATA         : in std_logic_vector(255 downto 0);
    AXI_16_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_16_WLAST         : in std_ulogic;
    AXI_16_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_16_WVALID        : in std_ulogic;
    AXI_17_ACLK          : in std_ulogic;
    AXI_17_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_17_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_17_ARESET_N      : in std_ulogic;
    AXI_17_ARID          : in std_logic_vector(5 downto 0);
    AXI_17_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_17_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_17_ARVALID       : in std_ulogic;
    AXI_17_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_17_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_17_AWID          : in std_logic_vector(5 downto 0);
    AXI_17_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_17_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_17_AWVALID       : in std_ulogic;
    AXI_17_BREADY        : in std_ulogic;
    AXI_17_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_17_RREADY        : in std_ulogic;
    AXI_17_WDATA         : in std_logic_vector(255 downto 0);
    AXI_17_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_17_WLAST         : in std_ulogic;
    AXI_17_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_17_WVALID        : in std_ulogic;
    AXI_18_ACLK          : in std_ulogic;
    AXI_18_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_18_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_18_ARESET_N      : in std_ulogic;
    AXI_18_ARID          : in std_logic_vector(5 downto 0);
    AXI_18_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_18_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_18_ARVALID       : in std_ulogic;
    AXI_18_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_18_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_18_AWID          : in std_logic_vector(5 downto 0);
    AXI_18_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_18_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_18_AWVALID       : in std_ulogic;
    AXI_18_BREADY        : in std_ulogic;
    AXI_18_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_18_RREADY        : in std_ulogic;
    AXI_18_WDATA         : in std_logic_vector(255 downto 0);
    AXI_18_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_18_WLAST         : in std_ulogic;
    AXI_18_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_18_WVALID        : in std_ulogic;
    AXI_19_ACLK          : in std_ulogic;
    AXI_19_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_19_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_19_ARESET_N      : in std_ulogic;
    AXI_19_ARID          : in std_logic_vector(5 downto 0);
    AXI_19_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_19_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_19_ARVALID       : in std_ulogic;
    AXI_19_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_19_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_19_AWID          : in std_logic_vector(5 downto 0);
    AXI_19_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_19_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_19_AWVALID       : in std_ulogic;
    AXI_19_BREADY        : in std_ulogic;
    AXI_19_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_19_RREADY        : in std_ulogic;
    AXI_19_WDATA         : in std_logic_vector(255 downto 0);
    AXI_19_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_19_WLAST         : in std_ulogic;
    AXI_19_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_19_WVALID        : in std_ulogic;
    AXI_20_ACLK          : in std_ulogic;
    AXI_20_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_20_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_20_ARESET_N      : in std_ulogic;
    AXI_20_ARID          : in std_logic_vector(5 downto 0);
    AXI_20_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_20_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_20_ARVALID       : in std_ulogic;
    AXI_20_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_20_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_20_AWID          : in std_logic_vector(5 downto 0);
    AXI_20_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_20_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_20_AWVALID       : in std_ulogic;
    AXI_20_BREADY        : in std_ulogic;
    AXI_20_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_20_RREADY        : in std_ulogic;
    AXI_20_WDATA         : in std_logic_vector(255 downto 0);
    AXI_20_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_20_WLAST         : in std_ulogic;
    AXI_20_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_20_WVALID        : in std_ulogic;
    AXI_21_ACLK          : in std_ulogic;
    AXI_21_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_21_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_21_ARESET_N      : in std_ulogic;
    AXI_21_ARID          : in std_logic_vector(5 downto 0);
    AXI_21_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_21_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_21_ARVALID       : in std_ulogic;
    AXI_21_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_21_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_21_AWID          : in std_logic_vector(5 downto 0);
    AXI_21_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_21_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_21_AWVALID       : in std_ulogic;
    AXI_21_BREADY        : in std_ulogic;
    AXI_21_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_21_RREADY        : in std_ulogic;
    AXI_21_WDATA         : in std_logic_vector(255 downto 0);
    AXI_21_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_21_WLAST         : in std_ulogic;
    AXI_21_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_21_WVALID        : in std_ulogic;
    AXI_22_ACLK          : in std_ulogic;
    AXI_22_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_22_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_22_ARESET_N      : in std_ulogic;
    AXI_22_ARID          : in std_logic_vector(5 downto 0);
    AXI_22_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_22_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_22_ARVALID       : in std_ulogic;
    AXI_22_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_22_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_22_AWID          : in std_logic_vector(5 downto 0);
    AXI_22_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_22_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_22_AWVALID       : in std_ulogic;
    AXI_22_BREADY        : in std_ulogic;
    AXI_22_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_22_RREADY        : in std_ulogic;
    AXI_22_WDATA         : in std_logic_vector(255 downto 0);
    AXI_22_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_22_WLAST         : in std_ulogic;
    AXI_22_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_22_WVALID        : in std_ulogic;
    AXI_23_ACLK          : in std_ulogic;
    AXI_23_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_23_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_23_ARESET_N      : in std_ulogic;
    AXI_23_ARID          : in std_logic_vector(5 downto 0);
    AXI_23_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_23_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_23_ARVALID       : in std_ulogic;
    AXI_23_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_23_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_23_AWID          : in std_logic_vector(5 downto 0);
    AXI_23_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_23_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_23_AWVALID       : in std_ulogic;
    AXI_23_BREADY        : in std_ulogic;
    AXI_23_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_23_RREADY        : in std_ulogic;
    AXI_23_WDATA         : in std_logic_vector(255 downto 0);
    AXI_23_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_23_WLAST         : in std_ulogic;
    AXI_23_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_23_WVALID        : in std_ulogic;
    AXI_24_ACLK          : in std_ulogic;
    AXI_24_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_24_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_24_ARESET_N      : in std_ulogic;
    AXI_24_ARID          : in std_logic_vector(5 downto 0);
    AXI_24_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_24_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_24_ARVALID       : in std_ulogic;
    AXI_24_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_24_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_24_AWID          : in std_logic_vector(5 downto 0);
    AXI_24_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_24_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_24_AWVALID       : in std_ulogic;
    AXI_24_BREADY        : in std_ulogic;
    AXI_24_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_24_RREADY        : in std_ulogic;
    AXI_24_WDATA         : in std_logic_vector(255 downto 0);
    AXI_24_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_24_WLAST         : in std_ulogic;
    AXI_24_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_24_WVALID        : in std_ulogic;
    AXI_25_ACLK          : in std_ulogic;
    AXI_25_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_25_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_25_ARESET_N      : in std_ulogic;
    AXI_25_ARID          : in std_logic_vector(5 downto 0);
    AXI_25_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_25_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_25_ARVALID       : in std_ulogic;
    AXI_25_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_25_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_25_AWID          : in std_logic_vector(5 downto 0);
    AXI_25_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_25_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_25_AWVALID       : in std_ulogic;
    AXI_25_BREADY        : in std_ulogic;
    AXI_25_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_25_RREADY        : in std_ulogic;
    AXI_25_WDATA         : in std_logic_vector(255 downto 0);
    AXI_25_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_25_WLAST         : in std_ulogic;
    AXI_25_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_25_WVALID        : in std_ulogic;
    AXI_26_ACLK          : in std_ulogic;
    AXI_26_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_26_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_26_ARESET_N      : in std_ulogic;
    AXI_26_ARID          : in std_logic_vector(5 downto 0);
    AXI_26_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_26_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_26_ARVALID       : in std_ulogic;
    AXI_26_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_26_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_26_AWID          : in std_logic_vector(5 downto 0);
    AXI_26_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_26_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_26_AWVALID       : in std_ulogic;
    AXI_26_BREADY        : in std_ulogic;
    AXI_26_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_26_RREADY        : in std_ulogic;
    AXI_26_WDATA         : in std_logic_vector(255 downto 0);
    AXI_26_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_26_WLAST         : in std_ulogic;
    AXI_26_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_26_WVALID        : in std_ulogic;
    AXI_27_ACLK          : in std_ulogic;
    AXI_27_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_27_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_27_ARESET_N      : in std_ulogic;
    AXI_27_ARID          : in std_logic_vector(5 downto 0);
    AXI_27_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_27_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_27_ARVALID       : in std_ulogic;
    AXI_27_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_27_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_27_AWID          : in std_logic_vector(5 downto 0);
    AXI_27_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_27_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_27_AWVALID       : in std_ulogic;
    AXI_27_BREADY        : in std_ulogic;
    AXI_27_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_27_RREADY        : in std_ulogic;
    AXI_27_WDATA         : in std_logic_vector(255 downto 0);
    AXI_27_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_27_WLAST         : in std_ulogic;
    AXI_27_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_27_WVALID        : in std_ulogic;
    AXI_28_ACLK          : in std_ulogic;
    AXI_28_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_28_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_28_ARESET_N      : in std_ulogic;
    AXI_28_ARID          : in std_logic_vector(5 downto 0);
    AXI_28_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_28_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_28_ARVALID       : in std_ulogic;
    AXI_28_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_28_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_28_AWID          : in std_logic_vector(5 downto 0);
    AXI_28_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_28_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_28_AWVALID       : in std_ulogic;
    AXI_28_BREADY        : in std_ulogic;
    AXI_28_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_28_RREADY        : in std_ulogic;
    AXI_28_WDATA         : in std_logic_vector(255 downto 0);
    AXI_28_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_28_WLAST         : in std_ulogic;
    AXI_28_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_28_WVALID        : in std_ulogic;
    AXI_29_ACLK          : in std_ulogic;
    AXI_29_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_29_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_29_ARESET_N      : in std_ulogic;
    AXI_29_ARID          : in std_logic_vector(5 downto 0);
    AXI_29_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_29_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_29_ARVALID       : in std_ulogic;
    AXI_29_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_29_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_29_AWID          : in std_logic_vector(5 downto 0);
    AXI_29_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_29_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_29_AWVALID       : in std_ulogic;
    AXI_29_BREADY        : in std_ulogic;
    AXI_29_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_29_RREADY        : in std_ulogic;
    AXI_29_WDATA         : in std_logic_vector(255 downto 0);
    AXI_29_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_29_WLAST         : in std_ulogic;
    AXI_29_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_29_WVALID        : in std_ulogic;
    AXI_30_ACLK          : in std_ulogic;
    AXI_30_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_30_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_30_ARESET_N      : in std_ulogic;
    AXI_30_ARID          : in std_logic_vector(5 downto 0);
    AXI_30_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_30_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_30_ARVALID       : in std_ulogic;
    AXI_30_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_30_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_30_AWID          : in std_logic_vector(5 downto 0);
    AXI_30_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_30_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_30_AWVALID       : in std_ulogic;
    AXI_30_BREADY        : in std_ulogic;
    AXI_30_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_30_RREADY        : in std_ulogic;
    AXI_30_WDATA         : in std_logic_vector(255 downto 0);
    AXI_30_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_30_WLAST         : in std_ulogic;
    AXI_30_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_30_WVALID        : in std_ulogic;
    AXI_31_ACLK          : in std_ulogic;
    AXI_31_ARADDR        : in std_logic_vector(36 downto 0);
    AXI_31_ARBURST       : in std_logic_vector(1 downto 0);
    AXI_31_ARESET_N      : in std_ulogic;
    AXI_31_ARID          : in std_logic_vector(5 downto 0);
    AXI_31_ARLEN         : in std_logic_vector(3 downto 0);
    AXI_31_ARSIZE        : in std_logic_vector(2 downto 0);
    AXI_31_ARVALID       : in std_ulogic;
    AXI_31_AWADDR        : in std_logic_vector(36 downto 0);
    AXI_31_AWBURST       : in std_logic_vector(1 downto 0);
    AXI_31_AWID          : in std_logic_vector(5 downto 0);
    AXI_31_AWLEN         : in std_logic_vector(3 downto 0);
    AXI_31_AWSIZE        : in std_logic_vector(2 downto 0);
    AXI_31_AWVALID       : in std_ulogic;
    AXI_31_BREADY        : in std_ulogic;
    AXI_31_DFI_LP_PWR_X_REQ : in std_ulogic;
    AXI_31_RREADY        : in std_ulogic;
    AXI_31_WDATA         : in std_logic_vector(255 downto 0);
    AXI_31_WDATA_PARITY  : in std_logic_vector(31 downto 0);
    AXI_31_WLAST         : in std_ulogic;
    AXI_31_WSTRB         : in std_logic_vector(31 downto 0);
    AXI_31_WVALID        : in std_ulogic;
    BSCAN_DRCK_0         : in std_ulogic;
    BSCAN_DRCK_1         : in std_ulogic;
    BSCAN_TCK_0          : in std_ulogic;
    BSCAN_TCK_1          : in std_ulogic;
    HBM_REF_CLK_0        : in std_ulogic;
    HBM_REF_CLK_1        : in std_ulogic;
    MBIST_EN_00          : in std_ulogic;
    MBIST_EN_01          : in std_ulogic;
    MBIST_EN_02          : in std_ulogic;
    MBIST_EN_03          : in std_ulogic;
    MBIST_EN_04          : in std_ulogic;
    MBIST_EN_05          : in std_ulogic;
    MBIST_EN_06          : in std_ulogic;
    MBIST_EN_07          : in std_ulogic;
    MBIST_EN_08          : in std_ulogic;
    MBIST_EN_09          : in std_ulogic;
    MBIST_EN_10          : in std_ulogic;
    MBIST_EN_11          : in std_ulogic;
    MBIST_EN_12          : in std_ulogic;
    MBIST_EN_13          : in std_ulogic;
    MBIST_EN_14          : in std_ulogic;
    MBIST_EN_15          : in std_ulogic
  );
end HBM_TWO_STACK_INTF;

architecture HBM_TWO_STACK_INTF_V of HBM_TWO_STACK_INTF is
  component SIP_HBM_TWO_STACK_INTF
    port (
      ANALOG_MUX_SEL_0     : in std_logic_vector(7 downto 0);
      ANALOG_MUX_SEL_1     : in std_logic_vector(7 downto 0);
      APB_BYPASS_EN_0      : in std_logic_vector(39 downto 0);
      APB_BYPASS_EN_1      : in std_logic_vector(39 downto 0);
      AXI_BYPASS_EN_0      : in std_logic_vector(39 downto 0);
      AXI_BYPASS_EN_1      : in std_logic_vector(39 downto 0);
      BLI_TESTMODE_SEL_0   : in std_logic_vector(39 downto 0);
      BLI_TESTMODE_SEL_1   : in std_logic_vector(39 downto 0);
      CLK_SEL_00           : in std_logic_vector(39 downto 0);
      CLK_SEL_01           : in std_logic_vector(39 downto 0);
      CLK_SEL_02           : in std_logic_vector(39 downto 0);
      CLK_SEL_03           : in std_logic_vector(39 downto 0);
      CLK_SEL_04           : in std_logic_vector(39 downto 0);
      CLK_SEL_05           : in std_logic_vector(39 downto 0);
      CLK_SEL_06           : in std_logic_vector(39 downto 0);
      CLK_SEL_07           : in std_logic_vector(39 downto 0);
      CLK_SEL_08           : in std_logic_vector(39 downto 0);
      CLK_SEL_09           : in std_logic_vector(39 downto 0);
      CLK_SEL_10           : in std_logic_vector(39 downto 0);
      CLK_SEL_11           : in std_logic_vector(39 downto 0);
      CLK_SEL_12           : in std_logic_vector(39 downto 0);
      CLK_SEL_13           : in std_logic_vector(39 downto 0);
      CLK_SEL_14           : in std_logic_vector(39 downto 0);
      CLK_SEL_15           : in std_logic_vector(39 downto 0);
      CLK_SEL_16           : in std_logic_vector(39 downto 0);
      CLK_SEL_17           : in std_logic_vector(39 downto 0);
      CLK_SEL_18           : in std_logic_vector(39 downto 0);
      CLK_SEL_19           : in std_logic_vector(39 downto 0);
      CLK_SEL_20           : in std_logic_vector(39 downto 0);
      CLK_SEL_21           : in std_logic_vector(39 downto 0);
      CLK_SEL_22           : in std_logic_vector(39 downto 0);
      CLK_SEL_23           : in std_logic_vector(39 downto 0);
      CLK_SEL_24           : in std_logic_vector(39 downto 0);
      CLK_SEL_25           : in std_logic_vector(39 downto 0);
      CLK_SEL_26           : in std_logic_vector(39 downto 0);
      CLK_SEL_27           : in std_logic_vector(39 downto 0);
      CLK_SEL_28           : in std_logic_vector(39 downto 0);
      CLK_SEL_29           : in std_logic_vector(39 downto 0);
      CLK_SEL_30           : in std_logic_vector(39 downto 0);
      CLK_SEL_31           : in std_logic_vector(39 downto 0);
      DATARATE_00          : in std_logic_vector(10 downto 0);
      DATARATE_01          : in std_logic_vector(10 downto 0);
      DATARATE_02          : in std_logic_vector(10 downto 0);
      DATARATE_03          : in std_logic_vector(10 downto 0);
      DATARATE_04          : in std_logic_vector(10 downto 0);
      DATARATE_05          : in std_logic_vector(10 downto 0);
      DATARATE_06          : in std_logic_vector(10 downto 0);
      DATARATE_07          : in std_logic_vector(10 downto 0);
      DATARATE_08          : in std_logic_vector(10 downto 0);
      DATARATE_09          : in std_logic_vector(10 downto 0);
      DATARATE_10          : in std_logic_vector(10 downto 0);
      DATARATE_11          : in std_logic_vector(10 downto 0);
      DATARATE_12          : in std_logic_vector(10 downto 0);
      DATARATE_13          : in std_logic_vector(10 downto 0);
      DATARATE_14          : in std_logic_vector(10 downto 0);
      DATARATE_15          : in std_logic_vector(10 downto 0);
      DA_LOCKOUT_0         : in std_logic_vector(39 downto 0);
      DA_LOCKOUT_1         : in std_logic_vector(39 downto 0);
      DBG_BYPASS_VAL_0     : in std_logic_vector(51 downto 0);
      DBG_BYPASS_VAL_1     : in std_logic_vector(51 downto 0);
      DEBUG_MODE_0         : in std_logic_vector(39 downto 0);
      DEBUG_MODE_1         : in std_logic_vector(39 downto 0);
      DFI_BYPASS_VAL_0     : in std_logic_vector(51 downto 0);
      DFI_BYPASS_VAL_1     : in std_logic_vector(51 downto 0);
      DLL_TESTMODE_SEL_0   : in std_logic_vector(39 downto 0);
      DLL_TESTMODE_SEL_1   : in std_logic_vector(39 downto 0);
      IO_TESTMODE_SEL_0    : in std_logic_vector(39 downto 0);
      IO_TESTMODE_SEL_1    : in std_logic_vector(39 downto 0);
      IS_APB_0_PCLK_INVERTED : in std_ulogic;
      IS_APB_0_PRESET_N_INVERTED : in std_ulogic;
      IS_APB_1_PCLK_INVERTED : in std_ulogic;
      IS_APB_1_PRESET_N_INVERTED : in std_ulogic;
      IS_AXI_00_ACLK_INVERTED : in std_ulogic;
      IS_AXI_00_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_01_ACLK_INVERTED : in std_ulogic;
      IS_AXI_01_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_02_ACLK_INVERTED : in std_ulogic;
      IS_AXI_02_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_03_ACLK_INVERTED : in std_ulogic;
      IS_AXI_03_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_04_ACLK_INVERTED : in std_ulogic;
      IS_AXI_04_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_05_ACLK_INVERTED : in std_ulogic;
      IS_AXI_05_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_06_ACLK_INVERTED : in std_ulogic;
      IS_AXI_06_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_07_ACLK_INVERTED : in std_ulogic;
      IS_AXI_07_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_08_ACLK_INVERTED : in std_ulogic;
      IS_AXI_08_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_09_ACLK_INVERTED : in std_ulogic;
      IS_AXI_09_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_10_ACLK_INVERTED : in std_ulogic;
      IS_AXI_10_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_11_ACLK_INVERTED : in std_ulogic;
      IS_AXI_11_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_12_ACLK_INVERTED : in std_ulogic;
      IS_AXI_12_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_13_ACLK_INVERTED : in std_ulogic;
      IS_AXI_13_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_14_ACLK_INVERTED : in std_ulogic;
      IS_AXI_14_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_15_ACLK_INVERTED : in std_ulogic;
      IS_AXI_15_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_16_ACLK_INVERTED : in std_ulogic;
      IS_AXI_16_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_17_ACLK_INVERTED : in std_ulogic;
      IS_AXI_17_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_18_ACLK_INVERTED : in std_ulogic;
      IS_AXI_18_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_19_ACLK_INVERTED : in std_ulogic;
      IS_AXI_19_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_20_ACLK_INVERTED : in std_ulogic;
      IS_AXI_20_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_21_ACLK_INVERTED : in std_ulogic;
      IS_AXI_21_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_22_ACLK_INVERTED : in std_ulogic;
      IS_AXI_22_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_23_ACLK_INVERTED : in std_ulogic;
      IS_AXI_23_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_24_ACLK_INVERTED : in std_ulogic;
      IS_AXI_24_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_25_ACLK_INVERTED : in std_ulogic;
      IS_AXI_25_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_26_ACLK_INVERTED : in std_ulogic;
      IS_AXI_26_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_27_ACLK_INVERTED : in std_ulogic;
      IS_AXI_27_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_28_ACLK_INVERTED : in std_ulogic;
      IS_AXI_28_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_29_ACLK_INVERTED : in std_ulogic;
      IS_AXI_29_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_30_ACLK_INVERTED : in std_ulogic;
      IS_AXI_30_ARESET_N_INVERTED : in std_ulogic;
      IS_AXI_31_ACLK_INVERTED : in std_ulogic;
      IS_AXI_31_ARESET_N_INVERTED : in std_ulogic;
      MC_CSSD_SEL_0        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_1        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_10       : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_11       : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_12       : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_13       : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_14       : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_15       : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_2        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_3        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_4        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_5        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_6        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_7        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_8        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_9        : in std_logic_vector(39 downto 0);
      MC_ENABLE_00         : in std_logic_vector(39 downto 0);
      MC_ENABLE_01         : in std_logic_vector(39 downto 0);
      MC_ENABLE_02         : in std_logic_vector(39 downto 0);
      MC_ENABLE_03         : in std_logic_vector(39 downto 0);
      MC_ENABLE_04         : in std_logic_vector(39 downto 0);
      MC_ENABLE_05         : in std_logic_vector(39 downto 0);
      MC_ENABLE_06         : in std_logic_vector(39 downto 0);
      MC_ENABLE_07         : in std_logic_vector(39 downto 0);
      MC_ENABLE_08         : in std_logic_vector(39 downto 0);
      MC_ENABLE_09         : in std_logic_vector(39 downto 0);
      MC_ENABLE_10         : in std_logic_vector(39 downto 0);
      MC_ENABLE_11         : in std_logic_vector(39 downto 0);
      MC_ENABLE_12         : in std_logic_vector(39 downto 0);
      MC_ENABLE_13         : in std_logic_vector(39 downto 0);
      MC_ENABLE_14         : in std_logic_vector(39 downto 0);
      MC_ENABLE_15         : in std_logic_vector(39 downto 0);
      MC_ENABLE_APB_00     : in std_logic_vector(39 downto 0);
      MC_ENABLE_APB_01     : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_0    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_1    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_10   : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_11   : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_12   : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_13   : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_14   : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_15   : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_2    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_3    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_4    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_5    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_6    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_7    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_8    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_9    : in std_logic_vector(39 downto 0);
      PAGEHIT_PERCENT_00   : in std_logic_vector(6 downto 0);
      PAGEHIT_PERCENT_01   : in std_logic_vector(6 downto 0);
      PHY_CSSD_SEL_0       : in std_logic_vector(39 downto 0);
      PHY_CSSD_SEL_1       : in std_logic_vector(39 downto 0);
      PHY_ENABLE_00        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_01        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_02        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_03        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_04        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_05        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_06        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_07        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_08        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_09        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_10        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_11        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_12        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_13        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_14        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_15        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_16        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_17        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_18        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_19        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_20        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_21        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_22        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_23        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_24        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_25        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_26        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_27        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_28        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_29        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_30        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_31        : in std_logic_vector(39 downto 0);
      PHY_ENABLE_APB_00    : in std_logic_vector(39 downto 0);
      PHY_ENABLE_APB_01    : in std_logic_vector(39 downto 0);
      PHY_PCLK_INVERT_01   : in std_logic_vector(39 downto 0);
      PHY_PCLK_INVERT_02   : in std_logic_vector(39 downto 0);
      PHY_TESTMODE_SEL_0   : in std_logic_vector(39 downto 0);
      PHY_TESTMODE_SEL_1   : in std_logic_vector(39 downto 0);
      READ_PERCENT_00      : in std_logic_vector(6 downto 0);
      READ_PERCENT_01      : in std_logic_vector(6 downto 0);
      READ_PERCENT_02      : in std_logic_vector(6 downto 0);
      READ_PERCENT_03      : in std_logic_vector(6 downto 0);
      READ_PERCENT_04      : in std_logic_vector(6 downto 0);
      READ_PERCENT_05      : in std_logic_vector(6 downto 0);
      READ_PERCENT_06      : in std_logic_vector(6 downto 0);
      READ_PERCENT_07      : in std_logic_vector(6 downto 0);
      READ_PERCENT_08      : in std_logic_vector(6 downto 0);
      READ_PERCENT_09      : in std_logic_vector(6 downto 0);
      READ_PERCENT_10      : in std_logic_vector(6 downto 0);
      READ_PERCENT_11      : in std_logic_vector(6 downto 0);
      READ_PERCENT_12      : in std_logic_vector(6 downto 0);
      READ_PERCENT_13      : in std_logic_vector(6 downto 0);
      READ_PERCENT_14      : in std_logic_vector(6 downto 0);
      READ_PERCENT_15      : in std_logic_vector(6 downto 0);
      READ_PERCENT_16      : in std_logic_vector(6 downto 0);
      READ_PERCENT_17      : in std_logic_vector(6 downto 0);
      READ_PERCENT_18      : in std_logic_vector(6 downto 0);
      READ_PERCENT_19      : in std_logic_vector(6 downto 0);
      READ_PERCENT_20      : in std_logic_vector(6 downto 0);
      READ_PERCENT_21      : in std_logic_vector(6 downto 0);
      READ_PERCENT_22      : in std_logic_vector(6 downto 0);
      READ_PERCENT_23      : in std_logic_vector(6 downto 0);
      READ_PERCENT_24      : in std_logic_vector(6 downto 0);
      READ_PERCENT_25      : in std_logic_vector(6 downto 0);
      READ_PERCENT_26      : in std_logic_vector(6 downto 0);
      READ_PERCENT_27      : in std_logic_vector(6 downto 0);
      READ_PERCENT_28      : in std_logic_vector(6 downto 0);
      READ_PERCENT_29      : in std_logic_vector(6 downto 0);
      READ_PERCENT_30      : in std_logic_vector(6 downto 0);
      READ_PERCENT_31      : in std_logic_vector(6 downto 0);
      SWITCH_ENABLE_0      : in std_logic_vector(39 downto 0);
      SWITCH_ENABLE_00     : in std_logic_vector(39 downto 0);
      SWITCH_ENABLE_01     : in std_logic_vector(39 downto 0);
      SWITCH_ENABLE_1      : in std_logic_vector(39 downto 0);
      SW_TESTMODE_SEL_0    : in std_logic_vector(39 downto 0);
      SW_TESTMODE_SEL_1    : in std_logic_vector(39 downto 0);
      WRITE_PERCENT_00     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_01     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_02     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_03     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_04     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_05     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_06     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_07     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_08     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_09     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_10     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_11     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_12     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_13     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_14     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_15     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_16     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_17     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_18     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_19     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_20     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_21     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_22     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_23     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_24     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_25     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_26     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_27     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_28     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_29     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_30     : in std_logic_vector(6 downto 0);
      WRITE_PERCENT_31     : in std_logic_vector(6 downto 0);
      APB_0_PRDATA         : out std_logic_vector(31 downto 0);
      APB_0_PREADY         : out std_ulogic;
      APB_0_PSLVERR        : out std_ulogic;
      APB_1_PRDATA         : out std_logic_vector(31 downto 0);
      APB_1_PREADY         : out std_ulogic;
      APB_1_PSLVERR        : out std_ulogic;
      AXI_00_ARREADY       : out std_ulogic;
      AXI_00_AWREADY       : out std_ulogic;
      AXI_00_BID           : out std_logic_vector(5 downto 0);
      AXI_00_BRESP         : out std_logic_vector(1 downto 0);
      AXI_00_BVALID        : out std_ulogic;
      AXI_00_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_00_DFI_CLK_BUF   : out std_ulogic;
      AXI_00_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_00_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_00_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_00_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_00_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_00_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_00_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_00_DFI_RST_N_BUF : out std_ulogic;
      AXI_00_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_00_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_00_RDATA         : out std_logic_vector(255 downto 0);
      AXI_00_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_00_RID           : out std_logic_vector(5 downto 0);
      AXI_00_RLAST         : out std_ulogic;
      AXI_00_RRESP         : out std_logic_vector(1 downto 0);
      AXI_00_RVALID        : out std_ulogic;
      AXI_00_WREADY        : out std_ulogic;
      AXI_01_ARREADY       : out std_ulogic;
      AXI_01_AWREADY       : out std_ulogic;
      AXI_01_BID           : out std_logic_vector(5 downto 0);
      AXI_01_BRESP         : out std_logic_vector(1 downto 0);
      AXI_01_BVALID        : out std_ulogic;
      AXI_01_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_01_DFI_CLK_BUF   : out std_ulogic;
      AXI_01_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_01_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_01_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_01_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_01_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_01_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_01_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_01_DFI_RST_N_BUF : out std_ulogic;
      AXI_01_RDATA         : out std_logic_vector(255 downto 0);
      AXI_01_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_01_RID           : out std_logic_vector(5 downto 0);
      AXI_01_RLAST         : out std_ulogic;
      AXI_01_RRESP         : out std_logic_vector(1 downto 0);
      AXI_01_RVALID        : out std_ulogic;
      AXI_01_WREADY        : out std_ulogic;
      AXI_02_ARREADY       : out std_ulogic;
      AXI_02_AWREADY       : out std_ulogic;
      AXI_02_BID           : out std_logic_vector(5 downto 0);
      AXI_02_BRESP         : out std_logic_vector(1 downto 0);
      AXI_02_BVALID        : out std_ulogic;
      AXI_02_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_02_DFI_CLK_BUF   : out std_ulogic;
      AXI_02_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_02_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_02_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_02_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_02_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_02_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_02_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_02_DFI_RST_N_BUF : out std_ulogic;
      AXI_02_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_02_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_02_RDATA         : out std_logic_vector(255 downto 0);
      AXI_02_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_02_RID           : out std_logic_vector(5 downto 0);
      AXI_02_RLAST         : out std_ulogic;
      AXI_02_RRESP         : out std_logic_vector(1 downto 0);
      AXI_02_RVALID        : out std_ulogic;
      AXI_02_WREADY        : out std_ulogic;
      AXI_03_ARREADY       : out std_ulogic;
      AXI_03_AWREADY       : out std_ulogic;
      AXI_03_BID           : out std_logic_vector(5 downto 0);
      AXI_03_BRESP         : out std_logic_vector(1 downto 0);
      AXI_03_BVALID        : out std_ulogic;
      AXI_03_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_03_DFI_CLK_BUF   : out std_ulogic;
      AXI_03_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_03_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_03_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_03_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_03_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_03_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_03_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_03_DFI_RST_N_BUF : out std_ulogic;
      AXI_03_RDATA         : out std_logic_vector(255 downto 0);
      AXI_03_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_03_RID           : out std_logic_vector(5 downto 0);
      AXI_03_RLAST         : out std_ulogic;
      AXI_03_RRESP         : out std_logic_vector(1 downto 0);
      AXI_03_RVALID        : out std_ulogic;
      AXI_03_WREADY        : out std_ulogic;
      AXI_04_ARREADY       : out std_ulogic;
      AXI_04_AWREADY       : out std_ulogic;
      AXI_04_BID           : out std_logic_vector(5 downto 0);
      AXI_04_BRESP         : out std_logic_vector(1 downto 0);
      AXI_04_BVALID        : out std_ulogic;
      AXI_04_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_04_DFI_CLK_BUF   : out std_ulogic;
      AXI_04_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_04_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_04_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_04_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_04_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_04_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_04_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_04_DFI_RST_N_BUF : out std_ulogic;
      AXI_04_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_04_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_04_RDATA         : out std_logic_vector(255 downto 0);
      AXI_04_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_04_RID           : out std_logic_vector(5 downto 0);
      AXI_04_RLAST         : out std_ulogic;
      AXI_04_RRESP         : out std_logic_vector(1 downto 0);
      AXI_04_RVALID        : out std_ulogic;
      AXI_04_WREADY        : out std_ulogic;
      AXI_05_ARREADY       : out std_ulogic;
      AXI_05_AWREADY       : out std_ulogic;
      AXI_05_BID           : out std_logic_vector(5 downto 0);
      AXI_05_BRESP         : out std_logic_vector(1 downto 0);
      AXI_05_BVALID        : out std_ulogic;
      AXI_05_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_05_DFI_CLK_BUF   : out std_ulogic;
      AXI_05_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_05_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_05_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_05_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_05_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_05_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_05_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_05_DFI_RST_N_BUF : out std_ulogic;
      AXI_05_RDATA         : out std_logic_vector(255 downto 0);
      AXI_05_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_05_RID           : out std_logic_vector(5 downto 0);
      AXI_05_RLAST         : out std_ulogic;
      AXI_05_RRESP         : out std_logic_vector(1 downto 0);
      AXI_05_RVALID        : out std_ulogic;
      AXI_05_WREADY        : out std_ulogic;
      AXI_06_ARREADY       : out std_ulogic;
      AXI_06_AWREADY       : out std_ulogic;
      AXI_06_BID           : out std_logic_vector(5 downto 0);
      AXI_06_BRESP         : out std_logic_vector(1 downto 0);
      AXI_06_BVALID        : out std_ulogic;
      AXI_06_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_06_DFI_CLK_BUF   : out std_ulogic;
      AXI_06_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_06_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_06_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_06_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_06_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_06_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_06_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_06_DFI_RST_N_BUF : out std_ulogic;
      AXI_06_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_06_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_06_RDATA         : out std_logic_vector(255 downto 0);
      AXI_06_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_06_RID           : out std_logic_vector(5 downto 0);
      AXI_06_RLAST         : out std_ulogic;
      AXI_06_RRESP         : out std_logic_vector(1 downto 0);
      AXI_06_RVALID        : out std_ulogic;
      AXI_06_WREADY        : out std_ulogic;
      AXI_07_ARREADY       : out std_ulogic;
      AXI_07_AWREADY       : out std_ulogic;
      AXI_07_BID           : out std_logic_vector(5 downto 0);
      AXI_07_BRESP         : out std_logic_vector(1 downto 0);
      AXI_07_BVALID        : out std_ulogic;
      AXI_07_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_07_DFI_CLK_BUF   : out std_ulogic;
      AXI_07_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_07_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_07_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_07_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_07_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_07_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_07_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_07_DFI_RST_N_BUF : out std_ulogic;
      AXI_07_RDATA         : out std_logic_vector(255 downto 0);
      AXI_07_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_07_RID           : out std_logic_vector(5 downto 0);
      AXI_07_RLAST         : out std_ulogic;
      AXI_07_RRESP         : out std_logic_vector(1 downto 0);
      AXI_07_RVALID        : out std_ulogic;
      AXI_07_WREADY        : out std_ulogic;
      AXI_08_ARREADY       : out std_ulogic;
      AXI_08_AWREADY       : out std_ulogic;
      AXI_08_BID           : out std_logic_vector(5 downto 0);
      AXI_08_BRESP         : out std_logic_vector(1 downto 0);
      AXI_08_BVALID        : out std_ulogic;
      AXI_08_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_08_DFI_CLK_BUF   : out std_ulogic;
      AXI_08_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_08_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_08_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_08_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_08_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_08_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_08_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_08_DFI_RST_N_BUF : out std_ulogic;
      AXI_08_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_08_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_08_RDATA         : out std_logic_vector(255 downto 0);
      AXI_08_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_08_RID           : out std_logic_vector(5 downto 0);
      AXI_08_RLAST         : out std_ulogic;
      AXI_08_RRESP         : out std_logic_vector(1 downto 0);
      AXI_08_RVALID        : out std_ulogic;
      AXI_08_WREADY        : out std_ulogic;
      AXI_09_ARREADY       : out std_ulogic;
      AXI_09_AWREADY       : out std_ulogic;
      AXI_09_BID           : out std_logic_vector(5 downto 0);
      AXI_09_BRESP         : out std_logic_vector(1 downto 0);
      AXI_09_BVALID        : out std_ulogic;
      AXI_09_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_09_DFI_CLK_BUF   : out std_ulogic;
      AXI_09_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_09_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_09_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_09_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_09_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_09_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_09_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_09_DFI_RST_N_BUF : out std_ulogic;
      AXI_09_RDATA         : out std_logic_vector(255 downto 0);
      AXI_09_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_09_RID           : out std_logic_vector(5 downto 0);
      AXI_09_RLAST         : out std_ulogic;
      AXI_09_RRESP         : out std_logic_vector(1 downto 0);
      AXI_09_RVALID        : out std_ulogic;
      AXI_09_WREADY        : out std_ulogic;
      AXI_10_ARREADY       : out std_ulogic;
      AXI_10_AWREADY       : out std_ulogic;
      AXI_10_BID           : out std_logic_vector(5 downto 0);
      AXI_10_BRESP         : out std_logic_vector(1 downto 0);
      AXI_10_BVALID        : out std_ulogic;
      AXI_10_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_10_DFI_CLK_BUF   : out std_ulogic;
      AXI_10_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_10_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_10_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_10_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_10_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_10_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_10_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_10_DFI_RST_N_BUF : out std_ulogic;
      AXI_10_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_10_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_10_RDATA         : out std_logic_vector(255 downto 0);
      AXI_10_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_10_RID           : out std_logic_vector(5 downto 0);
      AXI_10_RLAST         : out std_ulogic;
      AXI_10_RRESP         : out std_logic_vector(1 downto 0);
      AXI_10_RVALID        : out std_ulogic;
      AXI_10_WREADY        : out std_ulogic;
      AXI_11_ARREADY       : out std_ulogic;
      AXI_11_AWREADY       : out std_ulogic;
      AXI_11_BID           : out std_logic_vector(5 downto 0);
      AXI_11_BRESP         : out std_logic_vector(1 downto 0);
      AXI_11_BVALID        : out std_ulogic;
      AXI_11_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_11_DFI_CLK_BUF   : out std_ulogic;
      AXI_11_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_11_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_11_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_11_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_11_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_11_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_11_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_11_DFI_RST_N_BUF : out std_ulogic;
      AXI_11_RDATA         : out std_logic_vector(255 downto 0);
      AXI_11_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_11_RID           : out std_logic_vector(5 downto 0);
      AXI_11_RLAST         : out std_ulogic;
      AXI_11_RRESP         : out std_logic_vector(1 downto 0);
      AXI_11_RVALID        : out std_ulogic;
      AXI_11_WREADY        : out std_ulogic;
      AXI_12_ARREADY       : out std_ulogic;
      AXI_12_AWREADY       : out std_ulogic;
      AXI_12_BID           : out std_logic_vector(5 downto 0);
      AXI_12_BRESP         : out std_logic_vector(1 downto 0);
      AXI_12_BVALID        : out std_ulogic;
      AXI_12_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_12_DFI_CLK_BUF   : out std_ulogic;
      AXI_12_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_12_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_12_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_12_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_12_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_12_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_12_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_12_DFI_RST_N_BUF : out std_ulogic;
      AXI_12_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_12_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_12_RDATA         : out std_logic_vector(255 downto 0);
      AXI_12_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_12_RID           : out std_logic_vector(5 downto 0);
      AXI_12_RLAST         : out std_ulogic;
      AXI_12_RRESP         : out std_logic_vector(1 downto 0);
      AXI_12_RVALID        : out std_ulogic;
      AXI_12_WREADY        : out std_ulogic;
      AXI_13_ARREADY       : out std_ulogic;
      AXI_13_AWREADY       : out std_ulogic;
      AXI_13_BID           : out std_logic_vector(5 downto 0);
      AXI_13_BRESP         : out std_logic_vector(1 downto 0);
      AXI_13_BVALID        : out std_ulogic;
      AXI_13_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_13_DFI_CLK_BUF   : out std_ulogic;
      AXI_13_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_13_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_13_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_13_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_13_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_13_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_13_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_13_DFI_RST_N_BUF : out std_ulogic;
      AXI_13_RDATA         : out std_logic_vector(255 downto 0);
      AXI_13_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_13_RID           : out std_logic_vector(5 downto 0);
      AXI_13_RLAST         : out std_ulogic;
      AXI_13_RRESP         : out std_logic_vector(1 downto 0);
      AXI_13_RVALID        : out std_ulogic;
      AXI_13_WREADY        : out std_ulogic;
      AXI_14_ARREADY       : out std_ulogic;
      AXI_14_AWREADY       : out std_ulogic;
      AXI_14_BID           : out std_logic_vector(5 downto 0);
      AXI_14_BRESP         : out std_logic_vector(1 downto 0);
      AXI_14_BVALID        : out std_ulogic;
      AXI_14_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_14_DFI_CLK_BUF   : out std_ulogic;
      AXI_14_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_14_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_14_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_14_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_14_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_14_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_14_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_14_DFI_RST_N_BUF : out std_ulogic;
      AXI_14_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_14_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_14_RDATA         : out std_logic_vector(255 downto 0);
      AXI_14_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_14_RID           : out std_logic_vector(5 downto 0);
      AXI_14_RLAST         : out std_ulogic;
      AXI_14_RRESP         : out std_logic_vector(1 downto 0);
      AXI_14_RVALID        : out std_ulogic;
      AXI_14_WREADY        : out std_ulogic;
      AXI_15_ARREADY       : out std_ulogic;
      AXI_15_AWREADY       : out std_ulogic;
      AXI_15_BID           : out std_logic_vector(5 downto 0);
      AXI_15_BRESP         : out std_logic_vector(1 downto 0);
      AXI_15_BVALID        : out std_ulogic;
      AXI_15_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_15_DFI_CLK_BUF   : out std_ulogic;
      AXI_15_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_15_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_15_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_15_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_15_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_15_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_15_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_15_DFI_RST_N_BUF : out std_ulogic;
      AXI_15_RDATA         : out std_logic_vector(255 downto 0);
      AXI_15_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_15_RID           : out std_logic_vector(5 downto 0);
      AXI_15_RLAST         : out std_ulogic;
      AXI_15_RRESP         : out std_logic_vector(1 downto 0);
      AXI_15_RVALID        : out std_ulogic;
      AXI_15_WREADY        : out std_ulogic;
      AXI_16_ARREADY       : out std_ulogic;
      AXI_16_AWREADY       : out std_ulogic;
      AXI_16_BID           : out std_logic_vector(5 downto 0);
      AXI_16_BRESP         : out std_logic_vector(1 downto 0);
      AXI_16_BVALID        : out std_ulogic;
      AXI_16_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_16_DFI_CLK_BUF   : out std_ulogic;
      AXI_16_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_16_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_16_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_16_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_16_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_16_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_16_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_16_DFI_RST_N_BUF : out std_ulogic;
      AXI_16_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_16_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_16_RDATA         : out std_logic_vector(255 downto 0);
      AXI_16_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_16_RID           : out std_logic_vector(5 downto 0);
      AXI_16_RLAST         : out std_ulogic;
      AXI_16_RRESP         : out std_logic_vector(1 downto 0);
      AXI_16_RVALID        : out std_ulogic;
      AXI_16_WREADY        : out std_ulogic;
      AXI_17_ARREADY       : out std_ulogic;
      AXI_17_AWREADY       : out std_ulogic;
      AXI_17_BID           : out std_logic_vector(5 downto 0);
      AXI_17_BRESP         : out std_logic_vector(1 downto 0);
      AXI_17_BVALID        : out std_ulogic;
      AXI_17_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_17_DFI_CLK_BUF   : out std_ulogic;
      AXI_17_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_17_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_17_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_17_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_17_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_17_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_17_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_17_DFI_RST_N_BUF : out std_ulogic;
      AXI_17_RDATA         : out std_logic_vector(255 downto 0);
      AXI_17_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_17_RID           : out std_logic_vector(5 downto 0);
      AXI_17_RLAST         : out std_ulogic;
      AXI_17_RRESP         : out std_logic_vector(1 downto 0);
      AXI_17_RVALID        : out std_ulogic;
      AXI_17_WREADY        : out std_ulogic;
      AXI_18_ARREADY       : out std_ulogic;
      AXI_18_AWREADY       : out std_ulogic;
      AXI_18_BID           : out std_logic_vector(5 downto 0);
      AXI_18_BRESP         : out std_logic_vector(1 downto 0);
      AXI_18_BVALID        : out std_ulogic;
      AXI_18_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_18_DFI_CLK_BUF   : out std_ulogic;
      AXI_18_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_18_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_18_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_18_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_18_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_18_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_18_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_18_DFI_RST_N_BUF : out std_ulogic;
      AXI_18_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_18_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_18_RDATA         : out std_logic_vector(255 downto 0);
      AXI_18_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_18_RID           : out std_logic_vector(5 downto 0);
      AXI_18_RLAST         : out std_ulogic;
      AXI_18_RRESP         : out std_logic_vector(1 downto 0);
      AXI_18_RVALID        : out std_ulogic;
      AXI_18_WREADY        : out std_ulogic;
      AXI_19_ARREADY       : out std_ulogic;
      AXI_19_AWREADY       : out std_ulogic;
      AXI_19_BID           : out std_logic_vector(5 downto 0);
      AXI_19_BRESP         : out std_logic_vector(1 downto 0);
      AXI_19_BVALID        : out std_ulogic;
      AXI_19_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_19_DFI_CLK_BUF   : out std_ulogic;
      AXI_19_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_19_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_19_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_19_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_19_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_19_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_19_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_19_DFI_RST_N_BUF : out std_ulogic;
      AXI_19_RDATA         : out std_logic_vector(255 downto 0);
      AXI_19_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_19_RID           : out std_logic_vector(5 downto 0);
      AXI_19_RLAST         : out std_ulogic;
      AXI_19_RRESP         : out std_logic_vector(1 downto 0);
      AXI_19_RVALID        : out std_ulogic;
      AXI_19_WREADY        : out std_ulogic;
      AXI_20_ARREADY       : out std_ulogic;
      AXI_20_AWREADY       : out std_ulogic;
      AXI_20_BID           : out std_logic_vector(5 downto 0);
      AXI_20_BRESP         : out std_logic_vector(1 downto 0);
      AXI_20_BVALID        : out std_ulogic;
      AXI_20_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_20_DFI_CLK_BUF   : out std_ulogic;
      AXI_20_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_20_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_20_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_20_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_20_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_20_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_20_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_20_DFI_RST_N_BUF : out std_ulogic;
      AXI_20_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_20_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_20_RDATA         : out std_logic_vector(255 downto 0);
      AXI_20_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_20_RID           : out std_logic_vector(5 downto 0);
      AXI_20_RLAST         : out std_ulogic;
      AXI_20_RRESP         : out std_logic_vector(1 downto 0);
      AXI_20_RVALID        : out std_ulogic;
      AXI_20_WREADY        : out std_ulogic;
      AXI_21_ARREADY       : out std_ulogic;
      AXI_21_AWREADY       : out std_ulogic;
      AXI_21_BID           : out std_logic_vector(5 downto 0);
      AXI_21_BRESP         : out std_logic_vector(1 downto 0);
      AXI_21_BVALID        : out std_ulogic;
      AXI_21_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_21_DFI_CLK_BUF   : out std_ulogic;
      AXI_21_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_21_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_21_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_21_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_21_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_21_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_21_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_21_DFI_RST_N_BUF : out std_ulogic;
      AXI_21_RDATA         : out std_logic_vector(255 downto 0);
      AXI_21_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_21_RID           : out std_logic_vector(5 downto 0);
      AXI_21_RLAST         : out std_ulogic;
      AXI_21_RRESP         : out std_logic_vector(1 downto 0);
      AXI_21_RVALID        : out std_ulogic;
      AXI_21_WREADY        : out std_ulogic;
      AXI_22_ARREADY       : out std_ulogic;
      AXI_22_AWREADY       : out std_ulogic;
      AXI_22_BID           : out std_logic_vector(5 downto 0);
      AXI_22_BRESP         : out std_logic_vector(1 downto 0);
      AXI_22_BVALID        : out std_ulogic;
      AXI_22_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_22_DFI_CLK_BUF   : out std_ulogic;
      AXI_22_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_22_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_22_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_22_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_22_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_22_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_22_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_22_DFI_RST_N_BUF : out std_ulogic;
      AXI_22_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_22_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_22_RDATA         : out std_logic_vector(255 downto 0);
      AXI_22_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_22_RID           : out std_logic_vector(5 downto 0);
      AXI_22_RLAST         : out std_ulogic;
      AXI_22_RRESP         : out std_logic_vector(1 downto 0);
      AXI_22_RVALID        : out std_ulogic;
      AXI_22_WREADY        : out std_ulogic;
      AXI_23_ARREADY       : out std_ulogic;
      AXI_23_AWREADY       : out std_ulogic;
      AXI_23_BID           : out std_logic_vector(5 downto 0);
      AXI_23_BRESP         : out std_logic_vector(1 downto 0);
      AXI_23_BVALID        : out std_ulogic;
      AXI_23_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_23_DFI_CLK_BUF   : out std_ulogic;
      AXI_23_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_23_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_23_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_23_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_23_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_23_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_23_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_23_DFI_RST_N_BUF : out std_ulogic;
      AXI_23_RDATA         : out std_logic_vector(255 downto 0);
      AXI_23_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_23_RID           : out std_logic_vector(5 downto 0);
      AXI_23_RLAST         : out std_ulogic;
      AXI_23_RRESP         : out std_logic_vector(1 downto 0);
      AXI_23_RVALID        : out std_ulogic;
      AXI_23_WREADY        : out std_ulogic;
      AXI_24_ARREADY       : out std_ulogic;
      AXI_24_AWREADY       : out std_ulogic;
      AXI_24_BID           : out std_logic_vector(5 downto 0);
      AXI_24_BRESP         : out std_logic_vector(1 downto 0);
      AXI_24_BVALID        : out std_ulogic;
      AXI_24_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_24_DFI_CLK_BUF   : out std_ulogic;
      AXI_24_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_24_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_24_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_24_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_24_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_24_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_24_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_24_DFI_RST_N_BUF : out std_ulogic;
      AXI_24_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_24_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_24_RDATA         : out std_logic_vector(255 downto 0);
      AXI_24_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_24_RID           : out std_logic_vector(5 downto 0);
      AXI_24_RLAST         : out std_ulogic;
      AXI_24_RRESP         : out std_logic_vector(1 downto 0);
      AXI_24_RVALID        : out std_ulogic;
      AXI_24_WREADY        : out std_ulogic;
      AXI_25_ARREADY       : out std_ulogic;
      AXI_25_AWREADY       : out std_ulogic;
      AXI_25_BID           : out std_logic_vector(5 downto 0);
      AXI_25_BRESP         : out std_logic_vector(1 downto 0);
      AXI_25_BVALID        : out std_ulogic;
      AXI_25_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_25_DFI_CLK_BUF   : out std_ulogic;
      AXI_25_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_25_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_25_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_25_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_25_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_25_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_25_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_25_DFI_RST_N_BUF : out std_ulogic;
      AXI_25_RDATA         : out std_logic_vector(255 downto 0);
      AXI_25_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_25_RID           : out std_logic_vector(5 downto 0);
      AXI_25_RLAST         : out std_ulogic;
      AXI_25_RRESP         : out std_logic_vector(1 downto 0);
      AXI_25_RVALID        : out std_ulogic;
      AXI_25_WREADY        : out std_ulogic;
      AXI_26_ARREADY       : out std_ulogic;
      AXI_26_AWREADY       : out std_ulogic;
      AXI_26_BID           : out std_logic_vector(5 downto 0);
      AXI_26_BRESP         : out std_logic_vector(1 downto 0);
      AXI_26_BVALID        : out std_ulogic;
      AXI_26_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_26_DFI_CLK_BUF   : out std_ulogic;
      AXI_26_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_26_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_26_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_26_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_26_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_26_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_26_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_26_DFI_RST_N_BUF : out std_ulogic;
      AXI_26_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_26_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_26_RDATA         : out std_logic_vector(255 downto 0);
      AXI_26_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_26_RID           : out std_logic_vector(5 downto 0);
      AXI_26_RLAST         : out std_ulogic;
      AXI_26_RRESP         : out std_logic_vector(1 downto 0);
      AXI_26_RVALID        : out std_ulogic;
      AXI_26_WREADY        : out std_ulogic;
      AXI_27_ARREADY       : out std_ulogic;
      AXI_27_AWREADY       : out std_ulogic;
      AXI_27_BID           : out std_logic_vector(5 downto 0);
      AXI_27_BRESP         : out std_logic_vector(1 downto 0);
      AXI_27_BVALID        : out std_ulogic;
      AXI_27_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_27_DFI_CLK_BUF   : out std_ulogic;
      AXI_27_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_27_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_27_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_27_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_27_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_27_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_27_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_27_DFI_RST_N_BUF : out std_ulogic;
      AXI_27_RDATA         : out std_logic_vector(255 downto 0);
      AXI_27_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_27_RID           : out std_logic_vector(5 downto 0);
      AXI_27_RLAST         : out std_ulogic;
      AXI_27_RRESP         : out std_logic_vector(1 downto 0);
      AXI_27_RVALID        : out std_ulogic;
      AXI_27_WREADY        : out std_ulogic;
      AXI_28_ARREADY       : out std_ulogic;
      AXI_28_AWREADY       : out std_ulogic;
      AXI_28_BID           : out std_logic_vector(5 downto 0);
      AXI_28_BRESP         : out std_logic_vector(1 downto 0);
      AXI_28_BVALID        : out std_ulogic;
      AXI_28_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_28_DFI_CLK_BUF   : out std_ulogic;
      AXI_28_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_28_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_28_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_28_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_28_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_28_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_28_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_28_DFI_RST_N_BUF : out std_ulogic;
      AXI_28_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_28_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_28_RDATA         : out std_logic_vector(255 downto 0);
      AXI_28_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_28_RID           : out std_logic_vector(5 downto 0);
      AXI_28_RLAST         : out std_ulogic;
      AXI_28_RRESP         : out std_logic_vector(1 downto 0);
      AXI_28_RVALID        : out std_ulogic;
      AXI_28_WREADY        : out std_ulogic;
      AXI_29_ARREADY       : out std_ulogic;
      AXI_29_AWREADY       : out std_ulogic;
      AXI_29_BID           : out std_logic_vector(5 downto 0);
      AXI_29_BRESP         : out std_logic_vector(1 downto 0);
      AXI_29_BVALID        : out std_ulogic;
      AXI_29_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_29_DFI_CLK_BUF   : out std_ulogic;
      AXI_29_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_29_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_29_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_29_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_29_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_29_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_29_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_29_DFI_RST_N_BUF : out std_ulogic;
      AXI_29_RDATA         : out std_logic_vector(255 downto 0);
      AXI_29_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_29_RID           : out std_logic_vector(5 downto 0);
      AXI_29_RLAST         : out std_ulogic;
      AXI_29_RRESP         : out std_logic_vector(1 downto 0);
      AXI_29_RVALID        : out std_ulogic;
      AXI_29_WREADY        : out std_ulogic;
      AXI_30_ARREADY       : out std_ulogic;
      AXI_30_AWREADY       : out std_ulogic;
      AXI_30_BID           : out std_logic_vector(5 downto 0);
      AXI_30_BRESP         : out std_logic_vector(1 downto 0);
      AXI_30_BVALID        : out std_ulogic;
      AXI_30_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_30_DFI_CLK_BUF   : out std_ulogic;
      AXI_30_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_30_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_30_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_30_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_30_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_30_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_30_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_30_DFI_RST_N_BUF : out std_ulogic;
      AXI_30_MC_STATUS     : out std_logic_vector(5 downto 0);
      AXI_30_PHY_STATUS    : out std_logic_vector(7 downto 0);
      AXI_30_RDATA         : out std_logic_vector(255 downto 0);
      AXI_30_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_30_RID           : out std_logic_vector(5 downto 0);
      AXI_30_RLAST         : out std_ulogic;
      AXI_30_RRESP         : out std_logic_vector(1 downto 0);
      AXI_30_RVALID        : out std_ulogic;
      AXI_30_WREADY        : out std_ulogic;
      AXI_31_ARREADY       : out std_ulogic;
      AXI_31_AWREADY       : out std_ulogic;
      AXI_31_BID           : out std_logic_vector(5 downto 0);
      AXI_31_BRESP         : out std_logic_vector(1 downto 0);
      AXI_31_BVALID        : out std_ulogic;
      AXI_31_DFI_AW_AERR_N : out std_logic_vector(1 downto 0);
      AXI_31_DFI_CLK_BUF   : out std_ulogic;
      AXI_31_DFI_DBI_BYTE_DISABLE : out std_logic_vector(7 downto 0);
      AXI_31_DFI_DW_RDDATA_DBI : out std_logic_vector(20 downto 0);
      AXI_31_DFI_DW_RDDATA_DERR : out std_logic_vector(7 downto 0);
      AXI_31_DFI_DW_RDDATA_VALID : out std_logic_vector(1 downto 0);
      AXI_31_DFI_INIT_COMPLETE : out std_ulogic;
      AXI_31_DFI_PHYUPD_REQ : out std_ulogic;
      AXI_31_DFI_PHY_LP_STATE : out std_ulogic;
      AXI_31_DFI_RST_N_BUF : out std_ulogic;
      AXI_31_RDATA         : out std_logic_vector(255 downto 0);
      AXI_31_RDATA_PARITY  : out std_logic_vector(31 downto 0);
      AXI_31_RID           : out std_logic_vector(5 downto 0);
      AXI_31_RLAST         : out std_ulogic;
      AXI_31_RRESP         : out std_logic_vector(1 downto 0);
      AXI_31_RVALID        : out std_ulogic;
      AXI_31_WREADY        : out std_ulogic;
      BLI_SCAN_OUT_00      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_01      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_02      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_03      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_04      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_05      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_06      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_07      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_08      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_09      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_10      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_11      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_12      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_13      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_14      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_15      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_16      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_17      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_18      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_19      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_20      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_21      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_22      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_23      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_24      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_25      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_26      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_27      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_28      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_29      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_30      : out std_logic_vector(7 downto 0);
      BLI_SCAN_OUT_31      : out std_logic_vector(7 downto 0);
      DBG_OUT_00           : out std_logic_vector(17 downto 0);
      DBG_OUT_01           : out std_logic_vector(17 downto 0);
      DBG_OUT_02           : out std_logic_vector(17 downto 0);
      DBG_OUT_03           : out std_logic_vector(17 downto 0);
      DBG_OUT_04           : out std_logic_vector(17 downto 0);
      DBG_OUT_05           : out std_logic_vector(17 downto 0);
      DBG_OUT_06           : out std_logic_vector(17 downto 0);
      DBG_OUT_07           : out std_logic_vector(17 downto 0);
      DBG_OUT_08           : out std_logic_vector(17 downto 0);
      DBG_OUT_09           : out std_logic_vector(17 downto 0);
      DBG_OUT_10           : out std_logic_vector(17 downto 0);
      DBG_OUT_11           : out std_logic_vector(17 downto 0);
      DBG_OUT_12           : out std_logic_vector(17 downto 0);
      DBG_OUT_13           : out std_logic_vector(17 downto 0);
      DBG_OUT_14           : out std_logic_vector(17 downto 0);
      DBG_OUT_15           : out std_logic_vector(17 downto 0);
      DBG_OUT_16           : out std_logic_vector(17 downto 0);
      DBG_OUT_17           : out std_logic_vector(17 downto 0);
      DBG_OUT_18           : out std_logic_vector(17 downto 0);
      DBG_OUT_19           : out std_logic_vector(17 downto 0);
      DBG_OUT_20           : out std_logic_vector(17 downto 0);
      DBG_OUT_21           : out std_logic_vector(17 downto 0);
      DBG_OUT_22           : out std_logic_vector(17 downto 0);
      DBG_OUT_23           : out std_logic_vector(17 downto 0);
      DBG_OUT_24           : out std_logic_vector(17 downto 0);
      DBG_OUT_25           : out std_logic_vector(17 downto 0);
      DBG_OUT_26           : out std_logic_vector(17 downto 0);
      DBG_OUT_27           : out std_logic_vector(17 downto 0);
      DBG_OUT_28           : out std_logic_vector(17 downto 0);
      DBG_OUT_29           : out std_logic_vector(17 downto 0);
      DBG_OUT_30           : out std_logic_vector(17 downto 0);
      DBG_OUT_31           : out std_logic_vector(17 downto 0);
      DLL_SCAN_OUT_00      : out std_logic_vector(1 downto 0);
      DLL_SCAN_OUT_01      : out std_logic_vector(1 downto 0);
      DRAM_0_STAT_CATTRIP  : out std_ulogic;
      DRAM_0_STAT_TEMP     : out std_logic_vector(2 downto 0);
      DRAM_1_STAT_CATTRIP  : out std_ulogic;
      DRAM_1_STAT_TEMP     : out std_logic_vector(2 downto 0);
      IO_SCAN_OUT_00       : out std_logic_vector(1 downto 0);
      IO_SCAN_OUT_01       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_00       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_01       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_02       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_03       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_04       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_05       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_06       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_07       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_08       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_09       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_10       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_11       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_12       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_13       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_14       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_15       : out std_logic_vector(1 downto 0);
      PHY_SCAN_OUT_00      : out std_logic_vector(1 downto 0);
      PHY_SCAN_OUT_01      : out std_logic_vector(1 downto 0);
      STATUS_00            : out std_logic_vector(1 downto 0);
      STATUS_01            : out std_logic_vector(1 downto 0);
      STATUS_02            : out std_logic_vector(1 downto 0);
      STATUS_03            : out std_logic_vector(1 downto 0);
      STATUS_04            : out std_logic_vector(1 downto 0);
      STATUS_05            : out std_logic_vector(1 downto 0);
      STATUS_06            : out std_logic_vector(1 downto 0);
      STATUS_07            : out std_logic_vector(1 downto 0);
      STATUS_08            : out std_logic_vector(1 downto 0);
      STATUS_09            : out std_logic_vector(1 downto 0);
      STATUS_10            : out std_logic_vector(1 downto 0);
      STATUS_11            : out std_logic_vector(1 downto 0);
      STATUS_12            : out std_logic_vector(1 downto 0);
      STATUS_13            : out std_logic_vector(1 downto 0);
      STATUS_14            : out std_logic_vector(1 downto 0);
      STATUS_15            : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_00       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_01       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_02       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_03       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_04       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_05       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_06       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_07       : out std_logic_vector(1 downto 0);
      ANALOG_HBM_SEL_00    : in std_ulogic;
      ANALOG_HBM_SEL_01    : in std_ulogic;
      APB_0_PADDR          : in std_logic_vector(21 downto 0);
      APB_0_PCLK           : in std_ulogic;
      APB_0_PENABLE        : in std_ulogic;
      APB_0_PRESET_N       : in std_ulogic;
      APB_0_PSEL           : in std_ulogic;
      APB_0_PWDATA         : in std_logic_vector(31 downto 0);
      APB_0_PWRITE         : in std_ulogic;
      APB_1_PADDR          : in std_logic_vector(21 downto 0);
      APB_1_PCLK           : in std_ulogic;
      APB_1_PENABLE        : in std_ulogic;
      APB_1_PRESET_N       : in std_ulogic;
      APB_1_PSEL           : in std_ulogic;
      APB_1_PWDATA         : in std_logic_vector(31 downto 0);
      APB_1_PWRITE         : in std_ulogic;
      AXI_00_ACLK          : in std_ulogic;
      AXI_00_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_00_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_00_ARESET_N      : in std_ulogic;
      AXI_00_ARID          : in std_logic_vector(5 downto 0);
      AXI_00_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_00_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_00_ARVALID       : in std_ulogic;
      AXI_00_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_00_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_00_AWID          : in std_logic_vector(5 downto 0);
      AXI_00_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_00_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_00_AWVALID       : in std_ulogic;
      AXI_00_BREADY        : in std_ulogic;
      AXI_00_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_00_RREADY        : in std_ulogic;
      AXI_00_WDATA         : in std_logic_vector(255 downto 0);
      AXI_00_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_00_WLAST         : in std_ulogic;
      AXI_00_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_00_WVALID        : in std_ulogic;
      AXI_01_ACLK          : in std_ulogic;
      AXI_01_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_01_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_01_ARESET_N      : in std_ulogic;
      AXI_01_ARID          : in std_logic_vector(5 downto 0);
      AXI_01_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_01_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_01_ARVALID       : in std_ulogic;
      AXI_01_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_01_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_01_AWID          : in std_logic_vector(5 downto 0);
      AXI_01_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_01_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_01_AWVALID       : in std_ulogic;
      AXI_01_BREADY        : in std_ulogic;
      AXI_01_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_01_RREADY        : in std_ulogic;
      AXI_01_WDATA         : in std_logic_vector(255 downto 0);
      AXI_01_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_01_WLAST         : in std_ulogic;
      AXI_01_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_01_WVALID        : in std_ulogic;
      AXI_02_ACLK          : in std_ulogic;
      AXI_02_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_02_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_02_ARESET_N      : in std_ulogic;
      AXI_02_ARID          : in std_logic_vector(5 downto 0);
      AXI_02_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_02_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_02_ARVALID       : in std_ulogic;
      AXI_02_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_02_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_02_AWID          : in std_logic_vector(5 downto 0);
      AXI_02_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_02_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_02_AWVALID       : in std_ulogic;
      AXI_02_BREADY        : in std_ulogic;
      AXI_02_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_02_RREADY        : in std_ulogic;
      AXI_02_WDATA         : in std_logic_vector(255 downto 0);
      AXI_02_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_02_WLAST         : in std_ulogic;
      AXI_02_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_02_WVALID        : in std_ulogic;
      AXI_03_ACLK          : in std_ulogic;
      AXI_03_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_03_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_03_ARESET_N      : in std_ulogic;
      AXI_03_ARID          : in std_logic_vector(5 downto 0);
      AXI_03_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_03_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_03_ARVALID       : in std_ulogic;
      AXI_03_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_03_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_03_AWID          : in std_logic_vector(5 downto 0);
      AXI_03_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_03_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_03_AWVALID       : in std_ulogic;
      AXI_03_BREADY        : in std_ulogic;
      AXI_03_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_03_RREADY        : in std_ulogic;
      AXI_03_WDATA         : in std_logic_vector(255 downto 0);
      AXI_03_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_03_WLAST         : in std_ulogic;
      AXI_03_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_03_WVALID        : in std_ulogic;
      AXI_04_ACLK          : in std_ulogic;
      AXI_04_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_04_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_04_ARESET_N      : in std_ulogic;
      AXI_04_ARID          : in std_logic_vector(5 downto 0);
      AXI_04_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_04_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_04_ARVALID       : in std_ulogic;
      AXI_04_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_04_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_04_AWID          : in std_logic_vector(5 downto 0);
      AXI_04_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_04_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_04_AWVALID       : in std_ulogic;
      AXI_04_BREADY        : in std_ulogic;
      AXI_04_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_04_RREADY        : in std_ulogic;
      AXI_04_WDATA         : in std_logic_vector(255 downto 0);
      AXI_04_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_04_WLAST         : in std_ulogic;
      AXI_04_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_04_WVALID        : in std_ulogic;
      AXI_05_ACLK          : in std_ulogic;
      AXI_05_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_05_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_05_ARESET_N      : in std_ulogic;
      AXI_05_ARID          : in std_logic_vector(5 downto 0);
      AXI_05_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_05_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_05_ARVALID       : in std_ulogic;
      AXI_05_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_05_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_05_AWID          : in std_logic_vector(5 downto 0);
      AXI_05_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_05_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_05_AWVALID       : in std_ulogic;
      AXI_05_BREADY        : in std_ulogic;
      AXI_05_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_05_RREADY        : in std_ulogic;
      AXI_05_WDATA         : in std_logic_vector(255 downto 0);
      AXI_05_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_05_WLAST         : in std_ulogic;
      AXI_05_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_05_WVALID        : in std_ulogic;
      AXI_06_ACLK          : in std_ulogic;
      AXI_06_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_06_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_06_ARESET_N      : in std_ulogic;
      AXI_06_ARID          : in std_logic_vector(5 downto 0);
      AXI_06_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_06_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_06_ARVALID       : in std_ulogic;
      AXI_06_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_06_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_06_AWID          : in std_logic_vector(5 downto 0);
      AXI_06_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_06_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_06_AWVALID       : in std_ulogic;
      AXI_06_BREADY        : in std_ulogic;
      AXI_06_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_06_RREADY        : in std_ulogic;
      AXI_06_WDATA         : in std_logic_vector(255 downto 0);
      AXI_06_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_06_WLAST         : in std_ulogic;
      AXI_06_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_06_WVALID        : in std_ulogic;
      AXI_07_ACLK          : in std_ulogic;
      AXI_07_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_07_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_07_ARESET_N      : in std_ulogic;
      AXI_07_ARID          : in std_logic_vector(5 downto 0);
      AXI_07_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_07_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_07_ARVALID       : in std_ulogic;
      AXI_07_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_07_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_07_AWID          : in std_logic_vector(5 downto 0);
      AXI_07_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_07_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_07_AWVALID       : in std_ulogic;
      AXI_07_BREADY        : in std_ulogic;
      AXI_07_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_07_RREADY        : in std_ulogic;
      AXI_07_WDATA         : in std_logic_vector(255 downto 0);
      AXI_07_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_07_WLAST         : in std_ulogic;
      AXI_07_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_07_WVALID        : in std_ulogic;
      AXI_08_ACLK          : in std_ulogic;
      AXI_08_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_08_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_08_ARESET_N      : in std_ulogic;
      AXI_08_ARID          : in std_logic_vector(5 downto 0);
      AXI_08_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_08_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_08_ARVALID       : in std_ulogic;
      AXI_08_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_08_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_08_AWID          : in std_logic_vector(5 downto 0);
      AXI_08_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_08_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_08_AWVALID       : in std_ulogic;
      AXI_08_BREADY        : in std_ulogic;
      AXI_08_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_08_RREADY        : in std_ulogic;
      AXI_08_WDATA         : in std_logic_vector(255 downto 0);
      AXI_08_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_08_WLAST         : in std_ulogic;
      AXI_08_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_08_WVALID        : in std_ulogic;
      AXI_09_ACLK          : in std_ulogic;
      AXI_09_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_09_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_09_ARESET_N      : in std_ulogic;
      AXI_09_ARID          : in std_logic_vector(5 downto 0);
      AXI_09_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_09_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_09_ARVALID       : in std_ulogic;
      AXI_09_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_09_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_09_AWID          : in std_logic_vector(5 downto 0);
      AXI_09_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_09_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_09_AWVALID       : in std_ulogic;
      AXI_09_BREADY        : in std_ulogic;
      AXI_09_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_09_RREADY        : in std_ulogic;
      AXI_09_WDATA         : in std_logic_vector(255 downto 0);
      AXI_09_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_09_WLAST         : in std_ulogic;
      AXI_09_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_09_WVALID        : in std_ulogic;
      AXI_10_ACLK          : in std_ulogic;
      AXI_10_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_10_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_10_ARESET_N      : in std_ulogic;
      AXI_10_ARID          : in std_logic_vector(5 downto 0);
      AXI_10_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_10_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_10_ARVALID       : in std_ulogic;
      AXI_10_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_10_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_10_AWID          : in std_logic_vector(5 downto 0);
      AXI_10_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_10_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_10_AWVALID       : in std_ulogic;
      AXI_10_BREADY        : in std_ulogic;
      AXI_10_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_10_RREADY        : in std_ulogic;
      AXI_10_WDATA         : in std_logic_vector(255 downto 0);
      AXI_10_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_10_WLAST         : in std_ulogic;
      AXI_10_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_10_WVALID        : in std_ulogic;
      AXI_11_ACLK          : in std_ulogic;
      AXI_11_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_11_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_11_ARESET_N      : in std_ulogic;
      AXI_11_ARID          : in std_logic_vector(5 downto 0);
      AXI_11_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_11_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_11_ARVALID       : in std_ulogic;
      AXI_11_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_11_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_11_AWID          : in std_logic_vector(5 downto 0);
      AXI_11_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_11_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_11_AWVALID       : in std_ulogic;
      AXI_11_BREADY        : in std_ulogic;
      AXI_11_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_11_RREADY        : in std_ulogic;
      AXI_11_WDATA         : in std_logic_vector(255 downto 0);
      AXI_11_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_11_WLAST         : in std_ulogic;
      AXI_11_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_11_WVALID        : in std_ulogic;
      AXI_12_ACLK          : in std_ulogic;
      AXI_12_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_12_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_12_ARESET_N      : in std_ulogic;
      AXI_12_ARID          : in std_logic_vector(5 downto 0);
      AXI_12_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_12_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_12_ARVALID       : in std_ulogic;
      AXI_12_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_12_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_12_AWID          : in std_logic_vector(5 downto 0);
      AXI_12_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_12_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_12_AWVALID       : in std_ulogic;
      AXI_12_BREADY        : in std_ulogic;
      AXI_12_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_12_RREADY        : in std_ulogic;
      AXI_12_WDATA         : in std_logic_vector(255 downto 0);
      AXI_12_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_12_WLAST         : in std_ulogic;
      AXI_12_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_12_WVALID        : in std_ulogic;
      AXI_13_ACLK          : in std_ulogic;
      AXI_13_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_13_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_13_ARESET_N      : in std_ulogic;
      AXI_13_ARID          : in std_logic_vector(5 downto 0);
      AXI_13_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_13_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_13_ARVALID       : in std_ulogic;
      AXI_13_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_13_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_13_AWID          : in std_logic_vector(5 downto 0);
      AXI_13_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_13_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_13_AWVALID       : in std_ulogic;
      AXI_13_BREADY        : in std_ulogic;
      AXI_13_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_13_RREADY        : in std_ulogic;
      AXI_13_WDATA         : in std_logic_vector(255 downto 0);
      AXI_13_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_13_WLAST         : in std_ulogic;
      AXI_13_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_13_WVALID        : in std_ulogic;
      AXI_14_ACLK          : in std_ulogic;
      AXI_14_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_14_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_14_ARESET_N      : in std_ulogic;
      AXI_14_ARID          : in std_logic_vector(5 downto 0);
      AXI_14_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_14_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_14_ARVALID       : in std_ulogic;
      AXI_14_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_14_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_14_AWID          : in std_logic_vector(5 downto 0);
      AXI_14_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_14_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_14_AWVALID       : in std_ulogic;
      AXI_14_BREADY        : in std_ulogic;
      AXI_14_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_14_RREADY        : in std_ulogic;
      AXI_14_WDATA         : in std_logic_vector(255 downto 0);
      AXI_14_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_14_WLAST         : in std_ulogic;
      AXI_14_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_14_WVALID        : in std_ulogic;
      AXI_15_ACLK          : in std_ulogic;
      AXI_15_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_15_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_15_ARESET_N      : in std_ulogic;
      AXI_15_ARID          : in std_logic_vector(5 downto 0);
      AXI_15_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_15_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_15_ARVALID       : in std_ulogic;
      AXI_15_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_15_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_15_AWID          : in std_logic_vector(5 downto 0);
      AXI_15_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_15_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_15_AWVALID       : in std_ulogic;
      AXI_15_BREADY        : in std_ulogic;
      AXI_15_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_15_RREADY        : in std_ulogic;
      AXI_15_WDATA         : in std_logic_vector(255 downto 0);
      AXI_15_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_15_WLAST         : in std_ulogic;
      AXI_15_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_15_WVALID        : in std_ulogic;
      AXI_16_ACLK          : in std_ulogic;
      AXI_16_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_16_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_16_ARESET_N      : in std_ulogic;
      AXI_16_ARID          : in std_logic_vector(5 downto 0);
      AXI_16_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_16_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_16_ARVALID       : in std_ulogic;
      AXI_16_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_16_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_16_AWID          : in std_logic_vector(5 downto 0);
      AXI_16_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_16_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_16_AWVALID       : in std_ulogic;
      AXI_16_BREADY        : in std_ulogic;
      AXI_16_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_16_RREADY        : in std_ulogic;
      AXI_16_WDATA         : in std_logic_vector(255 downto 0);
      AXI_16_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_16_WLAST         : in std_ulogic;
      AXI_16_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_16_WVALID        : in std_ulogic;
      AXI_17_ACLK          : in std_ulogic;
      AXI_17_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_17_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_17_ARESET_N      : in std_ulogic;
      AXI_17_ARID          : in std_logic_vector(5 downto 0);
      AXI_17_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_17_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_17_ARVALID       : in std_ulogic;
      AXI_17_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_17_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_17_AWID          : in std_logic_vector(5 downto 0);
      AXI_17_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_17_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_17_AWVALID       : in std_ulogic;
      AXI_17_BREADY        : in std_ulogic;
      AXI_17_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_17_RREADY        : in std_ulogic;
      AXI_17_WDATA         : in std_logic_vector(255 downto 0);
      AXI_17_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_17_WLAST         : in std_ulogic;
      AXI_17_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_17_WVALID        : in std_ulogic;
      AXI_18_ACLK          : in std_ulogic;
      AXI_18_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_18_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_18_ARESET_N      : in std_ulogic;
      AXI_18_ARID          : in std_logic_vector(5 downto 0);
      AXI_18_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_18_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_18_ARVALID       : in std_ulogic;
      AXI_18_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_18_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_18_AWID          : in std_logic_vector(5 downto 0);
      AXI_18_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_18_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_18_AWVALID       : in std_ulogic;
      AXI_18_BREADY        : in std_ulogic;
      AXI_18_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_18_RREADY        : in std_ulogic;
      AXI_18_WDATA         : in std_logic_vector(255 downto 0);
      AXI_18_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_18_WLAST         : in std_ulogic;
      AXI_18_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_18_WVALID        : in std_ulogic;
      AXI_19_ACLK          : in std_ulogic;
      AXI_19_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_19_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_19_ARESET_N      : in std_ulogic;
      AXI_19_ARID          : in std_logic_vector(5 downto 0);
      AXI_19_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_19_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_19_ARVALID       : in std_ulogic;
      AXI_19_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_19_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_19_AWID          : in std_logic_vector(5 downto 0);
      AXI_19_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_19_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_19_AWVALID       : in std_ulogic;
      AXI_19_BREADY        : in std_ulogic;
      AXI_19_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_19_RREADY        : in std_ulogic;
      AXI_19_WDATA         : in std_logic_vector(255 downto 0);
      AXI_19_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_19_WLAST         : in std_ulogic;
      AXI_19_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_19_WVALID        : in std_ulogic;
      AXI_20_ACLK          : in std_ulogic;
      AXI_20_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_20_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_20_ARESET_N      : in std_ulogic;
      AXI_20_ARID          : in std_logic_vector(5 downto 0);
      AXI_20_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_20_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_20_ARVALID       : in std_ulogic;
      AXI_20_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_20_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_20_AWID          : in std_logic_vector(5 downto 0);
      AXI_20_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_20_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_20_AWVALID       : in std_ulogic;
      AXI_20_BREADY        : in std_ulogic;
      AXI_20_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_20_RREADY        : in std_ulogic;
      AXI_20_WDATA         : in std_logic_vector(255 downto 0);
      AXI_20_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_20_WLAST         : in std_ulogic;
      AXI_20_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_20_WVALID        : in std_ulogic;
      AXI_21_ACLK          : in std_ulogic;
      AXI_21_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_21_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_21_ARESET_N      : in std_ulogic;
      AXI_21_ARID          : in std_logic_vector(5 downto 0);
      AXI_21_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_21_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_21_ARVALID       : in std_ulogic;
      AXI_21_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_21_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_21_AWID          : in std_logic_vector(5 downto 0);
      AXI_21_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_21_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_21_AWVALID       : in std_ulogic;
      AXI_21_BREADY        : in std_ulogic;
      AXI_21_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_21_RREADY        : in std_ulogic;
      AXI_21_WDATA         : in std_logic_vector(255 downto 0);
      AXI_21_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_21_WLAST         : in std_ulogic;
      AXI_21_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_21_WVALID        : in std_ulogic;
      AXI_22_ACLK          : in std_ulogic;
      AXI_22_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_22_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_22_ARESET_N      : in std_ulogic;
      AXI_22_ARID          : in std_logic_vector(5 downto 0);
      AXI_22_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_22_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_22_ARVALID       : in std_ulogic;
      AXI_22_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_22_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_22_AWID          : in std_logic_vector(5 downto 0);
      AXI_22_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_22_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_22_AWVALID       : in std_ulogic;
      AXI_22_BREADY        : in std_ulogic;
      AXI_22_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_22_RREADY        : in std_ulogic;
      AXI_22_WDATA         : in std_logic_vector(255 downto 0);
      AXI_22_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_22_WLAST         : in std_ulogic;
      AXI_22_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_22_WVALID        : in std_ulogic;
      AXI_23_ACLK          : in std_ulogic;
      AXI_23_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_23_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_23_ARESET_N      : in std_ulogic;
      AXI_23_ARID          : in std_logic_vector(5 downto 0);
      AXI_23_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_23_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_23_ARVALID       : in std_ulogic;
      AXI_23_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_23_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_23_AWID          : in std_logic_vector(5 downto 0);
      AXI_23_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_23_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_23_AWVALID       : in std_ulogic;
      AXI_23_BREADY        : in std_ulogic;
      AXI_23_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_23_RREADY        : in std_ulogic;
      AXI_23_WDATA         : in std_logic_vector(255 downto 0);
      AXI_23_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_23_WLAST         : in std_ulogic;
      AXI_23_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_23_WVALID        : in std_ulogic;
      AXI_24_ACLK          : in std_ulogic;
      AXI_24_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_24_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_24_ARESET_N      : in std_ulogic;
      AXI_24_ARID          : in std_logic_vector(5 downto 0);
      AXI_24_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_24_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_24_ARVALID       : in std_ulogic;
      AXI_24_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_24_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_24_AWID          : in std_logic_vector(5 downto 0);
      AXI_24_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_24_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_24_AWVALID       : in std_ulogic;
      AXI_24_BREADY        : in std_ulogic;
      AXI_24_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_24_RREADY        : in std_ulogic;
      AXI_24_WDATA         : in std_logic_vector(255 downto 0);
      AXI_24_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_24_WLAST         : in std_ulogic;
      AXI_24_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_24_WVALID        : in std_ulogic;
      AXI_25_ACLK          : in std_ulogic;
      AXI_25_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_25_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_25_ARESET_N      : in std_ulogic;
      AXI_25_ARID          : in std_logic_vector(5 downto 0);
      AXI_25_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_25_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_25_ARVALID       : in std_ulogic;
      AXI_25_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_25_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_25_AWID          : in std_logic_vector(5 downto 0);
      AXI_25_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_25_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_25_AWVALID       : in std_ulogic;
      AXI_25_BREADY        : in std_ulogic;
      AXI_25_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_25_RREADY        : in std_ulogic;
      AXI_25_WDATA         : in std_logic_vector(255 downto 0);
      AXI_25_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_25_WLAST         : in std_ulogic;
      AXI_25_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_25_WVALID        : in std_ulogic;
      AXI_26_ACLK          : in std_ulogic;
      AXI_26_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_26_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_26_ARESET_N      : in std_ulogic;
      AXI_26_ARID          : in std_logic_vector(5 downto 0);
      AXI_26_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_26_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_26_ARVALID       : in std_ulogic;
      AXI_26_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_26_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_26_AWID          : in std_logic_vector(5 downto 0);
      AXI_26_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_26_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_26_AWVALID       : in std_ulogic;
      AXI_26_BREADY        : in std_ulogic;
      AXI_26_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_26_RREADY        : in std_ulogic;
      AXI_26_WDATA         : in std_logic_vector(255 downto 0);
      AXI_26_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_26_WLAST         : in std_ulogic;
      AXI_26_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_26_WVALID        : in std_ulogic;
      AXI_27_ACLK          : in std_ulogic;
      AXI_27_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_27_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_27_ARESET_N      : in std_ulogic;
      AXI_27_ARID          : in std_logic_vector(5 downto 0);
      AXI_27_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_27_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_27_ARVALID       : in std_ulogic;
      AXI_27_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_27_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_27_AWID          : in std_logic_vector(5 downto 0);
      AXI_27_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_27_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_27_AWVALID       : in std_ulogic;
      AXI_27_BREADY        : in std_ulogic;
      AXI_27_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_27_RREADY        : in std_ulogic;
      AXI_27_WDATA         : in std_logic_vector(255 downto 0);
      AXI_27_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_27_WLAST         : in std_ulogic;
      AXI_27_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_27_WVALID        : in std_ulogic;
      AXI_28_ACLK          : in std_ulogic;
      AXI_28_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_28_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_28_ARESET_N      : in std_ulogic;
      AXI_28_ARID          : in std_logic_vector(5 downto 0);
      AXI_28_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_28_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_28_ARVALID       : in std_ulogic;
      AXI_28_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_28_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_28_AWID          : in std_logic_vector(5 downto 0);
      AXI_28_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_28_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_28_AWVALID       : in std_ulogic;
      AXI_28_BREADY        : in std_ulogic;
      AXI_28_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_28_RREADY        : in std_ulogic;
      AXI_28_WDATA         : in std_logic_vector(255 downto 0);
      AXI_28_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_28_WLAST         : in std_ulogic;
      AXI_28_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_28_WVALID        : in std_ulogic;
      AXI_29_ACLK          : in std_ulogic;
      AXI_29_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_29_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_29_ARESET_N      : in std_ulogic;
      AXI_29_ARID          : in std_logic_vector(5 downto 0);
      AXI_29_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_29_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_29_ARVALID       : in std_ulogic;
      AXI_29_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_29_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_29_AWID          : in std_logic_vector(5 downto 0);
      AXI_29_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_29_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_29_AWVALID       : in std_ulogic;
      AXI_29_BREADY        : in std_ulogic;
      AXI_29_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_29_RREADY        : in std_ulogic;
      AXI_29_WDATA         : in std_logic_vector(255 downto 0);
      AXI_29_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_29_WLAST         : in std_ulogic;
      AXI_29_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_29_WVALID        : in std_ulogic;
      AXI_30_ACLK          : in std_ulogic;
      AXI_30_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_30_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_30_ARESET_N      : in std_ulogic;
      AXI_30_ARID          : in std_logic_vector(5 downto 0);
      AXI_30_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_30_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_30_ARVALID       : in std_ulogic;
      AXI_30_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_30_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_30_AWID          : in std_logic_vector(5 downto 0);
      AXI_30_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_30_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_30_AWVALID       : in std_ulogic;
      AXI_30_BREADY        : in std_ulogic;
      AXI_30_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_30_RREADY        : in std_ulogic;
      AXI_30_WDATA         : in std_logic_vector(255 downto 0);
      AXI_30_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_30_WLAST         : in std_ulogic;
      AXI_30_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_30_WVALID        : in std_ulogic;
      AXI_31_ACLK          : in std_ulogic;
      AXI_31_ARADDR        : in std_logic_vector(36 downto 0);
      AXI_31_ARBURST       : in std_logic_vector(1 downto 0);
      AXI_31_ARESET_N      : in std_ulogic;
      AXI_31_ARID          : in std_logic_vector(5 downto 0);
      AXI_31_ARLEN         : in std_logic_vector(3 downto 0);
      AXI_31_ARSIZE        : in std_logic_vector(2 downto 0);
      AXI_31_ARVALID       : in std_ulogic;
      AXI_31_AWADDR        : in std_logic_vector(36 downto 0);
      AXI_31_AWBURST       : in std_logic_vector(1 downto 0);
      AXI_31_AWID          : in std_logic_vector(5 downto 0);
      AXI_31_AWLEN         : in std_logic_vector(3 downto 0);
      AXI_31_AWSIZE        : in std_logic_vector(2 downto 0);
      AXI_31_AWVALID       : in std_ulogic;
      AXI_31_BREADY        : in std_ulogic;
      AXI_31_DFI_LP_PWR_X_REQ : in std_ulogic;
      AXI_31_RREADY        : in std_ulogic;
      AXI_31_WDATA         : in std_logic_vector(255 downto 0);
      AXI_31_WDATA_PARITY  : in std_logic_vector(31 downto 0);
      AXI_31_WLAST         : in std_ulogic;
      AXI_31_WSTRB         : in std_logic_vector(31 downto 0);
      AXI_31_WVALID        : in std_ulogic;
      BLI_SCAN_ENABLE_00   : in std_ulogic;
      BLI_SCAN_ENABLE_01   : in std_ulogic;
      BLI_SCAN_ENABLE_02   : in std_ulogic;
      BLI_SCAN_ENABLE_03   : in std_ulogic;
      BLI_SCAN_ENABLE_04   : in std_ulogic;
      BLI_SCAN_ENABLE_05   : in std_ulogic;
      BLI_SCAN_ENABLE_06   : in std_ulogic;
      BLI_SCAN_ENABLE_07   : in std_ulogic;
      BLI_SCAN_ENABLE_08   : in std_ulogic;
      BLI_SCAN_ENABLE_09   : in std_ulogic;
      BLI_SCAN_ENABLE_10   : in std_ulogic;
      BLI_SCAN_ENABLE_11   : in std_ulogic;
      BLI_SCAN_ENABLE_12   : in std_ulogic;
      BLI_SCAN_ENABLE_13   : in std_ulogic;
      BLI_SCAN_ENABLE_14   : in std_ulogic;
      BLI_SCAN_ENABLE_15   : in std_ulogic;
      BLI_SCAN_ENABLE_16   : in std_ulogic;
      BLI_SCAN_ENABLE_17   : in std_ulogic;
      BLI_SCAN_ENABLE_18   : in std_ulogic;
      BLI_SCAN_ENABLE_19   : in std_ulogic;
      BLI_SCAN_ENABLE_20   : in std_ulogic;
      BLI_SCAN_ENABLE_21   : in std_ulogic;
      BLI_SCAN_ENABLE_22   : in std_ulogic;
      BLI_SCAN_ENABLE_23   : in std_ulogic;
      BLI_SCAN_ENABLE_24   : in std_ulogic;
      BLI_SCAN_ENABLE_25   : in std_ulogic;
      BLI_SCAN_ENABLE_26   : in std_ulogic;
      BLI_SCAN_ENABLE_27   : in std_ulogic;
      BLI_SCAN_ENABLE_28   : in std_ulogic;
      BLI_SCAN_ENABLE_29   : in std_ulogic;
      BLI_SCAN_ENABLE_30   : in std_ulogic;
      BLI_SCAN_ENABLE_31   : in std_ulogic;
      BLI_SCAN_IN_00       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_01       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_02       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_03       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_04       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_05       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_06       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_07       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_08       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_09       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_10       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_11       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_12       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_13       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_14       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_15       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_16       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_17       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_18       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_19       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_20       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_21       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_22       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_23       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_24       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_25       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_26       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_27       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_28       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_29       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_30       : in std_logic_vector(7 downto 0);
      BLI_SCAN_IN_31       : in std_logic_vector(7 downto 0);
      BSCAN_DRCK_0         : in std_ulogic;
      BSCAN_DRCK_1         : in std_ulogic;
      BSCAN_TCK_0          : in std_ulogic;
      BSCAN_TCK_1          : in std_ulogic;
      DBG_IN_00            : in std_logic_vector(23 downto 0);
      DBG_IN_01            : in std_logic_vector(23 downto 0);
      DBG_IN_02            : in std_logic_vector(23 downto 0);
      DBG_IN_03            : in std_logic_vector(23 downto 0);
      DBG_IN_04            : in std_logic_vector(23 downto 0);
      DBG_IN_05            : in std_logic_vector(23 downto 0);
      DBG_IN_06            : in std_logic_vector(23 downto 0);
      DBG_IN_07            : in std_logic_vector(23 downto 0);
      DBG_IN_08            : in std_logic_vector(23 downto 0);
      DBG_IN_09            : in std_logic_vector(23 downto 0);
      DBG_IN_10            : in std_logic_vector(23 downto 0);
      DBG_IN_11            : in std_logic_vector(23 downto 0);
      DBG_IN_12            : in std_logic_vector(23 downto 0);
      DBG_IN_13            : in std_logic_vector(23 downto 0);
      DBG_IN_14            : in std_logic_vector(23 downto 0);
      DBG_IN_15            : in std_logic_vector(23 downto 0);
      DBG_IN_16            : in std_logic_vector(23 downto 0);
      DBG_IN_17            : in std_logic_vector(23 downto 0);
      DBG_IN_18            : in std_logic_vector(23 downto 0);
      DBG_IN_19            : in std_logic_vector(23 downto 0);
      DBG_IN_20            : in std_logic_vector(23 downto 0);
      DBG_IN_21            : in std_logic_vector(23 downto 0);
      DBG_IN_22            : in std_logic_vector(23 downto 0);
      DBG_IN_23            : in std_logic_vector(23 downto 0);
      DBG_IN_24            : in std_logic_vector(23 downto 0);
      DBG_IN_25            : in std_logic_vector(23 downto 0);
      DBG_IN_26            : in std_logic_vector(23 downto 0);
      DBG_IN_27            : in std_logic_vector(23 downto 0);
      DBG_IN_28            : in std_logic_vector(23 downto 0);
      DBG_IN_29            : in std_logic_vector(23 downto 0);
      DBG_IN_30            : in std_logic_vector(23 downto 0);
      DBG_IN_31            : in std_logic_vector(23 downto 0);
      DLL_SCAN_CK_00       : in std_ulogic;
      DLL_SCAN_CK_01       : in std_ulogic;
      DLL_SCAN_ENABLE_00   : in std_ulogic;
      DLL_SCAN_ENABLE_01   : in std_ulogic;
      DLL_SCAN_IN_00       : in std_logic_vector(1 downto 0);
      DLL_SCAN_IN_01       : in std_logic_vector(1 downto 0);
      DLL_SCAN_MODE_00     : in std_ulogic;
      DLL_SCAN_MODE_01     : in std_ulogic;
      DLL_SCAN_RST_N_00    : in std_ulogic;
      DLL_SCAN_RST_N_01    : in std_ulogic;
      HBM_REF_CLK_0        : in std_ulogic;
      HBM_REF_CLK_1        : in std_ulogic;
      IO_SCAN_CK_00        : in std_ulogic;
      IO_SCAN_CK_01        : in std_ulogic;
      IO_SCAN_ENABLE_00    : in std_ulogic;
      IO_SCAN_ENABLE_01    : in std_ulogic;
      IO_SCAN_IN_00        : in std_logic_vector(1 downto 0);
      IO_SCAN_IN_01        : in std_logic_vector(1 downto 0);
      IO_SCAN_MODE_00      : in std_ulogic;
      IO_SCAN_MODE_01      : in std_ulogic;
      IO_SCAN_RST_N_00     : in std_ulogic;
      IO_SCAN_RST_N_01     : in std_ulogic;
      MBIST_EN_00          : in std_ulogic;
      MBIST_EN_01          : in std_ulogic;
      MBIST_EN_02          : in std_ulogic;
      MBIST_EN_03          : in std_ulogic;
      MBIST_EN_04          : in std_ulogic;
      MBIST_EN_05          : in std_ulogic;
      MBIST_EN_06          : in std_ulogic;
      MBIST_EN_07          : in std_ulogic;
      MBIST_EN_08          : in std_ulogic;
      MBIST_EN_09          : in std_ulogic;
      MBIST_EN_10          : in std_ulogic;
      MBIST_EN_11          : in std_ulogic;
      MBIST_EN_12          : in std_ulogic;
      MBIST_EN_13          : in std_ulogic;
      MBIST_EN_14          : in std_ulogic;
      MBIST_EN_15          : in std_ulogic;
      MC_SCAN_CK_00        : in std_ulogic;
      MC_SCAN_CK_01        : in std_ulogic;
      MC_SCAN_CK_02        : in std_ulogic;
      MC_SCAN_CK_03        : in std_ulogic;
      MC_SCAN_CK_04        : in std_ulogic;
      MC_SCAN_CK_05        : in std_ulogic;
      MC_SCAN_CK_06        : in std_ulogic;
      MC_SCAN_CK_07        : in std_ulogic;
      MC_SCAN_CK_08        : in std_ulogic;
      MC_SCAN_CK_09        : in std_ulogic;
      MC_SCAN_CK_10        : in std_ulogic;
      MC_SCAN_CK_11        : in std_ulogic;
      MC_SCAN_CK_12        : in std_ulogic;
      MC_SCAN_CK_13        : in std_ulogic;
      MC_SCAN_CK_14        : in std_ulogic;
      MC_SCAN_CK_15        : in std_ulogic;
      MC_SCAN_ENABLE_00    : in std_ulogic;
      MC_SCAN_ENABLE_01    : in std_ulogic;
      MC_SCAN_ENABLE_02    : in std_ulogic;
      MC_SCAN_ENABLE_03    : in std_ulogic;
      MC_SCAN_ENABLE_04    : in std_ulogic;
      MC_SCAN_ENABLE_05    : in std_ulogic;
      MC_SCAN_ENABLE_06    : in std_ulogic;
      MC_SCAN_ENABLE_07    : in std_ulogic;
      MC_SCAN_ENABLE_08    : in std_ulogic;
      MC_SCAN_ENABLE_09    : in std_ulogic;
      MC_SCAN_ENABLE_10    : in std_ulogic;
      MC_SCAN_ENABLE_11    : in std_ulogic;
      MC_SCAN_ENABLE_12    : in std_ulogic;
      MC_SCAN_ENABLE_13    : in std_ulogic;
      MC_SCAN_ENABLE_14    : in std_ulogic;
      MC_SCAN_ENABLE_15    : in std_ulogic;
      MC_SCAN_IN_00        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_01        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_02        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_03        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_04        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_05        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_06        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_07        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_08        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_09        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_10        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_11        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_12        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_13        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_14        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_15        : in std_logic_vector(1 downto 0);
      MC_SCAN_MODE_00      : in std_ulogic;
      MC_SCAN_MODE_01      : in std_ulogic;
      MC_SCAN_MODE_02      : in std_ulogic;
      MC_SCAN_MODE_03      : in std_ulogic;
      MC_SCAN_MODE_04      : in std_ulogic;
      MC_SCAN_MODE_05      : in std_ulogic;
      MC_SCAN_MODE_06      : in std_ulogic;
      MC_SCAN_MODE_07      : in std_ulogic;
      MC_SCAN_MODE_08      : in std_ulogic;
      MC_SCAN_MODE_09      : in std_ulogic;
      MC_SCAN_MODE_10      : in std_ulogic;
      MC_SCAN_MODE_11      : in std_ulogic;
      MC_SCAN_MODE_12      : in std_ulogic;
      MC_SCAN_MODE_13      : in std_ulogic;
      MC_SCAN_MODE_14      : in std_ulogic;
      MC_SCAN_MODE_15      : in std_ulogic;
      MC_SCAN_RST_N_00     : in std_ulogic;
      MC_SCAN_RST_N_01     : in std_ulogic;
      MC_SCAN_RST_N_02     : in std_ulogic;
      MC_SCAN_RST_N_03     : in std_ulogic;
      MC_SCAN_RST_N_04     : in std_ulogic;
      MC_SCAN_RST_N_05     : in std_ulogic;
      MC_SCAN_RST_N_06     : in std_ulogic;
      MC_SCAN_RST_N_07     : in std_ulogic;
      MC_SCAN_RST_N_08     : in std_ulogic;
      MC_SCAN_RST_N_09     : in std_ulogic;
      MC_SCAN_RST_N_10     : in std_ulogic;
      MC_SCAN_RST_N_11     : in std_ulogic;
      MC_SCAN_RST_N_12     : in std_ulogic;
      MC_SCAN_RST_N_13     : in std_ulogic;
      MC_SCAN_RST_N_14     : in std_ulogic;
      MC_SCAN_RST_N_15     : in std_ulogic;
      PHY_SCAN_CK_00       : in std_ulogic;
      PHY_SCAN_CK_01       : in std_ulogic;
      PHY_SCAN_ENABLE_00   : in std_ulogic;
      PHY_SCAN_ENABLE_01   : in std_ulogic;
      PHY_SCAN_IN_00       : in std_logic_vector(1 downto 0);
      PHY_SCAN_IN_01       : in std_logic_vector(1 downto 0);
      PHY_SCAN_MODE_00     : in std_ulogic;
      PHY_SCAN_MODE_01     : in std_ulogic;
      PHY_SCAN_RST_N_00    : in std_ulogic;
      PHY_SCAN_RST_N_01    : in std_ulogic;
      SW_SCAN_CK_00        : in std_ulogic;
      SW_SCAN_CK_01        : in std_ulogic;
      SW_SCAN_ENABLE_00    : in std_ulogic;
      SW_SCAN_ENABLE_01    : in std_ulogic;
      SW_SCAN_IN_00        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_01        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_02        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_03        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_04        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_05        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_06        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_07        : in std_logic_vector(1 downto 0);
      SW_SCAN_MODE_00      : in std_ulogic;
      SW_SCAN_MODE_01      : in std_ulogic;
      SW_SCAN_RST_N_00     : in std_ulogic;
      SW_SCAN_RST_N_01     : in std_ulogic;
      GSR                  : in std_ulogic
    );
  end component;
  

  constant MODULE_NAME : string := "HBM_TWO_STACK_INTF";
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
  constant APB_BYPASS_EN_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant APB_BYPASS_EN_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant AXI_BYPASS_EN_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant AXI_BYPASS_EN_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant BLI_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant BLI_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant CLK_SEL_00_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_00,40);
  constant CLK_SEL_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_01,40);
  constant CLK_SEL_02_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_02,40);
  constant CLK_SEL_03_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_03,40);
  constant CLK_SEL_04_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_04,40);
  constant CLK_SEL_05_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_05,40);
  constant CLK_SEL_06_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_06,40);
  constant CLK_SEL_07_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_07,40);
  constant CLK_SEL_08_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_08,40);
  constant CLK_SEL_09_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_09,40);
  constant CLK_SEL_10_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_10,40);
  constant CLK_SEL_11_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_11,40);
  constant CLK_SEL_12_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_12,40);
  constant CLK_SEL_13_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_13,40);
  constant CLK_SEL_14_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_14,40);
  constant CLK_SEL_15_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_15,40);
  constant CLK_SEL_16_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_16,40);
  constant CLK_SEL_17_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_17,40);
  constant CLK_SEL_18_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_18,40);
  constant CLK_SEL_19_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_19,40);
  constant CLK_SEL_20_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_20,40);
  constant CLK_SEL_21_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_21,40);
  constant CLK_SEL_22_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_22,40);
  constant CLK_SEL_23_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_23,40);
  constant CLK_SEL_24_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_24,40);
  constant CLK_SEL_25_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_25,40);
  constant CLK_SEL_26_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_26,40);
  constant CLK_SEL_27_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_27,40);
  constant CLK_SEL_28_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_28,40);
  constant CLK_SEL_29_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_29,40);
  constant CLK_SEL_30_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_30,40);
  constant CLK_SEL_31_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(CLK_SEL_31,40);
  constant DA_LOCKOUT_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DA_LOCKOUT_0,40);
  constant DA_LOCKOUT_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DA_LOCKOUT_1,40);
  constant DEBUG_MODE_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant DEBUG_MODE_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant DLL_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant DLL_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant IO_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant IO_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_10_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_11_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_12_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_13_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_14_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_15_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_2_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_3_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_4_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_5_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_6_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_7_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_8_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_9_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_ENABLE_00_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_00,40);
  constant MC_ENABLE_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_01,40);
  constant MC_ENABLE_02_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_02,40);
  constant MC_ENABLE_03_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_03,40);
  constant MC_ENABLE_04_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_04,40);
  constant MC_ENABLE_05_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_05,40);
  constant MC_ENABLE_06_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_06,40);
  constant MC_ENABLE_07_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_07,40);
  constant MC_ENABLE_08_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_08,40);
  constant MC_ENABLE_09_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_09,40);
  constant MC_ENABLE_10_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_10,40);
  constant MC_ENABLE_11_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_11,40);
  constant MC_ENABLE_12_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_12,40);
  constant MC_ENABLE_13_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_13,40);
  constant MC_ENABLE_14_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_14,40);
  constant MC_ENABLE_15_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_15,40);
  constant MC_ENABLE_APB_00_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_APB_00,40);
  constant MC_ENABLE_APB_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_APB_01,40);
  constant MC_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_10_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_11_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_12_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_13_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_14_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_15_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_2_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_3_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_4_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_5_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_6_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_7_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_8_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_9_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant PHY_CSSD_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant PHY_CSSD_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant PHY_ENABLE_00_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_00,40);
  constant PHY_ENABLE_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_01,40);
  constant PHY_ENABLE_02_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_02,40);
  constant PHY_ENABLE_03_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_03,40);
  constant PHY_ENABLE_04_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_04,40);
  constant PHY_ENABLE_05_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_05,40);
  constant PHY_ENABLE_06_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_06,40);
  constant PHY_ENABLE_07_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_07,40);
  constant PHY_ENABLE_08_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_08,40);
  constant PHY_ENABLE_09_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_09,40);
  constant PHY_ENABLE_10_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_10,40);
  constant PHY_ENABLE_11_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_11,40);
  constant PHY_ENABLE_12_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_12,40);
  constant PHY_ENABLE_13_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_13,40);
  constant PHY_ENABLE_14_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_14,40);
  constant PHY_ENABLE_15_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_15,40);
  constant PHY_ENABLE_16_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_16,40);
  constant PHY_ENABLE_17_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_17,40);
  constant PHY_ENABLE_18_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_18,40);
  constant PHY_ENABLE_19_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_19,40);
  constant PHY_ENABLE_20_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_20,40);
  constant PHY_ENABLE_21_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_21,40);
  constant PHY_ENABLE_22_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_22,40);
  constant PHY_ENABLE_23_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_23,40);
  constant PHY_ENABLE_24_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_24,40);
  constant PHY_ENABLE_25_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_25,40);
  constant PHY_ENABLE_26_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_26,40);
  constant PHY_ENABLE_27_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_27,40);
  constant PHY_ENABLE_28_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_28,40);
  constant PHY_ENABLE_29_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_29,40);
  constant PHY_ENABLE_30_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_30,40);
  constant PHY_ENABLE_31_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_31,40);
  constant PHY_ENABLE_APB_00_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_APB_00,40);
  constant PHY_ENABLE_APB_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_APB_01,40);
  constant PHY_PCLK_INVERT_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_PCLK_INVERT_01,40);
  constant PHY_PCLK_INVERT_02_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_PCLK_INVERT_02,40);
  constant PHY_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant PHY_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant SWITCH_ENABLE_00_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SWITCH_ENABLE_00,40);
  constant SWITCH_ENABLE_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SWITCH_ENABLE_01,40);
  constant SWITCH_ENABLE_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant SWITCH_ENABLE_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant SW_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant SW_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);

  constant ANALOG_MUX_SEL_0_BIN : std_logic_vector(7 downto 0) := X"00";
  constant ANALOG_MUX_SEL_1_BIN : std_logic_vector(7 downto 0) := X"00";
  constant DATARATE_00_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_00,11));
  constant DATARATE_01_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_01,11));
  constant DATARATE_02_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_02,11));
  constant DATARATE_03_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_03,11));
  constant DATARATE_04_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_04,11));
  constant DATARATE_05_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_05,11));
  constant DATARATE_06_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_06,11));
  constant DATARATE_07_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_07,11));
  constant DATARATE_08_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_08,11));
  constant DATARATE_09_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_09,11));
  constant DATARATE_10_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_10,11));
  constant DATARATE_11_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_11,11));
  constant DATARATE_12_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_12,11));
  constant DATARATE_13_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_13,11));
  constant DATARATE_14_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_14,11));
  constant DATARATE_15_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_15,11));
  constant DBG_BYPASS_VAL_0_BIN : std_logic_vector(51 downto 0) := X"FFFFFFFFFFFFF";
  constant DBG_BYPASS_VAL_1_BIN : std_logic_vector(51 downto 0) := X"FFFFFFFFFFFFF";
  constant DFI_BYPASS_VAL_0_BIN : std_logic_vector(51 downto 0) := X"0000000000000";
  constant DFI_BYPASS_VAL_1_BIN : std_logic_vector(51 downto 0) := X"0000000000000";
  constant PAGEHIT_PERCENT_00_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(PAGEHIT_PERCENT_00,7));
  constant PAGEHIT_PERCENT_01_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(PAGEHIT_PERCENT_01,7));
  constant READ_PERCENT_00_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_00,7));
  constant READ_PERCENT_01_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_01,7));
  constant READ_PERCENT_02_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_02,7));
  constant READ_PERCENT_03_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_03,7));
  constant READ_PERCENT_04_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_04,7));
  constant READ_PERCENT_05_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_05,7));
  constant READ_PERCENT_06_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_06,7));
  constant READ_PERCENT_07_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_07,7));
  constant READ_PERCENT_08_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_08,7));
  constant READ_PERCENT_09_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_09,7));
  constant READ_PERCENT_10_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_10,7));
  constant READ_PERCENT_11_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_11,7));
  constant READ_PERCENT_12_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_12,7));
  constant READ_PERCENT_13_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_13,7));
  constant READ_PERCENT_14_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_14,7));
  constant READ_PERCENT_15_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_15,7));
  constant READ_PERCENT_16_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_16,7));
  constant READ_PERCENT_17_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_17,7));
  constant READ_PERCENT_18_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_18,7));
  constant READ_PERCENT_19_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_19,7));
  constant READ_PERCENT_20_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_20,7));
  constant READ_PERCENT_21_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_21,7));
  constant READ_PERCENT_22_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_22,7));
  constant READ_PERCENT_23_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_23,7));
  constant READ_PERCENT_24_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_24,7));
  constant READ_PERCENT_25_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_25,7));
  constant READ_PERCENT_26_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_26,7));
  constant READ_PERCENT_27_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_27,7));
  constant READ_PERCENT_28_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_28,7));
  constant READ_PERCENT_29_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_29,7));
  constant READ_PERCENT_30_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_30,7));
  constant READ_PERCENT_31_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(READ_PERCENT_31,7));
  constant WRITE_PERCENT_00_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_00,7));
  constant WRITE_PERCENT_01_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_01,7));
  constant WRITE_PERCENT_02_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_02,7));
  constant WRITE_PERCENT_03_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_03,7));
  constant WRITE_PERCENT_04_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_04,7));
  constant WRITE_PERCENT_05_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_05,7));
  constant WRITE_PERCENT_06_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_06,7));
  constant WRITE_PERCENT_07_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_07,7));
  constant WRITE_PERCENT_08_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_08,7));
  constant WRITE_PERCENT_09_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_09,7));
  constant WRITE_PERCENT_10_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_10,7));
  constant WRITE_PERCENT_11_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_11,7));
  constant WRITE_PERCENT_12_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_12,7));
  constant WRITE_PERCENT_13_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_13,7));
  constant WRITE_PERCENT_14_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_14,7));
  constant WRITE_PERCENT_15_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_15,7));
  constant WRITE_PERCENT_16_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_16,7));
  constant WRITE_PERCENT_17_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_17,7));
  constant WRITE_PERCENT_18_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_18,7));
  constant WRITE_PERCENT_19_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_19,7));
  constant WRITE_PERCENT_20_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_20,7));
  constant WRITE_PERCENT_21_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_21,7));
  constant WRITE_PERCENT_22_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_22,7));
  constant WRITE_PERCENT_23_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_23,7));
  constant WRITE_PERCENT_24_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_24,7));
  constant WRITE_PERCENT_25_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_25,7));
  constant WRITE_PERCENT_26_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_26,7));
  constant WRITE_PERCENT_27_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_27,7));
  constant WRITE_PERCENT_28_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_28,7));
  constant WRITE_PERCENT_29_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_29,7));
  constant WRITE_PERCENT_30_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_30,7));
  constant WRITE_PERCENT_31_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(WRITE_PERCENT_31,7));
  signal IS_APB_0_PCLK_INVERTED_BIN : std_ulogic := TO_X01(IS_APB_0_PCLK_INVERTED);
  signal IS_APB_0_PRESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_APB_0_PRESET_N_INVERTED);
  signal IS_APB_1_PCLK_INVERTED_BIN : std_ulogic := TO_X01(IS_APB_1_PCLK_INVERTED);
  signal IS_APB_1_PRESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_APB_1_PRESET_N_INVERTED);
  signal IS_AXI_00_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_00_ACLK_INVERTED);
  signal IS_AXI_00_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_00_ARESET_N_INVERTED);
  signal IS_AXI_01_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_01_ACLK_INVERTED);
  signal IS_AXI_01_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_01_ARESET_N_INVERTED);
  signal IS_AXI_02_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_02_ACLK_INVERTED);
  signal IS_AXI_02_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_02_ARESET_N_INVERTED);
  signal IS_AXI_03_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_03_ACLK_INVERTED);
  signal IS_AXI_03_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_03_ARESET_N_INVERTED);
  signal IS_AXI_04_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_04_ACLK_INVERTED);
  signal IS_AXI_04_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_04_ARESET_N_INVERTED);
  signal IS_AXI_05_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_05_ACLK_INVERTED);
  signal IS_AXI_05_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_05_ARESET_N_INVERTED);
  signal IS_AXI_06_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_06_ACLK_INVERTED);
  signal IS_AXI_06_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_06_ARESET_N_INVERTED);
  signal IS_AXI_07_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_07_ACLK_INVERTED);
  signal IS_AXI_07_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_07_ARESET_N_INVERTED);
  signal IS_AXI_08_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_08_ACLK_INVERTED);
  signal IS_AXI_08_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_08_ARESET_N_INVERTED);
  signal IS_AXI_09_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_09_ACLK_INVERTED);
  signal IS_AXI_09_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_09_ARESET_N_INVERTED);
  signal IS_AXI_10_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_10_ACLK_INVERTED);
  signal IS_AXI_10_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_10_ARESET_N_INVERTED);
  signal IS_AXI_11_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_11_ACLK_INVERTED);
  signal IS_AXI_11_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_11_ARESET_N_INVERTED);
  signal IS_AXI_12_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_12_ACLK_INVERTED);
  signal IS_AXI_12_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_12_ARESET_N_INVERTED);
  signal IS_AXI_13_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_13_ACLK_INVERTED);
  signal IS_AXI_13_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_13_ARESET_N_INVERTED);
  signal IS_AXI_14_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_14_ACLK_INVERTED);
  signal IS_AXI_14_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_14_ARESET_N_INVERTED);
  signal IS_AXI_15_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_15_ACLK_INVERTED);
  signal IS_AXI_15_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_15_ARESET_N_INVERTED);
  signal IS_AXI_16_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_16_ACLK_INVERTED);
  signal IS_AXI_16_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_16_ARESET_N_INVERTED);
  signal IS_AXI_17_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_17_ACLK_INVERTED);
  signal IS_AXI_17_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_17_ARESET_N_INVERTED);
  signal IS_AXI_18_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_18_ACLK_INVERTED);
  signal IS_AXI_18_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_18_ARESET_N_INVERTED);
  signal IS_AXI_19_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_19_ACLK_INVERTED);
  signal IS_AXI_19_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_19_ARESET_N_INVERTED);
  signal IS_AXI_20_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_20_ACLK_INVERTED);
  signal IS_AXI_20_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_20_ARESET_N_INVERTED);
  signal IS_AXI_21_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_21_ACLK_INVERTED);
  signal IS_AXI_21_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_21_ARESET_N_INVERTED);
  signal IS_AXI_22_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_22_ACLK_INVERTED);
  signal IS_AXI_22_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_22_ARESET_N_INVERTED);
  signal IS_AXI_23_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_23_ACLK_INVERTED);
  signal IS_AXI_23_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_23_ARESET_N_INVERTED);
  signal IS_AXI_24_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_24_ACLK_INVERTED);
  signal IS_AXI_24_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_24_ARESET_N_INVERTED);
  signal IS_AXI_25_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_25_ACLK_INVERTED);
  signal IS_AXI_25_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_25_ARESET_N_INVERTED);
  signal IS_AXI_26_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_26_ACLK_INVERTED);
  signal IS_AXI_26_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_26_ARESET_N_INVERTED);
  signal IS_AXI_27_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_27_ACLK_INVERTED);
  signal IS_AXI_27_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_27_ARESET_N_INVERTED);
  signal IS_AXI_28_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_28_ACLK_INVERTED);
  signal IS_AXI_28_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_28_ARESET_N_INVERTED);
  signal IS_AXI_29_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_29_ACLK_INVERTED);
  signal IS_AXI_29_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_29_ARESET_N_INVERTED);
  signal IS_AXI_30_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_30_ACLK_INVERTED);
  signal IS_AXI_30_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_30_ARESET_N_INVERTED);
  signal IS_AXI_31_ACLK_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_31_ACLK_INVERTED);
  signal IS_AXI_31_ARESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_AXI_31_ARESET_N_INVERTED);


-- Parameter encodings and registers

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal APB_0_PRDATA_out : std_logic_vector(31 downto 0);
  signal APB_0_PREADY_out : std_ulogic;
  signal APB_0_PSLVERR_out : std_ulogic;
  signal APB_1_PRDATA_out : std_logic_vector(31 downto 0);
  signal APB_1_PREADY_out : std_ulogic;
  signal APB_1_PSLVERR_out : std_ulogic;
  signal AXI_00_ARREADY_out : std_ulogic;
  signal AXI_00_AWREADY_out : std_ulogic;
  signal AXI_00_BID_out : std_logic_vector(5 downto 0);
  signal AXI_00_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_00_BVALID_out : std_ulogic;
  signal AXI_00_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_00_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_00_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_00_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_00_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_00_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_00_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_00_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_00_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_00_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_00_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_00_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_00_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_00_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_00_RID_out : std_logic_vector(5 downto 0);
  signal AXI_00_RLAST_out : std_ulogic;
  signal AXI_00_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_00_RVALID_out : std_ulogic;
  signal AXI_00_WREADY_out : std_ulogic;
  signal AXI_01_ARREADY_out : std_ulogic;
  signal AXI_01_AWREADY_out : std_ulogic;
  signal AXI_01_BID_out : std_logic_vector(5 downto 0);
  signal AXI_01_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_01_BVALID_out : std_ulogic;
  signal AXI_01_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_01_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_01_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_01_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_01_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_01_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_01_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_01_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_01_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_01_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_01_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_01_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_01_RID_out : std_logic_vector(5 downto 0);
  signal AXI_01_RLAST_out : std_ulogic;
  signal AXI_01_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_01_RVALID_out : std_ulogic;
  signal AXI_01_WREADY_out : std_ulogic;
  signal AXI_02_ARREADY_out : std_ulogic;
  signal AXI_02_AWREADY_out : std_ulogic;
  signal AXI_02_BID_out : std_logic_vector(5 downto 0);
  signal AXI_02_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_02_BVALID_out : std_ulogic;
  signal AXI_02_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_02_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_02_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_02_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_02_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_02_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_02_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_02_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_02_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_02_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_02_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_02_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_02_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_02_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_02_RID_out : std_logic_vector(5 downto 0);
  signal AXI_02_RLAST_out : std_ulogic;
  signal AXI_02_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_02_RVALID_out : std_ulogic;
  signal AXI_02_WREADY_out : std_ulogic;
  signal AXI_03_ARREADY_out : std_ulogic;
  signal AXI_03_AWREADY_out : std_ulogic;
  signal AXI_03_BID_out : std_logic_vector(5 downto 0);
  signal AXI_03_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_03_BVALID_out : std_ulogic;
  signal AXI_03_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_03_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_03_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_03_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_03_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_03_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_03_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_03_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_03_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_03_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_03_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_03_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_03_RID_out : std_logic_vector(5 downto 0);
  signal AXI_03_RLAST_out : std_ulogic;
  signal AXI_03_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_03_RVALID_out : std_ulogic;
  signal AXI_03_WREADY_out : std_ulogic;
  signal AXI_04_ARREADY_out : std_ulogic;
  signal AXI_04_AWREADY_out : std_ulogic;
  signal AXI_04_BID_out : std_logic_vector(5 downto 0);
  signal AXI_04_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_04_BVALID_out : std_ulogic;
  signal AXI_04_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_04_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_04_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_04_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_04_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_04_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_04_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_04_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_04_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_04_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_04_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_04_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_04_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_04_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_04_RID_out : std_logic_vector(5 downto 0);
  signal AXI_04_RLAST_out : std_ulogic;
  signal AXI_04_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_04_RVALID_out : std_ulogic;
  signal AXI_04_WREADY_out : std_ulogic;
  signal AXI_05_ARREADY_out : std_ulogic;
  signal AXI_05_AWREADY_out : std_ulogic;
  signal AXI_05_BID_out : std_logic_vector(5 downto 0);
  signal AXI_05_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_05_BVALID_out : std_ulogic;
  signal AXI_05_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_05_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_05_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_05_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_05_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_05_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_05_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_05_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_05_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_05_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_05_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_05_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_05_RID_out : std_logic_vector(5 downto 0);
  signal AXI_05_RLAST_out : std_ulogic;
  signal AXI_05_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_05_RVALID_out : std_ulogic;
  signal AXI_05_WREADY_out : std_ulogic;
  signal AXI_06_ARREADY_out : std_ulogic;
  signal AXI_06_AWREADY_out : std_ulogic;
  signal AXI_06_BID_out : std_logic_vector(5 downto 0);
  signal AXI_06_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_06_BVALID_out : std_ulogic;
  signal AXI_06_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_06_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_06_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_06_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_06_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_06_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_06_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_06_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_06_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_06_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_06_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_06_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_06_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_06_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_06_RID_out : std_logic_vector(5 downto 0);
  signal AXI_06_RLAST_out : std_ulogic;
  signal AXI_06_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_06_RVALID_out : std_ulogic;
  signal AXI_06_WREADY_out : std_ulogic;
  signal AXI_07_ARREADY_out : std_ulogic;
  signal AXI_07_AWREADY_out : std_ulogic;
  signal AXI_07_BID_out : std_logic_vector(5 downto 0);
  signal AXI_07_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_07_BVALID_out : std_ulogic;
  signal AXI_07_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_07_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_07_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_07_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_07_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_07_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_07_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_07_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_07_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_07_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_07_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_07_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_07_RID_out : std_logic_vector(5 downto 0);
  signal AXI_07_RLAST_out : std_ulogic;
  signal AXI_07_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_07_RVALID_out : std_ulogic;
  signal AXI_07_WREADY_out : std_ulogic;
  signal AXI_08_ARREADY_out : std_ulogic;
  signal AXI_08_AWREADY_out : std_ulogic;
  signal AXI_08_BID_out : std_logic_vector(5 downto 0);
  signal AXI_08_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_08_BVALID_out : std_ulogic;
  signal AXI_08_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_08_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_08_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_08_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_08_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_08_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_08_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_08_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_08_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_08_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_08_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_08_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_08_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_08_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_08_RID_out : std_logic_vector(5 downto 0);
  signal AXI_08_RLAST_out : std_ulogic;
  signal AXI_08_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_08_RVALID_out : std_ulogic;
  signal AXI_08_WREADY_out : std_ulogic;
  signal AXI_09_ARREADY_out : std_ulogic;
  signal AXI_09_AWREADY_out : std_ulogic;
  signal AXI_09_BID_out : std_logic_vector(5 downto 0);
  signal AXI_09_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_09_BVALID_out : std_ulogic;
  signal AXI_09_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_09_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_09_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_09_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_09_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_09_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_09_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_09_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_09_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_09_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_09_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_09_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_09_RID_out : std_logic_vector(5 downto 0);
  signal AXI_09_RLAST_out : std_ulogic;
  signal AXI_09_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_09_RVALID_out : std_ulogic;
  signal AXI_09_WREADY_out : std_ulogic;
  signal AXI_10_ARREADY_out : std_ulogic;
  signal AXI_10_AWREADY_out : std_ulogic;
  signal AXI_10_BID_out : std_logic_vector(5 downto 0);
  signal AXI_10_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_10_BVALID_out : std_ulogic;
  signal AXI_10_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_10_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_10_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_10_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_10_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_10_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_10_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_10_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_10_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_10_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_10_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_10_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_10_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_10_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_10_RID_out : std_logic_vector(5 downto 0);
  signal AXI_10_RLAST_out : std_ulogic;
  signal AXI_10_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_10_RVALID_out : std_ulogic;
  signal AXI_10_WREADY_out : std_ulogic;
  signal AXI_11_ARREADY_out : std_ulogic;
  signal AXI_11_AWREADY_out : std_ulogic;
  signal AXI_11_BID_out : std_logic_vector(5 downto 0);
  signal AXI_11_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_11_BVALID_out : std_ulogic;
  signal AXI_11_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_11_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_11_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_11_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_11_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_11_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_11_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_11_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_11_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_11_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_11_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_11_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_11_RID_out : std_logic_vector(5 downto 0);
  signal AXI_11_RLAST_out : std_ulogic;
  signal AXI_11_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_11_RVALID_out : std_ulogic;
  signal AXI_11_WREADY_out : std_ulogic;
  signal AXI_12_ARREADY_out : std_ulogic;
  signal AXI_12_AWREADY_out : std_ulogic;
  signal AXI_12_BID_out : std_logic_vector(5 downto 0);
  signal AXI_12_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_12_BVALID_out : std_ulogic;
  signal AXI_12_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_12_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_12_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_12_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_12_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_12_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_12_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_12_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_12_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_12_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_12_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_12_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_12_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_12_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_12_RID_out : std_logic_vector(5 downto 0);
  signal AXI_12_RLAST_out : std_ulogic;
  signal AXI_12_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_12_RVALID_out : std_ulogic;
  signal AXI_12_WREADY_out : std_ulogic;
  signal AXI_13_ARREADY_out : std_ulogic;
  signal AXI_13_AWREADY_out : std_ulogic;
  signal AXI_13_BID_out : std_logic_vector(5 downto 0);
  signal AXI_13_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_13_BVALID_out : std_ulogic;
  signal AXI_13_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_13_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_13_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_13_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_13_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_13_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_13_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_13_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_13_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_13_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_13_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_13_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_13_RID_out : std_logic_vector(5 downto 0);
  signal AXI_13_RLAST_out : std_ulogic;
  signal AXI_13_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_13_RVALID_out : std_ulogic;
  signal AXI_13_WREADY_out : std_ulogic;
  signal AXI_14_ARREADY_out : std_ulogic;
  signal AXI_14_AWREADY_out : std_ulogic;
  signal AXI_14_BID_out : std_logic_vector(5 downto 0);
  signal AXI_14_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_14_BVALID_out : std_ulogic;
  signal AXI_14_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_14_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_14_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_14_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_14_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_14_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_14_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_14_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_14_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_14_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_14_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_14_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_14_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_14_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_14_RID_out : std_logic_vector(5 downto 0);
  signal AXI_14_RLAST_out : std_ulogic;
  signal AXI_14_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_14_RVALID_out : std_ulogic;
  signal AXI_14_WREADY_out : std_ulogic;
  signal AXI_15_ARREADY_out : std_ulogic;
  signal AXI_15_AWREADY_out : std_ulogic;
  signal AXI_15_BID_out : std_logic_vector(5 downto 0);
  signal AXI_15_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_15_BVALID_out : std_ulogic;
  signal AXI_15_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_15_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_15_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_15_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_15_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_15_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_15_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_15_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_15_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_15_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_15_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_15_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_15_RID_out : std_logic_vector(5 downto 0);
  signal AXI_15_RLAST_out : std_ulogic;
  signal AXI_15_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_15_RVALID_out : std_ulogic;
  signal AXI_15_WREADY_out : std_ulogic;
  signal AXI_16_ARREADY_out : std_ulogic;
  signal AXI_16_AWREADY_out : std_ulogic;
  signal AXI_16_BID_out : std_logic_vector(5 downto 0);
  signal AXI_16_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_16_BVALID_out : std_ulogic;
  signal AXI_16_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_16_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_16_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_16_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_16_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_16_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_16_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_16_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_16_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_16_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_16_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_16_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_16_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_16_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_16_RID_out : std_logic_vector(5 downto 0);
  signal AXI_16_RLAST_out : std_ulogic;
  signal AXI_16_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_16_RVALID_out : std_ulogic;
  signal AXI_16_WREADY_out : std_ulogic;
  signal AXI_17_ARREADY_out : std_ulogic;
  signal AXI_17_AWREADY_out : std_ulogic;
  signal AXI_17_BID_out : std_logic_vector(5 downto 0);
  signal AXI_17_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_17_BVALID_out : std_ulogic;
  signal AXI_17_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_17_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_17_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_17_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_17_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_17_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_17_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_17_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_17_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_17_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_17_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_17_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_17_RID_out : std_logic_vector(5 downto 0);
  signal AXI_17_RLAST_out : std_ulogic;
  signal AXI_17_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_17_RVALID_out : std_ulogic;
  signal AXI_17_WREADY_out : std_ulogic;
  signal AXI_18_ARREADY_out : std_ulogic;
  signal AXI_18_AWREADY_out : std_ulogic;
  signal AXI_18_BID_out : std_logic_vector(5 downto 0);
  signal AXI_18_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_18_BVALID_out : std_ulogic;
  signal AXI_18_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_18_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_18_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_18_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_18_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_18_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_18_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_18_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_18_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_18_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_18_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_18_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_18_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_18_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_18_RID_out : std_logic_vector(5 downto 0);
  signal AXI_18_RLAST_out : std_ulogic;
  signal AXI_18_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_18_RVALID_out : std_ulogic;
  signal AXI_18_WREADY_out : std_ulogic;
  signal AXI_19_ARREADY_out : std_ulogic;
  signal AXI_19_AWREADY_out : std_ulogic;
  signal AXI_19_BID_out : std_logic_vector(5 downto 0);
  signal AXI_19_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_19_BVALID_out : std_ulogic;
  signal AXI_19_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_19_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_19_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_19_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_19_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_19_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_19_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_19_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_19_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_19_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_19_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_19_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_19_RID_out : std_logic_vector(5 downto 0);
  signal AXI_19_RLAST_out : std_ulogic;
  signal AXI_19_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_19_RVALID_out : std_ulogic;
  signal AXI_19_WREADY_out : std_ulogic;
  signal AXI_20_ARREADY_out : std_ulogic;
  signal AXI_20_AWREADY_out : std_ulogic;
  signal AXI_20_BID_out : std_logic_vector(5 downto 0);
  signal AXI_20_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_20_BVALID_out : std_ulogic;
  signal AXI_20_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_20_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_20_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_20_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_20_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_20_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_20_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_20_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_20_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_20_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_20_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_20_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_20_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_20_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_20_RID_out : std_logic_vector(5 downto 0);
  signal AXI_20_RLAST_out : std_ulogic;
  signal AXI_20_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_20_RVALID_out : std_ulogic;
  signal AXI_20_WREADY_out : std_ulogic;
  signal AXI_21_ARREADY_out : std_ulogic;
  signal AXI_21_AWREADY_out : std_ulogic;
  signal AXI_21_BID_out : std_logic_vector(5 downto 0);
  signal AXI_21_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_21_BVALID_out : std_ulogic;
  signal AXI_21_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_21_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_21_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_21_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_21_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_21_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_21_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_21_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_21_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_21_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_21_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_21_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_21_RID_out : std_logic_vector(5 downto 0);
  signal AXI_21_RLAST_out : std_ulogic;
  signal AXI_21_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_21_RVALID_out : std_ulogic;
  signal AXI_21_WREADY_out : std_ulogic;
  signal AXI_22_ARREADY_out : std_ulogic;
  signal AXI_22_AWREADY_out : std_ulogic;
  signal AXI_22_BID_out : std_logic_vector(5 downto 0);
  signal AXI_22_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_22_BVALID_out : std_ulogic;
  signal AXI_22_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_22_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_22_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_22_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_22_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_22_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_22_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_22_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_22_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_22_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_22_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_22_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_22_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_22_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_22_RID_out : std_logic_vector(5 downto 0);
  signal AXI_22_RLAST_out : std_ulogic;
  signal AXI_22_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_22_RVALID_out : std_ulogic;
  signal AXI_22_WREADY_out : std_ulogic;
  signal AXI_23_ARREADY_out : std_ulogic;
  signal AXI_23_AWREADY_out : std_ulogic;
  signal AXI_23_BID_out : std_logic_vector(5 downto 0);
  signal AXI_23_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_23_BVALID_out : std_ulogic;
  signal AXI_23_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_23_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_23_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_23_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_23_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_23_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_23_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_23_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_23_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_23_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_23_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_23_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_23_RID_out : std_logic_vector(5 downto 0);
  signal AXI_23_RLAST_out : std_ulogic;
  signal AXI_23_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_23_RVALID_out : std_ulogic;
  signal AXI_23_WREADY_out : std_ulogic;
  signal AXI_24_ARREADY_out : std_ulogic;
  signal AXI_24_AWREADY_out : std_ulogic;
  signal AXI_24_BID_out : std_logic_vector(5 downto 0);
  signal AXI_24_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_24_BVALID_out : std_ulogic;
  signal AXI_24_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_24_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_24_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_24_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_24_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_24_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_24_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_24_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_24_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_24_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_24_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_24_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_24_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_24_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_24_RID_out : std_logic_vector(5 downto 0);
  signal AXI_24_RLAST_out : std_ulogic;
  signal AXI_24_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_24_RVALID_out : std_ulogic;
  signal AXI_24_WREADY_out : std_ulogic;
  signal AXI_25_ARREADY_out : std_ulogic;
  signal AXI_25_AWREADY_out : std_ulogic;
  signal AXI_25_BID_out : std_logic_vector(5 downto 0);
  signal AXI_25_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_25_BVALID_out : std_ulogic;
  signal AXI_25_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_25_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_25_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_25_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_25_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_25_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_25_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_25_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_25_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_25_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_25_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_25_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_25_RID_out : std_logic_vector(5 downto 0);
  signal AXI_25_RLAST_out : std_ulogic;
  signal AXI_25_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_25_RVALID_out : std_ulogic;
  signal AXI_25_WREADY_out : std_ulogic;
  signal AXI_26_ARREADY_out : std_ulogic;
  signal AXI_26_AWREADY_out : std_ulogic;
  signal AXI_26_BID_out : std_logic_vector(5 downto 0);
  signal AXI_26_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_26_BVALID_out : std_ulogic;
  signal AXI_26_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_26_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_26_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_26_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_26_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_26_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_26_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_26_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_26_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_26_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_26_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_26_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_26_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_26_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_26_RID_out : std_logic_vector(5 downto 0);
  signal AXI_26_RLAST_out : std_ulogic;
  signal AXI_26_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_26_RVALID_out : std_ulogic;
  signal AXI_26_WREADY_out : std_ulogic;
  signal AXI_27_ARREADY_out : std_ulogic;
  signal AXI_27_AWREADY_out : std_ulogic;
  signal AXI_27_BID_out : std_logic_vector(5 downto 0);
  signal AXI_27_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_27_BVALID_out : std_ulogic;
  signal AXI_27_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_27_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_27_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_27_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_27_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_27_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_27_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_27_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_27_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_27_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_27_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_27_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_27_RID_out : std_logic_vector(5 downto 0);
  signal AXI_27_RLAST_out : std_ulogic;
  signal AXI_27_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_27_RVALID_out : std_ulogic;
  signal AXI_27_WREADY_out : std_ulogic;
  signal AXI_28_ARREADY_out : std_ulogic;
  signal AXI_28_AWREADY_out : std_ulogic;
  signal AXI_28_BID_out : std_logic_vector(5 downto 0);
  signal AXI_28_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_28_BVALID_out : std_ulogic;
  signal AXI_28_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_28_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_28_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_28_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_28_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_28_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_28_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_28_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_28_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_28_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_28_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_28_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_28_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_28_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_28_RID_out : std_logic_vector(5 downto 0);
  signal AXI_28_RLAST_out : std_ulogic;
  signal AXI_28_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_28_RVALID_out : std_ulogic;
  signal AXI_28_WREADY_out : std_ulogic;
  signal AXI_29_ARREADY_out : std_ulogic;
  signal AXI_29_AWREADY_out : std_ulogic;
  signal AXI_29_BID_out : std_logic_vector(5 downto 0);
  signal AXI_29_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_29_BVALID_out : std_ulogic;
  signal AXI_29_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_29_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_29_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_29_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_29_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_29_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_29_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_29_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_29_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_29_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_29_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_29_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_29_RID_out : std_logic_vector(5 downto 0);
  signal AXI_29_RLAST_out : std_ulogic;
  signal AXI_29_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_29_RVALID_out : std_ulogic;
  signal AXI_29_WREADY_out : std_ulogic;
  signal AXI_30_ARREADY_out : std_ulogic;
  signal AXI_30_AWREADY_out : std_ulogic;
  signal AXI_30_BID_out : std_logic_vector(5 downto 0);
  signal AXI_30_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_30_BVALID_out : std_ulogic;
  signal AXI_30_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_30_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_30_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_30_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_30_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_30_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_30_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_30_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_30_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_30_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_30_MC_STATUS_out : std_logic_vector(5 downto 0);
  signal AXI_30_PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal AXI_30_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_30_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_30_RID_out : std_logic_vector(5 downto 0);
  signal AXI_30_RLAST_out : std_ulogic;
  signal AXI_30_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_30_RVALID_out : std_ulogic;
  signal AXI_30_WREADY_out : std_ulogic;
  signal AXI_31_ARREADY_out : std_ulogic;
  signal AXI_31_AWREADY_out : std_ulogic;
  signal AXI_31_BID_out : std_logic_vector(5 downto 0);
  signal AXI_31_BRESP_out : std_logic_vector(1 downto 0);
  signal AXI_31_BVALID_out : std_ulogic;
  signal AXI_31_DFI_AW_AERR_N_out : std_logic_vector(1 downto 0);
  signal AXI_31_DFI_CLK_BUF_out : std_ulogic;
  signal AXI_31_DFI_DBI_BYTE_DISABLE_out : std_logic_vector(7 downto 0);
  signal AXI_31_DFI_DW_RDDATA_DBI_out : std_logic_vector(20 downto 0);
  signal AXI_31_DFI_DW_RDDATA_DERR_out : std_logic_vector(7 downto 0);
  signal AXI_31_DFI_DW_RDDATA_VALID_out : std_logic_vector(1 downto 0);
  signal AXI_31_DFI_INIT_COMPLETE_out : std_ulogic;
  signal AXI_31_DFI_PHYUPD_REQ_out : std_ulogic;
  signal AXI_31_DFI_PHY_LP_STATE_out : std_ulogic;
  signal AXI_31_DFI_RST_N_BUF_out : std_ulogic;
  signal AXI_31_RDATA_PARITY_out : std_logic_vector(31 downto 0);
  signal AXI_31_RDATA_out : std_logic_vector(255 downto 0);
  signal AXI_31_RID_out : std_logic_vector(5 downto 0);
  signal AXI_31_RLAST_out : std_ulogic;
  signal AXI_31_RRESP_out : std_logic_vector(1 downto 0);
  signal AXI_31_RVALID_out : std_ulogic;
  signal AXI_31_WREADY_out : std_ulogic;
  signal BLI_SCAN_OUT_00_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_01_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_02_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_03_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_04_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_05_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_06_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_07_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_08_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_09_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_10_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_11_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_12_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_13_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_14_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_15_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_16_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_17_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_18_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_19_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_20_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_21_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_22_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_23_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_24_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_25_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_26_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_27_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_28_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_29_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_30_out : std_logic_vector(7 downto 0);
  signal BLI_SCAN_OUT_31_out : std_logic_vector(7 downto 0);
  signal DBG_OUT_00_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_01_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_02_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_03_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_04_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_05_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_06_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_07_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_08_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_09_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_10_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_11_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_12_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_13_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_14_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_15_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_16_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_17_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_18_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_19_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_20_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_21_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_22_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_23_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_24_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_25_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_26_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_27_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_28_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_29_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_30_out : std_logic_vector(17 downto 0);
  signal DBG_OUT_31_out : std_logic_vector(17 downto 0);
  signal DLL_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal DLL_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal DRAM_0_STAT_CATTRIP_out : std_ulogic;
  signal DRAM_0_STAT_TEMP_out : std_logic_vector(2 downto 0);
  signal DRAM_1_STAT_CATTRIP_out : std_ulogic;
  signal DRAM_1_STAT_TEMP_out : std_logic_vector(2 downto 0);
  signal IO_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal IO_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_02_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_03_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_04_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_05_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_06_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_07_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_08_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_09_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_10_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_11_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_12_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_13_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_14_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_15_out : std_logic_vector(1 downto 0);
  signal PHY_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal PHY_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal STATUS_00_out : std_logic_vector(1 downto 0);
  signal STATUS_01_out : std_logic_vector(1 downto 0);
  signal STATUS_02_out : std_logic_vector(1 downto 0);
  signal STATUS_03_out : std_logic_vector(1 downto 0);
  signal STATUS_04_out : std_logic_vector(1 downto 0);
  signal STATUS_05_out : std_logic_vector(1 downto 0);
  signal STATUS_06_out : std_logic_vector(1 downto 0);
  signal STATUS_07_out : std_logic_vector(1 downto 0);
  signal STATUS_08_out : std_logic_vector(1 downto 0);
  signal STATUS_09_out : std_logic_vector(1 downto 0);
  signal STATUS_10_out : std_logic_vector(1 downto 0);
  signal STATUS_11_out : std_logic_vector(1 downto 0);
  signal STATUS_12_out : std_logic_vector(1 downto 0);
  signal STATUS_13_out : std_logic_vector(1 downto 0);
  signal STATUS_14_out : std_logic_vector(1 downto 0);
  signal STATUS_15_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_02_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_03_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_04_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_05_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_06_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_07_out : std_logic_vector(1 downto 0);
  
  signal ANALOG_HBM_SEL_00_in : std_ulogic;
  signal ANALOG_HBM_SEL_01_in : std_ulogic;
  signal APB_0_PADDR_in : std_logic_vector(21 downto 0);
  signal APB_0_PCLK_in : std_ulogic;
  signal APB_0_PENABLE_in : std_ulogic;
  signal APB_0_PRESET_N_in : std_ulogic;
  signal APB_0_PSEL_in : std_ulogic;
  signal APB_0_PWDATA_in : std_logic_vector(31 downto 0);
  signal APB_0_PWRITE_in : std_ulogic;
  signal APB_1_PADDR_in : std_logic_vector(21 downto 0);
  signal APB_1_PCLK_in : std_ulogic;
  signal APB_1_PENABLE_in : std_ulogic;
  signal APB_1_PRESET_N_in : std_ulogic;
  signal APB_1_PSEL_in : std_ulogic;
  signal APB_1_PWDATA_in : std_logic_vector(31 downto 0);
  signal APB_1_PWRITE_in : std_ulogic;
  signal AXI_00_ACLK_in : std_ulogic;
  signal AXI_00_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_00_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_00_ARESET_N_in : std_ulogic;
  signal AXI_00_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_00_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_00_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_00_ARVALID_in : std_ulogic;
  signal AXI_00_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_00_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_00_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_00_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_00_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_00_AWVALID_in : std_ulogic;
  signal AXI_00_BREADY_in : std_ulogic;
  signal AXI_00_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_00_RREADY_in : std_ulogic;
  signal AXI_00_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_00_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_00_WLAST_in : std_ulogic;
  signal AXI_00_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_00_WVALID_in : std_ulogic;
  signal AXI_01_ACLK_in : std_ulogic;
  signal AXI_01_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_01_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_01_ARESET_N_in : std_ulogic;
  signal AXI_01_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_01_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_01_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_01_ARVALID_in : std_ulogic;
  signal AXI_01_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_01_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_01_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_01_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_01_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_01_AWVALID_in : std_ulogic;
  signal AXI_01_BREADY_in : std_ulogic;
  signal AXI_01_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_01_RREADY_in : std_ulogic;
  signal AXI_01_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_01_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_01_WLAST_in : std_ulogic;
  signal AXI_01_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_01_WVALID_in : std_ulogic;
  signal AXI_02_ACLK_in : std_ulogic;
  signal AXI_02_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_02_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_02_ARESET_N_in : std_ulogic;
  signal AXI_02_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_02_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_02_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_02_ARVALID_in : std_ulogic;
  signal AXI_02_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_02_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_02_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_02_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_02_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_02_AWVALID_in : std_ulogic;
  signal AXI_02_BREADY_in : std_ulogic;
  signal AXI_02_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_02_RREADY_in : std_ulogic;
  signal AXI_02_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_02_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_02_WLAST_in : std_ulogic;
  signal AXI_02_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_02_WVALID_in : std_ulogic;
  signal AXI_03_ACLK_in : std_ulogic;
  signal AXI_03_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_03_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_03_ARESET_N_in : std_ulogic;
  signal AXI_03_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_03_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_03_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_03_ARVALID_in : std_ulogic;
  signal AXI_03_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_03_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_03_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_03_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_03_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_03_AWVALID_in : std_ulogic;
  signal AXI_03_BREADY_in : std_ulogic;
  signal AXI_03_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_03_RREADY_in : std_ulogic;
  signal AXI_03_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_03_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_03_WLAST_in : std_ulogic;
  signal AXI_03_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_03_WVALID_in : std_ulogic;
  signal AXI_04_ACLK_in : std_ulogic;
  signal AXI_04_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_04_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_04_ARESET_N_in : std_ulogic;
  signal AXI_04_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_04_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_04_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_04_ARVALID_in : std_ulogic;
  signal AXI_04_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_04_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_04_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_04_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_04_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_04_AWVALID_in : std_ulogic;
  signal AXI_04_BREADY_in : std_ulogic;
  signal AXI_04_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_04_RREADY_in : std_ulogic;
  signal AXI_04_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_04_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_04_WLAST_in : std_ulogic;
  signal AXI_04_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_04_WVALID_in : std_ulogic;
  signal AXI_05_ACLK_in : std_ulogic;
  signal AXI_05_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_05_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_05_ARESET_N_in : std_ulogic;
  signal AXI_05_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_05_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_05_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_05_ARVALID_in : std_ulogic;
  signal AXI_05_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_05_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_05_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_05_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_05_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_05_AWVALID_in : std_ulogic;
  signal AXI_05_BREADY_in : std_ulogic;
  signal AXI_05_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_05_RREADY_in : std_ulogic;
  signal AXI_05_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_05_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_05_WLAST_in : std_ulogic;
  signal AXI_05_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_05_WVALID_in : std_ulogic;
  signal AXI_06_ACLK_in : std_ulogic;
  signal AXI_06_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_06_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_06_ARESET_N_in : std_ulogic;
  signal AXI_06_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_06_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_06_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_06_ARVALID_in : std_ulogic;
  signal AXI_06_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_06_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_06_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_06_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_06_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_06_AWVALID_in : std_ulogic;
  signal AXI_06_BREADY_in : std_ulogic;
  signal AXI_06_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_06_RREADY_in : std_ulogic;
  signal AXI_06_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_06_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_06_WLAST_in : std_ulogic;
  signal AXI_06_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_06_WVALID_in : std_ulogic;
  signal AXI_07_ACLK_in : std_ulogic;
  signal AXI_07_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_07_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_07_ARESET_N_in : std_ulogic;
  signal AXI_07_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_07_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_07_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_07_ARVALID_in : std_ulogic;
  signal AXI_07_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_07_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_07_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_07_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_07_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_07_AWVALID_in : std_ulogic;
  signal AXI_07_BREADY_in : std_ulogic;
  signal AXI_07_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_07_RREADY_in : std_ulogic;
  signal AXI_07_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_07_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_07_WLAST_in : std_ulogic;
  signal AXI_07_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_07_WVALID_in : std_ulogic;
  signal AXI_08_ACLK_in : std_ulogic;
  signal AXI_08_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_08_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_08_ARESET_N_in : std_ulogic;
  signal AXI_08_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_08_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_08_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_08_ARVALID_in : std_ulogic;
  signal AXI_08_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_08_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_08_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_08_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_08_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_08_AWVALID_in : std_ulogic;
  signal AXI_08_BREADY_in : std_ulogic;
  signal AXI_08_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_08_RREADY_in : std_ulogic;
  signal AXI_08_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_08_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_08_WLAST_in : std_ulogic;
  signal AXI_08_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_08_WVALID_in : std_ulogic;
  signal AXI_09_ACLK_in : std_ulogic;
  signal AXI_09_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_09_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_09_ARESET_N_in : std_ulogic;
  signal AXI_09_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_09_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_09_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_09_ARVALID_in : std_ulogic;
  signal AXI_09_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_09_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_09_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_09_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_09_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_09_AWVALID_in : std_ulogic;
  signal AXI_09_BREADY_in : std_ulogic;
  signal AXI_09_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_09_RREADY_in : std_ulogic;
  signal AXI_09_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_09_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_09_WLAST_in : std_ulogic;
  signal AXI_09_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_09_WVALID_in : std_ulogic;
  signal AXI_10_ACLK_in : std_ulogic;
  signal AXI_10_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_10_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_10_ARESET_N_in : std_ulogic;
  signal AXI_10_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_10_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_10_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_10_ARVALID_in : std_ulogic;
  signal AXI_10_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_10_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_10_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_10_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_10_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_10_AWVALID_in : std_ulogic;
  signal AXI_10_BREADY_in : std_ulogic;
  signal AXI_10_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_10_RREADY_in : std_ulogic;
  signal AXI_10_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_10_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_10_WLAST_in : std_ulogic;
  signal AXI_10_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_10_WVALID_in : std_ulogic;
  signal AXI_11_ACLK_in : std_ulogic;
  signal AXI_11_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_11_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_11_ARESET_N_in : std_ulogic;
  signal AXI_11_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_11_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_11_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_11_ARVALID_in : std_ulogic;
  signal AXI_11_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_11_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_11_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_11_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_11_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_11_AWVALID_in : std_ulogic;
  signal AXI_11_BREADY_in : std_ulogic;
  signal AXI_11_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_11_RREADY_in : std_ulogic;
  signal AXI_11_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_11_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_11_WLAST_in : std_ulogic;
  signal AXI_11_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_11_WVALID_in : std_ulogic;
  signal AXI_12_ACLK_in : std_ulogic;
  signal AXI_12_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_12_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_12_ARESET_N_in : std_ulogic;
  signal AXI_12_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_12_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_12_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_12_ARVALID_in : std_ulogic;
  signal AXI_12_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_12_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_12_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_12_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_12_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_12_AWVALID_in : std_ulogic;
  signal AXI_12_BREADY_in : std_ulogic;
  signal AXI_12_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_12_RREADY_in : std_ulogic;
  signal AXI_12_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_12_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_12_WLAST_in : std_ulogic;
  signal AXI_12_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_12_WVALID_in : std_ulogic;
  signal AXI_13_ACLK_in : std_ulogic;
  signal AXI_13_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_13_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_13_ARESET_N_in : std_ulogic;
  signal AXI_13_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_13_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_13_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_13_ARVALID_in : std_ulogic;
  signal AXI_13_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_13_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_13_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_13_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_13_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_13_AWVALID_in : std_ulogic;
  signal AXI_13_BREADY_in : std_ulogic;
  signal AXI_13_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_13_RREADY_in : std_ulogic;
  signal AXI_13_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_13_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_13_WLAST_in : std_ulogic;
  signal AXI_13_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_13_WVALID_in : std_ulogic;
  signal AXI_14_ACLK_in : std_ulogic;
  signal AXI_14_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_14_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_14_ARESET_N_in : std_ulogic;
  signal AXI_14_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_14_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_14_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_14_ARVALID_in : std_ulogic;
  signal AXI_14_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_14_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_14_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_14_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_14_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_14_AWVALID_in : std_ulogic;
  signal AXI_14_BREADY_in : std_ulogic;
  signal AXI_14_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_14_RREADY_in : std_ulogic;
  signal AXI_14_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_14_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_14_WLAST_in : std_ulogic;
  signal AXI_14_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_14_WVALID_in : std_ulogic;
  signal AXI_15_ACLK_in : std_ulogic;
  signal AXI_15_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_15_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_15_ARESET_N_in : std_ulogic;
  signal AXI_15_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_15_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_15_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_15_ARVALID_in : std_ulogic;
  signal AXI_15_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_15_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_15_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_15_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_15_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_15_AWVALID_in : std_ulogic;
  signal AXI_15_BREADY_in : std_ulogic;
  signal AXI_15_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_15_RREADY_in : std_ulogic;
  signal AXI_15_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_15_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_15_WLAST_in : std_ulogic;
  signal AXI_15_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_15_WVALID_in : std_ulogic;
  signal AXI_16_ACLK_in : std_ulogic;
  signal AXI_16_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_16_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_16_ARESET_N_in : std_ulogic;
  signal AXI_16_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_16_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_16_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_16_ARVALID_in : std_ulogic;
  signal AXI_16_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_16_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_16_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_16_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_16_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_16_AWVALID_in : std_ulogic;
  signal AXI_16_BREADY_in : std_ulogic;
  signal AXI_16_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_16_RREADY_in : std_ulogic;
  signal AXI_16_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_16_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_16_WLAST_in : std_ulogic;
  signal AXI_16_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_16_WVALID_in : std_ulogic;
  signal AXI_17_ACLK_in : std_ulogic;
  signal AXI_17_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_17_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_17_ARESET_N_in : std_ulogic;
  signal AXI_17_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_17_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_17_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_17_ARVALID_in : std_ulogic;
  signal AXI_17_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_17_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_17_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_17_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_17_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_17_AWVALID_in : std_ulogic;
  signal AXI_17_BREADY_in : std_ulogic;
  signal AXI_17_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_17_RREADY_in : std_ulogic;
  signal AXI_17_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_17_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_17_WLAST_in : std_ulogic;
  signal AXI_17_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_17_WVALID_in : std_ulogic;
  signal AXI_18_ACLK_in : std_ulogic;
  signal AXI_18_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_18_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_18_ARESET_N_in : std_ulogic;
  signal AXI_18_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_18_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_18_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_18_ARVALID_in : std_ulogic;
  signal AXI_18_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_18_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_18_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_18_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_18_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_18_AWVALID_in : std_ulogic;
  signal AXI_18_BREADY_in : std_ulogic;
  signal AXI_18_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_18_RREADY_in : std_ulogic;
  signal AXI_18_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_18_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_18_WLAST_in : std_ulogic;
  signal AXI_18_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_18_WVALID_in : std_ulogic;
  signal AXI_19_ACLK_in : std_ulogic;
  signal AXI_19_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_19_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_19_ARESET_N_in : std_ulogic;
  signal AXI_19_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_19_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_19_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_19_ARVALID_in : std_ulogic;
  signal AXI_19_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_19_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_19_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_19_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_19_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_19_AWVALID_in : std_ulogic;
  signal AXI_19_BREADY_in : std_ulogic;
  signal AXI_19_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_19_RREADY_in : std_ulogic;
  signal AXI_19_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_19_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_19_WLAST_in : std_ulogic;
  signal AXI_19_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_19_WVALID_in : std_ulogic;
  signal AXI_20_ACLK_in : std_ulogic;
  signal AXI_20_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_20_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_20_ARESET_N_in : std_ulogic;
  signal AXI_20_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_20_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_20_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_20_ARVALID_in : std_ulogic;
  signal AXI_20_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_20_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_20_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_20_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_20_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_20_AWVALID_in : std_ulogic;
  signal AXI_20_BREADY_in : std_ulogic;
  signal AXI_20_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_20_RREADY_in : std_ulogic;
  signal AXI_20_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_20_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_20_WLAST_in : std_ulogic;
  signal AXI_20_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_20_WVALID_in : std_ulogic;
  signal AXI_21_ACLK_in : std_ulogic;
  signal AXI_21_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_21_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_21_ARESET_N_in : std_ulogic;
  signal AXI_21_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_21_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_21_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_21_ARVALID_in : std_ulogic;
  signal AXI_21_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_21_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_21_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_21_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_21_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_21_AWVALID_in : std_ulogic;
  signal AXI_21_BREADY_in : std_ulogic;
  signal AXI_21_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_21_RREADY_in : std_ulogic;
  signal AXI_21_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_21_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_21_WLAST_in : std_ulogic;
  signal AXI_21_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_21_WVALID_in : std_ulogic;
  signal AXI_22_ACLK_in : std_ulogic;
  signal AXI_22_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_22_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_22_ARESET_N_in : std_ulogic;
  signal AXI_22_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_22_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_22_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_22_ARVALID_in : std_ulogic;
  signal AXI_22_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_22_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_22_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_22_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_22_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_22_AWVALID_in : std_ulogic;
  signal AXI_22_BREADY_in : std_ulogic;
  signal AXI_22_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_22_RREADY_in : std_ulogic;
  signal AXI_22_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_22_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_22_WLAST_in : std_ulogic;
  signal AXI_22_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_22_WVALID_in : std_ulogic;
  signal AXI_23_ACLK_in : std_ulogic;
  signal AXI_23_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_23_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_23_ARESET_N_in : std_ulogic;
  signal AXI_23_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_23_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_23_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_23_ARVALID_in : std_ulogic;
  signal AXI_23_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_23_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_23_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_23_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_23_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_23_AWVALID_in : std_ulogic;
  signal AXI_23_BREADY_in : std_ulogic;
  signal AXI_23_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_23_RREADY_in : std_ulogic;
  signal AXI_23_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_23_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_23_WLAST_in : std_ulogic;
  signal AXI_23_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_23_WVALID_in : std_ulogic;
  signal AXI_24_ACLK_in : std_ulogic;
  signal AXI_24_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_24_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_24_ARESET_N_in : std_ulogic;
  signal AXI_24_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_24_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_24_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_24_ARVALID_in : std_ulogic;
  signal AXI_24_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_24_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_24_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_24_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_24_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_24_AWVALID_in : std_ulogic;
  signal AXI_24_BREADY_in : std_ulogic;
  signal AXI_24_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_24_RREADY_in : std_ulogic;
  signal AXI_24_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_24_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_24_WLAST_in : std_ulogic;
  signal AXI_24_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_24_WVALID_in : std_ulogic;
  signal AXI_25_ACLK_in : std_ulogic;
  signal AXI_25_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_25_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_25_ARESET_N_in : std_ulogic;
  signal AXI_25_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_25_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_25_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_25_ARVALID_in : std_ulogic;
  signal AXI_25_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_25_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_25_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_25_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_25_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_25_AWVALID_in : std_ulogic;
  signal AXI_25_BREADY_in : std_ulogic;
  signal AXI_25_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_25_RREADY_in : std_ulogic;
  signal AXI_25_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_25_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_25_WLAST_in : std_ulogic;
  signal AXI_25_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_25_WVALID_in : std_ulogic;
  signal AXI_26_ACLK_in : std_ulogic;
  signal AXI_26_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_26_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_26_ARESET_N_in : std_ulogic;
  signal AXI_26_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_26_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_26_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_26_ARVALID_in : std_ulogic;
  signal AXI_26_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_26_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_26_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_26_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_26_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_26_AWVALID_in : std_ulogic;
  signal AXI_26_BREADY_in : std_ulogic;
  signal AXI_26_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_26_RREADY_in : std_ulogic;
  signal AXI_26_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_26_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_26_WLAST_in : std_ulogic;
  signal AXI_26_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_26_WVALID_in : std_ulogic;
  signal AXI_27_ACLK_in : std_ulogic;
  signal AXI_27_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_27_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_27_ARESET_N_in : std_ulogic;
  signal AXI_27_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_27_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_27_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_27_ARVALID_in : std_ulogic;
  signal AXI_27_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_27_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_27_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_27_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_27_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_27_AWVALID_in : std_ulogic;
  signal AXI_27_BREADY_in : std_ulogic;
  signal AXI_27_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_27_RREADY_in : std_ulogic;
  signal AXI_27_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_27_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_27_WLAST_in : std_ulogic;
  signal AXI_27_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_27_WVALID_in : std_ulogic;
  signal AXI_28_ACLK_in : std_ulogic;
  signal AXI_28_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_28_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_28_ARESET_N_in : std_ulogic;
  signal AXI_28_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_28_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_28_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_28_ARVALID_in : std_ulogic;
  signal AXI_28_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_28_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_28_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_28_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_28_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_28_AWVALID_in : std_ulogic;
  signal AXI_28_BREADY_in : std_ulogic;
  signal AXI_28_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_28_RREADY_in : std_ulogic;
  signal AXI_28_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_28_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_28_WLAST_in : std_ulogic;
  signal AXI_28_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_28_WVALID_in : std_ulogic;
  signal AXI_29_ACLK_in : std_ulogic;
  signal AXI_29_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_29_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_29_ARESET_N_in : std_ulogic;
  signal AXI_29_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_29_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_29_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_29_ARVALID_in : std_ulogic;
  signal AXI_29_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_29_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_29_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_29_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_29_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_29_AWVALID_in : std_ulogic;
  signal AXI_29_BREADY_in : std_ulogic;
  signal AXI_29_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_29_RREADY_in : std_ulogic;
  signal AXI_29_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_29_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_29_WLAST_in : std_ulogic;
  signal AXI_29_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_29_WVALID_in : std_ulogic;
  signal AXI_30_ACLK_in : std_ulogic;
  signal AXI_30_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_30_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_30_ARESET_N_in : std_ulogic;
  signal AXI_30_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_30_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_30_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_30_ARVALID_in : std_ulogic;
  signal AXI_30_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_30_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_30_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_30_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_30_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_30_AWVALID_in : std_ulogic;
  signal AXI_30_BREADY_in : std_ulogic;
  signal AXI_30_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_30_RREADY_in : std_ulogic;
  signal AXI_30_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_30_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_30_WLAST_in : std_ulogic;
  signal AXI_30_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_30_WVALID_in : std_ulogic;
  signal AXI_31_ACLK_in : std_ulogic;
  signal AXI_31_ARADDR_in : std_logic_vector(36 downto 0);
  signal AXI_31_ARBURST_in : std_logic_vector(1 downto 0);
  signal AXI_31_ARESET_N_in : std_ulogic;
  signal AXI_31_ARID_in : std_logic_vector(5 downto 0);
  signal AXI_31_ARLEN_in : std_logic_vector(3 downto 0);
  signal AXI_31_ARSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_31_ARVALID_in : std_ulogic;
  signal AXI_31_AWADDR_in : std_logic_vector(36 downto 0);
  signal AXI_31_AWBURST_in : std_logic_vector(1 downto 0);
  signal AXI_31_AWID_in : std_logic_vector(5 downto 0);
  signal AXI_31_AWLEN_in : std_logic_vector(3 downto 0);
  signal AXI_31_AWSIZE_in : std_logic_vector(2 downto 0);
  signal AXI_31_AWVALID_in : std_ulogic;
  signal AXI_31_BREADY_in : std_ulogic;
  signal AXI_31_DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal AXI_31_RREADY_in : std_ulogic;
  signal AXI_31_WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal AXI_31_WDATA_in : std_logic_vector(255 downto 0);
  signal AXI_31_WLAST_in : std_ulogic;
  signal AXI_31_WSTRB_in : std_logic_vector(31 downto 0);
  signal AXI_31_WVALID_in : std_ulogic;
  signal BLI_SCAN_ENABLE_00_in : std_ulogic;
  signal BLI_SCAN_ENABLE_01_in : std_ulogic;
  signal BLI_SCAN_ENABLE_02_in : std_ulogic;
  signal BLI_SCAN_ENABLE_03_in : std_ulogic;
  signal BLI_SCAN_ENABLE_04_in : std_ulogic;
  signal BLI_SCAN_ENABLE_05_in : std_ulogic;
  signal BLI_SCAN_ENABLE_06_in : std_ulogic;
  signal BLI_SCAN_ENABLE_07_in : std_ulogic;
  signal BLI_SCAN_ENABLE_08_in : std_ulogic;
  signal BLI_SCAN_ENABLE_09_in : std_ulogic;
  signal BLI_SCAN_ENABLE_10_in : std_ulogic;
  signal BLI_SCAN_ENABLE_11_in : std_ulogic;
  signal BLI_SCAN_ENABLE_12_in : std_ulogic;
  signal BLI_SCAN_ENABLE_13_in : std_ulogic;
  signal BLI_SCAN_ENABLE_14_in : std_ulogic;
  signal BLI_SCAN_ENABLE_15_in : std_ulogic;
  signal BLI_SCAN_ENABLE_16_in : std_ulogic;
  signal BLI_SCAN_ENABLE_17_in : std_ulogic;
  signal BLI_SCAN_ENABLE_18_in : std_ulogic;
  signal BLI_SCAN_ENABLE_19_in : std_ulogic;
  signal BLI_SCAN_ENABLE_20_in : std_ulogic;
  signal BLI_SCAN_ENABLE_21_in : std_ulogic;
  signal BLI_SCAN_ENABLE_22_in : std_ulogic;
  signal BLI_SCAN_ENABLE_23_in : std_ulogic;
  signal BLI_SCAN_ENABLE_24_in : std_ulogic;
  signal BLI_SCAN_ENABLE_25_in : std_ulogic;
  signal BLI_SCAN_ENABLE_26_in : std_ulogic;
  signal BLI_SCAN_ENABLE_27_in : std_ulogic;
  signal BLI_SCAN_ENABLE_28_in : std_ulogic;
  signal BLI_SCAN_ENABLE_29_in : std_ulogic;
  signal BLI_SCAN_ENABLE_30_in : std_ulogic;
  signal BLI_SCAN_ENABLE_31_in : std_ulogic;
  signal BLI_SCAN_IN_00_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_01_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_02_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_03_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_04_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_05_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_06_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_07_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_08_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_09_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_10_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_11_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_12_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_13_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_14_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_15_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_16_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_17_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_18_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_19_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_20_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_21_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_22_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_23_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_24_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_25_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_26_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_27_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_28_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_29_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_30_in : std_logic_vector(7 downto 0);
  signal BLI_SCAN_IN_31_in : std_logic_vector(7 downto 0);
  signal BSCAN_DRCK_0_in : std_ulogic;
  signal BSCAN_DRCK_1_in : std_ulogic;
  signal BSCAN_TCK_0_in : std_ulogic;
  signal BSCAN_TCK_1_in : std_ulogic;
  signal DBG_IN_00_in : std_logic_vector(23 downto 0);
  signal DBG_IN_01_in : std_logic_vector(23 downto 0);
  signal DBG_IN_02_in : std_logic_vector(23 downto 0);
  signal DBG_IN_03_in : std_logic_vector(23 downto 0);
  signal DBG_IN_04_in : std_logic_vector(23 downto 0);
  signal DBG_IN_05_in : std_logic_vector(23 downto 0);
  signal DBG_IN_06_in : std_logic_vector(23 downto 0);
  signal DBG_IN_07_in : std_logic_vector(23 downto 0);
  signal DBG_IN_08_in : std_logic_vector(23 downto 0);
  signal DBG_IN_09_in : std_logic_vector(23 downto 0);
  signal DBG_IN_10_in : std_logic_vector(23 downto 0);
  signal DBG_IN_11_in : std_logic_vector(23 downto 0);
  signal DBG_IN_12_in : std_logic_vector(23 downto 0);
  signal DBG_IN_13_in : std_logic_vector(23 downto 0);
  signal DBG_IN_14_in : std_logic_vector(23 downto 0);
  signal DBG_IN_15_in : std_logic_vector(23 downto 0);
  signal DBG_IN_16_in : std_logic_vector(23 downto 0);
  signal DBG_IN_17_in : std_logic_vector(23 downto 0);
  signal DBG_IN_18_in : std_logic_vector(23 downto 0);
  signal DBG_IN_19_in : std_logic_vector(23 downto 0);
  signal DBG_IN_20_in : std_logic_vector(23 downto 0);
  signal DBG_IN_21_in : std_logic_vector(23 downto 0);
  signal DBG_IN_22_in : std_logic_vector(23 downto 0);
  signal DBG_IN_23_in : std_logic_vector(23 downto 0);
  signal DBG_IN_24_in : std_logic_vector(23 downto 0);
  signal DBG_IN_25_in : std_logic_vector(23 downto 0);
  signal DBG_IN_26_in : std_logic_vector(23 downto 0);
  signal DBG_IN_27_in : std_logic_vector(23 downto 0);
  signal DBG_IN_28_in : std_logic_vector(23 downto 0);
  signal DBG_IN_29_in : std_logic_vector(23 downto 0);
  signal DBG_IN_30_in : std_logic_vector(23 downto 0);
  signal DBG_IN_31_in : std_logic_vector(23 downto 0);
  signal DLL_SCAN_CK_00_in : std_ulogic;
  signal DLL_SCAN_CK_01_in : std_ulogic;
  signal DLL_SCAN_ENABLE_00_in : std_ulogic;
  signal DLL_SCAN_ENABLE_01_in : std_ulogic;
  signal DLL_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal DLL_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal DLL_SCAN_MODE_00_in : std_ulogic;
  signal DLL_SCAN_MODE_01_in : std_ulogic;
  signal DLL_SCAN_RST_N_00_in : std_ulogic;
  signal DLL_SCAN_RST_N_01_in : std_ulogic;
  signal HBM_REF_CLK_0_in : std_ulogic;
  signal HBM_REF_CLK_1_in : std_ulogic;
  signal IO_SCAN_CK_00_in : std_ulogic;
  signal IO_SCAN_CK_01_in : std_ulogic;
  signal IO_SCAN_ENABLE_00_in : std_ulogic;
  signal IO_SCAN_ENABLE_01_in : std_ulogic;
  signal IO_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal IO_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal IO_SCAN_MODE_00_in : std_ulogic;
  signal IO_SCAN_MODE_01_in : std_ulogic;
  signal IO_SCAN_RST_N_00_in : std_ulogic;
  signal IO_SCAN_RST_N_01_in : std_ulogic;
  signal MBIST_EN_00_in : std_ulogic;
  signal MBIST_EN_01_in : std_ulogic;
  signal MBIST_EN_02_in : std_ulogic;
  signal MBIST_EN_03_in : std_ulogic;
  signal MBIST_EN_04_in : std_ulogic;
  signal MBIST_EN_05_in : std_ulogic;
  signal MBIST_EN_06_in : std_ulogic;
  signal MBIST_EN_07_in : std_ulogic;
  signal MBIST_EN_08_in : std_ulogic;
  signal MBIST_EN_09_in : std_ulogic;
  signal MBIST_EN_10_in : std_ulogic;
  signal MBIST_EN_11_in : std_ulogic;
  signal MBIST_EN_12_in : std_ulogic;
  signal MBIST_EN_13_in : std_ulogic;
  signal MBIST_EN_14_in : std_ulogic;
  signal MBIST_EN_15_in : std_ulogic;
  signal MC_SCAN_CK_00_in : std_ulogic;
  signal MC_SCAN_CK_01_in : std_ulogic;
  signal MC_SCAN_CK_02_in : std_ulogic;
  signal MC_SCAN_CK_03_in : std_ulogic;
  signal MC_SCAN_CK_04_in : std_ulogic;
  signal MC_SCAN_CK_05_in : std_ulogic;
  signal MC_SCAN_CK_06_in : std_ulogic;
  signal MC_SCAN_CK_07_in : std_ulogic;
  signal MC_SCAN_CK_08_in : std_ulogic;
  signal MC_SCAN_CK_09_in : std_ulogic;
  signal MC_SCAN_CK_10_in : std_ulogic;
  signal MC_SCAN_CK_11_in : std_ulogic;
  signal MC_SCAN_CK_12_in : std_ulogic;
  signal MC_SCAN_CK_13_in : std_ulogic;
  signal MC_SCAN_CK_14_in : std_ulogic;
  signal MC_SCAN_CK_15_in : std_ulogic;
  signal MC_SCAN_ENABLE_00_in : std_ulogic;
  signal MC_SCAN_ENABLE_01_in : std_ulogic;
  signal MC_SCAN_ENABLE_02_in : std_ulogic;
  signal MC_SCAN_ENABLE_03_in : std_ulogic;
  signal MC_SCAN_ENABLE_04_in : std_ulogic;
  signal MC_SCAN_ENABLE_05_in : std_ulogic;
  signal MC_SCAN_ENABLE_06_in : std_ulogic;
  signal MC_SCAN_ENABLE_07_in : std_ulogic;
  signal MC_SCAN_ENABLE_08_in : std_ulogic;
  signal MC_SCAN_ENABLE_09_in : std_ulogic;
  signal MC_SCAN_ENABLE_10_in : std_ulogic;
  signal MC_SCAN_ENABLE_11_in : std_ulogic;
  signal MC_SCAN_ENABLE_12_in : std_ulogic;
  signal MC_SCAN_ENABLE_13_in : std_ulogic;
  signal MC_SCAN_ENABLE_14_in : std_ulogic;
  signal MC_SCAN_ENABLE_15_in : std_ulogic;
  signal MC_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_02_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_03_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_04_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_05_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_06_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_07_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_08_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_09_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_10_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_11_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_12_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_13_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_14_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_15_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_MODE_00_in : std_ulogic;
  signal MC_SCAN_MODE_01_in : std_ulogic;
  signal MC_SCAN_MODE_02_in : std_ulogic;
  signal MC_SCAN_MODE_03_in : std_ulogic;
  signal MC_SCAN_MODE_04_in : std_ulogic;
  signal MC_SCAN_MODE_05_in : std_ulogic;
  signal MC_SCAN_MODE_06_in : std_ulogic;
  signal MC_SCAN_MODE_07_in : std_ulogic;
  signal MC_SCAN_MODE_08_in : std_ulogic;
  signal MC_SCAN_MODE_09_in : std_ulogic;
  signal MC_SCAN_MODE_10_in : std_ulogic;
  signal MC_SCAN_MODE_11_in : std_ulogic;
  signal MC_SCAN_MODE_12_in : std_ulogic;
  signal MC_SCAN_MODE_13_in : std_ulogic;
  signal MC_SCAN_MODE_14_in : std_ulogic;
  signal MC_SCAN_MODE_15_in : std_ulogic;
  signal MC_SCAN_RST_N_00_in : std_ulogic;
  signal MC_SCAN_RST_N_01_in : std_ulogic;
  signal MC_SCAN_RST_N_02_in : std_ulogic;
  signal MC_SCAN_RST_N_03_in : std_ulogic;
  signal MC_SCAN_RST_N_04_in : std_ulogic;
  signal MC_SCAN_RST_N_05_in : std_ulogic;
  signal MC_SCAN_RST_N_06_in : std_ulogic;
  signal MC_SCAN_RST_N_07_in : std_ulogic;
  signal MC_SCAN_RST_N_08_in : std_ulogic;
  signal MC_SCAN_RST_N_09_in : std_ulogic;
  signal MC_SCAN_RST_N_10_in : std_ulogic;
  signal MC_SCAN_RST_N_11_in : std_ulogic;
  signal MC_SCAN_RST_N_12_in : std_ulogic;
  signal MC_SCAN_RST_N_13_in : std_ulogic;
  signal MC_SCAN_RST_N_14_in : std_ulogic;
  signal MC_SCAN_RST_N_15_in : std_ulogic;
  signal PHY_SCAN_CK_00_in : std_ulogic;
  signal PHY_SCAN_CK_01_in : std_ulogic;
  signal PHY_SCAN_ENABLE_00_in : std_ulogic;
  signal PHY_SCAN_ENABLE_01_in : std_ulogic;
  signal PHY_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal PHY_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal PHY_SCAN_MODE_00_in : std_ulogic;
  signal PHY_SCAN_MODE_01_in : std_ulogic;
  signal PHY_SCAN_RST_N_00_in : std_ulogic;
  signal PHY_SCAN_RST_N_01_in : std_ulogic;
  signal SW_SCAN_CK_00_in : std_ulogic;
  signal SW_SCAN_CK_01_in : std_ulogic;
  signal SW_SCAN_ENABLE_00_in : std_ulogic;
  signal SW_SCAN_ENABLE_01_in : std_ulogic;
  signal SW_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_02_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_03_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_04_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_05_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_06_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_07_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_MODE_00_in : std_ulogic;
  signal SW_SCAN_MODE_01_in : std_ulogic;
  signal SW_SCAN_RST_N_00_in : std_ulogic;
  signal SW_SCAN_RST_N_01_in : std_ulogic;
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  APB_0_PRDATA <= APB_0_PRDATA_out;
  APB_0_PREADY <= APB_0_PREADY_out;
  APB_0_PSLVERR <= APB_0_PSLVERR_out;
  APB_1_PRDATA <= APB_1_PRDATA_out;
  APB_1_PREADY <= APB_1_PREADY_out;
  APB_1_PSLVERR <= APB_1_PSLVERR_out;
  AXI_00_ARREADY <= AXI_00_ARREADY_out;
  AXI_00_AWREADY <= AXI_00_AWREADY_out;
  AXI_00_BID <= AXI_00_BID_out;
  AXI_00_BRESP <= AXI_00_BRESP_out;
  AXI_00_BVALID <= AXI_00_BVALID_out;
  AXI_00_DFI_AW_AERR_N <= AXI_00_DFI_AW_AERR_N_out;
  AXI_00_DFI_CLK_BUF <= AXI_00_DFI_CLK_BUF_out;
  AXI_00_DFI_DBI_BYTE_DISABLE <= AXI_00_DFI_DBI_BYTE_DISABLE_out;
  AXI_00_DFI_DW_RDDATA_DBI <= AXI_00_DFI_DW_RDDATA_DBI_out;
  AXI_00_DFI_DW_RDDATA_DERR <= AXI_00_DFI_DW_RDDATA_DERR_out;
  AXI_00_DFI_DW_RDDATA_VALID <= AXI_00_DFI_DW_RDDATA_VALID_out;
  AXI_00_DFI_INIT_COMPLETE <= AXI_00_DFI_INIT_COMPLETE_out;
  AXI_00_DFI_PHYUPD_REQ <= AXI_00_DFI_PHYUPD_REQ_out;
  AXI_00_DFI_PHY_LP_STATE <= AXI_00_DFI_PHY_LP_STATE_out;
  AXI_00_DFI_RST_N_BUF <= AXI_00_DFI_RST_N_BUF_out;
  AXI_00_MC_STATUS <= AXI_00_MC_STATUS_out;
  AXI_00_PHY_STATUS <= AXI_00_PHY_STATUS_out;
  AXI_00_RDATA <= AXI_00_RDATA_out;
  AXI_00_RDATA_PARITY <= AXI_00_RDATA_PARITY_out;
  AXI_00_RID <= AXI_00_RID_out;
  AXI_00_RLAST <= AXI_00_RLAST_out;
  AXI_00_RRESP <= AXI_00_RRESP_out;
  AXI_00_RVALID <= AXI_00_RVALID_out;
  AXI_00_WREADY <= AXI_00_WREADY_out;
  AXI_01_ARREADY <= AXI_01_ARREADY_out;
  AXI_01_AWREADY <= AXI_01_AWREADY_out;
  AXI_01_BID <= AXI_01_BID_out;
  AXI_01_BRESP <= AXI_01_BRESP_out;
  AXI_01_BVALID <= AXI_01_BVALID_out;
  AXI_01_DFI_AW_AERR_N <= AXI_01_DFI_AW_AERR_N_out;
  AXI_01_DFI_CLK_BUF <= AXI_01_DFI_CLK_BUF_out;
  AXI_01_DFI_DBI_BYTE_DISABLE <= AXI_01_DFI_DBI_BYTE_DISABLE_out;
  AXI_01_DFI_DW_RDDATA_DBI <= AXI_01_DFI_DW_RDDATA_DBI_out;
  AXI_01_DFI_DW_RDDATA_DERR <= AXI_01_DFI_DW_RDDATA_DERR_out;
  AXI_01_DFI_DW_RDDATA_VALID <= AXI_01_DFI_DW_RDDATA_VALID_out;
  AXI_01_DFI_INIT_COMPLETE <= AXI_01_DFI_INIT_COMPLETE_out;
  AXI_01_DFI_PHYUPD_REQ <= AXI_01_DFI_PHYUPD_REQ_out;
  AXI_01_DFI_PHY_LP_STATE <= AXI_01_DFI_PHY_LP_STATE_out;
  AXI_01_DFI_RST_N_BUF <= AXI_01_DFI_RST_N_BUF_out;
  AXI_01_RDATA <= AXI_01_RDATA_out;
  AXI_01_RDATA_PARITY <= AXI_01_RDATA_PARITY_out;
  AXI_01_RID <= AXI_01_RID_out;
  AXI_01_RLAST <= AXI_01_RLAST_out;
  AXI_01_RRESP <= AXI_01_RRESP_out;
  AXI_01_RVALID <= AXI_01_RVALID_out;
  AXI_01_WREADY <= AXI_01_WREADY_out;
  AXI_02_ARREADY <= AXI_02_ARREADY_out;
  AXI_02_AWREADY <= AXI_02_AWREADY_out;
  AXI_02_BID <= AXI_02_BID_out;
  AXI_02_BRESP <= AXI_02_BRESP_out;
  AXI_02_BVALID <= AXI_02_BVALID_out;
  AXI_02_DFI_AW_AERR_N <= AXI_02_DFI_AW_AERR_N_out;
  AXI_02_DFI_CLK_BUF <= AXI_02_DFI_CLK_BUF_out;
  AXI_02_DFI_DBI_BYTE_DISABLE <= AXI_02_DFI_DBI_BYTE_DISABLE_out;
  AXI_02_DFI_DW_RDDATA_DBI <= AXI_02_DFI_DW_RDDATA_DBI_out;
  AXI_02_DFI_DW_RDDATA_DERR <= AXI_02_DFI_DW_RDDATA_DERR_out;
  AXI_02_DFI_DW_RDDATA_VALID <= AXI_02_DFI_DW_RDDATA_VALID_out;
  AXI_02_DFI_INIT_COMPLETE <= AXI_02_DFI_INIT_COMPLETE_out;
  AXI_02_DFI_PHYUPD_REQ <= AXI_02_DFI_PHYUPD_REQ_out;
  AXI_02_DFI_PHY_LP_STATE <= AXI_02_DFI_PHY_LP_STATE_out;
  AXI_02_DFI_RST_N_BUF <= AXI_02_DFI_RST_N_BUF_out;
  AXI_02_MC_STATUS <= AXI_02_MC_STATUS_out;
  AXI_02_PHY_STATUS <= AXI_02_PHY_STATUS_out;
  AXI_02_RDATA <= AXI_02_RDATA_out;
  AXI_02_RDATA_PARITY <= AXI_02_RDATA_PARITY_out;
  AXI_02_RID <= AXI_02_RID_out;
  AXI_02_RLAST <= AXI_02_RLAST_out;
  AXI_02_RRESP <= AXI_02_RRESP_out;
  AXI_02_RVALID <= AXI_02_RVALID_out;
  AXI_02_WREADY <= AXI_02_WREADY_out;
  AXI_03_ARREADY <= AXI_03_ARREADY_out;
  AXI_03_AWREADY <= AXI_03_AWREADY_out;
  AXI_03_BID <= AXI_03_BID_out;
  AXI_03_BRESP <= AXI_03_BRESP_out;
  AXI_03_BVALID <= AXI_03_BVALID_out;
  AXI_03_DFI_AW_AERR_N <= AXI_03_DFI_AW_AERR_N_out;
  AXI_03_DFI_CLK_BUF <= AXI_03_DFI_CLK_BUF_out;
  AXI_03_DFI_DBI_BYTE_DISABLE <= AXI_03_DFI_DBI_BYTE_DISABLE_out;
  AXI_03_DFI_DW_RDDATA_DBI <= AXI_03_DFI_DW_RDDATA_DBI_out;
  AXI_03_DFI_DW_RDDATA_DERR <= AXI_03_DFI_DW_RDDATA_DERR_out;
  AXI_03_DFI_DW_RDDATA_VALID <= AXI_03_DFI_DW_RDDATA_VALID_out;
  AXI_03_DFI_INIT_COMPLETE <= AXI_03_DFI_INIT_COMPLETE_out;
  AXI_03_DFI_PHYUPD_REQ <= AXI_03_DFI_PHYUPD_REQ_out;
  AXI_03_DFI_PHY_LP_STATE <= AXI_03_DFI_PHY_LP_STATE_out;
  AXI_03_DFI_RST_N_BUF <= AXI_03_DFI_RST_N_BUF_out;
  AXI_03_RDATA <= AXI_03_RDATA_out;
  AXI_03_RDATA_PARITY <= AXI_03_RDATA_PARITY_out;
  AXI_03_RID <= AXI_03_RID_out;
  AXI_03_RLAST <= AXI_03_RLAST_out;
  AXI_03_RRESP <= AXI_03_RRESP_out;
  AXI_03_RVALID <= AXI_03_RVALID_out;
  AXI_03_WREADY <= AXI_03_WREADY_out;
  AXI_04_ARREADY <= AXI_04_ARREADY_out;
  AXI_04_AWREADY <= AXI_04_AWREADY_out;
  AXI_04_BID <= AXI_04_BID_out;
  AXI_04_BRESP <= AXI_04_BRESP_out;
  AXI_04_BVALID <= AXI_04_BVALID_out;
  AXI_04_DFI_AW_AERR_N <= AXI_04_DFI_AW_AERR_N_out;
  AXI_04_DFI_CLK_BUF <= AXI_04_DFI_CLK_BUF_out;
  AXI_04_DFI_DBI_BYTE_DISABLE <= AXI_04_DFI_DBI_BYTE_DISABLE_out;
  AXI_04_DFI_DW_RDDATA_DBI <= AXI_04_DFI_DW_RDDATA_DBI_out;
  AXI_04_DFI_DW_RDDATA_DERR <= AXI_04_DFI_DW_RDDATA_DERR_out;
  AXI_04_DFI_DW_RDDATA_VALID <= AXI_04_DFI_DW_RDDATA_VALID_out;
  AXI_04_DFI_INIT_COMPLETE <= AXI_04_DFI_INIT_COMPLETE_out;
  AXI_04_DFI_PHYUPD_REQ <= AXI_04_DFI_PHYUPD_REQ_out;
  AXI_04_DFI_PHY_LP_STATE <= AXI_04_DFI_PHY_LP_STATE_out;
  AXI_04_DFI_RST_N_BUF <= AXI_04_DFI_RST_N_BUF_out;
  AXI_04_MC_STATUS <= AXI_04_MC_STATUS_out;
  AXI_04_PHY_STATUS <= AXI_04_PHY_STATUS_out;
  AXI_04_RDATA <= AXI_04_RDATA_out;
  AXI_04_RDATA_PARITY <= AXI_04_RDATA_PARITY_out;
  AXI_04_RID <= AXI_04_RID_out;
  AXI_04_RLAST <= AXI_04_RLAST_out;
  AXI_04_RRESP <= AXI_04_RRESP_out;
  AXI_04_RVALID <= AXI_04_RVALID_out;
  AXI_04_WREADY <= AXI_04_WREADY_out;
  AXI_05_ARREADY <= AXI_05_ARREADY_out;
  AXI_05_AWREADY <= AXI_05_AWREADY_out;
  AXI_05_BID <= AXI_05_BID_out;
  AXI_05_BRESP <= AXI_05_BRESP_out;
  AXI_05_BVALID <= AXI_05_BVALID_out;
  AXI_05_DFI_AW_AERR_N <= AXI_05_DFI_AW_AERR_N_out;
  AXI_05_DFI_CLK_BUF <= AXI_05_DFI_CLK_BUF_out;
  AXI_05_DFI_DBI_BYTE_DISABLE <= AXI_05_DFI_DBI_BYTE_DISABLE_out;
  AXI_05_DFI_DW_RDDATA_DBI <= AXI_05_DFI_DW_RDDATA_DBI_out;
  AXI_05_DFI_DW_RDDATA_DERR <= AXI_05_DFI_DW_RDDATA_DERR_out;
  AXI_05_DFI_DW_RDDATA_VALID <= AXI_05_DFI_DW_RDDATA_VALID_out;
  AXI_05_DFI_INIT_COMPLETE <= AXI_05_DFI_INIT_COMPLETE_out;
  AXI_05_DFI_PHYUPD_REQ <= AXI_05_DFI_PHYUPD_REQ_out;
  AXI_05_DFI_PHY_LP_STATE <= AXI_05_DFI_PHY_LP_STATE_out;
  AXI_05_DFI_RST_N_BUF <= AXI_05_DFI_RST_N_BUF_out;
  AXI_05_RDATA <= AXI_05_RDATA_out;
  AXI_05_RDATA_PARITY <= AXI_05_RDATA_PARITY_out;
  AXI_05_RID <= AXI_05_RID_out;
  AXI_05_RLAST <= AXI_05_RLAST_out;
  AXI_05_RRESP <= AXI_05_RRESP_out;
  AXI_05_RVALID <= AXI_05_RVALID_out;
  AXI_05_WREADY <= AXI_05_WREADY_out;
  AXI_06_ARREADY <= AXI_06_ARREADY_out;
  AXI_06_AWREADY <= AXI_06_AWREADY_out;
  AXI_06_BID <= AXI_06_BID_out;
  AXI_06_BRESP <= AXI_06_BRESP_out;
  AXI_06_BVALID <= AXI_06_BVALID_out;
  AXI_06_DFI_AW_AERR_N <= AXI_06_DFI_AW_AERR_N_out;
  AXI_06_DFI_CLK_BUF <= AXI_06_DFI_CLK_BUF_out;
  AXI_06_DFI_DBI_BYTE_DISABLE <= AXI_06_DFI_DBI_BYTE_DISABLE_out;
  AXI_06_DFI_DW_RDDATA_DBI <= AXI_06_DFI_DW_RDDATA_DBI_out;
  AXI_06_DFI_DW_RDDATA_DERR <= AXI_06_DFI_DW_RDDATA_DERR_out;
  AXI_06_DFI_DW_RDDATA_VALID <= AXI_06_DFI_DW_RDDATA_VALID_out;
  AXI_06_DFI_INIT_COMPLETE <= AXI_06_DFI_INIT_COMPLETE_out;
  AXI_06_DFI_PHYUPD_REQ <= AXI_06_DFI_PHYUPD_REQ_out;
  AXI_06_DFI_PHY_LP_STATE <= AXI_06_DFI_PHY_LP_STATE_out;
  AXI_06_DFI_RST_N_BUF <= AXI_06_DFI_RST_N_BUF_out;
  AXI_06_MC_STATUS <= AXI_06_MC_STATUS_out;
  AXI_06_PHY_STATUS <= AXI_06_PHY_STATUS_out;
  AXI_06_RDATA <= AXI_06_RDATA_out;
  AXI_06_RDATA_PARITY <= AXI_06_RDATA_PARITY_out;
  AXI_06_RID <= AXI_06_RID_out;
  AXI_06_RLAST <= AXI_06_RLAST_out;
  AXI_06_RRESP <= AXI_06_RRESP_out;
  AXI_06_RVALID <= AXI_06_RVALID_out;
  AXI_06_WREADY <= AXI_06_WREADY_out;
  AXI_07_ARREADY <= AXI_07_ARREADY_out;
  AXI_07_AWREADY <= AXI_07_AWREADY_out;
  AXI_07_BID <= AXI_07_BID_out;
  AXI_07_BRESP <= AXI_07_BRESP_out;
  AXI_07_BVALID <= AXI_07_BVALID_out;
  AXI_07_DFI_AW_AERR_N <= AXI_07_DFI_AW_AERR_N_out;
  AXI_07_DFI_CLK_BUF <= AXI_07_DFI_CLK_BUF_out;
  AXI_07_DFI_DBI_BYTE_DISABLE <= AXI_07_DFI_DBI_BYTE_DISABLE_out;
  AXI_07_DFI_DW_RDDATA_DBI <= AXI_07_DFI_DW_RDDATA_DBI_out;
  AXI_07_DFI_DW_RDDATA_DERR <= AXI_07_DFI_DW_RDDATA_DERR_out;
  AXI_07_DFI_DW_RDDATA_VALID <= AXI_07_DFI_DW_RDDATA_VALID_out;
  AXI_07_DFI_INIT_COMPLETE <= AXI_07_DFI_INIT_COMPLETE_out;
  AXI_07_DFI_PHYUPD_REQ <= AXI_07_DFI_PHYUPD_REQ_out;
  AXI_07_DFI_PHY_LP_STATE <= AXI_07_DFI_PHY_LP_STATE_out;
  AXI_07_DFI_RST_N_BUF <= AXI_07_DFI_RST_N_BUF_out;
  AXI_07_RDATA <= AXI_07_RDATA_out;
  AXI_07_RDATA_PARITY <= AXI_07_RDATA_PARITY_out;
  AXI_07_RID <= AXI_07_RID_out;
  AXI_07_RLAST <= AXI_07_RLAST_out;
  AXI_07_RRESP <= AXI_07_RRESP_out;
  AXI_07_RVALID <= AXI_07_RVALID_out;
  AXI_07_WREADY <= AXI_07_WREADY_out;
  AXI_08_ARREADY <= AXI_08_ARREADY_out;
  AXI_08_AWREADY <= AXI_08_AWREADY_out;
  AXI_08_BID <= AXI_08_BID_out;
  AXI_08_BRESP <= AXI_08_BRESP_out;
  AXI_08_BVALID <= AXI_08_BVALID_out;
  AXI_08_DFI_AW_AERR_N <= AXI_08_DFI_AW_AERR_N_out;
  AXI_08_DFI_CLK_BUF <= AXI_08_DFI_CLK_BUF_out;
  AXI_08_DFI_DBI_BYTE_DISABLE <= AXI_08_DFI_DBI_BYTE_DISABLE_out;
  AXI_08_DFI_DW_RDDATA_DBI <= AXI_08_DFI_DW_RDDATA_DBI_out;
  AXI_08_DFI_DW_RDDATA_DERR <= AXI_08_DFI_DW_RDDATA_DERR_out;
  AXI_08_DFI_DW_RDDATA_VALID <= AXI_08_DFI_DW_RDDATA_VALID_out;
  AXI_08_DFI_INIT_COMPLETE <= AXI_08_DFI_INIT_COMPLETE_out;
  AXI_08_DFI_PHYUPD_REQ <= AXI_08_DFI_PHYUPD_REQ_out;
  AXI_08_DFI_PHY_LP_STATE <= AXI_08_DFI_PHY_LP_STATE_out;
  AXI_08_DFI_RST_N_BUF <= AXI_08_DFI_RST_N_BUF_out;
  AXI_08_MC_STATUS <= AXI_08_MC_STATUS_out;
  AXI_08_PHY_STATUS <= AXI_08_PHY_STATUS_out;
  AXI_08_RDATA <= AXI_08_RDATA_out;
  AXI_08_RDATA_PARITY <= AXI_08_RDATA_PARITY_out;
  AXI_08_RID <= AXI_08_RID_out;
  AXI_08_RLAST <= AXI_08_RLAST_out;
  AXI_08_RRESP <= AXI_08_RRESP_out;
  AXI_08_RVALID <= AXI_08_RVALID_out;
  AXI_08_WREADY <= AXI_08_WREADY_out;
  AXI_09_ARREADY <= AXI_09_ARREADY_out;
  AXI_09_AWREADY <= AXI_09_AWREADY_out;
  AXI_09_BID <= AXI_09_BID_out;
  AXI_09_BRESP <= AXI_09_BRESP_out;
  AXI_09_BVALID <= AXI_09_BVALID_out;
  AXI_09_DFI_AW_AERR_N <= AXI_09_DFI_AW_AERR_N_out;
  AXI_09_DFI_CLK_BUF <= AXI_09_DFI_CLK_BUF_out;
  AXI_09_DFI_DBI_BYTE_DISABLE <= AXI_09_DFI_DBI_BYTE_DISABLE_out;
  AXI_09_DFI_DW_RDDATA_DBI <= AXI_09_DFI_DW_RDDATA_DBI_out;
  AXI_09_DFI_DW_RDDATA_DERR <= AXI_09_DFI_DW_RDDATA_DERR_out;
  AXI_09_DFI_DW_RDDATA_VALID <= AXI_09_DFI_DW_RDDATA_VALID_out;
  AXI_09_DFI_INIT_COMPLETE <= AXI_09_DFI_INIT_COMPLETE_out;
  AXI_09_DFI_PHYUPD_REQ <= AXI_09_DFI_PHYUPD_REQ_out;
  AXI_09_DFI_PHY_LP_STATE <= AXI_09_DFI_PHY_LP_STATE_out;
  AXI_09_DFI_RST_N_BUF <= AXI_09_DFI_RST_N_BUF_out;
  AXI_09_RDATA <= AXI_09_RDATA_out;
  AXI_09_RDATA_PARITY <= AXI_09_RDATA_PARITY_out;
  AXI_09_RID <= AXI_09_RID_out;
  AXI_09_RLAST <= AXI_09_RLAST_out;
  AXI_09_RRESP <= AXI_09_RRESP_out;
  AXI_09_RVALID <= AXI_09_RVALID_out;
  AXI_09_WREADY <= AXI_09_WREADY_out;
  AXI_10_ARREADY <= AXI_10_ARREADY_out;
  AXI_10_AWREADY <= AXI_10_AWREADY_out;
  AXI_10_BID <= AXI_10_BID_out;
  AXI_10_BRESP <= AXI_10_BRESP_out;
  AXI_10_BVALID <= AXI_10_BVALID_out;
  AXI_10_DFI_AW_AERR_N <= AXI_10_DFI_AW_AERR_N_out;
  AXI_10_DFI_CLK_BUF <= AXI_10_DFI_CLK_BUF_out;
  AXI_10_DFI_DBI_BYTE_DISABLE <= AXI_10_DFI_DBI_BYTE_DISABLE_out;
  AXI_10_DFI_DW_RDDATA_DBI <= AXI_10_DFI_DW_RDDATA_DBI_out;
  AXI_10_DFI_DW_RDDATA_DERR <= AXI_10_DFI_DW_RDDATA_DERR_out;
  AXI_10_DFI_DW_RDDATA_VALID <= AXI_10_DFI_DW_RDDATA_VALID_out;
  AXI_10_DFI_INIT_COMPLETE <= AXI_10_DFI_INIT_COMPLETE_out;
  AXI_10_DFI_PHYUPD_REQ <= AXI_10_DFI_PHYUPD_REQ_out;
  AXI_10_DFI_PHY_LP_STATE <= AXI_10_DFI_PHY_LP_STATE_out;
  AXI_10_DFI_RST_N_BUF <= AXI_10_DFI_RST_N_BUF_out;
  AXI_10_MC_STATUS <= AXI_10_MC_STATUS_out;
  AXI_10_PHY_STATUS <= AXI_10_PHY_STATUS_out;
  AXI_10_RDATA <= AXI_10_RDATA_out;
  AXI_10_RDATA_PARITY <= AXI_10_RDATA_PARITY_out;
  AXI_10_RID <= AXI_10_RID_out;
  AXI_10_RLAST <= AXI_10_RLAST_out;
  AXI_10_RRESP <= AXI_10_RRESP_out;
  AXI_10_RVALID <= AXI_10_RVALID_out;
  AXI_10_WREADY <= AXI_10_WREADY_out;
  AXI_11_ARREADY <= AXI_11_ARREADY_out;
  AXI_11_AWREADY <= AXI_11_AWREADY_out;
  AXI_11_BID <= AXI_11_BID_out;
  AXI_11_BRESP <= AXI_11_BRESP_out;
  AXI_11_BVALID <= AXI_11_BVALID_out;
  AXI_11_DFI_AW_AERR_N <= AXI_11_DFI_AW_AERR_N_out;
  AXI_11_DFI_CLK_BUF <= AXI_11_DFI_CLK_BUF_out;
  AXI_11_DFI_DBI_BYTE_DISABLE <= AXI_11_DFI_DBI_BYTE_DISABLE_out;
  AXI_11_DFI_DW_RDDATA_DBI <= AXI_11_DFI_DW_RDDATA_DBI_out;
  AXI_11_DFI_DW_RDDATA_DERR <= AXI_11_DFI_DW_RDDATA_DERR_out;
  AXI_11_DFI_DW_RDDATA_VALID <= AXI_11_DFI_DW_RDDATA_VALID_out;
  AXI_11_DFI_INIT_COMPLETE <= AXI_11_DFI_INIT_COMPLETE_out;
  AXI_11_DFI_PHYUPD_REQ <= AXI_11_DFI_PHYUPD_REQ_out;
  AXI_11_DFI_PHY_LP_STATE <= AXI_11_DFI_PHY_LP_STATE_out;
  AXI_11_DFI_RST_N_BUF <= AXI_11_DFI_RST_N_BUF_out;
  AXI_11_RDATA <= AXI_11_RDATA_out;
  AXI_11_RDATA_PARITY <= AXI_11_RDATA_PARITY_out;
  AXI_11_RID <= AXI_11_RID_out;
  AXI_11_RLAST <= AXI_11_RLAST_out;
  AXI_11_RRESP <= AXI_11_RRESP_out;
  AXI_11_RVALID <= AXI_11_RVALID_out;
  AXI_11_WREADY <= AXI_11_WREADY_out;
  AXI_12_ARREADY <= AXI_12_ARREADY_out;
  AXI_12_AWREADY <= AXI_12_AWREADY_out;
  AXI_12_BID <= AXI_12_BID_out;
  AXI_12_BRESP <= AXI_12_BRESP_out;
  AXI_12_BVALID <= AXI_12_BVALID_out;
  AXI_12_DFI_AW_AERR_N <= AXI_12_DFI_AW_AERR_N_out;
  AXI_12_DFI_CLK_BUF <= AXI_12_DFI_CLK_BUF_out;
  AXI_12_DFI_DBI_BYTE_DISABLE <= AXI_12_DFI_DBI_BYTE_DISABLE_out;
  AXI_12_DFI_DW_RDDATA_DBI <= AXI_12_DFI_DW_RDDATA_DBI_out;
  AXI_12_DFI_DW_RDDATA_DERR <= AXI_12_DFI_DW_RDDATA_DERR_out;
  AXI_12_DFI_DW_RDDATA_VALID <= AXI_12_DFI_DW_RDDATA_VALID_out;
  AXI_12_DFI_INIT_COMPLETE <= AXI_12_DFI_INIT_COMPLETE_out;
  AXI_12_DFI_PHYUPD_REQ <= AXI_12_DFI_PHYUPD_REQ_out;
  AXI_12_DFI_PHY_LP_STATE <= AXI_12_DFI_PHY_LP_STATE_out;
  AXI_12_DFI_RST_N_BUF <= AXI_12_DFI_RST_N_BUF_out;
  AXI_12_MC_STATUS <= AXI_12_MC_STATUS_out;
  AXI_12_PHY_STATUS <= AXI_12_PHY_STATUS_out;
  AXI_12_RDATA <= AXI_12_RDATA_out;
  AXI_12_RDATA_PARITY <= AXI_12_RDATA_PARITY_out;
  AXI_12_RID <= AXI_12_RID_out;
  AXI_12_RLAST <= AXI_12_RLAST_out;
  AXI_12_RRESP <= AXI_12_RRESP_out;
  AXI_12_RVALID <= AXI_12_RVALID_out;
  AXI_12_WREADY <= AXI_12_WREADY_out;
  AXI_13_ARREADY <= AXI_13_ARREADY_out;
  AXI_13_AWREADY <= AXI_13_AWREADY_out;
  AXI_13_BID <= AXI_13_BID_out;
  AXI_13_BRESP <= AXI_13_BRESP_out;
  AXI_13_BVALID <= AXI_13_BVALID_out;
  AXI_13_DFI_AW_AERR_N <= AXI_13_DFI_AW_AERR_N_out;
  AXI_13_DFI_CLK_BUF <= AXI_13_DFI_CLK_BUF_out;
  AXI_13_DFI_DBI_BYTE_DISABLE <= AXI_13_DFI_DBI_BYTE_DISABLE_out;
  AXI_13_DFI_DW_RDDATA_DBI <= AXI_13_DFI_DW_RDDATA_DBI_out;
  AXI_13_DFI_DW_RDDATA_DERR <= AXI_13_DFI_DW_RDDATA_DERR_out;
  AXI_13_DFI_DW_RDDATA_VALID <= AXI_13_DFI_DW_RDDATA_VALID_out;
  AXI_13_DFI_INIT_COMPLETE <= AXI_13_DFI_INIT_COMPLETE_out;
  AXI_13_DFI_PHYUPD_REQ <= AXI_13_DFI_PHYUPD_REQ_out;
  AXI_13_DFI_PHY_LP_STATE <= AXI_13_DFI_PHY_LP_STATE_out;
  AXI_13_DFI_RST_N_BUF <= AXI_13_DFI_RST_N_BUF_out;
  AXI_13_RDATA <= AXI_13_RDATA_out;
  AXI_13_RDATA_PARITY <= AXI_13_RDATA_PARITY_out;
  AXI_13_RID <= AXI_13_RID_out;
  AXI_13_RLAST <= AXI_13_RLAST_out;
  AXI_13_RRESP <= AXI_13_RRESP_out;
  AXI_13_RVALID <= AXI_13_RVALID_out;
  AXI_13_WREADY <= AXI_13_WREADY_out;
  AXI_14_ARREADY <= AXI_14_ARREADY_out;
  AXI_14_AWREADY <= AXI_14_AWREADY_out;
  AXI_14_BID <= AXI_14_BID_out;
  AXI_14_BRESP <= AXI_14_BRESP_out;
  AXI_14_BVALID <= AXI_14_BVALID_out;
  AXI_14_DFI_AW_AERR_N <= AXI_14_DFI_AW_AERR_N_out;
  AXI_14_DFI_CLK_BUF <= AXI_14_DFI_CLK_BUF_out;
  AXI_14_DFI_DBI_BYTE_DISABLE <= AXI_14_DFI_DBI_BYTE_DISABLE_out;
  AXI_14_DFI_DW_RDDATA_DBI <= AXI_14_DFI_DW_RDDATA_DBI_out;
  AXI_14_DFI_DW_RDDATA_DERR <= AXI_14_DFI_DW_RDDATA_DERR_out;
  AXI_14_DFI_DW_RDDATA_VALID <= AXI_14_DFI_DW_RDDATA_VALID_out;
  AXI_14_DFI_INIT_COMPLETE <= AXI_14_DFI_INIT_COMPLETE_out;
  AXI_14_DFI_PHYUPD_REQ <= AXI_14_DFI_PHYUPD_REQ_out;
  AXI_14_DFI_PHY_LP_STATE <= AXI_14_DFI_PHY_LP_STATE_out;
  AXI_14_DFI_RST_N_BUF <= AXI_14_DFI_RST_N_BUF_out;
  AXI_14_MC_STATUS <= AXI_14_MC_STATUS_out;
  AXI_14_PHY_STATUS <= AXI_14_PHY_STATUS_out;
  AXI_14_RDATA <= AXI_14_RDATA_out;
  AXI_14_RDATA_PARITY <= AXI_14_RDATA_PARITY_out;
  AXI_14_RID <= AXI_14_RID_out;
  AXI_14_RLAST <= AXI_14_RLAST_out;
  AXI_14_RRESP <= AXI_14_RRESP_out;
  AXI_14_RVALID <= AXI_14_RVALID_out;
  AXI_14_WREADY <= AXI_14_WREADY_out;
  AXI_15_ARREADY <= AXI_15_ARREADY_out;
  AXI_15_AWREADY <= AXI_15_AWREADY_out;
  AXI_15_BID <= AXI_15_BID_out;
  AXI_15_BRESP <= AXI_15_BRESP_out;
  AXI_15_BVALID <= AXI_15_BVALID_out;
  AXI_15_DFI_AW_AERR_N <= AXI_15_DFI_AW_AERR_N_out;
  AXI_15_DFI_CLK_BUF <= AXI_15_DFI_CLK_BUF_out;
  AXI_15_DFI_DBI_BYTE_DISABLE <= AXI_15_DFI_DBI_BYTE_DISABLE_out;
  AXI_15_DFI_DW_RDDATA_DBI <= AXI_15_DFI_DW_RDDATA_DBI_out;
  AXI_15_DFI_DW_RDDATA_DERR <= AXI_15_DFI_DW_RDDATA_DERR_out;
  AXI_15_DFI_DW_RDDATA_VALID <= AXI_15_DFI_DW_RDDATA_VALID_out;
  AXI_15_DFI_INIT_COMPLETE <= AXI_15_DFI_INIT_COMPLETE_out;
  AXI_15_DFI_PHYUPD_REQ <= AXI_15_DFI_PHYUPD_REQ_out;
  AXI_15_DFI_PHY_LP_STATE <= AXI_15_DFI_PHY_LP_STATE_out;
  AXI_15_DFI_RST_N_BUF <= AXI_15_DFI_RST_N_BUF_out;
  AXI_15_RDATA <= AXI_15_RDATA_out;
  AXI_15_RDATA_PARITY <= AXI_15_RDATA_PARITY_out;
  AXI_15_RID <= AXI_15_RID_out;
  AXI_15_RLAST <= AXI_15_RLAST_out;
  AXI_15_RRESP <= AXI_15_RRESP_out;
  AXI_15_RVALID <= AXI_15_RVALID_out;
  AXI_15_WREADY <= AXI_15_WREADY_out;
  AXI_16_ARREADY <= AXI_16_ARREADY_out;
  AXI_16_AWREADY <= AXI_16_AWREADY_out;
  AXI_16_BID <= AXI_16_BID_out;
  AXI_16_BRESP <= AXI_16_BRESP_out;
  AXI_16_BVALID <= AXI_16_BVALID_out;
  AXI_16_DFI_AW_AERR_N <= AXI_16_DFI_AW_AERR_N_out;
  AXI_16_DFI_CLK_BUF <= AXI_16_DFI_CLK_BUF_out;
  AXI_16_DFI_DBI_BYTE_DISABLE <= AXI_16_DFI_DBI_BYTE_DISABLE_out;
  AXI_16_DFI_DW_RDDATA_DBI <= AXI_16_DFI_DW_RDDATA_DBI_out;
  AXI_16_DFI_DW_RDDATA_DERR <= AXI_16_DFI_DW_RDDATA_DERR_out;
  AXI_16_DFI_DW_RDDATA_VALID <= AXI_16_DFI_DW_RDDATA_VALID_out;
  AXI_16_DFI_INIT_COMPLETE <= AXI_16_DFI_INIT_COMPLETE_out;
  AXI_16_DFI_PHYUPD_REQ <= AXI_16_DFI_PHYUPD_REQ_out;
  AXI_16_DFI_PHY_LP_STATE <= AXI_16_DFI_PHY_LP_STATE_out;
  AXI_16_DFI_RST_N_BUF <= AXI_16_DFI_RST_N_BUF_out;
  AXI_16_MC_STATUS <= AXI_16_MC_STATUS_out;
  AXI_16_PHY_STATUS <= AXI_16_PHY_STATUS_out;
  AXI_16_RDATA <= AXI_16_RDATA_out;
  AXI_16_RDATA_PARITY <= AXI_16_RDATA_PARITY_out;
  AXI_16_RID <= AXI_16_RID_out;
  AXI_16_RLAST <= AXI_16_RLAST_out;
  AXI_16_RRESP <= AXI_16_RRESP_out;
  AXI_16_RVALID <= AXI_16_RVALID_out;
  AXI_16_WREADY <= AXI_16_WREADY_out;
  AXI_17_ARREADY <= AXI_17_ARREADY_out;
  AXI_17_AWREADY <= AXI_17_AWREADY_out;
  AXI_17_BID <= AXI_17_BID_out;
  AXI_17_BRESP <= AXI_17_BRESP_out;
  AXI_17_BVALID <= AXI_17_BVALID_out;
  AXI_17_DFI_AW_AERR_N <= AXI_17_DFI_AW_AERR_N_out;
  AXI_17_DFI_CLK_BUF <= AXI_17_DFI_CLK_BUF_out;
  AXI_17_DFI_DBI_BYTE_DISABLE <= AXI_17_DFI_DBI_BYTE_DISABLE_out;
  AXI_17_DFI_DW_RDDATA_DBI <= AXI_17_DFI_DW_RDDATA_DBI_out;
  AXI_17_DFI_DW_RDDATA_DERR <= AXI_17_DFI_DW_RDDATA_DERR_out;
  AXI_17_DFI_DW_RDDATA_VALID <= AXI_17_DFI_DW_RDDATA_VALID_out;
  AXI_17_DFI_INIT_COMPLETE <= AXI_17_DFI_INIT_COMPLETE_out;
  AXI_17_DFI_PHYUPD_REQ <= AXI_17_DFI_PHYUPD_REQ_out;
  AXI_17_DFI_PHY_LP_STATE <= AXI_17_DFI_PHY_LP_STATE_out;
  AXI_17_DFI_RST_N_BUF <= AXI_17_DFI_RST_N_BUF_out;
  AXI_17_RDATA <= AXI_17_RDATA_out;
  AXI_17_RDATA_PARITY <= AXI_17_RDATA_PARITY_out;
  AXI_17_RID <= AXI_17_RID_out;
  AXI_17_RLAST <= AXI_17_RLAST_out;
  AXI_17_RRESP <= AXI_17_RRESP_out;
  AXI_17_RVALID <= AXI_17_RVALID_out;
  AXI_17_WREADY <= AXI_17_WREADY_out;
  AXI_18_ARREADY <= AXI_18_ARREADY_out;
  AXI_18_AWREADY <= AXI_18_AWREADY_out;
  AXI_18_BID <= AXI_18_BID_out;
  AXI_18_BRESP <= AXI_18_BRESP_out;
  AXI_18_BVALID <= AXI_18_BVALID_out;
  AXI_18_DFI_AW_AERR_N <= AXI_18_DFI_AW_AERR_N_out;
  AXI_18_DFI_CLK_BUF <= AXI_18_DFI_CLK_BUF_out;
  AXI_18_DFI_DBI_BYTE_DISABLE <= AXI_18_DFI_DBI_BYTE_DISABLE_out;
  AXI_18_DFI_DW_RDDATA_DBI <= AXI_18_DFI_DW_RDDATA_DBI_out;
  AXI_18_DFI_DW_RDDATA_DERR <= AXI_18_DFI_DW_RDDATA_DERR_out;
  AXI_18_DFI_DW_RDDATA_VALID <= AXI_18_DFI_DW_RDDATA_VALID_out;
  AXI_18_DFI_INIT_COMPLETE <= AXI_18_DFI_INIT_COMPLETE_out;
  AXI_18_DFI_PHYUPD_REQ <= AXI_18_DFI_PHYUPD_REQ_out;
  AXI_18_DFI_PHY_LP_STATE <= AXI_18_DFI_PHY_LP_STATE_out;
  AXI_18_DFI_RST_N_BUF <= AXI_18_DFI_RST_N_BUF_out;
  AXI_18_MC_STATUS <= AXI_18_MC_STATUS_out;
  AXI_18_PHY_STATUS <= AXI_18_PHY_STATUS_out;
  AXI_18_RDATA <= AXI_18_RDATA_out;
  AXI_18_RDATA_PARITY <= AXI_18_RDATA_PARITY_out;
  AXI_18_RID <= AXI_18_RID_out;
  AXI_18_RLAST <= AXI_18_RLAST_out;
  AXI_18_RRESP <= AXI_18_RRESP_out;
  AXI_18_RVALID <= AXI_18_RVALID_out;
  AXI_18_WREADY <= AXI_18_WREADY_out;
  AXI_19_ARREADY <= AXI_19_ARREADY_out;
  AXI_19_AWREADY <= AXI_19_AWREADY_out;
  AXI_19_BID <= AXI_19_BID_out;
  AXI_19_BRESP <= AXI_19_BRESP_out;
  AXI_19_BVALID <= AXI_19_BVALID_out;
  AXI_19_DFI_AW_AERR_N <= AXI_19_DFI_AW_AERR_N_out;
  AXI_19_DFI_CLK_BUF <= AXI_19_DFI_CLK_BUF_out;
  AXI_19_DFI_DBI_BYTE_DISABLE <= AXI_19_DFI_DBI_BYTE_DISABLE_out;
  AXI_19_DFI_DW_RDDATA_DBI <= AXI_19_DFI_DW_RDDATA_DBI_out;
  AXI_19_DFI_DW_RDDATA_DERR <= AXI_19_DFI_DW_RDDATA_DERR_out;
  AXI_19_DFI_DW_RDDATA_VALID <= AXI_19_DFI_DW_RDDATA_VALID_out;
  AXI_19_DFI_INIT_COMPLETE <= AXI_19_DFI_INIT_COMPLETE_out;
  AXI_19_DFI_PHYUPD_REQ <= AXI_19_DFI_PHYUPD_REQ_out;
  AXI_19_DFI_PHY_LP_STATE <= AXI_19_DFI_PHY_LP_STATE_out;
  AXI_19_DFI_RST_N_BUF <= AXI_19_DFI_RST_N_BUF_out;
  AXI_19_RDATA <= AXI_19_RDATA_out;
  AXI_19_RDATA_PARITY <= AXI_19_RDATA_PARITY_out;
  AXI_19_RID <= AXI_19_RID_out;
  AXI_19_RLAST <= AXI_19_RLAST_out;
  AXI_19_RRESP <= AXI_19_RRESP_out;
  AXI_19_RVALID <= AXI_19_RVALID_out;
  AXI_19_WREADY <= AXI_19_WREADY_out;
  AXI_20_ARREADY <= AXI_20_ARREADY_out;
  AXI_20_AWREADY <= AXI_20_AWREADY_out;
  AXI_20_BID <= AXI_20_BID_out;
  AXI_20_BRESP <= AXI_20_BRESP_out;
  AXI_20_BVALID <= AXI_20_BVALID_out;
  AXI_20_DFI_AW_AERR_N <= AXI_20_DFI_AW_AERR_N_out;
  AXI_20_DFI_CLK_BUF <= AXI_20_DFI_CLK_BUF_out;
  AXI_20_DFI_DBI_BYTE_DISABLE <= AXI_20_DFI_DBI_BYTE_DISABLE_out;
  AXI_20_DFI_DW_RDDATA_DBI <= AXI_20_DFI_DW_RDDATA_DBI_out;
  AXI_20_DFI_DW_RDDATA_DERR <= AXI_20_DFI_DW_RDDATA_DERR_out;
  AXI_20_DFI_DW_RDDATA_VALID <= AXI_20_DFI_DW_RDDATA_VALID_out;
  AXI_20_DFI_INIT_COMPLETE <= AXI_20_DFI_INIT_COMPLETE_out;
  AXI_20_DFI_PHYUPD_REQ <= AXI_20_DFI_PHYUPD_REQ_out;
  AXI_20_DFI_PHY_LP_STATE <= AXI_20_DFI_PHY_LP_STATE_out;
  AXI_20_DFI_RST_N_BUF <= AXI_20_DFI_RST_N_BUF_out;
  AXI_20_MC_STATUS <= AXI_20_MC_STATUS_out;
  AXI_20_PHY_STATUS <= AXI_20_PHY_STATUS_out;
  AXI_20_RDATA <= AXI_20_RDATA_out;
  AXI_20_RDATA_PARITY <= AXI_20_RDATA_PARITY_out;
  AXI_20_RID <= AXI_20_RID_out;
  AXI_20_RLAST <= AXI_20_RLAST_out;
  AXI_20_RRESP <= AXI_20_RRESP_out;
  AXI_20_RVALID <= AXI_20_RVALID_out;
  AXI_20_WREADY <= AXI_20_WREADY_out;
  AXI_21_ARREADY <= AXI_21_ARREADY_out;
  AXI_21_AWREADY <= AXI_21_AWREADY_out;
  AXI_21_BID <= AXI_21_BID_out;
  AXI_21_BRESP <= AXI_21_BRESP_out;
  AXI_21_BVALID <= AXI_21_BVALID_out;
  AXI_21_DFI_AW_AERR_N <= AXI_21_DFI_AW_AERR_N_out;
  AXI_21_DFI_CLK_BUF <= AXI_21_DFI_CLK_BUF_out;
  AXI_21_DFI_DBI_BYTE_DISABLE <= AXI_21_DFI_DBI_BYTE_DISABLE_out;
  AXI_21_DFI_DW_RDDATA_DBI <= AXI_21_DFI_DW_RDDATA_DBI_out;
  AXI_21_DFI_DW_RDDATA_DERR <= AXI_21_DFI_DW_RDDATA_DERR_out;
  AXI_21_DFI_DW_RDDATA_VALID <= AXI_21_DFI_DW_RDDATA_VALID_out;
  AXI_21_DFI_INIT_COMPLETE <= AXI_21_DFI_INIT_COMPLETE_out;
  AXI_21_DFI_PHYUPD_REQ <= AXI_21_DFI_PHYUPD_REQ_out;
  AXI_21_DFI_PHY_LP_STATE <= AXI_21_DFI_PHY_LP_STATE_out;
  AXI_21_DFI_RST_N_BUF <= AXI_21_DFI_RST_N_BUF_out;
  AXI_21_RDATA <= AXI_21_RDATA_out;
  AXI_21_RDATA_PARITY <= AXI_21_RDATA_PARITY_out;
  AXI_21_RID <= AXI_21_RID_out;
  AXI_21_RLAST <= AXI_21_RLAST_out;
  AXI_21_RRESP <= AXI_21_RRESP_out;
  AXI_21_RVALID <= AXI_21_RVALID_out;
  AXI_21_WREADY <= AXI_21_WREADY_out;
  AXI_22_ARREADY <= AXI_22_ARREADY_out;
  AXI_22_AWREADY <= AXI_22_AWREADY_out;
  AXI_22_BID <= AXI_22_BID_out;
  AXI_22_BRESP <= AXI_22_BRESP_out;
  AXI_22_BVALID <= AXI_22_BVALID_out;
  AXI_22_DFI_AW_AERR_N <= AXI_22_DFI_AW_AERR_N_out;
  AXI_22_DFI_CLK_BUF <= AXI_22_DFI_CLK_BUF_out;
  AXI_22_DFI_DBI_BYTE_DISABLE <= AXI_22_DFI_DBI_BYTE_DISABLE_out;
  AXI_22_DFI_DW_RDDATA_DBI <= AXI_22_DFI_DW_RDDATA_DBI_out;
  AXI_22_DFI_DW_RDDATA_DERR <= AXI_22_DFI_DW_RDDATA_DERR_out;
  AXI_22_DFI_DW_RDDATA_VALID <= AXI_22_DFI_DW_RDDATA_VALID_out;
  AXI_22_DFI_INIT_COMPLETE <= AXI_22_DFI_INIT_COMPLETE_out;
  AXI_22_DFI_PHYUPD_REQ <= AXI_22_DFI_PHYUPD_REQ_out;
  AXI_22_DFI_PHY_LP_STATE <= AXI_22_DFI_PHY_LP_STATE_out;
  AXI_22_DFI_RST_N_BUF <= AXI_22_DFI_RST_N_BUF_out;
  AXI_22_MC_STATUS <= AXI_22_MC_STATUS_out;
  AXI_22_PHY_STATUS <= AXI_22_PHY_STATUS_out;
  AXI_22_RDATA <= AXI_22_RDATA_out;
  AXI_22_RDATA_PARITY <= AXI_22_RDATA_PARITY_out;
  AXI_22_RID <= AXI_22_RID_out;
  AXI_22_RLAST <= AXI_22_RLAST_out;
  AXI_22_RRESP <= AXI_22_RRESP_out;
  AXI_22_RVALID <= AXI_22_RVALID_out;
  AXI_22_WREADY <= AXI_22_WREADY_out;
  AXI_23_ARREADY <= AXI_23_ARREADY_out;
  AXI_23_AWREADY <= AXI_23_AWREADY_out;
  AXI_23_BID <= AXI_23_BID_out;
  AXI_23_BRESP <= AXI_23_BRESP_out;
  AXI_23_BVALID <= AXI_23_BVALID_out;
  AXI_23_DFI_AW_AERR_N <= AXI_23_DFI_AW_AERR_N_out;
  AXI_23_DFI_CLK_BUF <= AXI_23_DFI_CLK_BUF_out;
  AXI_23_DFI_DBI_BYTE_DISABLE <= AXI_23_DFI_DBI_BYTE_DISABLE_out;
  AXI_23_DFI_DW_RDDATA_DBI <= AXI_23_DFI_DW_RDDATA_DBI_out;
  AXI_23_DFI_DW_RDDATA_DERR <= AXI_23_DFI_DW_RDDATA_DERR_out;
  AXI_23_DFI_DW_RDDATA_VALID <= AXI_23_DFI_DW_RDDATA_VALID_out;
  AXI_23_DFI_INIT_COMPLETE <= AXI_23_DFI_INIT_COMPLETE_out;
  AXI_23_DFI_PHYUPD_REQ <= AXI_23_DFI_PHYUPD_REQ_out;
  AXI_23_DFI_PHY_LP_STATE <= AXI_23_DFI_PHY_LP_STATE_out;
  AXI_23_DFI_RST_N_BUF <= AXI_23_DFI_RST_N_BUF_out;
  AXI_23_RDATA <= AXI_23_RDATA_out;
  AXI_23_RDATA_PARITY <= AXI_23_RDATA_PARITY_out;
  AXI_23_RID <= AXI_23_RID_out;
  AXI_23_RLAST <= AXI_23_RLAST_out;
  AXI_23_RRESP <= AXI_23_RRESP_out;
  AXI_23_RVALID <= AXI_23_RVALID_out;
  AXI_23_WREADY <= AXI_23_WREADY_out;
  AXI_24_ARREADY <= AXI_24_ARREADY_out;
  AXI_24_AWREADY <= AXI_24_AWREADY_out;
  AXI_24_BID <= AXI_24_BID_out;
  AXI_24_BRESP <= AXI_24_BRESP_out;
  AXI_24_BVALID <= AXI_24_BVALID_out;
  AXI_24_DFI_AW_AERR_N <= AXI_24_DFI_AW_AERR_N_out;
  AXI_24_DFI_CLK_BUF <= AXI_24_DFI_CLK_BUF_out;
  AXI_24_DFI_DBI_BYTE_DISABLE <= AXI_24_DFI_DBI_BYTE_DISABLE_out;
  AXI_24_DFI_DW_RDDATA_DBI <= AXI_24_DFI_DW_RDDATA_DBI_out;
  AXI_24_DFI_DW_RDDATA_DERR <= AXI_24_DFI_DW_RDDATA_DERR_out;
  AXI_24_DFI_DW_RDDATA_VALID <= AXI_24_DFI_DW_RDDATA_VALID_out;
  AXI_24_DFI_INIT_COMPLETE <= AXI_24_DFI_INIT_COMPLETE_out;
  AXI_24_DFI_PHYUPD_REQ <= AXI_24_DFI_PHYUPD_REQ_out;
  AXI_24_DFI_PHY_LP_STATE <= AXI_24_DFI_PHY_LP_STATE_out;
  AXI_24_DFI_RST_N_BUF <= AXI_24_DFI_RST_N_BUF_out;
  AXI_24_MC_STATUS <= AXI_24_MC_STATUS_out;
  AXI_24_PHY_STATUS <= AXI_24_PHY_STATUS_out;
  AXI_24_RDATA <= AXI_24_RDATA_out;
  AXI_24_RDATA_PARITY <= AXI_24_RDATA_PARITY_out;
  AXI_24_RID <= AXI_24_RID_out;
  AXI_24_RLAST <= AXI_24_RLAST_out;
  AXI_24_RRESP <= AXI_24_RRESP_out;
  AXI_24_RVALID <= AXI_24_RVALID_out;
  AXI_24_WREADY <= AXI_24_WREADY_out;
  AXI_25_ARREADY <= AXI_25_ARREADY_out;
  AXI_25_AWREADY <= AXI_25_AWREADY_out;
  AXI_25_BID <= AXI_25_BID_out;
  AXI_25_BRESP <= AXI_25_BRESP_out;
  AXI_25_BVALID <= AXI_25_BVALID_out;
  AXI_25_DFI_AW_AERR_N <= AXI_25_DFI_AW_AERR_N_out;
  AXI_25_DFI_CLK_BUF <= AXI_25_DFI_CLK_BUF_out;
  AXI_25_DFI_DBI_BYTE_DISABLE <= AXI_25_DFI_DBI_BYTE_DISABLE_out;
  AXI_25_DFI_DW_RDDATA_DBI <= AXI_25_DFI_DW_RDDATA_DBI_out;
  AXI_25_DFI_DW_RDDATA_DERR <= AXI_25_DFI_DW_RDDATA_DERR_out;
  AXI_25_DFI_DW_RDDATA_VALID <= AXI_25_DFI_DW_RDDATA_VALID_out;
  AXI_25_DFI_INIT_COMPLETE <= AXI_25_DFI_INIT_COMPLETE_out;
  AXI_25_DFI_PHYUPD_REQ <= AXI_25_DFI_PHYUPD_REQ_out;
  AXI_25_DFI_PHY_LP_STATE <= AXI_25_DFI_PHY_LP_STATE_out;
  AXI_25_DFI_RST_N_BUF <= AXI_25_DFI_RST_N_BUF_out;
  AXI_25_RDATA <= AXI_25_RDATA_out;
  AXI_25_RDATA_PARITY <= AXI_25_RDATA_PARITY_out;
  AXI_25_RID <= AXI_25_RID_out;
  AXI_25_RLAST <= AXI_25_RLAST_out;
  AXI_25_RRESP <= AXI_25_RRESP_out;
  AXI_25_RVALID <= AXI_25_RVALID_out;
  AXI_25_WREADY <= AXI_25_WREADY_out;
  AXI_26_ARREADY <= AXI_26_ARREADY_out;
  AXI_26_AWREADY <= AXI_26_AWREADY_out;
  AXI_26_BID <= AXI_26_BID_out;
  AXI_26_BRESP <= AXI_26_BRESP_out;
  AXI_26_BVALID <= AXI_26_BVALID_out;
  AXI_26_DFI_AW_AERR_N <= AXI_26_DFI_AW_AERR_N_out;
  AXI_26_DFI_CLK_BUF <= AXI_26_DFI_CLK_BUF_out;
  AXI_26_DFI_DBI_BYTE_DISABLE <= AXI_26_DFI_DBI_BYTE_DISABLE_out;
  AXI_26_DFI_DW_RDDATA_DBI <= AXI_26_DFI_DW_RDDATA_DBI_out;
  AXI_26_DFI_DW_RDDATA_DERR <= AXI_26_DFI_DW_RDDATA_DERR_out;
  AXI_26_DFI_DW_RDDATA_VALID <= AXI_26_DFI_DW_RDDATA_VALID_out;
  AXI_26_DFI_INIT_COMPLETE <= AXI_26_DFI_INIT_COMPLETE_out;
  AXI_26_DFI_PHYUPD_REQ <= AXI_26_DFI_PHYUPD_REQ_out;
  AXI_26_DFI_PHY_LP_STATE <= AXI_26_DFI_PHY_LP_STATE_out;
  AXI_26_DFI_RST_N_BUF <= AXI_26_DFI_RST_N_BUF_out;
  AXI_26_MC_STATUS <= AXI_26_MC_STATUS_out;
  AXI_26_PHY_STATUS <= AXI_26_PHY_STATUS_out;
  AXI_26_RDATA <= AXI_26_RDATA_out;
  AXI_26_RDATA_PARITY <= AXI_26_RDATA_PARITY_out;
  AXI_26_RID <= AXI_26_RID_out;
  AXI_26_RLAST <= AXI_26_RLAST_out;
  AXI_26_RRESP <= AXI_26_RRESP_out;
  AXI_26_RVALID <= AXI_26_RVALID_out;
  AXI_26_WREADY <= AXI_26_WREADY_out;
  AXI_27_ARREADY <= AXI_27_ARREADY_out;
  AXI_27_AWREADY <= AXI_27_AWREADY_out;
  AXI_27_BID <= AXI_27_BID_out;
  AXI_27_BRESP <= AXI_27_BRESP_out;
  AXI_27_BVALID <= AXI_27_BVALID_out;
  AXI_27_DFI_AW_AERR_N <= AXI_27_DFI_AW_AERR_N_out;
  AXI_27_DFI_CLK_BUF <= AXI_27_DFI_CLK_BUF_out;
  AXI_27_DFI_DBI_BYTE_DISABLE <= AXI_27_DFI_DBI_BYTE_DISABLE_out;
  AXI_27_DFI_DW_RDDATA_DBI <= AXI_27_DFI_DW_RDDATA_DBI_out;
  AXI_27_DFI_DW_RDDATA_DERR <= AXI_27_DFI_DW_RDDATA_DERR_out;
  AXI_27_DFI_DW_RDDATA_VALID <= AXI_27_DFI_DW_RDDATA_VALID_out;
  AXI_27_DFI_INIT_COMPLETE <= AXI_27_DFI_INIT_COMPLETE_out;
  AXI_27_DFI_PHYUPD_REQ <= AXI_27_DFI_PHYUPD_REQ_out;
  AXI_27_DFI_PHY_LP_STATE <= AXI_27_DFI_PHY_LP_STATE_out;
  AXI_27_DFI_RST_N_BUF <= AXI_27_DFI_RST_N_BUF_out;
  AXI_27_RDATA <= AXI_27_RDATA_out;
  AXI_27_RDATA_PARITY <= AXI_27_RDATA_PARITY_out;
  AXI_27_RID <= AXI_27_RID_out;
  AXI_27_RLAST <= AXI_27_RLAST_out;
  AXI_27_RRESP <= AXI_27_RRESP_out;
  AXI_27_RVALID <= AXI_27_RVALID_out;
  AXI_27_WREADY <= AXI_27_WREADY_out;
  AXI_28_ARREADY <= AXI_28_ARREADY_out;
  AXI_28_AWREADY <= AXI_28_AWREADY_out;
  AXI_28_BID <= AXI_28_BID_out;
  AXI_28_BRESP <= AXI_28_BRESP_out;
  AXI_28_BVALID <= AXI_28_BVALID_out;
  AXI_28_DFI_AW_AERR_N <= AXI_28_DFI_AW_AERR_N_out;
  AXI_28_DFI_CLK_BUF <= AXI_28_DFI_CLK_BUF_out;
  AXI_28_DFI_DBI_BYTE_DISABLE <= AXI_28_DFI_DBI_BYTE_DISABLE_out;
  AXI_28_DFI_DW_RDDATA_DBI <= AXI_28_DFI_DW_RDDATA_DBI_out;
  AXI_28_DFI_DW_RDDATA_DERR <= AXI_28_DFI_DW_RDDATA_DERR_out;
  AXI_28_DFI_DW_RDDATA_VALID <= AXI_28_DFI_DW_RDDATA_VALID_out;
  AXI_28_DFI_INIT_COMPLETE <= AXI_28_DFI_INIT_COMPLETE_out;
  AXI_28_DFI_PHYUPD_REQ <= AXI_28_DFI_PHYUPD_REQ_out;
  AXI_28_DFI_PHY_LP_STATE <= AXI_28_DFI_PHY_LP_STATE_out;
  AXI_28_DFI_RST_N_BUF <= AXI_28_DFI_RST_N_BUF_out;
  AXI_28_MC_STATUS <= AXI_28_MC_STATUS_out;
  AXI_28_PHY_STATUS <= AXI_28_PHY_STATUS_out;
  AXI_28_RDATA <= AXI_28_RDATA_out;
  AXI_28_RDATA_PARITY <= AXI_28_RDATA_PARITY_out;
  AXI_28_RID <= AXI_28_RID_out;
  AXI_28_RLAST <= AXI_28_RLAST_out;
  AXI_28_RRESP <= AXI_28_RRESP_out;
  AXI_28_RVALID <= AXI_28_RVALID_out;
  AXI_28_WREADY <= AXI_28_WREADY_out;
  AXI_29_ARREADY <= AXI_29_ARREADY_out;
  AXI_29_AWREADY <= AXI_29_AWREADY_out;
  AXI_29_BID <= AXI_29_BID_out;
  AXI_29_BRESP <= AXI_29_BRESP_out;
  AXI_29_BVALID <= AXI_29_BVALID_out;
  AXI_29_DFI_AW_AERR_N <= AXI_29_DFI_AW_AERR_N_out;
  AXI_29_DFI_CLK_BUF <= AXI_29_DFI_CLK_BUF_out;
  AXI_29_DFI_DBI_BYTE_DISABLE <= AXI_29_DFI_DBI_BYTE_DISABLE_out;
  AXI_29_DFI_DW_RDDATA_DBI <= AXI_29_DFI_DW_RDDATA_DBI_out;
  AXI_29_DFI_DW_RDDATA_DERR <= AXI_29_DFI_DW_RDDATA_DERR_out;
  AXI_29_DFI_DW_RDDATA_VALID <= AXI_29_DFI_DW_RDDATA_VALID_out;
  AXI_29_DFI_INIT_COMPLETE <= AXI_29_DFI_INIT_COMPLETE_out;
  AXI_29_DFI_PHYUPD_REQ <= AXI_29_DFI_PHYUPD_REQ_out;
  AXI_29_DFI_PHY_LP_STATE <= AXI_29_DFI_PHY_LP_STATE_out;
  AXI_29_DFI_RST_N_BUF <= AXI_29_DFI_RST_N_BUF_out;
  AXI_29_RDATA <= AXI_29_RDATA_out;
  AXI_29_RDATA_PARITY <= AXI_29_RDATA_PARITY_out;
  AXI_29_RID <= AXI_29_RID_out;
  AXI_29_RLAST <= AXI_29_RLAST_out;
  AXI_29_RRESP <= AXI_29_RRESP_out;
  AXI_29_RVALID <= AXI_29_RVALID_out;
  AXI_29_WREADY <= AXI_29_WREADY_out;
  AXI_30_ARREADY <= AXI_30_ARREADY_out;
  AXI_30_AWREADY <= AXI_30_AWREADY_out;
  AXI_30_BID <= AXI_30_BID_out;
  AXI_30_BRESP <= AXI_30_BRESP_out;
  AXI_30_BVALID <= AXI_30_BVALID_out;
  AXI_30_DFI_AW_AERR_N <= AXI_30_DFI_AW_AERR_N_out;
  AXI_30_DFI_CLK_BUF <= AXI_30_DFI_CLK_BUF_out;
  AXI_30_DFI_DBI_BYTE_DISABLE <= AXI_30_DFI_DBI_BYTE_DISABLE_out;
  AXI_30_DFI_DW_RDDATA_DBI <= AXI_30_DFI_DW_RDDATA_DBI_out;
  AXI_30_DFI_DW_RDDATA_DERR <= AXI_30_DFI_DW_RDDATA_DERR_out;
  AXI_30_DFI_DW_RDDATA_VALID <= AXI_30_DFI_DW_RDDATA_VALID_out;
  AXI_30_DFI_INIT_COMPLETE <= AXI_30_DFI_INIT_COMPLETE_out;
  AXI_30_DFI_PHYUPD_REQ <= AXI_30_DFI_PHYUPD_REQ_out;
  AXI_30_DFI_PHY_LP_STATE <= AXI_30_DFI_PHY_LP_STATE_out;
  AXI_30_DFI_RST_N_BUF <= AXI_30_DFI_RST_N_BUF_out;
  AXI_30_MC_STATUS <= AXI_30_MC_STATUS_out;
  AXI_30_PHY_STATUS <= AXI_30_PHY_STATUS_out;
  AXI_30_RDATA <= AXI_30_RDATA_out;
  AXI_30_RDATA_PARITY <= AXI_30_RDATA_PARITY_out;
  AXI_30_RID <= AXI_30_RID_out;
  AXI_30_RLAST <= AXI_30_RLAST_out;
  AXI_30_RRESP <= AXI_30_RRESP_out;
  AXI_30_RVALID <= AXI_30_RVALID_out;
  AXI_30_WREADY <= AXI_30_WREADY_out;
  AXI_31_ARREADY <= AXI_31_ARREADY_out;
  AXI_31_AWREADY <= AXI_31_AWREADY_out;
  AXI_31_BID <= AXI_31_BID_out;
  AXI_31_BRESP <= AXI_31_BRESP_out;
  AXI_31_BVALID <= AXI_31_BVALID_out;
  AXI_31_DFI_AW_AERR_N <= AXI_31_DFI_AW_AERR_N_out;
  AXI_31_DFI_CLK_BUF <= AXI_31_DFI_CLK_BUF_out;
  AXI_31_DFI_DBI_BYTE_DISABLE <= AXI_31_DFI_DBI_BYTE_DISABLE_out;
  AXI_31_DFI_DW_RDDATA_DBI <= AXI_31_DFI_DW_RDDATA_DBI_out;
  AXI_31_DFI_DW_RDDATA_DERR <= AXI_31_DFI_DW_RDDATA_DERR_out;
  AXI_31_DFI_DW_RDDATA_VALID <= AXI_31_DFI_DW_RDDATA_VALID_out;
  AXI_31_DFI_INIT_COMPLETE <= AXI_31_DFI_INIT_COMPLETE_out;
  AXI_31_DFI_PHYUPD_REQ <= AXI_31_DFI_PHYUPD_REQ_out;
  AXI_31_DFI_PHY_LP_STATE <= AXI_31_DFI_PHY_LP_STATE_out;
  AXI_31_DFI_RST_N_BUF <= AXI_31_DFI_RST_N_BUF_out;
  AXI_31_RDATA <= AXI_31_RDATA_out;
  AXI_31_RDATA_PARITY <= AXI_31_RDATA_PARITY_out;
  AXI_31_RID <= AXI_31_RID_out;
  AXI_31_RLAST <= AXI_31_RLAST_out;
  AXI_31_RRESP <= AXI_31_RRESP_out;
  AXI_31_RVALID <= AXI_31_RVALID_out;
  AXI_31_WREADY <= AXI_31_WREADY_out;
  DRAM_0_STAT_CATTRIP <= DRAM_0_STAT_CATTRIP_out;
  DRAM_0_STAT_TEMP <= DRAM_0_STAT_TEMP_out;
  DRAM_1_STAT_CATTRIP <= DRAM_1_STAT_CATTRIP_out;
  DRAM_1_STAT_TEMP <= DRAM_1_STAT_TEMP_out;
  
  APB_0_PADDR_in <= APB_0_PADDR;
  APB_0_PCLK_in <= APB_0_PCLK;
  APB_0_PENABLE_in <= APB_0_PENABLE;
  APB_0_PRESET_N_in <= APB_0_PRESET_N;
  APB_0_PSEL_in <= APB_0_PSEL;
  APB_0_PWDATA_in <= APB_0_PWDATA;
  APB_0_PWRITE_in <= APB_0_PWRITE;
  APB_1_PADDR_in <= APB_1_PADDR;
  APB_1_PCLK_in <= APB_1_PCLK;
  APB_1_PENABLE_in <= APB_1_PENABLE;
  APB_1_PRESET_N_in <= APB_1_PRESET_N;
  APB_1_PSEL_in <= APB_1_PSEL;
  APB_1_PWDATA_in <= APB_1_PWDATA;
  APB_1_PWRITE_in <= APB_1_PWRITE;
  AXI_00_ACLK_in <= AXI_00_ACLK;
  AXI_00_ARADDR_in <= AXI_00_ARADDR;
  AXI_00_ARBURST_in <= AXI_00_ARBURST;
  AXI_00_ARESET_N_in <= AXI_00_ARESET_N;
  AXI_00_ARID_in <= AXI_00_ARID;
  AXI_00_ARLEN_in <= AXI_00_ARLEN;
  AXI_00_ARSIZE_in <= AXI_00_ARSIZE;
  AXI_00_ARVALID_in <= AXI_00_ARVALID;
  AXI_00_AWADDR_in <= AXI_00_AWADDR;
  AXI_00_AWBURST_in <= AXI_00_AWBURST;
  AXI_00_AWID_in <= AXI_00_AWID;
  AXI_00_AWLEN_in <= AXI_00_AWLEN;
  AXI_00_AWSIZE_in <= AXI_00_AWSIZE;
  AXI_00_AWVALID_in <= AXI_00_AWVALID;
  AXI_00_BREADY_in <= AXI_00_BREADY;
  AXI_00_DFI_LP_PWR_X_REQ_in <= AXI_00_DFI_LP_PWR_X_REQ;
  AXI_00_RREADY_in <= AXI_00_RREADY;
  AXI_00_WDATA_PARITY_in <= AXI_00_WDATA_PARITY;
  AXI_00_WDATA_in <= AXI_00_WDATA;
  AXI_00_WLAST_in <= AXI_00_WLAST;
  AXI_00_WSTRB_in <= AXI_00_WSTRB;
  AXI_00_WVALID_in <= AXI_00_WVALID;
  AXI_01_ACLK_in <= AXI_01_ACLK;
  AXI_01_ARADDR_in <= AXI_01_ARADDR;
  AXI_01_ARBURST_in <= AXI_01_ARBURST;
  AXI_01_ARESET_N_in <= AXI_01_ARESET_N;
  AXI_01_ARID_in <= AXI_01_ARID;
  AXI_01_ARLEN_in <= AXI_01_ARLEN;
  AXI_01_ARSIZE_in <= AXI_01_ARSIZE;
  AXI_01_ARVALID_in <= AXI_01_ARVALID;
  AXI_01_AWADDR_in <= AXI_01_AWADDR;
  AXI_01_AWBURST_in <= AXI_01_AWBURST;
  AXI_01_AWID_in <= AXI_01_AWID;
  AXI_01_AWLEN_in <= AXI_01_AWLEN;
  AXI_01_AWSIZE_in <= AXI_01_AWSIZE;
  AXI_01_AWVALID_in <= AXI_01_AWVALID;
  AXI_01_BREADY_in <= AXI_01_BREADY;
  AXI_01_DFI_LP_PWR_X_REQ_in <= AXI_01_DFI_LP_PWR_X_REQ;
  AXI_01_RREADY_in <= AXI_01_RREADY;
  AXI_01_WDATA_PARITY_in <= AXI_01_WDATA_PARITY;
  AXI_01_WDATA_in <= AXI_01_WDATA;
  AXI_01_WLAST_in <= AXI_01_WLAST;
  AXI_01_WSTRB_in <= AXI_01_WSTRB;
  AXI_01_WVALID_in <= AXI_01_WVALID;
  AXI_02_ACLK_in <= AXI_02_ACLK;
  AXI_02_ARADDR_in <= AXI_02_ARADDR;
  AXI_02_ARBURST_in <= AXI_02_ARBURST;
  AXI_02_ARESET_N_in <= AXI_02_ARESET_N;
  AXI_02_ARID_in <= AXI_02_ARID;
  AXI_02_ARLEN_in <= AXI_02_ARLEN;
  AXI_02_ARSIZE_in <= AXI_02_ARSIZE;
  AXI_02_ARVALID_in <= AXI_02_ARVALID;
  AXI_02_AWADDR_in <= AXI_02_AWADDR;
  AXI_02_AWBURST_in <= AXI_02_AWBURST;
  AXI_02_AWID_in <= AXI_02_AWID;
  AXI_02_AWLEN_in <= AXI_02_AWLEN;
  AXI_02_AWSIZE_in <= AXI_02_AWSIZE;
  AXI_02_AWVALID_in <= AXI_02_AWVALID;
  AXI_02_BREADY_in <= AXI_02_BREADY;
  AXI_02_DFI_LP_PWR_X_REQ_in <= AXI_02_DFI_LP_PWR_X_REQ;
  AXI_02_RREADY_in <= AXI_02_RREADY;
  AXI_02_WDATA_PARITY_in <= AXI_02_WDATA_PARITY;
  AXI_02_WDATA_in <= AXI_02_WDATA;
  AXI_02_WLAST_in <= AXI_02_WLAST;
  AXI_02_WSTRB_in <= AXI_02_WSTRB;
  AXI_02_WVALID_in <= AXI_02_WVALID;
  AXI_03_ACLK_in <= AXI_03_ACLK;
  AXI_03_ARADDR_in <= AXI_03_ARADDR;
  AXI_03_ARBURST_in <= AXI_03_ARBURST;
  AXI_03_ARESET_N_in <= AXI_03_ARESET_N;
  AXI_03_ARID_in <= AXI_03_ARID;
  AXI_03_ARLEN_in <= AXI_03_ARLEN;
  AXI_03_ARSIZE_in <= AXI_03_ARSIZE;
  AXI_03_ARVALID_in <= AXI_03_ARVALID;
  AXI_03_AWADDR_in <= AXI_03_AWADDR;
  AXI_03_AWBURST_in <= AXI_03_AWBURST;
  AXI_03_AWID_in <= AXI_03_AWID;
  AXI_03_AWLEN_in <= AXI_03_AWLEN;
  AXI_03_AWSIZE_in <= AXI_03_AWSIZE;
  AXI_03_AWVALID_in <= AXI_03_AWVALID;
  AXI_03_BREADY_in <= AXI_03_BREADY;
  AXI_03_DFI_LP_PWR_X_REQ_in <= AXI_03_DFI_LP_PWR_X_REQ;
  AXI_03_RREADY_in <= AXI_03_RREADY;
  AXI_03_WDATA_PARITY_in <= AXI_03_WDATA_PARITY;
  AXI_03_WDATA_in <= AXI_03_WDATA;
  AXI_03_WLAST_in <= AXI_03_WLAST;
  AXI_03_WSTRB_in <= AXI_03_WSTRB;
  AXI_03_WVALID_in <= AXI_03_WVALID;
  AXI_04_ACLK_in <= AXI_04_ACLK;
  AXI_04_ARADDR_in <= AXI_04_ARADDR;
  AXI_04_ARBURST_in <= AXI_04_ARBURST;
  AXI_04_ARESET_N_in <= AXI_04_ARESET_N;
  AXI_04_ARID_in <= AXI_04_ARID;
  AXI_04_ARLEN_in <= AXI_04_ARLEN;
  AXI_04_ARSIZE_in <= AXI_04_ARSIZE;
  AXI_04_ARVALID_in <= AXI_04_ARVALID;
  AXI_04_AWADDR_in <= AXI_04_AWADDR;
  AXI_04_AWBURST_in <= AXI_04_AWBURST;
  AXI_04_AWID_in <= AXI_04_AWID;
  AXI_04_AWLEN_in <= AXI_04_AWLEN;
  AXI_04_AWSIZE_in <= AXI_04_AWSIZE;
  AXI_04_AWVALID_in <= AXI_04_AWVALID;
  AXI_04_BREADY_in <= AXI_04_BREADY;
  AXI_04_DFI_LP_PWR_X_REQ_in <= AXI_04_DFI_LP_PWR_X_REQ;
  AXI_04_RREADY_in <= AXI_04_RREADY;
  AXI_04_WDATA_PARITY_in <= AXI_04_WDATA_PARITY;
  AXI_04_WDATA_in <= AXI_04_WDATA;
  AXI_04_WLAST_in <= AXI_04_WLAST;
  AXI_04_WSTRB_in <= AXI_04_WSTRB;
  AXI_04_WVALID_in <= AXI_04_WVALID;
  AXI_05_ACLK_in <= AXI_05_ACLK;
  AXI_05_ARADDR_in <= AXI_05_ARADDR;
  AXI_05_ARBURST_in <= AXI_05_ARBURST;
  AXI_05_ARESET_N_in <= AXI_05_ARESET_N;
  AXI_05_ARID_in <= AXI_05_ARID;
  AXI_05_ARLEN_in <= AXI_05_ARLEN;
  AXI_05_ARSIZE_in <= AXI_05_ARSIZE;
  AXI_05_ARVALID_in <= AXI_05_ARVALID;
  AXI_05_AWADDR_in <= AXI_05_AWADDR;
  AXI_05_AWBURST_in <= AXI_05_AWBURST;
  AXI_05_AWID_in <= AXI_05_AWID;
  AXI_05_AWLEN_in <= AXI_05_AWLEN;
  AXI_05_AWSIZE_in <= AXI_05_AWSIZE;
  AXI_05_AWVALID_in <= AXI_05_AWVALID;
  AXI_05_BREADY_in <= AXI_05_BREADY;
  AXI_05_DFI_LP_PWR_X_REQ_in <= AXI_05_DFI_LP_PWR_X_REQ;
  AXI_05_RREADY_in <= AXI_05_RREADY;
  AXI_05_WDATA_PARITY_in <= AXI_05_WDATA_PARITY;
  AXI_05_WDATA_in <= AXI_05_WDATA;
  AXI_05_WLAST_in <= AXI_05_WLAST;
  AXI_05_WSTRB_in <= AXI_05_WSTRB;
  AXI_05_WVALID_in <= AXI_05_WVALID;
  AXI_06_ACLK_in <= AXI_06_ACLK;
  AXI_06_ARADDR_in <= AXI_06_ARADDR;
  AXI_06_ARBURST_in <= AXI_06_ARBURST;
  AXI_06_ARESET_N_in <= AXI_06_ARESET_N;
  AXI_06_ARID_in <= AXI_06_ARID;
  AXI_06_ARLEN_in <= AXI_06_ARLEN;
  AXI_06_ARSIZE_in <= AXI_06_ARSIZE;
  AXI_06_ARVALID_in <= AXI_06_ARVALID;
  AXI_06_AWADDR_in <= AXI_06_AWADDR;
  AXI_06_AWBURST_in <= AXI_06_AWBURST;
  AXI_06_AWID_in <= AXI_06_AWID;
  AXI_06_AWLEN_in <= AXI_06_AWLEN;
  AXI_06_AWSIZE_in <= AXI_06_AWSIZE;
  AXI_06_AWVALID_in <= AXI_06_AWVALID;
  AXI_06_BREADY_in <= AXI_06_BREADY;
  AXI_06_DFI_LP_PWR_X_REQ_in <= AXI_06_DFI_LP_PWR_X_REQ;
  AXI_06_RREADY_in <= AXI_06_RREADY;
  AXI_06_WDATA_PARITY_in <= AXI_06_WDATA_PARITY;
  AXI_06_WDATA_in <= AXI_06_WDATA;
  AXI_06_WLAST_in <= AXI_06_WLAST;
  AXI_06_WSTRB_in <= AXI_06_WSTRB;
  AXI_06_WVALID_in <= AXI_06_WVALID;
  AXI_07_ACLK_in <= AXI_07_ACLK;
  AXI_07_ARADDR_in <= AXI_07_ARADDR;
  AXI_07_ARBURST_in <= AXI_07_ARBURST;
  AXI_07_ARESET_N_in <= AXI_07_ARESET_N;
  AXI_07_ARID_in <= AXI_07_ARID;
  AXI_07_ARLEN_in <= AXI_07_ARLEN;
  AXI_07_ARSIZE_in <= AXI_07_ARSIZE;
  AXI_07_ARVALID_in <= AXI_07_ARVALID;
  AXI_07_AWADDR_in <= AXI_07_AWADDR;
  AXI_07_AWBURST_in <= AXI_07_AWBURST;
  AXI_07_AWID_in <= AXI_07_AWID;
  AXI_07_AWLEN_in <= AXI_07_AWLEN;
  AXI_07_AWSIZE_in <= AXI_07_AWSIZE;
  AXI_07_AWVALID_in <= AXI_07_AWVALID;
  AXI_07_BREADY_in <= AXI_07_BREADY;
  AXI_07_DFI_LP_PWR_X_REQ_in <= AXI_07_DFI_LP_PWR_X_REQ;
  AXI_07_RREADY_in <= AXI_07_RREADY;
  AXI_07_WDATA_PARITY_in <= AXI_07_WDATA_PARITY;
  AXI_07_WDATA_in <= AXI_07_WDATA;
  AXI_07_WLAST_in <= AXI_07_WLAST;
  AXI_07_WSTRB_in <= AXI_07_WSTRB;
  AXI_07_WVALID_in <= AXI_07_WVALID;
  AXI_08_ACLK_in <= AXI_08_ACLK;
  AXI_08_ARADDR_in <= AXI_08_ARADDR;
  AXI_08_ARBURST_in <= AXI_08_ARBURST;
  AXI_08_ARESET_N_in <= AXI_08_ARESET_N;
  AXI_08_ARID_in <= AXI_08_ARID;
  AXI_08_ARLEN_in <= AXI_08_ARLEN;
  AXI_08_ARSIZE_in <= AXI_08_ARSIZE;
  AXI_08_ARVALID_in <= AXI_08_ARVALID;
  AXI_08_AWADDR_in <= AXI_08_AWADDR;
  AXI_08_AWBURST_in <= AXI_08_AWBURST;
  AXI_08_AWID_in <= AXI_08_AWID;
  AXI_08_AWLEN_in <= AXI_08_AWLEN;
  AXI_08_AWSIZE_in <= AXI_08_AWSIZE;
  AXI_08_AWVALID_in <= AXI_08_AWVALID;
  AXI_08_BREADY_in <= AXI_08_BREADY;
  AXI_08_DFI_LP_PWR_X_REQ_in <= AXI_08_DFI_LP_PWR_X_REQ;
  AXI_08_RREADY_in <= AXI_08_RREADY;
  AXI_08_WDATA_PARITY_in <= AXI_08_WDATA_PARITY;
  AXI_08_WDATA_in <= AXI_08_WDATA;
  AXI_08_WLAST_in <= AXI_08_WLAST;
  AXI_08_WSTRB_in <= AXI_08_WSTRB;
  AXI_08_WVALID_in <= AXI_08_WVALID;
  AXI_09_ACLK_in <= AXI_09_ACLK;
  AXI_09_ARADDR_in <= AXI_09_ARADDR;
  AXI_09_ARBURST_in <= AXI_09_ARBURST;
  AXI_09_ARESET_N_in <= AXI_09_ARESET_N;
  AXI_09_ARID_in <= AXI_09_ARID;
  AXI_09_ARLEN_in <= AXI_09_ARLEN;
  AXI_09_ARSIZE_in <= AXI_09_ARSIZE;
  AXI_09_ARVALID_in <= AXI_09_ARVALID;
  AXI_09_AWADDR_in <= AXI_09_AWADDR;
  AXI_09_AWBURST_in <= AXI_09_AWBURST;
  AXI_09_AWID_in <= AXI_09_AWID;
  AXI_09_AWLEN_in <= AXI_09_AWLEN;
  AXI_09_AWSIZE_in <= AXI_09_AWSIZE;
  AXI_09_AWVALID_in <= AXI_09_AWVALID;
  AXI_09_BREADY_in <= AXI_09_BREADY;
  AXI_09_DFI_LP_PWR_X_REQ_in <= AXI_09_DFI_LP_PWR_X_REQ;
  AXI_09_RREADY_in <= AXI_09_RREADY;
  AXI_09_WDATA_PARITY_in <= AXI_09_WDATA_PARITY;
  AXI_09_WDATA_in <= AXI_09_WDATA;
  AXI_09_WLAST_in <= AXI_09_WLAST;
  AXI_09_WSTRB_in <= AXI_09_WSTRB;
  AXI_09_WVALID_in <= AXI_09_WVALID;
  AXI_10_ACLK_in <= AXI_10_ACLK;
  AXI_10_ARADDR_in <= AXI_10_ARADDR;
  AXI_10_ARBURST_in <= AXI_10_ARBURST;
  AXI_10_ARESET_N_in <= AXI_10_ARESET_N;
  AXI_10_ARID_in <= AXI_10_ARID;
  AXI_10_ARLEN_in <= AXI_10_ARLEN;
  AXI_10_ARSIZE_in <= AXI_10_ARSIZE;
  AXI_10_ARVALID_in <= AXI_10_ARVALID;
  AXI_10_AWADDR_in <= AXI_10_AWADDR;
  AXI_10_AWBURST_in <= AXI_10_AWBURST;
  AXI_10_AWID_in <= AXI_10_AWID;
  AXI_10_AWLEN_in <= AXI_10_AWLEN;
  AXI_10_AWSIZE_in <= AXI_10_AWSIZE;
  AXI_10_AWVALID_in <= AXI_10_AWVALID;
  AXI_10_BREADY_in <= AXI_10_BREADY;
  AXI_10_DFI_LP_PWR_X_REQ_in <= AXI_10_DFI_LP_PWR_X_REQ;
  AXI_10_RREADY_in <= AXI_10_RREADY;
  AXI_10_WDATA_PARITY_in <= AXI_10_WDATA_PARITY;
  AXI_10_WDATA_in <= AXI_10_WDATA;
  AXI_10_WLAST_in <= AXI_10_WLAST;
  AXI_10_WSTRB_in <= AXI_10_WSTRB;
  AXI_10_WVALID_in <= AXI_10_WVALID;
  AXI_11_ACLK_in <= AXI_11_ACLK;
  AXI_11_ARADDR_in <= AXI_11_ARADDR;
  AXI_11_ARBURST_in <= AXI_11_ARBURST;
  AXI_11_ARESET_N_in <= AXI_11_ARESET_N;
  AXI_11_ARID_in <= AXI_11_ARID;
  AXI_11_ARLEN_in <= AXI_11_ARLEN;
  AXI_11_ARSIZE_in <= AXI_11_ARSIZE;
  AXI_11_ARVALID_in <= AXI_11_ARVALID;
  AXI_11_AWADDR_in <= AXI_11_AWADDR;
  AXI_11_AWBURST_in <= AXI_11_AWBURST;
  AXI_11_AWID_in <= AXI_11_AWID;
  AXI_11_AWLEN_in <= AXI_11_AWLEN;
  AXI_11_AWSIZE_in <= AXI_11_AWSIZE;
  AXI_11_AWVALID_in <= AXI_11_AWVALID;
  AXI_11_BREADY_in <= AXI_11_BREADY;
  AXI_11_DFI_LP_PWR_X_REQ_in <= AXI_11_DFI_LP_PWR_X_REQ;
  AXI_11_RREADY_in <= AXI_11_RREADY;
  AXI_11_WDATA_PARITY_in <= AXI_11_WDATA_PARITY;
  AXI_11_WDATA_in <= AXI_11_WDATA;
  AXI_11_WLAST_in <= AXI_11_WLAST;
  AXI_11_WSTRB_in <= AXI_11_WSTRB;
  AXI_11_WVALID_in <= AXI_11_WVALID;
  AXI_12_ACLK_in <= AXI_12_ACLK;
  AXI_12_ARADDR_in <= AXI_12_ARADDR;
  AXI_12_ARBURST_in <= AXI_12_ARBURST;
  AXI_12_ARESET_N_in <= AXI_12_ARESET_N;
  AXI_12_ARID_in <= AXI_12_ARID;
  AXI_12_ARLEN_in <= AXI_12_ARLEN;
  AXI_12_ARSIZE_in <= AXI_12_ARSIZE;
  AXI_12_ARVALID_in <= AXI_12_ARVALID;
  AXI_12_AWADDR_in <= AXI_12_AWADDR;
  AXI_12_AWBURST_in <= AXI_12_AWBURST;
  AXI_12_AWID_in <= AXI_12_AWID;
  AXI_12_AWLEN_in <= AXI_12_AWLEN;
  AXI_12_AWSIZE_in <= AXI_12_AWSIZE;
  AXI_12_AWVALID_in <= AXI_12_AWVALID;
  AXI_12_BREADY_in <= AXI_12_BREADY;
  AXI_12_DFI_LP_PWR_X_REQ_in <= AXI_12_DFI_LP_PWR_X_REQ;
  AXI_12_RREADY_in <= AXI_12_RREADY;
  AXI_12_WDATA_PARITY_in <= AXI_12_WDATA_PARITY;
  AXI_12_WDATA_in <= AXI_12_WDATA;
  AXI_12_WLAST_in <= AXI_12_WLAST;
  AXI_12_WSTRB_in <= AXI_12_WSTRB;
  AXI_12_WVALID_in <= AXI_12_WVALID;
  AXI_13_ACLK_in <= AXI_13_ACLK;
  AXI_13_ARADDR_in <= AXI_13_ARADDR;
  AXI_13_ARBURST_in <= AXI_13_ARBURST;
  AXI_13_ARESET_N_in <= AXI_13_ARESET_N;
  AXI_13_ARID_in <= AXI_13_ARID;
  AXI_13_ARLEN_in <= AXI_13_ARLEN;
  AXI_13_ARSIZE_in <= AXI_13_ARSIZE;
  AXI_13_ARVALID_in <= AXI_13_ARVALID;
  AXI_13_AWADDR_in <= AXI_13_AWADDR;
  AXI_13_AWBURST_in <= AXI_13_AWBURST;
  AXI_13_AWID_in <= AXI_13_AWID;
  AXI_13_AWLEN_in <= AXI_13_AWLEN;
  AXI_13_AWSIZE_in <= AXI_13_AWSIZE;
  AXI_13_AWVALID_in <= AXI_13_AWVALID;
  AXI_13_BREADY_in <= AXI_13_BREADY;
  AXI_13_DFI_LP_PWR_X_REQ_in <= AXI_13_DFI_LP_PWR_X_REQ;
  AXI_13_RREADY_in <= AXI_13_RREADY;
  AXI_13_WDATA_PARITY_in <= AXI_13_WDATA_PARITY;
  AXI_13_WDATA_in <= AXI_13_WDATA;
  AXI_13_WLAST_in <= AXI_13_WLAST;
  AXI_13_WSTRB_in <= AXI_13_WSTRB;
  AXI_13_WVALID_in <= AXI_13_WVALID;
  AXI_14_ACLK_in <= AXI_14_ACLK;
  AXI_14_ARADDR_in <= AXI_14_ARADDR;
  AXI_14_ARBURST_in <= AXI_14_ARBURST;
  AXI_14_ARESET_N_in <= AXI_14_ARESET_N;
  AXI_14_ARID_in <= AXI_14_ARID;
  AXI_14_ARLEN_in <= AXI_14_ARLEN;
  AXI_14_ARSIZE_in <= AXI_14_ARSIZE;
  AXI_14_ARVALID_in <= AXI_14_ARVALID;
  AXI_14_AWADDR_in <= AXI_14_AWADDR;
  AXI_14_AWBURST_in <= AXI_14_AWBURST;
  AXI_14_AWID_in <= AXI_14_AWID;
  AXI_14_AWLEN_in <= AXI_14_AWLEN;
  AXI_14_AWSIZE_in <= AXI_14_AWSIZE;
  AXI_14_AWVALID_in <= AXI_14_AWVALID;
  AXI_14_BREADY_in <= AXI_14_BREADY;
  AXI_14_DFI_LP_PWR_X_REQ_in <= AXI_14_DFI_LP_PWR_X_REQ;
  AXI_14_RREADY_in <= AXI_14_RREADY;
  AXI_14_WDATA_PARITY_in <= AXI_14_WDATA_PARITY;
  AXI_14_WDATA_in <= AXI_14_WDATA;
  AXI_14_WLAST_in <= AXI_14_WLAST;
  AXI_14_WSTRB_in <= AXI_14_WSTRB;
  AXI_14_WVALID_in <= AXI_14_WVALID;
  AXI_15_ACLK_in <= AXI_15_ACLK;
  AXI_15_ARADDR_in <= AXI_15_ARADDR;
  AXI_15_ARBURST_in <= AXI_15_ARBURST;
  AXI_15_ARESET_N_in <= AXI_15_ARESET_N;
  AXI_15_ARID_in <= AXI_15_ARID;
  AXI_15_ARLEN_in <= AXI_15_ARLEN;
  AXI_15_ARSIZE_in <= AXI_15_ARSIZE;
  AXI_15_ARVALID_in <= AXI_15_ARVALID;
  AXI_15_AWADDR_in <= AXI_15_AWADDR;
  AXI_15_AWBURST_in <= AXI_15_AWBURST;
  AXI_15_AWID_in <= AXI_15_AWID;
  AXI_15_AWLEN_in <= AXI_15_AWLEN;
  AXI_15_AWSIZE_in <= AXI_15_AWSIZE;
  AXI_15_AWVALID_in <= AXI_15_AWVALID;
  AXI_15_BREADY_in <= AXI_15_BREADY;
  AXI_15_DFI_LP_PWR_X_REQ_in <= AXI_15_DFI_LP_PWR_X_REQ;
  AXI_15_RREADY_in <= AXI_15_RREADY;
  AXI_15_WDATA_PARITY_in <= AXI_15_WDATA_PARITY;
  AXI_15_WDATA_in <= AXI_15_WDATA;
  AXI_15_WLAST_in <= AXI_15_WLAST;
  AXI_15_WSTRB_in <= AXI_15_WSTRB;
  AXI_15_WVALID_in <= AXI_15_WVALID;
  AXI_16_ACLK_in <= AXI_16_ACLK;
  AXI_16_ARADDR_in <= AXI_16_ARADDR;
  AXI_16_ARBURST_in <= AXI_16_ARBURST;
  AXI_16_ARESET_N_in <= AXI_16_ARESET_N;
  AXI_16_ARID_in <= AXI_16_ARID;
  AXI_16_ARLEN_in <= AXI_16_ARLEN;
  AXI_16_ARSIZE_in <= AXI_16_ARSIZE;
  AXI_16_ARVALID_in <= AXI_16_ARVALID;
  AXI_16_AWADDR_in <= AXI_16_AWADDR;
  AXI_16_AWBURST_in <= AXI_16_AWBURST;
  AXI_16_AWID_in <= AXI_16_AWID;
  AXI_16_AWLEN_in <= AXI_16_AWLEN;
  AXI_16_AWSIZE_in <= AXI_16_AWSIZE;
  AXI_16_AWVALID_in <= AXI_16_AWVALID;
  AXI_16_BREADY_in <= AXI_16_BREADY;
  AXI_16_DFI_LP_PWR_X_REQ_in <= AXI_16_DFI_LP_PWR_X_REQ;
  AXI_16_RREADY_in <= AXI_16_RREADY;
  AXI_16_WDATA_PARITY_in <= AXI_16_WDATA_PARITY;
  AXI_16_WDATA_in <= AXI_16_WDATA;
  AXI_16_WLAST_in <= AXI_16_WLAST;
  AXI_16_WSTRB_in <= AXI_16_WSTRB;
  AXI_16_WVALID_in <= AXI_16_WVALID;
  AXI_17_ACLK_in <= AXI_17_ACLK;
  AXI_17_ARADDR_in <= AXI_17_ARADDR;
  AXI_17_ARBURST_in <= AXI_17_ARBURST;
  AXI_17_ARESET_N_in <= AXI_17_ARESET_N;
  AXI_17_ARID_in <= AXI_17_ARID;
  AXI_17_ARLEN_in <= AXI_17_ARLEN;
  AXI_17_ARSIZE_in <= AXI_17_ARSIZE;
  AXI_17_ARVALID_in <= AXI_17_ARVALID;
  AXI_17_AWADDR_in <= AXI_17_AWADDR;
  AXI_17_AWBURST_in <= AXI_17_AWBURST;
  AXI_17_AWID_in <= AXI_17_AWID;
  AXI_17_AWLEN_in <= AXI_17_AWLEN;
  AXI_17_AWSIZE_in <= AXI_17_AWSIZE;
  AXI_17_AWVALID_in <= AXI_17_AWVALID;
  AXI_17_BREADY_in <= AXI_17_BREADY;
  AXI_17_DFI_LP_PWR_X_REQ_in <= AXI_17_DFI_LP_PWR_X_REQ;
  AXI_17_RREADY_in <= AXI_17_RREADY;
  AXI_17_WDATA_PARITY_in <= AXI_17_WDATA_PARITY;
  AXI_17_WDATA_in <= AXI_17_WDATA;
  AXI_17_WLAST_in <= AXI_17_WLAST;
  AXI_17_WSTRB_in <= AXI_17_WSTRB;
  AXI_17_WVALID_in <= AXI_17_WVALID;
  AXI_18_ACLK_in <= AXI_18_ACLK;
  AXI_18_ARADDR_in <= AXI_18_ARADDR;
  AXI_18_ARBURST_in <= AXI_18_ARBURST;
  AXI_18_ARESET_N_in <= AXI_18_ARESET_N;
  AXI_18_ARID_in <= AXI_18_ARID;
  AXI_18_ARLEN_in <= AXI_18_ARLEN;
  AXI_18_ARSIZE_in <= AXI_18_ARSIZE;
  AXI_18_ARVALID_in <= AXI_18_ARVALID;
  AXI_18_AWADDR_in <= AXI_18_AWADDR;
  AXI_18_AWBURST_in <= AXI_18_AWBURST;
  AXI_18_AWID_in <= AXI_18_AWID;
  AXI_18_AWLEN_in <= AXI_18_AWLEN;
  AXI_18_AWSIZE_in <= AXI_18_AWSIZE;
  AXI_18_AWVALID_in <= AXI_18_AWVALID;
  AXI_18_BREADY_in <= AXI_18_BREADY;
  AXI_18_DFI_LP_PWR_X_REQ_in <= AXI_18_DFI_LP_PWR_X_REQ;
  AXI_18_RREADY_in <= AXI_18_RREADY;
  AXI_18_WDATA_PARITY_in <= AXI_18_WDATA_PARITY;
  AXI_18_WDATA_in <= AXI_18_WDATA;
  AXI_18_WLAST_in <= AXI_18_WLAST;
  AXI_18_WSTRB_in <= AXI_18_WSTRB;
  AXI_18_WVALID_in <= AXI_18_WVALID;
  AXI_19_ACLK_in <= AXI_19_ACLK;
  AXI_19_ARADDR_in <= AXI_19_ARADDR;
  AXI_19_ARBURST_in <= AXI_19_ARBURST;
  AXI_19_ARESET_N_in <= AXI_19_ARESET_N;
  AXI_19_ARID_in <= AXI_19_ARID;
  AXI_19_ARLEN_in <= AXI_19_ARLEN;
  AXI_19_ARSIZE_in <= AXI_19_ARSIZE;
  AXI_19_ARVALID_in <= AXI_19_ARVALID;
  AXI_19_AWADDR_in <= AXI_19_AWADDR;
  AXI_19_AWBURST_in <= AXI_19_AWBURST;
  AXI_19_AWID_in <= AXI_19_AWID;
  AXI_19_AWLEN_in <= AXI_19_AWLEN;
  AXI_19_AWSIZE_in <= AXI_19_AWSIZE;
  AXI_19_AWVALID_in <= AXI_19_AWVALID;
  AXI_19_BREADY_in <= AXI_19_BREADY;
  AXI_19_DFI_LP_PWR_X_REQ_in <= AXI_19_DFI_LP_PWR_X_REQ;
  AXI_19_RREADY_in <= AXI_19_RREADY;
  AXI_19_WDATA_PARITY_in <= AXI_19_WDATA_PARITY;
  AXI_19_WDATA_in <= AXI_19_WDATA;
  AXI_19_WLAST_in <= AXI_19_WLAST;
  AXI_19_WSTRB_in <= AXI_19_WSTRB;
  AXI_19_WVALID_in <= AXI_19_WVALID;
  AXI_20_ACLK_in <= AXI_20_ACLK;
  AXI_20_ARADDR_in <= AXI_20_ARADDR;
  AXI_20_ARBURST_in <= AXI_20_ARBURST;
  AXI_20_ARESET_N_in <= AXI_20_ARESET_N;
  AXI_20_ARID_in <= AXI_20_ARID;
  AXI_20_ARLEN_in <= AXI_20_ARLEN;
  AXI_20_ARSIZE_in <= AXI_20_ARSIZE;
  AXI_20_ARVALID_in <= AXI_20_ARVALID;
  AXI_20_AWADDR_in <= AXI_20_AWADDR;
  AXI_20_AWBURST_in <= AXI_20_AWBURST;
  AXI_20_AWID_in <= AXI_20_AWID;
  AXI_20_AWLEN_in <= AXI_20_AWLEN;
  AXI_20_AWSIZE_in <= AXI_20_AWSIZE;
  AXI_20_AWVALID_in <= AXI_20_AWVALID;
  AXI_20_BREADY_in <= AXI_20_BREADY;
  AXI_20_DFI_LP_PWR_X_REQ_in <= AXI_20_DFI_LP_PWR_X_REQ;
  AXI_20_RREADY_in <= AXI_20_RREADY;
  AXI_20_WDATA_PARITY_in <= AXI_20_WDATA_PARITY;
  AXI_20_WDATA_in <= AXI_20_WDATA;
  AXI_20_WLAST_in <= AXI_20_WLAST;
  AXI_20_WSTRB_in <= AXI_20_WSTRB;
  AXI_20_WVALID_in <= AXI_20_WVALID;
  AXI_21_ACLK_in <= AXI_21_ACLK;
  AXI_21_ARADDR_in <= AXI_21_ARADDR;
  AXI_21_ARBURST_in <= AXI_21_ARBURST;
  AXI_21_ARESET_N_in <= AXI_21_ARESET_N;
  AXI_21_ARID_in <= AXI_21_ARID;
  AXI_21_ARLEN_in <= AXI_21_ARLEN;
  AXI_21_ARSIZE_in <= AXI_21_ARSIZE;
  AXI_21_ARVALID_in <= AXI_21_ARVALID;
  AXI_21_AWADDR_in <= AXI_21_AWADDR;
  AXI_21_AWBURST_in <= AXI_21_AWBURST;
  AXI_21_AWID_in <= AXI_21_AWID;
  AXI_21_AWLEN_in <= AXI_21_AWLEN;
  AXI_21_AWSIZE_in <= AXI_21_AWSIZE;
  AXI_21_AWVALID_in <= AXI_21_AWVALID;
  AXI_21_BREADY_in <= AXI_21_BREADY;
  AXI_21_DFI_LP_PWR_X_REQ_in <= AXI_21_DFI_LP_PWR_X_REQ;
  AXI_21_RREADY_in <= AXI_21_RREADY;
  AXI_21_WDATA_PARITY_in <= AXI_21_WDATA_PARITY;
  AXI_21_WDATA_in <= AXI_21_WDATA;
  AXI_21_WLAST_in <= AXI_21_WLAST;
  AXI_21_WSTRB_in <= AXI_21_WSTRB;
  AXI_21_WVALID_in <= AXI_21_WVALID;
  AXI_22_ACLK_in <= AXI_22_ACLK;
  AXI_22_ARADDR_in <= AXI_22_ARADDR;
  AXI_22_ARBURST_in <= AXI_22_ARBURST;
  AXI_22_ARESET_N_in <= AXI_22_ARESET_N;
  AXI_22_ARID_in <= AXI_22_ARID;
  AXI_22_ARLEN_in <= AXI_22_ARLEN;
  AXI_22_ARSIZE_in <= AXI_22_ARSIZE;
  AXI_22_ARVALID_in <= AXI_22_ARVALID;
  AXI_22_AWADDR_in <= AXI_22_AWADDR;
  AXI_22_AWBURST_in <= AXI_22_AWBURST;
  AXI_22_AWID_in <= AXI_22_AWID;
  AXI_22_AWLEN_in <= AXI_22_AWLEN;
  AXI_22_AWSIZE_in <= AXI_22_AWSIZE;
  AXI_22_AWVALID_in <= AXI_22_AWVALID;
  AXI_22_BREADY_in <= AXI_22_BREADY;
  AXI_22_DFI_LP_PWR_X_REQ_in <= AXI_22_DFI_LP_PWR_X_REQ;
  AXI_22_RREADY_in <= AXI_22_RREADY;
  AXI_22_WDATA_PARITY_in <= AXI_22_WDATA_PARITY;
  AXI_22_WDATA_in <= AXI_22_WDATA;
  AXI_22_WLAST_in <= AXI_22_WLAST;
  AXI_22_WSTRB_in <= AXI_22_WSTRB;
  AXI_22_WVALID_in <= AXI_22_WVALID;
  AXI_23_ACLK_in <= AXI_23_ACLK;
  AXI_23_ARADDR_in <= AXI_23_ARADDR;
  AXI_23_ARBURST_in <= AXI_23_ARBURST;
  AXI_23_ARESET_N_in <= AXI_23_ARESET_N;
  AXI_23_ARID_in <= AXI_23_ARID;
  AXI_23_ARLEN_in <= AXI_23_ARLEN;
  AXI_23_ARSIZE_in <= AXI_23_ARSIZE;
  AXI_23_ARVALID_in <= AXI_23_ARVALID;
  AXI_23_AWADDR_in <= AXI_23_AWADDR;
  AXI_23_AWBURST_in <= AXI_23_AWBURST;
  AXI_23_AWID_in <= AXI_23_AWID;
  AXI_23_AWLEN_in <= AXI_23_AWLEN;
  AXI_23_AWSIZE_in <= AXI_23_AWSIZE;
  AXI_23_AWVALID_in <= AXI_23_AWVALID;
  AXI_23_BREADY_in <= AXI_23_BREADY;
  AXI_23_DFI_LP_PWR_X_REQ_in <= AXI_23_DFI_LP_PWR_X_REQ;
  AXI_23_RREADY_in <= AXI_23_RREADY;
  AXI_23_WDATA_PARITY_in <= AXI_23_WDATA_PARITY;
  AXI_23_WDATA_in <= AXI_23_WDATA;
  AXI_23_WLAST_in <= AXI_23_WLAST;
  AXI_23_WSTRB_in <= AXI_23_WSTRB;
  AXI_23_WVALID_in <= AXI_23_WVALID;
  AXI_24_ACLK_in <= AXI_24_ACLK;
  AXI_24_ARADDR_in <= AXI_24_ARADDR;
  AXI_24_ARBURST_in <= AXI_24_ARBURST;
  AXI_24_ARESET_N_in <= AXI_24_ARESET_N;
  AXI_24_ARID_in <= AXI_24_ARID;
  AXI_24_ARLEN_in <= AXI_24_ARLEN;
  AXI_24_ARSIZE_in <= AXI_24_ARSIZE;
  AXI_24_ARVALID_in <= AXI_24_ARVALID;
  AXI_24_AWADDR_in <= AXI_24_AWADDR;
  AXI_24_AWBURST_in <= AXI_24_AWBURST;
  AXI_24_AWID_in <= AXI_24_AWID;
  AXI_24_AWLEN_in <= AXI_24_AWLEN;
  AXI_24_AWSIZE_in <= AXI_24_AWSIZE;
  AXI_24_AWVALID_in <= AXI_24_AWVALID;
  AXI_24_BREADY_in <= AXI_24_BREADY;
  AXI_24_DFI_LP_PWR_X_REQ_in <= AXI_24_DFI_LP_PWR_X_REQ;
  AXI_24_RREADY_in <= AXI_24_RREADY;
  AXI_24_WDATA_PARITY_in <= AXI_24_WDATA_PARITY;
  AXI_24_WDATA_in <= AXI_24_WDATA;
  AXI_24_WLAST_in <= AXI_24_WLAST;
  AXI_24_WSTRB_in <= AXI_24_WSTRB;
  AXI_24_WVALID_in <= AXI_24_WVALID;
  AXI_25_ACLK_in <= AXI_25_ACLK;
  AXI_25_ARADDR_in <= AXI_25_ARADDR;
  AXI_25_ARBURST_in <= AXI_25_ARBURST;
  AXI_25_ARESET_N_in <= AXI_25_ARESET_N;
  AXI_25_ARID_in <= AXI_25_ARID;
  AXI_25_ARLEN_in <= AXI_25_ARLEN;
  AXI_25_ARSIZE_in <= AXI_25_ARSIZE;
  AXI_25_ARVALID_in <= AXI_25_ARVALID;
  AXI_25_AWADDR_in <= AXI_25_AWADDR;
  AXI_25_AWBURST_in <= AXI_25_AWBURST;
  AXI_25_AWID_in <= AXI_25_AWID;
  AXI_25_AWLEN_in <= AXI_25_AWLEN;
  AXI_25_AWSIZE_in <= AXI_25_AWSIZE;
  AXI_25_AWVALID_in <= AXI_25_AWVALID;
  AXI_25_BREADY_in <= AXI_25_BREADY;
  AXI_25_DFI_LP_PWR_X_REQ_in <= AXI_25_DFI_LP_PWR_X_REQ;
  AXI_25_RREADY_in <= AXI_25_RREADY;
  AXI_25_WDATA_PARITY_in <= AXI_25_WDATA_PARITY;
  AXI_25_WDATA_in <= AXI_25_WDATA;
  AXI_25_WLAST_in <= AXI_25_WLAST;
  AXI_25_WSTRB_in <= AXI_25_WSTRB;
  AXI_25_WVALID_in <= AXI_25_WVALID;
  AXI_26_ACLK_in <= AXI_26_ACLK;
  AXI_26_ARADDR_in <= AXI_26_ARADDR;
  AXI_26_ARBURST_in <= AXI_26_ARBURST;
  AXI_26_ARESET_N_in <= AXI_26_ARESET_N;
  AXI_26_ARID_in <= AXI_26_ARID;
  AXI_26_ARLEN_in <= AXI_26_ARLEN;
  AXI_26_ARSIZE_in <= AXI_26_ARSIZE;
  AXI_26_ARVALID_in <= AXI_26_ARVALID;
  AXI_26_AWADDR_in <= AXI_26_AWADDR;
  AXI_26_AWBURST_in <= AXI_26_AWBURST;
  AXI_26_AWID_in <= AXI_26_AWID;
  AXI_26_AWLEN_in <= AXI_26_AWLEN;
  AXI_26_AWSIZE_in <= AXI_26_AWSIZE;
  AXI_26_AWVALID_in <= AXI_26_AWVALID;
  AXI_26_BREADY_in <= AXI_26_BREADY;
  AXI_26_DFI_LP_PWR_X_REQ_in <= AXI_26_DFI_LP_PWR_X_REQ;
  AXI_26_RREADY_in <= AXI_26_RREADY;
  AXI_26_WDATA_PARITY_in <= AXI_26_WDATA_PARITY;
  AXI_26_WDATA_in <= AXI_26_WDATA;
  AXI_26_WLAST_in <= AXI_26_WLAST;
  AXI_26_WSTRB_in <= AXI_26_WSTRB;
  AXI_26_WVALID_in <= AXI_26_WVALID;
  AXI_27_ACLK_in <= AXI_27_ACLK;
  AXI_27_ARADDR_in <= AXI_27_ARADDR;
  AXI_27_ARBURST_in <= AXI_27_ARBURST;
  AXI_27_ARESET_N_in <= AXI_27_ARESET_N;
  AXI_27_ARID_in <= AXI_27_ARID;
  AXI_27_ARLEN_in <= AXI_27_ARLEN;
  AXI_27_ARSIZE_in <= AXI_27_ARSIZE;
  AXI_27_ARVALID_in <= AXI_27_ARVALID;
  AXI_27_AWADDR_in <= AXI_27_AWADDR;
  AXI_27_AWBURST_in <= AXI_27_AWBURST;
  AXI_27_AWID_in <= AXI_27_AWID;
  AXI_27_AWLEN_in <= AXI_27_AWLEN;
  AXI_27_AWSIZE_in <= AXI_27_AWSIZE;
  AXI_27_AWVALID_in <= AXI_27_AWVALID;
  AXI_27_BREADY_in <= AXI_27_BREADY;
  AXI_27_DFI_LP_PWR_X_REQ_in <= AXI_27_DFI_LP_PWR_X_REQ;
  AXI_27_RREADY_in <= AXI_27_RREADY;
  AXI_27_WDATA_PARITY_in <= AXI_27_WDATA_PARITY;
  AXI_27_WDATA_in <= AXI_27_WDATA;
  AXI_27_WLAST_in <= AXI_27_WLAST;
  AXI_27_WSTRB_in <= AXI_27_WSTRB;
  AXI_27_WVALID_in <= AXI_27_WVALID;
  AXI_28_ACLK_in <= AXI_28_ACLK;
  AXI_28_ARADDR_in <= AXI_28_ARADDR;
  AXI_28_ARBURST_in <= AXI_28_ARBURST;
  AXI_28_ARESET_N_in <= AXI_28_ARESET_N;
  AXI_28_ARID_in <= AXI_28_ARID;
  AXI_28_ARLEN_in <= AXI_28_ARLEN;
  AXI_28_ARSIZE_in <= AXI_28_ARSIZE;
  AXI_28_ARVALID_in <= AXI_28_ARVALID;
  AXI_28_AWADDR_in <= AXI_28_AWADDR;
  AXI_28_AWBURST_in <= AXI_28_AWBURST;
  AXI_28_AWID_in <= AXI_28_AWID;
  AXI_28_AWLEN_in <= AXI_28_AWLEN;
  AXI_28_AWSIZE_in <= AXI_28_AWSIZE;
  AXI_28_AWVALID_in <= AXI_28_AWVALID;
  AXI_28_BREADY_in <= AXI_28_BREADY;
  AXI_28_DFI_LP_PWR_X_REQ_in <= AXI_28_DFI_LP_PWR_X_REQ;
  AXI_28_RREADY_in <= AXI_28_RREADY;
  AXI_28_WDATA_PARITY_in <= AXI_28_WDATA_PARITY;
  AXI_28_WDATA_in <= AXI_28_WDATA;
  AXI_28_WLAST_in <= AXI_28_WLAST;
  AXI_28_WSTRB_in <= AXI_28_WSTRB;
  AXI_28_WVALID_in <= AXI_28_WVALID;
  AXI_29_ACLK_in <= AXI_29_ACLK;
  AXI_29_ARADDR_in <= AXI_29_ARADDR;
  AXI_29_ARBURST_in <= AXI_29_ARBURST;
  AXI_29_ARESET_N_in <= AXI_29_ARESET_N;
  AXI_29_ARID_in <= AXI_29_ARID;
  AXI_29_ARLEN_in <= AXI_29_ARLEN;
  AXI_29_ARSIZE_in <= AXI_29_ARSIZE;
  AXI_29_ARVALID_in <= AXI_29_ARVALID;
  AXI_29_AWADDR_in <= AXI_29_AWADDR;
  AXI_29_AWBURST_in <= AXI_29_AWBURST;
  AXI_29_AWID_in <= AXI_29_AWID;
  AXI_29_AWLEN_in <= AXI_29_AWLEN;
  AXI_29_AWSIZE_in <= AXI_29_AWSIZE;
  AXI_29_AWVALID_in <= AXI_29_AWVALID;
  AXI_29_BREADY_in <= AXI_29_BREADY;
  AXI_29_DFI_LP_PWR_X_REQ_in <= AXI_29_DFI_LP_PWR_X_REQ;
  AXI_29_RREADY_in <= AXI_29_RREADY;
  AXI_29_WDATA_PARITY_in <= AXI_29_WDATA_PARITY;
  AXI_29_WDATA_in <= AXI_29_WDATA;
  AXI_29_WLAST_in <= AXI_29_WLAST;
  AXI_29_WSTRB_in <= AXI_29_WSTRB;
  AXI_29_WVALID_in <= AXI_29_WVALID;
  AXI_30_ACLK_in <= AXI_30_ACLK;
  AXI_30_ARADDR_in <= AXI_30_ARADDR;
  AXI_30_ARBURST_in <= AXI_30_ARBURST;
  AXI_30_ARESET_N_in <= AXI_30_ARESET_N;
  AXI_30_ARID_in <= AXI_30_ARID;
  AXI_30_ARLEN_in <= AXI_30_ARLEN;
  AXI_30_ARSIZE_in <= AXI_30_ARSIZE;
  AXI_30_ARVALID_in <= AXI_30_ARVALID;
  AXI_30_AWADDR_in <= AXI_30_AWADDR;
  AXI_30_AWBURST_in <= AXI_30_AWBURST;
  AXI_30_AWID_in <= AXI_30_AWID;
  AXI_30_AWLEN_in <= AXI_30_AWLEN;
  AXI_30_AWSIZE_in <= AXI_30_AWSIZE;
  AXI_30_AWVALID_in <= AXI_30_AWVALID;
  AXI_30_BREADY_in <= AXI_30_BREADY;
  AXI_30_DFI_LP_PWR_X_REQ_in <= AXI_30_DFI_LP_PWR_X_REQ;
  AXI_30_RREADY_in <= AXI_30_RREADY;
  AXI_30_WDATA_PARITY_in <= AXI_30_WDATA_PARITY;
  AXI_30_WDATA_in <= AXI_30_WDATA;
  AXI_30_WLAST_in <= AXI_30_WLAST;
  AXI_30_WSTRB_in <= AXI_30_WSTRB;
  AXI_30_WVALID_in <= AXI_30_WVALID;
  AXI_31_ACLK_in <= AXI_31_ACLK;
  AXI_31_ARADDR_in <= AXI_31_ARADDR;
  AXI_31_ARBURST_in <= AXI_31_ARBURST;
  AXI_31_ARESET_N_in <= AXI_31_ARESET_N;
  AXI_31_ARID_in <= AXI_31_ARID;
  AXI_31_ARLEN_in <= AXI_31_ARLEN;
  AXI_31_ARSIZE_in <= AXI_31_ARSIZE;
  AXI_31_ARVALID_in <= AXI_31_ARVALID;
  AXI_31_AWADDR_in <= AXI_31_AWADDR;
  AXI_31_AWBURST_in <= AXI_31_AWBURST;
  AXI_31_AWID_in <= AXI_31_AWID;
  AXI_31_AWLEN_in <= AXI_31_AWLEN;
  AXI_31_AWSIZE_in <= AXI_31_AWSIZE;
  AXI_31_AWVALID_in <= AXI_31_AWVALID;
  AXI_31_BREADY_in <= AXI_31_BREADY;
  AXI_31_DFI_LP_PWR_X_REQ_in <= AXI_31_DFI_LP_PWR_X_REQ;
  AXI_31_RREADY_in <= AXI_31_RREADY;
  AXI_31_WDATA_PARITY_in <= AXI_31_WDATA_PARITY;
  AXI_31_WDATA_in <= AXI_31_WDATA;
  AXI_31_WLAST_in <= AXI_31_WLAST;
  AXI_31_WSTRB_in <= AXI_31_WSTRB;
  AXI_31_WVALID_in <= AXI_31_WVALID;
  BSCAN_DRCK_0_in <= BSCAN_DRCK_0;
  BSCAN_DRCK_1_in <= BSCAN_DRCK_1;
  BSCAN_TCK_0_in <= BSCAN_TCK_0;
  BSCAN_TCK_1_in <= BSCAN_TCK_1;
  HBM_REF_CLK_0_in <= HBM_REF_CLK_0;
  HBM_REF_CLK_1_in <= HBM_REF_CLK_1;
  MBIST_EN_00_in <= MBIST_EN_00;
  MBIST_EN_01_in <= MBIST_EN_01;
  MBIST_EN_02_in <= MBIST_EN_02;
  MBIST_EN_03_in <= MBIST_EN_03;
  MBIST_EN_04_in <= MBIST_EN_04;
  MBIST_EN_05_in <= MBIST_EN_05;
  MBIST_EN_06_in <= MBIST_EN_06;
  MBIST_EN_07_in <= MBIST_EN_07;
  MBIST_EN_08_in <= MBIST_EN_08;
  MBIST_EN_09_in <= MBIST_EN_09;
  MBIST_EN_10_in <= MBIST_EN_10;
  MBIST_EN_11_in <= MBIST_EN_11;
  MBIST_EN_12_in <= MBIST_EN_12;
  MBIST_EN_13_in <= MBIST_EN_13;
  MBIST_EN_14_in <= MBIST_EN_14;
  MBIST_EN_15_in <= MBIST_EN_15;
  
  ANALOG_HBM_SEL_00_in <= '1'; -- tie off
  ANALOG_HBM_SEL_01_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_00_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_01_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_02_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_03_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_04_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_05_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_06_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_07_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_08_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_09_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_10_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_11_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_12_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_13_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_14_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_15_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_16_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_17_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_18_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_19_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_20_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_21_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_22_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_23_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_24_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_25_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_26_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_27_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_28_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_29_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_30_in <= '1'; -- tie off
  BLI_SCAN_ENABLE_31_in <= '1'; -- tie off
  BLI_SCAN_IN_00_in <= "11111111"; -- tie off
  BLI_SCAN_IN_01_in <= "11111111"; -- tie off
  BLI_SCAN_IN_02_in <= "11111111"; -- tie off
  BLI_SCAN_IN_03_in <= "11111111"; -- tie off
  BLI_SCAN_IN_04_in <= "11111111"; -- tie off
  BLI_SCAN_IN_05_in <= "11111111"; -- tie off
  BLI_SCAN_IN_06_in <= "11111111"; -- tie off
  BLI_SCAN_IN_07_in <= "11111111"; -- tie off
  BLI_SCAN_IN_08_in <= "11111111"; -- tie off
  BLI_SCAN_IN_09_in <= "11111111"; -- tie off
  BLI_SCAN_IN_10_in <= "11111111"; -- tie off
  BLI_SCAN_IN_11_in <= "11111111"; -- tie off
  BLI_SCAN_IN_12_in <= "11111111"; -- tie off
  BLI_SCAN_IN_13_in <= "11111111"; -- tie off
  BLI_SCAN_IN_14_in <= "11111111"; -- tie off
  BLI_SCAN_IN_15_in <= "11111111"; -- tie off
  BLI_SCAN_IN_16_in <= "11111111"; -- tie off
  BLI_SCAN_IN_17_in <= "11111111"; -- tie off
  BLI_SCAN_IN_18_in <= "11111111"; -- tie off
  BLI_SCAN_IN_19_in <= "11111111"; -- tie off
  BLI_SCAN_IN_20_in <= "11111111"; -- tie off
  BLI_SCAN_IN_21_in <= "11111111"; -- tie off
  BLI_SCAN_IN_22_in <= "11111111"; -- tie off
  BLI_SCAN_IN_23_in <= "11111111"; -- tie off
  BLI_SCAN_IN_24_in <= "11111111"; -- tie off
  BLI_SCAN_IN_25_in <= "11111111"; -- tie off
  BLI_SCAN_IN_26_in <= "11111111"; -- tie off
  BLI_SCAN_IN_27_in <= "11111111"; -- tie off
  BLI_SCAN_IN_28_in <= "11111111"; -- tie off
  BLI_SCAN_IN_29_in <= "11111111"; -- tie off
  BLI_SCAN_IN_30_in <= "11111111"; -- tie off
  BLI_SCAN_IN_31_in <= "11111111"; -- tie off
  DBG_IN_00_in <= "111111111111111111111111"; -- tie off
  DBG_IN_01_in <= "111111111111111111111111"; -- tie off
  DBG_IN_02_in <= "111111111111111111111111"; -- tie off
  DBG_IN_03_in <= "111111111111111111111111"; -- tie off
  DBG_IN_04_in <= "111111111111111111111111"; -- tie off
  DBG_IN_05_in <= "111111111111111111111111"; -- tie off
  DBG_IN_06_in <= "111111111111111111111111"; -- tie off
  DBG_IN_07_in <= "111111111111111111111111"; -- tie off
  DBG_IN_08_in <= "111111111111111111111111"; -- tie off
  DBG_IN_09_in <= "111111111111111111111111"; -- tie off
  DBG_IN_10_in <= "111111111111111111111111"; -- tie off
  DBG_IN_11_in <= "111111111111111111111111"; -- tie off
  DBG_IN_12_in <= "111111111111111111111111"; -- tie off
  DBG_IN_13_in <= "111111111111111111111111"; -- tie off
  DBG_IN_14_in <= "111111111111111111111111"; -- tie off
  DBG_IN_15_in <= "111111111111111111111111"; -- tie off
  DBG_IN_16_in <= "111111111111111111111111"; -- tie off
  DBG_IN_17_in <= "111111111111111111111111"; -- tie off
  DBG_IN_18_in <= "111111111111111111111111"; -- tie off
  DBG_IN_19_in <= "111111111111111111111111"; -- tie off
  DBG_IN_20_in <= "111111111111111111111111"; -- tie off
  DBG_IN_21_in <= "111111111111111111111111"; -- tie off
  DBG_IN_22_in <= "111111111111111111111111"; -- tie off
  DBG_IN_23_in <= "111111111111111111111111"; -- tie off
  DBG_IN_24_in <= "111111111111111111111111"; -- tie off
  DBG_IN_25_in <= "111111111111111111111111"; -- tie off
  DBG_IN_26_in <= "111111111111111111111111"; -- tie off
  DBG_IN_27_in <= "111111111111111111111111"; -- tie off
  DBG_IN_28_in <= "111111111111111111111111"; -- tie off
  DBG_IN_29_in <= "111111111111111111111111"; -- tie off
  DBG_IN_30_in <= "111111111111111111111111"; -- tie off
  DBG_IN_31_in <= "111111111111111111111111"; -- tie off
  DLL_SCAN_CK_00_in <= '1'; -- tie off
  DLL_SCAN_CK_01_in <= '1'; -- tie off
  DLL_SCAN_ENABLE_00_in <= '1'; -- tie off
  DLL_SCAN_ENABLE_01_in <= '1'; -- tie off
  DLL_SCAN_IN_00_in <= "11"; -- tie off
  DLL_SCAN_IN_01_in <= "11"; -- tie off
  DLL_SCAN_MODE_00_in <= '1'; -- tie off
  DLL_SCAN_MODE_01_in <= '1'; -- tie off
  DLL_SCAN_RST_N_00_in <= '1'; -- tie off
  DLL_SCAN_RST_N_01_in <= '1'; -- tie off
  IO_SCAN_CK_00_in <= '1'; -- tie off
  IO_SCAN_CK_01_in <= '1'; -- tie off
  IO_SCAN_ENABLE_00_in <= '1'; -- tie off
  IO_SCAN_ENABLE_01_in <= '1'; -- tie off
  IO_SCAN_IN_00_in <= "11"; -- tie off
  IO_SCAN_IN_01_in <= "11"; -- tie off
  IO_SCAN_MODE_00_in <= '1'; -- tie off
  IO_SCAN_MODE_01_in <= '1'; -- tie off
  IO_SCAN_RST_N_00_in <= '1'; -- tie off
  IO_SCAN_RST_N_01_in <= '1'; -- tie off
  MC_SCAN_CK_00_in <= '1'; -- tie off
  MC_SCAN_CK_01_in <= '1'; -- tie off
  MC_SCAN_CK_02_in <= '1'; -- tie off
  MC_SCAN_CK_03_in <= '1'; -- tie off
  MC_SCAN_CK_04_in <= '1'; -- tie off
  MC_SCAN_CK_05_in <= '1'; -- tie off
  MC_SCAN_CK_06_in <= '1'; -- tie off
  MC_SCAN_CK_07_in <= '1'; -- tie off
  MC_SCAN_CK_08_in <= '1'; -- tie off
  MC_SCAN_CK_09_in <= '1'; -- tie off
  MC_SCAN_CK_10_in <= '1'; -- tie off
  MC_SCAN_CK_11_in <= '1'; -- tie off
  MC_SCAN_CK_12_in <= '1'; -- tie off
  MC_SCAN_CK_13_in <= '1'; -- tie off
  MC_SCAN_CK_14_in <= '1'; -- tie off
  MC_SCAN_CK_15_in <= '1'; -- tie off
  MC_SCAN_ENABLE_00_in <= '1'; -- tie off
  MC_SCAN_ENABLE_01_in <= '1'; -- tie off
  MC_SCAN_ENABLE_02_in <= '1'; -- tie off
  MC_SCAN_ENABLE_03_in <= '1'; -- tie off
  MC_SCAN_ENABLE_04_in <= '1'; -- tie off
  MC_SCAN_ENABLE_05_in <= '1'; -- tie off
  MC_SCAN_ENABLE_06_in <= '1'; -- tie off
  MC_SCAN_ENABLE_07_in <= '1'; -- tie off
  MC_SCAN_ENABLE_08_in <= '1'; -- tie off
  MC_SCAN_ENABLE_09_in <= '1'; -- tie off
  MC_SCAN_ENABLE_10_in <= '1'; -- tie off
  MC_SCAN_ENABLE_11_in <= '1'; -- tie off
  MC_SCAN_ENABLE_12_in <= '1'; -- tie off
  MC_SCAN_ENABLE_13_in <= '1'; -- tie off
  MC_SCAN_ENABLE_14_in <= '1'; -- tie off
  MC_SCAN_ENABLE_15_in <= '1'; -- tie off
  MC_SCAN_IN_00_in <= "11"; -- tie off
  MC_SCAN_IN_01_in <= "11"; -- tie off
  MC_SCAN_IN_02_in <= "11"; -- tie off
  MC_SCAN_IN_03_in <= "11"; -- tie off
  MC_SCAN_IN_04_in <= "11"; -- tie off
  MC_SCAN_IN_05_in <= "11"; -- tie off
  MC_SCAN_IN_06_in <= "11"; -- tie off
  MC_SCAN_IN_07_in <= "11"; -- tie off
  MC_SCAN_IN_08_in <= "11"; -- tie off
  MC_SCAN_IN_09_in <= "11"; -- tie off
  MC_SCAN_IN_10_in <= "11"; -- tie off
  MC_SCAN_IN_11_in <= "11"; -- tie off
  MC_SCAN_IN_12_in <= "11"; -- tie off
  MC_SCAN_IN_13_in <= "11"; -- tie off
  MC_SCAN_IN_14_in <= "11"; -- tie off
  MC_SCAN_IN_15_in <= "11"; -- tie off
  MC_SCAN_MODE_00_in <= '1'; -- tie off
  MC_SCAN_MODE_01_in <= '1'; -- tie off
  MC_SCAN_MODE_02_in <= '1'; -- tie off
  MC_SCAN_MODE_03_in <= '1'; -- tie off
  MC_SCAN_MODE_04_in <= '1'; -- tie off
  MC_SCAN_MODE_05_in <= '1'; -- tie off
  MC_SCAN_MODE_06_in <= '1'; -- tie off
  MC_SCAN_MODE_07_in <= '1'; -- tie off
  MC_SCAN_MODE_08_in <= '1'; -- tie off
  MC_SCAN_MODE_09_in <= '1'; -- tie off
  MC_SCAN_MODE_10_in <= '1'; -- tie off
  MC_SCAN_MODE_11_in <= '1'; -- tie off
  MC_SCAN_MODE_12_in <= '1'; -- tie off
  MC_SCAN_MODE_13_in <= '1'; -- tie off
  MC_SCAN_MODE_14_in <= '1'; -- tie off
  MC_SCAN_MODE_15_in <= '1'; -- tie off
  MC_SCAN_RST_N_00_in <= '1'; -- tie off
  MC_SCAN_RST_N_01_in <= '1'; -- tie off
  MC_SCAN_RST_N_02_in <= '1'; -- tie off
  MC_SCAN_RST_N_03_in <= '1'; -- tie off
  MC_SCAN_RST_N_04_in <= '1'; -- tie off
  MC_SCAN_RST_N_05_in <= '1'; -- tie off
  MC_SCAN_RST_N_06_in <= '1'; -- tie off
  MC_SCAN_RST_N_07_in <= '1'; -- tie off
  MC_SCAN_RST_N_08_in <= '1'; -- tie off
  MC_SCAN_RST_N_09_in <= '1'; -- tie off
  MC_SCAN_RST_N_10_in <= '1'; -- tie off
  MC_SCAN_RST_N_11_in <= '1'; -- tie off
  MC_SCAN_RST_N_12_in <= '1'; -- tie off
  MC_SCAN_RST_N_13_in <= '1'; -- tie off
  MC_SCAN_RST_N_14_in <= '1'; -- tie off
  MC_SCAN_RST_N_15_in <= '1'; -- tie off
  PHY_SCAN_CK_00_in <= '1'; -- tie off
  PHY_SCAN_CK_01_in <= '1'; -- tie off
  PHY_SCAN_ENABLE_00_in <= '1'; -- tie off
  PHY_SCAN_ENABLE_01_in <= '1'; -- tie off
  PHY_SCAN_IN_00_in <= "11"; -- tie off
  PHY_SCAN_IN_01_in <= "11"; -- tie off
  PHY_SCAN_MODE_00_in <= '1'; -- tie off
  PHY_SCAN_MODE_01_in <= '1'; -- tie off
  PHY_SCAN_RST_N_00_in <= '1'; -- tie off
  PHY_SCAN_RST_N_01_in <= '1'; -- tie off
  SW_SCAN_CK_00_in <= '1'; -- tie off
  SW_SCAN_CK_01_in <= '1'; -- tie off
  SW_SCAN_ENABLE_00_in <= '1'; -- tie off
  SW_SCAN_ENABLE_01_in <= '1'; -- tie off
  SW_SCAN_IN_00_in <= "11"; -- tie off
  SW_SCAN_IN_01_in <= "11"; -- tie off
  SW_SCAN_IN_02_in <= "11"; -- tie off
  SW_SCAN_IN_03_in <= "11"; -- tie off
  SW_SCAN_IN_04_in <= "11"; -- tie off
  SW_SCAN_IN_05_in <= "11"; -- tie off
  SW_SCAN_IN_06_in <= "11"; -- tie off
  SW_SCAN_IN_07_in <= "11"; -- tie off
  SW_SCAN_MODE_00_in <= '1'; -- tie off
  SW_SCAN_MODE_01_in <= '1'; -- tie off
  SW_SCAN_RST_N_00_in <= '1'; -- tie off
  SW_SCAN_RST_N_01_in <= '1'; -- tie off

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CLK_SEL_00 check
      if((xil_attr_test) or
         ((CLK_SEL_00 /= "FALSE") and 
          (CLK_SEL_00 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-109] CLK_SEL_00 attribute is set to """));
        Write ( Message, string'(CLK_SEL_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_01 check
      if((xil_attr_test) or
         ((CLK_SEL_01 /= "FALSE") and 
          (CLK_SEL_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-110] CLK_SEL_01 attribute is set to """));
        Write ( Message, string'(CLK_SEL_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_02 check
      if((xil_attr_test) or
         ((CLK_SEL_02 /= "FALSE") and 
          (CLK_SEL_02 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] CLK_SEL_02 attribute is set to """));
        Write ( Message, string'(CLK_SEL_02));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_03 check
      if((xil_attr_test) or
         ((CLK_SEL_03 /= "FALSE") and 
          (CLK_SEL_03 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-112] CLK_SEL_03 attribute is set to """));
        Write ( Message, string'(CLK_SEL_03));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_04 check
      if((xil_attr_test) or
         ((CLK_SEL_04 /= "FALSE") and 
          (CLK_SEL_04 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] CLK_SEL_04 attribute is set to """));
        Write ( Message, string'(CLK_SEL_04));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_05 check
      if((xil_attr_test) or
         ((CLK_SEL_05 /= "FALSE") and 
          (CLK_SEL_05 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-114] CLK_SEL_05 attribute is set to """));
        Write ( Message, string'(CLK_SEL_05));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_06 check
      if((xil_attr_test) or
         ((CLK_SEL_06 /= "FALSE") and 
          (CLK_SEL_06 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-115] CLK_SEL_06 attribute is set to """));
        Write ( Message, string'(CLK_SEL_06));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_07 check
      if((xil_attr_test) or
         ((CLK_SEL_07 /= "FALSE") and 
          (CLK_SEL_07 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-116] CLK_SEL_07 attribute is set to """));
        Write ( Message, string'(CLK_SEL_07));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_08 check
      if((xil_attr_test) or
         ((CLK_SEL_08 /= "FALSE") and 
          (CLK_SEL_08 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-117] CLK_SEL_08 attribute is set to """));
        Write ( Message, string'(CLK_SEL_08));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_09 check
      if((xil_attr_test) or
         ((CLK_SEL_09 /= "FALSE") and 
          (CLK_SEL_09 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-118] CLK_SEL_09 attribute is set to """));
        Write ( Message, string'(CLK_SEL_09));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_10 check
      if((xil_attr_test) or
         ((CLK_SEL_10 /= "FALSE") and 
          (CLK_SEL_10 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-119] CLK_SEL_10 attribute is set to """));
        Write ( Message, string'(CLK_SEL_10));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_11 check
      if((xil_attr_test) or
         ((CLK_SEL_11 /= "FALSE") and 
          (CLK_SEL_11 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-120] CLK_SEL_11 attribute is set to """));
        Write ( Message, string'(CLK_SEL_11));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_12 check
      if((xil_attr_test) or
         ((CLK_SEL_12 /= "FALSE") and 
          (CLK_SEL_12 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-121] CLK_SEL_12 attribute is set to """));
        Write ( Message, string'(CLK_SEL_12));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_13 check
      if((xil_attr_test) or
         ((CLK_SEL_13 /= "FALSE") and 
          (CLK_SEL_13 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-122] CLK_SEL_13 attribute is set to """));
        Write ( Message, string'(CLK_SEL_13));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_14 check
      if((xil_attr_test) or
         ((CLK_SEL_14 /= "FALSE") and 
          (CLK_SEL_14 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-123] CLK_SEL_14 attribute is set to """));
        Write ( Message, string'(CLK_SEL_14));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_15 check
      if((xil_attr_test) or
         ((CLK_SEL_15 /= "FALSE") and 
          (CLK_SEL_15 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-124] CLK_SEL_15 attribute is set to """));
        Write ( Message, string'(CLK_SEL_15));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_16 check
      if((xil_attr_test) or
         ((CLK_SEL_16 /= "FALSE") and 
          (CLK_SEL_16 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-125] CLK_SEL_16 attribute is set to """));
        Write ( Message, string'(CLK_SEL_16));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_17 check
      if((xil_attr_test) or
         ((CLK_SEL_17 /= "FALSE") and 
          (CLK_SEL_17 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-126] CLK_SEL_17 attribute is set to """));
        Write ( Message, string'(CLK_SEL_17));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_18 check
      if((xil_attr_test) or
         ((CLK_SEL_18 /= "FALSE") and 
          (CLK_SEL_18 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-127] CLK_SEL_18 attribute is set to """));
        Write ( Message, string'(CLK_SEL_18));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_19 check
      if((xil_attr_test) or
         ((CLK_SEL_19 /= "FALSE") and 
          (CLK_SEL_19 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-128] CLK_SEL_19 attribute is set to """));
        Write ( Message, string'(CLK_SEL_19));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_20 check
      if((xil_attr_test) or
         ((CLK_SEL_20 /= "FALSE") and 
          (CLK_SEL_20 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-129] CLK_SEL_20 attribute is set to """));
        Write ( Message, string'(CLK_SEL_20));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_21 check
      if((xil_attr_test) or
         ((CLK_SEL_21 /= "FALSE") and 
          (CLK_SEL_21 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-130] CLK_SEL_21 attribute is set to """));
        Write ( Message, string'(CLK_SEL_21));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_22 check
      if((xil_attr_test) or
         ((CLK_SEL_22 /= "FALSE") and 
          (CLK_SEL_22 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-131] CLK_SEL_22 attribute is set to """));
        Write ( Message, string'(CLK_SEL_22));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_23 check
      if((xil_attr_test) or
         ((CLK_SEL_23 /= "FALSE") and 
          (CLK_SEL_23 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-132] CLK_SEL_23 attribute is set to """));
        Write ( Message, string'(CLK_SEL_23));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_24 check
      if((xil_attr_test) or
         ((CLK_SEL_24 /= "FALSE") and 
          (CLK_SEL_24 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-133] CLK_SEL_24 attribute is set to """));
        Write ( Message, string'(CLK_SEL_24));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_25 check
      if((xil_attr_test) or
         ((CLK_SEL_25 /= "FALSE") and 
          (CLK_SEL_25 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-134] CLK_SEL_25 attribute is set to """));
        Write ( Message, string'(CLK_SEL_25));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_26 check
      if((xil_attr_test) or
         ((CLK_SEL_26 /= "FALSE") and 
          (CLK_SEL_26 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-135] CLK_SEL_26 attribute is set to """));
        Write ( Message, string'(CLK_SEL_26));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_27 check
      if((xil_attr_test) or
         ((CLK_SEL_27 /= "FALSE") and 
          (CLK_SEL_27 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-136] CLK_SEL_27 attribute is set to """));
        Write ( Message, string'(CLK_SEL_27));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_28 check
      if((xil_attr_test) or
         ((CLK_SEL_28 /= "FALSE") and 
          (CLK_SEL_28 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-137] CLK_SEL_28 attribute is set to """));
        Write ( Message, string'(CLK_SEL_28));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_29 check
      if((xil_attr_test) or
         ((CLK_SEL_29 /= "FALSE") and 
          (CLK_SEL_29 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-138] CLK_SEL_29 attribute is set to """));
        Write ( Message, string'(CLK_SEL_29));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_30 check
      if((xil_attr_test) or
         ((CLK_SEL_30 /= "FALSE") and 
          (CLK_SEL_30 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-139] CLK_SEL_30 attribute is set to """));
        Write ( Message, string'(CLK_SEL_30));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CLK_SEL_31 check
      if((xil_attr_test) or
         ((CLK_SEL_31 /= "FALSE") and 
          (CLK_SEL_31 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-140] CLK_SEL_31 attribute is set to """));
        Write ( Message, string'(CLK_SEL_31));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DATARATE_00 check
        if((xil_attr_test) or
           ((DATARATE_00 < 50) or (DATARATE_00 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-141] DATARATE_00 attribute is set to "));
          Write ( Message, DATARATE_00);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_01 check
        if((xil_attr_test) or
           ((DATARATE_01 < 50) or (DATARATE_01 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-142] DATARATE_01 attribute is set to "));
          Write ( Message, DATARATE_01);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_02 check
        if((xil_attr_test) or
           ((DATARATE_02 < 50) or (DATARATE_02 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-143] DATARATE_02 attribute is set to "));
          Write ( Message, DATARATE_02);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_03 check
        if((xil_attr_test) or
           ((DATARATE_03 < 50) or (DATARATE_03 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-144] DATARATE_03 attribute is set to "));
          Write ( Message, DATARATE_03);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_04 check
        if((xil_attr_test) or
           ((DATARATE_04 < 50) or (DATARATE_04 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-145] DATARATE_04 attribute is set to "));
          Write ( Message, DATARATE_04);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_05 check
        if((xil_attr_test) or
           ((DATARATE_05 < 50) or (DATARATE_05 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-146] DATARATE_05 attribute is set to "));
          Write ( Message, DATARATE_05);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_06 check
        if((xil_attr_test) or
           ((DATARATE_06 < 50) or (DATARATE_06 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-147] DATARATE_06 attribute is set to "));
          Write ( Message, DATARATE_06);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_07 check
        if((xil_attr_test) or
           ((DATARATE_07 < 50) or (DATARATE_07 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-148] DATARATE_07 attribute is set to "));
          Write ( Message, DATARATE_07);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_08 check
        if((xil_attr_test) or
           ((DATARATE_08 < 50) or (DATARATE_08 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-149] DATARATE_08 attribute is set to "));
          Write ( Message, DATARATE_08);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_09 check
        if((xil_attr_test) or
           ((DATARATE_09 < 50) or (DATARATE_09 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-150] DATARATE_09 attribute is set to "));
          Write ( Message, DATARATE_09);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_10 check
        if((xil_attr_test) or
           ((DATARATE_10 < 50) or (DATARATE_10 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-151] DATARATE_10 attribute is set to "));
          Write ( Message, DATARATE_10);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_11 check
        if((xil_attr_test) or
           ((DATARATE_11 < 50) or (DATARATE_11 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-152] DATARATE_11 attribute is set to "));
          Write ( Message, DATARATE_11);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_12 check
        if((xil_attr_test) or
           ((DATARATE_12 < 50) or (DATARATE_12 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-153] DATARATE_12 attribute is set to "));
          Write ( Message, DATARATE_12);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_13 check
        if((xil_attr_test) or
           ((DATARATE_13 < 50) or (DATARATE_13 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-154] DATARATE_13 attribute is set to "));
          Write ( Message, DATARATE_13);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_14 check
        if((xil_attr_test) or
           ((DATARATE_14 < 50) or (DATARATE_14 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-155] DATARATE_14 attribute is set to "));
          Write ( Message, DATARATE_14);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_15 check
        if((xil_attr_test) or
           ((DATARATE_15 < 50) or (DATARATE_15 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-156] DATARATE_15 attribute is set to "));
          Write ( Message, DATARATE_15);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DA_LOCKOUT_0 check
      if((xil_attr_test) or
         ((DA_LOCKOUT_0 /= "FALSE") and 
          (DA_LOCKOUT_0 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-157] DA_LOCKOUT_0 attribute is set to """));
        Write ( Message, string'(DA_LOCKOUT_0));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DA_LOCKOUT_1 check
      if((xil_attr_test) or
         ((DA_LOCKOUT_1 /= "FALSE") and 
          (DA_LOCKOUT_1 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-158] DA_LOCKOUT_1 attribute is set to """));
        Write ( Message, string'(DA_LOCKOUT_1));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_00 check
      if((xil_attr_test) or
         ((MC_ENABLE_00 /= "FALSE") and 
          (MC_ENABLE_00 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-253] MC_ENABLE_00 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_01 check
      if((xil_attr_test) or
         ((MC_ENABLE_01 /= "FALSE") and 
          (MC_ENABLE_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-254] MC_ENABLE_01 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_02 check
      if((xil_attr_test) or
         ((MC_ENABLE_02 /= "FALSE") and 
          (MC_ENABLE_02 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-255] MC_ENABLE_02 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_02));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_03 check
      if((xil_attr_test) or
         ((MC_ENABLE_03 /= "FALSE") and 
          (MC_ENABLE_03 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-256] MC_ENABLE_03 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_03));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_04 check
      if((xil_attr_test) or
         ((MC_ENABLE_04 /= "FALSE") and 
          (MC_ENABLE_04 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-257] MC_ENABLE_04 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_04));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_05 check
      if((xil_attr_test) or
         ((MC_ENABLE_05 /= "FALSE") and 
          (MC_ENABLE_05 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-258] MC_ENABLE_05 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_05));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_06 check
      if((xil_attr_test) or
         ((MC_ENABLE_06 /= "FALSE") and 
          (MC_ENABLE_06 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-259] MC_ENABLE_06 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_06));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_07 check
      if((xil_attr_test) or
         ((MC_ENABLE_07 /= "FALSE") and 
          (MC_ENABLE_07 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-260] MC_ENABLE_07 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_07));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_08 check
      if((xil_attr_test) or
         ((MC_ENABLE_08 /= "FALSE") and 
          (MC_ENABLE_08 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-261] MC_ENABLE_08 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_08));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_09 check
      if((xil_attr_test) or
         ((MC_ENABLE_09 /= "FALSE") and 
          (MC_ENABLE_09 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-262] MC_ENABLE_09 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_09));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_10 check
      if((xil_attr_test) or
         ((MC_ENABLE_10 /= "FALSE") and 
          (MC_ENABLE_10 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-263] MC_ENABLE_10 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_10));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_11 check
      if((xil_attr_test) or
         ((MC_ENABLE_11 /= "FALSE") and 
          (MC_ENABLE_11 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-264] MC_ENABLE_11 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_11));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_12 check
      if((xil_attr_test) or
         ((MC_ENABLE_12 /= "FALSE") and 
          (MC_ENABLE_12 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-265] MC_ENABLE_12 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_12));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_13 check
      if((xil_attr_test) or
         ((MC_ENABLE_13 /= "FALSE") and 
          (MC_ENABLE_13 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-266] MC_ENABLE_13 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_13));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_14 check
      if((xil_attr_test) or
         ((MC_ENABLE_14 /= "FALSE") and 
          (MC_ENABLE_14 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-267] MC_ENABLE_14 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_14));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_15 check
      if((xil_attr_test) or
         ((MC_ENABLE_15 /= "FALSE") and 
          (MC_ENABLE_15 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-268] MC_ENABLE_15 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_15));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_APB_00 check
      if((xil_attr_test) or
         ((MC_ENABLE_APB_00 /= "FALSE") and 
          (MC_ENABLE_APB_00 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-269] MC_ENABLE_APB_00 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_APB_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_APB_01 check
      if((xil_attr_test) or
         ((MC_ENABLE_APB_01 /= "FALSE") and 
          (MC_ENABLE_APB_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-270] MC_ENABLE_APB_01 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_APB_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PAGEHIT_PERCENT_00 check
        if((xil_attr_test) or
           ((PAGEHIT_PERCENT_00 < 0) or (PAGEHIT_PERCENT_00 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-287] PAGEHIT_PERCENT_00 attribute is set to "));
          Write ( Message, PAGEHIT_PERCENT_00);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- PAGEHIT_PERCENT_01 check
        if((xil_attr_test) or
           ((PAGEHIT_PERCENT_01 < 0) or (PAGEHIT_PERCENT_01 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-288] PAGEHIT_PERCENT_01 attribute is set to "));
          Write ( Message, PAGEHIT_PERCENT_01);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- PHY_ENABLE_00 check
      if((xil_attr_test) or
         ((PHY_ENABLE_00 /= "FALSE") and 
          (PHY_ENABLE_00 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-291] PHY_ENABLE_00 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_01 check
      if((xil_attr_test) or
         ((PHY_ENABLE_01 /= "FALSE") and 
          (PHY_ENABLE_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-292] PHY_ENABLE_01 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_02 check
      if((xil_attr_test) or
         ((PHY_ENABLE_02 /= "FALSE") and 
          (PHY_ENABLE_02 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-293] PHY_ENABLE_02 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_02));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_03 check
      if((xil_attr_test) or
         ((PHY_ENABLE_03 /= "FALSE") and 
          (PHY_ENABLE_03 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-294] PHY_ENABLE_03 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_03));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_04 check
      if((xil_attr_test) or
         ((PHY_ENABLE_04 /= "FALSE") and 
          (PHY_ENABLE_04 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-295] PHY_ENABLE_04 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_04));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_05 check
      if((xil_attr_test) or
         ((PHY_ENABLE_05 /= "FALSE") and 
          (PHY_ENABLE_05 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-296] PHY_ENABLE_05 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_05));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_06 check
      if((xil_attr_test) or
         ((PHY_ENABLE_06 /= "FALSE") and 
          (PHY_ENABLE_06 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-297] PHY_ENABLE_06 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_06));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_07 check
      if((xil_attr_test) or
         ((PHY_ENABLE_07 /= "FALSE") and 
          (PHY_ENABLE_07 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-298] PHY_ENABLE_07 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_07));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_08 check
      if((xil_attr_test) or
         ((PHY_ENABLE_08 /= "FALSE") and 
          (PHY_ENABLE_08 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-299] PHY_ENABLE_08 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_08));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_09 check
      if((xil_attr_test) or
         ((PHY_ENABLE_09 /= "FALSE") and 
          (PHY_ENABLE_09 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-300] PHY_ENABLE_09 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_09));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_10 check
      if((xil_attr_test) or
         ((PHY_ENABLE_10 /= "FALSE") and 
          (PHY_ENABLE_10 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-301] PHY_ENABLE_10 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_10));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_11 check
      if((xil_attr_test) or
         ((PHY_ENABLE_11 /= "FALSE") and 
          (PHY_ENABLE_11 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-302] PHY_ENABLE_11 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_11));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_12 check
      if((xil_attr_test) or
         ((PHY_ENABLE_12 /= "FALSE") and 
          (PHY_ENABLE_12 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-303] PHY_ENABLE_12 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_12));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_13 check
      if((xil_attr_test) or
         ((PHY_ENABLE_13 /= "FALSE") and 
          (PHY_ENABLE_13 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-304] PHY_ENABLE_13 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_13));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_14 check
      if((xil_attr_test) or
         ((PHY_ENABLE_14 /= "FALSE") and 
          (PHY_ENABLE_14 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-305] PHY_ENABLE_14 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_14));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_15 check
      if((xil_attr_test) or
         ((PHY_ENABLE_15 /= "FALSE") and 
          (PHY_ENABLE_15 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-306] PHY_ENABLE_15 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_15));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_16 check
      if((xil_attr_test) or
         ((PHY_ENABLE_16 /= "FALSE") and 
          (PHY_ENABLE_16 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-307] PHY_ENABLE_16 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_16));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_17 check
      if((xil_attr_test) or
         ((PHY_ENABLE_17 /= "FALSE") and 
          (PHY_ENABLE_17 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-308] PHY_ENABLE_17 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_17));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_18 check
      if((xil_attr_test) or
         ((PHY_ENABLE_18 /= "FALSE") and 
          (PHY_ENABLE_18 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-309] PHY_ENABLE_18 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_18));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_19 check
      if((xil_attr_test) or
         ((PHY_ENABLE_19 /= "FALSE") and 
          (PHY_ENABLE_19 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-310] PHY_ENABLE_19 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_19));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_20 check
      if((xil_attr_test) or
         ((PHY_ENABLE_20 /= "FALSE") and 
          (PHY_ENABLE_20 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-311] PHY_ENABLE_20 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_20));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_21 check
      if((xil_attr_test) or
         ((PHY_ENABLE_21 /= "FALSE") and 
          (PHY_ENABLE_21 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-312] PHY_ENABLE_21 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_21));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_22 check
      if((xil_attr_test) or
         ((PHY_ENABLE_22 /= "FALSE") and 
          (PHY_ENABLE_22 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-313] PHY_ENABLE_22 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_22));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_23 check
      if((xil_attr_test) or
         ((PHY_ENABLE_23 /= "FALSE") and 
          (PHY_ENABLE_23 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-314] PHY_ENABLE_23 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_23));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_24 check
      if((xil_attr_test) or
         ((PHY_ENABLE_24 /= "FALSE") and 
          (PHY_ENABLE_24 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-315] PHY_ENABLE_24 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_24));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_25 check
      if((xil_attr_test) or
         ((PHY_ENABLE_25 /= "FALSE") and 
          (PHY_ENABLE_25 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-316] PHY_ENABLE_25 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_25));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_26 check
      if((xil_attr_test) or
         ((PHY_ENABLE_26 /= "FALSE") and 
          (PHY_ENABLE_26 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-317] PHY_ENABLE_26 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_26));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_27 check
      if((xil_attr_test) or
         ((PHY_ENABLE_27 /= "FALSE") and 
          (PHY_ENABLE_27 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-318] PHY_ENABLE_27 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_27));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_28 check
      if((xil_attr_test) or
         ((PHY_ENABLE_28 /= "FALSE") and 
          (PHY_ENABLE_28 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-319] PHY_ENABLE_28 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_28));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_29 check
      if((xil_attr_test) or
         ((PHY_ENABLE_29 /= "FALSE") and 
          (PHY_ENABLE_29 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-320] PHY_ENABLE_29 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_29));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_30 check
      if((xil_attr_test) or
         ((PHY_ENABLE_30 /= "FALSE") and 
          (PHY_ENABLE_30 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-321] PHY_ENABLE_30 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_30));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_31 check
      if((xil_attr_test) or
         ((PHY_ENABLE_31 /= "FALSE") and 
          (PHY_ENABLE_31 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-322] PHY_ENABLE_31 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_31));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_APB_00 check
      if((xil_attr_test) or
         ((PHY_ENABLE_APB_00 /= "FALSE") and 
          (PHY_ENABLE_APB_00 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-323] PHY_ENABLE_APB_00 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_APB_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_APB_01 check
      if((xil_attr_test) or
         ((PHY_ENABLE_APB_01 /= "FALSE") and 
          (PHY_ENABLE_APB_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-324] PHY_ENABLE_APB_01 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_APB_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_PCLK_INVERT_01 check
      if((xil_attr_test) or
         ((PHY_PCLK_INVERT_01 /= "FALSE") and 
          (PHY_PCLK_INVERT_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-325] PHY_PCLK_INVERT_01 attribute is set to """));
        Write ( Message, string'(PHY_PCLK_INVERT_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_PCLK_INVERT_02 check
      if((xil_attr_test) or
         ((PHY_PCLK_INVERT_02 /= "FALSE") and 
          (PHY_PCLK_INVERT_02 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-326] PHY_PCLK_INVERT_02 attribute is set to """));
        Write ( Message, string'(PHY_PCLK_INVERT_02));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- READ_PERCENT_00 check
        if((xil_attr_test) or
           ((READ_PERCENT_00 < 0) or (READ_PERCENT_00 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-329] READ_PERCENT_00 attribute is set to "));
          Write ( Message, READ_PERCENT_00);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_01 check
        if((xil_attr_test) or
           ((READ_PERCENT_01 < 0) or (READ_PERCENT_01 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-330] READ_PERCENT_01 attribute is set to "));
          Write ( Message, READ_PERCENT_01);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_02 check
        if((xil_attr_test) or
           ((READ_PERCENT_02 < 0) or (READ_PERCENT_02 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-331] READ_PERCENT_02 attribute is set to "));
          Write ( Message, READ_PERCENT_02);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_03 check
        if((xil_attr_test) or
           ((READ_PERCENT_03 < 0) or (READ_PERCENT_03 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-332] READ_PERCENT_03 attribute is set to "));
          Write ( Message, READ_PERCENT_03);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_04 check
        if((xil_attr_test) or
           ((READ_PERCENT_04 < 0) or (READ_PERCENT_04 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-333] READ_PERCENT_04 attribute is set to "));
          Write ( Message, READ_PERCENT_04);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_05 check
        if((xil_attr_test) or
           ((READ_PERCENT_05 < 0) or (READ_PERCENT_05 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-334] READ_PERCENT_05 attribute is set to "));
          Write ( Message, READ_PERCENT_05);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_06 check
        if((xil_attr_test) or
           ((READ_PERCENT_06 < 0) or (READ_PERCENT_06 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-335] READ_PERCENT_06 attribute is set to "));
          Write ( Message, READ_PERCENT_06);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_07 check
        if((xil_attr_test) or
           ((READ_PERCENT_07 < 0) or (READ_PERCENT_07 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-336] READ_PERCENT_07 attribute is set to "));
          Write ( Message, READ_PERCENT_07);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_08 check
        if((xil_attr_test) or
           ((READ_PERCENT_08 < 0) or (READ_PERCENT_08 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-337] READ_PERCENT_08 attribute is set to "));
          Write ( Message, READ_PERCENT_08);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_09 check
        if((xil_attr_test) or
           ((READ_PERCENT_09 < 0) or (READ_PERCENT_09 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-338] READ_PERCENT_09 attribute is set to "));
          Write ( Message, READ_PERCENT_09);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_10 check
        if((xil_attr_test) or
           ((READ_PERCENT_10 < 0) or (READ_PERCENT_10 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-339] READ_PERCENT_10 attribute is set to "));
          Write ( Message, READ_PERCENT_10);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_11 check
        if((xil_attr_test) or
           ((READ_PERCENT_11 < 0) or (READ_PERCENT_11 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-340] READ_PERCENT_11 attribute is set to "));
          Write ( Message, READ_PERCENT_11);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_12 check
        if((xil_attr_test) or
           ((READ_PERCENT_12 < 0) or (READ_PERCENT_12 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-341] READ_PERCENT_12 attribute is set to "));
          Write ( Message, READ_PERCENT_12);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_13 check
        if((xil_attr_test) or
           ((READ_PERCENT_13 < 0) or (READ_PERCENT_13 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-342] READ_PERCENT_13 attribute is set to "));
          Write ( Message, READ_PERCENT_13);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_14 check
        if((xil_attr_test) or
           ((READ_PERCENT_14 < 0) or (READ_PERCENT_14 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-343] READ_PERCENT_14 attribute is set to "));
          Write ( Message, READ_PERCENT_14);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_15 check
        if((xil_attr_test) or
           ((READ_PERCENT_15 < 0) or (READ_PERCENT_15 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-344] READ_PERCENT_15 attribute is set to "));
          Write ( Message, READ_PERCENT_15);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_16 check
        if((xil_attr_test) or
           ((READ_PERCENT_16 < 0) or (READ_PERCENT_16 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-345] READ_PERCENT_16 attribute is set to "));
          Write ( Message, READ_PERCENT_16);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_17 check
        if((xil_attr_test) or
           ((READ_PERCENT_17 < 0) or (READ_PERCENT_17 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-346] READ_PERCENT_17 attribute is set to "));
          Write ( Message, READ_PERCENT_17);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_18 check
        if((xil_attr_test) or
           ((READ_PERCENT_18 < 0) or (READ_PERCENT_18 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-347] READ_PERCENT_18 attribute is set to "));
          Write ( Message, READ_PERCENT_18);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_19 check
        if((xil_attr_test) or
           ((READ_PERCENT_19 < 0) or (READ_PERCENT_19 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-348] READ_PERCENT_19 attribute is set to "));
          Write ( Message, READ_PERCENT_19);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_20 check
        if((xil_attr_test) or
           ((READ_PERCENT_20 < 0) or (READ_PERCENT_20 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-349] READ_PERCENT_20 attribute is set to "));
          Write ( Message, READ_PERCENT_20);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_21 check
        if((xil_attr_test) or
           ((READ_PERCENT_21 < 0) or (READ_PERCENT_21 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-350] READ_PERCENT_21 attribute is set to "));
          Write ( Message, READ_PERCENT_21);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_22 check
        if((xil_attr_test) or
           ((READ_PERCENT_22 < 0) or (READ_PERCENT_22 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-351] READ_PERCENT_22 attribute is set to "));
          Write ( Message, READ_PERCENT_22);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_23 check
        if((xil_attr_test) or
           ((READ_PERCENT_23 < 0) or (READ_PERCENT_23 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-352] READ_PERCENT_23 attribute is set to "));
          Write ( Message, READ_PERCENT_23);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_24 check
        if((xil_attr_test) or
           ((READ_PERCENT_24 < 0) or (READ_PERCENT_24 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-353] READ_PERCENT_24 attribute is set to "));
          Write ( Message, READ_PERCENT_24);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_25 check
        if((xil_attr_test) or
           ((READ_PERCENT_25 < 0) or (READ_PERCENT_25 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-354] READ_PERCENT_25 attribute is set to "));
          Write ( Message, READ_PERCENT_25);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_26 check
        if((xil_attr_test) or
           ((READ_PERCENT_26 < 0) or (READ_PERCENT_26 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-355] READ_PERCENT_26 attribute is set to "));
          Write ( Message, READ_PERCENT_26);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_27 check
        if((xil_attr_test) or
           ((READ_PERCENT_27 < 0) or (READ_PERCENT_27 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-356] READ_PERCENT_27 attribute is set to "));
          Write ( Message, READ_PERCENT_27);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_28 check
        if((xil_attr_test) or
           ((READ_PERCENT_28 < 0) or (READ_PERCENT_28 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-357] READ_PERCENT_28 attribute is set to "));
          Write ( Message, READ_PERCENT_28);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_29 check
        if((xil_attr_test) or
           ((READ_PERCENT_29 < 0) or (READ_PERCENT_29 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-358] READ_PERCENT_29 attribute is set to "));
          Write ( Message, READ_PERCENT_29);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_30 check
        if((xil_attr_test) or
           ((READ_PERCENT_30 < 0) or (READ_PERCENT_30 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-359] READ_PERCENT_30 attribute is set to "));
          Write ( Message, READ_PERCENT_30);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_31 check
        if((xil_attr_test) or
           ((READ_PERCENT_31 < 0) or (READ_PERCENT_31 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-360] READ_PERCENT_31 attribute is set to "));
          Write ( Message, READ_PERCENT_31);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-361] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SWITCH_ENABLE_00 check
      if((xil_attr_test) or
         ((SWITCH_ENABLE_00 /= "FALSE") and 
          (SWITCH_ENABLE_00 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-363] SWITCH_ENABLE_00 attribute is set to """));
        Write ( Message, string'(SWITCH_ENABLE_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SWITCH_ENABLE_01 check
      if((xil_attr_test) or
         ((SWITCH_ENABLE_01 /= "FALSE") and 
          (SWITCH_ENABLE_01 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-364] SWITCH_ENABLE_01 attribute is set to """));
        Write ( Message, string'(SWITCH_ENABLE_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- WRITE_PERCENT_00 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_00 < 0) or (WRITE_PERCENT_00 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-368] WRITE_PERCENT_00 attribute is set to "));
          Write ( Message, WRITE_PERCENT_00);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_01 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_01 < 0) or (WRITE_PERCENT_01 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-369] WRITE_PERCENT_01 attribute is set to "));
          Write ( Message, WRITE_PERCENT_01);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_02 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_02 < 0) or (WRITE_PERCENT_02 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-370] WRITE_PERCENT_02 attribute is set to "));
          Write ( Message, WRITE_PERCENT_02);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_03 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_03 < 0) or (WRITE_PERCENT_03 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-371] WRITE_PERCENT_03 attribute is set to "));
          Write ( Message, WRITE_PERCENT_03);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_04 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_04 < 0) or (WRITE_PERCENT_04 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-372] WRITE_PERCENT_04 attribute is set to "));
          Write ( Message, WRITE_PERCENT_04);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_05 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_05 < 0) or (WRITE_PERCENT_05 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-373] WRITE_PERCENT_05 attribute is set to "));
          Write ( Message, WRITE_PERCENT_05);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_06 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_06 < 0) or (WRITE_PERCENT_06 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-374] WRITE_PERCENT_06 attribute is set to "));
          Write ( Message, WRITE_PERCENT_06);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_07 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_07 < 0) or (WRITE_PERCENT_07 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-375] WRITE_PERCENT_07 attribute is set to "));
          Write ( Message, WRITE_PERCENT_07);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_08 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_08 < 0) or (WRITE_PERCENT_08 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-376] WRITE_PERCENT_08 attribute is set to "));
          Write ( Message, WRITE_PERCENT_08);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_09 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_09 < 0) or (WRITE_PERCENT_09 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-377] WRITE_PERCENT_09 attribute is set to "));
          Write ( Message, WRITE_PERCENT_09);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_10 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_10 < 0) or (WRITE_PERCENT_10 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-378] WRITE_PERCENT_10 attribute is set to "));
          Write ( Message, WRITE_PERCENT_10);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_11 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_11 < 0) or (WRITE_PERCENT_11 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-379] WRITE_PERCENT_11 attribute is set to "));
          Write ( Message, WRITE_PERCENT_11);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_12 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_12 < 0) or (WRITE_PERCENT_12 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-380] WRITE_PERCENT_12 attribute is set to "));
          Write ( Message, WRITE_PERCENT_12);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_13 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_13 < 0) or (WRITE_PERCENT_13 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-381] WRITE_PERCENT_13 attribute is set to "));
          Write ( Message, WRITE_PERCENT_13);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_14 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_14 < 0) or (WRITE_PERCENT_14 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-382] WRITE_PERCENT_14 attribute is set to "));
          Write ( Message, WRITE_PERCENT_14);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_15 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_15 < 0) or (WRITE_PERCENT_15 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-383] WRITE_PERCENT_15 attribute is set to "));
          Write ( Message, WRITE_PERCENT_15);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_16 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_16 < 0) or (WRITE_PERCENT_16 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-384] WRITE_PERCENT_16 attribute is set to "));
          Write ( Message, WRITE_PERCENT_16);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_17 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_17 < 0) or (WRITE_PERCENT_17 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-385] WRITE_PERCENT_17 attribute is set to "));
          Write ( Message, WRITE_PERCENT_17);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_18 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_18 < 0) or (WRITE_PERCENT_18 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-386] WRITE_PERCENT_18 attribute is set to "));
          Write ( Message, WRITE_PERCENT_18);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_19 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_19 < 0) or (WRITE_PERCENT_19 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-387] WRITE_PERCENT_19 attribute is set to "));
          Write ( Message, WRITE_PERCENT_19);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_20 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_20 < 0) or (WRITE_PERCENT_20 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-388] WRITE_PERCENT_20 attribute is set to "));
          Write ( Message, WRITE_PERCENT_20);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_21 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_21 < 0) or (WRITE_PERCENT_21 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-389] WRITE_PERCENT_21 attribute is set to "));
          Write ( Message, WRITE_PERCENT_21);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_22 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_22 < 0) or (WRITE_PERCENT_22 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-390] WRITE_PERCENT_22 attribute is set to "));
          Write ( Message, WRITE_PERCENT_22);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_23 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_23 < 0) or (WRITE_PERCENT_23 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-391] WRITE_PERCENT_23 attribute is set to "));
          Write ( Message, WRITE_PERCENT_23);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_24 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_24 < 0) or (WRITE_PERCENT_24 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-392] WRITE_PERCENT_24 attribute is set to "));
          Write ( Message, WRITE_PERCENT_24);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_25 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_25 < 0) or (WRITE_PERCENT_25 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-393] WRITE_PERCENT_25 attribute is set to "));
          Write ( Message, WRITE_PERCENT_25);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_26 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_26 < 0) or (WRITE_PERCENT_26 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-394] WRITE_PERCENT_26 attribute is set to "));
          Write ( Message, WRITE_PERCENT_26);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_27 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_27 < 0) or (WRITE_PERCENT_27 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-395] WRITE_PERCENT_27 attribute is set to "));
          Write ( Message, WRITE_PERCENT_27);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_28 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_28 < 0) or (WRITE_PERCENT_28 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-396] WRITE_PERCENT_28 attribute is set to "));
          Write ( Message, WRITE_PERCENT_28);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_29 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_29 < 0) or (WRITE_PERCENT_29 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-397] WRITE_PERCENT_29 attribute is set to "));
          Write ( Message, WRITE_PERCENT_29);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_30 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_30 < 0) or (WRITE_PERCENT_30 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-398] WRITE_PERCENT_30 attribute is set to "));
          Write ( Message, WRITE_PERCENT_30);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_31 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_31 < 0) or (WRITE_PERCENT_31 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-399] WRITE_PERCENT_31 attribute is set to "));
          Write ( Message, WRITE_PERCENT_31);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-274] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HBM_TWO_STACK_INTF_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    
    SIP_HBM_TWO_STACK_INTF_INST : SIP_HBM_TWO_STACK_INTF
      port map (
        ANALOG_MUX_SEL_0     => ANALOG_MUX_SEL_0_BIN,
        ANALOG_MUX_SEL_1     => ANALOG_MUX_SEL_1_BIN,
        APB_BYPASS_EN_0      => APB_BYPASS_EN_0_BIN,
        APB_BYPASS_EN_1      => APB_BYPASS_EN_1_BIN,
        AXI_BYPASS_EN_0      => AXI_BYPASS_EN_0_BIN,
        AXI_BYPASS_EN_1      => AXI_BYPASS_EN_1_BIN,
        BLI_TESTMODE_SEL_0   => BLI_TESTMODE_SEL_0_BIN,
        BLI_TESTMODE_SEL_1   => BLI_TESTMODE_SEL_1_BIN,
        CLK_SEL_00           => CLK_SEL_00_BIN,
        CLK_SEL_01           => CLK_SEL_01_BIN,
        CLK_SEL_02           => CLK_SEL_02_BIN,
        CLK_SEL_03           => CLK_SEL_03_BIN,
        CLK_SEL_04           => CLK_SEL_04_BIN,
        CLK_SEL_05           => CLK_SEL_05_BIN,
        CLK_SEL_06           => CLK_SEL_06_BIN,
        CLK_SEL_07           => CLK_SEL_07_BIN,
        CLK_SEL_08           => CLK_SEL_08_BIN,
        CLK_SEL_09           => CLK_SEL_09_BIN,
        CLK_SEL_10           => CLK_SEL_10_BIN,
        CLK_SEL_11           => CLK_SEL_11_BIN,
        CLK_SEL_12           => CLK_SEL_12_BIN,
        CLK_SEL_13           => CLK_SEL_13_BIN,
        CLK_SEL_14           => CLK_SEL_14_BIN,
        CLK_SEL_15           => CLK_SEL_15_BIN,
        CLK_SEL_16           => CLK_SEL_16_BIN,
        CLK_SEL_17           => CLK_SEL_17_BIN,
        CLK_SEL_18           => CLK_SEL_18_BIN,
        CLK_SEL_19           => CLK_SEL_19_BIN,
        CLK_SEL_20           => CLK_SEL_20_BIN,
        CLK_SEL_21           => CLK_SEL_21_BIN,
        CLK_SEL_22           => CLK_SEL_22_BIN,
        CLK_SEL_23           => CLK_SEL_23_BIN,
        CLK_SEL_24           => CLK_SEL_24_BIN,
        CLK_SEL_25           => CLK_SEL_25_BIN,
        CLK_SEL_26           => CLK_SEL_26_BIN,
        CLK_SEL_27           => CLK_SEL_27_BIN,
        CLK_SEL_28           => CLK_SEL_28_BIN,
        CLK_SEL_29           => CLK_SEL_29_BIN,
        CLK_SEL_30           => CLK_SEL_30_BIN,
        CLK_SEL_31           => CLK_SEL_31_BIN,
        DATARATE_00          => DATARATE_00_BIN,
        DATARATE_01          => DATARATE_01_BIN,
        DATARATE_02          => DATARATE_02_BIN,
        DATARATE_03          => DATARATE_03_BIN,
        DATARATE_04          => DATARATE_04_BIN,
        DATARATE_05          => DATARATE_05_BIN,
        DATARATE_06          => DATARATE_06_BIN,
        DATARATE_07          => DATARATE_07_BIN,
        DATARATE_08          => DATARATE_08_BIN,
        DATARATE_09          => DATARATE_09_BIN,
        DATARATE_10          => DATARATE_10_BIN,
        DATARATE_11          => DATARATE_11_BIN,
        DATARATE_12          => DATARATE_12_BIN,
        DATARATE_13          => DATARATE_13_BIN,
        DATARATE_14          => DATARATE_14_BIN,
        DATARATE_15          => DATARATE_15_BIN,
        DA_LOCKOUT_0         => DA_LOCKOUT_0_BIN,
        DA_LOCKOUT_1         => DA_LOCKOUT_1_BIN,
        DBG_BYPASS_VAL_0     => DBG_BYPASS_VAL_0_BIN,
        DBG_BYPASS_VAL_1     => DBG_BYPASS_VAL_1_BIN,
        DEBUG_MODE_0         => DEBUG_MODE_0_BIN,
        DEBUG_MODE_1         => DEBUG_MODE_1_BIN,
        DFI_BYPASS_VAL_0     => DFI_BYPASS_VAL_0_BIN,
        DFI_BYPASS_VAL_1     => DFI_BYPASS_VAL_1_BIN,
        DLL_TESTMODE_SEL_0   => DLL_TESTMODE_SEL_0_BIN,
        DLL_TESTMODE_SEL_1   => DLL_TESTMODE_SEL_1_BIN,
        IO_TESTMODE_SEL_0    => IO_TESTMODE_SEL_0_BIN,
        IO_TESTMODE_SEL_1    => IO_TESTMODE_SEL_1_BIN,
        IS_APB_0_PCLK_INVERTED => IS_APB_0_PCLK_INVERTED_BIN,
        IS_APB_0_PRESET_N_INVERTED => IS_APB_0_PRESET_N_INVERTED_BIN,
        IS_APB_1_PCLK_INVERTED => IS_APB_1_PCLK_INVERTED_BIN,
        IS_APB_1_PRESET_N_INVERTED => IS_APB_1_PRESET_N_INVERTED_BIN,
        IS_AXI_00_ACLK_INVERTED => IS_AXI_00_ACLK_INVERTED_BIN,
        IS_AXI_00_ARESET_N_INVERTED => IS_AXI_00_ARESET_N_INVERTED_BIN,
        IS_AXI_01_ACLK_INVERTED => IS_AXI_01_ACLK_INVERTED_BIN,
        IS_AXI_01_ARESET_N_INVERTED => IS_AXI_01_ARESET_N_INVERTED_BIN,
        IS_AXI_02_ACLK_INVERTED => IS_AXI_02_ACLK_INVERTED_BIN,
        IS_AXI_02_ARESET_N_INVERTED => IS_AXI_02_ARESET_N_INVERTED_BIN,
        IS_AXI_03_ACLK_INVERTED => IS_AXI_03_ACLK_INVERTED_BIN,
        IS_AXI_03_ARESET_N_INVERTED => IS_AXI_03_ARESET_N_INVERTED_BIN,
        IS_AXI_04_ACLK_INVERTED => IS_AXI_04_ACLK_INVERTED_BIN,
        IS_AXI_04_ARESET_N_INVERTED => IS_AXI_04_ARESET_N_INVERTED_BIN,
        IS_AXI_05_ACLK_INVERTED => IS_AXI_05_ACLK_INVERTED_BIN,
        IS_AXI_05_ARESET_N_INVERTED => IS_AXI_05_ARESET_N_INVERTED_BIN,
        IS_AXI_06_ACLK_INVERTED => IS_AXI_06_ACLK_INVERTED_BIN,
        IS_AXI_06_ARESET_N_INVERTED => IS_AXI_06_ARESET_N_INVERTED_BIN,
        IS_AXI_07_ACLK_INVERTED => IS_AXI_07_ACLK_INVERTED_BIN,
        IS_AXI_07_ARESET_N_INVERTED => IS_AXI_07_ARESET_N_INVERTED_BIN,
        IS_AXI_08_ACLK_INVERTED => IS_AXI_08_ACLK_INVERTED_BIN,
        IS_AXI_08_ARESET_N_INVERTED => IS_AXI_08_ARESET_N_INVERTED_BIN,
        IS_AXI_09_ACLK_INVERTED => IS_AXI_09_ACLK_INVERTED_BIN,
        IS_AXI_09_ARESET_N_INVERTED => IS_AXI_09_ARESET_N_INVERTED_BIN,
        IS_AXI_10_ACLK_INVERTED => IS_AXI_10_ACLK_INVERTED_BIN,
        IS_AXI_10_ARESET_N_INVERTED => IS_AXI_10_ARESET_N_INVERTED_BIN,
        IS_AXI_11_ACLK_INVERTED => IS_AXI_11_ACLK_INVERTED_BIN,
        IS_AXI_11_ARESET_N_INVERTED => IS_AXI_11_ARESET_N_INVERTED_BIN,
        IS_AXI_12_ACLK_INVERTED => IS_AXI_12_ACLK_INVERTED_BIN,
        IS_AXI_12_ARESET_N_INVERTED => IS_AXI_12_ARESET_N_INVERTED_BIN,
        IS_AXI_13_ACLK_INVERTED => IS_AXI_13_ACLK_INVERTED_BIN,
        IS_AXI_13_ARESET_N_INVERTED => IS_AXI_13_ARESET_N_INVERTED_BIN,
        IS_AXI_14_ACLK_INVERTED => IS_AXI_14_ACLK_INVERTED_BIN,
        IS_AXI_14_ARESET_N_INVERTED => IS_AXI_14_ARESET_N_INVERTED_BIN,
        IS_AXI_15_ACLK_INVERTED => IS_AXI_15_ACLK_INVERTED_BIN,
        IS_AXI_15_ARESET_N_INVERTED => IS_AXI_15_ARESET_N_INVERTED_BIN,
        IS_AXI_16_ACLK_INVERTED => IS_AXI_16_ACLK_INVERTED_BIN,
        IS_AXI_16_ARESET_N_INVERTED => IS_AXI_16_ARESET_N_INVERTED_BIN,
        IS_AXI_17_ACLK_INVERTED => IS_AXI_17_ACLK_INVERTED_BIN,
        IS_AXI_17_ARESET_N_INVERTED => IS_AXI_17_ARESET_N_INVERTED_BIN,
        IS_AXI_18_ACLK_INVERTED => IS_AXI_18_ACLK_INVERTED_BIN,
        IS_AXI_18_ARESET_N_INVERTED => IS_AXI_18_ARESET_N_INVERTED_BIN,
        IS_AXI_19_ACLK_INVERTED => IS_AXI_19_ACLK_INVERTED_BIN,
        IS_AXI_19_ARESET_N_INVERTED => IS_AXI_19_ARESET_N_INVERTED_BIN,
        IS_AXI_20_ACLK_INVERTED => IS_AXI_20_ACLK_INVERTED_BIN,
        IS_AXI_20_ARESET_N_INVERTED => IS_AXI_20_ARESET_N_INVERTED_BIN,
        IS_AXI_21_ACLK_INVERTED => IS_AXI_21_ACLK_INVERTED_BIN,
        IS_AXI_21_ARESET_N_INVERTED => IS_AXI_21_ARESET_N_INVERTED_BIN,
        IS_AXI_22_ACLK_INVERTED => IS_AXI_22_ACLK_INVERTED_BIN,
        IS_AXI_22_ARESET_N_INVERTED => IS_AXI_22_ARESET_N_INVERTED_BIN,
        IS_AXI_23_ACLK_INVERTED => IS_AXI_23_ACLK_INVERTED_BIN,
        IS_AXI_23_ARESET_N_INVERTED => IS_AXI_23_ARESET_N_INVERTED_BIN,
        IS_AXI_24_ACLK_INVERTED => IS_AXI_24_ACLK_INVERTED_BIN,
        IS_AXI_24_ARESET_N_INVERTED => IS_AXI_24_ARESET_N_INVERTED_BIN,
        IS_AXI_25_ACLK_INVERTED => IS_AXI_25_ACLK_INVERTED_BIN,
        IS_AXI_25_ARESET_N_INVERTED => IS_AXI_25_ARESET_N_INVERTED_BIN,
        IS_AXI_26_ACLK_INVERTED => IS_AXI_26_ACLK_INVERTED_BIN,
        IS_AXI_26_ARESET_N_INVERTED => IS_AXI_26_ARESET_N_INVERTED_BIN,
        IS_AXI_27_ACLK_INVERTED => IS_AXI_27_ACLK_INVERTED_BIN,
        IS_AXI_27_ARESET_N_INVERTED => IS_AXI_27_ARESET_N_INVERTED_BIN,
        IS_AXI_28_ACLK_INVERTED => IS_AXI_28_ACLK_INVERTED_BIN,
        IS_AXI_28_ARESET_N_INVERTED => IS_AXI_28_ARESET_N_INVERTED_BIN,
        IS_AXI_29_ACLK_INVERTED => IS_AXI_29_ACLK_INVERTED_BIN,
        IS_AXI_29_ARESET_N_INVERTED => IS_AXI_29_ARESET_N_INVERTED_BIN,
        IS_AXI_30_ACLK_INVERTED => IS_AXI_30_ACLK_INVERTED_BIN,
        IS_AXI_30_ARESET_N_INVERTED => IS_AXI_30_ARESET_N_INVERTED_BIN,
        IS_AXI_31_ACLK_INVERTED => IS_AXI_31_ACLK_INVERTED_BIN,
        IS_AXI_31_ARESET_N_INVERTED => IS_AXI_31_ARESET_N_INVERTED_BIN,
        MC_CSSD_SEL_0        => MC_CSSD_SEL_0_BIN,
        MC_CSSD_SEL_1        => MC_CSSD_SEL_1_BIN,
        MC_CSSD_SEL_10       => MC_CSSD_SEL_10_BIN,
        MC_CSSD_SEL_11       => MC_CSSD_SEL_11_BIN,
        MC_CSSD_SEL_12       => MC_CSSD_SEL_12_BIN,
        MC_CSSD_SEL_13       => MC_CSSD_SEL_13_BIN,
        MC_CSSD_SEL_14       => MC_CSSD_SEL_14_BIN,
        MC_CSSD_SEL_15       => MC_CSSD_SEL_15_BIN,
        MC_CSSD_SEL_2        => MC_CSSD_SEL_2_BIN,
        MC_CSSD_SEL_3        => MC_CSSD_SEL_3_BIN,
        MC_CSSD_SEL_4        => MC_CSSD_SEL_4_BIN,
        MC_CSSD_SEL_5        => MC_CSSD_SEL_5_BIN,
        MC_CSSD_SEL_6        => MC_CSSD_SEL_6_BIN,
        MC_CSSD_SEL_7        => MC_CSSD_SEL_7_BIN,
        MC_CSSD_SEL_8        => MC_CSSD_SEL_8_BIN,
        MC_CSSD_SEL_9        => MC_CSSD_SEL_9_BIN,
        MC_ENABLE_00         => MC_ENABLE_00_BIN,
        MC_ENABLE_01         => MC_ENABLE_01_BIN,
        MC_ENABLE_02         => MC_ENABLE_02_BIN,
        MC_ENABLE_03         => MC_ENABLE_03_BIN,
        MC_ENABLE_04         => MC_ENABLE_04_BIN,
        MC_ENABLE_05         => MC_ENABLE_05_BIN,
        MC_ENABLE_06         => MC_ENABLE_06_BIN,
        MC_ENABLE_07         => MC_ENABLE_07_BIN,
        MC_ENABLE_08         => MC_ENABLE_08_BIN,
        MC_ENABLE_09         => MC_ENABLE_09_BIN,
        MC_ENABLE_10         => MC_ENABLE_10_BIN,
        MC_ENABLE_11         => MC_ENABLE_11_BIN,
        MC_ENABLE_12         => MC_ENABLE_12_BIN,
        MC_ENABLE_13         => MC_ENABLE_13_BIN,
        MC_ENABLE_14         => MC_ENABLE_14_BIN,
        MC_ENABLE_15         => MC_ENABLE_15_BIN,
        MC_ENABLE_APB_00     => MC_ENABLE_APB_00_BIN,
        MC_ENABLE_APB_01     => MC_ENABLE_APB_01_BIN,
        MC_TESTMODE_SEL_0    => MC_TESTMODE_SEL_0_BIN,
        MC_TESTMODE_SEL_1    => MC_TESTMODE_SEL_1_BIN,
        MC_TESTMODE_SEL_10   => MC_TESTMODE_SEL_10_BIN,
        MC_TESTMODE_SEL_11   => MC_TESTMODE_SEL_11_BIN,
        MC_TESTMODE_SEL_12   => MC_TESTMODE_SEL_12_BIN,
        MC_TESTMODE_SEL_13   => MC_TESTMODE_SEL_13_BIN,
        MC_TESTMODE_SEL_14   => MC_TESTMODE_SEL_14_BIN,
        MC_TESTMODE_SEL_15   => MC_TESTMODE_SEL_15_BIN,
        MC_TESTMODE_SEL_2    => MC_TESTMODE_SEL_2_BIN,
        MC_TESTMODE_SEL_3    => MC_TESTMODE_SEL_3_BIN,
        MC_TESTMODE_SEL_4    => MC_TESTMODE_SEL_4_BIN,
        MC_TESTMODE_SEL_5    => MC_TESTMODE_SEL_5_BIN,
        MC_TESTMODE_SEL_6    => MC_TESTMODE_SEL_6_BIN,
        MC_TESTMODE_SEL_7    => MC_TESTMODE_SEL_7_BIN,
        MC_TESTMODE_SEL_8    => MC_TESTMODE_SEL_8_BIN,
        MC_TESTMODE_SEL_9    => MC_TESTMODE_SEL_9_BIN,
        PAGEHIT_PERCENT_00   => PAGEHIT_PERCENT_00_BIN,
        PAGEHIT_PERCENT_01   => PAGEHIT_PERCENT_01_BIN,
        PHY_CSSD_SEL_0       => PHY_CSSD_SEL_0_BIN,
        PHY_CSSD_SEL_1       => PHY_CSSD_SEL_1_BIN,
        PHY_ENABLE_00        => PHY_ENABLE_00_BIN,
        PHY_ENABLE_01        => PHY_ENABLE_01_BIN,
        PHY_ENABLE_02        => PHY_ENABLE_02_BIN,
        PHY_ENABLE_03        => PHY_ENABLE_03_BIN,
        PHY_ENABLE_04        => PHY_ENABLE_04_BIN,
        PHY_ENABLE_05        => PHY_ENABLE_05_BIN,
        PHY_ENABLE_06        => PHY_ENABLE_06_BIN,
        PHY_ENABLE_07        => PHY_ENABLE_07_BIN,
        PHY_ENABLE_08        => PHY_ENABLE_08_BIN,
        PHY_ENABLE_09        => PHY_ENABLE_09_BIN,
        PHY_ENABLE_10        => PHY_ENABLE_10_BIN,
        PHY_ENABLE_11        => PHY_ENABLE_11_BIN,
        PHY_ENABLE_12        => PHY_ENABLE_12_BIN,
        PHY_ENABLE_13        => PHY_ENABLE_13_BIN,
        PHY_ENABLE_14        => PHY_ENABLE_14_BIN,
        PHY_ENABLE_15        => PHY_ENABLE_15_BIN,
        PHY_ENABLE_16        => PHY_ENABLE_16_BIN,
        PHY_ENABLE_17        => PHY_ENABLE_17_BIN,
        PHY_ENABLE_18        => PHY_ENABLE_18_BIN,
        PHY_ENABLE_19        => PHY_ENABLE_19_BIN,
        PHY_ENABLE_20        => PHY_ENABLE_20_BIN,
        PHY_ENABLE_21        => PHY_ENABLE_21_BIN,
        PHY_ENABLE_22        => PHY_ENABLE_22_BIN,
        PHY_ENABLE_23        => PHY_ENABLE_23_BIN,
        PHY_ENABLE_24        => PHY_ENABLE_24_BIN,
        PHY_ENABLE_25        => PHY_ENABLE_25_BIN,
        PHY_ENABLE_26        => PHY_ENABLE_26_BIN,
        PHY_ENABLE_27        => PHY_ENABLE_27_BIN,
        PHY_ENABLE_28        => PHY_ENABLE_28_BIN,
        PHY_ENABLE_29        => PHY_ENABLE_29_BIN,
        PHY_ENABLE_30        => PHY_ENABLE_30_BIN,
        PHY_ENABLE_31        => PHY_ENABLE_31_BIN,
        PHY_ENABLE_APB_00    => PHY_ENABLE_APB_00_BIN,
        PHY_ENABLE_APB_01    => PHY_ENABLE_APB_01_BIN,
        PHY_PCLK_INVERT_01   => PHY_PCLK_INVERT_01_BIN,
        PHY_PCLK_INVERT_02   => PHY_PCLK_INVERT_02_BIN,
        PHY_TESTMODE_SEL_0   => PHY_TESTMODE_SEL_0_BIN,
        PHY_TESTMODE_SEL_1   => PHY_TESTMODE_SEL_1_BIN,
        READ_PERCENT_00      => READ_PERCENT_00_BIN,
        READ_PERCENT_01      => READ_PERCENT_01_BIN,
        READ_PERCENT_02      => READ_PERCENT_02_BIN,
        READ_PERCENT_03      => READ_PERCENT_03_BIN,
        READ_PERCENT_04      => READ_PERCENT_04_BIN,
        READ_PERCENT_05      => READ_PERCENT_05_BIN,
        READ_PERCENT_06      => READ_PERCENT_06_BIN,
        READ_PERCENT_07      => READ_PERCENT_07_BIN,
        READ_PERCENT_08      => READ_PERCENT_08_BIN,
        READ_PERCENT_09      => READ_PERCENT_09_BIN,
        READ_PERCENT_10      => READ_PERCENT_10_BIN,
        READ_PERCENT_11      => READ_PERCENT_11_BIN,
        READ_PERCENT_12      => READ_PERCENT_12_BIN,
        READ_PERCENT_13      => READ_PERCENT_13_BIN,
        READ_PERCENT_14      => READ_PERCENT_14_BIN,
        READ_PERCENT_15      => READ_PERCENT_15_BIN,
        READ_PERCENT_16      => READ_PERCENT_16_BIN,
        READ_PERCENT_17      => READ_PERCENT_17_BIN,
        READ_PERCENT_18      => READ_PERCENT_18_BIN,
        READ_PERCENT_19      => READ_PERCENT_19_BIN,
        READ_PERCENT_20      => READ_PERCENT_20_BIN,
        READ_PERCENT_21      => READ_PERCENT_21_BIN,
        READ_PERCENT_22      => READ_PERCENT_22_BIN,
        READ_PERCENT_23      => READ_PERCENT_23_BIN,
        READ_PERCENT_24      => READ_PERCENT_24_BIN,
        READ_PERCENT_25      => READ_PERCENT_25_BIN,
        READ_PERCENT_26      => READ_PERCENT_26_BIN,
        READ_PERCENT_27      => READ_PERCENT_27_BIN,
        READ_PERCENT_28      => READ_PERCENT_28_BIN,
        READ_PERCENT_29      => READ_PERCENT_29_BIN,
        READ_PERCENT_30      => READ_PERCENT_30_BIN,
        READ_PERCENT_31      => READ_PERCENT_31_BIN,
        SWITCH_ENABLE_0      => SWITCH_ENABLE_0_BIN,
        SWITCH_ENABLE_00     => SWITCH_ENABLE_00_BIN,
        SWITCH_ENABLE_01     => SWITCH_ENABLE_01_BIN,
        SWITCH_ENABLE_1      => SWITCH_ENABLE_1_BIN,
        SW_TESTMODE_SEL_0    => SW_TESTMODE_SEL_0_BIN,
        SW_TESTMODE_SEL_1    => SW_TESTMODE_SEL_1_BIN,
        WRITE_PERCENT_00     => WRITE_PERCENT_00_BIN,
        WRITE_PERCENT_01     => WRITE_PERCENT_01_BIN,
        WRITE_PERCENT_02     => WRITE_PERCENT_02_BIN,
        WRITE_PERCENT_03     => WRITE_PERCENT_03_BIN,
        WRITE_PERCENT_04     => WRITE_PERCENT_04_BIN,
        WRITE_PERCENT_05     => WRITE_PERCENT_05_BIN,
        WRITE_PERCENT_06     => WRITE_PERCENT_06_BIN,
        WRITE_PERCENT_07     => WRITE_PERCENT_07_BIN,
        WRITE_PERCENT_08     => WRITE_PERCENT_08_BIN,
        WRITE_PERCENT_09     => WRITE_PERCENT_09_BIN,
        WRITE_PERCENT_10     => WRITE_PERCENT_10_BIN,
        WRITE_PERCENT_11     => WRITE_PERCENT_11_BIN,
        WRITE_PERCENT_12     => WRITE_PERCENT_12_BIN,
        WRITE_PERCENT_13     => WRITE_PERCENT_13_BIN,
        WRITE_PERCENT_14     => WRITE_PERCENT_14_BIN,
        WRITE_PERCENT_15     => WRITE_PERCENT_15_BIN,
        WRITE_PERCENT_16     => WRITE_PERCENT_16_BIN,
        WRITE_PERCENT_17     => WRITE_PERCENT_17_BIN,
        WRITE_PERCENT_18     => WRITE_PERCENT_18_BIN,
        WRITE_PERCENT_19     => WRITE_PERCENT_19_BIN,
        WRITE_PERCENT_20     => WRITE_PERCENT_20_BIN,
        WRITE_PERCENT_21     => WRITE_PERCENT_21_BIN,
        WRITE_PERCENT_22     => WRITE_PERCENT_22_BIN,
        WRITE_PERCENT_23     => WRITE_PERCENT_23_BIN,
        WRITE_PERCENT_24     => WRITE_PERCENT_24_BIN,
        WRITE_PERCENT_25     => WRITE_PERCENT_25_BIN,
        WRITE_PERCENT_26     => WRITE_PERCENT_26_BIN,
        WRITE_PERCENT_27     => WRITE_PERCENT_27_BIN,
        WRITE_PERCENT_28     => WRITE_PERCENT_28_BIN,
        WRITE_PERCENT_29     => WRITE_PERCENT_29_BIN,
        WRITE_PERCENT_30     => WRITE_PERCENT_30_BIN,
        WRITE_PERCENT_31     => WRITE_PERCENT_31_BIN,
        APB_0_PRDATA         => APB_0_PRDATA_out,
        APB_0_PREADY         => APB_0_PREADY_out,
        APB_0_PSLVERR        => APB_0_PSLVERR_out,
        APB_1_PRDATA         => APB_1_PRDATA_out,
        APB_1_PREADY         => APB_1_PREADY_out,
        APB_1_PSLVERR        => APB_1_PSLVERR_out,
        AXI_00_ARREADY       => AXI_00_ARREADY_out,
        AXI_00_AWREADY       => AXI_00_AWREADY_out,
        AXI_00_BID           => AXI_00_BID_out,
        AXI_00_BRESP         => AXI_00_BRESP_out,
        AXI_00_BVALID        => AXI_00_BVALID_out,
        AXI_00_DFI_AW_AERR_N => AXI_00_DFI_AW_AERR_N_out,
        AXI_00_DFI_CLK_BUF   => AXI_00_DFI_CLK_BUF_out,
        AXI_00_DFI_DBI_BYTE_DISABLE => AXI_00_DFI_DBI_BYTE_DISABLE_out,
        AXI_00_DFI_DW_RDDATA_DBI => AXI_00_DFI_DW_RDDATA_DBI_out,
        AXI_00_DFI_DW_RDDATA_DERR => AXI_00_DFI_DW_RDDATA_DERR_out,
        AXI_00_DFI_DW_RDDATA_VALID => AXI_00_DFI_DW_RDDATA_VALID_out,
        AXI_00_DFI_INIT_COMPLETE => AXI_00_DFI_INIT_COMPLETE_out,
        AXI_00_DFI_PHYUPD_REQ => AXI_00_DFI_PHYUPD_REQ_out,
        AXI_00_DFI_PHY_LP_STATE => AXI_00_DFI_PHY_LP_STATE_out,
        AXI_00_DFI_RST_N_BUF => AXI_00_DFI_RST_N_BUF_out,
        AXI_00_MC_STATUS     => AXI_00_MC_STATUS_out,
        AXI_00_PHY_STATUS    => AXI_00_PHY_STATUS_out,
        AXI_00_RDATA         => AXI_00_RDATA_out,
        AXI_00_RDATA_PARITY  => AXI_00_RDATA_PARITY_out,
        AXI_00_RID           => AXI_00_RID_out,
        AXI_00_RLAST         => AXI_00_RLAST_out,
        AXI_00_RRESP         => AXI_00_RRESP_out,
        AXI_00_RVALID        => AXI_00_RVALID_out,
        AXI_00_WREADY        => AXI_00_WREADY_out,
        AXI_01_ARREADY       => AXI_01_ARREADY_out,
        AXI_01_AWREADY       => AXI_01_AWREADY_out,
        AXI_01_BID           => AXI_01_BID_out,
        AXI_01_BRESP         => AXI_01_BRESP_out,
        AXI_01_BVALID        => AXI_01_BVALID_out,
        AXI_01_DFI_AW_AERR_N => AXI_01_DFI_AW_AERR_N_out,
        AXI_01_DFI_CLK_BUF   => AXI_01_DFI_CLK_BUF_out,
        AXI_01_DFI_DBI_BYTE_DISABLE => AXI_01_DFI_DBI_BYTE_DISABLE_out,
        AXI_01_DFI_DW_RDDATA_DBI => AXI_01_DFI_DW_RDDATA_DBI_out,
        AXI_01_DFI_DW_RDDATA_DERR => AXI_01_DFI_DW_RDDATA_DERR_out,
        AXI_01_DFI_DW_RDDATA_VALID => AXI_01_DFI_DW_RDDATA_VALID_out,
        AXI_01_DFI_INIT_COMPLETE => AXI_01_DFI_INIT_COMPLETE_out,
        AXI_01_DFI_PHYUPD_REQ => AXI_01_DFI_PHYUPD_REQ_out,
        AXI_01_DFI_PHY_LP_STATE => AXI_01_DFI_PHY_LP_STATE_out,
        AXI_01_DFI_RST_N_BUF => AXI_01_DFI_RST_N_BUF_out,
        AXI_01_RDATA         => AXI_01_RDATA_out,
        AXI_01_RDATA_PARITY  => AXI_01_RDATA_PARITY_out,
        AXI_01_RID           => AXI_01_RID_out,
        AXI_01_RLAST         => AXI_01_RLAST_out,
        AXI_01_RRESP         => AXI_01_RRESP_out,
        AXI_01_RVALID        => AXI_01_RVALID_out,
        AXI_01_WREADY        => AXI_01_WREADY_out,
        AXI_02_ARREADY       => AXI_02_ARREADY_out,
        AXI_02_AWREADY       => AXI_02_AWREADY_out,
        AXI_02_BID           => AXI_02_BID_out,
        AXI_02_BRESP         => AXI_02_BRESP_out,
        AXI_02_BVALID        => AXI_02_BVALID_out,
        AXI_02_DFI_AW_AERR_N => AXI_02_DFI_AW_AERR_N_out,
        AXI_02_DFI_CLK_BUF   => AXI_02_DFI_CLK_BUF_out,
        AXI_02_DFI_DBI_BYTE_DISABLE => AXI_02_DFI_DBI_BYTE_DISABLE_out,
        AXI_02_DFI_DW_RDDATA_DBI => AXI_02_DFI_DW_RDDATA_DBI_out,
        AXI_02_DFI_DW_RDDATA_DERR => AXI_02_DFI_DW_RDDATA_DERR_out,
        AXI_02_DFI_DW_RDDATA_VALID => AXI_02_DFI_DW_RDDATA_VALID_out,
        AXI_02_DFI_INIT_COMPLETE => AXI_02_DFI_INIT_COMPLETE_out,
        AXI_02_DFI_PHYUPD_REQ => AXI_02_DFI_PHYUPD_REQ_out,
        AXI_02_DFI_PHY_LP_STATE => AXI_02_DFI_PHY_LP_STATE_out,
        AXI_02_DFI_RST_N_BUF => AXI_02_DFI_RST_N_BUF_out,
        AXI_02_MC_STATUS     => AXI_02_MC_STATUS_out,
        AXI_02_PHY_STATUS    => AXI_02_PHY_STATUS_out,
        AXI_02_RDATA         => AXI_02_RDATA_out,
        AXI_02_RDATA_PARITY  => AXI_02_RDATA_PARITY_out,
        AXI_02_RID           => AXI_02_RID_out,
        AXI_02_RLAST         => AXI_02_RLAST_out,
        AXI_02_RRESP         => AXI_02_RRESP_out,
        AXI_02_RVALID        => AXI_02_RVALID_out,
        AXI_02_WREADY        => AXI_02_WREADY_out,
        AXI_03_ARREADY       => AXI_03_ARREADY_out,
        AXI_03_AWREADY       => AXI_03_AWREADY_out,
        AXI_03_BID           => AXI_03_BID_out,
        AXI_03_BRESP         => AXI_03_BRESP_out,
        AXI_03_BVALID        => AXI_03_BVALID_out,
        AXI_03_DFI_AW_AERR_N => AXI_03_DFI_AW_AERR_N_out,
        AXI_03_DFI_CLK_BUF   => AXI_03_DFI_CLK_BUF_out,
        AXI_03_DFI_DBI_BYTE_DISABLE => AXI_03_DFI_DBI_BYTE_DISABLE_out,
        AXI_03_DFI_DW_RDDATA_DBI => AXI_03_DFI_DW_RDDATA_DBI_out,
        AXI_03_DFI_DW_RDDATA_DERR => AXI_03_DFI_DW_RDDATA_DERR_out,
        AXI_03_DFI_DW_RDDATA_VALID => AXI_03_DFI_DW_RDDATA_VALID_out,
        AXI_03_DFI_INIT_COMPLETE => AXI_03_DFI_INIT_COMPLETE_out,
        AXI_03_DFI_PHYUPD_REQ => AXI_03_DFI_PHYUPD_REQ_out,
        AXI_03_DFI_PHY_LP_STATE => AXI_03_DFI_PHY_LP_STATE_out,
        AXI_03_DFI_RST_N_BUF => AXI_03_DFI_RST_N_BUF_out,
        AXI_03_RDATA         => AXI_03_RDATA_out,
        AXI_03_RDATA_PARITY  => AXI_03_RDATA_PARITY_out,
        AXI_03_RID           => AXI_03_RID_out,
        AXI_03_RLAST         => AXI_03_RLAST_out,
        AXI_03_RRESP         => AXI_03_RRESP_out,
        AXI_03_RVALID        => AXI_03_RVALID_out,
        AXI_03_WREADY        => AXI_03_WREADY_out,
        AXI_04_ARREADY       => AXI_04_ARREADY_out,
        AXI_04_AWREADY       => AXI_04_AWREADY_out,
        AXI_04_BID           => AXI_04_BID_out,
        AXI_04_BRESP         => AXI_04_BRESP_out,
        AXI_04_BVALID        => AXI_04_BVALID_out,
        AXI_04_DFI_AW_AERR_N => AXI_04_DFI_AW_AERR_N_out,
        AXI_04_DFI_CLK_BUF   => AXI_04_DFI_CLK_BUF_out,
        AXI_04_DFI_DBI_BYTE_DISABLE => AXI_04_DFI_DBI_BYTE_DISABLE_out,
        AXI_04_DFI_DW_RDDATA_DBI => AXI_04_DFI_DW_RDDATA_DBI_out,
        AXI_04_DFI_DW_RDDATA_DERR => AXI_04_DFI_DW_RDDATA_DERR_out,
        AXI_04_DFI_DW_RDDATA_VALID => AXI_04_DFI_DW_RDDATA_VALID_out,
        AXI_04_DFI_INIT_COMPLETE => AXI_04_DFI_INIT_COMPLETE_out,
        AXI_04_DFI_PHYUPD_REQ => AXI_04_DFI_PHYUPD_REQ_out,
        AXI_04_DFI_PHY_LP_STATE => AXI_04_DFI_PHY_LP_STATE_out,
        AXI_04_DFI_RST_N_BUF => AXI_04_DFI_RST_N_BUF_out,
        AXI_04_MC_STATUS     => AXI_04_MC_STATUS_out,
        AXI_04_PHY_STATUS    => AXI_04_PHY_STATUS_out,
        AXI_04_RDATA         => AXI_04_RDATA_out,
        AXI_04_RDATA_PARITY  => AXI_04_RDATA_PARITY_out,
        AXI_04_RID           => AXI_04_RID_out,
        AXI_04_RLAST         => AXI_04_RLAST_out,
        AXI_04_RRESP         => AXI_04_RRESP_out,
        AXI_04_RVALID        => AXI_04_RVALID_out,
        AXI_04_WREADY        => AXI_04_WREADY_out,
        AXI_05_ARREADY       => AXI_05_ARREADY_out,
        AXI_05_AWREADY       => AXI_05_AWREADY_out,
        AXI_05_BID           => AXI_05_BID_out,
        AXI_05_BRESP         => AXI_05_BRESP_out,
        AXI_05_BVALID        => AXI_05_BVALID_out,
        AXI_05_DFI_AW_AERR_N => AXI_05_DFI_AW_AERR_N_out,
        AXI_05_DFI_CLK_BUF   => AXI_05_DFI_CLK_BUF_out,
        AXI_05_DFI_DBI_BYTE_DISABLE => AXI_05_DFI_DBI_BYTE_DISABLE_out,
        AXI_05_DFI_DW_RDDATA_DBI => AXI_05_DFI_DW_RDDATA_DBI_out,
        AXI_05_DFI_DW_RDDATA_DERR => AXI_05_DFI_DW_RDDATA_DERR_out,
        AXI_05_DFI_DW_RDDATA_VALID => AXI_05_DFI_DW_RDDATA_VALID_out,
        AXI_05_DFI_INIT_COMPLETE => AXI_05_DFI_INIT_COMPLETE_out,
        AXI_05_DFI_PHYUPD_REQ => AXI_05_DFI_PHYUPD_REQ_out,
        AXI_05_DFI_PHY_LP_STATE => AXI_05_DFI_PHY_LP_STATE_out,
        AXI_05_DFI_RST_N_BUF => AXI_05_DFI_RST_N_BUF_out,
        AXI_05_RDATA         => AXI_05_RDATA_out,
        AXI_05_RDATA_PARITY  => AXI_05_RDATA_PARITY_out,
        AXI_05_RID           => AXI_05_RID_out,
        AXI_05_RLAST         => AXI_05_RLAST_out,
        AXI_05_RRESP         => AXI_05_RRESP_out,
        AXI_05_RVALID        => AXI_05_RVALID_out,
        AXI_05_WREADY        => AXI_05_WREADY_out,
        AXI_06_ARREADY       => AXI_06_ARREADY_out,
        AXI_06_AWREADY       => AXI_06_AWREADY_out,
        AXI_06_BID           => AXI_06_BID_out,
        AXI_06_BRESP         => AXI_06_BRESP_out,
        AXI_06_BVALID        => AXI_06_BVALID_out,
        AXI_06_DFI_AW_AERR_N => AXI_06_DFI_AW_AERR_N_out,
        AXI_06_DFI_CLK_BUF   => AXI_06_DFI_CLK_BUF_out,
        AXI_06_DFI_DBI_BYTE_DISABLE => AXI_06_DFI_DBI_BYTE_DISABLE_out,
        AXI_06_DFI_DW_RDDATA_DBI => AXI_06_DFI_DW_RDDATA_DBI_out,
        AXI_06_DFI_DW_RDDATA_DERR => AXI_06_DFI_DW_RDDATA_DERR_out,
        AXI_06_DFI_DW_RDDATA_VALID => AXI_06_DFI_DW_RDDATA_VALID_out,
        AXI_06_DFI_INIT_COMPLETE => AXI_06_DFI_INIT_COMPLETE_out,
        AXI_06_DFI_PHYUPD_REQ => AXI_06_DFI_PHYUPD_REQ_out,
        AXI_06_DFI_PHY_LP_STATE => AXI_06_DFI_PHY_LP_STATE_out,
        AXI_06_DFI_RST_N_BUF => AXI_06_DFI_RST_N_BUF_out,
        AXI_06_MC_STATUS     => AXI_06_MC_STATUS_out,
        AXI_06_PHY_STATUS    => AXI_06_PHY_STATUS_out,
        AXI_06_RDATA         => AXI_06_RDATA_out,
        AXI_06_RDATA_PARITY  => AXI_06_RDATA_PARITY_out,
        AXI_06_RID           => AXI_06_RID_out,
        AXI_06_RLAST         => AXI_06_RLAST_out,
        AXI_06_RRESP         => AXI_06_RRESP_out,
        AXI_06_RVALID        => AXI_06_RVALID_out,
        AXI_06_WREADY        => AXI_06_WREADY_out,
        AXI_07_ARREADY       => AXI_07_ARREADY_out,
        AXI_07_AWREADY       => AXI_07_AWREADY_out,
        AXI_07_BID           => AXI_07_BID_out,
        AXI_07_BRESP         => AXI_07_BRESP_out,
        AXI_07_BVALID        => AXI_07_BVALID_out,
        AXI_07_DFI_AW_AERR_N => AXI_07_DFI_AW_AERR_N_out,
        AXI_07_DFI_CLK_BUF   => AXI_07_DFI_CLK_BUF_out,
        AXI_07_DFI_DBI_BYTE_DISABLE => AXI_07_DFI_DBI_BYTE_DISABLE_out,
        AXI_07_DFI_DW_RDDATA_DBI => AXI_07_DFI_DW_RDDATA_DBI_out,
        AXI_07_DFI_DW_RDDATA_DERR => AXI_07_DFI_DW_RDDATA_DERR_out,
        AXI_07_DFI_DW_RDDATA_VALID => AXI_07_DFI_DW_RDDATA_VALID_out,
        AXI_07_DFI_INIT_COMPLETE => AXI_07_DFI_INIT_COMPLETE_out,
        AXI_07_DFI_PHYUPD_REQ => AXI_07_DFI_PHYUPD_REQ_out,
        AXI_07_DFI_PHY_LP_STATE => AXI_07_DFI_PHY_LP_STATE_out,
        AXI_07_DFI_RST_N_BUF => AXI_07_DFI_RST_N_BUF_out,
        AXI_07_RDATA         => AXI_07_RDATA_out,
        AXI_07_RDATA_PARITY  => AXI_07_RDATA_PARITY_out,
        AXI_07_RID           => AXI_07_RID_out,
        AXI_07_RLAST         => AXI_07_RLAST_out,
        AXI_07_RRESP         => AXI_07_RRESP_out,
        AXI_07_RVALID        => AXI_07_RVALID_out,
        AXI_07_WREADY        => AXI_07_WREADY_out,
        AXI_08_ARREADY       => AXI_08_ARREADY_out,
        AXI_08_AWREADY       => AXI_08_AWREADY_out,
        AXI_08_BID           => AXI_08_BID_out,
        AXI_08_BRESP         => AXI_08_BRESP_out,
        AXI_08_BVALID        => AXI_08_BVALID_out,
        AXI_08_DFI_AW_AERR_N => AXI_08_DFI_AW_AERR_N_out,
        AXI_08_DFI_CLK_BUF   => AXI_08_DFI_CLK_BUF_out,
        AXI_08_DFI_DBI_BYTE_DISABLE => AXI_08_DFI_DBI_BYTE_DISABLE_out,
        AXI_08_DFI_DW_RDDATA_DBI => AXI_08_DFI_DW_RDDATA_DBI_out,
        AXI_08_DFI_DW_RDDATA_DERR => AXI_08_DFI_DW_RDDATA_DERR_out,
        AXI_08_DFI_DW_RDDATA_VALID => AXI_08_DFI_DW_RDDATA_VALID_out,
        AXI_08_DFI_INIT_COMPLETE => AXI_08_DFI_INIT_COMPLETE_out,
        AXI_08_DFI_PHYUPD_REQ => AXI_08_DFI_PHYUPD_REQ_out,
        AXI_08_DFI_PHY_LP_STATE => AXI_08_DFI_PHY_LP_STATE_out,
        AXI_08_DFI_RST_N_BUF => AXI_08_DFI_RST_N_BUF_out,
        AXI_08_MC_STATUS     => AXI_08_MC_STATUS_out,
        AXI_08_PHY_STATUS    => AXI_08_PHY_STATUS_out,
        AXI_08_RDATA         => AXI_08_RDATA_out,
        AXI_08_RDATA_PARITY  => AXI_08_RDATA_PARITY_out,
        AXI_08_RID           => AXI_08_RID_out,
        AXI_08_RLAST         => AXI_08_RLAST_out,
        AXI_08_RRESP         => AXI_08_RRESP_out,
        AXI_08_RVALID        => AXI_08_RVALID_out,
        AXI_08_WREADY        => AXI_08_WREADY_out,
        AXI_09_ARREADY       => AXI_09_ARREADY_out,
        AXI_09_AWREADY       => AXI_09_AWREADY_out,
        AXI_09_BID           => AXI_09_BID_out,
        AXI_09_BRESP         => AXI_09_BRESP_out,
        AXI_09_BVALID        => AXI_09_BVALID_out,
        AXI_09_DFI_AW_AERR_N => AXI_09_DFI_AW_AERR_N_out,
        AXI_09_DFI_CLK_BUF   => AXI_09_DFI_CLK_BUF_out,
        AXI_09_DFI_DBI_BYTE_DISABLE => AXI_09_DFI_DBI_BYTE_DISABLE_out,
        AXI_09_DFI_DW_RDDATA_DBI => AXI_09_DFI_DW_RDDATA_DBI_out,
        AXI_09_DFI_DW_RDDATA_DERR => AXI_09_DFI_DW_RDDATA_DERR_out,
        AXI_09_DFI_DW_RDDATA_VALID => AXI_09_DFI_DW_RDDATA_VALID_out,
        AXI_09_DFI_INIT_COMPLETE => AXI_09_DFI_INIT_COMPLETE_out,
        AXI_09_DFI_PHYUPD_REQ => AXI_09_DFI_PHYUPD_REQ_out,
        AXI_09_DFI_PHY_LP_STATE => AXI_09_DFI_PHY_LP_STATE_out,
        AXI_09_DFI_RST_N_BUF => AXI_09_DFI_RST_N_BUF_out,
        AXI_09_RDATA         => AXI_09_RDATA_out,
        AXI_09_RDATA_PARITY  => AXI_09_RDATA_PARITY_out,
        AXI_09_RID           => AXI_09_RID_out,
        AXI_09_RLAST         => AXI_09_RLAST_out,
        AXI_09_RRESP         => AXI_09_RRESP_out,
        AXI_09_RVALID        => AXI_09_RVALID_out,
        AXI_09_WREADY        => AXI_09_WREADY_out,
        AXI_10_ARREADY       => AXI_10_ARREADY_out,
        AXI_10_AWREADY       => AXI_10_AWREADY_out,
        AXI_10_BID           => AXI_10_BID_out,
        AXI_10_BRESP         => AXI_10_BRESP_out,
        AXI_10_BVALID        => AXI_10_BVALID_out,
        AXI_10_DFI_AW_AERR_N => AXI_10_DFI_AW_AERR_N_out,
        AXI_10_DFI_CLK_BUF   => AXI_10_DFI_CLK_BUF_out,
        AXI_10_DFI_DBI_BYTE_DISABLE => AXI_10_DFI_DBI_BYTE_DISABLE_out,
        AXI_10_DFI_DW_RDDATA_DBI => AXI_10_DFI_DW_RDDATA_DBI_out,
        AXI_10_DFI_DW_RDDATA_DERR => AXI_10_DFI_DW_RDDATA_DERR_out,
        AXI_10_DFI_DW_RDDATA_VALID => AXI_10_DFI_DW_RDDATA_VALID_out,
        AXI_10_DFI_INIT_COMPLETE => AXI_10_DFI_INIT_COMPLETE_out,
        AXI_10_DFI_PHYUPD_REQ => AXI_10_DFI_PHYUPD_REQ_out,
        AXI_10_DFI_PHY_LP_STATE => AXI_10_DFI_PHY_LP_STATE_out,
        AXI_10_DFI_RST_N_BUF => AXI_10_DFI_RST_N_BUF_out,
        AXI_10_MC_STATUS     => AXI_10_MC_STATUS_out,
        AXI_10_PHY_STATUS    => AXI_10_PHY_STATUS_out,
        AXI_10_RDATA         => AXI_10_RDATA_out,
        AXI_10_RDATA_PARITY  => AXI_10_RDATA_PARITY_out,
        AXI_10_RID           => AXI_10_RID_out,
        AXI_10_RLAST         => AXI_10_RLAST_out,
        AXI_10_RRESP         => AXI_10_RRESP_out,
        AXI_10_RVALID        => AXI_10_RVALID_out,
        AXI_10_WREADY        => AXI_10_WREADY_out,
        AXI_11_ARREADY       => AXI_11_ARREADY_out,
        AXI_11_AWREADY       => AXI_11_AWREADY_out,
        AXI_11_BID           => AXI_11_BID_out,
        AXI_11_BRESP         => AXI_11_BRESP_out,
        AXI_11_BVALID        => AXI_11_BVALID_out,
        AXI_11_DFI_AW_AERR_N => AXI_11_DFI_AW_AERR_N_out,
        AXI_11_DFI_CLK_BUF   => AXI_11_DFI_CLK_BUF_out,
        AXI_11_DFI_DBI_BYTE_DISABLE => AXI_11_DFI_DBI_BYTE_DISABLE_out,
        AXI_11_DFI_DW_RDDATA_DBI => AXI_11_DFI_DW_RDDATA_DBI_out,
        AXI_11_DFI_DW_RDDATA_DERR => AXI_11_DFI_DW_RDDATA_DERR_out,
        AXI_11_DFI_DW_RDDATA_VALID => AXI_11_DFI_DW_RDDATA_VALID_out,
        AXI_11_DFI_INIT_COMPLETE => AXI_11_DFI_INIT_COMPLETE_out,
        AXI_11_DFI_PHYUPD_REQ => AXI_11_DFI_PHYUPD_REQ_out,
        AXI_11_DFI_PHY_LP_STATE => AXI_11_DFI_PHY_LP_STATE_out,
        AXI_11_DFI_RST_N_BUF => AXI_11_DFI_RST_N_BUF_out,
        AXI_11_RDATA         => AXI_11_RDATA_out,
        AXI_11_RDATA_PARITY  => AXI_11_RDATA_PARITY_out,
        AXI_11_RID           => AXI_11_RID_out,
        AXI_11_RLAST         => AXI_11_RLAST_out,
        AXI_11_RRESP         => AXI_11_RRESP_out,
        AXI_11_RVALID        => AXI_11_RVALID_out,
        AXI_11_WREADY        => AXI_11_WREADY_out,
        AXI_12_ARREADY       => AXI_12_ARREADY_out,
        AXI_12_AWREADY       => AXI_12_AWREADY_out,
        AXI_12_BID           => AXI_12_BID_out,
        AXI_12_BRESP         => AXI_12_BRESP_out,
        AXI_12_BVALID        => AXI_12_BVALID_out,
        AXI_12_DFI_AW_AERR_N => AXI_12_DFI_AW_AERR_N_out,
        AXI_12_DFI_CLK_BUF   => AXI_12_DFI_CLK_BUF_out,
        AXI_12_DFI_DBI_BYTE_DISABLE => AXI_12_DFI_DBI_BYTE_DISABLE_out,
        AXI_12_DFI_DW_RDDATA_DBI => AXI_12_DFI_DW_RDDATA_DBI_out,
        AXI_12_DFI_DW_RDDATA_DERR => AXI_12_DFI_DW_RDDATA_DERR_out,
        AXI_12_DFI_DW_RDDATA_VALID => AXI_12_DFI_DW_RDDATA_VALID_out,
        AXI_12_DFI_INIT_COMPLETE => AXI_12_DFI_INIT_COMPLETE_out,
        AXI_12_DFI_PHYUPD_REQ => AXI_12_DFI_PHYUPD_REQ_out,
        AXI_12_DFI_PHY_LP_STATE => AXI_12_DFI_PHY_LP_STATE_out,
        AXI_12_DFI_RST_N_BUF => AXI_12_DFI_RST_N_BUF_out,
        AXI_12_MC_STATUS     => AXI_12_MC_STATUS_out,
        AXI_12_PHY_STATUS    => AXI_12_PHY_STATUS_out,
        AXI_12_RDATA         => AXI_12_RDATA_out,
        AXI_12_RDATA_PARITY  => AXI_12_RDATA_PARITY_out,
        AXI_12_RID           => AXI_12_RID_out,
        AXI_12_RLAST         => AXI_12_RLAST_out,
        AXI_12_RRESP         => AXI_12_RRESP_out,
        AXI_12_RVALID        => AXI_12_RVALID_out,
        AXI_12_WREADY        => AXI_12_WREADY_out,
        AXI_13_ARREADY       => AXI_13_ARREADY_out,
        AXI_13_AWREADY       => AXI_13_AWREADY_out,
        AXI_13_BID           => AXI_13_BID_out,
        AXI_13_BRESP         => AXI_13_BRESP_out,
        AXI_13_BVALID        => AXI_13_BVALID_out,
        AXI_13_DFI_AW_AERR_N => AXI_13_DFI_AW_AERR_N_out,
        AXI_13_DFI_CLK_BUF   => AXI_13_DFI_CLK_BUF_out,
        AXI_13_DFI_DBI_BYTE_DISABLE => AXI_13_DFI_DBI_BYTE_DISABLE_out,
        AXI_13_DFI_DW_RDDATA_DBI => AXI_13_DFI_DW_RDDATA_DBI_out,
        AXI_13_DFI_DW_RDDATA_DERR => AXI_13_DFI_DW_RDDATA_DERR_out,
        AXI_13_DFI_DW_RDDATA_VALID => AXI_13_DFI_DW_RDDATA_VALID_out,
        AXI_13_DFI_INIT_COMPLETE => AXI_13_DFI_INIT_COMPLETE_out,
        AXI_13_DFI_PHYUPD_REQ => AXI_13_DFI_PHYUPD_REQ_out,
        AXI_13_DFI_PHY_LP_STATE => AXI_13_DFI_PHY_LP_STATE_out,
        AXI_13_DFI_RST_N_BUF => AXI_13_DFI_RST_N_BUF_out,
        AXI_13_RDATA         => AXI_13_RDATA_out,
        AXI_13_RDATA_PARITY  => AXI_13_RDATA_PARITY_out,
        AXI_13_RID           => AXI_13_RID_out,
        AXI_13_RLAST         => AXI_13_RLAST_out,
        AXI_13_RRESP         => AXI_13_RRESP_out,
        AXI_13_RVALID        => AXI_13_RVALID_out,
        AXI_13_WREADY        => AXI_13_WREADY_out,
        AXI_14_ARREADY       => AXI_14_ARREADY_out,
        AXI_14_AWREADY       => AXI_14_AWREADY_out,
        AXI_14_BID           => AXI_14_BID_out,
        AXI_14_BRESP         => AXI_14_BRESP_out,
        AXI_14_BVALID        => AXI_14_BVALID_out,
        AXI_14_DFI_AW_AERR_N => AXI_14_DFI_AW_AERR_N_out,
        AXI_14_DFI_CLK_BUF   => AXI_14_DFI_CLK_BUF_out,
        AXI_14_DFI_DBI_BYTE_DISABLE => AXI_14_DFI_DBI_BYTE_DISABLE_out,
        AXI_14_DFI_DW_RDDATA_DBI => AXI_14_DFI_DW_RDDATA_DBI_out,
        AXI_14_DFI_DW_RDDATA_DERR => AXI_14_DFI_DW_RDDATA_DERR_out,
        AXI_14_DFI_DW_RDDATA_VALID => AXI_14_DFI_DW_RDDATA_VALID_out,
        AXI_14_DFI_INIT_COMPLETE => AXI_14_DFI_INIT_COMPLETE_out,
        AXI_14_DFI_PHYUPD_REQ => AXI_14_DFI_PHYUPD_REQ_out,
        AXI_14_DFI_PHY_LP_STATE => AXI_14_DFI_PHY_LP_STATE_out,
        AXI_14_DFI_RST_N_BUF => AXI_14_DFI_RST_N_BUF_out,
        AXI_14_MC_STATUS     => AXI_14_MC_STATUS_out,
        AXI_14_PHY_STATUS    => AXI_14_PHY_STATUS_out,
        AXI_14_RDATA         => AXI_14_RDATA_out,
        AXI_14_RDATA_PARITY  => AXI_14_RDATA_PARITY_out,
        AXI_14_RID           => AXI_14_RID_out,
        AXI_14_RLAST         => AXI_14_RLAST_out,
        AXI_14_RRESP         => AXI_14_RRESP_out,
        AXI_14_RVALID        => AXI_14_RVALID_out,
        AXI_14_WREADY        => AXI_14_WREADY_out,
        AXI_15_ARREADY       => AXI_15_ARREADY_out,
        AXI_15_AWREADY       => AXI_15_AWREADY_out,
        AXI_15_BID           => AXI_15_BID_out,
        AXI_15_BRESP         => AXI_15_BRESP_out,
        AXI_15_BVALID        => AXI_15_BVALID_out,
        AXI_15_DFI_AW_AERR_N => AXI_15_DFI_AW_AERR_N_out,
        AXI_15_DFI_CLK_BUF   => AXI_15_DFI_CLK_BUF_out,
        AXI_15_DFI_DBI_BYTE_DISABLE => AXI_15_DFI_DBI_BYTE_DISABLE_out,
        AXI_15_DFI_DW_RDDATA_DBI => AXI_15_DFI_DW_RDDATA_DBI_out,
        AXI_15_DFI_DW_RDDATA_DERR => AXI_15_DFI_DW_RDDATA_DERR_out,
        AXI_15_DFI_DW_RDDATA_VALID => AXI_15_DFI_DW_RDDATA_VALID_out,
        AXI_15_DFI_INIT_COMPLETE => AXI_15_DFI_INIT_COMPLETE_out,
        AXI_15_DFI_PHYUPD_REQ => AXI_15_DFI_PHYUPD_REQ_out,
        AXI_15_DFI_PHY_LP_STATE => AXI_15_DFI_PHY_LP_STATE_out,
        AXI_15_DFI_RST_N_BUF => AXI_15_DFI_RST_N_BUF_out,
        AXI_15_RDATA         => AXI_15_RDATA_out,
        AXI_15_RDATA_PARITY  => AXI_15_RDATA_PARITY_out,
        AXI_15_RID           => AXI_15_RID_out,
        AXI_15_RLAST         => AXI_15_RLAST_out,
        AXI_15_RRESP         => AXI_15_RRESP_out,
        AXI_15_RVALID        => AXI_15_RVALID_out,
        AXI_15_WREADY        => AXI_15_WREADY_out,
        AXI_16_ARREADY       => AXI_16_ARREADY_out,
        AXI_16_AWREADY       => AXI_16_AWREADY_out,
        AXI_16_BID           => AXI_16_BID_out,
        AXI_16_BRESP         => AXI_16_BRESP_out,
        AXI_16_BVALID        => AXI_16_BVALID_out,
        AXI_16_DFI_AW_AERR_N => AXI_16_DFI_AW_AERR_N_out,
        AXI_16_DFI_CLK_BUF   => AXI_16_DFI_CLK_BUF_out,
        AXI_16_DFI_DBI_BYTE_DISABLE => AXI_16_DFI_DBI_BYTE_DISABLE_out,
        AXI_16_DFI_DW_RDDATA_DBI => AXI_16_DFI_DW_RDDATA_DBI_out,
        AXI_16_DFI_DW_RDDATA_DERR => AXI_16_DFI_DW_RDDATA_DERR_out,
        AXI_16_DFI_DW_RDDATA_VALID => AXI_16_DFI_DW_RDDATA_VALID_out,
        AXI_16_DFI_INIT_COMPLETE => AXI_16_DFI_INIT_COMPLETE_out,
        AXI_16_DFI_PHYUPD_REQ => AXI_16_DFI_PHYUPD_REQ_out,
        AXI_16_DFI_PHY_LP_STATE => AXI_16_DFI_PHY_LP_STATE_out,
        AXI_16_DFI_RST_N_BUF => AXI_16_DFI_RST_N_BUF_out,
        AXI_16_MC_STATUS     => AXI_16_MC_STATUS_out,
        AXI_16_PHY_STATUS    => AXI_16_PHY_STATUS_out,
        AXI_16_RDATA         => AXI_16_RDATA_out,
        AXI_16_RDATA_PARITY  => AXI_16_RDATA_PARITY_out,
        AXI_16_RID           => AXI_16_RID_out,
        AXI_16_RLAST         => AXI_16_RLAST_out,
        AXI_16_RRESP         => AXI_16_RRESP_out,
        AXI_16_RVALID        => AXI_16_RVALID_out,
        AXI_16_WREADY        => AXI_16_WREADY_out,
        AXI_17_ARREADY       => AXI_17_ARREADY_out,
        AXI_17_AWREADY       => AXI_17_AWREADY_out,
        AXI_17_BID           => AXI_17_BID_out,
        AXI_17_BRESP         => AXI_17_BRESP_out,
        AXI_17_BVALID        => AXI_17_BVALID_out,
        AXI_17_DFI_AW_AERR_N => AXI_17_DFI_AW_AERR_N_out,
        AXI_17_DFI_CLK_BUF   => AXI_17_DFI_CLK_BUF_out,
        AXI_17_DFI_DBI_BYTE_DISABLE => AXI_17_DFI_DBI_BYTE_DISABLE_out,
        AXI_17_DFI_DW_RDDATA_DBI => AXI_17_DFI_DW_RDDATA_DBI_out,
        AXI_17_DFI_DW_RDDATA_DERR => AXI_17_DFI_DW_RDDATA_DERR_out,
        AXI_17_DFI_DW_RDDATA_VALID => AXI_17_DFI_DW_RDDATA_VALID_out,
        AXI_17_DFI_INIT_COMPLETE => AXI_17_DFI_INIT_COMPLETE_out,
        AXI_17_DFI_PHYUPD_REQ => AXI_17_DFI_PHYUPD_REQ_out,
        AXI_17_DFI_PHY_LP_STATE => AXI_17_DFI_PHY_LP_STATE_out,
        AXI_17_DFI_RST_N_BUF => AXI_17_DFI_RST_N_BUF_out,
        AXI_17_RDATA         => AXI_17_RDATA_out,
        AXI_17_RDATA_PARITY  => AXI_17_RDATA_PARITY_out,
        AXI_17_RID           => AXI_17_RID_out,
        AXI_17_RLAST         => AXI_17_RLAST_out,
        AXI_17_RRESP         => AXI_17_RRESP_out,
        AXI_17_RVALID        => AXI_17_RVALID_out,
        AXI_17_WREADY        => AXI_17_WREADY_out,
        AXI_18_ARREADY       => AXI_18_ARREADY_out,
        AXI_18_AWREADY       => AXI_18_AWREADY_out,
        AXI_18_BID           => AXI_18_BID_out,
        AXI_18_BRESP         => AXI_18_BRESP_out,
        AXI_18_BVALID        => AXI_18_BVALID_out,
        AXI_18_DFI_AW_AERR_N => AXI_18_DFI_AW_AERR_N_out,
        AXI_18_DFI_CLK_BUF   => AXI_18_DFI_CLK_BUF_out,
        AXI_18_DFI_DBI_BYTE_DISABLE => AXI_18_DFI_DBI_BYTE_DISABLE_out,
        AXI_18_DFI_DW_RDDATA_DBI => AXI_18_DFI_DW_RDDATA_DBI_out,
        AXI_18_DFI_DW_RDDATA_DERR => AXI_18_DFI_DW_RDDATA_DERR_out,
        AXI_18_DFI_DW_RDDATA_VALID => AXI_18_DFI_DW_RDDATA_VALID_out,
        AXI_18_DFI_INIT_COMPLETE => AXI_18_DFI_INIT_COMPLETE_out,
        AXI_18_DFI_PHYUPD_REQ => AXI_18_DFI_PHYUPD_REQ_out,
        AXI_18_DFI_PHY_LP_STATE => AXI_18_DFI_PHY_LP_STATE_out,
        AXI_18_DFI_RST_N_BUF => AXI_18_DFI_RST_N_BUF_out,
        AXI_18_MC_STATUS     => AXI_18_MC_STATUS_out,
        AXI_18_PHY_STATUS    => AXI_18_PHY_STATUS_out,
        AXI_18_RDATA         => AXI_18_RDATA_out,
        AXI_18_RDATA_PARITY  => AXI_18_RDATA_PARITY_out,
        AXI_18_RID           => AXI_18_RID_out,
        AXI_18_RLAST         => AXI_18_RLAST_out,
        AXI_18_RRESP         => AXI_18_RRESP_out,
        AXI_18_RVALID        => AXI_18_RVALID_out,
        AXI_18_WREADY        => AXI_18_WREADY_out,
        AXI_19_ARREADY       => AXI_19_ARREADY_out,
        AXI_19_AWREADY       => AXI_19_AWREADY_out,
        AXI_19_BID           => AXI_19_BID_out,
        AXI_19_BRESP         => AXI_19_BRESP_out,
        AXI_19_BVALID        => AXI_19_BVALID_out,
        AXI_19_DFI_AW_AERR_N => AXI_19_DFI_AW_AERR_N_out,
        AXI_19_DFI_CLK_BUF   => AXI_19_DFI_CLK_BUF_out,
        AXI_19_DFI_DBI_BYTE_DISABLE => AXI_19_DFI_DBI_BYTE_DISABLE_out,
        AXI_19_DFI_DW_RDDATA_DBI => AXI_19_DFI_DW_RDDATA_DBI_out,
        AXI_19_DFI_DW_RDDATA_DERR => AXI_19_DFI_DW_RDDATA_DERR_out,
        AXI_19_DFI_DW_RDDATA_VALID => AXI_19_DFI_DW_RDDATA_VALID_out,
        AXI_19_DFI_INIT_COMPLETE => AXI_19_DFI_INIT_COMPLETE_out,
        AXI_19_DFI_PHYUPD_REQ => AXI_19_DFI_PHYUPD_REQ_out,
        AXI_19_DFI_PHY_LP_STATE => AXI_19_DFI_PHY_LP_STATE_out,
        AXI_19_DFI_RST_N_BUF => AXI_19_DFI_RST_N_BUF_out,
        AXI_19_RDATA         => AXI_19_RDATA_out,
        AXI_19_RDATA_PARITY  => AXI_19_RDATA_PARITY_out,
        AXI_19_RID           => AXI_19_RID_out,
        AXI_19_RLAST         => AXI_19_RLAST_out,
        AXI_19_RRESP         => AXI_19_RRESP_out,
        AXI_19_RVALID        => AXI_19_RVALID_out,
        AXI_19_WREADY        => AXI_19_WREADY_out,
        AXI_20_ARREADY       => AXI_20_ARREADY_out,
        AXI_20_AWREADY       => AXI_20_AWREADY_out,
        AXI_20_BID           => AXI_20_BID_out,
        AXI_20_BRESP         => AXI_20_BRESP_out,
        AXI_20_BVALID        => AXI_20_BVALID_out,
        AXI_20_DFI_AW_AERR_N => AXI_20_DFI_AW_AERR_N_out,
        AXI_20_DFI_CLK_BUF   => AXI_20_DFI_CLK_BUF_out,
        AXI_20_DFI_DBI_BYTE_DISABLE => AXI_20_DFI_DBI_BYTE_DISABLE_out,
        AXI_20_DFI_DW_RDDATA_DBI => AXI_20_DFI_DW_RDDATA_DBI_out,
        AXI_20_DFI_DW_RDDATA_DERR => AXI_20_DFI_DW_RDDATA_DERR_out,
        AXI_20_DFI_DW_RDDATA_VALID => AXI_20_DFI_DW_RDDATA_VALID_out,
        AXI_20_DFI_INIT_COMPLETE => AXI_20_DFI_INIT_COMPLETE_out,
        AXI_20_DFI_PHYUPD_REQ => AXI_20_DFI_PHYUPD_REQ_out,
        AXI_20_DFI_PHY_LP_STATE => AXI_20_DFI_PHY_LP_STATE_out,
        AXI_20_DFI_RST_N_BUF => AXI_20_DFI_RST_N_BUF_out,
        AXI_20_MC_STATUS     => AXI_20_MC_STATUS_out,
        AXI_20_PHY_STATUS    => AXI_20_PHY_STATUS_out,
        AXI_20_RDATA         => AXI_20_RDATA_out,
        AXI_20_RDATA_PARITY  => AXI_20_RDATA_PARITY_out,
        AXI_20_RID           => AXI_20_RID_out,
        AXI_20_RLAST         => AXI_20_RLAST_out,
        AXI_20_RRESP         => AXI_20_RRESP_out,
        AXI_20_RVALID        => AXI_20_RVALID_out,
        AXI_20_WREADY        => AXI_20_WREADY_out,
        AXI_21_ARREADY       => AXI_21_ARREADY_out,
        AXI_21_AWREADY       => AXI_21_AWREADY_out,
        AXI_21_BID           => AXI_21_BID_out,
        AXI_21_BRESP         => AXI_21_BRESP_out,
        AXI_21_BVALID        => AXI_21_BVALID_out,
        AXI_21_DFI_AW_AERR_N => AXI_21_DFI_AW_AERR_N_out,
        AXI_21_DFI_CLK_BUF   => AXI_21_DFI_CLK_BUF_out,
        AXI_21_DFI_DBI_BYTE_DISABLE => AXI_21_DFI_DBI_BYTE_DISABLE_out,
        AXI_21_DFI_DW_RDDATA_DBI => AXI_21_DFI_DW_RDDATA_DBI_out,
        AXI_21_DFI_DW_RDDATA_DERR => AXI_21_DFI_DW_RDDATA_DERR_out,
        AXI_21_DFI_DW_RDDATA_VALID => AXI_21_DFI_DW_RDDATA_VALID_out,
        AXI_21_DFI_INIT_COMPLETE => AXI_21_DFI_INIT_COMPLETE_out,
        AXI_21_DFI_PHYUPD_REQ => AXI_21_DFI_PHYUPD_REQ_out,
        AXI_21_DFI_PHY_LP_STATE => AXI_21_DFI_PHY_LP_STATE_out,
        AXI_21_DFI_RST_N_BUF => AXI_21_DFI_RST_N_BUF_out,
        AXI_21_RDATA         => AXI_21_RDATA_out,
        AXI_21_RDATA_PARITY  => AXI_21_RDATA_PARITY_out,
        AXI_21_RID           => AXI_21_RID_out,
        AXI_21_RLAST         => AXI_21_RLAST_out,
        AXI_21_RRESP         => AXI_21_RRESP_out,
        AXI_21_RVALID        => AXI_21_RVALID_out,
        AXI_21_WREADY        => AXI_21_WREADY_out,
        AXI_22_ARREADY       => AXI_22_ARREADY_out,
        AXI_22_AWREADY       => AXI_22_AWREADY_out,
        AXI_22_BID           => AXI_22_BID_out,
        AXI_22_BRESP         => AXI_22_BRESP_out,
        AXI_22_BVALID        => AXI_22_BVALID_out,
        AXI_22_DFI_AW_AERR_N => AXI_22_DFI_AW_AERR_N_out,
        AXI_22_DFI_CLK_BUF   => AXI_22_DFI_CLK_BUF_out,
        AXI_22_DFI_DBI_BYTE_DISABLE => AXI_22_DFI_DBI_BYTE_DISABLE_out,
        AXI_22_DFI_DW_RDDATA_DBI => AXI_22_DFI_DW_RDDATA_DBI_out,
        AXI_22_DFI_DW_RDDATA_DERR => AXI_22_DFI_DW_RDDATA_DERR_out,
        AXI_22_DFI_DW_RDDATA_VALID => AXI_22_DFI_DW_RDDATA_VALID_out,
        AXI_22_DFI_INIT_COMPLETE => AXI_22_DFI_INIT_COMPLETE_out,
        AXI_22_DFI_PHYUPD_REQ => AXI_22_DFI_PHYUPD_REQ_out,
        AXI_22_DFI_PHY_LP_STATE => AXI_22_DFI_PHY_LP_STATE_out,
        AXI_22_DFI_RST_N_BUF => AXI_22_DFI_RST_N_BUF_out,
        AXI_22_MC_STATUS     => AXI_22_MC_STATUS_out,
        AXI_22_PHY_STATUS    => AXI_22_PHY_STATUS_out,
        AXI_22_RDATA         => AXI_22_RDATA_out,
        AXI_22_RDATA_PARITY  => AXI_22_RDATA_PARITY_out,
        AXI_22_RID           => AXI_22_RID_out,
        AXI_22_RLAST         => AXI_22_RLAST_out,
        AXI_22_RRESP         => AXI_22_RRESP_out,
        AXI_22_RVALID        => AXI_22_RVALID_out,
        AXI_22_WREADY        => AXI_22_WREADY_out,
        AXI_23_ARREADY       => AXI_23_ARREADY_out,
        AXI_23_AWREADY       => AXI_23_AWREADY_out,
        AXI_23_BID           => AXI_23_BID_out,
        AXI_23_BRESP         => AXI_23_BRESP_out,
        AXI_23_BVALID        => AXI_23_BVALID_out,
        AXI_23_DFI_AW_AERR_N => AXI_23_DFI_AW_AERR_N_out,
        AXI_23_DFI_CLK_BUF   => AXI_23_DFI_CLK_BUF_out,
        AXI_23_DFI_DBI_BYTE_DISABLE => AXI_23_DFI_DBI_BYTE_DISABLE_out,
        AXI_23_DFI_DW_RDDATA_DBI => AXI_23_DFI_DW_RDDATA_DBI_out,
        AXI_23_DFI_DW_RDDATA_DERR => AXI_23_DFI_DW_RDDATA_DERR_out,
        AXI_23_DFI_DW_RDDATA_VALID => AXI_23_DFI_DW_RDDATA_VALID_out,
        AXI_23_DFI_INIT_COMPLETE => AXI_23_DFI_INIT_COMPLETE_out,
        AXI_23_DFI_PHYUPD_REQ => AXI_23_DFI_PHYUPD_REQ_out,
        AXI_23_DFI_PHY_LP_STATE => AXI_23_DFI_PHY_LP_STATE_out,
        AXI_23_DFI_RST_N_BUF => AXI_23_DFI_RST_N_BUF_out,
        AXI_23_RDATA         => AXI_23_RDATA_out,
        AXI_23_RDATA_PARITY  => AXI_23_RDATA_PARITY_out,
        AXI_23_RID           => AXI_23_RID_out,
        AXI_23_RLAST         => AXI_23_RLAST_out,
        AXI_23_RRESP         => AXI_23_RRESP_out,
        AXI_23_RVALID        => AXI_23_RVALID_out,
        AXI_23_WREADY        => AXI_23_WREADY_out,
        AXI_24_ARREADY       => AXI_24_ARREADY_out,
        AXI_24_AWREADY       => AXI_24_AWREADY_out,
        AXI_24_BID           => AXI_24_BID_out,
        AXI_24_BRESP         => AXI_24_BRESP_out,
        AXI_24_BVALID        => AXI_24_BVALID_out,
        AXI_24_DFI_AW_AERR_N => AXI_24_DFI_AW_AERR_N_out,
        AXI_24_DFI_CLK_BUF   => AXI_24_DFI_CLK_BUF_out,
        AXI_24_DFI_DBI_BYTE_DISABLE => AXI_24_DFI_DBI_BYTE_DISABLE_out,
        AXI_24_DFI_DW_RDDATA_DBI => AXI_24_DFI_DW_RDDATA_DBI_out,
        AXI_24_DFI_DW_RDDATA_DERR => AXI_24_DFI_DW_RDDATA_DERR_out,
        AXI_24_DFI_DW_RDDATA_VALID => AXI_24_DFI_DW_RDDATA_VALID_out,
        AXI_24_DFI_INIT_COMPLETE => AXI_24_DFI_INIT_COMPLETE_out,
        AXI_24_DFI_PHYUPD_REQ => AXI_24_DFI_PHYUPD_REQ_out,
        AXI_24_DFI_PHY_LP_STATE => AXI_24_DFI_PHY_LP_STATE_out,
        AXI_24_DFI_RST_N_BUF => AXI_24_DFI_RST_N_BUF_out,
        AXI_24_MC_STATUS     => AXI_24_MC_STATUS_out,
        AXI_24_PHY_STATUS    => AXI_24_PHY_STATUS_out,
        AXI_24_RDATA         => AXI_24_RDATA_out,
        AXI_24_RDATA_PARITY  => AXI_24_RDATA_PARITY_out,
        AXI_24_RID           => AXI_24_RID_out,
        AXI_24_RLAST         => AXI_24_RLAST_out,
        AXI_24_RRESP         => AXI_24_RRESP_out,
        AXI_24_RVALID        => AXI_24_RVALID_out,
        AXI_24_WREADY        => AXI_24_WREADY_out,
        AXI_25_ARREADY       => AXI_25_ARREADY_out,
        AXI_25_AWREADY       => AXI_25_AWREADY_out,
        AXI_25_BID           => AXI_25_BID_out,
        AXI_25_BRESP         => AXI_25_BRESP_out,
        AXI_25_BVALID        => AXI_25_BVALID_out,
        AXI_25_DFI_AW_AERR_N => AXI_25_DFI_AW_AERR_N_out,
        AXI_25_DFI_CLK_BUF   => AXI_25_DFI_CLK_BUF_out,
        AXI_25_DFI_DBI_BYTE_DISABLE => AXI_25_DFI_DBI_BYTE_DISABLE_out,
        AXI_25_DFI_DW_RDDATA_DBI => AXI_25_DFI_DW_RDDATA_DBI_out,
        AXI_25_DFI_DW_RDDATA_DERR => AXI_25_DFI_DW_RDDATA_DERR_out,
        AXI_25_DFI_DW_RDDATA_VALID => AXI_25_DFI_DW_RDDATA_VALID_out,
        AXI_25_DFI_INIT_COMPLETE => AXI_25_DFI_INIT_COMPLETE_out,
        AXI_25_DFI_PHYUPD_REQ => AXI_25_DFI_PHYUPD_REQ_out,
        AXI_25_DFI_PHY_LP_STATE => AXI_25_DFI_PHY_LP_STATE_out,
        AXI_25_DFI_RST_N_BUF => AXI_25_DFI_RST_N_BUF_out,
        AXI_25_RDATA         => AXI_25_RDATA_out,
        AXI_25_RDATA_PARITY  => AXI_25_RDATA_PARITY_out,
        AXI_25_RID           => AXI_25_RID_out,
        AXI_25_RLAST         => AXI_25_RLAST_out,
        AXI_25_RRESP         => AXI_25_RRESP_out,
        AXI_25_RVALID        => AXI_25_RVALID_out,
        AXI_25_WREADY        => AXI_25_WREADY_out,
        AXI_26_ARREADY       => AXI_26_ARREADY_out,
        AXI_26_AWREADY       => AXI_26_AWREADY_out,
        AXI_26_BID           => AXI_26_BID_out,
        AXI_26_BRESP         => AXI_26_BRESP_out,
        AXI_26_BVALID        => AXI_26_BVALID_out,
        AXI_26_DFI_AW_AERR_N => AXI_26_DFI_AW_AERR_N_out,
        AXI_26_DFI_CLK_BUF   => AXI_26_DFI_CLK_BUF_out,
        AXI_26_DFI_DBI_BYTE_DISABLE => AXI_26_DFI_DBI_BYTE_DISABLE_out,
        AXI_26_DFI_DW_RDDATA_DBI => AXI_26_DFI_DW_RDDATA_DBI_out,
        AXI_26_DFI_DW_RDDATA_DERR => AXI_26_DFI_DW_RDDATA_DERR_out,
        AXI_26_DFI_DW_RDDATA_VALID => AXI_26_DFI_DW_RDDATA_VALID_out,
        AXI_26_DFI_INIT_COMPLETE => AXI_26_DFI_INIT_COMPLETE_out,
        AXI_26_DFI_PHYUPD_REQ => AXI_26_DFI_PHYUPD_REQ_out,
        AXI_26_DFI_PHY_LP_STATE => AXI_26_DFI_PHY_LP_STATE_out,
        AXI_26_DFI_RST_N_BUF => AXI_26_DFI_RST_N_BUF_out,
        AXI_26_MC_STATUS     => AXI_26_MC_STATUS_out,
        AXI_26_PHY_STATUS    => AXI_26_PHY_STATUS_out,
        AXI_26_RDATA         => AXI_26_RDATA_out,
        AXI_26_RDATA_PARITY  => AXI_26_RDATA_PARITY_out,
        AXI_26_RID           => AXI_26_RID_out,
        AXI_26_RLAST         => AXI_26_RLAST_out,
        AXI_26_RRESP         => AXI_26_RRESP_out,
        AXI_26_RVALID        => AXI_26_RVALID_out,
        AXI_26_WREADY        => AXI_26_WREADY_out,
        AXI_27_ARREADY       => AXI_27_ARREADY_out,
        AXI_27_AWREADY       => AXI_27_AWREADY_out,
        AXI_27_BID           => AXI_27_BID_out,
        AXI_27_BRESP         => AXI_27_BRESP_out,
        AXI_27_BVALID        => AXI_27_BVALID_out,
        AXI_27_DFI_AW_AERR_N => AXI_27_DFI_AW_AERR_N_out,
        AXI_27_DFI_CLK_BUF   => AXI_27_DFI_CLK_BUF_out,
        AXI_27_DFI_DBI_BYTE_DISABLE => AXI_27_DFI_DBI_BYTE_DISABLE_out,
        AXI_27_DFI_DW_RDDATA_DBI => AXI_27_DFI_DW_RDDATA_DBI_out,
        AXI_27_DFI_DW_RDDATA_DERR => AXI_27_DFI_DW_RDDATA_DERR_out,
        AXI_27_DFI_DW_RDDATA_VALID => AXI_27_DFI_DW_RDDATA_VALID_out,
        AXI_27_DFI_INIT_COMPLETE => AXI_27_DFI_INIT_COMPLETE_out,
        AXI_27_DFI_PHYUPD_REQ => AXI_27_DFI_PHYUPD_REQ_out,
        AXI_27_DFI_PHY_LP_STATE => AXI_27_DFI_PHY_LP_STATE_out,
        AXI_27_DFI_RST_N_BUF => AXI_27_DFI_RST_N_BUF_out,
        AXI_27_RDATA         => AXI_27_RDATA_out,
        AXI_27_RDATA_PARITY  => AXI_27_RDATA_PARITY_out,
        AXI_27_RID           => AXI_27_RID_out,
        AXI_27_RLAST         => AXI_27_RLAST_out,
        AXI_27_RRESP         => AXI_27_RRESP_out,
        AXI_27_RVALID        => AXI_27_RVALID_out,
        AXI_27_WREADY        => AXI_27_WREADY_out,
        AXI_28_ARREADY       => AXI_28_ARREADY_out,
        AXI_28_AWREADY       => AXI_28_AWREADY_out,
        AXI_28_BID           => AXI_28_BID_out,
        AXI_28_BRESP         => AXI_28_BRESP_out,
        AXI_28_BVALID        => AXI_28_BVALID_out,
        AXI_28_DFI_AW_AERR_N => AXI_28_DFI_AW_AERR_N_out,
        AXI_28_DFI_CLK_BUF   => AXI_28_DFI_CLK_BUF_out,
        AXI_28_DFI_DBI_BYTE_DISABLE => AXI_28_DFI_DBI_BYTE_DISABLE_out,
        AXI_28_DFI_DW_RDDATA_DBI => AXI_28_DFI_DW_RDDATA_DBI_out,
        AXI_28_DFI_DW_RDDATA_DERR => AXI_28_DFI_DW_RDDATA_DERR_out,
        AXI_28_DFI_DW_RDDATA_VALID => AXI_28_DFI_DW_RDDATA_VALID_out,
        AXI_28_DFI_INIT_COMPLETE => AXI_28_DFI_INIT_COMPLETE_out,
        AXI_28_DFI_PHYUPD_REQ => AXI_28_DFI_PHYUPD_REQ_out,
        AXI_28_DFI_PHY_LP_STATE => AXI_28_DFI_PHY_LP_STATE_out,
        AXI_28_DFI_RST_N_BUF => AXI_28_DFI_RST_N_BUF_out,
        AXI_28_MC_STATUS     => AXI_28_MC_STATUS_out,
        AXI_28_PHY_STATUS    => AXI_28_PHY_STATUS_out,
        AXI_28_RDATA         => AXI_28_RDATA_out,
        AXI_28_RDATA_PARITY  => AXI_28_RDATA_PARITY_out,
        AXI_28_RID           => AXI_28_RID_out,
        AXI_28_RLAST         => AXI_28_RLAST_out,
        AXI_28_RRESP         => AXI_28_RRESP_out,
        AXI_28_RVALID        => AXI_28_RVALID_out,
        AXI_28_WREADY        => AXI_28_WREADY_out,
        AXI_29_ARREADY       => AXI_29_ARREADY_out,
        AXI_29_AWREADY       => AXI_29_AWREADY_out,
        AXI_29_BID           => AXI_29_BID_out,
        AXI_29_BRESP         => AXI_29_BRESP_out,
        AXI_29_BVALID        => AXI_29_BVALID_out,
        AXI_29_DFI_AW_AERR_N => AXI_29_DFI_AW_AERR_N_out,
        AXI_29_DFI_CLK_BUF   => AXI_29_DFI_CLK_BUF_out,
        AXI_29_DFI_DBI_BYTE_DISABLE => AXI_29_DFI_DBI_BYTE_DISABLE_out,
        AXI_29_DFI_DW_RDDATA_DBI => AXI_29_DFI_DW_RDDATA_DBI_out,
        AXI_29_DFI_DW_RDDATA_DERR => AXI_29_DFI_DW_RDDATA_DERR_out,
        AXI_29_DFI_DW_RDDATA_VALID => AXI_29_DFI_DW_RDDATA_VALID_out,
        AXI_29_DFI_INIT_COMPLETE => AXI_29_DFI_INIT_COMPLETE_out,
        AXI_29_DFI_PHYUPD_REQ => AXI_29_DFI_PHYUPD_REQ_out,
        AXI_29_DFI_PHY_LP_STATE => AXI_29_DFI_PHY_LP_STATE_out,
        AXI_29_DFI_RST_N_BUF => AXI_29_DFI_RST_N_BUF_out,
        AXI_29_RDATA         => AXI_29_RDATA_out,
        AXI_29_RDATA_PARITY  => AXI_29_RDATA_PARITY_out,
        AXI_29_RID           => AXI_29_RID_out,
        AXI_29_RLAST         => AXI_29_RLAST_out,
        AXI_29_RRESP         => AXI_29_RRESP_out,
        AXI_29_RVALID        => AXI_29_RVALID_out,
        AXI_29_WREADY        => AXI_29_WREADY_out,
        AXI_30_ARREADY       => AXI_30_ARREADY_out,
        AXI_30_AWREADY       => AXI_30_AWREADY_out,
        AXI_30_BID           => AXI_30_BID_out,
        AXI_30_BRESP         => AXI_30_BRESP_out,
        AXI_30_BVALID        => AXI_30_BVALID_out,
        AXI_30_DFI_AW_AERR_N => AXI_30_DFI_AW_AERR_N_out,
        AXI_30_DFI_CLK_BUF   => AXI_30_DFI_CLK_BUF_out,
        AXI_30_DFI_DBI_BYTE_DISABLE => AXI_30_DFI_DBI_BYTE_DISABLE_out,
        AXI_30_DFI_DW_RDDATA_DBI => AXI_30_DFI_DW_RDDATA_DBI_out,
        AXI_30_DFI_DW_RDDATA_DERR => AXI_30_DFI_DW_RDDATA_DERR_out,
        AXI_30_DFI_DW_RDDATA_VALID => AXI_30_DFI_DW_RDDATA_VALID_out,
        AXI_30_DFI_INIT_COMPLETE => AXI_30_DFI_INIT_COMPLETE_out,
        AXI_30_DFI_PHYUPD_REQ => AXI_30_DFI_PHYUPD_REQ_out,
        AXI_30_DFI_PHY_LP_STATE => AXI_30_DFI_PHY_LP_STATE_out,
        AXI_30_DFI_RST_N_BUF => AXI_30_DFI_RST_N_BUF_out,
        AXI_30_MC_STATUS     => AXI_30_MC_STATUS_out,
        AXI_30_PHY_STATUS    => AXI_30_PHY_STATUS_out,
        AXI_30_RDATA         => AXI_30_RDATA_out,
        AXI_30_RDATA_PARITY  => AXI_30_RDATA_PARITY_out,
        AXI_30_RID           => AXI_30_RID_out,
        AXI_30_RLAST         => AXI_30_RLAST_out,
        AXI_30_RRESP         => AXI_30_RRESP_out,
        AXI_30_RVALID        => AXI_30_RVALID_out,
        AXI_30_WREADY        => AXI_30_WREADY_out,
        AXI_31_ARREADY       => AXI_31_ARREADY_out,
        AXI_31_AWREADY       => AXI_31_AWREADY_out,
        AXI_31_BID           => AXI_31_BID_out,
        AXI_31_BRESP         => AXI_31_BRESP_out,
        AXI_31_BVALID        => AXI_31_BVALID_out,
        AXI_31_DFI_AW_AERR_N => AXI_31_DFI_AW_AERR_N_out,
        AXI_31_DFI_CLK_BUF   => AXI_31_DFI_CLK_BUF_out,
        AXI_31_DFI_DBI_BYTE_DISABLE => AXI_31_DFI_DBI_BYTE_DISABLE_out,
        AXI_31_DFI_DW_RDDATA_DBI => AXI_31_DFI_DW_RDDATA_DBI_out,
        AXI_31_DFI_DW_RDDATA_DERR => AXI_31_DFI_DW_RDDATA_DERR_out,
        AXI_31_DFI_DW_RDDATA_VALID => AXI_31_DFI_DW_RDDATA_VALID_out,
        AXI_31_DFI_INIT_COMPLETE => AXI_31_DFI_INIT_COMPLETE_out,
        AXI_31_DFI_PHYUPD_REQ => AXI_31_DFI_PHYUPD_REQ_out,
        AXI_31_DFI_PHY_LP_STATE => AXI_31_DFI_PHY_LP_STATE_out,
        AXI_31_DFI_RST_N_BUF => AXI_31_DFI_RST_N_BUF_out,
        AXI_31_RDATA         => AXI_31_RDATA_out,
        AXI_31_RDATA_PARITY  => AXI_31_RDATA_PARITY_out,
        AXI_31_RID           => AXI_31_RID_out,
        AXI_31_RLAST         => AXI_31_RLAST_out,
        AXI_31_RRESP         => AXI_31_RRESP_out,
        AXI_31_RVALID        => AXI_31_RVALID_out,
        AXI_31_WREADY        => AXI_31_WREADY_out,
        BLI_SCAN_OUT_00      => BLI_SCAN_OUT_00_out,
        BLI_SCAN_OUT_01      => BLI_SCAN_OUT_01_out,
        BLI_SCAN_OUT_02      => BLI_SCAN_OUT_02_out,
        BLI_SCAN_OUT_03      => BLI_SCAN_OUT_03_out,
        BLI_SCAN_OUT_04      => BLI_SCAN_OUT_04_out,
        BLI_SCAN_OUT_05      => BLI_SCAN_OUT_05_out,
        BLI_SCAN_OUT_06      => BLI_SCAN_OUT_06_out,
        BLI_SCAN_OUT_07      => BLI_SCAN_OUT_07_out,
        BLI_SCAN_OUT_08      => BLI_SCAN_OUT_08_out,
        BLI_SCAN_OUT_09      => BLI_SCAN_OUT_09_out,
        BLI_SCAN_OUT_10      => BLI_SCAN_OUT_10_out,
        BLI_SCAN_OUT_11      => BLI_SCAN_OUT_11_out,
        BLI_SCAN_OUT_12      => BLI_SCAN_OUT_12_out,
        BLI_SCAN_OUT_13      => BLI_SCAN_OUT_13_out,
        BLI_SCAN_OUT_14      => BLI_SCAN_OUT_14_out,
        BLI_SCAN_OUT_15      => BLI_SCAN_OUT_15_out,
        BLI_SCAN_OUT_16      => BLI_SCAN_OUT_16_out,
        BLI_SCAN_OUT_17      => BLI_SCAN_OUT_17_out,
        BLI_SCAN_OUT_18      => BLI_SCAN_OUT_18_out,
        BLI_SCAN_OUT_19      => BLI_SCAN_OUT_19_out,
        BLI_SCAN_OUT_20      => BLI_SCAN_OUT_20_out,
        BLI_SCAN_OUT_21      => BLI_SCAN_OUT_21_out,
        BLI_SCAN_OUT_22      => BLI_SCAN_OUT_22_out,
        BLI_SCAN_OUT_23      => BLI_SCAN_OUT_23_out,
        BLI_SCAN_OUT_24      => BLI_SCAN_OUT_24_out,
        BLI_SCAN_OUT_25      => BLI_SCAN_OUT_25_out,
        BLI_SCAN_OUT_26      => BLI_SCAN_OUT_26_out,
        BLI_SCAN_OUT_27      => BLI_SCAN_OUT_27_out,
        BLI_SCAN_OUT_28      => BLI_SCAN_OUT_28_out,
        BLI_SCAN_OUT_29      => BLI_SCAN_OUT_29_out,
        BLI_SCAN_OUT_30      => BLI_SCAN_OUT_30_out,
        BLI_SCAN_OUT_31      => BLI_SCAN_OUT_31_out,
        DBG_OUT_00           => DBG_OUT_00_out,
        DBG_OUT_01           => DBG_OUT_01_out,
        DBG_OUT_02           => DBG_OUT_02_out,
        DBG_OUT_03           => DBG_OUT_03_out,
        DBG_OUT_04           => DBG_OUT_04_out,
        DBG_OUT_05           => DBG_OUT_05_out,
        DBG_OUT_06           => DBG_OUT_06_out,
        DBG_OUT_07           => DBG_OUT_07_out,
        DBG_OUT_08           => DBG_OUT_08_out,
        DBG_OUT_09           => DBG_OUT_09_out,
        DBG_OUT_10           => DBG_OUT_10_out,
        DBG_OUT_11           => DBG_OUT_11_out,
        DBG_OUT_12           => DBG_OUT_12_out,
        DBG_OUT_13           => DBG_OUT_13_out,
        DBG_OUT_14           => DBG_OUT_14_out,
        DBG_OUT_15           => DBG_OUT_15_out,
        DBG_OUT_16           => DBG_OUT_16_out,
        DBG_OUT_17           => DBG_OUT_17_out,
        DBG_OUT_18           => DBG_OUT_18_out,
        DBG_OUT_19           => DBG_OUT_19_out,
        DBG_OUT_20           => DBG_OUT_20_out,
        DBG_OUT_21           => DBG_OUT_21_out,
        DBG_OUT_22           => DBG_OUT_22_out,
        DBG_OUT_23           => DBG_OUT_23_out,
        DBG_OUT_24           => DBG_OUT_24_out,
        DBG_OUT_25           => DBG_OUT_25_out,
        DBG_OUT_26           => DBG_OUT_26_out,
        DBG_OUT_27           => DBG_OUT_27_out,
        DBG_OUT_28           => DBG_OUT_28_out,
        DBG_OUT_29           => DBG_OUT_29_out,
        DBG_OUT_30           => DBG_OUT_30_out,
        DBG_OUT_31           => DBG_OUT_31_out,
        DLL_SCAN_OUT_00      => DLL_SCAN_OUT_00_out,
        DLL_SCAN_OUT_01      => DLL_SCAN_OUT_01_out,
        DRAM_0_STAT_CATTRIP  => DRAM_0_STAT_CATTRIP_out,
        DRAM_0_STAT_TEMP     => DRAM_0_STAT_TEMP_out,
        DRAM_1_STAT_CATTRIP  => DRAM_1_STAT_CATTRIP_out,
        DRAM_1_STAT_TEMP     => DRAM_1_STAT_TEMP_out,
        IO_SCAN_OUT_00       => IO_SCAN_OUT_00_out,
        IO_SCAN_OUT_01       => IO_SCAN_OUT_01_out,
        MC_SCAN_OUT_00       => MC_SCAN_OUT_00_out,
        MC_SCAN_OUT_01       => MC_SCAN_OUT_01_out,
        MC_SCAN_OUT_02       => MC_SCAN_OUT_02_out,
        MC_SCAN_OUT_03       => MC_SCAN_OUT_03_out,
        MC_SCAN_OUT_04       => MC_SCAN_OUT_04_out,
        MC_SCAN_OUT_05       => MC_SCAN_OUT_05_out,
        MC_SCAN_OUT_06       => MC_SCAN_OUT_06_out,
        MC_SCAN_OUT_07       => MC_SCAN_OUT_07_out,
        MC_SCAN_OUT_08       => MC_SCAN_OUT_08_out,
        MC_SCAN_OUT_09       => MC_SCAN_OUT_09_out,
        MC_SCAN_OUT_10       => MC_SCAN_OUT_10_out,
        MC_SCAN_OUT_11       => MC_SCAN_OUT_11_out,
        MC_SCAN_OUT_12       => MC_SCAN_OUT_12_out,
        MC_SCAN_OUT_13       => MC_SCAN_OUT_13_out,
        MC_SCAN_OUT_14       => MC_SCAN_OUT_14_out,
        MC_SCAN_OUT_15       => MC_SCAN_OUT_15_out,
        PHY_SCAN_OUT_00      => PHY_SCAN_OUT_00_out,
        PHY_SCAN_OUT_01      => PHY_SCAN_OUT_01_out,
        STATUS_00            => STATUS_00_out,
        STATUS_01            => STATUS_01_out,
        STATUS_02            => STATUS_02_out,
        STATUS_03            => STATUS_03_out,
        STATUS_04            => STATUS_04_out,
        STATUS_05            => STATUS_05_out,
        STATUS_06            => STATUS_06_out,
        STATUS_07            => STATUS_07_out,
        STATUS_08            => STATUS_08_out,
        STATUS_09            => STATUS_09_out,
        STATUS_10            => STATUS_10_out,
        STATUS_11            => STATUS_11_out,
        STATUS_12            => STATUS_12_out,
        STATUS_13            => STATUS_13_out,
        STATUS_14            => STATUS_14_out,
        STATUS_15            => STATUS_15_out,
        SW_SCAN_OUT_00       => SW_SCAN_OUT_00_out,
        SW_SCAN_OUT_01       => SW_SCAN_OUT_01_out,
        SW_SCAN_OUT_02       => SW_SCAN_OUT_02_out,
        SW_SCAN_OUT_03       => SW_SCAN_OUT_03_out,
        SW_SCAN_OUT_04       => SW_SCAN_OUT_04_out,
        SW_SCAN_OUT_05       => SW_SCAN_OUT_05_out,
        SW_SCAN_OUT_06       => SW_SCAN_OUT_06_out,
        SW_SCAN_OUT_07       => SW_SCAN_OUT_07_out,
        ANALOG_HBM_SEL_00    => ANALOG_HBM_SEL_00_in,
        ANALOG_HBM_SEL_01    => ANALOG_HBM_SEL_01_in,
        APB_0_PADDR          => APB_0_PADDR_in,
        APB_0_PCLK           => APB_0_PCLK_in,
        APB_0_PENABLE        => APB_0_PENABLE_in,
        APB_0_PRESET_N       => APB_0_PRESET_N_in,
        APB_0_PSEL           => APB_0_PSEL_in,
        APB_0_PWDATA         => APB_0_PWDATA_in,
        APB_0_PWRITE         => APB_0_PWRITE_in,
        APB_1_PADDR          => APB_1_PADDR_in,
        APB_1_PCLK           => APB_1_PCLK_in,
        APB_1_PENABLE        => APB_1_PENABLE_in,
        APB_1_PRESET_N       => APB_1_PRESET_N_in,
        APB_1_PSEL           => APB_1_PSEL_in,
        APB_1_PWDATA         => APB_1_PWDATA_in,
        APB_1_PWRITE         => APB_1_PWRITE_in,
        AXI_00_ACLK          => AXI_00_ACLK_in,
        AXI_00_ARADDR        => AXI_00_ARADDR_in,
        AXI_00_ARBURST       => AXI_00_ARBURST_in,
        AXI_00_ARESET_N      => AXI_00_ARESET_N_in,
        AXI_00_ARID          => AXI_00_ARID_in,
        AXI_00_ARLEN         => AXI_00_ARLEN_in,
        AXI_00_ARSIZE        => AXI_00_ARSIZE_in,
        AXI_00_ARVALID       => AXI_00_ARVALID_in,
        AXI_00_AWADDR        => AXI_00_AWADDR_in,
        AXI_00_AWBURST       => AXI_00_AWBURST_in,
        AXI_00_AWID          => AXI_00_AWID_in,
        AXI_00_AWLEN         => AXI_00_AWLEN_in,
        AXI_00_AWSIZE        => AXI_00_AWSIZE_in,
        AXI_00_AWVALID       => AXI_00_AWVALID_in,
        AXI_00_BREADY        => AXI_00_BREADY_in,
        AXI_00_DFI_LP_PWR_X_REQ => AXI_00_DFI_LP_PWR_X_REQ_in,
        AXI_00_RREADY        => AXI_00_RREADY_in,
        AXI_00_WDATA         => AXI_00_WDATA_in,
        AXI_00_WDATA_PARITY  => AXI_00_WDATA_PARITY_in,
        AXI_00_WLAST         => AXI_00_WLAST_in,
        AXI_00_WSTRB         => AXI_00_WSTRB_in,
        AXI_00_WVALID        => AXI_00_WVALID_in,
        AXI_01_ACLK          => AXI_01_ACLK_in,
        AXI_01_ARADDR        => AXI_01_ARADDR_in,
        AXI_01_ARBURST       => AXI_01_ARBURST_in,
        AXI_01_ARESET_N      => AXI_01_ARESET_N_in,
        AXI_01_ARID          => AXI_01_ARID_in,
        AXI_01_ARLEN         => AXI_01_ARLEN_in,
        AXI_01_ARSIZE        => AXI_01_ARSIZE_in,
        AXI_01_ARVALID       => AXI_01_ARVALID_in,
        AXI_01_AWADDR        => AXI_01_AWADDR_in,
        AXI_01_AWBURST       => AXI_01_AWBURST_in,
        AXI_01_AWID          => AXI_01_AWID_in,
        AXI_01_AWLEN         => AXI_01_AWLEN_in,
        AXI_01_AWSIZE        => AXI_01_AWSIZE_in,
        AXI_01_AWVALID       => AXI_01_AWVALID_in,
        AXI_01_BREADY        => AXI_01_BREADY_in,
        AXI_01_DFI_LP_PWR_X_REQ => AXI_01_DFI_LP_PWR_X_REQ_in,
        AXI_01_RREADY        => AXI_01_RREADY_in,
        AXI_01_WDATA         => AXI_01_WDATA_in,
        AXI_01_WDATA_PARITY  => AXI_01_WDATA_PARITY_in,
        AXI_01_WLAST         => AXI_01_WLAST_in,
        AXI_01_WSTRB         => AXI_01_WSTRB_in,
        AXI_01_WVALID        => AXI_01_WVALID_in,
        AXI_02_ACLK          => AXI_02_ACLK_in,
        AXI_02_ARADDR        => AXI_02_ARADDR_in,
        AXI_02_ARBURST       => AXI_02_ARBURST_in,
        AXI_02_ARESET_N      => AXI_02_ARESET_N_in,
        AXI_02_ARID          => AXI_02_ARID_in,
        AXI_02_ARLEN         => AXI_02_ARLEN_in,
        AXI_02_ARSIZE        => AXI_02_ARSIZE_in,
        AXI_02_ARVALID       => AXI_02_ARVALID_in,
        AXI_02_AWADDR        => AXI_02_AWADDR_in,
        AXI_02_AWBURST       => AXI_02_AWBURST_in,
        AXI_02_AWID          => AXI_02_AWID_in,
        AXI_02_AWLEN         => AXI_02_AWLEN_in,
        AXI_02_AWSIZE        => AXI_02_AWSIZE_in,
        AXI_02_AWVALID       => AXI_02_AWVALID_in,
        AXI_02_BREADY        => AXI_02_BREADY_in,
        AXI_02_DFI_LP_PWR_X_REQ => AXI_02_DFI_LP_PWR_X_REQ_in,
        AXI_02_RREADY        => AXI_02_RREADY_in,
        AXI_02_WDATA         => AXI_02_WDATA_in,
        AXI_02_WDATA_PARITY  => AXI_02_WDATA_PARITY_in,
        AXI_02_WLAST         => AXI_02_WLAST_in,
        AXI_02_WSTRB         => AXI_02_WSTRB_in,
        AXI_02_WVALID        => AXI_02_WVALID_in,
        AXI_03_ACLK          => AXI_03_ACLK_in,
        AXI_03_ARADDR        => AXI_03_ARADDR_in,
        AXI_03_ARBURST       => AXI_03_ARBURST_in,
        AXI_03_ARESET_N      => AXI_03_ARESET_N_in,
        AXI_03_ARID          => AXI_03_ARID_in,
        AXI_03_ARLEN         => AXI_03_ARLEN_in,
        AXI_03_ARSIZE        => AXI_03_ARSIZE_in,
        AXI_03_ARVALID       => AXI_03_ARVALID_in,
        AXI_03_AWADDR        => AXI_03_AWADDR_in,
        AXI_03_AWBURST       => AXI_03_AWBURST_in,
        AXI_03_AWID          => AXI_03_AWID_in,
        AXI_03_AWLEN         => AXI_03_AWLEN_in,
        AXI_03_AWSIZE        => AXI_03_AWSIZE_in,
        AXI_03_AWVALID       => AXI_03_AWVALID_in,
        AXI_03_BREADY        => AXI_03_BREADY_in,
        AXI_03_DFI_LP_PWR_X_REQ => AXI_03_DFI_LP_PWR_X_REQ_in,
        AXI_03_RREADY        => AXI_03_RREADY_in,
        AXI_03_WDATA         => AXI_03_WDATA_in,
        AXI_03_WDATA_PARITY  => AXI_03_WDATA_PARITY_in,
        AXI_03_WLAST         => AXI_03_WLAST_in,
        AXI_03_WSTRB         => AXI_03_WSTRB_in,
        AXI_03_WVALID        => AXI_03_WVALID_in,
        AXI_04_ACLK          => AXI_04_ACLK_in,
        AXI_04_ARADDR        => AXI_04_ARADDR_in,
        AXI_04_ARBURST       => AXI_04_ARBURST_in,
        AXI_04_ARESET_N      => AXI_04_ARESET_N_in,
        AXI_04_ARID          => AXI_04_ARID_in,
        AXI_04_ARLEN         => AXI_04_ARLEN_in,
        AXI_04_ARSIZE        => AXI_04_ARSIZE_in,
        AXI_04_ARVALID       => AXI_04_ARVALID_in,
        AXI_04_AWADDR        => AXI_04_AWADDR_in,
        AXI_04_AWBURST       => AXI_04_AWBURST_in,
        AXI_04_AWID          => AXI_04_AWID_in,
        AXI_04_AWLEN         => AXI_04_AWLEN_in,
        AXI_04_AWSIZE        => AXI_04_AWSIZE_in,
        AXI_04_AWVALID       => AXI_04_AWVALID_in,
        AXI_04_BREADY        => AXI_04_BREADY_in,
        AXI_04_DFI_LP_PWR_X_REQ => AXI_04_DFI_LP_PWR_X_REQ_in,
        AXI_04_RREADY        => AXI_04_RREADY_in,
        AXI_04_WDATA         => AXI_04_WDATA_in,
        AXI_04_WDATA_PARITY  => AXI_04_WDATA_PARITY_in,
        AXI_04_WLAST         => AXI_04_WLAST_in,
        AXI_04_WSTRB         => AXI_04_WSTRB_in,
        AXI_04_WVALID        => AXI_04_WVALID_in,
        AXI_05_ACLK          => AXI_05_ACLK_in,
        AXI_05_ARADDR        => AXI_05_ARADDR_in,
        AXI_05_ARBURST       => AXI_05_ARBURST_in,
        AXI_05_ARESET_N      => AXI_05_ARESET_N_in,
        AXI_05_ARID          => AXI_05_ARID_in,
        AXI_05_ARLEN         => AXI_05_ARLEN_in,
        AXI_05_ARSIZE        => AXI_05_ARSIZE_in,
        AXI_05_ARVALID       => AXI_05_ARVALID_in,
        AXI_05_AWADDR        => AXI_05_AWADDR_in,
        AXI_05_AWBURST       => AXI_05_AWBURST_in,
        AXI_05_AWID          => AXI_05_AWID_in,
        AXI_05_AWLEN         => AXI_05_AWLEN_in,
        AXI_05_AWSIZE        => AXI_05_AWSIZE_in,
        AXI_05_AWVALID       => AXI_05_AWVALID_in,
        AXI_05_BREADY        => AXI_05_BREADY_in,
        AXI_05_DFI_LP_PWR_X_REQ => AXI_05_DFI_LP_PWR_X_REQ_in,
        AXI_05_RREADY        => AXI_05_RREADY_in,
        AXI_05_WDATA         => AXI_05_WDATA_in,
        AXI_05_WDATA_PARITY  => AXI_05_WDATA_PARITY_in,
        AXI_05_WLAST         => AXI_05_WLAST_in,
        AXI_05_WSTRB         => AXI_05_WSTRB_in,
        AXI_05_WVALID        => AXI_05_WVALID_in,
        AXI_06_ACLK          => AXI_06_ACLK_in,
        AXI_06_ARADDR        => AXI_06_ARADDR_in,
        AXI_06_ARBURST       => AXI_06_ARBURST_in,
        AXI_06_ARESET_N      => AXI_06_ARESET_N_in,
        AXI_06_ARID          => AXI_06_ARID_in,
        AXI_06_ARLEN         => AXI_06_ARLEN_in,
        AXI_06_ARSIZE        => AXI_06_ARSIZE_in,
        AXI_06_ARVALID       => AXI_06_ARVALID_in,
        AXI_06_AWADDR        => AXI_06_AWADDR_in,
        AXI_06_AWBURST       => AXI_06_AWBURST_in,
        AXI_06_AWID          => AXI_06_AWID_in,
        AXI_06_AWLEN         => AXI_06_AWLEN_in,
        AXI_06_AWSIZE        => AXI_06_AWSIZE_in,
        AXI_06_AWVALID       => AXI_06_AWVALID_in,
        AXI_06_BREADY        => AXI_06_BREADY_in,
        AXI_06_DFI_LP_PWR_X_REQ => AXI_06_DFI_LP_PWR_X_REQ_in,
        AXI_06_RREADY        => AXI_06_RREADY_in,
        AXI_06_WDATA         => AXI_06_WDATA_in,
        AXI_06_WDATA_PARITY  => AXI_06_WDATA_PARITY_in,
        AXI_06_WLAST         => AXI_06_WLAST_in,
        AXI_06_WSTRB         => AXI_06_WSTRB_in,
        AXI_06_WVALID        => AXI_06_WVALID_in,
        AXI_07_ACLK          => AXI_07_ACLK_in,
        AXI_07_ARADDR        => AXI_07_ARADDR_in,
        AXI_07_ARBURST       => AXI_07_ARBURST_in,
        AXI_07_ARESET_N      => AXI_07_ARESET_N_in,
        AXI_07_ARID          => AXI_07_ARID_in,
        AXI_07_ARLEN         => AXI_07_ARLEN_in,
        AXI_07_ARSIZE        => AXI_07_ARSIZE_in,
        AXI_07_ARVALID       => AXI_07_ARVALID_in,
        AXI_07_AWADDR        => AXI_07_AWADDR_in,
        AXI_07_AWBURST       => AXI_07_AWBURST_in,
        AXI_07_AWID          => AXI_07_AWID_in,
        AXI_07_AWLEN         => AXI_07_AWLEN_in,
        AXI_07_AWSIZE        => AXI_07_AWSIZE_in,
        AXI_07_AWVALID       => AXI_07_AWVALID_in,
        AXI_07_BREADY        => AXI_07_BREADY_in,
        AXI_07_DFI_LP_PWR_X_REQ => AXI_07_DFI_LP_PWR_X_REQ_in,
        AXI_07_RREADY        => AXI_07_RREADY_in,
        AXI_07_WDATA         => AXI_07_WDATA_in,
        AXI_07_WDATA_PARITY  => AXI_07_WDATA_PARITY_in,
        AXI_07_WLAST         => AXI_07_WLAST_in,
        AXI_07_WSTRB         => AXI_07_WSTRB_in,
        AXI_07_WVALID        => AXI_07_WVALID_in,
        AXI_08_ACLK          => AXI_08_ACLK_in,
        AXI_08_ARADDR        => AXI_08_ARADDR_in,
        AXI_08_ARBURST       => AXI_08_ARBURST_in,
        AXI_08_ARESET_N      => AXI_08_ARESET_N_in,
        AXI_08_ARID          => AXI_08_ARID_in,
        AXI_08_ARLEN         => AXI_08_ARLEN_in,
        AXI_08_ARSIZE        => AXI_08_ARSIZE_in,
        AXI_08_ARVALID       => AXI_08_ARVALID_in,
        AXI_08_AWADDR        => AXI_08_AWADDR_in,
        AXI_08_AWBURST       => AXI_08_AWBURST_in,
        AXI_08_AWID          => AXI_08_AWID_in,
        AXI_08_AWLEN         => AXI_08_AWLEN_in,
        AXI_08_AWSIZE        => AXI_08_AWSIZE_in,
        AXI_08_AWVALID       => AXI_08_AWVALID_in,
        AXI_08_BREADY        => AXI_08_BREADY_in,
        AXI_08_DFI_LP_PWR_X_REQ => AXI_08_DFI_LP_PWR_X_REQ_in,
        AXI_08_RREADY        => AXI_08_RREADY_in,
        AXI_08_WDATA         => AXI_08_WDATA_in,
        AXI_08_WDATA_PARITY  => AXI_08_WDATA_PARITY_in,
        AXI_08_WLAST         => AXI_08_WLAST_in,
        AXI_08_WSTRB         => AXI_08_WSTRB_in,
        AXI_08_WVALID        => AXI_08_WVALID_in,
        AXI_09_ACLK          => AXI_09_ACLK_in,
        AXI_09_ARADDR        => AXI_09_ARADDR_in,
        AXI_09_ARBURST       => AXI_09_ARBURST_in,
        AXI_09_ARESET_N      => AXI_09_ARESET_N_in,
        AXI_09_ARID          => AXI_09_ARID_in,
        AXI_09_ARLEN         => AXI_09_ARLEN_in,
        AXI_09_ARSIZE        => AXI_09_ARSIZE_in,
        AXI_09_ARVALID       => AXI_09_ARVALID_in,
        AXI_09_AWADDR        => AXI_09_AWADDR_in,
        AXI_09_AWBURST       => AXI_09_AWBURST_in,
        AXI_09_AWID          => AXI_09_AWID_in,
        AXI_09_AWLEN         => AXI_09_AWLEN_in,
        AXI_09_AWSIZE        => AXI_09_AWSIZE_in,
        AXI_09_AWVALID       => AXI_09_AWVALID_in,
        AXI_09_BREADY        => AXI_09_BREADY_in,
        AXI_09_DFI_LP_PWR_X_REQ => AXI_09_DFI_LP_PWR_X_REQ_in,
        AXI_09_RREADY        => AXI_09_RREADY_in,
        AXI_09_WDATA         => AXI_09_WDATA_in,
        AXI_09_WDATA_PARITY  => AXI_09_WDATA_PARITY_in,
        AXI_09_WLAST         => AXI_09_WLAST_in,
        AXI_09_WSTRB         => AXI_09_WSTRB_in,
        AXI_09_WVALID        => AXI_09_WVALID_in,
        AXI_10_ACLK          => AXI_10_ACLK_in,
        AXI_10_ARADDR        => AXI_10_ARADDR_in,
        AXI_10_ARBURST       => AXI_10_ARBURST_in,
        AXI_10_ARESET_N      => AXI_10_ARESET_N_in,
        AXI_10_ARID          => AXI_10_ARID_in,
        AXI_10_ARLEN         => AXI_10_ARLEN_in,
        AXI_10_ARSIZE        => AXI_10_ARSIZE_in,
        AXI_10_ARVALID       => AXI_10_ARVALID_in,
        AXI_10_AWADDR        => AXI_10_AWADDR_in,
        AXI_10_AWBURST       => AXI_10_AWBURST_in,
        AXI_10_AWID          => AXI_10_AWID_in,
        AXI_10_AWLEN         => AXI_10_AWLEN_in,
        AXI_10_AWSIZE        => AXI_10_AWSIZE_in,
        AXI_10_AWVALID       => AXI_10_AWVALID_in,
        AXI_10_BREADY        => AXI_10_BREADY_in,
        AXI_10_DFI_LP_PWR_X_REQ => AXI_10_DFI_LP_PWR_X_REQ_in,
        AXI_10_RREADY        => AXI_10_RREADY_in,
        AXI_10_WDATA         => AXI_10_WDATA_in,
        AXI_10_WDATA_PARITY  => AXI_10_WDATA_PARITY_in,
        AXI_10_WLAST         => AXI_10_WLAST_in,
        AXI_10_WSTRB         => AXI_10_WSTRB_in,
        AXI_10_WVALID        => AXI_10_WVALID_in,
        AXI_11_ACLK          => AXI_11_ACLK_in,
        AXI_11_ARADDR        => AXI_11_ARADDR_in,
        AXI_11_ARBURST       => AXI_11_ARBURST_in,
        AXI_11_ARESET_N      => AXI_11_ARESET_N_in,
        AXI_11_ARID          => AXI_11_ARID_in,
        AXI_11_ARLEN         => AXI_11_ARLEN_in,
        AXI_11_ARSIZE        => AXI_11_ARSIZE_in,
        AXI_11_ARVALID       => AXI_11_ARVALID_in,
        AXI_11_AWADDR        => AXI_11_AWADDR_in,
        AXI_11_AWBURST       => AXI_11_AWBURST_in,
        AXI_11_AWID          => AXI_11_AWID_in,
        AXI_11_AWLEN         => AXI_11_AWLEN_in,
        AXI_11_AWSIZE        => AXI_11_AWSIZE_in,
        AXI_11_AWVALID       => AXI_11_AWVALID_in,
        AXI_11_BREADY        => AXI_11_BREADY_in,
        AXI_11_DFI_LP_PWR_X_REQ => AXI_11_DFI_LP_PWR_X_REQ_in,
        AXI_11_RREADY        => AXI_11_RREADY_in,
        AXI_11_WDATA         => AXI_11_WDATA_in,
        AXI_11_WDATA_PARITY  => AXI_11_WDATA_PARITY_in,
        AXI_11_WLAST         => AXI_11_WLAST_in,
        AXI_11_WSTRB         => AXI_11_WSTRB_in,
        AXI_11_WVALID        => AXI_11_WVALID_in,
        AXI_12_ACLK          => AXI_12_ACLK_in,
        AXI_12_ARADDR        => AXI_12_ARADDR_in,
        AXI_12_ARBURST       => AXI_12_ARBURST_in,
        AXI_12_ARESET_N      => AXI_12_ARESET_N_in,
        AXI_12_ARID          => AXI_12_ARID_in,
        AXI_12_ARLEN         => AXI_12_ARLEN_in,
        AXI_12_ARSIZE        => AXI_12_ARSIZE_in,
        AXI_12_ARVALID       => AXI_12_ARVALID_in,
        AXI_12_AWADDR        => AXI_12_AWADDR_in,
        AXI_12_AWBURST       => AXI_12_AWBURST_in,
        AXI_12_AWID          => AXI_12_AWID_in,
        AXI_12_AWLEN         => AXI_12_AWLEN_in,
        AXI_12_AWSIZE        => AXI_12_AWSIZE_in,
        AXI_12_AWVALID       => AXI_12_AWVALID_in,
        AXI_12_BREADY        => AXI_12_BREADY_in,
        AXI_12_DFI_LP_PWR_X_REQ => AXI_12_DFI_LP_PWR_X_REQ_in,
        AXI_12_RREADY        => AXI_12_RREADY_in,
        AXI_12_WDATA         => AXI_12_WDATA_in,
        AXI_12_WDATA_PARITY  => AXI_12_WDATA_PARITY_in,
        AXI_12_WLAST         => AXI_12_WLAST_in,
        AXI_12_WSTRB         => AXI_12_WSTRB_in,
        AXI_12_WVALID        => AXI_12_WVALID_in,
        AXI_13_ACLK          => AXI_13_ACLK_in,
        AXI_13_ARADDR        => AXI_13_ARADDR_in,
        AXI_13_ARBURST       => AXI_13_ARBURST_in,
        AXI_13_ARESET_N      => AXI_13_ARESET_N_in,
        AXI_13_ARID          => AXI_13_ARID_in,
        AXI_13_ARLEN         => AXI_13_ARLEN_in,
        AXI_13_ARSIZE        => AXI_13_ARSIZE_in,
        AXI_13_ARVALID       => AXI_13_ARVALID_in,
        AXI_13_AWADDR        => AXI_13_AWADDR_in,
        AXI_13_AWBURST       => AXI_13_AWBURST_in,
        AXI_13_AWID          => AXI_13_AWID_in,
        AXI_13_AWLEN         => AXI_13_AWLEN_in,
        AXI_13_AWSIZE        => AXI_13_AWSIZE_in,
        AXI_13_AWVALID       => AXI_13_AWVALID_in,
        AXI_13_BREADY        => AXI_13_BREADY_in,
        AXI_13_DFI_LP_PWR_X_REQ => AXI_13_DFI_LP_PWR_X_REQ_in,
        AXI_13_RREADY        => AXI_13_RREADY_in,
        AXI_13_WDATA         => AXI_13_WDATA_in,
        AXI_13_WDATA_PARITY  => AXI_13_WDATA_PARITY_in,
        AXI_13_WLAST         => AXI_13_WLAST_in,
        AXI_13_WSTRB         => AXI_13_WSTRB_in,
        AXI_13_WVALID        => AXI_13_WVALID_in,
        AXI_14_ACLK          => AXI_14_ACLK_in,
        AXI_14_ARADDR        => AXI_14_ARADDR_in,
        AXI_14_ARBURST       => AXI_14_ARBURST_in,
        AXI_14_ARESET_N      => AXI_14_ARESET_N_in,
        AXI_14_ARID          => AXI_14_ARID_in,
        AXI_14_ARLEN         => AXI_14_ARLEN_in,
        AXI_14_ARSIZE        => AXI_14_ARSIZE_in,
        AXI_14_ARVALID       => AXI_14_ARVALID_in,
        AXI_14_AWADDR        => AXI_14_AWADDR_in,
        AXI_14_AWBURST       => AXI_14_AWBURST_in,
        AXI_14_AWID          => AXI_14_AWID_in,
        AXI_14_AWLEN         => AXI_14_AWLEN_in,
        AXI_14_AWSIZE        => AXI_14_AWSIZE_in,
        AXI_14_AWVALID       => AXI_14_AWVALID_in,
        AXI_14_BREADY        => AXI_14_BREADY_in,
        AXI_14_DFI_LP_PWR_X_REQ => AXI_14_DFI_LP_PWR_X_REQ_in,
        AXI_14_RREADY        => AXI_14_RREADY_in,
        AXI_14_WDATA         => AXI_14_WDATA_in,
        AXI_14_WDATA_PARITY  => AXI_14_WDATA_PARITY_in,
        AXI_14_WLAST         => AXI_14_WLAST_in,
        AXI_14_WSTRB         => AXI_14_WSTRB_in,
        AXI_14_WVALID        => AXI_14_WVALID_in,
        AXI_15_ACLK          => AXI_15_ACLK_in,
        AXI_15_ARADDR        => AXI_15_ARADDR_in,
        AXI_15_ARBURST       => AXI_15_ARBURST_in,
        AXI_15_ARESET_N      => AXI_15_ARESET_N_in,
        AXI_15_ARID          => AXI_15_ARID_in,
        AXI_15_ARLEN         => AXI_15_ARLEN_in,
        AXI_15_ARSIZE        => AXI_15_ARSIZE_in,
        AXI_15_ARVALID       => AXI_15_ARVALID_in,
        AXI_15_AWADDR        => AXI_15_AWADDR_in,
        AXI_15_AWBURST       => AXI_15_AWBURST_in,
        AXI_15_AWID          => AXI_15_AWID_in,
        AXI_15_AWLEN         => AXI_15_AWLEN_in,
        AXI_15_AWSIZE        => AXI_15_AWSIZE_in,
        AXI_15_AWVALID       => AXI_15_AWVALID_in,
        AXI_15_BREADY        => AXI_15_BREADY_in,
        AXI_15_DFI_LP_PWR_X_REQ => AXI_15_DFI_LP_PWR_X_REQ_in,
        AXI_15_RREADY        => AXI_15_RREADY_in,
        AXI_15_WDATA         => AXI_15_WDATA_in,
        AXI_15_WDATA_PARITY  => AXI_15_WDATA_PARITY_in,
        AXI_15_WLAST         => AXI_15_WLAST_in,
        AXI_15_WSTRB         => AXI_15_WSTRB_in,
        AXI_15_WVALID        => AXI_15_WVALID_in,
        AXI_16_ACLK          => AXI_16_ACLK_in,
        AXI_16_ARADDR        => AXI_16_ARADDR_in,
        AXI_16_ARBURST       => AXI_16_ARBURST_in,
        AXI_16_ARESET_N      => AXI_16_ARESET_N_in,
        AXI_16_ARID          => AXI_16_ARID_in,
        AXI_16_ARLEN         => AXI_16_ARLEN_in,
        AXI_16_ARSIZE        => AXI_16_ARSIZE_in,
        AXI_16_ARVALID       => AXI_16_ARVALID_in,
        AXI_16_AWADDR        => AXI_16_AWADDR_in,
        AXI_16_AWBURST       => AXI_16_AWBURST_in,
        AXI_16_AWID          => AXI_16_AWID_in,
        AXI_16_AWLEN         => AXI_16_AWLEN_in,
        AXI_16_AWSIZE        => AXI_16_AWSIZE_in,
        AXI_16_AWVALID       => AXI_16_AWVALID_in,
        AXI_16_BREADY        => AXI_16_BREADY_in,
        AXI_16_DFI_LP_PWR_X_REQ => AXI_16_DFI_LP_PWR_X_REQ_in,
        AXI_16_RREADY        => AXI_16_RREADY_in,
        AXI_16_WDATA         => AXI_16_WDATA_in,
        AXI_16_WDATA_PARITY  => AXI_16_WDATA_PARITY_in,
        AXI_16_WLAST         => AXI_16_WLAST_in,
        AXI_16_WSTRB         => AXI_16_WSTRB_in,
        AXI_16_WVALID        => AXI_16_WVALID_in,
        AXI_17_ACLK          => AXI_17_ACLK_in,
        AXI_17_ARADDR        => AXI_17_ARADDR_in,
        AXI_17_ARBURST       => AXI_17_ARBURST_in,
        AXI_17_ARESET_N      => AXI_17_ARESET_N_in,
        AXI_17_ARID          => AXI_17_ARID_in,
        AXI_17_ARLEN         => AXI_17_ARLEN_in,
        AXI_17_ARSIZE        => AXI_17_ARSIZE_in,
        AXI_17_ARVALID       => AXI_17_ARVALID_in,
        AXI_17_AWADDR        => AXI_17_AWADDR_in,
        AXI_17_AWBURST       => AXI_17_AWBURST_in,
        AXI_17_AWID          => AXI_17_AWID_in,
        AXI_17_AWLEN         => AXI_17_AWLEN_in,
        AXI_17_AWSIZE        => AXI_17_AWSIZE_in,
        AXI_17_AWVALID       => AXI_17_AWVALID_in,
        AXI_17_BREADY        => AXI_17_BREADY_in,
        AXI_17_DFI_LP_PWR_X_REQ => AXI_17_DFI_LP_PWR_X_REQ_in,
        AXI_17_RREADY        => AXI_17_RREADY_in,
        AXI_17_WDATA         => AXI_17_WDATA_in,
        AXI_17_WDATA_PARITY  => AXI_17_WDATA_PARITY_in,
        AXI_17_WLAST         => AXI_17_WLAST_in,
        AXI_17_WSTRB         => AXI_17_WSTRB_in,
        AXI_17_WVALID        => AXI_17_WVALID_in,
        AXI_18_ACLK          => AXI_18_ACLK_in,
        AXI_18_ARADDR        => AXI_18_ARADDR_in,
        AXI_18_ARBURST       => AXI_18_ARBURST_in,
        AXI_18_ARESET_N      => AXI_18_ARESET_N_in,
        AXI_18_ARID          => AXI_18_ARID_in,
        AXI_18_ARLEN         => AXI_18_ARLEN_in,
        AXI_18_ARSIZE        => AXI_18_ARSIZE_in,
        AXI_18_ARVALID       => AXI_18_ARVALID_in,
        AXI_18_AWADDR        => AXI_18_AWADDR_in,
        AXI_18_AWBURST       => AXI_18_AWBURST_in,
        AXI_18_AWID          => AXI_18_AWID_in,
        AXI_18_AWLEN         => AXI_18_AWLEN_in,
        AXI_18_AWSIZE        => AXI_18_AWSIZE_in,
        AXI_18_AWVALID       => AXI_18_AWVALID_in,
        AXI_18_BREADY        => AXI_18_BREADY_in,
        AXI_18_DFI_LP_PWR_X_REQ => AXI_18_DFI_LP_PWR_X_REQ_in,
        AXI_18_RREADY        => AXI_18_RREADY_in,
        AXI_18_WDATA         => AXI_18_WDATA_in,
        AXI_18_WDATA_PARITY  => AXI_18_WDATA_PARITY_in,
        AXI_18_WLAST         => AXI_18_WLAST_in,
        AXI_18_WSTRB         => AXI_18_WSTRB_in,
        AXI_18_WVALID        => AXI_18_WVALID_in,
        AXI_19_ACLK          => AXI_19_ACLK_in,
        AXI_19_ARADDR        => AXI_19_ARADDR_in,
        AXI_19_ARBURST       => AXI_19_ARBURST_in,
        AXI_19_ARESET_N      => AXI_19_ARESET_N_in,
        AXI_19_ARID          => AXI_19_ARID_in,
        AXI_19_ARLEN         => AXI_19_ARLEN_in,
        AXI_19_ARSIZE        => AXI_19_ARSIZE_in,
        AXI_19_ARVALID       => AXI_19_ARVALID_in,
        AXI_19_AWADDR        => AXI_19_AWADDR_in,
        AXI_19_AWBURST       => AXI_19_AWBURST_in,
        AXI_19_AWID          => AXI_19_AWID_in,
        AXI_19_AWLEN         => AXI_19_AWLEN_in,
        AXI_19_AWSIZE        => AXI_19_AWSIZE_in,
        AXI_19_AWVALID       => AXI_19_AWVALID_in,
        AXI_19_BREADY        => AXI_19_BREADY_in,
        AXI_19_DFI_LP_PWR_X_REQ => AXI_19_DFI_LP_PWR_X_REQ_in,
        AXI_19_RREADY        => AXI_19_RREADY_in,
        AXI_19_WDATA         => AXI_19_WDATA_in,
        AXI_19_WDATA_PARITY  => AXI_19_WDATA_PARITY_in,
        AXI_19_WLAST         => AXI_19_WLAST_in,
        AXI_19_WSTRB         => AXI_19_WSTRB_in,
        AXI_19_WVALID        => AXI_19_WVALID_in,
        AXI_20_ACLK          => AXI_20_ACLK_in,
        AXI_20_ARADDR        => AXI_20_ARADDR_in,
        AXI_20_ARBURST       => AXI_20_ARBURST_in,
        AXI_20_ARESET_N      => AXI_20_ARESET_N_in,
        AXI_20_ARID          => AXI_20_ARID_in,
        AXI_20_ARLEN         => AXI_20_ARLEN_in,
        AXI_20_ARSIZE        => AXI_20_ARSIZE_in,
        AXI_20_ARVALID       => AXI_20_ARVALID_in,
        AXI_20_AWADDR        => AXI_20_AWADDR_in,
        AXI_20_AWBURST       => AXI_20_AWBURST_in,
        AXI_20_AWID          => AXI_20_AWID_in,
        AXI_20_AWLEN         => AXI_20_AWLEN_in,
        AXI_20_AWSIZE        => AXI_20_AWSIZE_in,
        AXI_20_AWVALID       => AXI_20_AWVALID_in,
        AXI_20_BREADY        => AXI_20_BREADY_in,
        AXI_20_DFI_LP_PWR_X_REQ => AXI_20_DFI_LP_PWR_X_REQ_in,
        AXI_20_RREADY        => AXI_20_RREADY_in,
        AXI_20_WDATA         => AXI_20_WDATA_in,
        AXI_20_WDATA_PARITY  => AXI_20_WDATA_PARITY_in,
        AXI_20_WLAST         => AXI_20_WLAST_in,
        AXI_20_WSTRB         => AXI_20_WSTRB_in,
        AXI_20_WVALID        => AXI_20_WVALID_in,
        AXI_21_ACLK          => AXI_21_ACLK_in,
        AXI_21_ARADDR        => AXI_21_ARADDR_in,
        AXI_21_ARBURST       => AXI_21_ARBURST_in,
        AXI_21_ARESET_N      => AXI_21_ARESET_N_in,
        AXI_21_ARID          => AXI_21_ARID_in,
        AXI_21_ARLEN         => AXI_21_ARLEN_in,
        AXI_21_ARSIZE        => AXI_21_ARSIZE_in,
        AXI_21_ARVALID       => AXI_21_ARVALID_in,
        AXI_21_AWADDR        => AXI_21_AWADDR_in,
        AXI_21_AWBURST       => AXI_21_AWBURST_in,
        AXI_21_AWID          => AXI_21_AWID_in,
        AXI_21_AWLEN         => AXI_21_AWLEN_in,
        AXI_21_AWSIZE        => AXI_21_AWSIZE_in,
        AXI_21_AWVALID       => AXI_21_AWVALID_in,
        AXI_21_BREADY        => AXI_21_BREADY_in,
        AXI_21_DFI_LP_PWR_X_REQ => AXI_21_DFI_LP_PWR_X_REQ_in,
        AXI_21_RREADY        => AXI_21_RREADY_in,
        AXI_21_WDATA         => AXI_21_WDATA_in,
        AXI_21_WDATA_PARITY  => AXI_21_WDATA_PARITY_in,
        AXI_21_WLAST         => AXI_21_WLAST_in,
        AXI_21_WSTRB         => AXI_21_WSTRB_in,
        AXI_21_WVALID        => AXI_21_WVALID_in,
        AXI_22_ACLK          => AXI_22_ACLK_in,
        AXI_22_ARADDR        => AXI_22_ARADDR_in,
        AXI_22_ARBURST       => AXI_22_ARBURST_in,
        AXI_22_ARESET_N      => AXI_22_ARESET_N_in,
        AXI_22_ARID          => AXI_22_ARID_in,
        AXI_22_ARLEN         => AXI_22_ARLEN_in,
        AXI_22_ARSIZE        => AXI_22_ARSIZE_in,
        AXI_22_ARVALID       => AXI_22_ARVALID_in,
        AXI_22_AWADDR        => AXI_22_AWADDR_in,
        AXI_22_AWBURST       => AXI_22_AWBURST_in,
        AXI_22_AWID          => AXI_22_AWID_in,
        AXI_22_AWLEN         => AXI_22_AWLEN_in,
        AXI_22_AWSIZE        => AXI_22_AWSIZE_in,
        AXI_22_AWVALID       => AXI_22_AWVALID_in,
        AXI_22_BREADY        => AXI_22_BREADY_in,
        AXI_22_DFI_LP_PWR_X_REQ => AXI_22_DFI_LP_PWR_X_REQ_in,
        AXI_22_RREADY        => AXI_22_RREADY_in,
        AXI_22_WDATA         => AXI_22_WDATA_in,
        AXI_22_WDATA_PARITY  => AXI_22_WDATA_PARITY_in,
        AXI_22_WLAST         => AXI_22_WLAST_in,
        AXI_22_WSTRB         => AXI_22_WSTRB_in,
        AXI_22_WVALID        => AXI_22_WVALID_in,
        AXI_23_ACLK          => AXI_23_ACLK_in,
        AXI_23_ARADDR        => AXI_23_ARADDR_in,
        AXI_23_ARBURST       => AXI_23_ARBURST_in,
        AXI_23_ARESET_N      => AXI_23_ARESET_N_in,
        AXI_23_ARID          => AXI_23_ARID_in,
        AXI_23_ARLEN         => AXI_23_ARLEN_in,
        AXI_23_ARSIZE        => AXI_23_ARSIZE_in,
        AXI_23_ARVALID       => AXI_23_ARVALID_in,
        AXI_23_AWADDR        => AXI_23_AWADDR_in,
        AXI_23_AWBURST       => AXI_23_AWBURST_in,
        AXI_23_AWID          => AXI_23_AWID_in,
        AXI_23_AWLEN         => AXI_23_AWLEN_in,
        AXI_23_AWSIZE        => AXI_23_AWSIZE_in,
        AXI_23_AWVALID       => AXI_23_AWVALID_in,
        AXI_23_BREADY        => AXI_23_BREADY_in,
        AXI_23_DFI_LP_PWR_X_REQ => AXI_23_DFI_LP_PWR_X_REQ_in,
        AXI_23_RREADY        => AXI_23_RREADY_in,
        AXI_23_WDATA         => AXI_23_WDATA_in,
        AXI_23_WDATA_PARITY  => AXI_23_WDATA_PARITY_in,
        AXI_23_WLAST         => AXI_23_WLAST_in,
        AXI_23_WSTRB         => AXI_23_WSTRB_in,
        AXI_23_WVALID        => AXI_23_WVALID_in,
        AXI_24_ACLK          => AXI_24_ACLK_in,
        AXI_24_ARADDR        => AXI_24_ARADDR_in,
        AXI_24_ARBURST       => AXI_24_ARBURST_in,
        AXI_24_ARESET_N      => AXI_24_ARESET_N_in,
        AXI_24_ARID          => AXI_24_ARID_in,
        AXI_24_ARLEN         => AXI_24_ARLEN_in,
        AXI_24_ARSIZE        => AXI_24_ARSIZE_in,
        AXI_24_ARVALID       => AXI_24_ARVALID_in,
        AXI_24_AWADDR        => AXI_24_AWADDR_in,
        AXI_24_AWBURST       => AXI_24_AWBURST_in,
        AXI_24_AWID          => AXI_24_AWID_in,
        AXI_24_AWLEN         => AXI_24_AWLEN_in,
        AXI_24_AWSIZE        => AXI_24_AWSIZE_in,
        AXI_24_AWVALID       => AXI_24_AWVALID_in,
        AXI_24_BREADY        => AXI_24_BREADY_in,
        AXI_24_DFI_LP_PWR_X_REQ => AXI_24_DFI_LP_PWR_X_REQ_in,
        AXI_24_RREADY        => AXI_24_RREADY_in,
        AXI_24_WDATA         => AXI_24_WDATA_in,
        AXI_24_WDATA_PARITY  => AXI_24_WDATA_PARITY_in,
        AXI_24_WLAST         => AXI_24_WLAST_in,
        AXI_24_WSTRB         => AXI_24_WSTRB_in,
        AXI_24_WVALID        => AXI_24_WVALID_in,
        AXI_25_ACLK          => AXI_25_ACLK_in,
        AXI_25_ARADDR        => AXI_25_ARADDR_in,
        AXI_25_ARBURST       => AXI_25_ARBURST_in,
        AXI_25_ARESET_N      => AXI_25_ARESET_N_in,
        AXI_25_ARID          => AXI_25_ARID_in,
        AXI_25_ARLEN         => AXI_25_ARLEN_in,
        AXI_25_ARSIZE        => AXI_25_ARSIZE_in,
        AXI_25_ARVALID       => AXI_25_ARVALID_in,
        AXI_25_AWADDR        => AXI_25_AWADDR_in,
        AXI_25_AWBURST       => AXI_25_AWBURST_in,
        AXI_25_AWID          => AXI_25_AWID_in,
        AXI_25_AWLEN         => AXI_25_AWLEN_in,
        AXI_25_AWSIZE        => AXI_25_AWSIZE_in,
        AXI_25_AWVALID       => AXI_25_AWVALID_in,
        AXI_25_BREADY        => AXI_25_BREADY_in,
        AXI_25_DFI_LP_PWR_X_REQ => AXI_25_DFI_LP_PWR_X_REQ_in,
        AXI_25_RREADY        => AXI_25_RREADY_in,
        AXI_25_WDATA         => AXI_25_WDATA_in,
        AXI_25_WDATA_PARITY  => AXI_25_WDATA_PARITY_in,
        AXI_25_WLAST         => AXI_25_WLAST_in,
        AXI_25_WSTRB         => AXI_25_WSTRB_in,
        AXI_25_WVALID        => AXI_25_WVALID_in,
        AXI_26_ACLK          => AXI_26_ACLK_in,
        AXI_26_ARADDR        => AXI_26_ARADDR_in,
        AXI_26_ARBURST       => AXI_26_ARBURST_in,
        AXI_26_ARESET_N      => AXI_26_ARESET_N_in,
        AXI_26_ARID          => AXI_26_ARID_in,
        AXI_26_ARLEN         => AXI_26_ARLEN_in,
        AXI_26_ARSIZE        => AXI_26_ARSIZE_in,
        AXI_26_ARVALID       => AXI_26_ARVALID_in,
        AXI_26_AWADDR        => AXI_26_AWADDR_in,
        AXI_26_AWBURST       => AXI_26_AWBURST_in,
        AXI_26_AWID          => AXI_26_AWID_in,
        AXI_26_AWLEN         => AXI_26_AWLEN_in,
        AXI_26_AWSIZE        => AXI_26_AWSIZE_in,
        AXI_26_AWVALID       => AXI_26_AWVALID_in,
        AXI_26_BREADY        => AXI_26_BREADY_in,
        AXI_26_DFI_LP_PWR_X_REQ => AXI_26_DFI_LP_PWR_X_REQ_in,
        AXI_26_RREADY        => AXI_26_RREADY_in,
        AXI_26_WDATA         => AXI_26_WDATA_in,
        AXI_26_WDATA_PARITY  => AXI_26_WDATA_PARITY_in,
        AXI_26_WLAST         => AXI_26_WLAST_in,
        AXI_26_WSTRB         => AXI_26_WSTRB_in,
        AXI_26_WVALID        => AXI_26_WVALID_in,
        AXI_27_ACLK          => AXI_27_ACLK_in,
        AXI_27_ARADDR        => AXI_27_ARADDR_in,
        AXI_27_ARBURST       => AXI_27_ARBURST_in,
        AXI_27_ARESET_N      => AXI_27_ARESET_N_in,
        AXI_27_ARID          => AXI_27_ARID_in,
        AXI_27_ARLEN         => AXI_27_ARLEN_in,
        AXI_27_ARSIZE        => AXI_27_ARSIZE_in,
        AXI_27_ARVALID       => AXI_27_ARVALID_in,
        AXI_27_AWADDR        => AXI_27_AWADDR_in,
        AXI_27_AWBURST       => AXI_27_AWBURST_in,
        AXI_27_AWID          => AXI_27_AWID_in,
        AXI_27_AWLEN         => AXI_27_AWLEN_in,
        AXI_27_AWSIZE        => AXI_27_AWSIZE_in,
        AXI_27_AWVALID       => AXI_27_AWVALID_in,
        AXI_27_BREADY        => AXI_27_BREADY_in,
        AXI_27_DFI_LP_PWR_X_REQ => AXI_27_DFI_LP_PWR_X_REQ_in,
        AXI_27_RREADY        => AXI_27_RREADY_in,
        AXI_27_WDATA         => AXI_27_WDATA_in,
        AXI_27_WDATA_PARITY  => AXI_27_WDATA_PARITY_in,
        AXI_27_WLAST         => AXI_27_WLAST_in,
        AXI_27_WSTRB         => AXI_27_WSTRB_in,
        AXI_27_WVALID        => AXI_27_WVALID_in,
        AXI_28_ACLK          => AXI_28_ACLK_in,
        AXI_28_ARADDR        => AXI_28_ARADDR_in,
        AXI_28_ARBURST       => AXI_28_ARBURST_in,
        AXI_28_ARESET_N      => AXI_28_ARESET_N_in,
        AXI_28_ARID          => AXI_28_ARID_in,
        AXI_28_ARLEN         => AXI_28_ARLEN_in,
        AXI_28_ARSIZE        => AXI_28_ARSIZE_in,
        AXI_28_ARVALID       => AXI_28_ARVALID_in,
        AXI_28_AWADDR        => AXI_28_AWADDR_in,
        AXI_28_AWBURST       => AXI_28_AWBURST_in,
        AXI_28_AWID          => AXI_28_AWID_in,
        AXI_28_AWLEN         => AXI_28_AWLEN_in,
        AXI_28_AWSIZE        => AXI_28_AWSIZE_in,
        AXI_28_AWVALID       => AXI_28_AWVALID_in,
        AXI_28_BREADY        => AXI_28_BREADY_in,
        AXI_28_DFI_LP_PWR_X_REQ => AXI_28_DFI_LP_PWR_X_REQ_in,
        AXI_28_RREADY        => AXI_28_RREADY_in,
        AXI_28_WDATA         => AXI_28_WDATA_in,
        AXI_28_WDATA_PARITY  => AXI_28_WDATA_PARITY_in,
        AXI_28_WLAST         => AXI_28_WLAST_in,
        AXI_28_WSTRB         => AXI_28_WSTRB_in,
        AXI_28_WVALID        => AXI_28_WVALID_in,
        AXI_29_ACLK          => AXI_29_ACLK_in,
        AXI_29_ARADDR        => AXI_29_ARADDR_in,
        AXI_29_ARBURST       => AXI_29_ARBURST_in,
        AXI_29_ARESET_N      => AXI_29_ARESET_N_in,
        AXI_29_ARID          => AXI_29_ARID_in,
        AXI_29_ARLEN         => AXI_29_ARLEN_in,
        AXI_29_ARSIZE        => AXI_29_ARSIZE_in,
        AXI_29_ARVALID       => AXI_29_ARVALID_in,
        AXI_29_AWADDR        => AXI_29_AWADDR_in,
        AXI_29_AWBURST       => AXI_29_AWBURST_in,
        AXI_29_AWID          => AXI_29_AWID_in,
        AXI_29_AWLEN         => AXI_29_AWLEN_in,
        AXI_29_AWSIZE        => AXI_29_AWSIZE_in,
        AXI_29_AWVALID       => AXI_29_AWVALID_in,
        AXI_29_BREADY        => AXI_29_BREADY_in,
        AXI_29_DFI_LP_PWR_X_REQ => AXI_29_DFI_LP_PWR_X_REQ_in,
        AXI_29_RREADY        => AXI_29_RREADY_in,
        AXI_29_WDATA         => AXI_29_WDATA_in,
        AXI_29_WDATA_PARITY  => AXI_29_WDATA_PARITY_in,
        AXI_29_WLAST         => AXI_29_WLAST_in,
        AXI_29_WSTRB         => AXI_29_WSTRB_in,
        AXI_29_WVALID        => AXI_29_WVALID_in,
        AXI_30_ACLK          => AXI_30_ACLK_in,
        AXI_30_ARADDR        => AXI_30_ARADDR_in,
        AXI_30_ARBURST       => AXI_30_ARBURST_in,
        AXI_30_ARESET_N      => AXI_30_ARESET_N_in,
        AXI_30_ARID          => AXI_30_ARID_in,
        AXI_30_ARLEN         => AXI_30_ARLEN_in,
        AXI_30_ARSIZE        => AXI_30_ARSIZE_in,
        AXI_30_ARVALID       => AXI_30_ARVALID_in,
        AXI_30_AWADDR        => AXI_30_AWADDR_in,
        AXI_30_AWBURST       => AXI_30_AWBURST_in,
        AXI_30_AWID          => AXI_30_AWID_in,
        AXI_30_AWLEN         => AXI_30_AWLEN_in,
        AXI_30_AWSIZE        => AXI_30_AWSIZE_in,
        AXI_30_AWVALID       => AXI_30_AWVALID_in,
        AXI_30_BREADY        => AXI_30_BREADY_in,
        AXI_30_DFI_LP_PWR_X_REQ => AXI_30_DFI_LP_PWR_X_REQ_in,
        AXI_30_RREADY        => AXI_30_RREADY_in,
        AXI_30_WDATA         => AXI_30_WDATA_in,
        AXI_30_WDATA_PARITY  => AXI_30_WDATA_PARITY_in,
        AXI_30_WLAST         => AXI_30_WLAST_in,
        AXI_30_WSTRB         => AXI_30_WSTRB_in,
        AXI_30_WVALID        => AXI_30_WVALID_in,
        AXI_31_ACLK          => AXI_31_ACLK_in,
        AXI_31_ARADDR        => AXI_31_ARADDR_in,
        AXI_31_ARBURST       => AXI_31_ARBURST_in,
        AXI_31_ARESET_N      => AXI_31_ARESET_N_in,
        AXI_31_ARID          => AXI_31_ARID_in,
        AXI_31_ARLEN         => AXI_31_ARLEN_in,
        AXI_31_ARSIZE        => AXI_31_ARSIZE_in,
        AXI_31_ARVALID       => AXI_31_ARVALID_in,
        AXI_31_AWADDR        => AXI_31_AWADDR_in,
        AXI_31_AWBURST       => AXI_31_AWBURST_in,
        AXI_31_AWID          => AXI_31_AWID_in,
        AXI_31_AWLEN         => AXI_31_AWLEN_in,
        AXI_31_AWSIZE        => AXI_31_AWSIZE_in,
        AXI_31_AWVALID       => AXI_31_AWVALID_in,
        AXI_31_BREADY        => AXI_31_BREADY_in,
        AXI_31_DFI_LP_PWR_X_REQ => AXI_31_DFI_LP_PWR_X_REQ_in,
        AXI_31_RREADY        => AXI_31_RREADY_in,
        AXI_31_WDATA         => AXI_31_WDATA_in,
        AXI_31_WDATA_PARITY  => AXI_31_WDATA_PARITY_in,
        AXI_31_WLAST         => AXI_31_WLAST_in,
        AXI_31_WSTRB         => AXI_31_WSTRB_in,
        AXI_31_WVALID        => AXI_31_WVALID_in,
        BLI_SCAN_ENABLE_00   => BLI_SCAN_ENABLE_00_in,
        BLI_SCAN_ENABLE_01   => BLI_SCAN_ENABLE_01_in,
        BLI_SCAN_ENABLE_02   => BLI_SCAN_ENABLE_02_in,
        BLI_SCAN_ENABLE_03   => BLI_SCAN_ENABLE_03_in,
        BLI_SCAN_ENABLE_04   => BLI_SCAN_ENABLE_04_in,
        BLI_SCAN_ENABLE_05   => BLI_SCAN_ENABLE_05_in,
        BLI_SCAN_ENABLE_06   => BLI_SCAN_ENABLE_06_in,
        BLI_SCAN_ENABLE_07   => BLI_SCAN_ENABLE_07_in,
        BLI_SCAN_ENABLE_08   => BLI_SCAN_ENABLE_08_in,
        BLI_SCAN_ENABLE_09   => BLI_SCAN_ENABLE_09_in,
        BLI_SCAN_ENABLE_10   => BLI_SCAN_ENABLE_10_in,
        BLI_SCAN_ENABLE_11   => BLI_SCAN_ENABLE_11_in,
        BLI_SCAN_ENABLE_12   => BLI_SCAN_ENABLE_12_in,
        BLI_SCAN_ENABLE_13   => BLI_SCAN_ENABLE_13_in,
        BLI_SCAN_ENABLE_14   => BLI_SCAN_ENABLE_14_in,
        BLI_SCAN_ENABLE_15   => BLI_SCAN_ENABLE_15_in,
        BLI_SCAN_ENABLE_16   => BLI_SCAN_ENABLE_16_in,
        BLI_SCAN_ENABLE_17   => BLI_SCAN_ENABLE_17_in,
        BLI_SCAN_ENABLE_18   => BLI_SCAN_ENABLE_18_in,
        BLI_SCAN_ENABLE_19   => BLI_SCAN_ENABLE_19_in,
        BLI_SCAN_ENABLE_20   => BLI_SCAN_ENABLE_20_in,
        BLI_SCAN_ENABLE_21   => BLI_SCAN_ENABLE_21_in,
        BLI_SCAN_ENABLE_22   => BLI_SCAN_ENABLE_22_in,
        BLI_SCAN_ENABLE_23   => BLI_SCAN_ENABLE_23_in,
        BLI_SCAN_ENABLE_24   => BLI_SCAN_ENABLE_24_in,
        BLI_SCAN_ENABLE_25   => BLI_SCAN_ENABLE_25_in,
        BLI_SCAN_ENABLE_26   => BLI_SCAN_ENABLE_26_in,
        BLI_SCAN_ENABLE_27   => BLI_SCAN_ENABLE_27_in,
        BLI_SCAN_ENABLE_28   => BLI_SCAN_ENABLE_28_in,
        BLI_SCAN_ENABLE_29   => BLI_SCAN_ENABLE_29_in,
        BLI_SCAN_ENABLE_30   => BLI_SCAN_ENABLE_30_in,
        BLI_SCAN_ENABLE_31   => BLI_SCAN_ENABLE_31_in,
        BLI_SCAN_IN_00       => BLI_SCAN_IN_00_in,
        BLI_SCAN_IN_01       => BLI_SCAN_IN_01_in,
        BLI_SCAN_IN_02       => BLI_SCAN_IN_02_in,
        BLI_SCAN_IN_03       => BLI_SCAN_IN_03_in,
        BLI_SCAN_IN_04       => BLI_SCAN_IN_04_in,
        BLI_SCAN_IN_05       => BLI_SCAN_IN_05_in,
        BLI_SCAN_IN_06       => BLI_SCAN_IN_06_in,
        BLI_SCAN_IN_07       => BLI_SCAN_IN_07_in,
        BLI_SCAN_IN_08       => BLI_SCAN_IN_08_in,
        BLI_SCAN_IN_09       => BLI_SCAN_IN_09_in,
        BLI_SCAN_IN_10       => BLI_SCAN_IN_10_in,
        BLI_SCAN_IN_11       => BLI_SCAN_IN_11_in,
        BLI_SCAN_IN_12       => BLI_SCAN_IN_12_in,
        BLI_SCAN_IN_13       => BLI_SCAN_IN_13_in,
        BLI_SCAN_IN_14       => BLI_SCAN_IN_14_in,
        BLI_SCAN_IN_15       => BLI_SCAN_IN_15_in,
        BLI_SCAN_IN_16       => BLI_SCAN_IN_16_in,
        BLI_SCAN_IN_17       => BLI_SCAN_IN_17_in,
        BLI_SCAN_IN_18       => BLI_SCAN_IN_18_in,
        BLI_SCAN_IN_19       => BLI_SCAN_IN_19_in,
        BLI_SCAN_IN_20       => BLI_SCAN_IN_20_in,
        BLI_SCAN_IN_21       => BLI_SCAN_IN_21_in,
        BLI_SCAN_IN_22       => BLI_SCAN_IN_22_in,
        BLI_SCAN_IN_23       => BLI_SCAN_IN_23_in,
        BLI_SCAN_IN_24       => BLI_SCAN_IN_24_in,
        BLI_SCAN_IN_25       => BLI_SCAN_IN_25_in,
        BLI_SCAN_IN_26       => BLI_SCAN_IN_26_in,
        BLI_SCAN_IN_27       => BLI_SCAN_IN_27_in,
        BLI_SCAN_IN_28       => BLI_SCAN_IN_28_in,
        BLI_SCAN_IN_29       => BLI_SCAN_IN_29_in,
        BLI_SCAN_IN_30       => BLI_SCAN_IN_30_in,
        BLI_SCAN_IN_31       => BLI_SCAN_IN_31_in,
        BSCAN_DRCK_0         => BSCAN_DRCK_0_in,
        BSCAN_DRCK_1         => BSCAN_DRCK_1_in,
        BSCAN_TCK_0          => BSCAN_TCK_0_in,
        BSCAN_TCK_1          => BSCAN_TCK_1_in,
        DBG_IN_00            => DBG_IN_00_in,
        DBG_IN_01            => DBG_IN_01_in,
        DBG_IN_02            => DBG_IN_02_in,
        DBG_IN_03            => DBG_IN_03_in,
        DBG_IN_04            => DBG_IN_04_in,
        DBG_IN_05            => DBG_IN_05_in,
        DBG_IN_06            => DBG_IN_06_in,
        DBG_IN_07            => DBG_IN_07_in,
        DBG_IN_08            => DBG_IN_08_in,
        DBG_IN_09            => DBG_IN_09_in,
        DBG_IN_10            => DBG_IN_10_in,
        DBG_IN_11            => DBG_IN_11_in,
        DBG_IN_12            => DBG_IN_12_in,
        DBG_IN_13            => DBG_IN_13_in,
        DBG_IN_14            => DBG_IN_14_in,
        DBG_IN_15            => DBG_IN_15_in,
        DBG_IN_16            => DBG_IN_16_in,
        DBG_IN_17            => DBG_IN_17_in,
        DBG_IN_18            => DBG_IN_18_in,
        DBG_IN_19            => DBG_IN_19_in,
        DBG_IN_20            => DBG_IN_20_in,
        DBG_IN_21            => DBG_IN_21_in,
        DBG_IN_22            => DBG_IN_22_in,
        DBG_IN_23            => DBG_IN_23_in,
        DBG_IN_24            => DBG_IN_24_in,
        DBG_IN_25            => DBG_IN_25_in,
        DBG_IN_26            => DBG_IN_26_in,
        DBG_IN_27            => DBG_IN_27_in,
        DBG_IN_28            => DBG_IN_28_in,
        DBG_IN_29            => DBG_IN_29_in,
        DBG_IN_30            => DBG_IN_30_in,
        DBG_IN_31            => DBG_IN_31_in,
        DLL_SCAN_CK_00       => DLL_SCAN_CK_00_in,
        DLL_SCAN_CK_01       => DLL_SCAN_CK_01_in,
        DLL_SCAN_ENABLE_00   => DLL_SCAN_ENABLE_00_in,
        DLL_SCAN_ENABLE_01   => DLL_SCAN_ENABLE_01_in,
        DLL_SCAN_IN_00       => DLL_SCAN_IN_00_in,
        DLL_SCAN_IN_01       => DLL_SCAN_IN_01_in,
        DLL_SCAN_MODE_00     => DLL_SCAN_MODE_00_in,
        DLL_SCAN_MODE_01     => DLL_SCAN_MODE_01_in,
        DLL_SCAN_RST_N_00    => DLL_SCAN_RST_N_00_in,
        DLL_SCAN_RST_N_01    => DLL_SCAN_RST_N_01_in,
        HBM_REF_CLK_0        => HBM_REF_CLK_0_in,
        HBM_REF_CLK_1        => HBM_REF_CLK_1_in,
        IO_SCAN_CK_00        => IO_SCAN_CK_00_in,
        IO_SCAN_CK_01        => IO_SCAN_CK_01_in,
        IO_SCAN_ENABLE_00    => IO_SCAN_ENABLE_00_in,
        IO_SCAN_ENABLE_01    => IO_SCAN_ENABLE_01_in,
        IO_SCAN_IN_00        => IO_SCAN_IN_00_in,
        IO_SCAN_IN_01        => IO_SCAN_IN_01_in,
        IO_SCAN_MODE_00      => IO_SCAN_MODE_00_in,
        IO_SCAN_MODE_01      => IO_SCAN_MODE_01_in,
        IO_SCAN_RST_N_00     => IO_SCAN_RST_N_00_in,
        IO_SCAN_RST_N_01     => IO_SCAN_RST_N_01_in,
        MBIST_EN_00          => MBIST_EN_00_in,
        MBIST_EN_01          => MBIST_EN_01_in,
        MBIST_EN_02          => MBIST_EN_02_in,
        MBIST_EN_03          => MBIST_EN_03_in,
        MBIST_EN_04          => MBIST_EN_04_in,
        MBIST_EN_05          => MBIST_EN_05_in,
        MBIST_EN_06          => MBIST_EN_06_in,
        MBIST_EN_07          => MBIST_EN_07_in,
        MBIST_EN_08          => MBIST_EN_08_in,
        MBIST_EN_09          => MBIST_EN_09_in,
        MBIST_EN_10          => MBIST_EN_10_in,
        MBIST_EN_11          => MBIST_EN_11_in,
        MBIST_EN_12          => MBIST_EN_12_in,
        MBIST_EN_13          => MBIST_EN_13_in,
        MBIST_EN_14          => MBIST_EN_14_in,
        MBIST_EN_15          => MBIST_EN_15_in,
        MC_SCAN_CK_00        => MC_SCAN_CK_00_in,
        MC_SCAN_CK_01        => MC_SCAN_CK_01_in,
        MC_SCAN_CK_02        => MC_SCAN_CK_02_in,
        MC_SCAN_CK_03        => MC_SCAN_CK_03_in,
        MC_SCAN_CK_04        => MC_SCAN_CK_04_in,
        MC_SCAN_CK_05        => MC_SCAN_CK_05_in,
        MC_SCAN_CK_06        => MC_SCAN_CK_06_in,
        MC_SCAN_CK_07        => MC_SCAN_CK_07_in,
        MC_SCAN_CK_08        => MC_SCAN_CK_08_in,
        MC_SCAN_CK_09        => MC_SCAN_CK_09_in,
        MC_SCAN_CK_10        => MC_SCAN_CK_10_in,
        MC_SCAN_CK_11        => MC_SCAN_CK_11_in,
        MC_SCAN_CK_12        => MC_SCAN_CK_12_in,
        MC_SCAN_CK_13        => MC_SCAN_CK_13_in,
        MC_SCAN_CK_14        => MC_SCAN_CK_14_in,
        MC_SCAN_CK_15        => MC_SCAN_CK_15_in,
        MC_SCAN_ENABLE_00    => MC_SCAN_ENABLE_00_in,
        MC_SCAN_ENABLE_01    => MC_SCAN_ENABLE_01_in,
        MC_SCAN_ENABLE_02    => MC_SCAN_ENABLE_02_in,
        MC_SCAN_ENABLE_03    => MC_SCAN_ENABLE_03_in,
        MC_SCAN_ENABLE_04    => MC_SCAN_ENABLE_04_in,
        MC_SCAN_ENABLE_05    => MC_SCAN_ENABLE_05_in,
        MC_SCAN_ENABLE_06    => MC_SCAN_ENABLE_06_in,
        MC_SCAN_ENABLE_07    => MC_SCAN_ENABLE_07_in,
        MC_SCAN_ENABLE_08    => MC_SCAN_ENABLE_08_in,
        MC_SCAN_ENABLE_09    => MC_SCAN_ENABLE_09_in,
        MC_SCAN_ENABLE_10    => MC_SCAN_ENABLE_10_in,
        MC_SCAN_ENABLE_11    => MC_SCAN_ENABLE_11_in,
        MC_SCAN_ENABLE_12    => MC_SCAN_ENABLE_12_in,
        MC_SCAN_ENABLE_13    => MC_SCAN_ENABLE_13_in,
        MC_SCAN_ENABLE_14    => MC_SCAN_ENABLE_14_in,
        MC_SCAN_ENABLE_15    => MC_SCAN_ENABLE_15_in,
        MC_SCAN_IN_00        => MC_SCAN_IN_00_in,
        MC_SCAN_IN_01        => MC_SCAN_IN_01_in,
        MC_SCAN_IN_02        => MC_SCAN_IN_02_in,
        MC_SCAN_IN_03        => MC_SCAN_IN_03_in,
        MC_SCAN_IN_04        => MC_SCAN_IN_04_in,
        MC_SCAN_IN_05        => MC_SCAN_IN_05_in,
        MC_SCAN_IN_06        => MC_SCAN_IN_06_in,
        MC_SCAN_IN_07        => MC_SCAN_IN_07_in,
        MC_SCAN_IN_08        => MC_SCAN_IN_08_in,
        MC_SCAN_IN_09        => MC_SCAN_IN_09_in,
        MC_SCAN_IN_10        => MC_SCAN_IN_10_in,
        MC_SCAN_IN_11        => MC_SCAN_IN_11_in,
        MC_SCAN_IN_12        => MC_SCAN_IN_12_in,
        MC_SCAN_IN_13        => MC_SCAN_IN_13_in,
        MC_SCAN_IN_14        => MC_SCAN_IN_14_in,
        MC_SCAN_IN_15        => MC_SCAN_IN_15_in,
        MC_SCAN_MODE_00      => MC_SCAN_MODE_00_in,
        MC_SCAN_MODE_01      => MC_SCAN_MODE_01_in,
        MC_SCAN_MODE_02      => MC_SCAN_MODE_02_in,
        MC_SCAN_MODE_03      => MC_SCAN_MODE_03_in,
        MC_SCAN_MODE_04      => MC_SCAN_MODE_04_in,
        MC_SCAN_MODE_05      => MC_SCAN_MODE_05_in,
        MC_SCAN_MODE_06      => MC_SCAN_MODE_06_in,
        MC_SCAN_MODE_07      => MC_SCAN_MODE_07_in,
        MC_SCAN_MODE_08      => MC_SCAN_MODE_08_in,
        MC_SCAN_MODE_09      => MC_SCAN_MODE_09_in,
        MC_SCAN_MODE_10      => MC_SCAN_MODE_10_in,
        MC_SCAN_MODE_11      => MC_SCAN_MODE_11_in,
        MC_SCAN_MODE_12      => MC_SCAN_MODE_12_in,
        MC_SCAN_MODE_13      => MC_SCAN_MODE_13_in,
        MC_SCAN_MODE_14      => MC_SCAN_MODE_14_in,
        MC_SCAN_MODE_15      => MC_SCAN_MODE_15_in,
        MC_SCAN_RST_N_00     => MC_SCAN_RST_N_00_in,
        MC_SCAN_RST_N_01     => MC_SCAN_RST_N_01_in,
        MC_SCAN_RST_N_02     => MC_SCAN_RST_N_02_in,
        MC_SCAN_RST_N_03     => MC_SCAN_RST_N_03_in,
        MC_SCAN_RST_N_04     => MC_SCAN_RST_N_04_in,
        MC_SCAN_RST_N_05     => MC_SCAN_RST_N_05_in,
        MC_SCAN_RST_N_06     => MC_SCAN_RST_N_06_in,
        MC_SCAN_RST_N_07     => MC_SCAN_RST_N_07_in,
        MC_SCAN_RST_N_08     => MC_SCAN_RST_N_08_in,
        MC_SCAN_RST_N_09     => MC_SCAN_RST_N_09_in,
        MC_SCAN_RST_N_10     => MC_SCAN_RST_N_10_in,
        MC_SCAN_RST_N_11     => MC_SCAN_RST_N_11_in,
        MC_SCAN_RST_N_12     => MC_SCAN_RST_N_12_in,
        MC_SCAN_RST_N_13     => MC_SCAN_RST_N_13_in,
        MC_SCAN_RST_N_14     => MC_SCAN_RST_N_14_in,
        MC_SCAN_RST_N_15     => MC_SCAN_RST_N_15_in,
        PHY_SCAN_CK_00       => PHY_SCAN_CK_00_in,
        PHY_SCAN_CK_01       => PHY_SCAN_CK_01_in,
        PHY_SCAN_ENABLE_00   => PHY_SCAN_ENABLE_00_in,
        PHY_SCAN_ENABLE_01   => PHY_SCAN_ENABLE_01_in,
        PHY_SCAN_IN_00       => PHY_SCAN_IN_00_in,
        PHY_SCAN_IN_01       => PHY_SCAN_IN_01_in,
        PHY_SCAN_MODE_00     => PHY_SCAN_MODE_00_in,
        PHY_SCAN_MODE_01     => PHY_SCAN_MODE_01_in,
        PHY_SCAN_RST_N_00    => PHY_SCAN_RST_N_00_in,
        PHY_SCAN_RST_N_01    => PHY_SCAN_RST_N_01_in,
        SW_SCAN_CK_00        => SW_SCAN_CK_00_in,
        SW_SCAN_CK_01        => SW_SCAN_CK_01_in,
        SW_SCAN_ENABLE_00    => SW_SCAN_ENABLE_00_in,
        SW_SCAN_ENABLE_01    => SW_SCAN_ENABLE_01_in,
        SW_SCAN_IN_00        => SW_SCAN_IN_00_in,
        SW_SCAN_IN_01        => SW_SCAN_IN_01_in,
        SW_SCAN_IN_02        => SW_SCAN_IN_02_in,
        SW_SCAN_IN_03        => SW_SCAN_IN_03_in,
        SW_SCAN_IN_04        => SW_SCAN_IN_04_in,
        SW_SCAN_IN_05        => SW_SCAN_IN_05_in,
        SW_SCAN_IN_06        => SW_SCAN_IN_06_in,
        SW_SCAN_IN_07        => SW_SCAN_IN_07_in,
        SW_SCAN_MODE_00      => SW_SCAN_MODE_00_in,
        SW_SCAN_MODE_01      => SW_SCAN_MODE_01_in,
        SW_SCAN_RST_N_00     => SW_SCAN_RST_N_00_in,
        SW_SCAN_RST_N_01     => SW_SCAN_RST_N_01_in,
        GSR                  => glblGSR        
      );
  end HBM_TWO_STACK_INTF_V;
