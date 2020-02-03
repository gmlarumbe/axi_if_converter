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
-- /___/   /\      Filename    : RAMB18E2.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
-------------------------------------------------------------------------------
--  Revision
--  03/15/2013 - intial from FIFO
--  03/21/2013 - 707635 - port B read first acting like write first. WRITE/READ typo.
--  03/22/2013 - sync5 yaml update, port ordering
--  03/26/2013 - 707719 - Add sync5 cascade feature
--  03/27/2013 - 708743 - neg edge sensitivity to RD clk and revert NO_CHANGE fix
--  04/23/2013 - PR683925 - add invertible pin support.
--  End Revision
-------------------------------------------------------------------------------

----- CELL RAMB18E2 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity RAMB18E2 is
    generic (
      CASCADE_ORDER_A : string := "NONE";
      CASCADE_ORDER_B : string := "NONE";
      CLOCK_DOMAINS : string := "INDEPENDENT";
      DOA_REG : integer := 1;
      DOB_REG : integer := 1;
      ENADDRENA : string := "FALSE";
      ENADDRENB : string := "FALSE";
      INITP_00 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : std_logic_vector (255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000";
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
      INIT_A : std_logic_vector (17 downto 0) := "00" & X"0000";
      INIT_B : std_logic_vector (17 downto 0) := "00" & X"0000";
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
      SRVAL_A : std_logic_vector (17 downto 0) := "00" & X"0000";
      SRVAL_B : std_logic_vector (17 downto 0) := "00" & X"0000";
      WRITE_MODE_A : string := "NO_CHANGE";
      WRITE_MODE_B : string := "NO_CHANGE";
      WRITE_WIDTH_A : integer := 0;
      WRITE_WIDTH_B : integer := 0
    );

    port (
      CASDOUTA             : out std_logic_vector(15 downto 0);
      CASDOUTB             : out std_logic_vector(15 downto 0);
      CASDOUTPA            : out std_logic_vector(1 downto 0);
      CASDOUTPB            : out std_logic_vector(1 downto 0);
      DOUTADOUT            : out std_logic_vector(15 downto 0);
      DOUTBDOUT            : out std_logic_vector(15 downto 0);
      DOUTPADOUTP          : out std_logic_vector(1 downto 0);
      DOUTPBDOUTP          : out std_logic_vector(1 downto 0);
      ADDRARDADDR          : in std_logic_vector(13 downto 0);
      ADDRBWRADDR          : in std_logic_vector(13 downto 0);
      ADDRENA              : in std_ulogic;
      ADDRENB              : in std_ulogic;
      CASDIMUXA            : in std_ulogic;
      CASDIMUXB            : in std_ulogic;
      CASDINA              : in std_logic_vector(15 downto 0);
      CASDINB              : in std_logic_vector(15 downto 0);
      CASDINPA             : in std_logic_vector(1 downto 0);
      CASDINPB             : in std_logic_vector(1 downto 0);
      CASDOMUXA            : in std_ulogic;
      CASDOMUXB            : in std_ulogic;
      CASDOMUXEN_A         : in std_ulogic;
      CASDOMUXEN_B         : in std_ulogic;
      CASOREGIMUXA         : in std_ulogic;
      CASOREGIMUXB         : in std_ulogic;
      CASOREGIMUXEN_A      : in std_ulogic;
      CASOREGIMUXEN_B      : in std_ulogic;
      CLKARDCLK            : in std_ulogic;
      CLKBWRCLK            : in std_ulogic;
      DINADIN              : in std_logic_vector(15 downto 0);
      DINBDIN              : in std_logic_vector(15 downto 0);
      DINPADINP            : in std_logic_vector(1 downto 0);
      DINPBDINP            : in std_logic_vector(1 downto 0);
      ENARDEN              : in std_ulogic;
      ENBWREN              : in std_ulogic;
      REGCEAREGCE          : in std_ulogic;
      REGCEB               : in std_ulogic;
      RSTRAMARSTRAM        : in std_ulogic;
      RSTRAMB              : in std_ulogic;
      RSTREGARSTREG        : in std_ulogic;
      RSTREGB              : in std_ulogic;
      SLEEP                : in std_ulogic;
      WEA                  : in std_logic_vector(1 downto 0);
      WEBWE                : in std_logic_vector(3 downto 0)      
    );
  end RAMB18E2;

  architecture RAMB18E2_V of RAMB18E2 is
    
    constant MODULE_NAME : string := "RAMB18E2";

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
    constant READ_WIDTH_A_9 : integer := 8;
    constant READ_WIDTH_B_0 : integer := 1;
    constant READ_WIDTH_B_1 : integer := 1;
    constant READ_WIDTH_B_18 : integer := 16;
    constant READ_WIDTH_B_2 : integer := 2;
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
    constant WRITE_WIDTH_A_4  : integer := 4;
    constant WRITE_WIDTH_A_9  : integer := 8;
    constant WRITE_WIDTH_B_0  : integer := 1;
    constant WRITE_WIDTH_B_1  : integer := 1;
    constant WRITE_WIDTH_B_18 : integer := 16;
    constant WRITE_WIDTH_B_2  : integer := 2;
    constant WRITE_WIDTH_B_36 : integer := 32;
    constant WRITE_WIDTH_B_4  : integer := 4;
    constant WRITE_WIDTH_B_9  : integer := 8;
    signal CASCADE_ORDER_A_BIN : integer;
    signal CASCADE_ORDER_B_BIN : integer;

    signal CLOCK_DOMAINS_BIN : integer;
    signal DOA_REG_BIN : integer := 0;
    signal DOB_REG_BIN : integer := 0;
    signal ENADDRENA_BIN : integer := 0;
    signal ENADDRENB_BIN : integer := 0;
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

    constant ADDR_WIDTH : integer := 14;
    constant INIT_WIDTH : integer :=  36;
    constant D_WIDTH : integer :=  32;
    constant DP_WIDTH : integer := 4;

    constant mem_width : integer := 1;
    constant memp_width : integer := 1;
    constant mem_depth : integer := 16384;
    constant memp_depth : integer := 2048;
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
                                     INITP_07);
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
                                   INIT_3F);
    constant INIT_A_BIN : std_logic_vector(17 downto 0) := INIT_A;
    constant INIT_B_BIN : std_logic_vector(17 downto 0) := INIT_B;
    constant SRVAL_A_BIN : std_logic_vector(17 downto 0) := SRVAL_A;
    constant SRVAL_B_BIN : std_logic_vector(17 downto 0) := SRVAL_B;

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
    

    signal glblGSR : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    signal CASDOUTA_out : std_logic_vector(15 downto 0);
    signal CASDOUTB_out : std_logic_vector(15 downto 0);
    signal CASDOUTPA_out : std_logic_vector(1 downto 0);
    signal CASDOUTPB_out : std_logic_vector(1 downto 0);
    signal DOUTADOUT_out : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal DOUTBDOUT_out : std_logic_vector(D_WIDTH/2-1 downto 0);
    signal DOUTPADOUTP_out : std_logic_vector(DP_WIDTH/2-1 downto 0);
    signal DOUTPBDOUTP_out : std_logic_vector(DP_WIDTH/2-1 downto 0);
    
    
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
    signal CASOREGIMUXA_in : std_ulogic;
    signal CASOREGIMUXB_in : std_ulogic;
    signal CASOREGIMUXEN_A_in : std_ulogic;
    signal CASOREGIMUXEN_B_in : std_ulogic;
    signal CLKARDCLK_in : std_ulogic;
    signal CLKBWRCLK_in : std_ulogic;
    signal DINADIN_in : std_logic_vector(15 downto 0);
    signal DINBDIN_in : std_logic_vector(15 downto 0);
    signal DINPADINP_in : std_logic_vector(1 downto 0);
    signal DINPBDINP_in : std_logic_vector(1 downto 0);
    signal ENARDEN_in : std_ulogic;
    signal ENBWREN_in : std_ulogic;
    signal REGCEAREGCE_in : std_ulogic;
    signal REGCEB_in : std_ulogic;
    signal RSTRAMARSTRAM_in : std_ulogic;
    signal RSTRAMB_in : std_ulogic;
    signal RSTREGARSTREG_in : std_ulogic;
    signal RSTREGB_in : std_ulogic;
    signal SLEEP_in : std_ulogic;
    signal WEA_in : std_logic_vector(1 downto 0);
    signal WEBWE_in : std_logic_vector(3 downto 0);
    
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
   signal INIT_A_BIN_8_4   : std_logic_vector (3 downto 0) := (others => '0');
   signal INIT_A_BIN_7_0_4 : std_logic_vector (31 downto 0) := (others => '0');
   signal INIT_A_BIN_17_16_2 : std_logic_vector (3 downto 0) := (others => '0');
   signal INIT_A_BIN_15_0_2 : std_logic_vector (31 downto 0) := (others => '0');
   signal INIT_BA_BIN_17_16 : std_logic_vector (3 downto 0) := (others => '0');
   signal INIT_BA_BIN_15_0  : std_logic_vector (31 downto 0) := (others => '0');
   signal INIT_B_BIN_8_2   : std_logic_vector (1 downto 0) := (others => '0');
   signal INIT_B_BIN_7_0_2 : std_logic_vector (15 downto 0) := (others => '0');
   signal SRVAL_A_BIN_8_4   : std_logic_vector (3 downto 0) := (others => '0');
   signal SRVAL_A_BIN_7_0_4 : std_logic_vector (31 downto 0) := (others => '0');
   signal SRVAL_A_BIN_17_16_2 : std_logic_vector (3 downto 0) := (others => '0');
   signal SRVAL_A_BIN_15_0_2 : std_logic_vector (31 downto 0) := (others => '0');
   signal SRVAL_BA_BIN_17_16 : std_logic_vector (3 downto 0) := (others => '0');
   signal SRVAL_BA_BIN_15_0  : std_logic_vector (31 downto 0) := (others => '0');
   signal SRVAL_B_BIN_8_2   : std_logic_vector (1 downto 0) := (others => '0');
   signal SRVAL_B_BIN_7_0_2 : std_logic_vector (15 downto 0) := (others => '0');
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

    begin
