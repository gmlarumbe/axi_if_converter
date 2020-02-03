-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2014.2
--  \   \          Description : Xilinx Unified Simulation Library Component
--  /   /                        48-bit Multi-Functional Arithmetic Block
-- /___/   /\      Filename    : DSP_ALU.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  07/15/12 - Migrate from E1.
--  12/10/12 - Add dynamic registers
--  03/01/13 - 699402 - U_44_DATA_3 missing from xmux process sensitivity list
--  04/22/13 - 713695 - Zero mult result on USE_SIMD
--  04/22/13 - 713617 - CARRYCASCOUT behaviour
--  04/22/13 - change from CLK'event to rising_edge(CLK)
--  04/23/13 - 714772 - remove sensitivity to negedge GSR
--  06/13/13 - 722112 - x_mac_cascd missing from process sensitivity list
-- End Revision
-------------------------------------------------------------------------------

----- CELL DSP_ALU -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity DSP_ALU is
  generic (
    ALUMODEREG : integer := 1;
    CARRYINREG : integer := 1;
    CARRYINSELREG : integer := 1;
    IS_ALUMODE_INVERTED : std_logic_vector(3 downto 0) := "0000";
    IS_CARRYIN_INVERTED : bit := '0';
    IS_CLK_INVERTED : bit := '0';
    IS_OPMODE_INVERTED : std_logic_vector(8 downto 0) := "000000000";
    IS_RSTALLCARRYIN_INVERTED : bit := '0';
    IS_RSTALUMODE_INVERTED : bit := '0';
    IS_RSTCTRL_INVERTED : bit := '0';
    MREG : integer := 1;
    OPMODEREG : integer := 1;
    RND : std_logic_vector(47 downto 0) := X"000000000000";
    USE_SIMD : string := "ONE48";
    USE_WIDEXOR : string := "FALSE";
    XORSIMD : string := "XOR24_48_96"
  );

  port (
    ALUMODE10            : out std_ulogic;
    ALU_OUT              : out std_logic_vector(47 downto 0);
    COUT                 : out std_logic_vector(3 downto 0);
    MULTSIGN_ALU         : out std_ulogic;
    XOR_MX               : out std_logic_vector(7 downto 0);
    ALUMODE              : in std_logic_vector(3 downto 0);
    AMULT26              : in std_ulogic;
    A_ALU                : in std_logic_vector(29 downto 0);
    BMULT17              : in std_ulogic;
    B_ALU                : in std_logic_vector(17 downto 0);
    CARRYCASCIN          : in std_ulogic;
    CARRYIN              : in std_ulogic;
    CARRYINSEL           : in std_logic_vector(2 downto 0);
    CCOUT                : in std_ulogic;
    CEALUMODE            : in std_ulogic;
    CECARRYIN            : in std_ulogic;
    CECTRL               : in std_ulogic;
    CEM                  : in std_ulogic;
    CLK                  : in std_ulogic;
    C_DATA               : in std_logic_vector(47 downto 0);
    MULTSIGNIN           : in std_ulogic;
    OPMODE               : in std_logic_vector(8 downto 0);
    PCIN                 : in std_logic_vector(47 downto 0);
    P_FDBK               : in std_logic_vector(47 downto 0);
    P_FDBK_47            : in std_ulogic;
    RSTALLCARRYIN        : in std_ulogic;
    RSTALUMODE           : in std_ulogic;
    RSTCTRL              : in std_ulogic;
    U_DATA               : in std_logic_vector(44 downto 0);
    V_DATA               : in std_logic_vector(44 downto 0)
  );
end DSP_ALU;

