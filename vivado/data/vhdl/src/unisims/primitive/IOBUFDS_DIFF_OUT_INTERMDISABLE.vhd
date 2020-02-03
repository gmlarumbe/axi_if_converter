-------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 13.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  3-State Diffential Signaling I/O Buffer
-- /___/   /\     Filename : IOBUFDS_DIFF_OUT_INTERMDISABLE.vhd
-- \   \  /  \    Timestamp : Fri Apr 22 10:28:12 PDT 2011
--  \___\/\___\
--
-- Revision:
--    04/22/11 - Initial version.
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    07/19/11 - CR 616194 -- matched verilog model
--    08/31/11 - CR 623170 -- Tristate powergating support
--    09/19/11 - CR 625564 -- Fixed Tristate powergating polarity
-- End Revision


----- CELL IOBUFDS_DIFF_OUT_INTERMDISABLE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IOBUFDS_DIFF_OUT_INTERMDISABLE is
  generic(
    DIFF_TERM       : string := "FALSE";
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR    : string := "TRUE";
    IOSTANDARD      : string := "DEFAULT";
    SIM_DEVICE 	    : string := "7SERIES";
    USE_IBUFDISABLE : string := "TRUE"
    );

  port(
    O  : out std_ulogic;
    OB : out std_ulogic;

    IO  : inout std_ulogic;
    IOB : inout std_ulogic;

    I           : in std_ulogic;
    IBUFDISABLE : in std_ulogic;
    INTERMDISABLE : in std_ulogic;
    TM          : in std_ulogic;
    TS          : in std_ulogic
    );
end IOBUFDS_DIFF_OUT_INTERMDISABLE;

architecture IOBUFDS_DIFF_OUT_INTERMDISABLE_V of IOBUFDS_DIFF_OUT_INTERMDISABLE is
signal out_val : std_ulogic := '1';
signal out_b_val : std_ulogic := '1';
signal DQS_BIAS_BINARY        : std_ulogic := '0';

begin

  prcs_init             : process
    variable FIRST_TIME : boolean := true;
  begin
     If(FIRST_TIME = true) then

        if((DIFF_TERM = "TRUE") or
           (DIFF_TERM = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
        end if;

--
        if((IBUF_LOW_PWR = "TRUE") or
           (IBUF_LOW_PWR = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;
--
        if((USE_IBUFDISABLE = "TRUE") or
           (USE_IBUFDISABLE = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for USE_IBUFDISABLE are TRUE or FALSE"
           severity Failure;
        end if;
        if (DQS_BIAS = "TRUE") then
           FIRST_TIME := false;
        elsif (DQS_BIAS = "FALSE") then
           FIRST_TIME := false;
        else
         assert FALSE report "Attribute Syntax Error : The Legal values for DQS_BIAS are FALSE or TRUE." severity Failure;
        end if;

	if((SIM_DEVICE = "7SERIES") or (SIM_DEVICE = "7series")) then
         FIRST_TIME := false;
        elsif((SIM_DEVICE = "ULTRASCALE") or (SIM_DEVICE = "ultrascale")) then
         FIRST_TIME := false;
        else
          assert FALSE report "Attribute Syntax Error : The Legal values for SIM_DEVICE are 7SERIES or ULTRASCALE." severity Failure;
        end if;

--
     end if;

     wait;
  end process prcs_init;
  DQS_BIAS_BINARY <=
    '0' when (DQS_BIAS = "FALSE") else
    '1' when (DQS_BIAS = "TRUE") else
    '0';

 out_val <= '0' when (SIM_DEVICE = "ULTRASCALE") else
              '1' when (SIM_DEVICE = "7SERIES");

 out_b_val <= 'X' when (SIM_DEVICE = "ULTRASCALE") else
              '1' when (SIM_DEVICE = "7SERIES");
  prcs_output : process (IBUFDISABLE, IO, IOB, I, TM, TS)
  variable  T_OR_IBUFDISABLE_1 : std_ulogic := '0';
  variable  T_OR_IBUFDISABLE_2 : std_ulogic := '0';
  begin
    if(USE_IBUFDISABLE = "TRUE") then
       T_OR_IBUFDISABLE_1 := IBUFDISABLE OR (not TM);
       T_OR_IBUFDISABLE_2 := IBUFDISABLE OR (not TS);

-- O
       if(T_OR_IBUFDISABLE_1 = '1') then
          O  <= out_val;
       elsif (T_OR_IBUFDISABLE_1 = '0') then
        if ((IO = '1' or IO = 'H') and (IOB = '0' or IOB = 'L')) then
          O <= '1';
       elsif ((IO = '0' or IO = 'L') and (IOB = '1' or IOB = 'H')) then
          O <= '0';
       elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BINARY = '1') then
            O <= '0';
          else
            O <= 'X';
          end if;
       elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U' )) then
         O <= 'X';
       end if;
       end if;
-- OB
       if(T_OR_IBUFDISABLE_2 = '1') then
          OB <= out_b_val;
       elsif (T_OR_IBUFDISABLE_2 = '0') then
       if ((IO = '1' or IO = 'H') and (IOB = '0' or IOB = 'L')) then
          OB <= '0';
       elsif ((IO = '0' or IO = 'L') and (IOB = '1' or IOB = 'H')) then
          OB <= '1';
       elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BINARY = '1') then
            OB <= '1';
          else
            OB <= 'X';
          end if;
       elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U' )) then
         OB <= 'X';
       end if;
       end if;
    elsif(USE_IBUFDISABLE = "FALSE") then
       if ((IO = '1' or IO = 'H') and (IOB = '0' or IOB = 'L')) then
          O <= '1';
          OB <= '0';
       elsif ((IO = '0' or IO = 'L') and (IOB = '1' or IOB = 'H')) then
          O <= '0';
          OB <= '1';
       elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BINARY = '1') then
            O <= '0';
            OB <= '1';
          else
            O <= 'X';
            OB <= 'X';
          end if;
       elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U' )) then
         O <= 'X';
         OB <= 'X';
       end if;
    end if;

    if ((TM = '1') or (TM = 'H')) then
      IO <= 'Z';
    elsif ((TM = '0') or (TM = 'L')) then
      if ((I = '1') or (I = 'H')) then
        IO <= '1';
      elsif ((I = '0') or (I = 'L')) then
        IO <= '0';
      elsif (I = 'U') then
        IO <= 'U';
      else
        IO <= 'X';  
      end if;
    elsif (TM = 'U') then
      IO <= 'U';          
    else                                      
      IO <= 'X';  
    end if;

    if ((TS = '1') or (TS = 'H')) then
      IOB <= 'Z';
    elsif ((TS = '0') or (TS = 'L')) then
      if (((not I) = '1') or ((not I) = 'H')) then
        IOB <= '1';
      elsif (((not I) = '0') or ((not I) = 'L')) then
        IOB <= '0';
      elsif ((not I) = 'U') then
        IOB <= 'U';
      else
        IOB <= 'X';  
      end if;
    elsif (TS = 'U') then
      IOB <= 'U';          
    else                                      
      IOB <= 'X';  
    end if;        
  end process;
end IOBUFDS_DIFF_OUT_INTERMDISABLE_V;
