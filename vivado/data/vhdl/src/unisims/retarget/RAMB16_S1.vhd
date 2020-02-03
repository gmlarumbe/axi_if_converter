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
-- /___/   /\     Filename : RAMB16_S1.vhd
-- \   \  /  \    Timestamp : Tue Oct 26 03:12:43 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/26/10 - Initial version.
--    03/16/12 - Fixed INIT and SRVAL std to and downto problem (CR 651817).
--    03/10/14 - Fixed INIT and SRVAL range problem (CR 777788).
-- End Revision

----- CELL RAMB16_S1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity RAMB16_S1 is

  generic (
    INIT : bit_vector := X"0";
    SRVAL : bit_vector := X"0";
    WRITE_MODE : string := "WRITE_FIRST";    

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
    INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );

  port (
    DO : out STD_LOGIC_VECTOR (0 downto 0);

    ADDR : in STD_LOGIC_VECTOR (13 downto 0);
    CLK : in STD_ULOGIC;
    DI : in STD_LOGIC_VECTOR (0 downto 0);
    EN : in STD_ULOGIC;
    SSR : in STD_ULOGIC;
    WE : in STD_ULOGIC
    );
end RAMB16_S1;


architecture RAMB16_S1_V of RAMB16_S1 is
signal DO_BUS : std_logic_vector(15 downto 0);
signal DI_BUS : std_logic_vector(15 downto 0);
signal WEA_BUS : std_logic_vector(1 downto 0);
begin
     WEA_BUS <= "0" & WE;
     DI_BUS <= "000000000000000" & DI(0);
     R1 : RAMB18E1
     generic map (
	INIT_A => INIT,
	SRVAL_A => SRVAL,
	WRITE_MODE_A => WRITE_MODE,
	READ_WIDTH_A => 1,
	WRITE_WIDTH_A => 1,
	SIM_DEVICE => "VIRTEX6",
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
	INIT_3F => INIT_3F 
   )  
      port map (   	
	DOADO => DO_BUS, 
	DOBDO => open, 
	DOPADOP => open, 
	DOPBDOP => open, 
	ADDRARDADDR => ADDR, 
	ADDRBWRADDR => "00000000000000", 
	CLKARDCLK => CLK, 
	CLKBWRCLK => '0', 
	DIADI => DI_BUS, 
	DIBDI => X"0000", 
	DIPADIP => "00", 
	DIPBDIP => "00", 
	ENARDEN => EN, 
	ENBWREN => '0', 
	REGCEAREGCE => '0', 
	REGCEB => '0',  
	RSTRAMARSTRAM => SSR, 
	RSTRAMB => SSR, 
	RSTREGARSTREG => SSR,
        RSTREGB => SSR,
        WEA => WEA_BUS,
        WEBWE => "0000"
  );
        DO <= DO_BUS(0 downto 0);
end RAMB16_S1_V;
