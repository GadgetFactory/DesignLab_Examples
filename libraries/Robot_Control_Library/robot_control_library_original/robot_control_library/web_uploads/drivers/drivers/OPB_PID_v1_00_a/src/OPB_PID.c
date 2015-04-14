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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PID_v1_00_a\src\OPB_PID.c
// Version:           1.00.a
// Description:       OPB_PID Driver Source File
// Date:              Wed Oct 26 13:21:06 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/
#include "xparameters.h"
#include "OPB_PID.h"

/************************** Function Definitions ***************************/

enum{ADDR_KP=1,ADDR_KI,ADDR_KD};

union _konst {
  struct _fp {
    unsigned int addr : 2;
    unsigned int val : XPAR_OPB_PID_0_KONST_WIDTH;
  } fp;
  unsigned int data;
} konst;

//  xil_printf("2integer value: %d, decimal value: %d \n\r",konst.fp.intval,konst.fp.decimal);

void setPIDKp(unsigned int inst, float kp){
  if(inst>=XPAR_OPB_PID_0_PID_INST)
    return;
  konst.fp.val = (1<<XPAR_OPB_PID_0_FIXED_POINT_POS)*kp;
  konst.fp.addr = ADDR_KP;
  xil_printf("Kp val: %d\r\n",konst.fp.val);
  xil_printf("Kp data: %X\r\n",konst.data);
  OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, inst*4*4+PID_KONST, konst.data);
}

void setPIDKi(unsigned int inst, float ki){
  if(inst>=XPAR_OPB_PID_0_PID_INST)
    return;
  konst.fp.val = (1<<XPAR_OPB_PID_0_FIXED_POINT_POS)*ki;
  konst.fp.addr = ADDR_KI;
  OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, inst*4*4+PID_KONST, konst.data);
}

void setPIDKd(unsigned int inst, float kd){
  if(inst>=XPAR_OPB_PID_0_PID_INST)
    return;
  konst.fp.val = (1<<XPAR_OPB_PID_0_FIXED_POINT_POS)*kd;
  konst.fp.addr = ADDR_KD;
  OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, inst*4*4+PID_KONST, konst.data);  
}

void setPIDFreqDiv(unsigned int inst, unsigned int div){
  if(inst>=XPAR_OPB_PID_0_PID_INST)
    return;
  OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, inst*4*4+PID_FREQ, div);
}

void setPIDRefInput(unsigned int inst, int rinput){
//  if(inst>=XPAR_OPB_PID_0_PID_INST)
//    return;
  OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, inst*4*4+PID_REFINPUT, rinput);  
}

void setPIDInput(unsigned int inst, int input){
  if(inst>=XPAR_OPB_PID_0_PID_INST)
    return;
  OPB_PID_mWriteReg(XPAR_OPB_PID_0_BASEADDR, inst*4*4+PID_INPUT, input);
}

int getPIDOutput(unsigned int inst){
  return OPB_PID_mReadReg(XPAR_OPB_PID_0_BASEADDR, inst*3*4+PID_OUTPUT);
}

int getPIDInput(unsigned int inst){
  return OPB_PID_mReadReg(XPAR_OPB_PID_0_BASEADDR, inst*3*4+GET_PID_INPUT);
}
