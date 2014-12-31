<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ARD_RESET" />
        <signal name="DUO_SW1" />
        <signal name="Arduino_52" />
        <signal name="Arduino_50" />
        <signal name="Arduino_48" />
        <signal name="Arduino_46" />
        <signal name="Arduino_44" />
        <signal name="Arduino_42" />
        <signal name="Arduino_40" />
        <signal name="Arduino_38" />
        <signal name="Arduino_36" />
        <signal name="Arduino_34" />
        <signal name="Arduino_32" />
        <signal name="Arduino_30" />
        <signal name="Arduino_28" />
        <signal name="Arduino_26" />
        <signal name="Arduino_24" />
        <signal name="Arduino_22" />
        <signal name="Arduino_14" />
        <signal name="Arduino_15" />
        <signal name="Arduino_16" />
        <signal name="Arduino_17" />
        <signal name="Arduino_19" />
        <signal name="Arduino_20" />
        <signal name="Arduino_21" />
        <signal name="Arduino_13" />
        <signal name="Arduino_12" />
        <signal name="Arduino_11" />
        <signal name="Arduino_10" />
        <signal name="Arduino_9" />
        <signal name="Arduino_8" />
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_17" />
        <signal name="XLXN_20(7:0)" />
        <signal name="XLXN_20(7)" />
        <signal name="XLXN_20(6)" />
        <signal name="XLXN_20(5)" />
        <signal name="XLXN_20(4)" />
        <signal name="XLXN_20(3)" />
        <signal name="XLXN_20(2)" />
        <signal name="XLXN_20(1)" />
        <signal name="XLXN_20(0)" />
        <signal name="Arduino_39" />
        <signal name="Arduino_41" />
        <signal name="Arduino_43" />
        <signal name="Arduino_45" />
        <signal name="Arduino_47" />
        <signal name="Arduino_49" />
        <signal name="Arduino_51" />
        <signal name="Arduino_53" />
        <signal name="Arduino_37" />
        <signal name="Arduino_33" />
        <signal name="Arduino_31" />
        <signal name="Arduino_29" />
        <signal name="Arduino_27" />
        <signal name="Arduino_35" />
        <signal name="Arduino_18" />
        <signal name="Red(3:0)" />
        <signal name="Green(3:0)" />
        <signal name="Blue(3:0)" />
        <signal name="Red(3)" />
        <signal name="Red(2)" />
        <signal name="Red(1)" />
        <signal name="Red(0)" />
        <signal name="Green(3)" />
        <signal name="Green(2)" />
        <signal name="Green(1)" />
        <signal name="Green(0)" />
        <signal name="Blue(3)" />
        <signal name="Blue(2)" />
        <signal name="Blue(1)" />
        <signal name="Blue(0)" />
        <signal name="XLXN_21" />
        <signal name="CLK" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="DUO_SW1" />
        <port polarity="BiDirectional" name="Arduino_52" />
        <port polarity="BiDirectional" name="Arduino_50" />
        <port polarity="BiDirectional" name="Arduino_48" />
        <port polarity="BiDirectional" name="Arduino_46" />
        <port polarity="BiDirectional" name="Arduino_44" />
        <port polarity="BiDirectional" name="Arduino_42" />
        <port polarity="BiDirectional" name="Arduino_40" />
        <port polarity="BiDirectional" name="Arduino_38" />
        <port polarity="BiDirectional" name="Arduino_36" />
        <port polarity="BiDirectional" name="Arduino_34" />
        <port polarity="BiDirectional" name="Arduino_32" />
        <port polarity="BiDirectional" name="Arduino_30" />
        <port polarity="BiDirectional" name="Arduino_28" />
        <port polarity="BiDirectional" name="Arduino_26" />
        <port polarity="BiDirectional" name="Arduino_24" />
        <port polarity="BiDirectional" name="Arduino_22" />
        <port polarity="BiDirectional" name="Arduino_14" />
        <port polarity="BiDirectional" name="Arduino_15" />
        <port polarity="BiDirectional" name="Arduino_16" />
        <port polarity="BiDirectional" name="Arduino_17" />
        <port polarity="BiDirectional" name="Arduino_19" />
        <port polarity="BiDirectional" name="Arduino_20" />
        <port polarity="BiDirectional" name="Arduino_21" />
        <port polarity="BiDirectional" name="Arduino_13" />
        <port polarity="BiDirectional" name="Arduino_12" />
        <port polarity="BiDirectional" name="Arduino_11" />
        <port polarity="BiDirectional" name="Arduino_10" />
        <port polarity="BiDirectional" name="Arduino_9" />
        <port polarity="BiDirectional" name="Arduino_8" />
        <port polarity="Input" name="Arduino_39" />
        <port polarity="Input" name="Arduino_41" />
        <port polarity="Input" name="Arduino_43" />
        <port polarity="Input" name="Arduino_45" />
        <port polarity="Input" name="Arduino_47" />
        <port polarity="Input" name="Arduino_49" />
        <port polarity="Input" name="Arduino_51" />
        <port polarity="Input" name="Arduino_53" />
        <port polarity="Output" name="Arduino_37" />
        <port polarity="Input" name="Arduino_33" />
        <port polarity="Input" name="Arduino_31" />
        <port polarity="Output" name="Arduino_29" />
        <port polarity="BiDirectional" name="Arduino_27" />
        <port polarity="Input" name="Arduino_35" />
        <port polarity="Input" name="Arduino_18" />
        <port polarity="Input" name="CLK" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="OV_Camera_FrameBuffer">
            <timestamp>2014-12-29T17:44:55</timestamp>
            <rect width="432" x="64" y="-720" height="772" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="496" y1="-660" y2="-660" x1="64" />
            <line x2="560" y1="-592" y2="-592" x1="496" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="560" y1="-480" y2="-480" x1="496" />
            <line x2="560" y1="-416" y2="-416" x1="496" />
            <line x2="560" y1="-352" y2="-352" x1="496" />
            <line x2="560" y1="-544" y2="-544" x1="496" />
            <line x2="496" y1="-328" y2="-328" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="560" y1="-272" y2="-272" x1="496" />
            <line x2="560" y1="-256" y2="-256" x1="496" />
            <rect width="64" x="496" y="-252" height="24" />
            <line x2="560" y1="-240" y2="-240" x1="496" />
            <rect width="64" x="496" y="-188" height="24" />
            <line x2="560" y1="-176" y2="-176" x1="496" />
            <rect width="64" x="496" y="-124" height="24" />
            <line x2="560" y1="-112" y2="-112" x1="496" />
            <line x2="496" y1="-40" y2="-40" x1="64" />
            <rect width="64" x="496" y="20" height="24" />
            <line x2="560" y1="32" y2="32" x1="496" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-704" y2="-704" x1="64" />
        </blockdef>
        <blockdef name="Computing_Shield_Pinout">
            <timestamp>2014-12-26T23:40:30</timestamp>
            <rect width="432" x="64" y="-2176" height="2104" />
            <rect width="188" x="308" y="-1820" height="272" />
            <line x2="60" y1="-2144" y2="-2144" x1="0" />
            <line x2="64" y1="-2128" y2="-2128" x1="0" />
            <line x2="560" y1="-2080" y2="-2080" x1="496" />
            <line x2="560" y1="-2048" y2="-2048" x1="496" />
            <line x2="560" y1="-2016" y2="-2016" x1="496" />
            <line x2="560" y1="-1984" y2="-1984" x1="496" />
            <line x2="560" y1="-1952" y2="-1952" x1="496" />
            <line x2="560" y1="-1920" y2="-1920" x1="496" />
            <line x2="560" y1="-1888" y2="-1888" x1="496" />
            <line x2="560" y1="-1856" y2="-1856" x1="496" />
            <line x2="560" y1="-1760" y2="-1760" x1="496" />
            <line x2="560" y1="-1728" y2="-1728" x1="496" />
            <line x2="560" y1="-1696" y2="-1696" x1="496" />
            <line x2="560" y1="-1664" y2="-1664" x1="496" />
            <line x2="560" y1="-1632" y2="-1632" x1="496" />
            <line x2="496" y1="-1792" y2="-1792" x1="560" />
            <rect width="208" x="64" y="-1992" height="244" />
            <line x2="0" y1="-1824" y2="-1824" x1="64" />
            <line x2="0" y1="-1840" y2="-1840" x1="64" />
            <line x2="0" y1="-1856" y2="-1856" x1="64" />
            <line x2="0" y1="-1888" y2="-1888" x1="64" />
            <line x2="0" y1="-1904" y2="-1904" x1="64" />
            <line x2="0" y1="-1920" y2="-1920" x1="64" />
            <line x2="0" y1="-1968" y2="-1968" x1="64" />
            <line x2="0" y1="-1952" y2="-1952" x1="64" />
            <line x2="0" y1="-624" y2="-624" x1="64" />
            <rect width="188" x="308" y="-2108" height="276" />
            <rect width="188" x="308" y="-1244" height="276" />
            <line x2="560" y1="-1216" y2="-1216" x1="496" />
            <line x2="560" y1="-1184" y2="-1184" x1="496" />
            <line x2="560" y1="-1152" y2="-1152" x1="496" />
            <line x2="560" y1="-1120" y2="-1120" x1="496" />
            <line x2="560" y1="-1088" y2="-1088" x1="496" />
            <line x2="560" y1="-1056" y2="-1056" x1="496" />
            <line x2="560" y1="-1024" y2="-1024" x1="496" />
            <line x2="560" y1="-992" y2="-992" x1="496" />
            <line x2="560" y1="-928" y2="-928" x1="496" />
            <line x2="560" y1="-896" y2="-896" x1="496" />
            <line x2="560" y1="-864" y2="-864" x1="496" />
            <line x2="560" y1="-832" y2="-832" x1="496" />
            <line x2="560" y1="-800" y2="-800" x1="496" />
            <line x2="560" y1="-768" y2="-768" x1="496" />
            <line x2="560" y1="-736" y2="-736" x1="496" />
            <line x2="560" y1="-704" y2="-704" x1="496" />
            <rect width="188" x="308" y="-380" height="276" />
            <rect width="188" x="308" y="-956" height="276" />
            <rect width="188" x="308" y="-668" height="276" />
            <rect width="164" x="64" y="-648" height="112" />
            <rect width="188" x="308" y="-1536" height="280" />
            <rect width="164" x="64" y="-488" height="112" />
            <rect width="184" x="64" y="-1196" height="180" />
            <line x2="0" y1="-1104" y2="-1104" x1="64" />
            <line x2="0" y1="-1168" y2="-1168" x1="64" />
            <line x2="0" y1="-848" y2="-848" x1="64" />
            <line x2="0" y1="-784" y2="-784" x1="64" />
            <rect width="184" x="64" y="-876" height="124" />
            <line x2="0" y1="-1040" y2="-1040" x1="64" />
            <line x2="0" y1="-560" y2="-560" x1="64" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <line x2="560" y1="-1504" y2="-1504" x1="496" />
            <line x2="560" y1="-1472" y2="-1472" x1="496" />
            <line x2="560" y1="-1440" y2="-1440" x1="496" />
            <line x2="560" y1="-1408" y2="-1408" x1="496" />
            <line x2="560" y1="-1376" y2="-1376" x1="496" />
            <line x2="560" y1="-1344" y2="-1344" x1="496" />
            <line x2="560" y1="-1312" y2="-1312" x1="496" />
            <line x2="560" y1="-1280" y2="-1280" x1="496" />
            <line x2="560" y1="-640" y2="-640" x1="496" />
            <line x2="560" y1="-608" y2="-608" x1="496" />
            <line x2="560" y1="-576" y2="-576" x1="496" />
            <line x2="560" y1="-544" y2="-544" x1="496" />
            <line x2="560" y1="-512" y2="-512" x1="496" />
            <line x2="560" y1="-480" y2="-480" x1="496" />
            <line x2="560" y1="-448" y2="-448" x1="496" />
            <line x2="560" y1="-416" y2="-416" x1="496" />
            <line x2="560" y1="-352" y2="-352" x1="496" />
            <line x2="560" y1="-320" y2="-320" x1="496" />
            <line x2="560" y1="-288" y2="-288" x1="496" />
            <line x2="560" y1="-256" y2="-256" x1="496" />
            <line x2="560" y1="-224" y2="-224" x1="496" />
            <line x2="560" y1="-192" y2="-192" x1="496" />
            <line x2="560" y1="-160" y2="-160" x1="496" />
            <line x2="560" y1="-128" y2="-128" x1="496" />
            <line x2="0" y1="-1760" y2="-1760" x1="64" />
            <line x2="0" y1="-1776" y2="-1776" x1="64" />
            <line x2="0" y1="-1712" y2="-1712" x1="64" />
            <line x2="0" y1="-1936" y2="-1936" x1="64" />
            <line x2="0" y1="-1872" y2="-1872" x1="64" />
            <line x2="0" y1="-1808" y2="-1808" x1="64" />
            <line x2="0" y1="-1792" y2="-1792" x1="64" />
            <rect width="208" x="64" y="-1728" height="32" />
        </blockdef>
        <blockdef name="clk_32to50_dcm">
            <timestamp>2014-12-26T23:40:29</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <blockdef name="clk_32to25_dcm">
            <timestamp>2014-12-26T23:40:29</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="inv" name="XLXI_60">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="OV_Camera_FrameBuffer" name="XLXI_61">
            <blockpin signalname="XLXN_17" name="clk_50Mhz" />
            <blockpin signalname="Arduino_29" name="OV7670_SIOC" />
            <blockpin signalname="Arduino_33" name="OV7670_VSYNC" />
            <blockpin signalname="XLXN_20(7:0)" name="OV7670_D(7:0)" />
            <blockpin name="OV7670_RESET" />
            <blockpin name="OV7670_PWDN" />
            <blockpin signalname="Arduino_37" name="OV7670_XCLK" />
            <blockpin signalname="Arduino_27" name="OV7670_SIOD" />
            <blockpin signalname="Arduino_31" name="OV7670_HREF" />
            <blockpin signalname="Arduino_35" name="OV7670_PCLK" />
            <blockpin signalname="XLXN_1" name="vga_hsync" />
            <blockpin signalname="XLXN_2" name="vga_vsync" />
            <blockpin signalname="Red(3:0)" name="vga_red(3:0)" />
            <blockpin signalname="Green(3:0)" name="vga_green(3:0)" />
            <blockpin signalname="Blue(3:0)" name="vga_blue(3:0)" />
            <blockpin name="LED(7:0)" />
            <blockpin signalname="Arduino_18" name="btn" />
            <blockpin signalname="XLXN_21" name="clk_25Mhz" />
        </block>
        <block symbolname="Computing_Shield_Pinout" name="XLXI_62">
            <blockpin name="gpio_bus_out(200:0)" />
            <blockpin name="gpio_bus_in(200:0)" />
            <blockpin name="WING_AL0" />
            <blockpin name="WING_AL1" />
            <blockpin name="WING_AL2" />
            <blockpin name="WING_AL3" />
            <blockpin name="WING_AL4" />
            <blockpin name="WING_AL5" />
            <blockpin name="WING_AL6" />
            <blockpin name="WING_AL7" />
            <blockpin signalname="Arduino_8" name="WING_AH0" />
            <blockpin signalname="Arduino_9" name="WING_AH1" />
            <blockpin signalname="Arduino_10" name="WING_AH2" />
            <blockpin signalname="Arduino_11" name="WING_AH3" />
            <blockpin signalname="Arduino_12" name="WING_AH4" />
            <blockpin signalname="Arduino_13" name="WING_AH5" />
            <blockpin signalname="Red(2)" name="VGA_Red2" />
            <blockpin signalname="Red(1)" name="VGA_Red1" />
            <blockpin signalname="Red(0)" name="VGA_Red0" />
            <blockpin signalname="Green(2)" name="VGA_Green2" />
            <blockpin signalname="Green(1)" name="VGA_Green1" />
            <blockpin signalname="Green(0)" name="VGA_Green0" />
            <blockpin signalname="XLXN_1" name="VGA_Hsync" />
            <blockpin signalname="XLXN_2" name="VGA_Vsync" />
            <blockpin name="Audio1_Left" />
            <blockpin signalname="Arduino_22" name="WING_CL0" />
            <blockpin signalname="Arduino_24" name="WING_CL1" />
            <blockpin signalname="Arduino_26" name="WING_CL2" />
            <blockpin signalname="Arduino_28" name="WING_CL3" />
            <blockpin signalname="Arduino_30" name="WING_CL4" />
            <blockpin signalname="Arduino_32" name="WING_CL5" />
            <blockpin signalname="Arduino_34" name="WING_CL6" />
            <blockpin signalname="Arduino_36" name="WING_CL7" />
            <blockpin signalname="Arduino_38" name="WING_CH0" />
            <blockpin signalname="Arduino_40" name="WING_CH1" />
            <blockpin signalname="Arduino_42" name="WING_CH2" />
            <blockpin signalname="Arduino_44" name="WING_CH3" />
            <blockpin signalname="Arduino_46" name="WING_CH4" />
            <blockpin signalname="Arduino_48" name="WING_CH5" />
            <blockpin signalname="Arduino_50" name="WING_CH6" />
            <blockpin signalname="Arduino_52" name="WING_CH7" />
            <blockpin name="SD_MISO" />
            <blockpin name="SD_MOSI" />
            <blockpin name="RS232_RX" />
            <blockpin name="RS232_TX" />
            <blockpin name="SD_SCK" />
            <blockpin name="Audio1_Right" />
            <blockpin name="Audio2_Right" />
            <blockpin name="Audio2_Left" />
            <blockpin signalname="Arduino_21" name="WING_BL0" />
            <blockpin signalname="Arduino_20" name="WING_BL1" />
            <blockpin signalname="Arduino_19" name="WING_BL2" />
            <blockpin name="WING_BL3" />
            <blockpin signalname="Arduino_17" name="WING_BL4" />
            <blockpin signalname="Arduino_16" name="WING_BL5" />
            <blockpin signalname="Arduino_15" name="WING_BL6" />
            <blockpin signalname="Arduino_14" name="WING_BL7" />
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
            <blockpin signalname="Red(3)" name="VGA_Red3" />
            <blockpin signalname="Green(3)" name="VGA_Green3" />
            <blockpin signalname="Blue(3)" name="VGA_Blue3" />
            <blockpin signalname="Blue(1)" name="VGA_Blue1" />
            <blockpin signalname="Blue(0)" name="VGA_Blue0" />
            <blockpin signalname="Blue(2)" name="VGA_Blue2" />
            <blockpin name="VGA_Bus(32:0)" />
        </block>
        <block symbolname="clk_32to50_dcm" name="XLXI_63">
            <blockpin signalname="CLK" name="CLK_IN1" />
            <blockpin signalname="XLXN_17" name="CLK_OUT1" />
        </block>
        <block symbolname="ibuf4" name="XLXI_65">
            <blockpin signalname="Arduino_39" name="I0" />
            <blockpin signalname="Arduino_41" name="I1" />
            <blockpin signalname="Arduino_43" name="I2" />
            <blockpin signalname="Arduino_45" name="I3" />
            <blockpin signalname="XLXN_20(7)" name="O0" />
            <blockpin signalname="XLXN_20(6)" name="O1" />
            <blockpin signalname="XLXN_20(5)" name="O2" />
            <blockpin signalname="XLXN_20(4)" name="O3" />
        </block>
        <block symbolname="ibuf4" name="XLXI_66">
            <blockpin signalname="Arduino_47" name="I0" />
            <blockpin signalname="Arduino_49" name="I1" />
            <blockpin signalname="Arduino_51" name="I2" />
            <blockpin signalname="Arduino_53" name="I3" />
            <blockpin signalname="XLXN_20(3)" name="O0" />
            <blockpin signalname="XLXN_20(2)" name="O1" />
            <blockpin signalname="XLXN_20(1)" name="O2" />
            <blockpin signalname="XLXN_20(0)" name="O3" />
        </block>
        <block symbolname="clk_32to25_dcm" name="XLXI_67">
            <blockpin signalname="CLK" name="CLK_IN1" />
            <blockpin signalname="XLXN_21" name="CLK_OUT1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <text style="fontsize:28;fontname:Arial" x="137" y="3370">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="656" y1="3072" y2="3072" x1="624" />
        </branch>
        <instance x="400" y="3104" name="XLXI_60" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="400" y1="3072" y2="3072" x1="368" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="137" y="3402">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="45" y="3034" height="472" />
        <text style="fontsize:48;fontname:Arial" x="597" y="3470">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="656" y="3072" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="368" y="3072" name="DUO_SW1" orien="R180" />
        <branch name="Arduino_52">
            <wire x2="3856" y1="2384" y2="2384" x1="3824" />
        </branch>
        <branch name="Arduino_50">
            <wire x2="3856" y1="2352" y2="2352" x1="3824" />
        </branch>
        <branch name="Arduino_48">
            <wire x2="3856" y1="2320" y2="2320" x1="3824" />
        </branch>
        <branch name="Arduino_46">
            <wire x2="3856" y1="2288" y2="2288" x1="3824" />
        </branch>
        <branch name="Arduino_44">
            <wire x2="3856" y1="2256" y2="2256" x1="3824" />
        </branch>
        <branch name="Arduino_42">
            <wire x2="3856" y1="2224" y2="2224" x1="3824" />
        </branch>
        <branch name="Arduino_40">
            <wire x2="3856" y1="2192" y2="2192" x1="3824" />
        </branch>
        <branch name="Arduino_38">
            <wire x2="3856" y1="2160" y2="2160" x1="3824" />
        </branch>
        <branch name="Arduino_36">
            <wire x2="3856" y1="2096" y2="2096" x1="3824" />
        </branch>
        <branch name="Arduino_34">
            <wire x2="3856" y1="2064" y2="2064" x1="3824" />
        </branch>
        <branch name="Arduino_32">
            <wire x2="3856" y1="2032" y2="2032" x1="3824" />
        </branch>
        <branch name="Arduino_30">
            <wire x2="3856" y1="2000" y2="2000" x1="3824" />
        </branch>
        <branch name="Arduino_28">
            <wire x2="3856" y1="1968" y2="1968" x1="3824" />
        </branch>
        <branch name="Arduino_26">
            <wire x2="3856" y1="1936" y2="1936" x1="3824" />
        </branch>
        <branch name="Arduino_24">
            <wire x2="3856" y1="1904" y2="1904" x1="3824" />
        </branch>
        <branch name="Arduino_22">
            <wire x2="3856" y1="1872" y2="1872" x1="3824" />
        </branch>
        <branch name="Arduino_14">
            <wire x2="3856" y1="1808" y2="1808" x1="3824" />
        </branch>
        <branch name="Arduino_15">
            <wire x2="3856" y1="1776" y2="1776" x1="3824" />
        </branch>
        <branch name="Arduino_16">
            <wire x2="3856" y1="1744" y2="1744" x1="3824" />
        </branch>
        <branch name="Arduino_17">
            <wire x2="3856" y1="1712" y2="1712" x1="3824" />
        </branch>
        <branch name="Arduino_19">
            <wire x2="3856" y1="1648" y2="1648" x1="3824" />
        </branch>
        <branch name="Arduino_20">
            <wire x2="3856" y1="1616" y2="1616" x1="3824" />
        </branch>
        <branch name="Arduino_21">
            <wire x2="3856" y1="1584" y2="1584" x1="3824" />
        </branch>
        <branch name="Arduino_13">
            <wire x2="3856" y1="1456" y2="1456" x1="3824" />
        </branch>
        <branch name="Arduino_12">
            <wire x2="3856" y1="1424" y2="1424" x1="3824" />
        </branch>
        <branch name="Arduino_11">
            <wire x2="3856" y1="1392" y2="1392" x1="3824" />
        </branch>
        <branch name="Arduino_10">
            <wire x2="3856" y1="1360" y2="1360" x1="3824" />
        </branch>
        <branch name="Arduino_9">
            <wire x2="3856" y1="1328" y2="1328" x1="3824" />
        </branch>
        <branch name="Arduino_8">
            <wire x2="3856" y1="1296" y2="1296" x1="3824" />
        </branch>
        <iomarker fontsize="28" x="3856" y="2384" name="Arduino_52" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2352" name="Arduino_50" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2320" name="Arduino_48" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2288" name="Arduino_46" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2256" name="Arduino_44" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2224" name="Arduino_42" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2192" name="Arduino_40" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2160" name="Arduino_38" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2096" name="Arduino_36" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2064" name="Arduino_34" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2032" name="Arduino_32" orien="R0" />
        <iomarker fontsize="28" x="3856" y="2000" name="Arduino_30" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1968" name="Arduino_28" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1936" name="Arduino_26" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1904" name="Arduino_24" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1872" name="Arduino_22" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1808" name="Arduino_14" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1776" name="Arduino_15" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1744" name="Arduino_16" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1712" name="Arduino_17" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1648" name="Arduino_19" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1616" name="Arduino_20" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1584" name="Arduino_21" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1456" name="Arduino_13" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1424" name="Arduino_12" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1392" name="Arduino_11" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1360" name="Arduino_10" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1328" name="Arduino_9" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1296" name="Arduino_8" orien="R0" />
        <instance x="3264" y="3088" name="XLXI_62" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="3248" y1="1120" y2="1120" x1="2672" />
            <wire x2="3264" y1="1120" y2="1120" x1="3248" />
        </branch>
        <instance x="2112" y="1392" name="XLXI_61" orien="R0">
        </instance>
        <branch name="XLXN_2">
            <wire x2="3248" y1="1136" y2="1136" x1="2672" />
            <wire x2="3264" y1="1136" y2="1136" x1="3248" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1936" y1="720" y2="720" x1="1920" />
            <wire x2="2096" y1="720" y2="720" x1="1936" />
            <wire x2="2112" y1="720" y2="720" x1="2096" />
        </branch>
        <instance x="1536" y="752" name="XLXI_63" orien="R0">
        </instance>
        <branch name="XLXN_20(7:0)">
            <wire x2="2112" y1="976" y2="976" x1="1872" />
            <wire x2="1872" y1="976" y2="992" x1="1872" />
            <wire x2="1872" y1="992" y2="1056" x1="1872" />
            <wire x2="1872" y1="1056" y2="1120" x1="1872" />
            <wire x2="1872" y1="1120" y2="1184" x1="1872" />
            <wire x2="1872" y1="1184" y2="1248" x1="1872" />
            <wire x2="1872" y1="1248" y2="1312" x1="1872" />
            <wire x2="1872" y1="1312" y2="1376" x1="1872" />
            <wire x2="1872" y1="1376" y2="1440" x1="1872" />
            <wire x2="1872" y1="1440" y2="1456" x1="1872" />
        </branch>
        <instance x="1344" y="1216" name="XLXI_65" orien="R0" />
        <instance x="1344" y="1472" name="XLXI_66" orien="R0" />
        <bustap x2="1776" y1="992" y2="992" x1="1872" />
        <branch name="XLXN_20(7)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="992" type="branch" />
            <wire x2="1680" y1="992" y2="992" x1="1568" />
            <wire x2="1776" y1="992" y2="992" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1056" y2="1056" x1="1872" />
        <branch name="XLXN_20(6)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1056" type="branch" />
            <wire x2="1680" y1="1056" y2="1056" x1="1568" />
            <wire x2="1776" y1="1056" y2="1056" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1120" y2="1120" x1="1872" />
        <branch name="XLXN_20(5)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1120" type="branch" />
            <wire x2="1680" y1="1120" y2="1120" x1="1568" />
            <wire x2="1776" y1="1120" y2="1120" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1184" y2="1184" x1="1872" />
        <branch name="XLXN_20(4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1184" type="branch" />
            <wire x2="1680" y1="1184" y2="1184" x1="1568" />
            <wire x2="1776" y1="1184" y2="1184" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1248" y2="1248" x1="1872" />
        <branch name="XLXN_20(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1248" type="branch" />
            <wire x2="1680" y1="1248" y2="1248" x1="1568" />
            <wire x2="1776" y1="1248" y2="1248" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1312" y2="1312" x1="1872" />
        <branch name="XLXN_20(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1312" type="branch" />
            <wire x2="1680" y1="1312" y2="1312" x1="1568" />
            <wire x2="1776" y1="1312" y2="1312" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1376" y2="1376" x1="1872" />
        <branch name="XLXN_20(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1376" type="branch" />
            <wire x2="1680" y1="1376" y2="1376" x1="1568" />
            <wire x2="1776" y1="1376" y2="1376" x1="1680" />
        </branch>
        <bustap x2="1776" y1="1440" y2="1440" x1="1872" />
        <branch name="XLXN_20(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1672" y="1440" type="branch" />
            <wire x2="1680" y1="1440" y2="1440" x1="1568" />
            <wire x2="1776" y1="1440" y2="1440" x1="1680" />
        </branch>
        <branch name="Arduino_39">
            <wire x2="1344" y1="992" y2="992" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="992" name="Arduino_39" orien="R180" />
        <branch name="Arduino_41">
            <wire x2="1344" y1="1056" y2="1056" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1056" name="Arduino_41" orien="R180" />
        <branch name="Arduino_43">
            <wire x2="1344" y1="1120" y2="1120" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1120" name="Arduino_43" orien="R180" />
        <branch name="Arduino_45">
            <wire x2="1344" y1="1184" y2="1184" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1184" name="Arduino_45" orien="R180" />
        <branch name="Arduino_47">
            <wire x2="1344" y1="1248" y2="1248" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1248" name="Arduino_47" orien="R180" />
        <branch name="Arduino_49">
            <wire x2="1344" y1="1312" y2="1312" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1312" name="Arduino_49" orien="R180" />
        <branch name="Arduino_51">
            <wire x2="1344" y1="1376" y2="1376" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1376" name="Arduino_51" orien="R180" />
        <branch name="Arduino_53">
            <wire x2="1344" y1="1440" y2="1440" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1440" name="Arduino_53" orien="R180" />
        <branch name="Arduino_37">
            <wire x2="2688" y1="1040" y2="1040" x1="2672" />
            <wire x2="2704" y1="1040" y2="1040" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2704" y="1040" name="Arduino_37" orien="R0" />
        <branch name="Arduino_33">
            <wire x2="2096" y1="800" y2="800" x1="2080" />
            <wire x2="2112" y1="800" y2="800" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="2080" y="800" name="Arduino_33" orien="R180" />
        <branch name="Arduino_31">
            <wire x2="2096" y1="848" y2="848" x1="2080" />
            <wire x2="2112" y1="848" y2="848" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="2080" y="848" name="Arduino_31" orien="R180" />
        <branch name="Arduino_29">
            <wire x2="2688" y1="800" y2="800" x1="2672" />
            <wire x2="2704" y1="800" y2="800" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2704" y="800" name="Arduino_29" orien="R0" />
        <branch name="Arduino_27">
            <wire x2="2688" y1="848" y2="848" x1="2672" />
            <wire x2="2704" y1="848" y2="848" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2704" y="848" name="Arduino_27" orien="R0" />
        <branch name="Arduino_35">
            <wire x2="2064" y1="912" y2="912" x1="2048" />
            <wire x2="2080" y1="912" y2="912" x1="2064" />
            <wire x2="2112" y1="912" y2="912" x1="2080" />
        </branch>
        <iomarker fontsize="28" x="2048" y="912" name="Arduino_35" orien="R180" />
        <branch name="Arduino_18">
            <wire x2="2096" y1="1424" y2="1424" x1="2080" />
            <wire x2="2112" y1="1424" y2="1424" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="2080" y="1424" name="Arduino_18" orien="R180" />
        <branch name="Red(3:0)">
            <wire x2="3088" y1="1152" y2="1152" x1="2672" />
            <wire x2="3088" y1="1152" y2="1168" x1="3088" />
            <wire x2="3088" y1="1168" y2="1184" x1="3088" />
            <wire x2="3088" y1="1184" y2="1200" x1="3088" />
        </branch>
        <branch name="Green(3:0)">
            <wire x2="2960" y1="1216" y2="1216" x1="2672" />
            <wire x2="2960" y1="1216" y2="1232" x1="2960" />
            <wire x2="2960" y1="1232" y2="1248" x1="2960" />
            <wire x2="2960" y1="1248" y2="1264" x1="2960" />
        </branch>
        <branch name="Blue(3:0)">
            <wire x2="2848" y1="1280" y2="1280" x1="2672" />
            <wire x2="2848" y1="1280" y2="1296" x1="2848" />
            <wire x2="2848" y1="1296" y2="1312" x1="2848" />
            <wire x2="2848" y1="1312" y2="1328" x1="2848" />
        </branch>
        <bustap x2="3184" y1="1152" y2="1152" x1="3088" />
        <branch name="Red(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3224" y="1152" type="branch" />
            <wire x2="3232" y1="1152" y2="1152" x1="3184" />
            <wire x2="3264" y1="1152" y2="1152" x1="3232" />
        </branch>
        <bustap x2="3184" y1="1168" y2="1168" x1="3088" />
        <branch name="Red(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3224" y="1168" type="branch" />
            <wire x2="3232" y1="1168" y2="1168" x1="3184" />
            <wire x2="3264" y1="1168" y2="1168" x1="3232" />
        </branch>
        <bustap x2="3184" y1="1184" y2="1184" x1="3088" />
        <branch name="Red(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3224" y="1184" type="branch" />
            <wire x2="3232" y1="1184" y2="1184" x1="3184" />
            <wire x2="3264" y1="1184" y2="1184" x1="3232" />
        </branch>
        <bustap x2="3184" y1="1200" y2="1200" x1="3088" />
        <branch name="Red(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3224" y="1200" type="branch" />
            <wire x2="3232" y1="1200" y2="1200" x1="3184" />
            <wire x2="3264" y1="1200" y2="1200" x1="3232" />
        </branch>
        <bustap x2="3056" y1="1216" y2="1216" x1="2960" />
        <branch name="Green(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3160" y="1216" type="branch" />
            <wire x2="3168" y1="1216" y2="1216" x1="3056" />
            <wire x2="3264" y1="1216" y2="1216" x1="3168" />
        </branch>
        <bustap x2="3056" y1="1232" y2="1232" x1="2960" />
        <branch name="Green(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3160" y="1232" type="branch" />
            <wire x2="3168" y1="1232" y2="1232" x1="3056" />
            <wire x2="3264" y1="1232" y2="1232" x1="3168" />
        </branch>
        <bustap x2="3056" y1="1248" y2="1248" x1="2960" />
        <branch name="Green(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3160" y="1248" type="branch" />
            <wire x2="3168" y1="1248" y2="1248" x1="3056" />
            <wire x2="3264" y1="1248" y2="1248" x1="3168" />
        </branch>
        <bustap x2="3056" y1="1264" y2="1264" x1="2960" />
        <branch name="Green(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3160" y="1264" type="branch" />
            <wire x2="3168" y1="1264" y2="1264" x1="3056" />
            <wire x2="3264" y1="1264" y2="1264" x1="3168" />
        </branch>
        <bustap x2="2944" y1="1280" y2="1280" x1="2848" />
        <branch name="Blue(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3104" y="1280" type="branch" />
            <wire x2="3104" y1="1280" y2="1280" x1="2944" />
            <wire x2="3264" y1="1280" y2="1280" x1="3104" />
        </branch>
        <bustap x2="2944" y1="1296" y2="1296" x1="2848" />
        <branch name="Blue(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3104" y="1296" type="branch" />
            <wire x2="3104" y1="1296" y2="1296" x1="2944" />
            <wire x2="3264" y1="1296" y2="1296" x1="3104" />
        </branch>
        <bustap x2="2944" y1="1312" y2="1312" x1="2848" />
        <branch name="Blue(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3104" y="1312" type="branch" />
            <wire x2="3104" y1="1312" y2="1312" x1="2944" />
            <wire x2="3264" y1="1312" y2="1312" x1="3104" />
        </branch>
        <bustap x2="2944" y1="1328" y2="1328" x1="2848" />
        <branch name="Blue(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3104" y="1328" type="branch" />
            <wire x2="3104" y1="1328" y2="1328" x1="2944" />
            <wire x2="3264" y1="1328" y2="1328" x1="3104" />
        </branch>
        <instance x="1536" y="608" name="XLXI_67" orien="R0">
        </instance>
        <branch name="XLXN_21">
            <wire x2="2016" y1="576" y2="576" x1="1920" />
            <wire x2="2016" y1="576" y2="688" x1="2016" />
            <wire x2="2112" y1="688" y2="688" x1="2016" />
        </branch>
        <branch name="CLK">
            <wire x2="1152" y1="640" y2="640" x1="1120" />
            <wire x2="1376" y1="640" y2="640" x1="1152" />
            <wire x2="1456" y1="640" y2="640" x1="1376" />
            <wire x2="1456" y1="640" y2="720" x1="1456" />
            <wire x2="1536" y1="720" y2="720" x1="1456" />
            <wire x2="1456" y1="576" y2="640" x1="1456" />
            <wire x2="1536" y1="576" y2="576" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="1120" y="640" name="CLK" orien="R180" />
    </sheet>
</drawing>