library xil_defaultlib;
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;
use xil_defaultlib.global.all;

entity core_fsm is
    port (
        clk            : in std_logic;
        resetn         : in std_logic;
        clk_fs         : in std_logic;
        soft_reset     : in std_logic;
        system_enable  : in std_logic;
        system_running : in std_logic;

        -- Left channel
        conv_op_lch        : in  std_logic;
        conv_req_lch       : out conversion_req_t;
        conv_rsp_lch       : in  conversion_rsp_t;
        internal_error_lch : in  std_logic;

        pattern_req_lch      : out std_logic;
        pattern_len_lch      : out unsigned(9 downto 0);
        pattern_finished_lch : in  std_logic;
        pattern_tlast_lch    : in  std_logic;

        buffer_size_l : in unsigned(10 downto 0);
        bram_ptr_l    : in std_logic_vector(31 downto 0);

        -- Right channel
        conv_op_rch        : in  std_logic;
        conv_req_rch       : out conversion_req_t;
        conv_rsp_rch       : in  conversion_rsp_t;
        internal_error_rch : in  std_logic;

        pattern_req_rch      : out std_logic;
        pattern_len_rch      : out unsigned(9 downto 0);
        pattern_finished_rch : in  std_logic;
        pattern_tlast_rch    : in  std_logic;

        buffer_size_r : in unsigned(10 downto 0);
        bram_ptr_r    : in std_logic_vector(31 downto 0)
        );
    
end core_fsm;

architecture RTL of core_fsm is


begin



end RTL;
