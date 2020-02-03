-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        _no_description_
-- /___/   /\      Filename    : FRAME_ECCE4.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL FRAME_ECCE4 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity FRAME_ECCE4 is
  port (
    CRCERROR             : out std_ulogic;
    ECCERRORNOTSINGLE    : out std_ulogic;
    ECCERRORSINGLE       : out std_ulogic;
    ENDOFFRAME           : out std_ulogic;
    ENDOFSCAN            : out std_ulogic;
    FAR                  : out std_logic_vector(26 downto 0);
    FARSEL               : in std_logic_vector(1 downto 0);
    ICAPBOTCLK           : in std_ulogic;
    ICAPTOPCLK           : in std_ulogic
  );
end FRAME_ECCE4;

architecture FRAME_ECCE4_V of FRAME_ECCE4 is
  begin
  end FRAME_ECCE4_V;
