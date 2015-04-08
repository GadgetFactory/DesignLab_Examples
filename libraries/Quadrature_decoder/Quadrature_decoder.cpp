/*

 Quadrature_decoder - Decoder for Encoders. 

 One instance can track four encoders

 License: GNU General Public License V3

 (C) Copyright (Filip Filipov)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "Quadrature_decoder.h"

Quadrature_decoder::Quadrature_decoder()
{

}

void Quadrature_decoder::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

signed long Quadrature_decoder::read_1()
{
	return REGISTER(IO_SLOT(wishboneSlot),0);
}

signed long Quadrature_decoder::read_2()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

signed long Quadrature_decoder::read_3()
{
	return REGISTER(IO_SLOT(wishboneSlot),2);
}

signed long Quadrature_decoder::read_4()
{
	return REGISTER(IO_SLOT(wishboneSlot),3);
}

void Quadrature_decoder::write(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
