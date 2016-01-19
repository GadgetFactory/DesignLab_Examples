<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="BENCHY_wb_SumpBlaze_LogicAnalyzer32">
            <timestamp>2016-1-18T23:38:12</timestamp>
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <rect width="64" x="0" y="-124" height="24" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <rect width="64" x="448" y="-188" height="24" />
            <line x2="512" y1="-176" y2="-176" x1="448" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="512" y1="-368" y2="-368" x1="448" />
            <rect width="384" x="64" y="-392" height="432" />
        </blockdef>
        <block symbolname="BENCHY_wb_SumpBlaze_LogicAnalyzer32" name="XLXI_1">
            <blockpin name="clk_32Mhz" />
            <blockpin name="la(31:0)" />
            <blockpin name="tx" />
            <blockpin name="reset" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="880" y="1088" name="XLXI_1" orien="R0">
        </instance>
    </sheet>
</drawing>