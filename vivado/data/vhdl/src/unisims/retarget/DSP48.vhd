-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  18X18 Signed Multiplier Followed by Three-Input Adder with Pipeline Registers
-- /___/   /\     Filename : DSP48.vhd
-- \   \  /  \    Timestamp : Mon Oct 18 12:40:15 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/18/10 - Initial version.
-- End Revision

----- CELL DSP48 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity DSP48 is

  generic(

        AREG            : integer       := 1;
        B_INPUT         : string        := "DIRECT";
        BREG            : integer       := 1;
        CARRYINREG      : integer       := 1;
        CARRYINSELREG   : integer       := 1;
        CREG            : integer       := 1;
        LEGACY_MODE     : string        := "MULT18X18S";
        MREG            : integer       := 1;
        OPMODEREG       : integer       := 1;
        PREG            : integer       := 1;
        SUBTRACTREG     : integer       := 1
        );

  port(
        BCOUT                   : out std_logic_vector(17 downto 0);
        P                       : out std_logic_vector(47 downto 0);
        PCOUT                   : out std_logic_vector(47 downto 0);

        A                       : in  std_logic_vector(17 downto 0);
        B                       : in  std_logic_vector(17 downto 0);
        BCIN                    : in  std_logic_vector(17 downto 0);
        C                       : in  std_logic_vector(47 downto 0);
        CARRYIN                 : in  std_ulogic;
        CARRYINSEL              : in  std_logic_vector(1 downto 0);
        CEA                     : in  std_ulogic;
        CEB                     : in  std_ulogic;
        CEC                     : in  std_ulogic;
        CECARRYIN               : in  std_ulogic;
        CECINSUB                : in  std_ulogic;
        CECTRL                  : in  std_ulogic;
        CEM                     : in  std_ulogic;
        CEP                     : in  std_ulogic;
        CLK                     : in  std_ulogic;
        OPMODE                  : in  std_logic_vector(6 downto 0);
        PCIN                    : in  std_logic_vector(47 downto 0);
        RSTA                    : in  std_ulogic;
        RSTB                    : in  std_ulogic;
        RSTC                    : in  std_ulogic;
        RSTCARRYIN              : in  std_ulogic;
        RSTCTRL                 : in  std_ulogic;
        RSTM                    : in  std_ulogic;
        RSTP                    : in  std_ulogic;
        SUBTRACT                : in  std_ulogic
      );
end DSP48;


architecture DSP48_V of DSP48 is
signal A_Bus_sig : std_logic_vector(29 downto 0);
signal CARRYINSEL_sig : std_logic_vector(2 downto 0);
    function use_mult_val (LEGACY_MODE: string)
    return string is
    begin
      if ((LEGACY_MODE ="MULT18X18S") or (LEGACY_MODE ="MULT18X18")) then
        return "MULTIPLY";
      else
        return "NONE";
      end if;
    end use_mult_val;

    function subtract_val (SUBTRACT: std_ulogic)
    return std_logic_vector is
    begin
      if ((SUBTRACT = '0')) then
      return X"0";
      else
      return X"3";
     end if;
    end subtract_val;
begin
     A_Bus_sig <= A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17 downto 0);
     CARRYINSEL_sig <= '0' & CARRYINSEL;
     D1 : DSP48E1
     generic map (
	ACASCREG => AREG,
	ADREG => 0,
	ALUMODEREG => SUBTRACTREG,
	AREG => AREG,
	BCASCREG => BREG,
	BREG => BREG,
	B_INPUT => B_INPUT,
	CARRYINREG => CARRYINREG,
	CARRYINSELREG => CARRYINSELREG,
	CREG => CREG,
	DREG => 0,
	INMODEREG => 0,
	MREG => MREG,
	OPMODEREG => OPMODEREG,
	PREG => PREG,
        USE_MULT => use_mult_val(LEGACY_MODE)
     )
      port map (   	
        ACOUT => open, 
        BCOUT => BCOUT,
        CARRYCASCOUT => open,
        CARRYOUT => open,
        MULTSIGNOUT => open,
        OVERFLOW => open,
        P => P,
        PATTERNBDETECT => open,
        PATTERNDETECT => open,
        PCOUT => PCOUT, 
        UNDERFLOW => open,
        A => A_Bus_sig, 
        ACIN => B"000000000000000000000000000000",
        ALUMODE => subtract_val(SUBTRACT),
        B => B,
        BCIN => BCIN,
        C => C,
        CLK => CLK,
        CARRYCASCIN => '0',
        CARRYIN => CARRYIN,
        CARRYINSEL => CARRYINSEL_sig,
        CEA1 => CEA,
        CEA2 => CEA,
        CEAD => '0',
        CEALUMODE => CECINSUB,
        CEB1 => CEB,
        CEB2 => CEB,
        CEC => CEC,
        CECARRYIN => CECINSUB,
        CECTRL => CECTRL,
        CED => '0',
        CEINMODE => '0',
        CEM => CEM,
        CEP => CEP, 
        D => B"0000000000000000000000000", 
        INMODE => B"00000",
        MULTSIGNIN => '0',
        OPMODE => OPMODE,
        PCIN => PCIN,
        RSTA => RSTA,
        RSTALLCARRYIN => RSTCARRYIN,
        RSTALUMODE => RSTCTRL,
        RSTB => RSTB,
        RSTC => RSTC,
        RSTCTRL => RSTCTRL,
        RSTD => '0',
        RSTINMODE => '0',
        RSTM => RSTM,
        RSTP => RSTP
  );
end DSP48_V;
