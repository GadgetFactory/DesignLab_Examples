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
        <signal name="ARD_RESET" />
        <signal name="DUO_SW1" />
        <signal name="Arduino_0" />
        <signal name="Arduino_1" />
        <signal name="Arduino_2" />
        <signal name="Arduino_3" />
        <signal name="Arduino_4" />
        <signal name="Arduino_5" />
        <signal name="Arduino_6" />
        <signal name="Arduino_7" />
        <signal name="Arduino_8" />
        <signal name="Arduino_9" />
        <signal name="Arduino_10" />
        <signal name="Arduino_11" />
        <signal name="Arduino_12" />
        <signal name="Arduino_13" />
        <signal name="XLXN_336(7:0)" />
        <signal name="XLXN_334(7:0)" />
        <signal name="XLXN_332(7:0)" />
        <signal name="XLXN_330(7:0)" />
        <signal name="XLXN_328(7:0)" />
        <signal name="XLXN_326(7:0)" />
        <signal name="XLXN_449(7:0)" />
        <signal name="XLXN_448(7:0)" />
        <signal name="XLXN_325(7:0)" />
        <signal name="XLXN_327(7:0)" />
        <signal name="XLXN_329(7:0)" />
        <signal name="XLXN_331(7:0)" />
        <signal name="XLXN_333(7:0)" />
        <signal name="XLXN_335(7:0)" />
        <signal name="XLXN_598(200:0)" />
        <signal name="XLXN_599(200:0)" />
        <signal name="XLXN_600(100:0)" />
        <signal name="XLXN_601(100:0)" />
        <signal name="XLXN_602(100:0)" />
        <signal name="XLXN_603(100:0)" />
        <signal name="LA_Inputs(31:0)" />
        <signal name="LA_Inputs(15:0)" />
        <signal name="LA_Inputs(31:16)" />
        <signal name="WD(15:0)" />
        <signal name="WC(15:0)" />
        <port polarity="Input" name="ext_pins_in(100:0)" />
        <port polarity="Output" name="ext_pins_out(100:0)" />
        <port polarity="BiDirectional" name="ext_pins_inout(100:0)" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="DUO_SW1" />
        <port polarity="BiDirectional" name="Arduino_0" />
        <port polarity="BiDirectional" name="Arduino_1" />
        <port polarity="BiDirectional" name="Arduino_2" />
        <port polarity="BiDirectional" name="Arduino_3" />
        <port polarity="BiDirectional" name="Arduino_4" />
        <port polarity="BiDirectional" name="Arduino_5" />
        <port polarity="BiDirectional" name="Arduino_6" />
        <port polarity="BiDirectional" name="Arduino_7" />
        <port polarity="BiDirectional" name="Arduino_8" />
        <port polarity="BiDirectional" name="Arduino_9" />
        <port polarity="BiDirectional" name="Arduino_10" />
        <port polarity="BiDirectional" name="Arduino_11" />
        <port polarity="BiDirectional" name="Arduino_12" />
        <port polarity="BiDirectional" name="Arduino_13" />
        <port polarity="Input" name="WD(15:0)" />
        <port polarity="Input" name="WC(15:0)" />
        <blockdef name="Wing_GPIO">
            <timestamp>2014-10-31T16:12:30</timestamp>
            <rect width="160" x="0" y="-128" height="128" />
            <rect width="64" x="160" y="-108" height="24" />
            <line x2="224" y1="-96" y2="-96" x1="160" />
            <rect width="64" x="160" y="-44" height="24" />
            <line x2="224" y1="-32" y2="-32" x1="160" />
        </blockdef>
        <blockdef name="Papilio_DUO_Wing_Pinout">
            <timestamp>2014-12-1T23:29:47</timestamp>
            <rect width="148" x="284" y="-2140" height="276" />
            <rect width="148" x="284" y="-1568" height="280" />
            <rect width="148" x="284" y="-1852" height="272" />
            <line x2="496" y1="-1824" y2="-1824" x1="432" />
            <line x2="496" y1="-1792" y2="-1792" x1="432" />
            <line x2="496" y1="-1760" y2="-1760" x1="432" />
            <line x2="496" y1="-1728" y2="-1728" x1="432" />
            <line x2="496" y1="-1696" y2="-1696" x1="432" />
            <line x2="496" y1="-1664" y2="-1664" x1="432" />
            <line x2="496" y1="-2112" y2="-2112" x1="432" />
            <line x2="496" y1="-2080" y2="-2080" x1="432" />
            <line x2="496" y1="-2048" y2="-2048" x1="432" />
            <line x2="496" y1="-2016" y2="-2016" x1="432" />
            <line x2="496" y1="-1984" y2="-1984" x1="432" />
            <line x2="496" y1="-1952" y2="-1952" x1="432" />
            <line x2="496" y1="-1536" y2="-1536" x1="432" />
            <line x2="496" y1="-1504" y2="-1504" x1="432" />
            <line x2="496" y1="-1472" y2="-1472" x1="432" />
            <line x2="496" y1="-1440" y2="-1440" x1="432" />
            <line x2="496" y1="-1408" y2="-1408" x1="432" />
            <line x2="496" y1="-1376" y2="-1376" x1="432" />
            <line x2="496" y1="-1344" y2="-1344" x1="432" />
            <line x2="496" y1="-1312" y2="-1312" x1="432" />
            <rect width="432" x="0" y="-2200" height="2320" />
            <line x2="0" y1="-2160" y2="-2160" x1="-64" />
            <line x2="0" y1="-2176" y2="-2176" x1="-64" />
            <rect width="64" x="-64" y="-2028" height="24" />
            <line x2="0" y1="-2016" y2="-2016" x1="-64" />
            <rect width="64" x="-64" y="-1964" height="24" />
            <line x2="0" y1="-1952" y2="-1952" x1="-64" />
            <rect width="64" x="-64" y="-1740" height="24" />
            <line x2="0" y1="-1728" y2="-1728" x1="-64" />
            <rect width="64" x="-64" y="-1676" height="24" />
            <line x2="0" y1="-1664" y2="-1664" x1="-64" />
            <rect width="64" x="-64" y="-1468" height="24" />
            <line x2="0" y1="-1456" y2="-1456" x1="-64" />
            <rect width="64" x="-64" y="-1404" height="24" />
            <line x2="0" y1="-1392" y2="-1392" x1="-64" />
            <rect width="88" x="0" y="-2032" height="96" />
            <rect width="88" x="0" y="-1744" height="96" />
            <rect width="88" x="0" y="-1472" height="96" />
            <rect width="148" x="284" y="-1276" height="276" />
            <rect width="148" x="284" y="-988" height="276" />
            <line x2="496" y1="-1248" y2="-1248" x1="432" />
            <line x2="496" y1="-1216" y2="-1216" x1="432" />
            <line x2="496" y1="-1184" y2="-1184" x1="432" />
            <line x2="496" y1="-1152" y2="-1152" x1="432" />
            <line x2="496" y1="-1120" y2="-1120" x1="432" />
            <line x2="496" y1="-1088" y2="-1088" x1="432" />
            <line x2="496" y1="-1056" y2="-1056" x1="432" />
            <line x2="496" y1="-1024" y2="-1024" x1="432" />
            <line x2="496" y1="-960" y2="-960" x1="432" />
            <line x2="496" y1="-928" y2="-928" x1="432" />
            <line x2="496" y1="-896" y2="-896" x1="432" />
            <line x2="496" y1="-864" y2="-864" x1="432" />
            <line x2="496" y1="-832" y2="-832" x1="432" />
            <line x2="496" y1="-800" y2="-800" x1="432" />
            <line x2="496" y1="-768" y2="-768" x1="432" />
            <line x2="496" y1="-736" y2="-736" x1="432" />
            <rect width="64" x="-64" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="-64" />
            <rect width="64" x="-64" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="-64" />
            <rect width="64" x="-64" y="-1100" height="24" />
            <line x2="0" y1="-1088" y2="-1088" x1="-64" />
            <rect width="64" x="-64" y="-1164" height="24" />
            <line x2="0" y1="-1152" y2="-1152" x1="-64" />
            <rect width="88" x="0" y="-1168" height="96" />
            <rect width="88" x="0" y="-880" height="96" />
            <rect width="148" x="284" y="-700" height="276" />
            <rect width="148" x="284" y="-412" height="276" />
            <rect width="88" x="0" y="-592" height="96" />
            <rect width="88" x="0" y="-304" height="96" />
            <line x2="0" y1="-576" y2="-576" x1="-64" />
            <rect width="64" x="-64" y="-588" height="24" />
            <line x2="0" y1="-512" y2="-512" x1="-64" />
            <rect width="64" x="-64" y="-524" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="-64" />
            <rect width="64" x="-64" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="-64" />
            <rect width="64" x="-64" y="-236" height="24" />
            <line x2="496" y1="-672" y2="-672" x1="432" />
            <line x2="496" y1="-640" y2="-640" x1="432" />
            <line x2="496" y1="-608" y2="-608" x1="432" />
            <line x2="496" y1="-576" y2="-576" x1="432" />
            <line x2="496" y1="-544" y2="-544" x1="432" />
            <line x2="496" y1="-512" y2="-512" x1="432" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <line x2="496" y1="-448" y2="-448" x1="432" />
            <line x2="496" y1="-384" y2="-384" x1="432" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <line x2="496" y1="-320" y2="-320" x1="432" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <line x2="496" y1="-256" y2="-256" x1="432" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <line x2="496" y1="-192" y2="-192" x1="432" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <line x2="496" y1="-1888" y2="-1888" x1="432" />
            <line x2="496" y1="-1920" y2="-1920" x1="432" />
            <line x2="496" y1="-80" y2="-80" x1="432" />
            <line x2="496" y1="-48" y2="-48" x1="432" />
            <line x2="496" y1="-16" y2="-16" x1="432" />
            <line x2="496" y1="16" y2="16" x1="432" />
            <line x2="496" y1="48" y2="48" x1="432" />
            <line x2="496" y1="80" y2="80" x1="432" />
            <line x2="0" y1="-80" y2="-80" x1="-64" />
            <line x2="0" y1="-48" y2="-48" x1="-64" />
            <line x2="0" y1="-16" y2="-16" x1="-64" />
            <line x2="0" y1="16" y2="16" x1="-64" />
            <line x2="0" y1="48" y2="48" x1="-64" />
            <line x2="0" y1="80" y2="80" x1="-64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="ZPUino_Papilio_DUO_V2">
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
            <line x2="64" y1="-272" y2="-272" x1="0" />
            <rect width="696" x="64" y="-288" height="124" />
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
            <timestamp>2016-2-2T19:22:49</timestamp>
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
        <block symbolname="ZPUino_Papilio_DUO_V2" name="XLXI_59">
            <blockpin signalname="XLXN_599(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_598(200:0)" name="gpio_bus_in(200:0)" />
            <blockpin name="clk_96Mhz" />
            <blockpin name="clk_1Mhz" />
            <blockpin name="clk_osc_32Mhz" />
            <blockpin signalname="ext_pins_in(100:0)" name="ext_pins_in(100:0)" />
            <blockpin signalname="ext_pins_out(100:0)" name="ext_pins_out(100:0)" />
            <blockpin signalname="ext_pins_inout(100:0)" name="ext_pins_inout(100:0)" />
            <blockpin name="AVR_Wishbone_Bridge_Enable" />
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
            <blockpin signalname="XLXN_600(100:0)" name="wishbone_slot_14_in(100:0)" />
            <blockpin signalname="XLXN_601(100:0)" name="wishbone_slot_14_out(100:0)" />
            <blockpin signalname="XLXN_602(100:0)" name="wishbone_slot_video_in(100:0)" />
            <blockpin signalname="XLXN_603(100:0)" name="wishbone_slot_video_out(100:0)" />
        </block>
        <block symbolname="inv" name="XLXI_48">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
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
        <block symbolname="Wing_GPIO" name="XLXI_41">
            <blockpin signalname="XLXN_448(7:0)" name="wt_miso(7:0)" />
            <blockpin signalname="XLXN_449(7:0)" name="wt_mosi(7:0)" />
        </block>
        <block symbolname="Papilio_DUO_Wing_Pinout" name="XLXI_44">
            <blockpin signalname="Arduino_8" name="WING_AH0" />
            <blockpin signalname="Arduino_9" name="WING_AH1" />
            <blockpin signalname="Arduino_10" name="WING_AH2" />
            <blockpin signalname="Arduino_11" name="WING_AH3" />
            <blockpin signalname="Arduino_12" name="WING_AH4" />
            <blockpin signalname="Arduino_13" name="WING_AH5" />
            <blockpin signalname="Arduino_0" name="WING_AL0" />
            <blockpin signalname="Arduino_1" name="WING_AL1" />
            <blockpin signalname="Arduino_2" name="WING_AL2" />
            <blockpin signalname="Arduino_3" name="WING_AL3" />
            <blockpin signalname="Arduino_4" name="WING_AL4" />
            <blockpin signalname="Arduino_5" name="WING_AL5" />
            <blockpin name="WING_BL0" />
            <blockpin name="WING_BL1" />
            <blockpin name="WING_BL2" />
            <blockpin name="WING_BL3" />
            <blockpin name="WING_BL4" />
            <blockpin name="WING_BL5" />
            <blockpin name="WING_BL6" />
            <blockpin name="WING_BL7" />
            <blockpin signalname="XLXN_599(200:0)" name="gpio_bus_out(200:0)" />
            <blockpin signalname="XLXN_598(200:0)" name="gpio_bus_in(200:0)" />
            <blockpin signalname="XLXN_331(7:0)" name="WingType_miso_BL(7:0)" />
            <blockpin signalname="XLXN_333(7:0)" name="WingType_miso_AH(7:0)" />
            <blockpin signalname="XLXN_332(7:0)" name="WingType_mosi_BL(7:0)" />
            <blockpin signalname="XLXN_334(7:0)" name="WingType_mosi_AH(7:0)" />
            <blockpin signalname="XLXN_336(7:0)" name="WingType_mosi_AL(7:0)" />
            <blockpin signalname="XLXN_335(7:0)" name="WingType_miso_AL(7:0)" />
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
            <blockpin signalname="XLXN_330(7:0)" name="WingType_mosi_CL(7:0)" />
            <blockpin signalname="XLXN_329(7:0)" name="WingType_miso_CL(7:0)" />
            <blockpin signalname="XLXN_327(7:0)" name="WingType_miso_CH(7:0)" />
            <blockpin signalname="XLXN_328(7:0)" name="WingType_mosi_CH(7:0)" />
            <blockpin name="WING_DL0" />
            <blockpin name="WING_DL1" />
            <blockpin name="WING_DL2" />
            <blockpin name="WING_DL3" />
            <blockpin name="WING_DL4" />
            <blockpin name="WING_DL5" />
            <blockpin name="WING_DL6" />
            <blockpin name="WING_DL7" />
            <blockpin name="WING_DH0" />
            <blockpin name="WING_DH1" />
            <blockpin name="WING_DH2" />
            <blockpin name="WING_DH3" />
            <blockpin name="WING_DH4" />
            <blockpin name="WING_DH5" />
            <blockpin name="WING_DH6" />
            <blockpin name="WING_DH7" />
            <blockpin signalname="XLXN_326(7:0)" name="WingType_mosi_DL(7:0)" />
            <blockpin signalname="XLXN_449(7:0)" name="WingType_mosi_DH(7:0)" />
            <blockpin signalname="XLXN_448(7:0)" name="WingType_miso_DH(7:0)" />
            <blockpin signalname="XLXN_325(7:0)" name="WingType_miso_DL(7:0)" />
            <blockpin signalname="Arduino_7" name="WING_AL7" />
            <blockpin signalname="Arduino_6" name="WING_AL6" />
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
        <block symbolname="BENCHY_wb_SumpBlaze_LogicAnalyzer32" name="XLXI_60">
            <blockpin signalname="LA_Inputs(31:0)" name="la(31:0)" />
            <blockpin signalname="XLXN_600(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="XLXN_601(100:0)" name="wishbone_out(100:0)" />
            <blockpin signalname="XLXN_602(100:0)" name="wishbone_slot_video_in(100:0)" />
            <blockpin signalname="XLXN_603(100:0)" name="wishbone_slot_video_out(100:0)" />
        </block>
        <block symbolname="ibuf16" name="XLXI_61">
            <blockpin signalname="WD(15:0)" name="I(15:0)" />
            <blockpin signalname="LA_Inputs(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="ibuf16" name="XLXI_62">
            <blockpin signalname="WC(15:0)" name="I(15:0)" />
            <blockpin signalname="LA_Inputs(31:16)" name="O(15:0)" />
        </block>
        <block symbolname="pulldown" name="XLXI_65(15:0)">
            <blockpin signalname="WD(15:0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_66(15:0)">
            <blockpin signalname="WC(15:0)" name="O" />
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
        <instance x="336" y="752" name="XLXI_59" orien="R0">
        </instance>
        <text style="fontsize:28;fontname:Arial" x="112" y="3364">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="624" y1="3072" y2="3072" x1="592" />
        </branch>
        <instance x="368" y="3104" name="XLXI_48" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="368" y1="3072" y2="3072" x1="336" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="112" y="3396">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="20" y="3028" height="472" />
        <text style="fontsize:48;fontname:Arial" x="572" y="3464">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="624" y="3072" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="336" y="3072" name="DUO_SW1" orien="R180" />
        <branch name="Arduino_0">
            <wire x2="5152" y1="1232" y2="1232" x1="5120" />
        </branch>
        <branch name="Arduino_1">
            <wire x2="5152" y1="1264" y2="1264" x1="5120" />
        </branch>
        <branch name="Arduino_2">
            <wire x2="5152" y1="1296" y2="1296" x1="5120" />
        </branch>
        <branch name="Arduino_3">
            <wire x2="5152" y1="1328" y2="1328" x1="5120" />
        </branch>
        <branch name="Arduino_4">
            <wire x2="5152" y1="1360" y2="1360" x1="5120" />
        </branch>
        <branch name="Arduino_5">
            <wire x2="5152" y1="1392" y2="1392" x1="5120" />
        </branch>
        <branch name="Arduino_6">
            <wire x2="5152" y1="1424" y2="1424" x1="5120" />
        </branch>
        <branch name="Arduino_7">
            <wire x2="5152" y1="1456" y2="1456" x1="5120" />
        </branch>
        <branch name="Arduino_8">
            <wire x2="5152" y1="1520" y2="1520" x1="5120" />
        </branch>
        <branch name="Arduino_9">
            <wire x2="5152" y1="1552" y2="1552" x1="5120" />
        </branch>
        <branch name="Arduino_10">
            <wire x2="5152" y1="1584" y2="1584" x1="5120" />
        </branch>
        <branch name="Arduino_11">
            <wire x2="5152" y1="1616" y2="1616" x1="5120" />
        </branch>
        <branch name="Arduino_12">
            <wire x2="5152" y1="1648" y2="1648" x1="5120" />
        </branch>
        <branch name="Arduino_13">
            <wire x2="5152" y1="1680" y2="1680" x1="5120" />
        </branch>
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
        <branch name="XLXN_449(7:0)">
            <wire x2="4560" y1="3120" y2="3120" x1="4528" />
        </branch>
        <instance x="4304" y="3152" name="XLXI_41" orien="R0">
        </instance>
        <branch name="XLXN_448(7:0)">
            <wire x2="4560" y1="3056" y2="3056" x1="4528" />
        </branch>
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
        <instance x="4624" y="3344" name="XLXI_44" orien="R0">
        </instance>
        <iomarker fontsize="28" x="5152" y="1232" name="Arduino_0" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1264" name="Arduino_1" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1296" name="Arduino_2" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1328" name="Arduino_3" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1360" name="Arduino_4" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1392" name="Arduino_5" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1424" name="Arduino_6" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1456" name="Arduino_7" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1520" name="Arduino_8" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1552" name="Arduino_9" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1584" name="Arduino_10" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1616" name="Arduino_11" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1648" name="Arduino_12" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1680" name="Arduino_13" orien="R0" />
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
        <branch name="XLXN_600(100:0)">
            <wire x2="3840" y1="1024" y2="1264" x1="3840" />
            <wire x2="4096" y1="1024" y2="1024" x1="3840" />
            <wire x2="4096" y1="816" y2="1024" x1="4096" />
        </branch>
        <instance x="3744" y="1392" name="XLXI_60" orien="R0">
        </instance>
        <branch name="XLXN_601(100:0)">
            <wire x2="3856" y1="1040" y2="1264" x1="3856" />
            <wire x2="4112" y1="1040" y2="1040" x1="3856" />
            <wire x2="4112" y1="816" y2="1040" x1="4112" />
        </branch>
        <branch name="XLXN_602(100:0)">
            <wire x2="3952" y1="1056" y2="1264" x1="3952" />
            <wire x2="4208" y1="1056" y2="1056" x1="3952" />
            <wire x2="4208" y1="816" y2="1056" x1="4208" />
        </branch>
        <branch name="XLXN_603(100:0)">
            <wire x2="3968" y1="1072" y2="1264" x1="3968" />
            <wire x2="4224" y1="1072" y2="1072" x1="3968" />
            <wire x2="4224" y1="816" y2="1072" x1="4224" />
        </branch>
        <branch name="LA_Inputs(31:0)">
            <wire x2="3744" y1="1360" y2="1360" x1="3520" />
            <wire x2="3520" y1="1360" y2="1456" x1="3520" />
            <wire x2="3520" y1="1456" y2="1680" x1="3520" />
            <wire x2="3520" y1="1680" y2="1760" x1="3520" />
        </branch>
        <instance x="3168" y="1488" name="XLXI_61" orien="R0" />
        <instance x="3168" y="1712" name="XLXI_62" orien="R0" />
        <bustap x2="3424" y1="1456" y2="1456" x1="3520" />
        <branch name="LA_Inputs(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3408" y="1456" type="branch" />
            <wire x2="3408" y1="1456" y2="1456" x1="3392" />
            <wire x2="3424" y1="1456" y2="1456" x1="3408" />
        </branch>
        <bustap x2="3424" y1="1680" y2="1680" x1="3520" />
        <branch name="LA_Inputs(31:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3408" y="1680" type="branch" />
            <wire x2="3408" y1="1680" y2="1680" x1="3392" />
            <wire x2="3424" y1="1680" y2="1680" x1="3408" />
        </branch>
        <branch name="WD(15:0)">
            <wire x2="3072" y1="1456" y2="1456" x1="3008" />
            <wire x2="3088" y1="1456" y2="1456" x1="3072" />
            <wire x2="3152" y1="1456" y2="1456" x1="3088" />
            <wire x2="3168" y1="1456" y2="1456" x1="3152" />
        </branch>
        <branch name="WC(15:0)">
            <wire x2="3072" y1="1680" y2="1680" x1="3008" />
            <wire x2="3088" y1="1680" y2="1680" x1="3072" />
            <wire x2="3152" y1="1680" y2="1680" x1="3088" />
            <wire x2="3168" y1="1680" y2="1680" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3008" y="1456" name="WD(15:0)" orien="R180" />
        <iomarker fontsize="28" x="3008" y="1680" name="WC(15:0)" orien="R180" />
        <instance x="3008" y="1616" name="XLXI_65(15:0)" orien="R0" />
        <instance x="3008" y="1840" name="XLXI_66(15:0)" orien="R0" />
    </sheet>
</drawing>