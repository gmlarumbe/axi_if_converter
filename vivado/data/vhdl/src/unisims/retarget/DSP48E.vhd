-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  18X18 Signed Multiplier Followed by Three-Input Adder plus ALU with Pipeline Registers
-- /___/   /\     Filename : DSP48E.vhd
-- \   \  /  \    Timestamp : Mon Oct 18 12:40:15 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/18/10 - Initial version.
--    08/10/12 - 669725 change USE_MULT mapping
--    03/06/13 - 704308 change AUTORESET_PATDET mapping
--    03/06/13 - 703959 added SEL_MASK mapping
--    04/09/13 - 710216 correct SEL_ROUNDING_MASK = "SEL_MASK"
-- End Revision

----- CELL DSP48E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity DSP48E is

  generic(

        SIM_MODE	: string		:= "SAFE";

        ACASCREG	: integer		:= 1;
        ALUMODEREG	: integer		:= 1;
        AREG		: integer		:= 1;
        AUTORESET_PATTERN_DETECT		: boolean		:= FALSE;
        AUTORESET_PATTERN_DETECT_OPTINV		: string		:= "MATCH";
        A_INPUT		: string		:= "DIRECT";
        BCASCREG	: integer		:= 1;
        BREG		: integer		:= 1;
        B_INPUT		: string		:= "DIRECT";
        CARRYINREG	: integer		:= 1;
        CARRYINSELREG	: integer		:= 1;
        CREG		: integer		:= 1;
        MASK            : bit_vector            := X"3FFFFFFFFFFF";
        MREG		: integer		:= 1;
        MULTCARRYINREG	: integer		:= 1;
        OPMODEREG	: integer		:= 1;
        PATTERN         : bit_vector            := X"000000000000";
        PREG		: integer		:= 1;
        SEL_MASK	: string		:= "MASK";
        SEL_PATTERN	: string		:= "PATTERN";
        SEL_ROUNDING_MASK	: string	:= "SEL_MASK";
        USE_MULT	: string		:= "MULT_S";
        USE_PATTERN_DETECT	: string	:= "NO_PATDET";
        USE_SIMD	: string		:= "ONE48"
        );

  port(
        ACOUT                   : out std_logic_vector(29 downto 0);
        BCOUT                   : out std_logic_vector(17 downto 0);
        CARRYCASCOUT            : out std_ulogic;
        CARRYOUT                : out std_logic_vector(3 downto 0);
        MULTSIGNOUT             : out std_ulogic;
        OVERFLOW                : out std_ulogic;
        P                       : out std_logic_vector(47 downto 0);
        PATTERNBDETECT          : out std_ulogic;
        PATTERNDETECT           : out std_ulogic;
        PCOUT                   : out std_logic_vector(47 downto 0);
        UNDERFLOW               : out std_ulogic;

        A                       : in  std_logic_vector(29 downto 0);
        ACIN                    : in  std_logic_vector(29 downto 0);
        ALUMODE                 : in  std_logic_vector(3 downto 0);
        B                       : in  std_logic_vector(17 downto 0);
        BCIN                    : in  std_logic_vector(17 downto 0);
        C                       : in  std_logic_vector(47 downto 0);
        CARRYCASCIN             : in  std_ulogic;
        CARRYIN                 : in  std_ulogic;
        CARRYINSEL              : in  std_logic_vector(2 downto 0);
        CEA1                    : in  std_ulogic;
        CEA2                    : in  std_ulogic;
        CEALUMODE               : in  std_ulogic;
        CEB1                    : in  std_ulogic;
        CEB2                    : in  std_ulogic;
        CEC                     : in  std_ulogic;
        CECARRYIN               : in  std_ulogic;
        CECTRL                  : in  std_ulogic;
        CEM                     : in  std_ulogic;
        CEMULTCARRYIN           : in  std_ulogic;
        CEP                     : in  std_ulogic;
        CLK                     : in  std_ulogic;
        MULTSIGNIN              : in std_ulogic;
        OPMODE                  : in  std_logic_vector(6 downto 0);
        PCIN                    : in  std_logic_vector(47 downto 0);
        RSTA                    : in  std_ulogic;
        RSTALLCARRYIN           : in  std_ulogic;
        RSTALUMODE              : in  std_ulogic;
        RSTB                    : in  std_ulogic;
        RSTC                    : in  std_ulogic;
        RSTCTRL                 : in  std_ulogic;
        RSTM                    : in  std_ulogic;
        RSTP                    : in  std_ulogic
      );
end DSP48E;


