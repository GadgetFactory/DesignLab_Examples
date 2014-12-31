<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="OV_Camera_FrameBuffer">
            <timestamp>2014-12-26T22:47:3</timestamp>
            <rect width="368" x="64" y="-704" height="704" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="496" y1="-672" y2="-672" x1="432" />
            <line x2="496" y1="-608" y2="-608" x1="432" />
            <line x2="496" y1="-544" y2="-544" x1="432" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <line x2="496" y1="-416" y2="-416" x1="432" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <rect width="64" x="432" y="-300" height="24" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <rect width="64" x="432" y="-236" height="24" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <rect width="64" x="432" y="-172" height="24" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <rect width="64" x="432" y="-108" height="24" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <block symbolname="OV_Camera_FrameBuffer" name="XLXI_49">
            <blockpin name="clk_50Mhz" />
            <blockpin name="OV7670_VSYNC" />
            <blockpin name="OV7670_HREF" />
            <blockpin name="OV7670_PCLK" />
            <blockpin name="btn" />
            <blockpin name="OV7670_D(7:0)" />
            <blockpin name="OV7670_SIOC" />
            <blockpin name="OV7670_RESET" />
            <blockpin name="OV7670_PWDN" />
            <blockpin name="OV7670_XCLK" />
            <blockpin name="vga_hsync" />
            <blockpin name="vga_vsync" />
            <blockpin name="LED(7:0)" />
            <blockpin name="vga_red(2:0)" />
            <blockpin name="vga_green(2:0)" />
            <blockpin name="vga_blue(2:1)" />
            <blockpin name="OV7670_SIOD" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="640" y="992" name="XLXI_49" orien="R0">
        </instance>
    </sheet>
</drawing>