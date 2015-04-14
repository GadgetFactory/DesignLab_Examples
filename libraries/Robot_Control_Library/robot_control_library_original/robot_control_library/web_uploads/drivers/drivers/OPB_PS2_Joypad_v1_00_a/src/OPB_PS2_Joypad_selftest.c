// Filename:          OPB_PS2_Joypad_v1_00_a\src\OPB_PS2_Joypad_selftest.c
// Version:           1.00.a
// Description:       Contains a diagnostic self-test function for the OPB_PS2_Joypad driver

#include "OPB_PS2_Joypad.h"
PS2pad pad;
XStatus OPB_PS2_JOYPAD_SelfTest()
{
  int i;
  xil_printf("******************************\n\r");
  xil_printf("*       PS2 Self Test        *\n\r");
  xil_printf("******************************\n\n\r");

  init();
  while(1){
    fillStruct(&pad);
    xil_printf("%X %X",pad.regs.reg0, pad.regs.reg1);
    if(pad.bytes.id==0x41) {
      if(pad.id0x41.SCLT == 0)
        xil_printf("SCLT");
      if(pad.id0x41.START == 0)
        xil_printf(" START");
      if(pad.id0x41.UP == 0)
        xil_printf(" UP");
      if(pad.id0x41.RIGHT == 0)
        xil_printf(" RIGHT");
      if(pad.id0x41.DOWN == 0)
        xil_printf(" DOWN");
      if(pad.id0x41.LEFT == 0)
        xil_printf(" LEFT");
      if(pad.id0x41.L2 == 0)
        xil_printf(" L2");
      if(pad.id0x41.R2 == 0)
        xil_printf(" R2");
      if(pad.id0x41.L1 == 0)
        xil_printf(" L1");
      if(pad.id0x41.R1 == 0)
        xil_printf(" R1");
      if(pad.id0x41.TRIANGLE == 0)
        xil_printf("TRIANGLE");
      if(pad.id0x41.CIRCLE == 0)
        xil_printf(" CIRCLE");
      if(pad.id0x41.X == 0)
        xil_printf(" X");
      if(pad.id0x41.SQUARE == 0)
        xil_printf(" SQUARE");
    } else if (pad.bytes.id==0x73) {
      if(pad.id0x73.SCLT == 0)
        xil_printf("SCLT");
      if(pad.id0x73.START == 0)
        xil_printf(" START");
      if(pad.id0x73.UP == 0)
        xil_printf(" UP");
      if(pad.id0x73.RIGHT == 0)
        xil_printf(" RIGHT");
      if(pad.id0x73.DOWN == 0)
        xil_printf(" DOWN");
      if(pad.id0x73.LEFT == 0)
        xil_printf(" LEFT");
      if(pad.id0x73.L2 == 0)
        xil_printf(" L2");
      if(pad.id0x73.R2 == 0)
        xil_printf(" R2");
      if(pad.id0x73.L1 == 0)
        xil_printf(" L1");
      if(pad.id0x73.R1 == 0)
        xil_printf(" R1");
      if(pad.id0x73.TRIANGLE == 0)
        xil_printf("TRIANGLE");
      if(pad.id0x73.CIRCLE == 0)
        xil_printf(" CIRCLE");
      if(pad.id0x73.X == 0)
        xil_printf(" X");
      if(pad.id0x73.SQUARE == 0)
        xil_printf(" SQUARE"); 
      if(pad.id0x73.JOYL== 0)
        xil_printf(" JOYL"); 
      if(pad.id0x73.JOYR== 0)
        xil_printf(" JOYR");
      //xil_prinf("JRH %3x")
    }
    xil_printf("\n\r");
    for(i=0; i<60000; i++){}//relax for a bit

  }
}
