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
// Filename:          .c
// Version:           1.00.a
// Description:       Driver Source File
// Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "Quadrature_Encoder.h"
#include "xparameters.h"
#include <stdio.h>

/************************** Function Definitions ***************************/


Xint32 getPulseCount(unsigned int i){
  Xint32 data;
  if(i >= XPAR_QUADRATURE_ENCODER_0_QE_INST)//hmm
    return 0;
  data = QE_mReadReg(XPAR_QUADRATURE_ENCODER_0_BASEADDR, i*16);
  return data;
}

Xint32 getRevCount(unsigned int i){
  Xint32 data;
  if(i >= XPAR_QUADRATURE_ENCODER_0_QE_INST)
    return 0;
  data = QE_mReadReg(XPAR_QUADRATURE_ENCODER_0_BASEADDR, i*16+4);
  return data;
}

Xint32 getSpeed(unsigned int i){
  Xint32 data;
  if(i >= XPAR_QUADRATURE_ENCODER_0_QE_INST)
    return 0;
  data = QE_mReadReg(XPAR_QUADRATURE_ENCODER_0_BASEADDR, i*16+8);
  return data;
}

float getSpeedRad(unsigned int i){
  if(i >= XPAR_QUADRATURE_ENCODER_0_QE_INST)
    return 0;
  float data = (float)getSpeed(i);
  //time for one A pulse: 1/freq * clk tick per A pulse = time for per pulse
  //xil_printf("lujer1; %d\n\r",(int)data);
  data /= 50000000.0;
  //xil_printf("lujer1; %d\n\r",(int)(data*1000000.0));
  //xil_printf("piting: %d\n\r",(int)((((2.0*3.14159265)/512.0))*10000));
  float tmp = (2.0*3.14159265)/512.0;
  //xil_printf("piting: %d\n\r",(int)(tmp*10000));
  if(data != 0)
    data = tmp/data;
  else 
    data = 0;
  //xil_printf("float: %d\n\r",(int)data);
  return data;
}

Xint32 getAccel(unsigned int i){
  Xint32 data;
  if(i >= XPAR_QUADRATURE_ENCODER_0_QE_INST)
    return 0;
  data = QE_mReadReg(XPAR_QUADRATURE_ENCODER_0_BASEADDR, i*16+12);
  return data;
}
