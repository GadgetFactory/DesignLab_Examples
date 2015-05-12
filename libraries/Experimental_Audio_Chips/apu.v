//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the APU Core
//////////////////////////////////////////////////////////////////////////////////

module apu(
           iClk,
			  iReset,
			  iRegister4000,
			  iRegister4001,
			  iRegister4002,
			  iRegister4003,
			  iRegister4004,
			  iRegister4005,
			  iRegister4006,
			  iRegister4007,
			  iRegister4008,
			  iRegister400A,
			  iRegister400B,
			  iRegister400C,
			  iRegister400E,
			  iRegister400F,
			  iRegister4010,
			  iRegister4011,
			  iRegister4012,
			  iRegister4013,
			  iRegister4015,
			  iRegister4017,
			  iW4000,
			  iW4001,
			  iW4002,
			  iW4003,
			  iW4004,
			  iW4005,
			  iW4006,
			  iW4007,
			  iW4008,
			  iW400A,
			  iW400B,
			  iW400C,
			  iW400E,
			  iW400F,
			  iW4010,
			  iW4011,
			  iW4012,
			  iW4013,
			  iW4015,
			  iW4017,
//			  iDMA_ack,
//			  iDMA_data,
//			  oDMA_req,
//			  oDMA_addr,
			  oDataR,
			  oDataC
//			  oIRQ
			  );
			  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
  
  input iClk;
  input iReset;
  input [7:0] iRegister4000;
  input [7:0] iRegister4001;
  input [7:0] iRegister4002;
  input [7:0] iRegister4003;
  input [7:0] iRegister4004;
  input [7:0] iRegister4005;
  input [7:0] iRegister4006;
  input [7:0] iRegister4007;
  input [7:0] iRegister4008;
  input [7:0] iRegister400A;
  input [7:0] iRegister400B;
  input [7:0] iRegister400C;
  input [7:0] iRegister400E;
  input [7:0] iRegister400F;
  input [7:0] iRegister4010;
  input [7:0] iRegister4011;
  input [7:0] iRegister4012;
  input [7:0] iRegister4013;
  input [7:0] iRegister4015;
  input [7:0] iRegister4017;
  input iW4000;
  input iW4001;
  input iW4002;
  input iW4003;
  input iW4004;
  input iW4005;
  input iW4006;
  input iW4007;
  input iW4008;
  input iW400A;
  input iW400B;
  input iW400C;
  input iW400E;
  input iW400F;
  input iW4010;
  input iW4011;
  input iW4012;
  input iW4013;  
  input iW4015;
  input iW4017;
//  input iDMA_ack;
//  input [7:0] iDMA_data;
//  output oDMA_req;
//  output [15:0] oDMA_addr;
  output [15:0] oDataR;
  output [15:0] oDataC;
