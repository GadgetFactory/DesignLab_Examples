<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="zpuino_wb_char_ram_8x8_sp">
            <timestamp>2014-10-8T14:2:53</timestamp>
            <line x2="96" y1="-112" y2="-64" x1="96" />
            <line x2="112" y1="-112" y2="-64" x1="112" />
            <rect width="120" x="44" y="-64" height="64" />
        </blockdef>
        <blockdef name="zpuino_wb_vga_hqvga">
            <timestamp>2014-10-8T14:2:46</timestamp>
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
        <block symbolname="zpuino_wb_char_ram_8x8_sp" name="XLXI_49">
            <blockpin name="wishbone_in(61:0)" />
            <blockpin name="wishbone_out(33:0)" />
        </block>
        <block symbolname="zpuino_wb_vga_hqvga" name="XLXI_50">
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
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="688" y="448" name="XLXI_49" orien="R0" />
        <instance x="608" y="928" name="XLXI_50" orien="R0">
        </instance>
    </sheet>
</drawing>