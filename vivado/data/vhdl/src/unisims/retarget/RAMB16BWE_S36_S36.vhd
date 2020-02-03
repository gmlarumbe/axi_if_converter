-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    16K-Bit Data and 2K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : RAMB16BWE_S36_S36.vhd
-- \   \  /  \    Timestamp : Thu Oct 28 3:15:58 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/28/10 - Initial version.
--    03/16/12 - Fixed INIT and SRVAL std to and downto problem (CR 651817).
--    10/08/14 - Added SIM_COLLISION_CHECK generic (CR 816426).
-- End Revision

----- CELL RAMB16BWE_S36_S36 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;



library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity RAMB16BWE_S36_S36 is
generic (

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
    INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

    INIT_A : bit_vector := X"000000000";
    INIT_B : bit_vector := X"000000000";

    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

    SIM_COLLISION_CHECK : string := "ALL";

    SRVAL_A  : bit_vector := X"000000000";
    SRVAL_B  : bit_vector := X"000000000";

    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST"
  );

port (
		DOA : out std_logic_vector(31 downto 0);
		DOB : out std_logic_vector(31 downto 0);
		DOPA : out std_logic_vector(3 downto 0);
		DOPB : out std_logic_vector(3 downto 0);

		ADDRA : in std_logic_vector(8 downto 0);
		ADDRB : in std_logic_vector(8 downto 0);
		CLKA : in std_ulogic;
		CLKB : in std_ulogic;
		DIA : in std_logic_vector(31 downto 0);
		DIB : in std_logic_vector(31 downto 0);
		DIPA : in std_logic_vector(3 downto 0);
		DIPB : in std_logic_vector(3 downto 0);
		ENA : in std_ulogic;
		ENB : in std_ulogic;
		SSRA : in std_ulogic;
		SSRB : in std_ulogic;
		WEA : in std_logic_vector(3 downto 0);
		WEB : in std_logic_vector(3 downto 0)
     );
end RAMB16BWE_S36_S36;


architecture RAMB16BWE_S36_S36_V of RAMB16BWE_S36_S36 is
signal WEA_BUS : std_logic_vector(3 downto 0);
signal WEB_BUS : std_logic_vector(7 downto 0);
signal ADDRA_BUS : std_logic_vector(15 downto 0);
signal ADDRB_BUS : std_logic_vector(15 downto 0);
begin
     WEA_BUS <= WEA ;
     WEB_BUS <= "0000" & WEB ;
     ADDRA_BUS <= "00" & ADDRA(8 downto 0) & "0" & "0" & "0" & "0" & "0";
     ADDRB_BUS <= "00" & ADDRB(8 downto 0) & "0" & "0" & "0" & "0" & "0";
     R1 : RAMB36E1
     generic map (
	INIT_A => INIT_A(0 to 35),
	INIT_B => INIT_B(0 to 35),
	SRVAL_A => SRVAL_A(0 to 35),
	SRVAL_B => SRVAL_B(0 to 35),
	WRITE_MODE_A => WRITE_MODE_A,
	WRITE_MODE_B => WRITE_MODE_B,
	READ_WIDTH_A => 36,
	READ_WIDTH_B => 36,
	WRITE_WIDTH_A => 36,
	WRITE_WIDTH_B => 36,
        SIM_COLLISION_CHECK => SIM_COLLISION_CHECK,
	SIM_DEVICE => "VIRTEX6",
        RSTREG_PRIORITY_A => "REGCE",
        RSTREG_PRIORITY_B => "REGCE",
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
	INIT_20 => INIT_20, 
	INIT_21 => INIT_21, 
	INIT_22 => INIT_22, 
	INIT_23 => INIT_23, 
	INIT_24 => INIT_24, 
	INIT_25 => INIT_25, 
	INIT_26 => INIT_26, 
	INIT_27 => INIT_27, 
	INIT_28 => INIT_28, 
	INIT_29 => INIT_29, 
	INIT_2A => INIT_2A, 
	INIT_2B => INIT_2B, 
	INIT_2C => INIT_2C, 
	INIT_2D => INIT_2D, 
	INIT_2E => INIT_2E, 
	INIT_2F => INIT_2F, 
	INIT_30 => INIT_30, 
	INIT_31 => INIT_31, 
	INIT_32 => INIT_32, 
	INIT_33 => INIT_33, 
	INIT_34 => INIT_34, 
	INIT_35 => INIT_35, 
	INIT_36 => INIT_36, 
	INIT_37 => INIT_37, 
	INIT_38 => INIT_38,
	INIT_39 => INIT_39, 
	INIT_3A => INIT_3A, 
	INIT_3B => INIT_3B, 
	INIT_3C => INIT_3C, 
	INIT_3D => INIT_3D, 
	INIT_3E => INIT_3E, 
	INIT_3F => INIT_3F, 
	INITP_00 => INITP_00, 
	INITP_01 => INITP_01, 
	INITP_02 => INITP_02, 
	INITP_03 => INITP_03,
	INITP_04 => INITP_04, 
	INITP_05 => INITP_05, 
	INITP_06 => INITP_06, 
	INITP_07 => INITP_07 
   )  
      port map (   	
	CASCADEOUTA => open, 
	CASCADEOUTB => open,
	DBITERR => open, 
	SBITERR => open,
	DOADO => DOA, 
	DOBDO => DOB, 
	DOPADOP => DOPA, 
	DOPBDOP => DOPB, 
	ECCPARITY => open, 
	RDADDRECC => open,
	ADDRARDADDR => ADDRA_BUS, 
	ADDRBWRADDR => ADDRB_BUS, 
	CASCADEINA => '0', 
	CASCADEINB => '0', 
	CLKARDCLK => CLKA, 
	CLKBWRCLK => CLKB, 
	DIADI => DIA, 
	DIBDI => DIB, 
	DIPADIP => DIPA, 
	DIPBDIP => DIPB, 
	ENARDEN => ENA, 
	ENBWREN => ENB, 
	INJECTDBITERR => '0', 
	INJECTSBITERR => '0',
	REGCEAREGCE => '0', 
	REGCEB => '0',  
	RSTRAMARSTRAM => SSRA, 
	RSTRAMB => SSRB, 
	RSTREGARSTREG => SSRA,
        RSTREGB => SSRB,
        WEA => WEA_BUS,
        WEBWE => WEB_BUS
  );
end RAMB16BWE_S36_S36_V;
