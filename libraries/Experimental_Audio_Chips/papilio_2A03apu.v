//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Top Level Module
//////////////////////////////////////////////////////////////////////////////////

////////////////////////////APU OPB REGISTER MAP//////////////////////////////////
//
//
// Rectangle 1 :
//  00 0 00 Register1 BASEADDR
//  01 1 04 Register2 BASEADDR + 4
//  02 2 08 Register3 BASEADDR + 8
//  03 3 0C Register4 BASEADDR + 12
//
//
// Rectangle 2 :
//  04 4 10 Register1 BASEADDR + 16
//  05 5 14 Register2 BASEADDR + 20
//  06 6 18 Register3 BASEADDR + 24
//  07 7 1C Register4 BASEADDR + 28
//
//
// Triangle :
//  08 8 20 Register1 BASEADDR + 32
//  09 9 24 NOT USED
//  0A 10 28 Register3 BASEADDR + 40
//  0B 11 2C Register4 BASEADDR + 44
//
//
// Noise :
//  0C 12  30 Register1 BASEADDR + 48
//  0D 13  34 NOT USED
//  0E 14  38 Register3 BASEADDR + 56
//  0F 15  3C Register4 BASEADDR + 60
//
//
// DMC :
//  10 16  40 Register1 BASEADDR + 64
//  11 17  44 Register2 BASEADDR + 68
//  12 18  48 Register3 BASEADDR + 72
//  13 19  4C Register4 BASEADDR + 76
//
//  14 20 50 NOT USED  
//  15 21 54 Status Register BASEADDR + 84
//  16 22 58 NOT USED
//  17 23 5C Frames BASEADDR + 92
//   
//////////////////////////////////////////////////////////////////////////////////

// uncomment this line for simulation
//`define SIMULATION 1

module papilio_2A03apu(
               wb_clk_i,
               wb_rst_i,
					wb_dat_o,
					wb_dat_i,
					wb_adr_i,
               wb_we_i,
               wb_cyc_i,
					wb_stb_i,
					wb_ack_o,
										
 //              iOPB_MnGrant,
 //              iOPB_xferAck,
 //              oMn_request,
 //              oMn_ABus,
//               oMn_DBus,
//               oMn_Select,
//               oMn_DBusEn,
//               oMn_BE,
//               oSln_DBus,
 //              oSln_xferAck,
//					iNES_clk,
					NES_apu_outR,
					NES_apu_outC
              );
					
  //-------------------------------------------------------------------------------------------------------
  //  PARAMETERS 
  //-------------------------------------------------------------------------------------------------------
  
  parameter C_BASEADDR = 32'h00000000;
  parameter C_HIGHADDR = 32'h00ffffff;
  parameter OPB_WIDTH = 32;
  parameter DMC_MEMORY = 32'h8040000;
					
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
	
  input wb_clk_i;
  input wb_rst_i;
  output [31:0] wb_dat_o;
  input [31:0] wb_dat_i;
  input [24:0] wb_adr_i;
  input wb_we_i;
  input wb_cyc_i;  //valid bus cycle input
  input wb_stb_i;
  // input iOPB_MnGrant;
  // input iOPB_xferAck;
  //output oMn_request;
  //output [OPB_WIDTH-1:0] oMn_ABus;
  //output [OPB_WIDTH-1:0] oMn_DBus;
  //output oMn_Select;
  //output oMn_DBusEn;
  //output oMn_RNW;
  //output [3:0] oMn_BE;
  //output oSln_xferAck;
  //output [OPB_WIDTH-1:0] oSln_DBus;
  output wb_ack_o; //bus cycle acknowledge output
