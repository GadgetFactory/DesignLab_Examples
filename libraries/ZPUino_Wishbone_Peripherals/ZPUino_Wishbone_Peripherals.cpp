/*

 ZPUino_Wishbone_Peripherals - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "ZPUino_Wishbone_Peripherals.h"

ZPUino_Wishbone_Peripherals::ZPUino_Wishbone_Peripherals()
{

}

void ZPUino_Wishbone_Peripherals::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long ZPUino_Wishbone_Peripherals::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void ZPUino_Wishbone_Peripherals::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
