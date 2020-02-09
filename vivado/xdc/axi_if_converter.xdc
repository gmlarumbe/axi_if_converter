# Vivado constraints

create_clock -period 6.4 -name clk -waveform {0.000 3.2} [get_ports clk]
create_clock -period 6.4 -name s_axi_clk -waveform {0.000 3.2} [get_ports s_axi_aclk]
create_clock -period 6.4 -name m_axi_conf_aclk -waveform {0.000 3.2} [get_ports m_axi_conf_aclk]
create_clock -period 6.4 -name s_axis_lch_aclk -waveform {0.000 3.2} [get_ports s_axis_lch_aclk]
create_clock -period 6.4 -name m_axis_lch_aclk -waveform {0.000 3.2} [get_ports m_axis_lch_aclk]
create_clock -period 6.4 -name s_axis_rch_aclk -waveform {0.000 3.2} [get_ports s_axis_rch_aclk]
create_clock -period 6.4 -name m_axis_rch_aclk -waveform {0.000 3.2} [get_ports m_axis_rch_aclk]
create_clock -period 6.4 -name m_axi_lch_aclk -waveform {0.000 3.2} [get_ports m_axi_lch_aclk]
create_clock -period 6.4 -name m_axi_rch_aclk -waveform {0.000 3.2} [get_ports m_axi_rch_aclk]
create_clock -period 22675 -name clk_fs_ext -waveform {0.000 11337} [get_ports clk_fs_ext]


set_clock_groups -asynchronous -group {clk s_axi_aclk m_axi_conf_aclk s_axis_lch_aclk s_axis_rch_aclk m_axis_lch_aclk m_axis_rch_aclk m_axi_lch_aclk m_axi_rch_aclk}
set_clock_groups -asynchronous -group {clk_fs_ext}


create_generated_clock -name I_CLK_DIV/clock_out -source [get_ports clk_fs_ext] -divide_by 16 [get_pins I_CLK_DIV/clock_out]
