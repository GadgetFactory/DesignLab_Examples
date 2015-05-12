//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Bill Dai
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the Triangle Channel
//////////////////////////////////////////////////////////////////////////////////

module triangle(
                iClk,
					 iReset,
					 iEnable,
					 iLength_clk,
					 iLinear_clk,
					 iRegister1,
					 iRegister2,
					 iRegister3,
					 iW1,
					 iW2,
					 iW3,
					 oData
					 );
  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iReset;
  input iEnable;
  input iLength_clk;
  input iLinear_clk;
  input [7:0] iRegister1; 
  input [7:0] iRegister2; 
  input [7:0] iRegister3;
  input iW1;
  input iW2;
  input iW3;
  output [3:0] oData;
  
  //-------------------------------------------------------------------------------------------------------
  //  TRIANGLE CLOCK
  //-------------------------------------------------------------------------------------------------------

  wire triangle_clk;

  clock_divider #(
  	 .DIVIDER_WIDTH(11)
  ) triangle_clk_divider (
    .iClk(iClk), 
	 .iReset(iReset | iW2 | iW3),
	 .iEnable(1'b1),
	 .iDivider({iRegister3[2:0], iRegister2[7:0]}),
    .oClk(triangle_clk)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  TRIANGLE GENERATOR
  //-------------------------------------------------------------------------------------------------------

  wire [3:0] triangle_generator_out;

  triangle_generator triangle_gen(
    .iClk(iClk),
	 .iReset(iReset),
    .iEnable(triangle_clk),	 
    .oData(triangle_generator_out)
  );

  //-------------------------------------------------------------------------------------------------------
  //  LENGTH COUNTER
  //-------------------------------------------------------------------------------------------------------
  
  wire length_counter_out;
  
  length_counter len_cnt(
    .iClk(iClk),
	 .iReset(iReset | iW3),
	 .iEnable(!iRegister1[7] && iLength_clk),
	 .iDuration(iRegister3[7:3]),
	 .oData(length_counter_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  LINEAR COUNTER
  //-------------------------------------------------------------------------------------------------------
  
  wire linear_counter_out;
  
  linear_counter lin_cnt(
    .iClk(iClk),
	 .iReset(iReset | iW3),
	 .iEnable(iLinear_clk),
	 .iControl_flag(iRegister1[7]),
	 .iDuration(iRegister1[6:0]),
	 .oData(linear_counter_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  assign oData = (iEnable && length_counter_out && linear_counter_out) ? (triangle_generator_out):0;
    

endmodule
