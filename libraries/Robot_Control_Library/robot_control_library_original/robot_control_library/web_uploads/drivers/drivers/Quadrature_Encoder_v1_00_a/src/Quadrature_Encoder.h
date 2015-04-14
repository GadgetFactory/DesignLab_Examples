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
// Filename:          Quadrature_Encoder.h
// Version:           1.00.a
// Description:       Quadrature_Encoder Driver Header File
// Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef QUADRATURE_ENCODER_H
#define QUADRATURE_ENCODER_H

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
#define QUADRATURE_ENCODER_USER_SLAVE_SPACE_OFFSET (0x00000000)
#define QUADRATURE_ENCODER_SLAVE_REG0_OFFSET (QUADRATURE_ENCODER_USER_SLAVE_SPACE_OFFSET + 0x00000000)

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Read a value from a QUADRATURE_ENCODER register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the QUADRATURE_ENCODER device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 QUADRATURE_ENCODER_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define QE_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/

Xint32 getPulseCount(unsigned int i);
Xint32 getRevCount(unsigned int i);
Xint32 getSpeed(unsigned int i);
float getSpeedRad(unsigned int i);
Xint32 getAccel(unsigned int i);

#endif // QUADRATURE_ENCODER_H
