library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package global_sim is

    constant AXI_CLK_T : time := 6.4 ns;
    constant FS_CLK_T  : time := 22675 ns;  -- 44,1 Khz

    procedure end_test_and_stop_clock(signal stop_clock : out std_logic);

end package global_sim;



package body global_sim is

    procedure end_test_and_stop_clock (signal stop_clock : out std_logic) is
    begin
        assert false report "Test finished" severity note;
        stop_clock <= '1';
        wait;
    end end_test_and_stop_clock;

end package body global_sim;

