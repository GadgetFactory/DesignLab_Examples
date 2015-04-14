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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PID_v1_00_a\src\OPB_PID.h
// Version:           1.00.a
// Description:       OPB_PID Driver Header File
// Date:              Wed Oct 26 13:21:06 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef OPB_PID_H
#define OPB_PID_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xio.h"

/************************** Constant Definitions ***************************/

#define PID_OUTPUT 0
#define GET_PID_INPUT 8

#define PID_REFINPUT 0
#define PID_INPUT 4
#define PID_KONST 8
#define PID_FREQ 12

/**
 * User Logic Slave Space Offsets
 * -- SLAVE_REG0 : user logic slave module register 0
 */
#define OPB_PID_USER_SLAVE_SPACE_OFFSET (0x00000000)
#define OPB_PID_SLAVE_REG0_OFFSET (OPB_PID_USER_SLAVE_SPACE_OFFSET + 0x00000000)

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a OPB_PID register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the OPB_PID device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note    None.
 *
 * C-style signature:
 * 	void OPB_PID_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define OPB_PID_mWriteReg(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))


/**
 *
 * Read a value from a OPB_PID register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the OPB_PID device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 OPB_PID_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define OPB_PID_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))



/************************** Function Prototypes ****************************/


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
XStatus OPB_PID_SelfTest(void * baseaddr_p);

void setPIDKp(unsigned int inst, float kp);
void setPIDKi(unsigned int inst, float ki);
void setPIDKd(unsigned int inst, float kd);
void setPIDFreqDiv(unsigned int inst, unsigned int div);

void setPIDRefInput(unsigned int inst, int rinput);
void setPIDInput(unsigned int inst, int input);
int getPIDOutput(unsigned int inst);
int getPIDInput(unsigned int inst);




#endif // OPB_PID_H
