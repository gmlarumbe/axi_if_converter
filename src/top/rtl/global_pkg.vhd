library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package global is

    constant C_M_AXI_BURST_LEN : integer := 32;

    constant LEFT_CH_BASE_ADDRESS : std_logic_vector(31 downto 0) := x"1000_0000";
    constant RIGHT_CH_BASE_ADDRESS : std_logic_vector(31 downto 0) := x"2000_0000";

end package global;
