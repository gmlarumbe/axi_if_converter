-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        48-bit Multi-Functional Arithmetic Block
-- /___/   /\      Filename    : DSP48E2.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  01/10/13 - 694456 - DIN_in/D_in connectivity issue
--  01/11/13 - DIN, D_DATA width change (26/24) sync4 yml
--  02/13/13 - PCIN_47A change from internal feedback to PCIN(47) pin
--  03/01/13 - 699402 - U_44_DATA_3 missing from xmux process sensitivity list
--  03/06/13 - 701316 - A_B_reg no clk when REG=0
--  04/03/13 - yaml update
--  04/22/13 - 714213 - ACOUT, BCOUT wrong logic
--  04/22/13 - 713695 - Zero mult result on USE_SIMD
--  04/22/13 - 713617 - CARRYCASCOUT behaviour
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
--  04/24/13 - 713706 - correct P_FDBK connection
--  06/13/13 - 722112 - x_mac_cascd missing from process sensitivity list
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP48E2 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP48E2 is
  generic (
    ACASCREG : integer := 1;
    ADREG : integer := 1;
    ALUMODEREG : integer := 1;
    AMULTSEL : string := "A";
    AREG : integer := 1;
    AUTORESET_PATDET : string := "NO_RESET";
    AUTORESET_PRIORITY : string := "RESET";
    A_INPUT : string := "DIRECT";
    BCASCREG : integer := 1;
    BMULTSEL : string := "B";
    BREG : integer := 1;
    B_INPUT : string := "DIRECT";
    CARRYINREG : integer := 1;
    CARRYINSELREG : integer := 1;
    CREG : integer := 1;
    DREG : integer := 1;
    INMODEREG : integer := 1;
    IS_ALUMODE_INVERTED : std_logic_vector(3 downto 0) := "0000";
    IS_CARRYIN_INVERTED : bit := '0';
    IS_CLK_INVERTED : bit := '0';
    IS_INMODE_INVERTED : std_logic_vector(4 downto 0) := "00000";
    IS_OPMODE_INVERTED : std_logic_vector(8 downto 0) := "000000000";
    IS_RSTALLCARRYIN_INVERTED : bit := '0';
    IS_RSTALUMODE_INVERTED : bit := '0';
    IS_RSTA_INVERTED : bit := '0';
    IS_RSTB_INVERTED : bit := '0';
    IS_RSTCTRL_INVERTED : bit := '0';
    IS_RSTC_INVERTED : bit := '0';
    IS_RSTD_INVERTED : bit := '0';
    IS_RSTINMODE_INVERTED : bit := '0';
    IS_RSTM_INVERTED : bit := '0';
    IS_RSTP_INVERTED : bit := '0';
    MASK : std_logic_vector(47 downto 0) := X"3FFFFFFFFFFF";
    MREG : integer := 1;
    OPMODEREG : integer := 1;
    PATTERN : std_logic_vector(47 downto 0) := X"000000000000";
    PREADDINSEL : string := "A";
    PREG : integer := 1;
    RND : std_logic_vector(47 downto 0) := X"000000000000";
    SEL_MASK : string := "MASK";
    SEL_PATTERN : string := "PATTERN";
    USE_MULT : string := "MULTIPLY";
    USE_PATTERN_DETECT : string := "NO_PATDET";
    USE_SIMD : string := "ONE48";
    USE_WIDEXOR : string := "FALSE";
    XORSIMD : string := "XOR24_48_96"
  );

  port (
    ACOUT                : out std_logic_vector(29 downto 0);
    BCOUT                : out std_logic_vector(17 downto 0);
    CARRYCASCOUT         : out std_ulogic;
    CARRYOUT             : out std_logic_vector(3 downto 0);
    MULTSIGNOUT          : out std_ulogic;
    OVERFLOW             : out std_ulogic;
    P                    : out std_logic_vector(47 downto 0);
    PATTERNBDETECT       : out std_ulogic;
    PATTERNDETECT        : out std_ulogic;
    PCOUT                : out std_logic_vector(47 downto 0);
    UNDERFLOW            : out std_ulogic;
    XOROUT               : out std_logic_vector(7 downto 0);
    A                    : in std_logic_vector(29 downto 0);
    ACIN                 : in std_logic_vector(29 downto 0);
    ALUMODE              : in std_logic_vector(3 downto 0);
    B                    : in std_logic_vector(17 downto 0);
    BCIN                 : in std_logic_vector(17 downto 0);
    C                    : in std_logic_vector(47 downto 0);
    CARRYCASCIN          : in std_ulogic;
    CARRYIN              : in std_ulogic;
    CARRYINSEL           : in std_logic_vector(2 downto 0);
    CEA1                 : in std_ulogic;
    CEA2                 : in std_ulogic;
    CEAD                 : in std_ulogic;
    CEALUMODE            : in std_ulogic;
    CEB1                 : in std_ulogic;
    CEB2                 : in std_ulogic;
    CEC                  : in std_ulogic;
    CECARRYIN            : in std_ulogic;
    CECTRL               : in std_ulogic;
    CED                  : in std_ulogic;
    CEINMODE             : in std_ulogic;
    CEM                  : in std_ulogic;
    CEP                  : in std_ulogic;
    CLK                  : in std_ulogic;
    D                    : in std_logic_vector(26 downto 0);
    INMODE               : in std_logic_vector(4 downto 0);
    MULTSIGNIN           : in std_ulogic;
    OPMODE               : in std_logic_vector(8 downto 0);
    PCIN                 : in std_logic_vector(47 downto 0);
    RSTA                 : in std_ulogic;
    RSTALLCARRYIN        : in std_ulogic;
    RSTALUMODE           : in std_ulogic;
    RSTB                 : in std_ulogic;
    RSTC                 : in std_ulogic;
    RSTCTRL              : in std_ulogic;
    RSTD                 : in std_ulogic;
    RSTINMODE            : in std_ulogic;
    RSTM                 : in std_ulogic;
    RSTP                 : in std_ulogic
  );
end DSP48E2;

architecture DSP48E2_V of DSP48E2 is

  constant MODULE_NAME : string := "DSP48E2";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant ACASCREG_0 : std_logic_vector(1 downto 0) := "01";
  constant ACASCREG_1 : std_logic_vector(1 downto 0) := "00";
  constant ACASCREG_2 : std_logic_vector(1 downto 0) := "10";
  constant ADREG_0 : std_ulogic := '1';
  constant ADREG_1 : std_ulogic := '0';
  constant ALUMODEREG_0 : std_ulogic := '1';
  constant ALUMODEREG_1 : std_ulogic := '0';
  constant AMULTSEL_A : std_ulogic := '0';
  constant AMULTSEL_AD : std_ulogic := '1';
  constant AREG_0 : std_logic_vector(1 downto 0) := "01";
  constant AREG_1 : std_logic_vector(1 downto 0) := "00";
  constant AREG_2 : std_logic_vector(1 downto 0) := "10";
  constant AUTORESET_PATDET_NO_RESET : std_logic_vector(1 downto 0) := "00";
  constant AUTORESET_PATDET_RESET_MATCH : std_logic_vector(1 downto 0) := "01";
  constant AUTORESET_PATDET_RESET_NOT_MATCH : std_logic_vector(1 downto 0) := "10";
  constant AUTORESET_PRIORITY_CEP : std_ulogic := '1';
  constant AUTORESET_PRIORITY_RESET : std_ulogic := '0';
  constant A_INPUT_CASCADE : std_ulogic := '1';
  constant A_INPUT_DIRECT : std_ulogic := '0';
  constant BCASCREG_0 : std_logic_vector(1 downto 0) := "01";
  constant BCASCREG_1 : std_logic_vector(1 downto 0) := "00";
  constant BCASCREG_2 : std_logic_vector(1 downto 0) := "10";
  constant BMULTSEL_AD : std_ulogic := '1';
  constant BMULTSEL_B : std_ulogic := '0';
  constant BREG_0 : std_logic_vector(1 downto 0) := "01";
  constant BREG_1 : std_logic_vector(1 downto 0) := "00";
  constant BREG_2 : std_logic_vector(1 downto 0) := "10";
  constant B_INPUT_CASCADE : std_ulogic := '1';
  constant B_INPUT_DIRECT : std_ulogic := '0';
  constant CARRYINREG_0 : std_ulogic := '1';
  constant CARRYINREG_1 : std_ulogic := '0';
  constant CARRYINSELREG_0 : std_ulogic := '1';
  constant CARRYINSELREG_1 : std_ulogic := '0';
  constant CREG_0 : std_ulogic := '1';
  constant CREG_1 : std_ulogic := '0';
  constant DREG_0 : std_ulogic := '1';
  constant DREG_1 : std_ulogic := '0';
  constant INMODEREG_0 : std_ulogic := '1';
  constant INMODEREG_1 : std_ulogic := '0';
  constant MREG_0 : std_ulogic := '1';
  constant MREG_1 : std_ulogic := '0';
  constant OPMODEREG_0 : std_ulogic := '1';
  constant OPMODEREG_1 : std_ulogic := '0';
  constant PREADDINSEL_A : std_ulogic := '0';
  constant PREADDINSEL_B : std_ulogic := '1';
  constant PREG_0 : std_ulogic := '1';
  constant PREG_1 : std_ulogic := '0';
  constant SEL_MASK_C : std_logic_vector(1 downto 0) := "01";
  constant SEL_MASK_MASK : std_logic_vector(1 downto 0) := "00";
  constant SEL_MASK_ROUNDING_MODE1 : std_logic_vector(1 downto 0) := "10";
  constant SEL_MASK_ROUNDING_MODE2 : std_logic_vector(1 downto 0) := "11";
  constant SEL_PATTERN_C : std_ulogic := '1';
  constant SEL_PATTERN_PATTERN : std_ulogic := '0';
  constant USE_MULT_DYNAMIC : std_logic_vector(1 downto 0) := "01";
  constant USE_MULT_MULTIPLY : std_logic_vector(1 downto 0) := "00";
  constant USE_MULT_NONE : std_logic_vector(1 downto 0) := "10";
  constant USE_PATTERN_DETECT_NO_PATDET : std_ulogic := '0';
  constant USE_PATTERN_DETECT_PATDET : std_ulogic := '1';
  constant USE_SIMD_FOUR12 : std_logic_vector(2 downto 0) := "111";
  constant USE_SIMD_ONE48 : std_logic_vector(2 downto 0) := "000";
  constant USE_SIMD_TWO24 : std_logic_vector(2 downto 0) := "010";
  constant USE_WIDEXOR_FALSE : std_ulogic := '0';
  constant USE_WIDEXOR_TRUE : std_ulogic := '1';
  constant XORSIMD_XOR12 : std_ulogic := '1';
  constant XORSIMD_XOR24_48_96 : std_ulogic := '0';

  signal ACASCREG_BIN : std_logic_vector(1 downto 0);
  signal ADREG_BIN : std_ulogic;
  signal ALUMODEREG_BIN : std_ulogic;
  signal AMULTSEL_BIN : std_ulogic;
  signal AREG_BIN : std_logic_vector(1 downto 0);
  signal AUTORESET_PATDET_BIN : std_logic_vector(1 downto 0);
  signal AUTORESET_PRIORITY_BIN : std_ulogic;
  signal A_INPUT_BIN : std_ulogic;
  signal BCASCREG_BIN : std_logic_vector(1 downto 0);
  signal BMULTSEL_BIN : std_ulogic;
  signal BREG_BIN : std_logic_vector(1 downto 0);
  signal B_INPUT_BIN : std_ulogic;
  signal CARRYINREG_BIN : std_ulogic;
  signal CARRYINSELREG_BIN : std_ulogic;
  signal CREG_BIN : std_ulogic;
  signal DREG_BIN : std_ulogic;
  signal INMODEREG_BIN : std_ulogic;
  signal IS_ALUMODE_INVERTED_BIN : std_logic_vector(3 downto 0);
  signal IS_CARRYIN_INVERTED_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_INMODE_INVERTED_BIN : std_logic_vector(4 downto 0);
  signal IS_OPMODE_INVERTED_BIN : std_logic_vector(8 downto 0);
  signal IS_RSTALLCARRYIN_INVERTED_BIN : std_ulogic;
  signal IS_RSTALUMODE_INVERTED_BIN : std_ulogic;
  signal IS_RSTA_INVERTED_BIN : std_ulogic;
  signal IS_RSTB_INVERTED_BIN : std_ulogic;
  signal IS_RSTCTRL_INVERTED_BIN : std_ulogic;
  signal IS_RSTC_INVERTED_BIN : std_ulogic;
  signal IS_RSTD_INVERTED_BIN : std_ulogic;
  signal IS_RSTINMODE_INVERTED_BIN : std_ulogic;
  signal IS_RSTM_INVERTED_BIN : std_ulogic;
  signal IS_RSTP_INVERTED_BIN : std_ulogic;
  signal MASK_BIN : std_logic_vector(47 downto 0);
  signal MREG_BIN : std_ulogic;
  signal OPMODEREG_BIN : std_ulogic;
  signal PATTERN_BIN : std_logic_vector(47 downto 0);
  signal PREADDINSEL_BIN : std_ulogic;
  signal PREG_BIN : std_ulogic;
  signal RND_BIN : std_logic_vector(47 downto 0);
  signal SEL_MASK_BIN : std_logic_vector(1 downto 0);
  signal SEL_PATTERN_BIN : std_ulogic;
  signal USE_MULT_BIN : std_logic_vector(1 downto 0);
  signal USE_PATTERN_DETECT_BIN : std_ulogic;
  signal USE_SIMD_BIN : std_logic_vector(2 downto 0);
  signal USE_WIDEXOR_BIN : std_ulogic;
  signal XORSIMD_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal ACOUT_out : std_logic_vector(29 downto 0);
  signal BCOUT_out : std_logic_vector(17 downto 0);
  signal CARRYCASCOUT_out : std_ulogic;
  signal CARRYOUT_out : std_logic_vector(3 downto 0);
  signal MULTSIGNOUT_out : std_ulogic;
  signal OVERFLOW_out : std_ulogic;
  signal PATTERNBDETECT_out : std_ulogic;
  signal PATTERNDETECT_out : std_ulogic;
  signal PCOUT_out : std_logic_vector(47 downto 0);
  signal P_out : std_logic_vector(47 downto 0);
  signal UNDERFLOW_out : std_ulogic;
  signal XOROUT_out : std_logic_vector(7 downto 0);
 
  signal ACIN_in : std_logic_vector(29 downto 0);
  signal ALUMODE_in : std_logic_vector(3 downto 0);
  signal A_in : std_logic_vector(29 downto 0);
  signal BCIN_in : std_logic_vector(17 downto 0);
  signal B_in : std_logic_vector(17 downto 0);
  signal CARRYCASCIN_in : std_ulogic;
  signal CARRYINSEL_in : std_logic_vector(2 downto 0);
  signal CARRYIN_in : std_ulogic;
  signal CEA1_in : std_ulogic;
  signal CEA2_in : std_ulogic;
  signal CEAD_in : std_ulogic;
  signal CEALUMODE_in : std_ulogic;
  signal CEB1_in : std_ulogic;
  signal CEB2_in : std_ulogic;
  signal CECARRYIN_in : std_ulogic;
  signal CECTRL_in : std_ulogic;
  signal CEC_in : std_ulogic;
  signal CED_in : std_ulogic;
  signal CEINMODE_in : std_ulogic;
  signal CEM_in : std_ulogic;
  signal CEP_in : std_ulogic;
  signal CLK_in : std_ulogic;
  signal C_in : std_logic_vector(47 downto 0);
  signal D_in : std_logic_vector(26 downto 0);
  signal INMODE_in : std_logic_vector(4 downto 0);
  signal MULTSIGNIN_in : std_ulogic;
  signal OPMODE_in : std_logic_vector(8 downto 0);
  signal PCIN_in : std_logic_vector(47 downto 0);
  signal RSTALLCARRYIN_in : std_ulogic;
  signal RSTALUMODE_in : std_ulogic;
  signal RSTA_in : std_ulogic;
  signal RSTB_in : std_ulogic;
  signal RSTCTRL_in : std_ulogic;
  signal RSTC_in : std_ulogic;
  signal RSTD_in : std_ulogic;
  signal RSTINMODE_in : std_ulogic;
  signal RSTM_in : std_ulogic;
  signal RSTP_in : std_ulogic;

