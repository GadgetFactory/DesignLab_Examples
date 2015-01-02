/*

 Audio_Wing - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "Audio_Wing.h"

Audio_Wing::Audio_Wing()
{

}

void Audio_Wing::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long Audio_Wing::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void Audio_Wing::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
