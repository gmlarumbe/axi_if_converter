-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Metastability Hardened Registers
-- /___/   /\      Filename    : HARD_SYNC.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- 01/30/13 Initial version
-- 05/17/13 fix BIN encoding, remove SR, add IS_CLK_INVERTED
-- End Revision
-------------------------------------------------------------------------------

----- CELL HARD_SYNC -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity HARD_SYNC is
  generic (
    INIT : bit := '0';
    IS_CLK_INVERTED : bit := '0';
    LATENCY : integer := 2
  );

  port (
    DOUT                 : out std_ulogic;
    CLK                  : in std_ulogic;
    DIN                  : in std_ulogic
  );
end HARD_SYNC;

architecture HARD_SYNC_V of HARD_SYNC is
    
  constant MODULE_NAME : string := "HARD_SYNC";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant LATENCY_2 : std_ulogic := '0';
  constant LATENCY_3 : std_ulogic := '1';

  signal INIT_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal LATENCY_BIN : std_ulogic;
    
  signal glblGSR : std_ulogic;
  signal xil_attr_test : boolean := false;
    
  signal attr_err : std_ulogic := '0';

  signal DOUT_out : std_ulogic;
    
--  signal CLK_in : std_ulogic;
  signal DIN_in : std_ulogic;
    
  signal DIN_reg   : std_logic_vector (2 downto 0) := (others => TO_X01(INIT));

  begin
  glblGSR     <= TO_X01(GSR);
  DOUT <= DOUT_out after OUTCLK_DELAY;
  
--  CLK_in <= CLK xor IS_CLK_INVERTED_BIN;
  DIN_in <= DIN;
    
  INIT_BIN <= TO_X01(INIT);
  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  LATENCY_BIN <= 
    LATENCY_2 when (LATENCY = 2) else
    LATENCY_3 when (LATENCY = 3) else
    LATENCY_2;


  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    if((xil_attr_test) or
       ((LATENCY /= 2) and 
        (LATENCY /= 3))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-103] LATENCY attribute is set to "));
      Write ( Message, LATENCY);
      Write ( Message, string'(". Legal values for this attribute are "));
      Write ( Message, string'("2 or "));
      Write ( Message, string'("3. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HARD_SYNC_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HARD_SYNC_V'INSTANCE_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
  wait;
  end process INIPROC;

  DOUT_out <= DIN_reg(2) when (LATENCY_BIN = LATENCY_3) else DIN_reg(1);

  sync : process (CLK, glblGSR) begin
    if (glblGSR = '1') then
      DIN_reg <= INIT_BIN & INIT_BIN & INIT_BIN;
    elsif (CLK'event and xil_pos_edge_inv(CLK, IS_CLK_INVERTED_BIN)) then
      DIN_reg <= DIN_reg(1 downto 0) & DIN_in;
    end if;
  end process;
end HARD_SYNC_V;
