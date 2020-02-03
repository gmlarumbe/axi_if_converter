-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        OSERDESE3
-- /___/   /\      Filename    : OSERDESE3.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL OSERDESE3 -----

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

entity OSERDESE3 is
  generic (
    DATA_WIDTH : integer := 8;
    INIT : bit := '0';
    IS_CLKDIV_INVERTED : bit := '0';
    IS_CLK_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    ODDR_MODE : string := "FALSE";
    OSERDES_D_BYPASS : string := "FALSE";
    OSERDES_T_BYPASS : string := "FALSE";
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0
  );
  
  port (
    OQ                   : out std_ulogic;
    T_OUT                : out std_ulogic;
    CLK                  : in std_ulogic;
    CLKDIV               : in std_ulogic;
    D                    : in std_logic_vector(7 downto 0);
    RST                  : in std_ulogic;
    T                    : in std_ulogic
  );
end OSERDESE3;

architecture OSERDESE3_V of OSERDESE3 is
  component SIP_OSERDESE3_K2
    
    port (
        DATA_WIDTH           : in std_logic_vector(3 downto 0);
        INIT                 : in std_logic_vector(0 downto 0);
        ODDR_MODE            : in std_logic_vector(39 downto 0);
        OSERDES_D_BYPASS     : in std_logic_vector(39 downto 0);
        OSERDES_T_BYPASS     : in std_logic_vector(39 downto 0);
        SIM_VERSION          : in std_logic_vector(63 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        OQ                   : out std_ulogic;
        T_OUT                : out std_ulogic;
        CLK                  : in std_ulogic;
        CLKDIV               : in std_ulogic;
        D                    : in std_logic_vector(7 downto 0);
        OFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        T                    : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;
  component SIP_OSERDESE3_D1

    port (
        DATA_WIDTH           : in std_logic_vector(3 downto 0);
        INIT                 : in std_logic_vector(0 downto 0);
        ODDR_MODE            : in std_logic_vector(39 downto 0);
        OSERDES_D_BYPASS     : in std_logic_vector(39 downto 0);
        OSERDES_ENABLE       : in std_logic_vector(39 downto 0);
        OSERDES_T_BYPASS     : in std_logic_vector(39 downto 0);
        SPARE                : in std_logic_vector(1 downto 0);
        TBYTE_CTL            : in std_logic_vector(63 downto 0);
        OQ                   : out std_ulogic;
        T_OUT                : out std_ulogic;
        CLK                  : in std_ulogic;
        CLKDIV               : in std_ulogic;
        D                    : in std_logic_vector(7 downto 0);
        OFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        T                    : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;
    
    constant MODULE_NAME : string := "OSERDESE3";
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
    constant ODDR_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(ODDR_MODE,40);
    constant OSERDES_D_BYPASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(OSERDES_D_BYPASS,40);
    constant OSERDES_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("TRUE",40);
    constant OSERDES_T_BYPASS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(OSERDES_T_BYPASS,40);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);
    constant TBYTE_CTL_BIN : std_logic_vector(63 downto 0) := conv_string_to_slv("T",64);

    constant DATA_WIDTH_BIN : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(DATA_WIDTH,4));
    constant INIT_BIN : std_logic_vector(0 downto 0) := (0=>TO_X01(INIT));
    constant SIM_VERSION_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(SIM_VERSION * 1000.0),64));
    constant SPARE_BIN : std_logic_vector(1 downto 0) := "00";
    signal IS_CLKDIV_INVERTED_BIN : std_ulogic := TO_X01(IS_CLKDIV_INVERTED);    signal IS_CLK_INVERTED_BIN : std_ulogic := TO_X01(IS_CLK_INVERTED);    signal IS_RST_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_INVERTED);
  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed

    signal OQ_out : std_logic;
    signal T_OUT_out : std_logic;
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CLKDIV_in : std_ulogic;
    signal CLK_in : std_ulogic;
    signal D_in : std_logic_vector(7 downto 0);
    signal OFD_CE_in : std_ulogic;
    signal RST_in : std_ulogic;
    signal T_in : std_ulogic;
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    OQ <= OQ_out after OUT_DELAY;
    T_OUT <= T_OUT_out after OUT_DELAY;
    
    CLKDIV_in <= CLKDIV xor IS_CLKDIV_INVERTED_BIN;
    CLK_in <= CLK xor IS_CLK_INVERTED_BIN;
    D_in <= D;
    RST_in <= RST xor IS_RST_INVERTED_BIN;
    T_in <= '0' when (T = 'U') else T; -- rv 0
    


    OFD_CE_in <= '0'; -- tie off
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DATA_WIDTH check
      if((xil_attr_test) or
         ((DATA_WIDTH /= 8) and 
          (DATA_WIDTH /= 4))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] DATA_WIDTH attribute is set to "));
        Write ( Message, DATA_WIDTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("8 or "));
        Write ( Message, string'("4. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OSERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ODDR_MODE check
      if((xil_attr_test) or
         ((ODDR_MODE /= "FALSE") and 
          (ODDR_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] ODDR_MODE attribute is set to """));
        Write ( Message, string'(ODDR_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OSERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- OSERDES_D_BYPASS check
      if((xil_attr_test) or
         ((OSERDES_D_BYPASS /= "FALSE") and 
          (OSERDES_D_BYPASS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-107] OSERDES_D_BYPASS attribute is set to """));
        Write ( Message, string'(OSERDES_D_BYPASS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OSERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- OSERDES_T_BYPASS check
      if((xil_attr_test) or
         ((OSERDES_T_BYPASS /= "FALSE") and 
          (OSERDES_T_BYPASS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-109] OSERDES_T_BYPASS attribute is set to """));
        Write ( Message, string'(OSERDES_T_BYPASS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OSERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-110] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OSERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_VERSION check
      if((xil_attr_test) or
         ((SIM_VERSION /= 2.0) and 
          (SIM_VERSION /= 1.0))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] SIM_VERSION attribute is set to "));
        Write ( Message, SIM_VERSION);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("2.0 or "));
        Write ( Message, string'("1.0. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OSERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-107] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(OSERDESE3_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
   D1_OS_inst : if ((SIM_DEVICE = "ULTRASCALE_PLUS") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES2")) generate
    OSERDESE3_INST : SIP_OSERDESE3_D1
      port map (
        DATA_WIDTH           => DATA_WIDTH_BIN,
        INIT                 => INIT_BIN,
        ODDR_MODE            => ODDR_MODE_BIN,
        OSERDES_D_BYPASS     => OSERDES_D_BYPASS_BIN,
        OSERDES_ENABLE       => OSERDES_ENABLE_BIN,
        OSERDES_T_BYPASS     => OSERDES_T_BYPASS_BIN,
        SPARE                => SPARE_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        OQ                   => OQ_out,
        T_OUT                => T_OUT_out,
        CLK                  => CLK_in,
        CLKDIV               => CLKDIV_in,
        D                    => D_in,
        OFD_CE               => OFD_CE_in,
        RST                  => RST_in,
        T                    => T_in,
        GSR                  => glblGSR
      );
  end generate D1_OS_inst;
  K2_OS_inst : if (SIM_DEVICE = "ULTRASCALE") generate
    OSERDESE3_INST : SIP_OSERDESE3_K2
      port map (
        DATA_WIDTH           => DATA_WIDTH_BIN,
        INIT                 => INIT_BIN,
        ODDR_MODE            => ODDR_MODE_BIN,
        OSERDES_D_BYPASS     => OSERDES_D_BYPASS_BIN,
        OSERDES_T_BYPASS     => OSERDES_T_BYPASS_BIN,
        SIM_VERSION          => SIM_VERSION_BIN,
        TBYTE_CTL            => TBYTE_CTL_BIN,
        OQ                   => OQ_out,
        T_OUT                => T_OUT_out,
        CLK                  => CLK_in,
        CLKDIV               => CLKDIV_in,
        D                    => D_in,
        OFD_CE               => OFD_CE_in,
        RST                  => RST_in,
        T                    => T_in,
        GSR                  => glblGSR        
      );
   end generate K2_OS_inst;
  end OSERDESE3_V;
