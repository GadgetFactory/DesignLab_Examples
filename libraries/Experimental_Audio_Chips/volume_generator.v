//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the Volume Generator, it determines the volume of certain 
// channels
//////////////////////////////////////////////////////////////////////////////////

module volume_generator(
                        iClk, 
								iReset, 
								iEnable,
								iEnvelope_clk,
								iVolume_or_decay_rate, 
								iEnable_loop,
								oData
								);
  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
  
  input iClk;
  input iReset;
  input iEnable;
  input iEnvelope_clk;
  input [3:0] iVolume_or_decay_rate;
  input iEnable_loop;
  output [3:0] oData;
    
  //-------------------------------------------------------------------------------------------------------
  //  ENVELOPE CLOCK
  //-------------------------------------------------------------------------------------------------------

  wire envelope_clk;
  
  clock_divider #(
  	 .DIVIDER_WIDTH(4)
  ) clk_decay (
    .iClk(iClk), 
	 .iReset(iReset),
	 .iEnable(iEnvelope_clk),
	 .iDivider(iVolume_or_decay_rate),
    .oClk(envelope_clk)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  INTERNAL VOLUME REGISTER
  //-------------------------------------------------------------------------------------------------------

  reg [3:0] internal_volume;
  
  always @(posedge iClk or posedge iReset)
  begin
    if (iReset) internal_volume <= 4'b1111;//iVolume_or_decay_rate;
	 else
    begin
      if (envelope_clk)
      begin		
        if (internal_volume == 0)
	     begin  
		    if (iEnable_loop) internal_volume <= 4'b1111;
	     end else
	     internal_volume <= internal_volume - 1;
		end
    end
  end
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  assign oData = (iEnable) ? internal_volume:iVolume_or_decay_rate;
  	
endmodule
