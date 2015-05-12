//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Rectangle waveform generator
//////////////////////////////////////////////////////////////////////////////////

module rectangle_generator(
                           iClk, 
									iReset,
                           iEnable,									
									iDuty_cycle_type, 
									oData
									);
  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
  
  input iClk;
  input iReset;
  input iEnable;
  input [1:0] iDuty_cycle_type;
  output oData;
  
  //-------------------------------------------------------------------------------------------------------
  //  DUTY CYCLE TYPE
  //-------------------------------------------------------------------------------------------------------
  
  wire [15:0] duty_cycle [3:0];
 
  assign duty_cycle[0] = 16'b0011000000000000;
  assign duty_cycle[1] = 16'b0011110000000000;
  assign duty_cycle[2] = 16'b0011111111000000;
  assign duty_cycle[3] = 16'b1100001111111111;
  
  //-------------------------------------------------------------------------------------------------------
  //  DUTY CYCLE TYPE
  //-------------------------------------------------------------------------------------------------------

  wire duty_cycle_reset;


  //reset optimization
  comparator #(
    .WIDTH(2)
  ) cmp_duty_cycle (
    .iClk(iClk),
	 .iSignal(iDuty_cycle_type),
	 .oChange(duty_cycle_reset)
  );
  
  reg [15:0] wave = 127;
  
  always @(posedge iClk or posedge duty_cycle_reset or posedge iReset) // added ireset
  begin
    if (duty_cycle_reset || iReset) //added ireset
      wave <= duty_cycle[iDuty_cycle_type];	
    else
    begin
	   if (iEnable) 
		  wave <= {wave[0],wave[15:1]};
    end
  end
  
  assign oData = wave[0];
  
endmodule
