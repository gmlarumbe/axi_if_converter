-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2018.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        288K-bit High-Density Memory Building Block
-- /___/   /\      Filename    : URAM288.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--   10/31/2014 - Initial functional version
-- End Revision
-------------------------------------------------------------------------------

----- CELL URAM288 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity URAM288 is
  generic (
    AUTO_SLEEP_LATENCY : integer := 8;
    AVG_CONS_INACTIVE_CYCLES : integer := 10;
    BWE_MODE_A : string := "PARITY_INTERLEAVED";
    BWE_MODE_B : string := "PARITY_INTERLEAVED";
    CASCADE_ORDER_A : string := "NONE";
    CASCADE_ORDER_B : string := "NONE";
    EN_AUTO_SLEEP_MODE : string := "FALSE";
    EN_ECC_RD_A : string := "FALSE";
    EN_ECC_RD_B : string := "FALSE";
    EN_ECC_WR_A : string := "FALSE";
    EN_ECC_WR_B : string := "FALSE";
    IREG_PRE_A : string := "FALSE";
    IREG_PRE_B : string := "FALSE";
    IS_CLK_INVERTED : bit := '0';
    IS_EN_A_INVERTED : bit := '0';
    IS_EN_B_INVERTED : bit := '0';
    IS_RDB_WR_A_INVERTED : bit := '0';
    IS_RDB_WR_B_INVERTED : bit := '0';
    IS_RST_A_INVERTED : bit := '0';
    IS_RST_B_INVERTED : bit := '0';
    MATRIX_ID : string := "NONE";
    NUM_UNIQUE_SELF_ADDR_A : integer := 1;
    NUM_UNIQUE_SELF_ADDR_B : integer := 1;
    NUM_URAM_IN_MATRIX : integer := 1;
    OREG_A     : string := "FALSE";
    OREG_B     : string := "FALSE";
    OREG_ECC_A : string := "FALSE";
    OREG_ECC_B : string := "FALSE";
    REG_CAS_A : string := "FALSE";
    REG_CAS_B : string := "FALSE";
    RST_MODE_A : string := "SYNC";
    RST_MODE_B : string := "SYNC";
    SELF_ADDR_A : std_logic_vector(10 downto 0) := "000" & X"00";
    SELF_ADDR_B : std_logic_vector(10 downto 0) := "000" & X"00";
    SELF_MASK_A : std_logic_vector(10 downto 0) := "111" & X"FF";
    SELF_MASK_B : std_logic_vector(10 downto 0) := "111" & X"FF";
    USE_EXT_CE_A : string := "FALSE";
    USE_EXT_CE_B : string := "FALSE"
  );

  port (
    CAS_OUT_ADDR_A       : out std_logic_vector(22 downto 0);
    CAS_OUT_ADDR_B       : out std_logic_vector(22 downto 0);
    CAS_OUT_BWE_A        : out std_logic_vector(8 downto 0);
    CAS_OUT_BWE_B        : out std_logic_vector(8 downto 0);
    CAS_OUT_DBITERR_A    : out std_ulogic;
    CAS_OUT_DBITERR_B    : out std_ulogic;
    CAS_OUT_DIN_A        : out std_logic_vector(71 downto 0);
    CAS_OUT_DIN_B        : out std_logic_vector(71 downto 0);
    CAS_OUT_DOUT_A       : out std_logic_vector(71 downto 0);
    CAS_OUT_DOUT_B       : out std_logic_vector(71 downto 0);
    CAS_OUT_EN_A         : out std_ulogic;
    CAS_OUT_EN_B         : out std_ulogic;
    CAS_OUT_RDACCESS_A   : out std_ulogic;
    CAS_OUT_RDACCESS_B   : out std_ulogic;
    CAS_OUT_RDB_WR_A     : out std_ulogic;
    CAS_OUT_RDB_WR_B     : out std_ulogic;
    CAS_OUT_SBITERR_A    : out std_ulogic;
    CAS_OUT_SBITERR_B    : out std_ulogic;
    DBITERR_A            : out std_ulogic;
    DBITERR_B            : out std_ulogic;
    DOUT_A               : out std_logic_vector(71 downto 0);
    DOUT_B               : out std_logic_vector(71 downto 0);
    RDACCESS_A           : out std_ulogic;
    RDACCESS_B           : out std_ulogic;
    SBITERR_A            : out std_ulogic;
    SBITERR_B            : out std_ulogic;
    ADDR_A               : in std_logic_vector(22 downto 0);
    ADDR_B               : in std_logic_vector(22 downto 0);
    BWE_A                : in std_logic_vector(8 downto 0);
    BWE_B                : in std_logic_vector(8 downto 0);
    CAS_IN_ADDR_A        : in std_logic_vector(22 downto 0);
    CAS_IN_ADDR_B        : in std_logic_vector(22 downto 0);
    CAS_IN_BWE_A         : in std_logic_vector(8 downto 0);
    CAS_IN_BWE_B         : in std_logic_vector(8 downto 0);
    CAS_IN_DBITERR_A     : in std_ulogic;
    CAS_IN_DBITERR_B     : in std_ulogic;
    CAS_IN_DIN_A         : in std_logic_vector(71 downto 0);
    CAS_IN_DIN_B         : in std_logic_vector(71 downto 0);
    CAS_IN_DOUT_A        : in std_logic_vector(71 downto 0);
    CAS_IN_DOUT_B        : in std_logic_vector(71 downto 0);
    CAS_IN_EN_A          : in std_ulogic;
    CAS_IN_EN_B          : in std_ulogic;
    CAS_IN_RDACCESS_A    : in std_ulogic;
    CAS_IN_RDACCESS_B    : in std_ulogic;
    CAS_IN_RDB_WR_A      : in std_ulogic;
    CAS_IN_RDB_WR_B      : in std_ulogic;
    CAS_IN_SBITERR_A     : in std_ulogic;
    CAS_IN_SBITERR_B     : in std_ulogic;
    CLK                  : in std_ulogic;
    DIN_A                : in std_logic_vector(71 downto 0);
    DIN_B                : in std_logic_vector(71 downto 0);
    EN_A                 : in std_ulogic;
    EN_B                 : in std_ulogic;
    INJECT_DBITERR_A     : in std_ulogic;
    INJECT_DBITERR_B     : in std_ulogic;
    INJECT_SBITERR_A     : in std_ulogic;
    INJECT_SBITERR_B     : in std_ulogic;
    OREG_CE_A            : in std_ulogic;
    OREG_CE_B            : in std_ulogic;
    OREG_ECC_CE_A        : in std_ulogic;
    OREG_ECC_CE_B        : in std_ulogic;
    RDB_WR_A             : in std_ulogic;
    RDB_WR_B             : in std_ulogic;
    RST_A                : in std_ulogic;
    RST_B                : in std_ulogic;
    SLEEP                : in std_ulogic
  );
end URAM288;

architecture URAM288_V of URAM288 is

  constant MODULE_NAME : string := "URAM288";

--  Parameter encodings and registers
  constant BWE_MODE_A_PARITY_INDEPENDENT : std_ulogic := '1';
  constant BWE_MODE_A_PARITY_INTERLEAVED : std_ulogic := '0';
  constant BWE_MODE_B_PARITY_INDEPENDENT : std_ulogic := '1';
  constant BWE_MODE_B_PARITY_INTERLEAVED : std_ulogic := '0';
  constant CASCADE_ORDER_A_FIRST : std_logic_vector(1 downto 0) := "01";
  constant CASCADE_ORDER_A_LAST : std_logic_vector(1 downto 0) := "10";
  constant CASCADE_ORDER_A_MIDDLE : std_logic_vector(1 downto 0) := "11";
  constant CASCADE_ORDER_A_NONE : std_logic_vector(1 downto 0) := "00";
  constant CASCADE_ORDER_B_FIRST : std_logic_vector(1 downto 0) := "01";
  constant CASCADE_ORDER_B_LAST : std_logic_vector(1 downto 0) := "10";
  constant CASCADE_ORDER_B_MIDDLE : std_logic_vector(1 downto 0) := "11";
  constant CASCADE_ORDER_B_NONE : std_logic_vector(1 downto 0) := "00";
  constant EN_AUTO_SLEEP_MODE_FALSE : std_ulogic := '0';
  constant EN_AUTO_SLEEP_MODE_TRUE : std_ulogic := '1';
  constant EN_ECC_RD_A_FALSE : std_ulogic := '0';
  constant EN_ECC_RD_A_TRUE : std_ulogic := '1';
  constant EN_ECC_RD_B_FALSE : std_ulogic := '0';
  constant EN_ECC_RD_B_TRUE : std_ulogic := '1';
  constant EN_ECC_WR_A_FALSE : std_ulogic := '0';
  constant EN_ECC_WR_A_TRUE : std_ulogic := '1';
  constant EN_ECC_WR_B_FALSE : std_ulogic := '0';
  constant EN_ECC_WR_B_TRUE : std_ulogic := '1';
  constant IREG_PRE_A_FALSE : std_ulogic := '0';
  constant IREG_PRE_A_TRUE : std_ulogic := '1';
  constant IREG_PRE_B_FALSE : std_ulogic := '0';
  constant IREG_PRE_B_TRUE : std_ulogic := '1';
  constant OREG_A_FALSE : std_ulogic := '0';
  constant OREG_A_TRUE : std_ulogic := '1';
  constant OREG_B_FALSE : std_ulogic := '0';
  constant OREG_B_TRUE : std_ulogic := '1';
  constant OREG_ECC_A_FALSE : std_ulogic := '0';
  constant OREG_ECC_A_TRUE : std_ulogic := '1';
  constant OREG_ECC_B_FALSE : std_ulogic := '0';
  constant OREG_ECC_B_TRUE : std_ulogic := '1';
  constant REG_CAS_A_FALSE : std_ulogic := '0';
  constant REG_CAS_A_TRUE : std_ulogic := '1';
  constant REG_CAS_B_FALSE : std_ulogic := '0';
  constant REG_CAS_B_TRUE : std_ulogic := '1';
  constant RST_MODE_A_ASYNC : std_ulogic := '1';
  constant RST_MODE_A_SYNC : std_ulogic := '0';
  constant RST_MODE_B_ASYNC : std_ulogic := '1';
  constant RST_MODE_B_SYNC : std_ulogic := '0';
  constant USE_EXT_CE_A_FALSE : std_ulogic := '0';
  constant USE_EXT_CE_A_TRUE : std_ulogic := '1';
  constant USE_EXT_CE_B_FALSE : std_ulogic := '0';
  constant USE_EXT_CE_B_TRUE : std_ulogic := '1';

  signal AUTO_SLEEP_LATENCY_BIN : integer := 8;
  signal AVG_CONS_INACTIVE_CYCLES_BIN : std_logic_vector(16 downto 0);
  signal BWE_MODE_A_BIN : std_ulogic;
  signal BWE_MODE_B_BIN : std_ulogic;
  signal CASCADE_ORDER_A_BIN : std_logic_vector(1 downto 0);
  signal CASCADE_ORDER_B_BIN : std_logic_vector(1 downto 0);
  signal EN_AUTO_SLEEP_MODE_BIN : std_ulogic;
  signal EN_ECC_RD_A_BIN : std_ulogic;
  signal EN_ECC_RD_B_BIN : std_ulogic;
  signal EN_ECC_WR_A_BIN : std_ulogic;
  signal EN_ECC_WR_B_BIN : std_ulogic;
  signal IREG_PRE_A_BIN : std_ulogic;
  signal IREG_PRE_B_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_EN_A_INVERTED_BIN : std_ulogic;
  signal IS_EN_B_INVERTED_BIN : std_ulogic;
  signal IS_RDB_WR_A_INVERTED_BIN : std_ulogic;
  signal IS_RDB_WR_B_INVERTED_BIN : std_ulogic;
  signal IS_RST_A_INVERTED_BIN : std_ulogic;
  signal IS_RST_B_INVERTED_BIN : std_ulogic;
  signal OREG_A_BIN : std_ulogic;
  signal OREG_B_BIN : std_ulogic;
  signal OREG_ECC_A_BIN : std_ulogic;
  signal OREG_ECC_B_BIN : std_ulogic;
  signal REG_CAS_A_BIN : std_ulogic;
  signal REG_CAS_B_BIN : std_ulogic;
  signal RST_MODE_A_BIN : std_ulogic;
  signal RST_MODE_B_BIN : std_ulogic;
  signal SELF_ADDR_A_BIN : std_logic_vector(10 downto 0);
  signal SELF_ADDR_B_BIN : std_logic_vector(10 downto 0);
  signal SELF_MASK_A_BIN : std_logic_vector(10 downto 0);
  signal SELF_MASK_B_BIN : std_logic_vector(10 downto 0);
  signal USE_EXT_CE_A_BIN : std_ulogic;
  signal USE_EXT_CE_B_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal CAS_OUT_ADDR_A_out : std_logic_vector(22 downto 0);
  signal CAS_OUT_ADDR_B_out : std_logic_vector(22 downto 0);
  signal CAS_OUT_BWE_A_out : std_logic_vector(8 downto 0);
  signal CAS_OUT_BWE_B_out : std_logic_vector(8 downto 0);
  signal CAS_OUT_DIN_A_out : std_logic_vector(71 downto 0);
  signal CAS_OUT_DIN_B_out : std_logic_vector(71 downto 0);
  signal CAS_OUT_EN_A_out : std_ulogic;
  signal CAS_OUT_EN_B_out : std_ulogic;
  signal CAS_OUT_RDB_WR_A_out : std_ulogic;
  signal CAS_OUT_RDB_WR_B_out : std_ulogic;
  signal DBITERR_A_out : std_ulogic;
  signal DBITERR_B_out : std_ulogic;
  signal DOUT_A_out : std_logic_vector(71 downto 0);
  signal DOUT_B_out : std_logic_vector(71 downto 0);
  signal RDACCESS_A_out : std_ulogic;
  signal RDACCESS_B_out : std_ulogic;
  signal SBITERR_A_out : std_ulogic;
  signal SBITERR_B_out : std_ulogic;

  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal ADDR_A_in : std_logic_vector(22 downto 0);
  signal ADDR_B_in : std_logic_vector(22 downto 0);
  signal BWE_A_in : std_logic_vector(8 downto 0);
  signal BWE_B_in : std_logic_vector(8 downto 0);
  signal CAS_IN_ADDR_A_in : std_logic_vector(22 downto 0);
  signal CAS_IN_ADDR_B_in : std_logic_vector(22 downto 0);
  signal CAS_IN_BWE_A_in : std_logic_vector(8 downto 0);
  signal CAS_IN_BWE_B_in : std_logic_vector(8 downto 0);
  signal CAS_IN_DBITERR_A_in : std_ulogic;
  signal CAS_IN_DBITERR_B_in : std_ulogic;
  signal CAS_IN_DIN_A_in : std_logic_vector(71 downto 0);
  signal CAS_IN_DIN_B_in : std_logic_vector(71 downto 0);
  signal CAS_IN_DOUT_A_in : std_logic_vector(71 downto 0);
  signal CAS_IN_DOUT_B_in : std_logic_vector(71 downto 0);
  signal CAS_IN_EN_A_in : std_ulogic;
  signal CAS_IN_EN_B_in : std_ulogic;
  signal CAS_IN_RDACCESS_A_in : std_ulogic;
  signal CAS_IN_RDACCESS_B_in : std_ulogic;
  signal CAS_IN_RDB_WR_A_in : std_ulogic;
  signal CAS_IN_RDB_WR_B_in : std_ulogic;
  signal CAS_IN_SBITERR_A_in : std_ulogic;
  signal CAS_IN_SBITERR_B_in : std_ulogic;
  signal CLK_in : std_ulogic;
  signal DIN_A_in : std_logic_vector(71 downto 0);
  signal DIN_B_in : std_logic_vector(71 downto 0);
  signal EN_A_in : std_ulogic;
  signal EN_B_in : std_ulogic;
  signal INJECT_DBITERR_A_in : std_ulogic;
  signal INJECT_DBITERR_B_in : std_ulogic;
  signal INJECT_SBITERR_A_in : std_ulogic;
  signal INJECT_SBITERR_B_in : std_ulogic;
  signal OREG_CE_A_in : std_ulogic;
  signal OREG_CE_B_in : std_ulogic;
  signal OREG_ECC_CE_A_in : std_ulogic;
  signal OREG_ECC_CE_B_in : std_ulogic;
  signal RDB_WR_A_in : std_ulogic;
  signal RDB_WR_B_in : std_ulogic;
  signal RST_A_in : std_ulogic;
  signal RST_B_in : std_ulogic;
  signal SLEEP_in : std_ulogic;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional

  constant mem_width          : integer := 72;
  constant mem_depth          : integer := 4 * 1024;
  constant encode             : boolean := true;
  constant decode             : boolean := false;
  constant ADDR_INIT          : std_logic_vector(22 downto 0) := (others => '0');
  constant BWE_INIT           : std_logic_vector(8 downto 0) := (others => '0');
  constant D_INIT             : std_logic_vector(71 downto 0) := (others => '0');
  constant D_UNDEF            : std_logic_vector(71 downto 0) := (others => 'X');

  type mem_t is array (0 to mem_depth-1)  of std_logic_vector(mem_width-1 downto 0);
  signal mem : mem_t;

  signal ADDR_A_int           : std_logic_vector(22 downto 0) := (others => '0');
  signal ADDR_A_reg           : std_logic_vector(22 downto 0) := (others => '0');
  signal ADDR_B_int           : std_logic_vector(22 downto 0) := (others => '0');
  signal ADDR_B_reg           : std_logic_vector(22 downto 0) := (others => '0');
  signal BWE_A_int            : std_logic_vector(8 downto 0) := (others => '0');
  signal BWE_A_reg            : std_logic_vector(8 downto 0) := (others => '0');
  signal BWE_B_int            : std_logic_vector(8 downto 0) := (others => '0');
  signal BWE_B_reg            : std_logic_vector(8 downto 0) := (others => '0');
  signal CAS_OUT_ADDR_A_reg   : std_logic_vector(22 downto 0) := (others => '0');
  signal CAS_OUT_ADDR_B_reg   : std_logic_vector(22 downto 0) := (others => '0');
  signal CAS_OUT_BWE_A_reg    : std_logic_vector(8 downto 0) := (others => '0');
  signal CAS_OUT_BWE_B_reg    : std_logic_vector(8 downto 0) := (others => '0');
  signal CAS_IN_DBITERR_A_reg : std_ulogic := '0';
  signal CAS_IN_DBITERR_B_reg : std_ulogic := '0';
  signal CAS_OUT_DIN_A_reg    : std_logic_vector(71 downto 0) := (others => '0');
  signal CAS_OUT_DIN_B_reg    : std_logic_vector(71 downto 0) := (others => '0');
  signal CAS_IN_DOUT_A_reg   : std_logic_vector(71 downto 0) := (others => '0');
  signal CAS_IN_DOUT_B_reg   : std_logic_vector(71 downto 0) := (others => '0');
  signal CAS_OUT_EN_A_reg     : std_ulogic := '0';
  signal CAS_OUT_EN_B_reg     : std_ulogic := '0';
  signal CAS_IN_RDACCESS_A_reg : std_ulogic := '0';
  signal CAS_IN_RDACCESS_B_reg : std_ulogic := '0';
  signal CAS_OUT_RDB_WR_A_reg : std_ulogic := '0';
  signal CAS_OUT_RDB_WR_B_reg : std_ulogic := '0';
  signal CAS_IN_SBITERR_A_reg : std_ulogic := '0';
  signal CAS_IN_SBITERR_B_reg : std_ulogic := '0';
  signal DBITERR_A_ecc        : std_ulogic := '0';
  signal DBITERR_A_reg        : std_ulogic := '0';
  signal DBITERR_B_ecc        : std_ulogic := '0';
  signal DBITERR_B_reg        : std_ulogic := '0';
  signal DIN_A_int            : std_logic_vector(71 downto 0) := (others => '0');
  signal DIN_A_reg            : std_logic_vector(71 downto 0) := (others => '0');
  signal DIN_B_int            : std_logic_vector(71 downto 0) := (others => '0');
  signal DIN_B_reg            : std_logic_vector(71 downto 0) := (others => '0');
  signal DOUT_A_ecc_reg       : std_logic_vector(71 downto 0) := (others => '0');
  signal DOUT_A_reg           : std_logic_vector(71 downto 0) := (others => '0');
  signal DOUT_B_ecc_reg       : std_logic_vector(71 downto 0) := (others => '0');
  signal DOUT_B_reg           : std_logic_vector(71 downto 0) := (others => '0');
  signal EN_A_int             : std_ulogic := '0';
  signal EN_A_reg             : std_ulogic := '0';
  signal EN_B_int             : std_ulogic := '0';
  signal EN_B_reg             : std_ulogic := '0';
  signal INIT_RAM             : std_ulogic := '0';
  signal INJECT_DBITERR_A_int : std_ulogic := '0';
  signal INJECT_DBITERR_A_reg : std_ulogic := '0';
  signal INJECT_DBITERR_B_int : std_ulogic := '0';
  signal INJECT_DBITERR_B_reg : std_ulogic := '0';
  signal INJECT_SBITERR_A_int : std_ulogic := '0';
  signal INJECT_SBITERR_A_reg : std_ulogic := '0';
  signal INJECT_SBITERR_B_int : std_ulogic := '0';
  signal INJECT_SBITERR_B_reg : std_ulogic := '0';
  signal RDACCESS_A_ecc_reg   : std_ulogic := '0';
  signal RDACCESS_A_int       : std_ulogic := '0';
  signal RDACCESS_A_lat       : std_ulogic := '0';
  signal RDACCESS_A_reg       : std_ulogic := '0';
  signal RDACCESS_B_ecc_reg   : std_ulogic := '0';
  signal RDACCESS_B_int       : std_ulogic := '0';
  signal RDACCESS_B_lat       : std_ulogic := '0';
  signal RDACCESS_B_reg       : std_ulogic := '0';
  signal RDB_WR_A_int         : std_ulogic := '0';
  signal RDB_WR_A_reg         : std_ulogic := '0';
  signal RDB_WR_B_int         : std_ulogic := '0';
  signal RDB_WR_B_reg         : std_ulogic := '0';
  signal RST_A_async          : std_ulogic := '0';
  signal RST_B_async          : std_ulogic := '0';
  signal RST_A_sync           : std_ulogic := '0';
  signal RST_B_sync           : std_ulogic := '0';
  signal SBITERR_A_ecc        : std_ulogic := '0';
  signal SBITERR_A_reg        : std_ulogic := '0';
  signal SBITERR_B_ecc        : std_ulogic := '0';
  signal SBITERR_B_reg        : std_ulogic := '0';
  signal attr_err             : std_ulogic := '0';
  signal ram_addr_a           : unsigned(11 downto 0) := (others => '0');
  signal ram_addr_b           : unsigned(11 downto 0) := (others => '0');
  signal ram_bwe_a           : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_bwe_b           : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_ce_a             : std_ulogic := '0';
  signal ram_ce_a_fifo        : std_logic_vector(15 downto 1) := (others => '0');
  signal ram_ce_a_fifo_in     : std_logic_vector(15 downto 1) := (others => '0');
  signal ram_ce_a_int         : std_ulogic := '0';
  signal ram_ce_a_pre         : std_ulogic := '0';
  signal ram_ce_b             : std_ulogic := '0';
  signal ram_ce_b_fifo        : std_logic_vector(15 downto 1) := (others => '0');
  signal ram_ce_b_fifo_in     : std_logic_vector(15 downto 1) := (others => '0');
  signal ram_ce_b_int         : std_ulogic := '0';
  signal ram_ce_b_pre         : std_ulogic := '0';
  signal ram_data_a           : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_a_ecc       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_a_lat       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_a_out       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_a_reg       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_b           : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_b_ecc       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_b_lat       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_b_out       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_data_b_reg       : std_logic_vector(71 downto 0) := (others => '0');
  signal ram_we_a             : std_ulogic := '0';
  signal ram_we_a_event       : std_ulogic := '0';
  signal ram_we_b             : std_ulogic := '0';
  signal ram_we_b_event       : std_ulogic := '0';
  signal synd_ecc             : std_logic_vector(7 downto 0) := (others => '0');
  signal synd_rd              : std_logic_vector(7 downto 0) := (others => '0');
  signal wa                   : integer := 0;
  signal wake_count           : integer := 0;
  signal auto_sleep           : std_ulogic := '0';
  signal shut_down            : std_ulogic := '0';
  signal a_sleep              : std_ulogic := '0';
  signal auto_sleep_A         : std_ulogic := '0';
  signal auto_sleep_B         : std_ulogic := '0';
  signal auto_wake_up_A       : std_ulogic := '0';
  signal auto_wake_up_B       : std_ulogic := '0';
  signal data_A_enable        : std_ulogic := '0';
  signal data_B_enable        : std_ulogic := '0';
