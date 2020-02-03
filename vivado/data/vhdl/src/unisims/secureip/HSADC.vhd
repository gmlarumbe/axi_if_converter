-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2017.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        HSADC
-- /___/   /\      Filename    : HSADC.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL HSADC -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

library SECUREIP;
use SECUREIP.all;

entity HSADC is
  generic (
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    XPA_CFG0 : integer := 0;
    XPA_CFG1 : integer := 0;
    XPA_NUM_ADCS : string := "0";
    XPA_NUM_DDCS : integer := 0;
    XPA_PLL_USED : string := "No";
    XPA_SAMPLE_RATE_MSPS : integer := 0
  );
  
  port (
    CLK_ADC              : out std_ulogic;
    DATA_ADC0            : out std_logic_vector(127 downto 0);
    DATA_ADC1            : out std_logic_vector(127 downto 0);
    DATA_ADC2            : out std_logic_vector(127 downto 0);
    DATA_ADC3            : out std_logic_vector(127 downto 0);
    DOUT                 : out std_logic_vector(15 downto 0);
    DRDY                 : out std_ulogic;
    PLL_DMON_OUT         : out std_ulogic;
    PLL_REFCLK_OUT       : out std_ulogic;
    STATUS_ADC0          : out std_logic_vector(15 downto 0);
    STATUS_ADC1          : out std_logic_vector(15 downto 0);
    STATUS_ADC2          : out std_logic_vector(15 downto 0);
    STATUS_ADC3          : out std_logic_vector(15 downto 0);
    STATUS_COMMON        : out std_logic_vector(15 downto 0);
    SYSREF_OUT_NORTH     : out std_ulogic;
    SYSREF_OUT_SOUTH     : out std_ulogic;
    ADC_CLK_N            : in std_ulogic;
    ADC_CLK_P            : in std_ulogic;
    CLK_FIFO_LM          : in std_ulogic;
    CONTROL_ADC0         : in std_logic_vector(15 downto 0);
    CONTROL_ADC1         : in std_logic_vector(15 downto 0);
    CONTROL_ADC2         : in std_logic_vector(15 downto 0);
    CONTROL_ADC3         : in std_logic_vector(15 downto 0);
    CONTROL_COMMON       : in std_logic_vector(15 downto 0);
    DADDR                : in std_logic_vector(11 downto 0);
    DCLK                 : in std_ulogic;
    DEN                  : in std_ulogic;
    DI                   : in std_logic_vector(15 downto 0);
    DWE                  : in std_ulogic;
    FABRIC_CLK           : in std_ulogic;
    PLL_MONCLK           : in std_ulogic;
    PLL_REFCLK_IN        : in std_ulogic;
    SYSREF_IN_NORTH      : in std_ulogic;
    SYSREF_IN_SOUTH      : in std_ulogic;
    SYSREF_N             : in std_ulogic;
    SYSREF_P             : in std_ulogic;
    VIN0_N               : in std_ulogic;
    VIN0_P               : in std_ulogic;
    VIN1_N               : in std_ulogic;
    VIN1_P               : in std_ulogic;
    VIN2_N               : in std_ulogic;
    VIN2_P               : in std_ulogic;
    VIN3_N               : in std_ulogic;
    VIN3_P               : in std_ulogic;
    VIN_I01_N            : in std_ulogic;
    VIN_I01_P            : in std_ulogic;
    VIN_I23_N            : in std_ulogic;
    VIN_I23_P            : in std_ulogic
  );
end HSADC;

