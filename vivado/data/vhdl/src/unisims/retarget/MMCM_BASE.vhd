-------------------------------------------------------
--  Copyright (c) 2008 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : MMCM_BASE.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------

----- CELL MMCM_BASE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

  entity MMCM_BASE is
    generic (
      BANDWIDTH : string := "OPTIMIZED";
      CLKFBOUT_MULT_F : real := 5.000;
      CLKFBOUT_PHASE : real := 0.000;
      CLKIN1_PERIOD : real := 0.000;
      CLKOUT0_DIVIDE_F : real := 1.000;
      CLKOUT0_DUTY_CYCLE : real := 0.500;
      CLKOUT0_PHASE : real := 0.000;
      CLKOUT1_DIVIDE : integer := 1;
      CLKOUT1_DUTY_CYCLE : real := 0.500;
      CLKOUT1_PHASE : real := 0.000;
      CLKOUT2_DIVIDE : integer := 1;
      CLKOUT2_DUTY_CYCLE : real := 0.500;
      CLKOUT2_PHASE : real := 0.000;
      CLKOUT3_DIVIDE : integer := 1;
      CLKOUT3_DUTY_CYCLE : real := 0.500;
      CLKOUT3_PHASE : real := 0.000;
      CLKOUT4_CASCADE : boolean := FALSE;
      CLKOUT4_DIVIDE : integer := 1;
      CLKOUT4_DUTY_CYCLE : real := 0.500;
      CLKOUT4_PHASE : real := 0.000;
      CLKOUT5_DIVIDE : integer := 1;
      CLKOUT5_DUTY_CYCLE : real := 0.500;
      CLKOUT5_PHASE : real := 0.000;
      CLKOUT6_DIVIDE : integer := 1;
      CLKOUT6_DUTY_CYCLE : real := 0.500;
      CLKOUT6_PHASE : real := 0.000;
      CLOCK_HOLD : boolean := FALSE;
      DIVCLK_DIVIDE : integer := 1;
      REF_JITTER1 : real := 0.010;
      STARTUP_WAIT : boolean := FALSE
    );

    port (
      CLKFBOUT             : out std_ulogic;
      CLKFBOUTB            : out std_ulogic;
      CLKOUT0              : out std_ulogic;
      CLKOUT0B             : out std_ulogic;
      CLKOUT1              : out std_ulogic;
      CLKOUT1B             : out std_ulogic;
      CLKOUT2              : out std_ulogic;
      CLKOUT2B             : out std_ulogic;
      CLKOUT3              : out std_ulogic;
      CLKOUT3B             : out std_ulogic;
      CLKOUT4              : out std_ulogic;
      CLKOUT5              : out std_ulogic;
      CLKOUT6              : out std_ulogic;
      LOCKED               : out std_ulogic;
      CLKFBIN              : in std_ulogic;
      CLKIN1               : in std_ulogic;
      PWRDWN               : in std_ulogic;
      RST                  : in std_ulogic      
    );

  end MMCM_BASE;

  architecture MMCM_BASE_V of MMCM_BASE is
    
    signal OPEN_DRDY : std_logic;
    signal OPEN_PSDONE : std_logic;
    signal OPEN_FBS : std_logic;
    signal OPEN_INS : std_logic;
    signal OPEN_DO : std_logic_vector(15 downto 0);

  begin

   mmcm_adv_1 : MMCME2_ADV 
          generic map(
            BANDWIDTH => BANDWIDTH,
            CLKOUT4_CASCADE => CLKOUT4_CASCADE,
            STARTUP_WAIT => STARTUP_WAIT,
            CLKOUT1_DIVIDE => CLKOUT1_DIVIDE,
            CLKOUT2_DIVIDE => CLKOUT2_DIVIDE,
            CLKOUT3_DIVIDE => CLKOUT3_DIVIDE,
            CLKOUT4_DIVIDE => CLKOUT4_DIVIDE,
            CLKOUT5_DIVIDE => CLKOUT5_DIVIDE,
            CLKOUT6_DIVIDE => CLKOUT6_DIVIDE,
            DIVCLK_DIVIDE => DIVCLK_DIVIDE,
            CLKFBOUT_MULT_F => CLKFBOUT_MULT_F,
            CLKFBOUT_PHASE => CLKFBOUT_PHASE,
            CLKIN1_PERIOD => CLKIN1_PERIOD,
            CLKIN2_PERIOD => 10.000,
            CLKOUT0_DIVIDE_F => CLKOUT0_DIVIDE_F,
            CLKOUT0_DUTY_CYCLE => CLKOUT0_DUTY_CYCLE,
            CLKOUT0_PHASE => CLKOUT0_PHASE,
            CLKOUT1_DUTY_CYCLE => CLKOUT1_DUTY_CYCLE,
            CLKOUT1_PHASE => CLKOUT1_PHASE,
            CLKOUT2_DUTY_CYCLE => CLKOUT2_DUTY_CYCLE,
            CLKOUT2_PHASE => CLKOUT2_PHASE,
            CLKOUT3_DUTY_CYCLE => CLKOUT3_DUTY_CYCLE,
            CLKOUT3_PHASE => CLKOUT3_PHASE,
            CLKOUT4_DUTY_CYCLE => CLKOUT4_DUTY_CYCLE,
            CLKOUT4_PHASE => CLKOUT4_PHASE,
            CLKOUT5_DUTY_CYCLE => CLKOUT5_DUTY_CYCLE,
            CLKOUT5_PHASE => CLKOUT5_PHASE,
            CLKOUT6_DUTY_CYCLE => CLKOUT6_DUTY_CYCLE,
            CLKOUT6_PHASE => CLKOUT6_PHASE,
            REF_JITTER1 => REF_JITTER1 
            ) 
          port map (
            CLKFBIN  => CLKFBIN,
            CLKFBOUT  => CLKFBOUT,
            CLKFBOUTB  => CLKFBOUTB,
            CLKIN1  => CLKIN1,
            CLKIN2  => '0',
            CLKOUT0  => CLKOUT0,
            CLKOUT0B  => CLKOUT0B,
            CLKOUT1  => CLKOUT1,
            CLKOUT1B  => CLKOUT1B,
            CLKOUT2  => CLKOUT2,
            CLKOUT2B  => CLKOUT2B,
            CLKOUT3  => CLKOUT3,
            CLKOUT3B  => CLKOUT3B,
            CLKOUT4  => CLKOUT4,
            CLKOUT5  => CLKOUT5,
            CLKOUT6  => CLKOUT6,
            DADDR  => "0000000",
            DCLK  => '0',
            DEN  => '0',
            DI  => X"0000",
            DO  => OPEN_DO,
            DRDY  => OPEN_DRDY,
            DWE  => '0',
            LOCKED  => LOCKED,
            CLKINSEL => '1',
            CLKFBSTOPPED => OPEN_FBS,
            CLKINSTOPPED => OPEN_INS,
            PSDONE => OPEN_PSDONE,
            PSCLK => '0',
            PSEN => '0',
            PSINCDEC => '0',
            PWRDWN => PWRDWN,
            RST  => RST
          );
 
  end MMCM_BASE_V;
