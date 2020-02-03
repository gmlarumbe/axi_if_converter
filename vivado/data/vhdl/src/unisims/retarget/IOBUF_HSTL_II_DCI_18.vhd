-- $Header:  $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Bi-Directional Buffer with HSTL_II_DCI_18 I/O Standard   (Discontinue in 13.1)
-- /___/   /\     Filename : IOBUF_HSTL_II_DCI_18.vhd
-- \   \  /  \    Timestamp : Thu Aug  5 16:18:38 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IOBUF_HSTL_II_DCI_18-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IOBUF_HSTL_II_DCI_18 is
  port(
    O : out std_ulogic;

    IO : inout std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end IOBUF_HSTL_II_DCI_18;

architecture IOBUF_HSTL_II_DCI_18_V of IOBUF_HSTL_II_DCI_18 is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "HSTL_II_DCI_18"
      
      
    )
    port map (
      O  => IO,
      T  => T,
      I => I
);
    I0 : IBUF
    generic map (
      IOSTANDARD => "DEFAULT"
    )
    port map (
      O  => O,
      I => IO
);

end IOBUF_HSTL_II_DCI_18_V;
