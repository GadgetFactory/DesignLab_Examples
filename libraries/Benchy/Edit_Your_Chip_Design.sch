<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="BENCHY_sa_SumpBlaze_LogicAnalyzer8">
            <timestamp>2014-10-31T15:52:14</timestamp>
            <rect width="384" x="64" y="-424" height="424" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="512" y1="-400" y2="-400" x1="448" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
        </blockdef>
        <blockdef name="BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag">
            <timestamp>2014-10-31T15:52:40</timestamp>
            <rect width="668" x="64" y="-416" height="416" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="BENCHY_zpuino_wb_waveform_generator">
            <timestamp>2014-10-31T15:53:6</timestamp>
            <rect width="224" x="64" y="-480" height="480" />
            <rect width="64" x="288" y="-76" height="24" />
            <line x2="352" y1="-64" y2="-64" x1="288" />
            <rect width="64" x="288" y="-204" height="24" />
            <line x2="352" y1="-192" y2="-192" x1="288" />
            <rect width="64" x="288" y="-140" height="24" />
            <line x2="352" y1="-128" y2="-128" x1="288" />
            <line x2="352" y1="-256" y2="-256" x1="288" />
            <line x2="352" y1="-384" y2="-384" x1="288" />
            <line x2="352" y1="-320" y2="-320" x1="288" />
            <line x2="16" y1="-448" y2="-448" x1="80" />
            <line x2="144" y1="-528" y2="-480" x1="144" />
            <line x2="160" y1="-528" y2="-476" x1="160" />
        </blockdef>
        <block symbolname="BENCHY_sa_SumpBlaze_LogicAnalyzer8" name="XLXI_49">
            <blockpin name="clk_32Mhz" />
            <blockpin name="la0" />
            <blockpin name="rx" />
            <blockpin name="tx" />
            <blockpin name="la1" />
            <blockpin name="la2" />
            <blockpin name="la3" />
            <blockpin name="la4" />
            <blockpin name="la5" />
            <blockpin name="la6" />
            <blockpin name="la7" />
        </block>
        <block symbolname="BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag" name="XLXI_50">
            <blockpin name="clk_32Mhz" />
            <blockpin name="la0" />
            <blockpin name="la1" />
            <blockpin name="la2" />
            <blockpin name="la3" />
            <blockpin name="la4" />
            <blockpin name="la5" />
            <blockpin name="la6" />
            <blockpin name="la7" />
        </block>
        <block symbolname="BENCHY_zpuino_wb_waveform_generator" name="XLXI_51">
            <blockpin name="saw_out(11:0)" />
            <blockpin name="sin_out(11:0)" />
            <blockpin name="cos_out(11:0)" />
            <blockpin name="saw_dac_out" />
            <blockpin name="sin_dac_out" />
            <blockpin name="cos_dac_out" />
            <blockpin name="clk_in" />
            <blockpin name="wishbone_in(61:0)" />
            <blockpin name="wishbone_out(33:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="144" y="512" name="XLXI_49" orien="R0">
        </instance>
        <instance x="832" y="512" name="XLXI_50" orien="R0">
        </instance>
        <instance x="608" y="1216" name="XLXI_51" orien="R0">
        </instance>
    </sheet>
</drawing>