-- input output assignments
    glblGSR     <= TO_X01(GSR);

    CASDOUTA <= CASDOUTA_out;
    CASDOUTB <= CASDOUTB_out;
    CASDOUTPA <= CASDOUTPA_out;
    CASDOUTPB <= CASDOUTPB_out;
    DOUTADOUT <= DOUTADOUT_out;
    DOUTBDOUT <= DOUTBDOUT_out;
    DOUTPADOUTP <= DOUTPADOUTP_out;
    DOUTPBDOUTP <= DOUTPBDOUTP_out;
    
    
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
    ENARDEN_in <= ENARDEN xor IS_ENARDEN_INVERTED_BIN;
    ENBWREN_in <= ENBWREN xor IS_ENBWREN_INVERTED_BIN;
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
  mem_wr_a <= X"0000" & DINADIN_in;
  mem_wr_b <= X"0000" & DINBDIN_in when (WRITE_WIDTH_B_BIN /= WRITE_WIDTH_B_36) else
              (DINBDIN_in & DINADIN_in);
  memp_wr_a <= "00" & DINPADINP_in;
  memp_wr_b <= "00" & DINPBDINP_in when (WRITE_WIDTH_B_BIN /= WRITE_WIDTH_B_36) else
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
        assert FALSE report "Error [Unisim RAMB18E2-101] : CASCADE_ORDER_A = is not NONE, FIRST, LAST or MIDDLE." severity error;
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
        assert FALSE report "Error [Unisim RAMB18E2-102] : CASCADE_ORDER_B = is not NONE, FIRST, LAST or MIDDLE." severity error;
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
    Write ( Message, string'(RAMB18E2_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -- case ENADDRENA is
      if(ENADDRENA = "FALSE") then
        ENADDRENA_BIN <= ENADDRENA_FALSE;
      elsif(ENADDRENA = "TRUE") then
        ENADDRENA_BIN <= ENADDRENA_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB18E2-103] : ENADDRENA = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case ENADDRENB is
      if(ENADDRENB = "FALSE") then
        ENADDRENB_BIN <= ENADDRENB_FALSE;
      elsif(ENADDRENB = "TRUE") then
        ENADDRENB_BIN <= ENADDRENB_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB18E2-104] : ENADDRENB = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case RDADDRCHANGEA is
      if(RDADDRCHANGEA = "FALSE")then
        RDADDRCHANGEA_BIN <= RDADDRCHANGEA_FALSE;
      elsif(RDADDRCHANGEA = "TRUE") then
        RDADDRCHANGEA_BIN <= RDADDRCHANGEA_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB18E2-105] : RDADDRCHANGEA = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case RDADDRCHANGEB is
      if(RDADDRCHANGEB = "FALSE") then
        RDADDRCHANGEB_BIN <= RDADDRCHANGEB_FALSE;
      elsif(RDADDRCHANGEB = "TRUE") then
        RDADDRCHANGEB_BIN <= RDADDRCHANGEB_TRUE;
      else
        assert FALSE report "Error [Unisim RAMB18E2-106] : RDADDRCHANGEB = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    -- case RSTREG_PRIORITY_A is
      if(RSTREG_PRIORITY_A = "RSTREG") then
        RSTREG_PRIORITY_A_BIN <= RSTREG_PRIORITY_A_RSTREG;
      elsif(RSTREG_PRIORITY_A = "REGCE") then
        RSTREG_PRIORITY_A_BIN <= RSTREG_PRIORITY_A_REGCE;
      else
        assert FALSE report "Error [Unisim RAMB18E2-107] : RSTREG_PRIORITY_A = is not RSTREG, REGCE." severity error;
      end if;
    -- end case;
    -- case RSTREG_PRIORITY_B is
      if(RSTREG_PRIORITY_B = "RSTREG") then
        RSTREG_PRIORITY_B_BIN <= RSTREG_PRIORITY_B_RSTREG;
      elsif(RSTREG_PRIORITY_B = "REGCE") then
        RSTREG_PRIORITY_B_BIN <= RSTREG_PRIORITY_B_REGCE;
      else
        assert FALSE report "Error [Unisim RAMB18E2-108] : RSTREG_PRIORITY_B = is not RSTREG, REGCE." severity error;
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
        assert FALSE report "Error [Unisim RAMB18E2-109] : SIM_COLLISION_CHECK = is not ALL, GENERATE_X_ONLY, NONE, WARNING_ONLY." severity error;
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
    Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        assert FALSE report "Error [Unisim RAMB18E2-110] : WRITE_MODE_A = is not NO_CHANGE, READ_FIRST, WRITE_FIRST." severity error;
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
        assert FALSE report "Error [Unisim RAMB18E2-111] : WRITE_MODE_B = is not NO_CHANGE, READ_FIRST, WRITE_FIRST." severity error;
      end if;
    -- end case;
    case DOA_REG is
      when  1   =>  DOA_REG_BIN <= DOA_REG_1;
      when  0   =>  DOA_REG_BIN <= DOA_REG_0;
      when others  =>  assert FALSE report "Error [Unisim RAMB18E2-112] : DOA_REG is not in range 0 .. 1." severity error;
    end case;
    case DOB_REG is
      when  1   =>  DOB_REG_BIN <= DOB_REG_1;
      when  0   =>  DOB_REG_BIN <= DOB_REG_0;
      when others  =>  assert FALSE report "Error [Unisim RAMB18E2-113] : DOB_REG is not in range 0 .. 1." severity error;
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
      when others  =>  assert FALSE report "Error [Unisim RAMB18E2-114]: READ_WIDTH_A is not 0, 1, 2, 4, 9, 18 or 36." severity error;
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
      when others  =>  assert FALSE report "Error [Unisim RAMB18E2-116]: READ_WIDTH_B is not 0, 1, 2, 4, 9, 18 or 36." severity error;
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
      when others  =>  assert FALSE report "Error [Unisim RAMB18E2-120]: WRITE_WIDTH_A is not 0, 1, 2, 4, 9 or 18." severity error;
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
      when others  =>  assert FALSE report "Error [Unisim RAMB18E2-121]: WRITE_WIDTH_B is not 0, 1, 2, 4, 9, 18 or 36." severity error;
    end case;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-137] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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

   sdp_mode_rd <= '1' when (READ_WIDTH_A_BIN = READ_WIDTH_A_36) else '0';
   sdp_mode_wr <= '1' when (WRITE_WIDTH_B_BIN = WRITE_WIDTH_B_36) else '0';
   sdp_mode <= sdp_mode_rd or sdp_mode_wr;
   REGCE_A_int  <= REGCEAREGCE_in;
   REGCE_B_int  <= REGCEB_in;
   RSTREG_A_int <= RSTREGARSTREG_in when (RSTREG_PRIORITY_A_BIN = RSTREG_PRIORITY_A_RSTREG)
                   else RSTREGARSTREG_in and REGCEAREGCE_in;
   RSTREG_B_int <= RSTREGB_in when (RSTREG_PRIORITY_B_BIN = RSTREG_PRIORITY_B_RSTREG)
                   else RSTREGB_in and REGCEB_in;
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

   mem_a_out  <= mem_rd_a_wf  when (mem_wr_en_a_wf = '1') else mem_a_lat;
   memp_a_out <= memp_rd_a_wf when (mem_wr_en_a_wf = '1') else memp_a_lat;

   mem_b_out  <= mem_rd_b_wf  when (mem_wr_en_b_wf = '1') else mem_b_lat;
   memp_b_out <= memp_rd_b_wf when (mem_wr_en_b_wf = '1') else memp_b_lat;
   mem_b_mux   <= mem_a_reg(31 downto 16) when
                          ((DOA_REG_BIN = DOA_REG_1) and (sdp_mode_rd = '1'))
                      else mem_a_out(31 downto 16) when
                          ((DOA_REG_BIN = DOA_REG_0) and (sdp_mode_rd = '1'))
                      else mem_b_reg when
                          ((DOB_REG_BIN = DOB_REG_1) and (sdp_mode_rd = '0'))
                      else mem_b_out;
   memp_b_mux  <= memp_a_reg(3 downto 2) when
                          ((DOA_REG_BIN = DOA_REG_1) and (sdp_mode_rd = '1'))
                      else memp_a_out(3 downto 2) when
                          ((DOA_REG_BIN = DOA_REG_0) and (sdp_mode_rd = '1'))
                      else memp_b_reg when
                          ((DOB_REG_BIN = DOB_REG_1) and (sdp_mode_rd = '0'))
                      else memp_b_out;
   INIT_A_BIN_8_4     <= INIT_A_BIN(8) & INIT_A_BIN(8) & INIT_A_BIN(8) & INIT_A_BIN(8);
   INIT_A_BIN_7_0_4   <= INIT_A_BIN(7 downto 0)   & INIT_A_BIN(7 downto 0) &
                         INIT_A_BIN(7 downto 0)   & INIT_A_BIN(7 downto 0);
   INIT_A_BIN_17_16_2 <= INIT_A_BIN(17 downto 16) & INIT_A_BIN(17 downto 16);
   INIT_A_BIN_15_0_2  <= INIT_A_BIN(15 downto 0)  & INIT_A_BIN(15 downto 0);
   INIT_B_BIN_8_2     <= INIT_B_BIN(8) & INIT_B_BIN(8);
   INIT_B_BIN_7_0_2   <= INIT_B_BIN(7 downto 0)   & INIT_B_BIN(7 downto 0);
   INIT_BA_BIN_17_16  <= INIT_B_BIN(17 downto 16) & INIT_A_BIN(17 downto 16);
   INIT_BA_BIN_15_0   <= INIT_B_BIN(15 downto 0)  & INIT_A_BIN(15 downto 0);
   INIT_A_int <=
    (INIT_A_BIN_8_4     & INIT_A_BIN_7_0_4)  when (READ_WIDTH_A_BIN <= READ_WIDTH_A_9) else
    (INIT_A_BIN_17_16_2 & INIT_A_BIN_15_0_2) when (READ_WIDTH_A_BIN = READ_WIDTH_A_18) else
    (INIT_BA_BIN_17_16  & INIT_BA_BIN_15_0);
   INIT_B_int <=
    (INIT_B_BIN_8_2     & INIT_B_BIN_7_0_2)  when (READ_WIDTH_B_BIN <= READ_WIDTH_B_9) else
    INIT_B_BIN;
   SRVAL_A_BIN_8_4     <= SRVAL_A_BIN(8) & SRVAL_A_BIN(8) & SRVAL_A_BIN(8) & SRVAL_A_BIN(8);
   SRVAL_A_BIN_7_0_4   <= SRVAL_A_BIN(7 downto 0)   & SRVAL_A_BIN(7 downto 0) &
                          SRVAL_A_BIN(7 downto 0)   & SRVAL_A_BIN(7 downto 0);
   SRVAL_A_BIN_17_16_2 <= SRVAL_A_BIN(17 downto 16) & SRVAL_A_BIN(17 downto 16);
   SRVAL_A_BIN_15_0_2  <= SRVAL_A_BIN(15 downto 0)  & SRVAL_A_BIN(15 downto 0);
   SRVAL_B_BIN_8_2     <= SRVAL_B_BIN(8) & SRVAL_B_BIN(8);
   SRVAL_B_BIN_7_0_2   <= SRVAL_B_BIN(7 downto 0)   & SRVAL_B_BIN(7 downto 0);
   SRVAL_BA_BIN_17_16  <= SRVAL_B_BIN(17 downto 16) & SRVAL_A_BIN(17 downto 16);
   SRVAL_BA_BIN_15_0   <= SRVAL_B_BIN(15 downto 0)  & SRVAL_A_BIN(15 downto 0);
   SRVAL_A_int <=
    (SRVAL_A_BIN_8_4     & SRVAL_A_BIN_7_0_4)  when (READ_WIDTH_A_BIN <= READ_WIDTH_A_9) else
    (SRVAL_A_BIN_17_16_2 & SRVAL_A_BIN_15_0_2) when (READ_WIDTH_A_BIN = READ_WIDTH_A_18) else
    (SRVAL_BA_BIN_17_16 & SRVAL_BA_BIN_15_0);
   SRVAL_B_int <=
    (SRVAL_B_BIN_8_2     & SRVAL_B_BIN_7_0_2)  when (READ_WIDTH_B_BIN <= READ_WIDTH_B_9) else
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

   CASDOMUXB_int <= CASDOMUXA_reg when READ_WIDTH_A_BIN = READ_WIDTH_A_36 else
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
        Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
       elsif ((SLEEP_A_int = '1') and mem_rd_en_a = '1') then
         Write ( Message, string'("Error : [Unisim "));
         Write ( Message, string'(MODULE_NAME));
         Write ( Message, string'("-24] "));
         Write ( Message, string'(" : instance "));
         Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
           mem_a_lat <= mem_rd_a;
           memp_a_lat <= memp_rd_a;
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
         Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
         Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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
         Write ( Message, string'(RAMB18E2_V'PATH_NAME));
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


  mem_we_a <= (X"0000" & 
               WEA_in(1) & WEA_in(1) & WEA_in(1) & WEA_in(1) &
               WEA_in(1) & WEA_in(1) & WEA_in(1) & WEA_in(1) &
               WEA_in(0) & WEA_in(0) & WEA_in(0) & WEA_in(0) &
               WEA_in(0) & WEA_in(0) & WEA_in(0) & WEA_in(0)) and mem_wm_a;
  mem_we_b <= (WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) &
               WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) & WEBWE_in(3) &
               WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) &
               WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) & WEBWE_in(2) &
               WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) &
               WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) & WEBWE_in(1) &
               WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0) &
               WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0) & WEBWE_in(0)) and mem_wm_b;
  memp_we_a <= "00" & WEA_in when (WRITE_WIDTH_A_BIN > WRITE_WIDTH_A_4) else X"0";
  memp_we_b <= WEBWE_in when (WRITE_WIDTH_B_BIN > WRITE_WIDTH_B_4) else X"0";

  end RAMB18E2_V;
