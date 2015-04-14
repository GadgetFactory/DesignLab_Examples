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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PWM_v1_00_a\src\OPB_PWM.c
// Version:           1.00.a
// Description:       OPB_PWM Driver Source File
// Date:              Tue Sep 20 14:41:27 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "OPB_PWM.h"
#include "xparameters.h"
#include <stdio.h>

/************************** Function Definitions ***************************/

union _dir_duty { 
  struct _cfg {
    //unsigned int sign : 1;
    unsigned int duty : XPAR_OPB_PWM_0_PWM_WIDTH;
  } cfg;
  //unsigned int data : XPAR_OPB_PWM_0_PWM_WIDTH+1;
  unsigned int data : XPAR_OPB_PWM_0_PWM_WIDTH;
  unsigned int data32;
} dir_duty;

void initPWM(){
  int i;
  xil_printf("Width: %d \n\r",XPAR_OPB_PWM_0_PWM_WIDTH);
  for(i=0; i<XPAR_OPB_PWM_0_PWM_INST; i++){
    OPB_PWM_Write_Freq(XPAR_OPB_PWM_0_BASEADDR,i*2,0);
    OPB_PWM_Write_Duty(XPAR_OPB_PWM_0_BASEADDR,i*2,0);
  }
}

void setPWMDuty(unsigned int i, int duty){
  if(i>= XPAR_OPB_PWM_0_PWM_INST)
    return;
  /*if(duty<0){
    dir_duty.cfg.sign = 1;
    dir_duty.cfg.duty = -1*duty;
  } else {
    dir_duty.cfg.sign = 0;
    dir_duty.cfg.duty = duty;
  }
  OPB_PWM_Write_Duty(XPAR_OPB_PWM_0_BASEADDR,i,dir_duty.data32);*/
  OPB_PWM_Write_Duty(XPAR_OPB_PWM_0_BASEADDR,i*2,duty);
}

int getPWMDuty(unsigned int i){
  if(i>= XPAR_OPB_PWM_0_PWM_INST)
    return 0;
  /*dir_duty.data32 = OPB_PWM_Read_Duty(XPAR_OPB_PWM_0_BASEADDR,i);
  if(dir_duty.cfg.sign==1){
    return dir_duty.cfg.duty*-1;
  }
  return dir_duty.cfg.duty;*/
  return OPB_PWM_Read_Duty(XPAR_OPB_PWM_0_BASEADDR,i*2);
}

unsigned int getPWMFreqDiv(unsigned int i){
  if(i>= XPAR_OPB_PWM_0_PWM_INST)
    return 0;
  return OPB_PWM_Read_Freq(XPAR_OPB_PWM_0_BASEADDR,i*2);
}

void setPWMFreqDiv(unsigned int i, unsigned int div){
  if(i>= XPAR_OPB_PWM_0_PWM_INST)
    return;
  OPB_PWM_Write_Freq(XPAR_OPB_PWM_0_BASEADDR,i*2,div);  
}

void printPWMDuty(unsigned int i){
  if(i>= XPAR_OPB_PWM_0_PWM_INST)
    return;
  dir_duty.data32 = OPB_PWM_Read_Duty(XPAR_OPB_PWM_0_BASEADDR,i*2);
  xil_printf("duty: %X \n\r",dir_duty.cfg.duty);
}

void printPWMFreq(unsigned int i){
  unsigned int freq;
  if(i>= XPAR_OPB_PWM_0_PWM_INST)
    return;
  freq = OPB_PWM_Read_Freq(XPAR_OPB_PWM_0_BASEADDR,i*2);
  xil_printf("Freq: %X \n\r",freq);
}
