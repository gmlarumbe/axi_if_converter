-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 13.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  3-State Output Buffer
-- /___/   /\     Filename : OBUFT_DCIEN.vhd
-- \   \  /  \    Timestamp : Thu Apr 29 14:59:30 PDT 2010
--  \___\/\___\
--
-- Revision:
--    04/29/10 - Initial version.
--    12/20/10 - CR 587760 -- For backend support only in verilog lib, and matching verilog 1-1 in vhdl 
--    10/17/11 - CR 626269 -- Removed attribute CAPACITANCE
-- End Revision

----- CELL OBUFT_DCIEN -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OBUFT_DCIEN is
  generic(
      DRIVE       : integer    := 12;
      IOSTANDARD  : string     := "DEFAULT";
      SLEW        : string     := "SLOW"
    );

  port(
    O : out std_ulogic;
    DCITERMDISABLE : in  std_ulogic;
    I : in  std_ulogic;
    T : in  std_ulogic
    );

end OBUFT_DCIEN;

architecture OBUFT_DCIEN_V of OBUFT_DCIEN is
begin
  VITALBehavior   : process (I, T)
  begin
    if ((T = '1') or (T = 'H')) then
      O <= 'Z';
    elsif ((T = '0') or (T = 'L')) then
      if ((I = '1') or (I = 'H')) then
        O <= '1';
      elsif ((I = '0') or (I = 'L')) then
        O <= '0';
      elsif (I = 'U') then
        O <= 'U';
      else
        O <= 'X';  
      end if;
    elsif (T = 'U') then
      O <= 'U';          
    else                                      
      O <= 'X';  
    end if;
  end process;
end OBUFT_DCIEN_V;
