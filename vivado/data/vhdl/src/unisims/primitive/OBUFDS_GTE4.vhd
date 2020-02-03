-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Gigabit Transceiver Buffer
-- /___/   /\      Filename    : OBUFDS_GTE4.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- 
-- End Revision
-------------------------------------------------------------------------------

----- CELL OBUFDS_GTE4 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity OBUFDS_GTE4 is
  generic (
    REFCLK_EN_TX_PATH : bit := '0';
    REFCLK_ICNTL_TX : std_logic_vector(4 downto 0) := "00000"
  );

  port (
    O                    : out std_ulogic;
    OB                   : out std_ulogic;
    CEB                  : in std_ulogic;
    I                    : in std_ulogic
  );
end OBUFDS_GTE4;

architecture OBUFDS_GTE4_V of OBUFDS_GTE4 is

    constant MODULE_NAME : string := "OBUFDS_GTE4";

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

  end OBUFDS_GTE4_V;
