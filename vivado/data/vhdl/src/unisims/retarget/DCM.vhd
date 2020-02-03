-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Digital Clock Manager
-- /___/   /\     Filename : DCM.vhd
-- \   \  /  \    Timestamp : Fri Oct 15 02:37:15 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/15/10 - Initial version.
-- End Revision

----- CELL DCM -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity DCM is

  generic (
    CLKDV_DIVIDE : real := 2.0;
    CLKFX_DIVIDE : integer := 1;
    CLKFX_MULTIPLY : integer := 4;
    CLKIN_DIVIDE_BY_2 : boolean := false;
    CLKIN_PERIOD : real := 10.0;                         --non-simulatable
    CLKOUT_PHASE_SHIFT : string := "NONE";
    CLK_FEEDBACK : string := "1X";
    DESKEW_ADJUST : string := "SYSTEM_SYNCHRONOUS";     --non-simulatable
    DFS_FREQUENCY_MODE : string := "LOW";
    DLL_FREQUENCY_MODE : string := "LOW";
    DSS_MODE : string := "NONE";                        --non-simulatable
    DUTY_CYCLE_CORRECTION : boolean := true;
    FACTORY_JF : bit_vector := X"C080";                 --non-simulatable
    PHASE_SHIFT : integer := 0;
    SIM_MODE : string := "SAFE";
    STARTUP_WAIT : boolean := false                     --non-simulatable
    );

  port (
    CLK0 : out std_ulogic := '0';
    CLK180 : out std_ulogic := '0';
    CLK270 : out std_ulogic := '0';
    CLK2X : out std_ulogic := '0';
    CLK2X180 : out std_ulogic := '0';
    CLK90 : out std_ulogic := '0';
    CLKDV : out std_ulogic := '0';
    CLKFX : out std_ulogic := '0';
    CLKFX180 : out std_ulogic := '0';
    LOCKED : out std_ulogic := '0';
    PSDONE : out std_ulogic := '0';
    STATUS : out std_logic_vector(7 downto 0) := "00000000";
    
    CLKFB : in std_ulogic := '0';
    CLKIN : in std_ulogic := '0';
    DSSEN : in std_ulogic := '0';
    PSCLK : in std_ulogic := '0';
    PSEN : in std_ulogic := '0';
    PSINCDEC : in std_ulogic := '0';
    RST : in std_ulogic := '0'
    );
end DCM;


architecture DCM_V of DCM is
signal DO_BUS : std_logic_vector(15 downto 0);
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
	DESKEW_ADJUST => DESKEW_ADJUST,
	DFS_FREQUENCY_MODE => DFS_FREQUENCY_MODE,
	DLL_FREQUENCY_MODE => DLL_FREQUENCY_MODE,
	DUTY_CYCLE_CORRECTION => DUTY_CYCLE_CORRECTION,
	FACTORY_JF => X"F0F0",
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
        DO => DO_BUS, 
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
        STATUS <= DO_BUS(7 downto 0);
end DCM_V;
