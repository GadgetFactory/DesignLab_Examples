/*

 Shield_Computing - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "Shield_Computing.h"

Shield_Computing::Shield_Computing()
{

}

void Shield_Computing::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long Shield_Computing::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void Shield_Computing::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
