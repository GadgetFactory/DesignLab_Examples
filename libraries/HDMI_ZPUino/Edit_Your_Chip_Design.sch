<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="HDMI_ZPUino">
            <timestamp>2015-11-25T18:34:26</timestamp>
            <rect width="272" x="64" y="-256" height="156" />
            <line x2="128" y1="-304" y2="-256" x1="128" />
            <line x2="144" y1="-304" y2="-256" x1="144" />
            <line x2="240" y1="-304" y2="-256" x1="240" />
            <line x2="256" y1="-304" y2="-256" x1="256" />
            <line x2="400" y1="-128" y2="-128" x1="336" />
            <line x2="400" y1="-160" y2="-160" x1="336" />
        </blockdef>
        <block symbolname="HDMI_ZPUino" name="XLXI_49">
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
            <blockpin name="wishbone_slot_video_in(100:0)" />
            <blockpin name="wishbone_slot_video_out(100:0)" />
            <blockpin name="tmdsb(3:0)" />
            <blockpin name="tmds(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="656" y="832" name="XLXI_49" orien="R0">
        </instance>
    </sheet>
</drawing>