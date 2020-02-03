-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    Dual Data Rate Output D Flip-Flop
-- /___/   /\     Filename : ODDR2.vhd
-- \   \  /  \    Timestamp : Wed Oct 20 09:55:25 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/20/10 - Initial version.
-- End Revision

----- CELL ODDR2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity ODDR2 is

  generic(

      DDR_ALIGNMENT : string := "NONE";
      INIT          : bit    := '0';
      SRTYPE        : string := "SYNC"
      );

  port(
      Q           : out std_ulogic;

      C0          : in  std_ulogic;
      C1          : in  std_ulogic;
      CE          : in  std_ulogic := 'H';
      D0          : in  std_ulogic;
      D1          : in  std_ulogic;
      R           : in  std_ulogic := 'L';
      S           : in  std_ulogic := 'L'
    );
end ODDR2;


architecture ODDR2_V of ODDR2 is
signal Q0_G3, Q0_G4 : std_ulogic;
    function ddr_clk_val (DDR_ALIGNMENT: string)
    return string is
    begin
      if ((DDR_ALIGNMENT ="NONE")) then
        return "OPPOSITE_EDGE";
      else
        return "SAME_EDGE";
      end if;
    end ddr_clk_val;
begin
   G3: if((DDR_ALIGNMENT = "C0")  or (DDR_ALIGNMENT = "NONE")) generate

     uut : ODDR
     generic map (
	DDR_CLK_EDGE => ddr_clk_val(DDR_ALIGNMENT),
	INIT => INIT,
	SRTYPE => SRTYPE
     )
      port map (   	
        Q => Q0_G3, 
        C => C0, 
        CE => CE,
        D1 => D0,
        D2 => D1,
        R => R,
        S => S
  );
end generate;
   G4: if(DDR_ALIGNMENT = "C1") generate

     uut : ODDR
     generic map (
	DDR_CLK_EDGE => ddr_clk_val(DDR_ALIGNMENT),
	INIT => INIT,
	SRTYPE => SRTYPE
     )
      port map (   	
        Q => Q0_G4, 
        C => C1, 
        CE => CE,
        D1 => D0,
        D2 => D1,
        R => R,
        S => S
  );
end generate;
       Q <= Q0_G3 when ((DDR_ALIGNMENT = "C0")  or (DDR_ALIGNMENT = "NONE")) else
             Q0_G4;
end ODDR2_V;
