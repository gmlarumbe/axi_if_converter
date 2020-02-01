library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package axi_interface_converter_types is

    type conversion_op is (S2MM, MM2S);

    type conversion_req_t is record
        op_type : conversion_op;
        request : std_logic;
        size    : unsigned(9 downto 0);
        address : std_logic_vector(31 downto 0);
    end record conversion_req_t;

    type conversion_rsp_t is record
        s2mm_done : std_logic;
        mm2s_done : std_logic;
    end record conversion_rsp_t;

end package axi_interface_converter_types;
