// Filename:          OPB_PS2_Joypad_v1_00_a\src\OPB_PS2_Joypad.c
// Version:           1.00.a
// Description:       OPB_PS2_Joypad Driver Source File
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "OPB_PS2_Joypad.h"

/************************** Function Definitions ***************************/


void fillStruct(PS2pad *pad){
  pad->regs.reg0 = OPB_PS2_JOYPAD_mReadReg(XPAR_OPB_PS2_JOYPAD_0_BASEADDR, 0);
  pad->regs.reg1 = OPB_PS2_JOYPAD_mReadReg(XPAR_OPB_PS2_JOYPAD_0_BASEADDR, 4);
}

int init(){
  
  return 1;
}
