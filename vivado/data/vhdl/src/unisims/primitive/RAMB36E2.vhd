-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2014.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                      
-- /___/   /\      Filename    : RAMB36E2.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
-------------------------------------------------------------------------------
--  Revision
--  03/15/2013 - intial from FIFO
--  03/19/2013 - 707442 - sdp_mode bug when WIDTH = 36
--  03/19/2013 - 707443 - RDADDRECC not hooked up
--  03/21/2013 - 707635 - port B read first acting like write first. WRITE/READ typo.
--  03/22/2013 - sync5 yaml update, port ordering
--  03/25/2013 - 708015 - sdp_mode bug when READ_WIDTH = 36
--  03/26/2013 - 707719 - Add sync5 cascade feature
--  03/27/2013 - 708743 - neg edge sensitivity to RD clk and revert NO_CHANGE fix
--  04/23/2013 - PR683925 - add invertible pin support.
--  End Revision
-------------------------------------------------------------------------------

----- CELL RAMB36E2 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity RAMB36E2 is
    generic (
      CASCADE_ORDER_A : string := "NONE";
      CASCADE_ORDER_B : string := "NONE";
      CLOCK_DOMAINS : string := "INDEPENDENT";
      DOA_REG : integer := 1;
      DOB_REG : integer := 1;
      ENADDRENA : string := "FALSE";
      ENADDRENB : string := "FALSE";
      EN_ECC_PIPE : string := "FALSE";
      EN_ECC_READ : string := "FALSE";
      EN_ECC_WRITE : string := "FALSE";
      INITP_00 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_08 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_09 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_0A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_0B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_0C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_0D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_0E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_0F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_00 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_01 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_02 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_03 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_04 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_05 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_06 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_07 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_08 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_09 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_10 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_11 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_12 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_13 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_14 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_15 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_16 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_17 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_18 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_19 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_20 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_21 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_22 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_23 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_24 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_25 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_26 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_27 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_28 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_29 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_30 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_31 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_32 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_33 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_34 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_35 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_36 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_37 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_38 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_39 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_40 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_41 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_42 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_43 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_44 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_45 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_46 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_47 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_48 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_49 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_4A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_4B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_4C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_4D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_4E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_4F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_50 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_51 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_52 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_53 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_54 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_55 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_56 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_57 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_58 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_59 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_5A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_5B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_5C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_5D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_5E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_5F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_60 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_61 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_62 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_63 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_64 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_65 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_66 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_67 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_68 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_69 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_6A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_6B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_6C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_6D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_6E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_6F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_70 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_71 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_72 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_73 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_74 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_75 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_76 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_77 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_78 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_79 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_7A : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_7B : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_7C : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_7D : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_7E : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_7F : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_A : std_logic_vector (35 downto 0) := X"000000000";
      INIT_B : std_logic_vector (35 downto 0) := X"000000000";
      INIT_FILE : string := "NONE";
      IS_CLKARDCLK_INVERTED : bit := '0';
      IS_CLKBWRCLK_INVERTED : bit := '0';
      IS_ENARDEN_INVERTED : bit := '0';
      IS_ENBWREN_INVERTED : bit := '0';
      IS_RSTRAMARSTRAM_INVERTED : bit := '0';
      IS_RSTRAMB_INVERTED : bit := '0';
      IS_RSTREGARSTREG_INVERTED : bit := '0';
      IS_RSTREGB_INVERTED : bit := '0';
      RDADDRCHANGEA : string := "FALSE";
      RDADDRCHANGEB : string := "FALSE";
      READ_WIDTH_A : integer := 0;
      READ_WIDTH_B : integer := 0;
      RSTREG_PRIORITY_A : string := "RSTREG";
      RSTREG_PRIORITY_B : string := "RSTREG";
      SIM_COLLISION_CHECK : string := "ALL";
      SLEEP_ASYNC : string := "FALSE";
      SRVAL_A : std_logic_vector (35 downto 0) := X"000000000";
      SRVAL_B : std_logic_vector (35 downto 0) := X"000000000";
      WRITE_MODE_A : string := "NO_CHANGE";
      WRITE_MODE_B : string := "NO_CHANGE";
      WRITE_WIDTH_A : integer := 0;
      WRITE_WIDTH_B : integer := 0
    );

    port (
      CASDOUTA             : out std_logic_vector(31 downto 0);
      CASDOUTB             : out std_logic_vector(31 downto 0);
      CASDOUTPA            : out std_logic_vector(3 downto 0);
      CASDOUTPB            : out std_logic_vector(3 downto 0);
      CASOUTDBITERR        : out std_ulogic;
      CASOUTSBITERR        : out std_ulogic;
      DBITERR              : out std_ulogic;
      DOUTADOUT            : out std_logic_vector(31 downto 0);
      DOUTBDOUT            : out std_logic_vector(31 downto 0);
      DOUTPADOUTP          : out std_logic_vector(3 downto 0);
      DOUTPBDOUTP          : out std_logic_vector(3 downto 0);
      ECCPARITY            : out std_logic_vector(7 downto 0);
      RDADDRECC            : out std_logic_vector(8 downto 0);
      SBITERR              : out std_ulogic;
      ADDRARDADDR          : in std_logic_vector(14 downto 0);
      ADDRBWRADDR          : in std_logic_vector(14 downto 0);
      ADDRENA              : in std_ulogic;
      ADDRENB              : in std_ulogic;
      CASDIMUXA            : in std_ulogic;
      CASDIMUXB            : in std_ulogic;
      CASDINA              : in std_logic_vector(31 downto 0);
      CASDINB              : in std_logic_vector(31 downto 0);
      CASDINPA             : in std_logic_vector(3 downto 0);
      CASDINPB             : in std_logic_vector(3 downto 0);
      CASDOMUXA            : in std_ulogic;
      CASDOMUXB            : in std_ulogic;
      CASDOMUXEN_A         : in std_ulogic;
      CASDOMUXEN_B         : in std_ulogic;
      CASINDBITERR         : in std_ulogic;
      CASINSBITERR         : in std_ulogic;
      CASOREGIMUXA         : in std_ulogic;
      CASOREGIMUXB         : in std_ulogic;
      CASOREGIMUXEN_A      : in std_ulogic;
      CASOREGIMUXEN_B      : in std_ulogic;
      CLKARDCLK            : in std_ulogic;
      CLKBWRCLK            : in std_ulogic;
      DINADIN              : in std_logic_vector(31 downto 0);
      DINBDIN              : in std_logic_vector(31 downto 0);
      DINPADINP            : in std_logic_vector(3 downto 0);
      DINPBDINP            : in std_logic_vector(3 downto 0);
      ECCPIPECE            : in std_ulogic;
      ENARDEN              : in std_ulogic;
      ENBWREN              : in std_ulogic;
      INJECTDBITERR        : in std_ulogic;
      INJECTSBITERR        : in std_ulogic;
      REGCEAREGCE          : in std_ulogic;
      REGCEB               : in std_ulogic;
      RSTRAMARSTRAM        : in std_ulogic;
      RSTRAMB              : in std_ulogic;
      RSTREGARSTREG        : in std_ulogic;
      RSTREGB              : in std_ulogic;
      SLEEP                : in std_ulogic;
      WEA                  : in std_logic_vector(3 downto 0);
      WEBWE                : in std_logic_vector(7 downto 0)      
    );
  end RAMB36E2;

  architecture RAMB36E2_V of RAMB36E2 is
    
    constant MODULE_NAME : string := "RAMB36E2";

-- Parameter encodings and registers
    constant CASCADE_ORDER_A_FIRST : integer := 1;
    constant CASCADE_ORDER_A_LAST : integer := 2;
    constant CASCADE_ORDER_A_MIDDLE : integer := 3;
    constant CASCADE_ORDER_A_NONE : integer := 0;
    constant CASCADE_ORDER_B_FIRST : integer := 1;
    constant CASCADE_ORDER_B_LAST : integer := 2;
    constant CASCADE_ORDER_B_MIDDLE : integer := 3;
    constant CASCADE_ORDER_B_NONE : integer := 0;
    constant CLOCK_DOMAINS_COMMON : integer := 1;
    constant CLOCK_DOMAINS_INDEPENDENT : integer := 0;
    constant DOA_REG_0 : integer := 1;
    constant DOA_REG_1 : integer := 0;
    constant DOB_REG_0 : integer := 1;
    constant DOB_REG_1 : integer := 0;
    constant ENADDRENA_FALSE : integer := 0;
    constant ENADDRENA_TRUE : integer := 1;
    constant ENADDRENB_FALSE : integer := 0;
    constant ENADDRENB_TRUE : integer := 1;
    constant EN_ECC_PIPE_FALSE : integer := 0;
    constant EN_ECC_PIPE_TRUE : integer := 1;
    constant EN_ECC_READ_FALSE : integer := 0;
    constant EN_ECC_READ_TRUE : integer := 1;
    constant EN_ECC_WRITE_FALSE : integer := 0;
    constant EN_ECC_WRITE_TRUE : integer := 1;
    constant RDADDRCHANGEA_FALSE : integer := 0;
    constant RDADDRCHANGEA_TRUE : integer := 1;
    constant RDADDRCHANGEB_FALSE : integer := 0;
    constant RDADDRCHANGEB_TRUE : integer := 1;
    constant READ_WIDTH_A_0 : integer := 1;
    constant READ_WIDTH_A_1 : integer := 1;
    constant READ_WIDTH_A_18 : integer := 16;
    constant READ_WIDTH_A_2 : integer := 2;
    constant READ_WIDTH_A_36 : integer := 32;
    constant READ_WIDTH_A_4 : integer := 4;
    constant READ_WIDTH_A_72 : integer := 64;
    constant READ_WIDTH_A_9 : integer := 8;
    constant READ_WIDTH_B_0 : integer := 1;
    constant READ_WIDTH_B_1 : integer := 1;
    constant READ_WIDTH_B_18 : integer := 16;
    constant READ_WIDTH_B_2 : integer := 2;
    constant READ_WIDTH_B_36 : integer := 32;
    constant READ_WIDTH_B_4 : integer := 4;
    constant READ_WIDTH_B_9 : integer := 8;
    constant RSTREG_PRIORITY_A_REGCE : integer := 1;
    constant RSTREG_PRIORITY_A_RSTREG : integer := 0;
    constant RSTREG_PRIORITY_B_REGCE : integer := 1;
    constant RSTREG_PRIORITY_B_RSTREG : integer := 0;
    constant SIM_COLLISION_CHECK_ALL : integer := 0;
    constant SIM_COLLISION_CHECK_GENERATE_X_ONLY : integer := 1;
    constant SIM_COLLISION_CHECK_NONE : integer := 2;
    constant SIM_COLLISION_CHECK_WARNING_ONLY : integer := 3;
    constant SLEEP_ASYNC_FALSE : integer := 0;
    constant SLEEP_ASYNC_TRUE : integer := 1;
    constant WRITE_MODE_A_NO_CHANGE : integer := 0;
    constant WRITE_MODE_A_READ_FIRST : integer := 1;
    constant WRITE_MODE_A_WRITE_FIRST : integer := 2;
    constant WRITE_MODE_B_NO_CHANGE : integer := 0;
    constant WRITE_MODE_B_READ_FIRST : integer := 1;
    constant WRITE_MODE_B_WRITE_FIRST : integer := 2;
    constant WRITE_WIDTH_A_0 : integer := 1;
    constant WRITE_WIDTH_A_1 : integer := 1;
    constant WRITE_WIDTH_A_18 : integer := 16;
    constant WRITE_WIDTH_A_2 : integer := 2;
    constant WRITE_WIDTH_A_36 : integer := 32;
    constant WRITE_WIDTH_A_4  : integer := 4;
    constant WRITE_WIDTH_A_9  : integer := 8;
    constant WRITE_WIDTH_B_0  : integer := 1;
    constant WRITE_WIDTH_B_1  : integer := 1;
    constant WRITE_WIDTH_B_18 : integer := 16;
    constant WRITE_WIDTH_B_2  : integer := 2;
    constant WRITE_WIDTH_B_36 : integer := 32;
    constant WRITE_WIDTH_B_4  : integer := 4;
    constant WRITE_WIDTH_B_72 : integer := 64;
    constant WRITE_WIDTH_B_9  : integer := 8;
    signal CASCADE_ORDER_A_BIN : integer;
    signal CASCADE_ORDER_B_BIN : integer;

    signal CLOCK_DOMAINS_BIN : integer;
    signal DOA_REG_BIN : integer := 0;
    signal DOB_REG_BIN : integer := 0;
    signal ENADDRENA_BIN : integer := 0;
    signal ENADDRENB_BIN : integer := 0;
    signal EN_ECC_PIPE_BIN : integer := 0;
    signal EN_ECC_READ_BIN : integer := 0;
    signal EN_ECC_WRITE_BIN : integer := 0;
    signal RDADDRCHANGEA_BIN : integer;
    signal RDADDRCHANGEB_BIN : integer;
    signal READ_WIDTH_A_BIN : integer := READ_WIDTH_A_0;
    signal READ_WIDTH_B_BIN : integer := READ_WIDTH_B_0;
    signal RSTREG_PRIORITY_A_BIN : integer;
    signal RSTREG_PRIORITY_B_BIN : integer;
    signal SIM_COLLISION_CHECK_BIN : integer;
    signal SLEEP_ASYNC_BIN : integer;
    signal WRITE_MODE_A_BIN : integer;
    signal WRITE_MODE_B_BIN : integer;
    signal WRITE_WIDTH_A_BIN : integer := WRITE_WIDTH_A_0;
    signal WRITE_WIDTH_B_BIN : integer := WRITE_WIDTH_B_0;
    signal t_coll_min : time := 50 ps;
    signal t_coll_max : time := 401 ps; -- 500 - 99
    signal IS_CLKARDCLK_INVERTED_BIN : std_ulogic := '0';
    signal IS_CLKBWRCLK_INVERTED_BIN : std_ulogic := '0';
    signal IS_ENARDEN_INVERTED_BIN : std_ulogic := '0';
    signal IS_ENBWREN_INVERTED_BIN : std_ulogic := '0';
    signal IS_RSTRAMARSTRAM_INVERTED_BIN : std_ulogic := '0';
    signal IS_RSTRAMB_INVERTED_BIN : std_ulogic := '0';
    signal IS_RSTREGARSTREG_INVERTED_BIN : std_ulogic := '0';
    signal IS_RSTREGB_INVERTED_BIN : std_ulogic := '0';

    constant ADDR_WIDTH : integer := 15;
    constant INIT_WIDTH  : integer := 72;
    constant D_WIDTH : integer := 64;
    constant DP_WIDTH : integer := 8;

    constant mem_width : integer := 1;
    constant memp_width : integer := 1;
    constant mem_depth : integer := 32768;
    constant memp_depth : integer := 4096;
    constant encode                          : boolean := true;
    constant decode                          : boolean := false;
    constant max_rd_loops   : integer := D_WIDTH/mem_width;
    constant max_wr_loops   : integer := D_WIDTH/mem_width;

    type mem_t   is array (0 to mem_depth-1) of std_ulogic;
    type memp_t  is array (0 to memp_depth-1) of std_ulogic;
    type init_t  is array (0 to mem_depth/256-1)  of std_logic_vector (255 downto 0);
    type initp_t is array (0 to memp_depth/256-1) of std_logic_vector (255 downto 0);

    -- Convert bit_vector to std_logic_vector
    constant INITP_REG : initp_t := (INITP_00,
                                     INITP_01,
                                     INITP_02,
                                     INITP_03,
                                     INITP_04,
                                     INITP_05,
                                     INITP_06,
                                     INITP_07,
                                     INITP_08,
                                     INITP_09,
                                     INITP_0A,
                                     INITP_0B,
                                     INITP_0C,
                                     INITP_0D,
                                     INITP_0E,
                                     INITP_0F);
  signal INITP_BIN : std_logic_vector(255 downto 0) := (others => '0');
    constant INIT_REG : init_t := (INIT_00,
                                   INIT_01,
                                   INIT_02,
                                   INIT_03,
                                   INIT_04,
                                   INIT_05,
                                   INIT_06,
                                   INIT_07,
                                   INIT_08,
                                   INIT_09,
                                   INIT_0A,
                                   INIT_0B,
                                   INIT_0C,
                                   INIT_0D,
                                   INIT_0E,
                                   INIT_0F,
                                   INIT_10,
                                   INIT_11,
                                   INIT_12,
                                   INIT_13,
                                   INIT_14,
                                   INIT_15,
                                   INIT_16,
                                   INIT_17,
                                   INIT_18,
                                   INIT_19,
                                   INIT_1A,
                                   INIT_1B,
                                   INIT_1C,
                                   INIT_1D,
                                   INIT_1E,
                                   INIT_1F,
                                   INIT_20,
                                   INIT_21,
                                   INIT_22,
                                   INIT_23,
                                   INIT_24,
                                   INIT_25,
                                   INIT_26,
                                   INIT_27,
                                   INIT_28,
                                   INIT_29,
                                   INIT_2A,
                                   INIT_2B,
                                   INIT_2C,
                                   INIT_2D,
                                   INIT_2E,
                                   INIT_2F,
                                   INIT_30,
                                   INIT_31,
                                   INIT_32,
                                   INIT_33,
                                   INIT_34,
                                   INIT_35,
                                   INIT_36,
                                   INIT_37,
                                   INIT_38,
                                   INIT_39,
                                   INIT_3A,
                                   INIT_3B,
                                   INIT_3C,
                                   INIT_3D,
                                   INIT_3E,
                                   INIT_3F,
                                   INIT_40,
                                   INIT_41,
                                   INIT_42,
                                   INIT_43,
                                   INIT_44,
                                   INIT_45,
                                   INIT_46,
                                   INIT_47,
                                   INIT_48,
                                   INIT_49,
                                   INIT_4A,
                                   INIT_4B,
                                   INIT_4C,
                                   INIT_4D,
                                   INIT_4E,
                                   INIT_4F,
                                   INIT_50,
                                   INIT_51,
                                   INIT_52,
                                   INIT_53,
                                   INIT_54,
                                   INIT_55,
                                   INIT_56,
                                   INIT_57,
                                   INIT_58,
                                   INIT_59,
                                   INIT_5A,
                                   INIT_5B,
                                   INIT_5C,
                                   INIT_5D,
                                   INIT_5E,
                                   INIT_5F,
                                   INIT_60,
                                   INIT_61,
                                   INIT_62,
                                   INIT_63,
                                   INIT_64,
                                   INIT_65,
                                   INIT_66,
                                   INIT_67,
                                   INIT_68,
                                   INIT_69,
                                   INIT_6A,
                                   INIT_6B,
                                   INIT_6C,
                                   INIT_6D,
                                   INIT_6E,
                                   INIT_6F,
                                   INIT_70,
                                   INIT_71,
                                   INIT_72,
                                   INIT_73,
                                   INIT_74,
                                   INIT_75,
                                   INIT_76,
                                   INIT_77,
                                   INIT_78,
                                   INIT_79,
                                   INIT_7A,
                                   INIT_7B,
                                   INIT_7C,
                                   INIT_7D,
                                   INIT_7E,
                                   INIT_7F);
    constant INIT_A_BIN : std_logic_vector(35 downto 0) := INIT_A;
    constant INIT_B_BIN : std_logic_vector(35 downto 0) := INIT_B;
    constant SRVAL_A_BIN : std_logic_vector(35 downto 0) := SRVAL_A;
    constant SRVAL_B_BIN : std_logic_vector(35 downto 0) := SRVAL_B;

