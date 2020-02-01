library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
library xil_defaultlib;
use xil_defaultlib.global_sim.all;
use xil_defaultlib.axil_slave_bfm.all;

-------------------------------------------------------------------------------

entity tb_axi_lite_regs is
end entity tb_axi_lite_regs;

-------------------------------------------------------------------------------


architecture TB of tb_axi_lite_regs is

    constant C_S_AXI_DATA_WIDTH : integer := 32;
    constant C_S_AXI_ADDR_WIDTH : integer := 7;

    signal soft_reset     : std_logic;
    signal system_enable  : std_logic;
    signal system_running : std_logic;

    signal s_axi_aclk     : std_logic := '1';
    signal s_axi_aresetn  : std_logic;
    signal s_axi_awaddr   : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_awprot   : std_logic_vector(2 downto 0);
    signal s_axi_awvalid  : std_logic;
    signal s_axi_awready  : std_logic;
    signal s_axi_wdata    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_wstrb    : std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    signal s_axi_wvalid   : std_logic;
    signal s_axi_wready   : std_logic;
    signal s_axi_bresp    : std_logic_vector(1 downto 0);
    signal s_axi_bvalid   : std_logic;
    signal s_axi_bready   : std_logic;
    signal s_axi_araddr   : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_arprot   : std_logic_vector(2 downto 0);
    signal s_axi_arvalid  : std_logic;
    signal s_axi_arready  : std_logic;
    signal s_axi_rdata    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_rresp    : std_logic_vector(1 downto 0);
    signal s_axi_rvalid   : std_logic;
    signal s_axi_rready   : std_logic;

    -- TB signals
    signal stop_clock : std_logic := '0';  -- Stop Clock

    -- BFM signals
    signal common_in_r  : s_common_response_r_in;
    signal common_out_r : s_common_response_r_out;
    signal common_in_w  : s_common_response_w_in;
    signal common_out_w : s_common_response_w_out;

begin

    -- component instantiation
    DUT: entity xil_defaultlib.axi_lite_regs
        generic map (
            C_S_AXI_DATA_WIDTH => C_S_AXI_DATA_WIDTH,
            C_S_AXI_ADDR_WIDTH => C_S_AXI_ADDR_WIDTH
            )
        port map (
            soft_reset     => soft_reset,
            system_enable  => system_enable,
            system_running => system_running,

            s_axi_aclk     => s_axi_aclk,
            s_axi_aresetn  => s_axi_aresetn,
            s_axi_awaddr   => s_axi_awaddr,
            s_axi_awprot   => s_axi_awprot,
            s_axi_awvalid  => s_axi_awvalid,
            s_axi_awready  => s_axi_awready,
            s_axi_wdata    => s_axi_wdata,
            s_axi_wstrb    => s_axi_wstrb,
            s_axi_wvalid   => s_axi_wvalid,
            s_axi_wready   => s_axi_wready,
            s_axi_bresp    => s_axi_bresp,
            s_axi_bvalid   => s_axi_bvalid,
            s_axi_bready   => s_axi_bready,
            s_axi_araddr   => s_axi_araddr,
            s_axi_arprot   => s_axi_arprot,
            s_axi_arvalid  => s_axi_arvalid,
            s_axi_arready  => s_axi_arready,
            s_axi_rdata    => s_axi_rdata,
            s_axi_rresp    => s_axi_rresp,
            s_axi_rvalid   => s_axi_rvalid,
            s_axi_rready   => s_axi_rready
            );


    -- Clock generation
    s_axi_aclk <= (not s_axi_aclk and not stop_clock) after AXI_CLK_T/2;

    -- BFM signal connection
    common_in_r <= (s_axi_aclk, s_axi_arready, s_axi_rready, s_axi_rvalid);
    (s_axi_araddr, s_axi_arvalid, s_axi_rready) <= common_out_r;
    common_in_w <= (s_axi_aclk, s_axi_awready, s_axi_wready, s_axi_bvalid);
    (s_axi_awaddr, s_axi_wdata, s_axi_wstrb, s_axi_awprot, s_axi_awvalid, s_axi_wvalid, s_axi_bready)  <= common_out_w;


    -------------------------
    -- Waveform generation --
    -------------------------
    main: process
        procedure init_values is
        begin
            s_axi_aresetn <= '0';
            wait for (5*AXI_CLK_T);
            s_axi_aresetn <= '1';
        end init_values;

    begin

        init_values;
        slave_read_sim(common_in_r, common_out_r, x"0000_0000");
        slave_write_sim(common_in_w, common_out_w, x"0000_0000", x"FFFF_FFFF");
        end_test_and_stop_clock(stop_clock);

    end process main;

end architecture TB;
