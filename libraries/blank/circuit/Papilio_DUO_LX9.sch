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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="inv" name="XLXI_60">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <text style="fontsize:28;fontname:Arial" x="208" y="812">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="727" y1="514" y2="514" x1="695" />
        </branch>
        <instance x="471" y="546" name="XLXI_60" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="471" y1="514" y2="514" x1="439" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="208" y="844">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="116" y="476" height="472" />
        <text style="fontsize:48;fontname:Arial" x="668" y="912">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="727" y="514" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="439" y="514" name="DUO_SW1" orien="R180" />
    </sheet>
</drawing>