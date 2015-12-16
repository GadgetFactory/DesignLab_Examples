/*
 * PFlash.cpp - library for SPI Flash memory on Papilio Pro
 * 
 * by theFloe <thefloe@ptmx.org>
*/

#include <SPI.h>
#include "PFlash.h"


SPIClass FLASH(1);


PFLASH::PFLASH() {

}



void PFLASH::begin() {
	pinMode(SPI_FLASH_SEL_PIN, OUTPUT);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);

	FLASH.begin(WishboneSlot(4));
	FLASH.setDataMode(SPI_MODE2);  
}



uint16_t PFLASH::rdid()
{
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_RDID);  // RDID
	unsigned int ret = FLASH.transfer16(0x0000);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);
	return ret;
}

uint8_t PFLASH::read(uint16_t addr)
{
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_READ);  // READ
	FLASH.transfer24(FLASHSTART+addr);  
	byte ret =  FLASH.transfer(0x00);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);
	return ret;  
}

void PFLASH::readBlock(uint16_t addr, uint8_t *data, uint16_t size)
{
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_READ);  // READ
	FLASH.transfer24(FLASHSTART+addr);  
	for (uint16_t i=0; i<size; i++)
		*data++ =  FLASH.transfer(0x00);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);
}


uint8_t PFLASH::status()
{
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_RDSR);  // Status
	byte  ret =  FLASH.transfer(0x00);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);
	return ret;    
}

void PFLASH::write(uint16_t addr, uint8_t data)
{
	if (addr > FLASHSIZE)
		return;

	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_WREN);  // WRREN
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_WRITE);  // WRITE
	FLASH.transfer24(FLASHSTART+addr);  
	FLASH.transfer(data);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);

	while (status() & 0x01)
		delay(1);  
}

void PFLASH::writeBlock(uint16_t addr, uint8_t *data, uint8_t size)
{
	if (addr+size > FLASHSIZE)
		return;

	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_WREN);  // WRREN
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_WRITE);  // WRITE
	FLASH.transfer24(FLASHSTART+addr);  
	for (uint8_t i=0; i<size; i++)
		FLASH.transfer(data[i]);
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);

	while (status() & 0x01)
		delay(1);  
}


void PFLASH::erase()
{
	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_WREN);  // WRREN
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);

	digitalWrite(SPI_FLASH_SEL_PIN, LOW);
	FLASH.transfer(FLASH_SERASE);
	FLASH.transfer24(FLASHSTART);  
	digitalWrite(SPI_FLASH_SEL_PIN, HIGH);

	while (status() & 0x01)
		delay(1);    
}
