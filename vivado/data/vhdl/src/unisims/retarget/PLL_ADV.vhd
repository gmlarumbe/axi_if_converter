-------------------------------------------------------------------------------
-- Copyright (c) 2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 
--  \   \         Description : V5 PLL_ADV retarget macro
--  /   /
-- /___/   /\     Filename : PLL_ADV.vhd
-- \   \  /  \
--  \___\/\___\
-- Revision:
--     10/04/11 - Initial version
--     01/15/14 - retarget to MMCME2_ADV
-- End Revision

----- CELL PLL_ADV -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.NUMERIC_STD.all;
--library STD;
--use STD.TEXTIO.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity PLL_ADV is
generic (
                BANDWIDTH : string := "OPTIMIZED";
                CLK_FEEDBACK : string := "CLKFBOUT";
                CLKFBOUT_DESKEW_ADJUST : string := "NONE";
                CLKFBOUT_MULT : integer := 1;
                CLKFBOUT_PHASE : real := 0.0;
                CLKIN1_PERIOD : real := 0.000;
                CLKIN2_PERIOD : real := 0.000;
                CLKOUT0_DESKEW_ADJUST : string := "NONE";
                CLKOUT0_DIVIDE : integer := 1;
                CLKOUT0_DUTY_CYCLE : real := 0.5;
                CLKOUT0_PHASE : real := 0.0;
                CLKOUT1_DESKEW_ADJUST : string := "NONE";
                CLKOUT1_DIVIDE : integer := 1;
                CLKOUT1_DUTY_CYCLE : real := 0.5;
                CLKOUT1_PHASE : real := 0.0;
                CLKOUT2_DESKEW_ADJUST : string := "NONE";
                CLKOUT2_DIVIDE : integer := 1;
                CLKOUT2_DUTY_CYCLE : real := 0.5;
                CLKOUT2_PHASE : real := 0.0;
                CLKOUT3_DESKEW_ADJUST : string := "NONE";
                CLKOUT3_DIVIDE : integer := 1;
                CLKOUT3_DUTY_CYCLE : real := 0.5;
                CLKOUT3_PHASE : real := 0.0;
                CLKOUT4_DESKEW_ADJUST : string := "NONE";
                CLKOUT4_DIVIDE : integer := 1;
                CLKOUT4_DUTY_CYCLE : real := 0.5;
                CLKOUT4_PHASE : real := 0.0;
                CLKOUT5_DESKEW_ADJUST : string := "NONE";
                CLKOUT5_DIVIDE : integer := 1;
                CLKOUT5_DUTY_CYCLE : real := 0.5;
                CLKOUT5_PHASE : real := 0.0;
                COMPENSATION : string := "SYSTEM_SYNCHRONOUS";
                DIVCLK_DIVIDE : integer := 1;
                EN_REL : boolean := FALSE;
                PLL_PMCD_MODE : boolean := FALSE;
                REF_JITTER : real := 0.100;
                RESET_ON_LOSS_OF_LOCK : boolean := FALSE;
                RST_DEASSERT_CLK : string := "CLKIN1";
                SIM_DEVICE : string := "VIRTEX5"
  );
port (
                CLKFBDCM : out std_ulogic := '0';
                CLKFBOUT : out std_ulogic := '0';
                CLKOUT0 : out std_ulogic := '0';
                CLKOUT1 : out std_ulogic := '0';
                CLKOUT2 : out std_ulogic := '0';
                CLKOUT3 : out std_ulogic := '0';
                CLKOUT4 : out std_ulogic := '0';
                CLKOUT5 : out std_ulogic := '0';
                CLKOUTDCM0 : out std_ulogic := '0';
                CLKOUTDCM1 : out std_ulogic := '0';
                CLKOUTDCM2 : out std_ulogic := '0';
                CLKOUTDCM3 : out std_ulogic := '0';
                CLKOUTDCM4 : out std_ulogic := '0';
                CLKOUTDCM5 : out std_ulogic := '0';
                DO : out std_logic_vector(15 downto 0);
                DRDY : out std_ulogic := '0';
                LOCKED : out std_ulogic := '0';
                CLKFBIN : in std_ulogic;
                CLKIN1 : in std_ulogic;
                CLKIN2 : in std_ulogic;
                CLKINSEL : in std_ulogic;
                DADDR : in std_logic_vector(4 downto 0);
                DCLK : in std_ulogic;
                DEN : in std_ulogic;
                DI : in std_logic_vector(15 downto 0);
                DWE : in std_ulogic;
                REL : in std_ulogic;
                RST : in std_ulogic
     );
end PLL_ADV;


-- Architecture body --

