-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    16K-Bit FIFO
-- /___/   /\     Filename : FIFO16.vhd
-- \   \  /  \    Timestamp : Thu Mar 24 05:36:50 PST 2010
--  \___\/\___\
--
-- Revision:
--    03/24/11 - Initial version.
-- End Revision

----- CELL FIFO16 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity FIFO16 is

 generic(

    ALMOST_FULL_OFFSET      : bit_vector := X"080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"080"; 
    DATA_WIDTH              : integer    := 36;
    FIRST_WORD_FALL_THROUGH : boolean    := false
    );

  port(
    ALMOSTEMPTY : out std_ulogic;
    ALMOSTFULL  : out std_ulogic;
    DO          : out std_logic_vector (31 downto 0);
    DOP         : out std_logic_vector (3 downto 0);
    EMPTY       : out std_ulogic;
    FULL        : out std_ulogic;
    RDCOUNT     : out std_logic_vector (11 downto 0);
    RDERR       : out std_ulogic;
    WRCOUNT     : out std_logic_vector (11 downto 0);
    WRERR       : out std_ulogic;

    DI          : in  std_logic_vector (31 downto 0);
    DIP         : in  std_logic_vector (3 downto 0);
    RDCLK       : in  std_ulogic;
    RDEN        : in  std_ulogic;
    RST         : in  std_ulogic;
    WRCLK       : in  std_ulogic;
    WREN        : in  std_ulogic
    );
end FIFO16;


architecture FIFO16_V of FIFO16 is
signal ALMOSTEMPTY_DW36, ALMOSTEMPTY_DW18, ALMOSTFULL_DW36, ALMOSTFULL_DW18, EMPTY_DW36, EMPTY_DW18, FULL_DW36, FULL_DW18, RDERR_DW36, RDERR_DW18, WRERR_DW36, WRERR_DW18 : std_ulogic;
begin
     
   F36: if (DATA_WIDTH = 36) generate
     F7 : FIFO18E1
     generic map (
	ALMOST_EMPTY_OFFSET => "0" & ALMOST_EMPTY_OFFSET,
	ALMOST_FULL_OFFSET => "0" & ALMOST_FULL_OFFSET,
	DATA_WIDTH => DATA_WIDTH,
	FIFO_MODE => "FIFO18_36",
	FIRST_WORD_FALL_THROUGH => FIRST_WORD_FALL_THROUGH
     )
      port map (   	
        ALMOSTEMPTY => ALMOSTEMPTY_DW36, 
        ALMOSTFULL => ALMOSTFULL_DW36,
        DO => DO, 
        DOP => DOP,
        EMPTY => EMPTY_DW36,
        FULL => FULL_DW36,
        RDCOUNT => RDCOUNT,
        RDERR => RDERR_DW36,
        WRCOUNT => WRCOUNT,
        WRERR => WRERR_DW36,
        DI => DI,
        DIp => DIP,
        RDCLK => RDCLK, 
        RDEN => RDEN,
        REGCE => '1',
        RST => RST,
        RSTREG => '0',
        WRCLK => WRCLK,
        WREN => WREN
  );
end generate;
   F18: if (DATA_WIDTH = 18) generate
     F8 : FIFO18E1
     generic map (
	ALMOST_EMPTY_OFFSET => "0" & ALMOST_EMPTY_OFFSET,
	ALMOST_FULL_OFFSET => "0" & ALMOST_FULL_OFFSET,
	DATA_WIDTH => DATA_WIDTH,
	FIFO_MODE => "FIFO18",
	FIRST_WORD_FALL_THROUGH => FIRST_WORD_FALL_THROUGH
     )
      port map (   	
        ALMOSTEMPTY => ALMOSTEMPTY_DW18, 
        ALMOSTFULL => ALMOSTFULL_DW18,
        DO => DO, 
        DOP => DOP,
        EMPTY => EMPTY_DW18,
        FULL => FULL_DW18,
        RDCOUNT => RDCOUNT,
        RDERR => RDERR_DW18,
        WRCOUNT => WRCOUNT,
        WRERR => WRERR_DW18,
        DI => DI,
        DIp => DIP,
        RDCLK => RDCLK, 
        RDEN => RDEN,
        REGCE => '1',
        RST => RST,
        RSTREG => '0',
        WRCLK => WRCLK,
        WREN => WREN
  );
end generate;
        ALMOSTEMPTY <= ALMOSTEMPTY_DW36 when (DATA_WIDTH = 36) else
                       ALMOSTEMPTY_DW18;
        ALMOSTFULL  <= ALMOSTFULL_DW36 when (DATA_WIDTH = 36) else
                       ALMOSTFULL_DW18;
        EMPTY <= EMPTY_DW36 when (DATA_WIDTH = 36) else
                       EMPTY_DW18;
        FULL  <= FULL_DW36 when (DATA_WIDTH = 36) else
                       FULL_DW18;
        RDERR <= RDERR_DW36 when (DATA_WIDTH = 36) else
                       RDERR_DW18;
        WRERR  <= WRERR_DW36 when (DATA_WIDTH = 36) else
                       WRERR_DW18;

end FIFO16_V;
