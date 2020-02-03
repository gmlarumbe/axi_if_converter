-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/fuji/VITAL/BUFMRCE.vhd,v 1.1 2009/12/21 22:37:58 yanx Exp $
-------------------------------------------------------
--  Copyright (c) 2009 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 13.i (O.50x)
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : BUFMRCE.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
--    04/14/11 - Set S0 to Z1 in B1 (CR606346).
-------------------------------------------------------

----- CELL BUFMRCE -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VCOMPONENTS.all;
use unisim.vpkg.all;

  entity BUFMRCE is
    generic (
      CE_TYPE : string := "SYNC";
      INIT_OUT : integer := 0;
      IS_CE_INVERTED : bit := '0'
    );

    port (
      O                    : out std_ulogic;
      CE                   : in std_ulogic;
      I                    : in std_ulogic      
    );
  end BUFMRCE;

  architecture BUFMRCE_V of BUFMRCE is
    
    signal NCE : STD_ULOGIC := 'X';
    signal GND : STD_ULOGIC := '0';
    signal Z1 : STD_ULOGIC := '1';
    signal o_bufg1_o : STD_ULOGIC := '0';
    signal o_bufg_o : STD_ULOGIC := '0';
    signal CE_TYPE_BINARY : std_ulogic;
    signal INIT_OUT_BINARY : std_ulogic;
    signal IS_CE_INVERTED_BIN : std_ulogic := TO_X01(IS_CE_INVERTED);
    signal CE_in : STD_ULOGIC := 'X';

    begin
    
    INIPROC : process
    begin
    -- case CE_TYPE is
      if((CE_TYPE = "SYNC") or (CE_TYPE = "sync")) then
        CE_TYPE_BINARY <= '0';
      elsif((CE_TYPE = "ASYNC") or (CE_TYPE= "async")) then
        CE_TYPE_BINARY <= '1';
      else
        assert FALSE report "Error : CE_TYPE = is not SYNC, ASYNC." severity error;
      end if;
    -- end case;
    case INIT_OUT is
      when  0   =>  INIT_OUT_BINARY <= '0';
      when  1   =>  INIT_OUT_BINARY <= '1';
      when others  =>  assert FALSE report "Error : INIT_OUT is not in range 0 .. 1." severity error;
    end case;
    wait;
    end process INIPROC;


    CE_in <= CE xor IS_CE_INVERTED_BIN;

    B1 : BUFGCTRL
       generic map(
         INIT_OUT => 0,
         PRESELECT_I0 => TRUE,
         PRESELECT_I1 => FALSE
       )
       port map (
         O => o_bufg_o,
         CE0 => CE_in,
         CE1 => NCE,
         I0 => I,
         I1 => GND,
         IGNORE0 => GND,
         IGNORE1 => GND,
         S0 => Z1,
         S1 => Z1
       );

    B2 : BUFGCTRL
       generic map(
         INIT_OUT => 1,
         PRESELECT_I0 => TRUE,
         PRESELECT_I1 => FALSE
       )
       port map (
         O => o_bufg1_o,
         CE0 => CE_in,
         CE1 => NCE,
         I0 => I,
         I1 => Z1,
         IGNORE0 => GND,
         IGNORE1 => GND,
         S0 => Z1,
         S1 => Z1
       );


    I1 : INV
        port map (
        I => CE_in,
        O => NCE);

    O <= o_bufg1_o when INIT_OUT = 1 else o_bufg_o;

  end BUFMRCE_V;
