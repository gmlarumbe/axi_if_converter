-----------------------------------------------------------------------------
--  Copyright (c) 2013 Xilinx Inc.
--  All Right Reserved.
-----------------------------------------------------------------------------
--
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2013.2 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      
-- /___/   /\      Filename    : DNA_PORTE2.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-----------------------------------------------------------------------------
--  Revision:
--     06/11/13 - Initial version.
--     10/02/14 - Fixed shift in order.
--  End Revision
-----------------------------------------------------------------------------

----- CELL DNA_PORTE2 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DNA_PORTE2 is
  generic (
    SIM_DNA_VALUE : std_logic_vector(95 downto 0) := X"000000000000000000000000"
  );

  port (
    DOUT                 : out std_ulogic;
    CLK                  : in std_ulogic;
    DIN                  : in std_ulogic;
    READ                 : in std_ulogic;
    SHIFT                : in std_ulogic    
  );
end DNA_PORTE2;

architecture DNA_PORTE2_V of DNA_PORTE2 is

-----------------------------------------------------------
-----------------------------------------------------------
  function eval_init (sim_dna_val : in  std_logic_vector;
                      msb         : in integer
                      ) return std_logic_vector is
  variable ret_sim_dna_val : std_logic_vector (msb downto 0);
  variable tmp_sim_dna_val : std_logic_vector ((sim_dna_val'length-1) downto 0);
  begin
    if (sim_dna_val'length >= msb ) then
        tmp_sim_dna_val((sim_dna_val'length-1) downto 0) := sim_dna_val;
        ret_sim_dna_val(msb downto 0) := tmp_sim_dna_val(msb downto 0);

    else
        ret_sim_dna_val := (others => '0');
        ret_sim_dna_val((sim_dna_val'length-1) downto 0) := sim_dna_val;
    end if;

    return ret_sim_dna_val(msb downto 0);
  end;
-----------------------------------------------------------
-----------------------------------------------------------

  constant MAX_DNA_BITS     : integer := 96;
  constant MSB_DNA_BITS     : integer := (MAX_DNA_BITS - 1);

  constant SYNC_PATH_DELAY      : time := 100 ps;

  signal        CLK_dly          : std_ulogic := 'X';
  signal        DIN_dly          : std_ulogic := 'X';
  signal        GSR_dly          : std_ulogic := '0';
  signal        READ_dly         : std_ulogic := 'X';
  signal        SHIFT_dly        : std_ulogic := 'X';
  signal        DOUT_zd          : std_ulogic := 'X';
  signal        dna_val          : std_logic_vector(MSB_DNA_BITS downto 0) := eval_init(SIM_DNA_VALUE, MSB_DNA_BITS);

begin

  CLK_dly        	 <= CLK            	after 0 ps;
  DIN_dly        	 <= DIN            	after 0 ps;
  READ_dly       	 <= READ           	after 0 ps;
  SHIFT_dly      	 <= SHIFT          	after 0 ps;
  GSR_dly        	 <= TO_X01(GSR)    	after 0 ps;

  --------------------
  --  BEHAVIOR SECTION
  --------------------

--####################################################################
--#####                            READ                            ###
--####################################################################
  prcs_read:process(CLK_dly, GSR_dly, READ_dly, SHIFT_dly)
  variable        dna_val_var          : std_logic_vector(MSB_DNA_BITS downto 0) := eval_init(SIM_DNA_VALUE, MSB_DNA_BITS);
  begin
     if(GSR_dly = '1') then
        dna_val(0) <= '0';
     elsif(GSR_dly = '0') then
        if(rising_edge(CLK_dly)) then
           if(READ_dly = '1') then
             dna_val_var := eval_init(SIM_DNA_VALUE, MSB_DNA_BITS);
             DOUT_zd <= dna_val_var(0);
           elsif(READ_dly = '0') then
             if(SHIFT_dly = '1') then
               dna_val_var := DIN_dly & dna_val_var(MSB_DNA_BITS downto 1);
               DOUT_zd     <= dna_val_var(0);
             end if; -- SHIFT_dly = '1'   
           end if;  -- READ_dly = '1'  
        end if; -- rising_edge(CLK_dly)   
     end if; -- GSR_dly = '1'   
  end process prcs_read;
  
--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
  prcs_output:process(DOUT_zd)
  begin
      DOUT <= DOUT_zd after SYNC_PATH_DELAY;
  end process prcs_output;
  
end DNA_PORTE2_V;
