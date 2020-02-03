-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2016.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        ISERDESE3
-- /___/   /\      Filename    : ISERDESE3.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL ISERDESE3 -----

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

entity ISERDESE3 is
  generic (
    DATA_WIDTH : integer := 8;
    DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
    FIFO_ENABLE : string := "FALSE";
    FIFO_SYNC_MODE : string := "FALSE";
    IDDR_MODE : string := "FALSE";
    IS_CLK_B_INVERTED : bit := '0';
    IS_CLK_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0
  );
  
  port (
    FIFO_EMPTY           : out std_ulogic;
    INTERNAL_DIVCLK      : out std_ulogic;
    Q                    : out std_logic_vector(7 downto 0);
    CLK                  : in std_ulogic;
    CLKDIV               : in std_ulogic;
    CLK_B                : in std_ulogic;
    D                    : in std_ulogic;
    FIFO_RD_CLK          : in std_ulogic;
    FIFO_RD_EN           : in std_ulogic;
    RST                  : in std_ulogic
  );
end ISERDESE3;

architecture ISERDESE3_V of ISERDESE3 is
  component SIP_ISERDESE3_D1
    
    port (
        DATA_WIDTH           : in std_logic_vector(3 downto 0);
        DDR_CLK_EDGE         : in std_logic_vector(151 downto 0);
        DDR_DIS_DQS          : in std_logic_vector(39 downto 0);
        FIFO_ENABLE          : in std_logic_vector(39 downto 0);
        FIFO_SYNC_MODE       : in std_logic_vector(39 downto 0);
        IDDR_MODE            : in std_logic_vector(39 downto 0);
        SPARE                : in std_logic_vector(1 downto 0);
        FIFO_EMPTY           : out std_ulogic;
        INTERNAL_DIVCLK      : out std_ulogic;
        Q                    : out std_logic_vector(7 downto 0);
        CLK                  : in std_ulogic;
        CLKDIV               : in std_ulogic;
        CLK_B                : in std_ulogic;
        D                    : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;

  component SIP_ISERDESE3
    
    port (
        DATA_WIDTH           : in std_logic_vector(3 downto 0);
        DDR_CLK_EDGE         : in std_logic_vector(151 downto 0);
        DDR_DIS_DQS          : in std_logic_vector(39 downto 0);
        FIFO_ENABLE          : in std_logic_vector(39 downto 0);
        FIFO_SYNC_MODE       : in std_logic_vector(39 downto 0);
        IDDR_MODE            : in std_logic_vector(39 downto 0);
        SIM_VERSION          : in std_logic_vector(63 downto 0);
        FIFO_EMPTY           : out std_ulogic;
        INTERNAL_DIVCLK      : out std_ulogic;
        Q                    : out std_logic_vector(7 downto 0);
        CLK                  : in std_ulogic;
        CLKDIV               : in std_ulogic;
        CLK_B                : in std_ulogic;
        D                    : in std_ulogic;
        FIFO_RD_CLK          : in std_ulogic;
        FIFO_RD_EN           : in std_ulogic;
        IFD_CE               : in std_ulogic;
        RST                  : in std_ulogic;
        GSR                  : in std_ulogic
      );
    end component;
    
    constant MODULE_NAME : string := "ISERDESE3";
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
    constant DDR_CLK_EDGE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(DDR_CLK_EDGE,152);
    constant DDR_DIS_DQS_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv("FALSE",40);
    constant FIFO_ENABLE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(FIFO_ENABLE,40);
    constant FIFO_SYNC_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(FIFO_SYNC_MODE,40);
    constant IDDR_MODE_BIN : std_logic_vector(39 downto 0) := conv_string_to_slv(IDDR_MODE,40);
    constant SIM_DEVICE_BIN : std_logic_vector(151 downto 0) := conv_string_to_slv(SIM_DEVICE,152);

    constant DATA_WIDTH_BIN : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(DATA_WIDTH,4));
    constant SIM_VERSION_BIN : std_logic_vector (63 downto 0) := std_logic_vector(to_unsigned(integer(SIM_VERSION * 1000.0),64));
    constant SPARE_BIN : std_logic_vector(1 downto 0) := "00";
    signal IS_CLK_B_INVERTED_BIN : std_ulogic := TO_X01(IS_CLK_B_INVERTED);    signal IS_CLK_INVERTED_BIN : std_ulogic := TO_X01(IS_CLK_INVERTED);    signal IS_RST_INVERTED_BIN : std_ulogic := TO_X01(IS_RST_INVERTED);
  -- Parameter encodings and registers

    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    -- internal signal declarations
    -- _out used in behavioral logic, can take an init value
    -- continuous assignment to out pin may effect simulation speed

    signal FIFO_EMPTY_out : std_logic;
    signal INTERNAL_DIVCLK_out : std_logic;
    signal Q_out : std_logic_vector(7 downto 0);
    
    -- _in optional if no pins have a required value
    -- continuous assignment to _in clocks effect simulation speed
    signal CLKDIV_in : std_ulogic;
    signal CLK_B_in : std_ulogic;
    signal CLK_in : std_ulogic;
    signal D_in : std_ulogic;
    signal FIFO_RD_CLK_in : std_ulogic;
    signal FIFO_RD_EN_in : std_ulogic;
    signal IFD_CE_in : std_ulogic;
    signal RST_in : std_ulogic;
    
    
    -- start behavioral body
    -- common declarations first, INIT PROC, then functional
    begin
    glblGSR     <= TO_X01(GSR);
    FIFO_EMPTY <= FIFO_EMPTY_out after OUT_DELAY;
    INTERNAL_DIVCLK <= INTERNAL_DIVCLK_out after OUT_DELAY;
    Q <= Q_out after OUT_DELAY;
    
    CLKDIV_in <= CLKDIV;
    CLK_B_in <= CLK_B xor IS_CLK_B_INVERTED_BIN;
    CLK_in <= CLK xor IS_CLK_INVERTED_BIN;
    D_in <= D;
    FIFO_RD_CLK_in <= FIFO_RD_CLK;
    FIFO_RD_EN_in <= FIFO_RD_EN;
    RST_in <= RST xor IS_RST_INVERTED_BIN;
    


    IFD_CE_in <= '0'; -- tie off
  
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
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DDR_CLK_EDGE check
      if((xil_attr_test) or
         ((DDR_CLK_EDGE /= "OPPOSITE_EDGE") and 
          (DDR_CLK_EDGE /= "SAME_EDGE") and 
          (DDR_CLK_EDGE /= "SAME_EDGE_PIPELINED"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] DDR_CLK_EDGE attribute is set to """));
        Write ( Message, string'(DDR_CLK_EDGE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""OPPOSITE_EDGE"", "));
        Write ( Message, string'("""SAME_EDGE"" or "));
        Write ( Message, string'("""SAME_EDGE_PIPELINED"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- FIFO_ENABLE check
      if((xil_attr_test) or
         ((FIFO_ENABLE /= "FALSE") and 
          (FIFO_ENABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] FIFO_ENABLE attribute is set to """));
        Write ( Message, string'(FIFO_ENABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- FIFO_SYNC_MODE check
      if((xil_attr_test) or
         ((FIFO_SYNC_MODE /= "FALSE") and 
          (FIFO_SYNC_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] FIFO_SYNC_MODE attribute is set to """));
        Write ( Message, string'(FIFO_SYNC_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IDDR_MODE check
      if((xil_attr_test) or
         ((IDDR_MODE /= "FALSE") and 
          (IDDR_MODE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] IDDR_MODE attribute is set to """));
        Write ( Message, string'(IDDR_MODE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
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
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
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
        Write ( Message, string'(ISERDESE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-108] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ISERDESE3_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

  D1_IS_inst : if ((SIM_DEVICE = "ULTRASCALE_PLUS") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") or (SIM_DEVICE = "ULTRASCALE_PLUS_ES2"))  generate
    ISERDESE3_INST : SIP_ISERDESE3_D1
      port map (
        DATA_WIDTH           => DATA_WIDTH_BIN,
        DDR_CLK_EDGE         => DDR_CLK_EDGE_BIN,
        DDR_DIS_DQS          => DDR_DIS_DQS_BIN,
        FIFO_ENABLE          => FIFO_ENABLE_BIN,
        FIFO_SYNC_MODE       => FIFO_SYNC_MODE_BIN,
        IDDR_MODE            => IDDR_MODE_BIN,
        SPARE                => SPARE_BIN,
        FIFO_EMPTY           => FIFO_EMPTY_out,
        INTERNAL_DIVCLK      => INTERNAL_DIVCLK_out,
        Q                    => Q_out,
        CLK                  => CLK_in,
        CLKDIV               => CLKDIV_in,
        CLK_B                => CLK_B_in,
        D                    => D_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        RST                  => RST_in,
        GSR                  => glblGSR        
      );
   end generate D1_IS_inst;
   V3T_IS_inst : if (SIM_DEVICE = "ULTRASCALE") generate

    ISERDESE3_INST : SIP_ISERDESE3
      port map (
        DATA_WIDTH           => DATA_WIDTH_BIN,
        DDR_CLK_EDGE         => DDR_CLK_EDGE_BIN,
        DDR_DIS_DQS          => DDR_DIS_DQS_BIN,
        FIFO_ENABLE          => FIFO_ENABLE_BIN,
        FIFO_SYNC_MODE       => FIFO_SYNC_MODE_BIN,
        IDDR_MODE            => IDDR_MODE_BIN,
        SIM_VERSION          => SIM_VERSION_BIN,
        FIFO_EMPTY           => FIFO_EMPTY_out,
        INTERNAL_DIVCLK      => INTERNAL_DIVCLK_out,
        Q                    => Q_out,
        CLK                  => CLK_in,
        CLKDIV               => CLKDIV_in,
        CLK_B                => CLK_B_in,
        D                    => D_in,
        FIFO_RD_CLK          => FIFO_RD_CLK_in,
        FIFO_RD_EN           => FIFO_RD_EN_in,
        IFD_CE               => IFD_CE_in,
        RST                  => RST_in,
        GSR                  => glblGSR        
      );
   end generate V3T_IS_inst;
  end ISERDESE3_V;
