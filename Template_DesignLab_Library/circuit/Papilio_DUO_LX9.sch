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
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="DUO_SW1" />
        <blockdef name="Wishbone_Symbol_Example">
            <timestamp>2014-12-2T18:55:59</timestamp>
            <rect width="160" x="52" y="-64" height="64" />
            <line x2="52" y1="-48" y2="-48" x1="0" />
            <line x2="256" y1="-16" y2="-16" x1="212" />
            <line x2="128" y1="-112" y2="-64" x1="128" />
            <line x2="144" y1="-112" y2="-64" x1="144" />
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
        <block symbolname="Wishbone_Symbol_Example" name="XLXI_48">
            <blockpin name="buttons(3:0)" />
            <blockpin name="leds(3:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
        <block symbolname="inv" name="XLXI_60">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2871" y="1106" name="XLXI_48" orien="R0" />
        <text style="fontsize:28;fontname:Arial" x="2144" y="2572">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="2663" y1="2274" y2="2274" x1="2631" />
        </branch>
        <instance x="2407" y="2306" name="XLXI_60" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="2407" y1="2274" y2="2274" x1="2375" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="2144" y="2604">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="2052" y="2236" height="472" />
        <text style="fontsize:48;fontname:Arial" x="2604" y="2672">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="2663" y="2274" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="2375" y="2274" name="DUO_SW1" orien="R180" />
    </sheet>
</drawing>