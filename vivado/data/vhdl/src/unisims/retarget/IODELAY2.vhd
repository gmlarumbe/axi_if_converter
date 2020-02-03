-------------------------------------------------------
--  Copyright (c) 2011 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 11.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Input and/or Output Fixed or Variable Delay Element.
-- /___/   /\      Filename    : IODELAY2.vhd
-- \   \  /  \      
--  \__ \/\__ \                  
--                                  
-- Revision:
--    08/16/11 - Initial version.
-- End Revision

----- CELL IODELAY2 -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

  entity IODELAY2 is
    generic (
      COUNTER_WRAPAROUND : string := "WRAPAROUND";
      DATA_RATE : string := "SDR";
      DELAY_SRC : string := "IO";
      IDELAY2_VALUE : integer := 0;
      IDELAY_MODE : string := "NORMAL";
      IDELAY_TYPE : string := "DEFAULT";
      IDELAY_VALUE : integer := 0;
      ODELAY_VALUE : integer := 0;
      SERDES_MODE : string := "NONE";
      SIM_TAPDELAY_VALUE : integer := 75
    );

    port (
      BUSY                 : out std_ulogic;
      DATAOUT              : out std_ulogic;
      DATAOUT2             : out std_ulogic;
      DOUT                 : out std_ulogic;
      TOUT                 : out std_ulogic;
      CAL                  : in std_ulogic;
      CE                   : in std_ulogic;
      CLK                  : in std_ulogic;
      IDATAIN              : in std_ulogic;
      INC                  : in std_ulogic;
      IOCLK0               : in std_ulogic;
      IOCLK1               : in std_ulogic;
      ODATAIN              : in std_ulogic;
      RST                  : in std_ulogic;
      T                    : in std_ulogic      
    );
    end IODELAY2;

    architecture IODELAY2_V of IODELAY2 is

    begin

--####################################################################
--#####                        Initialization                      ###
--####################################################################
      prcs_init:process
      begin

        assert false
          report "ERROR : The following component IODELAY2 is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
          severity Failure;

        wait;

      end process prcs_init;
      
end IODELAY2_V;
