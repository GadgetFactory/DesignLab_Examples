/*

 ZPUino_2 - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "ZPUino_2.h"

ZPUino_2::ZPUino_2()
{

}

void ZPUino_2::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long ZPUino_2::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void ZPUino_2::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
