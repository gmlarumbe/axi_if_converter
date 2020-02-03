-------------------------------------------------------------------------------
-- Copyright (c) 1995/2016 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2016.3
--  \   \         Description : Xilinx Unified Simulation Library Component
--  /   /                       Xilinx Analog-to-Digital Converter and System Monitor
-- /___/   /\     Filename    : SYSMONE1.vhd
-- \   \  /  \    Timestamp   :
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--                    
-- End Revision
-------------------------------------------------------------------------------
----- CELL SYSMONE1 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;


library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity SYSMONE1 is

generic (

  INIT_40 : bit_vector := X"0000";
  INIT_41 : bit_vector := X"0000";
  INIT_42 : bit_vector := X"0000";
  INIT_43 : bit_vector := X"0000";
  INIT_44 : bit_vector := X"0000";
  INIT_45 : bit_vector := X"0000";
  INIT_46 : bit_vector := X"0000";
  INIT_47 : bit_vector := X"0000";
  INIT_48 : bit_vector := X"0000";
  INIT_49 : bit_vector := X"0000";
  INIT_4A : bit_vector := X"0000";
  INIT_4B : bit_vector := X"0000";
  INIT_4C : bit_vector := X"0000";
  INIT_4D : bit_vector := X"0000";
  INIT_4E : bit_vector := X"0000";
  INIT_4F : bit_vector := X"0000";
  INIT_50 : bit_vector := X"0000";
  INIT_51 : bit_vector := X"0000";
  INIT_52 : bit_vector := X"0000";
  INIT_53 : bit_vector := X"0000";
  INIT_54 : bit_vector := X"0000";
  INIT_55 : bit_vector := X"0000";
  INIT_56 : bit_vector := X"0000";
  INIT_57 : bit_vector := X"0000";
  INIT_58 : bit_vector := X"0000";
  INIT_59 : bit_vector := X"0000";
  INIT_5A : bit_vector := X"0000";
  INIT_5B : bit_vector := X"0000";
  INIT_5C : bit_vector := X"0000";
  INIT_5D : bit_vector := X"0000";
  INIT_5E : bit_vector := X"0000";
  INIT_5F : bit_vector := X"0000";
  INIT_60 : bit_vector := X"0000";
  INIT_61 : bit_vector := X"0000";
  INIT_62 : bit_vector := X"0000";
  INIT_63 : bit_vector := X"0000";
  INIT_64 : bit_vector := X"0000";
  INIT_65 : bit_vector := X"0000";
  INIT_66 : bit_vector := X"0000";
  INIT_67 : bit_vector := X"0000";
  INIT_68 : bit_vector := X"0000";
  INIT_69 : bit_vector := X"0000";
  INIT_6A : bit_vector := X"0000";
  INIT_6B : bit_vector := X"0000";
  INIT_6C : bit_vector := X"0000";
  INIT_6D : bit_vector := X"0000";
  INIT_6E : bit_vector := X"0000";
  INIT_6F : bit_vector := X"0000";
  INIT_70 : bit_vector := X"0000";
  INIT_71 : bit_vector := X"0000";
  INIT_72 : bit_vector := X"0000";
  INIT_73 : bit_vector := X"0000";
  INIT_74 : bit_vector := X"0000";
  INIT_75 : bit_vector := X"0000";
  INIT_76 : bit_vector := X"0000";
  INIT_77 : bit_vector := X"0000";
  INIT_78 : bit_vector := X"0000";
  INIT_79 : bit_vector := X"0000";
  INIT_7A : bit_vector := X"0000";
  INIT_7B : bit_vector := X"0000";
  INIT_7C : bit_vector := X"0000";
  INIT_7D : bit_vector := X"0000";
  INIT_7E : bit_vector := X"0000";
  INIT_7F : bit_vector := X"0000";
    IS_CONVSTCLK_INVERTED : bit := '0';
    IS_DCLK_INVERTED : bit := '0';
    SIM_MONITOR_FILE : string := "design.txt";
    SYSMON_VUSER0_BANK : integer := 0;
    SYSMON_VUSER0_MONITOR : string := "NONE";
    SYSMON_VUSER1_BANK : integer := 0;
    SYSMON_VUSER1_MONITOR : string := "NONE";
    SYSMON_VUSER2_BANK : integer := 0;
    SYSMON_VUSER2_MONITOR : string := "NONE";
    SYSMON_VUSER3_BANK : integer := 0;
    SYSMON_VUSER3_MONITOR : string := "NONE"
  );

port (
    ALM                  : out std_logic_vector(15 downto 0);
    BUSY                 : out std_ulogic;
    CHANNEL              : out std_logic_vector(5 downto 0);
    DO                   : out std_logic_vector(15 downto 0);
    DRDY                 : out std_ulogic;
    EOC                  : out std_ulogic;
    EOS                  : out std_ulogic;
    I2C_SCLK_TS          : out std_ulogic;
    I2C_SDA_TS           : out std_ulogic;
    JTAGBUSY             : out std_ulogic;
    JTAGLOCKED           : out std_ulogic;
    JTAGMODIFIED         : out std_ulogic;
    MUXADDR              : out std_logic_vector(4 downto 0);
    OT                   : out std_ulogic;
    CONVST               : in std_ulogic;
    CONVSTCLK            : in std_ulogic;
    DADDR                : in std_logic_vector(7 downto 0);
    DCLK                 : in std_ulogic;
    DEN                  : in std_ulogic;
    DI                   : in std_logic_vector(15 downto 0);
    DWE                  : in std_ulogic;
    I2C_SCLK             : in std_ulogic;
    I2C_SDA              : in std_ulogic;
    RESET                : in std_ulogic;
    VAUXN                : in std_logic_vector(15 downto 0);
    VAUXP                : in std_logic_vector(15 downto 0);
    VN                   : in std_ulogic;
    VP                   : in std_ulogic
  );

end SYSMONE1;


architecture SYSMONE1_V of SYSMONE1 is

  constant MODULE_NAME                : string := "SYSMONE1";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

  signal INIT_40_BIN : std_logic_vector(15 downto 0);
  signal INIT_41_BIN : std_logic_vector(15 downto 0);
  signal INIT_42_BIN : std_logic_vector(15 downto 0);
  signal INIT_43_BIN : std_logic_vector(15 downto 0);
  signal INIT_44_BIN : std_logic_vector(15 downto 0);
  signal INIT_45_BIN : std_logic_vector(15 downto 0);
  signal INIT_46_BIN : std_logic_vector(15 downto 0);
  signal INIT_47_BIN : std_logic_vector(15 downto 0);
  signal INIT_48_BIN : std_logic_vector(15 downto 0);
  signal INIT_49_BIN : std_logic_vector(15 downto 0);
  signal INIT_4A_BIN : std_logic_vector(15 downto 0);
  signal INIT_4B_BIN : std_logic_vector(15 downto 0);
  signal INIT_4C_BIN : std_logic_vector(15 downto 0);
  signal INIT_4D_BIN : std_logic_vector(15 downto 0);
  signal INIT_4E_BIN : std_logic_vector(15 downto 0);
  signal INIT_4F_BIN : std_logic_vector(15 downto 0);
  signal INIT_50_BIN : std_logic_vector(15 downto 0);
  signal INIT_51_BIN : std_logic_vector(15 downto 0);
  signal INIT_52_BIN : std_logic_vector(15 downto 0);
  signal INIT_53_BIN : std_logic_vector(15 downto 0);
  signal INIT_54_BIN : std_logic_vector(15 downto 0);
  signal INIT_55_BIN : std_logic_vector(15 downto 0);
  signal INIT_56_BIN : std_logic_vector(15 downto 0);
  signal INIT_57_BIN : std_logic_vector(15 downto 0);
  signal INIT_58_BIN : std_logic_vector(15 downto 0);
  signal INIT_59_BIN : std_logic_vector(15 downto 0);
  signal INIT_5A_BIN : std_logic_vector(15 downto 0);
  signal INIT_5B_BIN : std_logic_vector(15 downto 0);
  signal INIT_5C_BIN : std_logic_vector(15 downto 0);
  signal INIT_5D_BIN : std_logic_vector(15 downto 0);
  signal INIT_5E_BIN : std_logic_vector(15 downto 0);
  signal INIT_5F_BIN : std_logic_vector(15 downto 0);
  signal INIT_60_BIN : std_logic_vector(15 downto 0);
  signal INIT_61_BIN : std_logic_vector(15 downto 0);
  signal INIT_62_BIN : std_logic_vector(15 downto 0);
  signal INIT_63_BIN : std_logic_vector(15 downto 0);
  signal INIT_64_BIN : std_logic_vector(15 downto 0);
  signal INIT_65_BIN : std_logic_vector(15 downto 0);
  signal INIT_66_BIN : std_logic_vector(15 downto 0);
  signal INIT_67_BIN : std_logic_vector(15 downto 0);
  signal INIT_68_BIN : std_logic_vector(15 downto 0);
  signal INIT_69_BIN : std_logic_vector(15 downto 0);
  signal INIT_6A_BIN : std_logic_vector(15 downto 0);
  signal INIT_6B_BIN : std_logic_vector(15 downto 0);
  signal INIT_6C_BIN : std_logic_vector(15 downto 0);
  signal INIT_6D_BIN : std_logic_vector(15 downto 0);
  signal INIT_6E_BIN : std_logic_vector(15 downto 0);
  signal INIT_6F_BIN : std_logic_vector(15 downto 0);
  signal INIT_70_BIN : std_logic_vector(15 downto 0);
  signal INIT_71_BIN : std_logic_vector(15 downto 0);
  signal INIT_72_BIN : std_logic_vector(15 downto 0);
  signal INIT_73_BIN : std_logic_vector(15 downto 0);
  signal INIT_74_BIN : std_logic_vector(15 downto 0);
  signal INIT_75_BIN : std_logic_vector(15 downto 0);
  signal INIT_76_BIN : std_logic_vector(15 downto 0);
  signal INIT_77_BIN : std_logic_vector(15 downto 0);
  signal INIT_78_BIN : std_logic_vector(15 downto 0);
  signal INIT_79_BIN : std_logic_vector(15 downto 0);
  signal INIT_7A_BIN : std_logic_vector(15 downto 0);
  signal INIT_7B_BIN : std_logic_vector(15 downto 0);
  signal INIT_7C_BIN : std_logic_vector(15 downto 0);
  signal INIT_7D_BIN : std_logic_vector(15 downto 0);
  signal INIT_7E_BIN : std_logic_vector(15 downto 0);
  signal INIT_7F_BIN : std_logic_vector(15 downto 0);
  signal IS_CONVSTCLK_INVERTED_BIN  : std_ulogic;
  signal IS_DCLK_INVERTED_BIN       : std_ulogic;
  --signal IS_DCLK_INVERTED_BIN         : std_ulogic := TO_X01(IS_DCLK_INVERTED);
  --signal IS_CONVSTCLK_INVERTED_BIN    : std_ulogic := TO_X01(IS_CONVSTCLK_INVERTED);
  signal SIM_DEVICE_BIN             : std_logic_vector(1 downto 0);
  signal SIM_MONITOR_FILE_BIN       : std_ulogic;
  signal SYSMON_VUSER0_BANK_BIN     : std_logic_vector(9 downto 0);
  signal SYSMON_VUSER0_MONITOR_BIN  : std_ulogic;
  signal SYSMON_VUSER1_BANK_BIN     : std_logic_vector(9 downto 0);
  signal SYSMON_VUSER1_MONITOR_BIN  : std_ulogic;
  signal SYSMON_VUSER2_BANK_BIN     : std_logic_vector(9 downto 0);
  signal SYSMON_VUSER2_MONITOR_BIN  : std_ulogic;
  signal SYSMON_VUSER3_BANK_BIN     : std_logic_vector(9 downto 0);
  signal SYSMON_VUSER3_MONITOR_BIN  : std_ulogic;

  signal gsr_in                     : std_ulogic := '0';
  signal xil_attr_test              : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed
  
  signal alm_out            : std_logic_vector(15 downto 0) := "0000000000000000";
  signal busy_out           : std_ulogic := '0';
  signal channel_out        : std_logic_vector(5 downto 0) := "000000";
  signal do_out             : std_logic_vector(15 downto 0) := "0000000000000000";
  signal drdy_out           : std_ulogic := '0';
  signal eoc_out            : std_ulogic := '0';
  signal eos_out            : std_ulogic := '0';
  signal i2c_sclk_ts_out    : std_ulogic;
  signal i2c_sda_ts_out     : std_ulogic;
  signal muxaddr_out        : std_logic_vector(4 downto 0) := "00000";
  signal ot_out             : std_ulogic := '0';
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal convstclk_in       : std_ulogic := '0';
  signal convst_in          : std_ulogic := '0';
  signal daddr_in           : std_logic_vector(7 downto 0) := "00000000";
  signal dclk_in            : std_ulogic := '0';
  signal den_in             : std_ulogic := '0';
  signal di_in              : std_logic_vector(15 downto 0) := "0000000000000000";
  signal dwe_in             : std_ulogic := '0';
  signal i2c_sclk_in        : std_ulogic;
  signal i2c_sda_in         : std_ulogic;
  signal reset_in           : std_ulogic := '0';
  signal vauxn_in           : std_logic_vector(15 downto 0);
  signal vauxp_in           : std_logic_vector(15 downto 0);
  signal vn_in              : std_ulogic;
  signal vp_in              : std_ulogic;

  ---------------------------------------------------------------------------
  -- Function SLV_TO_INT converts a std_logic_vector TO INTEGER
  ---------------------------------------------------------------------------
  function SLV_TO_INT(SLV: in std_logic_vector
                      ) return integer is

    variable int : integer;
  begin
    int := 0;
    for i in SLV'high downto SLV'low loop
      int := int * 2;
      if SLV(i) = '1' then
        int := int + 1;
      end if;
    end loop;
    return int;
  end SLV_TO_INT;

  function B2S ( 
    BV: in boolean 
    ) return std_ulogic is 
  begin 
    if (BV) then 
      return '1'; 
    else 
      return '0'; 
    end if;
  end B2S; 

  function S2B ( 
    STDU: in std_ulogic
    ) return boolean is 
  begin 
    if (STDU='1') then 
      return true; 
    else 
      return false; 
    end if;
  end S2B; 


