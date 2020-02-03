-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        HBM_ONE_STACK_INTF
-- /___/   /\      Filename    : HBM_ONE_STACK_INTF.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL HBM_ONE_STACK_INTF -----

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

entity HBM_ONE_STACK_INTF is
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
    DATARATE_00 : integer := 1800;
    DATARATE_01 : integer := 1800;
    DATARATE_02 : integer := 1800;
    DATARATE_03 : integer := 1800;
    DATARATE_04 : integer := 1800;
    DATARATE_05 : integer := 1800;
    DATARATE_06 : integer := 1800;
    DATARATE_07 : integer := 1800;
    DA_LOCKOUT : string := "FALSE";
    IS_APB_0_PCLK_INVERTED : bit := '0';
    IS_APB_0_PRESET_N_INVERTED : bit := '0';
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
    MC_ENABLE_0 : string := "FALSE";
    MC_ENABLE_1 : string := "FALSE";
    MC_ENABLE_2 : string := "FALSE";
    MC_ENABLE_3 : string := "FALSE";
    MC_ENABLE_4 : string := "FALSE";
    MC_ENABLE_5 : string := "FALSE";
    MC_ENABLE_6 : string := "FALSE";
    MC_ENABLE_7 : string := "FALSE";
    MC_ENABLE_APB : string := "FALSE";
    PAGEHIT_PERCENT_00 : integer := 75;
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
    PHY_ENABLE_APB : string := "FALSE";
    PHY_PCLK_INVERT_01 : string := "FALSE";
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
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    STACK_LOCATION : integer := 0;
    SWITCH_ENABLE : string := "FALSE";
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
    WRITE_PERCENT_15 : integer := 50
  );
  
  port (
    APB_0_PRDATA         : out std_logic_vector(31 downto 0);
    APB_0_PREADY         : out std_ulogic;
    APB_0_PSLVERR        : out std_ulogic;
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
    DRAM_0_STAT_CATTRIP  : out std_ulogic;
    DRAM_0_STAT_TEMP     : out std_logic_vector(2 downto 0);
    APB_0_PADDR          : in std_logic_vector(21 downto 0);
    APB_0_PCLK           : in std_ulogic;
    APB_0_PENABLE        : in std_ulogic;
    APB_0_PRESET_N       : in std_ulogic;
    APB_0_PSEL           : in std_ulogic;
    APB_0_PWDATA         : in std_logic_vector(31 downto 0);
    APB_0_PWRITE         : in std_ulogic;
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
    BSCAN_DRCK           : in std_ulogic;
    BSCAN_TCK            : in std_ulogic;
    HBM_REF_CLK          : in std_ulogic;
    MBIST_EN_00          : in std_ulogic;
    MBIST_EN_01          : in std_ulogic;
    MBIST_EN_02          : in std_ulogic;
    MBIST_EN_03          : in std_ulogic;
    MBIST_EN_04          : in std_ulogic;
    MBIST_EN_05          : in std_ulogic;
    MBIST_EN_06          : in std_ulogic;
    MBIST_EN_07          : in std_ulogic
  );
end HBM_ONE_STACK_INTF;

