<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="Quadrature_decoder">
            <timestamp>2015-4-8T18:41:42</timestamp>
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="240" y1="-624" y2="-576" x1="240" />
            <rect width="204" x="64" y="-576" height="508" />
            <rect width="24" x="228" y="-624" height="48" />
            <line x2="192" y1="-576" y2="-624" x1="192" />
            <rect width="24" x="180" y="-624" height="48" />
            <line x2="268" y1="-544" y2="-544" x1="336" />
        </blockdef>
        <block symbolname="Quadrature_decoder" name="XLXI_48">
            <blockpin name="A" />
            <blockpin name="B" />
            <blockpin name="A_s" />
            <blockpin name="B_s" />
            <blockpin name="A_t" />
            <blockpin name="B_t" />
            <blockpin name="A_f" />
            <blockpin name="B_f" />
            <blockpin name="wishbone_out(100:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="Clk" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="704" y="688" name="XLXI_48" orien="R0">
        </instance>
    </sheet>
</drawing>