//  output wb_inta_o; //interrupt request signal output
//  input iNES_clk;
  output [15:0] NES_apu_outR;
  output [15:0] NES_apu_outC;
  
  reg wb_ack_o;
   
  //-------------------------------------------------------------------------------------------------------
  //  OPB STATE MACHINE
  //-------------------------------------------------------------------------------------------------------
    
  reg [2:0] OPB_state; 
  
  parameter OPB_RESET_0 = 0;
  parameter OPB_RESET_1 = 1;
  parameter OPB_RESET_2 = 2;
  parameter OPB_READY = 3;
  parameter OPB_SLAVE_READ = 4;
  parameter OPB_SLAVE_WRITE = 5;
  parameter OPB_MASTER_REQUEST = 6;
  parameter OPB_MASTER_SELECT = 7;
  
  reg OPB_DMA_req;
  wire[OPB_WIDTH-1:0] DMA_addr;
  
  wire reset_channels; 
  wire ValidAddr;   
  
  assign reset_channels = OPB_state == OPB_RESET_0 || OPB_state == OPB_RESET_2;
  assign ValidAddr = (wb_adr_i <= C_HIGHADDR) & (wb_adr_i >= C_BASEADDR);
  
  always @(posedge wb_clk_i or posedge wb_rst_i)  
  begin
    if (wb_rst_i)
	   OPB_state <= OPB_RESET_0;
	 else
    begin
	   case (OPB_state)
	     OPB_RESET_0: 
		    OPB_state <= OPB_RESET_1;
	     OPB_RESET_1: 
		    OPB_state <= OPB_RESET_2;
	     OPB_RESET_2: 
		    OPB_state <= OPB_READY;
	     OPB_READY: 
		  begin
		    //MASTER
			 //if (OPB_DMA_req) OPB_state <= OPB_MASTER_REQUEST;	
			 //else begin
			 //SLAVE
            if (wb_cyc_i & wb_stb_i & ValidAddr)
	         begin
		        if (wb_we_i)  
		          OPB_state <= OPB_SLAVE_WRITE;  //edited TAG 12/6/13
		        else
		          OPB_state <= OPB_SLAVE_WRITE;
		      end
	       //end
		  end
	     OPB_MASTER_REQUEST:
		    OPB_state <= OPB_READY;
		  OPB_MASTER_SELECT:
		    OPB_state <= OPB_READY;
		  default:
		    OPB_state <= OPB_READY;
      endcase
	 end
  end		  
  
 
  //-------------------------------------------------------------------------------------------------------
  //  REGISTERS
  //-------------------------------------------------------------------------------------------------------
  
  parameter NUMBER_OF_REGISTERS = 24;
  parameter STATUS_REGISTER = 21;
  parameter FRAME_REGISTER = 23;
  
  reg [7:0] registers [NUMBER_OF_REGISTERS - 1:0];
  reg registers_w [NUMBER_OF_REGISTERS - 1:0];
  
  wire [4:0] register_index;

  assign register_index = (wb_adr_i - C_BASEADDR) ;
  
  always @(posedge wb_clk_i)
  begin
    if (OPB_state == OPB_RESET_0)
	 begin
      registers[0] <= 8'h10;  
		registers[1] <= 8'h00;
		registers[2] <= 8'h00;
		registers[3] <= 8'h00;  
		registers[4] <= 8'h10;
		registers[5] <= 8'h00;
		registers[6] <= 8'h00;
		registers[7] <= 8'h00;
		registers[8] <= 8'h10;
		registers[9] <= 8'h00;
		registers[10] <= 8'h00;
		registers[11] <= 8'h00;
		registers[12] <= 8'h10;
		registers[13] <= 8'h00;
		registers[14] <= 8'h00;
		registers[15] <= 8'h00;
		registers[16] <= 8'h00;
		registers[17] <= 8'h00;
		registers[18] <= 8'h00;
		registers[19] <= 8'h00;
		registers[20] <= 8'h00;
		registers[21] <= 8'h0f;  
		registers[22] <= 8'h00;
		registers[23] <= 8'h00;
	end else
	 if ( wb_cyc_i & wb_stb_i & wb_we_i )
    begin
      registers[register_index] <= wb_dat_i[7:0]; 
	 end
   end

  integer index;		
		
  always @*
  begin
	 for (index = 0; index < NUMBER_OF_REGISTERS; index = index + 1)
	 begin
	   registers_w[index] = 0;
	 end
	 if (OPB_state == OPB_SLAVE_WRITE)
	   registers_w[register_index] = 1;
	 else registers_w[register_index] = 0;
  end
	  
   //-------------------------------------------------------------------------------------------------------
  //  OPB -WISHBONE SIGNALS
  //-------------------------------------------------------------------------------------------------------
   
 // wire OPB_ack; 
  
 // assign OPB_ack = (OPB_state == OPB_MASTER_SELECT) && (iOPB_xferAck);
  
  always @(posedge wb_clk_i)
	wb_ack_o <= #1 wb_cyc_i & wb_stb_i & ~wb_ack_o;  // because timing is always honored
 
  //assign oSln_DBus = (OPB_state == OPB_SLAVE_READ) ? { {(OPB_WIDTH - 8) {1'b0}}, registers[register_index]}:0;
  //assign oSln_xferAck = (OPB_state == OPB_SLAVE_READ || OPB_state == OPB_SLAVE_WRITE);
  
  //assign oMn_request = (OPB_state == OPB_MASTER_REQUEST);
  //assign oMn_ABus = (OPB_state == OPB_MASTER_SELECT) ? DMA_addr:0;  
  //assign oMn_DBus = 0;
  //assign oMn_Select = (OPB_state == OPB_MASTER_SELECT) ? 1:0;
  //assign oMn_DBusEn = 0;
  //assign oMn_BE = (OPB_state == OPB_MASTER_SELECT) ? 4'b1111:0;
  //assign oMn_RNW = (OPB_state == OPB_MASTER_SELECT) ? 1:0;  

 
  //-------------------------------------------------------------------------------------------------------
  //  DMA SIGNALS Synchronization: Crossing NES CPU - OPB Clock domains. Each DMA signal is synchronous 
  //                               has corresponding synhronous instance in each domain
  //-------------------------------------------------------------------------------------------------------

  //iNES_clk driven signals
//  wire NES_DMA_ack;
//  wire NES_DMA_req;
    
  //wb_clk_i driven signals
//  wire OPB_DMA_req_tick;
//  reg OPB_ack_hold; 

  //NES to OPB synchronizer for DMA request
//  sampler nes_opb(
//    .iClk(wb_clk_i),
//	 .iSignal(NES_DMA_req),
//	 .oSignal(OPB_DMA_req_tick)
//  );
  
