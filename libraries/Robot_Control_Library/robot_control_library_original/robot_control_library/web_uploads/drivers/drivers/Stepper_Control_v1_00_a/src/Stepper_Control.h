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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\Stepper_Control_v1_00_a\src\Stepper_Control.h
// Version:           1.00.a
// Description:       Stepper_Control Driver Header File
// Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef STEPPER_CONTROL_H
#define STEPPER_CONTROL_H

/***************************** Include Files *******************************/
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xio.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLAVE_REG0 : user logic slave module register 0
 */
#define STEPPER_CONTROL_USER_SLAVE_SPACE_OFFSET (0x00000000)
#define STEPPER_CONTROL_SLAVE_REG0_OFFSET (STEPPER_CONTROL_USER_SLAVE_SPACE_OFFSET + 0x00000000)

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a STEPPER_CONTROL register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the STEPPER_CONTROL device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note    None.
 *
 * C-style signature:
 * 	void STEPPER_CONTROL_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define STEPPER_CONTROL_mWriteReg(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a STEPPER_CONTROL register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the STEPPER_CONTROL device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 STEPPER_CONTROL_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define STEPPER_CONTROL_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))


#define MAX_SPEED 2^XPAR_STEPPER_CONTROL_0_SDC_RESOLUTION

typedef enum _stepMode {FULL_STEP,HALF_STEP} stepMode;

typedef union _stepperMotor {
  struct cfg {
    unsigned int hold : 1;
    unsigned int dir : 1;
    unsigned int enable : 1;
    unsigned speed : XPAR_STEPPER_CONTROL_0_SDC_RESOLUTION;
    unsigned steps : XPAR_STEPPER_CONTROL_0_SDC_STEP_COUNT;

  } cfg;
  Xuint32 data;
} stepperMotor;


/************************** Function Prototypes ****************************/
void releaseStepper(int i);
void holdStepper(int i);
void disableStepper(int i);
void enableStepper(int i);
void setStepperSpeed(unsigned int i, int val);
unsigned int getMaxStepperSpeed();
stepMode getStepperMode(void);
void updateStepperMotorState(int i);
int initStepperControl();
void printStepper(int i);
Xuint32 getStepperData(int i);
int getSteps(int i);
void setDirection(int i, int dir);
int getStepperSpeed(unsigned int i);
void goSteps(unsigned int i, unsigned int val);

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
XStatus STEPPER_CONTROL_SelfTest(void * baseaddr_p);

#endif // STEPPER_CONTROL_H
