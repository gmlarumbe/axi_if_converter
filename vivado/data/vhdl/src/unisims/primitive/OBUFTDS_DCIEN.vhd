-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 131
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  3-State Differential Signaling Output Buffer
-- /___/   /\     Filename : OBUFTDS_DCIEN.vhd
-- \   \  /  \    Timestamp : Thu Apr 29 14:59:30 PDT 2010
--  \___\/\___\
--
-- Revision:
--    04/29/10 - Initial version.
--    12/20/10 - CR 587760 -- For backend support only in verilog lib, and matching verilog 1-1 in vhdl
--    10/17/11 - CR 626269 -- Removed attribute CAPACITANCE
-- End Revision

----- CELL OBUFTDS_DCIEN -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OBUFTDS_DCIEN is
  generic(
      IOSTANDARD  : string     := "DEFAULT";
      SLEW        : string     := "SLOW"
    );

  port(
    O  : out std_ulogic;
    OB : out std_ulogic;

    DCITERMDISABLE : in std_ulogic;
    I : in std_ulogic;
    T : in std_ulogic
    );
end OBUFTDS_DCIEN;

architecture OBUFTDS_DCIEN_V of OBUFTDS_DCIEN is
begin
  prcs_init : process
  variable FIRST_TIME        : boolean    := TRUE;
  begin

     if((IOSTANDARD = "LVDS_25") or (IOSTANDARD = "LVDSEXT_25")) then
        assert false
        report "DRC Warning : The IOSTANDARD attribute on OBUFTDS_DCIEN instance is either set to LVDS_25 or LVDSEXT_25. These are fixed impedance structure optimized to 100ohm differential. If the intended usage is a bus architecture, please use BLVDS. This is only intended to be used in point to point transmissions that do not have turn around timing requirements"
        severity Warning;
     end if;

     wait;
  end process prcs_init;

  VITALBehavior    : process (I, T)
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

    if ((T = '1') or (T = 'H')) then
      OB <= 'Z';
    elsif ((T = '0') or (T = 'L')) then
      if (((not I) = '1') or ((not I) = 'H')) then
        OB <= '1';
      elsif (((not I) = '0') or ((not I) = 'L')) then
        OB <= '0';
      elsif ((not I) = 'U') then
        OB <= 'U';
      else
        OB <= 'X';  
      end if;
    elsif (T = 'U') then
      OB <= 'U';          
    else                                      
      OB <= 'X';  
    end if;        
  end process;
end OBUFTDS_DCIEN_V;
