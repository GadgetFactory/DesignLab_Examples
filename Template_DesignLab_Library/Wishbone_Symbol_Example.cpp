/*

 Wishbone_Symbol_Example - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "Wishbone_Symbol_Example.h"

Wishbone_Symbol_Example::Wishbone_Symbol_Example()
{

}

void Wishbone_Symbol_Example::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long Wishbone_Symbol_Example::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void Wishbone_Symbol_Example::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}