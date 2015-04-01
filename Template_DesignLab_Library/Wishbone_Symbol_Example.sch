<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="buttons(3:0)" />
        <signal name="leds(3:0)" />
        <port polarity="Input" name="buttons(3:0)" />
        <port polarity="Output" name="leds(3:0)" />
        <blockdef name="ibuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <block symbolname="ibuf" name="XLXI_1(3:0)">
            <blockpin signalname="buttons(3:0)" name="I" />
            <blockpin signalname="leds(3:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <branch name="buttons(3:0)">
            <wire x2="1216" y1="816" y2="816" x1="1056" />
        </branch>
        <instance x="1216" y="848" name="XLXI_1(3:0)" orien="R0" />
        <branch name="leds(3:0)">
            <wire x2="1600" y1="816" y2="816" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1056" y="816" name="buttons(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1600" y="816" name="leds(3:0)" orien="R0" />
    </sheet>
</drawing>