--  Connections between atoms
  signal A1_DATA_out : std_logic_vector(26 downto 0);
  signal A2A1_out : std_logic_vector(26 downto 0);
  signal A2_DATA_out : std_logic_vector(26 downto 0);
  signal ADDSUB_out : std_ulogic;
  signal AD_DATA_out : std_logic_vector(26 downto 0);
  signal AD_out : std_logic_vector(26 downto 0);
  signal A_ALU_out : std_logic_vector(29 downto 0);
  signal ALUMODE10_out : std_ulogic;
  signal ALU_OUT_out : std_logic_vector(47 downto 0);
  signal AMULT26_out : std_ulogic;
  signal B1_DATA_out : std_logic_vector(17 downto 0);
  signal B2B1_out : std_logic_vector(17 downto 0);
  signal B2_DATA_out : std_logic_vector(17 downto 0);
  signal BMULT17_out : std_ulogic;
  signal B_ALU_out : std_logic_vector(17 downto 0);
  signal CCOUT_FB_out : std_ulogic;
  signal COUT_out : std_logic_vector(3 downto 0);
  signal C_DATA_out : std_logic_vector(47 downto 0);
  signal D_DATA_out : std_logic_vector(26 downto 0);
  signal INMODE_2_out : std_ulogic;
  signal MULTSIGN_ALU_out : std_ulogic;
  signal PREADD_AB_out : std_logic_vector(26 downto 0);
  signal P_FDBK_47_out : std_ulogic;
  signal P_FDBK_out : std_logic_vector(47 downto 0);
  signal U_DATA_out : std_logic_vector(44 downto 0);
  signal U_out : std_logic_vector(44 downto 0);
  signal V_DATA_out : std_logic_vector(44 downto 0);
  signal V_out : std_logic_vector(44 downto 0);
  signal XOR_MX_out : std_logic_vector(7 downto 0);
  signal A1_DATA_in : std_logic_vector(26 downto 0);
  signal A2A1_in : std_logic_vector(26 downto 0);
  signal A2_DATA_in : std_logic_vector(26 downto 0);
  signal ADDSUB_in : std_ulogic;
  signal AD_DATA_in : std_logic_vector(26 downto 0);
  signal AD_in : std_logic_vector(26 downto 0);
  signal ALUMODE10_in : std_ulogic;
  signal ALU_OUT_in : std_logic_vector(47 downto 0);
  signal AMULT26_in : std_ulogic;
  signal A_ALU_in : std_logic_vector(29 downto 0);
  signal B1_DATA_in : std_logic_vector(17 downto 0);
  signal B2B1_in : std_logic_vector(17 downto 0);
  signal B2_DATA_in : std_logic_vector(17 downto 0);
  signal BMULT17_in : std_ulogic;
  signal B_ALU_in : std_logic_vector(17 downto 0);
  signal CCOUT_in : std_ulogic;
  signal COUT_in : std_logic_vector(3 downto 0);
  signal C_DATA_in : std_logic_vector(47 downto 0);
  signal DIN_in : std_logic_vector(26 downto 0);
  signal D_DATA_in : std_logic_vector(26 downto 0);
  signal INMODE2_in : std_ulogic;
  signal MULTSIGN_ALU_in : std_ulogic;
  signal PREADD_AB_in : std_logic_vector(26 downto 0);
  signal P_FDBK_47_in : std_ulogic;
  signal P_FDBK_in : std_logic_vector(47 downto 0);
  signal U_DATA_in : std_logic_vector(44 downto 0);
  signal U_in : std_logic_vector(44 downto 0);
  signal V_DATA_in : std_logic_vector(44 downto 0);
  signal V_in : std_logic_vector(44 downto 0);
  signal XOR_MX_in : std_logic_vector(7 downto 0);
--  Connections between atoms
--  DSP_ALU wires
  constant MAX_ALU_FULL : integer := 48;
  constant MAX_CARRYOUT : integer := 4;

  signal CARRYIN_mux          : std_ulogic;
  signal CARRYIN_reg : std_ulogic := '0';
  signal ALUMODE_mux          : std_logic_vector(3 downto 0);
  signal ALUMODE_reg : std_logic_vector(3 downto 0) := (others => '0');
  signal CARRYINSEL_mux       : std_logic_vector(2 downto 0);
  signal CARRYINSEL_reg : std_logic_vector(2 downto 0) := (others => '0');
  signal OPMODE_mux           : std_logic_vector(8 downto 0);
  signal OPMODE_reg : std_logic_vector(8 downto 0) := (others => '0');
--  signal ALU_OUT_tmp          : std_logic_vector(47 downto 0);
  signal alu_o                : std_logic_vector(47 downto 0);

  signal u_43_data            : std_ulogic;
  signal x_mac_cascd          : std_logic_vector(47 downto 0);

  signal wmux                 : unsigned (47 downto 0);
  signal xmux                 : unsigned (47 downto 0);
  signal ymux                 : unsigned (47 downto 0);
  signal zmux                 : unsigned (47 downto 0);
  signal z_optinv             : unsigned (47 downto 0);

  signal cin                  : std_ulogic;
  signal cin_b                : std_ulogic;
  signal rst_carryin_g        : std_ulogic;
  signal qmultcarryin         : std_ulogic;

  signal c_mult                : std_ulogic;
  signal ce_m_g                : std_ulogic;  
  signal d_carryin_int         : std_ulogic; 
  signal dr_carryin_int        : std_ulogic;
  signal multcarryin_data      : std_ulogic;

  signal invalid_opmode : std_ulogic := '1';
  signal opmode_valid_flag_dal : boolean := true; -- used in OPMODE DRC
  signal ping_opmode_drc_check : std_ulogic := '0';

  signal co                   : unsigned (MAX_ALU_FULL-1 downto 0);
  signal s                    : unsigned (MAX_ALU_FULL-1 downto 0);
  signal s_slv                : std_logic_vector(MAX_ALU_FULL-1 downto 0);
  signal comux                : unsigned (MAX_ALU_FULL-1 downto 0);
  signal comux_w              : unsigned (MAX_ALU_FULL-1 downto 0);
  signal comux4simd           : unsigned (MAX_ALU_FULL-1 downto 0);
  signal smux                 : unsigned (MAX_ALU_FULL-1 downto 0);
  signal smux_w               : unsigned (MAX_ALU_FULL-1 downto 0);
  signal a_int                : unsigned (48 downto 0);
  signal b_int                : unsigned (47 downto 0);
  signal s0                   : unsigned (12 downto 0);
  signal cout0                : std_ulogic;
  signal intc1                : std_ulogic;
  signal co12_lsb             : std_ulogic;
  signal s1                   : unsigned (12 downto 0);
  signal cout1                : std_ulogic;
  signal intc2                : std_ulogic;
  signal co24_lsb             : std_ulogic;
  signal s2                   : unsigned (12 downto 0);
  signal cout2                : std_ulogic;
  signal intc3                : std_ulogic;
  signal co36_lsb             : std_ulogic;
  signal s3                   : unsigned (13 downto 0);
  signal cout3                : std_ulogic;
  signal cout4                : std_ulogic;
  signal xor_12a              : std_ulogic;
  signal xor_12b              : std_ulogic;
  signal xor_12c              : std_ulogic;
  signal xor_12d              : std_ulogic;
  signal xor_12e              : std_ulogic;
  signal xor_12f              : std_ulogic;
  signal xor_12g              : std_ulogic;
  signal xor_12h              : std_ulogic;
  signal xor_24a              : std_ulogic;
  signal xor_24b              : std_ulogic;
  signal xor_24c              : std_ulogic;
  signal xor_24d              : std_ulogic;
  signal xor_48a              : std_ulogic;
  signal xor_48b              : std_ulogic;
  signal xor_96               : std_ulogic;
  signal cout_0               : std_ulogic;
  signal cout_1               : std_ulogic;
  signal cout_2               : std_ulogic;
  signal cout_3               : std_ulogic;
  signal mult_or_logic        : boolean;

  signal cci_drc_msg     : std_ulogic := '0';
  signal cis_drc_msg     : std_ulogic := '0';

  signal PCIN_IN47_9   : std_logic_vector(8 downto 0);
  signal PCIN_IN47_8   : std_logic_vector(7 downto 0);
  signal P_FDBK_47_9   : std_logic_vector(8 downto 0);
  signal P_FDBK_IN47_8 : std_logic_vector(7 downto 0);
  signal U_44_DATA_3   : unsigned (2 downto 0);

--  DSP_A_B_DATA wires
  signal A_ACIN_mux   : std_logic_vector(29 downto 0);
  signal A1_reg_mux   : std_logic_vector(29 downto 0);
  signal A2_reg_mux   : std_logic_vector(29 downto 0);
  signal A1_reg       : std_logic_vector(29 downto 0) := (others => '0');
  signal A2_reg       : std_logic_vector(29 downto 0) := (others => '0');
  signal B_BCIN_mux   : std_logic_vector(17 downto 0);
  signal B1_reg_mux   : std_logic_vector(17 downto 0);
  signal B2_reg_mux   : std_logic_vector(17 downto 0);
  signal B1_reg       : std_logic_vector(17 downto 0) := (others => '0');
  signal B2_reg       : std_logic_vector(17 downto 0) := (others => '0');
  signal CLK_areg1            : std_ulogic;
  signal CLK_areg2            : std_ulogic;
  signal CLK_breg1            : std_ulogic;
  signal CLK_breg2            : std_ulogic;

--  DSP_C_DATA wires

  signal C_reg                : std_logic_vector(47 downto 0) := (others => '0');
  signal CLK_creg             : std_ulogic;

--  DSP_MULTIPLIER wires
  signal b_mult_mux       : signed (17 downto 0);
  signal a_mult_mux_26_18 : unsigned (17 downto 0);
  signal a_mult_mux       : signed (26 downto 0);
  signal b_mult_mux_17_27 : unsigned (26 downto 0);
  signal mult      : signed (44 downto 0);
  signal ps_u_mask : unsigned (43 downto 0) := X"55555555555";
  signal ps_v_mask : unsigned (43 downto 0) := X"aaaaaaaaaaa";

