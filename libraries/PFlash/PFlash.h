/*
 * PFlash.h - library for SPI Flash memory on Papilio Pro
 * 
 * by theFloe <thefloe@ptmx.org>
*/

#ifndef PFLASH_H
#define PFLASH_H

#include <SPI.h> // relies on arduino SPI library



#define FLASHSTART  0x7FF000
#define FLASHSIZE   0x000FFF
#define FLASHSECTOR 0x7FF

#define FLASH_RDID    0x9F
#define FLASH_READ    0x03
#define FLASH_RDSR    0x05
#define FLASH_WREN    0x06
#define FLASH_WRITE   0x02
#define FLASH_SERASE  0x20

class PFLASH
{
  private:
	

  public:
	PFLASH(); // default to type 0

						
	void begin();
	uint16_t rdid();
	uint8_t read(uint16_t addr);
	void readBlock(uint16_t addr, uint8_t *data, uint16_t size);
	uint8_t status();
	void write(uint16_t addr, uint8_t data);
	void writeBlock(uint16_t addr, uint8_t *data, uint8_t size);
	void erase();
	
};

#endif // PFLASH_H