architecture DSP48E_V of DSP48E is
    function use_mult_val (USE_MULT: string)
    return string is
    begin
      if (USE_MULT ="MULT_S") then 
        return "MULTIPLY";
      elsif (USE_MULT ="MULT") then
        return "DYNAMIC";
      else
        return USE_MULT;
      end if;
    end use_mult_val;

    function patdet_val (AUTORESET_PATTERN_DETECT: boolean; AUTORESET_PATTERN_DETECT_OPTINV:string)
    return string is
    begin
     if (AUTORESET_PATTERN_DETECT = FALSE) then return "NO_RESET";
     elsif (AUTORESET_PATTERN_DETECT = TRUE) then
      if (AUTORESET_PATTERN_DETECT_OPTINV = "MATCH") then return "RESET_MATCH";
      elsif (AUTORESET_PATTERN_DETECT_OPTINV = "NOT_MATCH") then return "RESET_NOT_MATCH";
      else return ("TRUE_" & AUTORESET_PATTERN_DETECT_OPTINV);
      end if;
     end if;
    end patdet_val;

    function sel_mask_val (SEL_MASK: string; SEL_ROUNDING_MASK: string)
    return string is
    begin
      if (SEL_ROUNDING_MASK = "SEL_MASK") then 
        return SEL_MASK;
      elsif (SEL_ROUNDING_MASK ="MODE1") then
        return "ROUNDING_MODE1";
      elsif (SEL_ROUNDING_MASK ="MODE2") then
        return "ROUNDING_MODE2";
      else
        return SEL_ROUNDING_MASK;
      end if;
    end sel_mask_val;

begin
     D1 : DSP48E1
     generic map (
	ACASCREG => ACASCREG,
	ADREG => 0,
	ALUMODEREG => ALUMODEREG,
	AREG => AREG,
	AUTORESET_PATDET => patdet_val(AUTORESET_PATTERN_DETECT,AUTORESET_PATTERN_DETECT_OPTINV),
	A_INPUT => A_INPUT,
	BCASCREG => BCASCREG,
	BREG => BREG,
	B_INPUT => B_INPUT,
	CARRYINREG => CARRYINREG,
	CARRYINSELREG => CARRYINSELREG,
	CREG => CREG,
	DREG => 0,
	INMODEREG => 0,
	MASK => MASK,
	MREG => MREG,
	OPMODEREG => OPMODEREG,
	PATTERN => PATTERN,
	PREG => PREG,
	SEL_MASK => sel_mask_val(SEL_MASK, SEL_ROUNDING_MASK),
	SEL_PATTERN => SEL_PATTERN,
	USE_MULT => use_mult_val(USE_MULT),
	USE_PATTERN_DETECT => USE_PATTERN_DETECT,
	USE_SIMD => USE_SIMD
     )
      port map (   	
        ACOUT => ACOUT, 
        BCOUT => BCOUT,
        CARRYCASCOUT => CARRYCASCOUT,
        CARRYOUT => CARRYOUT,
        MULTSIGNOUT => MULTSIGNOUT,
        OVERFLOW => OVERFLOW,
        P => P,
        PATTERNBDETECT => PATTERNBDETECT,
        PATTERNDETECT => PATTERNDETECT,
        PCOUT => PCOUT, 
        UNDERFLOW => UNDERFLOW,
        A => A, 
        ACIN => ACIN, 
        ALUMODE => ALUMODE,
        B => B,
        BCIN => BCIN,
        C => C,
        CLK => CLK,
        CARRYCASCIN => CARRYCASCIN,
        CARRYIN => CARRYIN,
        CARRYINSEL => CARRYINSEL,
        CEA1 => CEA1,
        CEA2 => CEA2,
        CEAD => '0',
        CEALUMODE => CEALUMODE,
        CEB1 => CEB1,
        CEB2 => CEB2,
        CEC => CEC,
        CECARRYIN => CECARRYIN,
        CECTRL => CECTRL,
        CED => '0',
        CEINMODE => '0',
        CEM => CEM,
        CEP => CEP, 
        D => B"0000000000000000000000000", 
        INMODE => B"00000",
        MULTSIGNIN => MULTSIGNIN,
        OPMODE => OPMODE,
        PCIN => PCIN,
        RSTA => RSTA,
        RSTALLCARRYIN => RSTALLCARRYIN,
        RSTALUMODE => RSTALUMODE,
        RSTB => RSTB,
        RSTC => RSTC,
        RSTCTRL => RSTCTRL,
        RSTD => '0',
        RSTINMODE => '0',
        RSTM => RSTM,
        RSTP => RSTP
  );
end DSP48E_V;
