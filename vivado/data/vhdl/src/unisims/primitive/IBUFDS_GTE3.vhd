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
-- /___/   /\      Filename    : IBUFDS_GTE3.vhd
-- \   \  /  \
--  \__ \/\__ \
--
-------------------------------------------------------
--  Revision:
--  12/12/2012 - Initial version
--  03/19/2013 - Model added
--  04/08/2013 - Behavior added
--  04/12/2013 - Attribute section added
--  End Revision:
------------------------------------------------------

----- CELL IBUFDS_GTE3 -----


library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_arith.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity IBUFDS_GTE3 is
      generic (
      REFCLK_EN_TX_PATH : bit := '0';
      REFCLK_HROW_CK_SEL : std_logic_vector (1 downto 0) := "00";
      REFCLK_ICNTL_RX : std_logic_vector (1 downto 0) := "00"
    );
    port (
      O                    : out std_ulogic;
      ODIV2                : out std_ulogic;
      CEB                  : in std_ulogic;
      I                    : in std_ulogic;
      IB                   : in std_ulogic      
    );
  end IBUFDS_GTE3;

  architecture IBUFDS_GTE3_V of IBUFDS_GTE3 is
    
    constant MODULE_NAME : string := "IBUFDS_GTE3";
    constant IN_DELAY : time := 0 ps;
    constant OUT_DELAY : time := 0 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 0 ps;

    constant SYNC_PATH_DELAY : time := 100 ps;
    constant DIVIDE : integer := 2;

    signal CEB_delay : std_ulogic;
    signal IB_delay : std_ulogic;
    signal I_delay : std_ulogic;
    
    signal CEB_in : std_ulogic;
    signal IB_in : std_ulogic;
    signal I_in : std_ulogic;

    signal ODIV2_out : std_ulogic;
    signal O_out : std_ulogic;
    
    signal ODIV2_delay : std_ulogic;
    signal O_delay : std_ulogic;
    
    signal glblGSR : std_ulogic;


-- Counters
  signal ce_count         : std_logic_vector(2 downto 0) := (others => '0');
  signal edge_count       : std_logic_vector(2 downto 0) := (others => '0');

-- Flags
  signal allEqual         : std_ulogic := '0';



begin

  CEB_delay        	 <= CEB            	after 0 ps;
  I_delay          	 <= I              	after 0 ps;
  IB_delay         	 <= IB             	after 0 ps;



  glblGSR     <= TO_X01(GSR);

--Count the rising edges of the clk                

  prcs_RiseEdgeCount:process(I_delay)
  begin
     if(rising_edge(I_delay)) then
         if(allEqual = '1') then
            edge_count <= "000";
         elsif (CEB_delay = '0') then
            edge_count <= edge_count + 1;
         end if;
     end if;
  end process prcs_RiseEdgeCount;

-- Generate synchronous reset after DIVIDE number of counts

  prcs_allEqual:process(edge_count)
  variable ce_count_var  : std_logic_vector(2 downto 0) :=  CONV_STD_LOGIC_VECTOR(DIVIDE -1, 3);
  begin
     if(edge_count = ce_count_var) then
        allEqual <= '1'; 
     else
        allEqual <= '0'; 
     end if;
  end process prcs_allEqual;

--Generate ODIV2                                  

  prcs_odiv:process
  begin
    if(REFCLK_HROW_CK_SEL = "00") then
      ODIV2_out <= O_out;
    elsif(REFCLK_HROW_CK_SEL = "01") then
      ODIV2_out <= allEqual;
    elsif(REFCLK_HROW_CK_SEL = "10") then
      ODIV2_out <= '0';
    elsif(REFCLK_HROW_CK_SEL = "11") then
      ODIV2_out <= '0';
    end if;
    wait on O_out, allEqual;
  end process prcs_odiv;
     
--Generate O                                 
  prcs_o:process(I_delay, CEB_delay)
  begin
  if ((REFCLK_EN_TX_PATH = '1') or (CEB_delay = '1')) then
  O_out <= '0';
  else
  O_out <= I_delay;
  end if;   
  end process prcs_o;
  
--OUTPUT                          

  O          <= O_out     after SYNC_PATH_DELAY;
  ODIV2      <= ODIV2_out after SYNC_PATH_DELAY;


  end IBUFDS_GTE3_V;