architecture HBM_ONE_STACK_INTF_V of HBM_ONE_STACK_INTF is
  component SIP_HBM_ONE_STACK_INTF
    port (
      ANALOG_MUX_SEL_0     : in std_logic_vector(7 downto 0);
      APB_BYPASS_EN        : in std_logic_vector(39 downto 0);
      AXI_BYPASS_EN        : in std_logic_vector(39 downto 0);
      BLI_TESTMODE_SEL     : in std_logic_vector(39 downto 0);
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
      DATARATE_00          : in std_logic_vector(10 downto 0);
      DATARATE_01          : in std_logic_vector(10 downto 0);
      DATARATE_02          : in std_logic_vector(10 downto 0);
      DATARATE_03          : in std_logic_vector(10 downto 0);
      DATARATE_04          : in std_logic_vector(10 downto 0);
      DATARATE_05          : in std_logic_vector(10 downto 0);
      DATARATE_06          : in std_logic_vector(10 downto 0);
      DATARATE_07          : in std_logic_vector(10 downto 0);
      DA_LOCKOUT           : in std_logic_vector(39 downto 0);
      DBG_BYPASS_VAL       : in std_logic_vector(51 downto 0);
      DEBUG_MODE           : in std_logic_vector(39 downto 0);
      DFI_BYPASS_VAL       : in std_logic_vector(51 downto 0);
      DLL_TESTMODE_SEL_0   : in std_logic_vector(39 downto 0);
      IO_TESTMODE_SEL_0    : in std_logic_vector(39 downto 0);
      IS_APB_0_PCLK_INVERTED : in std_ulogic;
      IS_APB_0_PRESET_N_INVERTED : in std_ulogic;
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
      MC_CSSD_SEL_0        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_1        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_2        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_3        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_4        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_5        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_6        : in std_logic_vector(39 downto 0);
      MC_CSSD_SEL_7        : in std_logic_vector(39 downto 0);
      MC_ENABLE_0          : in std_logic_vector(39 downto 0);
      MC_ENABLE_1          : in std_logic_vector(39 downto 0);
      MC_ENABLE_2          : in std_logic_vector(39 downto 0);
      MC_ENABLE_3          : in std_logic_vector(39 downto 0);
      MC_ENABLE_4          : in std_logic_vector(39 downto 0);
      MC_ENABLE_5          : in std_logic_vector(39 downto 0);
      MC_ENABLE_6          : in std_logic_vector(39 downto 0);
      MC_ENABLE_7          : in std_logic_vector(39 downto 0);
      MC_ENABLE_APB        : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_0    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_1    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_2    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_3    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_4    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_5    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_6    : in std_logic_vector(39 downto 0);
      MC_TESTMODE_SEL_7    : in std_logic_vector(39 downto 0);
      PAGEHIT_PERCENT_00   : in std_logic_vector(6 downto 0);
      PHY_CSSD_SEL_0       : in std_logic_vector(39 downto 0);
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
      PHY_ENABLE_APB       : in std_logic_vector(39 downto 0);
      PHY_PCLK_INVERT_01   : in std_logic_vector(39 downto 0);
      PHY_TESTMODE_SEL_0   : in std_logic_vector(39 downto 0);
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
      STACK_LOCATION       : in std_logic_vector(0 downto 0);
      SWITCH_ENABLE        : in std_logic_vector(39 downto 0);
      SW_TESTMODE_SEL_0    : in std_logic_vector(39 downto 0);
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
      APB_0_PRDATA         : out std_logic_vector(31 downto 0);
      APB_0_PREADY         : out std_ulogic;
      APB_0_PSLVERR        : out std_ulogic;
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
      DLL_SCAN_OUT_00      : out std_logic_vector(1 downto 0);
      DRAM_0_STAT_CATTRIP  : out std_ulogic;
      DRAM_0_STAT_TEMP     : out std_logic_vector(2 downto 0);
      IO_SCAN_OUT_00       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_00       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_01       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_02       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_03       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_04       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_05       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_06       : out std_logic_vector(1 downto 0);
      MC_SCAN_OUT_07       : out std_logic_vector(1 downto 0);
      PHY_SCAN_OUT_00      : out std_logic_vector(1 downto 0);
      STATUS_00            : out std_logic_vector(1 downto 0);
      STATUS_01            : out std_logic_vector(1 downto 0);
      STATUS_02            : out std_logic_vector(1 downto 0);
      STATUS_03            : out std_logic_vector(1 downto 0);
      STATUS_04            : out std_logic_vector(1 downto 0);
      STATUS_05            : out std_logic_vector(1 downto 0);
      STATUS_06            : out std_logic_vector(1 downto 0);
      STATUS_07            : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_00       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_01       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_02       : out std_logic_vector(1 downto 0);
      SW_SCAN_OUT_03       : out std_logic_vector(1 downto 0);
      ANALOG_HBM_SEL_00    : in std_ulogic;
      APB_0_PADDR          : in std_logic_vector(21 downto 0);
      APB_0_PCLK           : in std_ulogic;
      APB_0_PENABLE        : in std_ulogic;
      APB_0_PRESET_N       : in std_ulogic;
      APB_0_PSEL           : in std_ulogic;
      APB_0_PWDATA         : in std_logic_vector(31 downto 0);
      APB_0_PWRITE         : in std_ulogic;
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
      BSCAN_DRCK           : in std_ulogic;
      BSCAN_TCK            : in std_ulogic;
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
      DLL_SCAN_CK_00       : in std_ulogic;
      DLL_SCAN_ENABLE_00   : in std_ulogic;
      DLL_SCAN_IN_00       : in std_logic_vector(1 downto 0);
      DLL_SCAN_MODE_00     : in std_ulogic;
      DLL_SCAN_RST_N_00    : in std_ulogic;
      HBM_REF_CLK          : in std_ulogic;
      IO_SCAN_CK_00        : in std_ulogic;
      IO_SCAN_ENABLE_00    : in std_ulogic;
      IO_SCAN_IN_00        : in std_logic_vector(1 downto 0);
      IO_SCAN_MODE_00      : in std_ulogic;
      IO_SCAN_RST_N_00     : in std_ulogic;
      MBIST_EN_00          : in std_ulogic;
      MBIST_EN_01          : in std_ulogic;
      MBIST_EN_02          : in std_ulogic;
      MBIST_EN_03          : in std_ulogic;
      MBIST_EN_04          : in std_ulogic;
      MBIST_EN_05          : in std_ulogic;
      MBIST_EN_06          : in std_ulogic;
      MBIST_EN_07          : in std_ulogic;
      MC_SCAN_CK_00        : in std_ulogic;
      MC_SCAN_CK_01        : in std_ulogic;
      MC_SCAN_CK_02        : in std_ulogic;
      MC_SCAN_CK_03        : in std_ulogic;
      MC_SCAN_CK_04        : in std_ulogic;
      MC_SCAN_CK_05        : in std_ulogic;
      MC_SCAN_CK_06        : in std_ulogic;
      MC_SCAN_CK_07        : in std_ulogic;
      MC_SCAN_ENABLE_00    : in std_ulogic;
      MC_SCAN_ENABLE_01    : in std_ulogic;
      MC_SCAN_ENABLE_02    : in std_ulogic;
      MC_SCAN_ENABLE_03    : in std_ulogic;
      MC_SCAN_ENABLE_04    : in std_ulogic;
      MC_SCAN_ENABLE_05    : in std_ulogic;
      MC_SCAN_ENABLE_06    : in std_ulogic;
      MC_SCAN_ENABLE_07    : in std_ulogic;
      MC_SCAN_IN_00        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_01        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_02        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_03        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_04        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_05        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_06        : in std_logic_vector(1 downto 0);
      MC_SCAN_IN_07        : in std_logic_vector(1 downto 0);
      MC_SCAN_MODE_00      : in std_ulogic;
      MC_SCAN_MODE_01      : in std_ulogic;
      MC_SCAN_MODE_02      : in std_ulogic;
      MC_SCAN_MODE_03      : in std_ulogic;
      MC_SCAN_MODE_04      : in std_ulogic;
      MC_SCAN_MODE_05      : in std_ulogic;
      MC_SCAN_MODE_06      : in std_ulogic;
      MC_SCAN_MODE_07      : in std_ulogic;
      MC_SCAN_RST_N_00     : in std_ulogic;
      MC_SCAN_RST_N_01     : in std_ulogic;
      MC_SCAN_RST_N_02     : in std_ulogic;
      MC_SCAN_RST_N_03     : in std_ulogic;
      MC_SCAN_RST_N_04     : in std_ulogic;
      MC_SCAN_RST_N_05     : in std_ulogic;
      MC_SCAN_RST_N_06     : in std_ulogic;
      MC_SCAN_RST_N_07     : in std_ulogic;
      PHY_SCAN_CK_00       : in std_ulogic;
      PHY_SCAN_ENABLE_00   : in std_ulogic;
      PHY_SCAN_IN_00       : in std_logic_vector(1 downto 0);
      PHY_SCAN_MODE_00     : in std_ulogic;
      PHY_SCAN_RST_N_00    : in std_ulogic;
      SW_SCAN_CK_00        : in std_ulogic;
      SW_SCAN_ENABLE_00    : in std_ulogic;
      SW_SCAN_IN_00        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_01        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_02        : in std_logic_vector(1 downto 0);
      SW_SCAN_IN_03        : in std_logic_vector(1 downto 0);
      SW_SCAN_MODE_00      : in std_ulogic;
      SW_SCAN_RST_N_00     : in std_ulogic;
      GSR                  : in std_ulogic
    );
  end component;
  

  constant MODULE_NAME : string := "HBM_ONE_STACK_INTF";
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
  constant APB_BYPASS_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant AXI_BYPASS_EN_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant BLI_TESTMODE_SEL_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
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
  constant DA_LOCKOUT_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(DA_LOCKOUT,40);
  constant DEBUG_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant DLL_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant IO_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_2_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_3_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_4_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_5_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_6_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_CSSD_SEL_7_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_ENABLE_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_0,40);
  constant MC_ENABLE_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_1,40);
  constant MC_ENABLE_2_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_2,40);
  constant MC_ENABLE_3_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_3,40);
  constant MC_ENABLE_4_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_4,40);
  constant MC_ENABLE_5_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_5,40);
  constant MC_ENABLE_6_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_6,40);
  constant MC_ENABLE_7_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_7,40);
  constant MC_ENABLE_APB_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(MC_ENABLE_APB,40);
  constant MC_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_1_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_2_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_3_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_4_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_5_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_6_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant MC_TESTMODE_SEL_7_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant PHY_CSSD_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
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
  constant PHY_ENABLE_APB_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_ENABLE_APB,40);
  constant PHY_PCLK_INVERT_01_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(PHY_PCLK_INVERT_01,40);
  constant PHY_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
  constant SWITCH_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(SWITCH_ENABLE,40);
  constant SW_TESTMODE_SEL_0_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);

  constant ANALOG_MUX_SEL_0_BIN : std_logic_vector(7 downto 0) := X"00";
  constant DATARATE_00_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_00,11));
  constant DATARATE_01_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_01,11));
  constant DATARATE_02_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_02,11));
  constant DATARATE_03_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_03,11));
  constant DATARATE_04_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_04,11));
  constant DATARATE_05_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_05,11));
  constant DATARATE_06_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_06,11));
  constant DATARATE_07_BIN : std_logic_vector(10 downto 0) := std_logic_vector(to_unsigned(DATARATE_07,11));
  constant DBG_BYPASS_VAL_BIN : std_logic_vector(51 downto 0) := X"FFFFFFFFFFFFF";
  constant DFI_BYPASS_VAL_BIN : std_logic_vector(51 downto 0) := X"0000000000000";
  constant PAGEHIT_PERCENT_00_BIN : std_logic_vector(6 downto 0) := std_logic_vector(to_unsigned(PAGEHIT_PERCENT_00,7));
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
  constant STACK_LOCATION_BIN : std_logic_vector(0 downto 0) := std_logic_vector(to_unsigned(STACK_LOCATION,1));
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
  signal IS_APB_0_PCLK_INVERTED_BIN : std_ulogic := TO_X01(IS_APB_0_PCLK_INVERTED);
  signal IS_APB_0_PRESET_N_INVERTED_BIN : std_ulogic := TO_X01(IS_APB_0_PRESET_N_INVERTED);
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


