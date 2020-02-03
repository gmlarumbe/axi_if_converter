-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2017.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                  Analog Auxiliary SYSMON Input Buffer
-- /___/   /\      Filename    : IBUF_ANALOG.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--    10/30/13 - Initial version.
--    02/04/15 - 845545 - Remove strength specification.
-- End Revision
-------------------------------------------------------------------------------

----- CELL IBUF_ANALOG -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

entity IBUF_ANALOG is
  port (
    O                    : out std_ulogic;
    I                    : in std_ulogic
  );
end IBUF_ANALOG;

architecture IBUF_ANALOG_V of IBUF_ANALOG is

  constant MODULE_NAME : string := "IBUF_ANALOG";

begin

  O <= TO_X01(I);

end IBUF_ANALOG_V;
