-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                    Input and/or Output Fixed or Variable Delay Element
-- /___/   /\     Filename : IODELAY.vhd
-- \   \  /  \    Timestamp : Fri Oct 21 11:07:05 PST 2010
--  \___\/\___\
--
-- Revision:
--    10/21/10 - Initial version.
-- End Revision

----- CELL IODELAY -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;



entity IODELAY is

  generic(

      DELAY_SRC		: string	:= "I";
      HIGH_PERFORMANCE_MODE		: boolean	:= true;
      IDELAY_TYPE	: string	:= "DEFAULT";
      IDELAY_VALUE	: integer	:= 0;
      ODELAY_VALUE	: integer	:= 0;
      REFCLK_FREQUENCY	: real		:= 200.0;
      SIGNAL_PATTERN	: string	:= "DATA"
      );

  port(
      DATAOUT	: out std_ulogic;

      C		: in  std_ulogic;
      CE	: in  std_ulogic;
      DATAIN	: in  std_ulogic;
      IDATAIN	: in  std_ulogic;
      INC	: in  std_ulogic;
      ODATAIN	: in  std_ulogic;
      RST	: in  std_ulogic;
      T		: in  std_ulogic
      );
end IODELAY;


architecture IODELAY_V of IODELAY is
signal DATAOUT_1, DATAOUT_2 : std_ulogic;
    function boolean_to_string(bool: boolean)
    return string is
    begin
      if bool then
        return "TRUE";
      else
        return "FALSE";
      end if;
    end boolean_to_string;

    function idelay_src_val (DELAY_SRC: string)
    return string is
    begin
      if ((DELAY_SRC ="I")) then
        return "IDATAIN";
      elsif ((DELAY_SRC ="DATAIN")) then
        return "DATAIN";
      else
        return "IDATAIN";
      end if;
    end idelay_src_val;
    function odelay_src_val (DELAY_SRC: string)
    return string is
    begin
      if ((DELAY_SRC ="O")) then
        return "ODATAIN";
      elsif ((DELAY_SRC ="CLKIN")) then
        return "CLKIN";
      else
        return "ODATAIN";
      end if;
    end odelay_src_val;
begin
   IOD1 : if((DELAY_SRC = "I")  or (DELAY_SRC = "DATAIN")) generate

     I6 : IDELAYE2
     generic map (
	CINVCTRL_SEL => "FALSE",
	DELAY_SRC => idelay_src_val(DELAY_SRC),
	HIGH_PERFORMANCE_MODE => boolean_to_string(HIGH_PERFORMANCE_MODE),
	IDELAY_TYPE => IDELAY_TYPE,
	IDELAY_VALUE => IDELAY_VALUE,
	PIPE_SEL => "FALSE",
	REFCLK_FREQUENCY => REFCLK_FREQUENCY,
	SIGNAL_PATTERN => SIGNAL_PATTERN
     )
      port map (   	
        CNTVALUEOUT => open, 
        DATAOUT => DATAOUT_1,
        C => C, 
        CE => CE,
        CINVCTRL => '0',
        CNTVALUEIN => "00000",
        DATAIN => '0',
        IDATAIN => IDATAIN,
        INC => INC,
        LD => '0',
        LDPIPEEN => '0',
        REGRST => RST
  );
end generate;
   IOD2 : if((DELAY_SRC = "O")  or (DELAY_SRC = "CLKIN")) generate

     O6 : ODELAYE2
     generic map (
	CINVCTRL_SEL => "FALSE",
	DELAY_SRC => odelay_src_val(DELAY_SRC),
	HIGH_PERFORMANCE_MODE => boolean_to_string(HIGH_PERFORMANCE_MODE),
	ODELAY_TYPE => IDELAY_TYPE,
	ODELAY_VALUE => IDELAY_VALUE,
	PIPE_SEL => "FALSE",
	REFCLK_FREQUENCY => REFCLK_FREQUENCY,
	SIGNAL_PATTERN => SIGNAL_PATTERN
     )
      port map (   	
        CNTVALUEOUT => open, 
        DATAOUT => DATAOUT_2,
        C => C, 
        CE => CE,
        CINVCTRL => '0',
        CLKIN => '0',
        CNTVALUEIN => "00000",
        ODATAIN => ODATAIN,
        INC => INC,
        LD => '0',
        LDPIPEEN => '0',
        REGRST => RST
  );
end generate;
               DATAOUT <= DATAOUT_1 when ((DELAY_SRC = "I")  or (DELAY_SRC = "DATAIN")) else
             DATAOUT_2;
end IODELAY_V;
