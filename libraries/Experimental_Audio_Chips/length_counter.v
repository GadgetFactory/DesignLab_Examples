//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Length Counter
//////////////////////////////////////////////////////////////////////////////////

module length_counter(
                      iClk, 
							 iReset, 
							 iEnable, 
							 iDuration, 
							 oData
							);
  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
  
  input iClk;
  input iReset;
  input iEnable;
  input [4:0] iDuration;
  output oData;
  
  //-------------------------------------------------------------------------------------------------------
  //  PERIOD TABLE
  //-------------------------------------------------------------------------------------------------------
  
  wire [7:0] duration_periods [31:0];

  assign duration_periods[0] = 8'h0A;
  assign duration_periods[1] = 8'hFE;
  assign duration_periods[2] = 8'h14;
  assign duration_periods[3] = 8'h02;
  assign duration_periods[4] = 8'h28;
  assign duration_periods[5] = 8'h04;
  assign duration_periods[6] = 8'h50;
  assign duration_periods[7] = 8'h06;
  assign duration_periods[8] = 8'hA0;
  assign duration_periods[9] = 8'h08;
  assign duration_periods[10] = 8'h3C;
  assign duration_periods[11] = 8'h0A;
  assign duration_periods[12] = 8'h0E;
  assign duration_periods[13] = 8'h0C;
  assign duration_periods[14] = 8'h1A;
  assign duration_periods[15] = 8'h0E;
  assign duration_periods[16] = 8'h0C;
  assign duration_periods[17] = 8'h10;
  assign duration_periods[18] = 8'h18;
  assign duration_periods[19] = 8'h12;
  assign duration_periods[20] = 8'h30;
  assign duration_periods[21] = 8'h14;
  assign duration_periods[22] = 8'h60;
  assign duration_periods[23] = 8'h16;
  assign duration_periods[24] = 8'hC0;
  assign duration_periods[25] = 8'h18;
  assign duration_periods[26] = 8'h48;
  assign duration_periods[27] = 8'h1A;
  assign duration_periods[28] = 8'h10;
  assign duration_periods[29] = 8'h1C;
  assign duration_periods[30] = 8'h20;
  assign duration_periods[31] = 8'h1E;
 
  //-------------------------------------------------------------------------------------------------------
  //  COUNTER
  //-------------------------------------------------------------------------------------------------------
 
  reg [7:0] counter;
 
  always @(posedge iClk or posedge iReset)
  begin
    if (iReset) counter <= duration_periods[iDuration];
	 else begin
      if (iEnable == 1)
      begin
	     if (counter > 0) counter <= counter - 1;
	   end
    end
  end
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  assign oData = (counter > 0) ? 1:0;

endmodule
