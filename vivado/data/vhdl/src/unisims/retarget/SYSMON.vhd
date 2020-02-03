-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
-- /___/   /\     Filename : SYSMON.vhd
-- \   \  /  \    Timestamp : Thu Oct 14 02:19:19 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/14/10 - Initial version.
-- End Revision

----- CELL SYSMON -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity SYSMON is

generic (


                INIT_40 : bit_vector := X"0000";
                INIT_41 : bit_vector := X"0000";
                INIT_42 : bit_vector := X"0800";
                INIT_43 : bit_vector := X"0000";
                INIT_44 : bit_vector := X"0000";
                INIT_45 : bit_vector := X"0000";
                INIT_46 : bit_vector := X"0000";
                INIT_47 : bit_vector := X"0000";
                INIT_48 : bit_vector := X"0000";
                INIT_49 : bit_vector := X"0000";
                INIT_4A : bit_vector := X"0000";
                INIT_4B : bit_vector := X"0000";
                INIT_4C : bit_vector := X"0000";
                INIT_4D : bit_vector := X"0000";
                INIT_4E : bit_vector := X"0000";
                INIT_4F : bit_vector := X"0000";
                INIT_50 : bit_vector := X"0000";
                INIT_51 : bit_vector := X"0000";
                INIT_52 : bit_vector := X"0000";
                INIT_53 : bit_vector := X"0000";
                INIT_54 : bit_vector := X"0000";
                INIT_55 : bit_vector := X"0000";
                INIT_56 : bit_vector := X"0000";
                INIT_57 : bit_vector := X"0000";
                SIM_DEVICE : string := "VIRTEX5";
                SIM_MONITOR_FILE : string := "design.txt"
  );

port (
                ALM : out std_logic_vector(2 downto 0);
                BUSY : out std_ulogic;
                CHANNEL : out std_logic_vector(4 downto 0);
                DO : out std_logic_vector(15 downto 0);
                DRDY : out std_ulogic;
                EOC : out std_ulogic;
                EOS : out std_ulogic;
                JTAGBUSY : out std_ulogic;
                JTAGLOCKED : out std_ulogic;
                JTAGMODIFIED : out std_ulogic;
                OT : out std_ulogic;

                CONVST : in std_ulogic;
                CONVSTCLK : in std_ulogic;
                DADDR : in std_logic_vector(6 downto 0);
                DCLK : in std_ulogic;
                DEN : in std_ulogic;
                DI : in std_logic_vector(15 downto 0);
                DWE : in std_ulogic;
                RESET : in std_ulogic;
                VAUXN : in std_logic_vector(15 downto 0);
                VAUXP : in std_logic_vector(15 downto 0);
                VN : in std_ulogic;
                VP : in std_ulogic
     );
end SYSMON;


architecture SYSMON_V of SYSMON is
signal dummy_ALM : std_logic_vector(7 downto 0);
begin
     X1 : XADC
     generic map (
	INIT_40 => INIT_40,
	INIT_41 => INIT_41,
	INIT_42 => INIT_42,
	INIT_43 => INIT_43,
	INIT_44 => INIT_44,
	INIT_45 => INIT_45,
	INIT_46 => INIT_46,
	INIT_47 => INIT_47,
	INIT_48 => INIT_48,
	INIT_49 => INIT_49,
	INIT_4A => INIT_4A,
	INIT_4B => INIT_4B,
	INIT_4C => INIT_4C,
	INIT_4D => INIT_4D,
	INIT_4E => INIT_4E,
	INIT_4F => INIT_4F,
	INIT_50 => INIT_50,
	INIT_51 => INIT_51,
	INIT_52 => INIT_52,
	INIT_53 => INIT_53,
	INIT_54 => INIT_54,
	INIT_55 => INIT_55,
	INIT_56 => INIT_56,
	INIT_57 => INIT_57,
	SIM_MONITOR_FILE => SIM_MONITOR_FILE
     )
      port map (   	
        ALM => dummy_ALM, 
        BUSY => BUSY,
        CHANNEL => CHANNEL,
        DO => DO,
        DRDY => DRDY,
        EOC => EOC,
        EOS => EOS,
        JTAGBUSY => JTAGBUSY,
        JTAGLOCKED => JTAGLOCKED,
        JTAGMODIFIED => JTAGMODIFIED, 
        MUXADDR => open,
        OT => OT, 
        CONVST => CONVST,
        CONVSTCLK => CONVSTCLK,
        DADDR => DADDR,
        DCLK => DCLK,
        DEN => DEN,
        DI => DI,
        DWE => DWE,
        RESET => RESET,
        VAUXN => VAUXN,
        VAUXP => VAUXP,
        VN => VN,
        VP => VP
  );
        ALM <= dummy_ALM(2 downto 0);
end SYSMON_V;
