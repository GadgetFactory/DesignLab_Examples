/*

 VGA_ZXSpectrum - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "VGA_ZXSpectrum.h"

VGA_ZXSpectrum::VGA_ZXSpectrum()
{

}

void VGA_ZXSpectrum::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long VGA_ZXSpectrum::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void VGA_ZXSpectrum::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
