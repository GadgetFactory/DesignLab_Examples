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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PID_v1_00_a\src\OPB_PID_selftest.c
// Version:           1.00.a
// Description:       Contains a diagnostic self-test function for the OPB_PID driver
// Date:              Wed Oct 26 13:21:06 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "xparameters.h"
#include "OPB_PID.h"

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
 * @param   baseaddr_p is the base address of the OPB_PID instance to be worked on.
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
int pid_out(float kp,float ki,float kd,int input,int refinput);

int OPB_PID_SelfTest(){
  int output;
  unsigned int uout,j,i,refinput=0,input=0;
  float kp=0.7, kd=20, ki=0.2;
  xil_printf("\n\rMain entered, Testing PID IP module\n\r");
  
  //OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, PID_KONST, 0x8FFFFFFF);
  setPIDKp(0,kp);  
  setPIDKi(0,ki);
  setPIDKd(0,kd);
  for(j=100;j<120;j++){
    input = j;
    setPIDRefInput(0,refinput);
    setPIDInput(0,input);

    setPIDFreqDiv(0,0xFE); //sample
    for(i=0;i<6000;i++){
      output = getPIDOutput(0);
    }
    
    xil_printf("Out: %d vs. %d \n\r",output, pid_out(kp,ki,kd,input,refinput));
    setPIDFreqDiv(0,0xFE);
    //xil_printf("Out: %b vs. %b \n\r",output, (512*10*j)/256);
  }
  while(1){
    output = getPIDOutput(0);
    xil_printf("Out: %d\r",output);
/*
    for(j=0; j<XPAR_OPB_PID_0_PID_INST; j++){
      output = getPIDOutput(0);
      xil_printf("Out: %d\r",output);
    } */
  }
  xil_printf("Test Finished\n\r");
  return 0;
}

int pid_out(float kp,float ki,float kd,int input,int refinput){
  static int sum=0;
  static int lasterror=0;
  int error = refinput-input;
  int kd_tmp = error-lasterror;
  lasterror = error;
  //xil_printf("err: %d, lasterr %d, sum \n\r",output, pid_out(kp,kd,ki,input,refinput));
  sum += error;
  return kp*error+kd_tmp*kd+ki*sum;
}
