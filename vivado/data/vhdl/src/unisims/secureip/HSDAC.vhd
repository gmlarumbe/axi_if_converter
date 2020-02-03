-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2017.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        HSDAC
-- /___/   /\      Filename    : HSDAC.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL HSDAC -----

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

entity HSDAC is
  generic (
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    XPA_CFG0 : integer := 0;
    XPA_CFG1 : integer := 0;
    XPA_NUM_DACS : integer := 0;
    XPA_NUM_DUCS : integer := 0;
    XPA_PLL_USED : string := "No";
    XPA_SAMPLE_RATE_MSPS : integer := 0
  );
  
  port (
    CLK_DAC              : out std_ulogic;
    DOUT                 : out std_logic_vector(15 downto 0);
    DRDY                 : out std_ulogic;
    PLL_DMON_OUT         : out std_ulogic;
    PLL_REFCLK_OUT       : out std_ulogic;
    STATUS_COMMON        : out std_logic_vector(15 downto 0);
    STATUS_DAC0          : out std_logic_vector(15 downto 0);
    STATUS_DAC1          : out std_logic_vector(15 downto 0);
    STATUS_DAC2          : out std_logic_vector(15 downto 0);
    STATUS_DAC3          : out std_logic_vector(15 downto 0);
    SYSREF_OUT_NORTH     : out std_ulogic;
    SYSREF_OUT_SOUTH     : out std_ulogic;
    VOUT0_N              : out std_ulogic;
    VOUT0_P              : out std_ulogic;
    VOUT1_N              : out std_ulogic;
    VOUT1_P              : out std_ulogic;
    VOUT2_N              : out std_ulogic;
    VOUT2_P              : out std_ulogic;
    VOUT3_N              : out std_ulogic;
    VOUT3_P              : out std_ulogic;
    CLK_FIFO_LM          : in std_ulogic;
    CONTROL_COMMON       : in std_logic_vector(15 downto 0);
    CONTROL_DAC0         : in std_logic_vector(15 downto 0);
    CONTROL_DAC1         : in std_logic_vector(15 downto 0);
    CONTROL_DAC2         : in std_logic_vector(15 downto 0);
    CONTROL_DAC3         : in std_logic_vector(15 downto 0);
    DAC_CLK_N            : in std_ulogic;
    DAC_CLK_P            : in std_ulogic;
    DADDR                : in std_logic_vector(11 downto 0);
    DATA_DAC0            : in std_logic_vector(255 downto 0);
    DATA_DAC1            : in std_logic_vector(255 downto 0);
    DATA_DAC2            : in std_logic_vector(255 downto 0);
    DATA_DAC3            : in std_logic_vector(255 downto 0);
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
    SYSREF_P             : in std_ulogic
  );
end HSDAC;

