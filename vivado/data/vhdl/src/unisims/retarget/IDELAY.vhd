-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 2018.1
--  \   \         Description : Xilinx Retarget Simulation Library Component
--  /   /                    Input Delay Line
-- /___/   /\     Filename : IDELAY.vhd
-- \   \  /  \
--  \___\/\___\
--
-- Revision:
--    10/20/10 - Initial version.
--    01/23/18 - map DEFAULT to FIXED
-- End Revision

----- CELL IDELAY -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IDELAY is
  generic(
      IOBDELAY_TYPE  : string := "DEFAULT";
      IOBDELAY_VALUE : integer := 0
      );
  port(
      O      : out std_ulogic;

      C      : in  std_ulogic;
      CE     : in  std_ulogic;
      I      : in  std_ulogic;
      INC    : in  std_ulogic;
      RST    : in  std_ulogic
      );
end IDELAY;

architecture IDELAY_V of IDELAY is
  signal Q0_G1, Q1_G1, Q0_G2, Q1_G2 : std_ulogic;
  function idelay_type_val (IDELAY_TYPE: string)
    return string is
    begin
      if (IDELAY_TYPE = "DEFAULT") then
        return "FIXED";
      else
        return IDELAY_TYPE;
      end if;
    end idelay_type_val;
  begin
     uut : IDELAYE2
     generic map (
	    CINVCTRL_SEL => "FALSE",
	    DELAY_SRC => "IDATAIN",
	    HIGH_PERFORMANCE_MODE => "TRUE",
	    IDELAY_TYPE => idelay_type_val(IOBDELAY_TYPE),
	    IDELAY_VALUE => IOBDELAY_VALUE,
	    PIPE_SEL => "FALSE",
	    REFCLK_FREQUENCY => 200.0,
	    SIGNAL_PATTERN => "DATA"
     )
     port map (   	
       CNTVALUEOUT => open, 
       DATAOUT => O,
       C => C, 
       CE => CE,
       CINVCTRL => '0',
       CNTVALUEIN => "00000",
       DATAIN => '0',
       IDATAIN => I,
       INC => INC,
       LD => '0',
       LDPIPEEN => '0',
       REGRST => RST
     );
end IDELAY_V;
