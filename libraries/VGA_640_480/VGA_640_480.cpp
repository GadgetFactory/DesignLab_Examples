/*

 VGA_640_480 - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "VGA_640_480.h"

VGA_640_480::VGA_640_480()
{

}

void VGA_640_480::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long VGA_640_480::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void VGA_640_480::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
