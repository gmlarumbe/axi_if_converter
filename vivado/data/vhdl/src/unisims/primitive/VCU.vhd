-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2017.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        VCU
-- /___/   /\      Filename    : VCU.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL VCU -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity VCU is
  generic (
    CORECLKREQ : integer := 667;
    DECHORRESOLUTION : integer := 3840;
    DECODERCHROMAFORMAT : string := "4_2_2";
    DECODERCODING : string := "H.265";
    DECODERCOLORDEPTH : integer := 10;
    DECODERNUMCORES : integer := 2;
    DECVERTRESOLUTION : integer := 2160;
    ENABLEDECODER : string := "TRUE";
    ENABLEENCODER : string := "TRUE";
    ENCHORRESOLUTION : integer := 3840;
    ENCODERCHROMAFORMAT : string := "4_2_2";
    ENCODERCODING : string := "H.265";
    ENCODERCOLORDEPTH : integer := 10;
    ENCODERNUMCORES : integer := 4;
    ENCVERTRESOLUTION : integer := 2160
  );
  
  port (
    VCUPLARREADYAXILITEAPB : out std_ulogic;
    VCUPLAWREADYAXILITEAPB : out std_ulogic;
    VCUPLBRESPAXILITEAPB : out std_logic_vector(1 downto 0);
    VCUPLBVALIDAXILITEAPB : out std_ulogic;
    VCUPLCORESTATUSCLKPLL : out std_ulogic;
    VCUPLDECARADDR0      : out std_logic_vector(43 downto 0);
    VCUPLDECARADDR1      : out std_logic_vector(43 downto 0);
    VCUPLDECARBURST0     : out std_logic_vector(1 downto 0);
    VCUPLDECARBURST1     : out std_logic_vector(1 downto 0);
    VCUPLDECARCACHE0     : out std_logic_vector(3 downto 0);
    VCUPLDECARCACHE1     : out std_logic_vector(3 downto 0);
    VCUPLDECARID0        : out std_logic_vector(3 downto 0);
    VCUPLDECARID1        : out std_logic_vector(3 downto 0);
    VCUPLDECARLEN0       : out std_logic_vector(7 downto 0);
    VCUPLDECARLEN1       : out std_logic_vector(7 downto 0);
    VCUPLDECARPROT0      : out std_ulogic;
    VCUPLDECARPROT1      : out std_ulogic;
    VCUPLDECARQOS0       : out std_logic_vector(3 downto 0);
    VCUPLDECARQOS1       : out std_logic_vector(3 downto 0);
    VCUPLDECARSIZE0      : out std_logic_vector(2 downto 0);
    VCUPLDECARSIZE1      : out std_logic_vector(2 downto 0);
    VCUPLDECARVALID0     : out std_ulogic;
    VCUPLDECARVALID1     : out std_ulogic;
    VCUPLDECAWADDR0      : out std_logic_vector(43 downto 0);
    VCUPLDECAWADDR1      : out std_logic_vector(43 downto 0);
    VCUPLDECAWBURST0     : out std_logic_vector(1 downto 0);
    VCUPLDECAWBURST1     : out std_logic_vector(1 downto 0);
    VCUPLDECAWCACHE0     : out std_logic_vector(3 downto 0);
    VCUPLDECAWCACHE1     : out std_logic_vector(3 downto 0);
    VCUPLDECAWID0        : out std_logic_vector(3 downto 0);
    VCUPLDECAWID1        : out std_logic_vector(3 downto 0);
    VCUPLDECAWLEN0       : out std_logic_vector(7 downto 0);
    VCUPLDECAWLEN1       : out std_logic_vector(7 downto 0);
    VCUPLDECAWPROT0      : out std_ulogic;
    VCUPLDECAWPROT1      : out std_ulogic;
    VCUPLDECAWQOS0       : out std_logic_vector(3 downto 0);
    VCUPLDECAWQOS1       : out std_logic_vector(3 downto 0);
    VCUPLDECAWSIZE0      : out std_logic_vector(2 downto 0);
    VCUPLDECAWSIZE1      : out std_logic_vector(2 downto 0);
    VCUPLDECAWVALID0     : out std_ulogic;
    VCUPLDECAWVALID1     : out std_ulogic;
    VCUPLDECBREADY0      : out std_ulogic;
    VCUPLDECBREADY1      : out std_ulogic;
    VCUPLDECRREADY0      : out std_ulogic;
    VCUPLDECRREADY1      : out std_ulogic;
    VCUPLDECWDATA0       : out std_logic_vector(127 downto 0);
    VCUPLDECWDATA1       : out std_logic_vector(127 downto 0);
    VCUPLDECWLAST0       : out std_ulogic;
    VCUPLDECWLAST1       : out std_ulogic;
    VCUPLDECWVALID0      : out std_ulogic;
    VCUPLDECWVALID1      : out std_ulogic;
    VCUPLENCALL2CADDR    : out std_logic_vector(16 downto 0);
    VCUPLENCALL2CRVALID  : out std_ulogic;
    VCUPLENCALL2CWDATA   : out std_logic_vector(319 downto 0);
    VCUPLENCALL2CWVALID  : out std_ulogic;
    VCUPLENCARADDR0      : out std_logic_vector(43 downto 0);
    VCUPLENCARADDR1      : out std_logic_vector(43 downto 0);
    VCUPLENCARBURST0     : out std_logic_vector(1 downto 0);
    VCUPLENCARBURST1     : out std_logic_vector(1 downto 0);
    VCUPLENCARCACHE0     : out std_logic_vector(3 downto 0);
    VCUPLENCARCACHE1     : out std_logic_vector(3 downto 0);
    VCUPLENCARID0        : out std_logic_vector(3 downto 0);
    VCUPLENCARID1        : out std_logic_vector(3 downto 0);
    VCUPLENCARLEN0       : out std_logic_vector(7 downto 0);
    VCUPLENCARLEN1       : out std_logic_vector(7 downto 0);
    VCUPLENCARPROT0      : out std_ulogic;
    VCUPLENCARPROT1      : out std_ulogic;
    VCUPLENCARQOS0       : out std_logic_vector(3 downto 0);
    VCUPLENCARQOS1       : out std_logic_vector(3 downto 0);
    VCUPLENCARSIZE0      : out std_logic_vector(2 downto 0);
    VCUPLENCARSIZE1      : out std_logic_vector(2 downto 0);
    VCUPLENCARVALID0     : out std_ulogic;
    VCUPLENCARVALID1     : out std_ulogic;
    VCUPLENCAWADDR0      : out std_logic_vector(43 downto 0);
    VCUPLENCAWADDR1      : out std_logic_vector(43 downto 0);
    VCUPLENCAWBURST0     : out std_logic_vector(1 downto 0);
    VCUPLENCAWBURST1     : out std_logic_vector(1 downto 0);
    VCUPLENCAWCACHE0     : out std_logic_vector(3 downto 0);
    VCUPLENCAWCACHE1     : out std_logic_vector(3 downto 0);
    VCUPLENCAWID0        : out std_logic_vector(3 downto 0);
    VCUPLENCAWID1        : out std_logic_vector(3 downto 0);
    VCUPLENCAWLEN0       : out std_logic_vector(7 downto 0);
    VCUPLENCAWLEN1       : out std_logic_vector(7 downto 0);
    VCUPLENCAWPROT0      : out std_ulogic;
    VCUPLENCAWPROT1      : out std_ulogic;
    VCUPLENCAWQOS0       : out std_logic_vector(3 downto 0);
    VCUPLENCAWQOS1       : out std_logic_vector(3 downto 0);
    VCUPLENCAWSIZE0      : out std_logic_vector(2 downto 0);
    VCUPLENCAWSIZE1      : out std_logic_vector(2 downto 0);
    VCUPLENCAWVALID0     : out std_ulogic;
    VCUPLENCAWVALID1     : out std_ulogic;
    VCUPLENCBREADY0      : out std_ulogic;
    VCUPLENCBREADY1      : out std_ulogic;
    VCUPLENCRREADY0      : out std_ulogic;
    VCUPLENCRREADY1      : out std_ulogic;
    VCUPLENCWDATA0       : out std_logic_vector(127 downto 0);
    VCUPLENCWDATA1       : out std_logic_vector(127 downto 0);
    VCUPLENCWLAST0       : out std_ulogic;
    VCUPLENCWLAST1       : out std_ulogic;
    VCUPLENCWVALID0      : out std_ulogic;
    VCUPLENCWVALID1      : out std_ulogic;
    VCUPLMCUMAXIICDCARADDR : out std_logic_vector(43 downto 0);
    VCUPLMCUMAXIICDCARBURST : out std_logic_vector(1 downto 0);
    VCUPLMCUMAXIICDCARCACHE : out std_logic_vector(3 downto 0);
    VCUPLMCUMAXIICDCARID : out std_logic_vector(2 downto 0);
    VCUPLMCUMAXIICDCARLEN : out std_logic_vector(7 downto 0);
    VCUPLMCUMAXIICDCARLOCK : out std_ulogic;
    VCUPLMCUMAXIICDCARPROT : out std_logic_vector(2 downto 0);
    VCUPLMCUMAXIICDCARQOS : out std_logic_vector(3 downto 0);
    VCUPLMCUMAXIICDCARSIZE : out std_logic_vector(2 downto 0);
    VCUPLMCUMAXIICDCARVALID : out std_ulogic;
    VCUPLMCUMAXIICDCAWADDR : out std_logic_vector(43 downto 0);
    VCUPLMCUMAXIICDCAWBURST : out std_logic_vector(1 downto 0);
    VCUPLMCUMAXIICDCAWCACHE : out std_logic_vector(3 downto 0);
    VCUPLMCUMAXIICDCAWID : out std_logic_vector(2 downto 0);
    VCUPLMCUMAXIICDCAWLEN : out std_logic_vector(7 downto 0);
    VCUPLMCUMAXIICDCAWLOCK : out std_ulogic;
    VCUPLMCUMAXIICDCAWPROT : out std_logic_vector(2 downto 0);
    VCUPLMCUMAXIICDCAWQOS : out std_logic_vector(3 downto 0);
    VCUPLMCUMAXIICDCAWSIZE : out std_logic_vector(2 downto 0);
    VCUPLMCUMAXIICDCAWVALID : out std_ulogic;
    VCUPLMCUMAXIICDCBREADY : out std_ulogic;
    VCUPLMCUMAXIICDCRREADY : out std_ulogic;
    VCUPLMCUMAXIICDCWDATA : out std_logic_vector(31 downto 0);
    VCUPLMCUMAXIICDCWLAST : out std_ulogic;
    VCUPLMCUMAXIICDCWSTRB : out std_logic_vector(3 downto 0);
    VCUPLMCUMAXIICDCWVALID : out std_ulogic;
    VCUPLMCUSTATUSCLKPLL : out std_ulogic;
    VCUPLPINTREQ         : out std_ulogic;
    VCUPLPLLSTATUSPLLLOCK : out std_ulogic;
    VCUPLPWRSUPPLYSTATUSVCCAUX : out std_ulogic;
    VCUPLPWRSUPPLYSTATUSVCUINT : out std_ulogic;
    VCUPLRDATAAXILITEAPB : out std_logic_vector(31 downto 0);
    VCUPLRRESPAXILITEAPB : out std_logic_vector(1 downto 0);
    VCUPLRVALIDAXILITEAPB : out std_ulogic;
    VCUPLWREADYAXILITEAPB : out std_ulogic;
    INITPLVCUGASKETCLAMPCONTROLLVLSHVCCINTD : in std_ulogic;
    PLVCUARADDRAXILITEAPB : in std_logic_vector(19 downto 0);
    PLVCUARPROTAXILITEAPB : in std_logic_vector(2 downto 0);
    PLVCUARVALIDAXILITEAPB : in std_ulogic;
    PLVCUAWADDRAXILITEAPB : in std_logic_vector(19 downto 0);
    PLVCUAWPROTAXILITEAPB : in std_logic_vector(2 downto 0);
    PLVCUAWVALIDAXILITEAPB : in std_ulogic;
    PLVCUAXIDECCLK       : in std_ulogic;
    PLVCUAXIENCCLK       : in std_ulogic;
    PLVCUAXILITECLK      : in std_ulogic;
    PLVCUAXIMCUCLK       : in std_ulogic;
    PLVCUBREADYAXILITEAPB : in std_ulogic;
    PLVCUCORECLK         : in std_ulogic;
    PLVCUDECARREADY0     : in std_ulogic;
    PLVCUDECARREADY1     : in std_ulogic;
    PLVCUDECAWREADY0     : in std_ulogic;
    PLVCUDECAWREADY1     : in std_ulogic;
    PLVCUDECBID0         : in std_logic_vector(3 downto 0);
    PLVCUDECBID1         : in std_logic_vector(3 downto 0);
    PLVCUDECBRESP0       : in std_logic_vector(1 downto 0);
    PLVCUDECBRESP1       : in std_logic_vector(1 downto 0);
    PLVCUDECBVALID0      : in std_ulogic;
    PLVCUDECBVALID1      : in std_ulogic;
    PLVCUDECRDATA0       : in std_logic_vector(127 downto 0);
    PLVCUDECRDATA1       : in std_logic_vector(127 downto 0);
    PLVCUDECRID0         : in std_logic_vector(3 downto 0);
    PLVCUDECRID1         : in std_logic_vector(3 downto 0);
    PLVCUDECRLAST0       : in std_ulogic;
    PLVCUDECRLAST1       : in std_ulogic;
    PLVCUDECRRESP0       : in std_logic_vector(1 downto 0);
    PLVCUDECRRESP1       : in std_logic_vector(1 downto 0);
    PLVCUDECRVALID0      : in std_ulogic;
    PLVCUDECRVALID1      : in std_ulogic;
    PLVCUDECWREADY0      : in std_ulogic;
    PLVCUDECWREADY1      : in std_ulogic;
    PLVCUENCALL2CRDATA   : in std_logic_vector(319 downto 0);
    PLVCUENCALL2CRREADY  : in std_ulogic;
    PLVCUENCARREADY0     : in std_ulogic;
    PLVCUENCARREADY1     : in std_ulogic;
    PLVCUENCAWREADY0     : in std_ulogic;
    PLVCUENCAWREADY1     : in std_ulogic;
    PLVCUENCBID0         : in std_logic_vector(3 downto 0);
    PLVCUENCBID1         : in std_logic_vector(3 downto 0);
    PLVCUENCBRESP0       : in std_logic_vector(1 downto 0);
    PLVCUENCBRESP1       : in std_logic_vector(1 downto 0);
    PLVCUENCBVALID0      : in std_ulogic;
    PLVCUENCBVALID1      : in std_ulogic;
    PLVCUENCL2CCLK       : in std_ulogic;
    PLVCUENCRDATA0       : in std_logic_vector(127 downto 0);
    PLVCUENCRDATA1       : in std_logic_vector(127 downto 0);
    PLVCUENCRID0         : in std_logic_vector(3 downto 0);
    PLVCUENCRID1         : in std_logic_vector(3 downto 0);
    PLVCUENCRLAST0       : in std_ulogic;
    PLVCUENCRLAST1       : in std_ulogic;
    PLVCUENCRRESP0       : in std_logic_vector(1 downto 0);
    PLVCUENCRRESP1       : in std_logic_vector(1 downto 0);
    PLVCUENCRVALID0      : in std_ulogic;
    PLVCUENCRVALID1      : in std_ulogic;
    PLVCUENCWREADY0      : in std_ulogic;
    PLVCUENCWREADY1      : in std_ulogic;
    PLVCUMCUCLK          : in std_ulogic;
    PLVCUMCUMAXIICDCARREADY : in std_ulogic;
    PLVCUMCUMAXIICDCAWREADY : in std_ulogic;
    PLVCUMCUMAXIICDCBID  : in std_logic_vector(2 downto 0);
    PLVCUMCUMAXIICDCBRESP : in std_logic_vector(1 downto 0);
    PLVCUMCUMAXIICDCBVALID : in std_ulogic;
    PLVCUMCUMAXIICDCRDATA : in std_logic_vector(31 downto 0);
    PLVCUMCUMAXIICDCRID  : in std_logic_vector(2 downto 0);
    PLVCUMCUMAXIICDCRLAST : in std_ulogic;
    PLVCUMCUMAXIICDCRRESP : in std_logic_vector(1 downto 0);
    PLVCUMCUMAXIICDCRVALID : in std_ulogic;
    PLVCUMCUMAXIICDCWREADY : in std_ulogic;
    PLVCUPLLREFCLKPL     : in std_ulogic;
    PLVCURAWRSTN         : in std_ulogic;
    PLVCURREADYAXILITEAPB : in std_ulogic;
    PLVCUWDATAAXILITEAPB : in std_logic_vector(31 downto 0);
    PLVCUWSTRBAXILITEAPB : in std_logic_vector(3 downto 0);
    PLVCUWVALIDAXILITEAPB : in std_ulogic
  );
