-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  18X18 Signed Multiplier 
-- /___/   /\     Filename : MULT18X18SIO.vhd
-- \   \  /  \    Timestamp : Thu Aug 11 08:26:19 PST 2010
--  \___\/\___\
--
-- Revision:
--    08/26/10 - Initial version.
-- End Revision

----- CELL MULT18X18SIO -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity MULT18X18SIO is

  generic (

	AREG            : integer       := 1;
	BREG            : integer       := 1;
	B_INPUT         : string        := "DIRECT";

	PREG            : integer       := 1
        );

  port (
	BCOUT	: out std_logic_vector (17 downto 0);
	P	: out std_logic_vector (35 downto 0);

	A	: in  std_logic_vector (17 downto 0);
	B	: in  std_logic_vector (17 downto 0);
	BCIN	: in  std_logic_vector (17 downto 0);
	CEA	: in  std_ulogic;
	CEB	: in  std_ulogic;
	CEP	: in  std_ulogic;
	CLK	: in  std_ulogic;
	RSTA	: in  std_ulogic;
	RSTB	: in  std_ulogic;
	RSTP	: in  std_ulogic
	);

end MULT18X18SIO;


architecture MULT18X18SIO_V of MULT18X18SIO is
signal A_Bus_sig : std_logic_vector(29 downto 0);
signal P_Bus_sig : std_logic_vector(47 downto 0);
begin
P <=  P_Bus_sig(35 downto 0);
A_Bus_sig <= A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17 downto 0);
     D1 : DSP48E1
     generic map (
	ACASCREG => 1,
	ADREG    => 0,
	ALUMODEREG => 0,
	AREG => AREG,
	BCASCREG => 1,
	BREG => BREG,
	CARRYINSELREG => 0,
	CARRYINREG => 0,
	CREG => 0,
	DREG => 0,
	MREG => 0,
	OPMODEREG => 0,
	PREG => PREG,
	B_INPUT => B_INPUT,
	INMODEREG => 0
     )
      port map (   	
        ACOUT => open, 
        BCOUT => BCOUT,
        CARRYCASCOUT => open,
        CARRYOUT => open,
        MULTSIGNOUT => open,
        OVERFLOW => open,
        P => P_Bus_sig,
        PATTERNBDETECT => open,
        PATTERNDETECT => open,
        PCOUT => open, 
        UNDERFLOW => open,
        A => A_Bus_sig, 
        ACIN => B"000000000000000000000000000000",
        ALUMODE => X"0",
        B => B(17 downto 0),
        BCIN => BCIN,
        C => X"000000000000",
        CLK => '0',
        CARRYCASCIN => '0',
        CARRYIN => '0',
        CARRYINSEL => B"000",
        CEA1 => CEA,
        CEA2 => CEA,
        CEAD => '0',
        CEALUMODE => '0',
        CEB1 => CEB,
        CEB2 => CEB,
        CEC => '0',
        CECARRYIN => '0',
        CECTRL => '0',
        CED => '0',
        CEINMODE => '0',
        CEM => '0', 
        CEP => CEP, 
        D => B"0000000000000000000000000", 
        INMODE => B"00000",
        MULTSIGNIN => '0',
        PCIN => X"000000000000",
        RSTA => RSTA,
        RSTALLCARRYIN => '0',
        RSTALUMODE => '0',
        RSTB => RSTB,
        RSTC => '0',
        RSTCTRL => '0',
        RSTD => '0',
        RSTINMODE => '0',
        RSTM => '0',
        OPMODE => B"0000101",
        RSTP => RSTP
  );
end MULT18X18SIO_V;