function GetWidestWidth return integer is
  begin
    if (READ_WIDTH_A = 0 and READ_WIDTH_B = 0) then
      return 1;
    elsif (READ_WIDTH_A >= READ_WIDTH_B) then
      return READ_WIDTH_A;
    else
      return READ_WIDTH_B;
    end if;
  end;

    constant tmp_mem_width : integer := GetWidestWidth;

function GetParityWidth return integer is
  begin
    if (tmp_mem_width < 9) then
      return 0;
    elsif (tmp_mem_width < 18) then
      return 1;
    elsif (tmp_mem_width < 36) then
      return 2;
    elsif (tmp_mem_width < 72) then
      return 4;
    else
      return 8;
    end if;
  end;

    constant tmp_memp_width : integer := GetParityWidth;
    constant tmp_mem_depth : integer := mem_depth / (tmp_mem_width-tmp_memp_width);
    type tmp_mem_t is array (0 to tmp_mem_depth-1) of std_logic_vector(tmp_mem_width-1 downto 0);
     signal tmp_mem_tmp_sig : std_logic_vector(tmp_mem_width-1 downto 0) := (others => '0');
     signal d_sig : integer := 0;
     signal w_sig : integer := 0;
    signal mem       : mem_t;
    signal mem_init  : tmp_mem_t;

function GetHex (
   c : in character
   ) return std_ulogic_vector is
   variable suv : std_ulogic_vector(3 downto 0) := x"0";
begin
  case c is
    when '0'       => suv := x"0";
    when '1'       => suv := x"1";
    when '2'       => suv := x"2";
    when '3'       => suv := x"3";
    when '4'       => suv := x"4";
    when '5'       => suv := x"5";
    when '6'       => suv := x"6";
    when '7'       => suv := x"7";
    when '8'       => suv := x"8";
    when '9'       => suv := x"9";
    when 'A' | 'a' => suv := x"A";
    when 'B' | 'b' => suv := x"B";
    when 'C' | 'c' => suv := x"C";
    when 'D' | 'd' => suv := x"D";
    when 'E' | 'e' => suv := x"E";
    when 'F' | 'f' => suv := x"F";
    when others =>    suv := x"F";
  end case;
  return suv;
end;