architecture DSP_ALU_V of DSP_ALU is

  constant MODULE_NAME : string := "DSP_ALU";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant ALUMODEREG_0 : std_ulogic := '1';
  constant ALUMODEREG_1 : std_ulogic := '0';
  constant CARRYINREG_0 : std_ulogic := '1';
  constant CARRYINREG_1 : std_ulogic := '0';
  constant CARRYINSELREG_0 : std_ulogic := '1';
  constant CARRYINSELREG_1 : std_ulogic := '0';
  constant MREG_0 : std_ulogic := '1';
  constant MREG_1 : std_ulogic := '0';
  constant OPMODEREG_0 : std_ulogic := '1';
  constant OPMODEREG_1 : std_ulogic := '0';
  constant USE_SIMD_FOUR12 : std_logic_vector(2 downto 0) := "111";
  constant USE_SIMD_ONE48 : std_logic_vector(2 downto 0) := "000";
  constant USE_SIMD_TWO24 : std_logic_vector(2 downto 0) := "010";
  constant USE_WIDEXOR_FALSE : std_ulogic := '0';
  constant USE_WIDEXOR_TRUE : std_ulogic := '1';
  constant XORSIMD_XOR12 : std_ulogic := '1';
  constant XORSIMD_XOR24_48_96 : std_ulogic := '0';

  signal ALUMODEREG_BIN : std_ulogic;
  signal CARRYINREG_BIN : std_ulogic;
  signal CARRYINSELREG_BIN : std_ulogic;
  signal IS_ALUMODE_INVERTED_BIN : std_logic_vector(3 downto 0);
  signal IS_CARRYIN_INVERTED_BIN : std_ulogic;
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_OPMODE_INVERTED_BIN : std_logic_vector(8 downto 0);
  signal IS_RSTALLCARRYIN_INVERTED_BIN : std_ulogic;
  signal IS_RSTALUMODE_INVERTED_BIN : std_ulogic;
  signal IS_RSTCTRL_INVERTED_BIN : std_ulogic;
  signal MREG_BIN : std_ulogic;
  signal OPMODEREG_BIN : std_ulogic;
  signal RND_BIN : std_logic_vector(47 downto 0);
  signal USE_SIMD_BIN : std_logic_vector(2 downto 0);
  signal USE_WIDEXOR_BIN : std_ulogic;
  signal XORSIMD_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;

  signal ALUMODE10_out : std_ulogic;
  signal ALU_OUT_out : std_logic_vector(47 downto 0);
  signal COUT_out : std_logic_vector(3 downto 0);
  signal MULTSIGN_ALU_out : std_ulogic;
  signal XOR_MX_out : std_logic_vector(7 downto 0);
 
  signal ALUMODE_in : std_logic_vector(3 downto 0);
  signal AMULT26_in : std_ulogic;
  signal A_ALU_in : std_logic_vector(29 downto 0);
  signal BMULT17_in : std_ulogic;
  signal B_ALU_in : std_logic_vector(17 downto 0);
  signal CARRYCASCIN_in : std_ulogic;
  signal CARRYINSEL_in : std_logic_vector(2 downto 0);
  signal CARRYIN_in : std_ulogic;
  signal CCOUT_in : std_ulogic;
  signal CEALUMODE_in : std_ulogic;
  signal CECARRYIN_in : std_ulogic;
  signal CECTRL_in : std_ulogic;
  signal CEM_in : std_ulogic;
  signal CLK_in : std_ulogic;
  signal C_DATA_in : std_logic_vector(47 downto 0);
  signal MULTSIGNIN_in : std_ulogic;
  signal OPMODE_in : std_logic_vector(8 downto 0);
  signal PCIN_in : std_logic_vector(47 downto 0);
  signal P_FDBK_47_in : std_ulogic;
  signal P_FDBK_in : std_logic_vector(47 downto 0);
  signal RSTALLCARRYIN_in : std_ulogic;
  signal RSTALUMODE_in : std_ulogic;
  signal RSTCTRL_in : std_ulogic;
  signal U_DATA_in : std_logic_vector(44 downto 0);
  signal V_DATA_in : std_logic_vector(44 downto 0);

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
  ALUMODE10 <= ALUMODE10_out after OUT_DELAY;
  ALU_OUT <= ALU_OUT_out after OUT_DELAY;
  COUT <= COUT_out after OUT_DELAY;
  MULTSIGN_ALU <= MULTSIGN_ALU_out after OUT_DELAY;
  XOR_MX <= XOR_MX_out after OUT_DELAY;
  
  ALUMODE_in(0) <= '0' when (ALUMODE(0) = 'Z') else ALUMODE(0) xor IS_ALUMODE_INVERTED_BIN(0); -- rv 0
  ALUMODE_in(1) <= '0' when (ALUMODE(1) = 'Z') else ALUMODE(1) xor IS_ALUMODE_INVERTED_BIN(1); -- rv 0
  ALUMODE_in(2) <= '0' when (ALUMODE(2) = 'Z') else ALUMODE(2) xor IS_ALUMODE_INVERTED_BIN(2); -- rv 0
  ALUMODE_in(3) <= '0' when (ALUMODE(3) = 'Z') else ALUMODE(3) xor IS_ALUMODE_INVERTED_BIN(3); -- rv 0
  AMULT26_in <= AMULT26;
  A_ALU_in <= A_ALU;
  BMULT17_in <= BMULT17;
  B_ALU_in <= B_ALU;
  CARRYCASCIN_in <= CARRYCASCIN;
  CARRYINSEL_in(0) <= '0' when (CARRYINSEL(0) = 'Z') else CARRYINSEL(0); -- rv 0
  CARRYINSEL_in(1) <= '0' when (CARRYINSEL(1) = 'Z') else CARRYINSEL(1); -- rv 0
  CARRYINSEL_in(2) <= '0' when (CARRYINSEL(2) = 'Z') else CARRYINSEL(2); -- rv 0
  CARRYIN_in <= '0' when (CARRYIN = 'Z') else CARRYIN xor IS_CARRYIN_INVERTED_BIN; -- rv 0
  CCOUT_in <= CCOUT;
  CEALUMODE_in <= '0' when (CEALUMODE = 'Z') else CEALUMODE; -- rv 0
  CECARRYIN_in <= '0' when (CECARRYIN = 'Z') else CECARRYIN; -- rv 0
  CECTRL_in <= '0' when (CECTRL = 'Z') else CECTRL; -- rv 0
  CEM_in <= '0' when (CEM = 'Z') else CEM; -- rv 0
  CLK_in <= '0' when (CLK = 'Z') else CLK xor IS_CLK_INVERTED_BIN; -- rv 0
  C_DATA_in <= C_DATA;
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
  P_FDBK_47_in <= P_FDBK_47;
  P_FDBK_in <= P_FDBK;
  RSTALLCARRYIN_in <= '0' when (RSTALLCARRYIN = 'Z') else RSTALLCARRYIN xor IS_RSTALLCARRYIN_INVERTED_BIN; -- rv 0
  RSTALUMODE_in <= '0' when (RSTALUMODE = 'Z') else RSTALUMODE xor IS_RSTALUMODE_INVERTED_BIN; -- rv 0
  RSTCTRL_in <= '0' when (RSTCTRL = 'Z') else RSTCTRL xor IS_RSTCTRL_INVERTED_BIN; -- rv 0
  U_DATA_in <= U_DATA when USE_SIMD_BIN = USE_SIMD_ONE48 else '1' & X"00000000000";
  V_DATA_in <= V_DATA when USE_SIMD_BIN = USE_SIMD_ONE48 else '1' & X"00000000000";
  
  ALUMODEREG_BIN <= 
    ALUMODEREG_1 when (ALUMODEREG = 1) else
    ALUMODEREG_0 when (ALUMODEREG = 0) else
    ALUMODEREG_1;

  CARRYINREG_BIN <= 
    CARRYINREG_1 when (CARRYINREG = 1) else
    CARRYINREG_0 when (CARRYINREG = 0) else
    CARRYINREG_1;

  CARRYINSELREG_BIN <= 
    CARRYINSELREG_1 when (CARRYINSELREG = 1) else
    CARRYINSELREG_0 when (CARRYINSELREG = 0) else
    CARRYINSELREG_1;

  IS_ALUMODE_INVERTED_BIN <= IS_ALUMODE_INVERTED;

  IS_CARRYIN_INVERTED_BIN <= TO_X01(IS_CARRYIN_INVERTED);
  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_OPMODE_INVERTED_BIN <= IS_OPMODE_INVERTED;

  IS_RSTALLCARRYIN_INVERTED_BIN <= TO_X01(IS_RSTALLCARRYIN_INVERTED);
  IS_RSTALUMODE_INVERTED_BIN <= TO_X01(IS_RSTALUMODE_INVERTED);
  IS_RSTCTRL_INVERTED_BIN <= TO_X01(IS_RSTCTRL_INVERTED);
  MREG_BIN <= 
    MREG_1 when (MREG = 1) else
    MREG_0 when (MREG = 0) else
    MREG_1;

  OPMODEREG_BIN <= 
    OPMODEREG_1 when (OPMODEREG = 1) else
    OPMODEREG_0 when (OPMODEREG = 0) else
    OPMODEREG_1;

  RND_BIN <= RND;

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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- RND check

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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
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
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
  if  (attr_err) then
    Write ( Message, string'("[Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-147] Attribute Error(s) encountered. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(DSP_ALU_V'INSTANCE_NAME));
    assert FALSE
    report Message.all
    severity error;
  end if;
  wait;
  end process INIPROC;

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
           report "DRC warning : [Unisim DSP_ALU-7] CARRYCASCIN can only be used in the current DSP_ALU instance if the previous DSP_ALU is performing a two input ADD or SUBTRACT operation, or the current DSP_ALU is configured in the MAC extend opmode(6:0) equals 1001000. "
           severity Warning;
           assert false
           report "DRC warning note : The simulation model does not know the placement of the DSP_ALU slices used, so it cannot fully confirm the above warning. It is necessary to view the placement of the DSP_ALU slices and ensure that these warnings are not being breached"
           severity Warning;
           cci_drc_msg <= '1';
        end if;
        if(not((MULTSIGNIN_in = 'X') or (OPMODE_mux(3 downto 0) /= "0101"))) then
           assert false
           report "DRC warning : [Unisim DSP_ALU-10] CARRYINSEL is set to 010 with OPMODE set to multication (xxx0101). This is an illegal mode and may show deviation between simulation results and hardware behavior."
           severity Warning;
        end if;
        if(not((MULTSIGNIN_in = 'X') or (cis_drc_msg = '1') or
               (OPMODEREG_BIN = OPMODEREG_1))) then
           assert false
           report "DRC warning : [Unisim DSP_ALU-11] CARRYINSEL is set to 010 with OPMODEREG set to 0. This causes unknown values after reset occurs. It is suggested to use OPMODEREG = 1 when cascading large adders."
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


    -- end behavioral body
  end DSP_ALU_V;
