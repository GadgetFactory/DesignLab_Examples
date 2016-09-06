<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="WING_AL0" />
        <signal name="WING_AL1" />
        <signal name="WING_AL2" />
        <signal name="WING_AL3" />
        <signal name="WING_AL4" />
        <signal name="WING_AL5" />
        <signal name="WING_AL6" />
        <signal name="WING_AL7" />
        <signal name="WING_AH0" />
        <signal name="WING_AH1" />
        <signal name="WING_AH2" />
        <signal name="WING_AH3" />
        <signal name="WING_AH4" />
        <signal name="WING_AH5" />
        <signal name="WING_AH6" />
        <signal name="WING_AH7" />
        <signal name="XLXN_408(200:0)" />
        <signal name="XLXN_409(200:0)" />
        <signal name="XLXN_335(7:0)" />
        <signal name="XLXN_336(7:0)" />
        <signal name="XLXN_333(7:0)" />
        <signal name="XLXN_334(7:0)" />
        <signal name="XLXN_331(7:0)" />
        <signal name="XLXN_332(7:0)" />
        <signal name="XLXN_329(7:0)" />
        <signal name="XLXN_330(7:0)" />
        <signal name="XLXN_327(7:0)" />
        <signal name="XLXN_328(7:0)" />
        <signal name="XLXN_325(7:0)" />
        <signal name="XLXN_326(7:0)" />
        <signal name="ext_pins_in(100:0)" />
        <signal name="ext_pins_out(100:0)" />
        <signal name="ext_pins_inout(100:0)" />
        <signal name="Logic_Analyzer_Inputs(31:0)" />
        <signal name="WC(15:0)" />
        <signal name="WB(15:0)" />
        <signal name="Logic_Analyzer_Inputs(15:0)" />
        <signal name="Logic_Analyzer_Inputs(31:16)" />
        <signal name="XLXN_436(100:0)" />
        <signal name="XLXN_437(100:0)" />
        <signal name="XLXN_438(100:0)" />
        <signal name="XLXN_439(100:0)" />
        <port polarity="BiDirectional" name="WING_AL0" />
        <port polarity="BiDirectional" name="WING_AL1" />
        <port polarity="BiDirectional" name="WING_AL2" />
        <port polarity="BiDirectional" name="WING_AL3" />
        <port polarity="BiDirectional" name="WING_AL4" />
        <port polarity="BiDirectional" name="WING_AL5" />
        <port polarity="BiDirectional" name="WING_AL6" />
        <port polarity="BiDirectional" name="WING_AL7" />
        <port polarity="BiDirectional" name="WING_AH0" />
        <port polarity="BiDirectional" name="WING_AH1" />
        <port polarity="BiDirectional" name="WING_AH2" />
        <port polarity="BiDirectional" name="WING_AH3" />
        <port polarity="BiDirectional" name="WING_AH4" />
        <port polarity="BiDirectional" name="WING_AH5" />
        <port polarity="BiDirectional" name="WING_AH6" />
        <port polarity="BiDirectional" name="WING_AH7" />
        <port polarity="Input" name="ext_pins_in(100:0)" />
        <port polarity="Output" name="ext_pins_out(100:0)" />
        <port polarity="BiDirectional" name="ext_pins_inout(100:0)" />
        <port polarity="Input" name="WC(15:0)" />
        <port polarity="Input" name="WB(15:0)" />
        <blockdef name="Wing_GPIO">
            <timestamp>2014-10-31T16:12:30</timestamp>
            <rect width="160" x="0" y="-128" height="128" />
            <rect width="64" x="160" y="-108" height="24" />
            <line x2="224" y1="-96" y2="-96" x1="160" />
            <rect width="64" x="160" y="-44" height="24" />
            <line x2="224" y1="-32" y2="-32" x1="160" />
        </blockdef>
        <blockdef name="Papilio_Default_Wing_Pinout">
            <timestamp>2014-11-10T23:27:39</timestamp>
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
        <blockdef name="ZPUino_Papilio_Pro_V2">
            <timestamp>2015-2-12T19:27:37</timestamp>
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
        <blockdef name="BENCHY_wb_SumpBlaze_LogicAnalyzer32">
            <timestamp>2016-1-22T17:22:29</timestamp>
            <rect width="208" x="64" y="-80" height="76" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="96" y1="-128" y2="-80" x1="96" />
            <line x2="112" y1="-128" y2="-80" x1="112" />
            <line x2="208" y1="-128" y2="-80" x1="208" />
            <line x2="224" y1="-128" y2="-80" x1="224" />
        </blockdef>
        <blockdef name="ibuf16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <rect width="96" x="128" y="-44" height="24" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="0" y="-44" height="24" />
        </blockdef>
        <blockdef name="pulldown">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-160" y2="-128" x1="64" />
            <line x2="60" y1="0" y2="0" x1="68" />
            <line x2="52" y1="-16" y2="-16" x1="76" />
            <line x2="40" y1="-32" y2="-32" x1="88" />
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
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
        <block symbolname="Papilio_Default_Wing_Pinout" name="XLXI_38">
            <blockpin signalname="WING_AH0" name="WING_AH0" />
            <blockpin signalname="WING_AH1" name="WING_AH1" />
            <blockpin signalname="WING_AH2" name="WING_AH2" />
            <blockpin signalname="WING_AH3" name="WING_AH3" />
            <blockpin signalname="WING_AH4" name="WING_AH4" />
            <blockpin signalname="WING_AH5" name="WING_AH5" />
            <blockpin signalname="WING_AH6" name="WING_AH6" />
            <blockpin signalname="WING_AH7" name="WING_AH7" />
            <blockpin signalname="WING_AL0" name="WING_AL0" />
            <blockpin signalname="WING_AL1" name="WING_AL1" />
            <blockpin signalname="WING_AL2" name="WING_AL2" />
            <blockpin signalname="WING_AL3" name="WING_AL3" />
            <blockpin signalname="WING_AL4" name="WING_AL4" />
            <blockpin signalname="WING_AL5" name="WING_AL5" />
            <blockpin signalname="WING_AL6" name="WING_AL6" />
            <blockpin signalname="WING_AL7" name="WING_AL7" />
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
            <blockpin signalname="XLXN_408(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_409(200:0)" name="gpio_bus_in(200:0)" />
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
        <block symbolname="ZPUino_Papilio_Pro_V2" name="XLXI_39">
            <blockpin signalname="XLXN_408(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_409(200:0)" name="gpio_bus_in(200:0)" />
            <blockpin name="clk_96Mhz" />
            <blockpin name="clk_1Mhz" />
            <blockpin name="clk_osc_32Mhz" />
            <blockpin signalname="ext_pins_in(100:0)" name="ext_pins_in(100:0)" />
            <blockpin signalname="ext_pins_out(100:0)" name="ext_pins_out(100:0)" />
            <blockpin signalname="ext_pins_inout(100:0)" name="ext_pins_inout(100:0)" />
            <blockpin name="wishbone_slot_5_out(100:0)" />
            <blockpin name="wishbone_slot_5_in(100:0)" />
            <blockpin name="wishbone_slot_6_in(100:0)" />
            <blockpin name="wishbone_slot_6_out(100:0)" />
            <blockpin name="wishbone_slot_8_in(100:0)" />
            <blockpin name="wishbone_slot_8_out(100:0)" />
            <blockpin name="wishbone_slot_9_in(100:0)" />
            <blockpin name="wishbone_slot_9_out(100:0)" />
            <blockpin name="wishbone_slot_10_in(100:0)" />
            <blockpin name="wishbone_slot_10_out(100:0)" />
            <blockpin name="wishbone_slot_11_in(100:0)" />
            <blockpin name="wishbone_slot_11_out(100:0)" />
            <blockpin name="wishbone_slot_12_in(100:0)" />
            <blockpin name="wishbone_slot_12_out(100:0)" />
            <blockpin name="wishbone_slot_13_in(100:0)" />
            <blockpin name="wishbone_slot_13_out(100:0)" />
            <blockpin signalname="XLXN_436(100:0)" name="wishbone_slot_14_in(100:0)" />
            <blockpin signalname="XLXN_437(100:0)" name="wishbone_slot_14_out(100:0)" />
            <blockpin signalname="XLXN_438(100:0)" name="wishbone_slot_video_in(100:0)" />
            <blockpin signalname="XLXN_439(100:0)" name="wishbone_slot_video_out(100:0)" />
        </block>
        <block symbolname="BENCHY_wb_SumpBlaze_LogicAnalyzer32" name="XLXI_41">
            <blockpin signalname="Logic_Analyzer_Inputs(31:0)" name="la(31:0)" />
            <blockpin signalname="XLXN_436(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="XLXN_437(100:0)" name="wishbone_out(100:0)" />
            <blockpin signalname="XLXN_438(100:0)" name="wishbone_slot_video_in(100:0)" />
            <blockpin signalname="XLXN_439(100:0)" name="wishbone_slot_video_out(100:0)" />
        </block>
        <block symbolname="ibuf16" name="XLXI_42">
            <blockpin signalname="WB(15:0)" name="I(15:0)" />
            <blockpin signalname="Logic_Analyzer_Inputs(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="ibuf16" name="XLXI_43">
            <blockpin signalname="WC(15:0)" name="I(15:0)" />
            <blockpin signalname="Logic_Analyzer_Inputs(31:16)" name="O(15:0)" />
        </block>
        <block symbolname="pulldown" name="XLXI_44(15:0)">
            <blockpin signalname="WC(15:0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_45(15:0)">
            <blockpin signalname="WB(15:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="WING_AL0">
            <wire x2="5200" y1="1392" y2="1392" x1="5168" />
        </branch>
        <branch name="WING_AL1">
            <wire x2="5200" y1="1424" y2="1424" x1="5168" />
        </branch>
        <branch name="WING_AL2">
            <wire x2="5200" y1="1456" y2="1456" x1="5168" />
        </branch>
        <branch name="WING_AL3">
            <wire x2="5200" y1="1488" y2="1488" x1="5168" />
        </branch>
        <branch name="WING_AL4">
            <wire x2="5200" y1="1520" y2="1520" x1="5168" />
        </branch>
        <branch name="WING_AL5">
            <wire x2="5200" y1="1552" y2="1552" x1="5168" />
        </branch>
        <branch name="WING_AL6">
            <wire x2="5200" y1="1584" y2="1584" x1="5168" />
        </branch>
        <branch name="WING_AL7">
            <wire x2="5200" y1="1616" y2="1616" x1="5168" />
        </branch>
        <branch name="WING_AH0">
            <wire x2="5200" y1="1680" y2="1680" x1="5168" />
        </branch>
        <branch name="WING_AH1">
            <wire x2="5200" y1="1712" y2="1712" x1="5168" />
        </branch>
        <branch name="WING_AH2">
            <wire x2="5200" y1="1744" y2="1744" x1="5168" />
        </branch>
        <branch name="WING_AH3">
            <wire x2="5200" y1="1776" y2="1776" x1="5168" />
        </branch>
        <branch name="WING_AH4">
            <wire x2="5200" y1="1808" y2="1808" x1="5168" />
        </branch>
        <branch name="WING_AH5">
            <wire x2="5200" y1="1840" y2="1840" x1="5168" />
        </branch>
        <branch name="WING_AH6">
            <wire x2="5200" y1="1872" y2="1872" x1="5168" />
        </branch>
        <branch name="WING_AH7">
            <wire x2="5200" y1="1904" y2="1904" x1="5168" />
        </branch>
        <iomarker fontsize="28" x="5200" y="1392" name="WING_AL0" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1424" name="WING_AL1" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1456" name="WING_AL2" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1488" name="WING_AL3" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1520" name="WING_AL4" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1552" name="WING_AL5" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1584" name="WING_AL6" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1616" name="WING_AL7" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1680" name="WING_AH0" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1712" name="WING_AH1" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1744" name="WING_AH2" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1776" name="WING_AH3" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1808" name="WING_AH4" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1840" name="WING_AH5" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1872" name="WING_AH6" orien="R0" />
        <iomarker fontsize="28" x="5200" y="1904" name="WING_AH7" orien="R0" />
        <branch name="XLXN_408(200:0)">
            <wire x2="4576" y1="1200" y2="1344" x1="4576" />
            <wire x2="4608" y1="1344" y2="1344" x1="4576" />
            <wire x2="5296" y1="1200" y2="1200" x1="4576" />
            <wire x2="5296" y1="352" y2="352" x1="4704" />
            <wire x2="5296" y1="352" y2="1200" x1="5296" />
        </branch>
        <branch name="XLXN_409(200:0)">
            <wire x2="4592" y1="1216" y2="1328" x1="4592" />
            <wire x2="4608" y1="1328" y2="1328" x1="4592" />
            <wire x2="5312" y1="1216" y2="1216" x1="4592" />
            <wire x2="5312" y1="336" y2="336" x1="4704" />
            <wire x2="5312" y1="336" y2="1216" x1="5312" />
        </branch>
        <branch name="XLXN_335(7:0)">
            <wire x2="4608" y1="1488" y2="1488" x1="4576" />
        </branch>
        <branch name="XLXN_336(7:0)">
            <wire x2="4608" y1="1552" y2="1552" x1="4576" />
        </branch>
        <branch name="XLXN_333(7:0)">
            <wire x2="4608" y1="1776" y2="1776" x1="4576" />
        </branch>
        <branch name="XLXN_334(7:0)">
            <wire x2="4608" y1="1840" y2="1840" x1="4576" />
        </branch>
        <branch name="XLXN_331(7:0)">
            <wire x2="4608" y1="2048" y2="2048" x1="4576" />
        </branch>
        <branch name="XLXN_332(7:0)">
            <wire x2="4608" y1="2112" y2="2112" x1="4576" />
        </branch>
        <branch name="XLXN_329(7:0)">
            <wire x2="4608" y1="2352" y2="2352" x1="4576" />
        </branch>
        <branch name="XLXN_330(7:0)">
            <wire x2="4608" y1="2416" y2="2416" x1="4576" />
        </branch>
        <branch name="XLXN_327(7:0)">
            <wire x2="4608" y1="2640" y2="2640" x1="4576" />
        </branch>
        <branch name="XLXN_328(7:0)">
            <wire x2="4608" y1="2704" y2="2704" x1="4576" />
        </branch>
        <branch name="XLXN_325(7:0)">
            <wire x2="4608" y1="2928" y2="2928" x1="4576" />
        </branch>
        <branch name="XLXN_326(7:0)">
            <wire x2="4608" y1="2992" y2="2992" x1="4576" />
        </branch>
        <instance x="4352" y="1584" name="XLXI_27" orien="R0">
        </instance>
        <instance x="4352" y="1872" name="XLXI_26" orien="R0">
        </instance>
        <instance x="4352" y="2144" name="XLXI_25" orien="R0">
        </instance>
        <instance x="4352" y="2448" name="XLXI_24" orien="R0">
        </instance>
        <instance x="4352" y="2736" name="XLXI_23" orien="R0">
        </instance>
        <instance x="4352" y="3024" name="XLXI_22" orien="R0">
        </instance>
        <instance x="4640" y="3088" name="XLXI_38" orien="R0">
        </instance>
        <text style="fontsize:64;fontname:Arial" x="80" y="3448">Version: 1.0</text>
        <branch name="ext_pins_in(100:0)">
            <wire x2="336" y1="96" y2="96" x1="304" />
        </branch>
        <iomarker fontsize="28" x="304" y="96" name="ext_pins_in(100:0)" orien="R180" />
        <branch name="ext_pins_out(100:0)">
            <wire x2="336" y1="128" y2="128" x1="304" />
        </branch>
        <iomarker fontsize="28" x="304" y="128" name="ext_pins_out(100:0)" orien="R180" />
        <branch name="ext_pins_inout(100:0)">
            <wire x2="336" y1="160" y2="160" x1="304" />
        </branch>
        <iomarker fontsize="28" x="304" y="160" name="ext_pins_inout(100:0)" orien="R180" />
        <instance x="336" y="752" name="XLXI_39" orien="R0">
        </instance>
        <instance x="4000" y="1248" name="XLXI_41" orien="R0">
        </instance>
        <branch name="Logic_Analyzer_Inputs(31:0)">
            <wire x2="4000" y1="1216" y2="1216" x1="3648" />
            <wire x2="3648" y1="1216" y2="1280" x1="3648" />
            <wire x2="3648" y1="1280" y2="1296" x1="3648" />
            <wire x2="3648" y1="1296" y2="1472" x1="3648" />
            <wire x2="3648" y1="1472" y2="1584" x1="3648" />
        </branch>
        <instance x="2864" y="1328" name="XLXI_42" orien="R0" />
        <branch name="WC(15:0)">
            <wire x2="2752" y1="1488" y2="1488" x1="2656" />
            <wire x2="2864" y1="1472" y2="1472" x1="2752" />
            <wire x2="2752" y1="1472" y2="1488" x1="2752" />
        </branch>
        <branch name="WB(15:0)">
            <wire x2="2752" y1="1296" y2="1296" x1="2656" />
            <wire x2="2848" y1="1296" y2="1296" x1="2752" />
            <wire x2="2864" y1="1296" y2="1296" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2656" y="1488" name="WC(15:0)" orien="R180" />
        <iomarker fontsize="28" x="2656" y="1296" name="WB(15:0)" orien="R180" />
        <instance x="2688" y="1648" name="XLXI_44(15:0)" orien="R0" />
        <instance x="2688" y="1456" name="XLXI_45(15:0)" orien="R0" />
        <instance x="2864" y="1504" name="XLXI_43" orien="R0" />
        <bustap x2="3552" y1="1296" y2="1296" x1="3648" />
        <branch name="Logic_Analyzer_Inputs(15:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3320" y="1296" type="branch" />
            <wire x2="3328" y1="1296" y2="1296" x1="3088" />
            <wire x2="3552" y1="1296" y2="1296" x1="3328" />
        </branch>
        <bustap x2="3552" y1="1472" y2="1472" x1="3648" />
        <branch name="Logic_Analyzer_Inputs(31:16)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3320" y="1472" type="branch" />
            <wire x2="3328" y1="1472" y2="1472" x1="3088" />
            <wire x2="3552" y1="1472" y2="1472" x1="3328" />
        </branch>
        <branch name="XLXN_436(100:0)">
            <wire x2="4096" y1="816" y2="1120" x1="4096" />
        </branch>
        <branch name="XLXN_437(100:0)">
            <wire x2="4112" y1="816" y2="1120" x1="4112" />
        </branch>
        <branch name="XLXN_438(100:0)">
            <wire x2="4208" y1="816" y2="1120" x1="4208" />
        </branch>
        <branch name="XLXN_439(100:0)">
            <wire x2="4224" y1="816" y2="1120" x1="4224" />
        </branch>
    </sheet>
</drawing>