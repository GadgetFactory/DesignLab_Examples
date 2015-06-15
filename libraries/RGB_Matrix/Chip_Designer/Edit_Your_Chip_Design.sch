<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="RGB_Matrix_Wing">
            <timestamp>2015-6-9T15:40:35</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="384" y1="-144" y2="-144" x1="320" />
            <rect width="64" x="320" y="-156" height="24" />
            <line x2="384" y1="-80" y2="-80" x1="320" />
            <rect width="64" x="320" y="-92" height="24" />
            <line x2="384" y1="-384" y2="-384" x1="320" />
            <rect width="64" x="320" y="-396" height="24" />
            <line x2="384" y1="-320" y2="-320" x1="320" />
            <rect width="64" x="320" y="-332" height="24" />
        </blockdef>
        <blockdef name="VIDEO_zpuino_wb_rgb_panel">
            <timestamp>2015-6-9T15:34:31</timestamp>
            <rect width="176" x="64" y="-448" height="448" />
            <rect width="64" x="240" y="-236" height="24" />
            <line x2="304" y1="-224" y2="-224" x1="240" />
            <rect width="64" x="240" y="-172" height="24" />
            <line x2="304" y1="-160" y2="-160" x1="240" />
            <rect width="64" x="240" y="-108" height="24" />
            <line x2="304" y1="-96" y2="-96" x1="240" />
            <rect width="64" x="240" y="-44" height="24" />
            <line x2="304" y1="-32" y2="-32" x1="240" />
            <line x2="304" y1="-416" y2="-416" x1="240" />
            <line x2="304" y1="-352" y2="-352" x1="240" />
            <line x2="304" y1="-288" y2="-288" x1="240" />
            <line x2="144" y1="-496" y2="-448" x1="144" />
            <line x2="160" y1="-496" y2="-448" x1="160" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
        </blockdef>
        <block symbolname="VIDEO_zpuino_wb_rgb_panel" name="XLXI_50">
            <blockpin name="R(1:0)" />
            <blockpin name="G(1:0)" />
            <blockpin name="B(1:0)" />
            <blockpin name="COL(3:0)" />
            <blockpin name="CLK" />
            <blockpin name="STB" />
            <blockpin name="OE" />
            <blockpin name="wishbone_out(100:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="clk_32Mhz" />
        </block>
        <block symbolname="RGB_Matrix_Wing" name="XLXI_51">
            <blockpin name="CLK" />
            <blockpin name="STB" />
            <blockpin name="OE" />
            <blockpin name="R(1:0)" />
            <blockpin name="G(1:0)" />
            <blockpin name="B(1:0)" />
            <blockpin name="COL(3:0)" />
            <blockpin name="wt_miso1(7:0)" />
            <blockpin name="wt_mosi1(7:0)" />
            <blockpin name="wt_miso0(7:0)" />
            <blockpin name="wt_mosi0(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="1072" y="976" name="XLXI_50" orien="R0">
        </instance>
        <instance x="320" y="1024" name="XLXI_51" orien="R0">
        </instance>
    </sheet>
</drawing>