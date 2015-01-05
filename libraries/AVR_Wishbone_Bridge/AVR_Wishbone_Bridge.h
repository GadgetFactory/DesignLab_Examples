/*

 AVR_Wishbone_Bridge - Allows AVR to communicate with wishbone chips in the FPGA.

 Allows AVR to communicate with wishbone chips in the FPGA

 License: GNU General Public License V3

 (C) Copyright (Gadget Factory)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#ifndef __AVR_Wishbone_Bridge_H__
#define __AVR_Wishbone_Bridge_H__

#include <SPI.h>

#define IOBASE 0x8000000
#define IO_SLOT_OFFSET_BIT 23
//#define IO_SLOT(x) (IOBASE + (x<<IO_SLOT_OFFSET_BIT))
#define IO_SLOT(x) (IOBASE + (((uint32_t)(x)<<IO_SLOT_OFFSET_BIT)))
#define SYSCTLBASE IO_SLOT(0)

class REGISTER
{
public:
    REGISTER(uint32_t base, int offset): _address(base+(offset<<2)){}
    operator uint32_t () { return read(); }
    REGISTER &operator=(uint32_t value) { write(value); }
protected:
    uint32_t read();
    void write(uint32_t);
private:
    uint32_t _address;
};

#endif
