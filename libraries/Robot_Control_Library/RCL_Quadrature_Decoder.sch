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
        <signal name="wishbone_in(61)" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3(31:0)" />
        <signal name="XLXN_4(31:0)" />
        <signal name="XLXN_5(31:0)" />
        <signal name="XLXN_6(31:0)" />
        <signal name="A" />
        <signal name="B" />
        <signal name="I" />
        <port polarity="Output" name="wishbone_out(100:0)" />
        <port polarity="Input" name="wishbone_in(100:0)" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="I" />
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
        <blockdef name="quad_inst">
            <timestamp>2015-4-14T17:11:59</timestamp>
            <rect width="320" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-300" height="24" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <rect width="64" x="384" y="-220" height="24" />
            <line x2="448" y1="-208" y2="-208" x1="384" />
            <rect width="64" x="384" y="-140" height="24" />
            <line x2="448" y1="-128" y2="-128" x1="384" />
            <rect width="64" x="384" y="-60" height="24" />
            <line x2="448" y1="-48" y2="-48" x1="384" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="Wishbone_to_Registers_x10" name="XLXI_1">
            <blockpin signalname="XLXN_3(31:0)" name="register0_in(31:0)" />
            <blockpin signalname="XLXN_4(31:0)" name="register1_in(31:0)" />
            <blockpin signalname="XLXN_5(31:0)" name="register2_in(31:0)" />
            <blockpin signalname="XLXN_6(31:0)" name="register3_in(31:0)" />
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
            <blockpin signalname="wishbone_in(100:0)" name="wishbone_in(100:0)" />
            <blockpin signalname="wishbone_out(100:0)" name="wishbone_out(100:0)" />
        </block>
        <block symbolname="quad_inst" name="XLXI_2">
            <blockpin signalname="wishbone_in(61)" name="CLK" />
            <blockpin signalname="XLXN_2" name="Reset" />
            <blockpin signalname="A" name="A_CLK" />
            <blockpin signalname="B" name="B_CLK" />
            <blockpin signalname="I" name="I_CLK" />
            <blockpin signalname="XLXN_3(31:0)" name="PULSE_COUNT(31:0)" />
            <blockpin signalname="XLXN_4(31:0)" name="REV_COUNT(31:0)" />
            <blockpin signalname="XLXN_5(31:0)" name="TSPEED(31:0)" />
            <blockpin signalname="XLXN_6(31:0)" name="TACCEL(31:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_3">
            <blockpin signalname="XLXN_2" name="G" />
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
            <wire x2="1728" y1="336" y2="416" x1="1728" />
            <wire x2="1728" y1="416" y2="496" x1="1728" />
            <wire x2="1760" y1="496" y2="496" x1="1728" />
            <wire x2="1760" y1="496" y2="512" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1808" y="352" name="wishbone_out(100:0)" orien="R270" />
        <iomarker fontsize="28" x="1728" y="336" name="wishbone_in(100:0)" orien="R270" />
        <instance x="848" y="880" name="XLXI_2" orien="R0">
        </instance>
        <branch name="wishbone_in(61)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1240" y="416" type="branch" />
            <wire x2="848" y1="416" y2="416" x1="832" />
            <wire x2="1240" y1="416" y2="416" x1="848" />
            <wire x2="1632" y1="416" y2="416" x1="1240" />
            <wire x2="832" y1="416" y2="592" x1="832" />
            <wire x2="848" y1="592" y2="592" x1="832" />
        </branch>
        <bustap x2="1632" y1="416" y2="416" x1="1728" />
        <instance x="368" y="800" name="XLXI_3" orien="R0" />
        <branch name="XLXN_2">
            <wire x2="848" y1="656" y2="656" x1="432" />
            <wire x2="432" y1="656" y2="672" x1="432" />
        </branch>
        <branch name="XLXN_3(31:0)">
            <wire x2="1504" y1="592" y2="592" x1="1296" />
        </branch>
        <branch name="XLXN_4(31:0)">
            <wire x2="1392" y1="672" y2="672" x1="1296" />
            <wire x2="1392" y1="656" y2="672" x1="1392" />
            <wire x2="1504" y1="656" y2="656" x1="1392" />
        </branch>
        <branch name="XLXN_5(31:0)">
            <wire x2="1392" y1="752" y2="752" x1="1296" />
            <wire x2="1392" y1="720" y2="752" x1="1392" />
            <wire x2="1504" y1="720" y2="720" x1="1392" />
        </branch>
        <branch name="XLXN_6(31:0)">
            <wire x2="1392" y1="832" y2="832" x1="1296" />
            <wire x2="1392" y1="784" y2="832" x1="1392" />
            <wire x2="1504" y1="784" y2="784" x1="1392" />
        </branch>
        <branch name="A">
            <wire x2="848" y1="720" y2="720" x1="816" />
        </branch>
        <iomarker fontsize="28" x="816" y="720" name="A" orien="R180" />
        <branch name="B">
            <wire x2="848" y1="784" y2="784" x1="816" />
        </branch>
        <iomarker fontsize="28" x="816" y="784" name="B" orien="R180" />
        <branch name="I">
            <wire x2="848" y1="848" y2="848" x1="816" />
        </branch>
        <iomarker fontsize="28" x="816" y="848" name="I" orien="R180" />
    </sheet>
</drawing>