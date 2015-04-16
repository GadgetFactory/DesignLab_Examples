<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="RCL_Quadrature_Decoder_x8">
            <timestamp>2015-4-15T16:43:24</timestamp>
            <rect width="108" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="112" y1="-240" y2="-192" x1="112" />
            <line x2="128" y1="-240" y2="-192" x1="128" />
        </blockdef>
        <blockdef name="quad_inst">
            <timestamp>2015-4-15T16:45:21</timestamp>
            <rect width="352" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-300" height="24" />
            <line x2="480" y1="-288" y2="-288" x1="416" />
            <rect width="64" x="416" y="-220" height="24" />
            <line x2="480" y1="-208" y2="-208" x1="416" />
            <rect width="64" x="416" y="-140" height="24" />
            <line x2="480" y1="-128" y2="-128" x1="416" />
            <rect width="64" x="416" y="-60" height="24" />
            <line x2="480" y1="-48" y2="-48" x1="416" />
        </blockdef>
        <blockdef name="RCL_PWM_x48">
            <timestamp>2015-4-16T16:21:22</timestamp>
            <rect width="180" x="156" y="-128" height="60" />
            <rect width="64" x="336" y="-108" height="24" />
            <line x2="400" y1="-96" y2="-96" x1="336" />
            <line x2="240" y1="-176" y2="-128" x1="240" />
            <line x2="256" y1="-176" y2="-128" x1="256" />
        </blockdef>
        <blockdef name="full_step_driver">
            <timestamp>2015-4-16T16:33:41</timestamp>
            <rect width="384" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-236" height="24" />
            <line x2="512" y1="-224" y2="-224" x1="448" />
        </blockdef>
        <blockdef name="half_step_driver">
            <timestamp>2015-4-16T16:33:52</timestamp>
            <rect width="384" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-236" height="24" />
            <line x2="512" y1="-224" y2="-224" x1="448" />
        </blockdef>
        <block symbolname="RCL_Quadrature_Decoder_x8" name="XLXI_1">
            <blockpin name="A(7:0)" />
            <blockpin name="B(7:0)" />
            <blockpin name="I(7:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
        <block symbolname="quad_inst" name="XLXI_2">
            <blockpin name="CLK" />
            <blockpin name="Reset" />
            <blockpin name="A_CLK" />
            <blockpin name="B_CLK" />
            <blockpin name="I_CLK" />
            <blockpin name="PULSE_COUNT(31:0)" />
            <blockpin name="REV_COUNT(31:0)" />
            <blockpin name="TSPEED(31:0)" />
            <blockpin name="TACCEL(31:0)" />
        </block>
        <block symbolname="RCL_PWM_x48" name="XLXI_3">
            <blockpin name="PWM(47:0)" />
            <blockpin name="wishbone_in(100:0)" />
            <blockpin name="wishbone_out(100:0)" />
        </block>
        <block symbolname="full_step_driver" name="XLXI_4">
            <blockpin name="clock" />
            <blockpin name="Direction" />
            <blockpin name="StepEnable" />
            <blockpin name="ProvideStaticHolding" />
            <blockpin name="StepDrive(3:0)" />
        </block>
        <block symbolname="half_step_driver" name="XLXI_5">
            <blockpin name="clock" />
            <blockpin name="Direction" />
            <blockpin name="StepEnable" />
            <blockpin name="ProvideStaticHolding" />
            <blockpin name="StepDrive(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="496" y="752" name="XLXI_1" orien="R0">
        </instance>
        <instance x="416" y="1264" name="XLXI_2" orien="R0">
        </instance>
        <instance x="160" y="368" name="XLXI_4" orien="R0">
        </instance>
        <instance x="784" y="368" name="XLXI_5" orien="R0">
        </instance>
        <instance x="1104" y="816" name="XLXI_3" orien="R0">
        </instance>
    </sheet>
</drawing>