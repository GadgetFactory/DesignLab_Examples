<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="rxd" />
        <signal name="txd" />
        <signal name="Logic_Analyzer_Inputs(31:0)" />
        <signal name="Logic_Analyzer_Inputs(31:16)" />
        <signal name="Logic_Analyzer_Inputs(15:0)" />
        <signal name="WB(15:0)" />
        <signal name="WC(15:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rxd" />
        <port polarity="Output" name="txd" />
        <port polarity="Input" name="WB(15:0)" />
        <port polarity="Input" name="WC(15:0)" />
        <blockdef name="BENCHY_sa_SumpBlaze_LogicAnalyzer32">
            <timestamp>2015-6-12T6:48:35</timestamp>
            <rect width="384" x="64" y="-392" height="304" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="512" y1="-368" y2="-368" x1="448" />
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
            <blockpin signalname="WB(15:0)" name="I(15:0)" />
            <blockpin signalname="Logic_Analyzer_Inputs(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="ibuf16" name="XLXI_66">
            <blockpin signalname="WC(15:0)" name="I(15:0)" />
            <blockpin signalname="Logic_Analyzer_Inputs(31:16)" name="O(15:0)" />
        </block>
        <block symbolname="pulldown" name="XLXI_76(15:0)">
            <blockpin signalname="WB(15:0)" name="O" />
        </block>
        <block symbolname="pulldown" name="XLXI_77(15:0)">
            <blockpin signalname="WC(15:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2064" y="1440" name="XLXI_62" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="brams" x="200" y="-288" type="instance" />
        </instance>
        <branch name="clk">
            <wire x2="2048" y1="1072" y2="1072" x1="2032" />
            <wire x2="2064" y1="1072" y2="1072" x1="2048" />
        </branch>
        <branch name="rxd">
            <wire x2="2048" y1="1136" y2="1136" x1="2032" />
            <wire x2="2064" y1="1136" y2="1136" x1="2048" />
        </branch>
        <branch name="txd">
            <wire x2="2592" y1="1072" y2="1072" x1="2576" />
            <wire x2="2608" y1="1072" y2="1072" x1="2592" />
        </branch>
        <branch name="Logic_Analyzer_Inputs(31:0)">
            <wire x2="2064" y1="1200" y2="1200" x1="1680" />
            <wire x2="1680" y1="1200" y2="1312" x1="1680" />
            <wire x2="1680" y1="1312" y2="1344" x1="1680" />
            <wire x2="1680" y1="1344" y2="1568" x1="1680" />
        </branch>
        <bustap x2="1584" y1="1568" y2="1568" x1="1680" />
        <branch name="Logic_Analyzer_Inputs(31:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1496" y="1568" type="branch" />
            <wire x2="1496" y1="1568" y2="1568" x1="1408" />
            <wire x2="1504" y1="1568" y2="1568" x1="1496" />
            <wire x2="1584" y1="1568" y2="1568" x1="1504" />
        </branch>
        <bustap x2="1584" y1="1312" y2="1312" x1="1680" />
        <branch name="Logic_Analyzer_Inputs(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1496" y="1312" type="branch" />
            <wire x2="1496" y1="1312" y2="1312" x1="1408" />
            <wire x2="1504" y1="1312" y2="1312" x1="1496" />
            <wire x2="1584" y1="1312" y2="1312" x1="1504" />
        </branch>
        <instance x="1184" y="1344" name="XLXI_67" orien="R0" />
        <instance x="1184" y="1600" name="XLXI_66" orien="R0" />
        <branch name="WB(15:0)">
            <wire x2="1008" y1="1312" y2="1312" x1="976" />
            <wire x2="1104" y1="1312" y2="1312" x1="1008" />
            <wire x2="1184" y1="1312" y2="1312" x1="1104" />
        </branch>
        <branch name="WC(15:0)">
            <wire x2="1008" y1="1568" y2="1568" x1="976" />
            <wire x2="1104" y1="1568" y2="1568" x1="1008" />
            <wire x2="1184" y1="1568" y2="1568" x1="1104" />
        </branch>
        <instance x="1040" y="1472" name="XLXI_76(15:0)" orien="R0" />
        <instance x="1040" y="1728" name="XLXI_77(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2032" y="1072" name="clk" orien="R180" />
        <iomarker fontsize="28" x="2032" y="1136" name="rxd" orien="R180" />
        <iomarker fontsize="28" x="2608" y="1072" name="txd" orien="R0" />
        <iomarker fontsize="28" x="976" y="1312" name="WB(15:0)" orien="R180" />
        <iomarker fontsize="28" x="976" y="1568" name="WC(15:0)" orien="R180" />
    </sheet>
</drawing>