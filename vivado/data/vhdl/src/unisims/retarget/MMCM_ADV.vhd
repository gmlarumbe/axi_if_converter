-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
-- /___/   /\     Filename : MMCM_ADV.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 02:19:19 PST 2010
--  \___\/\___\
--
-- Revision:
--    03/05/12 - Initial version.
-- End Revision

----- CELL MMCM_ADV -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.NUMERIC_STD.all;
library STD;
use STD.TEXTIO.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity MMCM_ADV is
generic (

      BANDWIDTH : string := "OPTIMIZED";
      CLKFBOUT_MULT_F : real := 5.000;
      CLKFBOUT_PHASE : real := 0.000;
      CLKFBOUT_USE_FINE_PS : boolean := FALSE;
      CLKIN1_PERIOD : real := 0.000;
      CLKIN2_PERIOD : real := 0.000;
      CLKOUT0_DIVIDE_F : real := 1.000;
      CLKOUT0_DUTY_CYCLE : real := 0.500;
      CLKOUT0_PHASE : real := 0.000;
      CLKOUT0_USE_FINE_PS : boolean := FALSE;
      CLKOUT1_DIVIDE : integer := 1;
      CLKOUT1_DUTY_CYCLE : real := 0.500;
      CLKOUT1_PHASE : real := 0.000;
      CLKOUT1_USE_FINE_PS : boolean := FALSE;
      CLKOUT2_DIVIDE : integer := 1;
      CLKOUT2_DUTY_CYCLE : real := 0.500;
      CLKOUT2_PHASE : real := 0.000;
      CLKOUT2_USE_FINE_PS : boolean := FALSE;
      CLKOUT3_DIVIDE : integer := 1;
      CLKOUT3_DUTY_CYCLE : real := 0.500;
      CLKOUT3_PHASE : real := 0.000;
      CLKOUT3_USE_FINE_PS : boolean := FALSE;
      CLKOUT4_CASCADE : boolean := FALSE;
      CLKOUT4_DIVIDE : integer := 1;
      CLKOUT4_DUTY_CYCLE : real := 0.500;
      CLKOUT4_PHASE : real := 0.000;
      CLKOUT4_USE_FINE_PS : boolean := FALSE;
      CLKOUT5_DIVIDE : integer := 1;
      CLKOUT5_DUTY_CYCLE : real := 0.500;
      CLKOUT5_PHASE : real := 0.000;
      CLKOUT5_USE_FINE_PS : boolean := FALSE;
      CLKOUT6_DIVIDE : integer := 1;
      CLKOUT6_DUTY_CYCLE : real := 0.500;
      CLKOUT6_PHASE : real := 0.000;
      CLKOUT6_USE_FINE_PS : boolean := FALSE;
      CLOCK_HOLD : boolean := FALSE;
      COMPENSATION : string := "ZHOLD";
      DIVCLK_DIVIDE : integer := 1;
      IS_PSINCDEC_INVERTED : bit := '0';
      REF_JITTER1 : real := 0.0;
      REF_JITTER2 : real := 0.0;
      STARTUP_WAIT : boolean := FALSE
  );
port (
      CLKFBOUT             : out std_ulogic := '0';
      CLKFBOUTB            : out std_ulogic := '0';
      CLKFBSTOPPED         : out std_ulogic := '0';
      CLKINSTOPPED         : out std_ulogic := '0';
      CLKOUT0              : out std_ulogic := '0';
      CLKOUT0B             : out std_ulogic := '0';
      CLKOUT1              : out std_ulogic := '0';
      CLKOUT1B             : out std_ulogic := '0';
      CLKOUT2              : out std_ulogic := '0';
      CLKOUT2B             : out std_ulogic := '0';
      CLKOUT3              : out std_ulogic := '0';
      CLKOUT3B             : out std_ulogic := '0';
      CLKOUT4              : out std_ulogic := '0';
      CLKOUT5              : out std_ulogic := '0';
      CLKOUT6              : out std_ulogic := '0';
      DO                   : out std_logic_vector (15 downto 0);
      DRDY                 : out std_ulogic := '0';
      LOCKED               : out std_ulogic := '0';
      PSDONE               : out std_ulogic := '0';
      CLKFBIN              : in std_ulogic;
      CLKIN1               : in std_ulogic;
      CLKIN2               : in std_ulogic;
      CLKINSEL             : in std_ulogic;
      DADDR                : in std_logic_vector(6 downto 0);
      DCLK                 : in std_ulogic;
      DEN                  : in std_ulogic;
      DI                   : in std_logic_vector(15 downto 0);
      DWE                  : in std_ulogic;
      PSCLK                : in std_ulogic;
      PSEN                 : in std_ulogic;
      PSINCDEC             : in std_ulogic;
      PWRDWN               : in std_ulogic;
      RST                  : in std_ulogic
     );