architecture HSADC_V of HSADC is
  component SIP_HSADC
    port (
      SIM_DEVICE           : in std_logic_vector(151 downto 0);
      CLK_ADC              : out std_ulogic;
      CLK_ADC_SPARE        : out std_ulogic;
      DATA_ADC0            : out std_logic_vector(127 downto 0);
      DATA_ADC1            : out std_logic_vector(127 downto 0);
      DATA_ADC2            : out std_logic_vector(127 downto 0);
      DATA_ADC3            : out std_logic_vector(127 downto 0);
      DOUT                 : out std_logic_vector(15 downto 0);
      DRDY                 : out std_ulogic;
      PLL_DMON_OUT         : out std_ulogic;
      PLL_REFCLK_OUT       : out std_ulogic;
      PLL_SCAN_OUT_B_FD    : out std_logic_vector(1 downto 0);
      STATUS_ADC0          : out std_logic_vector(15 downto 0);
      STATUS_ADC1          : out std_logic_vector(15 downto 0);
      STATUS_ADC2          : out std_logic_vector(15 downto 0);
      STATUS_ADC3          : out std_logic_vector(15 downto 0);
      STATUS_COMMON        : out std_logic_vector(15 downto 0);
      SYSREF_OUT_NORTH     : out std_ulogic;
      SYSREF_OUT_SOUTH     : out std_ulogic;
      TEST_SO              : out std_logic_vector(299 downto 0);
      TEST_STATUS          : out std_logic_vector(15 downto 0);
      ADC_CLK_N            : in std_ulogic;
      ADC_CLK_P            : in std_ulogic;
      CLK_FIFO_LM          : in std_ulogic;
      CONTROL_ADC0         : in std_logic_vector(15 downto 0);
      CONTROL_ADC1         : in std_logic_vector(15 downto 0);
      CONTROL_ADC2         : in std_logic_vector(15 downto 0);
      CONTROL_ADC3         : in std_logic_vector(15 downto 0);
      CONTROL_COMMON       : in std_logic_vector(15 downto 0);
      DADDR                : in std_logic_vector(11 downto 0);
      DCLK                 : in std_ulogic;
      DEN                  : in std_ulogic;
      DI                   : in std_logic_vector(15 downto 0);
      DWE                  : in std_ulogic;
      FABRIC_CLK           : in std_ulogic;
      PLL_MONCLK           : in std_ulogic;
      PLL_REFCLK_IN        : in std_ulogic;
      PLL_SCAN_CLK_FD      : in std_logic_vector(1 downto 0);
      PLL_SCAN_EN_B_FD     : in std_ulogic;
      PLL_SCAN_IN_FD       : in std_logic_vector(1 downto 0);
      PLL_SCAN_MODE_B_FD   : in std_ulogic;
      PLL_SCAN_RST_EN_FD   : in std_ulogic;
      SYSREF_IN_NORTH      : in std_ulogic;
      SYSREF_IN_SOUTH      : in std_ulogic;
      SYSREF_N             : in std_ulogic;
      SYSREF_P             : in std_ulogic;
      TEST_SCAN_CLK        : in std_logic_vector(4 downto 0);
      TEST_SCAN_CTRL       : in std_logic_vector(15 downto 0);
      TEST_SCAN_MODE_B     : in std_ulogic;
      TEST_SCAN_RESET      : in std_ulogic;
      TEST_SE_B            : in std_ulogic;
      TEST_SI              : in std_logic_vector(299 downto 0);
      VIN0_N               : in real;
      VIN0_P               : in real;
      VIN1_N               : in real;
      VIN1_P               : in real;
      VIN2_N               : in real;
      VIN2_P               : in real;
      VIN3_N               : in real;
      VIN3_P               : in real;
      VIN_I01_N            : in real;
      VIN_I01_P            : in real;
      VIN_I23_N            : in real;
      VIN_I23_P            : in real;
      GSR                  : in std_ulogic
    );
  end component;

  constant MODULE_NAME : string := "HSADC";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;
  
  FUNCTION conv_string_to_slv(s: string; size: IN INTEGER) RETURN std_logic_vector IS
    CONSTANT ss: string(s'length downto 1) := s;
    VARIABLE y: std_logic_vector(size-1 downto 0) := (others => '0');
    VARIABLE p: integer;
  --- Variable to hold each character's ASCII code
    VARIABLE c: integer;
  BEGIN
    FOR i IN ss'RANGE LOOP --- scan the characters
      p := 8*i;
      c := character'pos(ss(i)); --- get the character's ASCII code
      y(p-1 downto p-8) := std_logic_vector(to_unsigned(c,8));
    end loop;
    return y;
  END conv_string_to_slv;

  -- Convert generic to signal
  constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);

