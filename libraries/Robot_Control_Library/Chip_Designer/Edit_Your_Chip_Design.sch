<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="Robot_Control_Library">
            <timestamp>2015-3-19T23:13:17</timestamp>
            <rect width="160" x="52" y="-64" height="64" />
            <line x2="52" y1="-48" y2="-48" x1="0" />
            <line x2="256" y1="-16" y2="-16" x1="212" />
            <line x2="128" y1="-112" y2="-64" x1="128" />
            <line x2="144" y1="-112" y2="-64" x1="144" />
        </blockdef>
        <blockdef name="RCL_Quadrature_Decoder">
            <timestamp>2015-4-14T17:25:12</timestamp>
            <rect width="144" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="128" y1="-240" y2="-192" x1="128" />
            <line x2="144" y1="-240" y2="-192" x1="144" />
        </blockdef>
        <block symbolname="Robot_Control_Library" name="XLXI_48">
            <blockpin name="buttons(3:0)" />
            <blockpin name="leds(3:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
        <block symbolname="RCL_Quadrature_Decoder" name="XLXI_49">
            <blockpin name="A" />
            <blockpin name="B" />
            <blockpin name="I" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="704" y="688" name="XLXI_48" orien="R0">
        </instance>
        <instance x="576" y="1120" name="XLXI_49" orien="R0">
        </instance>
    </sheet>
</drawing>