---------------------------------------------------------------------------
  -- Function ADDR_IS_VALID checks for the validity of the argument. A FALSE
  -- is returned if any argument bit is other than a '0' or '1'.
  ---------------------------------------------------------------------------
  function ADDR_IS_VALID (
    SLV : in std_logic_vector
    ) return boolean is

    variable IS_VALID : boolean := TRUE;

  begin
    for I in SLV'high downto SLV'low loop
      if (SLV(I) /= '0' AND SLV(I) /= '1') then
        IS_VALID := FALSE;
      end if;
    end loop;
    return IS_VALID;
  end ADDR_IS_VALID;

  ---------------------------------------------------------------------------
  -- Function SLV_TO_STR returns a string version of the std_logic_vector
  -- argument.
  ---------------------------------------------------------------------------
  function SLV_TO_STR (
    SLV : in std_logic_vector
    ) return string is

    variable j : integer := SLV'length;
    variable STR : string (SLV'length downto 1);
  begin
    for I in SLV'high downto SLV'low loop
      case SLV(I) is
        when '0' => STR(J) := '0';
        when '1' => STR(J) := '1';
        when 'X' => STR(J) := 'X';
        when 'U' => STR(J) := 'U';
        when others => STR(J) := 'X';
      end case;
      J := J - 1;
    end loop;
    return STR;
  end SLV_TO_STR;

  function real2int( real_in : in real) return integer is --for time
    variable int_value : integer;
    variable tmpt : time;
    variable tmpt1 : time;
    variable tmpa : real;
    variable tmpr : real;
    variable int_out : integer;
  begin
    tmpa := abs(real_in);
    tmpt := tmpa * 1 ps;
    int_value := (tmpt / 1 ps ) * 1;
    tmpt1 := int_value * 1 ps;
      tmpr := real(int_value);  

    if ( real_in < 0.0000) then
       if (tmpr > tmpa) then
           int_out := 1 - int_value;
       else
           int_out := -int_value;
       end if;
    else
      if (tmpr > tmpa) then 
           int_out := int_value - 1;
      else
           int_out := int_value;
      end if;
    end if;
    return int_out;
  end real2int;


    FUNCTION  To_Upper  ( CONSTANT  val    : IN String
                         ) RETURN STRING IS
        VARIABLE result   : string (1 TO val'LENGTH) := val;
        VARIABLE ch       : character;
    BEGIN
        FOR i IN 1 TO val'LENGTH LOOP
            ch := result(i);
            EXIT WHEN ((ch = NUL) OR (ch = nul));
            IF ( ch >= 'a' and ch <= 'z') THEN
                  result(i) := CHARACTER'VAL( CHARACTER'POS(ch)
                                       - CHARACTER'POS('a')
                                       + CHARACTER'POS('A') );
            END IF;
        END LOOP;
        RETURN result;
    END To_Upper;

  function is_reserved_address(
      address_in : in std_logic_vector(7 downto 0)
    )
    return std_ulogic is
    variable is_reserved_address_pre: std_ulogic;
    variable address_in_us          : unsigned (7 downto 0);
    variable Message                : line;   
  begin
    address_in_us  := UNSIGNED(address_in);
    if((address_in_us >= X"07" and address_in_us <= X"0F") or
       (address_in_us >= X"28" and address_in_us <= X"37") or
       (address_in_us >= X"39" and address_in_us <= X"3D") or
       (address_in_us >= X"44" and address_in_us <= X"45") or
       (address_in_us >= X"58" and address_in_us <= X"5F") or
       (address_in_us >= X"64" and address_in_us <= X"67") or
       (address_in_us >= X"6C" and address_in_us <= X"7F") or 
       (address_in_us >= X"84" and address_in_us <= X"9F") or
       (address_in_us >= X"A4" and address_in_us <= X"A7") or
       (address_in_us >= X"AC" and address_in_us <= X"FF")
       ) then
      is_reserved_address_pre := '1';
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-11] The input address = "));
      Write ( Message, bit_vector'(TO_BITVECTOR(address_in)));
      Write ( Message, string'(" is accessing a RESERVED location. The data in this location is invalid."));
      assert false report Message.all  severity warning;
      DEALLOCATE(Message);
    else
      is_reserved_address_pre := '0';
    end if;
    
    return is_reserved_address_pre;
  end is_reserved_address;

  function is_readonly_address(
      address_in : in std_logic_vector(7 downto 0)
    )
    return std_ulogic is
    variable is_readonly_address_pre: std_ulogic;
    variable address_in_us          : unsigned (7 downto 0);
    variable Message                : line;   
  begin
    address_in_us  := UNSIGNED(address_in);
    if( address_in_us <= X"3F" or
       (address_in_us >= X"80" and address_in_us <= X"AB")
       ) then
      is_readonly_address_pre := '1';
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-19] The input address = "));
      Write ( Message, bit_vector'(TO_BITVECTOR(address_in)));
      Write ( Message, string'(" is accessing a READ ONLY location. The data won't be written."));
      assert false report Message.all  severity warning;
      DEALLOCATE(Message);
    else
      is_readonly_address_pre := '0';
    end if;

    return is_readonly_address_pre;
  end is_readonly_address;


  function or_reduct(slv : in std_logic_vector) return std_logic is
    variable res_v : std_logic := '0';  
  begin
    for i in slv'range loop
      res_v := res_v or slv(i);
    end loop;
    return res_v;
  end or_reduct;
  ----------------------------------------------------------------------

  procedure get_token(buf : inout LINE; token : out string;
                            token_len : out integer) 
    is
       variable index : integer := buf'low;
       variable tk_index : integer := 0;
       variable old_buf : LINE := buf; 
    BEGIN
         while ((index <= buf' high) and ((buf(index) = ' ') or
                                         (buf(index) = HT))) loop
              index := index + 1; 
         end loop;
        
         while((index <= buf'high) and ((buf(index) /= ' ') and 
                                    (buf(index) /= HT))) loop 
              tk_index := tk_index + 1;
              token(tk_index) := buf(index);
              index := index + 1; 
         end loop;
   
         token_len := tk_index;
        
         buf := new string'(old_buf(index to old_buf'high));
           old_buf := NULL;
    END;

    procedure skip_blanks(buf : inout LINE) 
    is
         variable index : integer := buf'low;
         variable old_buf : LINE := buf; 
    BEGIN
         while ((index <= buf' high) and ((buf(index) = ' ') or 
                                       (buf(index) = HT))) loop
              index := index + 1; 
         end loop;
         buf := new string'(old_buf(index to old_buf'high));
           old_buf := NULL;
    END;

    procedure infile_format
    is
         variable message_line : line;
    begin

    write(message_line, string'("***** SYSMONE1 Simulation Analog Data File Format ******"));
    writeline(output, message_line);
    write(message_line, string'("NAME: design.txt or user file name passed with generic sim_monitor_file"));
    writeline(output, message_line);
    write(message_line, string'("FORMAT: First line is header line. Valid column name are: TIME TEMP VCCINT VCCAUX VCCBRAM VCCPINT VCCPAUX VCCDDRO VP VN VAUXP[0] VAUXN[0] ...."));
    writeline(output, message_line);
    write(message_line, string'("TIME must be in first column."));
    writeline(output, message_line);
    write(message_line, string'("Time value need to be integer in ns scale"));
    writeline(output, message_line);
    write(message_line, string'("Analog  value need to be real and contain a decimal  point '.', zero should be 0.0, 3 should be 3.0"));
    writeline(output, message_line);
    write(message_line, string'("Each line including header line can not have extra space after the last character/digit."));
    writeline(output, message_line);
    write(message_line, string'("Each data line must have same number of columns as the header line."));
    writeline(output, message_line);
    write(message_line, string'("Comment line start with -- or //"));
    writeline(output, message_line);
    write(message_line, string'("Example:"));
    writeline(output, message_line);
    write(message_line, string'("TIME TEMP VCCINT  VP VN VAUXP[0] VAUXN[0]"));
    writeline(output, message_line);
    write(message_line, string'("000  125.6  1.0  0.7  0.4  0.3  0.6"));
    writeline(output, message_line);
    write(message_line, string'("200  25.6   0.8  0.5  0.3  0.8  0.2"));
    writeline(output, message_line);

    end infile_format;


    constant SEQ_DEFAULT_MODE        : std_logic_vector(3 downto 0) := "0000";
    constant SEQ_SINGLE_PASS         : std_logic_vector(3 downto 0) := "0001";
    constant SEQ_CONT_CHAN           : std_logic_vector(3 downto 0) := "0010";
    constant SEQ_SINGLE_CHAN         : std_logic_vector(3 downto 0) := "0011"; --sequencer is off
    constant SEQ_DEFAULT_MODE2       : std_logic_vector(1 downto 0) := "11";
    constant MAX_CHANNEL_ID          : integer                      := 35;

    constant I2C_DRP_RD              : std_logic_vector (3 downto 0) :="0001"; --read
    constant I2C_DRP_WR              : std_logic_vector (3 downto 0) :="0010"; --write
    constant I2C_DRP_NO              : std_logic_vector (3 downto 0) :="0000"; --no operation

    constant CONV_CAL_PER_RST        : integer := 6;
    constant CONV_CAL_PER_0          : integer := 2;
    constant CONV_NOTCAL_PER_1       : integer := 17; --18;
    constant CONV_CAL_PER_2          : integer := 96;
    constant CONV_CAL_PER_3          : integer := 96;
    constant CONV_CAL_PER_4          : integer := 44;
    constant CONV_CAL_PER_5          : integer := 21;

    type     t_reg_file       is  array (integer range <>) of std_logic_vector(15 downto 0);
    type     t_adc_state    is (S0_ST, S1_ST, S2_ST, S3_ST, S4_ST, S5_ST, S6_ST);
    type     t_mn_data        is array (0 to 35)           of real;
    type     t_dr_data_reg    is array (0 to 63)           of std_logic_vector(15 downto 0);
    type     t_acc_array      is array (0 to 63)           of integer;
    type     t_seq_array      is array (37 downto 0 )      of integer;
    type     t_i2c_state is (ST_I2C_IDLE, ST_I2C_GET_ADDR, ST_I2C_GET_CMD, ST_I2C_READ);
    type     t_pmb_state is (ST_PMB_IDLE, ST_PMB_GET_ADDR, ST_PMB_GET_CMD, ST_PMB_WRITE, ST_PMB_READ);

    signal   dr_sram             : t_reg_file(64 to 255);
    signal   data_reg            : t_dr_data_reg
                                 := ( 36 to 39 => "1111111111111111",
                                      44 to 46 => "1111111111111111",
                                      others=>"0000000000000000");
    
    signal   adc_state           : t_adc_state := S3_ST;
    signal   adc_next_state      : t_adc_state;
    signal   trig_attr           : std_ulogic := '0';
    signal   cfg_reg0            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg0_adc        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg0_seq        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg1            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg1_init       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg2            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg3            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq1_0              : std_logic_vector(3 downto 0) := "0000";
    signal   curr_seq1_0         : std_logic_vector(3 downto 0) := "0000";
    signal   curr_seq1_0_lat     : std_logic_vector(3 downto 0) := "0000";
    signal   busy_r              : std_ulogic := '0';
    signal   busy_r_rst          : std_ulogic := '0';
    signal   busy_rst            : std_ulogic := '0';
    signal   busy_conv           : std_ulogic := '0';
    signal   busy_out_tmp        : std_ulogic := '0';
    signal   busy_out_dly        : std_ulogic := '0';
    signal   busy_out_sync       : std_ulogic := '0';
    signal   busy_out_low_edge   : std_ulogic := '0';
    signal   shorten_acq         : integer := 1;
    signal   busy_seq_rst        : std_ulogic := '0';
    signal   busy_sync1          : std_ulogic := '0';
    signal   busy_sync2          : std_ulogic := '0';
    signal   busy_sync_fall      : std_ulogic := '0';
    signal   busy_sync_rise      : std_ulogic := '0';
    signal   cal_chan_update     : std_ulogic := '0';
    signal   first_cal_chan      : std_ulogic := '0';
    signal   seq_reset_flag      : std_ulogic := '0';
    signal   seq_reset_flag_dly  : std_ulogic := '0';
    signal   seq_reset_dly       : std_ulogic := '0';
    signal   seq_reset_busy_out  : std_ulogic := '0';
    signal   rst_in_not_seq      : std_ulogic := '0';
    signal   rst_in_out          : std_ulogic := '0';
    signal   rst_lock_early      : std_ulogic := '0';
    signal   rst_lock_late       : std_ulogic := '0';
    signal   conv_count          : integer := 0;
    signal   acq_count           : integer := 1;
    signal   do_out_rdtmp        : std_logic_vector(15 downto 0);
    signal   rst_in1             : std_ulogic := '0';
    signal   rst_in2             : std_ulogic := '0';
    signal   int_rst             : std_ulogic := '1';
    signal   reset_in_t          : std_ulogic := '0';
    signal   rst_in              : std_ulogic := '0';
    signal   ot_en               : std_logic := '1';
    signal   curr_clkdiv_sel     : std_logic_vector(7 downto 0) 
                                               := "00000000";
    signal   curr_clkdiv_sel_int : integer := 0;
    signal   adcclk              : std_ulogic := '0';
    signal   adcclk_div1         : std_ulogic := '0';
    signal   sysclk              : std_ulogic := '0';
    signal   curr_adc_resl       : std_logic_vector(2 downto 0) := "010";
    signal   nx_seq              : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   curr_seq            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   curr_seq_m          : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   acq_cnt             : integer := 0;
    signal   acq_chan            : std_logic_vector(5 downto 0) := "000000";
    signal   acq_chan_m          : std_logic_vector(4 downto 0) := "00000";
    signal   acq_chan_index      : integer := 0;
    signal   acq_chan_lat        : std_logic_vector(5 downto 0) := "000000";
    signal   curr_chan           : std_logic_vector(5 downto 0) := "000000";
    signal   curr_chan_dly       : std_logic_vector(5 downto 0) := "000000";
    signal   curr_chan_lat       : std_logic_vector(5 downto 0) := "000000";
    signal   averaging           : std_logic_vector(1 downto 0) := "00";
    signal   averaging_d         : std_logic_vector(1 downto 0) := "00";
    signal   acq_avg             : std_logic_vector(1 downto 0) := "00";
    signal   ext_mux_en          : boolean:= false;
    signal   ext_mux_chan_idx    : integer := 0;
    signal   curr_e_c            : std_logic:= '0';
    signal   acq_e_c             : std_logic:= '0';
    signal   acq_b_u             : std_logic:= '0';
    signal   curr_b_u            : std_logic:= '0';
    signal   acq_acqsel          : std_logic:= '0';
    signal   curr_acq            : std_logic:= '0';
    signal   seq_cnt             : integer := 0;
    signal   busy_rst_cnt        : integer := 0;
    signal   single_pass_finished: boolean := false;
    signal   adc_convst          : std_ulogic := '0';
    signal   conv_start          : std_ulogic := '0';
    signal   conv_end            : std_ulogic := '0'; 
    signal   eos_en              : std_ulogic := '0';
    signal   eos_tmp_en          : std_ulogic := '0';
    signal   seq_cnt_en          : std_ulogic := '0'; 
    signal   eoc_en              : std_ulogic := '0';
    signal   eoc_en_delay        : std_ulogic := '0';
    signal   eoc_out_tmp         : std_ulogic := '0';
    signal   eos_out_tmp         : std_ulogic := '0';
    signal   eoc_out_tmp1        : std_ulogic := '0';
    signal   eos_out_tmp1        : std_ulogic := '0';
    signal   eoc_up_data         : std_ulogic := '0';
    signal   eoc_up_alarm        : std_ulogic := '0';
    signal   eoc_out_pre         :  std_ulogic := '0';
    signal   eoc_out_pre2        :  std_ulogic := '0';
    signal   conv_result         : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   conv_result_reg     : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   data_written        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   conv_result_int     : integer := 0;
    signal   conv_result_int_resl: integer := 0;
    signal   mn_in_uni           : t_mn_data :=(others=>0.0); 
    signal   mn_in_diff          : t_mn_data :=(others=>0.0); 
    signal   mn_in               : t_mn_data :=(others=>0.0); 
    signal   mn_in_comm          : t_mn_data :=(others=>0.0); 
    signal   chan_val_tmp        : t_mn_data :=(others=>0.0); 
    signal   chan_valn_tmp       : t_mn_data :=(others=>0.0); 
    signal   tmp_data_reg_out    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   tmp_dr_sram_out     : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_chan_reg1       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_chan_reg2       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_chan_reg3       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_acq_reg1        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_acq_reg2        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_acq_reg3        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_reg1        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_reg2        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_reg3        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_du_reg1         : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_du_reg2         : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_du_reg3         : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_reg        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_reg1       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_reg2       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_reg3       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg            : std_ulogic := '0';
    signal   seq_count_en        : std_ulogic := '0';
    signal   seq_count           : integer := 1;
    signal   seq_count_a         : integer := 1;
    signal   conv_acc            : t_acc_array :=(others=>0);
    signal   conv_avg_count      : t_acc_array :=(others=>0);
    signal   conv_acc_vec        : std_logic_vector (20 downto 1);
    signal   conv_acc_result     : std_logic_vector(15 downto 0);
    signal   seq_status_avg      : integer := 0;
    signal   curr_chan_index     : integer := 0;
    signal   curr_chan_index_lat : integer := 0;
    signal   mn_mux_in           : real := 0.0;
    signal   adc_temp_result     : real := 0.0;
    signal   adc_intpwr_result   : real := 0.0;
    signal   muxaddr_o           :  std_logic_vector(4 downto 0) := "00000";

    signal   seq_reset           : std_ulogic := '0';
    signal   seq_en              : std_ulogic := '0';
    signal   seq_en_drp          : std_ulogic := '0';
    signal   seq_en_init         : std_ulogic := '0';
    signal   seq_en_dly          : std_ulogic := '0';
    signal   hr_tot_chan         : integer := 0;
    signal   seq_mem             : t_seq_array :=(others=>0);

    signal   adc_seq_reset       : std_ulogic := '0';
    signal   adc_seq_en          : std_ulogic := '0';
    signal   adc_seq_reset_dly   : std_ulogic := '0';
    signal   adc_seq_en_dly      : std_ulogic := '0';
    signal   adc_seq_reset_hold  : std_ulogic := '0';
    signal   adc_seq_en_hold     : std_ulogic := '0';
    signal   rst_lock            : std_ulogic := '1';
    signal   sim_file_flag       : std_ulogic := '0';
    signal   convst_reg          : std_ulogic := '0';
    signal   convst_in_pre       : std_ulogic := '0';
    signal   daddr_in_lat        : std_logic_vector(7 downto 0) := "00000000";
    signal   daddr_in_lat_int    : integer := 0;
    signal   drdy_out_tmp1       : std_ulogic := '0';
    signal   drdy_out_tmp2       : std_ulogic := '0';
    signal   drdy_out_tmp3       : std_ulogic := '0';
    signal   reserved_addr_pre   : std_ulogic := '0';
    signal   read_only_pre       : std_ulogic := '0';
    signal   reserved_addr       : std_ulogic := '0';
    signal   read_only           : std_ulogic := '0';
    signal   drp_update          : std_ulogic := '0';
    signal   alm_en              : std_logic_vector(12 downto 0) := "1111111111111";
    signal   alm_update          : std_ulogic := '0';
    signal   adcclk_tmp          : std_ulogic := '0';
    signal   clk_count           : integer := -1;
    signal   ot_out_reg          : std_ulogic := '0';
    signal   alm_out_reg         : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   ut_fault            : std_ulogic := '0';  
    signal   ut_warn             : std_ulogic := '0';  
    signal   ut_fault_reg        : std_ulogic := '0'; --under temperature fault register for PMBus capability.
    signal   ut_warn_reg         : std_ulogic := '0'; --under temperature warning register for PMBus capability.
    signal   alm_ut_reg          : std_logic_vector(15 downto 0) := "0000000000000000"; --under lower limit voltage for fault registers for PMBUS capability
    signal   alm_ut              : std_logic_vector(11 downto 0) := "000000000000";        
    signal   ot_limit_reg        : std_logic_vector(15 downto 0) := X"CB00"; --default value for OT is 125C
    signal   conv_end_reg_read   : std_logic_vector(3 downto 0) := "0000";
    signal   busy_reg_read       : std_ulogic := '0';
    signal   single_chan_conv_end: std_ulogic := '0';
    signal   first_acq           : std_ulogic := '1';
    signal   conv_start_cont     : std_ulogic := '0';
    signal   conv_start_sel      : std_ulogic := '0';
    signal   reset_conv_start    : std_ulogic := '0';
    signal   reset_conv_start_tmp: std_ulogic := '0';
    signal   busy_r_rst_done     : std_ulogic := '0';
    signal   op_count            : integer := 15;
    signal   simd_f              : std_ulogic := '0';
    signal   rst_in1_tmp5        : std_ulogic := '0';
    signal   rst_in1_tmp6        : std_ulogic := '0';
    signal   rst_in2_tmp5        : std_ulogic := '0';
    signal   rst_in2_tmp6        : std_ulogic := '0';
    signal   soft_reset          : std_ulogic := '0';
    signal   flag_reg0           : std_logic_vector(15 downto 0);
    signal   flag_reg1           : std_logic_vector(15 downto 0);
    signal   acq_e_c_tmp5        : std_ulogic := '0';
    signal   acq_e_c_tmp6        : std_ulogic := '0';
    signal   cfg_reg0_adc_tmp5   : std_logic_vector(15 downto 0) := X"0000";
    signal   cfg_reg0_adc_tmp6   : std_logic_vector(15 downto 0) := X"0000";
    signal   cfg_reg0_seq_tmp5   : std_logic_vector(15 downto 0) := X"0000";
    signal   cfg_reg0_seq_tmp6   : std_logic_vector(15 downto 0) := X"0000";
    signal   display_configuration_warnings : std_ulogic := '0';
    signal   cfg_check_addr_us   : unsigned (7 downto 0) :="00000000";
    
    signal   default_mode        : boolean := false;
    signal   single_pass_mode    : boolean := false;
    signal   cont_seq_mode       : boolean := false;
    signal   single_chan_mode    : boolean := false;
  

    -- Input/Output Pin signals

    signal   DI_ipd              :  std_logic_vector(15 downto 0);
    signal   DADDR_ipd           :  std_logic_vector(7 downto 0);
    signal   DEN_ipd             :  std_ulogic;
    signal   DWE_ipd             :  std_ulogic;
    signal   DCLK_ipd            :  std_ulogic;
    signal   CONVSTCLK_ipd       :  std_ulogic;
    signal   RESET_ipd           :  std_ulogic;
    signal   CONVST_ipd          :  std_ulogic;


        signal   DI_dly          :  std_logic_vector(15 downto 0);
        signal   DADDR_dly       :  std_logic_vector(7 downto 0);
        signal   DEN_dly         :  std_ulogic;
        signal   DWE_dly         :  std_ulogic;
        signal   DCLK_dly        :  std_ulogic;
        signal   CONVSTCLK_dly   :  std_ulogic;
        signal   RESET_dly       :  std_ulogic;
        signal   CONVST_dly      :  std_ulogic;

        signal   halt_adc        : integer := 0;
        signal   int_rst_halt_adc: std_ulogic := '0';
        signal   trig_halt_adc   : std_ulogic := '0';
        signal   trig_halt_adc_dr_sram : std_ulogic := '0';


    signal i2c_en                     : std_logic  := '1';
    signal i2c_oride                  : std_logic  := '0';
    signal i2c_device_addr            : std_logic_vector (6 downto 0) := "0000000";
    signal i2c_device_addr_vpvn       : std_logic_vector (6 downto 0) := "0000000";
  
    signal i2c_state                  : t_i2c_state := ST_I2C_IDLE;   
    signal i2c_start                  : std_ulogic := '0';       
    signal i2c_start_reset            : std_ulogic := '0';             
    signal i2c_stop                   : std_ulogic := '0';      
    signal i2c_stop_reset             : std_ulogic := '0';            
    signal i2c_bit_counter            : integer := 0;         
    signal i2c_byte_counter           : integer range 0 to 4 := 0; 
    signal i2c_lsb_bit                : std_ulogic := '0';         
    signal i2c_ack_bit                : std_ulogic := '0';         
    signal i2c_drp_data               : std_logic_vector (15 downto 0);     
    signal i2c_drp_addr               : std_logic_vector (9  downto 0);      
    signal i2c_drp_cmd                : std_logic_vector (3  downto 0);      
    signal i2c_cmd_in                 : std_logic_vector (31 downto 0);   
    signal i2c_data_in                : std_logic_vector (7  downto 0);     
    signal i2c_addr_match             : std_ulogic := '0';            
    signal i2c_addr_match_wop         : std_ulogic := '0';                
    signal i2c_rw_bit                 : std_ulogic := '0';        
    signal i2c_rd_cmd_pre             : std_ulogic := '0';            
    signal i2c_rd_cmd                 : std_ulogic := '0';        
    signal i2c_ack_in                 : std_ulogic := '0';  --ack from master to slave, negated.
    signal i2c_cmd_end                : std_ulogic := '0';         
    signal i2c_rd_end                 : std_ulogic := '0';        
    signal i2c_cmd_received           : std_ulogic := '0';              
    signal i2c_data_out               : std_logic_vector (15 downto 0);     
    signal i2c_wr_exec                : std_ulogic := '0';              
                                                
    signal trig_i2c_addr                : std_ulogic := '0';
    signal trig_i2c_addr_write          : std_ulogic := '0';
    signal conv_result_i2c_addr         : std_logic_vector(15 downto 0) := (others => '0');

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional  
begin 

  ALM              <= alm_out after 100 ps;
  BUSY             <= busy_out after 100 ps;
  CHANNEL          <= channel_out after 100 ps;
  DO               <= do_out after 100 ps;
  DRDY             <= drdy_out after 100 ps;
  EOC              <= eoc_out after 100 ps;
  EOS              <= eos_out after 100 ps;
  I2C_SCLK_TS      <= i2c_sclk_ts_out;
  I2C_SDA_TS       <= i2c_sda_ts_out;
  JTAGBUSY         <= '0';
  JTAGLOCKED       <= '0';
  JTAGMODIFIED     <= '0';
  MUXADDR          <= muxaddr_out after 100 ps;
  OT               <= ot_out after 100 ps;
  convstclk_in     <= CONVSTCLK xor IS_CONVSTCLK_INVERTED_BIN;
  convst_in        <= CONVST xor '0';
  convst_in_pre    <= '1' when (CONVST_in = '1' or convstclk_in = '1') else  '0';
  daddr_in         <= DADDR xor "00000000";
  dclk_in          <= DCLK xor IS_DCLK_INVERTED_BIN;
  den_in           <= DEN xor '0';
  di_in            <= DI xor X"0000";
  dwe_in           <= DWE xor '0';
   gsr_in           <= TO_X01(GSR);
  i2c_sclk_in      <= I2C_SCLK xor '0';
  i2c_sda_in       <= I2C_SDA xor '0';
  reset_in         <= RESET;
  vauxn_in         <= VAUXN;
  vauxp_in         <= VAUXP;
  vn_in            <= VN;
  vp_in            <= VP;

  INIT_40_BIN <= TO_STDLOGICVECTOR(INIT_40);
  INIT_41_BIN <= TO_STDLOGICVECTOR(INIT_41);
  INIT_42_BIN <= TO_STDLOGICVECTOR(INIT_42);
  INIT_43_BIN <= TO_STDLOGICVECTOR(INIT_43);
  INIT_44_BIN <= TO_STDLOGICVECTOR(INIT_44);
  INIT_45_BIN <= TO_STDLOGICVECTOR(INIT_45);
  INIT_46_BIN <= TO_STDLOGICVECTOR(INIT_46);
  INIT_47_BIN <= TO_STDLOGICVECTOR(INIT_47);
  INIT_48_BIN <= TO_STDLOGICVECTOR(INIT_48);
  INIT_49_BIN <= TO_STDLOGICVECTOR(INIT_49);
  INIT_4A_BIN <= TO_STDLOGICVECTOR(INIT_4A);
  INIT_4B_BIN <= TO_STDLOGICVECTOR(INIT_4B);
  INIT_4C_BIN <= TO_STDLOGICVECTOR(INIT_4C);
  INIT_4D_BIN <= TO_STDLOGICVECTOR(INIT_4D);
  INIT_4E_BIN <= TO_STDLOGICVECTOR(INIT_4E);
  INIT_4F_BIN <= TO_STDLOGICVECTOR(INIT_4F);
  INIT_50_BIN <= TO_STDLOGICVECTOR(INIT_50);
  INIT_51_BIN <= TO_STDLOGICVECTOR(INIT_51);
  INIT_52_BIN <= TO_STDLOGICVECTOR(INIT_52);
  INIT_53_BIN <= TO_STDLOGICVECTOR(INIT_53);
  INIT_54_BIN <= TO_STDLOGICVECTOR(INIT_54);
  INIT_55_BIN <= TO_STDLOGICVECTOR(INIT_55);
  INIT_56_BIN <= TO_STDLOGICVECTOR(INIT_56);
  INIT_57_BIN <= TO_STDLOGICVECTOR(INIT_57);
  INIT_58_BIN <= TO_STDLOGICVECTOR(INIT_58);
  INIT_59_BIN <= TO_STDLOGICVECTOR(INIT_59);
  INIT_5A_BIN <= TO_STDLOGICVECTOR(INIT_5A);
  INIT_5B_BIN <= TO_STDLOGICVECTOR(INIT_5B);
  INIT_5C_BIN <= TO_STDLOGICVECTOR(INIT_5C);
  INIT_5D_BIN <= TO_STDLOGICVECTOR(INIT_5D);
  INIT_5E_BIN <= TO_STDLOGICVECTOR(INIT_5E);
  INIT_5F_BIN <= TO_STDLOGICVECTOR(INIT_5F);
  INIT_60_BIN <= TO_STDLOGICVECTOR(INIT_60);
  INIT_61_BIN <= TO_STDLOGICVECTOR(INIT_61);
  INIT_62_BIN <= TO_STDLOGICVECTOR(INIT_62);
  INIT_63_BIN <= TO_STDLOGICVECTOR(INIT_63);
  INIT_64_BIN <= TO_STDLOGICVECTOR(INIT_64);
  INIT_65_BIN <= TO_STDLOGICVECTOR(INIT_65);
  INIT_66_BIN <= TO_STDLOGICVECTOR(INIT_66);
  INIT_67_BIN <= TO_STDLOGICVECTOR(INIT_67);
  INIT_68_BIN <= TO_STDLOGICVECTOR(INIT_68);
  INIT_69_BIN <= TO_STDLOGICVECTOR(INIT_69);
  INIT_6A_BIN <= TO_STDLOGICVECTOR(INIT_6A);
  INIT_6B_BIN <= TO_STDLOGICVECTOR(INIT_6B);
  INIT_6C_BIN <= TO_STDLOGICVECTOR(INIT_6C);
  INIT_6D_BIN <= TO_STDLOGICVECTOR(INIT_6D);
  INIT_6E_BIN <= TO_STDLOGICVECTOR(INIT_6E);
  INIT_6F_BIN <= TO_STDLOGICVECTOR(INIT_6F);
  INIT_70_BIN <= TO_STDLOGICVECTOR(INIT_70);
  INIT_71_BIN <= TO_STDLOGICVECTOR(INIT_71);
  INIT_72_BIN <= TO_STDLOGICVECTOR(INIT_72);
  INIT_73_BIN <= TO_STDLOGICVECTOR(INIT_73);
  INIT_74_BIN <= TO_STDLOGICVECTOR(INIT_74);
  INIT_75_BIN <= TO_STDLOGICVECTOR(INIT_75);
  INIT_76_BIN <= TO_STDLOGICVECTOR(INIT_76);
  INIT_77_BIN <= TO_STDLOGICVECTOR(INIT_77);
  INIT_78_BIN <= TO_STDLOGICVECTOR(INIT_78);
  INIT_79_BIN <= TO_STDLOGICVECTOR(INIT_79);
  INIT_7A_BIN <= TO_STDLOGICVECTOR(INIT_7A);
  INIT_7B_BIN <= TO_STDLOGICVECTOR(INIT_7B);
  INIT_7C_BIN <= TO_STDLOGICVECTOR(INIT_7C);
  INIT_7D_BIN <= TO_STDLOGICVECTOR(INIT_7D);
  INIT_7E_BIN <= TO_STDLOGICVECTOR(INIT_7E);
  INIT_7F_BIN <= TO_STDLOGICVECTOR(INIT_7F);

  IS_CONVSTCLK_INVERTED_BIN <= TO_X01(IS_CONVSTCLK_INVERTED);
  IS_DCLK_INVERTED_BIN <= TO_X01(IS_DCLK_INVERTED);
--  SIM_DEVICE_BIN <= 
--      SIM_DEVICE_ULTRASCALE_PLUS when (SIM_DEVICE = "ULTRASCALE_PLUS") else
--      SIM_DEVICE_ULTRASCALE_PLUS_ES1 when (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") else
--      SIM_DEVICE_ZYNQ_ULTRASCALE when (SIM_DEVICE = "ZYNQ_ULTRASCALE") else
--      SIM_DEVICE_ZYNQ_ULTRASCALE_ES1 when (SIM_DEVICE = "ZYNQ_ULTRASCALE_ES1") else
--      SIM_DEVICE_ULTRASCALE_PLUS;

--  SIM_MONITOR_FILE_BIN <= 
--      SIM_MONITOR_FILE_design_txt when (SIM_MONITOR_FILE = "design.txt") else
--      SIM_MONITOR_FILE_design.txt;
  
  SYSMON_VUSER0_BANK_BIN <= std_logic_vector(to_unsigned(SYSMON_VUSER0_BANK,10));
  
--  SYSMON_VUSER0_MONITOR_BIN <= 
--      SYSMON_VUSER0_MONITOR_NONE when (SYSMON_VUSER0_MONITOR = "NONE") else
--      SYSMON_VUSER0_MONITOR_NONE;
  
  SYSMON_VUSER1_BANK_BIN <= std_logic_vector(to_unsigned(SYSMON_VUSER1_BANK,10));
  
--  SYSMON_VUSER1_MONITOR_BIN <= 
--      SYSMON_VUSER1_MONITOR_NONE when (SYSMON_VUSER1_MONITOR = "NONE") else
--      SYSMON_VUSER1_MONITOR_NONE;
  
  SYSMON_VUSER2_BANK_BIN <= std_logic_vector(to_unsigned(SYSMON_VUSER2_BANK,10));
  
--  SYSMON_VUSER2_MONITOR_BIN <= 
--      SYSMON_VUSER2_MONITOR_NONE when (SYSMON_VUSER2_MONITOR = "NONE") else
--      SYSMON_VUSER2_MONITOR_NONE;
  
  SYSMON_VUSER3_BANK_BIN <= std_logic_vector(to_unsigned(SYSMON_VUSER3_BANK,10));
  
--  SYSMON_VUSER3_MONITOR_BIN <= 
--      SYSMON_VUSER3_MONITOR_NONE when (SYSMON_VUSER3_MONITOR = "NONE") else
--      SYSMON_VUSER3_MONITOR_NONE;


   p_convst_in : process( convst_in_pre, rst_in)
   begin
     if (rst_in = '1' or rst_lock = '1') then
       convst_reg <= '0';
     elsif (rising_edge(convst_in_pre)) then
       convst_reg <= '1';
     elsif (falling_edge(convst_in_pre)) then
       convst_reg <= '0';
     end if;
   end process;

  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SYSMON_VUSER0_BANK check
        if((xil_attr_test) or
           ((SYSMON_VUSER0_BANK < 0) or (SYSMON_VUSER0_BANK > 999))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-170] SYSMON_VUSER0_BANK attribute is set to "));
          Write ( Message, SYSMON_VUSER0_BANK);
          Write ( Message, string'(". Legal values for this attribute are 0 to 999. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(SYSMONE1_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;

    -------- SYSMON_VUSER1_BANK check
        if((xil_attr_test) or
           ((SYSMON_VUSER1_BANK < 0) or (SYSMON_VUSER1_BANK > 999))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-172] SYSMON_VUSER1_BANK attribute is set to "));
          Write ( Message, SYSMON_VUSER1_BANK);
          Write ( Message, string'(". Legal values for this attribute are 0 to 999. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(SYSMONE1_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;

    -------- SYSMON_VUSER2_BANK check
        if((xil_attr_test) or
           ((SYSMON_VUSER2_BANK < 0) or (SYSMON_VUSER2_BANK > 999))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-174] SYSMON_VUSER2_BANK attribute is set to "));
          Write ( Message, SYSMON_VUSER2_BANK);
          Write ( Message, string'(". Legal values for this attribute are 0 to 999. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(SYSMONE1_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;

    -------- SYSMON_VUSER3_BANK check
        if((xil_attr_test) or
           ((SYSMON_VUSER3_BANK < 0) or (SYSMON_VUSER3_BANK > 999))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-176] SYSMON_VUSER3_BANK attribute is set to "));
          Write ( Message, SYSMON_VUSER3_BANK);
          Write ( Message, string'(". Legal values for this attribute are 0 to 999. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(SYSMONE1_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;

    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-111] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(SYSMONE1_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;


   DEFAULT_CHECK : process
       variable init40h_tmp : std_logic_vector(15 downto 0);
       variable init41h_tmp : std_logic_vector(15 downto 0);
       variable init42h_tmp : std_logic_vector(15 downto 0);
       variable init4eh_tmp : std_logic_vector(15 downto 0);
       variable init46h_tmp : std_logic_vector(15 downto 0);
       variable init40h_tmp_chan : integer;
       variable init42h_tmp_clk : integer;
       variable tmp_value : std_logic_vector(7 downto 0);
   begin

        init40h_tmp := INIT_40_BIN;
        init40h_tmp_chan := SLV_TO_INT(SLV=>init40h_tmp(5 downto 0));
        init41h_tmp := INIT_41_BIN;
        init42h_tmp := INIT_42_BIN;
        tmp_value :=  init42h_tmp(15 downto 8);
        init42h_tmp_clk := SLV_TO_INT(SLV=>tmp_value);
        init4eh_tmp := INIT_4E_BIN;
        init46h_tmp := INIT_46_BIN;
 
        if ((init41h_tmp(15 downto 12)="0011") and (init40h_tmp(8)='1') and (init40h_tmp_chan /= 3 ) and (init40h_tmp_chan < 16)) then
          assert false report "[Unisim SYSMONE1-1] The attribute INIT_40 bit[8] must be set to 0. Long acquistion mode is only allowed for external channels."
          severity warning;
        end if;

        if ((init41h_tmp(15 downto 12) /="0011") and (init4eh_tmp(10 downto 0) /= "00000000000") and (init4eh_tmp(15 downto 12) /= "0000")) then
           assert false report "[Unisim SYSMONE1-2] The attribute INIT_4E Bit[15:12] and bit[10:0] must be set to 0. Long acquistion mode is only allowed for external channels."
          severity warning;
        end if;

        if ((init41h_tmp(15 downto 12)="0011") and (init40h_tmp(13 downto 12) /= "00") and (INIT_46 /=X"0000") and (INIT_48 /=X"0000") and (INIT_49 /= X"0000")) then
           assert false report "[Unisim SYSMONE1-3] The attribute INIT_46, INIT_48 and INIT_49 must be set to 0000h in single channel mode and averaging enabled."
          severity warning;
        end if;
       
        -- CR1004434 --------------------
        if ((( init41h_tmp(15 downto 12) = "0001" or init41h_tmp(15 downto 12) = "0010") and init46h_tmp(3 downto 0)/="0000") or --single pass or cont mode and vuser selected
            (init41h_tmp(15 downto 12) = "0011" and init40h_tmp(5 downto 2)= "1000")) then --single channel mode and vuser is selected
          assert false report "[Unisim SYSMONE1-178] The atrributes INIT_40 and INIT_41 are set such that  in single pass, continuous mode, or single channel mode, VUSER is selected. In Kintex devices, SYSMONE1 model has no way of knowing whether VUSER has a 6V range or a 3V range and assumes all channels have 3V range. If 6V banks are selected, the value stored in the model's registers will be different than that of the actual hardware."
          severity warning;
        end if;

        wait;
   end process;


   curr_chan_index     <= SLV_TO_INT(curr_chan);
   curr_chan_index_lat <= SLV_TO_INT(curr_chan_lat);

   
  CHEK_COMM_P : process( busy_r )
       variable Message : line;
  begin 
  if (busy_r'event and busy_r = '1' ) then
   if (rst_in = '0' and acq_b_u = '0' and ((acq_chan_index = 3) or (acq_chan_index >= 16 and acq_chan_index <= 31))) then
      if ( chan_valn_tmp(acq_chan_index) > chan_val_tmp(acq_chan_index)) then
        Write ( Message, string'("Warning : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-8] The N input for external channel "));
        Write ( Message, acq_chan_index);
        Write ( Message, string'(" must be smaller than P input when in unipolar mode (P="));
        Write ( Message, chan_val_tmp(acq_chan_index));
        Write ( Message, string'(" N="));
        Write ( Message, chan_valn_tmp(acq_chan_index));
        Write ( Message, string'(") for SYSMONE1."));
        assert false report Message.all severity warning;
        DEALLOCATE (Message);
    end if;

     if (( chan_valn_tmp(acq_chan_index) > 0.5) or  (chan_valn_tmp(acq_chan_index) < 0.0)) then
       Write ( Message, string'("Warning : [Unisim "));
       Write ( Message, string'(MODULE_NAME));
       Write ( Message, string'("-9] The N input for external channel "));
       Write ( Message, acq_chan_index);
       Write ( Message, string'(" should be between 0V to 0.5V when in unipolar mode (N="));
       Write ( Message, chan_valn_tmp(acq_chan_index));
       Write ( Message, string'(") for SYSMONE1."));
       assert false report Message.all severity warning;
       DEALLOCATE (Message);
    end if;

   end if;
  end if;
  end process;

  busy_mkup_p : process( dclk_in, rst_in_out)
  begin
    if (rst_in_out = '1') then
       busy_rst <= '1';
       rst_lock <= '1';
       rst_lock_early <= '1';
       rst_lock_late  <= '1';
       busy_rst_cnt <= 0;
    elsif (rising_edge(dclk_in)) then
       if (rst_lock = '1') then
          if (busy_rst_cnt < 29) then
               busy_rst_cnt <= busy_rst_cnt + 1;
               if ( busy_rst_cnt = 26) then
                    rst_lock_early <= '0';
               end if;
          else
               busy_rst <= '0';
               rst_lock <= '0';
          end if;
       end if;
       if (busy_out = '0') then
          rst_lock_late <= '0';
       end if;
    end if;
  end process;

  busy_out_p : process (busy_rst, busy_conv, rst_lock)
  begin
     if (rst_lock = '1') then
         busy_out <= busy_rst;
     else
         busy_out <= busy_conv;
     end if;
  end process;      

  busy_conv_p : process (dclk_in, rst_in)
  begin
    if (rst_in = '1') then
       busy_conv <= '0';
       cal_chan_update <= '0';
    elsif (rising_edge(dclk_in)) then
        if (seq_reset_flag = '1'  and curr_clkdiv_sel_int <= 3)  then
             busy_conv <= busy_seq_rst;
        elsif (busy_sync_fall = '1') then
            busy_conv <= '0';
        elsif (busy_sync_rise = '1') then
            busy_conv <= '1';
        end if;

        if (conv_count = CONV_CAL_PER_5 and curr_chan = "01000" ) then
              cal_chan_update  <= '1';
         else
              cal_chan_update  <= '0';
         end if;
    end if;
  end process;

  busy_sync_p : process (dclk_in, rst_lock)
  begin
     if (rst_lock = '1') then 
        busy_sync1 <= '0';
        busy_sync2 <= '0';
     elsif (rising_edge (dclk_in)) then 
         busy_sync1 <= busy_r;
         busy_sync2 <= busy_sync1;
     end if;
  end process;

  busy_sync_fall <= '1' when (busy_r = '0' and busy_sync1 = '1') else '0';
  busy_sync_rise <= '1' when (busy_sync1 = '1' and busy_sync2 = '0') else '0';

  busy_seq_rst_p : process
    variable tmp_uns_div : unsigned(7 downto 0);
  begin
     if (falling_edge(busy_out) or rising_edge(busy_r)) then
        if (seq_reset_flag = '1' and seq1_0 = "0000" and curr_clkdiv_sel_int <= 3) then
           wait until (rising_edge(dclk_in));
           wait  until (rising_edge(dclk_in));
           wait  until (rising_edge(dclk_in));
           wait  until (rising_edge(dclk_in));
           wait  until (rising_edge(dclk_in));
           busy_seq_rst <= '1';
        elsif (seq_reset_flag = '1' and seq1_0 /= "0000" and curr_clkdiv_sel_int <= 3) then
            wait  until (rising_edge(dclk_in));
            wait  until (rising_edge(dclk_in));
            wait  until (rising_edge(dclk_in));
            wait  until (rising_edge(dclk_in));
            wait  until (rising_edge(dclk_in));
            wait  until (rising_edge(dclk_in));
            wait  until (rising_edge(dclk_in));
           busy_seq_rst <= '1';
        else
           busy_seq_rst <= '0';
        end if;
     end if;
    wait on busy_out, busy_r;
   end process;

  muxaddr_o <= "00000" when (rst_lock_early = '1') else acq_chan_m;

  muxaddr_out_p : process (adcclk, RESET_in)
  begin
    if (RESET_in = '1') then
      muxaddr_out <= "00000";
    elsif rising_edge(adcclk) then
      --if (rst_lock_early = '0' and rst_lock_late = '1' ) then
      -- muxaddr_out <= muxaddr_o;
      if(ext_mux_en) then
        muxaddr_out <= acq_chan_m;
      else
        muxaddr_out <= "00000";
      end if;
    end if;
  end process;


  chan_out_p : process(busy_out, rst_in_out, cal_chan_update)
  begin
    if (rst_in_out = '1' or rst_lock_late = '1') then
      channel_out   <= "000000";
    elsif (rising_edge(busy_out) or rising_edge(cal_chan_update)) then
      if ( busy_out = '1' and cal_chan_update = '1') then
        channel_out <= "001000";
      end if;
    elsif (falling_edge(busy_out)) then
      channel_out   <= curr_chan;
      curr_chan_lat     <= curr_chan;
      averaging_d       <= averaging;
    end if;
  end process;

  --CR 675227
  halt_adc_p : process
   begin
     if (reset_in = '1') then
       halt_adc <= 0;
     elsif (trig_halt_adc'event) then
       halt_adc <= halt_adc + 1;
     end if;

     
     if (halt_adc = 2 and seq1_0 = "0001") then
       halt_adc <= 0;
       int_rst_halt_adc <= '1';
       wait until (rising_edge(dclk_in));
       int_rst_halt_adc <= '0';
     end if;

     wait on reset_in, seq1_0, dclk_in, trig_halt_adc;
     
   end process;
       
   
  INT_RST_GEN_P : process
  begin
    int_rst <= '1';
    wait until (rising_edge(dclk_in));
    wait until (rising_edge(dclk_in));
    int_rst <= '0';
    wait;
  end process;

  --CR 675227   
  reset_in_t <= int_rst_halt_adc or reset_in or int_rst or soft_reset or gsr_in after 1 ps;
   --  reset_in_t <= reset_in or int_rst or soft_reset after 1 ps;


  RST_DE_SYNC_V6_P: process(adcclk, reset_in_t)
  begin
    if (reset_in_t = '1') then
      rst_in2_tmp6 <= '1';
      rst_in1_tmp6 <= '1';
    elsif (adcclk'event and adcclk='1') then
      rst_in2_tmp6 <= rst_in1_tmp6;
      rst_in1_tmp6 <= reset_in_t;
    end if;
  end process;

    rst_in2         <= rst_in2_tmp6;
    rst_in_not_seq  <= rst_in2 after 10 ps;
    rst_in          <= rst_in_not_seq or seq_reset_dly;
    rst_in_out      <= rst_in_not_seq or seq_reset_busy_out;

  seq_reset_dly_p : process
  begin
    if (rising_edge(seq_reset)) then
      wait until rising_edge(dclk_in);
      wait until rising_edge(dclk_in);
      seq_reset_dly <= '1';
      wait until rising_edge(dclk_in);
      wait until falling_edge(dclk_in);
      seq_reset_busy_out <= '1';
      wait until rising_edge(dclk_in);
      wait until rising_edge(dclk_in);
      wait until rising_edge(dclk_in);
      seq_reset_dly <= '0';
      seq_reset_busy_out <= '0';
    end if;
    wait on seq_reset, dclk_in;
  end process;


  seq_reset_flag_p : process (seq_reset_dly, busy_r)
    begin
       if (rising_edge(seq_reset_dly)) then
          seq_reset_flag <= '1';
       elsif (rising_edge(busy_r)) then
          seq_reset_flag <= '0';
       end if;
    end process;

  seq_reset_flag_dly_p : process (seq_reset_flag, busy_out)
  begin
    if (rising_edge(seq_reset_flag)) then
      seq_reset_flag_dly <= '1';
    elsif (rising_edge(busy_out)) then
      seq_reset_flag_dly <= '0';
    end if;
  end process;

  first_cal_chan_p : process ( busy_out)
  begin
    if (rising_edge(busy_out )) then
      if (seq_reset_flag_dly = '1' and  acq_chan = "001000" and seq1_0 = SEQ_DEFAULT_MODE) then
        first_cal_chan <= '1';
      else 
        first_cal_chan <= '0';
      end if;
    end if;
  end process;


  ADC_SM: process (adcclk, rst_in, sim_file_flag)
  begin
  --CR 675227
   if (not(halt_adc = 2 and seq1_0 = "0011")) then
    if (sim_file_flag = '1') then
        adc_state <= S0_ST;
     elsif (rst_in = '1' or rst_lock_early = '1') then
        adc_state <= S0_ST;
     elsif (adcclk'event and adcclk = '1') then
         adc_state <= adc_next_state;
     end if;
    end if;
  end process;

  next_state_p : process (adc_state, eos_en, conv_start , conv_end, curr_seq1_0_lat)
  begin
    case (adc_state) is
      when  S0_ST => adc_next_state <= S2_ST;

      when  S2_ST => if (conv_start = '1') then
                       adc_next_state <= S3_ST;
                     else
                       adc_next_state <= S2_ST;
                     end if;

      when  S3_ST => if (conv_end = '1') then
                       adc_next_state <= S5_ST;
                     else
                       adc_next_state <= S3_ST;
                     end if;

      when  S5_ST => if (curr_seq1_0_lat = SEQ_SINGLE_PASS)  then
                       --CR 675227         if (eos_en = '1') then
                       if (eos_tmp_en = '1') then                   
                         adc_next_state <= S1_ST;
                       else
                         adc_next_state <= S2_ST;
                       end if;
                     else
                       adc_next_state <= S2_ST;
                     end if;

      when  S1_ST => adc_next_state <= S0_ST;

      when  others =>adc_next_state <= S0_ST;
    end case;
  end process;

  seq_en_init_p : process
  begin
      seq_en_init <= '0';
      if (cfg_reg1_init(15 downto 12) /= "0011" ) then
          wait for 20 ps;
          seq_en_init <= '1';
          wait for 150 ps;
          seq_en_init <= '0';
      end if;
      wait;
  end process;

  
      seq_en <= seq_en_init or  seq_en_drp;

  drdy_out_p : process
  begin
    if (gsr_in = '1') then
         drdy_out <= '0';
    elsif (rising_edge(drdy_out_tmp3)) then
      wait until rising_edge(dclk_in);
         drdy_out  <= '1';
      wait until rising_edge(dclk_in);
         drdy_out <= '0';
    end if;
    wait on drdy_out_tmp3, gsr_in;
  end process;

  trig_attr <= '1' after 1 ps;

  DRPORT_DO_OUT_P : process(dclk_in, gsr_in, trig_attr, trig_halt_adc_dr_sram, eoc_out_pre2, rst_in_not_seq, i2c_wr_exec )
       variable message              : line;
       variable di_str               : string (16 downto 1);
       variable daddr_str            : string (7 downto  1);
       variable valid_daddr          : boolean := false;
       variable daddr_in_int         : integer := 0;
       variable daddr_in_us          : unsigned (7 downto 0);
       variable tmp_value            : integer := 0;
       variable tmp_value1           : std_logic_vector (7 downto 0);
       variable en_data_flag         : integer := 0;
       variable init53h_tmp          : std_logic_vector (15 downto 0);
       variable tmp_uns1             : unsigned(15 downto 0);
       variable tmp_uns2             : unsigned(15 downto 0);
       variable tmp_uns3             : unsigned(15 downto 0);
       variable var_res_addr         : std_ulogic := '0';
       variable var_i2c_drp_addr_int : integer := 0;
       variable var_i2c_drp_addr_us  : unsigned (7 downto 0);
       variable read_only_pre_var    : std_ulogic := '0';
  begin
    if(rising_edge(trig_attr)) then
      dr_sram(64) <= INIT_40_BIN;
      dr_sram(65) <= INIT_41_BIN;
      dr_sram(66) <= INIT_42_BIN;
      dr_sram(67) <= INIT_43_BIN;
      dr_sram(68) <= INIT_44_BIN;
      dr_sram(69) <= INIT_45_BIN;
      dr_sram(70) <= INIT_46_BIN;
      dr_sram(71) <= INIT_47_BIN;
      dr_sram(72) <= INIT_48_BIN;
      dr_sram(73) <= INIT_49_BIN;
      dr_sram(74) <= INIT_4A_BIN;
      dr_sram(75) <= INIT_4B_BIN;
      dr_sram(76) <= INIT_4C_BIN;
      dr_sram(77) <= INIT_4D_BIN;
      dr_sram(78) <= INIT_4E_BIN;
      dr_sram(79) <= INIT_4F_BIN;
      dr_sram(80) <= INIT_50_BIN;
      dr_sram(81) <= INIT_51_BIN;
      dr_sram(82) <= INIT_52_BIN;
      init53h_tmp := INIT_53_BIN;
      if (init53h_tmp(3 downto 0)="0011")  then
         dr_sram(83)   <= init53h_tmp;
         ot_limit_reg  <= init53h_tmp;
      else
        dr_sram(83)   <= X"CA30";
        ot_limit_reg  <= X"CA30";
      end if;
      dr_sram(84)  <= INIT_54_BIN;
      dr_sram(85)  <= INIT_55_BIN;
      dr_sram(86)  <= INIT_56_BIN;
      dr_sram(87)  <= INIT_57_BIN;
      dr_sram(88)  <= INIT_58_BIN;
      dr_sram(89)  <= INIT_59_BIN;
      dr_sram(90)  <= INIT_5A_BIN;
      dr_sram(91)  <= INIT_5B_BIN;
      dr_sram(92)  <= INIT_5C_BIN;
      dr_sram(93)  <= INIT_5D_BIN;
      dr_sram(94)  <= INIT_5E_BIN;
      dr_sram(95)  <= INIT_5F_BIN;
      dr_sram(96)  <= INIT_60_BIN;
      dr_sram(97)  <= INIT_61_BIN;
      dr_sram(98)  <= INIT_62_BIN;
      dr_sram(99)  <= INIT_63_BIN;
      dr_sram(104) <= INIT_68_BIN;
      dr_sram(105) <= INIT_69_BIN;
      dr_sram(106) <= INIT_6A_BIN;
      dr_sram(107) <= INIT_6B_BIN;
      dr_sram(120) <= INIT_78_BIN;
      dr_sram(121) <= INIT_79_BIN;
      dr_sram(122) <= INIT_7A_BIN;
      dr_sram(123) <= INIT_7B_BIN;
      dr_sram(124) <= INIT_7C_BIN;
    end if;

    if (rst_in_not_seq = '1' and rst_in_not_seq'event) then
      for k in  0 to  31 loop
        data_reg(k) <= "0000000000000000";
      end loop;
      --Reset max and min registers.
      data_reg(32) <= "0000000000000000";
      data_reg(33) <= "0000000000000000";
      data_reg(34) <= "0000000000000000";
      data_reg(35) <= "0000000000000000";
      data_reg(36) <= "1111111111111111";
      data_reg(37) <= "1111111111111111";
      data_reg(38) <= "1111111111111111";
      data_reg(39) <= "1111111111111111";
      data_reg(40) <= "0000000000000000";
      data_reg(41) <= "0000000000000000";
      data_reg(42) <= "0000000000000000";
      data_reg(44) <= "1111111111111111";
      data_reg(45) <= "1111111111111111";
      data_reg(46) <= "1111111111111111";
      dr_sram(160) <= "0000000000000000";
      dr_sram(161) <= "0000000000000000";
      dr_sram(162) <= "0000000000000000";
      dr_sram(163) <= "0000000000000000";
      dr_sram(168) <= "1111111111111111";
      dr_sram(169) <= "1111111111111111";
      dr_sram(170) <= "1111111111111111";
      dr_sram(171) <= "1111111111111111";
    elsif (rising_edge(eoc_out_pre2)) then
      if ( rst_lock = '0') then
        if (eoc_out_pre2 = '1') then
          if ((curr_chan_index_lat >= 0 and curr_chan_index_lat <= 3) or 
              curr_chan_index_lat = 6 or 
             (curr_chan_index_lat >= 13 and curr_chan_index_lat <= 31)) then
              if (averaging_d = "00") then
                  data_reg(curr_chan_index_lat) <= conv_result_reg;
              else
                  data_reg(curr_chan_index_lat) <= conv_acc_result;
              end if;
          end if;

         if (curr_chan_index_lat >= 32 and curr_chan_index_lat <= 35) then
              if (averaging_d = "00") then
                  dr_sram(96+curr_chan_index_lat) <= conv_result_reg;
              else
                  dr_sram(96+curr_chan_index_lat) <= conv_acc_result;
              end if;
          end if;


          if (curr_chan_index_lat = 4) then --VREFP
              data_reg(curr_chan_index_lat) <= X"0000"; -- CR-961722 Simulation always simulates the internal reference behavior. Hence VrefP=0V
          end if;
          if (curr_chan_index_lat = 5) then --VREFN
              data_reg(curr_chan_index_lat) <= X"0000"; -- 0V
          end if;
          
          if (curr_chan_index_lat = 0 or curr_chan_index_lat = 1 or curr_chan_index_lat = 2) then
              tmp_uns2 := UNSIGNED(data_reg(32 + curr_chan_index_lat));
              tmp_uns3 := UNSIGNED(data_reg(36 + curr_chan_index_lat));
              if (averaging_d = "00") then
                  tmp_uns1 := UNSIGNED(conv_result_reg);
                  if (tmp_uns1 > tmp_uns2) then
                      data_reg(32 + curr_chan_index_lat) <= conv_result_reg;
                   end if;
                  if (tmp_uns1 < tmp_uns3) then
                      data_reg(36 + curr_chan_index_lat) <= conv_result_reg;
                  end if;
              else 
                  tmp_uns1 := UNSIGNED(conv_acc_result);
                  if (tmp_uns1 > tmp_uns2) then
                      data_reg(32 + curr_chan_index_lat) <= conv_acc_result;
                  end if;
                  if (tmp_uns1 < tmp_uns3) then
                      data_reg(36 + curr_chan_index_lat) <= conv_acc_result;
                  end if;
              end if;
          end if;

          if (curr_chan_index_lat = 6) then
              tmp_uns2 := UNSIGNED(data_reg(35));
              tmp_uns3 := UNSIGNED(data_reg(39));
              if (averaging_d = "00") then
                  tmp_uns1 := UNSIGNED(conv_result_reg);
                  if (tmp_uns1 > tmp_uns2) then
                      data_reg(35) <= conv_result_reg;
                   end if;
                  if (tmp_uns1 < tmp_uns3) then
                      data_reg(39) <= conv_result_reg;
                  end if;
              else 
                  tmp_uns1 := UNSIGNED(conv_acc_result);
                  if (tmp_uns1 > tmp_uns2) then
                      data_reg(35) <= conv_acc_result;
                  end if;
                  if (tmp_uns1 < tmp_uns3) then
                      data_reg(39) <= conv_acc_result;
                  end if;
              end if;
          end if;

          if ( curr_chan_index_lat >= 13 and curr_chan_index_lat <= 15) then --VPSINTLP, VPSINTFP , VPSAUX
            tmp_uns2 := UNSIGNED(data_reg(27+curr_chan_index_lat));
            tmp_uns3 := UNSIGNED(data_reg(31+curr_chan_index_lat));
            if (averaging_d = "00") then
              tmp_uns1 := UNSIGNED(conv_result_reg);
              if (tmp_uns1 > tmp_uns2) then
                  data_reg(27+curr_chan_index_lat) <= conv_result_reg;
               end if;
              if (tmp_uns1 < tmp_uns3) then
                  data_reg(31+curr_chan_index_lat) <= conv_result_reg;
              end if;
            else 
              tmp_uns1 := UNSIGNED(conv_acc_result);
              if (tmp_uns1 > tmp_uns2) then
                  data_reg(27+curr_chan_index_lat) <= conv_acc_result;
              end if;
              if (tmp_uns1 < tmp_uns3) then
                  data_reg(31+curr_chan_index_lat) <= conv_acc_result;
              end if;
            end if;
          end if;

          if (curr_chan_index_lat >= 32 and curr_chan_index_lat<=35) then  -- Vuser0-3
              tmp_uns2 := UNSIGNED(dr_sram(curr_chan_index_lat+128));
              tmp_uns3 := UNSIGNED(dr_sram(curr_chan_index_lat+136));
              if (averaging_d = "00") then
                  tmp_uns1 := UNSIGNED(conv_result_reg);
                  if (tmp_uns1 > tmp_uns2) then
                      dr_sram(curr_chan_index_lat+128) <= conv_result_reg;
                   end if;
                  if (tmp_uns1 < tmp_uns3) then
                      dr_sram(curr_chan_index_lat+136) <= conv_result_reg;
                  end if;
              else 
                  tmp_uns1 := UNSIGNED(conv_acc_result);
                  if (tmp_uns1 > tmp_uns2) then
                      dr_sram(curr_chan_index_lat+128) <= conv_acc_result;
                  end if;
                  if (tmp_uns1 < tmp_uns3) then
                      dr_sram(curr_chan_index_lat+136) <= conv_acc_result;
                  end if;
              end if;
          end if;
        end if;--eoc_out_pre2 =1
      end if;--rst_lock=0
    end if; --rising edge eoc_out_pre2

    --CR 675227
    if (trig_halt_adc_dr_sram'event) then
      dr_sram(65)(15 downto 12) <= SEQ_SINGLE_CHAN; -- h41, "0011";
    end if;

    -- I2C address measured and assigned at startup is recorded at address 38h (56)
    if(trig_i2c_addr_write'event) then
      if(i2c_oride='0') then
        data_reg(56) <= conv_result_i2c_addr;
      end if;
    end if;
      
    if (gsr_in = '1') then 
      daddr_in_lat  <= "00000000";
      do_out <= "0000000000000000";
    elsif (rising_edge(dclk_in)) then
      if (den_in = '1') then
        if (drdy_out_tmp1 = '0') then
          drdy_out_tmp1 <= '1';
          en_data_flag := 1;
          daddr_in_lat  <= daddr_in;
        else 
          if (daddr_in /= daddr_in_lat) then
            Write ( Message, string'(" Warning: [Unisim SYSMONE1-10] Input pin DEN on SYSMONE4 can not continue set to high. Need wait DRDY high and then set DEN high again."));
            assert false report Message.all  severity warning;
            DEALLOCATE(Message);
          end if;
        end if;
      else
        drdy_out_tmp1 <= '0';
      end if; --den=1
        
      drdy_out_tmp2 <= drdy_out_tmp1;
      drdy_out_tmp3 <= drdy_out_tmp2;

      if (drdy_out_tmp1 = '1') then
        en_data_flag := 0;
      end if;

      if (drdy_out_tmp3 = '1') then
        reserved_addr     <= reserved_addr_pre;
        read_only         <= read_only_pre; 
        if(dwe_in = '0') then
          do_out      <= do_out_rdtmp;
        end if;
    end if; --dclk_in
      valid_daddr  := addr_is_valid(daddr_in);
      daddr_in_int := slv_to_int(daddr_in);
      daddr_in_us  := UNSIGNED(daddr_in);

      if (den_in = '1' and valid_daddr) then
        reserved_addr_pre <= is_reserved_address(daddr_in);
      end if;

      -- write to all available and writable addresses
      if (dwe_in = '1' and den_in = '1' and en_data_flag = 1 and valid_daddr and reserved_addr_pre ='0') then  
        read_only_pre <= is_readonly_address(daddr_in);
        if (read_only_pre ='0' ) then -- write if not a read only location.
          --write
          dr_sram(daddr_in_int) <= di_in;

          -- post processing after DRP write
          if (daddr_in_us = X"03") then
            soft_reset <= '1';
          elsif ( daddr_in_us = X"53" and di_in(3 downto 0) = "0011") then --h53
            ot_limit_reg(15 downto 4)  <= di_in(15 downto 4);
          end if;
        end if;
      end if; --if (dwe_in and den_in = '1' and en_data_flag = 1 and valid_daddr and reserved_addr_pre ='0')

      if (soft_reset = '1') then
        soft_reset <= '0';
      end if;
      -- end of post processing
    end if;

    -- write i2c data
    if (i2c_wr_exec= '1') then
      read_only_pre_var     := is_readonly_address(i2c_drp_addr(7 downto 0));
      read_only             <= read_only_pre;
      if(read_only_pre_var ='0') then
        var_res_addr                  := is_reserved_address(i2c_drp_addr(7 downto 0));
        var_i2c_drp_addr_us           := UNSIGNED(i2c_drp_addr (7 downto 0));
        var_i2c_drp_addr_int          := to_integer(var_i2c_drp_addr_us);
        dr_sram(var_i2c_drp_addr_int) <= i2c_drp_data;
      end if;
    end if;

  
  end process;

  disp_conf_warn: process (dclk_in, rst_in) begin
    if(rst_in = '1') then
      display_configuration_warnings <= '0';
      cfg_check_addr_us              <= "00000000";
    elsif (rising_edge(dclk_in)) then
      if(den_in = '1' and dwe_in = '1') then
        display_configuration_warnings <= '1';
        cfg_check_addr_us              <= UNSIGNED(daddr_in);
      --elsif add i2c and pmbus writes
      else
        display_configuration_warnings <= '0';
        cfg_check_addr_us              <= "00000000";
      end if;
    end if;
  end process;

  
  p_seqreset : process (dclk_in, reset_in_t)
  begin
    if (reset_in_t = '1') then
      seq_reset  <= '0';
      seq_en_drp <= '0';
    elsif (rising_edge (dclk_in)) then
      seq_reset  <= '0';
      seq_en_drp <= '0';
      if (dwe_in = '1' and den_in = '1' and daddr_in = X"41") then
        if(di_in(15 downto 12) /= cfg_reg1(15 downto 12)) then
          seq_reset <= '1';
        end if;
        if (di_in(15 downto 12) /= SEQ_SINGLE_CHAN ) then
          seq_en_drp <= '1';
        end if;
      end if;
    end if;
  end process;



  disp_conf_warn_exe : process (display_configuration_warnings) 
    variable Message       : line;
    variable var_int       : integer := 0;
    begin
    if(rising_edge(display_configuration_warnings)) then
      var_int := SLV_TO_INT(SLV=>cfg_reg0(5 downto 0));
      if(cfg_check_addr_us = X"40") then
        var_int := SLV_TO_INT(SLV=>cfg_reg0(5 downto 0));
        if ( var_int = 7 or (var_int >= 9 and var_int <= 12) or var_int >=36) then
          Write ( Message, string'("Warning : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-14]  Config register 0 bits [5:0] at 40h cannot not be set to an invalid analog channel value as "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg0(5 downto 0))));
          assert false report Message.all  severity warning;
          DEALLOCATE(Message);
        end if;
      end if;
      if(cfg_check_addr_us = X"40" or cfg_check_addr_us = X"41") then
        if (cfg_reg1(15 downto 12)=SEQ_SINGLE_CHAN and (cfg_reg0(8)='1') and (var_int /= 3) and (var_int < 16)) then
          Write ( Message, string'("Warning : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-15] In single channel mode if the selected channel is not analog, config register 0 bit[8] must be set to 0. Long acqusition mode is only allowed for external channels, not in single channel mode."));
          assert false report Message.all  severity warning;
          DEALLOCATE(Message);
        end if;
      end if;
      if(cfg_check_addr_us = X"40" or cfg_check_addr_us = X"41" or cfg_check_addr_us = X"46" or cfg_check_addr_us = X"48" or cfg_check_addr_us = X"49" ) then 
        if ((cfg_reg1(15 downto 12)=SEQ_SINGLE_CHAN) and (cfg_reg0(13 downto 12)/="00") and (seq_chan_reg1 /= X"0000") and (seq_chan_reg2 /= X"0000") and (seq_chan_reg3 /= X"0000")) then
          Write ( Message, string'("Warning : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-16] In single channel mode, ADC channel selection registers 46h, 48h and 49h must be set to 0, these are set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg3)));
          Write ( Message, string'(",  "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg1)));
          Write ( Message, string'(" and  "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg2)));
          Write ( Message, string'("respectively. Averaging must be enabled."));
          assert false report Message.all  severity warning;
          DEALLOCATE(Message);
        end if;
      end if;
      if(cfg_check_addr_us = X"4E" or cfg_check_addr_us = X"41") then
        if ((cfg_reg1(15 downto 12) /= SEQ_SINGLE_CHAN) and (dr_sram(78)(10 downto 0) /= "00000000000") and (dr_sram(78)(15 downto 12) /= "0000")) then
          Write ( Message, string'("Warning : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-18] The Control Register 4Eh value is set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(dr_sram(78))));
          Write ( Message, string'(". When not in single channel mode, bits [15:12] and [10:0] of this register must be set to 0. Long acquistion mode is only allowed for external channels."));
          assert false report Message.all  severity warning;
          DEALLOCATE(Message);
        end if;
      end if;
      if(cfg_check_addr_us = X"42") then
        if ( cfg_reg2(4) /= '0') then 
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-12] The config reg 2 "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg2)));
          Write ( Message, string'(" is invalid. Bit [4] must be set to 0."));
          assert false report Message.all  severity error;
        end if;
      end if;
      if(cfg_check_addr_us = X"43") then
        if ( cfg_reg3(3 downto 0) /= "000") then
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-17] The config reg 3 "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg3)));
          Write ( Message, string'(" is invalid. Bits [3:0] must be set to 000."));
          assert false report Message.all  severity error;
        end if;
      end if; 
      --CR1004434
      if(cfg_check_addr_us = X"40" or cfg_check_addr_us = X"41") then
        if ((( cfg_reg1(15 downto 12) = "0001" or cfg_reg1(15 downto 12) = "0010") and dr_sram(70)(3 downto 0)/="0000") or
             (cfg_reg1(15 downto 12) = "0011" and cfg_reg0(5 downto 2)= "1000"))
        then
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-178] he control registers 40h and 41h are set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg0)));
          Write ( Message, string'(" and "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg1)));
          Write ( Message, string'(" respectively. VUSER is selected. In Kintex devices, SYSMONE1 model has no way of knowing whether VUSER has a 6V range or a 3V range and assumes all channels have 3V range. If 6V banks are selected, the value stored in the model's registers will be different than that of the actual hardware."));
          assert false report Message.all  severity warning;
        end if;
      end if; --cfg_check_addr_us


    end if;--rising_edge
  end process;

  daddr_in_lat_int    <= slv_to_int         (daddr_in_lat);

  flag_reg0 <= ("00000000" & alm_out(6 downto 3) & ot_out & alm_out(2 downto 0));
  flag_reg1 <= ("0000000000" & alm_out(13 downto 8));
  

  tmp_data_reg_out <= data_reg(daddr_in_lat_int) when (daddr_in_lat_int >= 0 and
                      daddr_in_lat_int <= 61) else "0000000000000000";
  tmp_dr_sram_out <= dr_sram(daddr_in_lat_int) when (daddr_in_lat_int >= 64 and
                     daddr_in_lat_int <= 173) else "0000000000000000";

  p_do_out_rdtmp: process (daddr_in_lat, tmp_data_reg_out, tmp_dr_sram_out, flag_reg0, flag_reg1 )
  --p_do_out_rdtmp: process (daddr_in_lat, flag_reg0, flag_reg1 )
    variable Message           : line;
    variable valid_daddr       : boolean := false;
    variable var_reserved_addr : std_ulogic := '0';
  begin
    valid_daddr       := addr_is_valid(daddr_in_lat);
    var_reserved_addr := is_reserved_address(daddr_in_lat);

    if (not(valid_daddr) or var_reserved_addr='1' ) then
      do_out_rdtmp <= "0000000000000000";
    else 
      if ((daddr_in_lat_int >= 0 and daddr_in_lat_int <= 61)) then
        do_out_rdtmp <= data_reg(daddr_in_lat_int); 
      elsif (daddr_in_lat_int = 62) then --h3E
        do_out_rdtmp <= flag_reg1;
      elsif (daddr_in_lat_int = 63) then --h3F
        do_out_rdtmp <= flag_reg0;
      else 
        do_out_rdtmp <= dr_sram(daddr_in_lat_int);
      end if;
    end if;
    
 end process;

-- end DRP RAM


  cfg_reg0         <= dr_sram(64);
  cfg_reg1         <= dr_sram(65);
  cfg_reg2         <= dr_sram(66);
  cfg_reg3         <= dr_sram(67);
  seq_chan_reg1    <= dr_sram(72);
  seq_chan_reg2    <= dr_sram(73);
  seq_chan_reg3    <= dr_sram(70);
  seq_avg_reg1     <= dr_sram(74);
  seq_avg_reg2     <= dr_sram(75);
  seq_avg_reg3     <= dr_sram(71);
  seq_du_reg1      <= dr_sram(76);
  seq_du_reg2      <= dr_sram(77);
  seq_du_reg3      <= dr_sram(120);
  seq_acq_reg1     <= dr_sram(78) and "0000100000000000"; --ignore reserved bits of 4Eh. Only but [11] is valid
  seq_acq_reg2     <= dr_sram(79);
  seq_acq_reg3     <= dr_sram(121);

  seq1_0            <= cfg_reg1(15 downto 12);
  default_mode      <= (seq1_0=SEQ_DEFAULT_MODE) or (seq1_0(3 downto 2)=SEQ_DEFAULT_MODE2);
  single_pass_mode  <= (seq1_0=SEQ_SINGLE_PASS);
  cont_seq_mode     <= (seq1_0=SEQ_CONT_CHAN);
  single_chan_mode  <= (seq1_0=SEQ_SINGLE_CHAN);
  ext_mux_en        <= (cfg_reg0(11)='1') and default_mode;
  ext_mux_chan_idx  <= SLV_TO_INT(cfg_reg0(4 downto 0));
   
  drp_update_p : process 
    variable seq_bits : std_logic_vector( 3 downto 0);
  begin
    if (rst_in = '1') then
       wait until (rising_edge(dclk_in));
       wait until (rising_edge(dclk_in));
       seq_bits := seq1_0;
    elsif (rising_edge(drp_update)) then
       seq_bits := curr_seq1_0;
    end if;

    if (rising_edge(drp_update) or (rst_in = '1')) then
       if (seq_bits = SEQ_DEFAULT_MODE or seq_bits(3 downto 2) = SEQ_DEFAULT_MODE2) then 
         alm_en   <= "0000000000000";
         ot_en    <= '1';
       else 
         ot_en               <= not cfg_reg1(0);
         alm_en(2 downto 0)  <= not cfg_reg1(3 downto 1);
         alm_en(6 downto 3)  <= not cfg_reg1(11 downto 8);
         alm_en(11 downto 8) <= not cfg_reg3(3 downto 0);
       end if;
    end if;
    wait on drp_update, rst_in;
  end process;


-------------------------------------------------------------------------------
-- i2c start
-------------------------------------------------------------------------------
  -- I2C slave address mapping
  trig_i2c_addr        <= '1' after 1 ps;   -- to read i2c_device_addr_vpvn;
  i2c_oride            <= cfg_reg3(15);
  i2c_device_addr      <= cfg_reg3(14 downto 8) when (i2c_oride='1') else i2c_device_addr_vpvn;
  --i2c or pmbus selection changes on the fly with i2c command address selection
  --i2c_addr_match_wop :  i2c address match without protocol match
  i2c_addr_match_wop <= B2S((i2c_data_in(7 downto 4)=i2c_device_addr(6 downto 3)) and (i2c_data_in(2 downto 1)=i2c_device_addr(1 downto 0)));
  i2c_addr_match     <= B2S ((S2B(i2c_oride) and (i2c_data_in(7 downto 1)=i2c_device_addr(6 downto 0))) or  
                                      (S2B(not i2c_oride) and S2B(i2c_addr_match_wop) )) ;

  p_i_en : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_en <= '1';
    elsif (rising_edge(i2c_sclk_in)) then
      if(i2c_oride = '1') then
        i2c_en <= not(cfg_reg3(10));
      elsif (S2B(i2c_ack_bit) and (i2c_state=ST_I2C_GET_ADDR) and S2B(i2c_addr_match_wop)) then
        i2c_en <= not(i2c_data_in(3));
      end if;
    end if;
  end process;

  p_i_sta : process (i2c_sda_in, reset_in, i2c_start_reset)
  begin
    if (reset_in = '1' or i2c_start_reset = '1') then
      i2c_start <= '0';
    elsif (falling_edge(i2c_sda_in)) then
      i2c_start <= i2c_sclk_in;
    end if;
  end process;      

  p_i_sta_r : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_start_reset <= '0';
    elsif (rising_edge(i2c_sclk_in)) then
      i2c_start_reset <= i2c_start;
    end if;
  end process;

  p_i_sto : process (i2c_sda_in, reset_in, i2c_stop_reset)
  begin
    if (reset_in = '1' or i2c_stop_reset = '1') then
      i2c_stop  <= '0';
    elsif (rising_edge(i2c_sda_in)) then
      i2c_stop  <= i2c_sclk_in;
    end if;
  end process; 

  p_i_sto_r : process
  begin
    if (reset_in = '1') then
      i2c_stop_reset  <= '0';
    elsif (rising_edge(i2c_stop)) then
      for I in 0 to 15 loop
        wait until (rising_edge(dclk_in));
      end loop;
      i2c_stop_reset  <= '1';
      for I in 0 to 15 loop
        wait until (rising_edge(dclk_in));
      end loop;
      i2c_stop_reset  <= '0';
    end if;
    wait on i2c_stop,reset_in;
  end process;

  i2c_lsb_bit <= B2S(i2c_bit_counter=7) and not(i2c_start);
  i2c_ack_bit <= B2S(i2c_bit_counter=8) and not(i2c_start);

  p_i_cnt1 : process (i2c_sclk_in, reset_in, i2c_start)
  begin
    if (reset_in = '1' or i2c_start='1') then
      i2c_bit_counter <= 0;
    elsif (falling_edge(i2c_sclk_in)) then
      if(i2c_ack_bit = '1') then
        i2c_bit_counter <= 0;
      else
        i2c_bit_counter <= i2c_bit_counter + 1;
      end if;
    end if;
  end process;

  p_i_din : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_data_in <= X"00";
    elsif (rising_edge(i2c_sclk_in)) then
      if(i2c_ack_bit = '0') then
        i2c_data_in <= i2c_data_in(6 downto 0) & i2c_sda_in;
      end if;
    end if;
  end process;

  i2c_drp_data <= i2c_cmd_in(15 downto 0 );
  i2c_drp_addr <= i2c_cmd_in(25 downto 16);
  i2c_drp_cmd  <= i2c_cmd_in(29 downto 26);

  p_i_cin : process (i2c_sclk_in)
  begin
    if (rising_edge(i2c_sclk_in)) then
      if(S2B(i2c_ack_bit) and (i2c_state = ST_I2C_GET_CMD) ) then
        i2c_cmd_in <= i2c_data_in & i2c_cmd_in(31 downto 8) ;
      end if;
    end if;
  end process;

  i2c_rw_bit     <= i2c_lsb_bit and B2S(i2c_state=ST_I2C_GET_ADDR);
  i2c_rd_cmd_pre <= i2c_rw_bit  and I2C_SDA_in; 

  p_i_rdcmd : process (i2c_sclk_in, i2c_stop, reset_in)
  begin
    if (reset_in = '1' or i2c_stop='1' ) then
      i2c_rd_cmd <= '0'; 
    elsif (falling_edge(i2c_sclk_in)) then
      if(i2c_state=ST_I2C_IDLE) then
        i2c_rd_cmd <= '0'; 
      elsif (i2c_rw_bit='1') then
        i2c_rd_cmd <= i2c_data_in(0) ;
      end if;
    end if;
  end process;

  p_i_ackin: process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_ack_in <= '0';
    elsif (rising_edge (i2c_sclk_in)) then
      if(i2c_ack_bit = '1') then
        i2c_ack_in <= not(I2C_SDA_in);
      elsif ((i2c_state=ST_I2C_IDLE) or i2c_bit_counter=1) then
        i2c_ack_in <= '0';
      end if;
    end if;
  end process;

  i2c_cmd_end <= i2c_ack_bit and B2S(i2c_byte_counter=3);
  i2c_rd_end  <= i2c_ack_bit and B2S(i2c_byte_counter=1);

  p_i_cmdrec : process (i2c_sclk_in, i2c_stop, reset_in)
  begin
    if (reset_in = '1' or i2c_stop='1' ) then
      i2c_cmd_received <= '0'; 
    elsif (rising_edge (i2c_sclk_in)) then
      if(i2c_cmd_end = '1' ) then
        i2c_cmd_received <= '1'; 
      elsif (i2c_state=ST_I2C_READ) then
        i2c_cmd_received <= '0'; 
      end if;
    end if;
  end process;

  p_i_cnt2   : process (i2c_sclk_in, i2c_stop, i2c_start, reset_in)
  begin
    if (reset_in = '1' or i2c_stop='1' or i2c_start='1'  ) then
      i2c_byte_counter <= 0; 
    elsif (falling_edge(i2c_sclk_in)) then
      if (i2c_ack_bit='1' and (i2c_state = ST_I2C_GET_CMD or i2c_state = ST_I2C_READ )) then
        i2c_byte_counter <= i2c_byte_counter + 1;
      end if;
    end if;
  end process;

  --I2C state machine.
  p_i_fsm   : process (i2c_sclk_in, i2c_stop, reset_in)
    variable Message                : line;   
  begin
    if (reset_in = '1' or i2c_stop='1' ) then
      i2c_state <=  ST_I2C_IDLE;
    elsif (falling_edge(i2c_sclk_in)) then
      if(i2c_start = '1') then
        i2c_state <= ST_I2C_GET_ADDR;
      elsif (i2c_ack_bit = '1') then 
        case (i2c_state) is
          when ST_I2C_GET_ADDR => if(i2c_addr_match ='0') then 
                                    i2c_state <= ST_I2C_IDLE;
                                    Write ( Message, string'("[Unisim "));
                                    Write ( Message, string'(MODULE_NAME));
                                    Write ( Message, string'("-54] I2C command address "));
                                    Write ( Message, bit_vector'(TO_BITVECTOR(i2c_data_in(7 downto 1))));
                                    Write ( Message, string'("not matching device address "));
                                    Write ( Message, bit_vector'(TO_BITVECTOR(i2c_device_addr)));
                                    assert false report Message.all  severity warning;
                                    DEALLOCATE(Message);
                                  elsif (i2c_cmd_received='0') then
                                    i2c_state <= ST_I2C_GET_CMD;
                                  elsif(i2c_drp_cmd=I2C_DRP_RD) then --if you received a command earlier, it had to be a drp read command.
                                    i2c_state <= ST_I2C_READ;
                                  else
                                    i2c_state <= ST_I2C_IDLE;
                                  end if;
          when ST_I2C_GET_CMD  => if (i2c_cmd_end='1') then
                                    i2c_state <= ST_I2C_IDLE;
                                    Write ( Message, string'("[Unisim "));
                                    Write ( Message, string'(MODULE_NAME));
                                    Write ( Message, string'("] I2C command received."));
                                    assert false report Message.all  severity note ;
                                    DEALLOCATE(Message);
                                  end if;
          when ST_I2C_READ     => if(i2c_rd_end='1') then
                                    i2c_state <= ST_I2C_IDLE;
                                  end if;
          when others          => i2c_state <= ST_I2C_IDLE;
        end case;
      end if;
    end if;
  end process;

  --i2c write command execute    
  i2c_wr_exec <= '1' when (i2c_cmd_received='1' and i2c_drp_cmd=I2C_DRP_WR) else '0'; 

  --i2c read command execute   
  p_i_dataout: process (i2c_sclk_in)
    variable var_i2c_drp_addr_us      : unsigned (7 downto 0);
    variable var_i2c_drp_addr_int     : integer  := 0; 
  begin
    var_i2c_drp_addr_us  := UNSIGNED(i2c_drp_addr (7 downto 0));
    var_i2c_drp_addr_int := SLV_TO_INT(i2c_drp_addr);
    if (falling_edge (i2c_sclk_in)and reset_in ='0') then
      if(i2c_cmd_received='1' and i2c_drp_cmd=I2C_DRP_RD and i2c_state=ST_I2C_GET_ADDR and i2c_ack_bit='0') then
        if(var_i2c_drp_addr_us >= X"40") then
          i2c_data_out <= dr_sram(var_i2c_drp_addr_int);
        else
          i2c_data_out <= data_reg(var_i2c_drp_addr_int);
        end if;
      elsif(i2c_lsb_bit='1' and i2c_state=ST_I2C_READ) then
        i2c_data_out <= "00000000" & i2c_data_out(15 downto 8); -- shift the higher byte to lower.
      else --shift the data 1 bit at a time for only the lower byte. bit 7 is pushed out.
        i2c_data_out <= i2c_data_out(15 downto 8) & i2c_data_out(6 downto 0) & '0'; 
      end if;
    end if; --clk
  end process;


  p_i_sda_ts : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_sda_ts_out <= '1';
    elsif (falling_edge (i2c_sclk_in)) then
      if(i2c_start = '1') then
        i2c_sda_ts_out <= '1';
      elsif (i2c_lsb_bit = '1') then
        i2c_sda_ts_out <= not B2S(((i2c_state=ST_I2C_GET_ADDR) and (i2c_addr_match='1' )) or 
                                      ((i2c_state=ST_I2C_GET_CMD ) and not(i2c_rd_cmd='1' and i2c_byte_counter=3))  --send NACK at the last byte of command, only if read command
                                     );
      elsif ((i2c_ack_bit='1' and --first bit of next slave to master transfer
             ((i2c_state=ST_I2C_GET_ADDR) and (i2c_drp_cmd=I2C_DRP_RD) )) or 
             (i2c_state=ST_I2C_READ and i2c_rd_end='0')) then --or read continued
        i2c_sda_ts_out <= i2c_data_out(7);
      else
        i2c_sda_ts_out <= '1';
      end if;
    end if; --clk
  end process;
  
  I2C_SCLK_TS_out <= '1';
 
-------------------------------------------------------------------------------
-- end of i2c logic 
-------------------------------------------------------------------------------
    

  -- Clock divider, generate  and adcclk

    sysclk_p : process(dclk_in)
    begin
      if (rising_edge(dclk_in)) then
          sysclk <= not sysclk;
      end if;
    end process;


    --curr_clkdiv_sel_int_p : process (curr_clkdiv_sel)
    --begin
    --    curr_clkdiv_sel_int <= SLV_TO_INT(curr_clkdiv_sel);
    --end process;

    curr_clkdiv_sel_int <= SLV_TO_INT(curr_clkdiv_sel);
    
    clk_count_p : process(dclk_in)
    begin
       if (rising_edge(dclk_in)) then
        if (curr_clkdiv_sel_int > 2 ) then 
            if (clk_count >= curr_clkdiv_sel_int - 1) then
                clk_count <= 0;
            else
                clk_count <= clk_count + 1;
            end if;

            if (clk_count > (curr_clkdiv_sel_int/2) - 1) then
               adcclk_tmp <= '1';
            else
               adcclk_tmp <= '0';
            end if;
        else
             adcclk_tmp <= not adcclk_tmp;
         end if;
      end if;
   end process;


    curr_clkdiv_sel <= cfg_reg2(15 downto 8);
    adcclk_div1 <= '0' when (curr_clkdiv_sel_int > 2) else '1';
    adcclk <= not sysclk when (adcclk_div1 = '1') else adcclk_tmp;
  
    -- end clock divider    
    

    p_acq_chan_m : process ( rst_in, seq1_0, single_pass_finished, curr_seq_m, cfg_reg0_adc ) 
    begin
        if (rst_in = '0') then
          if (default_mode) then 
            acq_chan_m <= curr_seq_m(4 downto 0);
          elsif (cont_seq_mode or (single_pass_mode and not(single_pass_finished))) then
            acq_chan_m <= curr_seq_m(4 downto 0);
          else --single pass mode deactive state or single channel mode
            acq_chan_m <= cfg_reg0_adc(4 downto 0);
          end if;
        end if;
    end process;


  --CR 675227    
  p_acq_acqsel: process ( rst_in, seq1_0, single_pass_finished, curr_seq_m, cfg_reg0_adc ) 
  begin
    if ((single_pass_mode  and not( single_pass_finished)) or 
         --cont_seq_mode || default_mode ) 
         cont_seq_mode) then --CR 927318: default mode doesn't support acq adjustability 
        acq_acqsel <= curr_seq(8);
    elsif (single_chan_mode) then
        acq_acqsel <= cfg_reg0_adc(8);
    else
        acq_acqsel <= '0';
    end if;
  end process;

  p_acq_avg : process (rst_in, single_pass_finished, seq1_0, curr_seq, cfg_reg0_adc)
  begin
    if (rst_in = '0') then
      if (default_mode ) then 
        acq_avg  <= "01";
        acq_chan <= curr_seq(5 downto 0);
        acq_b_u  <= '0';
      elsif (cont_seq_mode or (single_pass_mode and not(single_pass_finished))) then  -- either continuous or active single pass mode 
        acq_avg  <= curr_seq(13 downto 12);
        acq_chan <= curr_seq(5  downto 0);
        acq_b_u  <= curr_seq(10);
      else 
        acq_avg  <= cfg_reg0_adc(13 downto 12);
        acq_chan <= cfg_reg0_adc(5  downto 0);
        acq_b_u  <= cfg_reg0_adc(10);

        --CR 675227   
        if (single_pass_mode and acq_e_c = '0') then --single pass and cont sampling
          --CR 764936            if (seq1_0 = "0001") then              
          trig_halt_adc <= not trig_halt_adc;
          if (halt_adc = 2) then --need to wait for EOS
            trig_halt_adc_dr_sram <= not trig_halt_adc_dr_sram;
          end if;
        end if;
      end if; --other modes
    end if; --rst
  end process;

  acq_chan_index <= SLV_TO_INT(acq_chan);

    
  conv_end_reg_read_P : process ( adcclk, rst_in)
  begin
    if (rst_in = '1') then
      conv_end_reg_read <= "0000";
    elsif (rising_edge(adcclk)) then
      conv_end_reg_read <= conv_end_reg_read(2 downto 0) & (single_chan_conv_end or conv_end);  
    end if;
   end process;

  -- synch to DCLK
  busy_reg_read_P : process ( dclk_in, rst_in)
  begin
    if (rst_in = '1') then
      busy_reg_read <= '1';
    elsif (rising_edge(dclk_in)) then
      busy_reg_read <= not conv_end_reg_read(2);
    end if;
  end process;

  -- i2c write
  cfg_reg0_adc <= cfg_reg0 when (i2c_stop = '1') else cfg_reg0_adc_tmp6;
  --   cfg_reg0_adc <= cfg_reg0_adc_tmp6;
  cfg_reg0_seq <= cfg_reg0_seq_tmp6;
  acq_e_c <= acq_e_c_tmp6;

   cfg_reg0_adc6_P : process
      variable  first_after_reset : std_ulogic := '1';
   begin
       if (rst_in='1') then
          cfg_reg0_seq_tmp6 <= X"0000";
          cfg_reg0_adc_tmp6  <= X"0000";
          acq_e_c_tmp6 <= '0';
          first_after_reset := '1';
       elsif (falling_edge(busy_out) or falling_edge(rst_in)) then
          wait until (rising_edge(dclk_in));
          wait until (rising_edge(dclk_in));
          wait until (rising_edge(dclk_in));
          if (first_after_reset = '1') then
             first_after_reset := '0';
             cfg_reg0_adc_tmp6 <= cfg_reg0;
             cfg_reg0_seq_tmp6 <= cfg_reg0;
          else
             cfg_reg0_adc_tmp6 <= cfg_reg0_seq;
             cfg_reg0_seq_tmp6 <= cfg_reg0;
          end if;
          acq_e_c_tmp6 <= cfg_reg0(9);
       end if;
       wait on busy_out, rst_in;
   end process;

   busy_r_p : process(conv_start, busy_r_rst, rst_in)
   begin
      if (rst_in = '1') then
         busy_r <= '0';
      elsif (rising_edge(conv_start) and rst_lock = '0') then
          busy_r <= '1';
      elsif (rising_edge(busy_r_rst)) then
          busy_r <= '0';
      end if;
   end process;

   curr_seq1_0_p : process( busy_out)
   begin
     if (falling_edge( busy_out)) then
        if (single_pass_finished) then
          if (curr_seq1_0 = SEQ_SINGLE_PASS or curr_seq1_0 = SEQ_SINGLE_CHAN) then  -- CR 764936 from single pass or single channel, go to single channel
            curr_seq1_0 <= SEQ_SINGLE_CHAN; --"0011"
          else
            curr_seq1_0 <= SEQ_DEFAULT_MODE; --"0000";
          end if;
        else
            curr_seq1_0 <= seq1_0;
        end if;
     end if;
   end process;

   start_conv_p : process ( conv_start, rst_in)
     variable       Message : line;
     variable       tmp_seq1_0 : std_logic_vector(1 downto 0);
   begin
     if (rst_in = '1') then
       mn_mux_in <= 0.0;
       curr_chan <= "000000";
     elsif (rising_edge(conv_start)) then
       if ( ((acq_chan_index = 3) or (acq_chan_index >= 16 and acq_chan_index <= 31))) then
         if (ext_mux_en) then
          mn_mux_in <= mn_in_diff(ext_mux_chan_idx);
         else
          mn_mux_in <= mn_in_diff(acq_chan_index);
         end if;
       else
            mn_mux_in <= mn_in_uni(acq_chan_index);
       end if;

       tmp_seq1_0 := curr_seq1_0(3 downto 2);

       curr_chan <= acq_chan;
       curr_seq1_0_lat <= curr_seq1_0;

       if ((acq_chan_index = 7) or (acq_chan_index >= 9 and acq_chan_index <= 12) or (acq_chan_index >= 36)) then
         Write ( Message, string'("Warning : [Unisim "));
         Write ( Message, string'(MODULE_NAME));
         Write ( Message, string'("-14] The analog channel with index "));
         Write ( Message, acq_chan_index);
         Write ( Message, string'(" is invalid. Check register 40h[5:0]"));
         assert false report Message.all severity warning;
         DEALLOCATE(Message);
       end if;
           
       if ((single_pass_mode and not(single_pass_finished)) or cont_seq_mode or default_mode ) then
         averaging <= curr_seq(13 downto 12);
         curr_b_u  <= curr_seq(10);
         curr_e_c  <= curr_seq(9);
         curr_acq  <= curr_seq(8);
       else 
         averaging <= acq_avg;
         curr_b_u  <= acq_b_u;
         curr_e_c  <= cfg_reg0(9);
         curr_acq  <= cfg_reg0(8);
       end if;
     end if; 
  end  process;

  -- end of configuration

  ----------------------------------------------------

  -- sequence control

  seq_en_dly <= seq_en after 1 ps;

  p_s_totch : process(seq_en_dly)
    variable hr_tot_chan_tmp : integer := 0;
    variable si_tmp : integer := 0;
    variable si : integer := 0;
  begin
    if (rising_edge(seq_en_dly)) then
      if (single_pass_mode or cont_seq_mode) then -- 0001 or 0010 
        -- high rate sequence
        hr_tot_chan_tmp := 0;
        for I in 0 to 15 loop
          si := I;
          if (seq_chan_reg1(si) = '1') then
             hr_tot_chan_tmp := hr_tot_chan_tmp + 1;
             seq_mem(hr_tot_chan_tmp) <= si;
          end if;
        end loop;
        for I in 16 to 31 loop
          si := I;
          si_tmp := si-16;
          if (seq_chan_reg2(si_tmp) = '1') then
               hr_tot_chan_tmp := hr_tot_chan_tmp + 1;
               seq_mem(hr_tot_chan_tmp) <= si;
          end if;
        end loop;
        for I in 32 to 35 loop
          si := I;
          si_tmp := si-32;
          if (seq_chan_reg3(si_tmp) = '1') then
               hr_tot_chan_tmp := hr_tot_chan_tmp + 1;
               seq_mem(hr_tot_chan_tmp) <= si;
          end if;
        end loop;

        hr_tot_chan <= hr_tot_chan_tmp;
        
      elsif (default_mode) then --0000 or 11xx
          hr_tot_chan <= 5;
          seq_mem(1) <= 0;
          seq_mem(2) <= 8;
          seq_mem(3) <= 9;
          seq_mem(4) <= 10;
          seq_mem(5) <= 14;
      end if;
    end if;
   end process;

    
   curr_seq_p : process(seq_count, seq_en_dly)
      variable seq_curr_i     : std_logic_vector(5 downto 0);
      variable seq_curr_index : integer;
      variable tmp_value      : integer;
      variable tmp_value2     : integer;
      variable curr_seq_tmp   : std_logic_vector(15  downto 0) := X"0000";
      variable curr_seq2_tmpi : std_logic_vector(15  downto 0) := X"0000";
    begin
    if (seq_count'event or falling_edge(seq_en_dly)) then
      seq_curr_index := seq_mem(seq_count);
      seq_curr_i := STD_LOGIC_VECTOR(TO_UNSIGNED(seq_curr_index, 6));
      curr_seq_tmp := "0000000000000000";
      
      if (seq_curr_index >= 0 and seq_curr_index <= 15) then
        curr_seq_tmp(2 downto 0) := seq_curr_i(2 downto 0);
        curr_seq_tmp(4 downto 3) := "01";
        curr_seq_tmp(8)          := seq_acq_reg1(seq_curr_index);
        curr_seq_tmp(10)         := seq_du_reg1(seq_curr_index);
        
        if (default_mode) then
          curr_seq_tmp(13 downto 12) := "01";
        elsif (seq_avg_reg1(seq_curr_index) = '1') then
          curr_seq_tmp(13 downto 12) := cfg_reg0(13 downto 12);
        else
          curr_seq_tmp(13 downto 12) := "00";
        end if;

        if (seq_curr_index >= 0 and seq_curr_index <= 7) then
          curr_seq_tmp(4 downto 3) := "01";
        else
          curr_seq_tmp(4 downto 3) := "00";
        end if;

      elsif (seq_curr_index >= 16 and seq_curr_index <= 31) then
        tmp_value := seq_curr_index -16;
        curr_seq_tmp(5 downto 0)  := seq_curr_i;
        curr_seq_tmp(8)           := seq_acq_reg2(tmp_value);
        curr_seq_tmp(10)          := seq_du_reg2 (tmp_value);
        if (seq_avg_reg2(tmp_value) = '1') then
          curr_seq_tmp(13 downto 12) := cfg_reg0(13 downto 12);
        else
          curr_seq_tmp(13 downto 12) := "00";
        end if;
      elsif (seq_curr_index > 31 and seq_curr_index <= 35) then
        tmp_value := seq_curr_index -32;
        curr_seq_tmp(5 downto 0) := seq_curr_i;
        curr_seq_tmp(8) := seq_acq_reg3(tmp_value);
        curr_seq_tmp(10) := seq_du_reg3(tmp_value);
        if (seq_avg_reg3(tmp_value) = '1') then
          curr_seq_tmp(13 downto 12) := cfg_reg0(13 downto 12);
        else
          curr_seq_tmp(13 downto 12) := "00";
        end if;
      end if;
      curr_seq <= curr_seq_tmp;
    end if;
  end process;


   curr_seq_m_p : process(seq_count_a, seq_en_dly)
      variable seq_curr_i : std_logic_vector(5 downto 0);
      variable seq_curr_index : integer;
      variable curr_seq_tmp : std_logic_vector(15  downto 0);
    begin
    if (seq_count_a'event or falling_edge(seq_en_dly)) then
      seq_curr_index := seq_mem(seq_count_a);
      seq_curr_i := STD_LOGIC_VECTOR(TO_UNSIGNED(seq_curr_index, 6));
      curr_seq_tmp := "0000000000000000";
      if (seq_curr_index >= 0 and seq_curr_index <= 15) then
          curr_seq_tmp(2 downto 0) := seq_curr_i(2 downto 0);
          curr_seq_tmp(4 downto 3) := "01";
          if (seq_curr_index >= 0 and seq_curr_index <= 7) then
             curr_seq_tmp(4 downto 3) := "01";
          else
             curr_seq_tmp(4 downto 3) := "00";
          end if;
      elsif (seq_curr_index >= 16 and seq_curr_index <= 35) then
          curr_seq_tmp(5 downto 0) := seq_curr_i;
      end if;
      curr_seq_m <= curr_seq_tmp;
   end if;
   end process;

  -- Channel out
  seq_count_a_p : process (busy_out, rst_in)  -- hr sequence 
  begin
      if (rst_in = '1' or rst_lock = '1' ) then 
        seq_count_a <= 1;
      elsif (rising_edge(busy_out)) then
        if ( curr_seq1_0_lat = SEQ_SINGLE_CHAN ) then --0011
          seq_count_a <= 1;
        else  
          if (seq_count_a >= 37 or seq_count_a >= hr_tot_chan) then
            seq_count_a <= 1;
          else
            seq_count_a <= seq_count_a + 1;
          end if;
        end if;
      end if;
  end process;
     
  eos_en_p : process (adcclk, rst_in)
  begin 
    if (rst_in = '1') then          
      seq_count <= 1;
      eos_en <= '0';
    elsif (rising_edge(adcclk)) then
      if ((seq_count = hr_tot_chan  ) and (adc_state = S3_ST and adc_next_state = S5_ST) and
          (curr_seq1_0_lat /= SEQ_SINGLE_CHAN ) and --0011
          rst_lock = '0') then
          eos_tmp_en <= '1';
        else
          eos_tmp_en <= '0';
        end if;

            if ((eos_tmp_en = '1') and (seq_status_avg = 0))  then
            eos_en <= '1';
        else
            eos_en <= '0';
        end if;

        if (eos_tmp_en = '1' or curr_seq1_0_lat = SEQ_SINGLE_CHAN) then --"0011"
            seq_count <= 1;
        elsif (seq_count_en = '1' ) then
          if (seq_count >= 37) then
            seq_count <= 1;
              else
                seq_count <= seq_count + 1;
              end if;
            end if;
       end if;
   
  end process;

-- end sequence control

-- Acquisition

   busy_out_dly <= busy_out after 10 ps;

   short_acq_p : process(adc_state, rst_in, first_acq)
   begin
       if (rst_in = '1') then
           shorten_acq <= 0;
       elsif (adc_state'event or first_acq'event) then
         if  ((busy_out_dly = '0') and (adc_state=S2_ST) and (first_acq='1')) then
           shorten_acq <= 1;
         else
           shorten_acq <= 0;
         end if;
       end if;
   end process;

   acq_count_p : process (adcclk, rst_in)
   begin
        if (rst_in = '1' or rst_lock = '1') then
            acq_count <= 1;
            first_acq <= '1';
        elsif (rising_edge(adcclk)) then
            if (adc_state = S2_ST and rst_lock = '0' and acq_e_c = '0') then 
                first_acq <= '0';

                if (acq_acqsel = '1') then
                    if (acq_count <= 11) then
                        acq_count <= acq_count + 1 + shorten_acq;
                    end if;
                else 
                    if (acq_count <= 4) then
                        acq_count <= acq_count + 1 + shorten_acq;
                    end if;
                end if;

                if (adc_next_state = S3_ST) then
                    if ((acq_acqsel = '1' and acq_count < 10) or (acq_acqsel = '0' and acq_count < 4)) then
                    assert false report "Warning: [Unisim SYSMONE1-21] Acquisition time not enough."
                    severity warning;
                    end if;
                end if;
            else
                if (first_acq = '1') then
                    acq_count <= 1;
                else
                    acq_count <= 0;
                end if;
            end if;
        end if; 
    end process;

    conv_start_con_p: process(adc_state, acq_acqsel, acq_count)
    begin
      if (adc_state = S2_ST) then
        if (rst_lock = '0') then
--CR 800173         if ((seq_reset_flag = '0' or (seq_reset_flag = '1' and curr_clkdiv_sel_int > 3))
--           and ((acq_acqsel = '1' and acq_count > 10) or (acq_acqsel = '0' and acq_count > 4))) then
         if ((acq_acqsel = '1' and acq_count > 10) or (acq_acqsel = '0' and acq_count > 4)) then
                 conv_start_cont <= '1';
         else
                 conv_start_cont <= '0';
         end if;
       end if;
     else
         conv_start_cont <= '0';
     end if;
   end process;
 
   conv_start_sel <= convst_reg when (acq_e_c = '1') else conv_start_cont;
   reset_conv_start_tmp <= '1' when (conv_count=CONV_CAL_PER_0) else '0';
   reset_conv_start <= rst_in or reset_conv_start_tmp;
  
   conv_start_p : process(conv_start_sel, reset_conv_start)
   begin
      if (reset_conv_start ='1') then
          conv_start <= '0';
      elsif (rising_edge(conv_start_sel)) then
          conv_start <= '1';
      end if;
   end process;

-- end acquisition


-- Conversion
  conv_result_p : process (adc_state, adc_next_state, curr_chan, curr_chan_index, mn_mux_in, curr_b_u)
    variable conv_result_int_i : integer := 0;
    variable conv_result_int_tmp : integer := 0;
    variable conv_result_int_tmp_rl : real := 0.0;
    variable adc_mn_tmp : real := 0.0;
  begin
    if ((adc_state = S3_ST and adc_next_state = S5_ST) or adc_state = S5_ST) then
      if (curr_chan = "00000") then    -- temperature conversion
        adc_mn_tmp := (mn_mux_in + 273.6777) * 0.0019945 * 65536.0; --CR 861679        
        adc_temp_result <= adc_mn_tmp;
        if (adc_mn_tmp >= 65535.0) then
          conv_result_int_i := 65535;
        elsif (adc_mn_tmp < 0.0) then
          conv_result_int_i := 0;
        else 
          conv_result_int_tmp := real2int(adc_mn_tmp);
          conv_result_int_tmp_rl := real(conv_result_int_tmp);
          if (adc_mn_tmp - conv_result_int_tmp_rl > 0.9999) then
              conv_result_int_i := conv_result_int_tmp + 1;
          else
              conv_result_int_i := conv_result_int_tmp;
          end if;
        end if;
        conv_result_int <= conv_result_int_i;
        conv_result <= STD_LOGIC_VECTOR(TO_UNSIGNED(conv_result_int_i, 16));
      elsif (curr_chan = "00001" or curr_chan = "00010" or curr_chan = "00110"
             or curr_chan = "01101" or curr_chan = "01110" or curr_chan = "01111"
             or ((curr_chan_index >= 32) and (curr_chan_index <= 35))) then     -- internal power conversion
        adc_mn_tmp := mn_mux_in * 65536.0 / 3.0;
        adc_intpwr_result <= adc_mn_tmp;
        if (adc_mn_tmp >= 65535.0) then
          conv_result_int_i := 65535;
        elsif (adc_mn_tmp < 0.0) then
          conv_result_int_i := 0;
        else 
          conv_result_int_tmp := real2int(adc_mn_tmp);
          conv_result_int_tmp_rl := real(conv_result_int_tmp);
          if (adc_mn_tmp - conv_result_int_tmp_rl > 0.9999) then
            conv_result_int_i := conv_result_int_tmp + 1;
          else
            conv_result_int_i := conv_result_int_tmp;
          end if;
        end if;
        conv_result_int <= conv_result_int_i;
        conv_result <= STD_LOGIC_VECTOR(TO_UNSIGNED(conv_result_int_i, 16));
      elsif ((curr_chan = "00011") or ((curr_chan_index >= 16) and  (curr_chan_index <= 31))) then
        adc_mn_tmp :=  (mn_mux_in) * 65536.0;
        if (curr_b_u = '1')  then
          if (adc_mn_tmp > 32767.0) then
            conv_result_int_i := 32767;
          elsif (adc_mn_tmp < -32768.0) then
            conv_result_int_i := -32768;
          else 
            conv_result_int_tmp := real2int(adc_mn_tmp);
            conv_result_int_tmp_rl := real(conv_result_int_tmp);
            if (adc_mn_tmp - conv_result_int_tmp_rl > 0.9999) then
                conv_result_int_i := conv_result_int_tmp + 1;
            else
                conv_result_int_i := conv_result_int_tmp;
            end if;
          end if;
        conv_result_int <= conv_result_int_i;
        conv_result <= STD_LOGIC_VECTOR(TO_SIGNED(conv_result_int_i, 16));
        else
          if (adc_mn_tmp  > 65535.0) then
            conv_result_int_i := 65535;
          elsif (adc_mn_tmp  < 0.0) then
            conv_result_int_i := 0;
          else
            conv_result_int_tmp := real2int(adc_mn_tmp);
            conv_result_int_tmp_rl := real(conv_result_int_tmp);
            if (adc_mn_tmp - conv_result_int_tmp_rl > 0.9999) then
              conv_result_int_i := conv_result_int_tmp + 1;
            else
              conv_result_int_i := conv_result_int_tmp;
            end if;
          end if;
        conv_result_int <= conv_result_int_i;
        conv_result <= STD_LOGIC_VECTOR(TO_UNSIGNED(conv_result_int_i, 16));
        end if;
      else 
        conv_result_int <= 0;
        conv_result <= "0000000000000000";
      end if;
    end if;
  end process;

   
   chan_avg_reg1 <= seq_chan_reg1 and seq_avg_reg1;
   chan_avg_reg2 <= seq_chan_reg2 and seq_avg_reg2;
   chan_avg_reg3 <= seq_chan_reg3 and seq_avg_reg3;

   chan_avg_reg  <= chan_avg_reg1    or chan_avg_reg2    or chan_avg_reg3;
   chan_avg      <= '0' when (chan_avg_reg    = "0000000000000000") else '1';

  conv_count_p : process (adcclk, rst_in)
  begin
    if (rst_in = '1') then
      conv_count <= CONV_CAL_PER_RST;
      conv_end <= '0';
      seq_status_avg <= 0;
      busy_r_rst <= '0';
      busy_r_rst_done <= '0';
      for i in 0 to MAX_CHANNEL_ID loop
        conv_avg_count(i) <= 0;     -- array of integer
      end loop;
      single_chan_conv_end <= '0';
    elsif (rising_edge(adcclk)) then
      if (adc_state = S2_ST) then
        if (busy_r_rst_done = '0') then
          busy_r_rst <= '1';
        else
             busy_r_rst <= '0';
        end if;
        busy_r_rst_done <= '1';
      end if;

      if (adc_state = S2_ST and conv_start = '1') then
        conv_count <= 0;
        conv_end <= '0';
      elsif (adc_state = S3_ST ) then
        busy_r_rst_done <= '0';
        conv_count <= conv_count + 1;

        if (((curr_chan /= "01000" ) and (conv_count = CONV_NOTCAL_PER_1 )) or 
            ((curr_chan = "01000") and (conv_count = CONV_CAL_PER_2) and (first_cal_chan = '1')) or
            ((curr_chan = "01000") and (conv_count = CONV_CAL_PER_3) and (first_cal_chan = '0'))) then
            conv_end <= '1';
        else
            conv_end <= '0';
        end if;
      else  
        conv_end <= '0';
        conv_count <= 0;
      end if;

      single_chan_conv_end <= '0';
      if ( (conv_count = CONV_NOTCAL_PER_1) or (conv_count = CONV_CAL_PER_4)) then
        single_chan_conv_end <= '1';
      end if;

      if (adc_state = S3_ST and adc_next_state = S5_ST and rst_lock = '0') then
        case averaging is
          when "00" => eoc_en <= '1';
                      conv_avg_count(curr_chan_index) <= 0;
          when "01" =>
                      if (conv_avg_count(curr_chan_index) = 15) then
                        eoc_en <= '1';
                        conv_avg_count(curr_chan_index) <= 0;
                        seq_status_avg <= seq_status_avg - 1;
                      else 
                        eoc_en <= '0';
                        if (conv_avg_count(curr_chan_index) = 0) then
                          seq_status_avg <= seq_status_avg + 1;
                        end if;
                        conv_avg_count(curr_chan_index) <= conv_avg_count(curr_chan_index) + 1;
                      end if;
          when "10" =>
                      if (conv_avg_count(curr_chan_index) = 63) then
                        eoc_en <= '1';
                        conv_avg_count(curr_chan_index) <= 0;
                        seq_status_avg <= seq_status_avg - 1;
                      else 
                        eoc_en <= '0';
                        if (conv_avg_count(curr_chan_index) = 0) then
                          seq_status_avg <= seq_status_avg + 1;
                        end if;
                        conv_avg_count(curr_chan_index) <= conv_avg_count(curr_chan_index) + 1;
                      end if;
          when "11" => 
                      if (conv_avg_count(curr_chan_index) = 255) then
                        eoc_en <= '1';
                        conv_avg_count(curr_chan_index) <= 0;
                        seq_status_avg <= seq_status_avg - 1;
                      else 
                        eoc_en <= '0';
                        conv_avg_count(curr_chan_index) <= conv_avg_count(curr_chan_index) + 1;
                        if (conv_avg_count(curr_chan_index) = 0) then
                          seq_status_avg <= seq_status_avg + 1;
                        end if;
                      end if;
          when  others => eoc_en <= '0';
        end case;

      else
        eoc_en <= '0';
      end if;

      if (adc_state = S5_ST) then
        conv_result_reg <= conv_result;
      end if;
    end if;
  end process;

  -- end conversion

   
  -- average
  conv_acc_result_p : process(adcclk, rst_in)
    variable conv_acc_vec : std_logic_vector(23 downto 0);
    variable conv_acc_vec_int  : integer;
  begin
    if (rst_in = '1') then 
      for j in 0 to MAX_CHANNEL_ID loop
        conv_acc(j) <= 0;
      end loop;
      conv_acc_result <= "0000000000000000";
    elsif (rising_edge(adcclk)) then
      if (adc_state = S3_ST and  adc_next_state = S5_ST) then
        if (averaging /= "00" and rst_lock /= '1') then
            conv_acc(curr_chan_index) <= conv_acc(curr_chan_index) + conv_result_int;
        else
            conv_acc(curr_chan_index) <= 0;
        end if;
      elsif (eoc_en = '1') then
        conv_acc_vec_int := conv_acc(curr_chan_index);
        if ((curr_b_u = '1') and (((curr_chan_index >= 16) and (curr_chan_index <= 31))
           or (curr_chan_index = 3))) then
            conv_acc_vec := STD_LOGIC_VECTOR(TO_SIGNED(conv_acc_vec_int, 24));
        else
            conv_acc_vec := STD_LOGIC_VECTOR(TO_UNSIGNED(conv_acc_vec_int, 24));
        end if;
        case averaging(1 downto 0) is
          when "00" => conv_acc_result <= "0000000000000000";
          when "01" => conv_acc_result <= conv_acc_vec(19 downto 4);
          when "10" => conv_acc_result <= conv_acc_vec(21 downto 6);
          when "11" => conv_acc_result <= conv_acc_vec(23 downto 8);
          when others => conv_acc_result <= "0000000000000000";
        end case;
        conv_acc(curr_chan_index) <= 0;
      end if;
    end if;
  end process;

  -- end average   

  -- single sequence
  p_s_singlpf : process(adcclk, rst_in)
  begin
    if (rst_in = '1') then
      single_pass_finished <= false;
    elsif (rising_edge(adcclk)) then 
      if (adc_state = S1_ST) then
        single_pass_finished <= true; 
      end if;
    end if;
  end process;


--  end state
    eos_eoc_p: process(adcclk, rst_in)
    begin
        if (rst_in = '1') then
            seq_count_en <= '0';
            eos_out_tmp <= '0';
            eoc_out_tmp <= '0';
        elsif (rising_edge(adcclk)) then
            if ((adc_state = S3_ST and adc_next_state = S5_ST) and 
                (curr_seq1_0_lat /= SEQ_SINGLE_CHAN) --0011
                  and (rst_lock = '0')) then
                seq_count_en <= '1';
            else
                seq_count_en <= '0';
            end if;

            if (rst_lock = '0') then
                 eos_out_tmp <= eos_en;
                 eoc_en_delay <= eoc_en;
                 eoc_out_tmp <= eoc_en_delay;
            else 
                 eos_out_tmp <= '0';
                 eoc_en_delay <= '0';
                 eoc_out_tmp <= '0';
            end if;
        end if;
   end process;

  data_written_p : process(busy_r, rst_in_not_seq)
  begin
    if (rst_in_not_seq = '1') then
         data_written <= X"0000";
    elsif (falling_edge(busy_r)) then
      if (averaging = "00") then
        data_written <= conv_result_reg;
      else
        data_written <= conv_acc_result;
      end if;
    end if;
  end process;

-- eos and eoc

  eoc_out_tmp1_p : process (eoc_out_tmp, eoc_out, rst_in)
  begin
    if (rst_in = '1') then
      eoc_out_tmp1 <= '0';
    elsif (rising_edge(eoc_out)) then
      eoc_out_tmp1 <= '0';
    elsif (rising_edge(eoc_out_tmp)) then
      if (curr_chan /= "01000") then --if not calibration
        eoc_out_tmp1 <= '1';
      else
        eoc_out_tmp1 <= '0';
      end if;
    end if;
  end process;


  eos_out_tmp1_p : process (eos_out_tmp, eos_out, rst_in)
  begin
    if (rst_in = '1') then
       eos_out_tmp1 <= '0';
    elsif (rising_edge(eos_out)) then
        eos_out_tmp1 <= '0';
    elsif (rising_edge(eos_out_tmp)) then
      eos_out_tmp1 <= '1';
    end if;
  end process;

  busy_out_low_edge <= '1' when (busy_out='0' and busy_out_sync='1') else '0';

  op_count_p : process (dclk_in, rst_in) begin
    if (rst_in = '1') then
      op_count <= 15;
    elsif ( rising_edge(dclk_in)) then
      if (busy_out_low_edge = '1') then
        op_count <= 0;
      elsif (op_count < 22) then
        op_count <= op_count +1;
      end if;
    end if;
  end process;

  --CR 910473 Fixed ADC_DATA output register timing
  eoc_eos_out_p : process (dclk_in, rst_in)  begin
    if (rst_in = '1') then
      eoc_out   <= '0';
      eos_out   <= '0';
      eoc_out_pre   <= '0';
      eoc_out_pre2  <= '0';
    elsif ( rising_edge(dclk_in)) then
      if (op_count = 16 ) then
        eoc_out     <= eoc_out_tmp1;
        eos_out     <= eos_out_tmp1;
        eoc_out_pre     <= '0';
        eoc_out_pre2    <= '0';
      elsif(op_count = 15 ) then
        eoc_out     <= '0';
        eos_out     <= '0';
        eoc_out_pre     <= eoc_out_tmp1;
        eoc_out_pre2    <= '0';
      elsif(op_count = 14 ) then
        eoc_out     <= '0';
        eos_out     <= '0';
        eoc_out_pre     <= '0';
        eoc_out_pre2    <= eoc_out_tmp1;
      else
        eoc_out     <= '0';
        eos_out     <= '0';
        eoc_out_pre     <= '0';
        eoc_out_pre2    <= '0';
      end if;
    end if;
  end process;

  busy_drp_almup_p : process (dclk_in, rst_in) begin
    if (rst_in = '1') then
        busy_out_sync <= '0';
        drp_update <= '0';
        alm_update <= '0';
    elsif ( rising_edge(dclk_in)) then
       busy_out_sync <= busy_out;   
       if (op_count = 3) then
          drp_update <= '1';
        else 
          drp_update <= '0';
        end if;
        if (op_count = 5 and eoc_out_tmp1 = '1') then
           alm_update <= '1';
        else
           alm_update <= '0';
        end if;
    end if;
  end process;

-- end eos and eoc


  -- alarm

    alm_reg_p : process(alm_update, rst_in_not_seq )
       variable  tmp_unsig1 : unsigned(15 downto 0);
       variable  tmp_unsig2 : unsigned(15 downto 0);
       variable  tmp_unsig3 : unsigned(15 downto 0);
    begin
     if (rst_in_not_seq = '1') then
        ot_out_reg <= '0';
        alm_out_reg <= X"0000";
     elsif (rising_edge(alm_update)) then
       if (rst_lock = '0') then
          tmp_unsig1 := UNSIGNED(data_written);
          if (curr_chan_lat = "000000") then
            tmp_unsig2 := UNSIGNED(dr_sram(87));
            tmp_unsig3 := UNSIGNED(ot_limit_reg);
            if (tmp_unsig1 >= tmp_unsig3) then
              ot_out_reg <= '1';
            elsif (tmp_unsig1 < tmp_unsig2) then
              ot_out_reg <= '0';
            end if;
            tmp_unsig2 := UNSIGNED(dr_sram(80));
            tmp_unsig3 := UNSIGNED(dr_sram(84));
            if ( tmp_unsig1 > tmp_unsig2) then
              alm_out_reg(0) <= '1';
            elsif (tmp_unsig1 <= tmp_unsig3) then
              alm_out_reg(0) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(81));
          tmp_unsig3 := UNSIGNED(dr_sram(85));
          if (curr_chan_lat = "000001") then
           if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
             alm_out_reg(1) <= '1';
           else
             alm_out_reg(1) <= '0';
           end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(82));
          tmp_unsig3 := UNSIGNED(dr_sram(86));
          if (curr_chan_lat = "000010") then
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(2) <= '1';
            else
               alm_out_reg(2) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(88));
          tmp_unsig3 := UNSIGNED(dr_sram(92));
          if (curr_chan_lat = "000110") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(3) <= '1';
                 else
                      alm_out_reg(3) <= '0';
              end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(89));
          tmp_unsig3 := UNSIGNED(dr_sram(93));
          if (curr_chan_lat = "001101") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(4) <= '1';
                 else
                      alm_out_reg(4) <= '0';
              end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(90));
          tmp_unsig3 := UNSIGNED(dr_sram(94));
          if (curr_chan_lat = "001110") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(5) <= '1';
                 else
                      alm_out_reg(5) <= '0';
              end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(91));
          tmp_unsig3 := UNSIGNED(dr_sram(95));
          if (curr_chan_lat = "001111") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(6) <= '1';
                 else
                      alm_out_reg(6) <= '0';
              end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(96));
          tmp_unsig3 := UNSIGNED(dr_sram(104));
          if (curr_chan_lat = "100000") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(8) <= '1';
                 else
                      alm_out_reg(8) <= '0';
              end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(97));
          tmp_unsig3 := UNSIGNED(dr_sram(105));
          if (curr_chan_lat = "100001") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(9) <= '1';
                 else
                      alm_out_reg(9) <= '0';
              end if;
          end if;  
          tmp_unsig2 := UNSIGNED(dr_sram(98));
          tmp_unsig3 := UNSIGNED(dr_sram(106));
          if (curr_chan_lat = "100010") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(10) <= '1';
                 else
                      alm_out_reg(10) <= '0';
              end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(99));
          tmp_unsig3 := UNSIGNED(dr_sram(107));
          if (curr_chan_lat = "100011") then
              if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
                      alm_out_reg(11) <= '1';
                 else
                      alm_out_reg(11) <= '0';
              end if;
          end if;
     end if;
    end if;
  end process;

  ot_out                <= ot_out_reg and ot_en;

  alm_out(6 downto 0)   <= alm_out_reg(6 downto 0) and alm_en(6 downto 0);
  alm_out(11 downto 8)  <= alm_out_reg(11 downto 8) and alm_en(11 downto 8);
  alm_out(14 downto 12) <= "000"; -- Reserved
  alm_out(7)            <= or_reduct (alm_out(6 downto 0));
  alm_out(15)           <= (or_reduct (alm_out(11 downto 8))) or (or_reduct (alm_out(6 downto 0)));


-- end alarm


  READFILE_P : process
      type     t_int_array_72 is array (0 to 71) of integer;
      type     t_int_array_16 is array (0 to 15) of integer;

      file in_file : text;
      variable open_status : file_open_status;
      variable in_buf    : line;
      variable str_token : string(1 to 12);
      variable str_token_in : string(1 to 12);
      variable str_token_tmp : string(1 to 12);
      variable next_time     : time := 0 ps; 
      variable pre_time : time := 0 ps; 
      variable time_val : integer := 0;
      variable a1   : real;

      variable commentline : boolean := false;
      variable HeaderFound : boolean := false;
      variable read_ok : boolean := false;
      variable token_len : integer := 0;
      variable HeaderCount : integer := 0;


      variable vals             : t_mn_data := (others => 0.0);
      variable valsn            : t_mn_data := (others => 0.0);
      variable inchannel        : integer := 0 ;
      variable index_to_channel : t_int_array_72 := (others => -1);
      variable vauxp_idx        : t_int_array_16 := (others => -1);
      variable vauxn_idx        : t_int_array_16 := (others => -1);
      variable low : integer := -1;
      variable low2 : integer := -1;
      variable sim_file_flag1 : std_ulogic := '0';
      variable file_line : integer := 0;
      variable Message: line;

      type channm_array is array (0 to 35) of string(1 to  12);
      constant chanlist_p : channm_array := (
       0 => "TEMP" & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL,
       1 => "VCCINT" & NUL & NUL & NUL & NUL & NUL & NUL,
       2 => "VCCAUX" & NUL & NUL & NUL & NUL & NUL & NUL,   
       3 => "VP" & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL,
       4 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       5 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       6 => "VCCBRAM" & NUL & NUL & NUL & NUL & NUL,
       7 => "xxxxxxxxxxxx",
       8 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       9 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       10 => "xxxxxxxxxxxx",
       11 => "xxxxxxxxxxxx",
       12 => "xxxxxxxxxxxx",
       13 => "VCCPINT" & NUL & NUL & NUL & NUL & NUL,
       14 => "VCCPAUX" & NUL & NUL & NUL & NUL & NUL,
       15 => "VCCDDRO" & NUL & NUL & NUL & NUL & NUL,
       16 => "VAUXP[0]" & NUL & NUL & NUL & NUL,
       17 => "VAUXP[1]" & NUL & NUL & NUL & NUL,
       18 => "VAUXP[2]" & NUL & NUL & NUL & NUL,
       19 => "VAUXP[3]" & NUL & NUL & NUL & NUL,
       20 => "VAUXP[4]" & NUL & NUL & NUL & NUL,
       21 => "VAUXP[5]" & NUL & NUL & NUL & NUL,
       22 => "VAUXP[6]" & NUL & NUL & NUL & NUL,
       23 => "VAUXP[7]" & NUL & NUL & NUL & NUL,
       24 => "VAUXP[8]" & NUL & NUL & NUL & NUL,
       25 => "VAUXP[9]" & NUL & NUL & NUL & NUL,
       26 => "VAUXP[10]" & NUL & NUL & NUL,
       27 => "VAUXP[11]" & NUL & NUL & NUL,
       28 => "VAUXP[12]" & NUL & NUL & NUL,
       29 => "VAUXP[13]" & NUL & NUL & NUL,
       30 => "VAUXP[14]" & NUL & NUL & NUL,
       31 => "VAUXP[15]" & NUL & NUL & NUL,
       32 => "VUSER0" & NUL & NUL & NUL & NUL & NUL & NUL,
       33 => "VUSER1" & NUL & NUL & NUL & NUL & NUL & NUL,
       34 => "VUSER2" & NUL & NUL & NUL & NUL & NUL & NUL,
       35 => "VUSER3" & NUL & NUL & NUL & NUL & NUL & NUL
      );
       
      constant chanlist_n : channm_array := (
       0 => "xxxxxxxxxxxx",
       1 => "xxxxxxxxxxxx",
       2 => "xxxxxxxxxxxx",
       3 => "VN" & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL,
       4 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       5 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       6 => "xxxxxxxxxxxx",
       7 => "xxxxxxxxxxxx",
       8 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       9 => NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
             NUL & NUL,
       10 => "xxxxxxxxxxxx",
       11 => "xxxxxxxxxxxx",
       12 => "xxxxxxxxxxxx",
       13 => "xxxxxxxxxxxx",
       14 => "xxxxxxxxxxxx",
       15 => "xxxxxxxxxxxx",
       16 => "VAUXN[0]" & NUL & NUL & NUL & NUL,
       17 => "VAUXN[1]" & NUL & NUL & NUL & NUL,
       18 => "VAUXN[2]" & NUL & NUL & NUL & NUL,
       19 => "VAUXN[3]" & NUL & NUL & NUL & NUL,
       20 => "VAUXN[4]" & NUL & NUL & NUL & NUL,
       21 => "VAUXN[5]" & NUL & NUL & NUL & NUL,
       22 => "VAUXN[6]" & NUL & NUL & NUL & NUL,
       23 => "VAUXN[7]" & NUL & NUL & NUL & NUL,
       24 => "VAUXN[8]" & NUL & NUL & NUL & NUL,
       25 => "VAUXN[9]" & NUL & NUL & NUL & NUL,
       26 => "VAUXN[10]" & NUL & NUL & NUL,
       27 => "VAUXN[11]" & NUL & NUL & NUL,
       28 => "VAUXN[12]" & NUL & NUL & NUL,
       29 => "VAUXN[13]" & NUL & NUL & NUL,
       30 => "VAUXN[14]" & NUL & NUL & NUL,
       31 => "VAUXN[15]" & NUL & NUL & NUL,
       32 => "xxxxxxxxxxxx",
       33 => "xxxxxxxxxxxx",
       34 => "xxxxxxxxxxxx",
       35 => "xxxxxxxxxxxx"
           );

  begin
 
    file_open(open_status, in_file, SIM_MONITOR_FILE, read_mode);
    if (open_status /= open_ok) then
         assert false report
        "Warning: [Unisim SYSMONE1-22] The analog input data file was not found. Use the SIM_MONITOR_FILE generic to specify the input analog data file name or use default name: design.txt. "
      severity failure;
         sim_file_flag1 := '1';
         sim_file_flag <= '1';
    end if;

    if ( sim_file_flag1 = '0') then
      while (not endfile(in_file) and (not HeaderFound)) loop
        commentline := false;
        readline(in_file, in_buf);
        file_line := file_line + 1;
        if (in_buf'LENGTH > 0 ) then
          skip_blanks(in_buf);
        
          low := in_buf'low;
          low2 := in_buf'low+2;
          if ( low2 <= in_buf'high) then
            if ((in_buf(in_buf'low to in_buf'low+1) = "//" ) or 
                (in_buf(in_buf'low to in_buf'low+1) = "--" ) or
                (in_buf(in_buf'low to in_buf'low  ) = "#" ) or
                (in_buf(in_buf'low to in_buf'low+1) = NUL & NUL )) then
              commentline := true;
            end if;

            while((in_buf'LENGTH > 0 ) and (not commentline)) loop
              HeaderFound := true;
              get_token(in_buf, str_token_in, token_len);
              str_token_tmp := To_Upper(str_token_in);
              if (str_token_tmp(1 to 4) = "TEMP") then
                 str_token := "TEMP" & NUL & NUL & NUL & NUL & NUL 
                                     & NUL & NUL & NUL;
              else
                 str_token := str_token_tmp;
              end if;

              if(token_len > 0) then
               HeaderCount := HeaderCount + 1;
              end if;
        
              if (HeaderCount=1) then
                if (str_token(1 to token_len) /= "TIME") then
                  infile_format;
                  assert false report
                    " Error: [Unisim SYSMONE1-23] No TIME label is found in the input file."
                     severity failure;
                end if;
              elsif (HeaderCount > 1) then
                inchannel := -1;
                for i in 0 to 35 loop
                  if (chanlist_p(i) = str_token and str_token(1) /= NUL) then
                    inchannel := i;
                    index_to_channel(headercount) := i;
                    if ((16 <= i) and (i <= 31)) then
                      vauxp_idx(i - 16) :=  i;
                    end if;
                  end if;
                end loop;
                if (inchannel = -1) then
                  for i in 0 to 35 loop
                    if ( chanlist_n(i) = str_token and str_token(1) /= NUL) then
                      inchannel := i;
                      index_to_channel(headercount) := i+36;
                      if (16 <= i and i <= 31) then
                        vauxn_idx(i - 16) :=  i + 36;
                      end if;
                    end if;
                  end loop;
                end if;
                if (inchannel = -1 and token_len >0) then
                  infile_format;
                  assert false report
                    "Error: [Unisim SYSMONE1-24] No valid channel name in the input file. Valid names: TEMP VCCINT VCCAUX VCCBRAM VCC_PSINTLP VCC_PSINTFP VCC_PSAUX VP VN VAUXP[1] VAUXN[1] ....."
                  severity failure;
                end if;
              else --headercount<=0
                infile_format;
                assert false report
                  "Error: [Unisim SYSMONE1-25] Header not found in the input file. The header is: TIME TEMP VCCINT VCCAUX VCCBRAM VCC_PSINTLP VCC_PSINTFP VCC_PSAUX VP VN VAUXP[1] VAUXN[1] ..."
                    severity failure;
              end if;

              str_token_in := NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
                              NUL & NUL & NUL & NUL;
            end loop;--while((in_buf'LENGTH > 0 ) and (not commentline)
          end if;
        end if;
      end loop; 
      --end of file


      -----  Read Values
      while (not endfile(in_file)) loop
        commentline := false;
        readline(in_file, in_buf);
        file_line := file_line + 1;
        if (in_buf'length > 0) then
          skip_blanks(in_buf);
          if (in_buf'low < in_buf'high) then
            if((in_buf(in_buf'low to in_buf'low+1) = "//" ) or 
               (in_buf(in_buf'low to in_buf'low+1) = "--" )) then
              commentline := true;
            end if;
 
            if(not commentline and in_buf'length > 0) then
              for i IN 1 to HeaderCount Loop
                if ( i=1) then
                  read(in_buf, time_val, read_ok);
                  if (not read_ok) then
                    infile_format;
                    assert false report
                      "Error: [Unisim SYSMONE1-26] The time value should be integer in ns scale with a range from 0 to 2147483647 and should change incrementally."
                      severity failure;
                  end if;
                  next_time := time_val * 1 ns; 
                else
                  read(in_buf, a1, read_ok);
                  if (not read_ok) then
                    assert false report
                      "Error: [Unisim SYSMONE1-27] The data type should be REAL, e.g. 3.0  0.0  -0.5 "
                      severity failure;
                  end if;
                  inchannel:= index_to_channel(i);
                  if (inchannel >= 36) then
                    valsn(inchannel-36):=a1;
                  else
                    vals(inchannel):=a1;
                  end if;
                end if;
              end loop;  -- for i loop

              if ( now < next_time) then
                wait for ( next_time - now ); 
              end if;

              for i in 0 to 35 loop
                 chan_val_tmp(i) <= vals(i);
                 chan_valn_tmp(i) <= valsn(i);
                 mn_in_diff(i) <= vals(i)-valsn(i);
                 mn_in_uni(i) <= vals(i);
              end loop;
            end if;
          end if;
        end if;
      end loop;  -- while loop
      file_close(in_file);
    end if;
    wait;
  end process READFILE_P;

  p_i2c_addr: process(trig_i2c_addr )
    variable i2c_conv_result            : std_logic_vector(15 downto 0) := (others => '0');
    variable i2c_conv_result_int        : integer := 0;
    variable i2c_conv_result_int_tmp    : integer := 0;
    variable i2c_conv_result_int_tmp_rl : real := 0.0;
    variable i2c_vpvn_addr_tmp          : real := 0.0;
  begin
    if (rising_edge(trig_i2c_addr)) then
      i2c_vpvn_addr_tmp :=  mn_in_uni(3) * 65536.0;
      if (i2c_vpvn_addr_tmp  > 65535.0) then
        i2c_conv_result_int := 65535;
      elsif (i2c_vpvn_addr_tmp  < 0.0) then
        i2c_conv_result_int := 0;
      else
        i2c_conv_result_int_tmp := real2int(i2c_vpvn_addr_tmp);
        i2c_conv_result_int_tmp_rl := real(i2c_conv_result_int_tmp);
        if (i2c_vpvn_addr_tmp - i2c_conv_result_int_tmp_rl > 0.9999) then
          i2c_conv_result_int := i2c_conv_result_int_tmp + 1;
        else
          i2c_conv_result_int := i2c_conv_result_int_tmp;
        end if;
      end if;

      i2c_conv_result      := STD_LOGIC_VECTOR(TO_UNSIGNED(i2c_conv_result_int, 16));
      conv_result_i2c_addr <= i2c_conv_result;
      trig_i2c_addr_write  <= '1';

      case (i2c_conv_result(15 downto 12)) is
        when X"0"   => i2c_device_addr_vpvn <= "0110010";
        when X"1"   => i2c_device_addr_vpvn <= "0001011";
        when X"2"   => i2c_device_addr_vpvn <= "0010011";
        when X"3"   => i2c_device_addr_vpvn <= "0011011";
        when X"4"   => i2c_device_addr_vpvn <= "0100011";
        when X"5"   => i2c_device_addr_vpvn <= "0101011";
        when X"6"   => i2c_device_addr_vpvn <= "0110011";
        when X"7"   => i2c_device_addr_vpvn <= "0111011";
        when X"8"   => i2c_device_addr_vpvn <= "1000011";
        when X"9"   => i2c_device_addr_vpvn <= "1001011";
        when X"A"   => i2c_device_addr_vpvn <= "1010011";
        when X"B"   => i2c_device_addr_vpvn <= "1011011";
        when X"C"   => i2c_device_addr_vpvn <= "1100011";
        when X"D"   => i2c_device_addr_vpvn <= "1101011";
        when X"E"   => i2c_device_addr_vpvn <= "1110011";
        when X"F"   => i2c_device_addr_vpvn <= "0111010";
        when others => i2c_device_addr_vpvn <= "0000000";
                       --assert false report "[Unisim SYSMONE4-28] Invalid I2C address at power up is found. Check your Vp/Vn input."
                       --  severity warning;
       end case;

    end if; --trig_i2c_addr
  end process;
  -- end behavioral body

end SYSMONE1_V;
