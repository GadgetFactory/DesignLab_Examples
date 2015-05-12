//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the Channel Mixer
//////////////////////////////////////////////////////////////////////////////////

module mixer(
              iRectangle1,
				  iRectangle2,
				  iTriangle,
				  iNoise,
//				  iDMC,
				  oDataR,
				  oDataC
				  );
			  
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------
  
  input [3:0] iRectangle1;
  input [3:0] iRectangle2;
  input [3:0] iTriangle;
  input [3:0] iNoise;
//  input [6:0] iDMC;
  output [15:0] oDataR;
  output [15:0] oDataC;
  
  //-------------------------------------------------------------------------------------------------------
  //  MIXING TABLE: Auto generated
  //-------------------------------------------------------------------------------------------------------
  
  wire [15:0] square_out [30:0];
  wire [15:0] tnd_out [202:0];

  assign square_out[0] = 15'd0;
  assign square_out[1] = 15'd5;
  assign square_out[2] = 15'd11;
  assign square_out[3] = 15'd17;
  assign square_out[4] = 15'd22;
  assign square_out[5] = 15'd28;
  assign square_out[6] = 15'd33;
  assign square_out[7] = 15'd38;
  assign square_out[8] = 15'd43;
  assign square_out[9] = 15'd48;
  assign square_out[10] = 15'd53;
  assign square_out[11] = 15'd58;
  assign square_out[12] = 15'd62;
  assign square_out[13] = 15'd67;
  assign square_out[14] = 15'd71;
  assign square_out[15] = 15'd76;
  assign square_out[16] = 15'd80;
  assign square_out[17] = 15'd84;
  assign square_out[18] = 15'd88;
  assign square_out[19] = 15'd92;
  assign square_out[20] = 15'd96;
  assign square_out[21] = 15'd100;
  assign square_out[22] = 15'd103;
  assign square_out[23] = 15'd107;
  assign square_out[24] = 15'd111;
  assign square_out[25] = 15'd114;
  assign square_out[26] = 15'd118;
  assign square_out[27] = 15'd121;
  assign square_out[28] = 15'd125;
  assign square_out[29] = 15'd128;
  assign square_out[30] = 15'd131;

  assign tnd_out[0] = 15'd0;
  assign tnd_out[1] = 15'd3;
  assign tnd_out[2] = 15'd6;
  assign tnd_out[3] = 15'd10;
  assign tnd_out[4] = 15'd13;
  assign tnd_out[5] = 15'd16;
  assign tnd_out[6] = 15'd20;
  assign tnd_out[7] = 15'd23;
  assign tnd_out[8] = 15'd26;
  assign tnd_out[9] = 15'd29;
  assign tnd_out[10] = 15'd33;
  assign tnd_out[11] = 15'd36;
  assign tnd_out[12] = 15'd39;
  assign tnd_out[13] = 15'd42;
  assign tnd_out[14] = 15'd45;
  assign tnd_out[15] = 15'd48;
  assign tnd_out[16] = 15'd51;
  assign tnd_out[17] = 15'd54;
  assign tnd_out[18] = 15'd57;
  assign tnd_out[19] = 15'd60;
  assign tnd_out[20] = 15'd63;
  assign tnd_out[21] = 15'd66;
  assign tnd_out[22] = 15'd69;
  assign tnd_out[23] = 15'd72;
  assign tnd_out[24] = 15'd75;
  assign tnd_out[25] = 15'd77;
  assign tnd_out[26] = 15'd80;
  assign tnd_out[27] = 15'd83;
  assign tnd_out[28] = 15'd86;
  assign tnd_out[29] = 15'd89;
  assign tnd_out[30] = 15'd91;
  assign tnd_out[31] = 15'd94;
  assign tnd_out[32] = 15'd97;
  assign tnd_out[33] = 15'd99;
  assign tnd_out[34] = 15'd102;
  assign tnd_out[35] = 15'd105;
  assign tnd_out[36] = 15'd107;
  assign tnd_out[37] = 15'd110;
  assign tnd_out[38] = 15'd112;
  assign tnd_out[39] = 15'd115;
  assign tnd_out[40] = 15'd118;
  assign tnd_out[41] = 15'd120;
  assign tnd_out[42] = 15'd123;
  assign tnd_out[43] = 15'd125;
  assign tnd_out[44] = 15'd128;
  assign tnd_out[45] = 15'd130;
  assign tnd_out[46] = 15'd132;
  assign tnd_out[47] = 15'd135;
  assign tnd_out[48] = 15'd137;
  assign tnd_out[49] = 15'd140;
  assign tnd_out[50] = 15'd142;
  assign tnd_out[51] = 15'd144;
  assign tnd_out[52] = 15'd147;
  assign tnd_out[53] = 15'd149;
  assign tnd_out[54] = 15'd151;
  assign tnd_out[55] = 15'd154;
  assign tnd_out[56] = 15'd156;
  assign tnd_out[57] = 15'd158;
  assign tnd_out[58] = 15'd161;
  assign tnd_out[59] = 15'd163;
  assign tnd_out[60] = 15'd165;
  assign tnd_out[61] = 15'd167;
  assign tnd_out[62] = 15'd169;
  assign tnd_out[63] = 15'd172;
  assign tnd_out[64] = 15'd174;
  assign tnd_out[65] = 15'd176;
  assign tnd_out[66] = 15'd178;
  assign tnd_out[67] = 15'd180;
  assign tnd_out[68] = 15'd182;
  assign tnd_out[69] = 15'd184;
  assign tnd_out[70] = 15'd186;
  assign tnd_out[71] = 15'd188;
  assign tnd_out[72] = 15'd190;
  assign tnd_out[73] = 15'd193;
  assign tnd_out[74] = 15'd195;
  assign tnd_out[75] = 15'd197;
  assign tnd_out[76] = 15'd199;
  assign tnd_out[77] = 15'd201;
  assign tnd_out[78] = 15'd203;
  assign tnd_out[79] = 15'd205;
  assign tnd_out[80] = 15'd206;
  assign tnd_out[81] = 15'd208;
  assign tnd_out[82] = 15'd210;
  assign tnd_out[83] = 15'd212;
  assign tnd_out[84] = 15'd214;
  assign tnd_out[85] = 15'd216;
  assign tnd_out[86] = 15'd218;
  assign tnd_out[87] = 15'd220;
  assign tnd_out[88] = 15'd222;
  assign tnd_out[89] = 15'd224;
  assign tnd_out[90] = 15'd225;
  assign tnd_out[91] = 15'd227;
  assign tnd_out[92] = 15'd229;
  assign tnd_out[93] = 15'd231;
  assign tnd_out[94] = 15'd233;
  assign tnd_out[95] = 15'd234;
  assign tnd_out[96] = 15'd236;
  assign tnd_out[97] = 15'd238;
  assign tnd_out[98] = 15'd240;
  assign tnd_out[99] = 15'd241;
  assign tnd_out[100] = 15'd243;
  assign tnd_out[101] = 15'd245;
  assign tnd_out[102] = 15'd247;
  assign tnd_out[103] = 15'd248;
  assign tnd_out[104] = 15'd250;
  assign tnd_out[105] = 15'd252;
  assign tnd_out[106] = 15'd253;
  assign tnd_out[107] = 15'd255;
  assign tnd_out[108] = 15'd257;
  assign tnd_out[109] = 15'd258;
  assign tnd_out[110] = 15'd260;
  assign tnd_out[111] = 15'd262;
  assign tnd_out[112] = 15'd263;
  assign tnd_out[113] = 15'd265;
  assign tnd_out[114] = 15'd266;
  assign tnd_out[115] = 15'd268;
  assign tnd_out[116] = 15'd270;
  assign tnd_out[117] = 15'd271;
  assign tnd_out[118] = 15'd273;
  assign tnd_out[119] = 15'd274;
  assign tnd_out[120] = 15'd276;
  assign tnd_out[121] = 15'd277;
  assign tnd_out[122] = 15'd279;
  assign tnd_out[123] = 15'd280;
  assign tnd_out[124] = 15'd282;
  assign tnd_out[125] = 15'd283;
  assign tnd_out[126] = 15'd285;
  assign tnd_out[127] = 15'd286;
  assign tnd_out[128] = 15'd288;
  assign tnd_out[129] = 15'd289;
  assign tnd_out[130] = 15'd291;
  assign tnd_out[131] = 15'd292;
  assign tnd_out[132] = 15'd294;
  assign tnd_out[133] = 15'd295;
  assign tnd_out[134] = 15'd297;
  assign tnd_out[135] = 15'd298;
  assign tnd_out[136] = 15'd299;
  assign tnd_out[137] = 15'd301;
  assign tnd_out[138] = 15'd302;
  assign tnd_out[139] = 15'd304;
  assign tnd_out[140] = 15'd305;
  assign tnd_out[141] = 15'd306;
  assign tnd_out[142] = 15'd308;
  assign tnd_out[143] = 15'd309;
  assign tnd_out[144] = 15'd310;
  assign tnd_out[145] = 15'd312;
  assign tnd_out[146] = 15'd313;
  assign tnd_out[147] = 15'd315;
  assign tnd_out[148] = 15'd316;
  assign tnd_out[149] = 15'd317;
  assign tnd_out[150] = 15'd318;
  assign tnd_out[151] = 15'd320;
  assign tnd_out[152] = 15'd321;
  assign tnd_out[153] = 15'd322;
  assign tnd_out[154] = 15'd324;
  assign tnd_out[155] = 15'd325;
  assign tnd_out[156] = 15'd326;
  assign tnd_out[157] = 15'd328;
  assign tnd_out[158] = 15'd329;
  assign tnd_out[159] = 15'd330;
  assign tnd_out[160] = 15'd331;
  assign tnd_out[161] = 15'd333;
  assign tnd_out[162] = 15'd334;
  assign tnd_out[163] = 15'd335;
  assign tnd_out[164] = 15'd336;
  assign tnd_out[165] = 15'd337;
  assign tnd_out[166] = 15'd339;
  assign tnd_out[167] = 15'd340;
  assign tnd_out[168] = 15'd341;
  assign tnd_out[169] = 15'd342;
  assign tnd_out[170] = 15'd344;
  assign tnd_out[171] = 15'd345;
  assign tnd_out[172] = 15'd346;
  assign tnd_out[173] = 15'd347;
  assign tnd_out[174] = 15'd348;
  assign tnd_out[175] = 15'd349;
  assign tnd_out[176] = 15'd351;
  assign tnd_out[177] = 15'd352;
  assign tnd_out[178] = 15'd353;
  assign tnd_out[179] = 15'd354;
  assign tnd_out[180] = 15'd355;
  assign tnd_out[181] = 15'd356;
  assign tnd_out[182] = 15'd357;
  assign tnd_out[183] = 15'd359;
  assign tnd_out[184] = 15'd360;
  assign tnd_out[185] = 15'd361;
  assign tnd_out[186] = 15'd362;
  assign tnd_out[187] = 15'd363;
  assign tnd_out[188] = 15'd364;
  assign tnd_out[189] = 15'd365;
  assign tnd_out[190] = 15'd366;
  assign tnd_out[191] = 15'd367;
  assign tnd_out[192] = 15'd368;
  assign tnd_out[193] = 15'd369;
  assign tnd_out[194] = 15'd371;
  assign tnd_out[195] = 15'd372;
  assign tnd_out[196] = 15'd373;
  assign tnd_out[197] = 15'd374;
  assign tnd_out[198] = 15'd375;
  assign tnd_out[199] = 15'd376;
  assign tnd_out[200] = 15'd377;
  assign tnd_out[201] = 15'd378;
  assign tnd_out[202] = 15'd379;
    
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  wire [4:0] rect;
  wire [7:0] tnd;
  
  assign rect = {1'b0, iRectangle1} + {1'b0, iRectangle2};
  assign tnd = {4'b0, iTriangle} + {4'b0, iTriangle} + {4'b0, iTriangle} + {4'b0, iNoise} + {4'b0, iNoise};
  
  assign oDataR = square_out[rect] +square_out[rect] +square_out[rect] + tnd_out[tnd]+ tnd_out[tnd];
  assign	oDataC = tnd_out[tnd];

endmodule
