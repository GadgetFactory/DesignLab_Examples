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
        <signal name="clk" />
        <signal name="rxd" />
        <signal name="txd" />
        <signal name="Logic_Analyzer_Inputs(31:0)" />
        <signal name="Logic_Analyzer_Inputs(31:16)" />
        <signal name="Logic_Analyzer_Inputs(15:0)" />
        <signal name="WD(15:0)" />
        <signal name="WC(15:0)" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="DUO_SW1" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rxd" />
        <port polarity="Output" name="txd" />
        <port polarity="Input" name="WD(15:0)" />
        <port polarity="Input" name="WC(15:0)" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="BENCHY_sa_SumpBlaze_LogicAnalyzer32">
            <timestamp>2015-6-12T6:48:35</timestamp>
            <rect width="384" x="64" y="-392" height="304" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="512" y1="-368" y2="-368" x1="448" />
        </blockdef>
        <blockdef name="pulldown">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-160" y2="-128" x1="64" />
            <line x2="60" y1="0" y2="0" x1="68" />
            <line x2="52" y1="-16" y2="-16" x1="76" />
            <line x2="40" y1="-32" y2="-32" x1="88" />
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
        </blockdef>
        <blockdef name="ibuf16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <rect width="96" x="128" y="-44" height="24" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="0" y="-44" height="24" />
        </blockdef>
        <block symbolname="inv" name="XLXI_60">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="BENCHY_sa_SumpBlaze_LogicAnalyzer32" name="XLXI_62">
            <attr value="32" name="brams">
                <trait vhdl="all:1" />
                <trait valuetype="Integer" />
            </attr>
            <blockpin signalname="clk" name="clk_32Mhz" />
            <blockpin signalname="Logic_Analyzer_Inputs(31:0)" name="la(31:0)" />
            <blockpin signalname="rxd" name="rx" />
            <blockpin signalname="txd" name="tx" />
        </block>
        <block symbolname="ibuf16" name="XLXI_67">
            <blockpin signalname="WD(15:0)" name="I(15:0)" />
            <blockpin signalname="Logic_Analyzer_Inputs(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="ibuf16" name="XLXI_66">
            <blockpin signalname="WC(15:0)" name="I(15:0)" />
            <blockpin signalname="Logic_Analyzer_Inputs(31:16)" name="O(15:0)" />
        </block>
        <block symbolname="pulldown" name="XLXI_76(15:0)">
            <blockpin signalname="WD(15:0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_77(15:0)">
            <blockpin signalname="WC(15:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <text style="fontsize:28;fontname:Arial" x="144" y="2556">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="656" y1="2256" y2="2256" x1="624" />
        </branch>
        <instance x="400" y="2288" name="XLXI_60" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="400" y1="2256" y2="2256" x1="368" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="144" y="2588">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="52" y="2220" height="472" />
        <text style="fontsize:48;fontname:Arial" x="604" y="2656">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="656" y="2256" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="368" y="2256" name="DUO_SW1" orien="R180" />
        <instance x="1856" y="1408" name="XLXI_62" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="brams" x="200" y="-288" type="instance" />
        </instance>
        <branch name="clk">
            <wire x2="1840" y1="1040" y2="1040" x1="1824" />
            <wire x2="1856" y1="1040" y2="1040" x1="1840" />
        </branch>
        <branch name="rxd">
            <wire x2="1840" y1="1104" y2="1104" x1="1824" />
            <wire x2="1856" y1="1104" y2="1104" x1="1840" />
        </branch>
        <branch name="txd">
            <wire x2="2384" y1="1040" y2="1040" x1="2368" />
            <wire x2="2400" y1="1040" y2="1040" x1="2384" />
        </branch>
        <branch name="Logic_Analyzer_Inputs(31:0)">
            <wire x2="1856" y1="1168" y2="1168" x1="1472" />
            <wire x2="1472" y1="1168" y2="1280" x1="1472" />
            <wire x2="1472" y1="1280" y2="1312" x1="1472" />
            <wire x2="1472" y1="1312" y2="1536" x1="1472" />
        </branch>
        <bustap x2="1376" y1="1536" y2="1536" x1="1472" />
        <branch name="Logic_Analyzer_Inputs(31:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1288" y="1536" type="branch" />
            <wire x2="1288" y1="1536" y2="1536" x1="1200" />
            <wire x2="1376" y1="1536" y2="1536" x1="1288" />
        </branch>
        <bustap x2="1376" y1="1280" y2="1280" x1="1472" />
        <branch name="Logic_Analyzer_Inputs(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1288" y="1280" type="branch" />
            <wire x2="1288" y1="1280" y2="1280" x1="1200" />
            <wire x2="1376" y1="1280" y2="1280" x1="1288" />
        </branch>
        <instance x="976" y="1312" name="XLXI_67" orien="R0" />
        <instance x="976" y="1568" name="XLXI_66" orien="R0" />
        <iomarker fontsize="28" x="1824" y="1040" name="clk" orien="R180" />
        <iomarker fontsize="28" x="1824" y="1104" name="rxd" orien="R180" />
        <iomarker fontsize="28" x="2400" y="1040" name="txd" orien="R0" />
        <branch name="WD(15:0)">
            <wire x2="800" y1="1280" y2="1280" x1="768" />
            <wire x2="896" y1="1280" y2="1280" x1="800" />
            <wire x2="976" y1="1280" y2="1280" x1="896" />
        </branch>
        <branch name="WC(15:0)">
            <wire x2="800" y1="1536" y2="1536" x1="768" />
            <wire x2="896" y1="1536" y2="1536" x1="800" />
            <wire x2="976" y1="1536" y2="1536" x1="896" />
        </branch>
        <iomarker fontsize="28" x="768" y="1280" name="WD(15:0)" orien="R180" />
        <iomarker fontsize="28" x="768" y="1536" name="WC(15:0)" orien="R180" />
        <instance x="832" y="1440" name="XLXI_76(15:0)" orien="R0" />
        <instance x="832" y="1696" name="XLXI_77(15:0)" orien="R0" />
    </sheet>
</drawing>