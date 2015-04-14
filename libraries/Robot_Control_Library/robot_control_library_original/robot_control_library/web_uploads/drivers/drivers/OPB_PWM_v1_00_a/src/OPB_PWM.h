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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PWM_v1_00_a\src\OPB_PWM.h
// Version:           1.00.a
// Description:       OPB_PWM Driver Header File
// Date:              Tue Sep 20 14:41:27 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef OPB_PWM_H
#define OPB_PWM_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xio.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLAVE_REG0 : user logic slave module register 0
 */
#define OPB_PWM_USER_SLAVE_SPACE_OFFSET (0x00000000)
#define OPB_PWM_SLAVE_REG0_OFFSET (OPB_PWM_USER_SLAVE_SPACE_OFFSET + 0x00000000)

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a OPB_PWM register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the OPB_PWM device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note    None.
 *
 * C-style signature:
 * 	void OPB_PWM_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define OPB_PWM_mWriteReg(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a OPB_PWM register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the OPB_PWM device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 OPB_PWM_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define OPB_PWM_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))



#define OPB_PWM_Write_Duty(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset*4), (Xuint32)(Data))

#define OPB_PWM_Write_Freq(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset*4)+4, (Xuint32)(Data))

#define OPB_PWM_Read_Duty(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset*4))

#define OPB_PWM_Read_Freq(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset*4)+4)

/************************** Function Prototypes ****************************/


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
XStatus OPB_PWM_SelfTest(void * baseaddr_p);


void initPWM();
unsigned int getPWMFreqDiv(unsigned int i);
void setPWMFreqDiv(unsigned int i, unsigned int div);
int getPWMDuty(unsigned int i);
void setPWMDuty(unsigned int i,int speed);
void printPWMDuty(unsigned int i);
void printPWMFreq(unsigned int i);

#endif // OPB_PWM_H