architecture PLL_ADV_V of PLL_ADV is

   function comp_val (COMPENSATION: string)
    return string is
    begin
      if (COMPENSATION = "SYSTEM_SYNCHRONOUS") then
        return "ZHOLD";
      elsif (COMPENSATION = "SOURCE_SYNCHRONOUS") then
        return "BUF_IN";
      else
        return  "BUF_IN";
      end if;
    end comp_val;

  signal DADDR_BUS : std_logic_vector (6 downto 0);
  signal CLKFBOUTB_open : std_ulogic := '0';
  signal CLKOUT0B_open : std_ulogic := '0';
  signal CLKOUT1B_open : std_ulogic := '0';
  signal CLKOUT2B_open : std_ulogic := '0';
  signal CLKOUT3B_open : std_ulogic := '0';
  signal CLKOUT6_open : std_ulogic := '0';
  signal CLKFBSTOPPED_open : std_ulogic := '0';
  signal CLKINSTOPPED_open : std_ulogic := '0';
  signal PSDONE_open : std_ulogic := '0';

  begin

    DADDR_BUS  <= "00" & DADDR;

  mmcme2_adv_1 : MMCME2_ADV 
            generic map (
            BANDWIDTH => BANDWIDTH,
            CLKFBOUT_MULT_F => real(CLKFBOUT_MULT),
            CLKFBOUT_PHASE => CLKFBOUT_PHASE,
--            CLKFBOUT_USE_FINE_PS => FALSE,
            CLKIN1_PERIOD => CLKIN1_PERIOD,
            CLKIN2_PERIOD => CLKIN2_PERIOD,
            CLKOUT0_DIVIDE_F => real(CLKOUT0_DIVIDE),
            CLKOUT0_DUTY_CYCLE => CLKOUT0_DUTY_CYCLE,
            CLKOUT0_PHASE => CLKOUT0_PHASE,
--            CLKOUT0_USE_FINE_PS => FALSE,
            CLKOUT1_DIVIDE => CLKOUT1_DIVIDE,
            CLKOUT1_DUTY_CYCLE => CLKOUT1_DUTY_CYCLE,
            CLKOUT1_PHASE => CLKOUT1_PHASE,
--            CLKOUT1_USE_FINE_PS => FALSE,
            CLKOUT2_DIVIDE => CLKOUT2_DIVIDE,
            CLKOUT2_DUTY_CYCLE => CLKOUT2_DUTY_CYCLE,
            CLKOUT2_PHASE => CLKOUT2_PHASE,
--            CLKOUT2_USE_FINE_PS => FALSE,
            CLKOUT3_DIVIDE => CLKOUT3_DIVIDE,
            CLKOUT3_DUTY_CYCLE => CLKOUT3_DUTY_CYCLE,
            CLKOUT3_PHASE => CLKOUT3_PHASE,
--            CLKOUT3_USE_FINE_PS => FALSE,
--            CLKOUT4_CASCADE => FALSE,
            CLKOUT4_DIVIDE => CLKOUT4_DIVIDE,
            CLKOUT4_DUTY_CYCLE => CLKOUT4_DUTY_CYCLE,
            CLKOUT4_PHASE => CLKOUT4_PHASE,
--            CLKOUT4_USE_FINE_PS => FALSE,
            CLKOUT5_DIVIDE => CLKOUT5_DIVIDE,
            CLKOUT5_DUTY_CYCLE => CLKOUT5_DUTY_CYCLE,
            CLKOUT5_PHASE => CLKOUT5_PHASE,
--            CLKOUT5_USE_FINE_PS => FALSE,
--            CLKOUT6_DIVIDE => 1,
--            CLKOUT6_DUTY_CYCLE => 0.500,
--            CLKOUT6_PHASE => 0.000,
--            CLKOUT6_USE_FINE_PS => FALSE,
            COMPENSATION => comp_val(COMPENSATION),
            DIVCLK_DIVIDE => DIVCLK_DIVIDE,
--            IS_CLKINSEL_INVERTED => '0',
--            IS_PSEN_INVERTED => '0',
--            IS_PSINCDEC_INVERTED => '0',
--            IS_PWRDWN_INVERTED => '0',
--            IS_RST_INVERTED => '0',
            REF_JITTER1 => REF_JITTER 
--            REF_JITTER2 => 0.0,
--            SS_EN => "FALSE", -- string
--            SS_MODE => "CENTER_HIGH",
--            SS_MOD_PERIOD => 10000,
--            STARTUP_WAIT => FALSE
          )
          port map (
            CLKFBOUT     => CLKFBOUT,
            CLKFBOUTB    => CLKFBOUTB_open,
            CLKFBSTOPPED => CLKFBSTOPPED_open,
            CLKINSTOPPED => CLKINSTOPPED_open,
            CLKOUT0      => CLKOUT0,
            CLKOUT0B     => CLKOUT0B_open,
            CLKOUT1      => CLKOUT1,
            CLKOUT1B     => CLKOUT1B_open,
            CLKOUT2      => CLKOUT2,
            CLKOUT2B     => CLKOUT2B_open,
            CLKOUT3      => CLKOUT3,
            CLKOUT3B     => CLKOUT3B_open,
            CLKOUT4      => CLKOUT4,
            CLKOUT5      => CLKOUT5,
            CLKOUT6      => CLKOUT6_open,
            DO           => DO,
            DRDY         => DRDY,
            LOCKED       => LOCKED,
            PSDONE       => PSDONE_open,
            CLKFBIN      => CLKFBIN,
            CLKIN1       => CLKIN1,
            CLKIN2       => CLKIN2,
            CLKINSEL     => CLKINSEL,
            DADDR        => DADDR_BUS,
            DCLK         => DCLK,
            DEN          => DEN,
            DI           => DI,
            DWE          => DWE,
            PSCLK        => '0',
            PSEN         => '0',
            PSINCDEC     => '0',
            PWRDWN       => '0',
            RST          => RST
        );

end PLL_ADV_V;

