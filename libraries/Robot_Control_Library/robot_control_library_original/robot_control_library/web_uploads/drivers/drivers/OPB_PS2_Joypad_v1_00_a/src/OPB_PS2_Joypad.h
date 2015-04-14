// Filename:          OPB_PS2_Joypad_v1_00_a\src\OPB_PS2_Joypad.h
// Version:           1.00.a
// Description:       OPB_PS2_Joypad Driver Header File
//////////////////////////////////////////////////////////////////////////////

#ifndef OPB_PS2_JOYPAD_H
#define OPB_PS2_JOYPAD_H

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
#define OPB_PS2_JOYPAD_USER_SLAVE_SPACE_OFFSET (0x00000000)

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a OPB_PS2_JOYPAD register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the OPB_PS2_JOYPAD device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note    None.
 *
 * C-style signature:
 * 	void OPB_PS2_JOYPAD_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define OPB_PS2_JOYPAD_mWriteReg(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a OPB_PS2_JOYPAD register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the OPB_PS2_JOYPAD device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 OPB_PS2_JOYPAD_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define OPB_PS2_JOYPAD_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read value to/from OPB_PS2_JOYPAD user logic slave registers.
 *
 * @param   BaseAddress is the base address of the OPB_PS2_JOYPAD device.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note    None.
 *
 * C-style signature:
 * 	Xuint32 OPB_PS2_JOYPAD_mReadSlaveRegn(Xuint32 BaseAddress)
 *
 */

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the OPB_PS2_JOYPAD instance to be worked on.
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

typedef union _PS2pad {
  struct _id0x41{
    unsigned int ID : 8;
    unsigned int LEFT : 1;
    unsigned int DOWN : 1;
    unsigned int RIGHT : 1;
    unsigned int UP : 1;
    unsigned int START : 1;
    unsigned int empty1 : 2;
    unsigned int SCLT : 1;//8
    unsigned int SQUARE: 1;//16
    unsigned int X: 1;
    unsigned int CIRCLE: 1;
    unsigned int TRIANGLE: 1;
    unsigned int R1: 1;    
    unsigned int L1: 1;
    unsigned int R2: 1;
    unsigned int L2: 1;
  } id0x41;
  struct _id0x73{
    unsigned int ID : 8;
    unsigned int LEFT : 1;
    unsigned int DOWN : 1;
    unsigned int RIGHT : 1;
    unsigned int UP : 1;
    unsigned int START : 1;
    unsigned int JOYL : 1;
    unsigned int JOYR : 1;
    unsigned int SCLT : 1;//8

    unsigned int SQUARE: 1;
    unsigned int X: 1;
    unsigned int CIRCLE: 1;
    unsigned int TRIANGLE: 1;
    unsigned int R1: 1;    
    unsigned int L1: 1;
    unsigned int R2: 1;
    unsigned int L2: 1;//16

    unsigned int JOYRH :8;
    unsigned int JOYRV :8;
    unsigned int JOYLH :8;
    unsigned int JOYLV :8;
  } id0x73;
  struct _bytes{
    unsigned int id : 8;
    unsigned int data0 :8;
    unsigned int data1 :8;
    unsigned int data2 :8;
    unsigned int data3 :8;
    unsigned int data4 :8;
    unsigned int data5 :8;
  } bytes;
  struct _regs{
    unsigned int reg0 : 32;
    unsigned int reg1 : 24;
  } regs;
} PS2pad;

int init();
void fillStruct(PS2pad *pad);
XStatus OPB_PS2_JOYPAD_SelfTest();

#endif // OPB_PS2_JOYPAD_H
