-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    18K-Bit FIFO
-- /___/   /\     Filename : FIFO18.vhd
-- \   \  /  \    Timestamp : Tue Oct 19 03:06:23 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/19/10 - Initial version.
-- End Revision

----- CELL FIFO18 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity FIFO18 is

generic (

    ALMOST_FULL_OFFSET      : bit_vector := X"080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"080"; 
    DATA_WIDTH              : integer    := 4;
    DO_REG                  : integer    := 1;
    EN_SYN                  : boolean    := FALSE;
    FIRST_WORD_FALL_THROUGH : boolean    := FALSE;
    SIM_MODE                : string     := "SAFE"
    
  );

port (

    ALMOSTEMPTY : out std_ulogic;
    ALMOSTFULL  : out std_ulogic;
    DO          : out std_logic_vector (15 downto 0);
    DOP         : out std_logic_vector (1 downto 0);
    EMPTY       : out std_ulogic;
    FULL        : out std_ulogic;
    RDCOUNT     : out std_logic_vector (11 downto 0);
    RDERR       : out std_ulogic;
    WRCOUNT     : out std_logic_vector (11 downto 0);
    WRERR       : out std_ulogic;

    DI          : in  std_logic_vector (15 downto 0);
    DIP         : in  std_logic_vector (1 downto 0);
    RDCLK       : in  std_ulogic;
    RDEN        : in  std_ulogic;
    RST         : in  std_ulogic;
    WRCLK       : in  std_ulogic;
    WREN        : in  std_ulogic    
  );
end FIFO18;


architecture FIFO18_V of FIFO18 is
signal DO_BUS : std_logic_vector(31 downto 0);
signal DOP_BUS : std_logic_vector(3 downto 0);
signal DI_BUS : std_logic_vector(31 downto 0);
signal DIP_BUS : std_logic_vector(3 downto 0);
begin
     
     DI_BUS <= X"0000" & DI;
     DIP_BUS <= "00" & DIP;
     F8 : FIFO18E1
     generic map (
	ALMOST_EMPTY_OFFSET => ALMOST_EMPTY_OFFSET,
	ALMOST_FULL_OFFSET => ALMOST_FULL_OFFSET,
	DATA_WIDTH => DATA_WIDTH,
	DO_REG => DO_REG,
	FIFO_MODE => "FIFO18",
	EN_SYN => EN_SYN,
	FIRST_WORD_FALL_THROUGH => FIRST_WORD_FALL_THROUGH
     )
      port map (   	
        ALMOSTEMPTY => ALMOSTEMPTY, 
        ALMOSTFULL => ALMOSTFULL,
        DO => DO_BUS, 
        DOP => DOP_BUS,
        EMPTY => EMPTY,
        FULL => FULL,
        RDCOUNT => RDCOUNT,
        RDERR => RDERR,
        WRCOUNT => WRCOUNT,
        WRERR => WRERR,
        DI => DI_BUS,
        DIp => DIP_BUS,
        RDCLK => RDCLK, 
        RDEN => RDEN,
        REGCE => '1',
        RST => RST,
        RSTREG => '0',
        WRCLK => WRCLK,
        WREN => WREN
  );
        DO <= DO_BUS(15 downto 0);
        DOP <= DOP_BUS(1 downto 0);
end FIFO18_V;
