/*

 OV_Camera - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "OV_Camera.h"

OV_Camera::OV_Camera()
{

}

void OV_Camera::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long OV_Camera::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void OV_Camera::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
