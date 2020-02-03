library IEEE;
library xil_defaultlib;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;
use xil_defaultlib.global.all;
use xil_defaultlib.global_sim.all;

entity tb_core_fsm is
end tb_core_fsm;

architecture TB of tb_core_fsm is

    signal clk : std_logic := '0';
    signal resetn               : std_logic;
    signal clk_fs               : std_logic;
    signal soft_reset           : std_logic;

    signal system_enable        : std_logic;
    signal system_running       : std_logic;

    signal conv_op_lch          : std_logic;
    signal conv_req_lch         : conversion_req_t;
    signal conv_rsp_lch         : conversion_rsp_t;
    signal internal_error_lch   : std_logic;
    signal pattern_req_lch      : std_logic;
    signal pattern_len_lch      : unsigned(9 downto 0);
    signal pattern_finished_lch : std_logic;
    signal pattern_tlast_lch    : std_logic;
    signal buffer_size_l        : unsigned(10 downto 0);
    signal bram_ptr_l           : std_logic_vector(31 downto 0);

    signal conv_op_rch          : std_logic;
    signal conv_req_rch         : conversion_req_t;
    signal conv_rsp_rch         : conversion_rsp_t;
    signal internal_error_rch   : std_logic;
    signal pattern_req_rch      : std_logic;
    signal pattern_len_rch      : unsigned(9 downto 0);
    signal pattern_finished_rch : std_logic;
    signal pattern_tlast_rch    : std_logic;
    signal buffer_size_r        : unsigned(10 downto 0);
    signal bram_ptr_r           : std_logic_vector(31 downto 0);

    signal stop_clock : std_logic := '0';

begin

    -- Clock generation
    clk <= (not clk and not stop_clock) after AXI_CLK_T/2;


    DUT: entity xil_defaultlib.core_fsm
        port map (
            clk                  => clk,
            resetn               => resetn,
            clk_fs               => clk_fs,
            soft_reset           => soft_reset,
            system_enable        => system_enable,
            system_running       => system_running,
            -- Left channel
            conv_op_lch          => conv_op_lch,
            conv_req_lch         => conv_req_lch,
            conv_rsp_lch         => conv_rsp_lch,
            internal_error_lch   => internal_error_lch,
            pattern_req_lch      => pattern_req_lch,
            pattern_len_lch      => pattern_len_lch,
            pattern_finished_lch => pattern_finished_lch,
            pattern_tlast_lch    => pattern_tlast_lch,
            buffer_size_l        => buffer_size_l,
            bram_ptr_l           => bram_ptr_l,
            -- Right channel
            conv_op_rch          => conv_op_rch,
            conv_req_rch         => conv_req_rch,
            conv_rsp_rch         => conv_rsp_rch,
            internal_error_rch   => internal_error_rch,
            pattern_req_rch      => pattern_req_rch,
            pattern_len_rch      => pattern_len_rch,
            pattern_finished_rch => pattern_finished_rch,
            pattern_tlast_rch    => pattern_tlast_rch,
            buffer_size_r        => buffer_size_r,
            bram_ptr_r           => bram_ptr_r
            );


   main: process
   begin
       wait for (10*AXI_CLK_T);
       end_test_and_stop_clock(stop_clock);
       
   end process;

end TB;
