<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="wishbone_out(100:0)" />
        <signal name="wishbone_in(100:0)" />
        <signal name="register1(31:0)" />
        <signal name="buttons(3:0)" />
        <signal name="register1(3:0)" />
        <signal name="leds(3:0)" />
        <signal name="register0(31:0)" />
        <signal name="register0(3:0)" />
        <port polarity="Output" name="wishbone_out(100:0)" />
        <port polarity="Input" name="wishbone_in(100:0)" />
        <port polarity="Input" name="buttons(3:0)" />
        <port polarity="Output" name="leds(3:0)" />
        <blockdef name="Wishbone_to_Registers_x10">
            <timestamp>2015-3-30T20:21:13</timestamp>
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="Wishbone_to_Registers_x10" name="XLXI_1">
            <blockpin name="register0_in(31:0)" />
            <blockpin signalname="register1(31:0)" name="register1_in(31:0)" />
            <blockpin name="register2_in(31:0)" />
            <blockpin name="register3_in(31:0)" />
            <blockpin name="register4_in(31:0)" />
            <blockpin name="register5_in(31:0)" />
            <blockpin name="register6_in(31:0)" />
            <blockpin name="register7_in(31:0)" />
            <blockpin name="register8_in(31:0)" />
            <blockpin name="register9_in(31:0)" />
            <blockpin signalname="register0(31:0)" name="register0_out(31:0)" />
            <blockpin name="register1_out(31:0)" />
            <blockpin name="register2_out(31:0)" />
            <blockpin name="register3_out(31:0)" />
            <blockpin name="register4_out(31:0)" />
            <blockpin name="register5_out(31:0)" />
            <blockpin name="register6_out(31:0)" />
            <blockpin name="register7_out(31:0)" />
            <blockpin name="register8_out(31:0)" />
            <blockpin name="register9_out(31:0)" />
            <blockpin signalname="wishbone_in(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="wishbone_out(100:0)" name="wishbone_out(100:0)" />
        </block>
        <block symbolname="buf" name="reg0(3:0)">
            <blockpin signalname="register0(3:0)" name="I" />
            <blockpin signalname="leds(3:0)" name="O" />
        </block>
        <block symbolname="buf" name="reg1(3:0)">
            <blockpin signalname="buttons(3:0)" name="I" />
            <blockpin signalname="register1(3:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1504" y="1200" name="XLXI_1" orien="R0">
        </instance>
        <branch name="wishbone_out(100:0)">
            <wire x2="1776" y1="496" y2="512" x1="1776" />
            <wire x2="1808" y1="496" y2="496" x1="1776" />
            <wire x2="1808" y1="352" y2="496" x1="1808" />
        </branch>
        <branch name="wishbone_in(100:0)">
            <wire x2="1728" y1="336" y2="496" x1="1728" />
            <wire x2="1760" y1="496" y2="496" x1="1728" />
            <wire x2="1760" y1="496" y2="512" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1808" y="352" name="wishbone_out(100:0)" orien="R270" />
        <iomarker fontsize="28" x="1728" y="336" name="wishbone_in(100:0)" orien="R270" />
        <branch name="register1(31:0)">
            <wire x2="1344" y1="608" y2="640" x1="1344" />
            <wire x2="1344" y1="640" y2="656" x1="1344" />
            <wire x2="1504" y1="656" y2="656" x1="1344" />
        </branch>
        <branch name="buttons(3:0)">
            <wire x2="896" y1="640" y2="640" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="640" name="buttons(3:0)" orien="R180" />
        <bustap x2="1248" y1="640" y2="640" x1="1344" />
        <branch name="register1(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="640" type="branch" />
            <wire x2="1184" y1="640" y2="640" x1="1120" />
            <wire x2="1248" y1="640" y2="640" x1="1184" />
        </branch>
        <branch name="leds(3:0)">
            <wire x2="2912" y1="592" y2="592" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="2912" y="592" name="leds(3:0)" orien="R0" />
        <branch name="register0(31:0)">
            <wire x2="2176" y1="592" y2="592" x1="2064" />
            <wire x2="2176" y1="560" y2="592" x1="2176" />
        </branch>
        <bustap x2="2272" y1="592" y2="592" x1="2176" />
        <branch name="register0(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2400" y="592" type="branch" />
            <wire x2="2400" y1="592" y2="592" x1="2272" />
            <wire x2="2528" y1="592" y2="592" x1="2400" />
        </branch>
        <instance x="2528" y="624" name="reg0(3:0)" orien="R0" />
        <instance x="896" y="672" name="reg1(3:0)" orien="R0" />
    </sheet>
</drawing>
