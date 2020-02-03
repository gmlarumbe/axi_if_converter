-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        HBM_SNGLBLI_INTF_AXI
-- /___/   /\      Filename    : HBM_SNGLBLI_INTF_AXI.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL HBM_SNGLBLI_INTF_AXI -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity HBM_SNGLBLI_INTF_AXI is
  generic (
    CLK_SEL : string := "FALSE";
    DATARATE : integer := 1800;
    IS_ACLK_INVERTED : bit := '0';
    IS_ARESET_N_INVERTED : bit := '0';
    MC_ENABLE : string := "FALSE";
    PAGEHIT_PERCENT : integer := 75;
    PHY_ENABLE : string := "FALSE";
    READ_PERCENT : integer := 50;
    SWITCH_ENABLE : string := "FALSE";
    WRITE_PERCENT : integer := 50
  );
  
  port (
    ARREADY_PIPE         : out std_ulogic;
    AWREADY_PIPE         : out std_ulogic;
    BID_PIPE             : out std_logic_vector(5 downto 0);
    BRESP_PIPE           : out std_logic_vector(1 downto 0);
    BVALID_PIPE          : out std_ulogic;
    DFI_AW_AERR_N_PIPE   : out std_logic_vector(1 downto 0);
    DFI_CLK_BUF          : out std_ulogic;
    DFI_CTRLUPD_ACK_PIPE : out std_ulogic;
    DFI_DBI_BYTE_DISABLE_PIPE : out std_logic_vector(7 downto 0);
    DFI_DW_RDDATA_DBI_PIPE : out std_logic_vector(20 downto 0);
    DFI_DW_RDDATA_DERR_PIPE : out std_logic_vector(7 downto 0);
    DFI_DW_RDDATA_PAR_VALID_PIPE : out std_logic_vector(1 downto 0);
    DFI_DW_RDDATA_VALID_PIPE : out std_logic_vector(1 downto 0);
    DFI_INIT_COMPLETE_PIPE : out std_ulogic;
    DFI_PHYUPD_REQ_PIPE  : out std_ulogic;
    DFI_PHYUPD_TYPE_PIPE : out std_ulogic;
    DFI_PHY_LP_STATE_PIPE : out std_ulogic;
    DFI_RST_N_BUF        : out std_ulogic;
    MC_STATUS            : out std_logic_vector(5 downto 0);
    PHY_STATUS           : out std_logic_vector(7 downto 0);
    RDATA_PARITY_PIPE    : out std_logic_vector(31 downto 0);
    RDATA_PIPE           : out std_logic_vector(255 downto 0);
    RID_PIPE             : out std_logic_vector(5 downto 0);
    RLAST_PIPE           : out std_ulogic;
    RRESP_PIPE           : out std_logic_vector(1 downto 0);
    RVALID_PIPE          : out std_ulogic;
    STATUS               : out std_logic_vector(5 downto 0);
    WREADY_PIPE          : out std_ulogic;
    ACLK                 : in std_ulogic;
    ARADDR               : in std_logic_vector(36 downto 0);
    ARBURST              : in std_logic_vector(1 downto 0);
    ARESET_N             : in std_ulogic;
    ARID                 : in std_logic_vector(5 downto 0);
    ARLEN                : in std_logic_vector(3 downto 0);
    ARSIZE               : in std_logic_vector(2 downto 0);
    ARVALID              : in std_ulogic;
    AWADDR               : in std_logic_vector(36 downto 0);
    AWBURST              : in std_logic_vector(1 downto 0);
    AWID                 : in std_logic_vector(5 downto 0);
    AWLEN                : in std_logic_vector(3 downto 0);
    AWSIZE               : in std_logic_vector(2 downto 0);
    AWVALID              : in std_ulogic;
    BREADY               : in std_ulogic;
    BSCAN_CK             : in std_ulogic;
    DFI_LP_PWR_X_REQ     : in std_ulogic;
    MBIST_EN             : in std_ulogic;
    RREADY               : in std_ulogic;
    WDATA                : in std_logic_vector(255 downto 0);
    WDATA_PARITY         : in std_logic_vector(31 downto 0);
    WLAST                : in std_ulogic;
    WSTRB                : in std_logic_vector(31 downto 0);
    WVALID               : in std_ulogic
  );