-- debug
  signal mem_ram_addr_a : std_logic_vector(mem_width-1 downto 0) := (others => '0');
  signal mem_ram_addr_b : std_logic_vector(mem_width-1 downto 0) := (others => '0');
  signal addr_match : boolean := false;
  signal cas_out_mux_sel_a     : std_ulogic := '0';
  signal cas_out_mux_sel_b     : std_ulogic := '0';
  signal cas_out_mux_sel_a_reg : std_ulogic := '0';
  signal cas_out_mux_sel_b_reg : std_ulogic := '0';
  signal rst_a_warn_once : std_ulogic := '0';
  signal rst_b_warn_once : std_ulogic := '0';
  signal DEEPSLEEP_in : std_ulogic := '0';
  signal SHUTDOWN_in : std_ulogic := '0';


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
   d_i : in std_logic_vector(63 downto 0);
   dp_i : in std_logic_vector(7 downto 0)
  ) return std_logic_vector is
   variable correct_int : std_logic_vector(71 downto 0);
   variable correct_bit : std_logic_vector(71 downto 0);
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

function bit_or(
   slv_in : in std_logic_vector
  ) return std_ulogic is
   variable bit_or : std_ulogic := '0';
begin
   for bo in slv_in'low to slv_in'high loop
     if (slv_in(bo) = '1') then
       bit_or := '1';
       exit;
     end if;
   end loop;
   return bit_or;
end;

function bit_and (
   slv_in : in std_logic_vector
  ) return std_ulogic is
   variable bit_and : std_ulogic := '1';
begin
   for ba in slv_in'low to slv_in'high loop
     if (slv_in(ba) = '0') then
       bit_and := '0';
       exit;
     end if;
   end loop;
   return bit_and;
end;

procedure ecc_cor (signal data_cor  : out std_logic_vector(71 downto 0);
                   signal sbiterr   : out std_ulogic;
                   signal dbiterr   : out std_ulogic;
                   signal data      : in  std_logic_vector(71 downto 0)) is

  variable synd_rd      : std_logic_vector (7 downto 0) := (others => '0');
  variable synd_ecc_raw : std_logic_vector (7 downto 0) := (others => '0');
  variable synd_ecc     : unsigned (6 downto 0)         := (others => '0');
  variable error_bit    : integer := 0;
  constant decode       : boolean := false;
  variable sbiterr_v    : std_ulogic := '0';
  variable dbiterr_v    : std_ulogic := '0';
begin
  synd_rd  := fn_ecc(decode, data(63 downto 0), data(71 downto 64));
  synd_ecc_raw := synd_rd xor data(71 downto 64);
  synd_ecc := UNSIGNED(synd_ecc_raw(6 downto 0));
  sbiterr_v := (bit_or(synd_ecc_raw(6 downto 0)) and     synd_ecc_raw(7));
  dbiterr_v := (bit_or(synd_ecc_raw(6 downto 0)) and not synd_ecc_raw(7));
  if (synd_ecc > 0) then
      error_bit := to_integer(synd_ecc);
  else
      error_bit := 0;
  end if;
  if (sbiterr_v = '1') then
      data_cor <= fn_cor_bit(error_bit, data(63 downto 0), data(71 downto 64));
  else
      data_cor <= data;
  end if;
  sbiterr <= sbiterr_v;
  dbiterr <= dbiterr_v;
end procedure ecc_cor;