architecture HSDAC_V of HSDAC is
  component SIP_HSDAC
    port (
      SIM_DEVICE           : in std_logic_vector(151 downto 0);
      CLK_DAC              : out std_ulogic;
      CLK_DAC_SPARE        : out std_ulogic;
      DOUT                 : out std_logic_vector(15 downto 0);
      DRDY                 : out std_ulogic;
      PLL_DMON_OUT         : out std_ulogic;
      PLL_REFCLK_OUT       : out std_ulogic;
      PLL_SCAN_OUT_B_FD    : out std_logic_vector(1 downto 0);
      STATUS_COMMON        : out std_logic_vector(15 downto 0);
      STATUS_DAC0          : out std_logic_vector(15 downto 0);
      STATUS_DAC1          : out std_logic_vector(15 downto 0);
      STATUS_DAC2          : out std_logic_vector(15 downto 0);
      STATUS_DAC3          : out std_logic_vector(15 downto 0);
      SYSREF_OUT_NORTH     : out std_ulogic;
      SYSREF_OUT_SOUTH     : out std_ulogic;
      TEST_SO              : out std_logic_vector(299 downto 0);
      TEST_STATUS          : out std_logic_vector(15 downto 0);
      VOUT0_N              : out real;
      VOUT0_P              : out real;
      VOUT1_N              : out real;
      VOUT1_P              : out real;
      VOUT2_N              : out real;
      VOUT2_P              : out real;
      VOUT3_N              : out real;
      VOUT3_P              : out real;
      CLK_FIFO_LM          : in std_ulogic;
      CONTROL_COMMON       : in std_logic_vector(15 downto 0);
      CONTROL_DAC0         : in std_logic_vector(15 downto 0);
      CONTROL_DAC1         : in std_logic_vector(15 downto 0);
      CONTROL_DAC2         : in std_logic_vector(15 downto 0);
      CONTROL_DAC3         : in std_logic_vector(15 downto 0);
      DAC_CLK_N            : in std_ulogic;
      DAC_CLK_P            : in std_ulogic;
      DADDR                : in std_logic_vector(11 downto 0);
      DATA_DAC0            : in std_logic_vector(255 downto 0);
      DATA_DAC1            : in std_logic_vector(255 downto 0);
      DATA_DAC2            : in std_logic_vector(255 downto 0);
      DATA_DAC3            : in std_logic_vector(255 downto 0);
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
      GSR                  : in std_ulogic
    );
  end component;

  constant MODULE_NAME : string := "HSDAC";
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
  signal CLK_DAC_SPARE_out : std_ulogic;
  signal CLK_DAC_out : std_ulogic;
  signal DOUT_out : std_logic_vector(15 downto 0);
  signal DRDY_out : std_ulogic;
  signal PLL_DMON_OUT_out : std_ulogic;
  signal PLL_REFCLK_OUT_out : std_ulogic;
  signal PLL_SCAN_OUT_B_FD_out : std_logic_vector(1 downto 0);
  signal STATUS_COMMON_out : std_logic_vector(15 downto 0);
  signal STATUS_DAC0_out : std_logic_vector(15 downto 0);
  signal STATUS_DAC1_out : std_logic_vector(15 downto 0);
  signal STATUS_DAC2_out : std_logic_vector(15 downto 0);
  signal STATUS_DAC3_out : std_logic_vector(15 downto 0);
  signal SYSREF_OUT_NORTH_out : std_ulogic;
  signal SYSREF_OUT_SOUTH_out : std_ulogic;
  signal TEST_SO_out : std_logic_vector(299 downto 0);
  signal TEST_STATUS_out : std_logic_vector(15 downto 0);
  signal VOUT0_N_out : std_ulogic;
  signal VOUT0_P_out : std_ulogic;
  signal VOUT1_N_out : std_ulogic;
  signal VOUT1_P_out : std_ulogic;
  signal VOUT2_N_out : std_ulogic;
  signal VOUT2_P_out : std_ulogic;
  signal VOUT3_N_out : std_ulogic;
  signal VOUT3_P_out : std_ulogic;
  
  signal CLK_FIFO_LM_in : std_ulogic;
  signal CONTROL_COMMON_in : std_logic_vector(15 downto 0);
  signal CONTROL_DAC0_in : std_logic_vector(15 downto 0);
  signal CONTROL_DAC1_in : std_logic_vector(15 downto 0);
  signal CONTROL_DAC2_in : std_logic_vector(15 downto 0);
  signal CONTROL_DAC3_in : std_logic_vector(15 downto 0);
  signal DAC_CLK_N_in : std_ulogic;
  signal DAC_CLK_P_in : std_ulogic;
  signal DADDR_in : std_logic_vector(11 downto 0);
  signal DATA_DAC0_in : std_logic_vector(255 downto 0);
  signal DATA_DAC1_in : std_logic_vector(255 downto 0);
  signal DATA_DAC2_in : std_logic_vector(255 downto 0);
  signal DATA_DAC3_in : std_logic_vector(255 downto 0);
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
  
  signal VOUT0_N_real : real;
  signal VOUT0_P_real : real;
  signal VOUT1_N_real : real;
  signal VOUT1_P_real : real;
  signal VOUT2_N_real : real;
  signal VOUT2_P_real : real;
  signal VOUT3_N_real : real;
  signal VOUT3_P_real : real;
  
  -- start behavioral body
  begin
  glblGSR     <= TO_X01(GSR);
  CLK_DAC <= CLK_DAC_out;
  DOUT <= DOUT_out;
  DRDY <= DRDY_out;
  PLL_DMON_OUT <= PLL_DMON_OUT_out;
  PLL_REFCLK_OUT <= PLL_REFCLK_OUT_out;
  STATUS_COMMON <= STATUS_COMMON_out;
  STATUS_DAC0 <= STATUS_DAC0_out;
  STATUS_DAC1 <= STATUS_DAC1_out;
  STATUS_DAC2 <= STATUS_DAC2_out;
  STATUS_DAC3 <= STATUS_DAC3_out;
  SYSREF_OUT_NORTH <= SYSREF_OUT_NORTH_out;
  SYSREF_OUT_SOUTH <= SYSREF_OUT_SOUTH_out;
  VOUT0_N <= VOUT0_N_out;
  VOUT0_P <= VOUT0_P_out;
  VOUT1_N <= VOUT1_N_out;
  VOUT1_P <= VOUT1_P_out;
  VOUT2_N <= VOUT2_N_out;
  VOUT2_P <= VOUT2_P_out;
  VOUT3_N <= VOUT3_N_out;
  VOUT3_P <= VOUT3_P_out;
  
  CLK_FIFO_LM_in <= CLK_FIFO_LM;
  CONTROL_COMMON_in <= CONTROL_COMMON;
  CONTROL_DAC0_in <= CONTROL_DAC0;
  CONTROL_DAC1_in <= CONTROL_DAC1;
  CONTROL_DAC2_in <= CONTROL_DAC2;
  CONTROL_DAC3_in <= CONTROL_DAC3;
  DAC_CLK_N_in <= DAC_CLK_N;
  DAC_CLK_P_in <= DAC_CLK_P;
  DADDR_in <= DADDR;
  DATA_DAC0_in <= DATA_DAC0;
  DATA_DAC1_in <= DATA_DAC1;
  DATA_DAC2_in <= DATA_DAC2;
  DATA_DAC3_in <= DATA_DAC3;
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
        Write ( Message, string'(HSDAC_V'PATH_NAME));
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
          Write ( Message, string'(HSDAC_V'PATH_NAME));
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
          Write ( Message, string'(HSDAC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- XPA_NUM_DACS check
        if((xil_attr_test) or
           ((XPA_NUM_DACS < 0) or (XPA_NUM_DACS > 4))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-104] XPA_NUM_DACS attribute is set to "));
          Write ( Message, XPA_NUM_DACS);
          Write ( Message, string'(". Legal values for this attribute are 0 to 4. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HSDAC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- XPA_NUM_DUCS check
        if((xil_attr_test) or
           ((XPA_NUM_DUCS < 0) or (XPA_NUM_DUCS > 4))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-105] XPA_NUM_DUCS attribute is set to "));
          Write ( Message, XPA_NUM_DUCS);
          Write ( Message, string'(". Legal values for this attribute are 0 to 4. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(HSDAC_V'PATH_NAME));
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
        Write ( Message, string'(HSDAC_V'PATH_NAME));
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
          Write ( Message, string'(HSDAC_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-108] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(HSDAC_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    SIP_HSDAC_INST : SIP_HSDAC
      port map (
        SIM_DEVICE           => SIM_DEVICE_BIN,
        CLK_DAC              => CLK_DAC_out,
        CLK_DAC_SPARE        => CLK_DAC_SPARE_out,
        DOUT                 => DOUT_out,
        DRDY                 => DRDY_out,
        PLL_DMON_OUT         => PLL_DMON_OUT_out,
        PLL_REFCLK_OUT       => PLL_REFCLK_OUT_out,
        PLL_SCAN_OUT_B_FD    => PLL_SCAN_OUT_B_FD_out,
        STATUS_COMMON        => STATUS_COMMON_out,
        STATUS_DAC0          => STATUS_DAC0_out,
        STATUS_DAC1          => STATUS_DAC1_out,
        STATUS_DAC2          => STATUS_DAC2_out,
        STATUS_DAC3          => STATUS_DAC3_out,
        SYSREF_OUT_NORTH     => SYSREF_OUT_NORTH_out,
        SYSREF_OUT_SOUTH     => SYSREF_OUT_SOUTH_out,
        TEST_SO              => TEST_SO_out,
        TEST_STATUS          => TEST_STATUS_out,
        VOUT0_N              => VOUT0_N_real,
        VOUT0_P              => VOUT0_P_real,
        VOUT1_N              => VOUT1_N_real,
        VOUT1_P              => VOUT1_P_real,
        VOUT2_N              => VOUT2_N_real,
        VOUT2_P              => VOUT2_P_real,
        VOUT3_N              => VOUT3_N_real,
        VOUT3_P              => VOUT3_P_real,
        CLK_FIFO_LM          => CLK_FIFO_LM_in,
        CONTROL_COMMON       => CONTROL_COMMON_in,
        CONTROL_DAC0         => CONTROL_DAC0_in,
        CONTROL_DAC1         => CONTROL_DAC1_in,
        CONTROL_DAC2         => CONTROL_DAC2_in,
        CONTROL_DAC3         => CONTROL_DAC3_in,
        DAC_CLK_N            => DAC_CLK_N_in,
        DAC_CLK_P            => DAC_CLK_P_in,
        DADDR                => DADDR_in,
        DATA_DAC0            => DATA_DAC0_in,
        DATA_DAC1            => DATA_DAC1_in,
        DATA_DAC2            => DATA_DAC2_in,
        DATA_DAC3            => DATA_DAC3_in,
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
        GSR                  => glblGSR        
      );
  end HSDAC_V;
