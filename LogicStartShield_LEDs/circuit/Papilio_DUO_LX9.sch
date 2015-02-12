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
        <signal name="Arduino_0" />
        <signal name="Arduino_1" />
        <signal name="Arduino_2" />
        <signal name="Arduino_3" />
        <signal name="Arduino_48" />
        <signal name="Arduino_50" />
        <signal name="Arduino_52" />
        <signal name="Arduino_5" />
        <signal name="Arduino_4" />
        <signal name="Arduino_10" />
        <signal name="Arduino_11" />
        <signal name="Arduino_12" />
        <signal name="Arduino_6" />
        <signal name="Arduino_7" />
        <signal name="Arduino_8" />
        <signal name="Arduino_9" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="DUO_SW1" />
        <port polarity="Input" name="Arduino_0" />
        <port polarity="Input" name="Arduino_1" />
        <port polarity="Input" name="Arduino_2" />
        <port polarity="Input" name="Arduino_3" />
        <port polarity="Output" name="Arduino_48" />
        <port polarity="Output" name="Arduino_50" />
        <port polarity="Output" name="Arduino_52" />
        <port polarity="Output" name="Arduino_5" />
        <port polarity="Input" name="Arduino_4" />
        <port polarity="Input" name="Arduino_10" />
        <port polarity="Input" name="Arduino_11" />
        <port polarity="Input" name="Arduino_12" />
        <port polarity="Output" name="Arduino_6" />
        <port polarity="Output" name="Arduino_7" />
        <port polarity="Output" name="Arduino_8" />
        <port polarity="Output" name="Arduino_9" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <block symbolname="inv" name="XLXI_48">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="obuf4" name="XLXI_60">
            <blockpin signalname="Arduino_0" name="I0" />
            <blockpin signalname="Arduino_1" name="I1" />
            <blockpin signalname="Arduino_2" name="I2" />
            <blockpin signalname="Arduino_3" name="I3" />
            <blockpin signalname="Arduino_48" name="O0" />
            <blockpin signalname="Arduino_50" name="O1" />
            <blockpin signalname="Arduino_52" name="O2" />
            <blockpin signalname="Arduino_5" name="O3" />
        </block>
        <block symbolname="obuf4" name="XLXI_64">
            <blockpin signalname="Arduino_4" name="I0" />
            <blockpin signalname="Arduino_10" name="I1" />
            <blockpin signalname="Arduino_11" name="I2" />
            <blockpin signalname="Arduino_12" name="I3" />
            <blockpin signalname="Arduino_6" name="O0" />
            <blockpin signalname="Arduino_7" name="O1" />
            <blockpin signalname="Arduino_8" name="O2" />
            <blockpin signalname="Arduino_9" name="O3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <text style="fontsize:64;fontname:Arial" x="3226" y="2656">Version: 1.0</text>
        <text style="fontsize:28;fontname:Arial" x="1230" y="2564">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="1744" y1="2272" y2="2272" x1="1712" />
        </branch>
        <instance x="1488" y="2304" name="XLXI_48" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="1488" y1="2272" y2="2272" x1="1456" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="1230" y="2596">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="1138" y="2228" height="472" />
        <text style="fontsize:48;fontname:Arial" x="1690" y="2664">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="1744" y="2272" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="1456" y="2272" name="DUO_SW1" orien="R180" />
        <instance x="1536" y="1376" name="XLXI_60" orien="R0" />
        <branch name="Arduino_0">
            <wire x2="1536" y1="1152" y2="1152" x1="1504" />
        </branch>
        <branch name="Arduino_1">
            <wire x2="1536" y1="1216" y2="1216" x1="1504" />
        </branch>
        <branch name="Arduino_2">
            <wire x2="1536" y1="1280" y2="1280" x1="1504" />
        </branch>
        <branch name="Arduino_3">
            <wire x2="1536" y1="1344" y2="1344" x1="1504" />
        </branch>
        <branch name="Arduino_48">
            <wire x2="1792" y1="1152" y2="1152" x1="1760" />
        </branch>
        <branch name="Arduino_50">
            <wire x2="1792" y1="1216" y2="1216" x1="1760" />
        </branch>
        <branch name="Arduino_52">
            <wire x2="1792" y1="1280" y2="1280" x1="1760" />
        </branch>
        <branch name="Arduino_5">
            <wire x2="1792" y1="1344" y2="1344" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1152" name="Arduino_0" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1216" name="Arduino_1" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1280" name="Arduino_2" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1344" name="Arduino_3" orien="R180" />
        <iomarker fontsize="28" x="1792" y="1152" name="Arduino_48" orien="R0" />
        <iomarker fontsize="28" x="1792" y="1216" name="Arduino_50" orien="R0" />
        <iomarker fontsize="28" x="1792" y="1280" name="Arduino_52" orien="R0" />
        <iomarker fontsize="28" x="1792" y="1344" name="Arduino_5" orien="R0" />
        <branch name="Arduino_4">
            <wire x2="1536" y1="1552" y2="1552" x1="1504" />
        </branch>
        <branch name="Arduino_10">
            <wire x2="1536" y1="1616" y2="1616" x1="1504" />
        </branch>
        <branch name="Arduino_11">
            <wire x2="1536" y1="1680" y2="1680" x1="1504" />
        </branch>
        <branch name="Arduino_12">
            <wire x2="1536" y1="1744" y2="1744" x1="1504" />
        </branch>
        <branch name="Arduino_6">
            <wire x2="1792" y1="1552" y2="1552" x1="1760" />
        </branch>
        <branch name="Arduino_7">
            <wire x2="1792" y1="1616" y2="1616" x1="1760" />
        </branch>
        <branch name="Arduino_8">
            <wire x2="1792" y1="1680" y2="1680" x1="1760" />
        </branch>
        <branch name="Arduino_9">
            <wire x2="1792" y1="1744" y2="1744" x1="1760" />
        </branch>
        <instance x="1536" y="1776" name="XLXI_64" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1616" name="Arduino_10" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1680" name="Arduino_11" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1744" name="Arduino_12" orien="R180" />
        <iomarker fontsize="28" x="1792" y="1616" name="Arduino_7" orien="R0" />
        <iomarker fontsize="28" x="1792" y="1680" name="Arduino_8" orien="R0" />
        <iomarker fontsize="28" x="1792" y="1744" name="Arduino_9" orien="R0" />
        <iomarker fontsize="28" x="1792" y="1552" name="Arduino_6" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1552" name="Arduino_4" orien="R180" />
    </sheet>
</drawing>