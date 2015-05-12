//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the Rectangle Channel
//////////////////////////////////////////////////////////////////////////////////

module rectangle(
                 iClk, 
					  iReset,
					  iEnable,
					  iEnvelope_clk, 
					  iLength_sweep_clk,
					  iRegister1, 
					  iRegister2, 
					  iRegister3, 
					  iRegister4, 
					  iW1, 
					  iW2, 
					  iW3, 
					  iW4, 
					  oData
					  );
  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iReset;
  input iEnable;
  input iEnvelope_clk;
  input iLength_sweep_clk;
  input [7:0] iRegister1; 
  input [7:0] iRegister2; 
  input [7:0] iRegister3;
  input [7:0] iRegister4; 
  input iW1;
  input iW2;
  input iW3;
  input iW4;
  output [3:0] oData;
  
  //-------------------------------------------------------------------------------------------------------
  //  FREQUENCY GENERATOR
  //-------------------------------------------------------------------------------------------------------
  
  wire frequency_generator_out;
  wire sweep_silence;
  
  frequency_generator freq_gen(
    .iClk(iClk),
	 .iReset(iReset),
	 .iSweep_clk(iLength_sweep_clk),
	 .iSweep_reset(iReset | iW2),
	 .iSweep_enable(iRegister2[7]),
	 .iSweep_refresh_rate(iRegister2[6:4]),
	 .iSweep_mode(iRegister2[3]),
	 .iSweep_shift(iRegister2[2:0]),
	 .iPeriod_reset(iReset | iW3 | iW4),
	 .iPeriod({iRegister4[2:0], iRegister3[7:0]}),
	 .oSweep_Silence(sweep_silence),
	 .oData(frequency_generator_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  RECTANGLE GENERATOR
  //-------------------------------------------------------------------------------------------------------
		
  wire rectangle_generator_out;
		
  rectangle_generator rect_gen(
    .iClk(iClk),
	 .iReset(iReset | iW4 ), //changed 12/17
	 .iEnable(frequency_generator_out),
	 .iDuty_cycle_type(iRegister1[7:6]),
    .oData(rectangle_generator_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  VOLUME GENERATOR
  //-------------------------------------------------------------------------------------------------------

  wire [3:0] volume_generator_out;

  volume_generator vol_gen(
    .iClk(iClk),
	 .iReset(iReset | iW4), //changed 12/17
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
	 .iReset(iReset | iW4),
	 .iEnable(!iRegister1[5] && iLength_sweep_clk),
	 .iDuration(iRegister4[7:3]),
	 .oData(length_counter_out)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  assign oData = (iEnable && rectangle_generator_out && length_counter_out && !sweep_silence) ? (volume_generator_out):0;

endmodule
