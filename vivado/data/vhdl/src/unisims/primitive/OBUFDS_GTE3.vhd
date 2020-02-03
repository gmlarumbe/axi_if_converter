-------------------------------------------------------
--  Copyright (c) 2013 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2012.2 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      
-- /___/   /\      Filename    : OBUFDS_GTE3.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-------------------------------------------------------
--  Revision:
--  12/12/2012 - Initial version
--  03/19/2013 - Model added
--  04/08/2013 - Behavior added
--  End Revision:
-------------------------------------------------------

----- CELL OBUFDS_GTE3 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_arith.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;


  entity OBUFDS_GTE3 is
       generic (
      REFCLK_EN_TX_PATH : bit := '0';
      REFCLK_ICNTL_TX : std_logic_vector (4 downto 0) := "00000"
    );

    port (
      O                    : out std_ulogic;
      OB                   : out std_ulogic;
      CEB                  : in std_ulogic;
      I                    : in std_ulogic      
    );
  end OBUFDS_GTE3;

  architecture OBUFDS_GTE3_V of OBUFDS_GTE3 is
    
    constant MODULE_NAME : string := "OBUFDS_GTE3";

    signal glblGSR : std_ulogic;
    
    begin
        
    glblGSR     <= TO_X01(GSR);

       process (I, CEB)
         begin

          if ((CEB = '1') or (CEB = 'H')) then
              O <= 'Z';
          elsif ((CEB = '0') or (CEB = 'L')) then
          if ((I = '1') or (I = 'H')) then
              O <= '1';
          elsif ((I = '0') or (I = 'L')) then
              O <= '0';
          elsif (I = 'U') then
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
          if (((not I) = '1') or ((not I) = 'H')) then
             OB <= '1';
          elsif (((not I) = '0') or ((not I) = 'L')) then
             OB <= '0';
          elsif ((not I) = 'U') then
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

 end OBUFDS_GTE3_V;
