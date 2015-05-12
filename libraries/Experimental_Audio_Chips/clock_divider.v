//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Module use to derive needed frequencies.
// Dividies iEnable (sampled by iClk) by iDivider + 1
//////////////////////////////////////////////////////////////////////////////////

module clock_divider(
							iClk, 
							iReset, 
							iEnable,
							iDivider, 
							oClk
							);
  
  //-------------------------------------------------------------------------------------------------------
  //  PARAMETERS
  //-------------------------------------------------------------------------------------------------------
  
  parameter DIVIDER_WIDTH = 4;
  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
  
  input iClk;
  input iReset;
  input iEnable;
  input [DIVIDER_WIDTH-1:0] iDivider;
  output oClk;
  
  reg [DIVIDER_WIDTH-1:0] counter;
    
  always @(posedge iClk or posedge iReset)
  begin
    if (iReset)
	   counter <= iDivider;
    else
	   if (iEnable)
		begin
	     if (counter == 0) 
	       counter <= iDivider;
        else 
		    counter <= counter - 1;
	  end
  end
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  
  //Sampler so that high is hold only for one cycle of iClk
  sampler sampler(
    .iClk(iClk),
	 .iSignal(counter == 0),
	 .oSignal(sampler_signal)
  );
  
  //Warning: if iDivider is 0, there will be no phase shift, otherwise the outpu signal will be one cycle late!
  assign oClk = (iDivider == 0) ? iEnable:sampler_signal;

  
endmodule
