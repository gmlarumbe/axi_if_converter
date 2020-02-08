library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.global.all;
use xil_defaultlib.global_sim.all;
use xil_defaultlib.axil_slave_bfm.all;

------------------------------------------------------------------------------------------------------------------------

entity tb_top is
end entity tb_top;

------------------------------------------------------------------------------------------------------------------------

architecture TB of tb_top is

    -- component ports
    signal clk                : std_logic;
    signal resetn             : std_logic;
    signal clk_fs_ext         : std_logic;

    signal s_axi_aclk         : std_logic;
    signal s_axi_aresetn      : std_logic;
    signal s_axi_awaddr       : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_awprot       : std_logic_vector(2 downto 0);
    signal s_axi_awvalid      : std_logic;
    signal s_axi_awready      : std_logic;
    signal s_axi_wdata        : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_wstrb        : std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    signal s_axi_wvalid       : std_logic;
    signal s_axi_wready       : std_logic;
    signal s_axi_bresp        : std_logic_vector(1 downto 0);
    signal s_axi_bvalid       : std_logic;
    signal s_axi_bready       : std_logic;
    signal s_axi_araddr       : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_arprot       : std_logic_vector(2 downto 0);
    signal s_axi_arvalid      : std_logic;
    signal s_axi_arready      : std_logic;
    signal s_axi_rdata        : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_rresp        : std_logic_vector(1 downto 0);
    signal s_axi_rvalid       : std_logic;
    signal s_axi_rready       : std_logic;

    signal s_axis_lch_aclk    : std_logic;
    signal s_axis_lch_aresetn : std_logic;
    signal s_axis_lch_tdata   : std_logic_vector(63 downto 0);
    signal s_axis_lch_tvalid  : std_logic;
    signal s_axis_lch_tkeep   : std_logic_vector(7 downto 0);
    signal s_axis_lch_tlast   : std_logic;
    signal s_axis_lch_tready  : std_logic;

    signal s_axis_rch_aclk    : std_logic;
    signal s_axis_rch_aresetn : std_logic;
    signal s_axis_rch_tdata   : std_logic_vector(63 downto 0);
    signal s_axis_rch_tvalid  : std_logic;
    signal s_axis_rch_tkeep   : std_logic_vector(7 downto 0);
    signal s_axis_rch_tlast   : std_logic;
    signal s_axis_rch_tready  : std_logic;

    signal m_axis_lch_aclk    : std_logic;
    signal m_axis_lch_aresetn : std_logic;
    signal m_axis_lch_tdata   : std_logic_vector(63 downto 0);
    signal m_axis_lch_tvalid  : std_logic;
    signal m_axis_lch_tkeep   : std_logic_vector(7 downto 0);
    signal m_axis_lch_tlast   : std_logic;
    signal m_axis_lch_tready  : std_logic;
    signal m_axis_lch_tdest   : std_logic;

    signal m_axis_rch_aclk    : std_logic;
    signal m_axis_rch_aresetn : std_logic;
    signal m_axis_rch_tdata   : std_logic_vector(63 downto 0);
    signal m_axis_rch_tvalid  : std_logic;
    signal m_axis_rch_tkeep   : std_logic_vector(7 downto 0);
    signal m_axis_rch_tlast   : std_logic;
    signal m_axis_rch_tready  : std_logic;
    signal m_axis_rch_tdest   : std_logic;

    signal m_axi_lch_aclk     : std_logic;
    signal m_axi_lch_aresetn  : std_logic;
    signal m_axi_lch_awid     : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_lch_awaddr   : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal m_axi_lch_awlen    : std_logic_vector(7 downto 0);
    signal m_axi_lch_awsize   : std_logic_vector(2 downto 0);
    signal m_axi_lch_awburst  : std_logic_vector(1 downto 0);
    signal m_axi_lch_awlock   : std_logic;
    signal m_axi_lch_awcache  : std_logic_vector(3 downto 0);
    signal m_axi_lch_awprot   : std_logic_vector(2 downto 0);
    signal m_axi_lch_awqos    : std_logic_vector(3 downto 0);
    signal m_axi_lch_awuser   : std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0);
    signal m_axi_lch_awvalid  : std_logic;
    signal m_axi_lch_awready  : std_logic;
    signal m_axi_lch_wdata    : std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    signal m_axi_lch_wstrb    : std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
    signal m_axi_lch_wlast    : std_logic;
    signal m_axi_lch_wuser    : std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0);
    signal m_axi_lch_wvalid   : std_logic;
    signal m_axi_lch_wready   : std_logic;
    signal m_axi_lch_bid      : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_lch_bresp    : std_logic_vector(1 downto 0);
    signal m_axi_lch_buser    : std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0);
    signal m_axi_lch_bvalid   : std_logic;
    signal m_axi_lch_bready   : std_logic;
    signal m_axi_lch_arid     : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_lch_araddr   : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal m_axi_lch_arlen    : std_logic_vector(7 downto 0);
    signal m_axi_lch_arsize   : std_logic_vector(2 downto 0);
    signal m_axi_lch_arburst  : std_logic_vector(1 downto 0);
    signal m_axi_lch_arlock   : std_logic;
    signal m_axi_lch_arcache  : std_logic_vector(3 downto 0);
    signal m_axi_lch_arprot   : std_logic_vector(2 downto 0);
    signal m_axi_lch_arqos    : std_logic_vector(3 downto 0);
    signal m_axi_lch_aruser   : std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0);
    signal m_axi_lch_arvalid  : std_logic;
    signal m_axi_lch_arready  : std_logic;
    signal m_axi_lch_rid      : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_lch_rdata    : std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    signal m_axi_lch_rresp    : std_logic_vector(1 downto 0);
    signal m_axi_lch_rlast    : std_logic;
    signal m_axi_lch_ruser    : std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0);
    signal m_axi_lch_rvalid   : std_logic;
    signal m_axi_lch_rready   : std_logic;

    signal m_axi_rch_aclk     : std_logic;
    signal m_axi_rch_aresetn  : std_logic;
    signal m_axi_rch_awid     : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_rch_awaddr   : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal m_axi_rch_awlen    : std_logic_vector(7 downto 0);
    signal m_axi_rch_awsize   : std_logic_vector(2 downto 0);
    signal m_axi_rch_awburst  : std_logic_vector(1 downto 0);
    signal m_axi_rch_awlock   : std_logic;
    signal m_axi_rch_awcache  : std_logic_vector(3 downto 0);
    signal m_axi_rch_awprot   : std_logic_vector(2 downto 0);
    signal m_axi_rch_awqos    : std_logic_vector(3 downto 0);
    signal m_axi_rch_awuser   : std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0);
    signal m_axi_rch_awvalid  : std_logic;
    signal m_axi_rch_awready  : std_logic;
    signal m_axi_rch_wdata    : std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    signal m_axi_rch_wstrb    : std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
    signal m_axi_rch_wlast    : std_logic;
    signal m_axi_rch_wuser    : std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0);
    signal m_axi_rch_wvalid   : std_logic;
    signal m_axi_rch_wready   : std_logic;
    signal m_axi_rch_bid      : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_rch_bresp    : std_logic_vector(1 downto 0);
    signal m_axi_rch_buser    : std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0);
    signal m_axi_rch_bvalid   : std_logic;
    signal m_axi_rch_bready   : std_logic;
    signal m_axi_rch_arid     : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_rch_araddr   : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal m_axi_rch_arlen    : std_logic_vector(7 downto 0);
    signal m_axi_rch_arsize   : std_logic_vector(2 downto 0);
    signal m_axi_rch_arburst  : std_logic_vector(1 downto 0);
    signal m_axi_rch_arlock   : std_logic;
    signal m_axi_rch_arcache  : std_logic_vector(3 downto 0);
    signal m_axi_rch_arprot   : std_logic_vector(2 downto 0);
    signal m_axi_rch_arqos    : std_logic_vector(3 downto 0);
    signal m_axi_rch_aruser   : std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0);
    signal m_axi_rch_arvalid  : std_logic;
    signal m_axi_rch_arready  : std_logic;
    signal m_axi_rch_rid      : std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    signal m_axi_rch_rdata    : std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    signal m_axi_rch_rresp    : std_logic_vector(1 downto 0);
    signal m_axi_rch_rlast    : std_logic;
    signal m_axi_rch_ruser    : std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0);
    signal m_axi_rch_rvalid   : std_logic;
    signal m_axi_rch_rready   : std_logic;

    signal m_axi_conf_aclk    : std_logic;
    signal m_axi_conf_aresetn : std_logic;
    signal m_axi_conf_awaddr  : std_logic_vector(C_M_MEM_AXI_ADDR_WIDTH-1 downto 0);
    signal m_axi_conf_awprot  : std_logic_vector(2 downto 0);
    signal m_axi_conf_awvalid : std_logic;
    signal m_axi_conf_awready : std_logic;
    signal m_axi_conf_wdata   : std_logic_vector(C_M_MEM_AXI_DATA_WIDTH-1 downto 0);
    signal m_axi_conf_wstrb   : std_logic_vector(C_M_MEM_AXI_DATA_WIDTH/8-1 downto 0);
    signal m_axi_conf_wvalid  : std_logic;
    signal m_axi_conf_wready  : std_logic;
    signal m_axi_conf_bresp   : std_logic_vector(1 downto 0);
    signal m_axi_conf_bvalid  : std_logic;
    signal m_axi_conf_bready  : std_logic;
    signal m_axi_conf_araddr  : std_logic_vector(C_M_MEM_AXI_ADDR_WIDTH-1 downto 0);
    signal m_axi_conf_arprot  : std_logic_vector(2 downto 0);
    signal m_axi_conf_arvalid : std_logic;
    signal m_axi_conf_arready : std_logic;
    signal m_axi_conf_rdata   : std_logic_vector(C_M_MEM_AXI_DATA_WIDTH-1 downto 0);
    signal m_axi_conf_rresp   : std_logic_vector(1 downto 0);
    signal m_axi_conf_rvalid  : std_logic;
    signal m_axi_conf_rready  : std_logic;


    -- BFM
    signal bfm_in_r  : s_common_response_r_in;
    signal bfm_out_r : s_common_response_r_out;
    signal bfm_in_w  : s_common_response_w_in;
    signal bfm_out_w : s_common_response_w_out;

    signal stop_clock : std_logic := '0';
    
