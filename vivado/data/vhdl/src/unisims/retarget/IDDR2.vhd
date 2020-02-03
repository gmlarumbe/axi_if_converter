-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    Dual Data Rate Input D Flip-Flop
-- /___/   /\     Filename : IDDR2.vhd
-- \   \  /  \    Timestamp : Tue Oct 19 05:07:05 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/19/10 - Initial version.
-- End Revision

----- CELL IDDR2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity IDDR2 is

  generic(

      DDR_ALIGNMENT : string := "NONE";
      INIT_Q0       : bit    := '0';
      INIT_Q1       : bit    := '0';
      SRTYPE        : string := "SYNC"
      );

  port(
      Q0          : out std_ulogic;
      Q1          : out std_ulogic;

      C0          : in  std_ulogic;
      C1          : in  std_ulogic;
      CE          : in  std_ulogic := 'H';
      D           : in  std_ulogic;
      R           : in  std_ulogic := 'L';
      S           : in  std_ulogic := 'L'
    );
end IDDR2;


architecture IDDR2_V of IDDR2 is
signal Q0_G1, Q1_G1, Q0_G2, Q1_G2 : std_ulogic;
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
   G1: if((DDR_ALIGNMENT = "C0")  or (DDR_ALIGNMENT = "NONE")) generate

     uut : IDDR
     generic map (
	DDR_CLK_EDGE => ddr_clk_val(DDR_ALIGNMENT),
	INIT_Q1 => INIT_Q0,
	INIT_Q2 => INIT_Q1,
	SRTYPE => SRTYPE
     )
      port map (   	
        Q1 => Q0_G1, 
        Q2 => Q1_G1,
        C => C0, 
        CE => CE,
        D => D,
        R => R,
        S => S
  );
end generate;
   G2: if(DDR_ALIGNMENT = "C1") generate

     uut : IDDR
     generic map (
	DDR_CLK_EDGE => ddr_clk_val(DDR_ALIGNMENT),
	INIT_Q1 => INIT_Q0,
	INIT_Q2 => INIT_Q1,
	SRTYPE => SRTYPE
     )
      port map (   	
        Q1 => Q0_G2, 
        Q2 => Q1_G2,
        C => C1, 
        CE => CE,
        D => D,
        R => R,
        S => S
  );
end generate;
       Q0 <= Q0_G1 when ((DDR_ALIGNMENT = "C0")  or (DDR_ALIGNMENT = "NONE")) else
             Q0_G2;
       Q1 <= Q1_G1 when ((DDR_ALIGNMENT = "C0")  or (DDR_ALIGNMENT = "NONE")) else
             Q1_G2;
end IDDR2_V;
