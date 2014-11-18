<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DRAGON_SPI_GND" />
        <signal name="DRAGON_SPI_VTG" />
        <signal name="DRAGON_SPI_MOSI" />
        <signal name="DRAGON_SPI_SCK" />
        <signal name="ARD_SPI_MISO" />
        <signal name="ARD_SPI_MOSI" />
        <signal name="ARD_SPI_SCLK" />
        <signal name="DRAGON_SPI_MISO" />
        <signal name="DRAGON_SPI_RESET" />
        <signal name="ARD_RESET" />
        <port polarity="Output" name="DRAGON_SPI_GND" />
        <port polarity="Output" name="DRAGON_SPI_VTG" />
        <port polarity="Input" name="DRAGON_SPI_MOSI" />
        <port polarity="Input" name="DRAGON_SPI_SCK" />
        <port polarity="Input" name="ARD_SPI_MISO" />
        <port polarity="Output" name="ARD_SPI_MOSI" />
        <port polarity="Output" name="ARD_SPI_SCLK" />
        <port polarity="Output" name="DRAGON_SPI_MISO" />
        <port polarity="Input" name="DRAGON_SPI_RESET" />
        <port polarity="Output" name="ARD_RESET" />
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
        <block symbolname="gnd" name="XLXI_93">
            <blockpin signalname="DRAGON_SPI_GND" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_100">
            <blockpin signalname="DRAGON_SPI_VTG" name="P" />
        </block>
        <block symbolname="obuf4" name="JTAG_SPI_OBUF">
            <blockpin signalname="DRAGON_SPI_RESET" name="I0" />
            <blockpin signalname="DRAGON_SPI_MOSI" name="I1" />
            <blockpin signalname="DRAGON_SPI_SCK" name="I2" />
            <blockpin signalname="ARD_SPI_MISO" name="I3" />
            <blockpin signalname="ARD_RESET" name="O0" />
            <blockpin signalname="ARD_SPI_MOSI" name="O1" />
            <blockpin signalname="ARD_SPI_SCLK" name="O2" />
            <blockpin signalname="DRAGON_SPI_MISO" name="O3" />
        </block>
        <block symbolname="pullup" name="XLXI_103">
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="1568" y="1024" name="XLXI_93" orien="R0" />
        <branch name="DRAGON_SPI_GND">
            <wire x2="1632" y1="864" y2="896" x1="1632" />
        </branch>
        <instance x="1360" y="496" name="XLXI_100" orien="R0" />
        <branch name="DRAGON_SPI_VTG">
            <wire x2="1424" y1="496" y2="528" x1="1424" />
        </branch>
        <instance x="464" y="864" name="JTAG_SPI_OBUF" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="32" type="instance" />
        </instance>
        <branch name="DRAGON_SPI_MOSI">
            <wire x2="464" y1="704" y2="704" x1="432" />
        </branch>
        <branch name="DRAGON_SPI_SCK">
            <wire x2="464" y1="768" y2="768" x1="432" />
        </branch>
        <branch name="ARD_SPI_MISO">
            <wire x2="464" y1="832" y2="832" x1="432" />
        </branch>
        <branch name="ARD_SPI_MOSI">
            <wire x2="720" y1="704" y2="704" x1="688" />
        </branch>
        <branch name="ARD_SPI_SCLK">
            <wire x2="720" y1="768" y2="768" x1="688" />
        </branch>
        <branch name="DRAGON_SPI_MISO">
            <wire x2="720" y1="832" y2="832" x1="688" />
        </branch>
        <iomarker fontsize="28" x="1632" y="864" name="DRAGON_SPI_GND" orien="R270" />
        <iomarker fontsize="28" x="1424" y="528" name="DRAGON_SPI_VTG" orien="R90" />
        <iomarker fontsize="28" x="432" y="704" name="DRAGON_SPI_MOSI" orien="R180" />
        <iomarker fontsize="28" x="432" y="768" name="DRAGON_SPI_SCK" orien="R180" />
        <iomarker fontsize="28" x="432" y="832" name="ARD_SPI_MISO" orien="R180" />
        <iomarker fontsize="28" x="720" y="704" name="ARD_SPI_MOSI" orien="R0" />
        <iomarker fontsize="28" x="720" y="768" name="ARD_SPI_SCLK" orien="R0" />
        <iomarker fontsize="28" x="720" y="832" name="DRAGON_SPI_MISO" orien="R0" />
        <branch name="DRAGON_SPI_RESET">
            <wire x2="464" y1="640" y2="640" x1="432" />
        </branch>
        <iomarker fontsize="28" x="432" y="640" name="DRAGON_SPI_RESET" orien="R180" />
        <branch name="ARD_RESET">
            <wire x2="704" y1="640" y2="640" x1="688" />
            <wire x2="896" y1="640" y2="640" x1="704" />
            <wire x2="1008" y1="640" y2="640" x1="896" />
        </branch>
        <iomarker fontsize="28" x="1008" y="640" name="ARD_RESET" orien="R0" />
        <instance x="832" y="640" name="XLXI_103" orien="R0" />
    </sheet>
</drawing>