//  output oIRQ;
   
  //-------------------------------------------------------------------------------------------------------
  //  FRAME SEQUENCER
  //-------------------------------------------------------------------------------------------------------
  
  wire IRQ_clk;
  wire length_sweep_clk;
  wire envelop_linear_clk;

  frame_sequencer frame_seq(
    .iClk(iClk),
	 .iReset(iReset | iW4017),
	 .iMode(iRegister4017[7]),
	 .oIRQ_clk(IRQ_clk),
	 .oLength_sweep_clk(length_sweep_clk),
	 .oEnvelope_linear_clk(envelop_linear_clk)
  );
	   
  //-------------------------------------------------------------------------------------------------------
  //  RECTANGLE 1 CHANNEL
  //-------------------------------------------------------------------------------------------------------
  
  wire [3:0] rectangle1_out;
  
  rectangle rectangle_1(
    .iClk(iClk),
	 .iReset(iReset),
	 .iEnable(iRegister4015[0]),
	 .iEnvelope_clk(envelop_linear_clk),
	 .iLength_sweep_clk(length_sweep_clk),
	 .iRegister1(iRegister4000),
	 .iRegister2(iRegister4001),
	 .iRegister3(iRegister4002),
	 .iRegister4(iRegister4003),
	 .iW1(iW4000),
	 .iW2(iW4001),
	 .iW3(iW4002),
	 .iW4(iW4003),
	 .oData(rectangle1_out)
  );
    
  //-------------------------------------------------------------------------------------------------------
  //  RECTANGLE 2 CHANNEL
  //-------------------------------------------------------------------------------------------------------
  
  wire [3:0] rectangle2_out;
  
  rectangle rectangle_2(
    .iClk(iClk),
	 .iReset(iReset),
	 .iEnable(iRegister4015[1]),
	 .iEnvelope_clk(envelop_linear_clk),
	 .iLength_sweep_clk(length_sweep_clk),
	 .iRegister1(iRegister4004),
	 .iRegister2(iRegister4005),
	 .iRegister3(iRegister4006),
	 .iRegister4(iRegister4007),
	 .iW1(iW4004),
	 .iW2(iW4005),
	 .iW3(iW4006),
	 .iW4(iW4007),
	 .oData(rectangle2_out)
  );
      
  //-------------------------------------------------------------------------------------------------------
  //  TRIANGLE CHANNEL
  //-------------------------------------------------------------------------------------------------------

  wire [3:0] triangle_out;
  
  triangle triangle(
    .iClk(iClk),
	 .iReset(iReset),
	 .iEnable(iRegister4015[2]),
	 .iLength_clk(length_sweep_clk),
	 .iLinear_clk(envelop_linear_clk),
	 .iRegister1(iRegister4008),
	 .iRegister2(iRegister400A),
	 .iRegister3(iRegister400B),
	 .iW1(iW4008),
	 .iW2(iW400A),
	 .iW3(iW400B),
	 .oData(triangle_out)
  );		

  //-------------------------------------------------------------------------------------------------------
  //  NOISE CHANNEL
  //-------------------------------------------------------------------------------------------------------

  wire [3:0] noise_out;
  
  noise noise(
    .iClk(iClk),
    .iReset(iReset),
	 .iEnable(iRegister4015[3]),
	 .iEnvelope_clk(envelop_linear_clk),
	 .iLength_clk(length_sweep_clk),
	 .iRegister1(iRegister400C),
	 .iRegister2(iRegister400E),
	 .iRegister3(iRegister400F),
	 .iW1(iW400C),
	 .iW2(iW400E),
	 .iW3(iW400F),
	 .oData(noise_out)
  );	
  			  
  //-------------------------------------------------------------------------------------------------------
  //  DMC CHANNEL
  //-------------------------------------------------------------------------------------------------------
  
 // wire [6:0] dmc_out;
 // wire dmc_irq;
  
 // dmc dmc(
 //   .iClk(iClk),
//	 .iReset(iReset),
//	 .iEnable(iRegister4015[4]),
//	 .iRegister1(iRegister4010),
//	 .iRegister2(iRegister4011),
//	 .iRegister3(iRegister4012),
//	 .iRegister4(iRegister4013),
//	 .iW1(iW4010),
//	 .iW2(iW4011),
//	 .iW3(iW4012),
//	 .iW4(iW4013),
//	 .iDMA_ack(iDMA_ack),
//	 .iDMA_data(iDMA_data),
//	 .oDMA_req(oDMA_req),
//	 .oDMA_addr(oDMA_addr),
//	 .oData(dmc_out),
//	 .oIRQ(dmc_irq)
//  );
    
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  mixer mixer(
    .iRectangle1(rectangle1_out),
	 .iRectangle2(rectangle2_out),
	 .iTriangle(triangle_out),
	 .iNoise(noise_out),
//	 .iDMC(dmc_out),
	 .oDataR(oDataR),
	 .oDataC(oDataC)
  );
  
  //------------------------------------------------------------------------------------------------------
  //  INTERRUPTS
  //------------------------------------------------------------------------------------------------------
  
//  assign oIRQ = 0;
  
endmodule
