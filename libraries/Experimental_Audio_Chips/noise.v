//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the Noise Channel
//////////////////////////////////////////////////////////////////////////////////

module noise(
             iClk,
				 iReset,
				 iEnable,
				 iEnvelope_clk,
				 iLength_clk,
				 iRegister1,
				 iRegister2,
				 iRegister3,
				 iW1,
				 iW2,
				 iW3,
				 oData);


  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iReset;
  input iEnable;
  input iEnvelope_clk;
  input iLength_clk;
  input [7:0] iRegister1; 
  input [7:0] iRegister2; 
  input [7:0] iRegister3;
  input iW1;
  input iW2;
  input iW3;
  output [3:0] oData;
    
  //-------------------------------------------------------------------------------------------------------
  //  PERIOD TABLE
  //-------------------------------------------------------------------------------------------------------

  wire [11:0] timer_periods [15:0];
 
  assign timer_periods[0] = 12'h004;
  assign timer_periods[1] = 12'h008;
  assign timer_periods[2] = 12'h010;
  assign timer_periods[3] = 12'h020;
  assign timer_periods[4] = 12'h040;
  assign timer_periods[5] = 12'h060;
  assign timer_periods[6] = 12'h080;
  assign timer_periods[7] = 12'h0A0;
  assign timer_periods[8] = 12'h0CA;
  assign timer_periods[9] = 12'h0FE;
  assign timer_periods[10] = 12'h17C;
  assign timer_periods[11] = 12'h1FC;
  assign timer_periods[12] = 12'h2FA;
  assign timer_periods[13] = 12'h3F8;
  assign timer_periods[14] = 12'h7F2;
  assign timer_periods[15] = 12'hFE4;

  //-------------------------------------------------------------------------------------------------------
  //  RANDOM GENERATOR CLOCK
  //-------------------------------------------------------------------------------------------------------

  wire random_generator_clk;

  wire [11:0] period;
  assign period = timer_periods[iRegister2[3:0]];

  clock_divider #(
  	 .DIVIDER_WIDTH(12)
  ) clk_random (
    .iClk(iClk), 
	 .iReset(iReset | iW2),
	 .iEnable(1'b1),
	 .iDivider(period),
    .oClk(random_generator_clk)
  );		
  
  //-------------------------------------------------------------------------------------------------------
  //  RANDOM GENERATOR
  //-------------------------------------------------------------------------------------------------------

  wire random_generator_out;
		
  random_generator random_gen(
    .iClk(iClk),
	 .iReset(iReset | iW1),
	 .iEnable(random_generator_clk), 
	 .iMode(iRegister2[7]),
    .oData(random_generator_out)
  );

  //-------------------------------------------------------------------------------------------------------
  //  VOLUME GENERATOR
  //-------------------------------------------------------------------------------------------------------
  
  wire [3:0] volume_generator_out;

  volume_generator vol_gen(
    .iClk(iClk),
	 .iReset(iReset | iW1),
	 .iEnable(!iRegister1[4]),
	 .iEnvelope_clk(iEnvelope_clk),
	 .iVolume_or_decay_rate(iRegister1[3:0]),
	 .iEnable_loop(iRegister1[5]),
	 .oData(volume_generator_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  LENGTH COUNTER
  //-------------------------------------------------------------------------------------------------------
    
  wire length_counter_out;
  
  length_counter len_cnt(
    .iClk(iClk),
	 .iReset(iReset | iW3),
	 .iEnable(!iRegister1[5] && iLength_clk),
	 .iDuration(iRegister3[7:3]),
	 .oData(length_counter_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  assign oData = (iEnable && random_generator_out && length_counter_out) ? (volume_generator_out):0;

endmodule