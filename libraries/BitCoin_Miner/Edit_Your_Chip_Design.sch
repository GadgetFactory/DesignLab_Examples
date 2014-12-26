<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="fpgaminer_top">
            <timestamp>2014-12-24T18:25:33</timestamp>
            <rect width="256" x="64" y="-256" height="312" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="320" y1="-152" y2="-152" x1="64" />
        </blockdef>
        <block symbolname="fpgaminer_top" name="XLXI_49">
            <blockpin name="clk_32Mhz" />
            <blockpin name="TxD" />
            <blockpin name="RxD" />
            <blockpin name="disp_switch" />
            <blockpin name="anode(3:0)" />
            <blockpin name="segment(7:0)" />
            <blockpin name="led(1:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="672" y="800" name="XLXI_49" orien="R0">
        </instance>
    </sheet>
</drawing>