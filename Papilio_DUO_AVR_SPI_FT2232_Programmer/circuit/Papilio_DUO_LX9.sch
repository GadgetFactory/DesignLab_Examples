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
        <signal name="ARD_SPI_MISO" />
        <signal name="BD3_MPSSE_TMS" />
        <signal name="ARD_SPI_SCLK" />
        <signal name="ARD_SPI_MOSI" />
        <signal name="BD2_MPSSE_TDO" />
        <signal name="ARD_RESET" />
        <port polarity="Input" name="BD0_MPSSE_TCK" />
        <port polarity="Input" name="BD1_MPSSE_TDI" />
        <port polarity="Input" name="ARD_SPI_MISO" />
        <port polarity="Input" name="BD3_MPSSE_TMS" />
        <port polarity="Output" name="ARD_SPI_SCLK" />
        <port polarity="Output" name="ARD_SPI_MOSI" />
        <port polarity="Output" name="BD2_MPSSE_TDO" />
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
        <block symbolname="obuf4" name="XLXI_60">
            <blockpin signalname="BD0_MPSSE_TCK" name="I0" />
            <blockpin signalname="BD1_MPSSE_TDI" name="I1" />
            <blockpin signalname="ARD_SPI_MISO" name="I2" />
            <blockpin signalname="BD3_MPSSE_TMS" name="I3" />
            <blockpin signalname="ARD_SPI_SCLK" name="O0" />
            <blockpin signalname="ARD_SPI_MOSI" name="O1" />
            <blockpin signalname="BD2_MPSSE_TDO" name="O2" />
            <blockpin signalname="ARD_RESET" name="O3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <text style="fontsize:64;fontname:Arial" x="2108" y="3456">Version: 1.0</text>
        <instance x="2304" y="1712" name="XLXI_60" orien="R0" />
        <branch name="BD0_MPSSE_TCK">
            <wire x2="2304" y1="1488" y2="1488" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="1488" name="BD0_MPSSE_TCK" orien="R180" />
        <branch name="BD1_MPSSE_TDI">
            <wire x2="2304" y1="1552" y2="1552" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="1552" name="BD1_MPSSE_TDI" orien="R180" />
        <branch name="ARD_SPI_MISO">
            <wire x2="2304" y1="1616" y2="1616" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="1616" name="ARD_SPI_MISO" orien="R180" />
        <branch name="BD3_MPSSE_TMS">
            <wire x2="2304" y1="1680" y2="1680" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2272" y="1680" name="BD3_MPSSE_TMS" orien="R180" />
        <branch name="ARD_SPI_SCLK">
            <wire x2="2560" y1="1488" y2="1488" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2560" y="1488" name="ARD_SPI_SCLK" orien="R0" />
        <branch name="ARD_SPI_MOSI">
            <wire x2="2560" y1="1552" y2="1552" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2560" y="1552" name="ARD_SPI_MOSI" orien="R0" />
        <branch name="BD2_MPSSE_TDO">
            <wire x2="2560" y1="1616" y2="1616" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2560" y="1616" name="BD2_MPSSE_TDO" orien="R0" />
        <branch name="ARD_RESET">
            <wire x2="2560" y1="1680" y2="1680" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2560" y="1680" name="ARD_RESET" orien="R0" />
    </sheet>
</drawing>