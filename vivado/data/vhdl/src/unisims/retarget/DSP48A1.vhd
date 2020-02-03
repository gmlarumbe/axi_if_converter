-------------------------------------------------------------------------------
-- Copyright (c) 1995/2011 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Multifunctional, Cascadable, 48-bit Output Arithmetic Block
-- /___/   /\     Filename : DSP48A1.vhd
-- \   \  /  \    Timestamp : hu Aug 11 16:23:36 PDT 2011
--  \___\/\___\
--
-- Revision:
--    08/11/11 - Initial version.
-- End Revision

----- CELL DSP48A1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

library STD;
use STD.TEXTIO.all;


library unisim;
use unisim.vpkg.all;

entity DSP48A1 is

  generic(

        A0REG           : integer       := 0;
        A1REG           : integer       := 1;
        B0REG           : integer       := 0;
        B1REG           : integer       := 1;
        CARRYINREG      : integer       := 1;
        CARRYINSEL      : string        := "OPMODE5";
        CARRYOUTREG     : integer       := 1;
        CREG            : integer       := 1;
        DREG            : integer       := 1;
        MREG            : integer       := 1;
        OPMODEREG       : integer       := 1;
        PREG            : integer       := 1;
        RSTTYPE         : string        := "SYNC"
        );

  port(
        BCOUT                   : out std_logic_vector(17 downto 0);
        CARRYOUT                : out std_ulogic;
        CARRYOUTF               : out std_ulogic;
        M                       : out std_logic_vector(35 downto 0);
        P                       : out std_logic_vector(47 downto 0);
        PCOUT                   : out std_logic_vector(47 downto 0);

        A                       : in  std_logic_vector(17 downto 0);
        B                       : in  std_logic_vector(17 downto 0);
        C                       : in  std_logic_vector(47 downto 0);
        CARRYIN                 : in  std_ulogic := 'L';
        CEA                     : in  std_ulogic;
        CEB                     : in  std_ulogic;
        CEC                     : in  std_ulogic;
        CECARRYIN               : in  std_ulogic;
        CED                     : in  std_ulogic;
        CEM                     : in  std_ulogic;
        CEOPMODE                : in  std_ulogic;
        CEP                     : in  std_ulogic;
        CLK                     : in  std_ulogic;
        D                       : in  std_logic_vector(17 downto 0);
        OPMODE                  : in  std_logic_vector(7 downto 0);
        PCIN                    : in  std_logic_vector(47 downto 0) := (others => 'L');
        RSTA                    : in  std_ulogic;
        RSTB                    : in  std_ulogic;
        RSTC                    : in  std_ulogic;
        RSTCARRYIN              : in  std_ulogic;
        RSTD                    : in  std_ulogic;
        RSTM                    : in  std_ulogic;
        RSTOPMODE               : in  std_ulogic;
        RSTP                    : in  std_ulogic
      );

end DSP48A1;

-- architecture body                    --

architecture DSP48A1_V of DSP48A1 is

begin

--####################################################################
--#####                        Initialization                      ###
--####################################################################
  prcs_init:process
  begin

    assert false
      report "ERROR : The following component DSP48A1 is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com."
      severity Failure;

     wait;

  end process prcs_init;


end DSP48A1_V;