end HBM_SNGLBLI_INTF_AXI;

architecture HBM_SNGLBLI_INTF_AXI_V of HBM_SNGLBLI_INTF_AXI is

  constant MODULE_NAME : string := "HBM_SNGLBLI_INTF_AXI";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant CLK_SEL_FALSE : std_ulogic := '0';
  constant CLK_SEL_TRUE : std_ulogic := '1';
  constant MC_ENABLE_FALSE : std_ulogic := '0';
  constant MC_ENABLE_TRUE : std_ulogic := '1';
  constant PHY_ENABLE_FALSE : std_ulogic := '0';
  constant PHY_ENABLE_TRUE : std_ulogic := '1';
  constant SWITCH_ENABLE_FALSE : std_ulogic := '0';
  constant SWITCH_ENABLE_TRUE : std_ulogic := '1';

  signal CLK_SEL_BIN : std_ulogic;
  signal DATARATE_BIN : integer := 1800;
  signal IS_ACLK_INVERTED_BIN : std_ulogic;
  signal IS_ARESET_N_INVERTED_BIN : std_ulogic;
  signal MC_ENABLE_BIN : std_ulogic;
  signal PAGEHIT_PERCENT_BIN : integer := 75;
  signal PHY_ENABLE_BIN : std_ulogic;
  signal READ_PERCENT_BIN : integer := 50;
  signal SWITCH_ENABLE_BIN : std_ulogic;
  signal WRITE_PERCENT_BIN : integer := 50;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal ARREADY_PIPE_out : std_ulogic;
  signal AWREADY_PIPE_out : std_ulogic;
  signal BID_PIPE_out : std_logic_vector(5 downto 0);
  signal BRESP_PIPE_out : std_logic_vector(1 downto 0);
  signal BVALID_PIPE_out : std_ulogic;
  signal DFI_AW_AERR_N_PIPE_out : std_logic_vector(1 downto 0);
  signal DFI_CLK_BUF_out : std_ulogic;
  signal DFI_CTRLUPD_ACK_PIPE_out : std_ulogic;
  signal DFI_DBI_BYTE_DISABLE_PIPE_out : std_logic_vector(7 downto 0);
  signal DFI_DW_RDDATA_DBI_PIPE_out : std_logic_vector(20 downto 0);
  signal DFI_DW_RDDATA_DERR_PIPE_out : std_logic_vector(7 downto 0);
  signal DFI_DW_RDDATA_PAR_VALID_PIPE_out : std_logic_vector(1 downto 0);
  signal DFI_DW_RDDATA_VALID_PIPE_out : std_logic_vector(1 downto 0);
  signal DFI_INIT_COMPLETE_PIPE_out : std_ulogic;
  signal DFI_PHYUPD_REQ_PIPE_out : std_ulogic;
  signal DFI_PHYUPD_TYPE_PIPE_out : std_ulogic;
  signal DFI_PHY_LP_STATE_PIPE_out : std_ulogic;
  signal DFI_RST_N_BUF_out : std_ulogic;
  signal MC_STATUS_out : std_logic_vector(5 downto 0);
  signal PHY_STATUS_out : std_logic_vector(7 downto 0);
  signal RDATA_PARITY_PIPE_out : std_logic_vector(31 downto 0);
  signal RDATA_PIPE_out : std_logic_vector(255 downto 0);
  signal RID_PIPE_out : std_logic_vector(5 downto 0);
  signal RLAST_PIPE_out : std_ulogic;
  signal RRESP_PIPE_out : std_logic_vector(1 downto 0);
  signal RVALID_PIPE_out : std_ulogic;
  signal STATUS_out : std_logic_vector(5 downto 0);
  signal WREADY_PIPE_out : std_ulogic;
  
  signal ACLK_in : std_ulogic;
  signal ARADDR_in : std_logic_vector(36 downto 0);
  signal ARBURST_in : std_logic_vector(1 downto 0);
  signal ARESET_N_in : std_ulogic;
  signal ARID_in : std_logic_vector(5 downto 0);
  signal ARLEN_in : std_logic_vector(3 downto 0);
  signal ARSIZE_in : std_logic_vector(2 downto 0);
  signal ARVALID_in : std_ulogic;
  signal AWADDR_in : std_logic_vector(36 downto 0);
  signal AWBURST_in : std_logic_vector(1 downto 0);
  signal AWID_in : std_logic_vector(5 downto 0);
  signal AWLEN_in : std_logic_vector(3 downto 0);
  signal AWSIZE_in : std_logic_vector(2 downto 0);
  signal AWVALID_in : std_ulogic;
  signal BREADY_in : std_ulogic;
  signal BSCAN_CK_in : std_ulogic;
  signal DFI_LP_PWR_X_REQ_in : std_ulogic;
  signal MBIST_EN_in : std_ulogic;
  signal RREADY_in : std_ulogic;
  signal WDATA_PARITY_in : std_logic_vector(31 downto 0);
  signal WDATA_in : std_logic_vector(255 downto 0);
  signal WLAST_in : std_ulogic;
  signal WSTRB_in : std_logic_vector(31 downto 0);
  signal WVALID_in : std_ulogic;
  
  -- begin behavioral model declarations
  
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  ARREADY_PIPE <= ARREADY_PIPE_out;
  AWREADY_PIPE <= AWREADY_PIPE_out;
  BID_PIPE <= BID_PIPE_out;
  BRESP_PIPE <= BRESP_PIPE_out;
  BVALID_PIPE <= BVALID_PIPE_out;
  DFI_AW_AERR_N_PIPE <= DFI_AW_AERR_N_PIPE_out;
  DFI_CLK_BUF <= DFI_CLK_BUF_out;
  DFI_CTRLUPD_ACK_PIPE <= DFI_CTRLUPD_ACK_PIPE_out;
  DFI_DBI_BYTE_DISABLE_PIPE <= DFI_DBI_BYTE_DISABLE_PIPE_out;
  DFI_DW_RDDATA_DBI_PIPE <= DFI_DW_RDDATA_DBI_PIPE_out;
  DFI_DW_RDDATA_DERR_PIPE <= DFI_DW_RDDATA_DERR_PIPE_out;
  DFI_DW_RDDATA_PAR_VALID_PIPE <= DFI_DW_RDDATA_PAR_VALID_PIPE_out;
  DFI_DW_RDDATA_VALID_PIPE <= DFI_DW_RDDATA_VALID_PIPE_out;
  DFI_INIT_COMPLETE_PIPE <= DFI_INIT_COMPLETE_PIPE_out;
  DFI_PHYUPD_REQ_PIPE <= DFI_PHYUPD_REQ_PIPE_out;
  DFI_PHYUPD_TYPE_PIPE <= DFI_PHYUPD_TYPE_PIPE_out;
  DFI_PHY_LP_STATE_PIPE <= DFI_PHY_LP_STATE_PIPE_out;
  DFI_RST_N_BUF <= DFI_RST_N_BUF_out;
  MC_STATUS <= MC_STATUS_out;
  PHY_STATUS <= PHY_STATUS_out;
  RDATA_PARITY_PIPE <= RDATA_PARITY_PIPE_out;
  RDATA_PIPE <= RDATA_PIPE_out;
  RID_PIPE <= RID_PIPE_out;
  RLAST_PIPE <= RLAST_PIPE_out;
  RRESP_PIPE <= RRESP_PIPE_out;
  RVALID_PIPE <= RVALID_PIPE_out;
  STATUS <= STATUS_out;
  WREADY_PIPE <= WREADY_PIPE_out;
  
  ACLK_in <= ACLK;
  ARADDR_in <= ARADDR;
  ARBURST_in <= ARBURST;
  ARESET_N_in <= ARESET_N;
  ARID_in <= ARID;
  ARLEN_in <= ARLEN;
  ARSIZE_in <= ARSIZE;
  ARVALID_in <= ARVALID;
  AWADDR_in <= AWADDR;
  AWBURST_in <= AWBURST;
  AWID_in <= AWID;
  AWLEN_in <= AWLEN;
  AWSIZE_in <= AWSIZE;
  AWVALID_in <= AWVALID;
  BREADY_in <= BREADY;
  BSCAN_CK_in <= BSCAN_CK;
  DFI_LP_PWR_X_REQ_in <= DFI_LP_PWR_X_REQ;
  MBIST_EN_in <= MBIST_EN;
  RREADY_in <= RREADY;
  WDATA_PARITY_in <= WDATA_PARITY;
  WDATA_in <= WDATA;
  WLAST_in <= WLAST;
  WSTRB_in <= WSTRB;
  WVALID_in <= WVALID;
  
  CLK_SEL_BIN <= 
      CLK_SEL_FALSE when (CLK_SEL = "FALSE") else
      CLK_SEL_TRUE when (CLK_SEL = "TRUE") else
      CLK_SEL_FALSE;
  
  DATARATE_BIN <= DATARATE;
  
  IS_ACLK_INVERTED_BIN <= TO_X01(IS_ACLK_INVERTED);
  IS_ARESET_N_INVERTED_BIN <= TO_X01(IS_ARESET_N_INVERTED);
  MC_ENABLE_BIN <= 
      MC_ENABLE_FALSE when (MC_ENABLE = "FALSE") else
      MC_ENABLE_TRUE when (MC_ENABLE = "TRUE") else
      MC_ENABLE_FALSE;
  
  PAGEHIT_PERCENT_BIN <= PAGEHIT_PERCENT;
  
  PHY_ENABLE_BIN <= 
      PHY_ENABLE_FALSE when (PHY_ENABLE = "FALSE") else
      PHY_ENABLE_TRUE when (PHY_ENABLE = "TRUE") else
      PHY_ENABLE_FALSE;
  
  READ_PERCENT_BIN <= READ_PERCENT;
  
  SWITCH_ENABLE_BIN <= 
      SWITCH_ENABLE_FALSE when (SWITCH_ENABLE = "FALSE") else
      SWITCH_ENABLE_TRUE when (SWITCH_ENABLE = "TRUE") else
      SWITCH_ENABLE_FALSE;
  
  WRITE_PERCENT_BIN <= WRITE_PERCENT;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CLK_SEL check
      if((xil_attr_test) or
         ((CLK_SEL /= "FALSE") and 
          (CLK_SEL /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] CLK_SEL attribute is set to """));
        Write ( Message, string'(CLK_SEL));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DATARATE check
        if((xil_attr_test) or
           ((DATARATE < 50) or (DATARATE > 1800))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-102] DATARATE attribute is set to "));
          Write ( Message, DATARATE);
          Write ( Message, string'(". Legal values for this attribute are 50 to 1800. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- MC_ENABLE check
      if((xil_attr_test) or
         ((MC_ENABLE /= "FALSE") and 
          (MC_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] MC_ENABLE attribute is set to """));
        Write ( Message, string'(MC_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PAGEHIT_PERCENT check
        if((xil_attr_test) or
           ((PAGEHIT_PERCENT < 0) or (PAGEHIT_PERCENT > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-106] PAGEHIT_PERCENT attribute is set to "));
          Write ( Message, PAGEHIT_PERCENT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- PHY_ENABLE check
      if((xil_attr_test) or
         ((PHY_ENABLE /= "FALSE") and 
          (PHY_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-107] PHY_ENABLE attribute is set to """));
        Write ( Message, string'(PHY_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- READ_PERCENT check
        if((xil_attr_test) or
           ((READ_PERCENT < 0) or (READ_PERCENT > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-108] READ_PERCENT attribute is set to "));
          Write ( Message, READ_PERCENT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
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
        Write ( Message, string'("-109] SWITCH_ENABLE attribute is set to """));
        Write ( Message, string'(SWITCH_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- WRITE_PERCENT check
        if((xil_attr_test) or
           ((WRITE_PERCENT < 0) or (WRITE_PERCENT > 100))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-110] WRITE_PERCENT attribute is set to "));
          Write ( Message, WRITE_PERCENT);
          Write ( Message, string'(". Legal values for this attribute are 0 to 100. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-109] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HBM_SNGLBLI_INTF_AXI_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model

-- end behavioral model

end HBM_SNGLBLI_INTF_AXI_V;
