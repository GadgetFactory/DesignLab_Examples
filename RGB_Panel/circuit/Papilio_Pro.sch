<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ext_pins_in(100:0)" />
        <signal name="ext_pins_out(100:0)" />
        <signal name="ext_pins_inout(100:0)" />
        <signal name="XLXN_336(7:0)" />
        <signal name="XLXN_334(7:0)" />
        <signal name="XLXN_332(7:0)" />
        <signal name="XLXN_330(7:0)" />
        <signal name="XLXN_328(7:0)" />
        <signal name="XLXN_326(7:0)" />
        <signal name="WING_AL6" />
        <signal name="WING_AL7" />
        <signal name="XLXN_325(7:0)" />
        <signal name="XLXN_327(7:0)" />
        <signal name="XLXN_329(7:0)" />
        <signal name="XLXN_331(7:0)" />
        <signal name="XLXN_333(7:0)" />
        <signal name="XLXN_335(7:0)" />
        <signal name="XLXN_598(200:0)" />
        <signal name="XLXN_599(200:0)" />
        <signal name="WING_CL3" />
        <signal name="WING_CL2" />
        <signal name="WING_CL1" />
        <signal name="XLXN_610(1:0)" />
        <signal name="XLXN_611(1:0)" />
        <signal name="XLXN_610(1)" />
        <signal name="XLXN_610(0)" />
        <signal name="XLXN_611(1)" />
        <signal name="XLXN_611(0)" />
        <signal name="XLXN_616(1:0)" />
        <signal name="XLXN_616(1)" />
        <signal name="XLXN_616(0)" />
        <signal name="XLXN_619(3:0)" />
        <signal name="XLXN_619(3)" />
        <signal name="XLXN_619(2)" />
        <signal name="XLXN_619(1)" />
        <signal name="XLXN_619(0)" />
        <signal name="WING_CH2" />
        <signal name="WING_CH4" />
        <signal name="WING_CH3" />
        <signal name="WING_CH6" />
        <signal name="WING_CH1" />
        <signal name="WING_CL4" />
        <signal name="WING_CL5" />
        <signal name="WING_CL6" />
        <signal name="WING_CL7" />
        <signal name="WING_CH5" />
        <signal name="XLXN_622(100:0)" />
        <signal name="XLXN_623(100:0)" />
        <signal name="XLXN_626(100:0)" />
        <signal name="XLXN_627(100:0)" />
        <signal name="XLXN_633" />
        <signal name="XLXN_634" />
        <port polarity="Input" name="ext_pins_in(100:0)" />
        <port polarity="Output" name="ext_pins_out(100:0)" />
        <port polarity="BiDirectional" name="ext_pins_inout(100:0)" />
        <port polarity="BiDirectional" name="WING_AL6" />
        <port polarity="BiDirectional" name="WING_AL7" />
        <port polarity="Output" name="WING_CL3" />
        <port polarity="Output" name="WING_CL2" />
        <port polarity="Output" name="WING_CL1" />
        <port polarity="Output" name="WING_CH2" />
        <port polarity="Output" name="WING_CH4" />
        <port polarity="Output" name="WING_CH3" />
        <port polarity="Output" name="WING_CH6" />
        <port polarity="Output" name="WING_CH1" />
        <port polarity="Output" name="WING_CL4" />
        <port polarity="Output" name="WING_CL5" />
        <port polarity="Output" name="WING_CL6" />
        <port polarity="Output" name="WING_CL7" />
        <port polarity="Output" name="WING_CH5" />
        <blockdef name="Wing_GPIO">
            <timestamp>2014-10-31T16:12:30</timestamp>
            <rect width="160" x="0" y="-128" height="128" />
            <rect width="64" x="160" y="-108" height="24" />
            <line x2="224" y1="-96" y2="-96" x1="160" />
            <rect width="64" x="160" y="-44" height="24" />
            <line x2="224" y1="-32" y2="-32" x1="160" />
        </blockdef>
        <blockdef name="VIDEO_zpuino_wb_rgb_panel">
            <timestamp>2015-4-10T16:24:21</timestamp>
            <rect width="176" x="64" y="-448" height="448" />
            <rect width="64" x="240" y="-236" height="24" />
            <line x2="304" y1="-224" y2="-224" x1="240" />
            <rect width="64" x="240" y="-172" height="24" />
            <line x2="304" y1="-160" y2="-160" x1="240" />
            <rect width="64" x="240" y="-108" height="24" />
            <line x2="304" y1="-96" y2="-96" x1="240" />
            <rect width="64" x="240" y="-44" height="24" />
            <line x2="304" y1="-32" y2="-32" x1="240" />
            <line x2="304" y1="-416" y2="-416" x1="240" />
            <line x2="304" y1="-352" y2="-352" x1="240" />
            <line x2="304" y1="-288" y2="-288" x1="240" />
            <line x2="144" y1="-496" y2="-448" x1="144" />
            <line x2="160" y1="-496" y2="-448" x1="160" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="obuf4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-128" y2="-192" x1="64" />
            <line x2="64" y1="-160" y2="-128" x1="128" />
            <line x2="128" y1="-192" y2="-160" x1="64" />
            <line x2="64" y1="-192" y2="-256" x1="64" />
            <line x2="64" y1="-224" y2="-192" x1="128" />
            <line x2="128" y1="-256" y2="-224" x1="64" />
            <line x2="128" y1="-224" y2="-224" x1="224" />
            <line x2="128" y1="-160" y2="-160" x1="224" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="128" y1="-96" y2="-96" x1="224" />
            <line x2="64" y1="-64" y2="-128" x1="64" />
            <line x2="64" y1="-96" y2="-64" x1="128" />
            <line x2="128" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="COMM_zpuino_wb_I2C">
            <timestamp>2015-4-8T22:40:35</timestamp>
            <rect width="144" x="64" y="-128" height="128" />
            <line x2="272" y1="-96" y2="-96" x1="208" />
            <line x2="272" y1="-32" y2="-32" x1="208" />
            <line x2="128" y1="-176" y2="-128" x1="128" />
            <line x2="144" y1="-176" y2="-128" x1="144" />
        </blockdef>
        <blockdef name="ZPUino_Papilio_Pro_V2">
            <timestamp>2015-3-19T23:13:19</timestamp>
            <line x2="4368" y1="-400" y2="-400" x1="4304" />
            <line x2="4304" y1="-416" y2="-416" x1="4368" />
            <rect width="248" x="4056" y="-448" height="76" />
            <rect width="4240" x="64" y="-688" height="688" />
            <line x2="4368" y1="-272" y2="-272" x1="4304" />
            <line x2="4304" y1="-240" y2="-240" x1="4368" />
            <rect width="176" x="4128" y="-300" height="124" />
            <line x2="4304" y1="-208" y2="-208" x1="4368" />
            <line x2="64" y1="-656" y2="-656" x1="4" />
            <line x2="64" y1="-624" y2="-624" x1="0" />
            <line x2="64" y1="-588" y2="-588" x1="0" />
            <rect width="360" x="64" y="-676" height="116" />
            <line x2="176" y1="64" y2="0" x1="176" />
            <line x2="160" y1="64" y2="0" x1="160" />
            <line x2="608" y1="64" y2="0" x1="608" />
            <line x2="624" y1="64" y2="0" x1="624" />
            <line x2="1056" y1="64" y2="0" x1="1056" />
            <line x2="1072" y1="64" y2="0" x1="1072" />
            <line x2="1504" y1="64" y2="0" x1="1504" />
            <line x2="1520" y1="64" y2="0" x1="1520" />
            <line x2="1968" y1="64" y2="0" x1="1968" />
            <line x2="1984" y1="64" y2="0" x1="1984" />
            <line x2="2400" y1="64" y2="0" x1="2400" />
            <line x2="2416" y1="64" y2="0" x1="2416" />
            <line x2="2864" y1="64" y2="0" x1="2864" />
            <line x2="2880" y1="64" y2="0" x1="2880" />
            <line x2="3312" y1="64" y2="0" x1="3312" />
            <line x2="3328" y1="64" y2="0" x1="3328" />
            <line x2="3760" y1="64" y2="0" x1="3760" />
            <line x2="3776" y1="64" y2="0" x1="3776" />
            <rect width="172" x="80" y="-92" height="92" />
            <rect width="172" x="528" y="-92" height="92" />
            <rect width="172" x="976" y="-92" height="92" />
            <rect width="172" x="1424" y="-92" height="92" />
            <rect width="172" x="1888" y="-92" height="92" />
            <rect width="172" x="2320" y="-92" height="92" />
            <rect width="172" x="2784" y="-92" height="92" />
            <rect width="172" x="3232" y="-92" height="92" />
            <rect width="240" x="3680" y="-92" height="92" />
            <line x2="3872" y1="64" y2="0" x1="3872" />
            <line x2="3888" y1="64" y2="0" x1="3888" />
        </blockdef>
        <blockdef name="Papilio_Default_Wing_Pinout">
            <timestamp>2015-3-19T23:13:18</timestamp>
            <rect width="148" x="316" y="-1724" height="276" />
            <rect width="148" x="316" y="-1152" height="280" />
            <rect width="148" x="316" y="-860" height="276" />
            <rect width="148" x="316" y="-572" height="276" />
            <rect width="148" x="316" y="-284" height="276" />
            <rect width="148" x="316" y="-1436" height="272" />
            <line x2="528" y1="-1408" y2="-1408" x1="464" />
            <line x2="528" y1="-1376" y2="-1376" x1="464" />
            <line x2="528" y1="-1344" y2="-1344" x1="464" />
            <line x2="528" y1="-1312" y2="-1312" x1="464" />
            <line x2="528" y1="-1280" y2="-1280" x1="464" />
            <line x2="528" y1="-1248" y2="-1248" x1="464" />
            <line x2="528" y1="-1216" y2="-1216" x1="464" />
            <line x2="528" y1="-1184" y2="-1184" x1="464" />
            <line x2="528" y1="-1696" y2="-1696" x1="464" />
            <line x2="528" y1="-1664" y2="-1664" x1="464" />
            <line x2="528" y1="-1632" y2="-1632" x1="464" />
            <line x2="528" y1="-1600" y2="-1600" x1="464" />
            <line x2="528" y1="-1568" y2="-1568" x1="464" />
            <line x2="528" y1="-1536" y2="-1536" x1="464" />
            <line x2="528" y1="-1504" y2="-1504" x1="464" />
            <line x2="528" y1="-1472" y2="-1472" x1="464" />
            <line x2="528" y1="-832" y2="-832" x1="464" />
            <line x2="528" y1="-800" y2="-800" x1="464" />
            <line x2="528" y1="-768" y2="-768" x1="464" />
            <line x2="528" y1="-736" y2="-736" x1="464" />
            <line x2="528" y1="-704" y2="-704" x1="464" />
            <line x2="528" y1="-672" y2="-672" x1="464" />
            <line x2="528" y1="-640" y2="-640" x1="464" />
            <line x2="528" y1="-608" y2="-608" x1="464" />
            <line x2="528" y1="-1120" y2="-1120" x1="464" />
            <line x2="528" y1="-1088" y2="-1088" x1="464" />
            <line x2="528" y1="-1056" y2="-1056" x1="464" />
            <line x2="528" y1="-1024" y2="-1024" x1="464" />
            <line x2="528" y1="-992" y2="-992" x1="464" />
            <line x2="528" y1="-960" y2="-960" x1="464" />
            <line x2="528" y1="-928" y2="-928" x1="464" />
            <line x2="528" y1="-896" y2="-896" x1="464" />
            <line x2="528" y1="-544" y2="-544" x1="464" />
            <line x2="528" y1="-512" y2="-512" x1="464" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <line x2="528" y1="-448" y2="-448" x1="464" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <line x2="528" y1="-384" y2="-384" x1="464" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <line x2="528" y1="-320" y2="-320" x1="464" />
            <line x2="528" y1="-256" y2="-256" x1="464" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <line x2="528" y1="-192" y2="-192" x1="464" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <line x2="528" y1="-128" y2="-128" x1="464" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <line x2="528" y1="-64" y2="-64" x1="464" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
            <rect width="432" x="32" y="-1784" height="2028" />
            <line x2="32" y1="-1744" y2="-1744" x1="-32" />
            <line x2="32" y1="-1760" y2="-1760" x1="-32" />
            <rect width="64" x="-32" y="-108" height="24" />
            <line x2="32" y1="-96" y2="-96" x1="-32" />
            <rect width="64" x="-32" y="-172" height="24" />
            <line x2="32" y1="-160" y2="-160" x1="-32" />
            <rect width="64" x="-32" y="-396" height="24" />
            <line x2="32" y1="-384" y2="-384" x1="-32" />
            <rect width="64" x="-32" y="-460" height="24" />
            <line x2="32" y1="-448" y2="-448" x1="-32" />
            <rect width="64" x="-32" y="-1612" height="24" />
            <line x2="32" y1="-1600" y2="-1600" x1="-32" />
            <rect width="64" x="-32" y="-1548" height="24" />
            <line x2="32" y1="-1536" y2="-1536" x1="-32" />
            <rect width="64" x="-32" y="-1324" height="24" />
            <line x2="32" y1="-1312" y2="-1312" x1="-32" />
            <rect width="64" x="-32" y="-1260" height="24" />
            <line x2="32" y1="-1248" y2="-1248" x1="-32" />
            <rect width="64" x="-32" y="-1052" height="24" />
            <line x2="32" y1="-1040" y2="-1040" x1="-32" />
            <rect width="64" x="-32" y="-988" height="24" />
            <line x2="32" y1="-976" y2="-976" x1="-32" />
            <rect width="64" x="-32" y="-748" height="24" />
            <line x2="32" y1="-736" y2="-736" x1="-32" />
            <rect width="64" x="-32" y="-684" height="24" />
            <line x2="32" y1="-672" y2="-672" x1="-32" />
            <rect width="88" x="32" y="-1616" height="96" />
            <rect width="88" x="32" y="-1328" height="96" />
            <rect width="88" x="32" y="-1056" height="96" />
            <rect width="88" x="32" y="-752" height="96" />
            <rect width="88" x="32" y="-464" height="96" />
            <rect width="88" x="32" y="-176" height="96" />
            <line x2="528" y1="64" y2="64" x1="464" />
            <line x2="528" y1="96" y2="96" x1="464" />
            <line x2="528" y1="128" y2="128" x1="464" />
            <line x2="528" y1="160" y2="160" x1="464" />
            <line x2="528" y1="192" y2="192" x1="464" />
            <line x2="528" y1="224" y2="224" x1="464" />
            <line x2="32" y1="64" y2="64" x1="-32" />
            <line x2="32" y1="96" y2="96" x1="-32" />
            <line x2="32" y1="128" y2="128" x1="-32" />
            <line x2="32" y1="160" y2="160" x1="-32" />
            <line x2="32" y1="192" y2="192" x1="-32" />
            <line x2="32" y1="224" y2="224" x1="-32" />
        </blockdef>
        <blockdef name="clk_32to64_dcm">
            <timestamp>2015-4-10T16:27:1</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="Wing_GPIO" name="XLXI_27">
            <blockpin signalname="XLXN_335(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_336(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_26">
            <blockpin signalname="XLXN_333(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_334(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_25">
            <blockpin signalname="XLXN_331(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_332(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_24">
            <blockpin signalname="XLXN_329(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_330(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_23">
            <blockpin signalname="XLXN_327(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_328(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_22">
            <blockpin signalname="XLXN_325(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_326(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="VIDEO_zpuino_wb_rgb_panel" name="XLXI_61">
            <blockpin signalname="XLXN_610(1:0)" name="R(1:0)" />
            <blockpin signalname="XLXN_611(1:0)" name="G(1:0)" />
            <blockpin signalname="XLXN_616(1:0)" name="B(1:0)" />
            <blockpin signalname="XLXN_619(3:0)" name="COL(3:0)" />
            <blockpin signalname="WING_CL3" name="CLK" />
            <blockpin signalname="WING_CL2" name="STB" />
            <blockpin signalname="WING_CL1" name="OE" />
            <blockpin signalname="XLXN_623(100:0)" name="wishbone_out(100:0)" />
            <blockpin signalname="XLXN_622(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="XLXN_633" name="clk_64Mhz" />
        </block>
        <block symbolname="obuf" name="XLXI_62">
            <blockpin signalname="XLXN_610(1)" name="I" />
            <blockpin signalname="WING_CH2" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_63">
            <blockpin signalname="XLXN_610(0)" name="I" />
            <blockpin signalname="WING_CH5" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_64">
            <blockpin signalname="XLXN_611(1)" name="I" />
            <blockpin signalname="WING_CH3" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_65">
            <blockpin signalname="XLXN_611(0)" name="I" />
            <blockpin signalname="WING_CH6" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_66">
            <blockpin signalname="XLXN_616(1)" name="I" />
            <blockpin signalname="WING_CH1" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_67">
            <blockpin signalname="XLXN_616(0)" name="I" />
            <blockpin signalname="WING_CH4" name="O" />
        </block>
        <block symbolname="obuf4" name="XLXI_68">
            <blockpin signalname="XLXN_619(3)" name="I0" />
            <blockpin signalname="XLXN_619(2)" name="I1" />
            <blockpin signalname="XLXN_619(1)" name="I2" />
            <blockpin signalname="XLXN_619(0)" name="I3" />
            <blockpin signalname="WING_CL4" name="O0" />
            <blockpin signalname="WING_CL5" name="O1" />
            <blockpin signalname="WING_CL6" name="O2" />
            <blockpin signalname="WING_CL7" name="O3" />
        </block>
        <block symbolname="COMM_zpuino_wb_I2C" name="XLXI_70">
            <blockpin signalname="WING_AL7" name="i2c_scl" />
            <blockpin signalname="WING_AL6" name="i2c_sda" />
            <blockpin signalname="XLXN_626(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="XLXN_627(100:0)" name="wishbone_out(100:0)" />
        </block>
        <block symbolname="ZPUino_Papilio_Pro_V2" name="XLXI_71">
            <blockpin signalname="XLXN_599(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_598(200:0)" name="gpio_bus_in(200:0)" />
            <blockpin name="clk_96Mhz" />
            <blockpin name="clk_1Mhz" />
            <blockpin signalname="XLXN_634" name="clk_osc_32Mhz" />
            <blockpin signalname="ext_pins_in(100:0)" name="ext_pins_in(100:0)" />
            <blockpin signalname="ext_pins_out(100:0)" name="ext_pins_out(100:0)" />
            <blockpin signalname="ext_pins_inout(100:0)" name="ext_pins_inout(100:0)" />
            <blockpin signalname="XLXN_627(100:0)" name="wishbone_slot_5_out(100:0)" />
            <blockpin signalname="XLXN_626(100:0)" name="wishbone_slot_5_in(100:0)" />
            <blockpin name="wishbone_slot_6_in(100:0)" />
            <blockpin name="wishbone_slot_6_out(100:0)" />
            <blockpin name="wishbone_slot_8_in(100:0)" />
            <blockpin name="wishbone_slot_8_out(100:0)" />
            <blockpin signalname="XLXN_622(100:0)" name="wishbone_slot_9_in(100:0)" />
            <blockpin signalname="XLXN_623(100:0)" name="wishbone_slot_9_out(100:0)" />
            <blockpin name="wishbone_slot_10_in(100:0)" />
            <blockpin name="wishbone_slot_10_out(100:0)" />
            <blockpin name="wishbone_slot_11_in(100:0)" />
            <blockpin name="wishbone_slot_11_out(100:0)" />
            <blockpin name="wishbone_slot_12_in(100:0)" />
            <blockpin name="wishbone_slot_12_out(100:0)" />
            <blockpin name="wishbone_slot_13_in(100:0)" />
            <blockpin name="wishbone_slot_13_out(100:0)" />
            <blockpin name="wishbone_slot_14_in(100:0)" />
            <blockpin name="wishbone_slot_14_out(100:0)" />
            <blockpin name="wishbone_slot_video_in(100:0)" />
            <blockpin name="wishbone_slot_video_out(100:0)" />
        </block>
        <block symbolname="Papilio_Default_Wing_Pinout" name="XLXI_73">
            <blockpin name="WING_AH0" />
            <blockpin name="WING_AH1" />
            <blockpin name="WING_AH2" />
            <blockpin name="WING_AH3" />
            <blockpin name="WING_AH4" />
            <blockpin name="WING_AH5" />
            <blockpin name="WING_AH6" />
            <blockpin name="WING_AH7" />
            <blockpin name="WING_AL0" />
            <blockpin name="WING_AL1" />
            <blockpin name="WING_AL2" />
            <blockpin name="WING_AL3" />
            <blockpin name="WING_AL4" />
            <blockpin name="WING_AL5" />
            <blockpin name="WING_AL6" />
            <blockpin name="WING_AL7" />
            <blockpin name="WING_BH0" />
            <blockpin name="WING_BH1" />
            <blockpin name="WING_BH2" />
            <blockpin name="WING_BH3" />
            <blockpin name="WING_BH4" />
            <blockpin name="WING_BH5" />
            <blockpin name="WING_BH6" />
            <blockpin name="WING_BH7" />
            <blockpin name="WING_BL0" />
            <blockpin name="WING_BL1" />
            <blockpin name="WING_BL2" />
            <blockpin name="WING_BL3" />
            <blockpin name="WING_BL4" />
            <blockpin name="WING_BL5" />
            <blockpin name="WING_BL6" />
            <blockpin name="WING_BL7" />
            <blockpin name="WING_CL0" />
            <blockpin name="WING_CL1" />
            <blockpin name="WING_CL2" />
            <blockpin name="WING_CL3" />
            <blockpin name="WING_CL4" />
            <blockpin name="WING_CL5" />
            <blockpin name="WING_CL6" />
            <blockpin name="WING_CL7" />
            <blockpin name="WING_CH0" />
            <blockpin name="WING_CH1" />
            <blockpin name="WING_CH2" />
            <blockpin name="WING_CH3" />
            <blockpin name="WING_CH4" />
            <blockpin name="WING_CH5" />
            <blockpin name="WING_CH6" />
            <blockpin name="WING_CH7" />
            <blockpin signalname="XLXN_599(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_598(200:0)" name="gpio_bus_in(200:0)" />
            <blockpin signalname="XLXN_329(7:0)" name="WingType_miso_BH(7:0)" />
            <blockpin signalname="XLXN_331(7:0)" name="WingType_miso_BL(7:0)" />
            <blockpin signalname="XLXN_333(7:0)" name="WingType_miso_AH(7:0)" />
            <blockpin signalname="XLXN_332(7:0)" name="WingType_mosi_BL(7:0)" />
            <blockpin signalname="XLXN_330(7:0)" name="WingType_mosi_BH(7:0)" />
            <blockpin signalname="XLXN_328(7:0)" name="WingType_mosi_CL(7:0)" />
            <blockpin signalname="XLXN_334(7:0)" name="WingType_mosi_AH(7:0)" />
            <blockpin signalname="XLXN_327(7:0)" name="WingType_miso_CL(7:0)" />
            <blockpin signalname="XLXN_325(7:0)" name="WingType_miso_CH(7:0)" />
            <blockpin signalname="XLXN_326(7:0)" name="WingType_mosi_CH(7:0)" />
            <blockpin signalname="XLXN_336(7:0)" name="WingType_mosi_AL(7:0)" />
            <blockpin signalname="XLXN_335(7:0)" name="WingType_miso_AL(7:0)" />
            <blockpin name="Flex_Pin_out_0" />
            <blockpin name="Flex_Pin_out_1" />
            <blockpin name="Flex_Pin_out_2" />
            <blockpin name="Flex_Pin_out_3" />
            <blockpin name="Flex_Pin_out_4" />
            <blockpin name="Flex_Pin_out_5" />
            <blockpin name="Flex_Pin_in_0" />
            <blockpin name="Flex_Pin_in_1" />
            <blockpin name="Flex_Pin_in_2" />
            <blockpin name="Flex_Pin_in_3" />
            <blockpin name="Flex_Pin_in_4" />
            <blockpin name="Flex_Pin_in_5" />
        </block>
        <block symbolname="clk_32to64_dcm" name="XLXI_77">
            <blockpin signalname="XLXN_634" name="CLK_IN1" />
            <blockpin signalname="XLXN_633" name="CLK_OUT1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <text style="fontsize:64;fontname:Arial" x="2108" y="3456">Version: 1.0</text>
        <branch name="ext_pins_in(100:0)">
            <wire x2="336" y1="96" y2="96" x1="304" />
        </branch>
        <branch name="ext_pins_out(100:0)">
            <wire x2="336" y1="128" y2="128" x1="304" />
        </branch>
        <branch name="ext_pins_inout(100:0)">
            <wire x2="336" y1="160" y2="160" x1="304" />
        </branch>
        <iomarker fontsize="28" x="304" y="96" name="ext_pins_in(100:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="128" name="ext_pins_out(100:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="160" name="ext_pins_inout(100:0)" orien="R180" />
        <branch name="XLXN_336(7:0)">
            <wire x2="4560" y1="1392" y2="1392" x1="4528" />
        </branch>
        <branch name="XLXN_334(7:0)">
            <wire x2="4560" y1="1680" y2="1680" x1="4528" />
        </branch>
        <branch name="XLXN_332(7:0)">
            <wire x2="4560" y1="1952" y2="1952" x1="4528" />
        </branch>
        <branch name="XLXN_330(7:0)">
            <wire x2="4560" y1="2256" y2="2256" x1="4528" />
        </branch>
        <branch name="XLXN_328(7:0)">
            <wire x2="4560" y1="2544" y2="2544" x1="4528" />
        </branch>
        <branch name="XLXN_326(7:0)">
            <wire x2="4560" y1="2832" y2="2832" x1="4528" />
        </branch>
        <instance x="4304" y="1424" name="XLXI_27" orien="R0">
        </instance>
        <instance x="4304" y="1712" name="XLXI_26" orien="R0">
        </instance>
        <instance x="4304" y="1984" name="XLXI_25" orien="R0">
        </instance>
        <instance x="4304" y="2288" name="XLXI_24" orien="R0">
        </instance>
        <instance x="4304" y="2576" name="XLXI_23" orien="R0">
        </instance>
        <instance x="4304" y="2864" name="XLXI_22" orien="R0">
        </instance>
        <branch name="XLXN_325(7:0)">
            <wire x2="4560" y1="2768" y2="2768" x1="4528" />
        </branch>
        <branch name="XLXN_327(7:0)">
            <wire x2="4560" y1="2480" y2="2480" x1="4528" />
        </branch>
        <branch name="XLXN_329(7:0)">
            <wire x2="4560" y1="2192" y2="2192" x1="4528" />
        </branch>
        <branch name="XLXN_331(7:0)">
            <wire x2="4560" y1="1888" y2="1888" x1="4528" />
        </branch>
        <branch name="XLXN_333(7:0)">
            <wire x2="4560" y1="1616" y2="1616" x1="4528" />
        </branch>
        <branch name="XLXN_335(7:0)">
            <wire x2="4560" y1="1328" y2="1328" x1="4528" />
        </branch>
        <branch name="XLXN_598(200:0)">
            <wire x2="5216" y1="1056" y2="1056" x1="4512" />
            <wire x2="4512" y1="1056" y2="1168" x1="4512" />
            <wire x2="4560" y1="1168" y2="1168" x1="4512" />
            <wire x2="5216" y1="336" y2="336" x1="4704" />
            <wire x2="5216" y1="336" y2="1056" x1="5216" />
        </branch>
        <branch name="XLXN_599(200:0)">
            <wire x2="5200" y1="1040" y2="1040" x1="4496" />
            <wire x2="4496" y1="1040" y2="1184" x1="4496" />
            <wire x2="4560" y1="1184" y2="1184" x1="4496" />
            <wire x2="5200" y1="352" y2="352" x1="4704" />
            <wire x2="5200" y1="352" y2="1040" x1="5200" />
        </branch>
        <instance x="1312" y="2288" name="XLXI_61" orien="R0">
        </instance>
        <branch name="WING_CL3">
            <wire x2="1648" y1="1872" y2="1872" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1648" y="1872" name="WING_CL3" orien="R0" />
        <branch name="WING_CL2">
            <wire x2="1648" y1="1936" y2="1936" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1648" y="1936" name="WING_CL2" orien="R0" />
        <branch name="WING_CL1">
            <wire x2="1648" y1="2000" y2="2000" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1648" y="2000" name="WING_CL1" orien="R0" />
        <branch name="XLXN_610(1:0)">
            <wire x2="2688" y1="2064" y2="2064" x1="1616" />
            <wire x2="2688" y1="2064" y2="2128" x1="2688" />
            <wire x2="2688" y1="2128" y2="2144" x1="2688" />
        </branch>
        <branch name="XLXN_611(1:0)">
            <wire x2="2624" y1="2128" y2="2128" x1="1616" />
            <wire x2="2624" y1="2128" y2="2224" x1="2624" />
            <wire x2="2624" y1="2224" y2="2288" x1="2624" />
            <wire x2="2624" y1="2288" y2="2304" x1="2624" />
        </branch>
        <instance x="2848" y="2096" name="XLXI_62" orien="R0" />
        <instance x="2848" y="2160" name="XLXI_63" orien="R0" />
        <bustap x2="2784" y1="2064" y2="2064" x1="2688" />
        <branch name="XLXN_610(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2816" y="2064" type="branch" />
            <wire x2="2816" y1="2064" y2="2064" x1="2784" />
            <wire x2="2848" y1="2064" y2="2064" x1="2816" />
        </branch>
        <bustap x2="2784" y1="2128" y2="2128" x1="2688" />
        <branch name="XLXN_610(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2816" y="2128" type="branch" />
            <wire x2="2816" y1="2128" y2="2128" x1="2784" />
            <wire x2="2848" y1="2128" y2="2128" x1="2816" />
        </branch>
        <instance x="2848" y="2256" name="XLXI_64" orien="R0" />
        <instance x="2848" y="2320" name="XLXI_65" orien="R0" />
        <bustap x2="2720" y1="2224" y2="2224" x1="2624" />
        <branch name="XLXN_611(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="2224" type="branch" />
            <wire x2="2784" y1="2224" y2="2224" x1="2720" />
            <wire x2="2848" y1="2224" y2="2224" x1="2784" />
        </branch>
        <bustap x2="2720" y1="2288" y2="2288" x1="2624" />
        <branch name="XLXN_611(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="2288" type="branch" />
            <wire x2="2784" y1="2288" y2="2288" x1="2720" />
            <wire x2="2848" y1="2288" y2="2288" x1="2784" />
        </branch>
        <branch name="XLXN_616(1:0)">
            <wire x2="2560" y1="2192" y2="2192" x1="1616" />
            <wire x2="2560" y1="2192" y2="2368" x1="2560" />
            <wire x2="2560" y1="2368" y2="2432" x1="2560" />
            <wire x2="2560" y1="2432" y2="2448" x1="2560" />
        </branch>
        <instance x="2848" y="2400" name="XLXI_66" orien="R0" />
        <instance x="2848" y="2464" name="XLXI_67" orien="R0" />
        <bustap x2="2656" y1="2368" y2="2368" x1="2560" />
        <branch name="XLXN_616(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2752" y="2368" type="branch" />
            <wire x2="2752" y1="2368" y2="2368" x1="2656" />
            <wire x2="2848" y1="2368" y2="2368" x1="2752" />
        </branch>
        <bustap x2="2656" y1="2432" y2="2432" x1="2560" />
        <branch name="XLXN_616(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2752" y="2432" type="branch" />
            <wire x2="2752" y1="2432" y2="2432" x1="2656" />
            <wire x2="2848" y1="2432" y2="2432" x1="2752" />
        </branch>
        <branch name="XLXN_619(3:0)">
            <wire x2="2496" y1="2256" y2="2256" x1="1616" />
            <wire x2="2496" y1="2256" y2="2576" x1="2496" />
            <wire x2="2496" y1="2576" y2="2640" x1="2496" />
            <wire x2="2496" y1="2640" y2="2704" x1="2496" />
            <wire x2="2496" y1="2704" y2="2768" x1="2496" />
        </branch>
        <instance x="2848" y="2800" name="XLXI_68" orien="R0" />
        <bustap x2="2592" y1="2576" y2="2576" x1="2496" />
        <branch name="XLXN_619(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="2576" type="branch" />
            <wire x2="2720" y1="2576" y2="2576" x1="2592" />
            <wire x2="2848" y1="2576" y2="2576" x1="2720" />
        </branch>
        <bustap x2="2592" y1="2640" y2="2640" x1="2496" />
        <branch name="XLXN_619(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="2640" type="branch" />
            <wire x2="2720" y1="2640" y2="2640" x1="2592" />
            <wire x2="2848" y1="2640" y2="2640" x1="2720" />
        </branch>
        <bustap x2="2592" y1="2704" y2="2704" x1="2496" />
        <branch name="XLXN_619(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="2704" type="branch" />
            <wire x2="2720" y1="2704" y2="2704" x1="2592" />
            <wire x2="2848" y1="2704" y2="2704" x1="2720" />
        </branch>
        <bustap x2="2592" y1="2768" y2="2768" x1="2496" />
        <branch name="XLXN_619(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="2768" type="branch" />
            <wire x2="2720" y1="2768" y2="2768" x1="2592" />
            <wire x2="2848" y1="2768" y2="2768" x1="2720" />
        </branch>
        <branch name="WING_CH2">
            <wire x2="3104" y1="2064" y2="2064" x1="3072" />
        </branch>
        <branch name="WING_CH5">
            <wire x2="3104" y1="2128" y2="2128" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2128" name="WING_CH5" orien="R0" />
        <branch name="WING_CH3">
            <wire x2="3104" y1="2224" y2="2224" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2224" name="WING_CH3" orien="R0" />
        <branch name="WING_CH6">
            <wire x2="3104" y1="2288" y2="2288" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2288" name="WING_CH6" orien="R0" />
        <branch name="WING_CH1">
            <wire x2="3104" y1="2368" y2="2368" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2368" name="WING_CH1" orien="R0" />
        <branch name="WING_CH4">
            <wire x2="3104" y1="2432" y2="2432" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2432" name="WING_CH4" orien="R0" />
        <branch name="WING_CL4">
            <wire x2="3104" y1="2576" y2="2576" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2576" name="WING_CL4" orien="R0" />
        <branch name="WING_CL5">
            <wire x2="3104" y1="2640" y2="2640" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2640" name="WING_CL5" orien="R0" />
        <branch name="WING_CL6">
            <wire x2="3104" y1="2704" y2="2704" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2704" name="WING_CL6" orien="R0" />
        <branch name="WING_CL7">
            <wire x2="3104" y1="2768" y2="2768" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2768" name="WING_CL7" orien="R0" />
        <branch name="XLXN_622(100:0)">
            <wire x2="1456" y1="1296" y2="1792" x1="1456" />
            <wire x2="1840" y1="1296" y2="1296" x1="1456" />
            <wire x2="1840" y1="816" y2="1296" x1="1840" />
        </branch>
        <branch name="XLXN_623(100:0)">
            <wire x2="1472" y1="1312" y2="1792" x1="1472" />
            <wire x2="1856" y1="1312" y2="1312" x1="1472" />
            <wire x2="1856" y1="816" y2="1312" x1="1856" />
        </branch>
        <instance x="128" y="1152" name="XLXI_70" orien="R0">
        </instance>
        <branch name="WING_AL7">
            <wire x2="432" y1="1056" y2="1056" x1="400" />
        </branch>
        <branch name="WING_AL6">
            <wire x2="432" y1="1120" y2="1120" x1="400" />
        </branch>
        <iomarker fontsize="28" x="432" y="1056" name="WING_AL7" orien="R0" />
        <iomarker fontsize="28" x="432" y="1120" name="WING_AL6" orien="R0" />
        <branch name="XLXN_626(100:0)">
            <wire x2="256" y1="896" y2="976" x1="256" />
            <wire x2="496" y1="896" y2="896" x1="256" />
            <wire x2="496" y1="816" y2="896" x1="496" />
        </branch>
        <branch name="XLXN_627(100:0)">
            <wire x2="272" y1="912" y2="976" x1="272" />
            <wire x2="512" y1="912" y2="912" x1="272" />
            <wire x2="512" y1="816" y2="912" x1="512" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2064" name="WING_CH2" orien="R0" />
        <instance x="336" y="752" name="XLXI_71" orien="R0">
        </instance>
        <instance x="4592" y="2928" name="XLXI_73" orien="R0">
        </instance>
        <branch name="XLXN_633">
            <wire x2="1312" y1="1904" y2="1904" x1="1280" />
        </branch>
        <instance x="896" y="1936" name="XLXI_77" orien="R0">
        </instance>
        <branch name="XLXN_634">
            <wire x2="4784" y1="960" y2="960" x1="816" />
            <wire x2="816" y1="960" y2="1904" x1="816" />
            <wire x2="896" y1="1904" y2="1904" x1="816" />
            <wire x2="4784" y1="544" y2="544" x1="4704" />
            <wire x2="4784" y1="544" y2="960" x1="4784" />
        </branch>
    </sheet>
</drawing>