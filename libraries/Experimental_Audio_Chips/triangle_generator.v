//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Bill Dai
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Triangle waveform generator
//////////////////////////////////////////////////////////////////////////////////

module triangle_generator(
                          iClk,
								  iReset,
								  iEnable,
								  oData
								  );

  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iReset;
  input iEnable;
  output reg [3:0] oData;

  //-------------------------------------------------------------------------------------------------------
  //  USING COUNTER TO GENERATE WAVE FORM: 0, 1, 2, 3, ... F, F, E, D, ..., 0
  //-------------------------------------------------------------------------------------------------------
  
  //Mode register: 0 counting up, mode 1 counting down  
  reg mode;
  
  always @(posedge iClk or posedge iReset)
  begin
    if (iReset == 1)
    begin
      oData <= 4'b0000;
		mode <= 0;
    end else
    begin
	   if (iEnable)
		begin
        if (mode == 0)
		  begin
		    if (oData < 4'b1111) 
		      oData <= oData + 1;
		    else mode <= 1;
		  end else
		  begin
		    if (oData > 4'b0000) 
		      oData <= oData - 1;
		    else mode <= 0;
		  end
      end
    end
  end 

endmodule
