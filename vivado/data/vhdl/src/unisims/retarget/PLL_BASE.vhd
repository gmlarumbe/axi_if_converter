-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Phase Lock Loop Clock
-- /___/   /\     Filename : PLL_BASE.vhd
-- \   \  /  \    Timestamp : Wed Oct 20 10:18:07 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/20/10 - Initial version.
--    05/24/12 - 650821 - Change CLKFBOUT_MULT and CLKOUT0_DIVIDE to integer.
-- End Revision

----- CELL PLL_BASE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity PLL_BASE is

generic (
		BANDWIDTH : string := "OPTIMIZED";
		CLKFBOUT_MULT : integer := 1;
		CLKFBOUT_PHASE : real := 0.0;
		CLKIN_PERIOD : real := 0.000;
		CLKOUT0_DIVIDE : integer := 1;
		CLKOUT0_DUTY_CYCLE : real := 0.5;
		CLKOUT0_PHASE : real := 0.0;
		CLKOUT1_DIVIDE : integer := 1;
		CLKOUT1_DUTY_CYCLE : real := 0.5;
		CLKOUT1_PHASE : real := 0.0;
		CLKOUT2_DIVIDE : integer := 1;
		CLKOUT2_DUTY_CYCLE : real := 0.5;
		CLKOUT2_PHASE : real := 0.0;
		CLKOUT3_DIVIDE : integer := 1;
		CLKOUT3_DUTY_CYCLE : real := 0.5;
		CLKOUT3_PHASE : real := 0.0;
		CLKOUT4_DIVIDE : integer := 1;
		CLKOUT4_DUTY_CYCLE : real := 0.5;
		CLKOUT4_PHASE : real := 0.0;
		CLKOUT5_DIVIDE : integer := 1;
		CLKOUT5_DUTY_CYCLE : real := 0.5;
		CLKOUT5_PHASE : real := 0.0;
      CLK_FEEDBACK : string := "CLKFBOUT";
		COMPENSATION : string := "SYSTEM_SYNCHRONOUS";
      DIVCLK_DIVIDE : integer := 1;
		REF_JITTER : real := 0.100;
		RESET_ON_LOSS_OF_LOCK : boolean := FALSE


  );

port (
		CLKFBOUT : out std_ulogic;
		CLKOUT0 : out std_ulogic;
		CLKOUT1 : out std_ulogic;
		CLKOUT2 : out std_ulogic;
		CLKOUT3 : out std_ulogic;
		CLKOUT4 : out std_ulogic;
		CLKOUT5 : out std_ulogic;
		LOCKED : out std_ulogic;

		CLKFBIN : in std_ulogic;
		CLKIN : in std_ulogic;
		RST : in std_ulogic
     );
end PLL_BASE;


architecture PLL_BASE_V of PLL_BASE is
begin
     prcs_init:process
     begin
     if ((CLK_FEEDBACK = "CLKOUT0")) then
     GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Error :",
             GenericName => " CLK_FEEDBACK ",
             EntityName => "/PLL_BASE",
             GenericValue => CLK_FEEDBACK,
             Unit => "",
             ExpectedValueMsg => " CLK_FEEDBACK not supported ",
             ExpectedGenericValue => " ",
             TailMsg => "",
             MsgSeverity => failure
         );
      end if;
      wait;
  end process prcs_init;
     M7 : MMCME2_BASE
     generic map (
	BANDWIDTH => BANDWIDTH,
	CLKFBOUT_MULT_F => real(CLKFBOUT_MULT),
	CLKFBOUT_PHASE => CLKFBOUT_PHASE,
	CLKIN1_PERIOD => CLKIN_PERIOD,
	CLKOUT0_DIVIDE_F => real(CLKOUT0_DIVIDE),
	CLKOUT0_DUTY_CYCLE => CLKOUT0_DUTY_CYCLE,
	CLKOUT0_PHASE => CLKOUT0_PHASE,
	CLKOUT1_DIVIDE => CLKOUT1_DIVIDE,
	CLKOUT1_PHASE => CLKOUT1_PHASE,
	CLKOUT2_DIVIDE => CLKOUT2_DIVIDE,
	CLKOUT2_DUTY_CYCLE => CLKOUT2_DUTY_CYCLE,
	CLKOUT2_PHASE => CLKOUT2_PHASE,
	CLKOUT3_DIVIDE => CLKOUT3_DIVIDE,
	CLKOUT3_DUTY_CYCLE => CLKOUT3_DUTY_CYCLE,
	CLKOUT3_PHASE => CLKOUT3_PHASE,
	CLKOUT4_DIVIDE => CLKOUT4_DIVIDE,
	CLKOUT4_DUTY_CYCLE => CLKOUT4_DUTY_CYCLE,
	CLKOUT4_PHASE => CLKOUT4_PHASE,
	CLKOUT5_DIVIDE => CLKOUT5_DIVIDE,
	CLKOUT5_DUTY_CYCLE => CLKOUT5_DUTY_CYCLE,
	CLKOUT5_PHASE => CLKOUT5_PHASE,
	DIVCLK_DIVIDE => DIVCLK_DIVIDE,
	REF_JITTER1 => REF_JITTER
     )
      port map (   	
        CLKFBOUT => CLKFBOUT, 
        CLKFBOUTB => open,
        CLKOUT0 => CLKOUT0,
        CLKOUT0B => open,
        CLKOUT1 => CLKOUT1,
        CLKOUT1B => open,
        CLKOUT2 => CLKOUT2,
        CLKOUT2B => open,
        CLKOUT3 => CLKOUT3,
        CLKOUT3B => open, 
        CLKOUT4 => CLKOUT4,
        CLKOUT5 => CLKOUT5, 
        CLKOUT6 => open,
        LOCKED => LOCKED,
        CLKFBIN => CLKFBIN,
        CLKIN1 => CLKIN,
        PWRDWN => '0',
        RST => RST
  );
end PLL_BASE_V;