end MMCM_ADV;


-- Architecture body --

architecture MMCM_ADV_V of MMCM_ADV is
begin

  mmcm_adv_1 : MMCME2_ADV 
            generic map (
            BANDWIDTH => BANDWIDTH,
            COMPENSATION => COMPENSATION,
            CLKOUT4_CASCADE => CLKOUT4_CASCADE,
            STARTUP_WAIT => STARTUP_WAIT,
            CLKFBOUT_USE_FINE_PS => CLKFBOUT_USE_FINE_PS,
            CLKOUT0_USE_FINE_PS => CLKOUT0_USE_FINE_PS,
            CLKOUT1_USE_FINE_PS => CLKOUT1_USE_FINE_PS,
            CLKOUT2_USE_FINE_PS => CLKOUT2_USE_FINE_PS,
            CLKOUT3_USE_FINE_PS => CLKOUT3_USE_FINE_PS,
            CLKOUT4_USE_FINE_PS => CLKOUT4_USE_FINE_PS,
            CLKOUT5_USE_FINE_PS => CLKOUT5_USE_FINE_PS,
            CLKOUT6_USE_FINE_PS => CLKOUT6_USE_FINE_PS,
            CLKOUT1_DIVIDE => CLKOUT1_DIVIDE,
            CLKOUT2_DIVIDE => CLKOUT2_DIVIDE,
            CLKOUT3_DIVIDE => CLKOUT3_DIVIDE,
            CLKOUT4_DIVIDE => CLKOUT4_DIVIDE,
            CLKOUT5_DIVIDE => CLKOUT5_DIVIDE,
            CLKOUT6_DIVIDE => CLKOUT6_DIVIDE,
            IS_PSINCDEC_INVERTED => IS_PSINCDEC_INVERTED,
            DIVCLK_DIVIDE => DIVCLK_DIVIDE,
            CLKFBOUT_MULT_F => CLKFBOUT_MULT_F,
            CLKFBOUT_PHASE => CLKFBOUT_PHASE,
            CLKIN1_PERIOD => CLKIN1_PERIOD,
            CLKIN2_PERIOD => CLKIN2_PERIOD,
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
            REF_JITTER1 => REF_JITTER1, 
            REF_JITTER2 => REF_JITTER2 
          )
          port map (
            CLKFBIN => CLKFBIN,
            CLKFBOUT => CLKFBOUT,
            CLKFBOUTB => CLKFBOUTB,
            CLKIN1 => CLKIN1,
            CLKIN2 => CLKIN2,
            CLKOUT0 => CLKOUT0,
            CLKOUT0B => CLKOUT0B,
            CLKOUT1 => CLKOUT1,
            CLKOUT1B => CLKOUT1B,
            CLKOUT2 => CLKOUT2,
            CLKOUT2B => CLKOUT2B,
            CLKOUT3 => CLKOUT3,
            CLKOUT3B => CLKOUT3B,
            CLKOUT4 => CLKOUT4,
            CLKOUT5 => CLKOUT5,
            CLKOUT6 => CLKOUT6,
            DADDR => DADDR,
            DCLK => DCLK,
            DEN => DEN,
            DI => DI,
            DO => DO,
            DRDY => DRDY,
            DWE => DWE,
            LOCKED => LOCKED,
            CLKINSEL => CLKINSEL,
            CLKFBSTOPPED => CLKFBSTOPPED,
            CLKINSTOPPED => CLKINSTOPPED,
            PSDONE => PSDONE,
            PSCLK => PSCLK,
            PSEN => PSEN,
            PSINCDEC => PSINCDEC,
            PWRDWN => PWRDWN,
            RST => RST
          );

end MMCM_ADV_V;

