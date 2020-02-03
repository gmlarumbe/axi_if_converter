-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Unified Simulation Library Component
--  /   /                        48-bit Multi-Functional Arithmetic Block
-- /___/   /\      Filename    : DSP_PREADD.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  01/11/13 - DIN, D_DATA width change (26/24) sync4 yml
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_PREADD -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_PREADD is

  port (
    AD                   : out std_logic_vector(26 downto 0);
    ADDSUB               : in std_ulogic;
    D_DATA               : in std_logic_vector(26 downto 0);
    INMODE2              : in std_ulogic;
    PREADD_AB            : in std_logic_vector(26 downto 0)
  );
end DSP_PREADD;

architecture DSP_PREADD_V of DSP_PREADD is

  constant MODULE_NAME : string := "DSP_PREADD";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers


  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal AD_out : std_logic_vector(26 downto 0);
 
  signal ADDSUB_in : std_ulogic;
  signal D_DATA_in : std_logic_vector(26 downto 0);
  signal INMODE2_in : std_ulogic;
  signal PREADD_AB_in : std_logic_vector(26 downto 0);

  signal D_DATA_mux           : std_logic_vector(26 downto 0);

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  AD <= AD_out after OUT_DELAY;
  
  ADDSUB_in <= ADDSUB;
  D_DATA_in <= D_DATA;
  INMODE2_in <= INMODE2;
  PREADD_AB_in <= PREADD_AB;
  
-- *********************************************************
-- *** Preaddsub AD
-- *********************************************************
  D_DATA_mux <= D_DATA_in when INMODE2_in = '1' else (others => '0');
  AD_out <= std_logic_vector(unsigned(D_DATA_mux) - unsigned(PREADD_AB_in))
            when (ADDSUB_in = '1') else
            std_logic_vector(unsigned(D_DATA_mux) + unsigned(PREADD_AB_in));


    -- end behavioral body
  end DSP_PREADD_V;
