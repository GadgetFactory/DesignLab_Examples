<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="MISC_zpuino_sa_splitter2">
            <timestamp>2014-10-30T17:41:27</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MISC_zpuino_sa_splitter4">
            <timestamp>2014-10-30T17:41:48</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MISC_zpuino_wb_SevenSeg">
            <timestamp>2014-10-30T17:42:45</timestamp>
            <rect width="176" x="64" y="-256" height="256" />
            <rect width="64" x="240" y="-172" height="24" />
            <line x2="304" y1="-160" y2="-160" x1="240" />
            <rect width="64" x="240" y="-108" height="24" />
            <line x2="304" y1="-96" y2="-96" x1="240" />
            <rect width="64" x="240" y="-44" height="24" />
            <line x2="304" y1="-32" y2="-32" x1="240" />
            <line x2="304" y1="-224" y2="-224" x1="240" />
            <line x2="144" y1="-304" y2="-256" x1="144" />
            <line x2="160" y1="-304" y2="-256" x1="160" />
        </blockdef>
        <blockdef name="AUDIO_zpuino_wb_passthrough">
            <timestamp>2014-11-10T23:34:35</timestamp>
            <rect width="176" x="64" y="-64" height="64" />
            <rect width="64" x="240" y="-44" height="24" />
            <line x2="304" y1="-32" y2="-32" x1="240" />
            <line x2="144" y1="-112" y2="-64" x1="144" />
            <line x2="160" y1="-112" y2="-64" x1="160" />
        </blockdef>
        <blockdef name="Wishbone_to_Registers">
            <timestamp>2015-3-30T19:52:8</timestamp>
            <rect width="432" x="64" y="-640" height="640" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="496" y="-620" height="24" />
            <line x2="560" y1="-608" y2="-608" x1="496" />
            <rect width="64" x="496" y="-556" height="24" />
            <line x2="560" y1="-544" y2="-544" x1="496" />
            <rect width="64" x="496" y="-492" height="24" />
            <line x2="560" y1="-480" y2="-480" x1="496" />
            <rect width="64" x="496" y="-428" height="24" />
            <line x2="560" y1="-416" y2="-416" x1="496" />
            <rect width="64" x="496" y="-364" height="24" />
            <line x2="560" y1="-352" y2="-352" x1="496" />
            <rect width="64" x="496" y="-300" height="24" />
            <line x2="560" y1="-288" y2="-288" x1="496" />
            <rect width="64" x="496" y="-236" height="24" />
            <line x2="560" y1="-224" y2="-224" x1="496" />
            <rect width="64" x="496" y="-172" height="24" />
            <line x2="560" y1="-160" y2="-160" x1="496" />
            <rect width="64" x="496" y="-108" height="24" />
            <line x2="560" y1="-96" y2="-96" x1="496" />
            <rect width="64" x="496" y="-44" height="24" />
            <line x2="560" y1="-32" y2="-32" x1="496" />
            <line x2="272" y1="-688" y2="-640" x1="272" />
            <line x2="256" y1="-688" y2="-640" x1="256" />
        </blockdef>
        <block symbolname="MISC_zpuino_sa_splitter2" name="XLXI_4">
            <blockpin name="in1" />
            <blockpin name="out1" />
            <blockpin name="out2" />
        </block>
        <block symbolname="MISC_zpuino_sa_splitter4" name="XLXI_5">
            <blockpin name="in1" />
            <blockpin name="out1" />
            <blockpin name="out2" />
            <blockpin name="out3" />
            <blockpin name="out4" />
        </block>
        <block symbolname="MISC_zpuino_wb_SevenSeg" name="XLXI_6">
            <blockpin name="segdata(6:0)" />
            <blockpin name="extra(31:0)" />
            <blockpin name="enable(3:0)" />
            <blockpin name="dot" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
        <block symbolname="AUDIO_zpuino_wb_passthrough" name="XLXI_9">
            <blockpin name="raw_out(17:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
        <block symbolname="Wishbone_to_Registers" name="XLXI_10">
            <blockpin name="register0_in(31:0)" />
            <blockpin name="register1_in(31:0)" />
            <blockpin name="register2_in(31:0)" />
            <blockpin name="register3_in(31:0)" />
            <blockpin name="register4_in(31:0)" />
            <blockpin name="register5_in(31:0)" />
            <blockpin name="register6_in(31:0)" />
            <blockpin name="register7_in(31:0)" />
            <blockpin name="register8_in(31:0)" />
            <blockpin name="register9_in(31:0)" />
            <blockpin name="register0_out(31:0)" />
            <blockpin name="register1_out(31:0)" />
            <blockpin name="register2_out(31:0)" />
            <blockpin name="register3_out(31:0)" />
            <blockpin name="register4_out(31:0)" />
            <blockpin name="register5_out(31:0)" />
            <blockpin name="register6_out(31:0)" />
            <blockpin name="register7_out(31:0)" />
            <blockpin name="register8_out(31:0)" />
            <blockpin name="register9_out(31:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="32" y="352" name="XLXI_6" orien="R0">
        </instance>
        <instance x="1392" y="176" name="XLXI_9" orien="R0">
        </instance>
        <instance x="48" y="1296" name="XLXI_5" orien="R0">
        </instance>
        <instance x="576" y="832" name="XLXI_10" orien="R0">
        </instance>
        <instance x="480" y="1280" name="XLXI_4" orien="R0">
        </instance>
    </sheet>
</drawing>