-- Parameter encodings and registers

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  signal CLK_ADC_SPARE_out : std_ulogic;
  signal CLK_ADC_out : std_ulogic;
  signal DATA_ADC0_out : std_logic_vector(127 downto 0);
  signal DATA_ADC1_out : std_logic_vector(127 downto 0);
  signal DATA_ADC2_out : std_logic_vector(127 downto 0);
  signal DATA_ADC3_out : std_logic_vector(127 downto 0);
  signal DOUT_out : std_logic_vector(15 downto 0);
  signal DRDY_out : std_ulogic;
  signal PLL_DMON_OUT_out : std_ulogic;
  signal PLL_REFCLK_OUT_out : std_ulogic;
  signal PLL_SCAN_OUT_B_FD_out : std_logic_vector(1 downto 0);
  signal STATUS_ADC0_out : std_logic_vector(15 downto 0);
  signal STATUS_ADC1_out : std_logic_vector(15 downto 0);
  signal STATUS_ADC2_out : std_logic_vector(15 downto 0);
  signal STATUS_ADC3_out : std_logic_vector(15 downto 0);
  signal STATUS_COMMON_out : std_logic_vector(15 downto 0);
  signal SYSREF_OUT_NORTH_out : std_ulogic;
  signal SYSREF_OUT_SOUTH_out : std_ulogic;
  signal TEST_SO_out : std_logic_vector(299 downto 0);
  signal TEST_STATUS_out : std_logic_vector(15 downto 0);
  
  signal ADC_CLK_N_in : std_ulogic;
  signal ADC_CLK_P_in : std_ulogic;
  signal CLK_FIFO_LM_in : std_ulogic;
  signal CONTROL_ADC0_in : std_logic_vector(15 downto 0);
  signal CONTROL_ADC1_in : std_logic_vector(15 downto 0);
  signal CONTROL_ADC2_in : std_logic_vector(15 downto 0);
  signal CONTROL_ADC3_in : std_logic_vector(15 downto 0);
  signal CONTROL_COMMON_in : std_logic_vector(15 downto 0);
  signal DADDR_in : std_logic_vector(11 downto 0);
  signal DCLK_in : std_ulogic;
  signal DEN_in : std_ulogic;
  signal DI_in : std_logic_vector(15 downto 0);
  signal DWE_in : std_ulogic;
  signal FABRIC_CLK_in : std_ulogic;
  signal PLL_MONCLK_in : std_ulogic;
  signal PLL_REFCLK_IN_in : std_ulogic;
  signal PLL_SCAN_CLK_FD_in : std_logic_vector(1 downto 0);
  signal PLL_SCAN_EN_B_FD_in : std_ulogic;
  signal PLL_SCAN_IN_FD_in : std_logic_vector(1 downto 0);
  signal PLL_SCAN_MODE_B_FD_in : std_ulogic;
  signal PLL_SCAN_RST_EN_FD_in : std_ulogic;
  signal SYSREF_IN_NORTH_in : std_ulogic;
  signal SYSREF_IN_SOUTH_in : std_ulogic;
  signal SYSREF_N_in : std_ulogic;
  signal SYSREF_P_in : std_ulogic;
  signal TEST_SCAN_CLK_in : std_logic_vector(4 downto 0);
  signal TEST_SCAN_CTRL_in : std_logic_vector(15 downto 0);
  signal TEST_SCAN_MODE_B_in : std_ulogic;
  signal TEST_SCAN_RESET_in : std_ulogic;
  signal TEST_SE_B_in : std_ulogic;
  signal TEST_SI_in : std_logic_vector(299 downto 0);
  signal VIN0_N_in : std_ulogic;
  signal VIN0_P_in : std_ulogic;
  signal VIN1_N_in : std_ulogic;
  signal VIN1_P_in : std_ulogic;
  signal VIN2_N_in : std_ulogic;
  signal VIN2_P_in : std_ulogic;
  signal VIN3_N_in : std_ulogic;
  signal VIN3_P_in : std_ulogic;
  signal VIN_I01_N_in : std_ulogic;
  signal VIN_I01_P_in : std_ulogic;
  signal VIN_I23_N_in : std_ulogic;
  signal VIN_I23_P_in : std_ulogic;
  
  signal VIN0_N_real : real := 1.0;
  signal VIN0_P_real : real := 1.0;
  signal VIN1_N_real : real := 1.0;
  signal VIN1_P_real : real := 1.0;
  signal VIN2_N_real : real := 1.0;
  signal VIN2_P_real : real := 1.0;
  signal VIN3_N_real : real := 1.0;
  signal VIN3_P_real : real := 1.0;
  signal VIN_I01_N_real : real := 1.0;
  signal VIN_I01_P_real : real := 1.0;
  signal VIN_I23_N_real : real := 1.0;
  signal VIN_I23_P_real : real := 1.0;
  
  -- start behavioral body
  begin
  glblGSR     <= TO_X01(GSR);
  CLK_ADC <= CLK_ADC_out;
  DATA_ADC0 <= DATA_ADC0_out;
  DATA_ADC1 <= DATA_ADC1_out;
  DATA_ADC2 <= DATA_ADC2_out;
  DATA_ADC3 <= DATA_ADC3_out;
  DOUT <= DOUT_out;
  DRDY <= DRDY_out;
  PLL_DMON_OUT <= PLL_DMON_OUT_out;
  PLL_REFCLK_OUT <= PLL_REFCLK_OUT_out;
  STATUS_ADC0 <= STATUS_ADC0_out;
  STATUS_ADC1 <= STATUS_ADC1_out;
  STATUS_ADC2 <= STATUS_ADC2_out;
  STATUS_ADC3 <= STATUS_ADC3_out;
  STATUS_COMMON <= STATUS_COMMON_out;
  SYSREF_OUT_NORTH <= SYSREF_OUT_NORTH_out;
  SYSREF_OUT_SOUTH <= SYSREF_OUT_SOUTH_out;
  
  ADC_CLK_N_in <= ADC_CLK_N;
  ADC_CLK_P_in <= ADC_CLK_P;
  CLK_FIFO_LM_in <= CLK_FIFO_LM;
  CONTROL_ADC0_in <= CONTROL_ADC0;
  CONTROL_ADC1_in <= CONTROL_ADC1;
  CONTROL_ADC2_in <= CONTROL_ADC2;
  CONTROL_ADC3_in <= CONTROL_ADC3;
  CONTROL_COMMON_in <= CONTROL_COMMON;
  DADDR_in <= DADDR;
  DCLK_in <= DCLK;
  DEN_in <= DEN;
  DI_in <= DI;
  DWE_in <= DWE;
  FABRIC_CLK_in <= FABRIC_CLK;
  PLL_MONCLK_in <= PLL_MONCLK;
  PLL_REFCLK_IN_in <= PLL_REFCLK_IN;
  SYSREF_IN_NORTH_in <= SYSREF_IN_NORTH;
  SYSREF_IN_SOUTH_in <= SYSREF_IN_SOUTH;
  SYSREF_N_in <= SYSREF_N;
  SYSREF_P_in <= SYSREF_P;
  VIN0_N_in <= VIN0_N;
  VIN0_P_in <= VIN0_P;
  VIN1_N_in <= VIN1_N;
  VIN1_P_in <= VIN1_P;
  VIN2_N_in <= VIN2_N;
  VIN2_P_in <= VIN2_P;
  VIN3_N_in <= VIN3_N;
  VIN3_P_in <= VIN3_P;
  VIN_I01_N_in <= VIN_I01_N;
  VIN_I01_P_in <= VIN_I01_P;
  VIN_I23_N_in <= VIN_I23_N;
  VIN_I23_P_in <= VIN_I23_P;
  

  PLL_SCAN_CLK_FD_in <= "11"; -- tie off
  TEST_SCAN_CLK_in <= "11111"; -- tie off

  PLL_SCAN_EN_B_FD_in <= '1'; -- tie off
  PLL_SCAN_IN_FD_in <= "11"; -- tie off
  PLL_SCAN_MODE_B_FD_in <= '1'; -- tie off
  PLL_SCAN_RST_EN_FD_in <= '1'; -- tie off
  TEST_SCAN_CTRL_in <= "1111111111111111"; -- tie off
  TEST_SCAN_MODE_B_in <= '1'; -- tie off
  TEST_SCAN_RESET_in <= '1'; -- tie off
  TEST_SE_B_in <= '1'; -- tie off
  TEST_SI_in <= "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"; -- tie off
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HSADC_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- XPA_CFG0 check
        if((xil_attr_test) or
           ((XPA_CFG0 < 0) or (XPA_CFG0 > 65535))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-102] XPA_CFG0 attribute is set to "));
          Write ( Message, XPA_CFG0);
          Write ( Message, string'(". Legal values for this attribute are 0 to 65535. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HSADC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- XPA_CFG1 check
        if((xil_attr_test) or
           ((XPA_CFG1 < 0) or (XPA_CFG1 > 65535))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-103] XPA_CFG1 attribute is set to "));
          Write ( Message, XPA_CFG1);
          Write ( Message, string'(". Legal values for this attribute are 0 to 65535. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HSADC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- XPA_NUM_ADCS check
      if((xil_attr_test) or
         ((XPA_NUM_ADCS /= "0") and 
          (XPA_NUM_ADCS /= "1") and 
          (XPA_NUM_ADCS /= "1I") and 
          (XPA_NUM_ADCS /= "2") and 
          (XPA_NUM_ADCS /= "2I") and 
          (XPA_NUM_ADCS /= "3") and 
          (XPA_NUM_ADCS /= "4"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] XPA_NUM_ADCS attribute is set to """));
        Write ( Message, string'(XPA_NUM_ADCS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""0"", "));
        Write ( Message, string'("""1"", "));
        Write ( Message, string'("""1I"", "));
        Write ( Message, string'("""2"", "));
        Write ( Message, string'("""2I"", "));
        Write ( Message, string'("""3"" or "));
        Write ( Message, string'("""4"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HSADC_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- XPA_NUM_DDCS check
        if((xil_attr_test) or
           ((XPA_NUM_DDCS < 0) or (XPA_NUM_DDCS > 4))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-105] XPA_NUM_DDCS attribute is set to "));
          Write ( Message, XPA_NUM_DDCS);
          Write ( Message, string'(". Legal values for this attribute are 0 to 4. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HSADC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- XPA_PLL_USED check
      if((xil_attr_test) or
         ((XPA_PLL_USED /= "No") and 
          (XPA_PLL_USED /= "Yes"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] XPA_PLL_USED attribute is set to """));
        Write ( Message, string'(XPA_PLL_USED));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""No"" or "));
        Write ( Message, string'("""Yes"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(HSADC_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- XPA_SAMPLE_RATE_MSPS check
        if((xil_attr_test) or
           ((XPA_SAMPLE_RATE_MSPS < 0) or (XPA_SAMPLE_RATE_MSPS > 10000))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-107] XPA_SAMPLE_RATE_MSPS attribute is set to "));
          Write ( Message, XPA_SAMPLE_RATE_MSPS);
          Write ( Message, string'(". Legal values for this attribute are 0 to 10000. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HSADC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-108] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HSADC_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    SIP_HSADC_INST : SIP_HSADC
      port map (
        SIM_DEVICE           => SIM_DEVICE_BIN,
        CLK_ADC              => CLK_ADC_out,
        CLK_ADC_SPARE        => CLK_ADC_SPARE_out,
        DATA_ADC0            => DATA_ADC0_out,
        DATA_ADC1            => DATA_ADC1_out,
        DATA_ADC2            => DATA_ADC2_out,
        DATA_ADC3            => DATA_ADC3_out,
        DOUT                 => DOUT_out,
        DRDY                 => DRDY_out,
        PLL_DMON_OUT         => PLL_DMON_OUT_out,
        PLL_REFCLK_OUT       => PLL_REFCLK_OUT_out,
        PLL_SCAN_OUT_B_FD    => PLL_SCAN_OUT_B_FD_out,
        STATUS_ADC0          => STATUS_ADC0_out,
        STATUS_ADC1          => STATUS_ADC1_out,
        STATUS_ADC2          => STATUS_ADC2_out,
        STATUS_ADC3          => STATUS_ADC3_out,
        STATUS_COMMON        => STATUS_COMMON_out,
        SYSREF_OUT_NORTH     => SYSREF_OUT_NORTH_out,
        SYSREF_OUT_SOUTH     => SYSREF_OUT_SOUTH_out,
        TEST_SO              => TEST_SO_out,
        TEST_STATUS          => TEST_STATUS_out,
        ADC_CLK_N            => ADC_CLK_N_in,
        ADC_CLK_P            => ADC_CLK_P_in,
        CLK_FIFO_LM          => CLK_FIFO_LM_in,
        CONTROL_ADC0         => CONTROL_ADC0_in,
        CONTROL_ADC1         => CONTROL_ADC1_in,
        CONTROL_ADC2         => CONTROL_ADC2_in,
        CONTROL_ADC3         => CONTROL_ADC3_in,
        CONTROL_COMMON       => CONTROL_COMMON_in,
        DADDR                => DADDR_in,
        DCLK                 => DCLK_in,
        DEN                  => DEN_in,
        DI                   => DI_in,
        DWE                  => DWE_in,
        FABRIC_CLK           => FABRIC_CLK_in,
        PLL_MONCLK           => PLL_MONCLK_in,
        PLL_REFCLK_IN        => PLL_REFCLK_IN_in,
        PLL_SCAN_CLK_FD      => PLL_SCAN_CLK_FD_in,
        PLL_SCAN_EN_B_FD     => PLL_SCAN_EN_B_FD_in,
        PLL_SCAN_IN_FD       => PLL_SCAN_IN_FD_in,
        PLL_SCAN_MODE_B_FD   => PLL_SCAN_MODE_B_FD_in,
        PLL_SCAN_RST_EN_FD   => PLL_SCAN_RST_EN_FD_in,
        SYSREF_IN_NORTH      => SYSREF_IN_NORTH_in,
        SYSREF_IN_SOUTH      => SYSREF_IN_SOUTH_in,
        SYSREF_N             => SYSREF_N_in,
        SYSREF_P             => SYSREF_P_in,
        TEST_SCAN_CLK        => TEST_SCAN_CLK_in,
        TEST_SCAN_CTRL       => TEST_SCAN_CTRL_in,
        TEST_SCAN_MODE_B     => TEST_SCAN_MODE_B_in,
        TEST_SCAN_RESET      => TEST_SCAN_RESET_in,
        TEST_SE_B            => TEST_SE_B_in,
        TEST_SI              => TEST_SI_in,
        VIN0_N               => VIN0_N_real,
        VIN0_P               => VIN0_P_real,
        VIN1_N               => VIN1_N_real,
        VIN1_P               => VIN1_P_real,
        VIN2_N               => VIN2_N_real,
        VIN2_P               => VIN2_P_real,
        VIN3_N               => VIN3_N_real,
        VIN3_P               => VIN3_P_real,
        VIN_I01_N            => VIN_I01_N_real,
        VIN_I01_P            => VIN_I01_P_real,
        VIN_I23_N            => VIN_I23_N_real,
        VIN_I23_P            => VIN_I23_P_real,
        GSR                  => glblGSR        
      );
  end HSADC_V;
