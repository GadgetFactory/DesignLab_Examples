/*
 * Copyright (c) 2010 by Cristian Maglie <c.maglie@bug.st>
 * Copyright (c) 2013 by Alvaro Lopes <alvieboy@alvie.com>
 *
 * SPI Master library for zpuino, based on arduino's library by Cristian Maglie.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#include "SPI.h"
#include <Arduino.h>
#include <register.h>

SPIClass SPI;

#define PPS_INDEX_MOSI 0
#define PPS_INDEX_SCK  1
#define PPS_INDEX_MISO 0

void SPIClass::begin(MOSI mosi, MISO miso, SCK sck)
{
	REGISTER(IO_SLOT(wishboneSlot),0)=BIT(SPICP1)|BIT(SPIEN)|BIT(SPIBLOCK);
    // USPICTL=BIT(SPICP1)|BIT(SPIEN)|BIT(SPIBLOCK);

    pinMode(mosi, OUTPUT);
    pinMode(miso, INPUT);
    pinMode(sck, OUTPUT);

    pinModePPS(sck,HIGH);
    pinModePPS(mosi,HIGH);

    outputPinForFunction( mosi, IOPIN_USPI_MOSI );
    outputPinForFunction( sck, IOPIN_USPI_SCK);
    inputPinForFunction( miso, IOPIN_USPI_MISO );
}

void SPIClass::begin(int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
	REGISTER(IO_SLOT(wishboneSlot),0)=BIT(SPICP1)|BIT(SPIEN)|BIT(SPIBLOCK);
}

byte SPIClass::transfer(unsigned _data) {
	REGISTER(IO_SLOT(wishboneSlot),1) = _data;
	return REGISTER(IO_SLOT(wishboneSlot),1);
	// USPIDATA = _data;
    // return USPIDATA;
}

uint16_t SPIClass::transfer16(unsigned _data) {
    REGISTER(IO_SLOT(wishboneSlot),3) = _data;
    return REGISTER(IO_SLOT(wishboneSlot),3);    
	// REGISTER(USERSPIBASE,3) = _data;
    // return REGISTER(USERSPIBASE,3);
}

uint32_t SPIClass::transfer32(unsigned _data) {
    REGISTER(IO_SLOT(wishboneSlot),5) = _data;
    return REGISTER(IO_SLOT(wishboneSlot),5);
    // REGISTER(USERSPIBASE,5) = _data;
    // return REGISTER(USERSPIBASE,5);
}

void SPIClass::end() {
    REGISTER(IO_SLOT(wishboneSlot),0) = REGISTER(IO_SLOT(wishboneSlot),0) &  ~(_BV(SPIEN)|_BV(SPIBLOCK));
    // USPICTL = USPICTL &  ~(_BV(SPIEN)|_BV(SPIBLOCK));
}

void SPIClass::setBitOrder(int bitOrder)
{
	/* No support */
}

void SPIClass::setDataMode(int mode)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = (REGISTER(IO_SLOT(wishboneSlot),0) & ~SPI_MODE_MASK) | mode;
	// USPICTL = (USPICTL & ~SPI_MODE_MASK) | mode;
}

void SPIClass::setClockDivider(int rate)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = (REGISTER(IO_SLOT(wishboneSlot),0) & ~SPI_CLOCK_MASK) | rate;
    // USPICTL = (USPICTL & ~SPI_CLOCK_MASK) | rate;
}


SPIClass::SPIClass()
{
}
