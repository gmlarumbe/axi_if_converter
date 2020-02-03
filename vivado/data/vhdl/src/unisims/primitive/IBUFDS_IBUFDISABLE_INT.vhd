-- $Header: $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 13.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Differential Signaling Input Buffer
-- /___/   /\     Filename : IBUFDS_IBUFDISABLE_INT.vhd
-- \   \  /  \    
--  \___\/\___\
--
-- Revision:
--    11/09/11 - Initial -- added due to CR 631983 fix - for timing netlist only
--    07/10/12 - 669215 - add parameter DQS_BIAS
--    08/23/12 - 675511 - add DQS_BIAS functionality
-- End Revision

----- CELL IBUFDS_IBUFDISABLE_INT -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IBUFDS_IBUFDISABLE_INT is
  generic(
      DIFF_TERM   : string  :=  "FALSE";
      DQS_BIAS    : string  :=  "FALSE";
      IBUF_LOW_PWR : string :=  "TRUE";
      IOSTANDARD  : string  := "DEFAULT";
      USE_IBUFDISABLE : string :=  "TRUE"
    );

  port(
    O : out std_ulogic;

    I  : in std_ulogic;
    IB : in std_ulogic;
    IBUFDISABLE : in std_ulogic
    );

end IBUFDS_IBUFDISABLE_INT;

architecture IBUFDS_IBUFDISABLE_INT_V of IBUFDS_IBUFDISABLE_INT is
  signal O_zd               : std_ulogic := '0';
  signal I_ipd              : std_ulogic := 'X';
  signal IB_ipd             : std_ulogic := 'X';
  signal IBUFDISABLE_ipd    : std_ulogic := 'X';

  signal DQS_BIAS_BINARY : std_ulogic := '0';
  signal USE_IBUFDISABLE_BINARY : std_ulogic := '0';

begin

  I_ipd <= I;
  IB_ipd <= IB;
  IBUFDISABLE_ipd <= IBUFDISABLE;

  prcs_init : process
  variable FIRST_TIME        : boolean    := TRUE;
  begin

     if (FIRST_TIME = true) then
       FIRST_TIME := false;
        if (DQS_BIAS = "TRUE") then
           DQS_BIAS_BINARY <= '1';
        elsif (DQS_BIAS = "FALSE")  then
           DQS_BIAS_BINARY <= '0';
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DQS_BIAS are TRUE or FALSE"
           severity Failure;
        end if;
--

        if ((DIFF_TERM = "TRUE") or
            (DIFF_TERM = "FALSE")) then
             FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
        end if;

--   
        if ((IBUF_LOW_PWR = "TRUE") or
            (IBUF_LOW_PWR = "FALSE")) then
             FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;

--  
        if (USE_IBUFDISABLE = "TRUE") then
           USE_IBUFDISABLE_BINARY <= '1';
        elsif (USE_IBUFDISABLE = "FALSE") then
           USE_IBUFDISABLE_BINARY <= '0';
        else
           assert false
           report "Attribute Syntax Error: The Legal values for USE_IBUFDISABLE are TRUE or FALSE"
           severity Failure;
        end if;
--

      end if;

     wait;
  end process prcs_init;

  Behavior : process (I_ipd, IB_ipd, IBUFDISABLE_ipd)
  begin
     if((USE_IBUFDISABLE_BINARY = '0') or (IBUFDISABLE_ipd = '0')) then
        if  (((I_ipd = '1') or (I_ipd = 'H')) and ((IB_ipd = '0') or (IB_ipd = 'L'))) then
          O_zd <= '1';
        elsif (((I_ipd = '0') or (I_ipd = 'L')) and ((IB_ipd = '1') or (IB_ipd = 'H'))) then
          O_zd <= '0';
        elsif ((DQS_BIAS_BINARY = '1') and (I_ipd = 'Z' or I_ipd = '0' or I_ipd = 'L') and (IB_ipd = 'Z' or IB_ipd = '1' or IB_ipd = 'H')) then
          O_zd <= '0';
        else
          O_zd <= 'X';
        end if;
     elsif((USE_IBUFDISABLE_BINARY = '1') and (IBUFDISABLE_ipd = '1')) then
          O_zd <= '1';
     else
          O_zd <= 'X';
     end if;
  end process;

  O <=   O_zd;

end IBUFDS_IBUFDISABLE_INT_V;
