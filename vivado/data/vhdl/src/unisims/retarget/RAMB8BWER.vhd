-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    8K-Bit Data and 1K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : RAMB8BWER.vhd
-- \   \  /  \    Timestamp : Mon Oct 25 03:58:41 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/22/10 - Initial version.
--    08/23/11 - Fixed RST_PRIORITY (CR 622388).
-- End Revision

----- CELL RAMB8BWER -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity RAMB8BWER is

  generic (
    
    DATA_WIDTH_A : integer := 0;
    DATA_WIDTH_B : integer := 0;
    DOA_REG : integer := 0;
    DOB_REG : integer := 0;
    EN_RSTRAM_A : boolean := TRUE;
    EN_RSTRAM_B : boolean := TRUE;
    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_A : bit_vector := X"00000";
    INIT_B : bit_vector := X"00000";
    INIT_FILE : string := "NONE";
    RAM_MODE : string := "TDP";
    RSTTYPE  : string := "SYNC";
    RST_PRIORITY_A : string := "CE";
    RST_PRIORITY_B : string := "CE";
    SETUP_ALL : time := 1000 ps;
    SETUP_READ_FIRST : time := 3000 ps;
    SIM_COLLISION_CHECK : string := "ALL";
    SRVAL_A : bit_vector := X"00000";
    SRVAL_B : bit_vector := X"00000";
    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST"
    );

  port (

    DOADO : out std_logic_vector(15 downto 0);
    DOBDO : out std_logic_vector(15 downto 0);
    DOPADOP : out std_logic_vector(1 downto 0);
    DOPBDOP : out std_logic_vector(1 downto 0);

    ADDRAWRADDR : in std_logic_vector(12 downto 0);
    ADDRBRDADDR : in std_logic_vector(12 downto 0);
    CLKAWRCLK : in std_ulogic;
    CLKBRDCLK : in std_ulogic;
    DIADI : in std_logic_vector(15 downto 0);
    DIBDI : in std_logic_vector(15 downto 0);
    DIPADIP : in std_logic_vector(1 downto 0);
    DIPBDIP : in std_logic_vector(1 downto 0);
    ENAWREN : in std_ulogic;
    ENBRDEN : in std_ulogic;
    REGCEA : in std_ulogic;
    REGCEBREGCE : in std_ulogic;
    RSTA : in std_ulogic;
    RSTBRST : in std_ulogic;
    WEAWEL : in std_logic_vector(1 downto 0);
    WEBWEU : in std_logic_vector(1 downto 0)

    );
end RAMB8BWER;


architecture RAMB8BWER_V of RAMB8BWER is

signal WEB_BUS : std_logic_vector(3 downto 0);
signal ADDRA_BUS : std_logic_vector(13 downto 0);
signal ADDRB_BUS : std_logic_vector(13 downto 0);
signal rstrama_val, rstramb_val : std_ulogic;


function func_convert_rstreg_priority (
  in_value : string)
  return string is

begin

  if (in_value = "SR") then
    return "RSTREG";
  elsif (in_value = "CE") then
    return "REGCE";
  end if;

end func_convert_rstreg_priority;
  

