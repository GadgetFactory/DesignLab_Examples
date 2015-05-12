//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Edge detector: input signal is sampled by iClk, and the oSignal is raised when 
// posedge is detected
//////////////////////////////////////////////////////////////////////////////////

module sampler(
				   iClk, 
					iSignal, 
					oSignal
					);

  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iSignal;
  output oSignal;
  
  //-------------------------------------------------------------------------------------------------------
  //  REGISTERS
  //-------------------------------------------------------------------------------------------------------
  
  reg buffer_before;
  reg buffer_after;
   
  always @(posedge iClk)
  begin
    buffer_before <= iSignal;
  end
  
  always @(posedge iClk)
  begin
    buffer_after <= buffer_before;
  end
	
  assign oSignal = (buffer_before && !buffer_after);

endmodule
