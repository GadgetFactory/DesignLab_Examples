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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\Stepper_Control_v1_00_a\src\Stepper_Control.c
// Version:           1.00.a
// Description:       Stepper_Control Driver Source File
// Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////


/***************************** Include Files *******************************/

#include "Stepper_Control.h"
#include "xparameters.h"
#include <stdio.h>

/************************** Function Definitions ***************************/

stepperMotor motors[XPAR_STEPPER_CONTROL_0_SDC_INST];
unsigned int maxspeed;


int initStepperControl(){
  int i;
  maxspeed = getMaxStepperSpeed();
  //xil_printf(" %d ",XPAR_STEPPER_CONTROL_0_SDC_INST);
  for(i=0; i<XPAR_STEPPER_CONTROL_0_SDC_INST; i++){
    motors[i].cfg.steps = 0;
    motors[i].cfg.speed = 0;
    motors[i].cfg.dir = 0;
    motors[i].cfg.enable = 0;
    motors[i].cfg.hold = 0;
    updateStepperMotorState(i);
  }
  return 1;
}

Xuint32 getStepperData(int i){
  Xuint32 data;
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return 0;
  data = STEPPER_CONTROL_mReadReg(XPAR_STEPPER_CONTROL_0_BASEADDR, i*4);
  return data;
}

void goSteps(unsigned int i, unsigned int val){
  if((int)i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
//  xil_printf("Go");
  motors[i].cfg.steps = val;
  updateStepperMotorState(i);
}

int getStepperSpeed(unsigned int i){
  int res;
  if((int)i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return -1;
  motors[i].data = getStepperData(i);
  if(motors[i].cfg.steps == 0){
    return 0;
  }
  if(motors[i].cfg.dir == 1)
    res = -1;
  else
    res = 1;
  return (maxspeed-motors[i].cfg.speed)*res;
}

void setStepperSpeed(unsigned int i, int val){
  if((int)i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  /* update the posistion info */
  motors[i].data = getStepperData(i);
  motors[i].cfg.enable = 1;
//  printStepper(i);
  if(val<0){
    motors[i].cfg.dir = 1;
    motors[i].cfg.speed = (Xuint32) maxspeed-(val*-1);
  } else {
    motors[i].cfg.dir = 0;
    motors[i].cfg.speed = (Xuint32) maxspeed-val;
  }
  if(val==0){
    motors[i].cfg.steps = (Xuint32) 0x0;
    motors[i].cfg.speed = (Xuint32) 0xFFFFFFFF;
  }
//  printStepper(i);
  updateStepperMotorState(i);
//  printStepper(i);
}

unsigned int getMaxStepperSpeed(){
  unsigned int i,max=1;
  for(i=0;i<XPAR_STEPPER_CONTROL_0_SDC_RESOLUTION;i++){
    max *= 2;
  }
  return max-1;
//  return MAX_SPEED;
}

stepMode getStepperMode(){
  if(XPAR_STEPPER_CONTROL_0_SDC_TYPE == 0)
    return FULL_STEP;
  return HALF_STEP;
}

void holdStepper(int i){
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  motors[i].cfg.hold = 1;
  updateStepperMotorState(i);
}

void releaseStepper(int i){
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  motors[i].cfg.hold = 0;
  updateStepperMotorState(i);
}

void enableStepper(int i){
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  motors[i].cfg.enable = 1;
  updateStepperMotorState(i);
}

void disableStepper(int i){
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  motors[i].cfg.enable = 0;
  updateStepperMotorState(i);
}

void updateStepperMotorState(int i){
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  STEPPER_CONTROL_mWriteReg(XPAR_STEPPER_CONTROL_0_BASEADDR, i*4, motors[i].data);
}

void printStepper(int i){
  stepperMotor motor;
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  xil_printf("\n\rE:%d , H:%d , D:%d , speed:%d , steps:%d",motors[i].cfg.enable,motors[i].cfg.hold,motors[i].cfg.dir,motors[i].cfg.speed,motors[i].cfg.steps);
  motor.data = (Xuint32) getStepperData(i);
  xil_printf("\n\rE:%d , H:%d , D:%d , speed:%d , steps:%d",motor.cfg.enable,motor.cfg.hold,motor.cfg.dir,motor.cfg.speed,motor.cfg.steps);
}

int getSteps(int i){
  stepperMotor motor;
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return -1;
  motor.data = (Xuint32) getStepperData(i);
  return motor.cfg.steps;
}

void setDirection(int i, int dir){
  if(i<0 || i>= XPAR_STEPPER_CONTROL_0_SDC_INST)
    return;
  if(dir)
    motors[i].cfg.dir = 1;
  else
    motors[i].cfg.dir = 0;
  updateStepperMotorState(i);
}
