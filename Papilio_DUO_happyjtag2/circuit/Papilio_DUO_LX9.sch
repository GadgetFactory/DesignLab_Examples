<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BD0_MPSSE_TCK" />
        <signal name="BD1_MPSSE_TDI" />
        <signal name="ARD_JTAG_TDO" />
        <signal name="BD3_MPSSE_TMS" />
        <signal name="ARD_JTAG_TCK" />
        <signal name="ARD_JTAG_TDI" />
        <signal name="BD2_MPSSE_TDO" />
        <signal name="ARD_JTAG_TMS" />
        <signal name="BD4_MPSSE_DTR" />
        <signal name="ARD_RESET" />
        <port polarity="Input" name="BD0_MPSSE_TCK" />
        <port polarity="Input" name="BD1_MPSSE_TDI" />
        <port polarity="Input" name="ARD_JTAG_TDO" />
        <port polarity="Input" name="BD3_MPSSE_TMS" />
        <port polarity="Output" name="ARD_JTAG_TCK" />
        <port polarity="Output" name="ARD_JTAG_TDI" />
        <port polarity="Output" name="BD2_MPSSE_TDO" />
        <port polarity="Output" name="ARD_JTAG_TMS" />
        <port polarity="Input" name="BD4_MPSSE_DTR" />
        <port polarity="Output" name="ARD_RESET" />
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
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <block symbolname="obuf4" name="XLXI_45">
            <blockpin signalname="BD0_MPSSE_TCK" name="I0" />
            <blockpin signalname="BD1_MPSSE_TDI" name="I1" />
            <blockpin signalname="ARD_JTAG_TDO" name="I2" />
            <blockpin signalname="BD3_MPSSE_TMS" name="I3" />
            <blockpin signalname="ARD_JTAG_TCK" name="O0" />
            <blockpin signalname="ARD_JTAG_TDI" name="O1" />
            <blockpin signalname="BD2_MPSSE_TDO" name="O2" />
            <blockpin signalname="ARD_JTAG_TMS" name="O3" />
        </block>
        <block symbolname="obuf" name="XLXI_46">
            <blockpin signalname="BD4_MPSSE_DTR" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="768" y="704" name="XLXI_45" orien="R0" />
        <instance x="768" y="768" name="XLXI_46" orien="R0" />
        <branch name="BD0_MPSSE_TCK">
            <wire x2="768" y1="480" y2="480" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="480" name="BD0_MPSSE_TCK" orien="R180" />
        <branch name="BD1_MPSSE_TDI">
            <wire x2="768" y1="544" y2="544" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="544" name="BD1_MPSSE_TDI" orien="R180" />
        <branch name="ARD_JTAG_TDO">
            <wire x2="768" y1="608" y2="608" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="608" name="ARD_JTAG_TDO" orien="R180" />
        <branch name="BD3_MPSSE_TMS">
            <wire x2="768" y1="672" y2="672" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="672" name="BD3_MPSSE_TMS" orien="R180" />
        <branch name="ARD_JTAG_TCK">
            <wire x2="1024" y1="480" y2="480" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="480" name="ARD_JTAG_TCK" orien="R0" />
        <branch name="ARD_JTAG_TDI">
            <wire x2="1024" y1="544" y2="544" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="544" name="ARD_JTAG_TDI" orien="R0" />
        <branch name="BD2_MPSSE_TDO">
            <wire x2="1024" y1="608" y2="608" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="608" name="BD2_MPSSE_TDO" orien="R0" />
        <branch name="ARD_JTAG_TMS">
            <wire x2="1024" y1="672" y2="672" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="672" name="ARD_JTAG_TMS" orien="R0" />
        <branch name="BD4_MPSSE_DTR">
            <wire x2="768" y1="736" y2="736" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="736" name="BD4_MPSSE_DTR" orien="R180" />
        <branch name="ARD_RESET">
            <wire x2="1024" y1="736" y2="736" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1024" y="736" name="ARD_RESET" orien="R0" />
    </sheet>
</drawing>