begin

    -- BFM signal connection
    bfm_in_r                                                                                       <= (s_axi_aclk, s_axi_arready, s_axi_rready, s_axi_rvalid);
    (s_axi_araddr, s_axi_arvalid, s_axi_rready)                                                       <= bfm_out_r;
    bfm_in_w                                                                                       <= (s_axi_aclk, s_axi_awready, s_axi_wready, s_axi_bvalid);
    (s_axi_awaddr, s_axi_wdata, s_axi_wstrb, s_axi_awprot, s_axi_awvalid, s_axi_wvalid, s_axi_bready) <= bfm_out_w;


    -- component instantiation
    DUT: entity xil_defaultlib.top
        port map (
            clk                => clk,
            resetn             => resetn,
            clk_fs_ext         => clk_fs_ext,

            s_axi_aclk         => s_axi_aclk,
            s_axi_aresetn      => s_axi_aresetn,
            s_axi_awaddr       => s_axi_awaddr,
            s_axi_awprot       => s_axi_awprot,
            s_axi_awvalid      => s_axi_awvalid,
            s_axi_awready      => s_axi_awready,
            s_axi_wdata        => s_axi_wdata,
            s_axi_wstrb        => s_axi_wstrb,
            s_axi_wvalid       => s_axi_wvalid,
            s_axi_wready       => s_axi_wready,
            s_axi_bresp        => s_axi_bresp,
            s_axi_bvalid       => s_axi_bvalid,
            s_axi_bready       => s_axi_bready,
            s_axi_araddr       => s_axi_araddr,
            s_axi_arprot       => s_axi_arprot,
            s_axi_arvalid      => s_axi_arvalid,
            s_axi_arready      => s_axi_arready,
            s_axi_rdata        => s_axi_rdata,
            s_axi_rresp        => s_axi_rresp,
            s_axi_rvalid       => s_axi_rvalid,
            s_axi_rready       => s_axi_rready,

            s_axis_lch_aclk    => s_axis_lch_aclk,
            s_axis_lch_aresetn => s_axis_lch_aresetn,
            s_axis_lch_tdata   => s_axis_lch_tdata,
            s_axis_lch_tvalid  => s_axis_lch_tvalid,
            s_axis_lch_tkeep   => s_axis_lch_tkeep,
            s_axis_lch_tlast   => s_axis_lch_tlast,
            s_axis_lch_tready  => s_axis_lch_tready,

            s_axis_rch_aclk    => s_axis_rch_aclk,
            s_axis_rch_aresetn => s_axis_rch_aresetn,
            s_axis_rch_tdata   => s_axis_rch_tdata,
            s_axis_rch_tvalid  => s_axis_rch_tvalid,
            s_axis_rch_tkeep   => s_axis_rch_tkeep,
            s_axis_rch_tlast   => s_axis_rch_tlast,
            s_axis_rch_tready  => s_axis_rch_tready,

            m_axis_lch_aclk    => m_axis_lch_aclk,
            m_axis_lch_aresetn => m_axis_lch_aresetn,
            m_axis_lch_tdata   => m_axis_lch_tdata,
            m_axis_lch_tvalid  => m_axis_lch_tvalid,
            m_axis_lch_tkeep   => m_axis_lch_tkeep,
            m_axis_lch_tlast   => m_axis_lch_tlast,
            m_axis_lch_tready  => m_axis_lch_tready,
            m_axis_lch_tdest   => m_axis_lch_tdest,

            m_axis_rch_aclk    => m_axis_rch_aclk,
            m_axis_rch_aresetn => m_axis_rch_aresetn,
            m_axis_rch_tdata   => m_axis_rch_tdata,
            m_axis_rch_tvalid  => m_axis_rch_tvalid,
            m_axis_rch_tkeep   => m_axis_rch_tkeep,
            m_axis_rch_tlast   => m_axis_rch_tlast,
            m_axis_rch_tready  => m_axis_rch_tready,
            m_axis_rch_tdest   => m_axis_rch_tdest,

            m_axi_lch_aclk     => m_axi_lch_aclk,
            m_axi_lch_aresetn  => m_axi_lch_aresetn,
            m_axi_lch_awid     => m_axi_lch_awid,
            m_axi_lch_awaddr   => m_axi_lch_awaddr,
            m_axi_lch_awlen    => m_axi_lch_awlen,
            m_axi_lch_awsize   => m_axi_lch_awsize,
            m_axi_lch_awburst  => m_axi_lch_awburst,
            m_axi_lch_awlock   => m_axi_lch_awlock,
            m_axi_lch_awcache  => m_axi_lch_awcache,
            m_axi_lch_awprot   => m_axi_lch_awprot,
            m_axi_lch_awqos    => m_axi_lch_awqos,
            m_axi_lch_awuser   => m_axi_lch_awuser,
            m_axi_lch_awvalid  => m_axi_lch_awvalid,
            m_axi_lch_awready  => m_axi_lch_awready,
            m_axi_lch_wdata    => m_axi_lch_wdata,
            m_axi_lch_wstrb    => m_axi_lch_wstrb,
            m_axi_lch_wlast    => m_axi_lch_wlast,
            m_axi_lch_wuser    => m_axi_lch_wuser,
            m_axi_lch_wvalid   => m_axi_lch_wvalid,
            m_axi_lch_wready   => m_axi_lch_wready,
            m_axi_lch_bid      => m_axi_lch_bid,
            m_axi_lch_bresp    => m_axi_lch_bresp,
            m_axi_lch_buser    => m_axi_lch_buser,
            m_axi_lch_bvalid   => m_axi_lch_bvalid,
            m_axi_lch_bready   => m_axi_lch_bready,
            m_axi_lch_arid     => m_axi_lch_arid,
            m_axi_lch_araddr   => m_axi_lch_araddr,
            m_axi_lch_arlen    => m_axi_lch_arlen,
            m_axi_lch_arsize   => m_axi_lch_arsize,
            m_axi_lch_arburst  => m_axi_lch_arburst,
            m_axi_lch_arlock   => m_axi_lch_arlock,
            m_axi_lch_arcache  => m_axi_lch_arcache,
            m_axi_lch_arprot   => m_axi_lch_arprot,
            m_axi_lch_arqos    => m_axi_lch_arqos,
            m_axi_lch_aruser   => m_axi_lch_aruser,
            m_axi_lch_arvalid  => m_axi_lch_arvalid,
            m_axi_lch_arready  => m_axi_lch_arready,
            m_axi_lch_rid      => m_axi_lch_rid,
            m_axi_lch_rdata    => m_axi_lch_rdata,
            m_axi_lch_rresp    => m_axi_lch_rresp,
            m_axi_lch_rlast    => m_axi_lch_rlast,
            m_axi_lch_ruser    => m_axi_lch_ruser,
            m_axi_lch_rvalid   => m_axi_lch_rvalid,
            m_axi_lch_rready   => m_axi_lch_rready,

            m_axi_rch_aclk     => m_axi_rch_aclk,
            m_axi_rch_aresetn  => m_axi_rch_aresetn,
            m_axi_rch_awid     => m_axi_rch_awid,
            m_axi_rch_awaddr   => m_axi_rch_awaddr,
            m_axi_rch_awlen    => m_axi_rch_awlen,
            m_axi_rch_awsize   => m_axi_rch_awsize,
            m_axi_rch_awburst  => m_axi_rch_awburst,
            m_axi_rch_awlock   => m_axi_rch_awlock,
            m_axi_rch_awcache  => m_axi_rch_awcache,
            m_axi_rch_awprot   => m_axi_rch_awprot,
            m_axi_rch_awqos    => m_axi_rch_awqos,
            m_axi_rch_awuser   => m_axi_rch_awuser,
            m_axi_rch_awvalid  => m_axi_rch_awvalid,
            m_axi_rch_awready  => m_axi_rch_awready,
            m_axi_rch_wdata    => m_axi_rch_wdata,
            m_axi_rch_wstrb    => m_axi_rch_wstrb,
            m_axi_rch_wlast    => m_axi_rch_wlast,
            m_axi_rch_wuser    => m_axi_rch_wuser,
            m_axi_rch_wvalid   => m_axi_rch_wvalid,
            m_axi_rch_wready   => m_axi_rch_wready,
            m_axi_rch_bid      => m_axi_rch_bid,
            m_axi_rch_bresp    => m_axi_rch_bresp,
            m_axi_rch_buser    => m_axi_rch_buser,
            m_axi_rch_bvalid   => m_axi_rch_bvalid,
            m_axi_rch_bready   => m_axi_rch_bready,
            m_axi_rch_arid     => m_axi_rch_arid,
            m_axi_rch_araddr   => m_axi_rch_araddr,
            m_axi_rch_arlen    => m_axi_rch_arlen,
            m_axi_rch_arsize   => m_axi_rch_arsize,
            m_axi_rch_arburst  => m_axi_rch_arburst,
            m_axi_rch_arlock   => m_axi_rch_arlock,
            m_axi_rch_arcache  => m_axi_rch_arcache,
            m_axi_rch_arprot   => m_axi_rch_arprot,
            m_axi_rch_arqos    => m_axi_rch_arqos,
            m_axi_rch_aruser   => m_axi_rch_aruser,
            m_axi_rch_arvalid  => m_axi_rch_arvalid,
            m_axi_rch_arready  => m_axi_rch_arready,
            m_axi_rch_rid      => m_axi_rch_rid,
            m_axi_rch_rdata    => m_axi_rch_rdata,
            m_axi_rch_rresp    => m_axi_rch_rresp,
            m_axi_rch_rlast    => m_axi_rch_rlast,
            m_axi_rch_ruser    => m_axi_rch_ruser,
            m_axi_rch_rvalid   => m_axi_rch_rvalid,
            m_axi_rch_rready   => m_axi_rch_rready,

            m_axi_conf_aclk    => m_axi_conf_aclk,
            m_axi_conf_aresetn => m_axi_conf_aresetn,
            m_axi_conf_awaddr  => m_axi_conf_awaddr,
            m_axi_conf_awprot  => m_axi_conf_awprot,
            m_axi_conf_awvalid => m_axi_conf_awvalid,
            m_axi_conf_awready => m_axi_conf_awready,
            m_axi_conf_wdata   => m_axi_conf_wdata,
            m_axi_conf_wstrb   => m_axi_conf_wstrb,
            m_axi_conf_wvalid  => m_axi_conf_wvalid,
            m_axi_conf_wready  => m_axi_conf_wready,
            m_axi_conf_bresp   => m_axi_conf_bresp,
            m_axi_conf_bvalid  => m_axi_conf_bvalid,
            m_axi_conf_bready  => m_axi_conf_bready,
            m_axi_conf_araddr  => m_axi_conf_araddr,
            m_axi_conf_arprot  => m_axi_conf_arprot,
            m_axi_conf_arvalid => m_axi_conf_arvalid,
            m_axi_conf_arready => m_axi_conf_arready,
            m_axi_conf_rdata   => m_axi_conf_rdata,
            m_axi_conf_rresp   => m_axi_conf_rresp,
            m_axi_conf_rvalid  => m_axi_conf_rvalid,
            m_axi_conf_rready  => m_axi_conf_rready
            );

    -- clock generation
    clk <= not clk after 10 ns;

    -- waveform generation
    main: process
    begin
        read_control_reg(bfm_in_r, bfm_out_r);
        read_status_reg(bfm_in_r, bfm_out_r);
        read_version_reg(bfm_in_r, bfm_out_r);
        read_counters(bfm_in_r, bfm_out_r);

        wait for (50*AXI_CLK_T);
        end_test_and_stop_clock(stop_clock);
    end process main;

    

end architecture TB;
