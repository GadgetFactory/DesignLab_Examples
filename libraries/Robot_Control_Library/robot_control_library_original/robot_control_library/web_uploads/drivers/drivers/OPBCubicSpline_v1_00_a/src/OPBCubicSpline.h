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
// Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPBCubicSpline_v1_00_a\src\OPBCubicSpline.h
// Version:           1.00.a
// Description:       OPBCubicSpline Driver Header File
// Date:              Fri Oct 14 10:41:26 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef OPBCUBICSPLINE_H
#define OPBCUBICSPLINE_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xio.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLAVE_REG0 : user logic slave module register 0
 * -- SLAVE_REG1 : user logic slave module register 1
 * -- SLAVE_REG2 : user logic slave module register 2
 * -- SLAVE_REG3 : user logic slave module register 3
 */
#define OPBCUBICSPLINE_USER_SLAVE_SPACE_OFFSET (0x00000000)
#define OPBCUBICSPLINE_SLAVE_REG0_OFFSET (OPBCUBICSPLINE_USER_SLAVE_SPACE_OFFSET + 0x00000000)
#define OPBCUBICSPLINE_SLAVE_REG1_OFFSET (OPBCUBICSPLINE_USER_SLAVE_SPACE_OFFSET + 0x00000004)
#define OPBCUBICSPLINE_SLAVE_REG2_OFFSET (OPBCUBICSPLINE_USER_SLAVE_SPACE_OFFSET + 0x00000008)
#define OPBCUBICSPLINE_SLAVE_REG3_OFFSET (OPBCUBICSPLINE_USER_SLAVE_SPACE_OFFSET + 0x0000000C)

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a OPBCUBICSPLINE register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the OPBCUBICSPLINE device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note    None.
 *
 * C-style signature:
 * 	void OPBCUBICSPLINE_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define OPBCUBICSPLINE_mWriteReg(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a OPBCUBICSPLINE register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the OPBCUBICSPLINE device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 OPBCUBICSPLINE_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define OPBCUBICSPLINE_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read value to/from OPBCUBICSPLINE user logic slave registers.
 *
 * @param   BaseAddress is the base address of the OPBCUBICSPLINE device.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 OPBCUBICSPLINE_mReadSlaveRegn(Xuint32 BaseAddress)
 *
 */
#define OPBCUBICSPLINE_mWriteSlaveReg0(BaseAddress, Value) \
 	XIo_Out32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG0_OFFSET), (Xuint32)(Value))
#define OPBCUBICSPLINE_mWriteSlaveReg1(BaseAddress, Value) \
 	XIo_Out32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG1_OFFSET), (Xuint32)(Value))
#define OPBCUBICSPLINE_mWriteSlaveReg2(BaseAddress, Value) \
 	XIo_Out32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG2_OFFSET), (Xuint32)(Value))
#define OPBCUBICSPLINE_mWriteSlaveReg3(BaseAddress, Value) \
 	XIo_Out32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG3_OFFSET), (Xuint32)(Value))

#define OPBCUBICSPLINE_mReadSlaveReg0(BaseAddress) \
 	XIo_In32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG0_OFFSET))
#define OPBCUBICSPLINE_mReadSlaveReg1(BaseAddress) \
 	XIo_In32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG1_OFFSET))
#define OPBCUBICSPLINE_mReadSlaveReg2(BaseAddress) \
 	XIo_In32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG2_OFFSET))
#define OPBCUBICSPLINE_mReadSlaveReg3(BaseAddress) \
 	XIo_In32((BaseAddress) + (OPBCUBICSPLINE_SLAVE_REG3_OFFSET))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the OPBCUBICSPLINE instance to be worked on.
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
XStatus OPBCUBICSPLINE_SelfTest(void * baseaddr_p);

#endif // OPBCUBICSPLINE_H