--  DSP_M_DATA wires
  signal U_DATA_reg      : std_logic_vector(44 downto 0) := '0' & X"00000000000";
  signal V_DATA_reg      : std_logic_vector(44 downto 0) := '0' & X"00000000000";
  signal CLK_mreg        : std_ulogic;

--  DSP_OUTPUT wires
  signal the_auto_reset_patdet : std_ulogic;
  signal auto_reset_pri        : std_ulogic;
  signal the_mask         : std_logic_vector(47 downto 0) := (others => '0');
  signal the_pattern      : std_logic_vector(47 downto 0) := (others => '0');
  signal opmode_valid_flag_dou : boolean := true; -- TODO

  signal COUT_reg         : std_logic_vector(3 downto 0) := "0000";
  signal ALUMODE10_reg    : std_ulogic := '0';
  signal ALUMODE10_mux    : std_ulogic := '0';
  signal MULTSIGN_ALU_reg : std_ulogic := '0';
  signal ALU_OUT_reg      : std_logic_vector(47 downto 0) := (others => '0');
  signal XOR_MX_reg       : std_logic_vector(7 downto 0) := (others => '0');

  signal pdet_o               : std_ulogic;
  signal pdetb_o              : std_ulogic;
  signal pdet_o_mux           : std_ulogic;
  signal pdetb_o_mux          : std_ulogic;
  signal overflow_data        : std_ulogic;
  signal underflow_data       : std_ulogic;
  signal pdet_o_reg1          : std_ulogic := '0';
  signal pdet_o_reg2          : std_ulogic := '0';
  signal pdetb_o_reg1         : std_ulogic := '0';
  signal pdetb_o_reg2         : std_ulogic := '0';
  signal CLK_preg             : std_ulogic;

--  DSP_PREADD wires
  signal D_DATA_mux           : std_logic_vector(26 downto 0);

--  DSP_PREADD_DATA wires

  signal a1a2_i_mux   : std_logic_vector(26 downto 0);
  signal b1b2_i_mux   : std_logic_vector(17 downto 0);
  signal b1b2_i_mux_17_9 : std_logic_vector(8 downto 0);
  signal INMODE_mux   : std_logic_vector(4 downto 0);
  signal INMODE_reg   : std_logic_vector(4 downto 0) := (others => '0');
  signal AD_DATA_reg  : std_logic_vector(26 downto 0) := (others => '0');
  signal D_DATA_reg   : std_logic_vector(26 downto 0) := (others => '0');
  signal CLK_inmode   : std_ulogic;
  signal CLK_dreg     : std_ulogic;
  signal CLK_adreg    : std_ulogic;

