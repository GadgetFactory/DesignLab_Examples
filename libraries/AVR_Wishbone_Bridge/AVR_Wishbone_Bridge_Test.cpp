/*

 AVR_Wishbone_Bridge_Test - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "AVR_Wishbone_Bridge_Test.h"
#include "AVR_Wishbone_Bridge.h"

AVR_Wishbone_Bridge_Test::AVR_Wishbone_Bridge_Test()
{

}

void AVR_Wishbone_Bridge_Test::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long AVR_Wishbone_Bridge_Test::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void AVR_Wishbone_Bridge_Test::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
