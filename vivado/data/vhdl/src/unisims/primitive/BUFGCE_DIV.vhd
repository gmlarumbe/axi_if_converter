-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        General Clock Buffer with Divide Function
-- /___/   /\      Filename    : BUFGCE_DIV.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
--  Revision
--  05/15/12 - Initial version.
--  10/17/12 - 682802 - convert GSR H/L to 1/0
--  02/28/13 - Update BUFGCE_DIV attribute
--  06/20/13 - 723918 - Add latch on CE to match HW
--  End Revision
-------------------------------------------------------------------------------

----- CELL BUFGCE_DIV -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity BUFGCE_DIV is
  generic (
    BUFGCE_DIVIDE : integer := 1;
    CE_TYPE : string := "SYNC";
    HARDSYNC_CLR : string := "FALSE";
    IS_CE_INVERTED : bit := '0';
    IS_CLR_INVERTED : bit := '0';
    IS_I_INVERTED : bit := '0'
  );

  port (
    O                    : out std_ulogic;
    CE                   : in std_ulogic;
    CLR                  : in std_ulogic;
    I                    : in std_ulogic      
  );
end BUFGCE_DIV;

  architecture BUFGCE_DIV_V of BUFGCE_DIV is
    
  constant MODULE_NAME : string := "BUFGCE_DIV";
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant CE_TYPE_HARDSYNC : std_ulogic := '1';
  constant CE_TYPE_SYNC : std_ulogic := '0';
  constant HARDSYNC_CLR_FALSE : std_ulogic := '0';
  constant HARDSYNC_CLR_TRUE : std_ulogic := '1';

  signal BUFGCE_DIVIDE_BIN : integer := 1;
  signal CE_TYPE_BIN : std_ulogic;
  signal HARDSYNC_CLR_BIN : std_ulogic;
  signal IS_CE_INVERTED_BIN : std_ulogic;
  signal IS_CLR_INVERTED_BIN : std_ulogic;
  signal IS_I_INVERTED_BIN : std_ulogic;

  signal glblGSR : std_ulogic;
  signal xil_attr_test : boolean := false;
    
  signal O_out : std_ulogic;
    
  signal CE_in : std_ulogic;
  signal CLR_in : std_ulogic;
  signal I_in : std_ulogic;

  -- begin behavioral model declarations
  signal ce_en	        : std_ulogic := '0';
  signal i_ce	        : std_ulogic := '0';

  signal divide   	: boolean    := false;
  signal FIRST_TOGGLE_COUNT     : integer    := -1;
  signal SECOND_TOGGLE_COUNT    : integer    := -1;

  -- end behavioral model declarations
    
  begin
  glblGSR     <= TO_X01(GSR);

  O <= O_out;
    
  CE_in <= '1' when (CE = 'U') else CE xor IS_CE_INVERTED_BIN; -- rv 1
  CLR_in <= '0' when (CLR = 'U') else CLR xor IS_CLR_INVERTED_BIN; -- rv 0
  I_in <= I xor IS_I_INVERTED_BIN;

  BUFGCE_DIVIDE_BIN <= BUFGCE_DIVIDE;
  
  CE_TYPE_BIN <= 
      CE_TYPE_SYNC when (CE_TYPE = "SYNC") else
      CE_TYPE_HARDSYNC when (CE_TYPE = "HARDSYNC") else
      CE_TYPE_SYNC;
  
  HARDSYNC_CLR_BIN <= 
      HARDSYNC_CLR_FALSE when (HARDSYNC_CLR = "FALSE") else
      HARDSYNC_CLR_TRUE when (HARDSYNC_CLR = "TRUE") else
      HARDSYNC_CLR_FALSE;
  
  IS_CE_INVERTED_BIN <= TO_X01(IS_CE_INVERTED);
  IS_CLR_INVERTED_BIN <= TO_X01(IS_CLR_INVERTED);
  IS_I_INVERTED_BIN <= TO_X01(IS_I_INVERTED);

  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- BUFGCE_DIVIDE check
      if((xil_attr_test) or
         ((BUFGCE_DIVIDE /= 1) and 
          (BUFGCE_DIVIDE /= 2) and 
          (BUFGCE_DIVIDE /= 3) and 
          (BUFGCE_DIVIDE /= 4) and 
          (BUFGCE_DIVIDE /= 5) and 
          (BUFGCE_DIVIDE /= 6) and 
          (BUFGCE_DIVIDE /= 7) and 
          (BUFGCE_DIVIDE /= 8))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] BUFGCE_DIVIDE attribute is set to "));
        Write ( Message, BUFGCE_DIVIDE);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("7 or "));
        Write ( Message, string'("8. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CE_TYPE check
      if((xil_attr_test) or
         ((CE_TYPE /= "SYNC") and 
          (CE_TYPE /= "HARDSYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] CE_TYPE attribute is set to """));
        Write ( Message, string'(CE_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"" or "));
        Write ( Message, string'("""HARDSYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- HARDSYNC_CLR check
      if((xil_attr_test) or
         ((HARDSYNC_CLR /= "FALSE") and 
          (HARDSYNC_CLR /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] HARDSYNC_CLR attribute is set to """));
        Write ( Message, string'(HARDSYNC_CLR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model

--####################################################################
--#####                     Initialize                           #####
--####################################################################

    prcs_init:process
    variable FIRST_TOGGLE_COUNT_var  : integer    := -1;
    variable SECOND_TOGGLE_COUNT_var : integer    := -1;
    variable divide_var  	   : boolean    := false;
    variable Message : line;
    variable attr_err : boolean := false;

    begin
      if(BUFGCE_DIVIDE = 1) then
         divide_var    := false;
         FIRST_TOGGLE_COUNT_var  := 1;
         SECOND_TOGGLE_COUNT_var := 1;
      elsif(BUFGCE_DIVIDE = 2) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 2;
      elsif(BUFGCE_DIVIDE = 3) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(BUFGCE_DIVIDE = 4) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(BUFGCE_DIVIDE = 5) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(BUFGCE_DIVIDE = 6) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(BUFGCE_DIVIDE = 7) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 8;
      else
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 8;
         SECOND_TOGGLE_COUNT_var := 8;
      end if;


      FIRST_TOGGLE_COUNT  <= FIRST_TOGGLE_COUNT_var; 
      SECOND_TOGGLE_COUNT <= SECOND_TOGGLE_COUNT_var; 

      divide    <= divide_var;

    wait;
    end process prcs_init;

    prcs_lce : process(glblGSR, CLR_in, I_in, CE_in)
    begin
      if (glblGSR = '1' or CLR_in = '1') then
        ce_en <= '0';
      elsif (I_in = '0') then
        ce_en <= CE_in;
    end if;
    end process prcs_lce;

    i_ce  <= I_in and ce_en;

--####################################################################
--#####                       CLK-I                              #####
--####################################################################

    prcs_I:process(i_ce, glblGSR, CLR_in)
    variable clk_count          : integer := 0;
    variable toggle_count       : integer := 0;
    variable first_half_period  : boolean := true;
    variable FIRST_RISE         : boolean := true;
    begin
      if(divide) then
          if((glblGSR = '1') or (CLR_in = '1')) then
            O_out       <= '0';
            clk_count  := 1;
            first_half_period  := true;
            FIRST_RISE := true;
          elsif((glblGSR = '0') and (CLR_in = '0')) then
              if((i_ce='1') and (FIRST_RISE)) then
                    O_out <= '1';
                    clk_count  := 1;
                    first_half_period        := true;
                    toggle_count := FIRST_TOGGLE_COUNT;
                    FIRST_RISE := false;
              elsif ((i_ce'event) and ( FIRST_RISE = false)) then
                    if(clk_count = toggle_count) then
                       O_out <= not O_out;
                       clk_count := 1;
                       if(first_half_period = false) then
                         toggle_count := FIRST_TOGGLE_COUNT;
                       else
                         toggle_count := SECOND_TOGGLE_COUNT;
                       end if;
                       first_half_period := not first_half_period;
                    else
                       clk_count := clk_count + 1;
                    end if;
             end if;
          end if;
       else
          O_out <= i_ce;
       end if;
    end process prcs_I;

--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
--####################################################################

-- end behavioral model

end BUFGCE_DIV_V;
