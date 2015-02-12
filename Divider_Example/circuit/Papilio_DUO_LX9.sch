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
        <signal name="Arduino_13" />
        <signal name="Arduino_48" />
        <signal name="Arduino_50" />
        <signal name="Arduino_52" />
        <signal name="Arduino_5" />
        <signal name="Arduino_6" />
        <signal name="Arduino_7" />
        <signal name="Arduino_8" />
        <signal name="Arduino_9" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Input" name="DUO_SW1" />
        <port polarity="Input" name="Arduino_13" />
        <port polarity="Output" name="Arduino_48" />
        <port polarity="Output" name="Arduino_50" />
        <port polarity="Output" name="Arduino_52" />
        <port polarity="Output" name="Arduino_5" />
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
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="clk_divider">
            <timestamp>2015-2-6T1:16:55</timestamp>
            <rect width="304" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <block symbolname="inv" name="XLXI_48">
            <blockpin signalname="DUO_SW1" name="I" />
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_63">
            <blockpin signalname="Arduino_13" name="I" />
            <blockpin signalname="Arduino_48" name="O" />
        </block>
        <block symbolname="clk_divider" name="XLXI_64">
            <blockpin signalname="Arduino_13" name="clk" />
            <blockpin signalname="Arduino_50" name="div2" />
            <blockpin signalname="Arduino_52" name="div4" />
            <blockpin signalname="Arduino_5" name="div8" />
            <blockpin signalname="Arduino_6" name="div16" />
            <blockpin signalname="Arduino_7" name="div32" />
            <blockpin signalname="Arduino_8" name="div64" />
            <blockpin signalname="Arduino_9" name="div128" />
            <blockpin name="div256" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <text style="fontsize:64;fontname:Arial" x="2611" y="2656">Version: 1.0</text>
        <text style="fontsize:28;fontname:Arial" x="615" y="2564">Replace DUO_SW1 with a Pulldown if you want the ATmega32U4 chip to run when this circuit is loaded.</text>
        <branch name="ARD_RESET">
            <wire x2="1120" y1="2272" y2="2272" x1="1088" />
        </branch>
        <instance x="864" y="2304" name="XLXI_48" orien="R0" />
        <branch name="DUO_SW1">
            <wire x2="864" y1="2272" y2="2272" x1="832" />
        </branch>
        <text style="fontsize:28;fontname:Arial" x="615" y="2596">Replace DUO_SW1 with a Pullup if you want to disable the ATmega32U4 chip when this circuit is loaded.</text>
        <rect width="1468" x="523" y="2228" height="472" />
        <text style="fontsize:48;fontname:Arial" x="1075" y="2664">Papilio DUO Reset</text>
        <iomarker fontsize="28" x="1120" y="2272" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="832" y="2272" name="DUO_SW1" orien="R180" />
        <branch name="Arduino_13">
            <wire x2="1328" y1="1120" y2="1120" x1="1264" />
            <wire x2="1504" y1="1120" y2="1120" x1="1328" />
            <wire x2="1328" y1="672" y2="1120" x1="1328" />
        </branch>
        <instance x="1328" y="704" name="XLXI_63" orien="R0" />
        <branch name="Arduino_48">
            <wire x2="1584" y1="672" y2="672" x1="1552" />
        </branch>
        <instance x="1504" y="1600" name="XLXI_64" orien="R0">
        </instance>
        <branch name="Arduino_50">
            <wire x2="1968" y1="1120" y2="1120" x1="1936" />
        </branch>
        <branch name="Arduino_52">
            <wire x2="1968" y1="1184" y2="1184" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1264" y="1120" name="Arduino_13" orien="R180" />
        <iomarker fontsize="28" x="1584" y="672" name="Arduino_48" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1120" name="Arduino_50" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1184" name="Arduino_52" orien="R0" />
        <branch name="Arduino_5">
            <wire x2="1968" y1="1248" y2="1248" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1248" name="Arduino_5" orien="R0" />
        <branch name="Arduino_6">
            <wire x2="1968" y1="1312" y2="1312" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1312" name="Arduino_6" orien="R0" />
        <branch name="Arduino_7">
            <wire x2="1968" y1="1376" y2="1376" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1376" name="Arduino_7" orien="R0" />
        <branch name="Arduino_8">
            <wire x2="1968" y1="1440" y2="1440" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1440" name="Arduino_8" orien="R0" />
        <branch name="Arduino_9">
            <wire x2="1968" y1="1504" y2="1504" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1504" name="Arduino_9" orien="R0" />
    </sheet>
</drawing>