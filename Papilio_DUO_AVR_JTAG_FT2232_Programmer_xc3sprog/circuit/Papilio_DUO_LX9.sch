<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ARD_RESET" />
        <signal name="BD0_MPSSE_TCK" />
        <signal name="BD1_MPSSE_TDI" />
        <signal name="ARD_JTAG_TDO" />
        <signal name="BD3_MPSSE_TMS" />
        <signal name="ARD_JTAG_TCK" />
        <signal name="ARD_JTAG_TDI" />
        <signal name="BD2_MPSSE_TDO" />
        <signal name="ARD_JTAG_TMS" />
        <signal name="XLXN_609" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="BD0_MPSSE_TCK" />
        <port polarity="Input" name="BD1_MPSSE_TDI" />
        <port polarity="Input" name="ARD_JTAG_TDO" />
        <port polarity="Input" name="BD3_MPSSE_TMS" />
        <port polarity="Output" name="ARD_JTAG_TCK" />
        <port polarity="Output" name="ARD_JTAG_TDI" />
        <port polarity="Output" name="BD2_MPSSE_TDO" />
        <port polarity="Output" name="ARD_JTAG_TMS" />
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
        <blockdef name="pullup">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
            <line x2="64" y1="-56" y2="-48" x1="48" />
            <line x2="48" y1="-72" y2="-56" x1="80" />
            <line x2="80" y1="-88" y2="-72" x1="48" />
            <line x2="48" y1="-104" y2="-88" x1="80" />
            <line x2="80" y1="-108" y2="-104" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-128" y2="-128" x1="96" />
        </blockdef>
        <block symbolname="inv" name="XLXI_48">
            <blockpin signalname="XLXN_609" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="obuf4" name="XLXI_60">
            <blockpin signalname="BD0_MPSSE_TCK" name="I0" />
            <blockpin signalname="BD1_MPSSE_TDI" name="I1" />
            <blockpin signalname="ARD_JTAG_TDO" name="I2" />
            <blockpin signalname="BD3_MPSSE_TMS" name="I3" />
            <blockpin signalname="ARD_JTAG_TCK" name="O0" />
            <blockpin signalname="ARD_JTAG_TDI" name="O1" />
            <blockpin signalname="BD2_MPSSE_TDO" name="O2" />
            <blockpin signalname="ARD_JTAG_TMS" name="O3" />
        </block>
        <block symbolname="pullup" name="XLXI_62">
            <blockpin signalname="XLXN_609" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <text style="fontsize:64;fontname:Arial" x="2108" y="3456">Version: 1.0</text>
        <text style="fontsize:28;fontname:Arial" x="112" y="3364">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="624" y1="3072" y2="3072" x1="592" />
        </branch>
        <instance x="368" y="3104" name="XLXI_48" orien="R0" />
        <text style="fontsize:28;fontname:Arial" x="112" y="3396">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="20" y="3028" height="472" />
        <text style="fontsize:48;fontname:Arial" x="572" y="3464">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="624" y="3072" name="ARD_RESET" orien="R0" />
        <instance x="2608" y="1536" name="XLXI_60" orien="R0" />
        <branch name="BD0_MPSSE_TCK">
            <wire x2="2608" y1="1312" y2="1312" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2576" y="1312" name="BD0_MPSSE_TCK" orien="R180" />
        <branch name="BD1_MPSSE_TDI">
            <wire x2="2608" y1="1376" y2="1376" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2576" y="1376" name="BD1_MPSSE_TDI" orien="R180" />
        <branch name="ARD_JTAG_TDO">
            <wire x2="2608" y1="1440" y2="1440" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2576" y="1440" name="ARD_JTAG_TDO" orien="R180" />
        <branch name="BD3_MPSSE_TMS">
            <wire x2="2608" y1="1504" y2="1504" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2576" y="1504" name="BD3_MPSSE_TMS" orien="R180" />
        <branch name="ARD_JTAG_TCK">
            <wire x2="2864" y1="1312" y2="1312" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2864" y="1312" name="ARD_JTAG_TCK" orien="R0" />
        <branch name="ARD_JTAG_TDI">
            <wire x2="2864" y1="1376" y2="1376" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2864" y="1376" name="ARD_JTAG_TDI" orien="R0" />
        <branch name="BD2_MPSSE_TDO">
            <wire x2="2864" y1="1440" y2="1440" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2864" y="1440" name="BD2_MPSSE_TDO" orien="R0" />
        <branch name="ARD_JTAG_TMS">
            <wire x2="2864" y1="1504" y2="1504" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2864" y="1504" name="ARD_JTAG_TMS" orien="R0" />
        <branch name="XLXN_609">
            <wire x2="368" y1="3040" y2="3072" x1="368" />
        </branch>
        <instance x="304" y="3040" name="XLXI_62" orien="R0" />
    </sheet>
</drawing>