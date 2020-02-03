-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Digital Clock Manager with Basic and Phase Shift Features
-- /___/   /\     Filename : DCM_PS.vhd
-- \   \  /  \    Timestamp : Fri Oct 15 02:54:09 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.
-- End Revision

----- CELL DCM_PS -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity DCM_PS is

generic (
		CLKDV_DIVIDE : real := 2.0;
		CLKFX_DIVIDE : integer := 1;
		CLKFX_MULTIPLY : integer := 4;
		CLKIN_DIVIDE_BY_2 : boolean := FALSE;
		CLKIN_PERIOD : real := 10.0;
		CLKOUT_PHASE_SHIFT : string := "NONE";
		CLK_FEEDBACK : string := "1X";                
                DCM_AUTOCALIBRATION : boolean := TRUE;  
		DCM_PERFORMANCE_MODE : string := "MAX_SPEED";
		DESKEW_ADJUST : string := "SYSTEM_SYNCHRONOUS";
		DFS_FREQUENCY_MODE : string := "LOW";
		DLL_FREQUENCY_MODE : string := "LOW";
		DUTY_CYCLE_CORRECTION : boolean := TRUE;
                FACTORY_JF : bit_vector := X"F0F0";                 --non-simulatable                
		PHASE_SHIFT : integer := 0;
		STARTUP_WAIT : boolean := FALSE
  );

port (
		CLK0 : out std_ulogic;
		CLK180 : out std_ulogic;
		CLK270 : out std_ulogic;
		CLK2X : out std_ulogic;
		CLK2X180 : out std_ulogic;
		CLK90 : out std_ulogic;
		CLKDV : out std_ulogic;
		CLKFX : out std_ulogic;
		CLKFX180 : out std_ulogic;
		DO : out std_logic_vector(15 downto 0);
		LOCKED : out std_ulogic;
		PSDONE : out std_ulogic;

		CLKFB : in std_ulogic;
		CLKIN : in std_ulogic;
		PSCLK : in std_ulogic;
		PSEN : in std_ulogic;
		PSINCDEC : in std_ulogic;
		RST : in std_ulogic
     );
end DCM_PS;


architecture DCM_PS_V of DCM_PS is
begin
     
     D0 : DCM_ADV
     generic map (
	CLKDV_DIVIDE => CLKDV_DIVIDE,
	CLKFX_DIVIDE => CLKFX_DIVIDE,
	CLKFX_MULTIPLY => CLKFX_MULTIPLY,
	CLKIN_DIVIDE_BY_2 => CLKIN_DIVIDE_BY_2,
	CLKIN_PERIOD => CLKIN_PERIOD,
	CLKOUT_PHASE_SHIFT => CLKOUT_PHASE_SHIFT,
	CLK_FEEDBACK => CLK_FEEDBACK,
	DCM_AUTOCALIBRATION => DCM_AUTOCALIBRATION,
	DCM_PERFORMANCE_MODE => DCM_PERFORMANCE_MODE,
	DESKEW_ADJUST => DESKEW_ADJUST,
	DFS_FREQUENCY_MODE => DFS_FREQUENCY_MODE,
	DLL_FREQUENCY_MODE => DLL_FREQUENCY_MODE,
	DUTY_CYCLE_CORRECTION => DUTY_CYCLE_CORRECTION,
	FACTORY_JF => FACTORY_JF,
	PHASE_SHIFT => PHASE_SHIFT,
	STARTUP_WAIT => STARTUP_WAIT
     )
      port map (   	
        CLK0 => CLK0, 
        CLK180 => CLK180,
        CLK270 => CLK270,
        CLK2X => CLK2X,
        CLK2X180 => CLK2X180,
        CLK90 => CLK90,
        CLKDV => CLKDV,
        CLKFX => CLKFX,
        CLKFX180 => CLKFX180,
        DO => DO, 
        DRDY => open,
        LOCKED => LOCKED, 
        PSDONE => PSDONE,
        CLKFB => CLKFB,
        CLKIN => CLKIN,
        DADDR => open,
        DCLK => '0',
        DEN => '0',
        DI => open,
        DWE => open,
        PSCLK => PSCLK,
        PSEN => PSEN,
        PSINCDEC => PSINCDEC,
        RST => RST
  );
end DCM_PS_V;
