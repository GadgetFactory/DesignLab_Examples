//////////////////////////////////////////////////////////////////////////////
//
// ***************************************************************************
// **                                                                       **
// ** Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.            **
// **                                                                       **
// ** You may copy and modify these files for your own internal use solely  **
// ** with Xilinx programmable logic devices and Xilinx EDK system or       **
// ** create IP modules solely for Xilinx programmable logic devices and    **
// ** Xilinx EDK system. No rights are granted to distribute any files      **
// ** unless they are distributed in Xilinx programmable logic devices.     **
// **                                                                       **
// ***************************************************************************
//
//////////////////////////////////////////////////////////////////////////////
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PWM_v1_00_a\src\OPB_PWM_selftest.c
// Version:           1.00.a
// Description:       Contains a diagnostic self-test function for the OPB_PWM driver
// Date:              Tue Sep 20 14:41:27 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "xparameters.h"
#include "xuartlite_l.h"
#include "OPB_PWM.h"
#include "Quadrature_Encoder.h"
#include <stdio.h>

/************************** Constant Definitions ***************************/


/************************** Variable Definitions ****************************/


/************************** Function Definitions ***************************/
//#define USER_INPUT
union byte2int {
  Xuint32 data;
  struct bytes32 {
    int b0 : 8;
    int b1 : 8;
    int b2 : 8;
    int b3 : 8;
  } bytes;
} byte2int;

Xint8 readByte(){
  #ifdef USER_INPUT
  return XUartLite_RecvByte(STDIN_BASEADDRESS)-48;/*read a byte(ascii decimal, 48=0)*/
  #else
  return XUartLite_RecvByte(STDIN_BASEADDRESS);
  #endif
}

Xint32 readInt24(){
  byte2int.bytes.b0 = 0;//readByte();
  byte2int.bytes.b1 = readByte();
  byte2int.bytes.b2 = readByte();
  byte2int.bytes.b3 = readByte();

  return byte2int.data;
}

int main(){
  int i;
  xil_printf("PWM Test started\r\n");
  initPWM();
  /*printPWMFreq(0);
  printPWMDuty(0);*/
  setPWMFreqDiv(0,0x1);
  //setPWMDuty(0,0x100);
/*  XIo_Out32(XPAR_OPB_PWM_0_BASEADDR+4, 0x44444444);
  XIo_Out32(XPAR_OPB_PWM_0_BASEADDR, 0x55555555);
  
  i = XIo_In32(XPAR_OPB_PWM_0_BASEADDR+4);
  xil_printf("Freq: %X",i);
  i = XIo_In32(XPAR_OPB_PWM_0_BASEADDR);
  xil_printf("Duty: %X",i);
*/
  Xint32 pulse, rev, speed, speedRad, accel;
  int read;
  int pwmduty = 0;
  int pwmstep = 10;
  while(1){
    read = readInt24();
    //xil_printf("read: %d %X\r\n",read,read);
    switch(read){
    /*left: 1792836 1B5B44
    up:1792833 1B5B41
    right: 1792835 1B5B43
    down: 1792834 1B5B42*/
      case 1792836://left
        break;
      case 1792833://up
        pwmduty += pwmstep;
        xil_printf("up: duty @ %d, r: %d    \n\r",pwmduty, getPWMDuty(0));
        setPWMDuty(0,pwmduty);
        break;
      case 1792835://right
        break;
      case 1792834://down
        pwmduty -= pwmstep;
        xil_printf("down: duty @ %d  \n\r",pwmduty);
        setPWMDuty(0,pwmduty);
        break;
      default:
        xil_printf("default\n\r");
        break;

    }
    pulse = getPulseCount(0);
    rev = getRevCount(0);
    speed = getSpeed(0);
    speedRad = (int)getSpeedRad(0);
    accel = getAccel(0);
    xil_printf("p: %d, r: %d, s: %d, sr: %d, a: %d           \r",pulse,rev,speed,speedRad,accel);
    for(i=0; i<0xfff;i++){
      //setPWMDuty(0,i);
      //setPWMDuty(1,i);
    }       
  }  
  xil_printf("PWM Test stopped\r\n");
  return 1;
}
 


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the OPB_PWM instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus OPB_PWM_SelfTest(void * baseaddr_p)
{

   return XST_SUCCESS;
}