begin


  prcs_init: process (CLKAWRCLK, CLKBRDCLK)
    variable FIRST_TIME : boolean := true;

  begin

     if (FIRST_TIME) then
      
      if (not(RST_PRIORITY_A = "SR" or RST_PRIORITY_A = "CE")) then

        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error : ",
            GenericName          => " RST_PRIORITY_A ",
            EntityName           => "RAMB8BWER",
            GenericValue         => RST_PRIORITY_A,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " CE or SR ",
            TailMsg              => "",
            MsgSeverity          => failure
            );
      end if;


      if (not(RST_PRIORITY_B = "SR" or RST_PRIORITY_B = "CE")) then

        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error : ",
            GenericName          => " RST_PRIORITY_B ",
            EntityName           => "RAMB8BWER",
            GenericValue         => RST_PRIORITY_B,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " CE or SR ",
            TailMsg              => "",
            MsgSeverity          => failure
            );
      end if;

      FIRST_TIME := false;

     end if;
     
  end process prcs_init;
    
  
     WEB_BUS    <= WEAWEL & WEAWEL;
     ADDRB_BUS  <= "0" & ADDRBRDADDR(12 downto 0);
     ADDRA_BUS  <= "0" & ADDRAWRADDR(12 downto 0);
     R1 : RAMB18E1
     generic map (
	DOA_REG => DOB_REG,
	DOB_REG => DOA_REG,
	INIT_A => INIT_B,
	INIT_B => INIT_A,
	SRVAL_A => SRVAL_B,
	SRVAL_B => SRVAL_A,
	WRITE_MODE_A => WRITE_MODE_B,
	WRITE_MODE_B => WRITE_MODE_A,
	INIT_FILE => INIT_FILE,
	READ_WIDTH_A => DATA_WIDTH_B,
	READ_WIDTH_B => DATA_WIDTH_A,
	WRITE_WIDTH_A => DATA_WIDTH_B,
	WRITE_WIDTH_B => DATA_WIDTH_A,
	RAM_MODE => RAM_MODE,
	SIM_COLLISION_CHECK => SIM_COLLISION_CHECK,
	RSTREG_PRIORITY_A => func_convert_rstreg_priority(RST_PRIORITY_A),
	RSTREG_PRIORITY_B => func_convert_rstreg_priority(RST_PRIORITY_B),
        INIT_00 => INIT_00, 
	INIT_01 => INIT_01, 
	INIT_02 => INIT_02, 
	INIT_03 => INIT_03, 
	INIT_04 => INIT_04, 
	INIT_05 => INIT_05, 
	INIT_06 => INIT_06, 
	INIT_07 => INIT_07, 
	INIT_08 => INIT_08, 
	INIT_09 => INIT_09, 
	INIT_0A => INIT_0A, 
	INIT_0B => INIT_0B, 
	INIT_0C => INIT_0C, 
	INIT_0D => INIT_0D, 
	INIT_0E => INIT_0E, 
	INIT_0F => INIT_0F, 
	INIT_10 => INIT_10, 
	INIT_11 => INIT_11, 
	INIT_12 => INIT_12, 
	INIT_13 => INIT_13, 
	INIT_14 => INIT_14, 
	INIT_15 => INIT_15, 
	INIT_16 => INIT_16, 
	INIT_17 => INIT_17, 
	INIT_18 => INIT_18, 
	INIT_19 => INIT_19, 
	INIT_1A => INIT_1A, 
	INIT_1B => INIT_1B, 
	INIT_1C => INIT_1C, 
	INIT_1D => INIT_1D, 
	INIT_1E => INIT_1E, 
	INIT_1F => INIT_1F,
	INITP_00 => INITP_00, 
	INITP_01 => INITP_01, 
	INITP_02 => INITP_02, 
	INITP_03 => INITP_03 
 
   )  
      port map (   	
	DOADO => DOBDO, 
	DOBDO => DOADO, 
	DOPADOP => DOPBDOP, 
	DOPBDOP => DOPADOP, 
	ADDRARDADDR => ADDRB_BUS, 
	ADDRBWRADDR => ADDRA_BUS, 
	CLKARDCLK => CLKBRDCLK, 
	CLKBWRCLK => CLKAWRCLK, 
	DIADI => DIBDI, 
	DIBDI => DIADI, 
	DIPADIP => DIPBDIP, 
	DIPBDIP => DIPADIP, 
	ENARDEN => ENBRDEN, 
	ENBWREN => ENAWREN, 
	REGCEAREGCE => REGCEA, 
	REGCEB => REGCEBREGCE, 
	RSTRAMARSTRAM => RSTBRST, 
	RSTRAMB => RSTA, 
	RSTREGARSTREG => RSTBRST,
        RSTREGB => RSTA,
        WEA => WEBWEU,
        WEBWE => WEB_BUS
  );
end RAMB8BWER_V;
