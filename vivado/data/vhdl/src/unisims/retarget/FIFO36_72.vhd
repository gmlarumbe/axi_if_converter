-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    36K-Bit FIFO
-- /___/   /\     Filename : FIFO36_72.vhd
-- \   \  /  \    Timestamp : Tue Oct 19 03:48:53 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/19/10 - Initial version.
-- End Revision

----- CELL FIFO36_72 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity FIFO36_72 is

generic (

    ALMOST_FULL_OFFSET      : bit_vector := X"080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"080"; 
    DO_REG                  : integer    := 1;
    EN_ECC_READ             : boolean    := FALSE;
    EN_ECC_WRITE            : boolean    := FALSE;  
    EN_SYN                  : boolean    := FALSE;
    FIRST_WORD_FALL_THROUGH : boolean    := FALSE;
    SIM_MODE                : string     := "SAFE"
    
  );

port (

    ALMOSTEMPTY : out std_ulogic;
    ALMOSTFULL  : out std_ulogic;
    DBITERR     : out std_ulogic;
    DO          : out std_logic_vector (63 downto 0);
    DOP         : out std_logic_vector (7 downto 0);
    ECCPARITY   : out std_logic_vector (7 downto 0);
    EMPTY       : out std_ulogic;
    FULL        : out std_ulogic;
    RDCOUNT     : out std_logic_vector (8 downto 0);
    RDERR       : out std_ulogic;
    SBITERR     : out std_ulogic;
    WRCOUNT     : out std_logic_vector (8 downto 0);
    WRERR       : out std_ulogic;

    DI          : in  std_logic_vector (63 downto 0);
    DIP         : in  std_logic_vector (7 downto 0);
    RDCLK       : in  std_ulogic;
    RDEN        : in  std_ulogic;
    RST         : in  std_ulogic;
    WRCLK       : in  std_ulogic;
    WREN        : in  std_ulogic    
  );
end FIFO36_72;


architecture FIFO36_72_V of FIFO36_72 is
signal rdcount_bus : std_logic_vector(12 downto 0);
signal wrcount_bus : std_logic_vector(12 downto 0);
begin
     
     F9 : FIFO36E1
     generic map (
	ALMOST_EMPTY_OFFSET => ALMOST_EMPTY_OFFSET,
	ALMOST_FULL_OFFSET => ALMOST_FULL_OFFSET,
	DATA_WIDTH => 72,
	DO_REG => DO_REG,
	FIFO_MODE => "FIFO36_72",
	EN_SYN => EN_SYN,
	FIRST_WORD_FALL_THROUGH => FIRST_WORD_FALL_THROUGH
     )
      port map (   	
        ALMOSTEMPTY => ALMOSTEMPTY, 
        ALMOSTFULL => ALMOSTFULL,
        DBITERR => DBITERR,
        DO => DO, 
        DOP => DOP,
        ECCPARITY => ECCPARITY,
        EMPTY => EMPTY,
        FULL => FULL,
        RDCOUNT => rdcount_bus,
        RDERR => RDERR,
        WRCOUNT => wrcount_bus,
        WRERR => WRERR,
        DI => DI,
        DIp => DIP,
        INJECTDBITERR => '0', 
        INJECTSBITERR => '0',
        RDCLK => RDCLK, 
        RDEN => RDEN,
        REGCE => '1',
        RST => RST,
        RSTREG => '0',
        WRCLK => WRCLK,
        WREN => WREN
  );
        RDCOUNT <= rdcount_bus(8 downto 0);
        WRCOUNT <= wrcount_bus(8 downto 0);
end FIFO36_72_V;
