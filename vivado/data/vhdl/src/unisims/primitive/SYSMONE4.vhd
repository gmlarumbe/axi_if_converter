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
-- /___/   /\     Filename    : SYSMONE4.vhd
-- \   \  /  \    Timestamp   :
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--                    
-- End Revision
-------------------------------------------------------------------------------
----- CELL SYSMONE4 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;


library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity SYSMONE4 is

generic (

    COMMON_N_SOURCE : std_logic_vector(15 downto 0) := X"FFFF";
    INIT_40 : std_logic_vector(15 downto 0) := X"0000";
    INIT_41 : std_logic_vector(15 downto 0) := X"0000";
    INIT_42 : std_logic_vector(15 downto 0) := X"0000";
    INIT_43 : std_logic_vector(15 downto 0) := X"0000";
    INIT_44 : std_logic_vector(15 downto 0) := X"0000";
    INIT_45 : std_logic_vector(15 downto 0) := X"0000";
    INIT_46 : std_logic_vector(15 downto 0) := X"0000";
    INIT_47 : std_logic_vector(15 downto 0) := X"0000";
    INIT_48 : std_logic_vector(15 downto 0) := X"0000";
    INIT_49 : std_logic_vector(15 downto 0) := X"0000";
    INIT_4A : std_logic_vector(15 downto 0) := X"0000";
    INIT_4B : std_logic_vector(15 downto 0) := X"0000";
    INIT_4C : std_logic_vector(15 downto 0) := X"0000";
    INIT_4D : std_logic_vector(15 downto 0) := X"0000";
    INIT_4E : std_logic_vector(15 downto 0) := X"0000";
    INIT_4F : std_logic_vector(15 downto 0) := X"0000";
    INIT_50 : std_logic_vector(15 downto 0) := X"0000";
    INIT_51 : std_logic_vector(15 downto 0) := X"0000";
    INIT_52 : std_logic_vector(15 downto 0) := X"0000";
    INIT_53 : std_logic_vector(15 downto 0) := X"0000";
    INIT_54 : std_logic_vector(15 downto 0) := X"0000";
    INIT_55 : std_logic_vector(15 downto 0) := X"0000";
    INIT_56 : std_logic_vector(15 downto 0) := X"0000";
    INIT_57 : std_logic_vector(15 downto 0) := X"0000";
    INIT_58 : std_logic_vector(15 downto 0) := X"0000";
    INIT_59 : std_logic_vector(15 downto 0) := X"0000";
    INIT_5A : std_logic_vector(15 downto 0) := X"0000";
    INIT_5B : std_logic_vector(15 downto 0) := X"0000";
    INIT_5C : std_logic_vector(15 downto 0) := X"0000";
    INIT_5D : std_logic_vector(15 downto 0) := X"0000";
    INIT_5E : std_logic_vector(15 downto 0) := X"0000";
    INIT_5F : std_logic_vector(15 downto 0) := X"0000";
    INIT_60 : std_logic_vector(15 downto 0) := X"0000";
    INIT_61 : std_logic_vector(15 downto 0) := X"0000";
    INIT_62 : std_logic_vector(15 downto 0) := X"0000";
    INIT_63 : std_logic_vector(15 downto 0) := X"0000";
    INIT_64 : std_logic_vector(15 downto 0) := X"0000";
    INIT_65 : std_logic_vector(15 downto 0) := X"0000";
    INIT_66 : std_logic_vector(15 downto 0) := X"0000";
    INIT_67 : std_logic_vector(15 downto 0) := X"0000";
    INIT_68 : std_logic_vector(15 downto 0) := X"0000";
    INIT_69 : std_logic_vector(15 downto 0) := X"0000";
    INIT_6A : std_logic_vector(15 downto 0) := X"0000";
    INIT_6B : std_logic_vector(15 downto 0) := X"0000";
    INIT_6C : std_logic_vector(15 downto 0) := X"0000";
    INIT_6D : std_logic_vector(15 downto 0) := X"0000";
    INIT_6E : std_logic_vector(15 downto 0) := X"0000";
    INIT_6F : std_logic_vector(15 downto 0) := X"0000";
    INIT_70 : std_logic_vector(15 downto 0) := X"0000";
    INIT_71 : std_logic_vector(15 downto 0) := X"0000";
    INIT_72 : std_logic_vector(15 downto 0) := X"0000";
    INIT_73 : std_logic_vector(15 downto 0) := X"0000";
    INIT_74 : std_logic_vector(15 downto 0) := X"0000";
    INIT_75 : std_logic_vector(15 downto 0) := X"0000";
    INIT_76 : std_logic_vector(15 downto 0) := X"0000";
    INIT_77 : std_logic_vector(15 downto 0) := X"0000";
    INIT_78 : std_logic_vector(15 downto 0) := X"0000";
    INIT_79 : std_logic_vector(15 downto 0) := X"0000";
    INIT_7A : std_logic_vector(15 downto 0) := X"0000";
    INIT_7B : std_logic_vector(15 downto 0) := X"0000";
    INIT_7C : std_logic_vector(15 downto 0) := X"0000";
    INIT_7D : std_logic_vector(15 downto 0) := X"0000";
    INIT_7E : std_logic_vector(15 downto 0) := X"0000";
    INIT_7F : std_logic_vector(15 downto 0) := X"0000";
    IS_CONVSTCLK_INVERTED : bit := '0';
    IS_DCLK_INVERTED : bit := '0';
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
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
    ADC_DATA             : out std_logic_vector(15 downto 0);
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
    SMBALERT_TS          : out std_ulogic;
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

end SYSMONE4;


architecture SYSMONE4_V of SYSMONE4 is

  constant MODULE_NAME                : string := "SYSMONE4";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  --constant SIM_DEVICE_ULTRASCALE_PLUS : std_logic_vector(1 downto 0) := "00";
  --constant SIM_DEVICE_ULTRASCALE_PLUS_ES1 : std_logic_vector(1 downto 0) := "01";
  --constant SIM_DEVICE_ZYNQ_ULTRASCALE : std_logic_vector(1 downto 0) := "10";
  --constant SIM_DEVICE_ZYNQ_ULTRASCALE_ES1 : std_logic_vector(1 downto 0) := "11";

  signal COMMON_N_SOURCE_BIN : std_logic_vector(15 downto 0);
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
  
  signal adc_data_out       : std_logic_vector(15 downto 0) := "0000000000000000";
  signal alm_out            : std_logic_vector(15 downto 0) := "0000000000000000";
  signal busy_out           : std_ulogic := '0';
  signal channel_out        : std_logic_vector(5 downto 0) := "000000";
  signal chan_reg_id_cur    : integer := 0;
  signal chan_out_id_cur    : integer := 0;
  signal chan_reg_id_next    : integer := 0;
  signal chan_out_id_next    : integer := 0;
  signal do_out             : std_logic_vector(15 downto 0) := "0000000000000000";
  signal drdy_out           : std_ulogic := '0';
  signal eoc_out            : std_ulogic := '0';
  signal eos_out            : std_ulogic := '0';
  signal i2c_sclk_ts_out    : std_ulogic;
  signal i2c_sda_ts_out     : std_ulogic;
  signal muxaddr_out        : std_logic_vector(4 downto 0) := "00000";
  signal ot_out             : std_ulogic := '0';
  signal smbalert_ts_out    : std_ulogic;
  
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

  --global signals for functions
  signal pmb_page_6V        : std_ulogic := '0';
  signal i2c_lsb_bit        : std_ulogic := '0';         

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

  function conv_combregid_to_chanout(
      combregid : std_logic_vector(5 downto 0)
  )
    return std_logic_vector is--(5 downto 0)
       variable conv_combregid_to_chanout_var : std_logic_vector(5 downto 0);
    begin
      -- invalid channel outputs are 7, 9-12, and >=36. They show up as selected via registers
      if(UNSIGNED(combregid) <= 7) then
        conv_combregid_to_chanout_var := STD_LOGIC_VECTOR(UNSIGNED(combregid) + 8);
      elsif (UNSIGNED(combregid) >= 8 and UNSIGNED(combregid) <= 15) then
        conv_combregid_to_chanout_var := STD_LOGIC_VECTOR(UNSIGNED(combregid) - 8);
      else
        conv_combregid_to_chanout_var := combregid;
      end if;
    return conv_combregid_to_chanout_var;
    end conv_combregid_to_chanout;

  function is_reserved_address(
      address_in : in std_logic_vector(7 downto 0)
    )
    return std_ulogic is
    variable is_reserved_address_pre: std_ulogic;
    variable address_in_us          : unsigned (7 downto 0);
    variable Message                : line;   
  begin
    address_in_us  := UNSIGNED(address_in);
    if( address_in_us = X"07" or
       (address_in_us >= X"0B" and address_in_us <= X"0C") or
        address_in_us = X"2B" or
       (address_in_us >= X"2F" and address_in_us <= X"37") or
       (address_in_us >= X"39" and address_in_us <= X"3D") or
        address_in_us = X"45" or
       (address_in_us >= X"64" and address_in_us <= X"67") or
       (address_in_us >= X"6D" and address_in_us <= X"79") or 
       (address_in_us >= X"7D" and address_in_us <= X"7F") or
       (address_in_us >= X"85" and address_in_us <= X"9F") or
       (address_in_us >= X"A5" and address_in_us <= X"A7") or
       (address_in_us >= X"AD" and address_in_us <= X"C8") or
       (address_in_us >= X"CA" and address_in_us <= X"FF")
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
    if((address_in_us <= X"02") or -- poke hole at 03 CR 993584
       (address_in_us >= X"04" and address_in_us <= X"3F") or
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


  --convert from linear 16 to drp format -> PMBus WRITE
  impure function linear16_to_drp (
      mantissa : in std_logic_vector(15 downto 0)
    )
    return std_logic_vector is --(15 downto 0) 
    variable mantissa_int : integer; --unsigned (15 downto 0);
    variable drp_int      : integer; --std_logic_vector (15 downto 0);
  begin
    mantissa_int  := SLV_TO_INT(mantissa);
    if(pmb_page_6V = '1') then -- CR 949547
      drp_int       := (mantissa_int * 2 ) / 3;
    else
      drp_int       := (mantissa_int * 4 ) / 3;
      if(drp_int > 65535) then
        drp_int := 65535; 
        assert false report "[Unisim SYSMONE4-62] The maximum value you can write to a DRP supply register is 16'hFFFF. Hence for PMBus it is 16'hAAAA. The input value has been saturated to max."
          severity warning;
      end if;
    end if;

    return  STD_LOGIC_VECTOR(TO_UNSIGNED(drp_int,16));
  end linear16_to_drp;

  --convert from drp format to linear 16 -> PMBus READ
  impure function drp_to_linear16 (
      voltage_drp : in std_logic_vector(15 downto 0)
    )
    return std_logic_vector is --(15 downto 0) 
    variable voltage_drp_int : integer; --unsigned (15 downto 0);
    variable linear16_int    : integer; --std_logic_vector (15 downto 0);
  begin
    voltage_drp_int := SLV_TO_INT(voltage_drp);
    if(pmb_page_6V = '1') then -- CR 949547
      linear16_int    := (voltage_drp_int * 3 ) / 2;
      if(linear16_int > 65535) then
        linear16_int := 65535; 
        if(i2c_lsb_bit = '1') then --display message only once
          assert false report "[Unisim SYSMONE4-63] The maximum value you can read from a DRP supply register is 16'hFFFF. Hence for PMBus it is 16'hAAAA. The return value has been saturated to max."
            severity warning;
        end if;
      end if;
    else
      linear16_int    := (voltage_drp_int * 3 ) / 4;
    end if;

    return  STD_LOGIC_VECTOR(TO_UNSIGNED(linear16_int,16));
  end drp_to_linear16;

  --convert from linear 11 to integer -> PMBus WRITE
  function linear11_to_drp (
      exp_mants : in std_logic_vector(15 downto 0)
    )
    return std_logic_vector is --(15 downto 0) 
    variable exp         : integer;
    variable mants       : real;
    variable mants_int   : integer;
    variable temp_coeff  : real;
    variable temp_offset : real;
    variable two_p_bits  : real;
    variable real_result : real;
    variable real_result_int : integer;
  begin
    exp         := TO_INTEGER(SIGNED(exp_mants(15 downto 11)));
    mants_int   := TO_INTEGER(SIGNED(exp_mants(10 downto 0 )));
    mants       := REAL(mants_int);
    temp_coeff  := 503.975 ;
    temp_offset := 273.15 ;
    two_p_bits  := 65536.0;
    real_result := ((mants * (2.0 ** exp))+ temp_offset) * (two_p_bits / temp_coeff);
    real_result_int := integer(real_result);
    return  STD_LOGIC_VECTOR(TO_UNSIGNED(real_result_int,16));
  end linear11_to_drp;


  -- Convert from integer to to linear 11 -> PMBus READ
  -- Exponent is -1 hard coded during PMBus reads.
  function drp_to_linear11 (
      drp_temp : in std_logic_vector(15 downto 0) --unsigned. temperature in drp format
    )
    return std_logic_vector is --(15 downto 0) 
    variable temp_coeff    : real;
    variable temp_offset   : real;
    variable two_p_bits    : real;
    variable drp_temp_real : real;
    variable mantissa_real : real;
    variable mantissa      : std_logic_vector (10 downto 0); --signed
    variable linear_11     : std_logic_vector (15 downto 0);
  begin
    temp_coeff    := 503.975 ;
    temp_offset   := 273.15 ;
    two_p_bits    := 65536.0;
    drp_temp_real := REAL(SLV_TO_INT(drp_temp(15 downto 0 )));
    mantissa_real := 2.0 * (((drp_temp_real * temp_coeff) / two_p_bits) - temp_offset);
    mantissa      := STD_LOGIC_VECTOR(TO_SIGNED(integer(mantissa_real),11));
    linear_11     := "11111" & mantissa;    

    return  linear_11;
  end drp_to_linear11;

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

    write(message_line, string'("***** SYSMONE4 Simulation Analog Data File Format ******"));
    writeline(output, message_line);
    write(message_line, string'("NAME: design.txt or user file name passed with generic sim_monitor_file"));
    writeline(output, message_line);
    write(message_line, string'("FORMAT: First line is header line. Valid column name are: TIME TEMP VCCINT VCCAUX VCCBRAM VCC_PSINTLP VCC_PSINTFP VCC_PSAUX VP VN VAUXP[0] VAUXN[0] ...."));
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

    constant LR_EVERY_OTHER          : std_logic_vector(1 downto 0) := "00";
    constant LR_EVERY_4TH       : std_logic_vector(1 downto 0) := "01"; 
    constant LR_EVERY_16TH      : std_logic_vector(1 downto 0) := "10"; 
    constant LR_EVERY_64TH      : std_logic_vector(1 downto 0) := "11"; 

    constant LR_EOS_HR_ONLY1    : std_logic_vector(1 downto 0) := "00"; 
    constant LR_EOS_LR_ONLY     : std_logic_vector(1 downto 0) := "01"; 
    constant LR_EOS_HR_LR       : std_logic_vector(1 downto 0) := "10"; 
    constant LR_EOS_HR_ONLY2    : std_logic_vector(1 downto 0) := "11"; 

    constant OT_LIMIT_DEFAULT        : integer := 51971;

    constant I2C_DRP_RD              : std_logic_vector (3 downto 0) :="0001"; --read
    constant I2C_DRP_WR              : std_logic_vector (3 downto 0) :="0010"; --write
    constant I2C_DRP_NO              : std_logic_vector (3 downto 0) :="0000"; --no operation

    constant CMD_PAGE                : std_logic_vector (7 downto 0) := X"00";
    constant CMD_CLEAR_FAULT         : std_logic_vector (7 downto 0) := X"03";
    constant CMD_CAPABILITY          : std_logic_vector (7 downto 0) := X"19";
    constant CMD_VOUT_MODE           : std_logic_vector (7 downto 0) := X"20";
    constant CMD_VOUT_OV_FAULT_LIMIT : std_logic_vector (7 downto 0) := X"40";
    constant CMD_VOUT_UV_FAULT_LIMIT : std_logic_vector (7 downto 0) := X"44";
    constant CMD_OT_FAULT_LIMIT      : std_logic_vector (7 downto 0) := X"4F";
    constant CMD_OT_WARNING_LIMIT    : std_logic_vector (7 downto 0) := X"51";
    constant CMD_UT_WARNING_LIMIT    : std_logic_vector (7 downto 0) := X"52";
    constant CMD_UT_FAULT_LIMIT      : std_logic_vector (7 downto 0) := X"53";
    constant CMD_STATUS_BYTE         : std_logic_vector (7 downto 0) := X"78";
    constant CMD_STATUS_WORD         : std_logic_vector (7 downto 0) := X"79";
    constant CMD_STATUS_VOUT         : std_logic_vector (7 downto 0) := X"7A";
    constant CMD_STATUS_TEMPERATURE  : std_logic_vector (7 downto 0) := X"7D";
    constant CMD_STATUS_CML          : std_logic_vector (7 downto 0) := X"7E";
    constant CMD_READ_VOUT           : std_logic_vector (7 downto 0) := X"88";
    constant CMD_READ_TEMPERATURE_1  : std_logic_vector (7 downto 0) := X"8D";
    constant CMD_PMBUS_REVISION      : std_logic_vector (7 downto 0) := X"98";
    constant CMD_MFR_ID              : std_logic_vector (7 downto 0) := X"99";
    constant CMD_MFR_MODEL           : std_logic_vector (7 downto 0) := X"9A";
    constant CMD_MFR_REVISION        : std_logic_vector (7 downto 0) := X"9B";
    constant CMD_MFR_SELECT_REG      : std_logic_vector (7 downto 0) := X"D0";
    constant CMD_MFR_ACCESS_REG      : std_logic_vector (7 downto 0) := X"D1";
    constant CMD_MFR_READ_VOUT_MAX   : std_logic_vector (7 downto 0) := X"D2";
    constant CMD_MFR_READ_VOUT_MIN   : std_logic_vector (7 downto 0) := X"D3";
    constant CMD_MFR_ENABLE_VUSER_HR : std_logic_vector (7 downto 0) := X"D5";
    constant CMD_MFR_READ_TEMP_MAX   : std_logic_vector (7 downto 0) := X"D6";
    constant CMD_MFR_READ_TEMP_MIN   : std_logic_vector (7 downto 0) := X"D7";

    constant PMB_ALERT_RESPONSE_ADDR : std_logic_vector (6 downto 0) := "0001100";

    constant CONV_CNT_P              : integer := 37;
    constant CONV_CNT                : integer := 48;
    
    constant eoc_distance            : integer := 18;
    constant alm_distance            : integer := 15;

    type     t_reg_file       is  array (integer range <>) of std_logic_vector(15 downto 0);
    --type     t_adc_state    is (S0_ST, S1_ST, S2_ST, S3_ST, S4_ST, S5_ST, S6_ST);
    type     t_adc_state    is (ST_A_FIRST_CALIB, ST_A_CALIB, ST_A_WAIT, ST_A_CHAN, ST_A_ALM, ST_A_EOC, ST_A_WAIT_ED);
    type     t_mn_data        is array (0 to 35)           of real;
    type     t_dr_data_reg    is array (0 to 63)           of std_logic_vector(15 downto 0);
    type     t_acc_array      is array (0 to 63)           of integer;
    type     t_seq_array      is array (37 downto 0 )      of integer;
    type     t_i2c_state is (ST_I2C_IDLE, ST_I2C_GET_ADDR, ST_I2C_GET_CMD, ST_I2C_READ);
    type     t_pmb_state is (ST_PMB_IDLE, ST_PMB_GET_ADDR, ST_PMB_GET_CMD, ST_PMB_WRITE, ST_PMB_READ);

    signal   dr_sram             : t_reg_file(64 to 255);
    signal   dr_sram_buffer      : t_reg_file(64 to 255);
    signal   data_reg            : t_dr_data_reg
                                 := ( 36 to 39 => "1111111111111111",
                                      44 to 46 => "1111111111111111",
                                      others=>"0000000000000000");
    
    signal   adc_state           : t_adc_state;
    signal   adc_next_state      : t_adc_state;
    signal   adc_state_d         : t_adc_state;
    signal   adc_state_d_dclk    : t_adc_state;
    signal   trig_attr           : std_ulogic := '0';
    signal   chan_asrt_1         : std_ulogic := '0';
    signal   chan_asrt_2         : std_ulogic := '0';
    signal   chan_asrt_3         : std_ulogic := '0';
    signal   chan_asrt_4         : std_ulogic := '0';
    signal   chan_asrt_5         : std_ulogic := '0';
    signal   chan_asrt_6         : std_ulogic := '0';
    signal   busy_start          : std_ulogic := '0';
    signal   busy_end            : std_ulogic := '0';
    signal   busy_end_out        : std_ulogic := '0';
    signal   busy_start_ed       : std_ulogic := '0';
    signal   busy_start_cs       : std_ulogic := '0';
    signal   busy_start_cs_d     : std_ulogic := '0';
    signal   busy_end_ed         : std_ulogic := '0';
    signal   busy_end_ed_out     : std_ulogic := '0';
    signal   busy_end_ed_wait    : std_ulogic := '0';
    signal   busy_end_cs         : std_ulogic := '0';
    signal   busy_end_cs_out     : std_ulogic := '0';
    signal   busy_end_d          : std_ulogic := '0';
    signal   busy_end_out_d      : std_ulogic := '0';
    signal   busy_end_pe         : std_ulogic := '0';
    signal   chan_asrt           : std_ulogic := '0';
    signal   chan_asrt_ed        : std_ulogic := '0';
    signal   chan_asrt_cs        : std_ulogic := '0';
    signal   chan_asrt_pe        : std_ulogic := '0';
    signal   chan_asrt_dclk      : std_ulogic := '0';
    signal   chan_asrt_d         : std_ulogic := '0';
    signal   conv_track_cs       : std_ulogic := '0';
    signal   conv_track_ed       : std_ulogic := '0';
    signal   conv_track          : std_ulogic := '0';
    signal   cal_end_level       : std_ulogic := '0';
    signal   cal_end_level_d     : std_ulogic := '0';
    signal   cal_end             : std_ulogic := '0';
    signal   conversion_before_calib  : std_ulogic := '0';
    signal   hr_final_conversion : std_ulogic := '0';
    signal   lr_final_conversion : std_ulogic := '0';
    signal   tot_final_conversion : std_ulogic := '0';
    signal   seq_lr_selected_p : std_ulogic := '0';
    signal   cal_factor          : integer := 0;
    signal   cal_factor2         : integer := 0;
    signal   first_cal_limit     : integer := 0;
    signal   later_cal_limit     : integer := 0;
    signal   conv_period         : integer := 0;
    signal   busy_start_point    : integer := 0;
    signal   cs_count_tot        : integer := 0;
    signal   cal_limit           : integer := 0;
    signal   acq_ext             : std_ulogic := '0';
    signal   acq_ext_cur         : std_ulogic := '0';
    signal   acq_ext_cur_d       : std_ulogic := '0';
    signal   acq_ext_d           : std_ulogic := '0';
    signal   bipolar_cur         : std_ulogic := '0';
    signal   avg_cur             : std_ulogic := '0';
    signal   acq_ext_next        : std_ulogic := '0';
    signal   bipolar_next        : std_ulogic := '0';
    signal   avg_next            : std_ulogic := '0';
    signal   convst_pre_dclk_pe  : std_ulogic := '0';
    signal   convst_pre_adcclk_pe: std_ulogic := '0';
    signal   convst_saved        : std_ulogic := '0';
    signal   convst_adcclk_d1    : std_ulogic := '0';   
    signal   convst_adcclk_d2    : std_ulogic := '0';   
    signal   convst_dclk_d1      : std_ulogic := '0';   
    signal   one_pass_end        : std_ulogic := '0';
    signal   alm_asrt            : std_ulogic := '0';
    signal   eoc_asrt            : std_ulogic := '0';
    signal   st_first_calib_chan : std_ulogic := '0';
    signal   lr_chan_on          : std_ulogic := '0';
    signal   cont_seq_only_hr    : std_ulogic := '0';
    signal   lr_calib_on         : std_ulogic := '0';
    signal   sysmon_rst          : std_ulogic := '0';
    signal   int_rst_sync1       : std_ulogic := '0';
    signal   int_rst_sync2       : std_ulogic := '0';
    signal   int_rst_combined    : std_ulogic := '0';
    signal   int_rst_combined_d  : std_ulogic := '0';
    signal   alm_rst             : std_ulogic := '0';
    signal   soft_rst            : std_ulogic := '0';
    signal   seq_rst             : std_ulogic := '0';
    signal   init_rst            : std_ulogic := '0';
    signal   out_counter         : integer    := 0;
    signal   ed_counter          : integer    := 0;
    signal   cs_counter          : integer    := 0;
    signal   cal_counter         : integer    := 0;
    signal   out_counter_inc     : std_ulogic := '0';
    signal   ed_counter_inc      : std_ulogic := '0';
    signal   initialize          : std_logic_vector(2 downto 0) := "000";
    signal   cfg_reg0            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg0_adc        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg0_seq        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg1            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg1_init       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg2            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg3            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   cfg_reg4            : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   single_chan_id      : std_logic_vector(5 downto 0) := "000000";
    signal   ext_mux_chan_id     : std_logic_vector(5 downto 0) := "000000";
    signal   op_mode             : std_logic_vector(3 downto 0) := "0000";
    signal   curr_seq1_0         : std_logic_vector(3 downto 0) := "0000";
    signal   curr_seq1_0_lat     : std_logic_vector(3 downto 0) := "0000";
    signal   busy_r              : std_ulogic := '0';
    signal   busy_r_rst          : std_ulogic := '0';
    signal   ext_mux             : std_ulogic := '0';
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
    signal   adcclk_period_start : std_ulogic := '0';
    signal   adcclk_period_end   : std_ulogic := '0';
    signal   adcclk_period_end_d : std_ulogic := '0';
    signal   adcclk_div1         : std_ulogic := '0';
    signal   sysclk              : std_ulogic := '0';
    signal   chan_out_id_cur_slv : std_logic_vector(5 downto 0) := "000000";
    signal   averaging           : std_logic_vector(1 downto 0) := "00";
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
    signal   single_pass_finished   : boolean := false;
    signal   single_pass_finished_d : boolean := false;
    signal   single_pass_finished_pe: boolean := false;
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
    signal   seq_chan_reg1       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_chan_reg2       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_chan_reg3       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_reg1        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_reg2        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_reg3        : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_bipolar_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_bipolar_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_acq_ext_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_acq_ext_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
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
    signal   mn_mux_in           : real := 0.0;
    signal   adc_temp_result     : real := 0.0;
    signal   adc_intpwr_result   : real := 0.0;
    signal   adc_ext_result      : real := 0.0;
    signal   muxaddr_o           :  std_logic_vector(4 downto 0) := "00000";

    signal   seq_reset           : std_ulogic := '0';
    signal   seq_en              : std_ulogic := '0';
    signal   seq_en_drp          : std_ulogic := '0';
    signal   seq_en_init         : std_ulogic := '0';
    signal   seq_en_dly          : std_ulogic := '0';
    signal   hr_tot_chan         : integer := 0;
    signal   seq_hr_mem             : t_seq_array :=(others=>0);
    signal   seq_lr_mem             : t_seq_array :=(others=>0);
    signal   lr_eos_en           : std_ulogic := '0';
    signal   ds_eos_en           : std_ulogic := '0';
    signal   ds_eos_tmp_en       : std_ulogic := '0';
    signal   lr_eos_tmp_en       : std_ulogic := '0';
    signal   ds_lr_eos_tmp_en    : std_ulogic := '0';
    signal   chan_avg_hr_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_hr_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_hr_reg3    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_hr_reg_comb : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal   chan_avg_hr_set     : std_ulogic := '0';
    signal   chan_avg_lr_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_lr_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   chan_avg_lr_reg3    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_avg_lr_reg_comb : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal   chan_avg_lr_set     : std_ulogic := '0';
    signal   seq_hr_chan_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_hr_chan_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_hr_chan_reg3    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_lr_chan_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_lr_chan_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_lr_chan_reg3    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   seq_lr_chan_reg_comb : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal   seq_hr_chan_reg_comb : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal   seq_acq_ext_reg_comb : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal   seq_bipolar_reg_comb : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal   lr_chan_avg_reg     : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   lr_chan_avg_reg1    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   lr_chan_avg_reg2    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   lr_chan_avg_reg3    : std_logic_vector(15 downto 0) := "0000000000000000";
    signal   lr_chan_avg         : std_ulogic := '0';
    signal   seq_lr_count        : integer := 0;
    signal   seq_lr_count_a      : integer := 0;
    signal   ds_count            : integer := 1;
    signal   ds_count_a          : integer := 1;
    signal   lr_seq_status_avg   : integer := 0;
    signal   int_tot_per         : integer := 0;
    signal   hr_lr_tot_per       : integer := 0;
    signal   tot_per             : integer := 0;
    signal   lr_s_turn            : integer := 0;
    signal   avg_loop_count_hr    : integer := 0;
    signal   avg_amount           : integer := 0;
    signal   avg_loop_count_lr    : integer := 0;
    signal   seq_lr_selected      : std_ulogic := '0';
    signal   avg_final_loop       : std_ulogic := '0';
    signal   avg_en               : std_ulogic := '0';
    signal   avg_final_loop_hr     : std_ulogic := '0';
    signal   seq_lr_selected_d     : std_logic_vector(1 downto 0) := (others => '0');
    signal   add_channel           : std_ulogic := '0';
    signal   add_channel_hr_p      : std_ulogic := '0';
    signal   add_channel_lr_p      : std_ulogic := '0';
    signal   avg_final_loop_lr     : std_ulogic := '0';
    signal   conv_tot_count        : integer := 0;
    signal   conv_hr_count         : integer := 0;
    signal   conv_lr_count         : integer := 0;
    signal   conv_lr_count_p       : integer := 0;
    signal   conv_hr_count_p       : integer := 0;
    signal   lr_tot_chan         : integer := 0;
    signal   call_seq_lr_count   : std_ulogic := '0';
    signal   call_seq_count_a    : std_ulogic := '0';
    signal   call_seq_lr_count_a : std_ulogic := '0';
    signal   hr_lr_chan          : std_ulogic := '0';
    signal   lr_eos              : std_logic_vector(1 downto 0) := (others => '0');
    signal   lr_rate             : std_logic_vector(1 downto 0) := (others => '0');
    signal   call_seq_count      : std_ulogic := '0';

    signal   adc_seq_reset       : std_ulogic := '0';
    signal   adc_seq_en          : std_ulogic := '0';
    signal   adc_seq_reset_dly   : std_ulogic := '0';
    signal   adc_seq_en_dly      : std_ulogic := '0';
    signal   adc_seq_reset_hold  : std_ulogic := '0';
    signal   adc_seq_en_hold     : std_ulogic := '0';
    signal   rst_lock            : std_ulogic := '1';
    signal   sim_file_flag       : std_ulogic := '0';
    signal   convst_in_ored      : std_ulogic := '0';
    signal   convst_in_pre       : std_ulogic := '0';
    signal   daddr_in_lat        : std_logic_vector(7 downto 0) := "00000000";
    signal   daddr_in_lat_int    : integer := 0;
    signal   drdy_out_pre1       : std_ulogic := '0';
    signal   drdy_out_pre2       : std_ulogic := '0';
    signal   drdy_out_pre3       : std_ulogic := '0';
    signal   read_only_pre       : std_ulogic := '0';
    signal   reserved_addr       : std_ulogic := '0';
    signal   read_only           : std_ulogic := '0';
    signal   alm_en              : std_logic_vector(12 downto 0) := "1111111111111";
    signal   adcclk_tmp          : std_ulogic := '0';
    signal   adcclk_count        : integer := -1;
    signal   adcclk_count_rst    : std_ulogic := '0';
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
    signal   post_process        : std_ulogic := '0';
    signal   cfg_check_addr_us   : unsigned (7 downto 0)  :=X"00";
    signal   cfg_in              : std_logic_vector (15 downto 0) :=X"0000";
    
    signal   default_mode        : boolean := false;
    signal   single_pass_mode    : boolean := false;
    signal   single_pass_active  : boolean := false;
    signal   cont_seq_mode       : boolean := false;
    signal   single_chan_mode    : boolean := false;
    signal   event_driven_mode   : boolean := false;
    signal   cont_sampl_mode     : boolean := false;
    signal   bipolar_mode        : boolean := false;
  

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
                                                
    signal pmb_en                     : std_logic  := '0';
    signal pmb_en_bit                 : std_ulogic := '0';
    signal pmb_sel_addr               : std_logic_vector (7 downto 0) := "00000000";--select address for MFR command
    signal pmb_state                  : t_pmb_state := ST_PMB_IDLE;   
    signal pmb_tot_bytes              : integer range 0 to 4 := 0;       
    signal pmb_data_end               : std_ulogic := '0';          
    signal pmb_cmd_pre                : std_logic_vector (7 downto 0);     
    signal pmb_cmd_in                 : std_logic_vector (7 downto 0);    
    signal pmb_data_out               : std_logic_vector (31 downto 0);     
    signal pmb_data_in                : std_logic_vector (15 downto 0);    
    signal pmb_wr_exec                : std_ulogic := '0';         
    signal pmb_wr_exec_2              : std_ulogic := '0';           
    signal pmb_wr_exec_3              : std_ulogic := '0';           
    signal pmb_drsram_wr_data         : std_logic_vector (15 downto 0);          
    signal pmb_drsram_addr            : std_logic_vector (7  downto 0);          
    signal pmb_drsram_addr_page       : std_logic_vector (7  downto 0);          
    signal pmb_drsram_bit_idx         : integer := 0; 
    signal pmb_valid_page             : std_ulogic := '0';           
    signal pmb_curr_chan_id           : std_logic_vector (7 downto 0);           
    signal pmb_read_only_cmd          : std_ulogic := '0';               
    signal pmb_status_vout            : std_logic_vector (7 downto 0);         
    signal pmb_status_temperature     : std_logic_vector (7 downto 0); 
    signal pmb_status_cml             : std_logic_vector (7 downto 0);        
    signal pmb_clr_status_vout        : std_logic_vector (7 downto 0);             
    signal pmb_clr_status_temperature : std_logic_vector (7 downto 0);  
    signal pmb_clr_status_cml         : std_logic_vector (7 downto 0);            
    signal pmb_status_word            : std_logic_vector (7 downto 0);          --upper byte
    signal pmb_status_byte            : std_logic_vector (7 downto 0);          --lower byte
    signal pmb_unsp_cmd               : std_ulogic := '0';          
    signal pmb_unsp_data              : std_ulogic := '0';           
    signal pmb_paged                  : std_ulogic := '0';       
    signal pmb_selected               : std_ulogic := '0';          
    signal pmb_page_index             : std_logic_vector (7 downto 0);        
    signal pmb_page_stat              : std_logic_vector (7 downto 0);       
    signal pmb_page_max               : std_logic_vector (7 downto 0);          --max stored value address
    signal pmb_page_min               : std_logic_vector (7 downto 0);          --min stored value address
    signal pmb_page_up_l              : std_logic_vector (7 downto 0);          --upper limit register address
    signal pmb_page_lo_l              : std_logic_vector (7 downto 0);          --lower limit register address
    signal pmb_page_alm_id            : integer range 0 to 15 :=0; 
    signal pmb_ara_rcvd               : std_ulogic := '0';          
    signal pmb_ara                    : std_ulogic := '0';  --alert response address
    signal clear_faults               : std_ulogic := '0';          
    signal pmb_clr                    : std_ulogic := '0';          


    signal trig_i2c_addr              : std_ulogic := '0';
    signal trig_i2c_addr_write        : std_ulogic := '0';
    signal conv_result_i2c_addr       : std_logic_vector(15 downto 0) := (others => '0');

    signal bank_sel_6V                : std_logic_vector(3 downto 0) := (others => '0');

  -- start behavioral body
  -- common declarations first, INIT PROC, then functional  
begin 

  ADC_DATA         <= adc_data_out after 100 ps;
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
  SMBALERT_TS      <= smbalert_ts_out;
--  SMBALERT_TS      <= smbalert_ts_out after OUT_DELAY;

  convstclk_in     <= CONVSTCLK xor IS_CONVSTCLK_INVERTED_BIN;
  convst_in        <= CONVST xor '0';
  convst_in_ored   <= '1' when (CONVST_in = '1' or convstclk_in = '1') else  '0';
  convst_in_pre    <= '0' when (sysmon_rst = '1') else '1' when (convst_in_ored= '1' and event_driven_mode and busy_out='0') else '0';
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

  COMMON_N_SOURCE_BIN <= COMMON_N_SOURCE;
  
  INIT_40_BIN <= INIT_40;
  
  INIT_41_BIN <= INIT_41;
  
  INIT_42_BIN <= INIT_42;
  
  INIT_43_BIN <= INIT_43;
  
  INIT_44_BIN <= INIT_44;
  
  INIT_45_BIN <= INIT_45;
  
  INIT_46_BIN <= INIT_46;
  
  INIT_47_BIN <= INIT_47;
  
  INIT_48_BIN <= INIT_48;
  
  INIT_49_BIN <= INIT_49;
  
  INIT_4A_BIN <= INIT_4A;
  
  INIT_4B_BIN <= INIT_4B;
  
  INIT_4C_BIN <= INIT_4C;
  
  INIT_4D_BIN <= INIT_4D;
  
  INIT_4E_BIN <= INIT_4E;
  
  INIT_4F_BIN <= INIT_4F;
  
  INIT_50_BIN <= INIT_50;
  
  INIT_51_BIN <= INIT_51;
  
  INIT_52_BIN <= INIT_52;
  
  INIT_53_BIN <= INIT_53;
  
  INIT_54_BIN <= INIT_54;
  
  INIT_55_BIN <= INIT_55;
  
  INIT_56_BIN <= INIT_56;
  
  INIT_57_BIN <= INIT_57;
  
  INIT_58_BIN <= INIT_58;
  
  INIT_59_BIN <= INIT_59;
  
  INIT_5A_BIN <= INIT_5A;
  
  INIT_5B_BIN <= INIT_5B;
  
  INIT_5C_BIN <= INIT_5C;
  
  INIT_5D_BIN <= INIT_5D;
  
  INIT_5E_BIN <= INIT_5E;
  
  INIT_5F_BIN <= INIT_5F;
  
  INIT_60_BIN <= INIT_60;
  
  INIT_61_BIN <= INIT_61;
  
  INIT_62_BIN <= INIT_62;
  
  INIT_63_BIN <= INIT_63;
  
  INIT_64_BIN <= INIT_64;
  
  INIT_65_BIN <= INIT_65;
  
  INIT_66_BIN <= INIT_66;
  
  INIT_67_BIN <= INIT_67;
  
  INIT_68_BIN <= INIT_68;
  
  INIT_69_BIN <= INIT_69;
  
  INIT_6A_BIN <= INIT_6A;
  
  INIT_6B_BIN <= INIT_6B;
  
  INIT_6C_BIN <= INIT_6C;
  
  INIT_6D_BIN <= INIT_6D;
  
  INIT_6E_BIN <= INIT_6E;
  
  INIT_6F_BIN <= INIT_6F;
  
  INIT_70_BIN <= INIT_70;
  
  INIT_71_BIN <= INIT_71;
  
  INIT_72_BIN <= INIT_72;
  
  INIT_73_BIN <= INIT_73;
  
  INIT_74_BIN <= INIT_74;
  
  INIT_75_BIN <= INIT_75;
  
  INIT_76_BIN <= INIT_76;
  
  INIT_77_BIN <= INIT_77;
  
  INIT_78_BIN <= INIT_78;
  
  INIT_79_BIN <= INIT_79;
  
  INIT_7A_BIN <= INIT_7A;
  
  INIT_7B_BIN <= INIT_7B;
  
  INIT_7C_BIN <= INIT_7C;
  
  INIT_7D_BIN <= INIT_7D;
  
  INIT_7E_BIN <= INIT_7E;
  
  INIT_7F_BIN <= INIT_7F;
  
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


  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2") and 
          (SIM_DEVICE /= "ZYNQ_ULTRASCALE") and 
          (SIM_DEVICE /= "ZYNQ_ULTRASCALE_ES1") and
          (SIM_DEVICE /= "ZYNQ_ULTRASCALE_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-168] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"", "));
        Write ( Message, string'("""ZYNQ_ULTRASCALE"", "));
        Write ( Message, string'("""ZYNQ_ULTRASCALE_ES1"", or "));
        Write ( Message, string'("""ZYNQ_ULTRASCALE_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(SYSMONE4_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;

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
          Write ( Message, string'(SYSMONE4_V'PATH_NAME));
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
          Write ( Message, string'(SYSMONE4_V'PATH_NAME));
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
          Write ( Message, string'(SYSMONE4_V'PATH_NAME));
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
          Write ( Message, string'(SYSMONE4_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;

    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-111] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(SYSMONE4_V'PATH_NAME));
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
       variable init40h_tmp_chan : integer;
       variable init44h_tmp : std_logic_vector(15 downto 0);
       variable tmp_value : std_logic_vector(7 downto 0);
   begin

        init40h_tmp := INIT_40_BIN;
        init40h_tmp_chan := SLV_TO_INT(SLV=>init40h_tmp(5 downto 0));
        init41h_tmp := INIT_41_BIN;
        init42h_tmp := INIT_42_BIN;
        tmp_value :=  init42h_tmp(15 downto 8);
        init4eh_tmp := INIT_4E_BIN;
        init44h_tmp := INIT_44_BIN;
 
        if ((init41h_tmp(15 downto 12)="0011") and (init40h_tmp(8)='1') and (init40h_tmp_chan /= 3 ) and (init40h_tmp_chan < 16)) then
          assert false report "[Unisim SYSMONE4-1] The attribute INIT_40 bit[8] must be set to 0. Long acquistion mode is only allowed for external channels."
            severity warning;
        end if;

        if ((init41h_tmp(15 downto 12) /="0011") and (init4eh_tmp(10 downto 0) /= "00000000000") and (init4eh_tmp(15 downto 12) /= "0000")) then
          assert false report "[Unisim SYSMONE4-2] The attribute INIT_4E Bit[15:12] and bit[10:0] must be set to 0. Long acquistion mode is only allowed for external channels."
            severity warning;
        end if;

        if ((init41h_tmp(15 downto 12)="0011") and (init40h_tmp(13 downto 12) /= "00") and (INIT_46 /=X"0000") and (INIT_48 /=X"0000") and (INIT_49 /= X"0000")) then
          assert false report "[Unisim SYSMONE4-3] The attribute INIT_46, INIT_48 and INIT_49 must be set to 0000h in single channel mode and averaging enabled."
            severity warning;
        end if;

        if (init44h_tmp(3 downto 0)/="0000")  then -- CR 952216 
          assert false report "[Unisim "&string'(MODULE_NAME)&"-44] The attribute INIT_44[3:0]/=0000. For related VUSER banks, where 0-6V range has been selected, analog input file must reflect the selected input range."
            severity note;
        end if;

        if (not(SIM_DEVICE = "ULTRASCALE_PLUS" or SIM_DEVICE = "ULTRASCALE_PLUS_ES1" or SIM_DEVICE = "ZYNQ_ULTRASCALE" or SIM_DEVICE = "ZYNQ_ULTRASCALE_ES1" or SIM_DEVICE = "ULTRASCALE_PLUS_ES2" or SIM_DEVICE = "ZYNQ_ULTRASCALE_ES2" )) then
          assert false report "[Unisim "&string'(MODULE_NAME)&"-45] Attribute Syntax: The attribute SIM_DEVICE value need to be ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2, ZYNQ_ULTRASCALE, ZYNQ_ULTRASCALE_ES1 or ZYNQ_ULTRASCALE_ES2."
            severity warning;
        end if;

        wait;
   end process;


   chan_out_id_cur_slv <= STD_LOGIC_VECTOR(TO_UNSIGNED(chan_out_id_cur,6));

   
  CHEK_COMM_P : process( chan_asrt_3 )
       variable Message : line;
  begin 
  if (rising_edge(chan_asrt_3)) then
    if (chan_asrt_3 ='1' and sysmon_rst = '0' ) then
     if (not bipolar_mode and ((chan_out_id_cur =3) or (chan_out_id_cur >= 16 and chan_out_id_cur <= 31))) then
      if ( bipolar_cur='0' and (chan_valn_tmp(chan_out_id_cur) > chan_val_tmp(chan_out_id_cur))) then
        Write ( Message, string'("Warning : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-8] The N input for external channel "));
        Write ( Message, chan_out_id_cur);
        Write ( Message, string'(" must be smaller than P input when in unipolar mode (P="));
        Write ( Message, chan_val_tmp(chan_out_id_cur));
        Write ( Message, string'(" N="));
        Write ( Message, chan_valn_tmp(chan_out_id_cur));
        Write ( Message, string'(") for SYSMONE4."));
        assert false report Message.all severity warning;
        DEALLOCATE (Message);
       end if;

     if (((chan_valn_tmp(chan_out_id_cur) > 0.5) or (chan_valn_tmp(chan_out_id_cur) < 0.0)) and not (bipolar_cur='1')) then
       Write ( Message, string'("Warning : [Unisim "));
       Write ( Message, string'(MODULE_NAME));
       Write ( Message, string'("-9] The range of N input for external channel "));
       Write ( Message, chan_out_id_cur);
       Write ( Message, string'(" should be between 0V to 0.5V when in unipolar mode (N="));
       Write ( Message, chan_valn_tmp(chan_out_id_cur));
       Write ( Message, string'(") for SYSMONE4."));
       assert false report Message.all severity warning;
       DEALLOCATE (Message);
    end if;

     if (bipolar_cur='1' and (((chan_val_tmp(chan_out_id_cur)-chan_valn_tmp(chan_out_id_cur)) > 0.5) or ((chan_val_tmp(chan_out_id_cur)-chan_valn_tmp(chan_out_id_cur)) <-0.5))) then
       Write ( Message, string'("Warning : [Unisim "));
       Write ( Message, string'(MODULE_NAME));
       Write ( Message, string'("-56] Vp-Vn for external channel "));
       Write ( Message, chan_out_id_cur);
       Write ( Message, string'(" must be in [-0.5,0.5] V range when in bipolar mode. (P="));
       Write ( Message, chan_val_tmp(chan_out_id_cur));
       Write ( Message, string'(" N="));
       Write ( Message, chan_valn_tmp(chan_out_id_cur));
       Write ( Message, string'(") for SYSMONE4."));
       assert false report Message.all severity warning;
       DEALLOCATE (Message);
     end if;

   end if;
  end if;
  end if;
  end process;



  p_muxaddr_out : process (DCLK_in, sysmon_rst)
  begin
    if(rising_edge(DCLK_in) or rising_edge(sysmon_rst)) then
      if (sysmon_rst = '1') then
        muxaddr_out <= "00000";
      else
        if(not ext_mux_en) then
          muxaddr_out <= "00000";
        elsif(or_reduct(initialize)='1' or adc_state=ST_A_FIRST_CALIB or adc_state=ST_A_CALIB) then
          muxaddr_out <= "01000"; --stay in calibration until first channel conversion
        elsif( chan_asrt_6 = '1' or (channel_out=8 and busy_end_out_d='1' ) ) then
          muxaddr_out <= STD_LOGIC_VECTOR(TO_UNSIGNED(chan_out_id_next, 5));
        end if;
      end if;
    end if;
  end process;


  chan_out_p : process(DCLK_in,sysmon_rst)
  begin
   if(rising_edge(DCLK_in) or rising_edge(sysmon_rst)) then
    if (sysmon_rst ='1') then
      channel_out   <= "001000";
    else
      if(or_reduct(initialize)='1' or chan_asrt_6 = '1' ) then
        channel_out <= STD_LOGIC_VECTOR(TO_UNSIGNED(chan_out_id_cur,6));
      end if;
    end if;
  end if;
  end process;

  --CR 864019
  --CR 910473 Fixed ADC_DATA output register timing
  p_adc_data_out : process(DCLK_in, sysmon_rst)
    begin
   if(rising_edge(DCLK_in) or rising_edge(sysmon_rst)) then
    if (sysmon_rst ='1') then
        adc_data_out <= X"0000";
    elsif(eoc_asrt='1') then
      if (chan_out_id_cur >= 32) then
        adc_data_out <= dr_sram(chan_out_id_cur + 96);
      elsif (chan_out_id_cur >= 0 and chan_out_id_cur <= 31) then
        adc_data_out <= data_reg(chan_out_id_cur);   
      end if;
     end if;
    end if;
  end process;

 -------------------------------------------------------------------- 
 --- internal reset generation
 -------------------------------------------------------------------- 
  INT_RST_GEN : process
  begin
    alm_rst <= '0';
    init_rst <= '1';
    wait until (falling_edge(RESET_in));
    wait until (rising_edge(dclk_in));
    wait until (rising_edge(dclk_in));
    init_rst <= '0';
    alm_rst  <= '1';
    wait until (rising_edge(dclk_in));
    wait until (rising_edge(dclk_in));
    alm_rst <= '0';
    wait;
  end process;

  int_rst_combined <= init_rst or soft_rst or seq_rst; -- all internally generated
  int_rst_combined_d <= int_rst_combined after 10 ps;
  sysmon_rst <= int_rst_sync2 or reset_in or gsr_in; -- combined reset

--synchronize internally generated reset to adcclk
 INT_RST_SYNC : process(adcclk,int_rst_combined_d)
 begin
   if((adcclk'event and adcclk='1') or (int_rst_combined_d'event and int_rst_combined_d='1')) then
     if(int_rst_combined_d = '1') then
       int_rst_sync1 <= '1';
       int_rst_sync2 <= '1';
      else
       int_rst_sync1 <= int_rst_combined_d;
       int_rst_sync2 <= int_rst_sync1;
     end if;
   end if;
 end process;

 p_initialize : process(sysmon_rst,DCLK_in)
 begin
   if((sysmon_rst'event and sysmon_rst='1') or (DCLK_in'event and DCLK_in='1')) then
     if(sysmon_rst = '1') then
       initialize <= "001";
     else
       initialize <= initialize(1 downto 0) & '0';
     end if;
  end if;
 end process;
 

  p_adc_next_state : process (adc_state, sysmon_rst,initialize,cal_end,cont_sampl_mode,single_pass_finished,
                              event_driven_mode,convst_pre_adcclk_pe, chan_asrt_dclk,
                             single_pass_mode,conversion_before_calib,single_chan_mode,alm_asrt,eoc_asrt,
                             hr_final_conversion,acq_ext_cur)
  begin
   if (sysmon_rst='1' or or_reduct(initialize(2 downto 0))='1' ) then
     adc_next_state <= ST_A_FIRST_CALIB;
   else
    case (adc_state) is
      when  ST_A_FIRST_CALIB => if(cont_sampl_mode and cal_end = '1' and not single_pass_finished) then
                                  adc_next_state <= ST_A_CHAN;
                                elsif (event_driven_mode and cal_end='1') then
                                  adc_next_state <= ST_A_WAIT_ED;
                                end if;

      when  ST_A_CALIB       => if (cont_sampl_mode and cal_end = '1' and not single_pass_mode) then
                                  adc_next_state <= ST_A_CHAN;
                                elsif (event_driven_mode and cal_end='1') then
                                  if(convst_pre_adcclk_pe = '1') then
                                    adc_next_state <= ST_A_CHAN;
                                  else
                                    adc_next_state <= ST_A_WAIT_ED;
                                  end if;
                                end if;
      when  ST_A_WAIT_ED     => if ( convst_pre_adcclk_pe = '1') then 
                                  adc_next_state <= ST_A_WAIT;
                                end if;

      when  ST_A_WAIT        => if (cont_sampl_mode and single_pass_mode and hr_final_conversion='1' and acq_ext_cur='1' ) then 
                                  if(busy_out = '1') then
                                    adc_next_state <= ST_A_FIRST_CALIB;
                                  else
                                    adc_next_state <= ST_A_WAIT;
                                  end if;
                                elsif (conversion_before_calib = '1' and not single_chan_mode and chan_asrt_dclk='1') then
                                  adc_next_state <= ST_A_CALIB;
                                elsif (chan_asrt_dclk='1') then
                                  adc_next_state <= ST_A_CHAN;
                                end if;
      when ST_A_CHAN         => if(convst_pre_adcclk_pe ='1') then
                                  adc_next_state <= ST_A_WAIT;
                                elsif (alm_asrt = '1') then
                                  adc_next_state <= ST_A_ALM;
                                end if;
      when ST_A_ALM          => if(convst_pre_adcclk_pe ='1') then
                                  adc_next_state <= ST_A_WAIT;
                                elsif(eoc_asrt = '1') then
                                  adc_next_state <= ST_A_EOC;
                                end if;
      when  ST_A_EOC         => if(convst_pre_adcclk_pe ='1') then
                                  adc_next_state <= ST_A_WAIT;
                                elsif (cont_sampl_mode and single_pass_mode and hr_final_conversion = '1' and acq_ext_cur='0')  then
                                  adc_next_state <= ST_A_FIRST_CALIB;
                                elsif (event_driven_mode) then
                                  adc_next_state <= ST_A_WAIT_ED;
                                else
                                  adc_next_state <= ST_A_WAIT;
                                end if;
      when  others           => adc_next_state <= ST_A_FIRST_CALIB;
    end case;
   end if;
  end process;
  
p_adc_state : process(DCLK_in,sysmon_rst)
begin
   if ((DCLK_in'event and DCLK_in='1') or (sysmon_rst'event and sysmon_rst='1')) then
     if (sysmon_rst = '1') then
       adc_state <= ST_A_FIRST_CALIB;
     else
       adc_state <= adc_next_state;
     end if;
   end if;
end process;

p_adc_state_d_dclk : process(DCLK_in,sysmon_rst) begin
  if(sysmon_rst = '1') then
    adc_state_d_dclk <= ST_A_FIRST_CALIB;
  elsif(rising_edge(DCLK_in)) then
    adc_state_d_dclk <= adc_state;
  end if;
end process;

p_adc_state_d : process(adcclk,sysmon_rst) begin
  if(sysmon_rst = '1') then
    adc_state_d <= ST_A_FIRST_CALIB;
  elsif(rising_edge(adcclk)) then
    adc_state_d <= adc_state after 1 ps;
  end if;
end process;

  -- signal to stay high until the end of the first ST_A_CHAN 
  p_first_chan : process(DCLK_in, sysmon_rst)
  begin
    if ((DCLK_in'event and DCLK_in='1') or (sysmon_rst'event and sysmon_rst='1')) then
      if (sysmon_rst = '1') then
        st_first_calib_chan <= '1';
      else
        if(adc_state=ST_A_CHAN and adc_next_state/=ST_A_CHAN) then
          st_first_calib_chan <= '0';
        end if;
      end if;
    end if;
  end process;

 chan_asrt_1 <= chan_asrt_pe;
 chan_asrt_2 <= chan_asrt_1 after 1 ps;
 chan_asrt_3 <= chan_asrt_2 after 1 ps;
 alm_asrt    <= B2S(out_counter = alm_distance and not(adc_state=ST_A_CALIB or adc_state=ST_A_FIRST_CALIB));
 eoc_asrt    <= B2S(out_counter = eoc_distance and not(adc_state=ST_A_CALIB or adc_state=ST_A_FIRST_CALIB));

out_counter_p : process(DCLK_in, sysmon_rst)
begin
   if ((DCLK_in'event and DCLK_in='1') or (sysmon_rst'event and sysmon_rst='1')) then
     if (sysmon_rst = '1') then
       out_counter <= 0;
     else
       if(chan_asrt_dclk = '1' or
          (cal_end = '1' and (adc_state=ST_A_CALIB or adc_state=ST_A_FIRST_CALIB)) or 
          out_counter= eoc_distance) then
         out_counter <= 0;
       elsif(out_counter_inc= '1') then
         out_counter <= out_counter + 1;
       end if;
     end if;
   end if;
end process;

  out_counter_inc_p : process(DCLK_in, sysmon_rst)
  begin
    if ((DCLK_in'event and DCLK_in='1') or (sysmon_rst'event and sysmon_rst='1')) then
      if (sysmon_rst = '1') then
        out_counter_inc <= '0';
      else
        if(chan_asrt_dclk = '1') then
          out_counter_inc <= '1';
        elsif(out_counter = eoc_distance-1) then
          out_counter_inc <= '0';
        end if;
      end if;
    end if;
  end process;

  -- event driven mode busy generation
  busy_start_ed    <= '1' when (ed_counter = 1 and  adc_state/=ST_A_FIRST_CALIB and adc_state/=ST_A_CALIB) else '0';
  busy_end_ed      <= '1' when (ed_counter = 22 or (busy_end_ed_wait='1' and convst_saved='0')) else '0'; 
  busy_end_ed_out  <= '1' when (busy_end_ed = '1' and adc_state/=ST_A_FIRST_CALIB and adc_state/=ST_A_CALIB) else '0'; 
  chan_asrt_ed     <= '1' when (ed_counter = 21) else '0'; 
  conv_track_ed    <= '1' when ((ed_counter = 0 or ed_counter = 22) and channel_out/=8) else '0'; 
  busy_end_ed_wait <= '1' when (adc_state=ST_A_WAIT_ED and adc_state_d_dclk/=ST_A_WAIT_ED) else '0';

  p_ed_counter: process(adcclk, sysmon_rst, convst_pre_dclk_pe)
  begin
    if (sysmon_rst = '1' or rising_edge(convst_pre_dclk_pe)) then
      ed_counter <= 0;
    elsif(rising_edge(adcclk)) then
      if(ed_counter_inc = '0' or adc_state_d= ST_A_FIRST_CALIB or adc_state_d= ST_A_CALIB or adc_state=ST_A_WAIT_ED)  then
        ed_counter <= 0;
      elsif(ed_counter_inc='1') then
        ed_counter <= ed_counter + 1;
      end if;
    end if;
  end process;

  p_ed_counter_inc: process(DCLK_in, sysmon_rst)
  begin
    if (sysmon_rst = '1') then
      ed_counter_inc <= '0';
    elsif (rising_edge(DCLK_in)) then
      if(convst_pre_adcclk_pe='1'and not(adc_state_d= ST_A_FIRST_CALIB or adc_state_d= ST_A_CALIB)) then
        ed_counter_inc <= '1';
      elsif(ed_counter=22) then
        ed_counter_inc <= '0';
      end if;
    end if;
  end process;

  ---continuous sampling mode busy generation

  busy_start_point <= 10  when (acq_ext_cur_d = '1') else 4;
  cs_count_tot     <= 31  when (acq_ext_cur_d = '1') else 25;
  busy_start_cs    <= '1' when ((cs_counter = busy_start_point and  adc_state /= ST_A_FIRST_CALIB and adc_state /= ST_A_CALIB) or 
                                (cal_counter=4 and adc_state=ST_A_CALIB)) else '0';
  busy_end_cs      <= '1' when (cs_counter = 0 and  adc_state /= ST_A_FIRST_CALIB ) else '0';
  busy_end_cs_out  <= '1' when (cs_counter = 0 and  adc_state/=ST_A_FIRST_CALIB and adc_state/=ST_A_CALIB) else '0';
  chan_asrt_cs     <= '1' when (cs_counter = cs_count_tot) else '0';
  conv_track_cs    <= '1' when (cs_counter = 0 and adc_state=ST_A_CHAN) else '0';

  cs_counter_p: process(adcclk, sysmon_rst)
  begin
    if ((adcclk'event and adcclk='1') or (sysmon_rst'event and sysmon_rst='1')) then
      if (sysmon_rst = '1') then
        cs_counter    <= 0;
        acq_ext_cur_d <= '0';
      else
        if(cs_counter = cs_count_tot or adc_state= ST_A_FIRST_CALIB or adc_state= ST_A_CALIB)  then
          cs_counter    <= 0;
          acq_ext_cur_d <= acq_ext_cur;
        elsif(cs_counter < cs_count_tot) then
          cs_counter <= cs_counter + 1;
        end if;
      end if;
    end if;
  end process;

  p_chan_asrt_d: process(DCLK_in,sysmon_rst)
  begin
    if ((DCLK_in'event and DCLK_in='1') or (sysmon_rst'event and sysmon_rst='1')) then
      if (sysmon_rst = '1') then
        chan_asrt_4     <= '0';
        chan_asrt_5     <= '0';
        chan_asrt_6     <= '0';
        chan_asrt_d     <= '0';
        busy_start_cs_d <= '0';
        busy_end_d      <= '0';
        busy_end_out_d  <= '0';
       else
        chan_asrt_4     <= chan_asrt_3;
        chan_asrt_5     <= chan_asrt_4;
        chan_asrt_6     <= busy_end_pe;
        chan_asrt_d     <= chan_asrt;
        busy_start_cs_d <= busy_start_cs;
        busy_end_d      <= busy_end;
        busy_end_out_d  <= busy_end_out;
      end if;
    end if;
  end process;

  busy_start   <= initialize(2) or B2S((event_driven_mode and S2B(busy_start_ed)) or (not event_driven_mode and S2B(busy_start_cs_d)));
  busy_end     <= B2S((event_driven_mode and S2B(busy_end_ed))     or (not event_driven_mode and S2B(busy_end_cs)));
  busy_end_out <= B2S((event_driven_mode and S2B(busy_end_ed_out)) or (not event_driven_mode and S2B(busy_end_cs_out)));


  busy_out_p: process(DCLK_in,sysmon_rst)
  begin
    if ((DCLK_in'event and DCLK_in='1') or (sysmon_rst'event and sysmon_rst='1')) then
      if (sysmon_rst = '1') then
        BUSY_out <= '0';
      else
        if (busy_start = '1') then
          BUSY_out <= '1';
        elsif(busy_end_out = '1') then
          BUSY_out <= '0';
        end if;
      end if;
    end if;
  end process;

  chan_asrt      <= B2S((event_driven_mode and S2B(chan_asrt_ed)) or (not event_driven_mode and S2B(chan_asrt_cs)));
  chan_asrt_pe   <= B2S(S2B(chan_asrt) and S2B(not chan_asrt_d));
  chan_asrt_dclk <= (chan_asrt and adcclk_period_end_d) when (unsigned(curr_clkdiv_sel)>2) else (chan_asrt and chan_asrt_d);
  busy_end_pe    <= busy_end and (not busy_end_d);
  conv_track     <= conv_track_ed when event_driven_mode else conv_track_cs;

  -- BUSY should assert 1 dclk cycle after next adcclk posedge after convst_in_pre
  convst_pre_adcclk_pe <= convst_in_pre and not convst_adcclk_d2;
  convst_pre_dclk_pe   <= convst_in_pre and not convst_dclk_d1;
  
  p_convst_adcclk: process(adcclk, sysmon_rst)
  begin
    if (sysmon_rst = '1') then
      convst_adcclk_d1 <= '0';
      convst_adcclk_d2 <= '0';
    elsif (rising_edge(adcclk)) then
      convst_adcclk_d1 <= convst_in_pre;
      convst_adcclk_d2 <= convst_adcclk_d1 ;
    end if;
  end process;

  p_convst_dclk: process(DCLK_in, sysmon_rst)
  begin
    if (sysmon_rst = '1') then
      convst_dclk_d1 <= '0';
    elsif (rising_edge(DCLK_in)) then
      convst_dclk_d1 <= convst_in_pre;
    end if;
  end process;

  p_convst_saved: process(DCLK_in, sysmon_rst)
  begin
    if (sysmon_rst = '1') then
      convst_saved <= '0';
    elsif (rising_edge(DCLK_in)) then
      if(convst_pre_adcclk_pe='1' and (adc_state=ST_A_CHAN or adc_state=ST_A_ALM)) then
        convst_saved <= '1';
      elsif (adc_state=ST_A_WAIT or busy_end='1') then
        convst_saved <= '0';
      end if;
    end if;--rising_edge
  end process;


 -- Calibration timing
 -- calibration period in effect is cal_factor * conversion period
  cal_factor      <= 1 when single_chan_mode else 3; -- short calibration for single channel mode to mimick coming out of reset
  cal_factor2     <= 3;
  conv_period     <= 22 when event_driven_mode else 32 when (acq_ext_cur = '1') else 26 ;
  first_cal_limit <= (cal_factor -1)*conv_period +1; 
  later_cal_limit <= (cal_factor2-1)*conv_period +2;
  cal_limit       <=  first_cal_limit when (adc_state=ST_A_FIRST_CALIB) else later_cal_limit; 

  cal_end_level     <= B2S(cal_counter=cal_limit-1) and BUSY_out; 
  cal_end           <= cal_end_level and not cal_end_level_d;         

  cal_counter_p: process(adcclk, sysmon_rst)
  begin
     if ((adcclk'event and adcclk='1') or (sysmon_rst'event and sysmon_rst='1')) then
       if (sysmon_rst = '1') then
         cal_counter <= 0;
       else
         if((conversion_before_calib='1' and busy_end='1' and adc_state /=ST_A_CALIB) or adc_state=ST_A_WAIT_ED or adc_state=ST_A_WAIT) then
           cal_counter <= 0;
         elsif((adc_state=ST_A_FIRST_CALIB or adc_state=ST_A_CALIB) and cal_counter <= cal_limit-1 and BUSY_out = '1') then
           cal_counter <= cal_counter+1;
         end if;
       end if;
     end if;
  end process;

  cal_end_level_d_p: process(adcclk,sysmon_rst)
  begin
    if (sysmon_rst = '1') then
      cal_end_level_d <= '0';
    elsif(rising_edge(adcclk)) then
      cal_end_level_d <= cal_end_level;
    end if;
  end process;

  drdy_out_p : process
  begin
    if (gsr_in = '1') then
         drdy_out <= '0';
    elsif (rising_edge(drdy_out_pre3)) then
      wait until rising_edge(dclk_in);
         drdy_out  <= '1';
      wait until rising_edge(dclk_in);
         drdy_out <= '0';
    end if;
    wait on drdy_out_pre3, gsr_in;
  end process;

  trig_attr <= '1' after 1 ps;

  DRPORT_DO_OUT_P : process(dclk_in, gsr_in, trig_attr, trig_i2c_addr_write, alm_rst) 
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
       variable reserved_addr_pre_var: std_ulogic := '0';
  begin
    if(rising_edge(trig_attr)) then
--      Write ( Message, string'("******* Begin modified vhdl model *******"));
--      assert false report Message.all  severity note;
--      DEALLOCATE(Message);
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
        Write ( Message, string'("[Unisim SYSMONE4-20] OT upper limit has been overwritten and automatic shutdown bits have been set 53h = "));
        Write ( Message, to_integer (unsigned (init53h_tmp(15 downto 0))));
        Write ( Message, string'(". Please refer to the Thermal Management section of the User Guide."));
        assert false report Message.all  severity note;
        DEALLOCATE(Message);
      else
        dr_sram(83)   <= X"CB00";
        ot_limit_reg  <= X"CB00";
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
      for k in  128 to  255 loop
        dr_sram(k) <= "0000000000000000";
      end loop;
      dr_sram(168) <= "1111111111111111";
      dr_sram(169) <= "1111111111111111";
      dr_sram(170) <= "1111111111111111";
      dr_sram(171) <= "1111111111111111";
    end if;

    if (rising_edge(alm_rst) or rising_edge(gsr_in)) then
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

      if(gsr_in = '1') then
        daddr_in_lat    <= "00000000";
        do_out          <= "0000000000000000";
        read_only_pre   <= '0';
        read_only       <= '0';
        reserved_addr   <= '0';
        soft_rst        <= '0';
      end if;

    elsif(trig_i2c_addr_write'event) then
      -- I2C address measured and assigned at startup is recorded at address 38h (56)
      if(i2c_oride='0') then
        data_reg(56) <= conv_result_i2c_addr;
      end if;
      
    elsif (rising_edge (dclk_in) ) then
      if (alm_asrt='1' and avg_final_loop='1') then
        -- current or averaged values' update to status registers
        if ((chan_out_id_cur >= 0 and chan_out_id_cur <= 3) or 
            chan_out_id_cur = 6 or 
            (chan_out_id_cur >= 13 and chan_out_id_cur <= 31)) then
          if (avg_cur = '0') then
            data_reg(chan_out_id_cur) <= conv_result_reg;
          else
            data_reg(chan_out_id_cur) <= conv_acc_result;
          end if;
        elsif (chan_out_id_cur >= 32 and chan_out_id_cur <= 35) then
          if (avg_cur = '0') then
            dr_sram(96+chan_out_id_cur) <= conv_result_reg;
          else
            dr_sram(96+chan_out_id_cur) <= conv_acc_result;
          end if;
        elsif (chan_out_id_cur = 4) then
          data_reg(chan_out_id_cur) <= X"0000";-- CR-961722 Simulation always simulates the internal reference behavior. Hence VrefP=0V
          --data_reg(chan_out_id_cur) <= X"6AAB"; --1.25V --CR 956212
        elsif (chan_out_id_cur = 5) then
          data_reg(chan_out_id_cur) <= X"0000"; --0V
        end if;
            
        --min and max values' update
        if (chan_out_id_cur = 0 or chan_out_id_cur = 1 or chan_out_id_cur = 2) then
          tmp_uns2 := UNSIGNED(data_reg(32 + chan_out_id_cur));
          tmp_uns3 := UNSIGNED(data_reg(36 + chan_out_id_cur));
          if (avg_cur = '0') then
            tmp_uns1 := UNSIGNED(conv_result_reg);
            if (tmp_uns1 > tmp_uns2) then
              data_reg(32 + chan_out_id_cur) <= conv_result_reg;
            end if;
            if (tmp_uns1 < tmp_uns3) then
              data_reg(36 + chan_out_id_cur) <= conv_result_reg;
            end if;
          else 
            tmp_uns1 := UNSIGNED(conv_acc_result);
            if (tmp_uns1 > tmp_uns2) then
              data_reg(32 + chan_out_id_cur) <= conv_acc_result;
            end if;
            if (tmp_uns1 < tmp_uns3) then
              data_reg(36 + chan_out_id_cur) <= conv_acc_result;
            end if;
          end if;
        elsif (chan_out_id_cur = 6) then
          tmp_uns2 := UNSIGNED(data_reg(35));
          tmp_uns3 := UNSIGNED(data_reg(39));
          if (avg_cur = '0') then
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
        elsif ( chan_out_id_cur >= 13 and chan_out_id_cur <= 15) then --VPSINTLP, VPSINTFP , VPSAUX
          tmp_uns2 := UNSIGNED(data_reg(27+chan_out_id_cur));
          tmp_uns3 := UNSIGNED(data_reg(31+chan_out_id_cur));
          if (avg_cur = '0') then
            tmp_uns1 := UNSIGNED(conv_result_reg);
            if (tmp_uns1 > tmp_uns2) then
              data_reg(27+chan_out_id_cur) <= conv_result_reg;
             end if;
            if (tmp_uns1 < tmp_uns3) then
              data_reg(31+chan_out_id_cur) <= conv_result_reg;
            end if;
          else 
            tmp_uns1 := UNSIGNED(conv_acc_result);
            if (tmp_uns1 > tmp_uns2) then
                data_reg(27+chan_out_id_cur) <= conv_acc_result;
            end if;
            if (tmp_uns1 < tmp_uns3) then
                data_reg(31+chan_out_id_cur) <= conv_acc_result;
            end if;
          end if;
        elsif (chan_out_id_cur >= 32 and chan_out_id_cur<=35) then  -- Vuser0-3
          tmp_uns2 := UNSIGNED(dr_sram(chan_out_id_cur+128));
          tmp_uns3 := UNSIGNED(dr_sram(chan_out_id_cur+136));
          if (avg_cur = '0') then
            tmp_uns1 := UNSIGNED(conv_result_reg);
            if (tmp_uns1 > tmp_uns2) then
              dr_sram(chan_out_id_cur+128) <= conv_result_reg;
             end if;
            if (tmp_uns1 < tmp_uns3) then
              dr_sram(chan_out_id_cur+136) <= conv_result_reg;
            end if;
          else 
            tmp_uns1 := UNSIGNED(conv_acc_result);
            if (tmp_uns1 > tmp_uns2) then
              dr_sram(chan_out_id_cur+128) <= conv_acc_result;
            end if;
            if (tmp_uns1 < tmp_uns3) then
              dr_sram(chan_out_id_cur+136) <= conv_acc_result;
            end if;
          end if;
        end if;
       --end of updating current and max-min values
      end if; --alm_asrt and avg_final_loop
  
      --process den & dwe
      if (den_in = '1') then
        read_only_pre <= '0';
        if (drdy_out_pre1 = '0') then
          drdy_out_pre1 <= '1';
          en_data_flag := 1;
          daddr_in_lat  <= daddr_in;
        else 
          report "[Unisim "&string'(MODULE_NAME)&"-10] Input pin DEN can be high for 1 DCLK cycle only. Please wait for DRDY to be high for setting DEN to high again." 
          severity warning;
        end if;
      else --den_in=0
        drdy_out_pre1 <= '0';
      end if; --den_in
        
      drdy_out_pre2 <= drdy_out_pre1;
      drdy_out_pre3 <= drdy_out_pre2;

      if (drdy_out_pre1 = '1') then
        en_data_flag := 0;
      end if;

      if (drdy_out_pre3 = '1') then
        read_only         <= read_only_pre; 
        if(dwe_in = '0') then
          do_out      <= do_out_rdtmp;
        end if;
      end if; --drdy_out_pre3

      valid_daddr           := addr_is_valid(daddr_in);
      daddr_in_int          := slv_to_int(daddr_in);
      daddr_in_us           := UNSIGNED(daddr_in);
      reserved_addr_pre_var := '1';

      if (den_in = '1' and valid_daddr) then
        reserved_addr_pre_var := is_reserved_address(daddr_in);
        reserved_addr         <= reserved_addr_pre_var;
      end if;

      -- write to all available and writable addresses
      if (dwe_in = '1' and den_in = '1' and en_data_flag = 1 and valid_daddr and reserved_addr_pre_var ='0') then  
        read_only_pre_var := is_readonly_address(daddr_in);
        read_only_pre     <= read_only_pre_var;

        if(read_only_pre_var='0') then
          -- write if not a read only location.
          if(daddr_in_int /= 3) then -- soft reset no dr_sram location
            dr_sram(daddr_in_int) <= di_in; 
          end if;
        end if;
      end if; --if (dwe_in & den_in & en_data_flag & valid_daddr & !reserved_addr_pre_var)
   
      -- end of DRP access.

      -- POST PROCESSING AFTER OTHER EVENTS :

      -- CR-764936 in event driven mode, when doing one pass when a CONVST BUSY should assert and then an EOC be seen, 
      -- the user can assert a CONVST again without having to write to the sequence register to start the sequence again.
      -- if continuous sampling, after one pass, the sequencer goes to single channel mode.
      if(single_pass_finished_pe and not event_driven_mode) then
        dr_sram(65)(15 downto 12) <= SEQ_SINGLE_CHAN ;--4'b0011; //from single pass, go to single channel 
      end if;

      -- write i2c data
      if (i2c_wr_exec= '1') then
        read_only_pre_var     := is_readonly_address(i2c_drp_addr(7 downto 0));
        read_only             <= read_only_pre_var;
        if(read_only_pre_var ='0') then
          var_res_addr                  := is_reserved_address(i2c_drp_addr(7 downto 0));
          var_i2c_drp_addr_us           := UNSIGNED(i2c_drp_addr (7 downto 0));
          var_i2c_drp_addr_int          := to_integer(var_i2c_drp_addr_us);
          dr_sram(var_i2c_drp_addr_int) <= i2c_drp_data;
        end if;
      end if;

      -- write pmbus data
      if(pmb_wr_exec_2='1') then
        if(pmb_valid_page='1') then --Add the paged channel to the sequence.
          dr_sram(SLV_TO_INT(pmb_drsram_addr_page))(pmb_drsram_bit_idx) <= '1';
        else
          read_only_pre_var :=  is_readonly_address(pmb_drsram_addr);
          if( read_only_pre_var = '0') then
            var_res_addr                  := is_reserved_address(pmb_drsram_addr);
            var_i2c_drp_addr_us           := UNSIGNED(pmb_drsram_addr); 
            var_i2c_drp_addr_int          := to_integer(var_i2c_drp_addr_us);
            dr_sram(var_i2c_drp_addr_int) <= pmb_drsram_wr_data;
          end if;
        end if;
      end if;

      --post processing generalized for all protocols
      if(post_process='1') then
        if(cfg_check_addr_us = X"03") then
          soft_rst <= '1';
        elsif (cfg_check_addr_us = X"53" and cfg_in(3 downto 0)= "0011") then
          ot_limit_reg <= cfg_in;
        end if;
      end if;

      if(soft_rst = '1') then
        soft_rst <= '0';
      end if;
        
    end if; -- rising_edge(DCLK_in)
  end process;

  --prep for post processing generalized for all protocols.
  post_proc_gen: process (dclk_in, gsr_in) begin
    if(gsr_in = '1') then
      post_process      <= '0';
      cfg_check_addr_us <= X"00";
      cfg_in            <= X"0000";
    elsif (rising_edge(dclk_in)) then
      if(initialize(2)='1') then
        post_process      <= '0';
        cfg_check_addr_us <= X"00";
        cfg_in            <= X"0000";
      elsif(den_in = '1' and dwe_in = '1') then
        post_process      <= '1';
        cfg_check_addr_us <= UNSIGNED(daddr_in);
        cfg_in            <= di_in;
      elsif (i2c_wr_exec ='1') then
        post_process      <= '1';
        cfg_check_addr_us <= UNSIGNED(i2c_drp_addr (7 downto 0));
        cfg_in            <= i2c_drp_data;
      elsif (pmb_wr_exec_2 ='1' and pmb_cmd_in=CMD_MFR_ACCESS_REG) then
        post_process      <= '1';
        cfg_check_addr_us <= UNSIGNED(pmb_drsram_addr); 
        cfg_in            <= pmb_drsram_wr_data;
      else
        post_process      <= '0';
        cfg_check_addr_us <= X"00";
        cfg_in            <= X"0000";
      end if;
    end if;
  end process;

  disp_conf_warn_exe : process (post_process) 
    variable Message       : line;
    variable var_int       : integer := 0;
    begin
    if(rising_edge(post_process)) then
      var_int := SLV_TO_INT(SLV=>cfg_reg0(5 downto 0));
      if(cfg_check_addr_us = X"40") then
        var_int := SLV_TO_INT(SLV=>cfg_reg0(5 downto 0));
        if ( var_int = 7 or (var_int >= 9 and var_int <= 12) or var_int >=36) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-14]  Config register 0 bits [5:0] at 40h cannot not be set to an invalid analog channel value as "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg0(5 downto 0))));
          assert false report Message.all  severity warning;
          DEALLOCATE(Message);
        end if;
      end if;

      if(cfg_check_addr_us = X"40" or cfg_check_addr_us = X"41") then
        if (cfg_reg1(15 downto 12)=SEQ_SINGLE_CHAN and (cfg_reg0(8)='1') and (var_int /= 3) and not(var_int >= 16 and var_int <=31)) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-15] In single channel mode if the selected channel is not analog, config register 0 bit[8] must be set to 0. Long acqusition mode is only allowed for external channels, not in single channel mode."));
          assert false report Message.all  severity warning;
          DEALLOCATE(Message);
        end if;
      end if;

      if(cfg_check_addr_us = X"41" or cfg_check_addr_us = X"46" or cfg_check_addr_us = X"48" or cfg_check_addr_us = X"49" ) then 
        if ((cfg_reg1(15 downto 12)=SEQ_SINGLE_CHAN) and (seq_hr_chan_reg1 /= X"0000") and (seq_hr_chan_reg2 /= X"0000") and (seq_hr_chan_reg3 /= X"0000")) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-16] In single channel mode, ADC channel selection registers 46h, 48h and 49h will be ignored; these are set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg3)));
          Write ( Message, string'(",  "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg1)));
          Write ( Message, string'(" and  "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg2)));
          Write ( Message, string'("respectively."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        end if;
      end if;

       if(cfg_check_addr_us = X"41" or cfg_check_addr_us = X"7A" or cfg_check_addr_us = X"7B" or cfg_check_addr_us = X"7C" ) then 
        if ((cfg_reg1(15 downto 12)/=SEQ_CONT_CHAN) and (seq_lr_chan_reg1 /= X"0000") and (seq_lr_chan_reg2 /= X"0000") and (seq_lr_chan_reg3 /= X"0000")) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-13] In modes other than continuous sequence mode, ADC slow rate channel selection registers 7Ah, 7Bh and 7Ch will be ignored; these are set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg3)));
          Write ( Message, string'(",  "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg1)));
          Write ( Message, string'(" and  "));
          Write ( Message, bit_vector'(TO_BITVECTOR(seq_chan_reg2)));
          Write ( Message, string'("respectively."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        end if;
      end if;

      if(cfg_check_addr_us = X"4E" or cfg_check_addr_us = X"41") then
        if ((cfg_reg1(15 downto 12) /= SEQ_SINGLE_CHAN) and (dr_sram(78)(10 downto 0) /= "00000000000") and (dr_sram(78)(15 downto 12) /= "0000")) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-18] The Control Register 4Eh value is set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(dr_sram(78))));
          Write ( Message, string'(". When not in single channel mode, bits [15:12] and [10:0] of this register will be ignored. Long acquistion mode is only allowed for external channels."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        end if;
      end if;

      if(cfg_check_addr_us = X"42") then
        if ( cfg_reg2(4 downto 0) /= "00000") then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-12] The config reg 2 "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_reg2)));
          Write ( Message, string'(" is invalid. Bits [4:0] must be set to 5'b00000."));
          assert false report Message.all  severity warning;
        end if;
      end if; --42

      if(cfg_check_addr_us = X"40") then
        if ( cfg_reg0(13 downto 12) /= "00" and avg_en='0') then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-61] When cfg_reg0[13:12] is set to have averaging on: Single pass mode doesn't allow it. Continuous mode needs to have at least one channel in the high rate or low rate sequence needs to have averaging enabled. Otherwise averaging is disabled."));
          assert false report Message.all  severity note;
        end if;
      end if; --40

      if(cfg_check_addr_us = X"4C" or cfg_check_addr_us = X"41") then
        if ((cfg_reg1(15 downto 12) /= SEQ_SINGLE_CHAN) and (dr_sram(76)(10 downto 0) /= "00000000000") and (dr_sram(76)(15 downto 12) /= "0000")) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-17] The Control Register 4Ch value is set to "));
          Write ( Message, bit_vector'(TO_BITVECTOR(dr_sram(76))));
          Write ( Message, string'(". When not in single channel mode, bits [15:12] and [10:0] of this register will be ignored. Long acquistion mode is only allowed for external channels."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        end if;
      end if; --4C or 41

      if(cfg_check_addr_us = X"53") then
        if (cfg_in(3 downto 0) = "0011") then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-20] OT upper limit has been overwritten and automatic shutdown bits have been set by input "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_in)));
          Write ( Message, string'(". Please refer to the Thermal Management section of the User Guide."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        else 
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-21] OT upper limit can only be overwritten while enabling automatic shutdown, hence input value "));
          Write ( Message, bit_vector'(TO_BITVECTOR(cfg_in)));
          Write ( Message, string'(" will be ignored and the default value will be kept. Please refer to the Thermal Management section of the User Guide."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        end if;
      end if; --53

     if(cfg_check_addr_us = X"4A") then
        if (cfg_in(13 downto 12) /= "00" or cfg_in(0)='1') then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-26] Calibration, VREFP, and VREFN channels do not allow averaging. Some or all of the bits 0,12,13 of 4A are set to 1 and they will be ignored."));
          assert false report Message.all  severity note;
          DEALLOCATE(Message);
        end if;
      end if; --4A

    end if;--rising_edge
  end process;


  seq_rst_p: process(DCLK_in,sysmon_rst) begin
    if (rising_edge(DCLK_in) or rising_edge(sysmon_rst)) then
      if(sysmon_rst = '1') then
        seq_rst <= '0';
      else
        if((single_pass_finished_pe and not event_driven_mode) or -- single pass finished
          (DWE_in= '1' and DEN_in= '1' and UNSIGNED(DADDR_in)=X"41" and (DI_in(15 downto 12)/= cfg_reg1(15 downto 12))) or --switching to a different op mode
          (i2c_wr_exec = '1' and i2c_drp_addr=X"41" and i2c_drp_data(15 downto 12)/= cfg_reg1(15 downto 12)) or
          (pmb_wr_exec = '1' and pmb_cmd_in=CMD_MFR_ACCESS_REG and pmb_sel_addr=X"41" and pmb_data_in(15 downto 12)/=cfg_reg1(15 downto 12)) or
          (single_chan_mode and DWE_in='1' and DEN_in='1' and UNSIGNED(DADDR_in)=X"40" and DI_in(5 downto 0)/=cfg_reg0(5 downto 0)) or
          (i2c_wr_exec = '1' and i2c_drp_addr = X"40" and i2c_drp_data(5 downto 0)/=cfg_reg0(5 downto 0)) or
          (pmb_wr_exec = '1' and pmb_cmd_in=CMD_MFR_ACCESS_REG and pmb_sel_addr=X"40" and pmb_data_in(5 downto 0)/=cfg_reg0(5 downto 0)) or
          (pmb_wr_exec = '1' and pmb_cmd_in=CMD_PAGE)
          ) then
          seq_rst <= '1';
        else
          seq_rst <= '0';
        end if;
      end if;
    end if;--rising_edge
  end process;

  add_channel_p: process(DCLK_in,sysmon_rst) 
     variable daddr_in_us          : unsigned (7 downto 0);
  begin
      daddr_in_us  := UNSIGNED(daddr_in);
    if(sysmon_rst='1') then
      add_channel_hr_p <= '0';
      add_channel_lr_p <= '0';
    elsif(rising_edge(DCLK_in)) then
      if((DWE_in='1' and DEN_in='1' and daddr_in_us=X"48" and DI_in/=seq_hr_chan_reg1) or
          (i2c_wr_exec='1' and unsigned(i2c_drp_addr)=X"48" and i2c_drp_data /= seq_hr_chan_reg1) or
          (pmb_wr_exec='1' and pmb_cmd_in=CMD_MFR_ACCESS_REG and unsigned(pmb_sel_addr)=X"48" and pmb_data_in /= seq_hr_chan_reg1) or
          (DWE_in='1' and DEN_in='1' and DADDR_in_us=X"49" and DI_in /= seq_hr_chan_reg2) or
          (i2c_wr_exec='1' and unsigned(i2c_drp_addr)=X"49" and i2c_drp_data /= seq_hr_chan_reg2) or
          (pmb_wr_exec='1' and pmb_cmd_in=CMD_MFR_ACCESS_REG and unsigned(pmb_sel_addr)=X"49" and pmb_data_in /= seq_hr_chan_reg2) or
          (DWE_in='1'and DEN_in='1' and DADDR_in_us=X"46" and DI_in/=seq_hr_chan_reg3  ) or
          (i2c_wr_exec='1' and unsigned(i2c_drp_addr)=X"46" and i2c_drp_data/=seq_hr_chan_reg3 ) or
          (pmb_wr_exec='1' and  pmb_cmd_in=CMD_MFR_ACCESS_REG and unsigned(pmb_sel_addr)=X"46" and pmb_data_in/=seq_hr_chan_reg3) ) then  
        add_channel_hr_p <= '1';
      elsif(add_channel='1') then
        add_channel_hr_p <= '0'; 
      end if;
      if((DWE_in='1' and DEN_in='1' and DADDR_in_us=X"7A" and DI_in/=seq_lr_chan_reg1  ) or
         (i2c_wr_exec='1' and unsigned(i2c_drp_addr)=X"7A" and i2c_drp_data/=seq_lr_chan_reg1 ) or
         (pmb_wr_exec='1' and  pmb_cmd_in=CMD_MFR_ACCESS_REG and unsigned(pmb_sel_addr)=X"7A" and pmb_data_in/=seq_lr_chan_reg1) or
         (DWE_in='1' and DEN_in='1' and DADDR_in_us=X"7B" and DI_in/=seq_lr_chan_reg2  ) or
         (i2c_wr_exec='1' and unsigned(i2c_drp_addr)=X"7B" and i2c_drp_data/=seq_lr_chan_reg2 ) or
         (pmb_wr_exec='1' and  pmb_cmd_in=CMD_MFR_ACCESS_REG and UNSIGNED(pmb_sel_addr)=X"7B" and pmb_data_in/=seq_lr_chan_reg2) or
         (DWE_in='1' and DEN_in='1' and DADDR_in_us=X"7C" and DI_in/=seq_lr_chan_reg3  ) or
         (i2c_wr_exec='1' and unsigned(i2c_drp_addr)=X"7C" and i2c_drp_data/=seq_lr_chan_reg3 ) or
         (pmb_wr_exec='1' and  pmb_cmd_in=CMD_MFR_ACCESS_REG and unsigned(pmb_sel_addr)=X"7C" and pmb_data_in/=seq_lr_chan_reg3) 
       )  then 
        add_channel_lr_p <= '1';
      elsif(add_channel='1') then
        add_channel_lr_p <= '0';
      end if;

    end if;
  end process;
  

  daddr_in_lat_int    <= slv_to_int         (daddr_in_lat);

  flag_reg0 <= ("00000000" & alm_out(6 downto 3) & ot_out & alm_out(2 downto 0));
  flag_reg1 <= ("0000000000" & alm_out(13 downto 8));

  p_do_out_rdtmp: process (DCLK_in, gsr_in )
    variable valid_daddr       : boolean := false;
    variable var_reserved_addr : std_ulogic := '0';
  begin
    if(gsr_in='1') then
      do_out_rdtmp <= "0000000000000000";
    elsif(rising_edge(DCLK_in)) then
      if(drdy_out_pre2='1') then
        valid_daddr       := addr_is_valid(daddr_in_lat);
        var_reserved_addr := is_reserved_address(daddr_in_lat);

        if (not(valid_daddr) or var_reserved_addr='1' ) then
          do_out_rdtmp <= "0000000000000000";
        else --readable address
          if ((daddr_in_lat_int >= 0 and daddr_in_lat_int <= 61)) then
            do_out_rdtmp <= data_reg(daddr_in_lat_int); 
          elsif (daddr_in_lat_int = 62) then --h3E
            do_out_rdtmp <= flag_reg1;
          elsif (daddr_in_lat_int = 63) then --h3F
            do_out_rdtmp <= flag_reg0;
          else 
            do_out_rdtmp <= dr_sram(daddr_in_lat_int);
          end if;
        end if; --readable address
      end if; --drdy_out_pre2
    end if; --rising_edge
 end process;

-- end DRP RAM
-------------------------------------------------------------------------
--- Configuration and settings
-------------------------------------------------------------------------

  cfg_reg0         <= dr_sram(64);
  cfg_reg1         <= dr_sram(65);
  cfg_reg2         <= dr_sram(66);
  cfg_reg3         <= dr_sram(67);
  cfg_reg4         <= dr_sram(68);
  seq_hr_chan_reg1 <= dr_sram(72)  and X"7FE1"; --ignore reserved bits
  seq_hr_chan_reg2 <= dr_sram(73);
  seq_hr_chan_reg3 <= dr_sram(70)  and X"000F";
  seq_lr_chan_reg1 <= dr_sram(122) and X"7FE1";
  seq_lr_chan_reg2 <= dr_sram(123);
  seq_lr_chan_reg3 <= dr_sram(124) and X"000F";
  seq_avg_reg1     <= dr_sram(74)  and X"4FE0";
  seq_avg_reg2     <= dr_sram(75);
  seq_avg_reg3     <= dr_sram(71)  and X"000F";
  seq_bipolar_reg1 <= dr_sram(76)  and X"0800";
  seq_bipolar_reg2 <= dr_sram(77);
  seq_acq_ext_reg1 <= dr_sram(78)  and X"0800"; --ignore reserved bits 
  seq_acq_ext_reg2 <= dr_sram(79); 
  
  seq_hr_chan_reg_comb <= (seq_hr_chan_reg3 & seq_hr_chan_reg2 & seq_hr_chan_reg1);
  seq_lr_chan_reg_comb <= (seq_lr_chan_reg3 & seq_lr_chan_reg2 & seq_lr_chan_reg1);
  seq_acq_ext_reg_comb <= (X"0000" & seq_acq_ext_reg2 & seq_acq_ext_reg1);
  seq_bipolar_reg_comb <= (X"0000" & seq_bipolar_reg2 & seq_bipolar_reg1);


  op_mode            <= cfg_reg1(15 downto 12);
  default_mode       <= (op_mode=SEQ_DEFAULT_MODE) or (op_mode(3 downto 2)=SEQ_DEFAULT_MODE2);
  single_pass_mode   <= (op_mode=SEQ_SINGLE_PASS);
  cont_seq_mode      <= (op_mode=SEQ_CONT_CHAN);
  single_chan_mode   <= (op_mode=SEQ_SINGLE_CHAN);
  single_chan_id     <= cfg_reg0(5 downto 0);
  ext_mux_chan_id    <= cfg_reg0(5 downto 0);
  ext_mux_en         <= (cfg_reg0(11)='1') and  not (default_mode or single_chan_mode);
  ext_mux            <=  cfg_reg0(11);
  ext_mux_chan_idx   <= SLV_TO_INT(cfg_reg0(4 downto 0));
  acq_ext            <= cfg_reg0(8);
  
  event_driven_mode  <= (cfg_reg0(9)='1');
  cont_sampl_mode    <= not event_driven_mode;
  bipolar_mode       <= (cfg_reg0(10)='1');
  single_pass_active <= single_pass_mode and not (single_pass_finished and cont_sampl_mode);

  int_tot_per        <= (hr_tot_chan * (4 ** SLV_TO_INT(lr_rate)))  +1;
  hr_lr_tot_per      <= (int_tot_per*lr_tot_chan) when lr_chan_on='1' else hr_tot_chan;
  tot_per            <= hr_lr_tot_per when cont_seq_mode else 
                        hr_tot_chan when single_pass_active or default_mode else
                        1;
  avg_final_loop     <= not avg_en or not avg_cur or (avg_final_loop_hr and not seq_lr_selected) or
                        (avg_final_loop_lr and seq_lr_selected);
  avg_final_loop_hr  <= '1' when avg_loop_count_hr=avg_amount else '0';
  avg_final_loop_lr  <= '1' when avg_loop_count_lr=avg_amount else '0';
 
 --CR-961533
 -- When SLOW_SEQ or SLOW_EOS are changed dynamically, the change should take place 
 -- after mode change as per rtl design.
 lr_rate_eos_p: process(DCLK_in,sysmon_rst) begin 
    if (sysmon_rst='1') then
      lr_eos        <= "00";
      lr_rate       <= "00";
    elsif(rising_edge(DCLK_in) and initialize(0)='1') then
      lr_eos   <= cfg_reg4(11 downto 10);
      lr_rate  <= cfg_reg4(9 downto 8);
    end if;
  end process;


  alm_en_ot_en_p : process(sysmon_rst,DCLK_in)
  begin
    if(rising_edge(sysmon_rst) or rising_edge(DCLK_in)) then
      if(sysmon_rst='1') then
        alm_en   <= "0000000000000";
    ot_en <= '0';
      elsif(initialize(2)='1' or single_pass_finished_pe or chan_asrt_5='1') then
        if(default_mode) then
          alm_en   <= "0000000000000";
      ot_en <= '1';
    else
      ot_en               <= not cfg_reg1(0);
          alm_en(2 downto 0)  <= not cfg_reg1(3 downto 1);
          alm_en(6 downto 3)  <= not cfg_reg1(11 downto 8);
          alm_en(11 downto 8) <= not cfg_reg3(3 downto 0);
        end if;
      end if;
    end if;
  end process;

  bank_sel_6V       <= cfg_reg4(3 downto 0); -- CR 949547
  single_pass_finished_pe <= single_pass_finished and not single_pass_finished_d;

  single_pass_p: process(DCLK_in,sysmon_rst) begin
    if(rising_edge(DCLK_in) or rising_edge(sysmon_rst)) then
      if(sysmon_rst='1') then
        single_pass_finished<= false;
    single_pass_finished_d <= false;
      else
        if(or_reduct(initialize)='1') then
          single_pass_finished <= false;
          single_pass_finished_d <= false;
    else
      if(single_pass_mode and 
         ((acq_ext_cur='0' and EOS_out='1') or
          (acq_ext_cur='1' and hr_final_conversion='1' and adc_state=ST_A_WAIT and busy_start_cs='1')) )
          then
        single_pass_finished <= true;
      end if;
      single_pass_finished_d <= single_pass_finished;
    end if;
      end if;
    end if;
  end process;




-------------------------------------------------------------------------------
-- i2c and PMBus logic start
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

  pmb_en_bit         <= B2S ( S2B(i2c_data_in(3)) and S2B(i2c_ack_bit) and (i2c_state=ST_I2C_GET_ADDR or pmb_state=ST_PMB_GET_ADDR)); -- 0:i2c, 1:pmbus
  pmb_ara_rcvd       <= B2S (((i2c_data_in(6 downto 0)=PMB_ALERT_RESPONSE_ADDR) or (i2c_data_in(7 downto 1)=PMB_ALERT_RESPONSE_ADDR) ) and 
                                      S2B(i2c_lsb_bit or i2c_ack_bit));
  pmb_clr            <= pmb_ara or clear_faults;

  p_p_ara : process( i2c_sclk_in, reset_in, i2c_stop)
  begin
    if (reset_in = '1' or i2c_stop ='1') then
      pmb_ara <= '0';
    elsif (rising_edge(i2c_sclk_in)) then
      if(pmb_state=ST_PMB_IDLE) then
        pmb_ara <= '0';
      else
        pmb_ara <= pmb_ara_rcvd and (B2S(pmb_state=ST_PMB_GET_ADDR)) and i2c_rd_cmd_pre; 
      end if;
    end if;
  end process;

  pmb_en  <= not i2c_en;

  p_i_en : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_en <= '1';
    elsif (rising_edge(i2c_sclk_in)) then
      if(i2c_oride = '1') then
        i2c_en <= not(cfg_reg3(10));
      elsif (S2B(i2c_ack_bit) and (i2c_state=ST_I2C_GET_ADDR or pmb_state=ST_PMB_GET_ADDR) and S2B(i2c_addr_match_wop)) then
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

  pmb_cmd_pre  <= i2c_data_in(7 downto 0);

  p_p_cin : process (i2c_sclk_in)
  begin
    if (rising_edge(i2c_sclk_in)) then
      if(S2B(i2c_ack_bit) and (pmb_state = ST_PMB_GET_CMD) ) then
        pmb_cmd_in <= i2c_data_in;
      end if;
    end if;
  end process;

  i2c_rw_bit     <= i2c_lsb_bit and B2S(i2c_state=ST_I2C_GET_ADDR or pmb_state=ST_PMB_GET_ADDR);
  i2c_rd_cmd_pre <= i2c_rw_bit  and I2C_SDA_in; 

  p_i_rdcmd : process (i2c_sclk_in, i2c_stop, reset_in)
  begin
    if (reset_in = '1' or i2c_stop='1' ) then
      i2c_rd_cmd <= '0'; 
    elsif (falling_edge(i2c_sclk_in)) then
      if(i2c_state=ST_I2C_IDLE and pmb_state=ST_PMB_IDLE) then
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
      elsif ((i2c_state=ST_I2C_IDLE and pmb_state=ST_PMB_IDLE) or i2c_bit_counter=1) then
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
      if (i2c_ack_bit='1' and (i2c_state = ST_I2C_GET_CMD or i2c_state = ST_I2C_READ or
                              pmb_state = ST_PMB_WRITE   or pmb_state = ST_PMB_READ   )) then
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
          when ST_I2C_GET_ADDR => if((i2c_addr_match and not pmb_en_bit)='0') then 
                                    i2c_state <= ST_I2C_IDLE;
                                    Write ( Message, string'("[Unisim "));
                                    Write ( Message, string'(MODULE_NAME));
                                    Write ( Message, string'("-54] I2C command address "));
                                    Write ( Message, bit_vector'(TO_BITVECTOR(i2c_data_in(7 downto 1))));
                                    Write ( Message, string'("not matching device address "));
                                    Write ( Message, bit_vector'(TO_BITVECTOR(i2c_device_addr)));
                                    assert false report Message.all  severity note;
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

  pmb_data_end <= i2c_ack_bit and B2S(i2c_byte_counter=(pmb_tot_bytes-1)) ;

  p_i_sda_ts : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      i2c_sda_ts_out <= '1';
    elsif (falling_edge (i2c_sclk_in)) then
      if(i2c_start = '1') then
        i2c_sda_ts_out <= '1';
      elsif (i2c_lsb_bit = '1') then
        i2c_sda_ts_out <= not B2S(((i2c_state=ST_I2C_GET_ADDR) and (i2c_addr_match='1' or pmb_ara_rcvd='1')) or --will also be true for pmbus
                                      ((i2c_state=ST_I2C_GET_CMD ) and not(i2c_rd_cmd='1' and i2c_byte_counter=3)) or --send NACK at the last byte of command, only if read command
                                      (pmb_state=ST_PMB_GET_CMD) or
                                      (pmb_state=ST_PMB_WRITE)  --send ACK for all write command bytes
                                     );
      elsif ((i2c_ack_bit='1' and --first bit of next slave to master transfer
             ((i2c_state=ST_I2C_GET_ADDR) and (i2c_drp_cmd=I2C_DRP_RD) )) or 
             (i2c_state=ST_I2C_READ and i2c_rd_end='0')) then --or read continued
        i2c_sda_ts_out <= i2c_data_out(7);
      elsif (((i2c_ack_bit='1' and pmb_state=ST_PMB_GET_ADDR) and i2c_rd_cmd='1') or --first bit of next slave to master transfer
             (pmb_state=ST_PMB_READ and pmb_data_end='0')) then--or read continued
        i2c_sda_ts_out <= pmb_data_out(7);
      else
        i2c_sda_ts_out <= '1';
      end if;
    end if; --clk
  end process;
  
  I2C_SCLK_TS_out <= '1';
 
-------------------------------------------------------------------------------
-- pmbus start
-------------------------------------------------------------------------------

  p_p_fsm : process (i2c_sclk_in, i2c_stop, reset_in)
    variable Message                : line;   
  begin
    if (reset_in = '1' or i2c_stop = '1') then
      pmb_state <= ST_PMB_IDLE;
    elsif (falling_edge (i2c_sclk_in)) then
      if(i2c_start = '1') then
        pmb_state <= ST_PMB_GET_ADDR;
      elsif (i2c_ack_bit = '1') then
        case (pmb_state) is
          when ST_PMB_GET_ADDR => if((i2c_addr_match and pmb_en_bit)='0') then
                                    if(pmb_ara_rcvd='1') then
                                      if(i2c_rd_cmd='0') then
                                        pmb_state <= ST_PMB_IDLE;
                                        Write ( Message, string'("[Unisim "));
                                        Write ( Message, string'(MODULE_NAME));
                                        Write ( Message, string'("-57] PMBus Alert Response Address received together with a write bit instead of a read bit. It will be ignored."));
                                        assert false report Message.all  severity note;
                                        DEALLOCATE(Message);
                                      else --ARA received. Send the device address as a response
                                        pmb_state <= ST_PMB_READ;
                                      end if;
                                    else 
                                      pmb_state <= ST_PMB_IDLE;
                                      if(pmb_en_bit='1') then
                                        Write ( Message, string'("[Unisim "));
                                        Write ( Message, string'(MODULE_NAME));
                                        Write ( Message, string'("-64] PMBus command address "));
                                        Write ( Message, bit_vector'(TO_BITVECTOR(i2c_data_in(7 downto 1))));
                                        Write ( Message, string'("not matching device address "));
                                        Write ( Message, bit_vector'(TO_BITVECTOR(i2c_device_addr)));
                                        assert false report Message.all  severity note;
                                        DEALLOCATE(Message);
                                      end if;
                                    end if;
                                  elsif (i2c_rd_cmd='0') then--write command comes only before command id.
                                    pmb_state <= ST_PMB_GET_CMD;
                                  else 
                                    pmb_state <= ST_PMB_READ;
                                  end if;
          when ST_PMB_GET_CMD  => if(pmb_cmd_pre=CMD_CLEAR_FAULT) then --clear fault has 0 bytes of succeeding data, so go to idle.
                                    pmb_state <= ST_PMB_IDLE;
                                  else --get succeeding data. if it is a read command, restart will take it to ST_PMB_IDLE.
                                    pmb_state <= ST_PMB_WRITE;
                                  end if;
                                  Write ( Message, string'("[Unisim "));
                                  Write ( Message, string'(MODULE_NAME));
                                  Write ( Message, string'("] PMBus command received."));
                                  assert false report Message.all  severity note;
                                  DEALLOCATE(Message);
          when ST_PMB_WRITE    => if(pmb_data_end='1') then
                                    pmb_state <= ST_PMB_IDLE;
                                  end if;
          when ST_PMB_READ     => if(pmb_data_end = '1') then
                                    pmb_state <= ST_PMB_IDLE;
                                  end if;
          when others          => pmb_state <= ST_PMB_IDLE;
        end case;
      end if;
  
    end if;
  end process;

  --Parse PMB command
  p_pmb_parse : process (i2c_sclk_in, reset_in)
    variable Message                : line;   
  begin
    if (reset_in = '1') then
      pmb_tot_bytes <= 0;
      pmb_unsp_cmd  <= '0';
      pmb_paged     <= '0';
      pmb_selected  <= '0';
    elsif (falling_edge (i2c_sclk_in)) then
      if(i2c_ack_bit='1' and pmb_state=ST_PMB_GET_CMD) then
        pmb_unsp_cmd <= '0';
        case (pmb_cmd_pre) is
          when CMD_PAGE                => 
                                           pmb_tot_bytes <= 1;
                                           pmb_paged     <= '1';
          when CMD_CLEAR_FAULT         =>
                                           pmb_tot_bytes <= 0;
          when CMD_CAPABILITY        | CMD_VOUT_MODE          |
               CMD_STATUS_BYTE       | CMD_STATUS_VOUT        |
               CMD_STATUS_TEMPERATURE| CMD_STATUS_CML         |
               CMD_PMBUS_REVISION    | CMD_MFR_ENABLE_VUSER_HR
                                       =>
                                           pmb_tot_bytes <= 1;
          when CMD_VOUT_OV_FAULT_LIMIT| CMD_VOUT_UV_FAULT_LIMIT|
               CMD_OT_FAULT_LIMIT     | CMD_OT_WARNING_LIMIT   |
               CMD_UT_WARNING_LIMIT   | CMD_UT_FAULT_LIMIT     |
               CMD_STATUS_WORD        | CMD_READ_VOUT          |
               CMD_READ_TEMPERATURE_1 | CMD_MFR_ACCESS_REG     | 
               CMD_MFR_READ_VOUT_MAX  | CMD_MFR_READ_VOUT_MIN  | 
               CMD_MFR_READ_TEMP_MAX  | CMD_MFR_READ_TEMP_MIN    
                                       => 
                                           pmb_tot_bytes <= 2;
          when CMD_MFR_ID|CMD_MFR_MODEL=>
                                           pmb_tot_bytes <= 4;
          when CMD_MFR_REVISION        =>
                                           pmb_tot_bytes <= 3;
          when CMD_MFR_SELECT_REG      =>       
                                           pmb_tot_bytes <= 2;
                                           pmb_selected  <= '1';
          when others                  =>        
                                           pmb_unsp_cmd<= '1'; --Unsupported command
                                           Write ( Message, string'("[Unisim "));
                                           Write ( Message, string'(MODULE_NAME));
                                           Write ( Message, string'("-62] PMBus received invalid command ID: "));
                                           Write ( Message, bit_vector'(TO_BITVECTOR(pmb_cmd_pre)));
                                           assert false report Message.all  severity warning;
                                           DEALLOCATE(Message);

        end case;
      elsif(pmb_ara_rcvd='1' and pmb_state=ST_PMB_GET_ADDR) then --Alert Response Address (ARA) has 1 byte response.
        pmb_tot_bytes <= 1;
      else 
        pmb_unsp_cmd  <= '0';
      end if;
    end if;
  end process;

  p_p_clearfaults : process (i2c_sclk_in, i2c_stop, reset_in)
  begin
    if (reset_in = '1' or i2c_stop = '1') then
      clear_faults  <= '0';
    elsif (falling_edge(i2c_sclk_in)) then
      if(i2c_ack_bit='1' and pmb_state=ST_PMB_GET_CMD and pmb_cmd_pre=CMD_CLEAR_FAULT) then
        clear_faults  <= '1';
      else
        clear_faults  <= '0';
      end if;
    end if;
  end process;

  p_pmbtotbytes : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      pmb_data_in <= X"0000";
    elsif (rising_edge (i2c_sclk_in)) then
      if(i2c_ack_bit='1' and pmb_state=ST_PMB_WRITE) then
        if(pmb_tot_bytes > 1) then
          pmb_data_in <= i2c_data_in & pmb_data_in(15 downto 8) ; --Most significant byte arrives later.
        else
          pmb_data_in <= "00000000" & i2c_data_in ; --1 byte, that's it.
        end if;
      end if;
    end if;--clk
  end process;

  p_p_wrxec : process (i2c_sclk_in, i2c_start, i2c_stop, reset_in)
  begin
    if (reset_in = '1' or i2c_stop = '1' or i2c_start = '1') then
      pmb_wr_exec <= '0';
    elsif (falling_edge(i2c_sclk_in)) then
      if (pmb_state=ST_PMB_WRITE and pmb_data_end='1') then
        pmb_wr_exec <= '1';
      else
        pmb_wr_exec <= '0';
      end if;
    end if;
  end process;

  p_p_wrexecd : process
  begin
    if (reset_in = '1') then
      pmb_wr_exec_2  <= '0';
      pmb_wr_exec_3 <= '0';
    elsif (pmb_wr_exec = '1' and
           (pmb_cmd_in=CMD_PAGE or
            pmb_cmd_in=CMD_VOUT_UV_FAULT_LIMIT or
            pmb_cmd_in=CMD_VOUT_OV_FAULT_LIMIT or
            pmb_cmd_in=CMD_OT_FAULT_LIMIT or
            pmb_cmd_in=CMD_OT_WARNING_LIMIT or
            pmb_cmd_in=CMD_UT_FAULT_LIMIT or
            pmb_cmd_in=CMD_UT_WARNING_LIMIT or
            pmb_cmd_in=CMD_MFR_ACCESS_REG
          )) then
      wait until (falling_edge(pmb_wr_exec));
      wait until (rising_edge(dclk_in));
      pmb_wr_exec_2  <= '1';
      wait until (rising_edge(dclk_in));
      pmb_wr_exec_2   <= '0';
      pmb_wr_exec_3  <= '1';
      wait until (rising_edge(dclk_in));
      pmb_wr_exec_3  <= '0';
    end if;
    wait on pmb_wr_exec,reset_in;
  end process;

  p_p_write : process (reset_in, pmb_wr_exec, dclk_in)
    variable Message                : line;   
  begin
    if (reset_in = '1') then
      pmb_read_only_cmd          <= '0';
      pmb_clr_status_vout        <= X"00";
      pmb_clr_status_temperature <= X"00";
      pmb_clr_status_cml         <= X"00";
      pmb_drsram_addr            <= X"00";
      pmb_drsram_wr_data         <= X"0000";
    elsif (rising_edge (pmb_wr_exec)) then 
      pmb_read_only_cmd          <= '0';
      pmb_clr_status_vout        <= X"00";
      pmb_clr_status_temperature <= X"00";
      pmb_clr_status_cml         <= X"00";
      pmb_drsram_addr            <= X"00";
      pmb_drsram_wr_data         <= X"0000";
      case (pmb_cmd_in) is
        when CMD_PAGE                => pmb_read_only_cmd  <= '0'; -- dummy. seperated to another always block for readibility
        when CMD_CLEAR_FAULT         => pmb_read_only_cmd  <= '1'; --Error: Too many bytes
        when CMD_VOUT_OV_FAULT_LIMIT => pmb_drsram_addr    <= pmb_page_up_l;     
                                        pmb_drsram_wr_data <= linear16_to_drp(pmb_data_in(15 downto 0)); 
        when CMD_VOUT_UV_FAULT_LIMIT => pmb_drsram_addr    <= pmb_page_lo_l;    
                                        pmb_drsram_wr_data <= linear16_to_drp(pmb_data_in(15 downto 0));
        when CMD_OT_FAULT_LIMIT      => pmb_drsram_addr    <= X"53";     
                                        pmb_drsram_wr_data <= linear11_to_drp(pmb_data_in(15 downto 0)); 
        when CMD_OT_WARNING_LIMIT    => pmb_drsram_addr    <= X"50";     
                                        pmb_drsram_wr_data <= linear11_to_drp(pmb_data_in(15 downto 0)); 
        when CMD_UT_WARNING_LIMIT    => pmb_drsram_addr    <= X"54";     
                                        pmb_drsram_wr_data <= linear11_to_drp(pmb_data_in(15 downto 0)); 
        when CMD_UT_FAULT_LIMIT      => pmb_drsram_addr    <= X"57";     
                                        pmb_drsram_wr_data <= linear11_to_drp(pmb_data_in(15 downto 0)); 
        when CMD_STATUS_VOUT         => pmb_clr_status_vout        <= pmb_data_in(7 downto 0);
        when CMD_STATUS_TEMPERATURE  => pmb_clr_status_temperature <= pmb_data_in(7 downto 0);
        when CMD_STATUS_CML          => pmb_clr_status_cml         <= pmb_data_in(7 downto 0);
        when CMD_MFR_SELECT_REG      => pmb_sel_addr               <= pmb_data_in(7 downto 0);
                                        -- Checked reserved error message
                                        if(is_reserved_address(pmb_sel_addr)='1') then
                                         --$display("Warning: (Unisim %s) PMBus MFR_SELECT_REG command is trying to point to a RESERVED location h%0X.", MODULE_NAME, pmb_sel_addr, $time/1000.0);
                                         Write ( Message, string'("[Unisim "));
                                         Write ( Message, string'(MODULE_NAME));
                                         Write ( Message, string'("- 63] PMBus MFR_SELECT_REG command is trying to point to a RESERVED location."));
                                         assert false report Message.all  severity warning;
                                         DEALLOCATE(Message);
                                        end if;
        when CMD_MFR_ACCESS_REG      => pmb_drsram_addr    <= pmb_sel_addr; 
                                        pmb_drsram_wr_data <= pmb_data_in(15 downto 0); 
        when CMD_CAPABILITY          | CMD_VOUT_MODE         | 
             CMD_STATUS_BYTE         | CMD_STATUS_WORD       |
             CMD_READ_VOUT           | CMD_READ_TEMPERATURE_1| 
             CMD_PMBUS_REVISION      | CMD_MFR_ID            | 
             CMD_MFR_MODEL           | CMD_MFR_REVISION      |
             CMD_MFR_READ_VOUT_MAX   | CMD_MFR_READ_VOUT_MIN | 
             CMD_MFR_READ_TEMP_MAX   | CMD_MFR_READ_TEMP_MIN |
             CMD_MFR_ENABLE_VUSER_HR =>
                                        pmb_read_only_cmd        <= '1'; --Error: Too many bytes
        when others                  => pmb_read_only_cmd        <= '0'; --dummy
      end case;
    elsif (pmb_wr_exec ='0' and rising_edge (dclk_in)) then
      pmb_read_only_cmd          <= '0';
      pmb_clr_status_vout        <= X"00";
      pmb_clr_status_temperature <= X"00";
      pmb_clr_status_cml         <= X"00";
      -- Keep pmb_drsram_addr and pmb_drsram_wr_data values 
      -- as they will be used with delay
    end if;
  end process;

  --PMB write execute for page command
  p_p_page  : process (reset_in, pmb_wr_exec, pmb_wr_exec_3)
    variable Message                : line;   
  begin
    if (reset_in = '1') then
      pmb_drsram_bit_idx   <= 0;
      pmb_drsram_addr_page <= X"00";
      pmb_page_index       <= X"00";
      pmb_page_stat        <= X"00";
      pmb_page_max         <= X"00";
      pmb_page_min         <= X"00";
      pmb_page_up_l        <= X"00";
      pmb_page_lo_l        <= X"00";
      pmb_page_alm_id      <=  1;
      pmb_valid_page       <= '0';
      pmb_page_6V          <= '0';
    elsif (pmb_wr_exec_3 = '1') then
      pmb_valid_page <= '0';
    elsif (rising_edge (pmb_wr_exec)) then 
      if(pmb_cmd_in = CMD_PAGE) then
        pmb_page_index    <= pmb_data_in(7 downto 0);
        case (pmb_data_in(7 downto 0)) is
          when X"01"  =>  pmb_drsram_addr_page <= X"48";
                          pmb_drsram_bit_idx   <= 9;
                          pmb_page_stat        <= X"01";
                          pmb_page_max         <= X"21";
                          pmb_page_min         <= X"25";
                          pmb_page_up_l        <= X"51";
                          pmb_page_lo_l        <= X"55";
                          pmb_page_alm_id      <= 1;
                          pmb_valid_page       <= '1';
                          pmb_page_6V          <= '0';

          when X"02"  =>  pmb_drsram_addr_page <= X"48";
                          pmb_drsram_bit_idx   <= 10;
                          pmb_page_stat        <= X"02";
                          pmb_page_max         <= X"22";
                          pmb_page_min         <= X"26";
                          pmb_page_up_l        <= X"52";
                          pmb_page_lo_l        <= X"56";
                          pmb_page_alm_id      <= 2;
                          pmb_valid_page       <= '1';
                          pmb_page_6V          <= '0';

          when X"06"  =>  pmb_drsram_addr_page <= X"48";
                          pmb_drsram_bit_idx   <= 14;
                          pmb_page_stat        <= X"06";
                          pmb_page_max         <= X"23";
                          pmb_page_min         <= X"27";
                          pmb_page_up_l        <= X"58";
                          pmb_page_lo_l        <= X"5C";
                          pmb_page_alm_id      <= 3;
                          pmb_valid_page       <= '1';
                          pmb_page_6V          <= '0';

          when X"0D"  =>  pmb_drsram_addr_page<= X"48";
                          pmb_drsram_bit_idx  <= 7;
                          pmb_page_stat       <= X"0D";
                          pmb_page_max        <= X"28";
                          pmb_page_min        <= X"2C";
                          pmb_page_up_l       <= X"59";
                          pmb_page_lo_l       <= X"5D";
                          pmb_page_alm_id     <= 4;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= '0';

          when X"0E"  =>  pmb_drsram_addr_page<= X"48";
                          pmb_drsram_bit_idx  <= 6;
                          pmb_page_stat       <= X"0E";
                          pmb_page_max        <= X"29";
                          pmb_page_min        <= X"2D";
                          pmb_page_up_l       <= X"5A";
                          pmb_page_lo_l       <= X"5E";
                          pmb_page_alm_id     <= 5;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= '0';

          when X"0F"  =>  pmb_drsram_addr_page<= X"48";
                          pmb_drsram_bit_idx  <= 5;
                          pmb_page_stat       <= X"0F";
                          pmb_page_max        <= X"2A";
                          pmb_page_min        <= X"2E";
                          pmb_page_up_l       <= X"5B";
                          pmb_page_lo_l       <= X"5F";
                          pmb_page_alm_id     <= 6;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= '0';

          when X"20"  =>  pmb_drsram_addr_page<= X"46"; -- VUSER 0
                          pmb_drsram_bit_idx  <= 0;
                          pmb_page_stat       <= X"80";
                          pmb_page_max        <= X"A0";
                          pmb_page_min        <= X"A8";
                          pmb_page_up_l       <= X"60";
                          pmb_page_lo_l       <= X"68";
                          pmb_page_alm_id     <= 8;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= bank_sel_6V(0);

          when X"21"  =>  pmb_drsram_addr_page<= X"46"; -- VUSER 1
                          pmb_drsram_bit_idx  <= 1;
                          pmb_page_stat       <= X"81";
                          pmb_page_max        <= X"A1";
                          pmb_page_min        <= X"A9";
                          pmb_page_up_l       <= X"61";
                          pmb_page_lo_l       <= X"69";
                          pmb_page_alm_id     <= 9;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= bank_sel_6V(1);

          when X"22"  =>  pmb_drsram_addr_page<= X"46"; -- VUSER 2
                          pmb_drsram_bit_idx  <= 2;
                          pmb_page_stat       <= X"82";
                          pmb_page_max        <= X"A2";
                          pmb_page_min        <= X"AA";
                          pmb_page_up_l       <= X"62";
                          pmb_page_lo_l       <= X"6A";
                          pmb_page_alm_id     <= 10;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= bank_sel_6V(2);

          when X"23"  =>  pmb_drsram_addr_page<= X"46"; -- VUSER 3
                          pmb_drsram_bit_idx  <= 3;
                          pmb_page_stat       <= X"83";
                          pmb_page_max        <= X"A3";
                          pmb_page_min        <= X"AB";
                          pmb_page_up_l       <= X"63";
                          pmb_page_lo_l       <= X"6B";
                          pmb_page_alm_id     <= 11;
                          pmb_valid_page      <= '1';
                          pmb_page_6V         <= bank_sel_6V(3);

          when others =>  pmb_drsram_addr_page<= X"00";
                          pmb_drsram_bit_idx  <= 0;
                          pmb_page_stat       <= X"00";
                          pmb_page_max        <= X"00";
                          pmb_page_min        <= X"00";
                          pmb_page_up_l       <= X"00";
                          pmb_page_lo_l       <= X"00";
                          pmb_page_alm_id     <= 1;
                          pmb_valid_page      <= '0';
                          pmb_page_6V         <= '0';
                          Write ( Message, string'("[Unisim "));
                          Write ( Message, string'(MODULE_NAME));
                          Write ( Message, string'(" -55] PMBus page command received an invalid Page index."));
                          assert false report Message.all  severity warning;
                          DEALLOCATE(Message);

        end case;
      end if;
    end if;
  end process;


  --PMBus read execute
  p_p_rdexec : process (i2c_sclk_in, reset_in)
  begin
    if (reset_in = '1') then
      pmb_unsp_data <= '0'; --unsupported data // This is not a read command
    elsif (falling_edge (i2c_sclk_in)) then
      -- need to fetch before we know if we are going to get a read or write request
      if(pmb_state=ST_PMB_GET_ADDR and i2c_ack_bit='0') then
        pmb_data_out <= (others => '0');
        case (pmb_cmd_in) is
          when CMD_PAGE                => pmb_data_out(7 downto 0)      <= pmb_page_index;
          when CMD_CLEAR_FAULT         => pmb_unsp_data                 <= '1'; --unsupported data -- This is not a read command. validate after
                                          pmb_data_out(31 downto 0)     <= (others => '-');  --invalid command gets and x. 
          when CMD_CAPABILITY          => pmb_data_out(7 downto 0)      <= X"30";
          when CMD_VOUT_MODE           => pmb_data_out(7 downto 0)      <= X"12";                 
          when CMD_VOUT_OV_FAULT_LIMIT => pmb_data_out(15 downto 0)     <= drp_to_linear16(dr_sram(SLV_TO_INT(pmb_page_up_l)));                                     
          when CMD_VOUT_UV_FAULT_LIMIT => pmb_data_out(15 downto 0)     <= drp_to_linear16(dr_sram(SLV_TO_INT(pmb_page_lo_l)));
          when CMD_OT_FAULT_LIMIT      => pmb_data_out(15 downto 0)     <= drp_to_linear11(dr_sram(83));
          when CMD_OT_WARNING_LIMIT    => pmb_data_out(15 downto 0)     <= drp_to_linear11(dr_sram(80));
          when CMD_UT_WARNING_LIMIT    => pmb_data_out(15 downto 0)     <= drp_to_linear11(dr_sram(84));
          when CMD_UT_FAULT_LIMIT      => pmb_data_out(15 downto 0)     <= drp_to_linear11(dr_sram(87));
          when CMD_STATUS_BYTE         => pmb_data_out(7 downto 0)      <= pmb_status_byte;
          when CMD_STATUS_WORD         => pmb_data_out(15 downto 0)     <= pmb_status_word & pmb_status_byte;
          when CMD_STATUS_VOUT         => pmb_data_out(7 downto 0)      <= pmb_status_vout;
          when CMD_STATUS_TEMPERATURE  => pmb_data_out(7 downto 0)      <= pmb_status_temperature;
          when CMD_STATUS_CML          => pmb_data_out(7 downto 0)      <= pmb_status_cml;
          when CMD_READ_VOUT           => if(UNSIGNED(pmb_page_stat) >= X"40") then
                                            pmb_data_out(15 downto 0) <= drp_to_linear16(dr_sram (SLV_TO_INT(pmb_page_stat))); 
                                          else
                                            pmb_data_out(15 downto 0) <= drp_to_linear16(data_reg(SLV_TO_INT(pmb_page_stat))); 
                                          end if;
          when CMD_READ_TEMPERATURE_1  => pmb_data_out(15 downto 0)   <= drp_to_linear11(data_reg(0)); 
          when CMD_PMBUS_REVISION      => pmb_data_out(7 downto 0)    <= X"42";                 
          when CMD_MFR_ID              => pmb_data_out(7 downto 0)    <= X"03"; --in block read, first byte is the length of the rest of the data
                                          pmb_data_out(15 downto 8)   <= X"93";                 
                                          pmb_data_out(23 downto 16)  <= X"00";                 
                                          pmb_data_out(31 downto 24)  <= X"00";                 
          when CMD_MFR_MODEL           => pmb_data_out(7 downto 0)    <= X"03"; --in block read, first byte is the length of the rest of the data
                                          pmb_data_out(15 downto 8)   <= X"00";                 
                                          pmb_data_out(23 downto 16)  <= X"00";                 
                                          pmb_data_out(31 downto 24)  <= X"00";                 
          when CMD_MFR_REVISION        => pmb_data_out(7 downto 0)    <= X"02"; --in block read, first byte is the length of the rest of the data
                                          pmb_data_out(15 downto 8)   <= X"00";                 
                                          pmb_data_out(23 downto 16)  <= X"00";                 
          when CMD_MFR_SELECT_REG      => pmb_data_out(7 downto 0)      <= pmb_sel_addr;
          when CMD_MFR_ACCESS_REG      => if(UNSIGNED(pmb_sel_addr) >= X"40") then
                                            pmb_data_out(15 downto 0) <= dr_sram (SLV_TO_INT(pmb_sel_addr)); 
                                          else
                                            pmb_data_out(15 downto 0) <= data_reg(SLV_TO_INT(pmb_sel_addr)); 
                                          end if;
          when CMD_MFR_READ_VOUT_MAX   => if(UNSIGNED(pmb_page_max)>=X"40") then
                                            pmb_data_out(15 downto 0) <= drp_to_linear16(dr_sram (SLV_TO_INT(pmb_page_max)));
                                          else
                                            pmb_data_out(15 downto 0) <= drp_to_linear16(data_reg(SLV_TO_INT(pmb_page_max)));
                                          end if;
          when CMD_MFR_READ_VOUT_MIN   => if(UNSIGNED(pmb_page_min)>=X"40") then
                                            pmb_data_out(15 downto 0) <= drp_to_linear16(dr_sram (SLV_TO_INT(pmb_page_min)));
                                          else
                                            pmb_data_out(15 downto 0) <= drp_to_linear16(data_reg(SLV_TO_INT(pmb_page_min)));
                                          end if;
          when CMD_MFR_ENABLE_VUSER_HR => pmb_data_out(3 downto 0)  <= cfg_reg4(3 downto 0);   -- as is
          when CMD_MFR_READ_TEMP_MAX   => pmb_data_out(15 downto 0) <= drp_to_linear11(data_reg(32)); 
          when CMD_MFR_READ_TEMP_MIN   => pmb_data_out(15 downto 0) <= drp_to_linear11(data_reg(36)); 
          when others                  => pmb_data_out(31 downto 0) <= (others => '0');   --invalid command
        end case;

        if (pmb_ara_rcvd='1' ) then --&& (pmb_state==ST_PMB_GET_ADDR)) begin
          pmb_data_out(31 downto 8) <= X"000000";
          pmb_data_out(7 downto 1)  <= i2c_device_addr or "0000100";
          pmb_data_out(0)           <= '0'; --lsb of the response is don't care.
        end if;
      elsif (i2c_lsb_bit='1' and pmb_state=ST_PMB_READ ) then
        pmb_data_out <= "00000000" & pmb_data_out(31 downto 8); --shift the higher byte to lower
      else --shift the data 1 bit at a time for only the lower byte. bit 7 is pushed out.
        pmb_data_out <= pmb_data_out(31 downto 8) & pmb_data_out(6 downto 0) & '0';
      end if;
    end if;--clk
  end process;
  
  -- PMBus fault handling
  p_p_statw : process (sysmon_rst, pmb_clr, dclk_in)
  begin
    if (sysmon_rst = '1' or pmb_clr = '1') then
      pmb_status_word             <= X"00";
      pmb_status_byte             <= X"00";
    elsif (rising_edge(dclk_in)) then
      pmb_status_word(7)          <= or_reduct( pmb_status_vout(7 downto 0));
      pmb_status_word(6 downto 0) <= "0000000"; --Reserved
      pmb_status_byte(7 downto 6) <= "00"; --Reserved
      pmb_status_byte(5)          <= pmb_status_vout(7);
      pmb_status_byte(4 downto 3) <= "00"; --Reserved
      pmb_status_byte(2)          <= or_reduct (pmb_status_temperature(7 downto 0));
      pmb_status_byte(1)          <= or_reduct (pmb_status_cml(7 downto 0)); 
      pmb_status_byte(0)          <= '0'; --None of the above is undefined
    end if;
  end process;

  p_p_statt : process (sysmon_rst, pmb_clr, dclk_in)
  begin
    if (sysmon_rst = '1' or pmb_clr = '1') then
      pmb_status_temperature      <= X"00";
    elsif (rising_edge(dclk_in)) then
      pmb_status_temperature(7)   <= (not pmb_clr_status_temperature(7)) and ((ot_out and not(ut_fault))); 
      pmb_status_temperature(6)   <= (not pmb_clr_status_temperature(6)) and ((alm_out(0) and not(ut_warn)));
      pmb_status_temperature(5)   <= (not pmb_clr_status_temperature(5)) and ut_warn;
      pmb_status_temperature(4)   <= (not pmb_clr_status_temperature(4)) and ut_fault;

      pmb_status_temperature(3 downto 0) <= X"0";
    end if;
  end process;
  
  p_p_statv : process (sysmon_rst, pmb_clr, dclk_in)
  begin
    if (sysmon_rst = '1' or pmb_clr = '1') then
      pmb_status_vout <= X"00";
    elsif (rising_edge(dclk_in) and pmb_paged = '1') then
      pmb_status_vout(7)          <= (not pmb_clr_status_vout(7)) and (alm_out(pmb_page_alm_id) and not(alm_ut(pmb_page_alm_id))); --Over voltage
      pmb_status_vout(6 downto 5) <= "00"; --Reserved
      pmb_status_vout(4)          <= (not pmb_clr_status_vout(4)) and alm_ut(pmb_page_alm_id); --Under voltage
      pmb_status_vout(3 downto 0) <= X"0"; --Reserved
    end if;
  end process;

  p_p_statc : process (sysmon_rst, pmb_clr, dclk_in)
  begin
    if (sysmon_rst = '1' or pmb_clr = '1') then
      pmb_status_cml      <= X"00";
    elsif (rising_edge(dclk_in)) then
      pmb_status_cml(7)           <= not(pmb_clr_status_cml(7)) and pmb_unsp_cmd;
      pmb_status_cml(6)           <= not(pmb_clr_status_cml(6)) and (pmb_unsp_data or pmb_read_only_cmd);
      pmb_status_cml(5 downto 2)  <=  X"0"; --Reserved 
      pmb_status_cml(1)           <= '0'; --not(pmb_clr_status_cml(1)) and '0'; -- Other/TBD
      pmb_status_cml(0)           <= '0'; --Reserved
    end if;
  end process;

  p_p_smb : process (sysmon_rst, pmb_clr, dclk_in)
  begin
    if (sysmon_rst = '1' or pmb_clr = '1') then
      smbalert_ts_out <= '1'; -- active negative
    elsif (rising_edge(dclk_in)) then
      smbalert_ts_out <= not((or_reduct(pmb_status_word)) or (or_reduct(pmb_status_byte)));
    end if;
  end process;

  -------------------------------------------------------------------------------
  -- end of pmbus logic 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  -- end of i2c logic 
  -------------------------------------------------------------------------------
    

  -------------------------------------------------------------------------------
  -- Clock divider, generate  and adcclk
  -------------------------------------------------------------------------------
  adcclk_period_end   <= '1' when (adcclk_count = curr_clkdiv_sel-1) else '0';
  adcclk_period_start <= '1' when (adcclk_count = 0) else '0';

  p_adcclk_period_end : process(dclk_in)
  begin
    if (rising_edge(dclk_in)) then
        adcclk_period_end_d <= adcclk_period_end;
    end if;
  end process;

  sysclk_p : process(dclk_in)
  begin
    if (rising_edge(dclk_in)) then
        sysclk <= not sysclk;
    end if;
  end process;


  curr_clkdiv_sel_int <= SLV_TO_INT(curr_clkdiv_sel);
  
  clk_count_p : process(dclk_in)
  begin
    if (rising_edge(dclk_in)) then
      if (curr_clkdiv_sel_int > 2 or adcclk_count_rst = '1' ) then 
        if (adcclk_count >= curr_clkdiv_sel_int - 1) then
          adcclk_count <= 0;
        else
          adcclk_count <= adcclk_count + 1;
        end if;

        if (adcclk_count_rst='1') then
          adcclk_tmp <= '1';
        elsif (adcclk_count <= (curr_clkdiv_sel_int/2) - 1) then
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
    
  --------------------------------------------------------------------- 
  -- sequence control
  --------------------------------------------------------------------- 

  lr_chan_on       <= B2S((lr_tot_chan>0)  and cont_seq_mode);
  cont_seq_only_hr <= B2S((lr_tot_chan=0) and cont_seq_mode);


 --CR-961759 When channel selection registers are changed, the update is after end of the sequence.
 -- In dual channel, EOS is optional, hence EOS_out is not used.
  add_chan_p : process(sysmon_rst,DCLK_in) begin
    if( sysmon_rst='1') then 
      add_channel <= '0';
    elsif(rising_edge(DCLK_in)) then
      -- else begin //it has to be the final EOS of the final channel in the big loop hence tot_final_conversion
      if(eoc_asrt='1' and (avg_en='0' or avg_final_loop='1') and tot_final_conversion='1' and (add_channel_hr_p='1' or add_channel_lr_p='1')) then 
        add_channel <= '1';
      else 
        add_channel <= '0';
      end if;
    end if;
  end process;


   start_conv_p : process ( sysmon_rst, chan_asrt_1)
     variable       Message : line;
     variable       tmp_seq1_0 : std_logic_vector(1 downto 0);
   begin
     if (rising_edge(sysmon_rst)) then
       mn_mux_in <= 0.0;
     elsif (rising_edge(chan_asrt_1)) then
         if ((chan_out_id_next = 7) or (chan_out_id_next >= 9 and chan_out_id_next <= 12) or (chan_out_id_next >= 36)) then
           Write ( Message, string'("Warning : [Unisim "));
           Write ( Message, string'(MODULE_NAME));
           Write ( Message, string'("-65] The analog channel with index "));
           Write ( Message, chan_out_id_next);
           Write ( Message, string'(" is invalid. Check register 40h[5:0]"));
           assert false report Message.all severity warning;
           DEALLOCATE(Message);
         elsif ( ((chan_out_id_next = 3) or (chan_out_id_next >= 16 and chan_out_id_next <= 31))) then
           if (ext_mux_en) then
             mn_mux_in <= mn_in_diff(ext_mux_chan_idx);
           else
             mn_mux_in <= mn_in_diff(chan_out_id_next);
           end if;
         else
            mn_mux_in <= mn_in_uni(chan_out_id_next);
         end if;

    end if;
  end  process;

  -- end of configuration

  ----------------------------------------------------

  -- sequence control


  p_s_totch : process(sysmon_rst,DCLK_in)
    variable hr_tot_chan_tmp : integer := 0;
    variable lr_tot_chan_tmp : integer := 0;
    variable si_tmp          : integer := 0;
    variable si              : integer := 0;
  begin
    if(sysmon_rst='1') then
      for I in 0 to CONV_CNT_P loop
        seq_lr_mem(I) <= 0;
        seq_hr_mem(I) <= 0;
      end loop;
      hr_tot_chan_tmp := 0;
      lr_tot_chan_tmp := 0;
      lr_calib_on      <= '0';
    elsif (rising_edge(DCLK_in) and (initialize(1) ='1' or add_channel='1')) then
      lr_calib_on <='0';
      if (single_pass_active or cont_seq_mode) then -- 0001 or 0010 
        -- high rate sequence
        hr_tot_chan_tmp := 0;
        for I in 0 to 47 loop
          si := I;
          if(hr_tot_chan_tmp<= 31) then
            if((seq_hr_chan_reg_comb(si)='1') or 
               (si=0 and seq_hr_chan_reg_comb(0)='0' and single_pass_active)) then--calibration has to be added to single pass mode if not available
              seq_hr_mem(hr_tot_chan_tmp) <= si;
              hr_tot_chan_tmp := hr_tot_chan_tmp + 1;
              if(hr_tot_chan_tmp = 32) then
                report "[Unisim "&string'(MODULE_NAME)&"-66] Max allowed channels are 31. Please check the high rate channel selection (46h,48h,49h). After 31, channels will be ignored."
                severity note;
              end if;
            end if;
          end if;
        end loop;

        if (cont_seq_mode) then  --0010
          --review for low rate high rate selection interaction
          lr_tot_chan_tmp := 0;
          for I in 0 to 47 loop
            si := I;
            if (seq_lr_chan_reg_comb(si) = '1') then
              --low rate
              if(seq_lr_chan_reg_comb(si) = seq_hr_chan_reg_comb(si) and not((si>=1 and si<=4) or si=15 or (si>=36 and si<=47)) ) then --CR 863886
                --handle duplicates first
                case si is
                  when 0  => report "[Unisim "&string'(MODULE_NAME)&"-29] Attribute INIT_7A[0], calibration has already been selected for the ADC channel sequence with INIT_48[0]. It will be ignored in the low rate sequence." 
                             severity note;
                             lr_calib_on<='0';
                  when 5  => report "[Unisim "&string'(MODULE_NAME)&"-30] Attribute INIT_7A[5], VCC_PSAUX has already been selected for the ADC channel sequence with INIT_48[0]. It will be ignored in the low rate sequence." 
                             severity note;
                  when 6  => report "[Unisim "&string'(MODULE_NAME)&"-31] Attribute INIT_7A[6], VCC_PSINTFP has already been selected for the ADC channel sequence with INIT_48[0]. It will be ignored in the low rate sequence."
                             severity note;
                  when 7  => report "[Unisim "&string'(MODULE_NAME)&"-32] Attribute INIT_7A[7], VCC_PSINTLP has already been selected for the ADC channel sequence with INIT_48[0]. It will be ignored in the low rate sequence."
                             severity note;
                  when 8  => report "[Unisim "&string'(MODULE_NAME)&"-33] Attribute INIT_7A[8], TEMP has already been selected for the ADC channel sequence with INIT_48[8]. It will be ignored in the low rate sequence."
                             severity note;
                  when 9  => report "[Unisim "&string'(MODULE_NAME)&"-34] Attribute INIT_7A[9], INT_AVG has already been selected for the ADC channel sequence with INIT_48[9]. It will be ignored in the low rate sequence."
                             severity note;
                  when 10 => report "[Unisim "&string'(MODULE_NAME)&"-35] Attribute INIT_7A[10], AUX_AVG has already been selected for the ADC channel sequence with INIT_48[10]. It will be ignored in the low rate sequence."
                             severity note;
                  when 11 => report "[Unisim "&string'(MODULE_NAME)&"-36] Attribute INIT_7A[11], VpVn has already been selected for the ADC channel sequence with INIT_48[11]. It will be ignored in the low rate sequence."
                             severity note;
                  when 12 => report "[Unisim "&string'(MODULE_NAME)&"-37] Attribute INIT_7A[12], VREFP has already been selected for the ADC channel sequence with INIT_48[12]. It will be ignored in the low rate sequence."
                             severity note;
                  when 13 => report "[Unisim "&string'(MODULE_NAME)&"-38] Attribute INIT_7A[13], VREFN has already been selected for the ADC channel sequence with INIT_48[13]. It will be ignored in the low rate sequence."
                             severity note;
                  when 14 => report "[Unisim "&string'(MODULE_NAME)&"-39] Attribute INIT_7A[14], BRAM has already been selected for the ADC channel sequence with INIT_48[14]. It will be ignored in the low rate sequence."
                             severity note;
                  when 16 to 31 => si_tmp := si-16;
                             report "[Unisim "&string'(MODULE_NAME)&"-41] Attribute INIT_7B["&integer'image(si_tmp)&"], auxiliary analog input has already been selected for the ADC channel sequence with INIT_49. It will be ignored in the low rate sequence."
                             severity note;
                  when 32 => report "[Unisim "&string'(MODULE_NAME)&"-42] Attribute INIT_7C[0], USER0 has already been selected for the ADC channel sequence with INIT_46[0]. It will be ignored in the low rate sequence."
                             severity note;
                  when 33 => report "[Unisim "&string'(MODULE_NAME)&"-43] Attribute INIT_7C[1], USER1 has already been selected for the ADC channel sequence with INIT_46[1]. It will be ignored in the low rate sequence."
                             severity note;
                  when 34 => report "[Unisim "&string'(MODULE_NAME)&"-44] Attribute INIT_7C[2], USER2 has already been selected for the ADC channel sequence with INIT_46[2]. It will be ignored in the low rate sequence."
                             severity note;
                  when 35 => report "[Unisim "&string'(MODULE_NAME)&"-45] Attribute INIT_7C[3], USER3 has already been selected for the ADC channel sequence with INIT_46[3]. It will be ignored in the low rate sequence."
                             severity note;
                  when others => report "[Unisim "&string'(MODULE_NAME)&"-40] In attribute INIT_7A, INIT_7B or INIT_7C, same selections have already been selected for the ADC channel sequence with INIT_46, INIT_48, or INIT_49. They will be ignored in the low rate sequence." 
                             severity note;
                end case;
              
              else 
                --not duplicate in low and high rate, only in low rate. stays as is.
                seq_lr_mem(lr_tot_chan_tmp) <= si;
                lr_tot_chan_tmp := lr_tot_chan_tmp + 1;
                if(si=0 and seq_lr_chan_reg_comb(0)='1') then
                  lr_calib_on <= '1';
                end if;
              end if; --if(seq_lr_chan_reg_comb(si) = seq_hr_chan_reg_comb(si) and not((si>=1 and si<=4) or si=15) )
            
            elsif(seq_hr_chan_reg_comb(si)='0' and (si=0 or si=8)) then
              --handle missing ones
              --seq_lr_chan_reg_comb[si]==0. Calibration and temperature are disabled in both by the user 
              seq_lr_mem(lr_tot_chan_tmp) <= si;
              lr_tot_chan_tmp := lr_tot_chan_tmp + 1;
              if(si=0) then
                lr_calib_on<='1';
                report "[Unisim "&string'(MODULE_NAME)&"-51] Neither attribute INIT_7A[0] nor INIT_48[0] have been selected. Calibration will be enabled in the low rate sequence anyway." 
                severity note;
              else --si=8
                report "[Unisim "&string'(MODULE_NAME)&"-52] Neither attribute INIT_7A[8] nor INIT_48[8] have been selected. Temperature will be enabled in the low rate sequence anyway." 
                severity note;
              end if;
            end if; --if (seq_lr_chan_reg_comb(si) = '1') then
          end loop;
          if(hr_tot_chan_tmp=0) then
            assert false report
              "[Unisim SYSMONE4-67] No channel was selected for HR. This is not a valid option. Simulation exiting."
              severity failure;
          end if;
        end if; --cont_seq_mode 

        lr_tot_chan <= lr_tot_chan_tmp;
        hr_tot_chan <= hr_tot_chan_tmp;
        --end of cont_seq_mode or single_pass

      elsif (default_mode) then --0000 or 11xx
        if(ext_mux = '1') then
          report "[Unisim "&string'(MODULE_NAME)&"-68] External mux selection will be disregarded as SYSMON is in default mode."
          severity note;
        end if;

        if (SIM_DEVICE = "ULTRASCALE_PLUS" or SIM_DEVICE = "ULTRASCALE_PLUS_ES1" or SIM_DEVICE = "ULTRASCALE_PLUS_ES2") then
          hr_tot_chan <= 5;
          seq_hr_mem(0) <= 0;
          seq_hr_mem(1) <= 8;
          seq_hr_mem(2) <= 9;
          seq_hr_mem(3) <= 10;
          seq_hr_mem(4) <= 14;
        elsif (SIM_DEVICE = "ZYNQ_ULTRASCALE" or SIM_DEVICE = "ZYNQ_ULTRASCALE_ES1" or SIM_DEVICE = "ZYNQ_ULTRASCALE_ES2") then
          hr_tot_chan <= 8;
          seq_hr_mem(0) <= 0;
          seq_hr_mem(1) <= 5;
          seq_hr_mem(2) <= 6;
          seq_hr_mem(3) <= 7;
          seq_hr_mem(4) <= 8;
          seq_hr_mem(5) <= 9;
          seq_hr_mem(6) <= 10;
          seq_hr_mem(7) <= 14;
        end if;
      elsif (single_chan_mode and ext_mux = '1') then
          report "[Unisim "&string'(MODULE_NAME)&"-66] External mux selection will be disregarded as SYSMON is in single channel mode."
          severity note;
      end if; -- modes
    end if; --initialize[1] or add_channel
  end process;
   
  chan_avg_hr_reg1 <= seq_hr_chan_reg1 and seq_avg_reg1;
  chan_avg_hr_reg2 <= seq_hr_chan_reg2 and seq_avg_reg2;
  chan_avg_hr_reg3 <= seq_hr_chan_reg3 and seq_avg_reg3;
  seq_avg_hr_reg_comb <= (chan_avg_hr_reg3 & chan_avg_hr_reg2 & chan_avg_hr_reg1);
  chan_avg_hr_set  <= or_reduct(seq_avg_hr_reg_comb);

  chan_avg_lr_reg1 <= seq_lr_chan_reg1 and seq_avg_reg1;
  chan_avg_lr_reg2 <= seq_lr_chan_reg2 and seq_avg_reg2;
  chan_avg_lr_reg3 <= seq_lr_chan_reg3 and seq_avg_reg3;
  seq_avg_lr_reg_comb <= (chan_avg_lr_reg3 & chan_avg_lr_reg2 & chan_avg_lr_reg1);
  chan_avg_lr_set  <= or_reduct(seq_avg_lr_reg_comb);

  conversion_p: process(DCLK_in,sysmon_rst)
  begin
    if(rising_edge(DCLK_in)or rising_edge(sysmon_rst)) then
      if(sysmon_rst='1') then
        conversion_before_calib   <= '0';
        hr_final_conversion       <= '0';
        tot_final_conversion      <= '0';
        lr_final_conversion       <= '0';
      else
        if(adc_state=ST_A_CALIB or adc_state=ST_A_FIRST_CALIB) then
          conversion_before_calib <= '0';
          hr_final_conversion     <= '0';
          tot_final_conversion    <= '0';
          lr_final_conversion     <= '0';
        elsif(conv_track='1') then
          conversion_before_calib <= B2S((CHANNEL_out /= 8) and
                                    not(event_driven_mode and single_pass_mode) and
                                    ((lr_chan_on='1' and
                                    ((lr_calib_on='0' and conv_hr_count=hr_tot_chan-1 and seq_lr_selected='1') or
                                    (lr_calib_on='1' and conv_tot_count=tot_per-1))) or
                                    (lr_chan_on='0' and conv_hr_count=hr_tot_chan-1) ));
         hr_final_conversion      <= B2S((((hr_tot_chan=1 and lr_calib_on='0') or (CHANNEL_out/=8)) and (conv_hr_count=(hr_tot_chan-1))) or
                                    (single_chan_mode and (CHANNEL_out/=8)));
         tot_final_conversion     <= B2S((CHANNEL_out/=8) and (conv_tot_count=tot_per-1));
         lr_final_conversion      <=  B2S((lr_calib_on='0' and (conv_tot_count=tot_per-1)) or
                                     (lr_calib_on='1' and lr_tot_chan>1 and (conv_tot_count=tot_per-int_tot_per)) or
                                     (lr_calib_on='1' and lr_tot_chan=1));
        end if;
      end if;
    end if;
  end process;

  seq_lr_selected_p <= B2S(lr_chan_on='1' and
                          ((lr_calib_on='1' and (conv_tot_count mod int_tot_per)=int_tot_per-1) or
                          (lr_calib_on='0' and (conv_tot_count mod int_tot_per)=int_tot_per-2) ));

  conv_hr_count_p   <= (conv_hr_count+1) when (conv_hr_count < hr_tot_chan-1) else 
                       1 when (event_driven_mode and single_chan_mode) else 0;
  conv_lr_count_p   <= (conv_lr_count+1) when (conv_lr_count < lr_tot_chan-1) else 0;
   
  conv_count_p: process(sysmon_rst,initialize(2), chan_asrt_1)
  begin
    if(rising_edge(sysmon_rst) or rising_edge(initialize(2)) or rising_edge(chan_asrt_1)) then
      if(sysmon_rst='1') then
        conv_tot_count <= 0;
        conv_hr_count <= 0;
        conv_lr_count <= 0;
        seq_lr_selected <= '0';
      else
        if(initialize(2)='1') then
          conv_tot_count <= 0;
          if(cont_seq_mode and lr_calib_on='1') then
            seq_lr_selected <= '1';
            conv_hr_count   <= 0;
            conv_lr_count   <= 0;
          else
            seq_lr_selected <= '0';
            conv_hr_count   <= 0;
            conv_lr_count   <= 0;
          end if;
        elsif(chan_asrt_1='1') then 
          if(conv_tot_count<tot_per-1) then
            conv_tot_count <= conv_tot_count+1;
          else
            conv_tot_count <= 0;
          end if;
          if(seq_lr_selected='1') then
            if(conv_lr_count < lr_tot_chan-1) then
              conv_lr_count <= conv_lr_count + 1;
            else
              conv_lr_count <= 0;
            end if;
          end if;

          if(seq_lr_selected_p='0' and not(seq_lr_selected='1' and lr_calib_on='1' and st_first_calib_chan='1')) then
            if(conv_hr_count < hr_tot_chan-1) then
              conv_hr_count <= conv_hr_count+1;
            elsif (event_driven_mode and single_pass_mode) then
              conv_hr_count <= 1;
            else
              conv_hr_count <= 0;
            end if;
          end if;

          if(seq_lr_selected='1') then
            seq_lr_selected <= '0';
          elsif(lr_chan_on='1' and 
               ((lr_calib_on='1' and (conv_tot_count mod int_tot_per)=int_tot_per-1) or
               (lr_calib_on='0' and (conv_tot_count mod int_tot_per)=int_tot_per-2)  )) then
            seq_lr_selected <= '1';
          end if;

        end if;
      end if;
    end if;
  end process;
 
 --align seq_lr_selected to chan_asrt_3, delay 2 DCLK_in cycles
  seq_lr_p: process(DCLK_in,sysmon_rst) begin
    if(sysmon_rst='1')  then
      seq_lr_selected_d <= "00";
    elsif (rising_edge(DCLK_in)) then
      seq_lr_selected_d <= (seq_lr_selected_d(0) & seq_lr_selected);
    end if;
  end process;

  avg_loop_p: process(DCLK_in,sysmon_rst)
  begin
    if(rising_edge(DCLK_in) or rising_edge(sysmon_rst)) then
      if(sysmon_rst='1') then
        avg_loop_count_lr <= 0;
        avg_loop_count_hr <= 0;
      else
        if(initialize(2)='1') then
          avg_loop_count_lr <= 0;
          avg_loop_count_hr <= 0;
        elsif(chan_asrt_3='1') then
          if(seq_lr_selected_d(1)='0' and hr_final_conversion='1') then
            if(single_pass_mode or avg_en='0' or (avg_en='1' and avg_loop_count_hr=avg_amount)) then
              avg_loop_count_hr <= 0;
            else
              avg_loop_count_hr <= avg_loop_count_hr + 1;
            end if;
          end if;
          if(seq_lr_selected_d(1)='1' and lr_final_conversion='1') then
            if(avg_en='0' or (avg_en='1' and avg_loop_count_lr=avg_amount)) then
              avg_loop_count_lr <= 0;
            else
              avg_loop_count_lr <= avg_loop_count_lr + 1;
            end if;
          end if;
        end if;--chan_asrt_3
      end if;--sysmon_rst==0
    end if;--rising edge
  end process;
  
  chan_out_id_p: process(sysmon_rst,initialize(2), chan_asrt_2)
  begin
    if(rising_edge(sysmon_rst) or rising_edge(initialize(2)) or rising_edge(chan_asrt_2)) then
      if(sysmon_rst='1')then
        chan_reg_id_cur  <= 0;
        chan_out_id_cur  <= 8;
        acq_ext_cur      <= '0';
        bipolar_cur      <= '0'; 
        avg_cur          <= '0';
        chan_reg_id_next <= 0;
        chan_out_id_next <= 8;
        acq_ext_next     <= '0';
        bipolar_next     <= '0'; 
        avg_next         <= '0';
      else
        if(initialize(2)='1') then
          chan_reg_id_cur <= 0;
          chan_out_id_cur <= 8;
          acq_ext_cur    <= '0';
          bipolar_cur    <= '0';
          avg_cur    <= '0';
          if(cont_seq_mode or single_pass_active or default_mode) then
            if(cont_seq_mode and lr_calib_on='1') then
              chan_reg_id_next <= seq_hr_mem(0);
              chan_out_id_next <= SLV_TO_INT(conv_combregid_to_chanout(STD_LOGIC_VECTOR(TO_UNSIGNED(seq_hr_mem(0), 6))));
              acq_ext_next <= seq_acq_ext_reg_comb(seq_hr_mem(0));
              bipolar_next <= seq_bipolar_reg_comb(seq_hr_mem(0));
              if(avg_en='1' ) then
                avg_next <= seq_avg_hr_reg_comb(seq_hr_mem(0));
              else
                avg_next <= '0';
              end if;
            elsif(cont_seq_mode and lr_chan_on='1' and int_tot_per=2) then --same as lr_rate==LR_EVERY_OTHER && hr_tot_chan==1
              chan_reg_id_next <= seq_lr_mem(0);
              chan_out_id_next <= SLV_TO_INT(conv_combregid_to_chanout(STD_LOGIC_VECTOR(TO_UNSIGNED(seq_lr_mem(0), 6))));
              acq_ext_next <= seq_acq_ext_reg_comb(seq_lr_mem(0));
              bipolar_next <= seq_bipolar_reg_comb(seq_lr_mem(0));
              avg_next <= seq_avg_lr_reg_comb(seq_lr_mem(0));
            else --single_pass_active, default_mode, or cont_seq_mode with next one on hr channel
              chan_reg_id_next <= seq_hr_mem(1);
              chan_out_id_next <= SLV_TO_INT(conv_combregid_to_chanout(STD_LOGIC_VECTOR(TO_UNSIGNED(seq_hr_mem(1), 6))));
              acq_ext_next <= seq_acq_ext_reg_comb(seq_hr_mem(1));
              bipolar_next <= seq_bipolar_reg_comb(seq_hr_mem(1));
              if(default_mode) then
                avg_next <= '1';
              elsif(avg_en='1') then
                avg_next <= seq_avg_hr_reg_comb(seq_hr_mem(1));
              else
                avg_next <= '0';
              end if;
            end if;
          --end of cont_seq_mode or single_pass_active or default_mode
          elsif(single_chan_mode) then
            chan_out_id_next   <= SLV_TO_INT(single_chan_id);
            chan_reg_id_next   <= SLV_TO_INT(conv_combregid_to_chanout(single_chan_id));
            -- For single channel the user doesn't have to select via control registers. 
            -- However acquisition extension and bipolar mode are only available to analog channels. 
            if(single_chan_id="000011" or single_chan_id(4)='1') then --Channels 3 or 16 through 31
              acq_ext_next     <= acq_ext;
              bipolar_next     <= B2S(bipolar_mode);
            else
              bipolar_next     <= '0';
              acq_ext_next     <= '0';
              if(bipolar_mode or acq_ext ='1') then
                report "[Unisim "&string'(MODULE_NAME)&"-68]  In single channel mode, acquisition extension or bipolar mode cannot be enabled for non-analog channels. They will be ignored."
                severity note;
              end if;
            end if;
            avg_next         <= avg_en;
          end if;--cont_seq_mode or single_pass_active
        --end of initialize
          
        elsif(chan_asrt_2='1') then
          chan_reg_id_cur <= chan_reg_id_next;
          chan_out_id_cur <= chan_out_id_next;
          acq_ext_cur     <= acq_ext_next;
          bipolar_cur     <= bipolar_next;
          avg_cur         <= avg_next;
          
          if (single_pass_active or default_mode or cont_seq_only_hr='1' or (lr_chan_on='1' and seq_lr_selected_p='0')) then
            chan_reg_id_next <= seq_hr_mem(conv_hr_count_p);
            chan_out_id_next <= SLV_TO_INT(conv_combregid_to_chanout(STD_LOGIC_VECTOR(TO_UNSIGNED(seq_hr_mem(conv_hr_count_p), 6))));
            acq_ext_next     <= seq_acq_ext_reg_comb(seq_hr_mem(conv_hr_count_p));
            bipolar_next     <= seq_bipolar_reg_comb(seq_hr_mem(conv_hr_count_p));
            if(default_mode) then
              avg_next <= '1';
            elsif(avg_en='1') then
              avg_next <= seq_avg_hr_reg_comb(seq_hr_mem(conv_hr_count_p));
            else
              avg_next <= '0';
            end if;

          elsif(cont_seq_mode) then
            chan_reg_id_next <= seq_lr_mem(conv_lr_count);
            chan_out_id_next <= SLV_TO_INT(conv_combregid_to_chanout(STD_LOGIC_VECTOR(TO_UNSIGNED(seq_lr_mem(conv_lr_count), 6))));
            acq_ext_next     <= seq_acq_ext_reg_comb(seq_lr_mem(conv_lr_count));
            bipolar_next     <= seq_bipolar_reg_comb(seq_lr_mem(conv_lr_count));
            if(avg_en='1') then
              avg_next <= seq_avg_lr_reg_comb(seq_lr_mem(conv_lr_count));
            else
              avg_next <= '0';
            end if;
          end if;--modes
          --end of chan_asrt_2
        end if;
        --elsif single_chan_mode: in single channel mode no need to update the next. 
      end if;--sysmon_rst
    end if;--rising_edge
  end process;


-- Conversion
  conv_result_p : process (chan_asrt_3)
    variable conv_result_int_i : integer := 0;
    variable conv_result_int_tmp : integer := 0;
    variable conv_result_int_tmp_rl : real := 0.0;
    variable adc_mn_tmp : real := 0.0;
  begin
    if (rising_edge(chan_asrt_3)) then
      if (chan_out_id_cur_slv = "00000") then    -- temperature conversion
        if (SIM_DEVICE = "ULTRASCALE_PLUS_ES2" or SIM_DEVICE = "ZYNQ_ULTRASCALE_ES2" or SIM_DEVICE = "ULTRASCALE_PLUS" or SIM_DEVICE = "ZYNQ_ULTRASCALE") then
          adc_mn_tmp   := (mn_mux_in + 280.2308787) * 0.00196343 * 65535.0; --CR 961722 10/20/2016. Internal reference
        else 
          adc_mn_tmp := (mn_mux_in + 273.15) * 0.00203580 * 65535.0; -- CR 912341
        end if;
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
      elsif (chan_out_id_cur_slv = "00001" or chan_out_id_cur_slv = "00010" or chan_out_id_cur_slv = "00110" -- 1,2,6
             or chan_out_id_cur_slv = "01101" or chan_out_id_cur_slv = "01110" or chan_out_id_cur_slv = "01111" -- 13,14,15
             or ((chan_out_id_cur >= 32) and (chan_out_id_cur <= 35))) then  --32,33,34,35   
        -- internal power conversion
        if((chan_out_id_cur >= 32 and chan_out_id_cur <= 35) and
            bank_sel_6V(chan_out_id_cur-32)='1') then -- CR 949547
          adc_mn_tmp := mn_mux_in * 65536.0 / 6.0; --6V range is selected, only available for VUSER ports
        else
          adc_mn_tmp := mn_mux_in * 65536.0 / 3.0; --3V range
        end if;
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
      elsif ((chan_out_id_cur_slv = "00011") or ((chan_out_id_cur >= 16) and  (chan_out_id_cur <= 31))) then
        adc_mn_tmp :=  (mn_mux_in) * 65536.0;
        adc_ext_result <= adc_mn_tmp;
        if (curr_b_u = '1')  then --In bipolar mode, -0.5V to +0.5V range maps to -32768 to 32767
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
        else  --in unipolar mode, 0V to 1V range maps to 0 to 65536
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
    else
      conv_result <= STD_LOGIC_VECTOR(TO_UNSIGNED(conv_result_int, 16));
    end if;
  end process;

   
   chan_avg_reg1 <= seq_chan_reg1 and seq_avg_reg1;
   chan_avg_reg2 <= seq_chan_reg2 and seq_avg_reg2;
   chan_avg_reg3 <= seq_chan_reg3 and seq_avg_reg3;

   chan_avg_reg  <= chan_avg_reg1    or chan_avg_reg2    or chan_avg_reg3;
   chan_avg      <= '0' when (chan_avg_reg    = "0000000000000000") else '1';

   lr_chan_avg_reg1 <= seq_lr_chan_reg1 and seq_avg_reg1;
   lr_chan_avg_reg2 <= seq_lr_chan_reg2 and seq_avg_reg2;
   lr_chan_avg_reg3 <= seq_lr_chan_reg3 and seq_avg_reg3;

   lr_chan_avg_reg  <= lr_chan_avg_reg1 or lr_chan_avg_reg2 or lr_chan_avg_reg3;
   lr_chan_avg      <= '0' when (lr_chan_avg_reg = "0000000000000000") else '1';
   
 conv_result_reg_p : process(DCLK_in,sysmon_rst) 
 begin
   if(sysmon_rst = '1') then
     conv_result_reg <= X"0000";
   elsif(rising_edge(DCLK_in)) then
     if(chan_asrt_4='1') then
       conv_result_reg <= conv_result;
     end if;
   end if;
 end process;

 averaging  <= "01" when default_mode else cfg_reg0(13 downto 12);
 avg_amount <=  0   when averaging="00" else
                15  when averaging="01" else
                63  when averaging="10" else
                255 when averaging="11" else 0;
 avg_en     <= '0' when single_pass_mode else 
               '1' when default_mode     else
               '1' when (averaging/="00" and (single_chan_mode or chan_avg_hr_set='1' or chan_avg_lr_set='1' )) else 
               '0';
   
  -- average
  p_conv_acc_result : process(DCLK_in, sysmon_rst)
    variable conv_acc_vec : std_logic_vector(23 downto 0);
    variable conv_acc_vec_int  : integer;
  begin
    if (sysmon_rst = '1') then 
      for j in 0 to MAX_CHANNEL_ID loop
        conv_acc(j) <= 0;
      end loop;
      conv_acc_result <= "0000000000000000";
      conv_acc_vec    := X"000000";
    elsif (rising_edge(DCLK_in)) then
      if(EOC_out='1' and avg_cur='1' and avg_final_loop='1') then
        conv_acc_result <= "0000000000000000";
        conv_acc_vec    := X"000000";
        conv_acc(chan_out_id_cur) <= 0;
      elsif(chan_asrt_4='1' and avg_cur='1') then
        conv_acc(chan_out_id_cur) <= conv_acc(chan_out_id_cur) + conv_result_int;
        conv_acc_vec_int          := conv_acc(chan_out_id_cur) + conv_result_int;
        if (((chan_out_id_cur >= 16) and (chan_out_id_cur <= 31))
           or (chan_out_id_cur = 3)) then
          conv_acc_vec := STD_LOGIC_VECTOR(TO_SIGNED(conv_acc_vec_int, 24));
        else
          conv_acc_vec := STD_LOGIC_VECTOR(TO_UNSIGNED(conv_acc_vec_int, 24));
        end if;
        
        case averaging(1 downto 0) is
          when "00"   => conv_acc_result <= "0000000000000000";
          when "01"   => conv_acc_result <= conv_acc_vec(19 downto 4);
          when "10"   => conv_acc_result <= conv_acc_vec(21 downto 6);
          when "11"   => conv_acc_result <= conv_acc_vec(23 downto 8);
          when others => conv_acc_result <= "0000000000000000";
        end case;

      end if;--initialize
      
    end if;
  end process;


  data_written_p : process(DCLK_in, sysmon_rst)
  begin
    if (sysmon_rst = '1') then
         data_written <= X"0000";
    elsif (rising_edge(DCLK_in) and chan_asrt_5='1') then
      if (avg_cur = '1') then
        data_written <= conv_acc_result;
      else
        data_written <= conv_result_reg;
      end if;
    end if;
  end process;

---------------------------------------------------------------
--- EOC and EOS
---------------------------------------------------------------
  EOC_EOS_p: process(DCLK_in,sysmon_rst) begin
    if(sysmon_rst='1') then
      EOC_out <= '0';
      EOS_out <= '0';
    elsif(rising_edge(DCLK_in)) then
      if(eoc_asrt='1' and (avg_en='0' or avg_cur='0' or ( avg_en='1' and avg_cur='1' and avg_final_loop='1'))) then
        EOC_out <= '1';
        if((lr_chan_on='0' and hr_final_conversion='1') or
           (lr_chan_on='1' and hr_final_conversion='1' and seq_lr_selected='0' and lr_eos/=LR_EOS_LR_ONLY) or
           (lr_chan_on='1' and lr_final_conversion='1' and seq_lr_selected='1' and (lr_eos=LR_EOS_HR_LR or lr_eos=LR_EOS_LR_ONLY))
          ) then
          EOS_out <= '1';
        else
          EOS_out <= '0';
        end if;
      else
        EOC_out <= '0';
        EOS_out <= '0';
      end if;--eoc_asrt and
    end if;--sysmon_rst
  end process;


  -- alarm

    alm_reg_p : process(alm_rst,DCLK_in,gsr_in )
       variable  tmp_unsig1 : unsigned(15 downto 0);
       variable  tmp_unsig2 : unsigned(15 downto 0);
       variable  tmp_unsig3 : unsigned(15 downto 0);
    begin
     if (alm_rst = '1' or gsr_in='1') then
        ot_out_reg <= '0';
        alm_out_reg <= X"0000";
     elsif (rising_edge(DCLK_in)) then
       if (alm_asrt='1' and avg_final_loop='1') then
          tmp_unsig1 := UNSIGNED(data_written);
          if (chan_out_id_cur_slv = "000000") then --temperature 
            tmp_unsig1 :=  UNSIGNED(data_written(15 downto 4)) & "0000";
            tmp_unsig2 :=  UNSIGNED(dr_sram(87) (15 downto 4)) & "0000";
            tmp_unsig3 :=  UNSIGNED(ot_limit_reg(15 downto 4)) & "0000";
            if (tmp_unsig1 >= tmp_unsig3) then
              ot_out_reg <= '1';
            elsif (dr_sram(87)(0) = '1') then
              if (tmp_unsig1 <= tmp_unsig2) then
                ot_out_reg <= '1';
              else
                ot_out_reg <= '0';
              end if;
            elsif (tmp_unsig1 < tmp_unsig2) then
              ot_out_reg <= '0';
            end if;
            tmp_unsig2 := UNSIGNED(dr_sram(84)(15 downto 1) & '0');
            tmp_unsig3 := UNSIGNED(dr_sram(80)(15 downto 1) & '0');
            if ( tmp_unsig1 > tmp_unsig3) then
              alm_out_reg(0) <= '1';
            elsif (dr_sram(84)(0) = '1') then
              if (tmp_unsig1 <= tmp_unsig2) then
                alm_out_reg(0) <= '1';
              else
                alm_out_reg(0) <= '0';
              end if;
            elsif (tmp_unsig1 <= tmp_unsig2) then
              alm_out_reg(0) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(81));
          tmp_unsig3 := UNSIGNED(dr_sram(85));
          if (chan_out_id_cur_slv = "000001") then --VCC INT
           if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
             alm_out_reg(1) <= '1';
           else
             alm_out_reg(1) <= '0';
           end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(82));
          tmp_unsig3 := UNSIGNED(dr_sram(86));
          if (chan_out_id_cur_slv = "000010") then --VCCAUX
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(2) <= '1';
            else
               alm_out_reg(2) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(88));
          tmp_unsig3 := UNSIGNED(dr_sram(92));
          if (chan_out_id_cur_slv = "000110") then --VCC BRAM
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(3) <= '1';
            else
              alm_out_reg(3) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(89));
          tmp_unsig3 := UNSIGNED(dr_sram(93));
          if (chan_out_id_cur_slv = "001101") then --VCC PSINTLP
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(4) <= '1';
            else
              alm_out_reg(4) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(90));
          tmp_unsig3 := UNSIGNED(dr_sram(94));
          if (chan_out_id_cur_slv = "001110") then -- VCC PSINTFP
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(5) <= '1';
            else
              alm_out_reg(5) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(91));
          tmp_unsig3 := UNSIGNED(dr_sram(95));
          if (chan_out_id_cur_slv = "001111") then -- VCC PSAUX
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(6) <= '1';
            else
              alm_out_reg(6) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(96));
          tmp_unsig3 := UNSIGNED(dr_sram(104));
          if (chan_out_id_cur_slv = "100000") then -- VUSER 0
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(8) <= '1';
            else
              alm_out_reg(8) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(97));
          tmp_unsig3 := UNSIGNED(dr_sram(105));
          if (chan_out_id_cur_slv = "100001") then -- VUSER 1
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(9) <= '1';
            else
              alm_out_reg(9) <= '0';
            end if;
          end if;  
          tmp_unsig2 := UNSIGNED(dr_sram(98));
          tmp_unsig3 := UNSIGNED(dr_sram(106));
          if (chan_out_id_cur_slv = "100010") then -- VUSER 2
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(10) <= '1';
            else
              alm_out_reg(10) <= '0';
            end if;
          end if;
          tmp_unsig2 := UNSIGNED(dr_sram(99));
          tmp_unsig3 := UNSIGNED(dr_sram(107));
          if (chan_out_id_cur_slv = "100011") then -- VUSER 3
            if ((tmp_unsig1 > tmp_unsig2) or (tmp_unsig1 < tmp_unsig3)) then
              alm_out_reg(11) <= '1';
            else
              alm_out_reg(11) <= '0';
            end if;
          end if;
     end if;
    end if;
  end process;

  ut_fault            <= ut_fault_reg and ot_en;
  ut_warn             <= ut_warn_reg  and std_ulogic(alm_en(0));
  alm_ut(11 downto 1) <= alm_ut_reg(11 downto 1) and alm_en(11 downto 1);

  p_alm_ut: process(DCLK_in, sysmon_rst )
  begin
    if (sysmon_rst = '1') then
      ut_fault_reg <= '0';
      ut_warn_reg  <= '0';
      alm_ut_reg <= X"0000";
    elsif (rising_edge(DCLK_in)) then
      if (alm_asrt='1' and avg_final_loop='1') then 
        case (chan_out_id_cur) is 
          when 0  => ut_fault_reg   <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(87 ))));-- temperature
                     ut_warn_reg    <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(84 ))));
          when 1  => alm_ut_reg(1 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(85 )))); -- VCC INT
          when 2  => alm_ut_reg(2 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(86 )))); -- VCCAUX
          when 6  => alm_ut_reg(3 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(92 )))); -- VCC BRAM
          when 13 => alm_ut_reg(4 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(93 )))); -- VCC PSINTLP
          when 14 => alm_ut_reg(5 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(94 )))); -- VCC PSINTFP
          when 15 => alm_ut_reg(6 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(95 )))); -- VCC PSAUX
          when 32 => alm_ut_reg(8 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(104)))); -- VUSER 0
          when 33 => alm_ut_reg(9 ) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(105)))); -- VUSER 1
          when 34 => alm_ut_reg(10) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(106)))); -- VUSER 2
          when 35 => alm_ut_reg(11) <= std_logic(B2S (unsigned(data_written) < unsigned(dr_sram(107)))); -- VUSER 3 
          when others => ut_fault_reg <= ut_fault_reg;
                         ut_warn_reg  <= ut_warn_reg;
                         alm_ut_reg <= alm_ut_reg;
        end case;
      end if; --rst_lock
    end if; --clk
  end process;

  ot_out                <= ot_out_reg and ot_en;

  alm_out(6 downto 0)   <= alm_out_reg(6 downto 0) and alm_en(6 downto 0);
  alm_out(11 downto 8)  <= alm_out_reg(11 downto 8) and alm_en(11 downto 8);
  alm_out(14 downto 12) <= "000"; -- Reserved
  alm_out(7)            <= or_reduct (alm_out(6 downto 0));
  alm_out(15)           <= (or_reduct (alm_out(11 downto 8))) or (or_reduct (alm_out(6 downto 0)));

  ot_out_shutdown : process (OT_out) 
    variable Message       : line;
    variable var_int       : integer := 0;
    begin
    if(rising_edge(OT_out) ) then
      if(sysmon_rst='0' and ot_limit_reg(3 downto 0)="0011") then 
        report "[Unisim "&string'(MODULE_NAME)&"-25] OT is high and automatic shutdown in 53h has been enabled. Please refer to the Thermal Management section of the User Guide."
        severity warning;
      end if;
    end if;
  end process;

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
       13 => "VCC_PSINTLP" & NUL,
       14 => "VCC_PSINTFP" & NUL,
       15 => "VCC_PSAUX" & NUL & NUL & NUL,
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
        "Warning: [Unisim SYSMONE4-22] The analog input data file was not found. Use the SIM_MONITOR_FILE generic to specify the input analog data file name or use default name: design.txt. "
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
                    " Error: [Unisim SYSMONE4-23] No TIME label is found in the input file."
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
                    "Error: [Unisim SYSMONE4-24] No valid channel name in the input file. Valid names: TEMP VCCINT VCCAUX VCCBRAM VCC_PSINTLP VCC_PSINTFP VCC_PSAUX VP VN VAUXP[1] VAUXN[1] ....."
                  severity failure;
                end if;
              else --headercount<=0
                infile_format;
                assert false report
                  "Error: [Unisim SYSMONE4-25] Header not found in the input file. The header is: TIME TEMP VCCINT VCCAUX VCCBRAM VCC_PSINTLP VCC_PSINTFP VCC_PSAUX VP VN VAUXP[1] VAUXN[1] ..."
                    severity failure;
              end if;

              str_token_in := NUL & NUL & NUL & NUL & NUL & NUL & NUL & NUL &
                              NUL & NUL & NUL & NUL;
            end loop;--while((in_buf'LENGTH > 0 ) and (not commentline)
          end if;
        end if;
      end loop; 
      --end of file

      ----  COMMON_N_SOURCE
      if(COMMON_N_SOURCE(15 downto 0) /= X"FFFF" and
         vauxn_idx(to_integer (unsigned (COMMON_N_SOURCE(3 downto 0)))) = -1) then
        Write ( Message, string'("[Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-58] Common-N Source is selected as VAUXN["));
        Write ( Message, to_integer (unsigned (COMMON_N_SOURCE(3 downto 0))));
        Write ( Message, string'("]. This input does not exist in the stimulus file. It must be provided."));
        assert false report Message.all  severity warning;
        DEALLOCATE(Message);
        for i IN 0 to 15 Loop
          if ((vauxn_idx(i) = -1) and (vauxp_idx(i) /= -1)) then
            vauxn_idx(i) := vauxn_idx(to_integer (unsigned (COMMON_N_SOURCE(3 downto 0))));
          end if;
        end loop;
      end if;

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
                      "Error: [Unisim SYSMONE4-28] The time value should be integer in ns scale with a range from 0 to 2147483647 and should change incrementally."
                      severity failure;
                  end if;
                  next_time := time_val * 1 ns; 
                else
                  read(in_buf, a1, read_ok);
                  if (not read_ok) then
                    assert false report
                      "Error: [Unisim SYSMONE4-27] The data type should be REAL, e.g. 3.0  0.0  -0.5 "
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

--  Obtain I2C slave address powerup value
-- VChecked
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

end SYSMONE4_V;