-- Parameter encodings and registers

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal APB_0_PRDATA_out : std_logic_vector(31 downto 0);
  signal APB_0_PREADY_out : std_ulogic;
  signal APB_0_PSLVERR_out : std_ulogic;
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
  signal DLL_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal DRAM_0_STAT_CATTRIP_out : std_ulogic;
  signal DRAM_0_STAT_TEMP_out : std_logic_vector(2 downto 0);
  signal IO_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_02_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_03_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_04_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_05_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_06_out : std_logic_vector(1 downto 0);
  signal MC_SCAN_OUT_07_out : std_logic_vector(1 downto 0);
  signal PHY_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal STATUS_00_out : std_logic_vector(1 downto 0);
  signal STATUS_01_out : std_logic_vector(1 downto 0);
  signal STATUS_02_out : std_logic_vector(1 downto 0);
  signal STATUS_03_out : std_logic_vector(1 downto 0);
  signal STATUS_04_out : std_logic_vector(1 downto 0);
  signal STATUS_05_out : std_logic_vector(1 downto 0);
  signal STATUS_06_out : std_logic_vector(1 downto 0);
  signal STATUS_07_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_00_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_01_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_02_out : std_logic_vector(1 downto 0);
  signal SW_SCAN_OUT_03_out : std_logic_vector(1 downto 0);
  
  signal ANALOG_HBM_SEL_00_in : std_ulogic;
  signal APB_0_PADDR_in : std_logic_vector(21 downto 0);
  signal APB_0_PCLK_in : std_ulogic;
  signal APB_0_PENABLE_in : std_ulogic;
  signal APB_0_PRESET_N_in : std_ulogic;
  signal APB_0_PSEL_in : std_ulogic;
  signal APB_0_PWDATA_in : std_logic_vector(31 downto 0);
  signal APB_0_PWRITE_in : std_ulogic;
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
  signal BSCAN_DRCK_in : std_ulogic;
  signal BSCAN_TCK_in : std_ulogic;
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
  signal DLL_SCAN_CK_00_in : std_ulogic;
  signal DLL_SCAN_ENABLE_00_in : std_ulogic;
  signal DLL_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal DLL_SCAN_MODE_00_in : std_ulogic;
  signal DLL_SCAN_RST_N_00_in : std_ulogic;
  signal HBM_REF_CLK_in : std_ulogic;
  signal IO_SCAN_CK_00_in : std_ulogic;
  signal IO_SCAN_ENABLE_00_in : std_ulogic;
  signal IO_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal IO_SCAN_MODE_00_in : std_ulogic;
  signal IO_SCAN_RST_N_00_in : std_ulogic;
  signal MBIST_EN_00_in : std_ulogic;
  signal MBIST_EN_01_in : std_ulogic;
  signal MBIST_EN_02_in : std_ulogic;
  signal MBIST_EN_03_in : std_ulogic;
  signal MBIST_EN_04_in : std_ulogic;
  signal MBIST_EN_05_in : std_ulogic;
  signal MBIST_EN_06_in : std_ulogic;
  signal MBIST_EN_07_in : std_ulogic;
  signal MC_SCAN_CK_00_in : std_ulogic;
  signal MC_SCAN_CK_01_in : std_ulogic;
  signal MC_SCAN_CK_02_in : std_ulogic;
  signal MC_SCAN_CK_03_in : std_ulogic;
  signal MC_SCAN_CK_04_in : std_ulogic;
  signal MC_SCAN_CK_05_in : std_ulogic;
  signal MC_SCAN_CK_06_in : std_ulogic;
  signal MC_SCAN_CK_07_in : std_ulogic;
  signal MC_SCAN_ENABLE_00_in : std_ulogic;
  signal MC_SCAN_ENABLE_01_in : std_ulogic;
  signal MC_SCAN_ENABLE_02_in : std_ulogic;
  signal MC_SCAN_ENABLE_03_in : std_ulogic;
  signal MC_SCAN_ENABLE_04_in : std_ulogic;
  signal MC_SCAN_ENABLE_05_in : std_ulogic;
  signal MC_SCAN_ENABLE_06_in : std_ulogic;
  signal MC_SCAN_ENABLE_07_in : std_ulogic;
  signal MC_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_02_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_03_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_04_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_05_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_06_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_IN_07_in : std_logic_vector(1 downto 0);
  signal MC_SCAN_MODE_00_in : std_ulogic;
  signal MC_SCAN_MODE_01_in : std_ulogic;
  signal MC_SCAN_MODE_02_in : std_ulogic;
  signal MC_SCAN_MODE_03_in : std_ulogic;
  signal MC_SCAN_MODE_04_in : std_ulogic;
  signal MC_SCAN_MODE_05_in : std_ulogic;
  signal MC_SCAN_MODE_06_in : std_ulogic;
  signal MC_SCAN_MODE_07_in : std_ulogic;
  signal MC_SCAN_RST_N_00_in : std_ulogic;
  signal MC_SCAN_RST_N_01_in : std_ulogic;
  signal MC_SCAN_RST_N_02_in : std_ulogic;
  signal MC_SCAN_RST_N_03_in : std_ulogic;
  signal MC_SCAN_RST_N_04_in : std_ulogic;
  signal MC_SCAN_RST_N_05_in : std_ulogic;
  signal MC_SCAN_RST_N_06_in : std_ulogic;
  signal MC_SCAN_RST_N_07_in : std_ulogic;
  signal PHY_SCAN_CK_00_in : std_ulogic;
  signal PHY_SCAN_ENABLE_00_in : std_ulogic;
  signal PHY_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal PHY_SCAN_MODE_00_in : std_ulogic;
  signal PHY_SCAN_RST_N_00_in : std_ulogic;
  signal SW_SCAN_CK_00_in : std_ulogic;
  signal SW_SCAN_ENABLE_00_in : std_ulogic;
  signal SW_SCAN_IN_00_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_01_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_02_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_IN_03_in : std_logic_vector(1 downto 0);
  signal SW_SCAN_MODE_00_in : std_ulogic;
  signal SW_SCAN_RST_N_00_in : std_ulogic;
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  APB_0_PRDATA <= APB_0_PRDATA_out;
  APB_0_PREADY <= APB_0_PREADY_out;
  APB_0_PSLVERR <= APB_0_PSLVERR_out;
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
  DRAM_0_STAT_CATTRIP <= DRAM_0_STAT_CATTRIP_out;
  DRAM_0_STAT_TEMP <= DRAM_0_STAT_TEMP_out;
  
  APB_0_PADDR_in <= APB_0_PADDR;
  APB_0_PCLK_in <= APB_0_PCLK;
  APB_0_PENABLE_in <= APB_0_PENABLE;
  APB_0_PRESET_N_in <= APB_0_PRESET_N;
  APB_0_PSEL_in <= APB_0_PSEL;
  APB_0_PWDATA_in <= APB_0_PWDATA;
  APB_0_PWRITE_in <= APB_0_PWRITE;
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
  BSCAN_DRCK_in <= BSCAN_DRCK;
  BSCAN_TCK_in <= BSCAN_TCK;
  HBM_REF_CLK_in <= HBM_REF_CLK;
  MBIST_EN_00_in <= MBIST_EN_00;
  MBIST_EN_01_in <= MBIST_EN_01;
  MBIST_EN_02_in <= MBIST_EN_02;
  MBIST_EN_03_in <= MBIST_EN_03;
  MBIST_EN_04_in <= MBIST_EN_04;
  MBIST_EN_05_in <= MBIST_EN_05;
  MBIST_EN_06_in <= MBIST_EN_06;
  MBIST_EN_07_in <= MBIST_EN_07;
  
  ANALOG_HBM_SEL_00_in <= '1'; -- tie off
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
  DLL_SCAN_CK_00_in <= '1'; -- tie off
  DLL_SCAN_ENABLE_00_in <= '1'; -- tie off
  DLL_SCAN_IN_00_in <= "11"; -- tie off
  DLL_SCAN_MODE_00_in <= '1'; -- tie off
  DLL_SCAN_RST_N_00_in <= '1'; -- tie off
  IO_SCAN_CK_00_in <= '1'; -- tie off
  IO_SCAN_ENABLE_00_in <= '1'; -- tie off
  IO_SCAN_IN_00_in <= "11"; -- tie off
  IO_SCAN_MODE_00_in <= '1'; -- tie off
  IO_SCAN_RST_N_00_in <= '1'; -- tie off
  MC_SCAN_CK_00_in <= '1'; -- tie off
  MC_SCAN_CK_01_in <= '1'; -- tie off
  MC_SCAN_CK_02_in <= '1'; -- tie off
  MC_SCAN_CK_03_in <= '1'; -- tie off
  MC_SCAN_CK_04_in <= '1'; -- tie off
  MC_SCAN_CK_05_in <= '1'; -- tie off
  MC_SCAN_CK_06_in <= '1'; -- tie off
  MC_SCAN_CK_07_in <= '1'; -- tie off
  MC_SCAN_ENABLE_00_in <= '1'; -- tie off
  MC_SCAN_ENABLE_01_in <= '1'; -- tie off
  MC_SCAN_ENABLE_02_in <= '1'; -- tie off
  MC_SCAN_ENABLE_03_in <= '1'; -- tie off
  MC_SCAN_ENABLE_04_in <= '1'; -- tie off
  MC_SCAN_ENABLE_05_in <= '1'; -- tie off
  MC_SCAN_ENABLE_06_in <= '1'; -- tie off
  MC_SCAN_ENABLE_07_in <= '1'; -- tie off
  MC_SCAN_IN_00_in <= "11"; -- tie off
  MC_SCAN_IN_01_in <= "11"; -- tie off
  MC_SCAN_IN_02_in <= "11"; -- tie off
  MC_SCAN_IN_03_in <= "11"; -- tie off
  MC_SCAN_IN_04_in <= "11"; -- tie off
  MC_SCAN_IN_05_in <= "11"; -- tie off
  MC_SCAN_IN_06_in <= "11"; -- tie off
  MC_SCAN_IN_07_in <= "11"; -- tie off
  MC_SCAN_MODE_00_in <= '1'; -- tie off
  MC_SCAN_MODE_01_in <= '1'; -- tie off
  MC_SCAN_MODE_02_in <= '1'; -- tie off
  MC_SCAN_MODE_03_in <= '1'; -- tie off
  MC_SCAN_MODE_04_in <= '1'; -- tie off
  MC_SCAN_MODE_05_in <= '1'; -- tie off
  MC_SCAN_MODE_06_in <= '1'; -- tie off
  MC_SCAN_MODE_07_in <= '1'; -- tie off
  MC_SCAN_RST_N_00_in <= '1'; -- tie off
  MC_SCAN_RST_N_01_in <= '1'; -- tie off
  MC_SCAN_RST_N_02_in <= '1'; -- tie off
  MC_SCAN_RST_N_03_in <= '1'; -- tie off
  MC_SCAN_RST_N_04_in <= '1'; -- tie off
  MC_SCAN_RST_N_05_in <= '1'; -- tie off
  MC_SCAN_RST_N_06_in <= '1'; -- tie off
  MC_SCAN_RST_N_07_in <= '1'; -- tie off
  PHY_SCAN_CK_00_in <= '1'; -- tie off
  PHY_SCAN_ENABLE_00_in <= '1'; -- tie off
  PHY_SCAN_IN_00_in <= "11"; -- tie off
  PHY_SCAN_MODE_00_in <= '1'; -- tie off
  PHY_SCAN_RST_N_00_in <= '1'; -- tie off
  SW_SCAN_CK_00_in <= '1'; -- tie off
  SW_SCAN_ENABLE_00_in <= '1'; -- tie off
  SW_SCAN_IN_00_in <= "11"; -- tie off
  SW_SCAN_IN_01_in <= "11"; -- tie off
  SW_SCAN_IN_02_in <= "11"; -- tie off
  SW_SCAN_IN_03_in <= "11"; -- tie off
  SW_SCAN_MODE_00_in <= '1'; -- tie off
  SW_SCAN_RST_N_00_in <= '1'; -- tie off

  
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
        Write ( Message, string'("-105] CLK_SEL_00 attribute is set to """));
        Write ( Message, string'(CLK_SEL_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-106] CLK_SEL_01 attribute is set to """));
        Write ( Message, string'(CLK_SEL_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-107] CLK_SEL_02 attribute is set to """));
        Write ( Message, string'(CLK_SEL_02));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-108] CLK_SEL_03 attribute is set to """));
        Write ( Message, string'(CLK_SEL_03));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-109] CLK_SEL_04 attribute is set to """));
        Write ( Message, string'(CLK_SEL_04));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-110] CLK_SEL_05 attribute is set to """));
        Write ( Message, string'(CLK_SEL_05));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-111] CLK_SEL_06 attribute is set to """));
        Write ( Message, string'(CLK_SEL_06));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-112] CLK_SEL_07 attribute is set to """));
        Write ( Message, string'(CLK_SEL_07));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-113] CLK_SEL_08 attribute is set to """));
        Write ( Message, string'(CLK_SEL_08));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-114] CLK_SEL_09 attribute is set to """));
        Write ( Message, string'(CLK_SEL_09));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-115] CLK_SEL_10 attribute is set to """));
        Write ( Message, string'(CLK_SEL_10));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-116] CLK_SEL_11 attribute is set to """));
        Write ( Message, string'(CLK_SEL_11));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-117] CLK_SEL_12 attribute is set to """));
        Write ( Message, string'(CLK_SEL_12));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-118] CLK_SEL_13 attribute is set to """));
        Write ( Message, string'(CLK_SEL_13));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-119] CLK_SEL_14 attribute is set to """));
        Write ( Message, string'(CLK_SEL_14));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-120] CLK_SEL_15 attribute is set to """));
        Write ( Message, string'(CLK_SEL_15));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DATARATE_00 check
        if((xil_attr_test) or
           ((DATARATE_00 < 50) or (DATARATE_00 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-121] DATARATE_00 attribute is set to "));
          Write ( Message, DATARATE_00);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_01 check
        if((xil_attr_test) or
           ((DATARATE_01 < 50) or (DATARATE_01 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-122] DATARATE_01 attribute is set to "));
          Write ( Message, DATARATE_01);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_02 check
        if((xil_attr_test) or
           ((DATARATE_02 < 50) or (DATARATE_02 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-123] DATARATE_02 attribute is set to "));
          Write ( Message, DATARATE_02);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_03 check
        if((xil_attr_test) or
           ((DATARATE_03 < 50) or (DATARATE_03 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-124] DATARATE_03 attribute is set to "));
          Write ( Message, DATARATE_03);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_04 check
        if((xil_attr_test) or
           ((DATARATE_04 < 50) or (DATARATE_04 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-125] DATARATE_04 attribute is set to "));
          Write ( Message, DATARATE_04);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_05 check
        if((xil_attr_test) or
           ((DATARATE_05 < 50) or (DATARATE_05 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-126] DATARATE_05 attribute is set to "));
          Write ( Message, DATARATE_05);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_06 check
        if((xil_attr_test) or
           ((DATARATE_06 < 50) or (DATARATE_06 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-127] DATARATE_06 attribute is set to "));
          Write ( Message, DATARATE_06);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DATARATE_07 check
        if((xil_attr_test) or
           ((DATARATE_07 < 50) or (DATARATE_07 > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-128] DATARATE_07 attribute is set to "));
          Write ( Message, DATARATE_07);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DA_LOCKOUT check
      if((xil_attr_test) or
         ((DA_LOCKOUT /= "FALSE") and 
          (DA_LOCKOUT /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-129] DA_LOCKOUT attribute is set to """));
        Write ( Message, string'(DA_LOCKOUT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_0 check
      if((xil_attr_test) or
         ((MC_ENABLE_0 /= "FALSE") and 
          (MC_ENABLE_0 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-177] MC_ENABLE_0 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_0));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_1 check
      if((xil_attr_test) or
         ((MC_ENABLE_1 /= "FALSE") and 
          (MC_ENABLE_1 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-178] MC_ENABLE_1 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_1));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_2 check
      if((xil_attr_test) or
         ((MC_ENABLE_2 /= "FALSE") and 
          (MC_ENABLE_2 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-179] MC_ENABLE_2 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_2));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_3 check
      if((xil_attr_test) or
         ((MC_ENABLE_3 /= "FALSE") and 
          (MC_ENABLE_3 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-180] MC_ENABLE_3 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_3));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_4 check
      if((xil_attr_test) or
         ((MC_ENABLE_4 /= "FALSE") and 
          (MC_ENABLE_4 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-181] MC_ENABLE_4 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_4));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_5 check
      if((xil_attr_test) or
         ((MC_ENABLE_5 /= "FALSE") and 
          (MC_ENABLE_5 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-182] MC_ENABLE_5 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_5));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_6 check
      if((xil_attr_test) or
         ((MC_ENABLE_6 /= "FALSE") and 
          (MC_ENABLE_6 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-183] MC_ENABLE_6 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_6));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_7 check
      if((xil_attr_test) or
         ((MC_ENABLE_7 /= "FALSE") and 
          (MC_ENABLE_7 /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-184] MC_ENABLE_7 attribute is set to """));
        Write ( Message, string'(MC_ENABLE_7));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- MC_ENABLE_APB check
      if((xil_attr_test) or
         ((MC_ENABLE_APB /= "FALSE") and 
          (MC_ENABLE_APB /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-185] MC_ENABLE_APB attribute is set to """));
        Write ( Message, string'(MC_ENABLE_APB));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PAGEHIT_PERCENT_00 check
        if((xil_attr_test) or
           ((PAGEHIT_PERCENT_00 < 0) or (PAGEHIT_PERCENT_00 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-194] PAGEHIT_PERCENT_00 attribute is set to "));
          Write ( Message, PAGEHIT_PERCENT_00);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-196] PHY_ENABLE_00 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_00));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-197] PHY_ENABLE_01 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-198] PHY_ENABLE_02 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_02));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-199] PHY_ENABLE_03 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_03));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-200] PHY_ENABLE_04 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_04));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-201] PHY_ENABLE_05 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_05));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-202] PHY_ENABLE_06 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_06));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-203] PHY_ENABLE_07 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_07));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-204] PHY_ENABLE_08 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_08));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-205] PHY_ENABLE_09 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_09));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-206] PHY_ENABLE_10 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_10));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-207] PHY_ENABLE_11 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_11));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-208] PHY_ENABLE_12 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_12));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-209] PHY_ENABLE_13 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_13));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-210] PHY_ENABLE_14 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_14));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-211] PHY_ENABLE_15 attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_15));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PHY_ENABLE_APB check
      if((xil_attr_test) or
         ((PHY_ENABLE_APB /= "FALSE") and 
          (PHY_ENABLE_APB /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-212] PHY_ENABLE_APB attribute is set to """));
        Write ( Message, string'(PHY_ENABLE_APB));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-213] PHY_PCLK_INVERT_01 attribute is set to """));
        Write ( Message, string'(PHY_PCLK_INVERT_01));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- READ_PERCENT_00 check
        if((xil_attr_test) or
           ((READ_PERCENT_00 < 0) or (READ_PERCENT_00 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-215] READ_PERCENT_00 attribute is set to "));
          Write ( Message, READ_PERCENT_00);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_01 check
        if((xil_attr_test) or
           ((READ_PERCENT_01 < 0) or (READ_PERCENT_01 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-216] READ_PERCENT_01 attribute is set to "));
          Write ( Message, READ_PERCENT_01);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_02 check
        if((xil_attr_test) or
           ((READ_PERCENT_02 < 0) or (READ_PERCENT_02 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-217] READ_PERCENT_02 attribute is set to "));
          Write ( Message, READ_PERCENT_02);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_03 check
        if((xil_attr_test) or
           ((READ_PERCENT_03 < 0) or (READ_PERCENT_03 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-218] READ_PERCENT_03 attribute is set to "));
          Write ( Message, READ_PERCENT_03);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_04 check
        if((xil_attr_test) or
           ((READ_PERCENT_04 < 0) or (READ_PERCENT_04 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-219] READ_PERCENT_04 attribute is set to "));
          Write ( Message, READ_PERCENT_04);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_05 check
        if((xil_attr_test) or
           ((READ_PERCENT_05 < 0) or (READ_PERCENT_05 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-220] READ_PERCENT_05 attribute is set to "));
          Write ( Message, READ_PERCENT_05);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_06 check
        if((xil_attr_test) or
           ((READ_PERCENT_06 < 0) or (READ_PERCENT_06 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-221] READ_PERCENT_06 attribute is set to "));
          Write ( Message, READ_PERCENT_06);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_07 check
        if((xil_attr_test) or
           ((READ_PERCENT_07 < 0) or (READ_PERCENT_07 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-222] READ_PERCENT_07 attribute is set to "));
          Write ( Message, READ_PERCENT_07);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_08 check
        if((xil_attr_test) or
           ((READ_PERCENT_08 < 0) or (READ_PERCENT_08 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-223] READ_PERCENT_08 attribute is set to "));
          Write ( Message, READ_PERCENT_08);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_09 check
        if((xil_attr_test) or
           ((READ_PERCENT_09 < 0) or (READ_PERCENT_09 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-224] READ_PERCENT_09 attribute is set to "));
          Write ( Message, READ_PERCENT_09);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_10 check
        if((xil_attr_test) or
           ((READ_PERCENT_10 < 0) or (READ_PERCENT_10 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-225] READ_PERCENT_10 attribute is set to "));
          Write ( Message, READ_PERCENT_10);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_11 check
        if((xil_attr_test) or
           ((READ_PERCENT_11 < 0) or (READ_PERCENT_11 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-226] READ_PERCENT_11 attribute is set to "));
          Write ( Message, READ_PERCENT_11);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_12 check
        if((xil_attr_test) or
           ((READ_PERCENT_12 < 0) or (READ_PERCENT_12 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-227] READ_PERCENT_12 attribute is set to "));
          Write ( Message, READ_PERCENT_12);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_13 check
        if((xil_attr_test) or
           ((READ_PERCENT_13 < 0) or (READ_PERCENT_13 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-228] READ_PERCENT_13 attribute is set to "));
          Write ( Message, READ_PERCENT_13);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_14 check
        if((xil_attr_test) or
           ((READ_PERCENT_14 < 0) or (READ_PERCENT_14 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-229] READ_PERCENT_14 attribute is set to "));
          Write ( Message, READ_PERCENT_14);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- READ_PERCENT_15 check
        if((xil_attr_test) or
           ((READ_PERCENT_15 < 0) or (READ_PERCENT_15 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-230] READ_PERCENT_15 attribute is set to "));
          Write ( Message, READ_PERCENT_15);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
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
        Write ( Message, string'("-231] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- STACK_LOCATION check
      if((xil_attr_test) or
         ((STACK_LOCATION /= 0) and 
          (STACK_LOCATION /= 1))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-232] STACK_LOCATION attribute is set to "));
        Write ( Message, STACK_LOCATION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("1. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SWITCH_ENABLE check
      if((xil_attr_test) or
         ((SWITCH_ENABLE /= "FALSE") and 
          (SWITCH_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-233] SWITCH_ENABLE attribute is set to """));
        Write ( Message, string'(SWITCH_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- WRITE_PERCENT_00 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_00 < 0) or (WRITE_PERCENT_00 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-235] WRITE_PERCENT_00 attribute is set to "));
          Write ( Message, WRITE_PERCENT_00);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_01 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_01 < 0) or (WRITE_PERCENT_01 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-236] WRITE_PERCENT_01 attribute is set to "));
          Write ( Message, WRITE_PERCENT_01);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_02 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_02 < 0) or (WRITE_PERCENT_02 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-237] WRITE_PERCENT_02 attribute is set to "));
          Write ( Message, WRITE_PERCENT_02);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_03 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_03 < 0) or (WRITE_PERCENT_03 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-238] WRITE_PERCENT_03 attribute is set to "));
          Write ( Message, WRITE_PERCENT_03);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_04 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_04 < 0) or (WRITE_PERCENT_04 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-239] WRITE_PERCENT_04 attribute is set to "));
          Write ( Message, WRITE_PERCENT_04);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_05 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_05 < 0) or (WRITE_PERCENT_05 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-240] WRITE_PERCENT_05 attribute is set to "));
          Write ( Message, WRITE_PERCENT_05);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_06 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_06 < 0) or (WRITE_PERCENT_06 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-241] WRITE_PERCENT_06 attribute is set to "));
          Write ( Message, WRITE_PERCENT_06);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_07 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_07 < 0) or (WRITE_PERCENT_07 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-242] WRITE_PERCENT_07 attribute is set to "));
          Write ( Message, WRITE_PERCENT_07);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_08 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_08 < 0) or (WRITE_PERCENT_08 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-243] WRITE_PERCENT_08 attribute is set to "));
          Write ( Message, WRITE_PERCENT_08);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_09 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_09 < 0) or (WRITE_PERCENT_09 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-244] WRITE_PERCENT_09 attribute is set to "));
          Write ( Message, WRITE_PERCENT_09);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_10 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_10 < 0) or (WRITE_PERCENT_10 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-245] WRITE_PERCENT_10 attribute is set to "));
          Write ( Message, WRITE_PERCENT_10);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_11 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_11 < 0) or (WRITE_PERCENT_11 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-246] WRITE_PERCENT_11 attribute is set to "));
          Write ( Message, WRITE_PERCENT_11);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_12 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_12 < 0) or (WRITE_PERCENT_12 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-247] WRITE_PERCENT_12 attribute is set to "));
          Write ( Message, WRITE_PERCENT_12);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_13 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_13 < 0) or (WRITE_PERCENT_13 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-248] WRITE_PERCENT_13 attribute is set to "));
          Write ( Message, WRITE_PERCENT_13);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_14 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_14 < 0) or (WRITE_PERCENT_14 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-249] WRITE_PERCENT_14 attribute is set to "));
          Write ( Message, WRITE_PERCENT_14);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- WRITE_PERCENT_15 check
        if((xil_attr_test) or
           ((WRITE_PERCENT_15 < 0) or (WRITE_PERCENT_15 > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-250] WRITE_PERCENT_15 attribute is set to "));
          Write ( Message, WRITE_PERCENT_15);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-189] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HBM_ONE_STACK_INTF_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    
    SIP_HBM_ONE_STACK_INTF_INST : SIP_HBM_ONE_STACK_INTF
      port map (
        ANALOG_MUX_SEL_0     => ANALOG_MUX_SEL_0_BIN,
        APB_BYPASS_EN        => APB_BYPASS_EN_BIN,
        AXI_BYPASS_EN        => AXI_BYPASS_EN_BIN,
        BLI_TESTMODE_SEL     => BLI_TESTMODE_SEL_BIN,
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
        DATARATE_00          => DATARATE_00_BIN,
        DATARATE_01          => DATARATE_01_BIN,
        DATARATE_02          => DATARATE_02_BIN,
        DATARATE_03          => DATARATE_03_BIN,
        DATARATE_04          => DATARATE_04_BIN,
        DATARATE_05          => DATARATE_05_BIN,
        DATARATE_06          => DATARATE_06_BIN,
        DATARATE_07          => DATARATE_07_BIN,
        DA_LOCKOUT           => DA_LOCKOUT_BIN,
        DBG_BYPASS_VAL       => DBG_BYPASS_VAL_BIN,
        DEBUG_MODE           => DEBUG_MODE_BIN,
        DFI_BYPASS_VAL       => DFI_BYPASS_VAL_BIN,
        DLL_TESTMODE_SEL_0   => DLL_TESTMODE_SEL_0_BIN,
        IO_TESTMODE_SEL_0    => IO_TESTMODE_SEL_0_BIN,
        IS_APB_0_PCLK_INVERTED => IS_APB_0_PCLK_INVERTED_BIN,
        IS_APB_0_PRESET_N_INVERTED => IS_APB_0_PRESET_N_INVERTED_BIN,
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
        MC_CSSD_SEL_0        => MC_CSSD_SEL_0_BIN,
        MC_CSSD_SEL_1        => MC_CSSD_SEL_1_BIN,
        MC_CSSD_SEL_2        => MC_CSSD_SEL_2_BIN,
        MC_CSSD_SEL_3        => MC_CSSD_SEL_3_BIN,
        MC_CSSD_SEL_4        => MC_CSSD_SEL_4_BIN,
        MC_CSSD_SEL_5        => MC_CSSD_SEL_5_BIN,
        MC_CSSD_SEL_6        => MC_CSSD_SEL_6_BIN,
        MC_CSSD_SEL_7        => MC_CSSD_SEL_7_BIN,
        MC_ENABLE_0          => MC_ENABLE_0_BIN,
        MC_ENABLE_1          => MC_ENABLE_1_BIN,
        MC_ENABLE_2          => MC_ENABLE_2_BIN,
        MC_ENABLE_3          => MC_ENABLE_3_BIN,
        MC_ENABLE_4          => MC_ENABLE_4_BIN,
        MC_ENABLE_5          => MC_ENABLE_5_BIN,
        MC_ENABLE_6          => MC_ENABLE_6_BIN,
        MC_ENABLE_7          => MC_ENABLE_7_BIN,
        MC_ENABLE_APB        => MC_ENABLE_APB_BIN,
        MC_TESTMODE_SEL_0    => MC_TESTMODE_SEL_0_BIN,
        MC_TESTMODE_SEL_1    => MC_TESTMODE_SEL_1_BIN,
        MC_TESTMODE_SEL_2    => MC_TESTMODE_SEL_2_BIN,
        MC_TESTMODE_SEL_3    => MC_TESTMODE_SEL_3_BIN,
        MC_TESTMODE_SEL_4    => MC_TESTMODE_SEL_4_BIN,
        MC_TESTMODE_SEL_5    => MC_TESTMODE_SEL_5_BIN,
        MC_TESTMODE_SEL_6    => MC_TESTMODE_SEL_6_BIN,
        MC_TESTMODE_SEL_7    => MC_TESTMODE_SEL_7_BIN,
        PAGEHIT_PERCENT_00   => PAGEHIT_PERCENT_00_BIN,
        PHY_CSSD_SEL_0       => PHY_CSSD_SEL_0_BIN,
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
        PHY_ENABLE_APB       => PHY_ENABLE_APB_BIN,
        PHY_PCLK_INVERT_01   => PHY_PCLK_INVERT_01_BIN,
        PHY_TESTMODE_SEL_0   => PHY_TESTMODE_SEL_0_BIN,
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
        STACK_LOCATION       => STACK_LOCATION_BIN,
        SWITCH_ENABLE        => SWITCH_ENABLE_BIN,
        SW_TESTMODE_SEL_0    => SW_TESTMODE_SEL_0_BIN,
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
        APB_0_PRDATA         => APB_0_PRDATA_out,
        APB_0_PREADY         => APB_0_PREADY_out,
        APB_0_PSLVERR        => APB_0_PSLVERR_out,
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
        DLL_SCAN_OUT_00      => DLL_SCAN_OUT_00_out,
        DRAM_0_STAT_CATTRIP  => DRAM_0_STAT_CATTRIP_out,
        DRAM_0_STAT_TEMP     => DRAM_0_STAT_TEMP_out,
        IO_SCAN_OUT_00       => IO_SCAN_OUT_00_out,
        MC_SCAN_OUT_00       => MC_SCAN_OUT_00_out,
        MC_SCAN_OUT_01       => MC_SCAN_OUT_01_out,
        MC_SCAN_OUT_02       => MC_SCAN_OUT_02_out,
        MC_SCAN_OUT_03       => MC_SCAN_OUT_03_out,
        MC_SCAN_OUT_04       => MC_SCAN_OUT_04_out,
        MC_SCAN_OUT_05       => MC_SCAN_OUT_05_out,
        MC_SCAN_OUT_06       => MC_SCAN_OUT_06_out,
        MC_SCAN_OUT_07       => MC_SCAN_OUT_07_out,
        PHY_SCAN_OUT_00      => PHY_SCAN_OUT_00_out,
        STATUS_00            => STATUS_00_out,
        STATUS_01            => STATUS_01_out,
        STATUS_02            => STATUS_02_out,
        STATUS_03            => STATUS_03_out,
        STATUS_04            => STATUS_04_out,
        STATUS_05            => STATUS_05_out,
        STATUS_06            => STATUS_06_out,
        STATUS_07            => STATUS_07_out,
        SW_SCAN_OUT_00       => SW_SCAN_OUT_00_out,
        SW_SCAN_OUT_01       => SW_SCAN_OUT_01_out,
        SW_SCAN_OUT_02       => SW_SCAN_OUT_02_out,
        SW_SCAN_OUT_03       => SW_SCAN_OUT_03_out,
        ANALOG_HBM_SEL_00    => ANALOG_HBM_SEL_00_in,
        APB_0_PADDR          => APB_0_PADDR_in,
        APB_0_PCLK           => APB_0_PCLK_in,
        APB_0_PENABLE        => APB_0_PENABLE_in,
        APB_0_PRESET_N       => APB_0_PRESET_N_in,
        APB_0_PSEL           => APB_0_PSEL_in,
        APB_0_PWDATA         => APB_0_PWDATA_in,
        APB_0_PWRITE         => APB_0_PWRITE_in,
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
        BSCAN_DRCK           => BSCAN_DRCK_in,
        BSCAN_TCK            => BSCAN_TCK_in,
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
        DLL_SCAN_CK_00       => DLL_SCAN_CK_00_in,
        DLL_SCAN_ENABLE_00   => DLL_SCAN_ENABLE_00_in,
        DLL_SCAN_IN_00       => DLL_SCAN_IN_00_in,
        DLL_SCAN_MODE_00     => DLL_SCAN_MODE_00_in,
        DLL_SCAN_RST_N_00    => DLL_SCAN_RST_N_00_in,
        HBM_REF_CLK          => HBM_REF_CLK_in,
        IO_SCAN_CK_00        => IO_SCAN_CK_00_in,
        IO_SCAN_ENABLE_00    => IO_SCAN_ENABLE_00_in,
        IO_SCAN_IN_00        => IO_SCAN_IN_00_in,
        IO_SCAN_MODE_00      => IO_SCAN_MODE_00_in,
        IO_SCAN_RST_N_00     => IO_SCAN_RST_N_00_in,
        MBIST_EN_00          => MBIST_EN_00_in,
        MBIST_EN_01          => MBIST_EN_01_in,
        MBIST_EN_02          => MBIST_EN_02_in,
        MBIST_EN_03          => MBIST_EN_03_in,
        MBIST_EN_04          => MBIST_EN_04_in,
        MBIST_EN_05          => MBIST_EN_05_in,
        MBIST_EN_06          => MBIST_EN_06_in,
        MBIST_EN_07          => MBIST_EN_07_in,
        MC_SCAN_CK_00        => MC_SCAN_CK_00_in,
        MC_SCAN_CK_01        => MC_SCAN_CK_01_in,
        MC_SCAN_CK_02        => MC_SCAN_CK_02_in,
        MC_SCAN_CK_03        => MC_SCAN_CK_03_in,
        MC_SCAN_CK_04        => MC_SCAN_CK_04_in,
        MC_SCAN_CK_05        => MC_SCAN_CK_05_in,
        MC_SCAN_CK_06        => MC_SCAN_CK_06_in,
        MC_SCAN_CK_07        => MC_SCAN_CK_07_in,
        MC_SCAN_ENABLE_00    => MC_SCAN_ENABLE_00_in,
        MC_SCAN_ENABLE_01    => MC_SCAN_ENABLE_01_in,
        MC_SCAN_ENABLE_02    => MC_SCAN_ENABLE_02_in,
        MC_SCAN_ENABLE_03    => MC_SCAN_ENABLE_03_in,
        MC_SCAN_ENABLE_04    => MC_SCAN_ENABLE_04_in,
        MC_SCAN_ENABLE_05    => MC_SCAN_ENABLE_05_in,
        MC_SCAN_ENABLE_06    => MC_SCAN_ENABLE_06_in,
        MC_SCAN_ENABLE_07    => MC_SCAN_ENABLE_07_in,
        MC_SCAN_IN_00        => MC_SCAN_IN_00_in,
        MC_SCAN_IN_01        => MC_SCAN_IN_01_in,
        MC_SCAN_IN_02        => MC_SCAN_IN_02_in,
        MC_SCAN_IN_03        => MC_SCAN_IN_03_in,
        MC_SCAN_IN_04        => MC_SCAN_IN_04_in,
        MC_SCAN_IN_05        => MC_SCAN_IN_05_in,
        MC_SCAN_IN_06        => MC_SCAN_IN_06_in,
        MC_SCAN_IN_07        => MC_SCAN_IN_07_in,
        MC_SCAN_MODE_00      => MC_SCAN_MODE_00_in,
        MC_SCAN_MODE_01      => MC_SCAN_MODE_01_in,
        MC_SCAN_MODE_02      => MC_SCAN_MODE_02_in,
        MC_SCAN_MODE_03      => MC_SCAN_MODE_03_in,
        MC_SCAN_MODE_04      => MC_SCAN_MODE_04_in,
        MC_SCAN_MODE_05      => MC_SCAN_MODE_05_in,
        MC_SCAN_MODE_06      => MC_SCAN_MODE_06_in,
        MC_SCAN_MODE_07      => MC_SCAN_MODE_07_in,
        MC_SCAN_RST_N_00     => MC_SCAN_RST_N_00_in,
        MC_SCAN_RST_N_01     => MC_SCAN_RST_N_01_in,
        MC_SCAN_RST_N_02     => MC_SCAN_RST_N_02_in,
        MC_SCAN_RST_N_03     => MC_SCAN_RST_N_03_in,
        MC_SCAN_RST_N_04     => MC_SCAN_RST_N_04_in,
        MC_SCAN_RST_N_05     => MC_SCAN_RST_N_05_in,
        MC_SCAN_RST_N_06     => MC_SCAN_RST_N_06_in,
        MC_SCAN_RST_N_07     => MC_SCAN_RST_N_07_in,
        PHY_SCAN_CK_00       => PHY_SCAN_CK_00_in,
        PHY_SCAN_ENABLE_00   => PHY_SCAN_ENABLE_00_in,
        PHY_SCAN_IN_00       => PHY_SCAN_IN_00_in,
        PHY_SCAN_MODE_00     => PHY_SCAN_MODE_00_in,
        PHY_SCAN_RST_N_00    => PHY_SCAN_RST_N_00_in,
        SW_SCAN_CK_00        => SW_SCAN_CK_00_in,
        SW_SCAN_ENABLE_00    => SW_SCAN_ENABLE_00_in,
        SW_SCAN_IN_00        => SW_SCAN_IN_00_in,
        SW_SCAN_IN_01        => SW_SCAN_IN_01_in,
        SW_SCAN_IN_02        => SW_SCAN_IN_02_in,
        SW_SCAN_IN_03        => SW_SCAN_IN_03_in,
        SW_SCAN_MODE_00      => SW_SCAN_MODE_00_in,
        SW_SCAN_RST_N_00     => SW_SCAN_RST_N_00_in,
        GSR                  => glblGSR        
      );
  end HBM_ONE_STACK_INTF_V;