end VCU;

architecture VCU_V of VCU is

  constant MODULE_NAME : string := "VCU";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant DECODERCHROMAFORMAT_4_2_0 : std_ulogic := '1';
  constant DECODERCHROMAFORMAT_4_2_2 : std_ulogic := '0';
  constant DECODERCODING_H_264 : std_ulogic := '1';
  constant DECODERCODING_H_265 : std_ulogic := '0';
  constant ENABLEDECODER_FALSE : std_ulogic := '1';
  constant ENABLEDECODER_TRUE : std_ulogic := '0';
  constant ENABLEENCODER_FALSE : std_ulogic := '1';
  constant ENABLEENCODER_TRUE : std_ulogic := '0';
  constant ENCODERCHROMAFORMAT_4_2_0 : std_ulogic := '1';
  constant ENCODERCHROMAFORMAT_4_2_2 : std_ulogic := '0';
  constant ENCODERCODING_H_264 : std_ulogic := '1';
  constant ENCODERCODING_H_265 : std_ulogic := '0';

  signal CORECLKREQ_BIN : integer := 667;
  signal DECHORRESOLUTION_BIN : integer := 3840;
  signal DECODERCHROMAFORMAT_BIN : std_ulogic;
  signal DECODERCODING_BIN : std_ulogic;
  signal DECODERCOLORDEPTH_BIN : integer := 10;
  signal DECODERNUMCORES_BIN : integer := 2;
  signal DECVERTRESOLUTION_BIN : integer := 2160;
  signal ENABLEDECODER_BIN : std_ulogic;
  signal ENABLEENCODER_BIN : std_ulogic;
  signal ENCHORRESOLUTION_BIN : integer := 3840;
  signal ENCODERCHROMAFORMAT_BIN : std_ulogic;
  signal ENCODERCODING_BIN : std_ulogic;
  signal ENCODERCOLORDEPTH_BIN : integer := 10;
  signal ENCODERNUMCORES_BIN : integer := 4;
  signal ENCVERTRESOLUTION_BIN : integer := 2160;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  signal VCUPLARREADYAXILITEAPB_out : std_ulogic;
  signal VCUPLAWREADYAXILITEAPB_out : std_ulogic;
  signal VCUPLBRESPAXILITEAPB_out : std_logic_vector(1 downto 0);
  signal VCUPLBVALIDAXILITEAPB_out : std_ulogic;
  signal VCUPLCORESTATUSCLKPLL_out : std_ulogic;
  signal VCUPLDECARADDR0_out : std_logic_vector(43 downto 0);
  signal VCUPLDECARADDR1_out : std_logic_vector(43 downto 0);
  signal VCUPLDECARBURST0_out : std_logic_vector(1 downto 0);
  signal VCUPLDECARBURST1_out : std_logic_vector(1 downto 0);
  signal VCUPLDECARCACHE0_out : std_logic_vector(3 downto 0);
  signal VCUPLDECARCACHE1_out : std_logic_vector(3 downto 0);
  signal VCUPLDECARID0_out : std_logic_vector(3 downto 0);
  signal VCUPLDECARID1_out : std_logic_vector(3 downto 0);
  signal VCUPLDECARLEN0_out : std_logic_vector(7 downto 0);
  signal VCUPLDECARLEN1_out : std_logic_vector(7 downto 0);
  signal VCUPLDECARPROT0_out : std_ulogic;
  signal VCUPLDECARPROT1_out : std_ulogic;
  signal VCUPLDECARQOS0_out : std_logic_vector(3 downto 0);
  signal VCUPLDECARQOS1_out : std_logic_vector(3 downto 0);
  signal VCUPLDECARSIZE0_out : std_logic_vector(2 downto 0);
  signal VCUPLDECARSIZE1_out : std_logic_vector(2 downto 0);
  signal VCUPLDECARVALID0_out : std_ulogic;
  signal VCUPLDECARVALID1_out : std_ulogic;
  signal VCUPLDECAWADDR0_out : std_logic_vector(43 downto 0);
  signal VCUPLDECAWADDR1_out : std_logic_vector(43 downto 0);
  signal VCUPLDECAWBURST0_out : std_logic_vector(1 downto 0);
  signal VCUPLDECAWBURST1_out : std_logic_vector(1 downto 0);
  signal VCUPLDECAWCACHE0_out : std_logic_vector(3 downto 0);
  signal VCUPLDECAWCACHE1_out : std_logic_vector(3 downto 0);
  signal VCUPLDECAWID0_out : std_logic_vector(3 downto 0);
  signal VCUPLDECAWID1_out : std_logic_vector(3 downto 0);
  signal VCUPLDECAWLEN0_out : std_logic_vector(7 downto 0);
  signal VCUPLDECAWLEN1_out : std_logic_vector(7 downto 0);
  signal VCUPLDECAWPROT0_out : std_ulogic;
  signal VCUPLDECAWPROT1_out : std_ulogic;
  signal VCUPLDECAWQOS0_out : std_logic_vector(3 downto 0);
  signal VCUPLDECAWQOS1_out : std_logic_vector(3 downto 0);
  signal VCUPLDECAWSIZE0_out : std_logic_vector(2 downto 0);
  signal VCUPLDECAWSIZE1_out : std_logic_vector(2 downto 0);
  signal VCUPLDECAWVALID0_out : std_ulogic;
  signal VCUPLDECAWVALID1_out : std_ulogic;
  signal VCUPLDECBREADY0_out : std_ulogic;
  signal VCUPLDECBREADY1_out : std_ulogic;
  signal VCUPLDECRREADY0_out : std_ulogic;
  signal VCUPLDECRREADY1_out : std_ulogic;
  signal VCUPLDECWDATA0_out : std_logic_vector(127 downto 0);
  signal VCUPLDECWDATA1_out : std_logic_vector(127 downto 0);
  signal VCUPLDECWLAST0_out : std_ulogic;
  signal VCUPLDECWLAST1_out : std_ulogic;
  signal VCUPLDECWVALID0_out : std_ulogic;
  signal VCUPLDECWVALID1_out : std_ulogic;
  signal VCUPLENCALL2CADDR_out : std_logic_vector(16 downto 0);
  signal VCUPLENCALL2CRVALID_out : std_ulogic;
  signal VCUPLENCALL2CWDATA_out : std_logic_vector(319 downto 0);
  signal VCUPLENCALL2CWVALID_out : std_ulogic;
  signal VCUPLENCARADDR0_out : std_logic_vector(43 downto 0);
  signal VCUPLENCARADDR1_out : std_logic_vector(43 downto 0);
  signal VCUPLENCARBURST0_out : std_logic_vector(1 downto 0);
  signal VCUPLENCARBURST1_out : std_logic_vector(1 downto 0);
  signal VCUPLENCARCACHE0_out : std_logic_vector(3 downto 0);
  signal VCUPLENCARCACHE1_out : std_logic_vector(3 downto 0);
  signal VCUPLENCARID0_out : std_logic_vector(3 downto 0);
  signal VCUPLENCARID1_out : std_logic_vector(3 downto 0);
  signal VCUPLENCARLEN0_out : std_logic_vector(7 downto 0);
  signal VCUPLENCARLEN1_out : std_logic_vector(7 downto 0);
  signal VCUPLENCARPROT0_out : std_ulogic;
  signal VCUPLENCARPROT1_out : std_ulogic;
  signal VCUPLENCARQOS0_out : std_logic_vector(3 downto 0);
  signal VCUPLENCARQOS1_out : std_logic_vector(3 downto 0);
  signal VCUPLENCARSIZE0_out : std_logic_vector(2 downto 0);
  signal VCUPLENCARSIZE1_out : std_logic_vector(2 downto 0);
  signal VCUPLENCARVALID0_out : std_ulogic;
  signal VCUPLENCARVALID1_out : std_ulogic;
  signal VCUPLENCAWADDR0_out : std_logic_vector(43 downto 0);
  signal VCUPLENCAWADDR1_out : std_logic_vector(43 downto 0);
  signal VCUPLENCAWBURST0_out : std_logic_vector(1 downto 0);
  signal VCUPLENCAWBURST1_out : std_logic_vector(1 downto 0);
  signal VCUPLENCAWCACHE0_out : std_logic_vector(3 downto 0);
  signal VCUPLENCAWCACHE1_out : std_logic_vector(3 downto 0);
  signal VCUPLENCAWID0_out : std_logic_vector(3 downto 0);
  signal VCUPLENCAWID1_out : std_logic_vector(3 downto 0);
  signal VCUPLENCAWLEN0_out : std_logic_vector(7 downto 0);
  signal VCUPLENCAWLEN1_out : std_logic_vector(7 downto 0);
  signal VCUPLENCAWPROT0_out : std_ulogic;
  signal VCUPLENCAWPROT1_out : std_ulogic;
  signal VCUPLENCAWQOS0_out : std_logic_vector(3 downto 0);
  signal VCUPLENCAWQOS1_out : std_logic_vector(3 downto 0);
  signal VCUPLENCAWSIZE0_out : std_logic_vector(2 downto 0);
  signal VCUPLENCAWSIZE1_out : std_logic_vector(2 downto 0);
  signal VCUPLENCAWVALID0_out : std_ulogic;
  signal VCUPLENCAWVALID1_out : std_ulogic;
  signal VCUPLENCBREADY0_out : std_ulogic;
  signal VCUPLENCBREADY1_out : std_ulogic;
  signal VCUPLENCRREADY0_out : std_ulogic;
  signal VCUPLENCRREADY1_out : std_ulogic;
  signal VCUPLENCWDATA0_out : std_logic_vector(127 downto 0);
  signal VCUPLENCWDATA1_out : std_logic_vector(127 downto 0);
  signal VCUPLENCWLAST0_out : std_ulogic;
  signal VCUPLENCWLAST1_out : std_ulogic;
  signal VCUPLENCWVALID0_out : std_ulogic;
  signal VCUPLENCWVALID1_out : std_ulogic;
  signal VCUPLMCUMAXIICDCARADDR_out : std_logic_vector(43 downto 0);
  signal VCUPLMCUMAXIICDCARBURST_out : std_logic_vector(1 downto 0);
  signal VCUPLMCUMAXIICDCARCACHE_out : std_logic_vector(3 downto 0);
  signal VCUPLMCUMAXIICDCARID_out : std_logic_vector(2 downto 0);
  signal VCUPLMCUMAXIICDCARLEN_out : std_logic_vector(7 downto 0);
  signal VCUPLMCUMAXIICDCARLOCK_out : std_ulogic;
  signal VCUPLMCUMAXIICDCARPROT_out : std_logic_vector(2 downto 0);
  signal VCUPLMCUMAXIICDCARQOS_out : std_logic_vector(3 downto 0);
  signal VCUPLMCUMAXIICDCARSIZE_out : std_logic_vector(2 downto 0);
  signal VCUPLMCUMAXIICDCARVALID_out : std_ulogic;
  signal VCUPLMCUMAXIICDCAWADDR_out : std_logic_vector(43 downto 0);
  signal VCUPLMCUMAXIICDCAWBURST_out : std_logic_vector(1 downto 0);
  signal VCUPLMCUMAXIICDCAWCACHE_out : std_logic_vector(3 downto 0);
  signal VCUPLMCUMAXIICDCAWID_out : std_logic_vector(2 downto 0);
  signal VCUPLMCUMAXIICDCAWLEN_out : std_logic_vector(7 downto 0);
  signal VCUPLMCUMAXIICDCAWLOCK_out : std_ulogic;
  signal VCUPLMCUMAXIICDCAWPROT_out : std_logic_vector(2 downto 0);
  signal VCUPLMCUMAXIICDCAWQOS_out : std_logic_vector(3 downto 0);
  signal VCUPLMCUMAXIICDCAWSIZE_out : std_logic_vector(2 downto 0);
  signal VCUPLMCUMAXIICDCAWVALID_out : std_ulogic;
  signal VCUPLMCUMAXIICDCBREADY_out : std_ulogic;
  signal VCUPLMCUMAXIICDCRREADY_out : std_ulogic;
  signal VCUPLMCUMAXIICDCWDATA_out : std_logic_vector(31 downto 0);
  signal VCUPLMCUMAXIICDCWLAST_out : std_ulogic;
  signal VCUPLMCUMAXIICDCWSTRB_out : std_logic_vector(3 downto 0);
  signal VCUPLMCUMAXIICDCWVALID_out : std_ulogic;
  signal VCUPLMCUSTATUSCLKPLL_out : std_ulogic;
  signal VCUPLPINTREQ_out : std_ulogic;
  signal VCUPLPLLSTATUSPLLLOCK_out : std_ulogic;
  signal VCUPLPWRSUPPLYSTATUSVCCAUX_out : std_ulogic;
  signal VCUPLPWRSUPPLYSTATUSVCUINT_out : std_ulogic;
  signal VCUPLRDATAAXILITEAPB_out : std_logic_vector(31 downto 0);
  signal VCUPLRRESPAXILITEAPB_out : std_logic_vector(1 downto 0);
  signal VCUPLRVALIDAXILITEAPB_out : std_ulogic;
  signal VCUPLWREADYAXILITEAPB_out : std_ulogic;
  
  signal INITPLVCUGASKETCLAMPCONTROLLVLSHVCCINTD_in : std_ulogic;
  signal PLVCUARADDRAXILITEAPB_in : std_logic_vector(19 downto 0);
  signal PLVCUARPROTAXILITEAPB_in : std_logic_vector(2 downto 0);
  signal PLVCUARVALIDAXILITEAPB_in : std_ulogic;
  signal PLVCUAWADDRAXILITEAPB_in : std_logic_vector(19 downto 0);
  signal PLVCUAWPROTAXILITEAPB_in : std_logic_vector(2 downto 0);
  signal PLVCUAWVALIDAXILITEAPB_in : std_ulogic;
  signal PLVCUAXIDECCLK_in : std_ulogic;
  signal PLVCUAXIENCCLK_in : std_ulogic;
  signal PLVCUAXILITECLK_in : std_ulogic;
  signal PLVCUAXIMCUCLK_in : std_ulogic;
  signal PLVCUBREADYAXILITEAPB_in : std_ulogic;
  signal PLVCUCORECLK_in : std_ulogic;
  signal PLVCUDECARREADY0_in : std_ulogic;
  signal PLVCUDECARREADY1_in : std_ulogic;
  signal PLVCUDECAWREADY0_in : std_ulogic;
  signal PLVCUDECAWREADY1_in : std_ulogic;
  signal PLVCUDECBID0_in : std_logic_vector(3 downto 0);
  signal PLVCUDECBID1_in : std_logic_vector(3 downto 0);
  signal PLVCUDECBRESP0_in : std_logic_vector(1 downto 0);
  signal PLVCUDECBRESP1_in : std_logic_vector(1 downto 0);
  signal PLVCUDECBVALID0_in : std_ulogic;
  signal PLVCUDECBVALID1_in : std_ulogic;
  signal PLVCUDECRDATA0_in : std_logic_vector(127 downto 0);
  signal PLVCUDECRDATA1_in : std_logic_vector(127 downto 0);
  signal PLVCUDECRID0_in : std_logic_vector(3 downto 0);
  signal PLVCUDECRID1_in : std_logic_vector(3 downto 0);
  signal PLVCUDECRLAST0_in : std_ulogic;
  signal PLVCUDECRLAST1_in : std_ulogic;
  signal PLVCUDECRRESP0_in : std_logic_vector(1 downto 0);
  signal PLVCUDECRRESP1_in : std_logic_vector(1 downto 0);
  signal PLVCUDECRVALID0_in : std_ulogic;
  signal PLVCUDECRVALID1_in : std_ulogic;
  signal PLVCUDECWREADY0_in : std_ulogic;
  signal PLVCUDECWREADY1_in : std_ulogic;
  signal PLVCUENCALL2CRDATA_in : std_logic_vector(319 downto 0);
  signal PLVCUENCALL2CRREADY_in : std_ulogic;
  signal PLVCUENCARREADY0_in : std_ulogic;
  signal PLVCUENCARREADY1_in : std_ulogic;
  signal PLVCUENCAWREADY0_in : std_ulogic;
  signal PLVCUENCAWREADY1_in : std_ulogic;
  signal PLVCUENCBID0_in : std_logic_vector(3 downto 0);
  signal PLVCUENCBID1_in : std_logic_vector(3 downto 0);
  signal PLVCUENCBRESP0_in : std_logic_vector(1 downto 0);
  signal PLVCUENCBRESP1_in : std_logic_vector(1 downto 0);
  signal PLVCUENCBVALID0_in : std_ulogic;
  signal PLVCUENCBVALID1_in : std_ulogic;
  signal PLVCUENCL2CCLK_in : std_ulogic;
  signal PLVCUENCRDATA0_in : std_logic_vector(127 downto 0);
  signal PLVCUENCRDATA1_in : std_logic_vector(127 downto 0);
  signal PLVCUENCRID0_in : std_logic_vector(3 downto 0);
  signal PLVCUENCRID1_in : std_logic_vector(3 downto 0);
  signal PLVCUENCRLAST0_in : std_ulogic;
  signal PLVCUENCRLAST1_in : std_ulogic;
  signal PLVCUENCRRESP0_in : std_logic_vector(1 downto 0);
  signal PLVCUENCRRESP1_in : std_logic_vector(1 downto 0);
  signal PLVCUENCRVALID0_in : std_ulogic;
  signal PLVCUENCRVALID1_in : std_ulogic;
  signal PLVCUENCWREADY0_in : std_ulogic;
  signal PLVCUENCWREADY1_in : std_ulogic;
  signal PLVCUMCUCLK_in : std_ulogic;
  signal PLVCUMCUMAXIICDCARREADY_in : std_ulogic;
  signal PLVCUMCUMAXIICDCAWREADY_in : std_ulogic;
  signal PLVCUMCUMAXIICDCBID_in : std_logic_vector(2 downto 0);
  signal PLVCUMCUMAXIICDCBRESP_in : std_logic_vector(1 downto 0);
  signal PLVCUMCUMAXIICDCBVALID_in : std_ulogic;
  signal PLVCUMCUMAXIICDCRDATA_in : std_logic_vector(31 downto 0);
  signal PLVCUMCUMAXIICDCRID_in : std_logic_vector(2 downto 0);
  signal PLVCUMCUMAXIICDCRLAST_in : std_ulogic;
  signal PLVCUMCUMAXIICDCRRESP_in : std_logic_vector(1 downto 0);
  signal PLVCUMCUMAXIICDCRVALID_in : std_ulogic;
  signal PLVCUMCUMAXIICDCWREADY_in : std_ulogic;
  signal PLVCUPLLREFCLKPL_in : std_ulogic;
  signal PLVCURAWRSTN_in : std_ulogic;
  signal PLVCURREADYAXILITEAPB_in : std_ulogic;
  signal PLVCUWDATAAXILITEAPB_in : std_logic_vector(31 downto 0);
  signal PLVCUWSTRBAXILITEAPB_in : std_logic_vector(3 downto 0);
  signal PLVCUWVALIDAXILITEAPB_in : std_ulogic;
  
  -- start behavioral body
  begin
  glblGSR     <= TO_X01(GSR);
  VCUPLARREADYAXILITEAPB <= VCUPLARREADYAXILITEAPB_out;
  VCUPLAWREADYAXILITEAPB <= VCUPLAWREADYAXILITEAPB_out;
  VCUPLBRESPAXILITEAPB <= VCUPLBRESPAXILITEAPB_out;
  VCUPLBVALIDAXILITEAPB <= VCUPLBVALIDAXILITEAPB_out;
  VCUPLCORESTATUSCLKPLL <= VCUPLCORESTATUSCLKPLL_out;
  VCUPLDECARADDR0 <= VCUPLDECARADDR0_out;
  VCUPLDECARADDR1 <= VCUPLDECARADDR1_out;
  VCUPLDECARBURST0 <= VCUPLDECARBURST0_out;
  VCUPLDECARBURST1 <= VCUPLDECARBURST1_out;
  VCUPLDECARCACHE0 <= VCUPLDECARCACHE0_out;
  VCUPLDECARCACHE1 <= VCUPLDECARCACHE1_out;
  VCUPLDECARID0 <= VCUPLDECARID0_out;
  VCUPLDECARID1 <= VCUPLDECARID1_out;
  VCUPLDECARLEN0 <= VCUPLDECARLEN0_out;
  VCUPLDECARLEN1 <= VCUPLDECARLEN1_out;
  VCUPLDECARPROT0 <= VCUPLDECARPROT0_out;
  VCUPLDECARPROT1 <= VCUPLDECARPROT1_out;
  VCUPLDECARQOS0 <= VCUPLDECARQOS0_out;
  VCUPLDECARQOS1 <= VCUPLDECARQOS1_out;
  VCUPLDECARSIZE0 <= VCUPLDECARSIZE0_out;
  VCUPLDECARSIZE1 <= VCUPLDECARSIZE1_out;
  VCUPLDECARVALID0 <= VCUPLDECARVALID0_out;
  VCUPLDECARVALID1 <= VCUPLDECARVALID1_out;
  VCUPLDECAWADDR0 <= VCUPLDECAWADDR0_out;
  VCUPLDECAWADDR1 <= VCUPLDECAWADDR1_out;
  VCUPLDECAWBURST0 <= VCUPLDECAWBURST0_out;
  VCUPLDECAWBURST1 <= VCUPLDECAWBURST1_out;
  VCUPLDECAWCACHE0 <= VCUPLDECAWCACHE0_out;
  VCUPLDECAWCACHE1 <= VCUPLDECAWCACHE1_out;
  VCUPLDECAWID0 <= VCUPLDECAWID0_out;
  VCUPLDECAWID1 <= VCUPLDECAWID1_out;
  VCUPLDECAWLEN0 <= VCUPLDECAWLEN0_out;
  VCUPLDECAWLEN1 <= VCUPLDECAWLEN1_out;
  VCUPLDECAWPROT0 <= VCUPLDECAWPROT0_out;
  VCUPLDECAWPROT1 <= VCUPLDECAWPROT1_out;
  VCUPLDECAWQOS0 <= VCUPLDECAWQOS0_out;
  VCUPLDECAWQOS1 <= VCUPLDECAWQOS1_out;
  VCUPLDECAWSIZE0 <= VCUPLDECAWSIZE0_out;
  VCUPLDECAWSIZE1 <= VCUPLDECAWSIZE1_out;
  VCUPLDECAWVALID0 <= VCUPLDECAWVALID0_out;
  VCUPLDECAWVALID1 <= VCUPLDECAWVALID1_out;
  VCUPLDECBREADY0 <= VCUPLDECBREADY0_out;
  VCUPLDECBREADY1 <= VCUPLDECBREADY1_out;
  VCUPLDECRREADY0 <= VCUPLDECRREADY0_out;
  VCUPLDECRREADY1 <= VCUPLDECRREADY1_out;
  VCUPLDECWDATA0 <= VCUPLDECWDATA0_out;
  VCUPLDECWDATA1 <= VCUPLDECWDATA1_out;
  VCUPLDECWLAST0 <= VCUPLDECWLAST0_out;
  VCUPLDECWLAST1 <= VCUPLDECWLAST1_out;
  VCUPLDECWVALID0 <= VCUPLDECWVALID0_out;
  VCUPLDECWVALID1 <= VCUPLDECWVALID1_out;
  VCUPLENCALL2CADDR <= VCUPLENCALL2CADDR_out;
  VCUPLENCALL2CRVALID <= VCUPLENCALL2CRVALID_out;
  VCUPLENCALL2CWDATA <= VCUPLENCALL2CWDATA_out;
  VCUPLENCALL2CWVALID <= VCUPLENCALL2CWVALID_out;
  VCUPLENCARADDR0 <= VCUPLENCARADDR0_out;
  VCUPLENCARADDR1 <= VCUPLENCARADDR1_out;
  VCUPLENCARBURST0 <= VCUPLENCARBURST0_out;
  VCUPLENCARBURST1 <= VCUPLENCARBURST1_out;
  VCUPLENCARCACHE0 <= VCUPLENCARCACHE0_out;
  VCUPLENCARCACHE1 <= VCUPLENCARCACHE1_out;
  VCUPLENCARID0 <= VCUPLENCARID0_out;
  VCUPLENCARID1 <= VCUPLENCARID1_out;
  VCUPLENCARLEN0 <= VCUPLENCARLEN0_out;
  VCUPLENCARLEN1 <= VCUPLENCARLEN1_out;
  VCUPLENCARPROT0 <= VCUPLENCARPROT0_out;
  VCUPLENCARPROT1 <= VCUPLENCARPROT1_out;
  VCUPLENCARQOS0 <= VCUPLENCARQOS0_out;
  VCUPLENCARQOS1 <= VCUPLENCARQOS1_out;
  VCUPLENCARSIZE0 <= VCUPLENCARSIZE0_out;
  VCUPLENCARSIZE1 <= VCUPLENCARSIZE1_out;
  VCUPLENCARVALID0 <= VCUPLENCARVALID0_out;
  VCUPLENCARVALID1 <= VCUPLENCARVALID1_out;
  VCUPLENCAWADDR0 <= VCUPLENCAWADDR0_out;
  VCUPLENCAWADDR1 <= VCUPLENCAWADDR1_out;
  VCUPLENCAWBURST0 <= VCUPLENCAWBURST0_out;
  VCUPLENCAWBURST1 <= VCUPLENCAWBURST1_out;
  VCUPLENCAWCACHE0 <= VCUPLENCAWCACHE0_out;
  VCUPLENCAWCACHE1 <= VCUPLENCAWCACHE1_out;
  VCUPLENCAWID0 <= VCUPLENCAWID0_out;
  VCUPLENCAWID1 <= VCUPLENCAWID1_out;
  VCUPLENCAWLEN0 <= VCUPLENCAWLEN0_out;
  VCUPLENCAWLEN1 <= VCUPLENCAWLEN1_out;
  VCUPLENCAWPROT0 <= VCUPLENCAWPROT0_out;
  VCUPLENCAWPROT1 <= VCUPLENCAWPROT1_out;
  VCUPLENCAWQOS0 <= VCUPLENCAWQOS0_out;
  VCUPLENCAWQOS1 <= VCUPLENCAWQOS1_out;
  VCUPLENCAWSIZE0 <= VCUPLENCAWSIZE0_out;
  VCUPLENCAWSIZE1 <= VCUPLENCAWSIZE1_out;
  VCUPLENCAWVALID0 <= VCUPLENCAWVALID0_out;
  VCUPLENCAWVALID1 <= VCUPLENCAWVALID1_out;
  VCUPLENCBREADY0 <= VCUPLENCBREADY0_out;
  VCUPLENCBREADY1 <= VCUPLENCBREADY1_out;
  VCUPLENCRREADY0 <= VCUPLENCRREADY0_out;
  VCUPLENCRREADY1 <= VCUPLENCRREADY1_out;
  VCUPLENCWDATA0 <= VCUPLENCWDATA0_out;
  VCUPLENCWDATA1 <= VCUPLENCWDATA1_out;
  VCUPLENCWLAST0 <= VCUPLENCWLAST0_out;
  VCUPLENCWLAST1 <= VCUPLENCWLAST1_out;
  VCUPLENCWVALID0 <= VCUPLENCWVALID0_out;
  VCUPLENCWVALID1 <= VCUPLENCWVALID1_out;
  VCUPLMCUMAXIICDCARADDR <= VCUPLMCUMAXIICDCARADDR_out;
  VCUPLMCUMAXIICDCARBURST <= VCUPLMCUMAXIICDCARBURST_out;
  VCUPLMCUMAXIICDCARCACHE <= VCUPLMCUMAXIICDCARCACHE_out;
  VCUPLMCUMAXIICDCARID <= VCUPLMCUMAXIICDCARID_out;
  VCUPLMCUMAXIICDCARLEN <= VCUPLMCUMAXIICDCARLEN_out;
  VCUPLMCUMAXIICDCARLOCK <= VCUPLMCUMAXIICDCARLOCK_out;
  VCUPLMCUMAXIICDCARPROT <= VCUPLMCUMAXIICDCARPROT_out;
  VCUPLMCUMAXIICDCARQOS <= VCUPLMCUMAXIICDCARQOS_out;
  VCUPLMCUMAXIICDCARSIZE <= VCUPLMCUMAXIICDCARSIZE_out;
  VCUPLMCUMAXIICDCARVALID <= VCUPLMCUMAXIICDCARVALID_out;
  VCUPLMCUMAXIICDCAWADDR <= VCUPLMCUMAXIICDCAWADDR_out;
  VCUPLMCUMAXIICDCAWBURST <= VCUPLMCUMAXIICDCAWBURST_out;
  VCUPLMCUMAXIICDCAWCACHE <= VCUPLMCUMAXIICDCAWCACHE_out;
  VCUPLMCUMAXIICDCAWID <= VCUPLMCUMAXIICDCAWID_out;
  VCUPLMCUMAXIICDCAWLEN <= VCUPLMCUMAXIICDCAWLEN_out;
  VCUPLMCUMAXIICDCAWLOCK <= VCUPLMCUMAXIICDCAWLOCK_out;
  VCUPLMCUMAXIICDCAWPROT <= VCUPLMCUMAXIICDCAWPROT_out;
  VCUPLMCUMAXIICDCAWQOS <= VCUPLMCUMAXIICDCAWQOS_out;
  VCUPLMCUMAXIICDCAWSIZE <= VCUPLMCUMAXIICDCAWSIZE_out;
  VCUPLMCUMAXIICDCAWVALID <= VCUPLMCUMAXIICDCAWVALID_out;
  VCUPLMCUMAXIICDCBREADY <= VCUPLMCUMAXIICDCBREADY_out;
  VCUPLMCUMAXIICDCRREADY <= VCUPLMCUMAXIICDCRREADY_out;
  VCUPLMCUMAXIICDCWDATA <= VCUPLMCUMAXIICDCWDATA_out;
  VCUPLMCUMAXIICDCWLAST <= VCUPLMCUMAXIICDCWLAST_out;
  VCUPLMCUMAXIICDCWSTRB <= VCUPLMCUMAXIICDCWSTRB_out;
  VCUPLMCUMAXIICDCWVALID <= VCUPLMCUMAXIICDCWVALID_out;
  VCUPLMCUSTATUSCLKPLL <= VCUPLMCUSTATUSCLKPLL_out;
  VCUPLPINTREQ <= VCUPLPINTREQ_out;
  VCUPLPLLSTATUSPLLLOCK <= VCUPLPLLSTATUSPLLLOCK_out;
  VCUPLPWRSUPPLYSTATUSVCCAUX <= VCUPLPWRSUPPLYSTATUSVCCAUX_out;
  VCUPLPWRSUPPLYSTATUSVCUINT <= VCUPLPWRSUPPLYSTATUSVCUINT_out;
  VCUPLRDATAAXILITEAPB <= VCUPLRDATAAXILITEAPB_out;
  VCUPLRRESPAXILITEAPB <= VCUPLRRESPAXILITEAPB_out;
  VCUPLRVALIDAXILITEAPB <= VCUPLRVALIDAXILITEAPB_out;
  VCUPLWREADYAXILITEAPB <= VCUPLWREADYAXILITEAPB_out;
  
  INITPLVCUGASKETCLAMPCONTROLLVLSHVCCINTD_in <= INITPLVCUGASKETCLAMPCONTROLLVLSHVCCINTD;
  PLVCUARADDRAXILITEAPB_in <= PLVCUARADDRAXILITEAPB;
  PLVCUARPROTAXILITEAPB_in <= PLVCUARPROTAXILITEAPB;
  PLVCUARVALIDAXILITEAPB_in <= PLVCUARVALIDAXILITEAPB;
  PLVCUAWADDRAXILITEAPB_in <= PLVCUAWADDRAXILITEAPB;
  PLVCUAWPROTAXILITEAPB_in <= PLVCUAWPROTAXILITEAPB;
  PLVCUAWVALIDAXILITEAPB_in <= PLVCUAWVALIDAXILITEAPB;
  PLVCUAXIDECCLK_in <= PLVCUAXIDECCLK;
  PLVCUAXIENCCLK_in <= PLVCUAXIENCCLK;
  PLVCUAXILITECLK_in <= PLVCUAXILITECLK;
  PLVCUAXIMCUCLK_in <= PLVCUAXIMCUCLK;
  PLVCUBREADYAXILITEAPB_in <= PLVCUBREADYAXILITEAPB;
  PLVCUCORECLK_in <= PLVCUCORECLK;
  PLVCUDECARREADY0_in <= PLVCUDECARREADY0;
  PLVCUDECARREADY1_in <= PLVCUDECARREADY1;
  PLVCUDECAWREADY0_in <= PLVCUDECAWREADY0;
  PLVCUDECAWREADY1_in <= PLVCUDECAWREADY1;
  PLVCUDECBID0_in <= PLVCUDECBID0;
  PLVCUDECBID1_in <= PLVCUDECBID1;
  PLVCUDECBRESP0_in <= PLVCUDECBRESP0;
  PLVCUDECBRESP1_in <= PLVCUDECBRESP1;
  PLVCUDECBVALID0_in <= PLVCUDECBVALID0;
  PLVCUDECBVALID1_in <= PLVCUDECBVALID1;
  PLVCUDECRDATA0_in <= PLVCUDECRDATA0;
  PLVCUDECRDATA1_in <= PLVCUDECRDATA1;
  PLVCUDECRID0_in <= PLVCUDECRID0;
  PLVCUDECRID1_in <= PLVCUDECRID1;
  PLVCUDECRLAST0_in <= PLVCUDECRLAST0;
  PLVCUDECRLAST1_in <= PLVCUDECRLAST1;
  PLVCUDECRRESP0_in <= PLVCUDECRRESP0;
  PLVCUDECRRESP1_in <= PLVCUDECRRESP1;
  PLVCUDECRVALID0_in <= PLVCUDECRVALID0;
  PLVCUDECRVALID1_in <= PLVCUDECRVALID1;
  PLVCUDECWREADY0_in <= PLVCUDECWREADY0;
  PLVCUDECWREADY1_in <= PLVCUDECWREADY1;
  PLVCUENCALL2CRDATA_in <= PLVCUENCALL2CRDATA;
  PLVCUENCALL2CRREADY_in <= '1' when (PLVCUENCALL2CRREADY = 'U') else PLVCUENCALL2CRREADY; -- rv 1
  PLVCUENCARREADY0_in <= PLVCUENCARREADY0;
  PLVCUENCARREADY1_in <= PLVCUENCARREADY1;
  PLVCUENCAWREADY0_in <= PLVCUENCAWREADY0;
  PLVCUENCAWREADY1_in <= PLVCUENCAWREADY1;
  PLVCUENCBID0_in <= PLVCUENCBID0;
  PLVCUENCBID1_in <= PLVCUENCBID1;
  PLVCUENCBRESP0_in <= PLVCUENCBRESP0;
  PLVCUENCBRESP1_in <= PLVCUENCBRESP1;
  PLVCUENCBVALID0_in <= PLVCUENCBVALID0;
  PLVCUENCBVALID1_in <= PLVCUENCBVALID1;
  PLVCUENCL2CCLK_in <= PLVCUENCL2CCLK;
  PLVCUENCRDATA0_in <= PLVCUENCRDATA0;
  PLVCUENCRDATA1_in <= PLVCUENCRDATA1;
  PLVCUENCRID0_in <= PLVCUENCRID0;
  PLVCUENCRID1_in <= PLVCUENCRID1;
  PLVCUENCRLAST0_in <= PLVCUENCRLAST0;
  PLVCUENCRLAST1_in <= PLVCUENCRLAST1;
  PLVCUENCRRESP0_in <= PLVCUENCRRESP0;
  PLVCUENCRRESP1_in <= PLVCUENCRRESP1;
  PLVCUENCRVALID0_in <= PLVCUENCRVALID0;
  PLVCUENCRVALID1_in <= PLVCUENCRVALID1;
  PLVCUENCWREADY0_in <= PLVCUENCWREADY0;
  PLVCUENCWREADY1_in <= PLVCUENCWREADY1;
  PLVCUMCUCLK_in <= PLVCUMCUCLK;
  PLVCUMCUMAXIICDCARREADY_in <= PLVCUMCUMAXIICDCARREADY;
  PLVCUMCUMAXIICDCAWREADY_in <= PLVCUMCUMAXIICDCAWREADY;
  PLVCUMCUMAXIICDCBID_in <= PLVCUMCUMAXIICDCBID;
  PLVCUMCUMAXIICDCBRESP_in <= PLVCUMCUMAXIICDCBRESP;
  PLVCUMCUMAXIICDCBVALID_in <= PLVCUMCUMAXIICDCBVALID;
  PLVCUMCUMAXIICDCRDATA_in <= PLVCUMCUMAXIICDCRDATA;
  PLVCUMCUMAXIICDCRID_in <= PLVCUMCUMAXIICDCRID;
  PLVCUMCUMAXIICDCRLAST_in <= PLVCUMCUMAXIICDCRLAST;
  PLVCUMCUMAXIICDCRRESP_in <= PLVCUMCUMAXIICDCRRESP;
  PLVCUMCUMAXIICDCRVALID_in <= PLVCUMCUMAXIICDCRVALID;
  PLVCUMCUMAXIICDCWREADY_in <= PLVCUMCUMAXIICDCWREADY;
  PLVCUPLLREFCLKPL_in <= PLVCUPLLREFCLKPL;
  PLVCURAWRSTN_in <= PLVCURAWRSTN;
  PLVCURREADYAXILITEAPB_in <= PLVCURREADYAXILITEAPB;
  PLVCUWDATAAXILITEAPB_in <= PLVCUWDATAAXILITEAPB;
  PLVCUWSTRBAXILITEAPB_in <= PLVCUWSTRBAXILITEAPB;
  PLVCUWVALIDAXILITEAPB_in <= PLVCUWVALIDAXILITEAPB;
  
  CORECLKREQ_BIN <= CORECLKREQ;
  
  DECHORRESOLUTION_BIN <= DECHORRESOLUTION;
  
  DECODERCHROMAFORMAT_BIN <= 
      DECODERCHROMAFORMAT_4_2_2 when (DECODERCHROMAFORMAT = "4_2_2") else
      DECODERCHROMAFORMAT_4_2_0 when (DECODERCHROMAFORMAT = "4_2_0") else
      DECODERCHROMAFORMAT_4_2_2;
  
  DECODERCODING_BIN <= 
      DECODERCODING_H_265 when (DECODERCODING = "H.265") else
      DECODERCODING_H_264 when (DECODERCODING = "H.264") else
      DECODERCODING_H_265;
  
  DECODERCOLORDEPTH_BIN <= DECODERCOLORDEPTH;
  
  DECODERNUMCORES_BIN <= DECODERNUMCORES;
  
  DECVERTRESOLUTION_BIN <= DECVERTRESOLUTION;
  
  ENABLEDECODER_BIN <= 
      ENABLEDECODER_TRUE when (ENABLEDECODER = "TRUE") else
      ENABLEDECODER_FALSE when (ENABLEDECODER = "FALSE") else
      ENABLEDECODER_TRUE;
  
  ENABLEENCODER_BIN <= 
      ENABLEENCODER_TRUE when (ENABLEENCODER = "TRUE") else
      ENABLEENCODER_FALSE when (ENABLEENCODER = "FALSE") else
      ENABLEENCODER_TRUE;
  
  ENCHORRESOLUTION_BIN <= ENCHORRESOLUTION;
  
  ENCODERCHROMAFORMAT_BIN <= 
      ENCODERCHROMAFORMAT_4_2_2 when (ENCODERCHROMAFORMAT = "4_2_2") else
      ENCODERCHROMAFORMAT_4_2_0 when (ENCODERCHROMAFORMAT = "4_2_0") else
      ENCODERCHROMAFORMAT_4_2_2;
  
  ENCODERCODING_BIN <= 
      ENCODERCODING_H_265 when (ENCODERCODING = "H.265") else
      ENCODERCODING_H_264 when (ENCODERCODING = "H.264") else
      ENCODERCODING_H_265;
  
  ENCODERCOLORDEPTH_BIN <= ENCODERCOLORDEPTH;
  
  ENCODERNUMCORES_BIN <= ENCODERNUMCORES;
  
  ENCVERTRESOLUTION_BIN <= ENCVERTRESOLUTION;
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CORECLKREQ check
        if((xil_attr_test) or
           ((CORECLKREQ < 0) or (CORECLKREQ > 667))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-101] CORECLKREQ attribute is set to "));
          Write ( Message, CORECLKREQ);
          Write ( Message, string'(". Legal values for this attribute are 0 to 667. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DECHORRESOLUTION check
        if((xil_attr_test) or
           ((DECHORRESOLUTION < 320) or (DECHORRESOLUTION > 8192))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-102] DECHORRESOLUTION attribute is set to "));
          Write ( Message, DECHORRESOLUTION);
          Write ( Message, string'(". Legal values for this attribute are 320 to 8192. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DECODERCHROMAFORMAT check
      if((xil_attr_test) or
         ((DECODERCHROMAFORMAT /= "4_2_2") and 
          (DECODERCHROMAFORMAT /= "4_2_0"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] DECODERCHROMAFORMAT attribute is set to """));
        Write ( Message, string'(DECODERCHROMAFORMAT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""4_2_2"" or "));
        Write ( Message, string'("""4_2_0"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DECODERCODING check
      if((xil_attr_test) or
         ((DECODERCODING /= "H.265") and 
          (DECODERCODING /= "H.264"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] DECODERCODING attribute is set to """));
        Write ( Message, string'(DECODERCODING));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""H.265"" or "));
        Write ( Message, string'("""H.264"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DECODERCOLORDEPTH check
      if((xil_attr_test) or
         ((DECODERCOLORDEPTH /= 10) and 
          (DECODERCOLORDEPTH /= 8))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] DECODERCOLORDEPTH attribute is set to "));
        Write ( Message, DECODERCOLORDEPTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("10 or "));
        Write ( Message, string'("8. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DECODERNUMCORES check
        if((xil_attr_test) or
           ((DECODERNUMCORES < 1) or (DECODERNUMCORES > 2))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-106] DECODERNUMCORES attribute is set to "));
          Write ( Message, DECODERNUMCORES);
          Write ( Message, string'(". Legal values for this attribute are 1 to 2. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- DECVERTRESOLUTION check
        if((xil_attr_test) or
           ((DECVERTRESOLUTION < 240) or (DECVERTRESOLUTION > 4352))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-107] DECVERTRESOLUTION attribute is set to "));
          Write ( Message, DECVERTRESOLUTION);
          Write ( Message, string'(". Legal values for this attribute are 240 to 4352. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- ENABLEDECODER check
      if((xil_attr_test) or
         ((ENABLEDECODER /= "TRUE") and 
          (ENABLEDECODER /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-108] ENABLEDECODER attribute is set to """));
        Write ( Message, string'(ENABLEDECODER));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ENABLEENCODER check
      if((xil_attr_test) or
         ((ENABLEENCODER /= "TRUE") and 
          (ENABLEENCODER /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-109] ENABLEENCODER attribute is set to """));
        Write ( Message, string'(ENABLEENCODER));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ENCHORRESOLUTION check
        if((xil_attr_test) or
           ((ENCHORRESOLUTION < 320) or (ENCHORRESOLUTION > 8192))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-110] ENCHORRESOLUTION attribute is set to "));
          Write ( Message, ENCHORRESOLUTION);
          Write ( Message, string'(". Legal values for this attribute are 320 to 8192. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- ENCODERCHROMAFORMAT check
      if((xil_attr_test) or
         ((ENCODERCHROMAFORMAT /= "4_2_2") and 
          (ENCODERCHROMAFORMAT /= "4_2_0"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-111] ENCODERCHROMAFORMAT attribute is set to """));
        Write ( Message, string'(ENCODERCHROMAFORMAT));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""4_2_2"" or "));
        Write ( Message, string'("""4_2_0"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ENCODERCODING check
      if((xil_attr_test) or
         ((ENCODERCODING /= "H.265") and 
          (ENCODERCODING /= "H.264"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-112] ENCODERCODING attribute is set to """));
        Write ( Message, string'(ENCODERCODING));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""H.265"" or "));
        Write ( Message, string'("""H.264"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ENCODERCOLORDEPTH check
      if((xil_attr_test) or
         ((ENCODERCOLORDEPTH /= 10) and 
          (ENCODERCOLORDEPTH /= 8))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] ENCODERCOLORDEPTH attribute is set to "));
        Write ( Message, ENCODERCOLORDEPTH);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("10 or "));
        Write ( Message, string'("8. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(VCU_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- ENCODERNUMCORES check
        if((xil_attr_test) or
           ((ENCODERNUMCORES < 1) or (ENCODERNUMCORES > 4))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-114] ENCODERNUMCORES attribute is set to "));
          Write ( Message, ENCODERNUMCORES);
          Write ( Message, string'(". Legal values for this attribute are 1 to 4. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    -------- ENCVERTRESOLUTION check
        if((xil_attr_test) or
           ((ENCVERTRESOLUTION < 240) or (ENCVERTRESOLUTION > 4352))) then
          attr_err := true;
          Write ( Message, string'("Error : [Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-115] ENCVERTRESOLUTION attribute is set to "));
          Write ( Message, ENCVERTRESOLUTION);
          Write ( Message, string'(". Legal values for this attribute are 240 to 4352. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(VCU_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-116] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(VCU_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
    -- end behavioral body
  end VCU_V;
