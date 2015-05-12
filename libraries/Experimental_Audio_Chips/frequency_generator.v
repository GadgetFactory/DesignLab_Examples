//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Frequency generator (sweep unit) for the Rectangle Channels
//////////////////////////////////////////////////////////////////////////////////

module frequency_generator(
                           iClk,
									iReset,
									iSweep_clk, 
									iSweep_reset,
									iSweep_enable, 
									iSweep_refresh_rate,
									iSweep_mode, 
									iSweep_shift, 
									iPeriod_reset, 
									iPeriod,
									oSweep_Silence,
									oData
									);
									
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
									
  input iClk;
  input iReset;
  input iSweep_clk;
  input iSweep_reset;
  input iSweep_enable;
  input [2:0] iSweep_refresh_rate;
  input iSweep_mode;
  input [2:0] iSweep_shift;
  input iPeriod_reset;
  input [10:0] iPeriod;
  output oSweep_Silence;
  output oData;

  //-------------------------------------------------------------------------------------------------------
  //  SWEEP REFRESH RATE CLOCK
  //-------------------------------------------------------------------------------------------------------

  /*wire sweep_refresh_rate_change;

  comparator #(
    .WIDTH(3)
  ) cmp_sweep_refresh_rate (
    .iClk(iClk),
	 .iSignal(iSweep_refresh_rate),
	 .oChange(sweep_refresh_rate_change)
  );*/

  wire sweep_refresh_rate_clk;
  
  clock_divider #(
  	 .DIVIDER_WIDTH(3)
  ) clk_refresh(
    .iClk(iClk), 
	 .iReset(iSweep_reset),
	 .iEnable(iSweep_clk && iSweep_enable),
	 .iDivider(iSweep_refresh_rate),
    .oClk(sweep_refresh_rate_clk)
  );
    
  //-------------------------------------------------------------------------------------------------------
  //  INTERNAL PERIOD
  //-------------------------------------------------------------------------------------------------------
  
  reg [11:0] internal_period;
  reg silence;
  
  always @(posedge iClk or posedge iPeriod_reset)
  begin
    if (iPeriod_reset)
	 begin
	   internal_period <= iPeriod;
	 end
	 else
    begin
      if (sweep_refresh_rate_clk)
	   begin
	     if (iSweep_mode == 0) internal_period <= internal_period + (internal_period >> iSweep_shift);
		  else internal_period <= internal_period - (internal_period >> iSweep_shift);
		  if (internal_period[11]) silence <=1;
		  else silence <=0;
	   end
    end
  end 
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT FREQUENCY 
  //-------------------------------------------------------------------------------------------------------
  
  wire p_reset;
  
  assign p_reset = /*iPeriod_reset |*/ sweep_refresh_rate_clk;
  
  clock_divider #(
  	 .DIVIDER_WIDTH(11)
  ) clk_output (
    .iClk(iClk), 
	 .iReset(iReset),//p_reset),
	 .iEnable(1'b1),
	 .iDivider(internal_period),
    .oClk(oData)
  );
  
  assign oSweep_Silence = silence;
 
endmodule
