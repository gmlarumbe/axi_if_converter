------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 13.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Differential Signaling Input Buffer with Differential Outputs
-- /___/   /\     Filename : IBUFDS_DIFF_OUT_INTERMDISABLE.vhd
-- \   \  /  \    Timestamp : Fri Apr 22 10:28:12 PDT 2011
--  \___\/\___\
--
-- Revision:
--    04/22/11 - Initial version.
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
-- End Revision


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IBUFDS_DIFF_OUT_INTERMDISABLE is
  generic(
    DIFF_TERM    : string :=  "FALSE";
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR : string :=  "TRUE";
    IOSTANDARD   : string := "DEFAULT";  
    SIM_DEVICE : string := "7SERIES";
    USE_IBUFDISABLE : string := "TRUE"
    );

   port(
      O                              :	out   STD_ULOGIC;
      OB                             :	out   STD_ULOGIC;      
      
      I                              :	in    STD_ULOGIC;
      IB                             :	in    STD_ULOGIC;
      IBUFDISABLE                    :	in    STD_ULOGIC;
      INTERMDISABLE                  :	in    STD_ULOGIC
      );
end IBUFDS_DIFF_OUT_INTERMDISABLE;

architecture IBUFDS_DIFF_OUT_INTERMDISABLE_V of IBUFDS_DIFF_OUT_INTERMDISABLE is
 signal out_val : std_ulogic := '1';
 signal out_b_val : std_ulogic := '1';
 signal DQS_BIAS_BINARY        : std_ulogic := '0';
 signal USE_IBUFDISABLE_BINARY : std_ulogic := '0';

begin

  prcs_init : process
  variable FIRST_TIME        : boolean    := TRUE;
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
        if (USE_IBUFDISABLE = "TRUE") then
           FIRST_TIME := false;
        elsif (USE_IBUFDISABLE = "FALSE")  then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for USE_IBUFDISABLE are TRUE or FALSE"
           severity Failure;
        end if;

--
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

     wait;
  end process prcs_init;
 
  DQS_BIAS_BINARY <=
    '0' when (DQS_BIAS = "FALSE") else
    '1' when (DQS_BIAS = "TRUE") else
    '0';

   USE_IBUFDISABLE_BINARY <=
    '0' when (USE_IBUFDISABLE = "FALSE") else
    '1' when (USE_IBUFDISABLE = "TRUE") else
    '0';

  out_val <= '0' when (SIM_DEVICE = "ULTRASCALE") else
              '1' when (SIM_DEVICE = "7SERIES");

  out_b_val <= 'X' when (SIM_DEVICE = "ULTRASCALE") else
              '1' when (SIM_DEVICE = "7SERIES");
   prcs_output : process (IBUFDISABLE, I, IB, USE_IBUFDISABLE_BINARY, DQS_BIAS_BINARY)
      variable IBUFDISABLE_BIN   : std_ulogic := '0';
   begin
     IBUFDISABLE_BIN := (IBUFDISABLE and USE_IBUFDISABLE_BINARY);
     if(IBUFDISABLE_BIN = '1') then
       O <= out_val;
       OB <= out_b_val;
     elsif (IBUFDISABLE_BIN = '0') then
       if ((I = '1' or I = 'H') and (IB = '0' or IB = 'L')) then
          O <= '1';
          OB <= '0';
       elsif ((I = '0' or I = 'L') and (IB = '1' or IB = 'H')) then
          O <= '0';
          OB <= '1';
       elsif ((I = 'Z' or I = '0' or I = 'L') and (IB = 'Z' or IB = '1' or IB = 'H')) then
          if (DQS_BIAS_BINARY = '1') then
            O <= '0';
            OB <= '1';
          else
            O <= 'X';
            OB <= 'X';
          end if;
       elsif ((I = 'X' or I = 'U') and (IB = 'X' or IB = 'U')) then
         O <= 'X';
         OB <= 'X';
       end if;
     end if;
   end process;

end IBUFDS_DIFF_OUT_INTERMDISABLE_V;