impure function read_init_file return tmp_mem_t is
  variable ok : boolean := false;
  variable stat : file_open_status;
  file in_file : text;
  variable l : line;
  variable old_length : integer := 0;
  variable skip : boolean := false;
  variable c : character;
  variable addr_suv : std_ulogic_vector(15 downto 0) := (others => '0');
  variable addr_i : integer := 0;
  variable l_tmp : std_ulogic_vector(tmp_mem_width-1 downto 0) := (others => '0');
  variable tmp_mem : tmp_mem_t;
  variable tmp_suv : std_ulogic_vector (3 downto 0) := (others => '0');
  variable d : integer := 0;
  variable w : integer := 0;
  begin
    file_open(stat, in_file, INIT_FILE, read_mode);
    while not endfile(in_file) loop
      readline(in_file, l);
      while (l /= null and l'length > 0) loop
        if ((l(l'low) = ' ') or (l(l'low) = CR) or (l(l'low) = HT)) then
          while (l'length > 0 and ((l(l'low) = ' ') or (l(l'low) = CR) or (l(l'low) = HT))) loop
            READ(l, c); -- skip white space
          end loop;
        elsif (l'length > 1 and l(l'low to l'low + 1) = "//") then
          deallocate(l);
        elsif (l'length > 1 and (l(l'low to l'low + 1) = "/*") and (l(l'high-1 to l'high) = "*/")) then
          deallocate(l);
        elsif (l'length > 1 and l(l'low to l'low + 1) = "/*") then
          deallocate(l);
          skip := true;
        elsif (skip = true and l'length > 1 and l(l'high-1 to l'high) = "*/") then
          deallocate(l);
          skip := false;
        elsif (skip = true) then
          deallocate(l);
        elsif (l(l'low) = '@') then
          READ(l, c); -- read the @
          old_length := l'length;
          addr_suv := (others => '0');
          loop -- skip any white space
            READ(l, c);
            exit when ((c /= ' ') and (c /= CR) and (c /= HT));
          end loop;
          while ((c /= ' ') and (c /= CR) and (c /= HT)) loop -- read digits
            tmp_suv := GetHex(c);
            addr_suv := addr_suv(11 downto 0) & tmp_suv;
            exit when l'length = 0;
            READ(l, c, ok);
          end loop;
          addr_i := SLV_TO_INT(std_logic_vector(addr_suv));
          if (not ok) then
            deallocate(l);
          end if;
        else
          l_tmp := (others => '0');
          loop -- skip any white space
            READ(l, c);
            exit when ((c /= ' ') and (c /= CR) and (c /= HT));
          end loop;
          while ((c /= ' ') and (c /= CR) and (c /= HT)) loop -- read digits
            tmp_suv := GetHex(c);
            if (tmp_mem_width >= 9) then
              l_tmp := l_tmp(tmp_mem_width-5 downto 0) & tmp_suv;
            else
              l_tmp := tmp_suv(tmp_mem_width-1 downto 0);
            end if;
            exit when l'length = 0;
            READ(l, c, ok);
          end loop;
          tmp_mem(addr_i) := std_logic_vector(l_tmp);
          addr_i := addr_i + 1;
          if (not ok) then
            deallocate(l);
          end if;
        end if;
      end loop;
    end loop;
    return tmp_mem;
  end;

function bit_or (
   slv_in : in std_logic_vector
   ) return std_ulogic is
   variable bit_or : std_ulogic := '0';
begin
   for bo in 0 to slv_in'length-1 loop
     if (slv_in(bo) = '1') then
       bit_or := '1';
       exit;
     end if;
   end loop;
   return bit_or;
end;

function set_mask (
   lmax  : in integer;
   loops : in integer
   ) return std_logic_vector is
   variable mask : std_logic_vector(lmax+loops-1 downto 0) := (others=> '0');
begin
   mask := (std_logic_vector(to_signed(0, lmax)) &
            std_logic_vector(to_signed(-1, loops)));
   return mask(lmax-1 downto 0);
end;
    
function fn_ecc (
   encode : in boolean;
   d_i : in std_logic_vector(63 downto 0);
   dp_i : in std_logic_vector(7 downto 0)
   ) return std_logic_vector is
   variable ecc_7 : std_ulogic;
   variable fn_ecc : std_logic_vector(7 downto 0);
begin
   fn_ecc(0) := d_i(0)  xor d_i(1)  xor d_i(3)  xor d_i(4)  xor d_i(6)  xor
                d_i(8)  xor d_i(10) xor d_i(11) xor d_i(13) xor d_i(15) xor
                d_i(17) xor d_i(19) xor d_i(21) xor d_i(23) xor d_i(25) xor
                d_i(26) xor d_i(28) xor d_i(30) xor d_i(32) xor d_i(34) xor
                d_i(36) xor d_i(38) xor d_i(40) xor d_i(42) xor d_i(44) xor
                d_i(46) xor d_i(48) xor d_i(50) xor d_i(52) xor d_i(54) xor
                d_i(56) xor d_i(57) xor d_i(59) xor d_i(61) xor d_i(63);

   fn_ecc(1) := d_i(0)  xor d_i(2)  xor d_i(3)  xor d_i(5)  xor d_i(6)  xor
                d_i(9)  xor d_i(10) xor d_i(12) xor d_i(13) xor d_i(16) xor
                d_i(17) xor d_i(20) xor d_i(21) xor d_i(24) xor d_i(25) xor
                d_i(27) xor d_i(28) xor d_i(31) xor d_i(32) xor d_i(35) xor
                d_i(36) xor d_i(39) xor d_i(40) xor d_i(43) xor d_i(44) xor
                d_i(47) xor d_i(48) xor d_i(51) xor d_i(52) xor d_i(55) xor
                d_i(56) xor d_i(58) xor d_i(59) xor d_i(62) xor d_i(63);

   fn_ecc(2) := d_i(1)  xor d_i(2)  xor d_i(3)  xor d_i(7)  xor d_i(8)  xor
                d_i(9)  xor d_i(10) xor d_i(14) xor d_i(15) xor d_i(16) xor
                d_i(17) xor d_i(22) xor d_i(23) xor d_i(24) xor d_i(25) xor
                d_i(29) xor d_i(30) xor d_i(31) xor d_i(32) xor d_i(37) xor
                d_i(38) xor d_i(39) xor d_i(40) xor d_i(45) xor d_i(46) xor
                d_i(47) xor d_i(48) xor d_i(53) xor d_i(54) xor d_i(55) xor
                d_i(56) xor d_i(60) xor d_i(61) xor d_i(62) xor d_i(63);

   fn_ecc(3) := d_i(4)  xor d_i(5)  xor d_i(6)  xor d_i(7)  xor d_i(8)  xor
                d_i(9)  xor d_i(10) xor d_i(18) xor d_i(19) xor d_i(20) xor
                d_i(21) xor d_i(22) xor d_i(23) xor d_i(24) xor d_i(25) xor
                d_i(33) xor d_i(34) xor d_i(35) xor d_i(36) xor d_i(37) xor
                d_i(38) xor d_i(39) xor d_i(40) xor d_i(49) xor d_i(50) xor
                d_i(51) xor d_i(52) xor d_i(53) xor d_i(54) xor d_i(55) xor
                d_i(56);

   fn_ecc(4) := d_i(11) xor d_i(12) xor d_i(13) xor d_i(14) xor d_i(15) xor
                d_i(16) xor d_i(17) xor d_i(18) xor d_i(19) xor d_i(20) xor
                d_i(21) xor d_i(22) xor d_i(23) xor d_i(24) xor d_i(25) xor
                d_i(41) xor d_i(42) xor d_i(43) xor d_i(44) xor d_i(45) xor
                d_i(46) xor d_i(47) xor d_i(48) xor d_i(49) xor d_i(50) xor
                d_i(51) xor d_i(52) xor d_i(53) xor d_i(54) xor d_i(55) xor
                d_i(56);

   fn_ecc(5) := d_i(26) xor d_i(27) xor d_i(28) xor d_i(29) xor d_i(30) xor
                d_i(31) xor d_i(32) xor d_i(33) xor d_i(34) xor d_i(35) xor
                d_i(36) xor d_i(37) xor d_i(38) xor d_i(39) xor d_i(40) xor
                d_i(41) xor d_i(42) xor d_i(43) xor d_i(44) xor d_i(45) xor
                d_i(46) xor d_i(47) xor d_i(48) xor d_i(49) xor d_i(50) xor
                d_i(51) xor d_i(52) xor d_i(53) xor d_i(54) xor d_i(55) xor
                d_i(56);

   fn_ecc(6) := d_i(57) xor d_i(58) xor d_i(59) xor d_i(60) xor d_i(61) xor
                d_i(62) xor d_i(63);

   ecc_7 := d_i(0)  xor d_i(1)  xor d_i(2)  xor d_i(3)  xor d_i(4)  xor
            d_i(5)  xor d_i(6)  xor d_i(7)  xor d_i(8)  xor d_i(9)  xor
            d_i(10) xor d_i(11) xor d_i(12) xor d_i(13) xor d_i(14) xor
            d_i(15) xor d_i(16) xor d_i(17) xor d_i(18) xor d_i(19) xor
            d_i(20) xor d_i(21) xor d_i(22) xor d_i(23) xor d_i(24) xor
            d_i(25) xor d_i(26) xor d_i(27) xor d_i(28) xor d_i(29) xor
            d_i(30) xor d_i(31) xor d_i(32) xor d_i(33) xor d_i(34) xor
            d_i(35) xor d_i(36) xor d_i(37) xor d_i(38) xor d_i(39) xor
            d_i(40) xor d_i(41) xor d_i(42) xor d_i(43) xor d_i(44) xor
            d_i(45) xor d_i(46) xor d_i(47) xor d_i(48) xor d_i(49) xor
            d_i(50) xor d_i(51) xor d_i(52) xor d_i(53) xor d_i(54) xor
            d_i(55) xor d_i(56) xor d_i(57) xor d_i(58) xor d_i(59) xor
            d_i(60) xor d_i(61) xor d_i(62) xor d_i(63);

   if (encode) then 
      fn_ecc(7) := ecc_7 xor
                   fn_ecc(0) xor fn_ecc(1) xor fn_ecc(2) xor fn_ecc(3) xor
                   fn_ecc(4) xor fn_ecc(5) xor fn_ecc(6);
   else
      fn_ecc(7) := ecc_7 xor
                   dp_i(0) xor dp_i(1) xor dp_i(2) xor dp_i(3) xor
                   dp_i(4) xor dp_i(5) xor dp_i(6);
   end if;

   return fn_ecc;

end;

function fn_cor_bit (
   error_bit : in integer;
   d_i : in std_logic_vector (63 downto 0);
   dp_i : in std_logic_vector (7 downto 0)
   ) return std_logic_vector is
   variable correct_int : std_logic_vector (71 downto 0);
   variable correct_bit : std_logic_vector (71 downto 0);
begin
   correct_int := (d_i(63 downto 57) & dp_i(6) & d_i(56 downto 26) & dp_i(5)  &
                   d_i(25 downto 11) & dp_i(4) & d_i(10 downto 4)  & dp_i(3)  &
                   d_i(3 downto 1)   & dp_i(2) & d_i(0)    & dp_i(1 downto 0) &
                   dp_i(7));
   if (error_bit <= 71) then
      correct_int(error_bit) := not correct_int(error_bit);
   end if;
   correct_bit := correct_int(0)  & correct_int(64) & correct_int(32)   &
                  correct_int(16) & correct_int(8)  & correct_int(4)    &
                  correct_int(2 downto 1)   & correct_int(71 downto 65) &
                  correct_int(63 downto 33) & correct_int(31 downto 17) &
                  correct_int(15 downto 9)  & correct_int(7 downto 5)   &
                  correct_int(3);
   return correct_bit;
end;

    signal glblGSR : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    signal CASDOUTA_out : std_logic_vector(31 downto 0);
    signal CASDOUTB_out : std_logic_vector(31 downto 0);
    signal CASDOUTPA_out : std_logic_vector(3 downto 0);
    signal CASDOUTPB_out : std_logic_vector(3 downto 0);
    signal CASOUTDBITERR_out : std_ulogic;
    signal CASOUTSBITERR_out : std_ulogic;
    signal DBITERR_out : std_ulogic;
    signal DOUTADOUT_out : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal DOUTBDOUT_out : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal DOUTPADOUTP_out : std_logic_vector(DP_WIDTH/2-1 downto 0);
    signal DOUTPBDOUTP_out : std_logic_vector(DP_WIDTH/2-1 downto 0);
    signal ECCPARITY_out : std_logic_vector(7 downto 0);
    signal RDADDRECC_out : std_logic_vector(8 downto 0) := (others => '0');
    signal SBITERR_out : std_ulogic;
    
    
    signal ADDRARDADDR_in : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal ADDRBWRADDR_in : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal ADDRENA_in : std_ulogic;
    signal ADDRENB_in : std_ulogic;
    signal CASDIMUXA_in : std_ulogic;
    signal CASDIMUXB_in : std_ulogic;
    signal CASDINA_in : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal CASDINB_in : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal CASDINPA_in : std_logic_vector(DP_WIDTH/2-1 downto 0);
    signal CASDINPB_in : std_logic_vector(DP_WIDTH/2-1 downto 0);
    signal CASDOMUXA_in : std_ulogic;
    signal CASDOMUXB_in : std_ulogic;
    signal CASDOMUXEN_A_in : std_ulogic;
    signal CASDOMUXEN_B_in : std_ulogic;
    signal CASINDBITERR_in : std_ulogic;
    signal CASINSBITERR_in : std_ulogic;
    signal CASOREGIMUXA_in : std_ulogic;
    signal CASOREGIMUXB_in : std_ulogic;
    signal CASOREGIMUXEN_A_in : std_ulogic;
    signal CASOREGIMUXEN_B_in : std_ulogic;
    signal CLKARDCLK_in : std_ulogic;
    signal CLKBWRCLK_in : std_ulogic;
    signal DINADIN_in : std_logic_vector(31 downto 0);
    signal DINBDIN_in : std_logic_vector(31 downto 0);
    signal DINPADINP_in : std_logic_vector(3 downto 0);
    signal DINPBDINP_in : std_logic_vector(3 downto 0);
    signal ECCPIPECE_in : std_ulogic;
    signal ENARDEN_in : std_ulogic;
    signal ENBWREN_in : std_ulogic;
    signal INJECTDBITERR_in : std_ulogic;
    signal INJECTSBITERR_in : std_ulogic;
    signal REGCEAREGCE_in : std_ulogic;
    signal REGCEB_in : std_ulogic;
    signal RSTRAMARSTRAM_in : std_ulogic;
    signal RSTRAMB_in : std_ulogic;
    signal RSTREGARSTREG_in : std_ulogic;
    signal RSTREGB_in : std_ulogic;
    signal SLEEP_in : std_ulogic;
    signal WEA_in : std_logic_vector(3 downto 0);
    signal WEBWE_in : std_logic_vector(7 downto 0);
    
-- internal variables, signals, busses
    signal i              : integer := 0;
    signal j              : integer := 0;
    signal k              : integer := 0;
    signal ra             : integer := 0;
    signal raa            : integer := 0;
    signal wb             : integer := 0;
    signal rb             : integer := 0;
    signal rbb            : integer := 0;
    signal wa             : integer := 0;
    signal rd_loops_a     : integer := 1;
    signal wr_loops_a     : integer := 1;
    signal rd_loops_b     : integer := 1;
    signal wr_loops_b     : integer := 1;
    signal INIT_MEM : std_ulogic := '0';
    signal WREN_ecc       : std_ulogic;
    signal SLEEP_A_int  : std_ulogic;
    signal SLEEP_A_reg  : std_logic_vector (1 downto 0) := "00";
    signal SLEEP_B_int  : std_ulogic;
    signal SLEEP_B_reg  : std_logic_vector (1 downto 0) := "00";
    signal RSTREG_A_int     : std_ulogic;
    signal REGCE_A_int      : std_ulogic;
    signal RSTREG_B_int     : std_ulogic;
    signal REGCE_B_int      : std_ulogic;
    signal CASDOMUXA_reg    : std_ulogic:= '0';
    signal CASOREGIMUXA_reg : std_ulogic:= '0';
    signal CASDOMUXB_reg    : std_ulogic:= '0';
    signal CASOREGIMUXB_reg : std_ulogic:= '0';
    signal CASDOMUXB_int    : std_ulogic;
    signal error_bit      : integer  := 0;
    signal eccparity_reg  : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal INIT_A_int  : std_logic_vector (INIT_WIDTH-1 downto 0);
    signal SRVAL_A_int : std_logic_vector (INIT_WIDTH-1 downto 0);
    signal INIT_B_int  : std_logic_vector (INIT_WIDTH/2-1 downto 0);
    signal SRVAL_B_int : std_logic_vector (INIT_WIDTH/2-1 downto 0);

    signal mem_wr_clk_a : std_ulogic;
    signal mem_wr_en_a  : std_ulogic;
    signal mem_wr_en_a_wf  : std_ulogic := '0';
    signal mem_we_a   : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal memp_we_a  : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal mem_rm_doutb_x  : std_logic_vector (D_WIDTH/2-1 downto 0) := (others => 'X');
    signal memp_rm_doutb_x : std_logic_vector (DP_WIDTH/2-1 downto 0) := (others => 'X');
    signal mem_rm_doutb  : std_logic_vector (D_WIDTH/2-1 downto 0);
    signal memp_rm_doutb : std_logic_vector (DP_WIDTH/2-1 downto 0);
    signal mem_rm_a   : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal memp_rm_a   : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal mem_rm_b   : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal memp_rm_b   : std_logic_vector (DP_WIDTH/2-1 downto 0) := (others => '0');
    signal mem_wm_a   : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal mem_wm_b   : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal wr_data_matches : std_ulogic := '0';
    signal wr_a_data_matches_rd_b_data : std_ulogic := '0';
    signal wr_b_data_matches_rd_a_data : std_ulogic := '0';
    signal mem_wr_clk_b : std_ulogic;
    signal mem_wr_en_b : std_ulogic;
    signal mem_wr_en_b_wf : std_ulogic := '0';
    signal mem_we_b   : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal memp_we_b   : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal mem_rm_douta_x  : std_logic_vector (D_WIDTH-1 downto 0) := (others => 'X');
    signal memp_rm_douta_x : std_logic_vector (DP_WIDTH-1 downto 0) := (others => 'X');
    signal mem_rm_douta  : std_logic_vector (D_WIDTH-1 downto 0);
    signal memp_rm_douta : std_logic_vector (DP_WIDTH-1 downto 0);
    signal mem_rd_clk_a : std_ulogic;
    signal mem_rd_en_a : std_ulogic;
    signal mem_rst_a : std_ulogic;
    signal first_read : std_ulogic := '0';
    signal mem_rd_clk_b : std_ulogic;
    signal mem_rd_en_b : std_ulogic;
    signal mem_rst_b : std_ulogic;
    signal mem_wr_a    : std_logic_vector(D_WIDTH-1 downto 0) := (others => '0');
    signal wr_a_event  : std_ulogic := '0';
    signal mem_rd_a    : std_logic_vector(D_WIDTH-1 downto 0);
    signal mem_rd_a_rf : std_logic_vector(D_WIDTH-1 downto 0);
    signal mem_rd_a_wf : std_logic_vector(D_WIDTH-1 downto 0);
    signal mem_wr_b    : std_logic_vector(D_WIDTH-1 downto 0) := (others => '0');
    signal wr_b_event  : std_ulogic := '0';
    signal mem_rd_b    : std_logic_vector(D_WIDTH-1 downto 0);
    signal mem_rd_b_rf : std_logic_vector(D_WIDTH-1 downto 0);
    signal mem_rd_b_wf : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal mem_a_reg     : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal mem_a_reg_mux : std_logic_vector (D_WIDTH-1 downto 0);
    signal mem_a_mux     : std_logic_vector (D_WIDTH-1 downto 0);
    signal mem_a_lat     : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal mem_a_out     : std_logic_vector (D_WIDTH-1 downto 0);
    signal mem_a_pipe  : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal mem_b_reg     : std_logic_vector (D_WIDTH/2-1 downto 0) := (others => '0');
    signal mem_b_reg_mux : std_logic_vector (D_WIDTH/2-1 downto 0);
    signal mem_b_mux     : std_logic_vector (D_WIDTH/2-1 downto 0);
    signal mem_b_lat     : std_logic_vector (D_WIDTH/2-1 downto 0) := (others => '0');
    signal mem_b_out     : std_logic_vector (D_WIDTH/2-1 downto 0);
    signal memp      : memp_t;
    signal memp_wr_a    : std_logic_vector(DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_rd_a    : std_logic_vector(DP_WIDTH-1 downto 0);
    signal memp_rd_a_rf : std_logic_vector(DP_WIDTH-1 downto 0);
    signal memp_rd_a_wf : std_logic_vector(DP_WIDTH-1 downto 0);
    signal memp_wr_b    : std_logic_vector(DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_rd_b    : std_logic_vector(DP_WIDTH-1 downto 0);
    signal memp_rd_b_rf : std_logic_vector(DP_WIDTH-1 downto 0);
    signal memp_rd_b_wf : std_logic_vector(DP_WIDTH/2-1 downto 0);
    signal memp_a_reg     : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_a_reg_mux : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_a_mux     : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_a_lat     : std_logic_vector (DP_WIDTH-1 downto 0);
    signal memp_a_out     : std_logic_vector (DP_WIDTH-1 downto 0);
    signal memp_a_pipe  : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_b_reg     : std_logic_vector (DP_WIDTH/2-1 downto 0) := (others => '0');
    signal memp_b_reg_mux : std_logic_vector (DP_WIDTH/2-1 downto 0) := (others => '0');
    signal memp_b_mux     : std_logic_vector (DP_WIDTH/2-1 downto 0) := (others => '0');
    signal memp_b_lat     : std_logic_vector (DP_WIDTH/2-1 downto 0);
    signal memp_b_out     : std_logic_vector (DP_WIDTH/2-1 downto 0);
    signal dbit_int     : std_ulogic;
    signal sbit_int     : std_ulogic;
    signal dbit_ecc     : std_ulogic;
    signal sbit_ecc     : std_ulogic;
    signal dbit_lat     : std_ulogic := '0';
    signal sbit_lat     : std_ulogic := '0';
    signal dbit_pipe    : std_ulogic := '0';
    signal sbit_pipe    : std_ulogic := '0';
    signal dbit_reg     : std_ulogic := '0';
    signal sbit_reg     : std_ulogic := '0';
    signal r_a_ecc_int  : std_logic_vector (8 downto 0);
    signal r_a_ecc_ecc  : std_logic_vector (8 downto 0);
    signal r_a_ecc_lat  : std_logic_vector (8 downto 0) := (others => '0');
    signal r_a_ecc_pipe : std_logic_vector (8 downto 0) := (others => '0');
    signal r_a_ecc_reg  : std_logic_vector (8 downto 0) := (others => '0');
    signal mem_a_ecc      : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal mem_a_ecc_cor  : std_logic_vector (D_WIDTH-1 downto 0) := (others => '0');
    signal mem_a_ecc_res  : std_logic_vector (D_WIDTH+DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_a_ecc     : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal memp_a_ecc_cor : std_logic_vector (DP_WIDTH-1 downto 0) := (others => '0');
    signal rd_addr_a_mask    : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '1');
    signal rd_addr_b_mask    : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '1');
    signal wr_addr_a_mask    : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '1');
    signal wr_addr_b_mask    : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '1');
    signal rd_addr_a_slv     : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal rd_addr_b_slv     : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal wr_addr_a_slv     : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal wr_addr_b_slv     : std_logic_vector (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal rd_addr_a         : unsigned (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal rd_addr_b         : unsigned (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal wr_addr_a         : unsigned (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal wr_addr_b         : unsigned (ADDR_WIDTH-1 downto 0) := (others => '0');
    signal wr_a_rd_b_addr_coll : std_ulogic := '0';
    signal wr_addr_coll        : std_ulogic := '0';
    signal wr_b_rd_a_addr_coll : std_ulogic := '0';

-- ecc variables
     signal synd_wr      : std_logic_vector (7 downto 0) := (others => '0') ;
     signal synd_rd      : std_logic_vector (7 downto 0) := (others => '0') ;
     signal synd_ecc_raw : std_logic_vector (7 downto 0) := (others => '0') ;
     signal synd_ecc     : unsigned (6 downto 0)         := (others => '0') ;

    signal sdp_mode     : std_ulogic := '0';
    signal sdp_mode_wr  : std_ulogic := '0';
    signal sdp_mode_rd  : std_ulogic := '0';

   signal t_max_a : integer := 3000;
   signal t_max_b : integer := 3000;
   signal clka_done : std_ulogic := '0';
   signal clkb_done : std_ulogic := '0';
   signal clka_toggled : std_ulogic := '0';
   signal clkb_toggled : std_ulogic := '0';
   signal clka_timeout : std_ulogic := '1';
   signal clkb_timeout : std_ulogic := '1';
   signal clks_done : std_ulogic := '0';
   signal en_clk_sync : std_ulogic := '0';
   signal INIT_A_BIN_8_8     : std_logic_vector (7 downto 0) := (others => '0');
   signal INIT_A_BIN_7_0_8   : std_logic_vector (63 downto 0) := (others => '0');
   signal INIT_A_BIN_17_16_4 : std_logic_vector (7 downto 0) := (others => '0');
   signal INIT_A_BIN_15_0_4  : std_logic_vector (63 downto 0) := (others => '0');
   signal INIT_A_BIN_35_32_2 : std_logic_vector (7 downto 0) := (others => '0');
   signal INIT_A_BIN_31_0_2  : std_logic_vector (63 downto 0) := (others => '0');
   signal INIT_B_BIN_8_4     : std_logic_vector (3 downto 0) := (others => '0');
   signal INIT_B_BIN_7_0_4   : std_logic_vector (31 downto 0) := (others => '0');
   signal INIT_B_BIN_17_16_2 : std_logic_vector (3 downto 0) := (others => '0');
   signal INIT_B_BIN_15_0_2 : std_logic_vector (31 downto 0) := (others => '0');
   signal INIT_B_BIN_35_32_2 : std_logic_vector (7 downto 0) := (others => '0');
   signal INIT_B_BIN_31_0_2  : std_logic_vector (63 downto 0) := (others => '0');
   signal INIT_BA_BIN_35_32 : std_logic_vector (7 downto 0) := (others => '0');
   signal INIT_BA_BIN_31_0  : std_logic_vector (63 downto 0) := (others => '0');
   signal SRVAL_A_BIN_8_8     : std_logic_vector (7 downto 0) := (others => '0');
   signal SRVAL_A_BIN_7_0_8   : std_logic_vector (63 downto 0) := (others => '0');
   signal SRVAL_A_BIN_17_16_4 : std_logic_vector (7 downto 0) := (others => '0');
   signal SRVAL_A_BIN_15_0_4  : std_logic_vector (63 downto 0) := (others => '0');
   signal SRVAL_A_BIN_35_32_2 : std_logic_vector (7 downto 0) := (others => '0');
   signal SRVAL_A_BIN_31_0_2  : std_logic_vector (63 downto 0) := (others => '0');
   signal SRVAL_B_BIN_8_4   : std_logic_vector (3 downto 0) := (others => '0');
   signal SRVAL_B_BIN_7_0_4 : std_logic_vector (31 downto 0) := (others => '0');
   signal SRVAL_B_BIN_17_16_2 : std_logic_vector (3 downto 0) := (others => '0');
   signal SRVAL_B_BIN_15_0_2 : std_logic_vector (31 downto 0) := (others => '0');
   signal SRVAL_B_BIN_35_32_2 : std_logic_vector (7 downto 0) := (others => '0');
   signal SRVAL_B_BIN_31_0_2  : std_logic_vector (63 downto 0) := (others => '0');
   signal SRVAL_BA_BIN_35_32 : std_logic_vector (7 downto 0) := (others => '0');
   signal SRVAL_BA_BIN_31_0  : std_logic_vector (63 downto 0) := (others => '0');
-- collison detection signals
   signal coll_win_wr_clk_a_min : std_ulogic;
   signal coll_win_wr_clk_b_min : std_ulogic;
   signal coll_win_rd_clk_a_min : std_ulogic;
   signal coll_win_rd_clk_b_min : std_ulogic;
   signal coll_win_wr_clk_a_ind_min : std_ulogic := '0';
   signal coll_win_wr_clk_b_ind_min : std_ulogic := '0';
   signal coll_win_rd_clk_a_ind_min : std_ulogic := '0';
   signal coll_win_rd_clk_b_ind_min : std_ulogic := '0';
   signal coll_win_wr_clk_a_max : std_ulogic := '0';
   signal coll_win_wr_clk_b_max : std_ulogic := '0';
   signal coll_win_rd_clk_a_max : std_ulogic := '0';
   signal coll_win_rd_clk_b_max : std_ulogic := '0';
   signal mem_wr_clk_a_coll : std_ulogic;
   signal mem_wr_clk_b_coll : std_ulogic;
   signal mem_rd_clk_a_coll : std_ulogic;
   signal mem_rd_clk_b_coll : std_ulogic;
   signal mem_wr_clk_a_chck : std_ulogic;
   signal mem_wr_clk_b_chck : std_ulogic;
   signal mem_rd_clk_a_chck : std_ulogic;
   signal mem_rd_clk_b_chck : std_ulogic;
   signal wr_b_wr_a_coll : std_ulogic := '0';
   signal wr_b_rd_a_coll : std_ulogic := '0';
   signal rd_b_wr_a_coll : std_ulogic := '0';
   signal wr_a_wr_b_coll : std_ulogic := '0';
   signal wr_a_rd_b_coll : std_ulogic := '0';
   signal rd_a_wr_b_coll : std_ulogic := '0';

   signal coll_wr_sim : std_ulogic;
   signal coll_wr_b_wr_a : std_ulogic;
   signal coll_wr_b_rd_a_sim : std_ulogic;
   signal coll_wr_b_rd_a : std_ulogic;
   signal coll_rd_b_wr_a : std_ulogic;
   signal coll_wr_a_wr_b : std_ulogic;
   signal coll_wr_a_rd_b_sim : std_ulogic;
   signal coll_wr_a_rd_b : std_ulogic;
   signal coll_rd_a_wr_b : std_ulogic;

   signal wawb : unsigned (5 downto 0) := (others => '0');
   signal warb : unsigned (5 downto 0) := (others => '0');
   signal wbra : unsigned (5 downto 0) := (others => '0');
   signal bit_err_pat : std_logic_vector (35 downto 0) := (others => '0');

    begin
-- input output assignments
    glblGSR     <= TO_X01(GSR);

    CASDOUTA <= CASDOUTA_out;
    CASDOUTB <= CASDOUTB_out;
    CASDOUTPA <= CASDOUTPA_out;
    CASDOUTPB <= CASDOUTPB_out;
    CASOUTDBITERR <= CASOUTDBITERR_out;
    CASOUTSBITERR <= CASOUTSBITERR_out;
    DBITERR     <= DBITERR_out;
    DOUTADOUT <= DOUTADOUT_out;
    DOUTBDOUT <= DOUTBDOUT_out;
    DOUTPADOUTP <= DOUTPADOUTP_out;
    DOUTPBDOUTP <= DOUTPBDOUTP_out;
    ECCPARITY   <= ECCPARITY_out;
    RDADDRECC <= RDADDRECC_out;
    SBITERR     <= SBITERR_out;
    
    
--    ADDRARDADDR_in <= ADDRARDADDR;
--    ADDRBWRADDR_in <= ADDRBWRADDR;
    ADDRARDADDR_in <= ADDRARDADDR when ADDR_IS_VALID(ADDRARDADDR) else (others => '0');
    ADDRBWRADDR_in <= ADDRBWRADDR when ADDR_IS_VALID(ADDRBWRADDR) else (others => '0');
    ADDRENA_in <= ADDRENA when ENADDRENA_BIN = ENADDRENA_TRUE else '1';
    ADDRENB_in <= ADDRENB when ENADDRENB_BIN = ENADDRENB_TRUE else '1';
    CASDIMUXA_in <= CASDIMUXA;
    CASDIMUXB_in <= CASDIMUXB;
    CASDINA_in <= CASDINA;
    CASDINB_in <= CASDINB;
    CASDINPA_in <= CASDINPA;
    CASDINPB_in <= CASDINPB;
    CASDOMUXA_in <= CASDOMUXA;
    CASDOMUXB_in <= CASDOMUXB;
    CASDOMUXEN_A_in <= CASDOMUXEN_A;
    CASDOMUXEN_B_in <= CASDOMUXEN_B;
    CASINDBITERR_in <= CASINDBITERR;
    CASINSBITERR_in <= CASINSBITERR;
    CASOREGIMUXA_in <= CASOREGIMUXA;
    CASOREGIMUXB_in <= CASOREGIMUXB;
    CASOREGIMUXEN_A_in <= CASOREGIMUXEN_A;
    CASOREGIMUXEN_B_in <= CASOREGIMUXEN_B;
    CLKARDCLK_in <= CLKARDCLK xor IS_CLKARDCLK_INVERTED_BIN when
                    ((CLOCK_DOMAINS_BIN = CLOCK_DOMAINS_INDEPENDENT) or 
                     (en_clk_sync = '0') or (clkb_toggled = '0')) else
                    CLKBWRCLK xor IS_CLKBWRCLK_INVERTED_BIN;
    CLKBWRCLK_in <= CLKBWRCLK xor IS_CLKBWRCLK_INVERTED_BIN when
                    ((CLOCK_DOMAINS_BIN = CLOCK_DOMAINS_INDEPENDENT) or
                     (en_clk_sync = '0') or (clkb_toggled = '1') or (clka_done = '0')) else
                    CLKARDCLK xor IS_CLKARDCLK_INVERTED_BIN;
    DINPADINP_in <= CASDINPA when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                    (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and CASDIMUXA_in = '1') else
                    DINPADINP;
    DINADIN_in  <=  CASDINA  when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                    (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and CASDIMUXA_in = '1') else
                    DINADIN;
    DINPBDINP_in <= CASDINPB when (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
                    (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) and CASDIMUXB_in = '1') else
                    DINPBDINP;
    DINBDIN_in  <=  CASDINB  when (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
                    (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) and CASDIMUXB_in = '1') else
                    DINBDIN;
    ECCPIPECE_in <= ECCPIPECE;
    ENARDEN_in <= ENARDEN xor IS_ENARDEN_INVERTED_BIN;
    ENBWREN_in <= ENBWREN xor IS_ENBWREN_INVERTED_BIN;
    INJECTDBITERR_in <= '0' when (EN_ECC_WRITE_BIN = EN_ECC_WRITE_FALSE) else
                        INJECTDBITERR;
    INJECTSBITERR_in <= '0' when (EN_ECC_WRITE_BIN = EN_ECC_WRITE_FALSE) else
                        INJECTSBITERR or INJECTDBITERR;
    REGCEAREGCE_in <= REGCEAREGCE;
    REGCEB_in <= REGCEB;
    RSTRAMARSTRAM_in <= RSTRAMARSTRAM xor IS_RSTRAMARSTRAM_INVERTED_BIN;
    RSTRAMB_in <= RSTRAMB xor IS_RSTRAMB_INVERTED_BIN;
    RSTREGARSTREG_in <= RSTREGARSTREG xor IS_RSTREGARSTREG_INVERTED_BIN;
    RSTREGB_in <= RSTREGB xor IS_RSTREGB_INVERTED_BIN;
    SLEEP_in <= SLEEP;
    WEA_in <= WEA;
    WEBWE_in <= WEBWE;

  mem_rd_clk_a <= CLKARDCLK_in;
  mem_rd_clk_b <= '0' when sdp_mode = '1' else CLKBWRCLK_in;
  mem_wr_clk_a <= '0' when sdp_mode = '1' else CLKARDCLK_in;
  mem_wr_clk_b <= CLKBWRCLK_in;
  mem_rst_a <= RSTRAMARSTRAM_in;
  mem_rst_b <= RSTRAMARSTRAM_in when sdp_mode = '1' else
               RSTRAMB_in;
  bit_err_pat <= X"400000004" when INJECTDBITERR_in = '1' else
                 X"000000004" when INJECTSBITERR_in = '1' else
                 X"000000000";
  mem_wr_a <= X"00000000" & DINADIN_in;
  mem_wr_b <= X"00000000" & DINBDIN_in when (WRITE_WIDTH_B_BIN /= WRITE_WIDTH_B_72) else
              (DINBDIN_in & DINADIN_in) xor (bit_err_pat & X"0000000");

  memp_wr_a <= X"0" & DINPADINP_in;
  memp_wr_b <= synd_wr when (EN_ECC_WRITE_BIN = EN_ECC_WRITE_TRUE) else
               X"0" & DINPBDINP_in when (WRITE_WIDTH_B_BIN /= WRITE_WIDTH_B_72) else
              (DINPBDINP_in & DINPADINP_in);

  mem_wr_en_a  <= '0' when sdp_mode ='1' else
                  ENARDEN_in and (bit_or(WEA_in));
  mem_rd_en_a  <= ENARDEN_in when (WRITE_MODE_A_BIN /= WRITE_MODE_A_NO_CHANGE) else
                  ENARDEN_in and (not mem_wr_en_a or mem_rst_a);
  mem_wr_en_b  <= ENBWREN_in and (bit_or(WEBWE_in)) when sdp_mode = '1' else
                  ENBWREN_in and (bit_or(WEBWE_in(DP_WIDTH/2-1 downto 0)));
  mem_rd_en_b  <= '0' when sdp_mode ='1' else
                  ENBWREN_in when (WRITE_MODE_B_BIN /= WRITE_MODE_B_NO_CHANGE) else
                  ENBWREN_in and (not mem_wr_en_b or mem_rst_b);
  CLOCK_DOMAINS_BIN <= 
    CLOCK_DOMAINS_INDEPENDENT when (CLOCK_DOMAINS = "INDEPENDENT") else
    CLOCK_DOMAINS_COMMON when (CLOCK_DOMAINS = "COMMON") else
    CLOCK_DOMAINS_INDEPENDENT;

  EN_ECC_PIPE_BIN <= 
    EN_ECC_PIPE_FALSE when (EN_ECC_PIPE = "FALSE") else
    EN_ECC_PIPE_TRUE when (EN_ECC_PIPE = "TRUE") else
    EN_ECC_PIPE_FALSE;

  EN_ECC_READ_BIN <= 
    EN_ECC_READ_FALSE when (EN_ECC_READ = "FALSE") else
    EN_ECC_READ_TRUE when (EN_ECC_READ = "TRUE") else
    EN_ECC_READ_FALSE;

  EN_ECC_WRITE_BIN <= 
    EN_ECC_WRITE_FALSE when (EN_ECC_WRITE = "FALSE") else
    EN_ECC_WRITE_TRUE when (EN_ECC_WRITE = "TRUE") else
    EN_ECC_WRITE_FALSE;

    IS_CLKARDCLK_INVERTED_BIN     <= '1' when IS_CLKARDCLK_INVERTED = '1' else '0';
    IS_CLKBWRCLK_INVERTED_BIN     <= '1' when IS_CLKBWRCLK_INVERTED = '1' else '0';
    IS_ENARDEN_INVERTED_BIN       <= '1' when IS_ENARDEN_INVERTED = '1' else '0';
    IS_ENBWREN_INVERTED_BIN       <= '1' when IS_ENBWREN_INVERTED = '1' else '0';
    IS_RSTRAMARSTRAM_INVERTED_BIN <= '1' when IS_RSTRAMARSTRAM_INVERTED = '1' else '0';
    IS_RSTRAMB_INVERTED_BIN       <= '1' when IS_RSTRAMB_INVERTED = '1' else '0';
    IS_RSTREGARSTREG_INVERTED_BIN <= '1' when IS_RSTREGARSTREG_INVERTED = '1' else '0';
    IS_RSTREGB_INVERTED_BIN       <= '1' when IS_RSTREGB_INVERTED = '1' else '0';
    INIPROC : process
    variable Message : line;
    variable attr_err : boolean := false;
    begin
      INIT_MEM <= '1' after 100 ps, '0' after 200 ps;
    -- case CASCADE_ORDER_A is
      if(CASCADE_ORDER_A = "NONE") then
        CASCADE_ORDER_A_BIN <= CASCADE_ORDER_A_NONE;
      elsif(CASCADE_ORDER_A = "FIRST") then
        CASCADE_ORDER_A_BIN <= CASCADE_ORDER_A_FIRST;
      elsif(CASCADE_ORDER_A = "LAST") then
        CASCADE_ORDER_A_BIN <= CASCADE_ORDER_A_LAST;
      elsif(CASCADE_ORDER_A = "MIDDLE") then
        CASCADE_ORDER_A_BIN <= CASCADE_ORDER_A_MIDDLE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-101] : CASCADE_ORDER_A = is not NONE, FIRST, LAST or MIDDLE." severity error;
      end if;
    -- end case;
    -- case CASCADE_ORDER_B is
      if(CASCADE_ORDER_B = "NONE") then
        CASCADE_ORDER_B_BIN <= CASCADE_ORDER_B_NONE;
      elsif(CASCADE_ORDER_B = "FIRST") then
        CASCADE_ORDER_B_BIN <= CASCADE_ORDER_B_FIRST;
      elsif(CASCADE_ORDER_B = "LAST") then
        CASCADE_ORDER_B_BIN <= CASCADE_ORDER_B_LAST;
      elsif(CASCADE_ORDER_B = "MIDDLE") then
        CASCADE_ORDER_B_BIN <= CASCADE_ORDER_B_MIDDLE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-102] : CASCADE_ORDER_B = is not NONE, FIRST, LAST or MIDDLE." severity error;
      end if;
    -- end case;
    -------- CLOCK_DOMAINS check
  if((xil_attr_test) or
     ((CLOCK_DOMAINS /= "INDEPENDENT") and 
      (CLOCK_DOMAINS /= "COMMON"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] CLOCK_DOMAINS attribute is set to """));
    Write ( Message, string'(CLOCK_DOMAINS));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""INDEPENDENT"" or "));
    Write ( Message, string'("""COMMON"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(RAMB36E2_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -- case ENADDRENA is
      if(ENADDRENA = "FALSE") then
        ENADDRENA_BIN <= ENADDRENA_FALSE;
      elsif(ENADDRENA = "TRUE") then
        ENADDRENA_BIN <= ENADDRENA_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-103] : ENADDRENA = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case ENADDRENB is
      if(ENADDRENB = "FALSE") then
        ENADDRENB_BIN <= ENADDRENB_FALSE;
      elsif(ENADDRENB = "TRUE") then
        ENADDRENB_BIN <= ENADDRENB_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-104] : ENADDRENB = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -------- EN_ECC_PIPE check
  if((xil_attr_test) or
     ((EN_ECC_PIPE /= "FALSE") and 
      (EN_ECC_PIPE /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-103] EN_ECC_PIPE attribute is set to """));
    Write ( Message, string'(EN_ECC_PIPE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(RAMB36E2_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- EN_ECC_READ check
  if((xil_attr_test) or
     ((EN_ECC_READ /= "FALSE") and 
      (EN_ECC_READ /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-104] EN_ECC_READ attribute is set to """));
    Write ( Message, string'(EN_ECC_READ));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(RAMB36E2_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- EN_ECC_WRITE check
  if((xil_attr_test) or
     ((EN_ECC_WRITE /= "FALSE") and 
      (EN_ECC_WRITE /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-105] EN_ECC_WRITE attribute is set to """));
    Write ( Message, string'(EN_ECC_WRITE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(RAMB36E2_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -- case RDADDRCHANGEA is
      if(RDADDRCHANGEA = "FALSE")then
        RDADDRCHANGEA_BIN <= RDADDRCHANGEA_FALSE;
      elsif(RDADDRCHANGEA = "TRUE") then
        RDADDRCHANGEA_BIN <= RDADDRCHANGEA_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-105] : RDADDRCHANGEA = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case RDADDRCHANGEB is
      if(RDADDRCHANGEB = "FALSE") then
        RDADDRCHANGEB_BIN <= RDADDRCHANGEB_FALSE;
      elsif(RDADDRCHANGEB = "TRUE") then
        RDADDRCHANGEB_BIN <= RDADDRCHANGEB_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-106] : RDADDRCHANGEB = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case RSTREG_PRIORITY_A is
      if(RSTREG_PRIORITY_A = "RSTREG") then
        RSTREG_PRIORITY_A_BIN <= RSTREG_PRIORITY_A_RSTREG;
      elsif(RSTREG_PRIORITY_A = "REGCE") then
        RSTREG_PRIORITY_A_BIN <= RSTREG_PRIORITY_A_REGCE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-107] : RSTREG_PRIORITY_A = is not RSTREG, REGCE." severity error;
      end if;
    -- end case;
    -- case RSTREG_PRIORITY_B is
      if(RSTREG_PRIORITY_B = "RSTREG") then
        RSTREG_PRIORITY_B_BIN <= RSTREG_PRIORITY_B_RSTREG;
      elsif(RSTREG_PRIORITY_B = "REGCE") then
        RSTREG_PRIORITY_B_BIN <= RSTREG_PRIORITY_B_REGCE;
      else
        assert FALSE report "Error [Unisim RAMB36E2-108] : RSTREG_PRIORITY_B = is not RSTREG, REGCE." severity error;
      end if;
    -- end case;
    -- case SIM_COLLISION_CHECK is
      if(SIM_COLLISION_CHECK = "ALL") then
        SIM_COLLISION_CHECK_BIN <= SIM_COLLISION_CHECK_ALL;
      elsif(SIM_COLLISION_CHECK = "GENERATE_X_ONLY") then
        SIM_COLLISION_CHECK_BIN <= SIM_COLLISION_CHECK_GENERATE_X_ONLY;
      elsif(SIM_COLLISION_CHECK = "NONE") then
        SIM_COLLISION_CHECK_BIN <= SIM_COLLISION_CHECK_NONE;
      elsif(SIM_COLLISION_CHECK = "WARNING_ONLY") then
        SIM_COLLISION_CHECK_BIN <= SIM_COLLISION_CHECK_WARNING_ONLY;
      else
        assert FALSE report "Error [Unisim RAMB36E2-109] : SIM_COLLISION_CHECK = is not ALL, GENERATE_X_ONLY, NONE, WARNING_ONLY." severity error;
      end if;
    -- end case;
    -------- SLEEP_ASYNC check
  if((xil_attr_test) or
     ((SLEEP_ASYNC /= "FALSE") and 
      (SLEEP_ASYNC /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-120] SLEEP_ASYNC attribute is set to """));
    Write ( Message, string'(SLEEP_ASYNC));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(RAMB36E2_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -- case WRITE_MODE_A is
      if(WRITE_MODE_A = "NO_CHANGE") then
        WRITE_MODE_A_BIN <= WRITE_MODE_A_NO_CHANGE;
      elsif(WRITE_MODE_A = "READ_FIRST") then
        WRITE_MODE_A_BIN <= WRITE_MODE_A_READ_FIRST;
      elsif(WRITE_MODE_A = "WRITE_FIRST") then
        WRITE_MODE_A_BIN <= WRITE_MODE_A_WRITE_FIRST;
      else
        assert FALSE report "Error [Unisim RAMB36E2-110] : WRITE_MODE_A = is not NO_CHANGE, READ_FIRST, WRITE_FIRST." severity error;
      end if;
    -- end case;
    -- case WRITE_MODE_B is
      if(WRITE_MODE_B = "NO_CHANGE") then
        WRITE_MODE_B_BIN <= WRITE_MODE_B_NO_CHANGE;
      elsif(WRITE_MODE_B = "READ_FIRST") then
        WRITE_MODE_B_BIN <= WRITE_MODE_B_READ_FIRST;
      elsif(WRITE_MODE_B = "WRITE_FIRST") then
        WRITE_MODE_B_BIN <= WRITE_MODE_B_WRITE_FIRST;
      else
        assert FALSE report "Error [Unisim RAMB36E2-111] : WRITE_MODE_B = is not NO_CHANGE, READ_FIRST, WRITE_FIRST." severity error;
      end if;
    -- end case;
    case DOA_REG is
      when  1   =>  DOA_REG_BIN <= DOA_REG_1;
      when  0   =>  DOA_REG_BIN <= DOA_REG_0;
      when others  =>  assert FALSE report "Error [Unisim RAMB36E2-112] : DOA_REG is not in range 0 .. 1." severity error;
    end case;
    case DOB_REG is
      when  1   =>  DOB_REG_BIN <= DOB_REG_1;
      when  0   =>  DOB_REG_BIN <= DOB_REG_0;
      when others  =>  assert FALSE report "Error [Unisim RAMB36E2-113] : DOB_REG is not in range 0 .. 1." severity error;
    end case;
    case READ_WIDTH_A is
      when  0    =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_0;
                     rd_loops_a <= 1;  rd_addr_a_mask(5 downto 0) <= "111111";
      when  1    =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_1;
                     rd_loops_a <= 1;  rd_addr_a_mask(5 downto 0) <= "111111";
      when  2    =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_2;
                     rd_loops_a <= 2;  rd_addr_a_mask(5 downto 0) <= "111110";
      when  4    =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_4;
                     rd_loops_a <= 4;  rd_addr_a_mask(5 downto 0) <= "111100";
      when  9    =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_9;
                     rd_loops_a <= 8;  rd_addr_a_mask(5 downto 0) <= "111000";
      when  18   =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_18;
                     rd_loops_a <= 16; rd_addr_a_mask(5 downto 0) <= "110000";
      when  36   =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_36;
                     rd_loops_a <= 32; rd_addr_a_mask(5 downto 0) <= "100000";
      when  72   =>  READ_WIDTH_A_BIN <= READ_WIDTH_A_72;
                     rd_loops_a <= 64; rd_addr_a_mask(5 downto 0) <= "000000";
      when others  =>  assert FALSE report "Error [Unisim RAMB36E2-115]: READ_WIDTH_A is not 0, 1, 2, 4, 9, 18, 36 or 72." severity error;
    end case;
    case READ_WIDTH_B is
      when  0    =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_0;
                     rd_loops_b <= 1;  rd_addr_b_mask(5 downto 0) <= "111111";
      when  1    =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_1;
                     rd_loops_b <= 1;  rd_addr_b_mask(5 downto 0) <= "111111";
      when  2    =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_2;
                     rd_loops_b <= 2;  rd_addr_b_mask(5 downto 0) <= "111110";
      when  4    =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_4;
                     rd_loops_b <= 4;  rd_addr_b_mask(5 downto 0) <= "111100";
      when  9    =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_9;
                     rd_loops_b <= 8;  rd_addr_b_mask(5 downto 0) <= "111000";
      when  18   =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_18;
                     rd_loops_b <= 16; rd_addr_b_mask(5 downto 0) <= "110000";
      when  36   =>  READ_WIDTH_B_BIN <= READ_WIDTH_B_36;
                     rd_loops_b <= 32; rd_addr_b_mask(5 downto 0) <= "100000";
      when others  =>  assert FALSE report "Error [Unisim RAMB36E2-117]: READ_WIDTH_B is not 0, 1, 2, 4, 9, 18, 36 or 72." severity error;
    end case;
    case WRITE_WIDTH_A is
      when  0    =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_0;
                     wr_loops_a <= 1;  wr_addr_a_mask(5 downto 0) <= "111111";
      when  1    =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_1;
                     wr_loops_a <= 1;  wr_addr_a_mask(5 downto 0) <= "111111";
      when  2    =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_2;
                     wr_loops_a <= 2;  wr_addr_a_mask(5 downto 0) <= "111110";
      when  4    =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_4;
                     wr_loops_a <= 4;  wr_addr_a_mask(5 downto 0) <= "111100";
      when  9    =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_9;
                     wr_loops_a <= 8;  wr_addr_a_mask(5 downto 0) <= "111000";
      when  18   =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_18;
                     wr_loops_a <= 16; wr_addr_a_mask(5 downto 0) <= "110000";
      when  36   =>  WRITE_WIDTH_A_BIN <= WRITE_WIDTH_A_36;
                     wr_loops_a <= 32; wr_addr_a_mask(5 downto 0) <= "100000";
      when others  =>  assert FALSE report "Error [Unisim RAMB36E2-121]: WRITE_WIDTH_A is not 0, 1, 2, 4, 9, 18 or 36." severity error;
    end case;
    case WRITE_WIDTH_B is
      when  0    =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_0;
                     wr_loops_b <= 1;  wr_addr_b_mask(5 downto 0) <= "111111";
      when  1    =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_1;
                     wr_loops_b <= 1;  wr_addr_b_mask(5 downto 0) <= "111111";
      when  2    =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_2;
                     wr_loops_b <= 2;  wr_addr_b_mask(5 downto 0) <= "111110";
      when  4    =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_4;
                     wr_loops_b <= 4;  wr_addr_b_mask(5 downto 0) <= "111100";
      when  9    =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_9;
                     wr_loops_b <= 8;  wr_addr_b_mask(5 downto 0) <= "111000";
      when  18   =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_18;
                     wr_loops_b <= 16; wr_addr_b_mask(5 downto 0) <= "110000";
      when  36   =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_36;
                     wr_loops_b <= 32; wr_addr_b_mask(5 downto 0) <= "100000";
      when  72   =>  WRITE_WIDTH_B_BIN <= WRITE_WIDTH_B_72;
                     wr_loops_b <= 64; wr_addr_b_mask(5 downto 0) <= "000000";
      when others  =>  assert FALSE report "Error [Unisim RAMB36E2-122]: WRITE_WIDTH_B is not 0, 1, 2, 4, 9, 18, 36 or 72." severity error;
    end case;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-137] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RAMB36E2_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

    INITPROC : process (INIT_MEM)
    begin
      if (rising_edge(INIT_MEM)) then
        mem_rm_a  <= set_mask(D_WIDTH, rd_loops_a);
        memp_rm_a  <= set_mask(DP_WIDTH, rd_loops_a/8);
        mem_rm_b  <= set_mask(D_WIDTH, rd_loops_b);
        memp_rm_b  <= set_mask(DP_WIDTH/2, rd_loops_b/8);
        mem_wm_a  <= set_mask(D_WIDTH, wr_loops_a);
        mem_wm_b  <= set_mask(D_WIDTH, wr_loops_b);
      end if;
    end process INITPROC;

-- determine clk period for collision window.
  clks_done <= clka_done and clkb_done;
  CATOG : process begin
    wait until rising_edge(mem_rd_clk_a);
    wait until rising_edge(mem_rd_clk_a);
    clka_toggled <= '1';
  end process;

  CBTOG : process begin
    wait until rising_edge(CLKBWRCLK_in);
    wait until rising_edge(CLKBWRCLK_in);
    clkb_toggled <= '1';
  end process;

  CPERA : process begin
    if (clka_toggled = '1') then
      if (CLKARDCLK = '1') then wait until CLKARDCLK = '0'; end if;
      clka_timeout <= '0', '1' after 6000 ps;
      wait until CLKARDCLK = '1' or clka_timeout = '1';
      if (clka_timeout = '0') then
        t_max_a <= 0;
        for i in 1 to 2000 loop
          if (clka_done = '0') then
            if (CLKARDCLK = '1') then
              wait for 1 ps;
              t_max_a <= t_max_a + 1;
            else
              t_max_a <= t_max_a - 1;
              clka_done <= '1';
            end if;
          end if;
        end loop;
      end if;
      if (t_max_a < 500) then t_max_a <= 500; end if;
      clka_done <= '1';
    end if;
    wait on clka_toggled;
  end process;

  CPERB : process begin
    if (clkb_toggled = '1') then
      if (CLKBWRCLK = '1') then wait until CLKBWRCLK = '0'; end if;
      clkb_timeout <= '0', '1' after 6000 ps;
      wait until CLKBWRCLK = '1' or clkb_timeout = '1';
      if (clkb_timeout = '0') then
        t_max_b <= 0;
        for i in 1 to 2000 loop
          if (clkb_done = '0') then
            if (CLKBWRCLK = '1') then
              wait for 1 ps;
              t_max_b <= t_max_b + 1;
            else
              t_max_b <= t_max_b - 1;
              clkb_done <= '1';
            end if;
          end if;
        end loop;
      end if;
      if (t_max_b < 500) then t_max_b <= 500; end if;
      clkb_done <= '1';
    end if;
    wait on clkb_toggled;
  end process;

  CPERMAX : process (clks_done) begin
    if (clks_done = '1') then
       if (((t_max_a > 50) and (t_max_a < 1500)) and
           ((t_max_b = 0) or (t_max_a <= t_max_b))) then
         t_coll_max <= (2 * t_max_a - 99) * 1 ps;
       end if;
       if (((t_max_b > 50) and (t_max_b < 1500)) and
           ((t_max_a = 0) or (t_max_b <  t_max_a))) then
         t_coll_max <= (2 * t_max_b - 99) * 1 ps;
       end if;
    end if;
  end process CPERMAX;

   SLRA : process (mem_rd_clk_a) begin
     if (rising_edge(mem_rd_clk_a)) then
       if (glblGSR = '1') then
          SLEEP_A_reg <= "00";
       else
          SLEEP_A_reg <= SLEEP_A_reg(0) & SLEEP_in;
       end if;
     end if;
     end process SLRA;

   SLRB : process (mem_wr_clk_b) begin
     if (rising_edge(mem_wr_clk_b)) then
       if (glblGSR = '1') then
          SLEEP_B_reg <= "00";
       else
          SLEEP_B_reg <= SLEEP_B_reg(0) & SLEEP_in;
       end if;
     end if;
     end process SLRB;

   SLEEP_A_int <= SLEEP_A_reg(1) or SLEEP_A_reg(0) or SLEEP_in;
   SLEEP_B_int <= SLEEP_B_reg(1) or SLEEP_B_reg(0) or SLEEP_in;

   sdp_mode_rd <= '1' when (READ_WIDTH_A_BIN = READ_WIDTH_A_72) else '0';
   sdp_mode_wr <= '1' when (WRITE_WIDTH_B_BIN = WRITE_WIDTH_B_72) else '0';
   sdp_mode <= sdp_mode_rd or sdp_mode_wr;
   REGCE_A_int  <= REGCEAREGCE_in;
   REGCE_B_int  <= REGCEB_in;
   RSTREG_A_int <= RSTREGARSTREG_in when (RSTREG_PRIORITY_A_BIN = RSTREG_PRIORITY_A_RSTREG)
                   else RSTREGARSTREG_in and REGCEAREGCE_in;
   RSTREG_B_int <= RSTREGB_in when (RSTREG_PRIORITY_B_BIN = RSTREG_PRIORITY_B_RSTREG)
                   else RSTREGB_in and REGCEB_in;
   WREN_ecc   <= ECCPIPECE_in and first_read when
                 (EN_ECC_PIPE_BIN = EN_ECC_PIPE_TRUE) else '0';
   DOUTADOUT_out  <=  CASDINA_in when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                   (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and CASDOMUXA_reg = '1') else
                   mem_a_mux(D_WIDTH/2-1 downto 0) xor mem_rm_douta(D_WIDTH/2-1 downto 0);
   DOUTPADOUTP_out <= CASDINPA_in when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                   (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and CASDOMUXA_reg = '1') else
                   memp_a_mux(DP_WIDTH/2-1 downto 0) xor memp_rm_douta(DP_WIDTH/2-1 downto 0);
   DOUTBDOUT_out  <=  CASDINB_in when (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
                   (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) and CASDOMUXB_int = '1') else
                   mem_b_mux xor mem_rm_doutb;
   DOUTPBDOUTP_out <= CASDINPB_in when (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
                   (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) and CASDOMUXB_int = '1') else
                   memp_b_mux xor memp_rm_doutb;

   mem_a_mux  <= mem_a_reg  when (DOA_REG_BIN = DOA_REG_1) else mem_a_out;
   memp_a_mux <= memp_a_reg when (DOA_REG_BIN = DOA_REG_1) else memp_a_out;

   mem_a_out  <= mem_rd_a_wf  when (mem_wr_en_a_wf = '1') else mem_a_ecc;
   memp_a_out <= memp_rd_a_wf when (mem_wr_en_a_wf = '1') else memp_a_ecc;

   mem_b_out  <= mem_rd_b_wf  when (mem_wr_en_b_wf = '1') else mem_b_lat;
   memp_b_out <= memp_rd_b_wf when (mem_wr_en_b_wf = '1') else memp_b_lat;
   mem_b_mux   <= mem_a_reg(63 downto 32) when
                          ((DOA_REG_BIN = DOA_REG_1) and (sdp_mode_rd = '1'))
                      else mem_a_out(63 downto 32) when
                          ((DOA_REG_BIN = DOA_REG_0) and (sdp_mode_rd = '1'))
                      else mem_b_reg when
                          ((DOB_REG_BIN = DOB_REG_1) and (sdp_mode_rd = '0'))
                      else mem_b_out;
   memp_b_mux  <= memp_a_reg(7 downto 4) when
                          ((DOA_REG_BIN = DOA_REG_1) and (sdp_mode_rd = '1'))
                      else memp_a_out(7 downto 4) when
                          ((DOA_REG_BIN = DOA_REG_0) and (sdp_mode_rd = '1'))
                      else memp_b_reg when
                          ((DOB_REG_BIN = DOB_REG_1) and (sdp_mode_rd = '0'))
                      else memp_b_out;
  ECCPARITY_out <= eccparity_reg;
   mem_a_ecc   <= mem_a_pipe when (EN_ECC_PIPE_BIN = EN_ECC_PIPE_TRUE) else mem_a_lat;
   memp_a_ecc  <= memp_a_pipe when (EN_ECC_PIPE_BIN = EN_ECC_PIPE_TRUE) else memp_a_lat;
   dbit_ecc    <= CASINDBITERR_in when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                                         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and
                                        (CASOREGIMUXA_reg = '1')) else
                  dbit_pipe when (EN_ECC_PIPE_BIN = EN_ECC_PIPE_TRUE) else dbit_lat;

   sbit_ecc    <= CASINSBITERR_in when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                                         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and
                                        (CASOREGIMUXA_reg = '1')) else
                  sbit_pipe when (EN_ECC_PIPE_BIN = EN_ECC_PIPE_TRUE) else sbit_lat;
   r_a_ecc_ecc <= r_a_ecc_pipe when (EN_ECC_PIPE_BIN = EN_ECC_PIPE_TRUE) else r_a_ecc_lat;
   DBITERR_out <= CASINDBITERR_in when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                                        (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and
                                        (CASDOMUXA_reg = '1')) else
                  dbit_reg when (DOA_REG_BIN = DOA_REG_1) else dbit_ecc;
   SBITERR_out <= CASINSBITERR_in when (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
                                        (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and
                                        (CASDOMUXA_reg = '1')) else
                  sbit_reg when (DOA_REG_BIN = DOA_REG_1) else sbit_ecc;
   RDADDRECC_out <= r_a_ecc_reg when (DOA_REG_BIN = DOA_REG_1) else r_a_ecc_ecc;
   INIT_A_BIN_8_8     <= INIT_A_BIN(8) & INIT_A_BIN(8) & INIT_A_BIN(8) & INIT_A_BIN(8) &
                         INIT_A_BIN(8) & INIT_A_BIN(8) & INIT_A_BIN(8) & INIT_A_BIN(8);
   INIT_A_BIN_7_0_8   <= INIT_A_BIN(7 downto 0)   & INIT_A_BIN(7 downto 0) &
                         INIT_A_BIN(7 downto 0)   & INIT_A_BIN(7 downto 0) &
                         INIT_A_BIN(7 downto 0)   & INIT_A_BIN(7 downto 0) &
                         INIT_A_BIN(7 downto 0)   & INIT_A_BIN(7 downto 0);
   INIT_A_BIN_17_16_4 <= INIT_A_BIN(17 downto 16) & INIT_A_BIN(17 downto 16) & 
                         INIT_A_BIN(17 downto 16) & INIT_A_BIN(17 downto 16);
   INIT_A_BIN_15_0_4  <= INIT_A_BIN(15 downto 0)  & INIT_A_BIN(15 downto 0) &
                         INIT_A_BIN(15 downto 0)  & INIT_A_BIN(15 downto 0);
   INIT_A_BIN_35_32_2 <= INIT_A_BIN(35 downto 32) & INIT_A_BIN(35 downto 32);
   INIT_A_BIN_31_0_2  <= INIT_A_BIN(31 downto 0)  & INIT_A_BIN(31 downto 0);
   INIT_B_BIN_8_4     <= INIT_B_BIN(8) & INIT_B_BIN(8) & INIT_B_BIN(8) & INIT_B_BIN(8);
   INIT_B_BIN_7_0_4   <= INIT_B_BIN(7 downto 0)   & INIT_B_BIN(7 downto 0) &
                         INIT_B_BIN(7 downto 0)   & INIT_B_BIN(7 downto 0);
   INIT_B_BIN_17_16_2 <= INIT_B_BIN(17 downto 16) & INIT_B_BIN(17 downto 16);
   INIT_B_BIN_15_0_2  <= INIT_B_BIN(15 downto 0)  & INIT_B_BIN(15 downto 0);
   INIT_B_BIN_35_32_2 <= INIT_B_BIN(35 downto 32) & INIT_B_BIN(35 downto 32);
   INIT_B_BIN_31_0_2  <= INIT_B_BIN(31 downto 0)  & INIT_B_BIN(31 downto 0);
   INIT_BA_BIN_35_32  <= INIT_B_BIN(35 downto 32) & INIT_A_BIN(35 downto 32);
   INIT_BA_BIN_31_0   <= INIT_B_BIN(31 downto 0)  & INIT_A_BIN(31 downto 0);
   INIT_A_int <=
    (INIT_A_BIN_8_8     & INIT_A_BIN_7_0_8)  when (READ_WIDTH_A_BIN <= READ_WIDTH_A_9) else
    (INIT_A_BIN_17_16_4 & INIT_A_BIN_15_0_4) when (READ_WIDTH_A_BIN = READ_WIDTH_A_18) else
    (INIT_A_BIN_35_32_2 & INIT_A_BIN_31_0_2) when (READ_WIDTH_A_BIN = READ_WIDTH_A_36) else
    (INIT_BA_BIN_35_32  & INIT_BA_BIN_31_0);
   INIT_B_int <=
    (INIT_B_BIN_8_4     & INIT_B_BIN_7_0_4)  when (READ_WIDTH_B_BIN <= READ_WIDTH_B_9) else
    (INIT_B_BIN_17_16_2 & INIT_B_BIN_15_0_2) when (READ_WIDTH_B_BIN = READ_WIDTH_B_18) else
    INIT_B_BIN;
   SRVAL_A_BIN_8_8     <= SRVAL_A_BIN(8) & SRVAL_A_BIN(8) & SRVAL_A_BIN(8) & SRVAL_A_BIN(8) &
                          SRVAL_A_BIN(8) & SRVAL_A_BIN(8) & SRVAL_A_BIN(8) & SRVAL_A_BIN(8);
   SRVAL_A_BIN_7_0_8   <= SRVAL_A_BIN(7 downto 0)   & SRVAL_A_BIN(7 downto 0) &
                          SRVAL_A_BIN(7 downto 0)   & SRVAL_A_BIN(7 downto 0) &
                          SRVAL_A_BIN(7 downto 0)   & SRVAL_A_BIN(7 downto 0) &
                          SRVAL_A_BIN(7 downto 0)   & SRVAL_A_BIN(7 downto 0);
   SRVAL_A_BIN_17_16_4 <= SRVAL_A_BIN(17 downto 16) & SRVAL_A_BIN(17 downto 16) & 
                          SRVAL_A_BIN(17 downto 16) & SRVAL_A_BIN(17 downto 16);
   SRVAL_A_BIN_15_0_4  <= SRVAL_A_BIN(15 downto 0)  & SRVAL_A_BIN(15 downto 0) &
                          SRVAL_A_BIN(15 downto 0)  & SRVAL_A_BIN(15 downto 0);
   SRVAL_A_BIN_35_32_2 <= SRVAL_A_BIN(35 downto 32) & SRVAL_A_BIN(35 downto 32);
   SRVAL_A_BIN_31_0_2  <= SRVAL_A_BIN(31 downto 0)  & SRVAL_A_BIN(31 downto 0);
   SRVAL_B_BIN_8_4     <= SRVAL_B_BIN(8) & SRVAL_B_BIN(8) & SRVAL_B_BIN(8) & SRVAL_B_BIN(8);
   SRVAL_B_BIN_7_0_4   <= SRVAL_B_BIN(7 downto 0)   & SRVAL_B_BIN(7 downto 0) &
                          SRVAL_B_BIN(7 downto 0)   & SRVAL_B_BIN(7 downto 0);
   SRVAL_B_BIN_17_16_2 <= SRVAL_B_BIN(17 downto 16) & SRVAL_B_BIN(17 downto 16);
   SRVAL_B_BIN_15_0_2  <= SRVAL_B_BIN(15 downto 0)  & SRVAL_B_BIN(15 downto 0);
   SRVAL_B_BIN_35_32_2 <= SRVAL_B_BIN(35 downto 32) & SRVAL_B_BIN(35 downto 32);
   SRVAL_B_BIN_31_0_2  <= SRVAL_B_BIN(31 downto 0)  & SRVAL_B_BIN(31 downto 0);
   SRVAL_BA_BIN_35_32  <= SRVAL_B_BIN(35 downto 32) & SRVAL_A_BIN(35 downto 32);
   SRVAL_BA_BIN_31_0   <= SRVAL_B_BIN(31 downto 0)  & SRVAL_A_BIN(31 downto 0);
   SRVAL_A_int <=
    (SRVAL_A_BIN_8_8     & SRVAL_A_BIN_7_0_8)  when (READ_WIDTH_A_BIN <= READ_WIDTH_A_9) else
    (SRVAL_A_BIN_17_16_4 & SRVAL_A_BIN_15_0_4) when (READ_WIDTH_A_BIN = READ_WIDTH_A_18) else
    (SRVAL_A_BIN_35_32_2 & SRVAL_A_BIN_31_0_2) when (READ_WIDTH_A_BIN = READ_WIDTH_A_36) else
    (SRVAL_BA_BIN_35_32 & SRVAL_BA_BIN_31_0);
   SRVAL_B_int <=
    (SRVAL_B_BIN_8_4     & SRVAL_B_BIN_7_0_4)  when (READ_WIDTH_B_BIN <= READ_WIDTH_B_9) else
    (SRVAL_B_BIN_17_16_2 & SRVAL_B_BIN_15_0_2) when (READ_WIDTH_B_BIN = READ_WIDTH_B_18) else
    SRVAL_B_BIN;

-- cascade out
   CASDOUTA_out  <= DOUTADOUT_out when ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
                            (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) else (others => '0');
   CASDOUTPA_out <= DOUTPADOUTP_out when ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
                            (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) else (others => '0');
   CASDOUTB_out  <= DOUTBDOUT_out when ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
                            (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) else (others => '0');
   CASDOUTPB_out <= DOUTPBDOUTP_out when ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
                            (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) else (others => '0');
   CASOUTDBITERR_out <= DBITERR_out when ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
                            (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) else '0';
   CASOUTSBITERR_out <= SBITERR_out when ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
                            (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) else '0';

-- cascade control
   COMA : process (mem_rd_clk_a) begin
     if (rising_edge(mem_rd_clk_a)) then
       if (glblGSR = '1') then
          CASDOMUXA_reg <= '0';
       elsif (CASDOMUXEN_A_in = '1') then
          CASDOMUXA_reg <= CASDOMUXA_in;
       end if;
     end if;
     end process COMA;

   CORA : process (mem_rd_clk_a) begin
     if (rising_edge(mem_rd_clk_a)) then
       if (glblGSR = '1') then
          CASOREGIMUXA_reg <= '0';
       elsif (CASOREGIMUXEN_A_in = '1') then
          CASOREGIMUXA_reg <= CASOREGIMUXA_in;
       end if;
     end if;
     end process CORA;

   CASDOMUXB_int <= CASDOMUXA_reg when READ_WIDTH_A_BIN = READ_WIDTH_A_72 else
                    CASDOMUXB_reg;
   COMB : process (mem_rd_clk_b) begin
     if (rising_edge(mem_rd_clk_b)) then
       if (glblGSR = '1') then
          CASDOMUXB_reg <= '0';
       elsif (CASDOMUXEN_B_in = '1') then
          CASDOMUXB_reg <= CASDOMUXB_in;
       end if;
     end if;
     end process COMB;

   CORB : process (mem_rd_clk_b) begin
     if (rising_edge(mem_rd_clk_b)) then
       if (glblGSR = '1') then
          CASOREGIMUXB_reg <= '0';
       elsif (CASOREGIMUXEN_B_in = '1') then
          CASOREGIMUXB_reg <= CASOREGIMUXB_in;
       end if;
     end if;
     end process CORB;

-- collison detection
--coll_win_wr_clk_a_min <= mem_wr_en_a when (CLOCK_DOMAINS_BIN = CLOCK_DOMAINS_COMMON)
--                  else coll_win_wr_clk_a_ind_min;
--coll_win_wr_clk_b_min <= mem_wr_en_b when (CLOCK_DOMAINS_BIN = CLOCK_DOMAINS_COMMON)
--                  else coll_win_wr_clk_b_ind_min;
--coll_win_rd_clk_a_min <= mem_rd_en_a when (CLOCK_DOMAINS_BIN = CLOCK_DOMAINS_COMMON)
--                  else coll_win_rd_clk_a_ind_min;
--coll_win_rd_clk_b_min <= mem_rd_en_b when (CLOCK_DOMAINS_BIN = CLOCK_DOMAINS_COMMON)
--                  else coll_win_rd_clk_b_ind_min;
coll_win_wr_clk_a_min <= coll_win_wr_clk_a_ind_min;
coll_win_wr_clk_b_min <= coll_win_wr_clk_b_ind_min;
coll_win_rd_clk_a_min <= coll_win_rd_clk_a_ind_min;
coll_win_rd_clk_b_min <= coll_win_rd_clk_b_ind_min;

mem_wr_clk_a_coll <= '0' when (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_NONE)
                     else mem_wr_clk_a;
mem_wr_clk_b_coll <= '0' when (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_NONE)
                     else mem_wr_clk_b;
mem_rd_clk_a_coll <= '0' when (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_NONE)
                     else mem_rd_clk_a;
mem_rd_clk_b_coll <= '0' when (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_NONE)
                     else mem_rd_clk_b;

coll_wr_sim        <= wr_addr_coll and coll_win_wr_clk_a_min and coll_win_wr_clk_b_min;
coll_wr_b_wr_a     <= wr_addr_coll and coll_win_wr_clk_b_min and not coll_win_wr_clk_a_min and coll_win_wr_clk_a_max;
coll_wr_b_rd_a_sim <= wr_b_rd_a_addr_coll and coll_win_wr_clk_b_min and coll_win_rd_clk_a_min;
coll_wr_a_rd_b_sim <= wr_a_rd_b_addr_coll and coll_win_wr_clk_a_min and coll_win_rd_clk_b_min;
coll_wr_b_rd_a     <= wr_b_rd_a_addr_coll and coll_win_wr_clk_b_min and not coll_win_rd_clk_a_min and coll_win_rd_clk_a_max;
coll_rd_b_wr_a     <= wr_a_rd_b_addr_coll and coll_win_rd_clk_b_min and not coll_win_wr_clk_a_min and coll_win_wr_clk_a_max;
coll_wr_a_wr_b     <= wr_addr_coll and coll_win_wr_clk_a_min and not coll_win_wr_clk_b_min and coll_win_wr_clk_b_max;
coll_wr_a_rd_b     <= wr_a_rd_b_addr_coll and coll_win_wr_clk_a_min and not coll_win_rd_clk_b_min and coll_win_rd_clk_b_max;
coll_rd_a_wr_b     <= wr_b_rd_a_addr_coll and coll_win_rd_clk_a_min and not coll_win_wr_clk_b_min and coll_win_wr_clk_b_max;

mem_wr_clk_a_coll_p : process (mem_wr_clk_a_coll)
  variable Message : line;
  begin
  if (rising_edge(mem_wr_clk_a_coll) and (mem_wr_en_a = '1')) then
    coll_win_wr_clk_a_ind_min <= '1', '0' after t_coll_min;
    coll_win_wr_clk_a_max <= '1' after 99 ps, '0' after t_coll_max;
  end if;
end process mem_wr_clk_a_coll_p;

wr_a_wr_b_coll_p : process (coll_wr_sim, coll_wr_a_wr_b)
  variable Message : line;
  begin
  if (wr_data_matches = '0') then
    if (rising_edge(coll_wr_sim)) then
      if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-1] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A simultaneous WRITE occured on port A (addr:"));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(" data:"));
        Write ( Message, string'(SLV_TO_HEX(mem_wr_a,D_WIDTH/4)));
        Write ( Message, string'(") and port B (addr:"));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(" data:"));
        Write ( Message, string'(SLV_TO_HEX(mem_wr_b,D_WIDTH/4)));
        Write ( Message, string'(")."));
        Write ( Message, LF);
        Write ( Message, string'("Memory contents at those locations have been corrupted"));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
        wr_a_wr_b_coll <= '1' after 10 ps, '0' after 100 ps;
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-2] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A simultaneous WRITE occured on port A (addr:"));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(" data:"));
        Write ( Message, string'(SLV_TO_HEX(mem_wr_a,D_WIDTH/4)));
        Write ( Message, string'(") and port B (addr:"));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(" data:"));
        Write ( Message, string'(SLV_TO_HEX(mem_wr_b,D_WIDTH/4)));
        Write ( Message, string'(")."));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY) then
        wr_a_wr_b_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    elsif (rising_edge(coll_wr_a_wr_b) and (wr_data_matches = '0')) then
      if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-3] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(") occured during the WRITE window on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(")."));
        Write ( Message, LF);
        Write ( Message, string'("Memory contents at those locations have been corrupted"));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
        wr_a_wr_b_coll <= '1' after 10 ps, '0' after 100 ps;
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-4] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(") occured during WRITE window on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(")."));
        Write ( Message, LF);
        Write ( Message, string'("Memory contents at those locations have been corrupted"));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY) then
        wr_a_wr_b_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  end if;
end process wr_a_wr_b_coll_p;

wr_a_rd_b_coll_p : process (coll_wr_a_rd_b_sim, coll_wr_a_rd_b)
  variable Message : line;
  begin
  if (rising_edge(coll_wr_a_rd_b_sim)) then
    if ((wr_a_data_matches_rd_b_data = '0') and (WRITE_MODE_A_BIN /= WRITE_MODE_A_READ_FIRST)) then
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY)) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-5] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A simultaneous WRITE on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(") and a READ on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_b),4)));
        Write ( Message, string'(") occured."));
        if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
          Write ( Message, LF);
          Write ( Message, string'("The WRITE was successful but the READ may be corrupted."));
        end if;
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      end if;
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY)) then
        wr_a_rd_b_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  elsif (rising_edge(coll_wr_a_rd_b)) then
    if (wr_a_data_matches_rd_b_data = '0') then
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY)) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-7] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(") occured during the READ window on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_b),4)));
        Write ( Message, string'(")."));
        if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
          Write ( Message, LF);
          Write ( Message, string'("The WRITE was successful but the READ may be corrupted."));
        end if;
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      end if;
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY)) then
        wr_a_rd_b_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  end if;
end process wr_a_rd_b_coll_p;

mem_wr_clk_b_coll_p : process (mem_wr_clk_b_coll)
  variable Message : line;
  begin
  if (rising_edge(mem_wr_clk_b_coll) and (mem_wr_en_b = '1')) then
    coll_win_wr_clk_b_ind_min <= '1', '0' after t_coll_min;
    coll_win_wr_clk_b_max <= '1' after 99 ps, '0' after t_coll_max;
  end if;
end process mem_wr_clk_b_coll_p;

wr_b_wr_a_coll_p : process (coll_wr_b_wr_a)
  variable Message : line;
  begin
  if (wr_data_matches = '0') then
    if (rising_edge(coll_wr_b_wr_a)) then
      if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-9] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(") occured during WRITE window on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(")."));
        Write ( Message, LF);
        Write ( Message, string'("Memory contents at those locations have been corrupted"));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
        wr_b_wr_a_coll <= '1' after 10 ps, '0' after 100 ps;
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-10] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(") occured during WRITE window on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(")."));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY) then
        wr_b_wr_a_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  end if;
end process wr_b_wr_a_coll_p;

wr_b_rd_a_coll_p : process (coll_wr_b_rd_a_sim, coll_wr_b_rd_a)
  variable Message : line;
  begin
  if (rising_edge(coll_wr_b_rd_a_sim)) then
    if ((wr_b_data_matches_rd_a_data = '0') and (WRITE_MODE_B_BIN /= WRITE_MODE_B_READ_FIRST)) then
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY)) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-11] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A simultaneous WRITE on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(") occured during a READ on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_a),4)));
        Write ( Message, string'(")."));
        if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
          Write ( Message, LF);
          Write ( Message, string'("The WRITE was successful but the READ may be corrupted."));
        end if;
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      end if;
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY)) then
        wr_b_rd_a_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  elsif (rising_edge(coll_wr_b_rd_a)) then
    if (wr_b_data_matches_rd_a_data = '0') then
      if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-13] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(") occured during the READ window on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_a),4)));
        Write ( Message, string'(")."));
        Write ( Message, LF);
        Write ( Message, string'("The WRITE was successful but the READ may be corrupted."));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
        wr_b_rd_a_coll <= '1' after 10 ps, '0' after 100 ps;
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-14] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A WRITE on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(") occured during the READ window on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_a),4)));
        Write ( Message, string'(")."));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      elsif (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY) then
        wr_b_rd_a_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  end if;
end process wr_b_rd_a_coll_p;

mem_rd_clk_a_coll_p : process (mem_rd_clk_a_coll)
  variable Message : line;
  begin
  if (rising_edge(mem_rd_clk_a_coll) and (mem_rd_en_a = '1')) then
    coll_win_rd_clk_a_ind_min <= '1', '0' after t_coll_min;
    coll_win_rd_clk_a_max <= '1' after 99 ps, '0' after t_coll_max;
  end if;
end process mem_rd_clk_a_coll_p;

rd_a_wr_b_coll_p : process (coll_rd_a_wr_b)
  variable Message : line;
  begin
  if (wr_b_data_matches_rd_a_data = '0') then
    if (rising_edge(coll_rd_a_wr_b)) then
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY)) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-17] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A READ on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_a),4)));
        Write ( Message, string'(") and a WRITE on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_b),4)));
        Write ( Message, string'(") occured."));
        if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
          Write ( Message, LF);
          Write ( Message, string'("The WRITE was successful but the READ may be corrupted."));
        end if;
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      end if;
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY)) then
        rd_a_wr_b_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  end if;
end process rd_a_wr_b_coll_p;

mem_rd_clk_b_coll_p : process (mem_rd_clk_b_coll)
  variable Message : line;
  begin
  if (rising_edge(mem_rd_clk_b_coll) and (mem_rd_en_b = '1')) then
    coll_win_rd_clk_b_ind_min <= '1', '0' after t_coll_min;
    coll_win_rd_clk_b_max <= '1' after 99 ps, '0' after t_coll_max;
  end if;
end process mem_rd_clk_b_coll_p;

rd_b_wr_a_coll_p : process (coll_rd_b_wr_a)
  variable Message : line;
  begin
  if (wr_b_data_matches_rd_a_data = '0') then
    if (rising_edge(coll_rd_b_wr_a)) then
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_WARNING_ONLY)) then
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-22] "));
        Write ( Message, string'(" : instance "));
        Write ( Message, string'(RAMB36E2_V'PATH_NAME));
        Write ( Message, string'(" : Memory Collision at time "));
        Write ( Message, now);
        Write ( Message, string'("."));
        Write ( Message, LF);
        Write ( Message, string'("A READ on port B ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(rd_addr_b),4)));
        Write ( Message, string'(") and a WRITE on port A ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(wr_addr_a),4)));
        Write ( Message, string'(") occured."));
        if (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) then
          Write ( Message, LF);
          Write ( Message, string'("The WRITE was successful but the READ may be corrupted."));
        end if;
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      end if;
      if ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
          (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY)) then
        rd_b_wr_a_coll <= '1' after 10 ps, '0' after 100 ps;
      end if;
    end if;
  end if;
end process;

-- output register
   ORA : process (mem_rd_clk_a, INIT_MEM) begin
     if (rising_edge(mem_rd_clk_a) or INIT_MEM = '1') then
       if (glblGSR = '1' or INIT_MEM = '1') then
         memp_a_reg <= INIT_A_int(D_WIDTH+DP_WIDTH-1 downto D_WIDTH);
         mem_a_reg  <= INIT_A_int(D_WIDTH-1 downto 0);
       elsif (RSTREG_A_int = '1') then
         memp_a_reg <= SRVAL_A_int(D_WIDTH+DP_WIDTH-1 downto D_WIDTH);
         mem_a_reg  <= SRVAL_A_int(D_WIDTH-1 downto 0);
       elsif (REGCE_A_int = '1') then
         if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
              (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE)) and
             CASOREGIMUXA_reg = '1') then
           memp_a_reg  <= CASDINPB_in & CASDINPA_in;
           mem_a_reg   <= CASDINB_in & CASDINA_in;
         else
           memp_a_reg <= memp_a_out;
           mem_a_reg  <= mem_a_out;
         end if;
       end if;
     end if;
     end process ORA;


   ORB : process (mem_rd_clk_b, INIT_MEM) begin
     if (rising_edge(mem_rd_clk_b) or INIT_MEM = '1') then
       if (glblGSR = '1' or INIT_MEM = '1') then
         memp_b_reg <= INIT_B_int(INIT_WIDTH/2-1 downto D_WIDTH/2);
         mem_b_reg  <= INIT_B_int(D_WIDTH/2-1 downto 0);
       elsif (RSTREG_B_int = '1') then
         memp_b_reg <= SRVAL_B_int(INIT_WIDTH/2-1 downto D_WIDTH/2);
         mem_b_reg  <= SRVAL_B_int(D_WIDTH/2-1 downto 0);
       elsif (REGCE_B_int = '1') then
         if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
              (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE)) and
              CASOREGIMUXB_reg = '1') then 
           memp_b_reg <= CASDINPB_in;
           mem_b_reg  <= CASDINB_in;
         else
           memp_b_reg <= memp_b_out;
           mem_b_reg  <= mem_b_out;
         end if;
       end if;
     end if;
     end process ORB;

-- bit err reg
   BERR : process (mem_rd_clk_a) begin
     if (rising_edge(mem_rd_clk_a)) then
       if ((glblGSR = '1') or (mem_rst_a = '1')) then
         dbit_reg <= '0';
         sbit_reg <= '0';
         r_a_ecc_reg <= (others => '0');
       elsif (REGCE_A_int = '1') then
         dbit_reg <= dbit_ecc;
         sbit_reg <= sbit_ecc;
         r_a_ecc_reg <= r_a_ecc_ecc;
       end if;
     end if;
     end process BERR;

   EPIPE : process (mem_rd_clk_a, INIT_MEM) begin
     if (rising_edge(mem_rd_clk_a) or INIT_MEM = '1') then
       if (glblGSR = '1' or INIT_MEM = '1') then
         memp_a_pipe <= INIT_A_int(D_WIDTH+DP_WIDTH-1 downto D_WIDTH);
         mem_a_pipe  <= INIT_A_int(D_WIDTH-1 downto 0);
         dbit_pipe <= '0';
         sbit_pipe <= '0';
         r_a_ecc_pipe <= (others => '0');
       elsif (WREN_ecc = '1') then
         mem_a_pipe <= mem_a_lat;
         memp_a_pipe <= memp_a_lat;
         dbit_pipe <= dbit_lat;
         sbit_pipe <= sbit_lat;
         r_a_ecc_pipe <= r_a_ecc_lat;
       end if;
     end if;
     end process EPIPE;

   MWEAR : process (mem_wr_clk_a) begin
     if (rising_edge(mem_wr_clk_a) and (WRITE_MODE_A_BIN = WRITE_MODE_A_WRITE_FIRST) and (mem_rd_en_a = '1')) then
       mem_wr_en_a_wf <= mem_wr_en_a and not mem_rst_a;
     end if;
   end process;

   MWEBR : process (mem_wr_clk_b) begin
     if (rising_edge(mem_wr_clk_b) and (WRITE_MODE_B_BIN = WRITE_MODE_B_WRITE_FIRST) and (mem_rd_en_b = '1')) then
       mem_wr_en_b_wf <= mem_wr_en_b and not mem_rst_b;
     end if;
   end process;

   MRAWF : process (wr_a_event, INIT_MEM) begin
     if (ADDR_IS_VALID(rd_addr_a_slv)) then
       if (coll_wr_sim = '1' or coll_wr_a_wr_b = '1' or coll_wr_b_wr_a = '1') then
         for raa in 0 to (rd_loops_a-1) loop
           mem_rd_a_wf(raa) <= 'X';
           if (raa<mem_width*rd_loops_a/8) then
             memp_rd_a_wf(raa) <= 'X';
           end if;
         end loop;
       elsif (coll_rd_a_wr_b = '0' and coll_wr_b_rd_a = '0' and coll_wr_b_rd_a_sim = '0') then
         for raa in 0 to (rd_loops_a-1) loop
           mem_rd_a_wf(raa) <= mem(to_integer(rd_addr_a) + raa);
           if (raa<mem_width*rd_loops_a/8) then
             memp_rd_a_wf(raa) <= memp(to_integer(rd_addr_a)/8 + raa);
           end if;
         end loop;
       end if;
     end if;
   end process;

   MRAA : process (rd_addr_a, mem_rd_en_a, mem_rst_a, wr_a_event, wr_b_event, INIT_MEM) begin
     if ((mem_rd_en_a = '1' or INIT_MEM = '1') and ADDR_IS_VALID(rd_addr_a_slv) and 
         (mem_rst_a = '0')) then
       for raa in 0 to (rd_loops_a-1) loop
         mem_rd_a(raa) <= mem(to_integer(rd_addr_a) + raa);
         if (raa<mem_width*rd_loops_a/8) then
           memp_rd_a(raa) <= memp(to_integer(rd_addr_a)/8 + raa);
         end if;
       end loop;
     end if;
   end process MRAA;

   MRA  : process
     variable Message : line;
     begin
     if (rising_edge(mem_rd_clk_a) or INIT_MEM='1') then
       if (glblGSR = '1' or INIT_MEM='1') then
         for ra in 0 to (rd_loops_a-1) loop
           mem_a_lat(ra) <= INIT_A_int(ra);
           if (ra<rd_loops_a/8) then
             memp_a_lat(ra) <= INIT_A_int(D_WIDTH + ra);
           end if;
         end loop;
         first_read <= '0';
       elsif ((SLEEP_A_int = '1') and mem_rd_en_a = '1') then
         Write ( Message, string'("Error : [Unisim "));
         Write ( Message, string'(MODULE_NAME));
         Write ( Message, string'("-24] "));
         Write ( Message, string'(" : instance "));
         Write ( Message, string'(RAMB36E2_V'PATH_NAME));
         Write ( Message, string'(" at time "));
         Write ( Message, now);
         Write ( Message, string'("."));
         Write ( Message, LF);
         Write ( Message, string'("READ on port A attempted while in SLEEP mode."));
         assert false report Message.all severity warning;
         DEALLOCATE (Message);
         for ra in 0 to (rd_loops_a-1) loop
           mem_a_lat(ra) <= 'X';
           if (ra<rd_loops_a/8) then
             memp_a_lat(ra) <= 'X';
           end if;
         end loop;
       elsif (mem_rst_a = '1' and mem_rd_en_a = '1') then
         for ra in 0 to (rd_loops_a-1) loop
           mem_a_lat(ra) <= SRVAL_A_int(ra);
           if (ra<rd_loops_a/8) then
             memp_a_lat(ra) <= SRVAL_A_int(D_WIDTH + ra);
           end if;
         end loop;
       elsif (mem_rd_en_a = '1') then
         if (EN_ECC_READ_BIN = EN_ECC_READ_TRUE) then
           mem_a_lat <= mem_a_ecc_cor;
           memp_a_lat <= memp_a_ecc_cor;
         else
           mem_a_lat <= mem_rd_a;
           memp_a_lat <= memp_rd_a;
         end if;
         first_read <= '1';
       end if;
     elsif (rd_a_wr_b_coll = '1' or wr_b_rd_a_coll = '1' or wr_a_wr_b_coll = '1' or wr_b_wr_a_coll = '1') then
       if ((wr_b_data_matches_rd_a_data = '0') and
           ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
            (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY))) then
         for ra in 0 to (rd_loops_a-1) loop
           mem_a_lat(ra) <= 'X';
           if (ra<rd_loops_a/8) then
             memp_a_lat(ra) <= 'X';
           end if;
         end loop;
       end if;
     end if;
     wait on mem_rd_clk_a, wr_b_rd_a_coll, rd_a_wr_b_coll, wr_a_wr_b_coll, wr_b_wr_a_coll, INIT_MEM;
   end process MRA;

   MRBWF : process (wr_b_event) begin
     if (ADDR_IS_VALID(rd_addr_b_slv)) then
       if (coll_wr_sim = '1' or coll_wr_a_wr_b = '1' or coll_wr_b_wr_a = '1') then
         for rbb in 0 to (rd_loops_b-1) loop
           mem_rd_b_wf(rbb) <= 'X';
           if (rbb<rd_loops_b/8) then
             memp_rd_b_wf(rbb) <= 'X';
           end if;
         end loop;
       elsif (coll_rd_b_wr_a = '0' and coll_wr_a_rd_b = '0' and coll_wr_a_rd_b_sim = '0') then
         for rbb in 0 to (rd_loops_b-1) loop
           mem_rd_b_wf(rbb) <= mem(to_integer(rd_addr_b) + rbb);
           if (rbb<rd_loops_b/8) then
             memp_rd_b_wf(rbb) <= memp (to_integer(rd_addr_b)/8 + rbb);
           end if;
         end loop;
       end if;
     end if;
   end process;

   MRBB : process (rd_addr_b, mem_rd_en_b, mem_rst_b, wr_b_event, wr_a_event) begin
     if ((mem_rd_en_b = '1' or INIT_MEM = '1') and ADDR_IS_VALID(rd_addr_b_slv) and 
          (mem_rst_b = '0')) then
       for rbb in 0 to (rd_loops_b-1) loop
         mem_rd_b(rbb) <= mem(to_integer(rd_addr_b) + rbb);
         if (rbb<rd_loops_b/8) then
           memp_rd_b(rbb) <= memp (to_integer(rd_addr_b)/8 + rbb);
         end if;
       end loop;
     end if;
   end process MRBB;

   MRB  : process
     variable Message : line;
     begin
     if (rising_edge(mem_rd_clk_b) or INIT_MEM='1') then
       if (glblGSR = '1' or INIT_MEM='1') then
         for rb in 0 to (rd_loops_b-1) loop
           mem_b_lat(rb) <= INIT_B_int(rb);
           if (rb<rd_loops_b/8) then
             memp_b_lat(rb) <= INIT_B_int(D_WIDTH/2 + rb);
           end if;
         end loop;
       elsif ((SLEEP_B_int = '1') and mem_rd_en_b = '1') then
         Write ( Message, string'("Error : [Unisim "));
         Write ( Message, string'(MODULE_NAME));
         Write ( Message, string'("-25] "));
         Write ( Message, string'(" : instance "));
         Write ( Message, string'(RAMB36E2_V'PATH_NAME));
         Write ( Message, string'(" at time "));
         Write ( Message, now);
         Write ( Message, string'("."));
         Write ( Message, LF);
         Write ( Message, string'("READ on port B attempted while in SLEEP mode."));
         assert false report Message.all severity warning;
         DEALLOCATE (Message);
       elsif (mem_rst_b = '1' and mem_rd_en_b = '1') then
         for rb in 0 to (rd_loops_b-1) loop
           mem_b_lat(rb) <= SRVAL_B_int(rb);
           if (rb<rd_loops_b/8) then
             memp_b_lat(rb) <= SRVAL_B_int(D_WIDTH/2 + rb);
           end if;
         end loop;
       elsif (mem_rd_en_b = '1') then
         mem_b_lat <= mem_rd_b(D_WIDTH/2-1 downto 0);
         memp_b_lat <= memp_rd_b(DP_WIDTH/2-1 downto 0);
       end if;
     elsif (rd_b_wr_a_coll = '1' or wr_a_rd_b_coll = '1' or wr_a_wr_b_coll = '1' or wr_b_wr_a_coll = '1') then
       if ((wr_a_data_matches_rd_b_data = '0') and
           ((SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_ALL) or
            (SIM_COLLISION_CHECK_BIN = SIM_COLLISION_CHECK_GENERATE_X_ONLY))) then
         for rb in 0 to (rd_loops_b-1) loop
           mem_b_lat(rb) <= 'X';
           if (rb<rd_loops_b/8) then
             memp_b_lat(rb) <= 'X';
           end if;
         end loop;
       end if;
     end if;
     wait on mem_rd_clk_b, wr_a_rd_b_coll, rd_b_wr_a_coll, wr_a_wr_b_coll, wr_b_wr_a_coll, INIT_MEM;
     end process MRB;

-- write engine
   MWE  : process
     variable Message : line;
     variable mem_init : tmp_mem_t;
     variable tmp_mem_tmp : std_logic_vector(tmp_mem_width-1 downto 0) := (others => '0');
     variable d : integer := 0;
     variable w : integer := 0;
     begin
     if (INIT_MEM = '1') then
       if (INIT_FILE = "NONE") then
         for wa in 0 to mem_depth/256-1 loop
           for wb in 0 to 255 loop
             mem (wa*256+wb) <= INIT_REG(wa)(wb);
             if (wa<memp_depth/256) then
               memp (wa*256+wb) <= INITP_REG(wa)(wb);
             end if;
           end loop;
         end loop;
       else
-- INIT_FILE
       mem_init := read_init_file;
       for d in 0 to tmp_mem_depth-1 loop
         tmp_mem_tmp := mem_init(d);
         for w in 0 to tmp_mem_width-tmp_memp_width-1 loop
           mem(d*(tmp_mem_width-tmp_memp_width)+w) <= tmp_mem_tmp(w);
         end loop;
         if (tmp_memp_width > 0) then
           for w in 0 to tmp_memp_width-1 loop
             memp(d*tmp_memp_width+w) <= tmp_mem_tmp(tmp_mem_width-tmp_memp_width+w);
           end loop;
         end if;
       end loop;
-- INIT_FILE
       end if;
       wr_b_event <= not wr_b_event;
     end if;
     if (wr_a_wr_b_coll = '1') then
       if (wr_data_matches = '0') then
         for wa in 0 to wr_loops_a-1 loop
           if (mem_we_a(wa) = '1') then
              mem (to_integer(wr_addr_a)+wa) <= 'X';
           end if;
           if (wa<wr_loops_a/8) then
             if (memp_we_a(wa) = '1') then
               memp ((mem_width*to_integer(wr_addr_a)/8)+wa) <= 'X';
             end if;
           end if;
         end loop;
       end if;
     end if;
     if (wr_b_wr_a_coll = '1') then
       if (wr_data_matches = '0') then
         for wb in 0 to wr_loops_b-1 loop
           if (mem_we_b(wb) = '1') then
              mem (to_integer(wr_addr_b)+wb) <= 'X';
           end if;
           if (wb<wr_loops_b/8) then
             if (memp_we_b(wb) = '1') then
               memp ((mem_width*to_integer(wr_addr_b)/8)+wb) <= 'X';
             end if;
           end if;
         end loop;
       end if;
     end if;
     if (rising_edge(mem_wr_clk_a) and (mem_wr_en_a = '1') and (wr_a_wr_b_coll = '0')) then
       if (SLEEP_A_int = '1') then
         Write ( Message, string'("Error : [Unisim "));
         Write ( Message, string'(MODULE_NAME));
         Write ( Message, string'("-26] "));
         Write ( Message, string'(" : instance "));
         Write ( Message, string'(RAMB36E2_V'PATH_NAME));
         Write ( Message, string'(" at time "));
         Write ( Message, now);
         Write ( Message, string'("."));
         Write ( Message, LF);
         Write ( Message, string'("WRITE on port A attempted while in SLEEP mode."));
         assert false report Message.all severity warning;
         DEALLOCATE (Message);
       else
         for wa in 0 to rd_loops_a-1 loop
           mem_rd_a_rf(wa)                <= mem (to_integer(rd_addr_a)+wa);
           if (wa<rd_loops_a/8) then
             memp_rd_a_rf(wa)             <= memp (to_integer(rd_addr_a)/8 + wa);
           end if;
         end loop;
         for wa in 0 to wr_loops_a-1 loop
           if (mem_we_a(wa) = '1') then
             mem (to_integer(wr_addr_a)+wa) <= mem_wr_a(wa);
           end if;
           if (wa<wr_loops_a/8) then
             if (memp_we_a(wa) = '1') then
               memp (to_integer(wr_addr_a)/8 + wa) <= memp_wr_a(wa);
             end if;
           end if;
         end loop;
         wr_a_event <= not wr_a_event;
       end if;
     end if;
     if (rising_edge(mem_wr_clk_b) and (mem_wr_en_b = '1') and (wr_b_wr_a_coll = '0')) then
       if (SLEEP_B_int = '1') then
         Write ( Message, string'("Error : [Unisim "));
         Write ( Message, string'(MODULE_NAME));
         Write ( Message, string'("-27] "));
         Write ( Message, string'(" : instance "));
         Write ( Message, string'(RAMB36E2_V'PATH_NAME));
         Write ( Message, string'(" at time "));
         Write ( Message, now);
         Write ( Message, string'("."));
         Write ( Message, LF);
         Write ( Message, string'("WRITE on port B attempted while in SLEEP mode."));
         assert false report Message.all severity warning;
         DEALLOCATE (Message);
       else
         for wb in 0 to rd_loops_b-1 loop
           mem_rd_b_rf(wb)                <= mem (to_integer(rd_addr_b)+wb);
           if (wb<rd_loops_b/8) then
             memp_rd_b_rf(wb)             <= memp (to_integer(rd_addr_b)/8 + wb);
           end if;
         end loop;
         for wb in 0 to wr_loops_b-1 loop
           if (mem_we_b(wb) = '1') then
             mem (to_integer(wr_addr_b)+wb) <= mem_wr_b(wb);
           end if;
           if (wb<wr_loops_b/8) then
             if (memp_we_b(wb) = '1') then
               memp (to_integer(wr_addr_b)/8 + wb) <= memp_wr_b(wb);
             end if;
           end if;
         end loop;
         wr_b_event <= not wr_b_event;
       end if;
     end if;
     wait on mem_wr_clk_b, mem_wr_clk_a, wr_b_wr_a_coll, wr_a_wr_b_coll, INIT_MEM;
   end process MWE;

  mem_rm_douta <= not mem_rm_a and mem_rm_douta_x
                  when sdp_mode_rd = '0' else (others => '0');
  memp_rm_douta <= not memp_rm_a and memp_rm_douta_x
                   when sdp_mode_rd = '0' else (others => '0');
  mem_rm_doutb <= not mem_rm_b(D_WIDTH/2-1 downto 0) and mem_rm_doutb_x
                  when sdp_mode_rd = '0' else (others => '0');
  memp_rm_doutb <= not memp_rm_b and memp_rm_doutb_x
                   when sdp_mode_rd = '0' else (others => '0');
  RWAS  : process
    begin
      if ((CLKARDCLK_in = '0') and ADDR_IS_VALID(ADDRARDADDR_in) and (ADDRENA_in = '1')) then
        if (coll_win_rd_clk_a_max = '0') then rd_addr_a_slv <= ADDRARDADDR_in and rd_addr_a_mask; end if;
        if (coll_win_wr_clk_a_max = '0') then wr_addr_a_slv <= ADDRARDADDR_in and wr_addr_a_mask; end if;
      end if;
      wait on CLKARDCLK_in, ADDRARDADDR_in, ADDRENA_in, coll_win_wr_clk_a_max, coll_win_rd_clk_a_max;
    end process;

  RWBS  : process
    begin
      if ((CLKBWRCLK_in = '0') and ADDR_IS_VALID(ADDRBWRADDR_in) and (ADDRENB_in = '1')) then
        if (sdp_mode = '1') then
           if (coll_win_rd_clk_b_max = '0') then rd_addr_b_slv <= ADDRARDADDR_in and rd_addr_a_mask; end if;
        else
           if (coll_win_rd_clk_b_max = '0') then rd_addr_b_slv <= ADDRBWRADDR_in and rd_addr_b_mask; end if;
        end if;
           if (coll_win_wr_clk_b_max = '0') then wr_addr_b_slv <= ADDRBWRADDR_in and wr_addr_b_mask; end if;
      end if;
      wait on CLKBWRCLK_in, ADDRBWRADDR_in, ADDRENB_in, coll_win_rd_clk_b_max, coll_win_wr_clk_b_max;
    end process;

  rd_addr_a <= unsigned(rd_addr_a_slv);
  rd_addr_b <= unsigned(rd_addr_b_slv);
  wr_addr_a <= unsigned(wr_addr_a_slv);
  wr_addr_b <= unsigned(wr_addr_b_slv);
  wr_addr_coll <= '1' when (((wr_addr_a_slv and wr_addr_b_mask) = (wr_addr_b_slv and wr_addr_a_mask)) and (sdp_mode = '0') and (mem_wr_en_a = '1') and (mem_wr_en_b = '1') and (mem_rst_a = '0') and (mem_rst_b = '0')) else '0';
  wr_a_rd_b_addr_coll <= '1' when (((wr_addr_a_slv and rd_addr_b_mask) = (rd_addr_b_slv and wr_addr_a_mask)) and (sdp_mode = '0') and (mem_wr_en_a = '1') and (mem_rd_en_b = '1') and (mem_wr_en_b = '0') and (mem_rst_a = '0') and (mem_rst_b = '0')) else '0';
  wr_b_rd_a_addr_coll <= '1' when (((wr_addr_b_slv and rd_addr_a_mask) = (rd_addr_a_slv and wr_addr_b_mask)) and (mem_wr_en_b = '1') and (mem_rd_en_a = '1') and (mem_wr_en_a = '0') and (mem_rst_a = '0') and (mem_rst_b = '0')) else '0';


  mem_we_a <= (X"00000000" & 
               WEA_in(3) & WEA_in(3) & WEA_in(3) & WEA_in(3) &
               WEA_in(3) & WEA_in(3) & WEA_in(3) & WEA_in(3) &
               WEA_in(2) & WEA_in(2) & WEA_in(2) & WEA_in(2) &
               WEA_in(2) & WEA_in(2) & WEA_in(2) & WEA_in(2) &
               WEA_in(1) & WEA_in(1) & WEA_in(1) & WEA_in(1) &
               WEA_in(1) & WEA_in(1) & WEA_in(1) & WEA_in(1) &
               WEA_in(0) & WEA_in(0) & WEA_in(0) & WEA_in(0) &
               WEA_in(0) & WEA_in(0) & WEA_in(0) & WEA_in(0)) and mem_wm_a;
  mem_we_b <= (WEBWE_in(7) & WEBWE_in(7) & WEBWE_in(7) & WEBWE_in(7) &
               WEBWE_in(7) & WEBWE_in(7) & WEBWE_in(7) & WEBWE_in(7) &
               WEBWE_in(6) & WEBWE_in(6) & WEBWE_in(6) & WEBWE_in(6) &
               WEBWE_in(6) & WEBWE_in(6) & WEBWE_in(6) & WEBWE_in(6) &
               WEBWE_in(5) & WEBWE_in(5) & WEBWE_in(5) & WEBWE_in(5) &
               WEBWE_in(5) & WEBWE_in(5) & WEBWE_in(5) & WEBWE_in(5) &
               WEBWE_in(4) & WEBWE_in(4) & WEBWE_in(4) & WEBWE_in(4) &
               WEBWE_in(4) & WEBWE_in(4) & WEBWE_in(4) & WEBWE_in(4) &
               WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) &
               WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) &
               WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) &
               WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) &
               WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) &
               WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) &
               WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0) &
               WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0)) and mem_wm_b;
  memp_we_a <= "0000" & WEA_in when (WRITE_WIDTH_A_BIN > WRITE_WIDTH_A_4) else X"00";
  memp_we_b <= WEBWE_in when (WRITE_WIDTH_B_BIN > WRITE_WIDTH_B_4) else X"00";

-- eccparity is flopped
    synd_wr <= fn_ecc(encode, DINBDIN_in & DINADIN_in, DINPBDINP_in & DINPADINP_in);
    synd_rd <= fn_ecc(decode, mem_rd_a, memp_rd_a) when ADDR_IS_VALID(mem_rd_a & memp_rd_a)
               else X"00";
    synd_ecc_raw <= synd_rd xor memp_rd_a when
                    ((EN_ECC_READ_BIN = EN_ECC_READ_TRUE) and ADDR_IS_VALID(memp_rd_a))
                    else X"00";
    synd_ecc <= UNSIGNED(synd_ecc_raw(6 downto 0));
    error_bit <= to_integer(synd_ecc) when synd_ecc > 0 else 0;
    mem_a_ecc_res <= fn_cor_bit(error_bit, mem_rd_a, memp_rd_a);
    memp_a_ecc_cor <= mem_a_ecc_res(DP_WIDTH+D_WIDTH-1 downto D_WIDTH)
                    when (sbit_int = '1') else memp_rd_a;
    mem_a_ecc_cor  <= mem_a_ecc_res(D_WIDTH-1 downto 0)
                    when (sbit_int = '1') else mem_rd_a;
    sbit_int <= bit_or(synd_ecc_raw(6 downto 0)) and synd_ecc_raw(7);
    dbit_int <= bit_or(synd_ecc_raw(6 downto 0)) and not synd_ecc_raw(7);
    r_a_ecc_int <= std_logic_vector(rd_addr_a(ADDR_WIDTH-1 downto ADDR_WIDTH-9));

   ECC  : process (mem_rd_clk_a) begin
     if (rising_edge(mem_rd_clk_a)) then
       if (mem_rd_en_a = '1' and mem_rst_a = '1') then
         sbit_lat  <= '0';
         dbit_lat  <= '0';
         r_a_ecc_lat <= (others => '0');
       elsif (mem_rd_en_a = '1' and (EN_ECC_READ_BIN = EN_ECC_READ_TRUE)) then
         sbit_lat <= sbit_int;
         dbit_lat <= dbit_int;
         r_a_ecc_lat <= r_a_ecc_int;
       end if;
     end if;
     end process ECC;

   EPO  : process (mem_wr_clk_b) begin
     if (rising_edge(mem_wr_clk_b)) then
       if ((glblGSR = '1') or (EN_ECC_WRITE_BIN = EN_ECC_WRITE_FALSE)) then
        eccparity_reg <= (others => '0');
       elsif (mem_wr_en_b = '1') then
        eccparity_reg <= synd_wr;
       end if;
     end if;
     end process EPO;

  end RAMB36E2_V;
