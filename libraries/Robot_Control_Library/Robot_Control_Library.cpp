/*

 Robot_Control_Library - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "Robot_Control_Library.h"

Robot_Control_Library::Robot_Control_Library()
{

}

void Robot_Control_Library::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long Robot_Control_Library::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void Robot_Control_Library::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
