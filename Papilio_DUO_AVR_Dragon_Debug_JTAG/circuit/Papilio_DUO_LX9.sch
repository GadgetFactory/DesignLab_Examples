<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DRAGON_JTAG_TDI" />
        <signal name="DRAGON_JTAG_TMS" />
        <signal name="DRAGON_JTAG_TCK" />
        <signal name="ARD_JTAG_TDO" />
        <signal name="ARD_JTAG_TDI" />
        <signal name="ARD_JTAG_TMS" />
        <signal name="ARD_JTAG_TCK" />
        <signal name="DRAGON_JTAG_TDO" />
        <signal name="DRAGON_JTAG_GND" />
        <signal name="DRAGON_JTAG_GND2" />
        <signal name="DRAGON_JTAG_RESET" />
        <signal name="ARD_RESET" />
        <signal name="DRAGON_JTAG_VTG" />
        <port polarity="Input" name="DRAGON_JTAG_TDI" />
        <port polarity="Input" name="DRAGON_JTAG_TMS" />
        <port polarity="Input" name="DRAGON_JTAG_TCK" />
        <port polarity="Input" name="ARD_JTAG_TDO" />
        <port polarity="Output" name="ARD_JTAG_TDI" />
        <port polarity="Output" name="ARD_JTAG_TMS" />
        <port polarity="Output" name="ARD_JTAG_TCK" />
        <port polarity="Output" name="DRAGON_JTAG_TDO" />
        <port polarity="Output" name="DRAGON_JTAG_GND" />
        <port polarity="Output" name="DRAGON_JTAG_GND2" />
        <port polarity="Input" name="DRAGON_JTAG_RESET" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Output" name="DRAGON_JTAG_VTG" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
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
        <block symbolname="obuf4" name="XLXI_105">
            <blockpin signalname="DRAGON_JTAG_TDI" name="I0" />
            <blockpin signalname="DRAGON_JTAG_TMS" name="I1" />
            <blockpin signalname="DRAGON_JTAG_TCK" name="I2" />
            <blockpin signalname="ARD_JTAG_TDO" name="I3" />
            <blockpin signalname="ARD_JTAG_TDI" name="O0" />
            <blockpin signalname="ARD_JTAG_TMS" name="O1" />
            <blockpin signalname="ARD_JTAG_TCK" name="O2" />
            <blockpin signalname="DRAGON_JTAG_TDO" name="O3" />
        </block>
        <block symbolname="gnd" name="XLXI_71">
            <blockpin signalname="DRAGON_JTAG_GND" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_72">
            <blockpin signalname="DRAGON_JTAG_GND2" name="G" />
        </block>
        <block symbolname="obuf" name="XLXI_108">
            <blockpin signalname="DRAGON_JTAG_RESET" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="pullup" name="XLXI_109">
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_70">
            <blockpin signalname="DRAGON_JTAG_VTG" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="592" y="816" name="XLXI_105" orien="R0" />
        <branch name="DRAGON_JTAG_TDI">
            <wire x2="592" y1="592" y2="592" x1="560" />
        </branch>
        <branch name="DRAGON_JTAG_TMS">
            <wire x2="576" y1="656" y2="656" x1="560" />
            <wire x2="592" y1="656" y2="656" x1="576" />
        </branch>
        <branch name="DRAGON_JTAG_TCK">
            <wire x2="592" y1="720" y2="720" x1="560" />
        </branch>
        <branch name="ARD_JTAG_TDO">
            <wire x2="592" y1="784" y2="784" x1="560" />
        </branch>
        <branch name="ARD_JTAG_TDI">
            <wire x2="848" y1="592" y2="592" x1="816" />
        </branch>
        <branch name="ARD_JTAG_TMS">
            <wire x2="848" y1="656" y2="656" x1="816" />
        </branch>
        <branch name="ARD_JTAG_TCK">
            <wire x2="848" y1="720" y2="720" x1="816" />
        </branch>
        <branch name="DRAGON_JTAG_TDO">
            <wire x2="848" y1="784" y2="784" x1="816" />
        </branch>
        <instance x="1392" y="976" name="XLXI_71" orien="R0" />
        <instance x="1520" y="976" name="XLXI_72" orien="R0" />
        <branch name="DRAGON_JTAG_GND">
            <wire x2="1456" y1="816" y2="848" x1="1456" />
        </branch>
        <branch name="DRAGON_JTAG_GND2">
            <wire x2="1584" y1="816" y2="848" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="560" y="592" name="DRAGON_JTAG_TDI" orien="R180" />
        <iomarker fontsize="28" x="560" y="720" name="DRAGON_JTAG_TCK" orien="R180" />
        <iomarker fontsize="28" x="560" y="784" name="ARD_JTAG_TDO" orien="R180" />
        <iomarker fontsize="28" x="848" y="592" name="ARD_JTAG_TDI" orien="R0" />
        <iomarker fontsize="28" x="848" y="656" name="ARD_JTAG_TMS" orien="R0" />
        <iomarker fontsize="28" x="848" y="720" name="ARD_JTAG_TCK" orien="R0" />
        <iomarker fontsize="28" x="848" y="784" name="DRAGON_JTAG_TDO" orien="R0" />
        <iomarker fontsize="28" x="560" y="656" name="DRAGON_JTAG_TMS" orien="R180" />
        <iomarker fontsize="28" x="1456" y="816" name="DRAGON_JTAG_GND" orien="R270" />
        <iomarker fontsize="28" x="1584" y="816" name="DRAGON_JTAG_GND2" orien="R270" />
        <instance x="640" y="1088" name="XLXI_108" orien="R0" />
        <branch name="DRAGON_JTAG_RESET">
            <wire x2="640" y1="1056" y2="1056" x1="608" />
        </branch>
        <branch name="ARD_RESET">
            <wire x2="880" y1="1056" y2="1056" x1="864" />
            <wire x2="912" y1="1056" y2="1056" x1="880" />
            <wire x2="1040" y1="1056" y2="1056" x1="912" />
        </branch>
        <instance x="848" y="1056" name="XLXI_109" orien="R0" />
        <iomarker fontsize="28" x="608" y="1056" name="DRAGON_JTAG_RESET" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1056" name="ARD_RESET" orien="R0" />
        <instance x="1280" y="448" name="XLXI_70" orien="R0" />
        <branch name="DRAGON_JTAG_VTG">
            <wire x2="1344" y1="448" y2="480" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="1344" y="480" name="DRAGON_JTAG_VTG" orien="R90" />
    </sheet>
</drawing>