-- functions, tasks

    function xor_6 (
      vec : in unsigned (5 downto 0)
    ) return std_ulogic is
    variable xor6 : std_ulogic := '0';
    begin
      xor6 := vec(5) xor vec(4) xor vec(3) xor vec(2) xor vec(1) xor vec(0);
      return xor6;
    end;

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  ACOUT <= ACOUT_out after OUT_DELAY;
  BCOUT <= BCOUT_out after OUT_DELAY;
  CARRYCASCOUT <= CARRYCASCOUT_out after OUT_DELAY;
  CARRYOUT <= CARRYOUT_out after OUT_DELAY;
  MULTSIGNOUT <= MULTSIGNOUT_out after OUT_DELAY;
  OVERFLOW <= OVERFLOW_out after OUT_DELAY;
  P <= P_out after OUT_DELAY;
  PATTERNBDETECT <= PATTERNBDETECT_out after OUT_DELAY;
  PATTERNDETECT <= PATTERNDETECT_out after OUT_DELAY;
  PCOUT <= PCOUT_out after OUT_DELAY;
  UNDERFLOW <= UNDERFLOW_out after OUT_DELAY;
  XOROUT <= XOROUT_out after OUT_DELAY;
  
  ACIN_in <= ACIN;
  ALUMODE_in(0) <= '0' when (ALUMODE(0) = 'Z') else ALUMODE(0) xor IS_ALUMODE_INVERTED_BIN(0); -- rv 0
  ALUMODE_in(1) <= '0' when (ALUMODE(1) = 'Z') else ALUMODE(1) xor IS_ALUMODE_INVERTED_BIN(1); -- rv 0
  ALUMODE_in(2) <= '0' when (ALUMODE(2) = 'Z') else ALUMODE(2) xor IS_ALUMODE_INVERTED_BIN(2); -- rv 0
  ALUMODE_in(3) <= '0' when (ALUMODE(3) = 'Z') else ALUMODE(3) xor IS_ALUMODE_INVERTED_BIN(3); -- rv 0
  A_in(0) <= '1' when (A(0) = 'Z') else A(0); -- rv 1
  A_in(1) <= '1' when (A(1) = 'Z') else A(1); -- rv 1
  A_in(10) <= '1' when (A(10) = 'Z') else A(10); -- rv 1
  A_in(11) <= '1' when (A(11) = 'Z') else A(11); -- rv 1
  A_in(12) <= '1' when (A(12) = 'Z') else A(12); -- rv 1
  A_in(13) <= '1' when (A(13) = 'Z') else A(13); -- rv 1
  A_in(14) <= '1' when (A(14) = 'Z') else A(14); -- rv 1
  A_in(15) <= '1' when (A(15) = 'Z') else A(15); -- rv 1
  A_in(16) <= '1' when (A(16) = 'Z') else A(16); -- rv 1
  A_in(17) <= '1' when (A(17) = 'Z') else A(17); -- rv 1
  A_in(18) <= '1' when (A(18) = 'Z') else A(18); -- rv 1
  A_in(19) <= '1' when (A(19) = 'Z') else A(19); -- rv 1
  A_in(2) <= '1' when (A(2) = 'Z') else A(2); -- rv 1
  A_in(20) <= '1' when (A(20) = 'Z') else A(20); -- rv 1
  A_in(21) <= '1' when (A(21) = 'Z') else A(21); -- rv 1
  A_in(22) <= '1' when (A(22) = 'Z') else A(22); -- rv 1
  A_in(23) <= '1' when (A(23) = 'Z') else A(23); -- rv 1
  A_in(24) <= '1' when (A(24) = 'Z') else A(24); -- rv 1
  A_in(25) <= '1' when (A(25) = 'Z') else A(25); -- rv 1
  A_in(26) <= '1' when (A(26) = 'Z') else A(26); -- rv 1
  A_in(27) <= '1' when (A(27) = 'Z') else A(27); -- rv 1
  A_in(28) <= '1' when (A(28) = 'Z') else A(28); -- rv 1
  A_in(29) <= '1' when (A(29) = 'Z') else A(29); -- rv 1
  A_in(3) <= '1' when (A(3) = 'Z') else A(3); -- rv 1
  A_in(4) <= '1' when (A(4) = 'Z') else A(4); -- rv 1
  A_in(5) <= '1' when (A(5) = 'Z') else A(5); -- rv 1
  A_in(6) <= '1' when (A(6) = 'Z') else A(6); -- rv 1
  A_in(7) <= '1' when (A(7) = 'Z') else A(7); -- rv 1
  A_in(8) <= '1' when (A(8) = 'Z') else A(8); -- rv 1
  A_in(9) <= '1' when (A(9) = 'Z') else A(9); -- rv 1
  BCIN_in <= BCIN;
  B_in(0) <= '1' when (B(0) = 'Z') else B(0); -- rv 1
  B_in(1) <= '1' when (B(1) = 'Z') else B(1); -- rv 1
  B_in(10) <= '1' when (B(10) = 'Z') else B(10); -- rv 1
  B_in(11) <= '1' when (B(11) = 'Z') else B(11); -- rv 1
  B_in(12) <= '1' when (B(12) = 'Z') else B(12); -- rv 1
  B_in(13) <= '1' when (B(13) = 'Z') else B(13); -- rv 1
  B_in(14) <= '1' when (B(14) = 'Z') else B(14); -- rv 1
  B_in(15) <= '1' when (B(15) = 'Z') else B(15); -- rv 1
  B_in(16) <= '1' when (B(16) = 'Z') else B(16); -- rv 1
  B_in(17) <= '1' when (B(17) = 'Z') else B(17); -- rv 1
  B_in(2) <= '1' when (B(2) = 'Z') else B(2); -- rv 1
  B_in(3) <= '1' when (B(3) = 'Z') else B(3); -- rv 1
  B_in(4) <= '1' when (B(4) = 'Z') else B(4); -- rv 1
  B_in(5) <= '1' when (B(5) = 'Z') else B(5); -- rv 1
  B_in(6) <= '1' when (B(6) = 'Z') else B(6); -- rv 1
  B_in(7) <= '1' when (B(7) = 'Z') else B(7); -- rv 1
  B_in(8) <= '1' when (B(8) = 'Z') else B(8); -- rv 1
  B_in(9) <= '1' when (B(9) = 'Z') else B(9); -- rv 1
  CARRYCASCIN_in <= CARRYCASCIN;
  CARRYINSEL_in(0) <= '0' when (CARRYINSEL(0) = 'Z') else CARRYINSEL(0); -- rv 0
  CARRYINSEL_in(1) <= '0' when (CARRYINSEL(1) = 'Z') else CARRYINSEL(1); -- rv 0
  CARRYINSEL_in(2) <= '0' when (CARRYINSEL(2) = 'Z') else CARRYINSEL(2); -- rv 0
  CARRYIN_in <= '0' when (CARRYIN = 'Z') else CARRYIN xor IS_CARRYIN_INVERTED_BIN; -- rv 0
  CEA1_in <= '0' when (CEA1 = 'Z') else CEA1; -- rv 0
  CEA2_in <= '0' when (CEA2 = 'Z') else CEA2; -- rv 0
  CEAD_in <= '0' when (CEAD = 'Z') else CEAD; -- rv 0
  CEALUMODE_in <= '0' when (CEALUMODE = 'Z') else CEALUMODE; -- rv 0
  CEB1_in <= '0' when (CEB1 = 'Z') else CEB1; -- rv 0
  CEB2_in <= '0' when (CEB2 = 'Z') else CEB2; -- rv 0
  CECARRYIN_in <= '0' when (CECARRYIN = 'Z') else CECARRYIN; -- rv 0
  CECTRL_in <= '0' when (CECTRL = 'Z') else CECTRL; -- rv 0
  CEC_in <= '0' when (CEC = 'Z') else CEC; -- rv 0
  CED_in <= '0' when (CED = 'Z') else CED; -- rv 0
  CEINMODE_in <= CEINMODE;
  CEM_in <= '0' when (CEM = 'Z') else CEM; -- rv 0
  CEP_in <= '0' when (CEP = 'Z') else CEP; -- rv 0
  CLK_in <= '0' when (CLK = 'Z') else CLK xor IS_CLK_INVERTED_BIN; -- rv 0
  CLK_areg1 <= '0' when (AREG_BIN = AREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_areg2 <= '0' when (AREG_BIN = AREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_breg1 <= '0' when (BREG_BIN = BREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_breg2 <= '0' when (BREG_BIN = BREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_creg  <= '0' when (CREG_BIN = CREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_mreg  <= '0' when (MREG_BIN = MREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_inmode <=  '0' when (INMODEREG_BIN = INMODEREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  CLK_dreg   <=  '0' when (DREG_BIN = DREG_0)           else CLK xor IS_CLK_INVERTED_BIN;
  CLK_adreg  <=  '0' when (ADREG_BIN = ADREG_0)         else CLK xor IS_CLK_INVERTED_BIN;
  CLK_preg  <= '0' when (PREG_BIN = PREG_0) else CLK xor IS_CLK_INVERTED_BIN;
  C_in(0) <= '1' when (C(0) = 'Z') else C(0); -- rv 1
  C_in(1) <= '1' when (C(1) = 'Z') else C(1); -- rv 1
  C_in(10) <= '1' when (C(10) = 'Z') else C(10); -- rv 1
  C_in(11) <= '1' when (C(11) = 'Z') else C(11); -- rv 1
  C_in(12) <= '1' when (C(12) = 'Z') else C(12); -- rv 1
  C_in(13) <= '1' when (C(13) = 'Z') else C(13); -- rv 1
  C_in(14) <= '1' when (C(14) = 'Z') else C(14); -- rv 1
  C_in(15) <= '1' when (C(15) = 'Z') else C(15); -- rv 1
  C_in(16) <= '1' when (C(16) = 'Z') else C(16); -- rv 1
  C_in(17) <= '1' when (C(17) = 'Z') else C(17); -- rv 1
  C_in(18) <= '1' when (C(18) = 'Z') else C(18); -- rv 1
  C_in(19) <= '1' when (C(19) = 'Z') else C(19); -- rv 1
  C_in(2) <= '1' when (C(2) = 'Z') else C(2); -- rv 1
  C_in(20) <= '1' when (C(20) = 'Z') else C(20); -- rv 1
  C_in(21) <= '1' when (C(21) = 'Z') else C(21); -- rv 1
  C_in(22) <= '1' when (C(22) = 'Z') else C(22); -- rv 1
  C_in(23) <= '1' when (C(23) = 'Z') else C(23); -- rv 1
  C_in(24) <= '1' when (C(24) = 'Z') else C(24); -- rv 1
  C_in(25) <= '1' when (C(25) = 'Z') else C(25); -- rv 1
  C_in(26) <= '1' when (C(26) = 'Z') else C(26); -- rv 1
  C_in(27) <= '1' when (C(27) = 'Z') else C(27); -- rv 1
  C_in(28) <= '1' when (C(28) = 'Z') else C(28); -- rv 1
  C_in(29) <= '1' when (C(29) = 'Z') else C(29); -- rv 1
  C_in(3) <= '1' when (C(3) = 'Z') else C(3); -- rv 1
  C_in(30) <= '1' when (C(30) = 'Z') else C(30); -- rv 1
  C_in(31) <= '1' when (C(31) = 'Z') else C(31); -- rv 1
  C_in(32) <= '1' when (C(32) = 'Z') else C(32); -- rv 1
  C_in(33) <= '1' when (C(33) = 'Z') else C(33); -- rv 1
  C_in(34) <= '1' when (C(34) = 'Z') else C(34); -- rv 1
  C_in(35) <= '1' when (C(35) = 'Z') else C(35); -- rv 1
  C_in(36) <= '1' when (C(36) = 'Z') else C(36); -- rv 1
  C_in(37) <= '1' when (C(37) = 'Z') else C(37); -- rv 1
  C_in(38) <= '1' when (C(38) = 'Z') else C(38); -- rv 1
  C_in(39) <= '1' when (C(39) = 'Z') else C(39); -- rv 1
  C_in(4) <= '1' when (C(4) = 'Z') else C(4); -- rv 1
  C_in(40) <= '1' when (C(40) = 'Z') else C(40); -- rv 1
  C_in(41) <= '1' when (C(41) = 'Z') else C(41); -- rv 1
  C_in(42) <= '1' when (C(42) = 'Z') else C(42); -- rv 1
  C_in(43) <= '1' when (C(43) = 'Z') else C(43); -- rv 1
  C_in(44) <= '1' when (C(44) = 'Z') else C(44); -- rv 1
  C_in(45) <= '1' when (C(45) = 'Z') else C(45); -- rv 1
  C_in(46) <= '1' when (C(46) = 'Z') else C(46); -- rv 1
  C_in(47) <= '1' when (C(47) = 'Z') else C(47); -- rv 1
  C_in(5) <= '1' when (C(5) = 'Z') else C(5); -- rv 1
  C_in(6) <= '1' when (C(6) = 'Z') else C(6); -- rv 1
  C_in(7) <= '1' when (C(7) = 'Z') else C(7); -- rv 1
  C_in(8) <= '1' when (C(8) = 'Z') else C(8); -- rv 1
  C_in(9) <= '1' when (C(9) = 'Z') else C(9); -- rv 1
  D_in(0) <= '0' when (D(0) = 'Z') else D(0); -- rv 0
  D_in(1) <= '0' when (D(1) = 'Z') else D(1); -- rv 0
  D_in(10) <= '0' when (D(10) = 'Z') else D(10); -- rv 0
  D_in(11) <= '0' when (D(11) = 'Z') else D(11); -- rv 0
  D_in(12) <= '0' when (D(12) = 'Z') else D(12); -- rv 0
  D_in(13) <= '0' when (D(13) = 'Z') else D(13); -- rv 0
  D_in(14) <= '0' when (D(14) = 'Z') else D(14); -- rv 0
  D_in(15) <= '0' when (D(15) = 'Z') else D(15); -- rv 0
  D_in(16) <= '0' when (D(16) = 'Z') else D(16); -- rv 0
  D_in(17) <= '0' when (D(17) = 'Z') else D(17); -- rv 0
  D_in(18) <= '0' when (D(18) = 'Z') else D(18); -- rv 0
  D_in(19) <= '0' when (D(19) = 'Z') else D(19); -- rv 0
  D_in(2) <= '0' when (D(2) = 'Z') else D(2); -- rv 0
  D_in(20) <= '0' when (D(20) = 'Z') else D(20); -- rv 0
  D_in(21) <= '0' when (D(21) = 'Z') else D(21); -- rv 0
  D_in(22) <= '0' when (D(22) = 'Z') else D(22); -- rv 0
  D_in(23) <= '0' when (D(23) = 'Z') else D(23); -- rv 0
  D_in(24) <= '0' when (D(24) = 'Z') else D(24); -- rv 0
  D_in(25) <= '0' when (D(25) = 'Z') else D(25); -- rv 0
  D_in(26) <= '0' when (D(26) = 'Z') else D(26); -- rv 0
  D_in(3) <= '0' when (D(3) = 'Z') else D(3); -- rv 0
  D_in(4) <= '0' when (D(4) = 'Z') else D(4); -- rv 0
  D_in(5) <= '0' when (D(5) = 'Z') else D(5); -- rv 0
  D_in(6) <= '0' when (D(6) = 'Z') else D(6); -- rv 0
  D_in(7) <= '0' when (D(7) = 'Z') else D(7); -- rv 0
  D_in(8) <= '0' when (D(8) = 'Z') else D(8); -- rv 0
  D_in(9) <= '0' when (D(9) = 'Z') else D(9); -- rv 0
  INMODE_in(0) <= '0' when (INMODE(0) = 'Z') else INMODE(0) xor IS_INMODE_INVERTED_BIN(0); -- rv 0
  INMODE_in(1) <= '0' when (INMODE(1) = 'Z') else INMODE(1) xor IS_INMODE_INVERTED_BIN(1); -- rv 0
  INMODE_in(2) <= '0' when (INMODE(2) = 'Z') else INMODE(2) xor IS_INMODE_INVERTED_BIN(2); -- rv 0
  INMODE_in(3) <= '0' when (INMODE(3) = 'Z') else INMODE(3) xor IS_INMODE_INVERTED_BIN(3); -- rv 0
  INMODE_in(4) <= '0' when (INMODE(4) = 'Z') else INMODE(4) xor IS_INMODE_INVERTED_BIN(4); -- rv 0
  MULTSIGNIN_in <= MULTSIGNIN;
  OPMODE_in(0) <= '0' when (OPMODE(0) = 'Z') else OPMODE(0) xor IS_OPMODE_INVERTED_BIN(0); -- rv 0
  OPMODE_in(1) <= '0' when (OPMODE(1) = 'Z') else OPMODE(1) xor IS_OPMODE_INVERTED_BIN(1); -- rv 0
  OPMODE_in(2) <= '0' when (OPMODE(2) = 'Z') else OPMODE(2) xor IS_OPMODE_INVERTED_BIN(2); -- rv 0
  OPMODE_in(3) <= '0' when (OPMODE(3) = 'Z') else OPMODE(3) xor IS_OPMODE_INVERTED_BIN(3); -- rv 0
  OPMODE_in(4) <= '0' when (OPMODE(4) = 'Z') else OPMODE(4) xor IS_OPMODE_INVERTED_BIN(4); -- rv 0
  OPMODE_in(5) <= '0' when (OPMODE(5) = 'Z') else OPMODE(5) xor IS_OPMODE_INVERTED_BIN(5); -- rv 0
  OPMODE_in(6) <= '0' when (OPMODE(6) = 'Z') else OPMODE(6) xor IS_OPMODE_INVERTED_BIN(6); -- rv 0
  OPMODE_in(7) <= '0' when (OPMODE(7) = 'Z') else OPMODE(7) xor IS_OPMODE_INVERTED_BIN(7); -- rv 0
  OPMODE_in(8) <= '0' when (OPMODE(8) = 'Z') else OPMODE(8) xor IS_OPMODE_INVERTED_BIN(8); -- rv 0
  PCIN_in <= PCIN;
  RSTALLCARRYIN_in <= '0' when (RSTALLCARRYIN = 'Z') else RSTALLCARRYIN xor IS_RSTALLCARRYIN_INVERTED_BIN; -- rv 0
  RSTALUMODE_in <= '0' when (RSTALUMODE = 'Z') else RSTALUMODE xor IS_RSTALUMODE_INVERTED_BIN; -- rv 0
  RSTA_in <= '0' when (RSTA = 'Z') else RSTA xor IS_RSTA_INVERTED_BIN; -- rv 0
  RSTB_in <= '0' when (RSTB = 'Z') else RSTB xor IS_RSTB_INVERTED_BIN; -- rv 0
  RSTCTRL_in <= '0' when (RSTCTRL = 'Z') else RSTCTRL xor IS_RSTCTRL_INVERTED_BIN; -- rv 0
  RSTC_in <= '0' when (RSTC = 'Z') else RSTC xor IS_RSTC_INVERTED_BIN; -- rv 0
  RSTD_in <= '0' when (RSTD = 'Z') else RSTD xor IS_RSTD_INVERTED_BIN; -- rv 0
  RSTINMODE_in <= '0' when (RSTINMODE = 'Z') else RSTINMODE xor IS_RSTINMODE_INVERTED_BIN; -- rv 0
  RSTM_in <= '0' when (RSTM = 'Z') else RSTM xor IS_RSTM_INVERTED_BIN; -- rv 0
  RSTP_in <= '0' when (RSTP = 'Z') else RSTP xor IS_RSTP_INVERTED_BIN; -- rv 0
  
  ACASCREG_BIN <= 
    ACASCREG_1 when (ACASCREG = 1) else
    ACASCREG_0 when (ACASCREG = 0) else
    ACASCREG_2 when (ACASCREG = 2) else
    ACASCREG_1;

  ADREG_BIN <= 
    ADREG_1 when (ADREG = 1) else
    ADREG_0 when (ADREG = 0) else
    ADREG_1;

  ALUMODEREG_BIN <= 
    ALUMODEREG_1 when (ALUMODEREG = 1) else
    ALUMODEREG_0 when (ALUMODEREG = 0) else
    ALUMODEREG_1;

  AMULTSEL_BIN <= 
    AMULTSEL_A when (AMULTSEL = "A") else
    AMULTSEL_AD when (AMULTSEL = "AD") else
    AMULTSEL_A;

  AREG_BIN <= 
    AREG_1 when (AREG = 1) else
    AREG_0 when (AREG = 0) else
    AREG_2 when (AREG = 2) else
    AREG_1;

  AUTORESET_PATDET_BIN <= 
    AUTORESET_PATDET_NO_RESET when (AUTORESET_PATDET = "NO_RESET") else
    AUTORESET_PATDET_RESET_MATCH when (AUTORESET_PATDET = "RESET_MATCH") else
    AUTORESET_PATDET_RESET_NOT_MATCH when (AUTORESET_PATDET = "RESET_NOT_MATCH") else
    AUTORESET_PATDET_NO_RESET;

  AUTORESET_PRIORITY_BIN <= 
    AUTORESET_PRIORITY_RESET when (AUTORESET_PRIORITY = "RESET") else
    AUTORESET_PRIORITY_CEP when (AUTORESET_PRIORITY = "CEP") else
    AUTORESET_PRIORITY_RESET;

  A_INPUT_BIN <= 
    A_INPUT_DIRECT when (A_INPUT = "DIRECT") else
    A_INPUT_CASCADE when (A_INPUT = "CASCADE") else
    A_INPUT_DIRECT;

  BCASCREG_BIN <= 
    BCASCREG_1 when (BCASCREG = 1) else
    BCASCREG_0 when (BCASCREG = 0) else
    BCASCREG_2 when (BCASCREG = 2) else
    BCASCREG_1;

  BMULTSEL_BIN <= 
    BMULTSEL_B when (BMULTSEL = "B") else
    BMULTSEL_AD when (BMULTSEL = "AD") else
    BMULTSEL_B;

  BREG_BIN <= 
    BREG_1 when (BREG = 1) else
    BREG_0 when (BREG = 0) else
    BREG_2 when (BREG = 2) else
    BREG_1;

  B_INPUT_BIN <= 
    B_INPUT_DIRECT when (B_INPUT = "DIRECT") else
    B_INPUT_CASCADE when (B_INPUT = "CASCADE") else
    B_INPUT_DIRECT;

  CARRYINREG_BIN <= 
    CARRYINREG_1 when (CARRYINREG = 1) else
    CARRYINREG_0 when (CARRYINREG = 0) else
    CARRYINREG_1;

  CARRYINSELREG_BIN <= 
    CARRYINSELREG_1 when (CARRYINSELREG = 1) else
    CARRYINSELREG_0 when (CARRYINSELREG = 0) else
    CARRYINSELREG_1;

  CREG_BIN <= 
    CREG_1 when (CREG = 1) else
    CREG_0 when (CREG = 0) else
    CREG_1;

  DREG_BIN <= 
    DREG_1 when (DREG = 1) else
    DREG_0 when (DREG = 0) else
    DREG_1;

  INMODEREG_BIN <= 
    INMODEREG_1 when (INMODEREG = 1) else
    INMODEREG_0 when (INMODEREG = 0) else
    INMODEREG_1;

  IS_ALUMODE_INVERTED_BIN <= IS_ALUMODE_INVERTED;

  IS_CARRYIN_INVERTED_BIN <= TO_X01(IS_CARRYIN_INVERTED);
  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_INMODE_INVERTED_BIN <= IS_INMODE_INVERTED;

  IS_OPMODE_INVERTED_BIN <= IS_OPMODE_INVERTED;

  IS_RSTALLCARRYIN_INVERTED_BIN <= TO_X01(IS_RSTALLCARRYIN_INVERTED);
  IS_RSTALUMODE_INVERTED_BIN <= TO_X01(IS_RSTALUMODE_INVERTED);
  IS_RSTA_INVERTED_BIN <= TO_X01(IS_RSTA_INVERTED);
  IS_RSTB_INVERTED_BIN <= TO_X01(IS_RSTB_INVERTED);
  IS_RSTCTRL_INVERTED_BIN <= TO_X01(IS_RSTCTRL_INVERTED);
  IS_RSTC_INVERTED_BIN <= TO_X01(IS_RSTC_INVERTED);
  IS_RSTD_INVERTED_BIN <= TO_X01(IS_RSTD_INVERTED);
  IS_RSTINMODE_INVERTED_BIN <= TO_X01(IS_RSTINMODE_INVERTED);
  IS_RSTM_INVERTED_BIN <= TO_X01(IS_RSTM_INVERTED);
  IS_RSTP_INVERTED_BIN <= TO_X01(IS_RSTP_INVERTED);
  MASK_BIN <= MASK;

  MREG_BIN <= 
    MREG_1 when (MREG = 1) else
    MREG_0 when (MREG = 0) else
    MREG_1;

  OPMODEREG_BIN <= 
    OPMODEREG_1 when (OPMODEREG = 1) else
    OPMODEREG_0 when (OPMODEREG = 0) else
    OPMODEREG_1;

  PATTERN_BIN <= PATTERN;

  PREADDINSEL_BIN <= 
    PREADDINSEL_A when (PREADDINSEL = "A") else
    PREADDINSEL_B when (PREADDINSEL = "B") else
    PREADDINSEL_A;

  PREG_BIN <= 
    PREG_1 when (PREG = 1) else
    PREG_0 when (PREG = 0) else
    PREG_1;

  RND_BIN <= RND;

  SEL_MASK_BIN <= 
    SEL_MASK_MASK when (SEL_MASK = "MASK") else
    SEL_MASK_C when (SEL_MASK = "C") else
    SEL_MASK_ROUNDING_MODE1 when (SEL_MASK = "ROUNDING_MODE1") else
    SEL_MASK_ROUNDING_MODE2 when (SEL_MASK = "ROUNDING_MODE2") else
    SEL_MASK_MASK;

  SEL_PATTERN_BIN <= 
    SEL_PATTERN_PATTERN when (SEL_PATTERN = "PATTERN") else
    SEL_PATTERN_C when (SEL_PATTERN = "C") else
    SEL_PATTERN_PATTERN;

  USE_MULT_BIN <= 
    USE_MULT_MULTIPLY when (USE_MULT = "MULTIPLY") else
    USE_MULT_DYNAMIC when (USE_MULT = "DYNAMIC") else
    USE_MULT_NONE when (USE_MULT = "NONE") else
    USE_MULT_MULTIPLY;

  USE_PATTERN_DETECT_BIN <= 
    USE_PATTERN_DETECT_NO_PATDET when (USE_PATTERN_DETECT = "NO_PATDET") else
    USE_PATTERN_DETECT_PATDET when (USE_PATTERN_DETECT = "PATDET") else
    USE_PATTERN_DETECT_NO_PATDET;

  USE_SIMD_BIN <= 
    USE_SIMD_ONE48 when (USE_SIMD = "ONE48") else
    USE_SIMD_FOUR12 when (USE_SIMD = "FOUR12") else
    USE_SIMD_TWO24 when (USE_SIMD = "TWO24") else
    USE_SIMD_ONE48;

  USE_WIDEXOR_BIN <= 
    USE_WIDEXOR_FALSE when (USE_WIDEXOR = "FALSE") else
    USE_WIDEXOR_TRUE when (USE_WIDEXOR = "TRUE") else
    USE_WIDEXOR_FALSE;

  XORSIMD_BIN <= 
    XORSIMD_XOR24_48_96 when (XORSIMD = "XOR24_48_96") else
    XORSIMD_XOR12 when (XORSIMD = "XOR12") else
    XORSIMD_XOR24_48_96;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- ACASCREG check
  if((xil_attr_test) or
     ((ACASCREG /= 1) and 
      (ACASCREG /= 0) and 
      (ACASCREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] ACASCREG attribute is set to "));
    Write ( Message, ACASCREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- ADREG check
  if((xil_attr_test) or
     ((ADREG /= 1) and 
      (ADREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] ADREG attribute is set to "));
    Write ( Message, ADREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- ALUMODEREG check
  if((xil_attr_test) or
     ((ALUMODEREG /= 1) and 
      (ALUMODEREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-103] ALUMODEREG attribute is set to "));
    Write ( Message, ALUMODEREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AMULTSEL check
  if((xil_attr_test) or
     ((AMULTSEL /= "A") and 
      (AMULTSEL /= "AD"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-104] AMULTSEL attribute is set to """));
    Write ( Message, string'(AMULTSEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""A"" or "));
    Write ( Message, string'("""AD"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AREG check
  if((xil_attr_test) or
     ((AREG /= 1) and 
      (AREG /= 0) and 
      (AREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-105] AREG attribute is set to "));
    Write ( Message, AREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AUTORESET_PATDET check
  if((xil_attr_test) or
     ((AUTORESET_PATDET /= "NO_RESET") and 
      (AUTORESET_PATDET /= "RESET_MATCH") and 
      (AUTORESET_PATDET /= "RESET_NOT_MATCH"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-106] AUTORESET_PATDET attribute is set to """));
    Write ( Message, string'(AUTORESET_PATDET));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""NO_RESET"", "));
    Write ( Message, string'("""RESET_MATCH"" or "));
    Write ( Message, string'("""RESET_NOT_MATCH"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AUTORESET_PRIORITY check
  if((xil_attr_test) or
     ((AUTORESET_PRIORITY /= "RESET") and 
      (AUTORESET_PRIORITY /= "CEP"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-107] AUTORESET_PRIORITY attribute is set to """));
    Write ( Message, string'(AUTORESET_PRIORITY));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""RESET"" or "));
    Write ( Message, string'("""CEP"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- A_INPUT check
  if((xil_attr_test) or
     ((A_INPUT /= "DIRECT") and 
      (A_INPUT /= "CASCADE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-108] A_INPUT attribute is set to """));
    Write ( Message, string'(A_INPUT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DIRECT"" or "));
    Write ( Message, string'("""CASCADE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- BCASCREG check
  if((xil_attr_test) or
     ((BCASCREG /= 1) and 
      (BCASCREG /= 0) and 
      (BCASCREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-109] BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- BMULTSEL check
  if((xil_attr_test) or
     ((BMULTSEL /= "B") and 
      (BMULTSEL /= "AD"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-110] BMULTSEL attribute is set to """));
    Write ( Message, string'(BMULTSEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""B"" or "));
    Write ( Message, string'("""AD"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- BREG check
  if((xil_attr_test) or
     ((BREG /= 1) and 
      (BREG /= 0) and 
      (BREG /= 2))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-111] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1, "));
    Write ( Message, string'("0 or "));
    Write ( Message, string'("2. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- B_INPUT check
  if((xil_attr_test) or
     ((B_INPUT /= "DIRECT") and 
      (B_INPUT /= "CASCADE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-112] B_INPUT attribute is set to """));
    Write ( Message, string'(B_INPUT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""DIRECT"" or "));
    Write ( Message, string'("""CASCADE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- CARRYINREG check
  if((xil_attr_test) or
     ((CARRYINREG /= 1) and 
      (CARRYINREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-113] CARRYINREG attribute is set to "));
    Write ( Message, CARRYINREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- CARRYINSELREG check
  if((xil_attr_test) or
     ((CARRYINSELREG /= 1) and 
      (CARRYINSELREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-114] CARRYINSELREG attribute is set to "));
    Write ( Message, CARRYINSELREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- CREG check
  if((xil_attr_test) or
     ((CREG /= 1) and 
      (CREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-115] CREG attribute is set to "));
    Write ( Message, CREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DREG check
  if((xil_attr_test) or
     ((DREG /= 1) and 
      (DREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-116] DREG attribute is set to "));
    Write ( Message, DREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- INMODEREG check
  if((xil_attr_test) or
     ((INMODEREG /= 1) and 
      (INMODEREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-117] INMODEREG attribute is set to "));
    Write ( Message, INMODEREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- MASK check

    -------- MREG check
  if((xil_attr_test) or
     ((MREG /= 1) and 
      (MREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-134] MREG attribute is set to "));
    Write ( Message, MREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- OPMODEREG check
  if((xil_attr_test) or
     ((OPMODEREG /= 1) and 
      (OPMODEREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-135] OPMODEREG attribute is set to "));
    Write ( Message, OPMODEREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- PATTERN check

    -------- PREADDINSEL check
  if((xil_attr_test) or
     ((PREADDINSEL /= "A") and 
      (PREADDINSEL /= "B"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-137] PREADDINSEL attribute is set to """));
    Write ( Message, string'(PREADDINSEL));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""A"" or "));
    Write ( Message, string'("""B"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- PREG check
  if((xil_attr_test) or
     ((PREG /= 1) and 
      (PREG /= 0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-138] PREG attribute is set to "));
    Write ( Message, PREG);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("1 or "));
    Write ( Message, string'("0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RND check

    -------- SEL_MASK check
  if((xil_attr_test) or
     ((SEL_MASK /= "MASK") and 
      (SEL_MASK /= "C") and 
      (SEL_MASK /= "ROUNDING_MODE1") and 
      (SEL_MASK /= "ROUNDING_MODE2"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-140] SEL_MASK attribute is set to """));
    Write ( Message, string'(SEL_MASK));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""MASK"", "));
    Write ( Message, string'("""C"", "));
    Write ( Message, string'("""ROUNDING_MODE1"" or "));
    Write ( Message, string'("""ROUNDING_MODE2"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- SEL_PATTERN check
  if((xil_attr_test) or
     ((SEL_PATTERN /= "PATTERN") and 
      (SEL_PATTERN /= "C"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-141] SEL_PATTERN attribute is set to """));
    Write ( Message, string'(SEL_PATTERN));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""PATTERN"" or "));
    Write ( Message, string'("""C"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- USE_MULT check
  if((xil_attr_test) or
     ((USE_MULT /= "MULTIPLY") and 
      (USE_MULT /= "DYNAMIC") and 
      (USE_MULT /= "NONE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-142] USE_MULT attribute is set to """));
    Write ( Message, string'(USE_MULT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""MULTIPLY"", "));
    Write ( Message, string'("""DYNAMIC"" or "));
    Write ( Message, string'("""NONE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- USE_PATTERN_DETECT check
  if((xil_attr_test) or
     ((USE_PATTERN_DETECT /= "NO_PATDET") and 
      (USE_PATTERN_DETECT /= "PATDET"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-143] USE_PATTERN_DETECT attribute is set to """));
    Write ( Message, string'(USE_PATTERN_DETECT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""NO_PATDET"" or "));
    Write ( Message, string'("""PATDET"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- USE_SIMD check
  if((xil_attr_test) or
     ((USE_SIMD /= "ONE48") and 
      (USE_SIMD /= "FOUR12") and 
      (USE_SIMD /= "TWO24"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-144] USE_SIMD attribute is set to """));
    Write ( Message, string'(USE_SIMD));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""ONE48"", "));
    Write ( Message, string'("""FOUR12"" or "));
    Write ( Message, string'("""TWO24"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- USE_WIDEXOR check
  if((xil_attr_test) or
     ((USE_WIDEXOR /= "FALSE") and 
      (USE_WIDEXOR /= "TRUE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-145] USE_WIDEXOR attribute is set to """));
    Write ( Message, string'(USE_WIDEXOR));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FALSE"" or "));
    Write ( Message, string'("""TRUE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- XORSIMD check
  if((xil_attr_test) or
     ((XORSIMD /= "XOR24_48_96") and 
      (XORSIMD /= "XOR12"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-146] XORSIMD attribute is set to """));
    Write ( Message, string'(XORSIMD));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""XOR24_48_96"" or "));
    Write ( Message, string'("""XOR12"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- AREG check vs ACASCREG
  if (AREG = 1) then
    if (ACASCREG /= 1) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-2] AREG attribute is set to "));
      Write ( Message, AREG);
      Write ( Message, string'(" and ACASCREG attribute is set to "));
      Write ( Message, ACASCREG);
      Write ( Message, string'(". When AREG is 0 or 1, ACASCREG must be set to the same value."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
  elsif (AREG = 0) then
    if (ACASCREG /= 0) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-2] AREG attribute is set to "));
      Write ( Message, AREG);
      Write ( Message, string'(" and ACASCREG attribute is set to "));
      Write ( Message, ACASCREG);
      Write ( Message, string'(". When AREG is 0 or 1, ACASCREG must be set to the same value."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
  elsif (AREG = 2) then
    if (ACASCREG = 0) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-3] AREG attribute is set to "));
      Write ( Message, AREG);
      Write ( Message, string'(" and ACASCREG attribute is set to "));
      Write ( Message, ACASCREG);
      Write ( Message, string'(". When AREG is 2, ACASCREG must be set to 1 or 2."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
  end if;
    ------ BREG check vs BCASCREG
  if (BREG = 1) then
    if (BCASCREG /= 1) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-4] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(" and BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". When BREG is 0 or 1, BCASCREG must be set to the same value."));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    end if;
  elsif (BREG = 0) then
    if (BCASCREG /= 0) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-4] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(" and BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". When BREG is 0 or 1, BCASCREG must be set to the same value."));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    end if;
  elsif (BREG = 2) then
    if (BCASCREG = 0) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-5] BREG attribute is set to "));
    Write ( Message, BREG);
    Write ( Message, string'(" and BCASCREG attribute is set to "));
    Write ( Message, BCASCREG);
    Write ( Message, string'(". When BREG is 2, BCASCREG must be set to 1 or 2."));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    end if;
  end if;
  if((USE_MULT = "NONE") and (MREG /= 0)) then
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-6] Attribute USE_MULT is set to ""NONE"" and "));
    Write ( Message, string'("MREG is set to "));
    Write ( Message, MREG);
    Write ( Message, string'(". MREG must be set to 0 when the multiplier is not used. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
    attr_err := true;
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP48E2_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

--  interconnect
  A1_DATA_in <= A1_DATA_out;
  A2A1_in <= A2A1_out;
  A2_DATA_in <= A2_DATA_out;
  ADDSUB_in <= ADDSUB_out;
  AD_DATA_in <= AD_DATA_out;
  AD_in <= AD_out;
  ALUMODE10_in <= ALUMODE10_out;
  ALU_OUT_in <= ALU_OUT_out after 1 ps; --  break 0 delay feedback
  AMULT26_in <= AMULT26_out;
  A_ALU_in <= A_ALU_out;
  B1_DATA_in <= B1_DATA_out;
  B2B1_in <= B2B1_out;
  B2_DATA_in <= B2_DATA_out;
  BMULT17_in <= BMULT17_out;
  B_ALU_in <= B_ALU_out;
  CCOUT_in <= CCOUT_FB_out;
  COUT_in <= COUT_out;
  C_DATA_in <= C_DATA_out;
  D_DATA_in <= D_DATA_out;
  INMODE2_in <= INMODE_2_out;
  MULTSIGN_ALU_in <= MULTSIGN_ALU_out;
  PREADD_AB_in <= PREADD_AB_out;
  P_FDBK_47_in <= P_FDBK_47_out;
  P_FDBK_in <= P_FDBK_out;
  U_DATA_in <= U_DATA_out when USE_SIMD_BIN = USE_SIMD_ONE48 else '1' & X"00000000000";
  U_in <= U_out;
  V_DATA_in <= V_DATA_out when USE_SIMD_BIN = USE_SIMD_ONE48 else '1' & X"00000000000";
  V_in <= V_out;
  XOR_MX_in <= XOR_MX_out;
  WMUX_P : process (C_DATA_in,P_FDBK_in,RND_BIN,OPMODE_mux(8 downto 7))
  begin
    case  OPMODE_mux(8 downto 7)  is
      when  "00"  => wmux <= (others => '0');
      when  "01"  => wmux <= unsigned(P_FDBK_in);
      when  "10"  => wmux <= unsigned(RND_BIN);
      when  "11"  => wmux <= unsigned(C_DATA_in);
      when others => wmux <= (others => 'X');
    end case;
  end process;

-- *** X mux
--  To support MAC-cascade add multsignin to bit 0 of X
--                 {{47{1'b0}},MULTSIGNIN_in} : {48{1'b0}}
--                   3           44              1
  x_mac_cascd  <=  ("000" & X"00000000000" &  MULTSIGNIN_in)  when  OPMODE_mux (6 downto 4) = "100" else  (others => '0');
  U_44_DATA_3 <= "000" when U_DATA_in(44) = '0' else "111";

  XMUX_P : process (A_ALU_in,B_ALU_in,P_FDBK_in,U_44_DATA_3,U_DATA_in,OPMODE_mux(1 downto 0),x_mac_cascd)
  begin
    case  OPMODE_mux (1 downto 0)  is
      when  "00"  => xmux <= unsigned(x_mac_cascd);
      when  "01"  => xmux <= U_44_DATA_3 & unsigned(U_DATA_in);
      when  "10"  => xmux <= unsigned(P_FDBK_in);
      when  "11"  => xmux <= unsigned(A_ALU_in & B_ALU_in);
      when others => xmux <= (others => 'X');
    end case;
  end process;

-- *** Y mux

  YMUX_P : process (C_DATA_in,V_DATA_in,OPMODE_mux(3 downto 2))
  begin
    case  OPMODE_mux(3 downto 2) is
      when  "00"  => ymux <= (others => '0');
      when  "01"  => ymux <= "000" & unsigned(V_DATA_in);
      when  "10"  => ymux <= (others => '1');
      when  "11"  => ymux <= unsigned(C_DATA_in);
      when others => ymux <= (others => 'X');
    end case;
  end process;

  PCIN_IN47_9    <= PCIN_in(47)  & PCIN_in(47)  & PCIN_in(47) &
                    PCIN_in(47)  & PCIN_in(47)  & PCIN_in(47) & 
                    PCIN_in(47)  & PCIN_in(47) & PCIN_in(47);
  PCIN_IN47_8    <= PCIN_in(47)  & PCIN_in(47)  & PCIN_in(47) &
                    PCIN_in(47)  & PCIN_in(47)  & PCIN_in(47) & 
                    PCIN_in(47)  & PCIN_in(47);
  P_FDBK_47_9    <= P_FDBK_47_in & P_FDBK_47_in & P_FDBK_47_in &
                    P_FDBK_47_in & P_FDBK_47_in & P_FDBK_47_in & 
                    P_FDBK_47_in & P_FDBK_47_in & P_FDBK_47_in;
  P_FDBK_IN47_8  <= P_FDBK_in(47) & P_FDBK_in(47) & P_FDBK_in(47) &
                    P_FDBK_in(47) & P_FDBK_in(47) & P_FDBK_in(47) & 
                    P_FDBK_in(47) & P_FDBK_in(47);
-- *** Z mux
  ZMUX_P : process (C_DATA_in,PCIN_in,P_FDBK_in,OPMODE_mux(6 downto 4),PCIN_IN47_9,PCIN_IN47_8,P_FDBK_47_9,P_FDBK_IN47_8)
  begin
    case  OPMODE_mux (6 downto 4)  is
      when "000" => zmux <= (others => '0');
      when "001" => zmux <= unsigned(PCIN_in);
      when "010" => zmux <= unsigned(P_FDBK_in);
      when "011" => zmux <= unsigned(C_DATA_in);
      when "100" => zmux <= unsigned(P_FDBK_in);
      when "101" => zmux <= unsigned(PCIN_IN47_9 & PCIN_IN47_8   & PCIN_in(47 downto 17));
      when "110" => zmux <= unsigned(P_FDBK_47_9 & P_FDBK_IN47_8 & P_FDBK_in(47 downto 17));
      when "111" => zmux <= unsigned(P_FDBK_47_9 & P_FDBK_IN47_8 & P_FDBK_in(47 downto 17));
      when others => zmux <= (others => 'X');
    end case;
  end process;

-- *** CARRYINSEL and OPMODE with 1 level of register
  process (CLK_in)
  begin
    if  (glblGSR = '1') then CARRYINSEL_reg <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if    (RSTCTRL_in = '1') then CARRYINSEL_reg <= (others => '0');
      elsif (CECTRL_in = '1') then CARRYINSEL_reg <= CARRYINSEL_in;
      end if;
    end if;
  end process;

  CARRYINSEL_mux <= CARRYINSEL_reg when (CARRYINSELREG_BIN = CARRYINSELREG_1)
                                   else  CARRYINSEL_in;

  process (CLK_in)
  begin
    if  (glblGSR = '1') then OPMODE_reg <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if    (RSTCTRL_in = '1') then OPMODE_reg <= (others => '0');
      elsif (CECTRL_in = '1') then OPMODE_reg <= OPMODE_in;
      end if;
    end if;
  end process;

  OPMODE_mux <= OPMODE_reg when (OPMODEREG_BIN = OPMODEREG_1)
                           else OPMODE_in;

  cis_drc:process(CARRYCASCIN_in,CARRYINSEL_mux,MULTSIGNIN_in,OPMODE_mux)
  begin
     if(CARRYINSEL_mux = "010") then
        if (not((MULTSIGNIN_in = 'X') or (cci_drc_msg = '1') or
                ((OPMODE_mux = "001001000") and (MULTSIGNIN_in /= 'X')) or
                ((MULTSIGNIN_in = '0') and (CARRYCASCIN_in = '0')))) then
           assert false
           report "DRC warning : [Unisim DSP48E2-7] CARRYCASCIN can only be used in the current DSP48E2 instance if the previous DSP48E2 is performing a two input ADD or SUBTRACT operation, or the current DSP48E2 is configured in the MAC extend opmode(6:0) equals 1001000. "
           severity Warning;
           assert false
           report "DRC warning note : The simulation model does not know the placement of the DSP48E2 slices used, so it cannot fully confirm the above warning. It is necessary to view the placement of the DSP48E2 slices and ensure that these warnings are not being breached"
           severity Warning;
           cci_drc_msg <= '1';
        end if;
        if(not((MULTSIGNIN_in = 'X') or (OPMODE_mux(3 downto 0) /= "0101"))) then
           assert false
           report "DRC warning : [Unisim DSP48E2-10] CARRYINSEL is set to 010 with OPMODE set to multication (xxx0101). This is an illegal mode and may show deviation between simulation results and hardware behavior."
           severity Warning;
        end if;
        if(not((MULTSIGNIN_in = 'X') or (cis_drc_msg = '1') or
               (OPMODEREG_BIN = OPMODEREG_1))) then
           assert false
           report "DRC warning : [Unisim DSP48E2-11] CARRYINSEL is set to 010 with OPMODEREG set to 0. This causes unknown values after reset occurs. It is suggested to use OPMODEREG = 1 when cascading large adders."
           severity Warning;
           cis_drc_msg <= '1';
        end if;
     end if;
  end process cis_drc;

-- *** ALUMODE with 1 level of register
  ALUM_REG_P : process (CLK_in)
  begin
    if  (glblGSR = '1') then ALUMODE_reg <= (others => '0');
    elsif (rising_edge(CLK_in)) then
      if    (RSTALUMODE_in = '1') then ALUMODE_reg <= (others => '0');
      elsif (CEALUMODE_in = '1')  then ALUMODE_reg <= ALUMODE_in;
      end if;
    end if;
  end process;

  ALUMODE_mux <= ALUMODE_reg when ALUMODEREG_BIN = ALUMODEREG_1
                             else  ALUMODE_in;
------------------------------------------------------------------
-- *** DRC for OPMODE
------------------------------------------------------------------
-- needs PREG from output block
-- ~2000 lines code  - skip for now - copy/rework from DSP48E1.

-- --####################################################################
-- --#####                         ALU                              #####
-- --####################################################################

--  ADDSUB block - first stage of ALU develops sums and carries for Final Adder
--  Invert Z for subtract operation using alumode<0>

  z_optinv <= not zmux when (ALUMODE_mux(0) = '1') else zmux;

--  Add W, X, Y, Z carry-save style; basically full adder logic below
  co <= ((xmux and ymux) or (z_optinv and ymux) or (xmux and z_optinv));
--  s has a fan-out of 2 (1) FA with W (2) second leg of XOR tree
  s     <= (z_optinv xor xmux xor ymux);
  s_slv <= std_logic_vector(s);
--  Mux S and CO to do 2 operands logic operations
--  S = produce XOR/XNOR, NOT functions
--  CO = produce AND/NAND, OR/NOR functions
  comux <= (others => '0') when (ALUMODE_mux(2) = '1') else co;
  smux  <= co              when (ALUMODE_mux(3) = '1') else s ;

--  Carry mux to handle SIMD mode 
--  SIMD must be used here since addition of W requires carry propogation
  comux4simd  <=  comux(47 downto 36) &
                 (comux(35) and not USE_SIMD_BIN(2)) &
                  comux(34 downto 24) &
                 (comux(23) and not USE_SIMD_BIN(1)) &
                  comux(22 downto 12) &
                 (comux(11) and not USE_SIMD_BIN(0)) &
                  comux(10 downto 0);

--  FA to combine W-mux with s and co
--  comux must be shifted to properly reflect carry operation

  smux_w  <=   smux xor (comux4simd(46 downto 0) & '0') xor wmux;
  comux_w <= ((smux and (comux4simd(46 downto 0) & '0')) or
              (wmux and (comux4simd(46 downto 0) & '0')) or
              (smux and wmux));

--  alumode10 indicates a subtraction, used to correct carryout polarity
  ALUMODE10_out <= (ALUMODE_mux(0) and ALUMODE_mux(1));

--  prepare data for Final Adder
--  a_int(0) is in fact the cin bit, adder inputs: a_int(48 downto 1), b_int(47 downto 0), cin= a_int(0)
  a_int <= unsigned(comux_w) & cin;
  b_int <= unsigned(smux_w);

--  FINAL ADDER - second stage develops final sums and carries 
  s0       <= ('0' & a_int(11 downto 0)) + ('0' & b_int(11 downto 0));
--  invert if alumode10
  cout0    <= ALUMODE10_out xor (a_int(12) xor s0(12) xor comux(11));
--  internal carry is zero'd out on mc_simd = 1
  intc1    <= not USE_SIMD_BIN(0) and s0(12);
--  next lsb is zero'd out on mc_simd = 1
  co12_lsb <= not USE_SIMD_BIN(0) and a_int(12);
--  
  s1       <= ('0' & a_int(23 downto 13) & co12_lsb) +
              ('0' & b_int(23 downto 12)) +
              (X"000" & intc1);
  cout1    <= ALUMODE10_out xor (a_int(24) xor s1(12) xor comux(23));
  intc2    <= not USE_SIMD_BIN(1) and s1(12);
  co24_lsb <= not USE_SIMD_BIN(1) and a_int(24);
--  
  s2       <= ('0' & a_int(35 downto 25) & co24_lsb) +
              ('0' & b_int(35 downto 24)) +
              (X"000" & intc2);
  cout2    <= ALUMODE10_out xor (a_int(36) xor s2(12) xor comux(35));
  intc3    <= not USE_SIMD_BIN(2) and s2(12);
  co36_lsb <= not USE_SIMD_BIN(2) and a_int(36);
--  
  s3       <= ('0' & a_int(48 downto 37) & co36_lsb) +
              ('0' & comux4simd(47) & b_int(47 downto 36)) +
              (X"000" & intc3);
  cout3    <= ALUMODE10_out xor s3(12);

--  Not gated with alumode10 since used to propogate carry in wide multiply
--  (above is true in Fuji - need to revisit for Olympus)
  cout4 <= s3 (13);

--  Wide XOR
  xor_12a <= xor_6(s(5  downto 0))  when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12b <= xor_6(s(11 downto 6))  when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12c <= xor_6(s(17 downto 12)) when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12d <= xor_6(s(23 downto 18)) when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12e <= xor_6(s(29 downto 24)) when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12f <= xor_6(s(35 downto 30)) when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12g <= xor_6(s(41 downto 36)) when (USE_WIDEXOR_BIN = '1') else '0';
  xor_12h <= xor_6(s(47 downto 42)) when (USE_WIDEXOR_BIN = '1') else '0';
  xor_24a <= xor_12a xor xor_12b;
  xor_24b <= xor_12c xor xor_12d;
  xor_24c <= xor_12e xor xor_12f;
  xor_24d <= xor_12g xor xor_12h;
  xor_48a <= xor_24a xor xor_24b;
  xor_48b <= xor_24c xor xor_24d;
  xor_96  <= xor_48a xor xor_48b;

--   "X" carryout for multiply and logic operations
  mult_or_logic <= ((OPMODE_mux(3 downto 0)   = "0101") or
                    (ALUMODE_mux(3 downto 2) /= "00"));
-- allow carrycascout to not X in output atom
--  cout_3 <= 'X' when mult_or_logic else cout3;
  cout_3 <=                             cout3;
  cout_2 <= 'X' when mult_or_logic else cout2;
  cout_1 <= 'X' when mult_or_logic else cout1;
  cout_0 <= 'X' when mult_or_logic else cout0;
-- drive signals to Output Atom
-- turn SIMD X on
  COUT_out(3) <= cout_3;
  COUT_out(2) <= cout_2 when USE_SIMD_BIN  = USE_SIMD_FOUR12 else  'X';
  COUT_out(1) <= cout_1 when USE_SIMD_BIN /= USE_SIMD_ONE48  else  'X';
  COUT_out(0) <= cout_0 when USE_SIMD_BIN  = USE_SIMD_FOUR12 else  'X';
--  COUT_out(3) <= cout_3;
--  COUT_out(2) <= cout_2;
--  COUT_out(1) <= cout_1;
--  COUT_out(0) <= cout_0;
  MULTSIGN_ALU_out <= s3(13); -- from alu rtl but doesn't seem right
-- From E1
--  MULTSIGN_ALU_out <= MULTSIGNIN_in when OPMODE_mux (6 downto 4) = "100" else
--                      V_43_DATA_in;
  alu_o       <= std_logic_vector(s3(11 downto 0) & s2(11 downto 0) &
                                  s1(11 downto 0) & s0(11 downto 0));
  ALU_OUT_out   <= alu_o   when ALUMODE_mux(1) = '0' else not alu_o;
  XOR_MX_out(0) <= xor_12a when XORSIMD_BIN = '1' else xor_24a;
  XOR_MX_out(1) <= xor_12b when XORSIMD_BIN = '1' else xor_48a;
  XOR_MX_out(2) <= xor_12c when XORSIMD_BIN = '1' else xor_24b;
  XOR_MX_out(3) <= xor_12d when XORSIMD_BIN = '1' else xor_96;
  XOR_MX_out(4) <= xor_12e when XORSIMD_BIN = '1' else xor_24c;
  XOR_MX_out(5) <= xor_12f when XORSIMD_BIN = '1' else xor_48b;
  XOR_MX_out(6) <= xor_12g when XORSIMD_BIN = '1' else xor_24d;
  XOR_MX_out(7) <= xor_12h;

-- --########################### END ALU ################################

-- *** CarryIn Mux and Register

-------  input 0

  process (CLK_in)
  begin
    if  (glblGSR = '1') then CARRYIN_reg <= '0';
    elsif (rising_edge(CLK_in)) then
      if (RSTALLCARRYIN_in = '1') then CARRYIN_reg <= '0';
      elsif (CECARRYIN_in = '1')  then CARRYIN_reg <= CARRYIN_in;
      end if;
    end if;
  end process;

  CARRYIN_mux <= CARRYIN_reg when CARRYINREG_BIN = CARRYINREG_1 else
                 CARRYIN_in;

--  INTERNAL CARRYIN REGISTER
  c_mult        <= AMULT26_in xnor BMULT17_in;
  ce_m_g        <= CEM_in and not glblGSR; -- & gwe
  rst_carryin_g <= RSTALLCARRYIN_in and not glblGSR; -- & gwe
  d_carryin_int <= c_mult when ce_m_g = '1' else qmultcarryin;

--  rstallcarryin is injected through data path
  dr_carryin_int <= '0' when rst_carryin_g = '1' else d_carryin_int;
  process (CLK_in)
  begin
    if (glblGSR = '1') then qmultcarryin <= '0';
    elsif (rising_edge(CLK_in)) then
      qmultcarryin <= dr_carryin_int;
    end if;
  end process;

--  bypass register mux
  multcarryin_data  <=  qmultcarryin when MREG_BIN = MREG_1 else c_mult;

  process (CARRYINSEL_mux,CARRYIN_mux,PCIN_in(47),CARRYCASCIN_in,CCOUT_in,P_FDBK_in(47),multcarryin_data)
  begin
    case  CARRYINSEL_mux  is
      when "000"  => cin_b <= not CARRYIN_mux;
      when "001"  => cin_b <= PCIN_in(47);
      when "010"  => cin_b <= not CARRYCASCIN_in;
      when "011"  => cin_b <= not PCIN_in(47);
      when "100"  => cin_b <= not CCOUT_in;
      when "101"  => cin_b <= P_FDBK_in(47);
      when "110"  => cin_b <= not multcarryin_data;
      when "111"  => cin_b <= not P_FDBK_in(47);
      when others => cin_b <= 'X';
    end case;
  end process;
--  disable carryin when performing logic operation
  cin <= '0' when ((ALUMODE_mux(3) or ALUMODE_mux(2)) = '1') else not cin_b;

--  DSP_A_B_DATA
-- *********************************************************
-- *** Input register A with 2 level deep of registers
-- *********************************************************

  A_ACIN_mux <= ACIN_in when (A_INPUT_BIN = A_INPUT_CASCADE) else  A_in;
--  CLK_areg1  <= '0' when (AREG_BIN = AREG_0) else CLK_in  ;
--  CLK_areg2  <= '0' when (AREG_BIN = AREG_0) else CLK_in  ;

  process (CLK_areg1) begin
    if  (glblGSR = '1') then A1_reg <= (others => '0');
    elsif (rising_edge(CLK_areg1)) then
      if     (RSTA_in = '1') then A1_reg <= (others => '0');
      elsif  (CEA1_in = '1') then A1_reg <= A_ACIN_mux;
      end if;
    end if;
  end process;

  A1_reg_mux  <=  A1_reg when (AREG_BIN = AREG_2) else A_ACIN_mux;

  process (CLK_areg2)
  begin
    if  (glblGSR = '1') then A2_reg <= (others => '0');
    elsif (rising_edge(CLK_areg2)) then
      if    (RSTA_in = '1') then A2_reg <= (others => '0');
      elsif (CEA2_in = '1') then A2_reg <= A1_reg_mux;
      end if;
    end if;
  end process;

  A2_reg_mux  <= A1_reg_mux when (AREG_BIN = AREG_0) else A2_reg;

-- assumes encoding the same for ACASCREG and AREG
  ACOUT_out   <= A2_reg_mux when ACASCREG_BIN = AREG_BIN else A1_reg;
  A1_DATA_out <= A1_reg (26 downto 0);
  A2_DATA_out <= A2_reg_mux (26 downto 0);
  A_ALU_out   <= A2_reg_mux;

-- *********************************************************
-- *** Input register B with 2 level deep of registers
-- *********************************************************

  B_BCIN_mux <= BCIN_in when (B_INPUT_BIN = B_INPUT_CASCADE) else B_in;
--  CLK_breg1  <= '0' when (BREG_BIN = BREG_0) else CLK_in ;
--  CLK_breg2  <= '0' when (BREG_BIN = BREG_0) else CLK_in ;

  process (CLK_breg1) begin
    if (glblGSR = '1') then B1_reg <= (others => '0');
    elsif (rising_edge(CLK_breg1)) then
      if    (RSTB_in = '1') then B1_reg <= (others => '0');
      elsif (CEB1_in = '1') then B1_reg <= B_BCIN_mux;
      end if;
    end if;
  end process;

  B1_reg_mux  <= B1_reg when (BREG_BIN = BREG_2) else B_BCIN_mux;

  process (CLK_breg2) begin
    if (glblGSR = '1') then B2_reg <= (others => '0');
    elsif (rising_edge(CLK_breg2)) then
      if    (RSTB_in = '1') then B2_reg <= (others => '0');
      elsif (CEB2_in = '1') then B2_reg <= B1_reg_mux;
      end if;
    end if;
  end process;

  B2_reg_mux <=  B1_reg_mux when (BREG_BIN = BREG_0) else B2_reg;

-- assumes encoding the same for BCASCREG and BREG
  BCOUT_out   <= B2_reg_mux when BCASCREG_BIN = BREG_BIN else B1_reg;
  B1_DATA_out <= B1_reg;
  B2_DATA_out <= B2_reg_mux;
  B_ALU_out <= B2_reg_mux;

--  DSP_C_DATA
-- *********************************************************
-- *** Input register C with 1 level deep of register
-- *********************************************************

--  CLK_creg  <=  CLK_in  when  CREG_BIN = CREG_1  else  '0';

  process (CLK_creg) begin
    if  (glblGSR = '1') then C_reg <= (others => '0');
    elsif (rising_edge(CLK_creg)) then
      if    (RSTC_in = '1') then C_reg <= (others => '0');
      elsif (CEC_in = '1')  then C_reg <= C_in;
      end if;
    end if;
  end process;

  C_DATA_out  <=  C_reg  when  CREG_BIN = CREG_1  else  C_in;

--  DSP_MULTIPLIER
  a_mult_mux <= signed(A2A1_in) when AMULTSEL_BIN = AMULTSEL_A else
                signed(AD_DATA_in);
  b_mult_mux <= signed(B2B1_in) when BMULTSEL_BIN = BMULTSEL_B else
                signed(AD_DATA_in(17 downto 0)) ;
-- replace {18{a_mult_mux[26]}} shorthand
  a_mult_mux_26_18 <= "000000000000000000" when a_mult_mux(26) = '0' else
                      "111111111111111111";
-- replace {27{b_mult_mux[17]}} shorthand
  b_mult_mux_17_27 <= "000000000000000000000000000" when b_mult_mux(17) = '0' else
                      "111111111111111111111111111";

  AMULT26_out <= a_mult_mux(26);
  BMULT17_out <= b_mult_mux(17);
  U_out <= std_logic_vector('1'          & (unsigned(mult(43 downto 0)) and ps_u_mask));
  V_out <= std_logic_vector(not mult(44) & (unsigned(mult(43 downto 0)) and ps_v_mask));

  mult <= (others => '0') when USE_MULT_BIN = USE_MULT_NONE else
          a_mult_mux * b_mult_mux;
--          (a_mult_mux_26_18 & a_mult_mux) * (b_mult_mux_17_27 & b_mult_mux);

--  DSP_M_DATA
-- *********************************************************
-- *** Multiplier outputs U, V  with 1 level deep of register
-- *********************************************************

--  CLK_mreg <= CLK_in  when MREG_BIN = MREG_1 else '0';
  process (CLK_mreg) begin
    if (glblGSR = '1') then
      U_DATA_reg    <= '0' & X"00000000000";
      V_DATA_reg    <= '0' & X"00000000000";
    elsif (rising_edge(CLK_mreg)) then
      if (RSTM_in = '1') then
        U_DATA_reg    <= '0' & X"00000000000";
        V_DATA_reg    <= '0' & X"00000000000";
      elsif (CEM_in = '1') then
        U_DATA_reg    <= U_in;
        V_DATA_reg    <= V_in;
      end if;
    end if;
  end process;

  U_DATA_out    <= U_DATA_reg    when MREG_BIN = MREG_1 else U_in;
  V_DATA_out    <= V_DATA_reg    when MREG_BIN = MREG_1 else V_in;

--  DSP_OUTPUT
-- --####################################################################
-- --#####                    Pattern Detector                      #####
-- --####################################################################

--  new

--  select pattern
  the_pattern <= PATTERN_BIN when SEL_PATTERN_BIN = SEL_PATTERN_PATTERN else C_DATA_in;

--  selet mask
  the_mask <= (others => '1') when (USE_PATTERN_DETECT_BIN = USE_PATTERN_DETECT_NO_PATDET) else
      C_DATA_in when (SEL_MASK_BIN = SEL_MASK_C) else
      (not(C_DATA_in(46 downto 0)) & '0')  when (SEL_MASK_BIN = SEL_MASK_ROUNDING_MODE1) else
      (not(C_DATA_in(45 downto 0)) & "00") when (SEL_MASK_BIN = SEL_MASK_ROUNDING_MODE2) else
      MASK_BIN;

--  process (C_DATA_in) begin
--    case  SEL_MASK_BIN  is
--      when  SEL_MASK_MASK           => the_mask <= MASK_BIN;
--      when  SEL_MASK_C              => the_mask <= C_DATA_in;
--      when  SEL_MASK_ROUNDING_MODE1 =>
--                       the_mask <= not(C_DATA_in (46 downto 0) & '0');
--      when  SEL_MASK_ROUNDING_MODE2 =>
--                       the_mask <= not(C_DATA_in (45 downto 0) & "00");
--      when  others                  => the_mask <= MASK_BIN;
--    end case;
--  end process;

-- --  now do the pattern detection

  pdet_o  <= '1' when (    the_pattern or the_mask) = (ALU_OUT_in or the_mask)
                 else '0';
  pdetb_o <= '1' when (not the_pattern or the_mask) = (ALU_OUT_in or the_mask)
                 else '0';

  PATTERNDETECT_out   <= pdet_o_mux  when opmode_valid_flag_dou else 'X';
  PATTERNBDETECT_out <= pdetb_o_mux when opmode_valid_flag_dou else 'X';

--  CLK_preg  <=  CLK_in  when  PREG_BIN = PREG_1  else  '0';

-- *** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

-- -- the previous values are used in Underflow/Overflow
  process (CLK_preg) begin
    if (glblGSR = '1') then
      pdet_o_reg1  <= '0';
      pdet_o_reg2  <= '0';
      pdetb_o_reg1 <= '0';
      pdetb_o_reg2 <= '0';
    elsif (rising_edge(CLK_preg)) then
      if (RSTP_in = '1' or the_auto_reset_patdet = '1') then
        pdet_o_reg1  <= '0';
        pdet_o_reg2  <= '0';
        pdetb_o_reg1 <= '0';
        pdetb_o_reg2 <= '0';
      elsif  (CEP_in = '1') then
        pdet_o_reg2  <= pdet_o_reg1;
        pdet_o_reg1  <= pdet_o;
        pdetb_o_reg2 <= pdetb_o_reg1;
        pdetb_o_reg1 <= pdetb_o;
      end if;
    end if;
  end process;

  pdet_o_mux     <= pdet_o_reg1  when (PREG_BIN = PREG_1) else pdet_o;
  pdetb_o_mux    <= pdetb_o_reg1 when (PREG_BIN = PREG_1) else pdetb_o;
  overflow_data  <= pdet_o_reg2  when (PREG_BIN = PREG_1) else pdet_o;
  underflow_data <= pdetb_o_reg2 when (PREG_BIN = PREG_1) else pdetb_o;

-- --####################################################################
-- --#####                     AUTORESET_PATDET                     #####
-- --####################################################################
  auto_reset_pri <= '1' when (AUTORESET_PRIORITY_BIN = AUTORESET_PRIORITY_RESET) else CEP_in;

  the_auto_reset_patdet <= auto_reset_pri and pdet_o_mux
           when (AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_MATCH) else
                           auto_reset_pri and overflow_data and not pdet_o_mux
           when (AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_NOT_MATCH) else
                           '0'; -- _RESET
--  the_auto_reset_patdet <= '1' when
--  (((AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_MATCH) and
--    (pdet_o_reg1 = '1')) or
--   ((AUTORESET_PATDET_BIN = AUTORESET_PATDET_RESET_NOT_MATCH) and
--    ((pdet_o_reg2 = '1') and (pdet_o_reg1 = '0')))) and
--  ((CEP_in = '1') or
--   (AUTORESET_PRIORITY_BIN = AUTORESET_PRIORITY_RESET)) else '0';

-- --####################################################################
-- --#### CARRYOUT, CARRYCASCOUT. MULTSIGNOUT, PCOUT and XOROUT reg ##### 
-- --####################################################################
-- *** register with 1 level of register
  process (CLK_preg) begin
    if (glblGSR = '1') then
      COUT_reg <= "0000";
      ALUMODE10_reg <= '0';
      MULTSIGN_ALU_reg <= '0';
      ALU_OUT_reg <= (others => '0');
      XOR_MX_reg <= (others => '0');
    elsif (rising_edge(CLK_preg)) then
      if  (RSTP_in = '1' or the_auto_reset_patdet = '1') then
        COUT_reg <= "0000";
        ALUMODE10_reg <= '0';
        MULTSIGN_ALU_reg <= '0';
        ALU_OUT_reg <= (others => '0');
        XOR_MX_reg <= (others => '0');
      elsif (CEP_in = '1') then
        COUT_reg <= COUT_in;
        ALUMODE10_reg <= ALUMODE10_in;
        MULTSIGN_ALU_reg <= MULTSIGN_ALU_in;
        ALU_OUT_reg <= ALU_OUT_in;
        XOR_MX_reg <= XOR_MX_in;
      end if;
    end if;
  end process;

 CARRYOUT_out    <= COUT_reg         when PREG_BIN = PREG_1 else COUT_in;
 MULTSIGNOUT_out <= MULTSIGN_ALU_reg when PREG_BIN = PREG_1 else MULTSIGN_ALU_in;
 P_out           <= ALU_OUT_reg      when PREG_BIN = PREG_1 else ALU_OUT_in;
 ALUMODE10_mux   <= ALUMODE10_reg    when PREG_BIN = PREG_1 else ALUMODE10_in;
 XOROUT_out      <= XOR_MX_reg       when PREG_BIN = PREG_1 else XOR_MX_in;
 CCOUT_FB_out     <= ALUMODE10_reg xor COUT_reg(3);
 CARRYCASCOUT_out <= ALUMODE10_mux xor CARRYOUT_out(3);
 P_FDBK_out      <= ALU_OUT_reg      when PREG_BIN = PREG_1 else ALU_OUT_in;
 P_FDBK_47_out   <= ALU_OUT_reg(47)  when PREG_BIN = PREG_1 else ALU_OUT_in(47);
 PCOUT_out       <= ALU_OUT_reg      when PREG_BIN = PREG_1 else ALU_OUT_in;


-- --####################################################################
-- --#####                    Underflow / Overflow                  #####
-- --####################################################################

  OVERFLOW_out  <= not pdet_o_mux and not pdetb_o_mux and overflow_data when
                ((USE_PATTERN_DETECT_BIN = USE_PATTERN_DETECT_PATDET) or (PREG_BIN = PREG_1))
                   else 'X';
  UNDERFLOW_out <= not pdet_o_mux and not pdetb_o_mux and underflow_data when
                ((USE_PATTERN_DETECT_BIN = USE_PATTERN_DETECT_PATDET) or (PREG_BIN = PREG_1))
                   else 'X';

--  DSP_PREADD
-- *********************************************************
-- *** Preaddsub AD
-- *********************************************************
  D_DATA_mux <= D_DATA_in when INMODE2_in = '1' else (others => '0');
  AD_out <= std_logic_vector(unsigned(D_DATA_mux) - unsigned(PREADD_AB_in))
            when (ADDSUB_in = '1') else
            std_logic_vector(unsigned(D_DATA_mux) + unsigned(PREADD_AB_in));

--  DSP_PREADD_DATA
  a1a2_i_mux    <= A1_DATA_in      when INMODE_mux(0) = '1' else A2_DATA_in;
  b1b2_i_mux    <= B1_DATA_in      when INMODE_mux(4) = '1' else B2_DATA_in;
-- replace {9{b1b2_i_mux[17]}} shorthand
  b1b2_i_mux_17_9 <= "000000000" when b1b2_i_mux(17) = '0' else
                     "111111111";
  A2A1_out  <= (others => '0') when (INMODE_mux(1) = '1' and PREADDINSEL_BIN = PREADDINSEL_A)
                else a1a2_i_mux;
  B2B1_out  <= (others => '0') when (INMODE_mux(1) = '1' and PREADDINSEL_BIN = PREADDINSEL_B)
                else b1b2_i_mux;
  ADDSUB_out    <= INMODE_mux(3);
  INMODE_2_out  <= INMODE_mux(2);
  PREADD_AB_out <= (b1b2_i_mux_17_9 & B2B1_out) when PREADDINSEL_BIN = PREADDINSEL_B
                   else A2A1_out;

-- *********************************************************
-- **********  INMODE signal registering        ************
-- *********************************************************
--  new 
--  CLK_inmode  <=  CLK_in  when  INMODEREG_BIN = INMODEREG_1  else  '0';
  process (CLK_inmode) begin
    if  (glblGSR = '1') then INMODE_reg <= (others => '0');
    elsif (rising_edge(CLK_inmode)) then
      if    (RSTINMODE_in = '1') then INMODE_reg <= (others => '0');
      elsif (CEINMODE_in = '1')  then INMODE_reg <= INMODE_in;
      end if;
    end if;
  end process;

  INMODE_mux  <=  INMODE_reg  when  INMODEREG_BIN = INMODEREG_1  else  INMODE_in;

-- *********************************************************
-- *** Input register D with 1 level deep of register
-- *********************************************************
--  CLK_dreg  <=  CLK_in  when  DREG_BIN = DREG_1  else  '0';
  process (CLK_dreg) begin
    if (glblGSR = '1') then D_DATA_reg <= (others => '0');
    elsif (rising_edge(CLK_dreg)) then
      if    (RSTD_in = '1') then D_DATA_reg <= (others => '0');
      elsif (CED_in = '1')  then D_DATA_reg <= D_in;
      end if;
    end if;
  end process;

  D_DATA_out  <=  D_DATA_reg  when  DREG_BIN = DREG_1  else  D_in;

-- *********************************************************
-- *** Input register AD with 1 level deep of register
-- *********************************************************
--  CLK_adreg  <=  CLK_in  when  ADREG_BIN = ADREG_1  else  '0';
  process (CLK_adreg) begin
    if  (glblGSR = '1') then AD_DATA_reg <= (others => '0');
    elsif (rising_edge(CLK_adreg)) then
      if    (RSTD_in = '1') then AD_DATA_reg <= (others => '0');
      elsif (CEAD_in = '1') then AD_DATA_reg <= AD_in;
      end if;
    end if;
  end process;

  AD_DATA_out  <=  AD_DATA_reg  when  ADREG_BIN = ADREG_1  else  AD_in;


  process (OPMODE_mux) begin
    if  (((OPMODE_mux(1 downto 0) = "11") and (USE_MULT_BIN = USE_MULT_MULTIPLY)) and
         ((AREG = 0 and BREG = 0 and MREG = 0) or
          (AREG = 0 and BREG = 0 and PREG = 0) or
          (MREG = 0 and PREG = 0))) then
          assert false
          report "OPMODE Input Warning : [Unisim DSP48E2-8] The OPMODE(1:0) (11) on DSP48E2 is invalid when using attributes USE_MULT = MULTIPLY and (A, B and M) or (A, B and P) or (M and P) are not REGISTERED. Please set USE_MULT to either NONE or DYNAMIC or REGISTER one of each group. (A or B) and (M or P) to satisfy the requirement."
          severity Warning;
    end if;
    if  ((OPMODE_mux(3 downto 0) = "0101") and
         ((USE_MULT_BIN = USE_MULT_NONE) or (USE_SIMD_BIN /= USE_SIMD_ONE48))) then
          assert false
          report "OPMODE Input Warning : [Unisim DSP48E2-9] The OPMODE(3:0) (0101) on DSP48E2 is invalid when using attributes USE_MULT = NONE or USE_SIMD = TWO24 or USE_SIMD = FOUR12."
          severity Warning;
    end if;
  end process;


    -- end behavioral body
  end DSP48E2_V;
