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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\Stepper_Control_v1_00_a\src\Stepper_Control_selftest.c
// Version:           1.00.a
// Description:       Contains a diagnostic self-test function for the Stepper_Control driver
// Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "xparameters.h";
#include <stdio.h>
#include "Stepper_Control.h"

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
  int dir0=0,dir1=0;
  xil_printf("StepperMotor test\r\n");
  initStepperControl();

  setStepperSpeed(0,0x20);
  setStepperSpeed(1,0x20);
  enableStepper(0);
  enableStepper(1);
  setDirection(0,dir0);
  setDirection(1,dir1);
  goSteps(0,0xff);
  goSteps(1,0xff);
  printStepper(0);
  printStepper(1);
  while(1){
     //printStepper(0);
    if(getSteps(0)==0){
      if(dir0) dir0 = 0;
      else dir0 = 1;
      setDirection(0,dir0);
    }
    if(getSteps(1)==0){
      if(dir1) dir1 = 0;
      else dir1 = 1;
      setDirection(1,dir1);
    }
  }  

  xil_printf("Test stopped\r\n");
  return 1;
}

XStatus STEPPER_CONTROL_SelfTest(void * baseaddr_p)
{
   return XST_SUCCESS;
}
