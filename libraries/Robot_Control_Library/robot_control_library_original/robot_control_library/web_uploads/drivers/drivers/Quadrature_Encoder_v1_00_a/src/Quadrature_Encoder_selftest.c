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
// Filename:          Quadrature_Encoder_selftest.c
// Version:           1.00.a
// Description:       Contains a diagnostic self-test function for the Quadrature_Encoder driver
// Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "xparameters.h"
#include <stdio.h>
#include "Quadrature_Encoder.h"

/************************** Constant Definitions ***************************/


/************************** Variable Definitions ****************************/


/************************** Function Definitions ***************************/

/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the STEPPER_CONTROL instance to be worked on.
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
int main(){
  Xint32 pulse, rev, speed, accel;
  int i;
  xil_printf("Quadrature encoder test\r\n");
  
  while(1){
     pulse = getPulseCount(0);
     rev = getRevCount(0);
     speed = getSpeed(0);
     accel = getAccel(0);
     //xil_printf("p: %X, %d, r: %X, %d           \r",pulse,pulse,rev,rev);
     xil_printf("p: %d, r: %d, s: %d, a: %d           \r",pulse,rev,speed,accel);
     for(i=0; i < 0xffff; i++){}
  }  

  xil_printf("Test stopped\r\n");
  return 1;
}
