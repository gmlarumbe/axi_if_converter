-------------------------------------------------------------------------------
--  Copyright (c) 1995/2015 Xilinx, Inc.
--  All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2015.1 
--  \   \          Description : Xilinx Unified Simulation Library Component
--  /   /                        Phase Lock Loop Clock
-- /___/   /\      Filename    : PLLE3_BASE.vhd
-- \   \  /  \
--  \___\/\___\
--                                 
-------------------------------------------------------------------------------
--  Revision
--  End Revision
-------------------------------------------------------------------------------

----- CELL PLLE3_BASE -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity PLLE3_BASE is
  generic (
    CLKFBOUT_MULT : integer := 5;
    CLKFBOUT_PHASE : real := 0.000;
    CLKIN_PERIOD : real := 0.000;
    CLKOUT0_DIVIDE : integer := 1;
    CLKOUT0_DUTY_CYCLE : real := 0.500;
    CLKOUT0_PHASE : real := 0.000;
    CLKOUT1_DIVIDE : integer := 1;
    CLKOUT1_DUTY_CYCLE : real := 0.500;
    CLKOUT1_PHASE : real := 0.000;
    CLKOUTPHY_MODE : string := "VCO_2X";
    DIVCLK_DIVIDE : integer := 1;
    IS_CLKFBIN_INVERTED : bit := '0';
    IS_CLKIN_INVERTED : bit := '0';
    IS_PWRDWN_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    REF_JITTER : real := 0.010;
    STARTUP_WAIT : string := "FALSE"
  );

  port (
    CLKFBOUT             : out std_ulogic;
    CLKOUT0              : out std_ulogic;
    CLKOUT0B             : out std_ulogic;
    CLKOUT1              : out std_ulogic;
    CLKOUT1B             : out std_ulogic;
    CLKOUTPHY            : out std_ulogic;
    LOCKED               : out std_ulogic;
    CLKFBIN              : in std_ulogic;
    CLKIN                : in std_ulogic;
    CLKOUTPHYEN          : in std_ulogic;
    PWRDWN               : in std_ulogic;
    RST                  : in std_ulogic      
  );
end PLLE3_BASE;

  architecture PLLE3_BASE_V of PLLE3_BASE is

  signal  z1 : std_ulogic := '1';
  signal  z0 : std_ulogic := '0';
  signal  z7 : std_logic_vector(6 downto 0) := "0000000";
  signal  z16 : std_logic_vector(15 downto 0) := "0000000000000000";
  signal  OPEN0 : std_ulogic;
  signal  OPEN1 : std_ulogic;
  signal  OPEN2 : std_ulogic;
  signal  OPEN3 : std_ulogic;
  signal  OPEN4 : std_ulogic;
  signal  OPEN16 : std_logic_vector(15 downto 0);

  begin


    PLLE3_ADV_inst : PLLE3_ADV
        generic map (
            CLKFBOUT_MULT => CLKFBOUT_MULT,
            CLKFBOUT_PHASE => CLKFBOUT_PHASE,
            CLKIN_PERIOD => CLKIN_PERIOD,
            CLKOUT0_DIVIDE => CLKOUT0_DIVIDE,
            CLKOUT0_DUTY_CYCLE => CLKOUT0_DUTY_CYCLE,
            CLKOUT0_PHASE => CLKOUT0_PHASE,
            CLKOUT1_DIVIDE => CLKOUT1_DIVIDE,
            CLKOUT1_DUTY_CYCLE => CLKOUT1_DUTY_CYCLE,
            CLKOUT1_PHASE => CLKOUT1_PHASE,
            CLKOUTPHY_MODE => CLKOUTPHY_MODE,
            DIVCLK_DIVIDE => DIVCLK_DIVIDE,
            IS_CLKFBIN_INVERTED => IS_CLKFBIN_INVERTED,
            IS_CLKIN_INVERTED => IS_CLKIN_INVERTED,
            IS_PWRDWN_INVERTED => IS_PWRDWN_INVERTED,
            IS_RST_INVERTED => IS_RST_INVERTED,
            REF_JITTER => REF_JITTER,
            STARTUP_WAIT => STARTUP_WAIT
    )

    port map (
           CLKFBOUT => CLKFBOUT,
           CLKOUT0 => CLKOUT0,
           CLKOUT0B => CLKOUT0B,
           CLKOUT1 => CLKOUT1,
           CLKOUT1B => CLKOUT1B,
           CLKOUTPHY => CLKOUTPHY,
           DO => OPEN16,
           DRDY => OPEN3,
           LOCKED => LOCKED,
           CLKFBIN => CLKFBIN,
           CLKIN => CLKIN,
           CLKOUTPHYEN => CLKOUTPHYEN,
           DADDR => z7,
           DCLK => z0,
           DEN => z0,
           DI => z16,
           DWE => z0,
           PWRDWN => PWRDWN,
           RST => RST
    ); 

end PLLE3_BASE_V;