begin
  glblGSR <= TO_X01(GSR);
  CAS_OUT_ADDR_A <= CAS_OUT_ADDR_A_out;
  CAS_OUT_ADDR_B <= CAS_OUT_ADDR_B_out;
  CAS_OUT_BWE_A <= CAS_OUT_BWE_A_out;
  CAS_OUT_BWE_B <= CAS_OUT_BWE_B_out;
  CAS_OUT_DBITERR_A <= DBITERR_A_out;
  CAS_OUT_DBITERR_B <= DBITERR_B_out;
  CAS_OUT_DIN_A <= CAS_OUT_DIN_A_out;
  CAS_OUT_DIN_B <= CAS_OUT_DIN_B_out;
  CAS_OUT_DOUT_A <= DOUT_A_out;
  CAS_OUT_DOUT_B <= DOUT_B_out;
  CAS_OUT_EN_A <= CAS_OUT_EN_A_out;
  CAS_OUT_EN_B <= CAS_OUT_EN_B_out;
  CAS_OUT_RDACCESS_A <= RDACCESS_A_out;
  CAS_OUT_RDACCESS_B <= RDACCESS_B_out;
  CAS_OUT_RDB_WR_A <= CAS_OUT_RDB_WR_A_out;
  CAS_OUT_RDB_WR_B <= CAS_OUT_RDB_WR_B_out;
  CAS_OUT_SBITERR_A <= SBITERR_A_out;
  CAS_OUT_SBITERR_B <= SBITERR_B_out;
  DBITERR_A <= DBITERR_A_out;
  DBITERR_B <= DBITERR_B_out;
  DOUT_A <= DOUT_A_out;
  DOUT_B <= DOUT_B_out;
  RDACCESS_A <= RDACCESS_A_out;
  RDACCESS_B <= RDACCESS_B_out;
  SBITERR_A <= SBITERR_A_out;
  SBITERR_B <= SBITERR_B_out;
  ADDR_A_in <= ADDR_A;
  ADDR_B_in <= ADDR_B;
  BWE_A_in <= BWE_A;
  BWE_B_in <= BWE_B;
  CAS_IN_ADDR_A_in(0) <= '0' when (CAS_IN_ADDR_A(0) = 'U') else CAS_IN_ADDR_A(0); -- rv 0
  CAS_IN_ADDR_A_in(1) <= '0' when (CAS_IN_ADDR_A(1) = 'U') else CAS_IN_ADDR_A(1); -- rv 0
  CAS_IN_ADDR_A_in(10) <= '0' when (CAS_IN_ADDR_A(10) = 'U') else CAS_IN_ADDR_A(10); -- rv 0
  CAS_IN_ADDR_A_in(11) <= '0' when (CAS_IN_ADDR_A(11) = 'U') else CAS_IN_ADDR_A(11); -- rv 0
  CAS_IN_ADDR_A_in(12) <= '0' when (CAS_IN_ADDR_A(12) = 'U') else CAS_IN_ADDR_A(12); -- rv 0
  CAS_IN_ADDR_A_in(13) <= '0' when (CAS_IN_ADDR_A(13) = 'U') else CAS_IN_ADDR_A(13); -- rv 0
  CAS_IN_ADDR_A_in(14) <= '0' when (CAS_IN_ADDR_A(14) = 'U') else CAS_IN_ADDR_A(14); -- rv 0
  CAS_IN_ADDR_A_in(15) <= '0' when (CAS_IN_ADDR_A(15) = 'U') else CAS_IN_ADDR_A(15); -- rv 0
  CAS_IN_ADDR_A_in(16) <= '0' when (CAS_IN_ADDR_A(16) = 'U') else CAS_IN_ADDR_A(16); -- rv 0
  CAS_IN_ADDR_A_in(17) <= '0' when (CAS_IN_ADDR_A(17) = 'U') else CAS_IN_ADDR_A(17); -- rv 0
  CAS_IN_ADDR_A_in(18) <= '0' when (CAS_IN_ADDR_A(18) = 'U') else CAS_IN_ADDR_A(18); -- rv 0
  CAS_IN_ADDR_A_in(19) <= '0' when (CAS_IN_ADDR_A(19) = 'U') else CAS_IN_ADDR_A(19); -- rv 0
  CAS_IN_ADDR_A_in(2) <= '0' when (CAS_IN_ADDR_A(2) = 'U') else CAS_IN_ADDR_A(2); -- rv 0
  CAS_IN_ADDR_A_in(20) <= '0' when (CAS_IN_ADDR_A(20) = 'U') else CAS_IN_ADDR_A(20); -- rv 0
  CAS_IN_ADDR_A_in(21) <= '0' when (CAS_IN_ADDR_A(21) = 'U') else CAS_IN_ADDR_A(21); -- rv 0
  CAS_IN_ADDR_A_in(22) <= '0' when (CAS_IN_ADDR_A(22) = 'U') else CAS_IN_ADDR_A(22); -- rv 0
  CAS_IN_ADDR_A_in(3) <= '0' when (CAS_IN_ADDR_A(3) = 'U') else CAS_IN_ADDR_A(3); -- rv 0
  CAS_IN_ADDR_A_in(4) <= '0' when (CAS_IN_ADDR_A(4) = 'U') else CAS_IN_ADDR_A(4); -- rv 0
  CAS_IN_ADDR_A_in(5) <= '0' when (CAS_IN_ADDR_A(5) = 'U') else CAS_IN_ADDR_A(5); -- rv 0
  CAS_IN_ADDR_A_in(6) <= '0' when (CAS_IN_ADDR_A(6) = 'U') else CAS_IN_ADDR_A(6); -- rv 0
  CAS_IN_ADDR_A_in(7) <= '0' when (CAS_IN_ADDR_A(7) = 'U') else CAS_IN_ADDR_A(7); -- rv 0
  CAS_IN_ADDR_A_in(8) <= '0' when (CAS_IN_ADDR_A(8) = 'U') else CAS_IN_ADDR_A(8); -- rv 0
  CAS_IN_ADDR_A_in(9) <= '0' when (CAS_IN_ADDR_A(9) = 'U') else CAS_IN_ADDR_A(9); -- rv 0
  CAS_IN_ADDR_B_in(0) <= '0' when (CAS_IN_ADDR_B(0) = 'U') else CAS_IN_ADDR_B(0); -- rv 0
  CAS_IN_ADDR_B_in(1) <= '0' when (CAS_IN_ADDR_B(1) = 'U') else CAS_IN_ADDR_B(1); -- rv 0
  CAS_IN_ADDR_B_in(10) <= '0' when (CAS_IN_ADDR_B(10) = 'U') else CAS_IN_ADDR_B(10); -- rv 0
  CAS_IN_ADDR_B_in(11) <= '0' when (CAS_IN_ADDR_B(11) = 'U') else CAS_IN_ADDR_B(11); -- rv 0
  CAS_IN_ADDR_B_in(12) <= '0' when (CAS_IN_ADDR_B(12) = 'U') else CAS_IN_ADDR_B(12); -- rv 0
  CAS_IN_ADDR_B_in(13) <= '0' when (CAS_IN_ADDR_B(13) = 'U') else CAS_IN_ADDR_B(13); -- rv 0
  CAS_IN_ADDR_B_in(14) <= '0' when (CAS_IN_ADDR_B(14) = 'U') else CAS_IN_ADDR_B(14); -- rv 0
  CAS_IN_ADDR_B_in(15) <= '0' when (CAS_IN_ADDR_B(15) = 'U') else CAS_IN_ADDR_B(15); -- rv 0
  CAS_IN_ADDR_B_in(16) <= '0' when (CAS_IN_ADDR_B(16) = 'U') else CAS_IN_ADDR_B(16); -- rv 0
  CAS_IN_ADDR_B_in(17) <= '0' when (CAS_IN_ADDR_B(17) = 'U') else CAS_IN_ADDR_B(17); -- rv 0
  CAS_IN_ADDR_B_in(18) <= '0' when (CAS_IN_ADDR_B(18) = 'U') else CAS_IN_ADDR_B(18); -- rv 0
  CAS_IN_ADDR_B_in(19) <= '0' when (CAS_IN_ADDR_B(19) = 'U') else CAS_IN_ADDR_B(19); -- rv 0
  CAS_IN_ADDR_B_in(2) <= '0' when (CAS_IN_ADDR_B(2) = 'U') else CAS_IN_ADDR_B(2); -- rv 0
  CAS_IN_ADDR_B_in(20) <= '0' when (CAS_IN_ADDR_B(20) = 'U') else CAS_IN_ADDR_B(20); -- rv 0
  CAS_IN_ADDR_B_in(21) <= '0' when (CAS_IN_ADDR_B(21) = 'U') else CAS_IN_ADDR_B(21); -- rv 0
  CAS_IN_ADDR_B_in(22) <= '0' when (CAS_IN_ADDR_B(22) = 'U') else CAS_IN_ADDR_B(22); -- rv 0
  CAS_IN_ADDR_B_in(3) <= '0' when (CAS_IN_ADDR_B(3) = 'U') else CAS_IN_ADDR_B(3); -- rv 0
  CAS_IN_ADDR_B_in(4) <= '0' when (CAS_IN_ADDR_B(4) = 'U') else CAS_IN_ADDR_B(4); -- rv 0
  CAS_IN_ADDR_B_in(5) <= '0' when (CAS_IN_ADDR_B(5) = 'U') else CAS_IN_ADDR_B(5); -- rv 0
  CAS_IN_ADDR_B_in(6) <= '0' when (CAS_IN_ADDR_B(6) = 'U') else CAS_IN_ADDR_B(6); -- rv 0
  CAS_IN_ADDR_B_in(7) <= '0' when (CAS_IN_ADDR_B(7) = 'U') else CAS_IN_ADDR_B(7); -- rv 0
  CAS_IN_ADDR_B_in(8) <= '0' when (CAS_IN_ADDR_B(8) = 'U') else CAS_IN_ADDR_B(8); -- rv 0
  CAS_IN_ADDR_B_in(9) <= '0' when (CAS_IN_ADDR_B(9) = 'U') else CAS_IN_ADDR_B(9); -- rv 0
  CAS_IN_BWE_A_in(0) <= '0' when (CAS_IN_BWE_A(0) = 'U') else CAS_IN_BWE_A(0); -- rv 0
  CAS_IN_BWE_A_in(1) <= '0' when (CAS_IN_BWE_A(1) = 'U') else CAS_IN_BWE_A(1); -- rv 0
  CAS_IN_BWE_A_in(2) <= '0' when (CAS_IN_BWE_A(2) = 'U') else CAS_IN_BWE_A(2); -- rv 0
  CAS_IN_BWE_A_in(3) <= '0' when (CAS_IN_BWE_A(3) = 'U') else CAS_IN_BWE_A(3); -- rv 0
  CAS_IN_BWE_A_in(4) <= '0' when (CAS_IN_BWE_A(4) = 'U') else CAS_IN_BWE_A(4); -- rv 0
  CAS_IN_BWE_A_in(5) <= '0' when (CAS_IN_BWE_A(5) = 'U') else CAS_IN_BWE_A(5); -- rv 0
  CAS_IN_BWE_A_in(6) <= '0' when (CAS_IN_BWE_A(6) = 'U') else CAS_IN_BWE_A(6); -- rv 0
  CAS_IN_BWE_A_in(7) <= '0' when (CAS_IN_BWE_A(7) = 'U') else CAS_IN_BWE_A(7); -- rv 0
  CAS_IN_BWE_A_in(8) <= '0' when (CAS_IN_BWE_A(8) = 'U') else CAS_IN_BWE_A(8); -- rv 0
  CAS_IN_BWE_B_in(0) <= '0' when (CAS_IN_BWE_B(0) = 'U') else CAS_IN_BWE_B(0); -- rv 0
  CAS_IN_BWE_B_in(1) <= '0' when (CAS_IN_BWE_B(1) = 'U') else CAS_IN_BWE_B(1); -- rv 0
  CAS_IN_BWE_B_in(2) <= '0' when (CAS_IN_BWE_B(2) = 'U') else CAS_IN_BWE_B(2); -- rv 0
  CAS_IN_BWE_B_in(3) <= '0' when (CAS_IN_BWE_B(3) = 'U') else CAS_IN_BWE_B(3); -- rv 0
  CAS_IN_BWE_B_in(4) <= '0' when (CAS_IN_BWE_B(4) = 'U') else CAS_IN_BWE_B(4); -- rv 0
  CAS_IN_BWE_B_in(5) <= '0' when (CAS_IN_BWE_B(5) = 'U') else CAS_IN_BWE_B(5); -- rv 0
  CAS_IN_BWE_B_in(6) <= '0' when (CAS_IN_BWE_B(6) = 'U') else CAS_IN_BWE_B(6); -- rv 0
  CAS_IN_BWE_B_in(7) <= '0' when (CAS_IN_BWE_B(7) = 'U') else CAS_IN_BWE_B(7); -- rv 0
  CAS_IN_BWE_B_in(8) <= '0' when (CAS_IN_BWE_B(8) = 'U') else CAS_IN_BWE_B(8); -- rv 0
  CAS_IN_DBITERR_A_in <= '0' when (CAS_IN_DBITERR_A = 'U') else CAS_IN_DBITERR_A; -- rv 0
  CAS_IN_DBITERR_B_in <= '0' when (CAS_IN_DBITERR_B = 'U') else CAS_IN_DBITERR_B; -- rv 0
  CAS_IN_DIN_A_in(0) <= '0' when (CAS_IN_DIN_A(0) = 'U') else CAS_IN_DIN_A(0); -- rv 0
  CAS_IN_DIN_A_in(1) <= '0' when (CAS_IN_DIN_A(1) = 'U') else CAS_IN_DIN_A(1); -- rv 0
  CAS_IN_DIN_A_in(10) <= '0' when (CAS_IN_DIN_A(10) = 'U') else CAS_IN_DIN_A(10); -- rv 0
  CAS_IN_DIN_A_in(11) <= '0' when (CAS_IN_DIN_A(11) = 'U') else CAS_IN_DIN_A(11); -- rv 0
  CAS_IN_DIN_A_in(12) <= '0' when (CAS_IN_DIN_A(12) = 'U') else CAS_IN_DIN_A(12); -- rv 0
  CAS_IN_DIN_A_in(13) <= '0' when (CAS_IN_DIN_A(13) = 'U') else CAS_IN_DIN_A(13); -- rv 0
  CAS_IN_DIN_A_in(14) <= '0' when (CAS_IN_DIN_A(14) = 'U') else CAS_IN_DIN_A(14); -- rv 0
  CAS_IN_DIN_A_in(15) <= '0' when (CAS_IN_DIN_A(15) = 'U') else CAS_IN_DIN_A(15); -- rv 0
  CAS_IN_DIN_A_in(16) <= '0' when (CAS_IN_DIN_A(16) = 'U') else CAS_IN_DIN_A(16); -- rv 0
  CAS_IN_DIN_A_in(17) <= '0' when (CAS_IN_DIN_A(17) = 'U') else CAS_IN_DIN_A(17); -- rv 0
  CAS_IN_DIN_A_in(18) <= '0' when (CAS_IN_DIN_A(18) = 'U') else CAS_IN_DIN_A(18); -- rv 0
  CAS_IN_DIN_A_in(19) <= '0' when (CAS_IN_DIN_A(19) = 'U') else CAS_IN_DIN_A(19); -- rv 0
  CAS_IN_DIN_A_in(2) <= '0' when (CAS_IN_DIN_A(2) = 'U') else CAS_IN_DIN_A(2); -- rv 0
  CAS_IN_DIN_A_in(20) <= '0' when (CAS_IN_DIN_A(20) = 'U') else CAS_IN_DIN_A(20); -- rv 0
  CAS_IN_DIN_A_in(21) <= '0' when (CAS_IN_DIN_A(21) = 'U') else CAS_IN_DIN_A(21); -- rv 0
  CAS_IN_DIN_A_in(22) <= '0' when (CAS_IN_DIN_A(22) = 'U') else CAS_IN_DIN_A(22); -- rv 0
  CAS_IN_DIN_A_in(23) <= '0' when (CAS_IN_DIN_A(23) = 'U') else CAS_IN_DIN_A(23); -- rv 0
  CAS_IN_DIN_A_in(24) <= '0' when (CAS_IN_DIN_A(24) = 'U') else CAS_IN_DIN_A(24); -- rv 0
  CAS_IN_DIN_A_in(25) <= '0' when (CAS_IN_DIN_A(25) = 'U') else CAS_IN_DIN_A(25); -- rv 0
  CAS_IN_DIN_A_in(26) <= '0' when (CAS_IN_DIN_A(26) = 'U') else CAS_IN_DIN_A(26); -- rv 0
  CAS_IN_DIN_A_in(27) <= '0' when (CAS_IN_DIN_A(27) = 'U') else CAS_IN_DIN_A(27); -- rv 0
  CAS_IN_DIN_A_in(28) <= '0' when (CAS_IN_DIN_A(28) = 'U') else CAS_IN_DIN_A(28); -- rv 0
  CAS_IN_DIN_A_in(29) <= '0' when (CAS_IN_DIN_A(29) = 'U') else CAS_IN_DIN_A(29); -- rv 0
  CAS_IN_DIN_A_in(3) <= '0' when (CAS_IN_DIN_A(3) = 'U') else CAS_IN_DIN_A(3); -- rv 0
  CAS_IN_DIN_A_in(30) <= '0' when (CAS_IN_DIN_A(30) = 'U') else CAS_IN_DIN_A(30); -- rv 0
  CAS_IN_DIN_A_in(31) <= '0' when (CAS_IN_DIN_A(31) = 'U') else CAS_IN_DIN_A(31); -- rv 0
  CAS_IN_DIN_A_in(32) <= '0' when (CAS_IN_DIN_A(32) = 'U') else CAS_IN_DIN_A(32); -- rv 0
  CAS_IN_DIN_A_in(33) <= '0' when (CAS_IN_DIN_A(33) = 'U') else CAS_IN_DIN_A(33); -- rv 0
  CAS_IN_DIN_A_in(34) <= '0' when (CAS_IN_DIN_A(34) = 'U') else CAS_IN_DIN_A(34); -- rv 0
  CAS_IN_DIN_A_in(35) <= '0' when (CAS_IN_DIN_A(35) = 'U') else CAS_IN_DIN_A(35); -- rv 0
  CAS_IN_DIN_A_in(36) <= '0' when (CAS_IN_DIN_A(36) = 'U') else CAS_IN_DIN_A(36); -- rv 0
  CAS_IN_DIN_A_in(37) <= '0' when (CAS_IN_DIN_A(37) = 'U') else CAS_IN_DIN_A(37); -- rv 0
  CAS_IN_DIN_A_in(38) <= '0' when (CAS_IN_DIN_A(38) = 'U') else CAS_IN_DIN_A(38); -- rv 0
  CAS_IN_DIN_A_in(39) <= '0' when (CAS_IN_DIN_A(39) = 'U') else CAS_IN_DIN_A(39); -- rv 0
  CAS_IN_DIN_A_in(4) <= '0' when (CAS_IN_DIN_A(4) = 'U') else CAS_IN_DIN_A(4); -- rv 0
  CAS_IN_DIN_A_in(40) <= '0' when (CAS_IN_DIN_A(40) = 'U') else CAS_IN_DIN_A(40); -- rv 0
  CAS_IN_DIN_A_in(41) <= '0' when (CAS_IN_DIN_A(41) = 'U') else CAS_IN_DIN_A(41); -- rv 0
  CAS_IN_DIN_A_in(42) <= '0' when (CAS_IN_DIN_A(42) = 'U') else CAS_IN_DIN_A(42); -- rv 0
  CAS_IN_DIN_A_in(43) <= '0' when (CAS_IN_DIN_A(43) = 'U') else CAS_IN_DIN_A(43); -- rv 0
  CAS_IN_DIN_A_in(44) <= '0' when (CAS_IN_DIN_A(44) = 'U') else CAS_IN_DIN_A(44); -- rv 0
  CAS_IN_DIN_A_in(45) <= '0' when (CAS_IN_DIN_A(45) = 'U') else CAS_IN_DIN_A(45); -- rv 0
  CAS_IN_DIN_A_in(46) <= '0' when (CAS_IN_DIN_A(46) = 'U') else CAS_IN_DIN_A(46); -- rv 0
  CAS_IN_DIN_A_in(47) <= '0' when (CAS_IN_DIN_A(47) = 'U') else CAS_IN_DIN_A(47); -- rv 0
  CAS_IN_DIN_A_in(48) <= '0' when (CAS_IN_DIN_A(48) = 'U') else CAS_IN_DIN_A(48); -- rv 0
  CAS_IN_DIN_A_in(49) <= '0' when (CAS_IN_DIN_A(49) = 'U') else CAS_IN_DIN_A(49); -- rv 0
  CAS_IN_DIN_A_in(5) <= '0' when (CAS_IN_DIN_A(5) = 'U') else CAS_IN_DIN_A(5); -- rv 0
  CAS_IN_DIN_A_in(50) <= '0' when (CAS_IN_DIN_A(50) = 'U') else CAS_IN_DIN_A(50); -- rv 0
  CAS_IN_DIN_A_in(51) <= '0' when (CAS_IN_DIN_A(51) = 'U') else CAS_IN_DIN_A(51); -- rv 0
  CAS_IN_DIN_A_in(52) <= '0' when (CAS_IN_DIN_A(52) = 'U') else CAS_IN_DIN_A(52); -- rv 0
  CAS_IN_DIN_A_in(53) <= '0' when (CAS_IN_DIN_A(53) = 'U') else CAS_IN_DIN_A(53); -- rv 0
  CAS_IN_DIN_A_in(54) <= '0' when (CAS_IN_DIN_A(54) = 'U') else CAS_IN_DIN_A(54); -- rv 0
  CAS_IN_DIN_A_in(55) <= '0' when (CAS_IN_DIN_A(55) = 'U') else CAS_IN_DIN_A(55); -- rv 0
  CAS_IN_DIN_A_in(56) <= '0' when (CAS_IN_DIN_A(56) = 'U') else CAS_IN_DIN_A(56); -- rv 0
  CAS_IN_DIN_A_in(57) <= '0' when (CAS_IN_DIN_A(57) = 'U') else CAS_IN_DIN_A(57); -- rv 0
  CAS_IN_DIN_A_in(58) <= '0' when (CAS_IN_DIN_A(58) = 'U') else CAS_IN_DIN_A(58); -- rv 0
  CAS_IN_DIN_A_in(59) <= '0' when (CAS_IN_DIN_A(59) = 'U') else CAS_IN_DIN_A(59); -- rv 0
  CAS_IN_DIN_A_in(6) <= '0' when (CAS_IN_DIN_A(6) = 'U') else CAS_IN_DIN_A(6); -- rv 0
  CAS_IN_DIN_A_in(60) <= '0' when (CAS_IN_DIN_A(60) = 'U') else CAS_IN_DIN_A(60); -- rv 0
  CAS_IN_DIN_A_in(61) <= '0' when (CAS_IN_DIN_A(61) = 'U') else CAS_IN_DIN_A(61); -- rv 0
  CAS_IN_DIN_A_in(62) <= '0' when (CAS_IN_DIN_A(62) = 'U') else CAS_IN_DIN_A(62); -- rv 0
  CAS_IN_DIN_A_in(63) <= '0' when (CAS_IN_DIN_A(63) = 'U') else CAS_IN_DIN_A(63); -- rv 0
  CAS_IN_DIN_A_in(64) <= '0' when (CAS_IN_DIN_A(64) = 'U') else CAS_IN_DIN_A(64); -- rv 0
  CAS_IN_DIN_A_in(65) <= '0' when (CAS_IN_DIN_A(65) = 'U') else CAS_IN_DIN_A(65); -- rv 0
  CAS_IN_DIN_A_in(66) <= '0' when (CAS_IN_DIN_A(66) = 'U') else CAS_IN_DIN_A(66); -- rv 0
  CAS_IN_DIN_A_in(67) <= '0' when (CAS_IN_DIN_A(67) = 'U') else CAS_IN_DIN_A(67); -- rv 0
  CAS_IN_DIN_A_in(68) <= '0' when (CAS_IN_DIN_A(68) = 'U') else CAS_IN_DIN_A(68); -- rv 0
  CAS_IN_DIN_A_in(69) <= '0' when (CAS_IN_DIN_A(69) = 'U') else CAS_IN_DIN_A(69); -- rv 0
  CAS_IN_DIN_A_in(7) <= '0' when (CAS_IN_DIN_A(7) = 'U') else CAS_IN_DIN_A(7); -- rv 0
  CAS_IN_DIN_A_in(70) <= '0' when (CAS_IN_DIN_A(70) = 'U') else CAS_IN_DIN_A(70); -- rv 0
  CAS_IN_DIN_A_in(71) <= '0' when (CAS_IN_DIN_A(71) = 'U') else CAS_IN_DIN_A(71); -- rv 0
  CAS_IN_DIN_A_in(8) <= '0' when (CAS_IN_DIN_A(8) = 'U') else CAS_IN_DIN_A(8); -- rv 0
  CAS_IN_DIN_A_in(9) <= '0' when (CAS_IN_DIN_A(9) = 'U') else CAS_IN_DIN_A(9); -- rv 0
  CAS_IN_DIN_B_in(0) <= '0' when (CAS_IN_DIN_B(0) = 'U') else CAS_IN_DIN_B(0); -- rv 0
  CAS_IN_DIN_B_in(1) <= '0' when (CAS_IN_DIN_B(1) = 'U') else CAS_IN_DIN_B(1); -- rv 0
  CAS_IN_DIN_B_in(10) <= '0' when (CAS_IN_DIN_B(10) = 'U') else CAS_IN_DIN_B(10); -- rv 0
  CAS_IN_DIN_B_in(11) <= '0' when (CAS_IN_DIN_B(11) = 'U') else CAS_IN_DIN_B(11); -- rv 0
  CAS_IN_DIN_B_in(12) <= '0' when (CAS_IN_DIN_B(12) = 'U') else CAS_IN_DIN_B(12); -- rv 0
  CAS_IN_DIN_B_in(13) <= '0' when (CAS_IN_DIN_B(13) = 'U') else CAS_IN_DIN_B(13); -- rv 0
  CAS_IN_DIN_B_in(14) <= '0' when (CAS_IN_DIN_B(14) = 'U') else CAS_IN_DIN_B(14); -- rv 0
  CAS_IN_DIN_B_in(15) <= '0' when (CAS_IN_DIN_B(15) = 'U') else CAS_IN_DIN_B(15); -- rv 0
  CAS_IN_DIN_B_in(16) <= '0' when (CAS_IN_DIN_B(16) = 'U') else CAS_IN_DIN_B(16); -- rv 0
  CAS_IN_DIN_B_in(17) <= '0' when (CAS_IN_DIN_B(17) = 'U') else CAS_IN_DIN_B(17); -- rv 0
  CAS_IN_DIN_B_in(18) <= '0' when (CAS_IN_DIN_B(18) = 'U') else CAS_IN_DIN_B(18); -- rv 0
  CAS_IN_DIN_B_in(19) <= '0' when (CAS_IN_DIN_B(19) = 'U') else CAS_IN_DIN_B(19); -- rv 0
  CAS_IN_DIN_B_in(2) <= '0' when (CAS_IN_DIN_B(2) = 'U') else CAS_IN_DIN_B(2); -- rv 0
  CAS_IN_DIN_B_in(20) <= '0' when (CAS_IN_DIN_B(20) = 'U') else CAS_IN_DIN_B(20); -- rv 0
  CAS_IN_DIN_B_in(21) <= '0' when (CAS_IN_DIN_B(21) = 'U') else CAS_IN_DIN_B(21); -- rv 0
  CAS_IN_DIN_B_in(22) <= '0' when (CAS_IN_DIN_B(22) = 'U') else CAS_IN_DIN_B(22); -- rv 0
  CAS_IN_DIN_B_in(23) <= '0' when (CAS_IN_DIN_B(23) = 'U') else CAS_IN_DIN_B(23); -- rv 0
  CAS_IN_DIN_B_in(24) <= '0' when (CAS_IN_DIN_B(24) = 'U') else CAS_IN_DIN_B(24); -- rv 0
  CAS_IN_DIN_B_in(25) <= '0' when (CAS_IN_DIN_B(25) = 'U') else CAS_IN_DIN_B(25); -- rv 0
  CAS_IN_DIN_B_in(26) <= '0' when (CAS_IN_DIN_B(26) = 'U') else CAS_IN_DIN_B(26); -- rv 0
  CAS_IN_DIN_B_in(27) <= '0' when (CAS_IN_DIN_B(27) = 'U') else CAS_IN_DIN_B(27); -- rv 0
  CAS_IN_DIN_B_in(28) <= '0' when (CAS_IN_DIN_B(28) = 'U') else CAS_IN_DIN_B(28); -- rv 0
  CAS_IN_DIN_B_in(29) <= '0' when (CAS_IN_DIN_B(29) = 'U') else CAS_IN_DIN_B(29); -- rv 0
  CAS_IN_DIN_B_in(3) <= '0' when (CAS_IN_DIN_B(3) = 'U') else CAS_IN_DIN_B(3); -- rv 0
  CAS_IN_DIN_B_in(30) <= '0' when (CAS_IN_DIN_B(30) = 'U') else CAS_IN_DIN_B(30); -- rv 0
  CAS_IN_DIN_B_in(31) <= '0' when (CAS_IN_DIN_B(31) = 'U') else CAS_IN_DIN_B(31); -- rv 0
  CAS_IN_DIN_B_in(32) <= '0' when (CAS_IN_DIN_B(32) = 'U') else CAS_IN_DIN_B(32); -- rv 0
  CAS_IN_DIN_B_in(33) <= '0' when (CAS_IN_DIN_B(33) = 'U') else CAS_IN_DIN_B(33); -- rv 0
  CAS_IN_DIN_B_in(34) <= '0' when (CAS_IN_DIN_B(34) = 'U') else CAS_IN_DIN_B(34); -- rv 0
  CAS_IN_DIN_B_in(35) <= '0' when (CAS_IN_DIN_B(35) = 'U') else CAS_IN_DIN_B(35); -- rv 0
  CAS_IN_DIN_B_in(36) <= '0' when (CAS_IN_DIN_B(36) = 'U') else CAS_IN_DIN_B(36); -- rv 0
  CAS_IN_DIN_B_in(37) <= '0' when (CAS_IN_DIN_B(37) = 'U') else CAS_IN_DIN_B(37); -- rv 0
  CAS_IN_DIN_B_in(38) <= '0' when (CAS_IN_DIN_B(38) = 'U') else CAS_IN_DIN_B(38); -- rv 0
  CAS_IN_DIN_B_in(39) <= '0' when (CAS_IN_DIN_B(39) = 'U') else CAS_IN_DIN_B(39); -- rv 0
  CAS_IN_DIN_B_in(4) <= '0' when (CAS_IN_DIN_B(4) = 'U') else CAS_IN_DIN_B(4); -- rv 0
  CAS_IN_DIN_B_in(40) <= '0' when (CAS_IN_DIN_B(40) = 'U') else CAS_IN_DIN_B(40); -- rv 0
  CAS_IN_DIN_B_in(41) <= '0' when (CAS_IN_DIN_B(41) = 'U') else CAS_IN_DIN_B(41); -- rv 0
  CAS_IN_DIN_B_in(42) <= '0' when (CAS_IN_DIN_B(42) = 'U') else CAS_IN_DIN_B(42); -- rv 0
  CAS_IN_DIN_B_in(43) <= '0' when (CAS_IN_DIN_B(43) = 'U') else CAS_IN_DIN_B(43); -- rv 0
  CAS_IN_DIN_B_in(44) <= '0' when (CAS_IN_DIN_B(44) = 'U') else CAS_IN_DIN_B(44); -- rv 0
  CAS_IN_DIN_B_in(45) <= '0' when (CAS_IN_DIN_B(45) = 'U') else CAS_IN_DIN_B(45); -- rv 0
  CAS_IN_DIN_B_in(46) <= '0' when (CAS_IN_DIN_B(46) = 'U') else CAS_IN_DIN_B(46); -- rv 0
  CAS_IN_DIN_B_in(47) <= '0' when (CAS_IN_DIN_B(47) = 'U') else CAS_IN_DIN_B(47); -- rv 0
  CAS_IN_DIN_B_in(48) <= '0' when (CAS_IN_DIN_B(48) = 'U') else CAS_IN_DIN_B(48); -- rv 0
  CAS_IN_DIN_B_in(49) <= '0' when (CAS_IN_DIN_B(49) = 'U') else CAS_IN_DIN_B(49); -- rv 0
  CAS_IN_DIN_B_in(5) <= '0' when (CAS_IN_DIN_B(5) = 'U') else CAS_IN_DIN_B(5); -- rv 0
  CAS_IN_DIN_B_in(50) <= '0' when (CAS_IN_DIN_B(50) = 'U') else CAS_IN_DIN_B(50); -- rv 0
  CAS_IN_DIN_B_in(51) <= '0' when (CAS_IN_DIN_B(51) = 'U') else CAS_IN_DIN_B(51); -- rv 0
  CAS_IN_DIN_B_in(52) <= '0' when (CAS_IN_DIN_B(52) = 'U') else CAS_IN_DIN_B(52); -- rv 0
  CAS_IN_DIN_B_in(53) <= '0' when (CAS_IN_DIN_B(53) = 'U') else CAS_IN_DIN_B(53); -- rv 0
  CAS_IN_DIN_B_in(54) <= '0' when (CAS_IN_DIN_B(54) = 'U') else CAS_IN_DIN_B(54); -- rv 0
  CAS_IN_DIN_B_in(55) <= '0' when (CAS_IN_DIN_B(55) = 'U') else CAS_IN_DIN_B(55); -- rv 0
  CAS_IN_DIN_B_in(56) <= '0' when (CAS_IN_DIN_B(56) = 'U') else CAS_IN_DIN_B(56); -- rv 0
  CAS_IN_DIN_B_in(57) <= '0' when (CAS_IN_DIN_B(57) = 'U') else CAS_IN_DIN_B(57); -- rv 0
  CAS_IN_DIN_B_in(58) <= '0' when (CAS_IN_DIN_B(58) = 'U') else CAS_IN_DIN_B(58); -- rv 0
  CAS_IN_DIN_B_in(59) <= '0' when (CAS_IN_DIN_B(59) = 'U') else CAS_IN_DIN_B(59); -- rv 0
  CAS_IN_DIN_B_in(6) <= '0' when (CAS_IN_DIN_B(6) = 'U') else CAS_IN_DIN_B(6); -- rv 0
  CAS_IN_DIN_B_in(60) <= '0' when (CAS_IN_DIN_B(60) = 'U') else CAS_IN_DIN_B(60); -- rv 0
  CAS_IN_DIN_B_in(61) <= '0' when (CAS_IN_DIN_B(61) = 'U') else CAS_IN_DIN_B(61); -- rv 0
  CAS_IN_DIN_B_in(62) <= '0' when (CAS_IN_DIN_B(62) = 'U') else CAS_IN_DIN_B(62); -- rv 0
  CAS_IN_DIN_B_in(63) <= '0' when (CAS_IN_DIN_B(63) = 'U') else CAS_IN_DIN_B(63); -- rv 0
  CAS_IN_DIN_B_in(64) <= '0' when (CAS_IN_DIN_B(64) = 'U') else CAS_IN_DIN_B(64); -- rv 0
  CAS_IN_DIN_B_in(65) <= '0' when (CAS_IN_DIN_B(65) = 'U') else CAS_IN_DIN_B(65); -- rv 0
  CAS_IN_DIN_B_in(66) <= '0' when (CAS_IN_DIN_B(66) = 'U') else CAS_IN_DIN_B(66); -- rv 0
  CAS_IN_DIN_B_in(67) <= '0' when (CAS_IN_DIN_B(67) = 'U') else CAS_IN_DIN_B(67); -- rv 0
  CAS_IN_DIN_B_in(68) <= '0' when (CAS_IN_DIN_B(68) = 'U') else CAS_IN_DIN_B(68); -- rv 0
  CAS_IN_DIN_B_in(69) <= '0' when (CAS_IN_DIN_B(69) = 'U') else CAS_IN_DIN_B(69); -- rv 0
  CAS_IN_DIN_B_in(7) <= '0' when (CAS_IN_DIN_B(7) = 'U') else CAS_IN_DIN_B(7); -- rv 0
  CAS_IN_DIN_B_in(70) <= '0' when (CAS_IN_DIN_B(70) = 'U') else CAS_IN_DIN_B(70); -- rv 0
  CAS_IN_DIN_B_in(71) <= '0' when (CAS_IN_DIN_B(71) = 'U') else CAS_IN_DIN_B(71); -- rv 0
  CAS_IN_DIN_B_in(8) <= '0' when (CAS_IN_DIN_B(8) = 'U') else CAS_IN_DIN_B(8); -- rv 0
  CAS_IN_DIN_B_in(9) <= '0' when (CAS_IN_DIN_B(9) = 'U') else CAS_IN_DIN_B(9); -- rv 0
  CAS_IN_DOUT_A_in(0) <= '0' when (CAS_IN_DOUT_A(0) = 'U') else CAS_IN_DOUT_A(0); -- rv 0
  CAS_IN_DOUT_A_in(1) <= '0' when (CAS_IN_DOUT_A(1) = 'U') else CAS_IN_DOUT_A(1); -- rv 0
  CAS_IN_DOUT_A_in(10) <= '0' when (CAS_IN_DOUT_A(10) = 'U') else CAS_IN_DOUT_A(10); -- rv 0
  CAS_IN_DOUT_A_in(11) <= '0' when (CAS_IN_DOUT_A(11) = 'U') else CAS_IN_DOUT_A(11); -- rv 0
  CAS_IN_DOUT_A_in(12) <= '0' when (CAS_IN_DOUT_A(12) = 'U') else CAS_IN_DOUT_A(12); -- rv 0
  CAS_IN_DOUT_A_in(13) <= '0' when (CAS_IN_DOUT_A(13) = 'U') else CAS_IN_DOUT_A(13); -- rv 0
  CAS_IN_DOUT_A_in(14) <= '0' when (CAS_IN_DOUT_A(14) = 'U') else CAS_IN_DOUT_A(14); -- rv 0
  CAS_IN_DOUT_A_in(15) <= '0' when (CAS_IN_DOUT_A(15) = 'U') else CAS_IN_DOUT_A(15); -- rv 0
  CAS_IN_DOUT_A_in(16) <= '0' when (CAS_IN_DOUT_A(16) = 'U') else CAS_IN_DOUT_A(16); -- rv 0
  CAS_IN_DOUT_A_in(17) <= '0' when (CAS_IN_DOUT_A(17) = 'U') else CAS_IN_DOUT_A(17); -- rv 0
  CAS_IN_DOUT_A_in(18) <= '0' when (CAS_IN_DOUT_A(18) = 'U') else CAS_IN_DOUT_A(18); -- rv 0
  CAS_IN_DOUT_A_in(19) <= '0' when (CAS_IN_DOUT_A(19) = 'U') else CAS_IN_DOUT_A(19); -- rv 0
  CAS_IN_DOUT_A_in(2) <= '0' when (CAS_IN_DOUT_A(2) = 'U') else CAS_IN_DOUT_A(2); -- rv 0
  CAS_IN_DOUT_A_in(20) <= '0' when (CAS_IN_DOUT_A(20) = 'U') else CAS_IN_DOUT_A(20); -- rv 0
  CAS_IN_DOUT_A_in(21) <= '0' when (CAS_IN_DOUT_A(21) = 'U') else CAS_IN_DOUT_A(21); -- rv 0
  CAS_IN_DOUT_A_in(22) <= '0' when (CAS_IN_DOUT_A(22) = 'U') else CAS_IN_DOUT_A(22); -- rv 0
  CAS_IN_DOUT_A_in(23) <= '0' when (CAS_IN_DOUT_A(23) = 'U') else CAS_IN_DOUT_A(23); -- rv 0
  CAS_IN_DOUT_A_in(24) <= '0' when (CAS_IN_DOUT_A(24) = 'U') else CAS_IN_DOUT_A(24); -- rv 0
  CAS_IN_DOUT_A_in(25) <= '0' when (CAS_IN_DOUT_A(25) = 'U') else CAS_IN_DOUT_A(25); -- rv 0
  CAS_IN_DOUT_A_in(26) <= '0' when (CAS_IN_DOUT_A(26) = 'U') else CAS_IN_DOUT_A(26); -- rv 0
  CAS_IN_DOUT_A_in(27) <= '0' when (CAS_IN_DOUT_A(27) = 'U') else CAS_IN_DOUT_A(27); -- rv 0
  CAS_IN_DOUT_A_in(28) <= '0' when (CAS_IN_DOUT_A(28) = 'U') else CAS_IN_DOUT_A(28); -- rv 0
  CAS_IN_DOUT_A_in(29) <= '0' when (CAS_IN_DOUT_A(29) = 'U') else CAS_IN_DOUT_A(29); -- rv 0
  CAS_IN_DOUT_A_in(3) <= '0' when (CAS_IN_DOUT_A(3) = 'U') else CAS_IN_DOUT_A(3); -- rv 0
  CAS_IN_DOUT_A_in(30) <= '0' when (CAS_IN_DOUT_A(30) = 'U') else CAS_IN_DOUT_A(30); -- rv 0
  CAS_IN_DOUT_A_in(31) <= '0' when (CAS_IN_DOUT_A(31) = 'U') else CAS_IN_DOUT_A(31); -- rv 0
  CAS_IN_DOUT_A_in(32) <= '0' when (CAS_IN_DOUT_A(32) = 'U') else CAS_IN_DOUT_A(32); -- rv 0
  CAS_IN_DOUT_A_in(33) <= '0' when (CAS_IN_DOUT_A(33) = 'U') else CAS_IN_DOUT_A(33); -- rv 0
  CAS_IN_DOUT_A_in(34) <= '0' when (CAS_IN_DOUT_A(34) = 'U') else CAS_IN_DOUT_A(34); -- rv 0
  CAS_IN_DOUT_A_in(35) <= '0' when (CAS_IN_DOUT_A(35) = 'U') else CAS_IN_DOUT_A(35); -- rv 0
  CAS_IN_DOUT_A_in(36) <= '0' when (CAS_IN_DOUT_A(36) = 'U') else CAS_IN_DOUT_A(36); -- rv 0
  CAS_IN_DOUT_A_in(37) <= '0' when (CAS_IN_DOUT_A(37) = 'U') else CAS_IN_DOUT_A(37); -- rv 0
  CAS_IN_DOUT_A_in(38) <= '0' when (CAS_IN_DOUT_A(38) = 'U') else CAS_IN_DOUT_A(38); -- rv 0
  CAS_IN_DOUT_A_in(39) <= '0' when (CAS_IN_DOUT_A(39) = 'U') else CAS_IN_DOUT_A(39); -- rv 0
  CAS_IN_DOUT_A_in(4) <= '0' when (CAS_IN_DOUT_A(4) = 'U') else CAS_IN_DOUT_A(4); -- rv 0
  CAS_IN_DOUT_A_in(40) <= '0' when (CAS_IN_DOUT_A(40) = 'U') else CAS_IN_DOUT_A(40); -- rv 0
  CAS_IN_DOUT_A_in(41) <= '0' when (CAS_IN_DOUT_A(41) = 'U') else CAS_IN_DOUT_A(41); -- rv 0
  CAS_IN_DOUT_A_in(42) <= '0' when (CAS_IN_DOUT_A(42) = 'U') else CAS_IN_DOUT_A(42); -- rv 0
  CAS_IN_DOUT_A_in(43) <= '0' when (CAS_IN_DOUT_A(43) = 'U') else CAS_IN_DOUT_A(43); -- rv 0
  CAS_IN_DOUT_A_in(44) <= '0' when (CAS_IN_DOUT_A(44) = 'U') else CAS_IN_DOUT_A(44); -- rv 0
  CAS_IN_DOUT_A_in(45) <= '0' when (CAS_IN_DOUT_A(45) = 'U') else CAS_IN_DOUT_A(45); -- rv 0
  CAS_IN_DOUT_A_in(46) <= '0' when (CAS_IN_DOUT_A(46) = 'U') else CAS_IN_DOUT_A(46); -- rv 0
  CAS_IN_DOUT_A_in(47) <= '0' when (CAS_IN_DOUT_A(47) = 'U') else CAS_IN_DOUT_A(47); -- rv 0
  CAS_IN_DOUT_A_in(48) <= '0' when (CAS_IN_DOUT_A(48) = 'U') else CAS_IN_DOUT_A(48); -- rv 0
  CAS_IN_DOUT_A_in(49) <= '0' when (CAS_IN_DOUT_A(49) = 'U') else CAS_IN_DOUT_A(49); -- rv 0
  CAS_IN_DOUT_A_in(5) <= '0' when (CAS_IN_DOUT_A(5) = 'U') else CAS_IN_DOUT_A(5); -- rv 0
  CAS_IN_DOUT_A_in(50) <= '0' when (CAS_IN_DOUT_A(50) = 'U') else CAS_IN_DOUT_A(50); -- rv 0
  CAS_IN_DOUT_A_in(51) <= '0' when (CAS_IN_DOUT_A(51) = 'U') else CAS_IN_DOUT_A(51); -- rv 0
  CAS_IN_DOUT_A_in(52) <= '0' when (CAS_IN_DOUT_A(52) = 'U') else CAS_IN_DOUT_A(52); -- rv 0
  CAS_IN_DOUT_A_in(53) <= '0' when (CAS_IN_DOUT_A(53) = 'U') else CAS_IN_DOUT_A(53); -- rv 0
  CAS_IN_DOUT_A_in(54) <= '0' when (CAS_IN_DOUT_A(54) = 'U') else CAS_IN_DOUT_A(54); -- rv 0
  CAS_IN_DOUT_A_in(55) <= '0' when (CAS_IN_DOUT_A(55) = 'U') else CAS_IN_DOUT_A(55); -- rv 0
  CAS_IN_DOUT_A_in(56) <= '0' when (CAS_IN_DOUT_A(56) = 'U') else CAS_IN_DOUT_A(56); -- rv 0
  CAS_IN_DOUT_A_in(57) <= '0' when (CAS_IN_DOUT_A(57) = 'U') else CAS_IN_DOUT_A(57); -- rv 0
  CAS_IN_DOUT_A_in(58) <= '0' when (CAS_IN_DOUT_A(58) = 'U') else CAS_IN_DOUT_A(58); -- rv 0
  CAS_IN_DOUT_A_in(59) <= '0' when (CAS_IN_DOUT_A(59) = 'U') else CAS_IN_DOUT_A(59); -- rv 0
  CAS_IN_DOUT_A_in(6) <= '0' when (CAS_IN_DOUT_A(6) = 'U') else CAS_IN_DOUT_A(6); -- rv 0
  CAS_IN_DOUT_A_in(60) <= '0' when (CAS_IN_DOUT_A(60) = 'U') else CAS_IN_DOUT_A(60); -- rv 0
  CAS_IN_DOUT_A_in(61) <= '0' when (CAS_IN_DOUT_A(61) = 'U') else CAS_IN_DOUT_A(61); -- rv 0
  CAS_IN_DOUT_A_in(62) <= '0' when (CAS_IN_DOUT_A(62) = 'U') else CAS_IN_DOUT_A(62); -- rv 0
  CAS_IN_DOUT_A_in(63) <= '0' when (CAS_IN_DOUT_A(63) = 'U') else CAS_IN_DOUT_A(63); -- rv 0
  CAS_IN_DOUT_A_in(64) <= '0' when (CAS_IN_DOUT_A(64) = 'U') else CAS_IN_DOUT_A(64); -- rv 0
  CAS_IN_DOUT_A_in(65) <= '0' when (CAS_IN_DOUT_A(65) = 'U') else CAS_IN_DOUT_A(65); -- rv 0
  CAS_IN_DOUT_A_in(66) <= '0' when (CAS_IN_DOUT_A(66) = 'U') else CAS_IN_DOUT_A(66); -- rv 0
  CAS_IN_DOUT_A_in(67) <= '0' when (CAS_IN_DOUT_A(67) = 'U') else CAS_IN_DOUT_A(67); -- rv 0
  CAS_IN_DOUT_A_in(68) <= '0' when (CAS_IN_DOUT_A(68) = 'U') else CAS_IN_DOUT_A(68); -- rv 0
  CAS_IN_DOUT_A_in(69) <= '0' when (CAS_IN_DOUT_A(69) = 'U') else CAS_IN_DOUT_A(69); -- rv 0
  CAS_IN_DOUT_A_in(7) <= '0' when (CAS_IN_DOUT_A(7) = 'U') else CAS_IN_DOUT_A(7); -- rv 0
  CAS_IN_DOUT_A_in(70) <= '0' when (CAS_IN_DOUT_A(70) = 'U') else CAS_IN_DOUT_A(70); -- rv 0
  CAS_IN_DOUT_A_in(71) <= '0' when (CAS_IN_DOUT_A(71) = 'U') else CAS_IN_DOUT_A(71); -- rv 0
  CAS_IN_DOUT_A_in(8) <= '0' when (CAS_IN_DOUT_A(8) = 'U') else CAS_IN_DOUT_A(8); -- rv 0
  CAS_IN_DOUT_A_in(9) <= '0' when (CAS_IN_DOUT_A(9) = 'U') else CAS_IN_DOUT_A(9); -- rv 0
  CAS_IN_DOUT_B_in(0) <= '0' when (CAS_IN_DOUT_B(0) = 'U') else CAS_IN_DOUT_B(0); -- rv 0
  CAS_IN_DOUT_B_in(1) <= '0' when (CAS_IN_DOUT_B(1) = 'U') else CAS_IN_DOUT_B(1); -- rv 0
  CAS_IN_DOUT_B_in(10) <= '0' when (CAS_IN_DOUT_B(10) = 'U') else CAS_IN_DOUT_B(10); -- rv 0
  CAS_IN_DOUT_B_in(11) <= '0' when (CAS_IN_DOUT_B(11) = 'U') else CAS_IN_DOUT_B(11); -- rv 0
  CAS_IN_DOUT_B_in(12) <= '0' when (CAS_IN_DOUT_B(12) = 'U') else CAS_IN_DOUT_B(12); -- rv 0
  CAS_IN_DOUT_B_in(13) <= '0' when (CAS_IN_DOUT_B(13) = 'U') else CAS_IN_DOUT_B(13); -- rv 0
  CAS_IN_DOUT_B_in(14) <= '0' when (CAS_IN_DOUT_B(14) = 'U') else CAS_IN_DOUT_B(14); -- rv 0
  CAS_IN_DOUT_B_in(15) <= '0' when (CAS_IN_DOUT_B(15) = 'U') else CAS_IN_DOUT_B(15); -- rv 0
  CAS_IN_DOUT_B_in(16) <= '0' when (CAS_IN_DOUT_B(16) = 'U') else CAS_IN_DOUT_B(16); -- rv 0
  CAS_IN_DOUT_B_in(17) <= '0' when (CAS_IN_DOUT_B(17) = 'U') else CAS_IN_DOUT_B(17); -- rv 0
  CAS_IN_DOUT_B_in(18) <= '0' when (CAS_IN_DOUT_B(18) = 'U') else CAS_IN_DOUT_B(18); -- rv 0
  CAS_IN_DOUT_B_in(19) <= '0' when (CAS_IN_DOUT_B(19) = 'U') else CAS_IN_DOUT_B(19); -- rv 0
  CAS_IN_DOUT_B_in(2) <= '0' when (CAS_IN_DOUT_B(2) = 'U') else CAS_IN_DOUT_B(2); -- rv 0
  CAS_IN_DOUT_B_in(20) <= '0' when (CAS_IN_DOUT_B(20) = 'U') else CAS_IN_DOUT_B(20); -- rv 0
  CAS_IN_DOUT_B_in(21) <= '0' when (CAS_IN_DOUT_B(21) = 'U') else CAS_IN_DOUT_B(21); -- rv 0
  CAS_IN_DOUT_B_in(22) <= '0' when (CAS_IN_DOUT_B(22) = 'U') else CAS_IN_DOUT_B(22); -- rv 0
  CAS_IN_DOUT_B_in(23) <= '0' when (CAS_IN_DOUT_B(23) = 'U') else CAS_IN_DOUT_B(23); -- rv 0
  CAS_IN_DOUT_B_in(24) <= '0' when (CAS_IN_DOUT_B(24) = 'U') else CAS_IN_DOUT_B(24); -- rv 0
  CAS_IN_DOUT_B_in(25) <= '0' when (CAS_IN_DOUT_B(25) = 'U') else CAS_IN_DOUT_B(25); -- rv 0
  CAS_IN_DOUT_B_in(26) <= '0' when (CAS_IN_DOUT_B(26) = 'U') else CAS_IN_DOUT_B(26); -- rv 0
  CAS_IN_DOUT_B_in(27) <= '0' when (CAS_IN_DOUT_B(27) = 'U') else CAS_IN_DOUT_B(27); -- rv 0
  CAS_IN_DOUT_B_in(28) <= '0' when (CAS_IN_DOUT_B(28) = 'U') else CAS_IN_DOUT_B(28); -- rv 0
  CAS_IN_DOUT_B_in(29) <= '0' when (CAS_IN_DOUT_B(29) = 'U') else CAS_IN_DOUT_B(29); -- rv 0
  CAS_IN_DOUT_B_in(3) <= '0' when (CAS_IN_DOUT_B(3) = 'U') else CAS_IN_DOUT_B(3); -- rv 0
  CAS_IN_DOUT_B_in(30) <= '0' when (CAS_IN_DOUT_B(30) = 'U') else CAS_IN_DOUT_B(30); -- rv 0
  CAS_IN_DOUT_B_in(31) <= '0' when (CAS_IN_DOUT_B(31) = 'U') else CAS_IN_DOUT_B(31); -- rv 0
  CAS_IN_DOUT_B_in(32) <= '0' when (CAS_IN_DOUT_B(32) = 'U') else CAS_IN_DOUT_B(32); -- rv 0
  CAS_IN_DOUT_B_in(33) <= '0' when (CAS_IN_DOUT_B(33) = 'U') else CAS_IN_DOUT_B(33); -- rv 0
  CAS_IN_DOUT_B_in(34) <= '0' when (CAS_IN_DOUT_B(34) = 'U') else CAS_IN_DOUT_B(34); -- rv 0
  CAS_IN_DOUT_B_in(35) <= '0' when (CAS_IN_DOUT_B(35) = 'U') else CAS_IN_DOUT_B(35); -- rv 0
  CAS_IN_DOUT_B_in(36) <= '0' when (CAS_IN_DOUT_B(36) = 'U') else CAS_IN_DOUT_B(36); -- rv 0
  CAS_IN_DOUT_B_in(37) <= '0' when (CAS_IN_DOUT_B(37) = 'U') else CAS_IN_DOUT_B(37); -- rv 0
  CAS_IN_DOUT_B_in(38) <= '0' when (CAS_IN_DOUT_B(38) = 'U') else CAS_IN_DOUT_B(38); -- rv 0
  CAS_IN_DOUT_B_in(39) <= '0' when (CAS_IN_DOUT_B(39) = 'U') else CAS_IN_DOUT_B(39); -- rv 0
  CAS_IN_DOUT_B_in(4) <= '0' when (CAS_IN_DOUT_B(4) = 'U') else CAS_IN_DOUT_B(4); -- rv 0
  CAS_IN_DOUT_B_in(40) <= '0' when (CAS_IN_DOUT_B(40) = 'U') else CAS_IN_DOUT_B(40); -- rv 0
  CAS_IN_DOUT_B_in(41) <= '0' when (CAS_IN_DOUT_B(41) = 'U') else CAS_IN_DOUT_B(41); -- rv 0
  CAS_IN_DOUT_B_in(42) <= '0' when (CAS_IN_DOUT_B(42) = 'U') else CAS_IN_DOUT_B(42); -- rv 0
  CAS_IN_DOUT_B_in(43) <= '0' when (CAS_IN_DOUT_B(43) = 'U') else CAS_IN_DOUT_B(43); -- rv 0
  CAS_IN_DOUT_B_in(44) <= '0' when (CAS_IN_DOUT_B(44) = 'U') else CAS_IN_DOUT_B(44); -- rv 0
  CAS_IN_DOUT_B_in(45) <= '0' when (CAS_IN_DOUT_B(45) = 'U') else CAS_IN_DOUT_B(45); -- rv 0
  CAS_IN_DOUT_B_in(46) <= '0' when (CAS_IN_DOUT_B(46) = 'U') else CAS_IN_DOUT_B(46); -- rv 0
  CAS_IN_DOUT_B_in(47) <= '0' when (CAS_IN_DOUT_B(47) = 'U') else CAS_IN_DOUT_B(47); -- rv 0
  CAS_IN_DOUT_B_in(48) <= '0' when (CAS_IN_DOUT_B(48) = 'U') else CAS_IN_DOUT_B(48); -- rv 0
  CAS_IN_DOUT_B_in(49) <= '0' when (CAS_IN_DOUT_B(49) = 'U') else CAS_IN_DOUT_B(49); -- rv 0
  CAS_IN_DOUT_B_in(5) <= '0' when (CAS_IN_DOUT_B(5) = 'U') else CAS_IN_DOUT_B(5); -- rv 0
  CAS_IN_DOUT_B_in(50) <= '0' when (CAS_IN_DOUT_B(50) = 'U') else CAS_IN_DOUT_B(50); -- rv 0
  CAS_IN_DOUT_B_in(51) <= '0' when (CAS_IN_DOUT_B(51) = 'U') else CAS_IN_DOUT_B(51); -- rv 0
  CAS_IN_DOUT_B_in(52) <= '0' when (CAS_IN_DOUT_B(52) = 'U') else CAS_IN_DOUT_B(52); -- rv 0
  CAS_IN_DOUT_B_in(53) <= '0' when (CAS_IN_DOUT_B(53) = 'U') else CAS_IN_DOUT_B(53); -- rv 0
  CAS_IN_DOUT_B_in(54) <= '0' when (CAS_IN_DOUT_B(54) = 'U') else CAS_IN_DOUT_B(54); -- rv 0
  CAS_IN_DOUT_B_in(55) <= '0' when (CAS_IN_DOUT_B(55) = 'U') else CAS_IN_DOUT_B(55); -- rv 0
  CAS_IN_DOUT_B_in(56) <= '0' when (CAS_IN_DOUT_B(56) = 'U') else CAS_IN_DOUT_B(56); -- rv 0
  CAS_IN_DOUT_B_in(57) <= '0' when (CAS_IN_DOUT_B(57) = 'U') else CAS_IN_DOUT_B(57); -- rv 0
  CAS_IN_DOUT_B_in(58) <= '0' when (CAS_IN_DOUT_B(58) = 'U') else CAS_IN_DOUT_B(58); -- rv 0
  CAS_IN_DOUT_B_in(59) <= '0' when (CAS_IN_DOUT_B(59) = 'U') else CAS_IN_DOUT_B(59); -- rv 0
  CAS_IN_DOUT_B_in(6) <= '0' when (CAS_IN_DOUT_B(6) = 'U') else CAS_IN_DOUT_B(6); -- rv 0
  CAS_IN_DOUT_B_in(60) <= '0' when (CAS_IN_DOUT_B(60) = 'U') else CAS_IN_DOUT_B(60); -- rv 0
  CAS_IN_DOUT_B_in(61) <= '0' when (CAS_IN_DOUT_B(61) = 'U') else CAS_IN_DOUT_B(61); -- rv 0
  CAS_IN_DOUT_B_in(62) <= '0' when (CAS_IN_DOUT_B(62) = 'U') else CAS_IN_DOUT_B(62); -- rv 0
  CAS_IN_DOUT_B_in(63) <= '0' when (CAS_IN_DOUT_B(63) = 'U') else CAS_IN_DOUT_B(63); -- rv 0
  CAS_IN_DOUT_B_in(64) <= '0' when (CAS_IN_DOUT_B(64) = 'U') else CAS_IN_DOUT_B(64); -- rv 0
  CAS_IN_DOUT_B_in(65) <= '0' when (CAS_IN_DOUT_B(65) = 'U') else CAS_IN_DOUT_B(65); -- rv 0
  CAS_IN_DOUT_B_in(66) <= '0' when (CAS_IN_DOUT_B(66) = 'U') else CAS_IN_DOUT_B(66); -- rv 0
  CAS_IN_DOUT_B_in(67) <= '0' when (CAS_IN_DOUT_B(67) = 'U') else CAS_IN_DOUT_B(67); -- rv 0
  CAS_IN_DOUT_B_in(68) <= '0' when (CAS_IN_DOUT_B(68) = 'U') else CAS_IN_DOUT_B(68); -- rv 0
  CAS_IN_DOUT_B_in(69) <= '0' when (CAS_IN_DOUT_B(69) = 'U') else CAS_IN_DOUT_B(69); -- rv 0
  CAS_IN_DOUT_B_in(7) <= '0' when (CAS_IN_DOUT_B(7) = 'U') else CAS_IN_DOUT_B(7); -- rv 0
  CAS_IN_DOUT_B_in(70) <= '0' when (CAS_IN_DOUT_B(70) = 'U') else CAS_IN_DOUT_B(70); -- rv 0
  CAS_IN_DOUT_B_in(71) <= '0' when (CAS_IN_DOUT_B(71) = 'U') else CAS_IN_DOUT_B(71); -- rv 0
  CAS_IN_DOUT_B_in(8) <= '0' when (CAS_IN_DOUT_B(8) = 'U') else CAS_IN_DOUT_B(8); -- rv 0
  CAS_IN_DOUT_B_in(9) <= '0' when (CAS_IN_DOUT_B(9) = 'U') else CAS_IN_DOUT_B(9); -- rv 0
  CAS_IN_EN_A_in <= '0' when (CAS_IN_EN_A = 'U') else CAS_IN_EN_A; -- rv 0
  CAS_IN_EN_B_in <= '0' when (CAS_IN_EN_B = 'U') else CAS_IN_EN_B; -- rv 0
  CAS_IN_RDACCESS_A_in <= CAS_IN_RDACCESS_A;
  CAS_IN_RDACCESS_B_in <= CAS_IN_RDACCESS_B;
  CAS_IN_RDB_WR_A_in <= '0' when (CAS_IN_RDB_WR_A = 'U') else CAS_IN_RDB_WR_A; -- rv 0
  CAS_IN_RDB_WR_B_in <= '0' when (CAS_IN_RDB_WR_B = 'U') else CAS_IN_RDB_WR_B; -- rv 0
  CAS_IN_SBITERR_A_in <= '0' when (CAS_IN_SBITERR_A = 'U') else CAS_IN_SBITERR_A; -- rv 0
  CAS_IN_SBITERR_B_in <= '0' when (CAS_IN_SBITERR_B = 'U') else CAS_IN_SBITERR_B; -- rv 0
  CLK_in <= '0' when (CLK = 'U') else CLK xor IS_CLK_INVERTED_BIN; -- rv 0
  DIN_A_in <= DIN_A;
  DIN_B_in <= DIN_B;
  EN_A_in <= '0' when (EN_A = 'U') else EN_A xor IS_EN_A_INVERTED_BIN; -- rv 0
  EN_B_in <= '0' when (EN_B = 'U') else EN_B xor IS_EN_B_INVERTED_BIN; -- rv 0
  INJECT_DBITERR_A_in <= '0' when (INJECT_DBITERR_A = 'U') else INJECT_DBITERR_A; -- rv 0
  INJECT_DBITERR_B_in <= '0' when (INJECT_DBITERR_B = 'U') else INJECT_DBITERR_B; -- rv 0
  INJECT_SBITERR_A_in <= '0' when (INJECT_SBITERR_A = 'U') else INJECT_SBITERR_A; -- rv 0
  INJECT_SBITERR_B_in <= '0' when (INJECT_SBITERR_B = 'U') else INJECT_SBITERR_B; -- rv 0
  OREG_CE_A_in <= '1' when (OREG_CE_A = 'U') else OREG_CE_A; -- rv 1
  OREG_CE_B_in <= '1' when (OREG_CE_B = 'U') else OREG_CE_B; -- rv 1
  OREG_ECC_CE_A_in <= '1' when (OREG_ECC_CE_A = 'U') else OREG_ECC_CE_A; -- rv 1
  OREG_ECC_CE_B_in <= '1' when (OREG_ECC_CE_B = 'U') else OREG_ECC_CE_B; -- rv 1
  RDB_WR_A_in <= '0' when (RDB_WR_A = 'U') else RDB_WR_A xor IS_RDB_WR_A_INVERTED_BIN; -- rv 0
  RDB_WR_B_in <= '0' when (RDB_WR_B = 'U') else RDB_WR_B xor IS_RDB_WR_B_INVERTED_BIN; -- rv 0
  RST_A_in <= '0' when (RST_A = 'U') else RST_A xor IS_RST_A_INVERTED_BIN; -- rv 0
  RST_B_in <= '0' when (RST_B = 'U') else RST_B xor IS_RST_B_INVERTED_BIN; -- rv 0
  SLEEP_in <= '0' when (SLEEP = 'U') else SLEEP; -- rv 0

  AUTO_SLEEP_LATENCY_BIN <= AUTO_SLEEP_LATENCY;

  AVG_CONS_INACTIVE_CYCLES_BIN <=  std_logic_vector(to_unsigned(AVG_CONS_INACTIVE_CYCLES,17));

  BWE_MODE_A_BIN <=
      BWE_MODE_A_PARITY_INTERLEAVED when (BWE_MODE_A = "PARITY_INTERLEAVED") else
      BWE_MODE_A_PARITY_INDEPENDENT when (BWE_MODE_A = "PARITY_INDEPENDENT") else
      BWE_MODE_A_PARITY_INTERLEAVED;

  BWE_MODE_B_BIN <=
      BWE_MODE_B_PARITY_INTERLEAVED when (BWE_MODE_B = "PARITY_INTERLEAVED") else
      BWE_MODE_B_PARITY_INDEPENDENT when (BWE_MODE_B = "PARITY_INDEPENDENT") else
      BWE_MODE_B_PARITY_INTERLEAVED;

  CASCADE_ORDER_A_BIN <=
      CASCADE_ORDER_A_NONE when (CASCADE_ORDER_A = "NONE") else
      CASCADE_ORDER_A_FIRST when (CASCADE_ORDER_A = "FIRST") else
      CASCADE_ORDER_A_LAST when (CASCADE_ORDER_A = "LAST") else
      CASCADE_ORDER_A_MIDDLE when (CASCADE_ORDER_A = "MIDDLE") else
      CASCADE_ORDER_A_NONE;

  CASCADE_ORDER_B_BIN <=
      CASCADE_ORDER_B_NONE when (CASCADE_ORDER_B = "NONE") else
      CASCADE_ORDER_B_FIRST when (CASCADE_ORDER_B = "FIRST") else
      CASCADE_ORDER_B_LAST when (CASCADE_ORDER_B = "LAST") else
      CASCADE_ORDER_B_MIDDLE when (CASCADE_ORDER_B = "MIDDLE") else
      CASCADE_ORDER_B_NONE;

  EN_AUTO_SLEEP_MODE_BIN <=
      EN_AUTO_SLEEP_MODE_FALSE when (EN_AUTO_SLEEP_MODE = "FALSE") else
      EN_AUTO_SLEEP_MODE_TRUE when (EN_AUTO_SLEEP_MODE = "TRUE") else
      EN_AUTO_SLEEP_MODE_FALSE;

  EN_ECC_RD_A_BIN <=
      EN_ECC_RD_A_FALSE when (EN_ECC_RD_A = "FALSE") else
      EN_ECC_RD_A_TRUE when (EN_ECC_RD_A = "TRUE") else
      EN_ECC_RD_A_FALSE;

  EN_ECC_RD_B_BIN <=
      EN_ECC_RD_B_FALSE when (EN_ECC_RD_B = "FALSE") else
      EN_ECC_RD_B_TRUE when (EN_ECC_RD_B = "TRUE") else
      EN_ECC_RD_B_FALSE;
 
  EN_ECC_WR_A_BIN <=
      EN_ECC_WR_A_FALSE when (EN_ECC_WR_A = "FALSE") else
      EN_ECC_WR_A_TRUE when (EN_ECC_WR_A = "TRUE") else
      EN_ECC_WR_A_FALSE;
 
  EN_ECC_WR_B_BIN <=
      EN_ECC_WR_B_FALSE when (EN_ECC_WR_B = "FALSE") else
      EN_ECC_WR_B_TRUE when (EN_ECC_WR_B = "TRUE") else
      EN_ECC_WR_B_FALSE;
 
  IREG_PRE_A_BIN <=
      IREG_PRE_A_FALSE when (IREG_PRE_A = "FALSE") else
      IREG_PRE_A_TRUE when (IREG_PRE_A = "TRUE") else
      IREG_PRE_A_FALSE;
 
  IREG_PRE_B_BIN <=
      IREG_PRE_B_FALSE when (IREG_PRE_B = "FALSE") else
      IREG_PRE_B_TRUE when (IREG_PRE_B = "TRUE") else
      IREG_PRE_B_FALSE;
 
  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_EN_A_INVERTED_BIN <= TO_X01(IS_EN_A_INVERTED);
  IS_EN_B_INVERTED_BIN <= TO_X01(IS_EN_B_INVERTED);
  IS_RDB_WR_A_INVERTED_BIN <= TO_X01(IS_RDB_WR_A_INVERTED);
  IS_RDB_WR_B_INVERTED_BIN <= TO_X01(IS_RDB_WR_B_INVERTED);
  IS_RST_A_INVERTED_BIN <= TO_X01(IS_RST_A_INVERTED);
  IS_RST_B_INVERTED_BIN <= TO_X01(IS_RST_B_INVERTED);

  OREG_A_BIN <=
      OREG_A_FALSE when (OREG_A = "FALSE") else
      OREG_A_TRUE when (OREG_A = "TRUE") else
      OREG_A_FALSE;
 
  OREG_B_BIN <=
      OREG_B_FALSE when (OREG_B = "FALSE") else
      OREG_B_TRUE when (OREG_B = "TRUE") else
      OREG_B_FALSE;
 
  OREG_ECC_A_BIN <=
      OREG_ECC_A_FALSE when (OREG_ECC_A = "FALSE") else
      OREG_ECC_A_TRUE when (OREG_ECC_A = "TRUE") else
      OREG_ECC_A_FALSE;
 
  OREG_ECC_B_BIN <=
      OREG_ECC_B_FALSE when (OREG_ECC_B = "FALSE") else
      OREG_ECC_B_TRUE when (OREG_ECC_B = "TRUE") else
      OREG_ECC_B_FALSE;
 
  REG_CAS_A_BIN <=
      REG_CAS_A_FALSE when (REG_CAS_A = "FALSE") else
      REG_CAS_A_TRUE when (REG_CAS_A = "TRUE") else
      REG_CAS_A_FALSE;
 
  REG_CAS_B_BIN <=
      REG_CAS_B_FALSE when (REG_CAS_B = "FALSE") else
      REG_CAS_B_TRUE when (REG_CAS_B = "TRUE") else
      REG_CAS_B_FALSE;
 
  RST_MODE_A_BIN <=
      RST_MODE_A_SYNC when (RST_MODE_A = "SYNC") else
      RST_MODE_A_ASYNC when (RST_MODE_A = "ASYNC") else
      RST_MODE_A_SYNC;
 
  RST_MODE_B_BIN <=
      RST_MODE_B_SYNC when (RST_MODE_B = "SYNC") else
      RST_MODE_B_ASYNC when (RST_MODE_B = "ASYNC") else
      RST_MODE_B_SYNC;
 
  SELF_ADDR_A_BIN <= SELF_ADDR_A;
 
  SELF_ADDR_B_BIN <= SELF_ADDR_B;
 
  SELF_MASK_A_BIN <= SELF_MASK_A;
 
  SELF_MASK_B_BIN <= SELF_MASK_B;
 
  USE_EXT_CE_A_BIN <=
      USE_EXT_CE_A_FALSE when (USE_EXT_CE_A = "FALSE") else
      USE_EXT_CE_A_TRUE when (USE_EXT_CE_A = "TRUE") else
      USE_EXT_CE_A_FALSE;
 
  USE_EXT_CE_B_BIN <=
      USE_EXT_CE_B_FALSE when (USE_EXT_CE_B = "FALSE") else
      USE_EXT_CE_B_TRUE when (USE_EXT_CE_B = "TRUE") else
      USE_EXT_CE_B_FALSE;
 
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- AUTO_SLEEP_LATENCY check
      if((xil_attr_test) or
         ((AUTO_SLEEP_LATENCY /= 8) and 
          (AUTO_SLEEP_LATENCY /= 3) and 
          (AUTO_SLEEP_LATENCY /= 4) and 
          (AUTO_SLEEP_LATENCY /= 5) and 
          (AUTO_SLEEP_LATENCY /= 6) and 
          (AUTO_SLEEP_LATENCY /= 7) and 
          (AUTO_SLEEP_LATENCY /= 9) and 
          (AUTO_SLEEP_LATENCY /= 10) and 
          (AUTO_SLEEP_LATENCY /= 11) and 
          (AUTO_SLEEP_LATENCY /= 12) and 
          (AUTO_SLEEP_LATENCY /= 13) and 
          (AUTO_SLEEP_LATENCY /= 14) and 
          (AUTO_SLEEP_LATENCY /= 15))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] AUTO_SLEEP_LATENCY attribute is set to "));
        Write ( Message, AUTO_SLEEP_LATENCY);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("8, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("7, "));
        Write ( Message, string'("9, "));
        Write ( Message, string'("10, "));
        Write ( Message, string'("11, "));
        Write ( Message, string'("12, "));
        Write ( Message, string'("13, "));
        Write ( Message, string'("14 or "));
        Write ( Message, string'("15. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- AVG_CONS_INACTIVE_CYCLES check
        if((xil_attr_test) or
           ((AVG_CONS_INACTIVE_CYCLES < 10) or (AVG_CONS_INACTIVE_CYCLES > 100000))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-102] AVG_CONS_INACTIVE_CYCLES attribute is set to "));
          Write ( Message, AVG_CONS_INACTIVE_CYCLES);
          Write ( Message, string'(". Legal values for this attribute are 10 to 100000. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- BWE_MODE_A check
      if((xil_attr_test) or
         ((BWE_MODE_A /= "PARITY_INTERLEAVED") and
          (BWE_MODE_A /= "PARITY_INDEPENDENT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] BWE_MODE_A attribute is set to """));
        Write ( Message, string'(BWE_MODE_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""PARITY_INTERLEAVED"" or "));
        Write ( Message, string'("""PARITY_INDEPENDENT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- BWE_MODE_B check
      if((xil_attr_test) or
         ((BWE_MODE_B /= "PARITY_INTERLEAVED") and
          (BWE_MODE_B /= "PARITY_INDEPENDENT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] BWE_MODE_B attribute is set to """));
        Write ( Message, string'(BWE_MODE_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""PARITY_INTERLEAVED"" or "));
        Write ( Message, string'("""PARITY_INDEPENDENT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CASCADE_ORDER_A check
      if((xil_attr_test) or
         ((CASCADE_ORDER_A /= "NONE") and
          (CASCADE_ORDER_A /= "FIRST") and
          (CASCADE_ORDER_A /= "LAST") and
          (CASCADE_ORDER_A /= "MIDDLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] CASCADE_ORDER_A attribute is set to """));
        Write ( Message, string'(CASCADE_ORDER_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""NONE"", "));
        Write ( Message, string'("""FIRST"", "));
        Write ( Message, string'("""LAST"" or "));
        Write ( Message, string'("""MIDDLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CASCADE_ORDER_B check
      if((xil_attr_test) or
         ((CASCADE_ORDER_B /= "NONE") and
          (CASCADE_ORDER_B /= "FIRST") and
          (CASCADE_ORDER_B /= "LAST") and
          (CASCADE_ORDER_B /= "MIDDLE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] CASCADE_ORDER_B attribute is set to """));
        Write ( Message, string'(CASCADE_ORDER_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""NONE"", "));
        Write ( Message, string'("""FIRST"", "));
        Write ( Message, string'("""LAST"" or "));
        Write ( Message, string'("""MIDDLE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_AUTO_SLEEP_MODE check
      if((xil_attr_test) or
         ((EN_AUTO_SLEEP_MODE /= "FALSE") and
          (EN_AUTO_SLEEP_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-107] EN_AUTO_SLEEP_MODE attribute is set to """));
        Write ( Message, string'(EN_AUTO_SLEEP_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_ECC_RD_A check
      if((xil_attr_test) or
         ((EN_ECC_RD_A /= "FALSE") and
          (EN_ECC_RD_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-108] EN_ECC_RD_A attribute is set to """));
        Write ( Message, string'(EN_ECC_RD_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_ECC_RD_B check
      if((xil_attr_test) or
         ((EN_ECC_RD_B /= "FALSE") and
          (EN_ECC_RD_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-109] EN_ECC_RD_B attribute is set to """));
        Write ( Message, string'(EN_ECC_RD_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_ECC_WR_A check
      if((xil_attr_test) or
         ((EN_ECC_WR_A /= "FALSE") and
          (EN_ECC_WR_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-110] EN_ECC_WR_A attribute is set to """));
        Write ( Message, string'(EN_ECC_WR_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- EN_ECC_WR_B check
      if((xil_attr_test) or
         ((EN_ECC_WR_B /= "FALSE") and
          (EN_ECC_WR_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] EN_ECC_WR_B attribute is set to """));
        Write ( Message, string'(EN_ECC_WR_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IREG_PRE_A check
      if((xil_attr_test) or
         ((IREG_PRE_A /= "FALSE") and
          (IREG_PRE_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-115] IREG_PRE_A attribute is set to """));
        Write ( Message, string'(IREG_PRE_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IREG_PRE_B check
      if((xil_attr_test) or
         ((IREG_PRE_B /= "FALSE") and
          (IREG_PRE_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-116] IREG_PRE_B attribute is set to """));
        Write ( Message, string'(IREG_PRE_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IS_CLK_INVERTED check
        if((xil_attr_test) or
           ((IS_CLK_INVERTED < '0') or(IS_CLK_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-122] IS_CLK_INVERTED attribute is set to "));
          Write ( Message, IS_CLK_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IS_EN_A_INVERTED check
        if((xil_attr_test) or
           ((IS_EN_A_INVERTED < '0') or(IS_EN_A_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-123] IS_EN_A_INVERTED attribute is set to "));
          Write ( Message, IS_EN_A_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IS_EN_B_INVERTED check
        if((xil_attr_test) or
           ((IS_EN_B_INVERTED < '0') or(IS_EN_B_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-124] IS_EN_B_INVERTED attribute is set to "));
          Write ( Message, IS_EN_B_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IS_RDB_WR_A_INVERTED check
        if((xil_attr_test) or
           ((IS_RDB_WR_A_INVERTED < '0') or(IS_RDB_WR_A_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-125] IS_RDB_WR_A_INVERTED attribute is set to "));
          Write ( Message, IS_RDB_WR_A_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IS_RDB_WR_B_INVERTED check
        if((xil_attr_test) or
           ((IS_RDB_WR_B_INVERTED < '0') or(IS_RDB_WR_B_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-126] IS_RDB_WR_B_INVERTED attribute is set to "));
          Write ( Message, IS_RDB_WR_B_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IS_RST_A_INVERTED check
        if((xil_attr_test) or
           ((IS_RST_A_INVERTED < '0') or(IS_RST_A_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-127] IS_RST_A_INVERTED attribute is set to "));
          Write ( Message, IS_RST_A_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- IS_RST_B_INVERTED check
        if((xil_attr_test) or
           ((IS_RST_B_INVERTED < '0') or(IS_RST_B_INVERTED > '1'))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-128] IS_RST_B_INVERTED attribute is set to "));
          Write ( Message, IS_RST_B_INVERTED);
          Write ( Message, string'(". Legal values for this attribute are 0 to 1. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- OREG_A check
      if((xil_attr_test) or
         ((OREG_A /= "FALSE") and
          (OREG_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-129] OREG_A attribute is set to """));
        Write ( Message, string'(OREG_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- OREG_B check
      if((xil_attr_test) or
         ((OREG_B /= "FALSE") and
          (OREG_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-130] OREG_B attribute is set to """));
        Write ( Message, string'(OREG_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- OREG_ECC_A check
      if((xil_attr_test) or
         ((OREG_ECC_A /= "FALSE") and
          (OREG_ECC_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-133] OREG_ECC_A attribute is set to """));
        Write ( Message, string'(OREG_ECC_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- OREG_ECC_B check
      if((xil_attr_test) or
         ((OREG_ECC_B /= "FALSE") and
          (OREG_ECC_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-134] OREG_ECC_B attribute is set to """));
        Write ( Message, string'(OREG_ECC_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- REG_CAS_A check
      if((xil_attr_test) or
         ((REG_CAS_A /= "FALSE") and
          (REG_CAS_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-135] REG_CAS_A attribute is set to """));
        Write ( Message, string'(REG_CAS_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- REG_CAS_B check
      if((xil_attr_test) or
         ((REG_CAS_B /= "FALSE") and
          (REG_CAS_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-136] REG_CAS_B attribute is set to """));
        Write ( Message, string'(REG_CAS_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RST_MODE_A check
      if((xil_attr_test) or
         ((RST_MODE_A /= "SYNC") and
          (RST_MODE_A /= "ASYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-137] RST_MODE_A attribute is set to """));
        Write ( Message, string'(RST_MODE_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"" or "));
        Write ( Message, string'("""ASYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- RST_MODE_B check
      if((xil_attr_test) or
         ((RST_MODE_B /= "SYNC") and
          (RST_MODE_B /= "ASYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-138] RST_MODE_B attribute is set to """));
        Write ( Message, string'(RST_MODE_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"" or "));
        Write ( Message, string'("""ASYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SELF_ADDR_A check
        if((xil_attr_test) or
           ((SELF_ADDR_A < "000" & X"00") or(SELF_ADDR_A > "111" & X"FF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-139] SELF_ADDR_A attribute is set to "));
          Write ( Message, SLV_TO_STR(SELF_ADDR_A));
          Write ( Message, string'(". Legal values for this attribute are 000 to 7FF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- SELF_ADDR_B check
        if((xil_attr_test) or
           ((SELF_ADDR_B < "000" & X"00") or(SELF_ADDR_B > "111" & X"FF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-140] SELF_ADDR_B attribute is set to "));
          Write ( Message, SLV_TO_STR(SELF_ADDR_B));
          Write ( Message, string'(". Legal values for this attribute are 000 to 7FF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- SELF_MASK_A check
        if((xil_attr_test) or
           ((SELF_MASK_A < "000" & X"00") or(SELF_MASK_A > "111" & X"FF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-141] SELF_MASK_A attribute is set to "));
          Write ( Message, SLV_TO_STR(SELF_MASK_A));
          Write ( Message, string'(". Legal values for this attribute are 000 to 7FF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- SELF_MASK_B check
        if((xil_attr_test) or
           ((SELF_MASK_B < "000" & X"00") or(SELF_MASK_B > "111" & X"FF"))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-142] SELF_MASK_B attribute is set to "));
          Write ( Message, SLV_TO_STR(SELF_MASK_B));
          Write ( Message, string'(". Legal values for this attribute are 000 to 7FF. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- USE_EXT_CE_A check
      if((xil_attr_test) or
         ((USE_EXT_CE_A /= "FALSE") and
          (USE_EXT_CE_A /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-143] USE_EXT_CE_A attribute is set to """));
        Write ( Message, string'(USE_EXT_CE_A));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- USE_EXT_CE_B check
      if((xil_attr_test) or
         ((USE_EXT_CE_B /= "FALSE") and
          (USE_EXT_CE_B /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-145] USE_EXT_CE_B attribute is set to """));
        Write ( Message, string'(USE_EXT_CE_B));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- USE_EXT_CE_A vs CASCADE_ORDER_A check
      if((xil_attr_test) or
         ((CASCADE_ORDER_A /= "NONE") and
          (USE_EXT_CE_A = "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-1] CASCADE_ORDER_A attribute is set to """));
        Write ( Message, string'(CASCADE_ORDER_A));
        Write ( Message, string'(""" and USE_EXT_CE_A attribute is set to """));
        Write ( Message, string'(USE_EXT_CE_A));
        Write ( Message, string'(""". EXT_CE_A can not be used in "));
        Write ( Message, string'("cascaded URAM applications. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- USE_EXT_CE_B vs CASCADE_ORDER_B check
      if((xil_attr_test) or
         ((CASCADE_ORDER_B /= "NONE") and
          (USE_EXT_CE_B = "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-2] CASCADE_ORDER_B attribute is set to """));
        Write ( Message, string'(CASCADE_ORDER_B));
        Write ( Message, string'(""" and USE_EXT_CE_B attribute is set to """));
        Write ( Message, string'(USE_EXT_CE_B));
        Write ( Message, string'(""". EXT_CE_B can not be used in "));
        Write ( Message, string'("cascaded URAM applications."));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-146] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(URAM288_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
   
    INIT_RAM <= '1' after 100 ps;
    wait;
    end process INIPROC;
   

--  input register stages
--  decisions simulate faster than assignments - wider muxes, less busses

  process (RST_A_in)
  begin
    if (RST_MODE_A_BIN = RST_MODE_A_ASYNC) then
      RST_A_async <= RST_A_in;
    end if;
  end process;

  process (RST_B_in)
  begin
    if (RST_MODE_A_BIN = RST_MODE_A_ASYNC) then
      RST_B_async <= RST_B_in;
    end if;
  end process;

  process (CLK_in) begin
    if (rising_edge(CLK_in)) then
      if ((RST_MODE_A_BIN = RST_MODE_A_SYNC) and (RST_A_sync /= RST_A_in)) then
        RST_A_sync <= RST_A_in;
      end if;
      if ((RST_MODE_B_BIN = RST_MODE_B_SYNC) and (RST_B_sync /= RST_B_in)) then
        RST_B_sync <= RST_B_in;
      end if;
    end if;
  end process;

  ireg_pre_a_p : process (CLK_in, glblGSR) begin
    if (glblGSR = '1' or
        (((CASCADE_ORDER_A_BIN /= CASCADE_ORDER_A_NONE) and
          (REG_CAS_A_BIN = REG_CAS_A_FALSE)) and
        (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
          (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) and
         (IREG_PRE_A_BIN = IREG_PRE_A_FALSE)))) then
      ADDR_A_reg <= ADDR_INIT;
      BWE_A_reg <= BWE_INIT;
      DIN_A_reg <= D_INIT;
      EN_A_reg <= '0';
      INJECT_DBITERR_A_reg <= '0';
      INJECT_SBITERR_A_reg <= '0';
      RDB_WR_A_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
           (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
          (REG_CAS_A_BIN = REG_CAS_A_TRUE)) then
        EN_A_reg <= CAS_IN_EN_A_in;
        if (CAS_IN_EN_A_in = '1') then
          ADDR_A_reg(22 downto 12) <= CAS_IN_ADDR_A_in(22 downto 12);
        end if;
        if ((CAS_IN_EN_A_in = '1') or (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_TRUE)) then
          ADDR_A_reg(11 downto 0) <= CAS_IN_ADDR_A_in(11 downto 0);
          BWE_A_reg <= CAS_IN_BWE_A_in;
          DIN_A_reg <= CAS_IN_DIN_A_in;
          RDB_WR_A_reg <= CAS_IN_RDB_WR_A_in;
        end if;
      else
        EN_A_reg <= EN_A_in;
        if (EN_A_in = '1') then
          ADDR_A_reg(22 downto 12) <= ADDR_A_in(22 downto 12);
        end if;
        if ((EN_A_in = '1') or (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_TRUE)) then
          ADDR_A_reg(11 downto 0) <= ADDR_A_in(11 downto 0);
          BWE_A_reg <= BWE_A_in;
          DIN_A_reg <= DIN_A_in;
          INJECT_DBITERR_A_reg <= INJECT_DBITERR_A_in;
          INJECT_SBITERR_A_reg <= INJECT_SBITERR_A_in;
          RDB_WR_A_reg <= RDB_WR_A_in;
        end if;
      end if;
    end if;
  end process;

  ADDR_A_MUX : process begin
    if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
        (REG_CAS_A_BIN = REG_CAS_A_FALSE)) then
      ADDR_A_int <= CAS_IN_ADDR_A_in;
    elsif ((((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) and
            (IREG_PRE_A_BIN = IREG_PRE_A_TRUE)) or
           (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
            (REG_CAS_A_BIN = REG_CAS_A_TRUE))) then
      ADDR_A_int <= ADDR_A_reg;
    else
      ADDR_A_int <= ADDR_A_in;
    end if;
    wait on ADDR_A_in, ADDR_A_reg, CAS_IN_ADDR_A_in;
  end process;

  BWE_A_MUX : process begin
    if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
        (REG_CAS_A_BIN = REG_CAS_A_FALSE)) then
      BWE_A_int <= CAS_IN_BWE_A_in;
    elsif ((((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) and
            (IREG_PRE_A_BIN = IREG_PRE_A_TRUE)) or
           (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
            (REG_CAS_A_BIN = REG_CAS_A_TRUE))) then
      BWE_A_int <= BWE_A_reg;
    else
      BWE_A_int <= BWE_A_in;
    end if;
    wait on BWE_A_in, BWE_A_reg, CAS_IN_BWE_A_in;
  end process;

  DIN_A_MUX : process begin
    if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
        (REG_CAS_A_BIN = REG_CAS_A_FALSE)) then
      DIN_A_int <= CAS_IN_DIN_A_in;
    elsif ((((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) and
            (IREG_PRE_A_BIN = IREG_PRE_A_TRUE)) or
           (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
            (REG_CAS_A_BIN = REG_CAS_A_TRUE))) then
      DIN_A_int <= DIN_A_reg;
    else
      DIN_A_int <= DIN_A_in;
    end if;
    wait on CAS_IN_DIN_A_in, DIN_A_in, DIN_A_reg;
  end process;

  EN_A_MUX : process begin
    if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
        (REG_CAS_A_BIN = REG_CAS_A_FALSE)) then
      EN_A_int <= CAS_IN_EN_A_in;
    elsif ((((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) and
            (IREG_PRE_A_BIN = IREG_PRE_A_TRUE)) or
           (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
            (REG_CAS_A_BIN = REG_CAS_A_TRUE))) then
      EN_A_int <= EN_A_reg;
    else
      EN_A_int <= EN_A_in;
    end if;
    wait on CAS_IN_EN_A_in, EN_A_in, EN_A_reg;
  end process;

  INJECT_DBITERR_A_MUX : process begin
    if (IREG_PRE_A_BIN = IREG_PRE_A_TRUE) then
      INJECT_DBITERR_A_int <= INJECT_DBITERR_A_reg;
    else
      INJECT_DBITERR_A_int <= INJECT_DBITERR_A_in;
    end if;
    wait on INJECT_DBITERR_A_in, INJECT_DBITERR_A_reg;
  end process;

  INJECT_SBITERR_A_MUX : process begin
    if (IREG_PRE_A_BIN = IREG_PRE_A_TRUE) then
      INJECT_SBITERR_A_int <= INJECT_SBITERR_A_reg;
    else
      INJECT_SBITERR_A_int <= INJECT_SBITERR_A_in;
    end if;
    wait on INJECT_SBITERR_A_in, INJECT_SBITERR_A_reg;
  end process;

  RDB_WR_A_MUX : process begin
    if (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
         (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
        (REG_CAS_A_BIN = REG_CAS_A_FALSE)) then
      RDB_WR_A_int <= CAS_IN_RDB_WR_A_in;
    elsif ((((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_FIRST) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) and
            (IREG_PRE_A_BIN = IREG_PRE_A_TRUE)) or
           (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
             (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
            (REG_CAS_A_BIN = REG_CAS_A_TRUE))) then
      RDB_WR_A_int <= RDB_WR_A_reg;
    else
      RDB_WR_A_int <= RDB_WR_A_in;
    end if;
    wait on CAS_IN_RDB_WR_A_in, RDB_WR_A_in, RDB_WR_A_reg;
  end process;

  ireg_pre_b_p : process (CLK_in, glblGSR) begin
    if (glblGSR = '1' or
        (((CASCADE_ORDER_A_BIN /= CASCADE_ORDER_A_NONE) and
          (REG_CAS_A_BIN = REG_CAS_A_FALSE)) and
         (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
           (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) and
          (IREG_PRE_B_BIN = IREG_PRE_B_FALSE)))) then
      ADDR_B_reg <= ADDR_INIT;
      BWE_B_reg <= BWE_INIT;
      DIN_B_reg <= D_INIT;
      EN_B_reg <= '0';
      INJECT_DBITERR_B_reg <= '0';
      INJECT_SBITERR_B_reg <= '0';
      RDB_WR_B_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
           (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
          (REG_CAS_B_BIN = REG_CAS_B_TRUE)) then
        EN_B_reg <= CAS_IN_EN_B_in;
        if (CAS_IN_EN_B_in = '1') then
          ADDR_B_reg(22 downto 12) <= CAS_IN_ADDR_B_in(22 downto 12);
        end if;
        if ((CAS_IN_EN_B_in = '1') or (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_TRUE)) then
          ADDR_B_reg(11 downto 0) <= CAS_IN_ADDR_B_in(11 downto 0);
          BWE_B_reg <= CAS_IN_BWE_B_in;
          DIN_B_reg <= CAS_IN_DIN_B_in;
          RDB_WR_B_reg <= CAS_IN_RDB_WR_B_in;
        end if;
      else
        EN_B_reg <= EN_B_in;
        if (EN_B_in = '1') then
          ADDR_B_reg(22 downto 12) <= ADDR_B_in(22 downto 12);
        end if;
        if ((EN_B_in = '1') or (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_TRUE)) then
          ADDR_B_reg(11 downto 0) <= ADDR_B_in(11 downto 0);
          BWE_B_reg <= BWE_B_in;
          DIN_B_reg <= DIN_B_in;
          INJECT_DBITERR_B_reg <= INJECT_DBITERR_B_in;
          INJECT_SBITERR_B_reg <= INJECT_SBITERR_B_in;
          RDB_WR_B_reg <= RDB_WR_B_in;
        end if;
      end if;
    end if;
  end process;

  ADDR_B_MUX : process begin
    if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
         (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
        (REG_CAS_B_BIN = REG_CAS_B_FALSE)) then
      ADDR_B_int <= CAS_IN_ADDR_B_in;
    elsif ((((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) and
            (IREG_PRE_B_BIN = IREG_PRE_B_TRUE)) or
           (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
            (REG_CAS_B_BIN = REG_CAS_B_TRUE))) then
      ADDR_B_int <= ADDR_B_reg;
    else
      ADDR_B_int <= ADDR_B_in;
    end if;
    wait on ADDR_B_in, ADDR_B_reg, CAS_IN_ADDR_B_in;
  end process;

  BWE_B_MUX : process begin
    if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
         (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
        (REG_CAS_B_BIN = REG_CAS_B_FALSE)) then
      BWE_B_int <= CAS_IN_BWE_B_in;
    elsif ((((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) and
            (IREG_PRE_B_BIN = IREG_PRE_B_TRUE)) or
           (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
            (REG_CAS_B_BIN = REG_CAS_B_TRUE))) then
      BWE_B_int <= BWE_B_reg;
    else
      BWE_B_int <= BWE_B_in;
    end if;
    wait on BWE_B_in, BWE_B_reg, CAS_IN_BWE_B_in;
  end process;

  DIN_B_MUX : process begin
    if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
         (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
        (REG_CAS_B_BIN = REG_CAS_B_FALSE)) then
      DIN_B_int <= CAS_IN_DIN_B_in;
    elsif ((((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) and
            (IREG_PRE_B_BIN = IREG_PRE_B_TRUE)) or
           (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
            (REG_CAS_B_BIN = REG_CAS_B_TRUE))) then
      DIN_B_int <= DIN_B_reg;
    else
      DIN_B_int <= DIN_B_in;
    end if;
    wait on CAS_IN_DIN_B_in, DIN_B_in, DIN_B_reg;
  end process;

  EN_B_MUX : process begin
    if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
         (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
        (REG_CAS_B_BIN = REG_CAS_B_FALSE)) then
      EN_B_int <= CAS_IN_EN_B_in;
    elsif ((((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) and
            (IREG_PRE_B_BIN = IREG_PRE_B_TRUE)) or
           (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
            (REG_CAS_B_BIN = REG_CAS_B_TRUE))) then
      EN_B_int <= EN_B_reg;
    else
      EN_B_int <= EN_B_in;
    end if;
    wait on CAS_IN_EN_B_in, EN_B_in, EN_B_reg;
  end process;

  INJECT_DBITERR_B_MUX : process begin
    if (IREG_PRE_B_BIN = IREG_PRE_B_TRUE) then
      INJECT_DBITERR_B_int <= INJECT_DBITERR_B_reg;
    else
      INJECT_DBITERR_B_int <= INJECT_DBITERR_B_in;
    end if;
    wait on INJECT_DBITERR_B_in, INJECT_DBITERR_B_reg;
  end process;

  INJECT_SBITERR_B_MUX : process begin
    if (IREG_PRE_B_BIN = IREG_PRE_B_TRUE) then
      INJECT_SBITERR_B_int <= INJECT_SBITERR_B_reg;
    else
      INJECT_SBITERR_B_int <= INJECT_SBITERR_B_in;
    end if;
    wait on INJECT_SBITERR_B_in, INJECT_SBITERR_B_reg;
  end process;

  RDB_WR_B_MUX : process begin
    if (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
         (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
        (REG_CAS_B_BIN = REG_CAS_B_FALSE)) then
      RDB_WR_B_int <= CAS_IN_RDB_WR_B_in;
    elsif ((((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_FIRST) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) and
            (IREG_PRE_B_BIN = IREG_PRE_B_TRUE)) or
           (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
             (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
            (REG_CAS_B_BIN = REG_CAS_B_TRUE))) then
      RDB_WR_B_int <= RDB_WR_B_reg;
    else
      RDB_WR_B_int <= RDB_WR_B_in;
    end if;
    wait on CAS_IN_RDB_WR_B_in, RDB_WR_B_in, RDB_WR_B_reg;
  end process;

--  cascade out - input controls
  CAS_OUT_ADDR_A_MUX : process begin
    if ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
          (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) then --  no cascade out
      CAS_OUT_ADDR_A_out <= ADDR_INIT;
    else
      CAS_OUT_ADDR_A_out <= ADDR_A_int;
    end if;
    wait on ADDR_A_in, ADDR_A_int;
  end process;

  CAS_OUT_BWE_A_MUX : process begin
    if ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
          (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) then --  no cascade out
      CAS_OUT_BWE_A_out <= (others => '0');
    else
      CAS_OUT_BWE_A_out <= BWE_A_int;
    end if;
    wait on BWE_A_in, BWE_A_int;
  end process;

  CAS_OUT_DIN_A_MUX : process begin
    if ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
          (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) then --  no cascade out
      CAS_OUT_DIN_A_out <= (others => '0');
    else
      CAS_OUT_DIN_A_out <= DIN_A_int;
    end if;
    wait on DIN_A_in, DIN_A_int;
  end process;

  CAS_OUT_EN_A_MUX : process begin
    if ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
          (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) then --  no cascade out
      CAS_OUT_EN_A_out <= '0';
    else
      CAS_OUT_EN_A_out <= EN_A_int;
    end if;
    wait on EN_A_in, EN_A_int;
  end process;

  CAS_OUT_RDB_WR_A_MUX : process begin
    if ((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST) or
          (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_NONE)) then --  no cascade out
      CAS_OUT_RDB_WR_A_out <= '0';
    else
      CAS_OUT_RDB_WR_A_out <= RDB_WR_A_int;
    end if;
    wait on RDB_WR_A_in, RDB_WR_A_int;
  end process;

  CAS_OUT_ADDR_B_MUX : process begin
    if ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
          (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) then --  no cascade out
      CAS_OUT_ADDR_B_out <= (others => '0');
    else
      CAS_OUT_ADDR_B_out <= ADDR_B_int;
    end if;
    wait on ADDR_B_in, ADDR_B_int;
  end process;

  CAS_OUT_BWE_B_MUX : process begin
    if ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
          (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) then --  no cascade out
      CAS_OUT_BWE_B_out <= (others => '0');
    else
      CAS_OUT_BWE_B_out <= BWE_B_int;
    end if;
    wait on BWE_B_in, BWE_B_int;
  end process;

  CAS_OUT_DIN_B_MUX : process begin
    if ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
          (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) then --  no cascade out
      CAS_OUT_DIN_B_out <= (others => '0');
    else
      CAS_OUT_DIN_B_out <= DIN_B_int;
    end if;
    wait on DIN_B_in, DIN_B_int;
  end process;

  CAS_OUT_EN_B_MUX : process begin
    if ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
          (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) then --  no cascade out
      CAS_OUT_EN_B_out <= '0';
    else
      CAS_OUT_EN_B_out <= EN_B_int;
    end if;
    wait on EN_B_in, EN_B_int;
  end process;

  CAS_OUT_RDB_WR_B_MUX : process begin
    if ((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST) or
          (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_NONE)) then --  no cascade out
      CAS_OUT_RDB_WR_B_out <= '0';
    else
      CAS_OUT_RDB_WR_B_out <= RDB_WR_B_int;
    end if;
    wait on RDB_WR_B_in, RDB_WR_B_int;
  end process;

--  data/cas reg
  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (RST_A_async = '1' or glblGSR = '1' or
        (REG_CAS_A_BIN = REG_CAS_A_FALSE)) then
      CAS_IN_DBITERR_A_reg <= '0';
      CAS_IN_DOUT_A_reg <= D_INIT;
      CAS_IN_RDACCESS_A_reg <= '0';
      CAS_IN_SBITERR_A_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1') then
        CAS_IN_DBITERR_A_reg <= '0';
        CAS_IN_DOUT_A_reg <= D_INIT;
        CAS_IN_RDACCESS_A_reg <= '0';
        CAS_IN_SBITERR_A_reg <= '0';
      else
        CAS_IN_DBITERR_A_reg <= CAS_IN_DBITERR_A_in;
        CAS_IN_DOUT_A_reg <= CAS_IN_DOUT_A_in;
        CAS_IN_RDACCESS_A_reg <= CAS_IN_RDACCESS_A_in;
        CAS_IN_SBITERR_A_reg <= CAS_IN_SBITERR_A_in;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (RST_B_async = '1' or glblGSR = '1' or
        (REG_CAS_B_BIN = REG_CAS_B_FALSE)) then
      CAS_IN_DBITERR_B_reg <= '0';
      CAS_IN_DOUT_B_reg <= D_INIT;
      CAS_IN_RDACCESS_B_reg <= '0';
      CAS_IN_SBITERR_B_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1') then
        CAS_IN_DBITERR_B_reg <= '0';
        CAS_IN_DOUT_B_reg <= D_INIT;
        CAS_IN_RDACCESS_B_reg <= '0';
        CAS_IN_SBITERR_B_reg <= '0';
      else
        CAS_IN_DBITERR_B_reg <= CAS_IN_DBITERR_B_in;
        CAS_IN_DOUT_B_reg <= CAS_IN_DOUT_B_in;
        CAS_IN_RDACCESS_B_reg <= CAS_IN_RDACCESS_B_in;
        CAS_IN_SBITERR_B_reg <= CAS_IN_SBITERR_B_in;
      end if;
    end if;
  end process;

  process (CLK_in, RST_A_async, glblGSR) begin
    if (RST_A_async = '1' or glblGSR = '1' or shut_down = '1' or SHUTDOWN_in = '1') then
      RDACCESS_A_int <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1') then
        RDACCESS_A_int <= '0';
      elsif (OREG_ECC_A_BIN = OREG_ECC_A_TRUE) then
        if ((USE_EXT_CE_A_BIN = USE_EXT_CE_A_FALSE) or (OREG_ECC_CE_A_in = '1')) then
          RDACCESS_A_int <= RDACCESS_A_ecc_reg;
        else
          RDACCESS_A_int <= '0';
        end if;
      elsif (OREG_A_BIN = OREG_A_TRUE) then
        if ((USE_EXT_CE_A_BIN = USE_EXT_CE_A_FALSE) or (OREG_CE_A_in = '1')) then
          RDACCESS_A_int <= RDACCESS_A_reg;
        else
          RDACCESS_A_int <= '0';
        end if;
      else
        RDACCESS_A_int <= RDACCESS_A_lat;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR) begin
    if (RST_B_async = '1' or glblGSR = '1' or shut_down = '1' or SHUTDOWN_in = '1') then
      RDACCESS_B_int <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1') then
        RDACCESS_B_int <= '0';
      elsif (OREG_ECC_B_BIN = OREG_ECC_B_TRUE) then
        if ((USE_EXT_CE_B_BIN = USE_EXT_CE_B_FALSE) or (OREG_ECC_CE_B_in = '1')) then
          RDACCESS_B_int <= RDACCESS_B_ecc_reg;
        else
          RDACCESS_B_int <= '0';
        end if;
      elsif (OREG_B_BIN = OREG_B_TRUE) then
        if ((USE_EXT_CE_B_BIN = USE_EXT_CE_B_FALSE) or (OREG_CE_B_in = '1')) then
          RDACCESS_B_int <= RDACCESS_B_reg;
        else
          RDACCESS_B_int <= '0';
        end if;
      else
        RDACCESS_B_int <= RDACCESS_B_lat;
      end if;
    end if;
  end process;

  cas_out_mux_sel_a_p : process begin
    if (((CAS_IN_RDACCESS_A_in  = '1') and (REG_CAS_A_BIN = REG_CAS_A_FALSE)) or
        ((CAS_IN_RDACCESS_A_reg = '1') and (REG_CAS_A_BIN = REG_CAS_A_TRUE )) or
        (RDACCESS_A_int = '1')) then
      cas_out_mux_sel_a <= not RDACCESS_A_int;
    else
      cas_out_mux_sel_a <= not cas_out_mux_sel_a_reg;
    end if;
  wait on CAS_IN_RDACCESS_A_in, CAS_IN_RDACCESS_A_reg, RDACCESS_A_int, cas_out_mux_sel_a_reg;
  end process;

  cas_out_mux_sel_b_p : process begin
    if (((CAS_IN_RDACCESS_B_in  = '1') and (REG_CAS_B_BIN = REG_CAS_B_FALSE)) or
        ((CAS_IN_RDACCESS_B_reg = '1') and (REG_CAS_B_BIN = REG_CAS_B_TRUE )) or
        (RDACCESS_B_int = '1')) then
      cas_out_mux_sel_b <= not RDACCESS_B_int;
    else
      cas_out_mux_sel_b <= not cas_out_mux_sel_b_reg;
    end if;
  wait on CAS_IN_RDACCESS_B_in, CAS_IN_RDACCESS_B_reg, RDACCESS_B_int, cas_out_mux_sel_b_reg;
  end process;

  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (RST_A_async = '1' or glblGSR = '1') then
      cas_out_mux_sel_a_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1') then
        cas_out_mux_sel_a_reg <= '0';
      else
        cas_out_mux_sel_a_reg <= not cas_out_mux_sel_a;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (RST_B_async = '1' or glblGSR = '1') then
      cas_out_mux_sel_b_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1') then
        cas_out_mux_sel_b_reg <= '0';
      else
        cas_out_mux_sel_b_reg <= not cas_out_mux_sel_b;
      end if;
    end if;
  end process;

--  data out mux

  RDACCESS_A_OUT_MUX : process begin
    if (RST_A_async = '1' or RST_A_sync = '1' or glblGSR = '1') then
      RDACCESS_A_out <= '0';
    elsif (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
            (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
           cas_out_mux_sel_a = '1') then
      if (REG_CAS_A_BIN = REG_CAS_A_TRUE) then
        RDACCESS_A_out <= CAS_IN_RDACCESS_A_reg;
      else
        RDACCESS_A_out <= CAS_IN_RDACCESS_A_in;
      end if;
    else
      RDACCESS_A_out <= RDACCESS_A_int;
    end if;
    wait on RST_A_async, RST_A_sync, glblGSR, cas_out_mux_sel_a, CAS_IN_RDACCESS_A_in, CAS_IN_RDACCESS_A_reg, RDACCESS_A_int;
  end process;

  OUT_MUX_A : process begin
    if (RST_A_async = '1' or RST_A_sync = '1' or shut_down = '1' or glblGSR = '1') then
      DBITERR_A_out <= '0';
      SBITERR_A_out <= '0';
    elsif (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
              (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
              cas_out_mux_sel_a = '1') then
      if (REG_CAS_A_BIN = REG_CAS_A_TRUE) then
        DBITERR_A_out <= CAS_IN_DBITERR_A_reg;
        SBITERR_A_out <= CAS_IN_SBITERR_A_reg;
      else
        DBITERR_A_out <= CAS_IN_DBITERR_A_in;
        SBITERR_A_out <= CAS_IN_SBITERR_A_in;
      end if;
    elsif ((OREG_ECC_A_BIN = OREG_ECC_A_TRUE)) then
      DBITERR_A_out <= DBITERR_A_reg;
      SBITERR_A_out <= SBITERR_A_reg;
    elsif ((EN_ECC_RD_A_BIN = EN_ECC_RD_A_TRUE)) then
      DBITERR_A_out <= DBITERR_A_ecc;
      SBITERR_A_out <= SBITERR_A_ecc;
    end if;
    wait on RST_A_async, RST_A_sync, shut_down, glblGSR, CAS_IN_DBITERR_A_in, CAS_IN_DBITERR_A_reg, CAS_IN_SBITERR_A_in, CAS_IN_SBITERR_A_reg, DBITERR_A_reg, SBITERR_A_reg, DBITERR_A_ecc, SBITERR_A_ecc, cas_out_mux_sel_a;
  end process;

  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (RST_A_async = '1' or glblGSR = '1') then
      data_A_enable <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1' or a_sleep = '1' or auto_sleep = '1' or shut_down = '1' or SHUTDOWN_in = '1') then
        data_A_enable <= '0';
      elsif ((OREG_A_BIN = OREG_A_TRUE) and (ram_ce_a = '1') and (ram_we_a = '0')) then
        data_A_enable <= '1';
      elsif ((OREG_A_BIN = OREG_A_FALSE) and (ram_ce_a_int = '1') and (RDB_WR_A_int = '0')) then
        data_A_enable <= '1';
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (RST_B_async = '1' or glblGSR = '1') then
      data_B_enable <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1' or a_sleep = '1' or auto_sleep = '1' or shut_down = '1' or SHUTDOWN_in = '1') then
        data_B_enable <= '0';
      elsif ((OREG_B_BIN = OREG_B_TRUE) and (ram_ce_b = '1') and (ram_we_b = '0')) then
        data_B_enable <= '1';
      elsif ((OREG_B_BIN = OREG_B_FALSE) and (ram_ce_b_int = '1') and (RDB_WR_B_int = '0')) then
        data_B_enable <= '1';
      end if;
    end if;
  end process;

  process (CLK_in)
  variable Message : line;
  begin
    if (rising_edge(CLK_in)) then
      if (ram_ce_a = '1' and ram_we_a = '0' and SLEEP_in = '1' and a_sleep = '0' and (OREG_A_BIN = OREG_A_TRUE)) then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-3] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port A READ access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_a),3)));
        Write ( Message, string'(") just prior to SLEEP with SLEEP asserted and OREG_A attribute set to ( TRUE) will result in READ getting lost. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      elsif (ram_ce_a = '1' and ram_we_a = '1' and SLEEP_in = '1' and a_sleep = '0') then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-4] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port A WRITE access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_a),3)));
        Write ( Message, string'(") just prior to SLEEP with SLEEP asserted will result in WRITE being ignored. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      elsif (ram_ce_a_pre = '1' and SLEEP_in = '1' and a_sleep = '1') then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-5] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port A access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_a),3)));
        Write ( Message, string'(") during SLEEP will be ignored. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      elsif (ram_ce_a_pre = '1' and SLEEP_in = '0' and a_sleep = '1') then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-6] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port A access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_a),3)));
        Write ( Message, string'(") during WAKEUP time will be ignored. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    end if;
  end process;

  process (CLK_in)
  variable Message : line;
  begin
    if (rising_edge(CLK_in)) then
      if (ram_ce_b = '1' and ram_we_b = '0' and SLEEP_in = '1' and a_sleep = '0' and (OREG_B_BIN = OREG_B_TRUE)) then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-7] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port B READ access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_b),3)));
        Write ( Message, string'(") just prior to SLEEP with SLEEP asserted and OREG_B attribute set to ( TRUE) will result in READ getting lost. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      elsif (ram_ce_b = '1' and ram_we_b = '1' and SLEEP_in = '1' and a_sleep = '0') then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-8] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port B WRITE access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_b),3)));
        Write ( Message, string'(") just prior to SLEEP with SLEEP asserted will result in WRITE being ignored. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      elsif (ram_ce_b_pre = '1' and SLEEP_in = '1' and a_sleep = '1') then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-9] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port B access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_b),3)));
        Write ( Message, string'(") during SLEEP will be ignored. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      elsif (ram_ce_b_pre = '1' and SLEEP_in = '0' and a_sleep = '1') then
        Write ( Message, string'("[Warning : Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-10] At time (("));
        Write ( Message, now);
        Write ( Message, string'(") ns : Port B access at ADDR ("));
        Write ( Message, string'(SLV_TO_HEX(std_logic_vector(ram_addr_b),3)));
        Write ( Message, string'(") during WAKEUP time will be ignored. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(URAM288_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    end if;
  end process;

  process (CLK_in)
  variable Message : line;
  begin
    if (rising_edge(CLK_in)) then
      if((xil_attr_test) or
         (EN_A_int = '1' and RDB_WR_A_int = '0' and (RST_A_async = '1' or RST_A_sync = '1') and (CASCADE_ORDER_A_BIN /= CASCADE_ORDER_A_NONE) and (REG_CAS_A_BIN = REG_CAS_A_TRUE))) then
        if (rst_a_warn_once = '0') then
          Write ( Message, string'("[Warning : Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-11] At time (("));
          Write ( Message, now);
          Write ( Message, string'(") ns : CASCADE_ORDER_A attribute is set to ("));
          Write ( Message, string'(CASCADE_ORDER_A));
          Write ( Message, string'(") and REG_CAS_A attribute is set to ("));
          Write ( Message, string'(REG_CAS_A));
          Write ( Message, string'(") with RST_A and a READ command both active. In certain circumstances the implementation tools optimize the uram pipeline to achieve optimal timing. This is achieved by manipulating the REG_CAS_A attributes. This will not alter the latency of the pipeline but may result in different reset behavior pre and post implementation under these conditions. To avoid this, deassert EN_A when RST_A is active."));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
          rst_a_warn_once <= '1';
        end if;
      else
        rst_a_warn_once <= '0';
      end if;

      if((xil_attr_test) or
         (EN_B_int = '1' and RDB_WR_B_int = '0' and (RST_B_async = '1' or RST_B_sync = '1') and (CASCADE_ORDER_B_BIN /= CASCADE_ORDER_B_NONE) and (REG_CAS_B_BIN = REG_CAS_B_TRUE))) then
        if (rst_b_warn_once = '0') then
          Write ( Message, string'("[Warning : Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-12] At time (("));
          Write ( Message, now);
          Write ( Message, string'(") ns : CASCADE_ORDER_B attribute is set to ("));
          Write ( Message, string'(CASCADE_ORDER_B));
          Write ( Message, string'(") and REG_CAS_B attribute is set to ("));
          Write ( Message, string'(REG_CAS_B));
          Write ( Message, string'(") with RST_B and a READ command both active. In certain circumstances the implementation tools optimize the uram pipeline to achieve optimal timing. This is achieved by manipulating the REG_CAS_B attributes. This will not alter the latency of the pipeline but may result in different reset behavior pre and post implementation under these conditions. To avoid this, deassert EN_B when RST_B is active."));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(URAM288_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
          rst_b_warn_once <= '1';
        end if;
      else
        rst_b_warn_once <= '0';
      end if;
    end if;
  end process;

  DOUT_MUX_A : process begin
    if (RST_A_async = '1' or RST_A_sync = '1' or glblGSR = '1') then
      DOUT_A_out <= D_INIT;
    elsif (((CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_MIDDLE) or
              (CASCADE_ORDER_A_BIN = CASCADE_ORDER_A_LAST)) and
              cas_out_mux_sel_a = '1') then
      if (REG_CAS_A_BIN = REG_CAS_A_TRUE) then
        DOUT_A_out <= CAS_IN_DOUT_A_reg;
      else
        DOUT_A_out <= CAS_IN_DOUT_A_in;
      end if;
    elsif ((OREG_ECC_A_BIN = OREG_ECC_A_TRUE)) then
      DOUT_A_out <= DOUT_A_reg;
    elsif ((EN_ECC_RD_A_BIN = EN_ECC_RD_A_TRUE)) then
      DOUT_A_out <= ram_data_a_ecc;
    elsif (data_A_enable = '1') then
      if ((OREG_A_BIN = OREG_A_TRUE)) then
        DOUT_A_out <= ram_data_a_reg;
      else
        DOUT_A_out <= ram_data_a_lat;
      end if;
    else
      DOUT_A_out <= D_INIT;
    end if;
    wait on RST_A_async, RST_A_sync, glblGSR, CAS_IN_DOUT_A_in, CAS_IN_DOUT_A_reg, ram_data_a_ecc, DOUT_A_reg, ram_data_a_reg, ram_data_a_lat, data_A_enable, cas_out_mux_sel_a;
  end process;

  RDACCESS_B_OUT_MUX : process begin
    if (RST_B_async = '1' or RST_B_sync = '1' or glblGSR = '1') then
      RDACCESS_B_out <= '0';
    elsif (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
            (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
           cas_out_mux_sel_b = '1') then
      if (REG_CAS_B_BIN = REG_CAS_B_TRUE) then
        RDACCESS_B_out <= CAS_IN_RDACCESS_B_reg;
      else
        RDACCESS_B_out <= CAS_IN_RDACCESS_B_in;
      end if;
    else
      RDACCESS_B_out <= RDACCESS_B_int;
    end if;
    wait on RST_B_async, RST_B_sync, glblGSR, cas_out_mux_sel_b, CAS_IN_RDACCESS_B_in, CAS_IN_RDACCESS_B_reg, RDACCESS_B_int;
  end process;

  OUT_MUX_B : process begin
    if (RST_B_async = '1' or RST_B_sync = '1' or shut_down = '1' or glblGSR = '1') then
      DBITERR_B_out <= '0';
      SBITERR_B_out <= '0';
    elsif (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
              (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
              cas_out_mux_sel_b = '1') then
      if (REG_CAS_B_BIN = REG_CAS_B_TRUE) then
        DBITERR_B_out <= CAS_IN_DBITERR_B_reg;
        SBITERR_B_out <= CAS_IN_SBITERR_B_reg;
      else
        DBITERR_B_out <= CAS_IN_DBITERR_B_in;
        SBITERR_B_out <= CAS_IN_SBITERR_B_in;
      end if;
    elsif ((OREG_ECC_B_BIN = OREG_ECC_B_TRUE)) then
      DBITERR_B_out <= DBITERR_B_reg;
      SBITERR_B_out <= SBITERR_B_reg;
    elsif ((EN_ECC_RD_B_BIN = EN_ECC_RD_B_TRUE)) then
      DBITERR_B_out <= DBITERR_B_ecc;
      SBITERR_B_out <= SBITERR_B_ecc;
    end if;
    wait on RST_B_async, RST_B_sync, shut_down, glblGSR, CAS_IN_DBITERR_B_in, CAS_IN_DBITERR_B_reg, CAS_IN_SBITERR_B_in, CAS_IN_SBITERR_B_reg, DBITERR_B_reg, SBITERR_B_reg, DBITERR_B_ecc, SBITERR_B_ecc, cas_out_mux_sel_b;
  end process;

  DOUT_MUX_B : process begin
    if (RST_B_async = '1' or RST_B_sync = '1' or glblGSR = '1') then
      DOUT_B_out <= (others => '0');
    elsif (((CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_MIDDLE) or
              (CASCADE_ORDER_B_BIN = CASCADE_ORDER_B_LAST)) and
              cas_out_mux_sel_b = '1') then
      if (REG_CAS_B_BIN = REG_CAS_B_TRUE) then
        DOUT_B_out <= CAS_IN_DOUT_B_reg;
      else
        DOUT_B_out <= CAS_IN_DOUT_B_in;
      end if;
    elsif ((OREG_ECC_B_BIN = OREG_ECC_B_TRUE)) then
      DOUT_B_out <= DOUT_B_reg;
    elsif ((EN_ECC_RD_B_BIN = EN_ECC_RD_B_TRUE)) then
      DOUT_B_out <= ram_data_b_ecc;
    elsif (data_B_enable = '1') then
      if (OREG_B_BIN = OREG_B_TRUE) then
        DOUT_B_out <= ram_data_b_reg;
      else
        DOUT_B_out <= ram_data_b_lat;
      end if;
    else
        DOUT_B_out <= D_INIT;
    end if;
    wait on RST_B_async, RST_B_sync, glblGSR, CAS_IN_DOUT_B_in, CAS_IN_DOUT_B_reg, ram_data_b_ecc, DOUT_B_reg, ram_data_b_reg, ram_data_b_lat, cas_out_mux_sel_b;
  end process;

--  ecc oreg
  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (RST_A_in = '1' or glblGSR = '1' or (OREG_ECC_A_BIN = OREG_ECC_A_FALSE)) then
      DBITERR_A_reg <= '0';
      SBITERR_A_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (((a_sleep = '0') and (shut_down = '0') and (data_A_enable = '1')) and
          (((OREG_A_BIN = OREG_A_TRUE) and ((RDACCESS_A_reg = '1') or (RDACCESS_A_ecc_reg = '1'))) or
           ((OREG_A_BIN = OREG_A_FALSE) and ((RDACCESS_A_lat = '1') or (RDACCESS_A_ecc_reg = '1'))))) then
        DBITERR_A_reg <= DBITERR_A_ecc;
        SBITERR_A_reg <= SBITERR_A_ecc;
      end if;
    end if;
  end process;

  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (RST_A_async = '1' or glblGSR = '1' or(OREG_ECC_A_BIN = OREG_ECC_A_FALSE)) then
      DOUT_A_reg <= D_INIT;
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1') then
        DOUT_A_reg <= D_INIT;
      elsif (shut_down = '0' and data_A_enable = '1') then
        if (USE_EXT_CE_A_BIN = USE_EXT_CE_A_TRUE) then
          if (OREG_ECC_CE_A_in = '1') then
            if (EN_ECC_RD_A_BIN = EN_ECC_RD_A_TRUE) then
              DOUT_A_reg <= ram_data_a_ecc;
            elsif (OREG_A_BIN = OREG_A_TRUE) then
              DOUT_A_reg <= ram_data_a_reg;
            else
              DOUT_A_reg <= ram_data_a_lat;
            end if;
          end if;
        elsif (((OREG_A_BIN = OREG_A_TRUE) and
                ((RDACCESS_A_reg = '1') or (RDACCESS_A_ecc_reg = '1'))) or
               ((OREG_A_BIN = OREG_A_FALSE) and
                ((RDACCESS_A_lat = '1') or (RDACCESS_A_ecc_reg = '1')))) then
          if (EN_ECC_RD_A_BIN = EN_ECC_RD_A_TRUE) then
            DOUT_A_reg <= ram_data_a_ecc;
          elsif (OREG_A_BIN = OREG_A_TRUE) then
            DOUT_A_reg <= ram_data_a_reg;
          else
            DOUT_A_reg <= ram_data_a_lat;
          end if;
        end if;
      end if;
    end if;
  end process;

  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (RST_A_async = '1' or glblGSR = '1' or(OREG_ECC_A_BIN = OREG_ECC_A_FALSE)) then
      RDACCESS_A_ecc_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1') then
        RDACCESS_A_ecc_reg <= '0';
      else 
        if (OREG_A_BIN = OREG_A_TRUE) then
          if ((USE_EXT_CE_A_BIN = USE_EXT_CE_A_FALSE) or (OREG_ECC_CE_A_in = '1')) then
            RDACCESS_A_ecc_reg <= RDACCESS_A_reg;
          end if;
        else
          RDACCESS_A_ecc_reg <= RDACCESS_A_lat;
        end if;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (RST_B_in = '1' or glblGSR = '1' or (OREG_ECC_B_BIN = OREG_ECC_B_FALSE)) then
      DBITERR_B_reg <= '0';
      SBITERR_B_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (((a_sleep = '0') and (shut_down = '0') and (data_B_enable = '1')) and
          (((OREG_B_BIN = OREG_B_TRUE) and ((RDACCESS_B_reg = '1') or (RDACCESS_B_ecc_reg = '1'))) or
           ((OREG_B_BIN = OREG_B_FALSE) and ((RDACCESS_B_lat = '1') or (RDACCESS_B_ecc_reg = '1'))))) then
        DBITERR_B_reg <= DBITERR_B_ecc;
        SBITERR_B_reg <= SBITERR_B_ecc;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (RST_B_async = '1' or glblGSR = '1' or(OREG_ECC_B_BIN = OREG_ECC_B_FALSE)) then
      DOUT_B_reg <= D_INIT;
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1') then
        DOUT_B_reg <= D_INIT;
      elsif (shut_down = '0' and data_B_enable = '1') then
        if (USE_EXT_CE_B_BIN = USE_EXT_CE_B_TRUE) then
          if (OREG_ECC_CE_B_in = '1') then
            if (EN_ECC_RD_B_BIN = EN_ECC_RD_B_TRUE) then
              DOUT_B_reg <= ram_data_b_ecc;
            elsif (OREG_B_BIN = OREG_B_TRUE) then
              DOUT_B_reg <= ram_data_b_reg;
            else
              DOUT_B_reg <= ram_data_b_lat;
            end if;
          end if;
        elsif (((OREG_B_BIN = OREG_B_TRUE) and
                ((RDACCESS_B_reg = '1') or (RDACCESS_B_ecc_reg = '1'))) or
               ((OREG_B_BIN = OREG_B_FALSE) and
                ((RDACCESS_B_lat = '1') or (RDACCESS_B_ecc_reg = '1')))) then
          if (EN_ECC_RD_B_BIN = EN_ECC_RD_B_TRUE) then
            DOUT_B_reg <= ram_data_b_ecc;
          elsif (OREG_B_BIN = OREG_B_TRUE) then
            DOUT_B_reg <= ram_data_b_reg;
          else
            DOUT_B_reg <= ram_data_b_lat;
          end if;
        end if;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (RST_B_async = '1' or glblGSR = '1' or(OREG_ECC_B_BIN = OREG_ECC_B_FALSE)) then
      RDACCESS_B_ecc_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1') then
        RDACCESS_B_ecc_reg <= '0';
      else 
        if (OREG_B_BIN = OREG_B_TRUE) then
          if ((USE_EXT_CE_B_BIN = USE_EXT_CE_B_FALSE) or (OREG_ECC_CE_B_in = '1')) then
            RDACCESS_B_ecc_reg <= RDACCESS_B_reg;
          end if;
        else
          RDACCESS_B_ecc_reg <= RDACCESS_B_lat;
        end if;
      end if;
    end if;
  end process;

--  ram oreg

  process (CLK_in, RST_A_async, shut_down, glblGSR)
  begin
    if (RST_A_async = '1' or shut_down = '1' or a_sleep = '1' or glblGSR = '1') then
      RDACCESS_A_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1') then
        RDACCESS_A_reg <= '0';
      else 
        RDACCESS_A_reg <= RDACCESS_A_lat;
      end if;
    end if;
  end process;

  process (CLK_in, RST_A_async, shut_down, glblGSR)
  begin
    if (RST_A_async = '1' or glblGSR = '1' or (OREG_A_BIN = OREG_A_FALSE)) then
      ram_data_a_reg <= D_INIT;
    elsif (rising_edge(CLK_in)) then
      if (RST_A_in = '1' or shut_down = '1' or SLEEP_in = '1' or a_sleep = '1') then
        ram_data_a_reg <= D_INIT;
      elsif (USE_EXT_CE_A_BIN = USE_EXT_CE_A_TRUE) then
        if (OREG_CE_A_in = '1') then
          ram_data_a_reg <= ram_data_a_lat;
        end if;
      elsif ((ram_ce_a_int = '1') or (RDACCESS_A_reg = '1')) then
        ram_data_a_reg <= ram_data_a_lat;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, shut_down, glblGSR)
  begin
    if (RST_B_async = '1' or shut_down = '1' or a_sleep = '1' or glblGSR = '1') then
      RDACCESS_B_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1') then
        RDACCESS_B_reg <= '0';
      else
        RDACCESS_B_reg <= RDACCESS_B_lat;
      end if;
    end if;
  end process;

  process (CLK_in, RST_B_async, shut_down, glblGSR)
  begin
    if (RST_B_async = '1' or glblGSR = '1' or (OREG_B_BIN = OREG_B_FALSE)) then
      ram_data_b_reg <= D_INIT;
    elsif (rising_edge(CLK_in)) then
      if (RST_B_in = '1' or shut_down = '1' or SLEEP_in = '1' or a_sleep = '1') then
        ram_data_b_reg <= D_INIT;
      elsif (USE_EXT_CE_B_BIN = USE_EXT_CE_B_TRUE) then
        if (OREG_CE_B_in = '1') then
          ram_data_b_reg <= ram_data_b_lat;
        end if;
      elsif ((ram_ce_b_int = '1') or (RDACCESS_B_reg = '1')) then
        ram_data_b_reg <= ram_data_b_lat;
      end if;
    end if;
  end process;

--  ram IREG and logic
  ram_ce_a_fifo_p : process begin
    ram_ce_a_fifo_in <= (others => '0');
    ram_ce_a_fifo_in(AUTO_SLEEP_LATENCY_BIN) <= bit_and(not (ADDR_A_int (22 downto 12) xor SELF_ADDR_A_BIN) or SELF_MASK_A_BIN) and EN_A_int;
    wait on ADDR_A_int, EN_A_int;
  end process;

  ram_ce_b_fifo_p : process begin
    ram_ce_b_fifo_in <= (others => '0');
    ram_ce_b_fifo_in(AUTO_SLEEP_LATENCY_BIN) <= bit_and(not (ADDR_B_int (22 downto 12) xor SELF_ADDR_B_BIN) or SELF_MASK_B_BIN) and EN_B_int;
    wait on ADDR_B_int, EN_B_int;
  end process;

  process (CLK_in, glblGSR)
  variable ram_ce_a_fifo_shift : std_logic_vector(15 downto 1) := (others => '0');
  begin
    if (glblGSR = '1' or
        (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_FALSE)) then
      ram_ce_a_fifo <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      ram_ce_a_fifo_shift := '0' & ram_ce_a_fifo (15 downto 2);
      ram_ce_a_fifo <= ram_ce_a_fifo_shift or ram_ce_a_fifo_in;
    end if;
  end process;

  ram_ce_a_int_p : process begin
    if (a_sleep = '1' or SLEEP_in = '1' or auto_sleep = '1') then
      ram_ce_a_int <= '0';
    else
      ram_ce_a_int <= ram_ce_a_pre;
    end if;
    wait on ram_ce_a_pre, a_sleep, SLEEP_in, auto_sleep;
  end process ram_ce_a_int_p;

  ram_ce_a_pre_p : process begin
    if (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_FALSE) then
      ram_ce_a_pre <= ram_ce_a_fifo_in(AUTO_SLEEP_LATENCY_BIN);
    else
      ram_ce_a_pre <= ram_ce_a_fifo(1);
    end if;
    wait on ram_ce_a_fifo, ram_ce_a_fifo_in;
  end process ram_ce_a_pre_p;

  process (CLK_in, glblGSR)
  variable ram_ce_b_fifo_shift : std_logic_vector(15 downto 1) := (others => '0');
  begin
    if (glblGSR = '1' or
        (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_FALSE)) then
      ram_ce_b_fifo <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      ram_ce_b_fifo_shift := '0' & ram_ce_b_fifo (15 downto 2);
      ram_ce_b_fifo <= ram_ce_b_fifo_shift or ram_ce_b_fifo_in;
    end if;
  end process;

  ram_ce_b_int_p : process begin
    if (a_sleep = '1' or SLEEP_in = '1' or auto_sleep = '1') then
      ram_ce_b_int <= '0';
    else
      ram_ce_b_int <= ram_ce_b_pre;
    end if;
    wait on ram_ce_b_pre, a_sleep, SLEEP_in, auto_sleep;
  end process ram_ce_b_int_p;

  ram_ce_b_pre_p : process begin
    if (EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_FALSE) then
      ram_ce_b_pre <= ram_ce_b_fifo_in(AUTO_SLEEP_LATENCY_BIN);
    else
      ram_ce_b_pre <= ram_ce_b_fifo(1);
    end if;
    wait on ram_ce_b_fifo, ram_ce_b_fifo_in;
  end process ram_ce_b_pre_p;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_bwe_a <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if (RDB_WR_A_int = '0' or
          a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_bwe_a <= (others => '0');
      elsif (ram_ce_a_int = '1') then
        if (EN_ECC_WR_A_BIN = EN_ECC_WR_A_TRUE) then
          ram_bwe_a <= (others => '1');
        elsif ((BWE_MODE_A_BIN = BWE_MODE_A_PARITY_INTERLEAVED)) then
          ram_bwe_a <= (BWE_A_int (7 downto 0) &
                        BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) &
                        BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) &
                        BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) &
                        BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) &
                        BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) &
                        BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) &
                        BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) &
                        BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) &
                        BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) &
                        BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) &
                        BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) &
                        BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) &
                        BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) &
                        BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) &
                        BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0) &
                        BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0));
        else
          ram_bwe_a <= (BWE_A_int(8) & BWE_A_int(8) & BWE_A_int(8) & BWE_A_int(8) &
                        BWE_A_int(8) & BWE_A_int(8) & BWE_A_int(8) & BWE_A_int(8) &
                        BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) &
                        BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) & BWE_A_int(7) &
                        BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) &
                        BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) & BWE_A_int(6) &
                        BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) &
                        BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) & BWE_A_int(5) &
                        BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) &
                        BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) & BWE_A_int(4) &
                        BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) &
                        BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) & BWE_A_int(3) &
                        BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) &
                        BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) & BWE_A_int(2) &
                        BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) &
                        BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) & BWE_A_int(1) &
                        BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0) &
                        BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0) & BWE_A_int(0));
        end if;
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_bwe_b <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if (RDB_WR_B_int = '0' or
          a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_bwe_b <= (others => '0');
      elsif (ram_ce_b_int = '1') then
        if (EN_ECC_WR_B_BIN = EN_ECC_WR_B_TRUE) then
          ram_bwe_b <= (others => '1');
        elsif ((BWE_MODE_B_BIN = BWE_MODE_B_PARITY_INTERLEAVED)) then
          ram_bwe_b <= (BWE_B_int (7 downto 0) &
                        BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) &
                        BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) &
                        BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) &
                        BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) &
                        BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) &
                        BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) &
                        BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) &
                        BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) &
                        BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) &
                        BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) &
                        BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) &
                        BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) &
                        BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) &
                        BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) &
                        BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0) &
                        BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0));
        else
          ram_bwe_b <= (BWE_B_int(8) & BWE_B_int(8) & BWE_B_int(8) & BWE_B_int(8) &
                        BWE_B_int(8) & BWE_B_int(8) & BWE_B_int(8) & BWE_B_int(8) &
                        BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) &
                        BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) & BWE_B_int(7) &
                        BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) &
                        BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) & BWE_B_int(6) &
                        BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) &
                        BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) & BWE_B_int(5) &
                        BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) &
                        BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) & BWE_B_int(4) &
                        BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) &
                        BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) & BWE_B_int(3) &
                        BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) &
                        BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) & BWE_B_int(2) &
                        BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) &
                        BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) & BWE_B_int(1) &
                        BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0) &
                        BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0) & BWE_B_int(0));
        end if;
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_addr_a <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if (a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_addr_a <= (others => '0');
      elsif (ram_ce_a_int = '1') then
        ram_addr_a <= unsigned(ADDR_A_int(11 downto 0));
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_addr_b <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if (a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_addr_b <= (others => '0');
      elsif (ram_ce_b_int = '1') then
        ram_addr_b <= unsigned(ADDR_B_int(11 downto 0));
      end if;
    end if;
  end process;

  process (CLK_in, RST_A_async, glblGSR)
  begin
    if (rising_edge(CLK_in) or rising_edge(RST_A_async)) then
      if (glblGSR = '1' or RST_A_in = '1' or 
          a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_ce_a <= '0';
      else
        ram_ce_a <= ram_ce_a_int;
      end if;
    elsif (glblGSR = '1') then
      ram_ce_a <= '0';
    end if;
  end process;

  process (CLK_in, RST_B_async, glblGSR)
  begin
    if (rising_edge(CLK_in) or rising_edge(RST_B_async)) then
      if (glblGSR = '1' or RST_B_in = '1' or 
          a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_ce_b <= '0';
      else
        ram_ce_b <= ram_ce_b_int;
      end if;
    elsif (glblGSR = '1') then
      ram_ce_b <= '0';
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_we_a <= '0';
    elsif (rising_edge(CLK_in)) then
      if (a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or
        auto_sleep = '1' or shut_down = '1' or SHUTDOWN_in = '1') then
        ram_we_a <= '0';
      else
        ram_we_a <= RDB_WR_A_int and ram_ce_a_int;
      end if;
      if (RDB_WR_A_int = '1' and ram_ce_a_int = '1') then
        ram_we_a_event <= not ram_we_a_event;
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_we_b <= '0';
    elsif (rising_edge(CLK_in)) then
      if (a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or
        auto_sleep = '1' or shut_down = '1' or SHUTDOWN_in = '1') then
        ram_we_b <= '0';
      else 
        ram_we_b <= RDB_WR_B_int and ram_ce_b_int;
      end if;
      if (RDB_WR_B_int = '1' and ram_ce_b_int = '1') then
        ram_we_b_event <= not ram_we_b_event;
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_data_a <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if (a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_data_a <= (others => '0');
      elsif (RDB_WR_A_int = '1' and ram_ce_a_int = '1') then
        if (EN_ECC_WR_A_BIN = EN_ECC_WR_A_TRUE) then
          ram_data_a (63 downto 0) <=
               (DIN_A_int (63) &
                (DIN_A_int (62) xor (INJECT_DBITERR_A_int)) &
                 DIN_A_int (61 downto 31) &
                (DIN_A_int (30) xor (INJECT_DBITERR_A_int or INJECT_SBITERR_A_int)) &
                 DIN_A_int (29 downto 0));
          ram_data_a (71 downto 64) <= fn_ecc (encode , DIN_A_int (63 downto 0) , DIN_A_int (71 downto 64));
        elsif (EN_ECC_RD_A_BIN = EN_ECC_RD_A_TRUE) then
          ram_data_a (63 downto 0) <=
               (DIN_A_int (63) &
                (DIN_A_int (62) xor (INJECT_DBITERR_A_int)) &
                 DIN_A_int (61 downto 31) &
                (DIN_A_int (30) xor (INJECT_DBITERR_A_int or INJECT_SBITERR_A_int)) &
                 DIN_A_int (29 downto 0));
          ram_data_a (71 downto 64) <= DIN_A_int (71 downto 64);
        else
          ram_data_a <= DIN_A_int;
        end if;
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      ram_data_b <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if (a_sleep = '1' or DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1' or
          shut_down = '1' or SHUTDOWN_in = '1') then
        ram_data_b <= (others => '0');
      elsif (RDB_WR_B_int = '1' and ram_ce_b_int = '1') then
        if (EN_ECC_WR_B_BIN = EN_ECC_WR_B_TRUE) then
          ram_data_b (63 downto 0) <=
               (DIN_B_int (63) &
                (DIN_B_int (62) xor (INJECT_DBITERR_B_int)) &
                 DIN_B_int (61 downto 31) &
                (DIN_B_int (30) xor (INJECT_DBITERR_B_int or INJECT_SBITERR_B_int)) &
                 DIN_B_int (29 downto 0));
          ram_data_b (71 downto 64) <= fn_ecc (encode , DIN_B_int (63 downto 0) , DIN_B_int (71 downto 64));
        elsif (EN_ECC_RD_B_BIN = EN_ECC_RD_B_TRUE) then
          ram_data_b (63 downto 0) <=
               (DIN_B_int (63) &
                (DIN_B_int (62) xor (INJECT_DBITERR_B_int)) &
                 DIN_B_int (61 downto 31) &
                (DIN_B_int (30) xor (INJECT_DBITERR_B_int or INJECT_SBITERR_B_int)) &
                 DIN_B_int (29 downto 0));
          ram_data_b (71 downto 64) <= DIN_B_int (71 downto 64);
        else
          ram_data_b <= DIN_B_int;
        end if;
      end if;
    end if;
  end process;

--  ram
  process begin
    if (((auto_sleep = '1') or (SHUTDOWN_in = '1') or (SLEEP_in = '1')) or
        (((OREG_A_BIN = OREG_A_TRUE) or (OREG_ECC_A_BIN = OREG_ECC_A_TRUE )) and
         ((a_sleep = '1') or (shut_down = '1')))) then
      RDACCESS_A_lat <= '0';
    elsif (ram_ce_a_int = '1' and RDB_WR_A_int = '0') then
      RDACCESS_A_lat <= '1';
    else 
      RDACCESS_A_lat <= '0';
    end if;
    wait on auto_sleep, SHUTDOWN_in, SLEEP_in, a_sleep, shut_down, ram_ce_a_int, RDB_WR_A_int;
  end process;

  process begin
    if (((auto_sleep = '1') or (SHUTDOWN_in = '1') or (SLEEP_in = '1')) or
        (((OREG_B_BIN = OREG_B_TRUE) or (OREG_ECC_B_BIN = OREG_ECC_B_TRUE )) and
         ((a_sleep = '1') or (shut_down = '1')))) then
      RDACCESS_B_lat <= '0';
    elsif (ram_ce_b_int = '1' and RDB_WR_B_int = '0') then
      RDACCESS_B_lat <= '1';
    else 
      RDACCESS_B_lat <= '0';
    end if;
    wait on auto_sleep, SHUTDOWN_in, SLEEP_in, a_sleep, shut_down, ram_ce_b_int, RDB_WR_B_int;
  end process;

  ram_data_a_out_p : process begin
    if (RST_A_sync = '1' or RST_A_async = '1' or glblGSR = '1' or a_sleep = '1' or shut_down = '1') then
      ram_data_a_lat <= (others => '0');
    elsif ((ram_ce_a = '1') and (ram_we_a = '0')) then
      ram_data_a_lat <= ram_data_a_out;
    end if;
    wait on RST_A_sync, RST_A_async, glblGSR, SLEEP_in, a_sleep, shut_down, ram_data_a_out;
  end process;

  ram_data_b_out_p : process begin
    if (RST_B_sync = '1' or RST_B_async = '1' or glblGSR = '1' or a_sleep = '1' or shut_down = '1') then
      ram_data_b_lat <= (others => '0');
    elsif ((ram_ce_b = '1') and (ram_we_b = '0')) then
      ram_data_b_lat <= ram_data_b_out;
    end if;
    wait on RST_B_sync, RST_B_async, glblGSR, SLEEP_in, a_sleep, shut_down, ram_data_b_out;
  end process;

  process (ram_we_a, ram_we_b, ram_ce_a, ram_ce_b, a_sleep, ram_addr_a, ram_addr_b, ram_data_a, ram_data_b, ram_bwe_a, ram_bwe_b, ram_we_a_event, ram_we_b_event, RST_A_async, RST_B_async, RST_A_sync, RST_B_sync, glblGSR, INIT_RAM, shut_down)
  variable mem_ram_addr_a_v : std_logic_vector(mem_width-1 downto 0) := (others => '0');
  variable mem_ram_addr_b_v : std_logic_vector(mem_width-1 downto 0) := (others => '0');
  variable ram_ce_a_rst : std_ulogic := '0';
  variable ram_ce_b_rst : std_ulogic := '0';
  variable addr_match_v : boolean := false;
  begin
    if (rising_edge(INIT_RAM)) then
      for wa in 0 to (mem_depth-1) loop
         mem(wa) <= (others => '0');
      end loop;
    end if;
    if (rising_edge(shut_down)) then
      for wa in 0 to (mem_depth-1) loop
         mem(wa) <= (others => 'X');
      end loop;
    end if;
    if (glblGSR = '1' or shut_down = '1') then
      ram_data_a_out <= (others => '0');
      ram_data_b_out <= (others => '0');
    elsif (a_sleep = '0') then
      ram_ce_a_rst := ram_ce_a and not RST_A_in;
      ram_ce_b_rst := ram_ce_b and not RST_B_in;
      addr_match_v := (ram_addr_a = ram_addr_b);
      addr_match <= addr_match_v;
      if (RST_A_in = '1') then
        ram_data_a_out <= (others => '0');
      end if;
      if (RST_B_in = '1') then
        ram_data_b_out <= (others => '0');
      end if;
        if (ram_we_a = '1') then -- wr a
          mem_ram_addr_a_v := (ram_data_a and ram_bwe_a) or
                              (mem (to_integer(ram_addr_a)) and not ram_bwe_a);
          if (ram_we_b = '1') then -- wr b
            if (addr_match_v) then -- over write
              mem_ram_addr_b_v := (ram_data_b and ram_bwe_b) or
                                  (mem_ram_addr_a_v and not ram_bwe_b);
              mem (to_integer(ram_addr_b)) <=  mem_ram_addr_b_v; -- wr mem
            else -- write in parallel
              mem_ram_addr_b_v := (ram_data_b and ram_bwe_b) or
                                  (mem (to_integer(ram_addr_b)) and not ram_bwe_b);
              mem (to_integer(ram_addr_a)) <=  mem_ram_addr_a_v; -- wr mem
              mem (to_integer(ram_addr_b)) <=  mem_ram_addr_b_v; -- wr mem
            end if;
          elsif ((ram_ce_b_rst = '1') and (ram_we_b = '0')) then -- rd b
            mem (to_integer(ram_addr_a)) <=  mem_ram_addr_a_v; -- wr a rd b
            if (addr_match_v) then -- rd just written a
              ram_data_b_out <= mem_ram_addr_a_v;
            else -- rd mem
              ram_data_b_out <= mem (to_integer(ram_addr_b));
            end if;
          else -- wr a nop b
            mem (to_integer(ram_addr_a)) <=  mem_ram_addr_a_v;
          end if;
        elsif ((ram_ce_a_rst = '1') and (ram_we_a = '0')) then -- rd a
          ram_data_a_out <= mem (to_integer(ram_addr_a));
          if ((ram_ce_b = '1') and (ram_we_b = '1')) then -- wr b
            mem_ram_addr_b_v := (ram_data_b and ram_bwe_b) or
                                (mem (to_integer(ram_addr_b)) and not ram_bwe_b);
            mem (to_integer(ram_addr_b)) <=  mem_ram_addr_b_v;
          elsif ((ram_ce_b_rst = '1') and (ram_we_b = '0')) then -- rd b
            ram_data_b_out <= mem (to_integer(ram_addr_b));
          end if;
        elsif ((ram_ce_b = '1') and (ram_we_b = '1')) then -- wr b with nop on a
          mem_ram_addr_b_v := (ram_data_b and ram_bwe_b) or
                              (mem (to_integer(ram_addr_b)) and not ram_bwe_b);
          mem (to_integer(ram_addr_b)) <=  mem_ram_addr_b_v;
        elsif ((ram_ce_b_rst = '1') and (ram_we_b = '0')) then -- rd b with nop on a
          ram_data_b_out <= mem (to_integer(ram_addr_b));
        end if;
    end if;
  end process;

--  ecc correction

  ecc_cor_a : process begin
    if (EN_ECC_RD_A_BIN = EN_ECC_RD_A_TRUE) then
      if (OREG_A_BIN = OREG_A_TRUE) then
        ecc_cor(ram_data_a_ecc, SBITERR_A_ecc, DBITERR_A_ecc, ram_data_a_reg);
      else
        ecc_cor(ram_data_a_ecc, SBITERR_A_ecc, DBITERR_A_ecc, ram_data_a_lat);
      end if;
    end if;
    wait on ram_data_a_ecc, SBITERR_A_ecc, DBITERR_A_ecc, ram_data_a_reg, ram_data_a_lat;
  end process;

  ecc_cor_b : process begin
    if (EN_ECC_RD_B_BIN = EN_ECC_RD_B_TRUE) then
      if (OREG_B_BIN = OREG_B_TRUE) then
        ecc_cor(ram_data_b_ecc, SBITERR_B_ecc, DBITERR_B_ecc, ram_data_b_reg);
      else
        ecc_cor(ram_data_b_ecc, SBITERR_B_ecc, DBITERR_B_ecc, ram_data_b_lat);
      end if;
    end if;
    wait on ram_data_b_ecc, SBITERR_B_ecc, DBITERR_B_ecc, ram_data_b_reg, ram_data_b_lat;
  end process;

--  sleep, deepsleep, shutdown
  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      wake_count <= 0;
    elsif (rising_edge(CLK_in)) then
      if ((wake_count > 0 and (auto_sleep = '0' and SLEEP_in = '0' and DEEPSLEEP_in = '0' and SHUTDOWN_in = '0')) or
          (SHUTDOWN_in = '0' and DEEPSLEEP_in = '0' and wake_count > 2) or
          (SHUTDOWN_in = '0' and wake_count > 3)) then
        wake_count <= wake_count - 1;
      elsif ((SHUTDOWN_in = '1')) then
        wake_count <= 9;
      elsif ((DEEPSLEEP_in = '1') and (wake_count <= 3)) then
        wake_count <= 3;
      elsif ((SLEEP_in = '1') and (wake_count <= 2)) then
        wake_count <= 2;
      elsif ((auto_sleep = '1') and (wake_count <= 1)) then
        wake_count <= 1;
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      a_sleep <= '0';
    elsif (rising_edge(CLK_in)) then
      if ((auto_sleep = '0') and (wake_count = 1)) then
        a_sleep <= '0';
      elsif (DEEPSLEEP_in = '1' or SLEEP_in = '1' or auto_sleep = '1') then
        a_sleep <= '1';
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if (glblGSR = '1') then
      shut_down <= '0';
    elsif (rising_edge(CLK_in)) then
      if (wake_count = 1) then
        shut_down <= '0';
      elsif (SHUTDOWN_in = '1') then
        shut_down <= '1';
      end if;
    end if;
  end process;

  auto_sleep <= auto_sleep_A and auto_sleep_B and not auto_wake_up_A and not auto_wake_up_B;
  auto_wake_up_A <= ram_ce_a_fifo(3);
  auto_wake_up_B <= ram_ce_b_fifo(3);

  process (CLK_in, glblGSR)
  begin
    if ((glblGSR = '1') or(EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_FALSE)) then
      auto_sleep_A <= '0';
    elsif (rising_edge(CLK_in)) then
      if (auto_wake_up_A = '1' and auto_sleep_A = '1') then
        auto_sleep_A <= '0';
      elsif ((bit_or(ram_ce_a_fifo) = '0') and (auto_sleep_A = '0')) then
        auto_sleep_A <= '1';
      end if;
    end if;
  end process;

  process (CLK_in, glblGSR)
  begin
    if ((glblGSR = '1') or(EN_AUTO_SLEEP_MODE_BIN = EN_AUTO_SLEEP_MODE_FALSE)) then
      auto_sleep_B <= '0';
    elsif (rising_edge(CLK_in)) then
      if (auto_wake_up_B = '1' and auto_sleep_B = '1') then
        auto_sleep_B <= '0';
      elsif ((bit_or(ram_ce_b_fifo) = '0') and (auto_sleep_B = '0')) then
        auto_sleep_B <= '1';
      end if;
    end if;
  end process;

end URAM288_V;
