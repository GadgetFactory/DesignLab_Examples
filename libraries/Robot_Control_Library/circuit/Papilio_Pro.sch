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
        <signal name="XLXN_481(100:0)" />
        <signal name="XLXN_482(100:0)" />
        <signal name="QUAD_A(7:0)" />
        <signal name="WING_AL4" />
        <signal name="WING_AH4" />
        <signal name="WING_BL4" />
        <signal name="WING_BH4" />
        <signal name="QUAD_A(0)" />
        <signal name="QUAD_A(3)" />
        <signal name="QUAD_A(2)" />
        <signal name="QUAD_A(1)" />
        <signal name="XLXN_409(200:0)" />
        <signal name="XLXN_408(200:0)" />
        <signal name="XLXN_326(7:0)" />
        <signal name="XLXN_325(7:0)" />
        <signal name="XLXN_328(7:0)" />
        <signal name="XLXN_327(7:0)" />
        <signal name="XLXN_330(7:0)" />
        <signal name="XLXN_329(7:0)" />
        <signal name="XLXN_332(7:0)" />
        <signal name="XLXN_331(7:0)" />
        <signal name="XLXN_334(7:0)" />
        <signal name="XLXN_333(7:0)" />
        <signal name="XLXN_336(7:0)" />
        <signal name="XLXN_335(7:0)" />
        <signal name="WING_CL4" />
        <signal name="WING_CH4" />
        <signal name="QUAD_A(4)" />
        <signal name="QUAD_A(5)" />
        <signal name="QUAD_B(7:0)" />
        <signal name="QUAD_B(5)" />
        <signal name="QUAD_B(4)" />
        <signal name="QUAD_B(3)" />
        <signal name="QUAD_B(2)" />
        <signal name="QUAD_B(1)" />
        <signal name="QUAD_B(0)" />
        <signal name="WING_AL5" />
        <signal name="WING_AH5" />
        <signal name="WING_BL5" />
        <signal name="WING_BH5" />
        <signal name="WING_CL5" />
        <signal name="WING_CH5" />
        <signal name="XLXN_487(100:0)" />
        <signal name="XLXN_488(100:0)" />
        <signal name="PWM(47:0)" />
        <signal name="WING_AL7" />
        <signal name="WING_AH7" />
        <signal name="WING_BL7" />
        <signal name="WING_BH7" />
        <signal name="WING_CL7" />
        <signal name="WING_CH7" />
        <signal name="PWM(5)" />
        <signal name="PWM(4)" />
        <signal name="PWM(3)" />
        <signal name="PWM(2)" />
        <signal name="PWM(1)" />
        <signal name="PWM(0)" />
        <port polarity="Input" name="ext_pins_in(100:0)" />
        <port polarity="Output" name="ext_pins_out(100:0)" />
        <port polarity="BiDirectional" name="ext_pins_inout(100:0)" />
        <port polarity="Input" name="WING_AL4" />
        <port polarity="Input" name="WING_AH4" />
        <port polarity="Input" name="WING_BL4" />
        <port polarity="Input" name="WING_BH4" />
        <port polarity="Input" name="WING_CL4" />
        <port polarity="Input" name="WING_CH4" />
        <port polarity="Input" name="WING_AL5" />
        <port polarity="Input" name="WING_AH5" />
        <port polarity="Input" name="WING_BL5" />
        <port polarity="Input" name="WING_BH5" />
        <port polarity="Input" name="WING_CL5" />
        <port polarity="Input" name="WING_CH5" />
        <port polarity="Output" name="WING_AL7" />
        <port polarity="Output" name="WING_AH7" />
        <port polarity="Output" name="WING_BL7" />
        <port polarity="Output" name="WING_BH7" />
        <port polarity="Output" name="WING_CL7" />
        <port polarity="Output" name="WING_CH7" />
        <blockdef name="Wing_GPIO">
            <timestamp>2014-11-10T23:31:50</timestamp>
            <rect width="160" x="0" y="-128" height="128" />
            <rect width="64" x="160" y="-108" height="24" />
            <line x2="224" y1="-96" y2="-96" x1="160" />
            <rect width="64" x="160" y="-44" height="24" />
            <line x2="224" y1="-32" y2="-32" x1="160" />
        </blockdef>
        <blockdef name="Papilio_Default_Wing_Pinout">
            <timestamp>2014-11-10T23:31:50</timestamp>
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
        <blockdef name="ibuf4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="128" y1="-160" y2="-160" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-192" y2="-256" x1="64" />
            <line x2="64" y1="-224" y2="-192" x1="128" />
            <line x2="128" y1="-256" y2="-224" x1="64" />
            <line x2="64" y1="-128" y2="-192" x1="64" />
            <line x2="64" y1="-160" y2="-128" x1="128" />
            <line x2="128" y1="-192" y2="-160" x1="64" />
            <line x2="64" y1="-64" y2="-128" x1="64" />
            <line x2="64" y1="-96" y2="-64" x1="128" />
            <line x2="128" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="128" y1="-224" y2="-224" x1="224" />
            <line x2="128" y1="-96" y2="-96" x1="224" />
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
        <blockdef name="RCL_Quadrature_Decoder_x8">
            <timestamp>2015-4-15T16:43:24</timestamp>
            <rect width="108" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="112" y1="-240" y2="-192" x1="112" />
            <line x2="128" y1="-240" y2="-192" x1="128" />
        </blockdef>
        <blockdef name="ibuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="RCL_PWM_x48">
            <timestamp>2015-4-16T16:21:22</timestamp>
            <rect width="180" x="156" y="-128" height="60" />
            <rect width="64" x="336" y="-108" height="24" />
            <line x2="400" y1="-96" y2="-96" x1="336" />
            <line x2="240" y1="-176" y2="-128" x1="240" />
            <line x2="256" y1="-176" y2="-128" x1="256" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <block symbolname="ZPUino_Papilio_Pro_V2" name="XLXI_51">
            <blockpin signalname="XLXN_408(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_409(200:0)" name="gpio_bus_in(200:0)" />
            <blockpin name="clk_96Mhz" />
            <blockpin name="clk_1Mhz" />
            <blockpin name="clk_osc_32Mhz" />
            <blockpin signalname="ext_pins_in(100:0)" name="ext_pins_in(100:0)" />
            <blockpin signalname="ext_pins_out(100:0)" name="ext_pins_out(100:0)" />
            <blockpin signalname="ext_pins_inout(100:0)" name="ext_pins_inout(100:0)" />
            <blockpin signalname="XLXN_482(100:0)" name="wishbone_slot_5_out(100:0)" />
            <blockpin signalname="XLXN_481(100:0)" name="wishbone_slot_5_in(100:0)" />
            <blockpin name="wishbone_slot_6_in(100:0)" />
            <blockpin name="wishbone_slot_6_out(100:0)" />
            <blockpin name="wishbone_slot_8_in(100:0)" />
            <blockpin name="wishbone_slot_8_out(100:0)" />
            <blockpin name="wishbone_slot_9_in(100:0)" />
            <blockpin name="wishbone_slot_9_out(100:0)" />
            <blockpin name="wishbone_slot_10_in(100:0)" />
            <blockpin name="wishbone_slot_10_out(100:0)" />
            <blockpin signalname="XLXN_487(100:0)" name="wishbone_slot_11_in(100:0)" />
            <blockpin signalname="XLXN_488(100:0)" name="wishbone_slot_11_out(100:0)" />
            <blockpin name="wishbone_slot_12_in(100:0)" />
            <blockpin name="wishbone_slot_12_out(100:0)" />
            <blockpin name="wishbone_slot_13_in(100:0)" />
            <blockpin name="wishbone_slot_13_out(100:0)" />
            <blockpin name="wishbone_slot_14_in(100:0)" />
            <blockpin name="wishbone_slot_14_out(100:0)" />
            <blockpin name="wishbone_slot_video_in(100:0)" />
            <blockpin name="wishbone_slot_video_out(100:0)" />
        </block>
        <block symbolname="ibuf4" name="XLXI_53">
            <blockpin signalname="WING_AL4" name="I0" />
            <blockpin signalname="WING_AH4" name="I1" />
            <blockpin signalname="WING_BL4" name="I2" />
            <blockpin signalname="WING_BH4" name="I3" />
            <blockpin signalname="QUAD_A(0)" name="O0" />
            <blockpin signalname="QUAD_A(1)" name="O1" />
            <blockpin signalname="QUAD_A(2)" name="O2" />
            <blockpin signalname="QUAD_A(3)" name="O3" />
        </block>
        <block symbolname="RCL_Quadrature_Decoder_x8" name="XLXI_52">
            <blockpin signalname="QUAD_A(7:0)" name="A(7:0)" />
            <blockpin signalname="QUAD_B(7:0)" name="B(7:0)" />
            <blockpin name="I(7:0)" />
            <blockpin signalname="XLXN_481(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="XLXN_482(100:0)" name="wishbone_out(100:0)" />
        </block>
        <block symbolname="Papilio_Default_Wing_Pinout" name="XLXI_38">
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
        <block symbolname="Wing_GPIO" name="XLXI_22">
            <blockpin signalname="XLXN_325(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_326(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_23">
            <blockpin signalname="XLXN_327(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_328(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_24">
            <blockpin signalname="XLXN_329(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_330(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_25">
            <blockpin signalname="XLXN_331(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_332(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_26">
            <blockpin signalname="XLXN_333(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_334(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Wing_GPIO" name="XLXI_27">
            <blockpin signalname="XLXN_335(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_336(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="ibuf" name="XLXI_56">
            <blockpin signalname="WING_CL4" name="I" />
            <blockpin signalname="QUAD_A(4)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_57">
            <blockpin signalname="WING_CH4" name="I" />
            <blockpin signalname="QUAD_A(5)" name="O" />
        </block>
        <block symbolname="ibuf4" name="XLXI_58">
            <blockpin signalname="WING_AL5" name="I0" />
            <blockpin signalname="WING_AH5" name="I1" />
            <blockpin signalname="WING_BL5" name="I2" />
            <blockpin signalname="WING_BH5" name="I3" />
            <blockpin signalname="QUAD_B(0)" name="O0" />
            <blockpin signalname="QUAD_B(1)" name="O1" />
            <blockpin signalname="QUAD_B(2)" name="O2" />
            <blockpin signalname="QUAD_B(3)" name="O3" />
        </block>
        <block symbolname="ibuf" name="XLXI_59">
            <blockpin signalname="WING_CL5" name="I" />
            <blockpin signalname="QUAD_B(4)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_60">
            <blockpin signalname="WING_CH5" name="I" />
            <blockpin signalname="QUAD_B(5)" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_63">
            <blockpin signalname="PWM(0)" name="I" />
            <blockpin signalname="WING_AL7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_64">
            <blockpin signalname="PWM(1)" name="I" />
            <blockpin signalname="WING_AH7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_65">
            <blockpin signalname="PWM(2)" name="I" />
            <blockpin signalname="WING_BL7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_66">
            <blockpin signalname="PWM(3)" name="I" />
            <blockpin signalname="WING_BH7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_67">
            <blockpin signalname="PWM(4)" name="I" />
            <blockpin signalname="WING_CL7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_68">
            <blockpin signalname="PWM(5)" name="I" />
            <blockpin signalname="WING_CH7" name="O" />
        </block>
        <block symbolname="RCL_PWM_x48" name="XLXI_61">
            <blockpin signalname="PWM(47:0)" name="PWM(47:0)" />
            <blockpin signalname="XLXN_487(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="XLXN_488(100:0)" name="wishbone_out(100:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="336" y="752" name="XLXI_51" orien="R0">
        </instance>
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
        <branch name="XLXN_481(100:0)">
            <wire x2="496" y1="816" y2="1232" x1="496" />
            <wire x2="2096" y1="1232" y2="1232" x1="496" />
            <wire x2="2096" y1="1232" y2="1648" x1="2096" />
        </branch>
        <branch name="XLXN_482(100:0)">
            <wire x2="512" y1="816" y2="1216" x1="512" />
            <wire x2="2112" y1="1216" y2="1216" x1="512" />
            <wire x2="2112" y1="1216" y2="1648" x1="2112" />
        </branch>
        <instance x="1984" y="1888" name="XLXI_52" orien="R0">
        </instance>
        <branch name="QUAD_A(7:0)">
            <wire x2="1984" y1="1728" y2="1728" x1="1456" />
            <wire x2="1456" y1="1728" y2="1744" x1="1456" />
            <wire x2="1456" y1="1744" y2="1808" x1="1456" />
            <wire x2="1456" y1="1808" y2="1872" x1="1456" />
            <wire x2="1456" y1="1872" y2="1936" x1="1456" />
            <wire x2="1456" y1="1936" y2="2000" x1="1456" />
            <wire x2="1456" y1="2000" y2="2064" x1="1456" />
            <wire x2="1456" y1="2064" y2="2128" x1="1456" />
        </branch>
        <instance x="1072" y="1968" name="XLXI_53" orien="R0" />
        <branch name="WING_AL4">
            <wire x2="1072" y1="1744" y2="1744" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="1744" name="WING_AL4" orien="R180" />
        <branch name="WING_AH4">
            <wire x2="1072" y1="1808" y2="1808" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="1808" name="WING_AH4" orien="R180" />
        <branch name="WING_BL4">
            <wire x2="1072" y1="1872" y2="1872" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="1872" name="WING_BL4" orien="R180" />
        <branch name="WING_BH4">
            <wire x2="1072" y1="1936" y2="1936" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="1936" name="WING_BH4" orien="R180" />
        <bustap x2="1360" y1="1744" y2="1744" x1="1456" />
        <branch name="QUAD_A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1744" type="branch" />
            <wire x2="1328" y1="1744" y2="1744" x1="1296" />
            <wire x2="1360" y1="1744" y2="1744" x1="1328" />
        </branch>
        <bustap x2="1360" y1="1936" y2="1936" x1="1456" />
        <branch name="QUAD_A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1936" type="branch" />
            <wire x2="1328" y1="1936" y2="1936" x1="1296" />
            <wire x2="1360" y1="1936" y2="1936" x1="1328" />
        </branch>
        <bustap x2="1360" y1="1872" y2="1872" x1="1456" />
        <branch name="QUAD_A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1872" type="branch" />
            <wire x2="1328" y1="1872" y2="1872" x1="1296" />
            <wire x2="1360" y1="1872" y2="1872" x1="1328" />
        </branch>
        <bustap x2="1360" y1="1808" y2="1808" x1="1456" />
        <branch name="QUAD_A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1808" type="branch" />
            <wire x2="1328" y1="1808" y2="1808" x1="1296" />
            <wire x2="1360" y1="1808" y2="1808" x1="1328" />
        </branch>
        <branch name="XLXN_409(200:0)">
            <wire x2="4592" y1="1216" y2="1328" x1="4592" />
            <wire x2="4608" y1="1328" y2="1328" x1="4592" />
            <wire x2="5312" y1="1216" y2="1216" x1="4592" />
            <wire x2="5312" y1="336" y2="336" x1="4704" />
            <wire x2="5312" y1="336" y2="1216" x1="5312" />
        </branch>
        <branch name="XLXN_408(200:0)">
            <wire x2="4576" y1="1200" y2="1344" x1="4576" />
            <wire x2="4608" y1="1344" y2="1344" x1="4576" />
            <wire x2="5296" y1="1200" y2="1200" x1="4576" />
            <wire x2="5296" y1="352" y2="352" x1="4704" />
            <wire x2="5296" y1="352" y2="1200" x1="5296" />
        </branch>
        <instance x="4640" y="3088" name="XLXI_38" orien="R0">
        </instance>
        <instance x="4352" y="3024" name="XLXI_22" orien="R0">
        </instance>
        <instance x="4352" y="2736" name="XLXI_23" orien="R0">
        </instance>
        <instance x="4352" y="2448" name="XLXI_24" orien="R0">
        </instance>
        <instance x="4352" y="2144" name="XLXI_25" orien="R0">
        </instance>
        <instance x="4352" y="1872" name="XLXI_26" orien="R0">
        </instance>
        <instance x="4352" y="1584" name="XLXI_27" orien="R0">
        </instance>
        <branch name="XLXN_326(7:0)">
            <wire x2="4608" y1="2992" y2="2992" x1="4576" />
        </branch>
        <branch name="XLXN_325(7:0)">
            <wire x2="4608" y1="2928" y2="2928" x1="4576" />
        </branch>
        <branch name="XLXN_328(7:0)">
            <wire x2="4608" y1="2704" y2="2704" x1="4576" />
        </branch>
        <branch name="XLXN_327(7:0)">
            <wire x2="4608" y1="2640" y2="2640" x1="4576" />
        </branch>
        <branch name="XLXN_330(7:0)">
            <wire x2="4608" y1="2416" y2="2416" x1="4576" />
        </branch>
        <branch name="XLXN_329(7:0)">
            <wire x2="4608" y1="2352" y2="2352" x1="4576" />
        </branch>
        <branch name="XLXN_332(7:0)">
            <wire x2="4608" y1="2112" y2="2112" x1="4576" />
        </branch>
        <branch name="XLXN_331(7:0)">
            <wire x2="4608" y1="2048" y2="2048" x1="4576" />
        </branch>
        <branch name="XLXN_334(7:0)">
            <wire x2="4608" y1="1840" y2="1840" x1="4576" />
        </branch>
        <branch name="XLXN_333(7:0)">
            <wire x2="4608" y1="1776" y2="1776" x1="4576" />
        </branch>
        <branch name="XLXN_336(7:0)">
            <wire x2="4608" y1="1552" y2="1552" x1="4576" />
        </branch>
        <branch name="XLXN_335(7:0)">
            <wire x2="4608" y1="1488" y2="1488" x1="4576" />
        </branch>
        <instance x="1072" y="2032" name="XLXI_56" orien="R0" />
        <instance x="1072" y="2096" name="XLXI_57" orien="R0" />
        <branch name="WING_CL4">
            <wire x2="1072" y1="2000" y2="2000" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2000" name="WING_CL4" orien="R180" />
        <branch name="WING_CH4">
            <wire x2="1072" y1="2064" y2="2064" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2064" name="WING_CH4" orien="R180" />
        <bustap x2="1360" y1="2000" y2="2000" x1="1456" />
        <branch name="QUAD_A(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="2000" type="branch" />
            <wire x2="1328" y1="2000" y2="2000" x1="1296" />
            <wire x2="1360" y1="2000" y2="2000" x1="1328" />
        </branch>
        <bustap x2="1360" y1="2064" y2="2064" x1="1456" />
        <branch name="QUAD_A(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="2064" type="branch" />
            <wire x2="1328" y1="2064" y2="2064" x1="1296" />
            <wire x2="1360" y1="2064" y2="2064" x1="1328" />
        </branch>
        <branch name="QUAD_B(7:0)">
            <wire x2="1984" y1="1792" y2="1792" x1="1680" />
            <wire x2="1680" y1="1792" y2="2240" x1="1680" />
            <wire x2="1680" y1="2240" y2="2304" x1="1680" />
            <wire x2="1680" y1="2304" y2="2368" x1="1680" />
            <wire x2="1680" y1="2368" y2="2432" x1="1680" />
            <wire x2="1680" y1="2432" y2="2496" x1="1680" />
            <wire x2="1680" y1="2496" y2="2560" x1="1680" />
            <wire x2="1680" y1="2560" y2="2592" x1="1680" />
        </branch>
        <instance x="1072" y="2464" name="XLXI_58" orien="R0" />
        <instance x="1072" y="2528" name="XLXI_59" orien="R0" />
        <instance x="1072" y="2592" name="XLXI_60" orien="R0" />
        <bustap x2="1584" y1="2560" y2="2560" x1="1680" />
        <branch name="QUAD_B(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2560" type="branch" />
            <wire x2="1440" y1="2560" y2="2560" x1="1296" />
            <wire x2="1584" y1="2560" y2="2560" x1="1440" />
        </branch>
        <bustap x2="1584" y1="2496" y2="2496" x1="1680" />
        <branch name="QUAD_B(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2496" type="branch" />
            <wire x2="1440" y1="2496" y2="2496" x1="1296" />
            <wire x2="1584" y1="2496" y2="2496" x1="1440" />
        </branch>
        <bustap x2="1584" y1="2432" y2="2432" x1="1680" />
        <branch name="QUAD_B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2432" type="branch" />
            <wire x2="1440" y1="2432" y2="2432" x1="1296" />
            <wire x2="1584" y1="2432" y2="2432" x1="1440" />
        </branch>
        <bustap x2="1584" y1="2368" y2="2368" x1="1680" />
        <branch name="QUAD_B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2368" type="branch" />
            <wire x2="1440" y1="2368" y2="2368" x1="1296" />
            <wire x2="1584" y1="2368" y2="2368" x1="1440" />
        </branch>
        <bustap x2="1584" y1="2304" y2="2304" x1="1680" />
        <branch name="QUAD_B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2304" type="branch" />
            <wire x2="1440" y1="2304" y2="2304" x1="1296" />
            <wire x2="1584" y1="2304" y2="2304" x1="1440" />
        </branch>
        <bustap x2="1584" y1="2240" y2="2240" x1="1680" />
        <branch name="QUAD_B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2240" type="branch" />
            <wire x2="1440" y1="2240" y2="2240" x1="1296" />
            <wire x2="1584" y1="2240" y2="2240" x1="1440" />
        </branch>
        <branch name="WING_AL5">
            <wire x2="1072" y1="2240" y2="2240" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2240" name="WING_AL5" orien="R180" />
        <branch name="WING_AH5">
            <wire x2="1072" y1="2304" y2="2304" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2304" name="WING_AH5" orien="R180" />
        <branch name="WING_BL5">
            <wire x2="1072" y1="2368" y2="2368" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2368" name="WING_BL5" orien="R180" />
        <branch name="WING_BH5">
            <wire x2="1072" y1="2432" y2="2432" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2432" name="WING_BH5" orien="R180" />
        <branch name="WING_CL5">
            <wire x2="1072" y1="2496" y2="2496" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2496" name="WING_CL5" orien="R180" />
        <branch name="WING_CH5">
            <wire x2="1072" y1="2560" y2="2560" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2560" name="WING_CH5" orien="R180" />
        <branch name="XLXN_487(100:0)">
            <wire x2="2736" y1="816" y2="1408" x1="2736" />
            <wire x2="3184" y1="1408" y2="1408" x1="2736" />
            <wire x2="3184" y1="1408" y2="2000" x1="3184" />
        </branch>
        <branch name="XLXN_488(100:0)">
            <wire x2="2752" y1="816" y2="1392" x1="2752" />
            <wire x2="3200" y1="1392" y2="1392" x1="2752" />
            <wire x2="3200" y1="1392" y2="2000" x1="3200" />
        </branch>
        <branch name="PWM(47:0)">
            <wire x2="3520" y1="2080" y2="2080" x1="3344" />
            <wire x2="3520" y1="2080" y2="2128" x1="3520" />
            <wire x2="3520" y1="2128" y2="2192" x1="3520" />
            <wire x2="3520" y1="2192" y2="2256" x1="3520" />
            <wire x2="3520" y1="2256" y2="2320" x1="3520" />
            <wire x2="3520" y1="2320" y2="2384" x1="3520" />
            <wire x2="3520" y1="2384" y2="2448" x1="3520" />
            <wire x2="3520" y1="2448" y2="2512" x1="3520" />
        </branch>
        <instance x="3760" y="2160" name="XLXI_63" orien="R0" />
        <instance x="3760" y="2224" name="XLXI_64" orien="R0" />
        <instance x="3760" y="2288" name="XLXI_65" orien="R0" />
        <instance x="3760" y="2352" name="XLXI_66" orien="R0" />
        <instance x="3760" y="2416" name="XLXI_67" orien="R0" />
        <instance x="3760" y="2480" name="XLXI_68" orien="R0" />
        <branch name="WING_AL7">
            <wire x2="4016" y1="2128" y2="2128" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4016" y="2128" name="WING_AL7" orien="R0" />
        <branch name="WING_AH7">
            <wire x2="4016" y1="2192" y2="2192" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4016" y="2192" name="WING_AH7" orien="R0" />
        <branch name="WING_BL7">
            <wire x2="4016" y1="2256" y2="2256" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4016" y="2256" name="WING_BL7" orien="R0" />
        <branch name="WING_BH7">
            <wire x2="4016" y1="2320" y2="2320" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4016" y="2320" name="WING_BH7" orien="R0" />
        <branch name="WING_CL7">
            <wire x2="4016" y1="2384" y2="2384" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4016" y="2384" name="WING_CL7" orien="R0" />
        <branch name="WING_CH7">
            <wire x2="4016" y1="2448" y2="2448" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4016" y="2448" name="WING_CH7" orien="R0" />
        <bustap x2="3616" y1="2448" y2="2448" x1="3520" />
        <branch name="PWM(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3688" y="2448" type="branch" />
            <wire x2="3696" y1="2448" y2="2448" x1="3616" />
            <wire x2="3760" y1="2448" y2="2448" x1="3696" />
        </branch>
        <bustap x2="3616" y1="2384" y2="2384" x1="3520" />
        <branch name="PWM(4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3688" y="2384" type="branch" />
            <wire x2="3696" y1="2384" y2="2384" x1="3616" />
            <wire x2="3760" y1="2384" y2="2384" x1="3696" />
        </branch>
        <bustap x2="3616" y1="2320" y2="2320" x1="3520" />
        <branch name="PWM(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3688" y="2320" type="branch" />
            <wire x2="3696" y1="2320" y2="2320" x1="3616" />
            <wire x2="3760" y1="2320" y2="2320" x1="3696" />
        </branch>
        <bustap x2="3616" y1="2256" y2="2256" x1="3520" />
        <branch name="PWM(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3688" y="2256" type="branch" />
            <wire x2="3696" y1="2256" y2="2256" x1="3616" />
            <wire x2="3760" y1="2256" y2="2256" x1="3696" />
        </branch>
        <bustap x2="3616" y1="2192" y2="2192" x1="3520" />
        <branch name="PWM(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3688" y="2192" type="branch" />
            <wire x2="3696" y1="2192" y2="2192" x1="3616" />
            <wire x2="3760" y1="2192" y2="2192" x1="3696" />
        </branch>
        <bustap x2="3616" y1="2128" y2="2128" x1="3520" />
        <branch name="PWM(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3688" y="2128" type="branch" />
            <wire x2="3696" y1="2128" y2="2128" x1="3616" />
            <wire x2="3760" y1="2128" y2="2128" x1="3696" />
        </branch>
        <instance x="2944" y="2176" name="XLXI_61" orien="R0">
        </instance>
    </sheet>
</drawing>