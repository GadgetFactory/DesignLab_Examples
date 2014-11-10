<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="MISC_zpuino_sa_splitter2">
            <timestamp>2014-10-30T17:41:27</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MISC_zpuino_sa_splitter4">
            <timestamp>2014-10-30T17:41:48</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="MISC_zpuino_wb_SevenSeg">
            <timestamp>2014-10-30T17:42:45</timestamp>
            <rect width="176" x="64" y="-256" height="256" />
            <rect width="64" x="240" y="-172" height="24" />
            <line x2="304" y1="-160" y2="-160" x1="240" />
            <rect width="64" x="240" y="-108" height="24" />
            <line x2="304" y1="-96" y2="-96" x1="240" />
            <rect width="64" x="240" y="-44" height="24" />
            <line x2="304" y1="-32" y2="-32" x1="240" />
            <line x2="304" y1="-224" y2="-224" x1="240" />
            <line x2="144" y1="-304" y2="-256" x1="144" />
            <line x2="160" y1="-304" y2="-256" x1="160" />
        </blockdef>
        <blockdef name="VIDEO_zpuino_wb_vga_hqvga">
            <timestamp>2014-10-30T17:45:49</timestamp>
            <rect width="272" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="400" y1="-224" y2="-224" x1="336" />
            <line x2="400" y1="-208" y2="-208" x1="336" />
            <line x2="400" y1="-176" y2="-176" x1="336" />
            <line x2="400" y1="-160" y2="-160" x1="336" />
            <line x2="400" y1="-144" y2="-144" x1="336" />
            <line x2="400" y1="-112" y2="-112" x1="336" />
            <line x2="400" y1="-96" y2="-96" x1="336" />
            <line x2="400" y1="-80" y2="-80" x1="336" />
            <line x2="400" y1="-48" y2="-48" x1="336" />
            <line x2="400" y1="-32" y2="-32" x1="336" />
            <line x2="192" y1="-304" y2="-256" x1="192" />
            <line x2="208" y1="-304" y2="-256" x1="208" />
        </blockdef>
        <blockdef name="VIDEO_zpuino_wb_char_ram_8x8_sp">
            <timestamp>2014-10-30T17:47:56</timestamp>
            <line x2="96" y1="-112" y2="-64" x1="96" />
            <line x2="112" y1="-112" y2="-64" x1="112" />
            <rect width="120" x="44" y="-64" height="64" />
        </blockdef>
        <block symbolname="MISC_zpuino_sa_splitter2" name="XLXI_4">
            <blockpin name="in1" />
            <blockpin name="out1" />
            <blockpin name="out2" />
        </block>
        <block symbolname="MISC_zpuino_sa_splitter4" name="XLXI_5">
            <blockpin name="in1" />
            <blockpin name="out1" />
            <blockpin name="out2" />
            <blockpin name="out3" />
            <blockpin name="out4" />
        </block>
        <block symbolname="MISC_zpuino_wb_SevenSeg" name="XLXI_6">
            <blockpin name="segdata(6:0)" />
            <blockpin name="extra(31:0)" />
            <blockpin name="enable(3:0)" />
            <blockpin name="dot" />
            <blockpin name="wishbone_in(61:0)" />
            <blockpin name="wishbone_out(33:0)" />
        </block>
        <block symbolname="VIDEO_zpuino_wb_vga_hqvga" name="XLXI_7">
            <blockpin name="clk_50Mhz" />
            <blockpin name="vga_hsync" />
            <blockpin name="vga_vsync" />
            <blockpin name="vga_r2" />
            <blockpin name="vga_r1" />
            <blockpin name="vga_r0" />
            <blockpin name="vga_g2" />
            <blockpin name="vga_g1" />
            <blockpin name="vga_g0" />
            <blockpin name="vga_b1" />
            <blockpin name="vga_b0" />
            <blockpin name="wishbone_in(61:0)" />
            <blockpin name="wishbone_out(33:0)" />
        </block>
        <block symbolname="VIDEO_zpuino_wb_char_ram_8x8_sp" name="XLXI_8">
            <blockpin name="wishbone_in(61:0)" />
            <blockpin name="wishbone_out(33:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="848" y="736" name="XLXI_4" orien="R0">
        </instance>
        <instance x="320" y="1104" name="XLXI_5" orien="R0">
        </instance>
        <instance x="32" y="352" name="XLXI_6" orien="R0">
        </instance>
        <instance x="512" y="384" name="XLXI_7" orien="R0">
        </instance>
        <instance x="960" y="192" name="XLXI_8" orien="R0" />
    </sheet>
</drawing>