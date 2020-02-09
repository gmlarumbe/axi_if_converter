library IEEE;
library xil_defaultlib;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

package axif_master_bfm is

    type mf_common_response_w_type_in is record 
        m_axi_aclk    : std_logic;
        m_axi_awvalid : std_logic;
        m_axi_wvalid  : std_logic;
        m_axi_wdata   : std_logic_vector(63 downto 0);
        m_axi_bready  : std_logic;
        m_axi_wlast   : std_logic;
    end record mf_common_response_w_type_in;

    type mf_common_response_w_type_out is record 
        m_axi_awready : std_logic;
        m_axi_wready  : std_logic;
        m_axi_bvalid  : std_logic;
    end record mf_common_response_w_type_out;

    type mf_common_response_r_type_in is record 
        m_axi_aclk    : std_logic;
        m_axi_arvalid : std_logic;
        m_axi_rready  : std_logic;
    end record mf_common_response_r_type_in;

    type mf_common_response_r_type_out is record 
        m_axi_arready : std_logic;
        m_axi_rvalid  : std_logic;
        m_axi_rdata   : std_logic_vector(63 downto 0);
        m_axi_rlast   : std_logic;
    end record mf_common_response_r_type_out;


    procedure axif_master_readresponse(
        signal common_in   : in  mf_common_response_r_type_in;
        signal common_out  : out mf_common_response_r_type_out;
        constant rdata     : in  std_logic_vector(63 downto 0);
        constant burst_len : in  integer  -- number of beats per burst
        );

    procedure axif_master_writeresponse(
        signal common_in        : in  mf_common_response_w_type_in;
        signal common_out       : out mf_common_response_w_type_out
        );


end package axif_master_bfm;


package body axif_master_bfm is

    procedure axif_master_readresponse (
        signal common_in   : in  mf_common_response_r_type_in;
        signal common_out  : out mf_common_response_r_type_out;
        constant rdata     : in  std_logic_vector(63 downto 0);
        constant burst_len : in  integer  -- number of beats per burst
        ) is
    begin
        wait until (rising_edge(common_in.m_axi_aclk) and common_in.m_axi_arvalid = '1');
        common_out.m_axi_arready <= '1';
        wait until (rising_edge(common_in.m_axi_aclk));
        common_out.m_axi_arready <= '0';
        common_out.m_axi_rvalid  <= '1';

        for i in 1 to burst_len loop
            wait until (rising_edge(common_in.m_axi_aclk) and common_in.m_axi_rready = '1');
            common_out.m_axi_rdata <= std_logic_vector(unsigned(rdata) + to_unsigned(i, 64)); -- data <= data + 1;
        end loop;  -- i

        common_out.m_axi_rlast  <= '1';
        wait until (rising_edge(common_in.m_axi_aclk));
        common_out.m_axi_rlast  <= '0';
        common_out.m_axi_rvalid <= '0';
    end axif_master_readresponse;


    procedure axif_master_writeresponse (
        signal common_in        : in  mf_common_response_w_type_in;
        signal common_out       : out mf_common_response_w_type_out
        ) is
    begin
        wait until (rising_edge(common_in.m_axi_aclk) and common_in.m_axi_awvalid = '1');
        common_out.m_axi_awready <= '1';
        wait on common_in.m_axi_aclk until (common_in.m_axi_aclk='1' and common_in.m_axi_wvalid = '1'); -- Equivalent to (rising_edge and condition)
        common_out.m_axi_wready  <= '1';
        common_out.m_axi_awready <= '0';
        wait until (rising_edge(common_in.m_axi_aclk) and common_in.m_axi_wlast = '1');
        common_out.m_axi_bvalid  <= '1';
        common_out.m_axi_wready  <= '0';
        wait until (rising_edge(common_in.m_axi_aclk) and common_in.m_axi_bready = '1');
        common_out.m_axi_bvalid  <= '0';
    end axif_master_writeresponse;



end package body axif_master_bfm;