//  always @(posedge wb_clk_i or posedge wb_rst_i)
//  begin
//    if (wb_rst_i) OPB_DMA_req <= 0;
//	 else begin
//	   if (OPB_ack) OPB_DMA_req <= 0;
//	   else if (OPB_DMA_req_tick) OPB_DMA_req <= 1;
//	 end
//  end

  //OPB to NES synchronizer for OPB acknowledge
//  sampler opb_nes(
//    .iClk(iNES_clk),
//	 .iSignal(OPB_ack_hold),
//	 .oSignal(NES_DMA_ack)
//  );
  
//  always @(posedge wb_clk_i or posedge wb_rst_i)
//  begin
 //   if (wb_rst_i) OPB_ack_hold <= 0;
//	 else begin
//      if (NES_DMA_ack) OPB_ack_hold <= 0;
//	   else if (OPB_ack) OPB_ack_hold <= 1;
//	 end
//  end
  
  //-------------------------------------------------------------------------------------------------------
  //  DMA DATA and ADDRESS Transformation
  //-------------------------------------------------------------------------------------------------------
  
//  wire [15:0] NES_DMA_addr;
 // reg [7:0] OPB_DMA_data;
  
 // wire [15:0] NES_DMA_addr_relative;
//  wire [1:0] DMA_BE;
//  reg [7:0] OPB_data_byte;
  
//  assign NES_DMA_addr_relative = NES_DMA_addr - 16'h8000;
//  assign DMA_BE = NES_DMA_addr_relative[1:0];
//  assign DMA_addr = DMC_MEMORY + {(NES_DMA_addr_relative >> 2), 2'b00};  
  
//  always @*
//  begin
 //   case (DMA_BE)
//	   0 : OPB_data_byte = wb_dat_i[31:24];
//		1 : OPB_data_byte = wb_dat_i[23:16];
//	   2 : OPB_data_byte = wb_dat_i[15:8];
//      3 : OPB_data_byte = wb_dat_i[7:0];
//	 endcase  
 // end
  
 // always @(posedge wb_clk_i)
 // begin
 //   if (OPB_ack) 
//	 begin
//	   OPB_DMA_data <= OPB_data_byte;
//	 end
//  end
reg [7:0] predivcnt;
reg [0:0] iNES_clk;

always @(posedge wb_clk_i)
begin
if (wb_rst_i==1) 
		begin
			iNES_clk = 0;
			predivcnt = 26;
		end else
//			iNES_clk <='0';
		if (predivcnt==0)
			begin
			iNES_clk = !iNES_clk;
			predivcnt = 26;
		   end else
			predivcnt = predivcnt -1 ;
			end 
		

  //-------------------------------------------------------------------------------------------------------
  //  APU
  //-------------------------------------------------------------------------------------------------------
 
  wire [15:0] NES_apu_out;
 // wire NES_IRQ;
 
  apu apu(
    .iClk(iNES_clk),
	 .iReset(reset_channels),
	 .iRegister4000(registers[0]),
	 .iRegister4001(registers[1]),
	 .iRegister4002(registers[2]),
	 .iRegister4003(registers[3]),
	 .iRegister4004(registers[4]),
	 .iRegister4005(registers[5]),
	 .iRegister4006(registers[6]),
	 .iRegister4007(registers[7]),
	 .iRegister4008(registers[8]),
	 .iRegister400A(registers[10]),
    .iRegister400B(registers[11]),
	 .iRegister400C(registers[12]),
	 .iRegister400E(registers[14]),
	 .iRegister400F(registers[15]),
	 .iRegister4010(registers[16]),
	 .iRegister4011(registers[17]),
	 .iRegister4012(registers[18]),
	 .iRegister4013(registers[19]),
	 .iRegister4015(registers[21]),
	 .iRegister4017(registers[23]),
	 .iW4000(registers_w[0]),
	 .iW4001(registers_w[1]),
	 .iW4002(registers_w[2]),
	 .iW4003(registers_w[3]),
	 .iW4004(registers_w[4]),
	 .iW4005(registers_w[5]),
	 .iW4006(registers_w[6]),
	 .iW4007(registers_w[7]),
	 .iW4008(registers_w[8]),
	 .iW400A(registers_w[10]),
	 .iW400B(registers_w[11]),
	 .iW400C(registers_w[12]),
	 .iW400E(registers_w[14]),
	 .iW400F(registers_w[15]),
	 .iW4010(registers_w[16]),
	 .iW4011(registers_w[17]),
	 .iW4012(registers_w[18]),
	 .iW4013(registers_w[19]),
	 .iW4015(registers_w[21]),
	 .iW4017(registers_w[23]),
//	 .iDMA_ack(NES_DMA_ack),
//	 .iDMA_data(OPB_DMA_data),
//	 .oDMA_req(NES_DMA_req),
//	 .oDMA_addr(NES_DMA_addr),
	 .oDataR(NES_apu_outR),
	 .oDataC(NES_apu_outC)
//	 .oIRQ(NES_IRQ)
  );
        	
	    	
endmodule


