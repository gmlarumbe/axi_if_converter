-----------------------------------------------------------------------------
--  Copyright (c) 2013 Xilinx Inc.
--  All Right Reserved.
-----------------------------------------------------------------------------
--
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2012.2 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      
-- /___/   /\      Filename    : OBUFDS_GTE3_ADV.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-----------------------------------------------------------------------------
--  Revision:
--
--  End Revision:
-----------------------------------------------------------------------------

----- CELL OBUFDS_GTE3_ADV -----
library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_arith.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity OBUFDS_GTE3_ADV is
  generic (
    REFCLK_EN_TX_PATH : bit := '0';
    REFCLK_ICNTL_TX : std_logic_vector(4 downto 0) := "00000"
  );

  port (
    O                    : out std_ulogic;
    OB                   : out std_ulogic;
    CEB                  : in std_ulogic;
    I                    : in std_logic_vector(3 downto 0);
    RXRECCLK_SEL         : in std_logic_vector(1 downto 0)    
  );
end OBUFDS_GTE3_ADV;

architecture OBUFDS_GTE3_ADV_V of OBUFDS_GTE3_ADV is
  
  constant MODULE_NAME : string := "OBUFDS_GTE3_ADV";
  constant IN_DELAY : time := 0 ps;
  
-- Parameter encodings and registers

  signal glblGSR      : std_ulogic;
  
  signal I_delay : std_ulogic;
  signal I_in : std_logic_vector(3 downto 0);
  signal RXRECCLK_SEL_in : std_logic_vector(1 downto 0);
  
  begin
  glblGSR     <= TO_X01(GSR);

   I_in <= I after IN_DELAY;
   RXRECCLK_SEL_in <= RXRECCLK_SEL after IN_DELAY;

  clksel: process (RXRECCLK_SEL_in, I_in)
  begin  -- process clksel
      if( RXRECCLK_SEL_in = "00")  then
        I_delay <= I_in(0);
      elsif( RXRECCLK_SEL_in = "01")  then
        I_delay <= I_in(1);
      elsif( RXRECCLK_SEL_in = "10")  then
        I_delay <= I_in(2);
      elsif( RXRECCLK_SEL_in = "11")  then
       I_delay <= I_in(3);
      else
       I_delay <= I_in(0);
      end if;
end process clksel;
      
     process (I_delay, CEB)
         begin

          if ((CEB = '1') or (CEB = 'H')) then
              O <= 'Z';
          elsif ((CEB = '0') or (CEB = 'L')) then
          if ((I_delay = '1') or (I_delay = 'H')) then
              O <= '1';
          elsif ((I_delay = '0') or (I_delay = 'L')) then
              O <= '0';
          elsif (I_delay = 'U') then
              O <= 'U';
          else
              O <= 'X';  
          end if;
          elsif (CEB = 'U') then
              O <= 'U';          
          else                                      
              O <= 'X';  
          end if;

          if ((CEB = '1') or (CEB = 'H')) then
              OB <= 'Z';
          elsif ((CEB = '0') or (CEB = 'L')) then
          if (((not I_delay) = '1') or ((not I_delay) = 'H')) then
             OB <= '1';
          elsif (((not I_delay) = '0') or ((not I_delay) = 'L')) then
             OB <= '0';
          elsif ((not I_delay) = 'U') then
             OB <= 'U';
          else
             OB <= 'X';  
          end if;
          elsif (CEB = 'U') then
             OB <= 'U';          
          else                                      
             OB <= 'X';  
         end if;        
    end process;
             
end OBUFDS_GTE3_ADV_V;
