/* Arduino Sd2Card Library
 * Copyright (C) 2009 by William Greiman
 *
 * This file is part of the Arduino Sd2Card Library
 *
 * This Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *                                
 * This Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with the Arduino Sd2Card Library.  If not, see
 * <http://www.gnu.org/licenses/>.
 */

#include <Arduino.h>
#include "Sd2Card.h"
//------------------------------------------------------------------------------
#ifndef SOFTWARE_SPI
#ifdef USE_SPI_LIB
#include <SPI.h>
#endif
// functions for hardware SPI
/** Send a byte to the card */

#ifdef ZPU
#include <zpuino.h>

//static void spiSend(uint8_t b) {
//	USPIDATA=b;
//}

// static void spiSetMode32()
// {
	// USPICTL|=SPITS0|SPITS1;
// }
// static void spiSetMode8()
// {
	// USPICTL&=~(SPITS0|SPITS1);
// }

//static uint32_t spiRec32(void)
//{
//	return SPI.transfer32(0xFFFFFFFF);
	// USPIDATA=0xffffffff;
	// return USPIDATA;
//}

static void spiSend(uint8_t b) {
  SPI.transfer(b);
}

static uint32_t spiRec32(uint8_t wishboneSlot) {
	 spiSend(0XFF);
	 spiSend(0XFF);
	 spiSend(0XFF);
	 spiSend(0XFF);
// Serial.print(USPIDATA&0xff);
// Serial.print(" ");
	//return USPIDATA&0xff;
	//return USPIDATA;
	//return SPI.transfer32(0xFFFFFFFF);
	//REGISTER(IO_SLOT(12),5) = 0xFFFFFFFF;
	return REGISTER(IO_SLOT(wishboneSlot),1);
	//return SPI.transfer32(0xFFFFFFFF);
}

/** Receive a byte from the card */
static  uint8_t spiRec(void) {
  return SPI.transfer(0xFF);
}

#else

static void spiSend(uint8_t b) {
#ifndef USE_SPI_LIB
  SPDR = b;
  while (!(SPSR & (1 << SPIF)));
#else
  SPI.transfer(b);
#endif
}
/** Receive a byte from the card */
static  uint8_t spiRec(void) {
#ifndef USE_SPI_LIB
  spiSend(0XFF);
  return SPDR;
#else
  return SPI.transfer(0xFF);
#endif
}
#endif
#else  // SOFTWARE_SPI
//------------------------------------------------------------------------------
/** nop to tune soft SPI timing */
#define nop asm volatile ("nop\n\t")
//------------------------------------------------------------------------------
/** Soft SPI receive */
uint8_t spiRec(void) {
  uint8_t data = 0;
  // no interrupts during byte receive - about 8 us
  cli();
  // output pin high - like sending 0XFF
  fastDigitalWrite(SPI_MOSI_PIN, HIGH);

  for (uint8_t i = 0; i < 8; i++) {
    fastDigitalWrite(SPI_SCK_PIN, HIGH);

    // adjust so SCK is nice
    nop;
    nop;

    data <<= 1;

    if (fastDigitalRead(SPI_MISO_PIN)) data |= 1;

    fastDigitalWrite(SPI_SCK_PIN, LOW);
  }
  // enable interrupts
  sei();
  return data;
}
//------------------------------------------------------------------------------
/** Soft SPI send */
void spiSend(uint8_t data) {
  // no interrupts during byte send - about 8 us
  cli();
  for (uint8_t i = 0; i < 8; i++) {
    fastDigitalWrite(SPI_SCK_PIN, LOW);

    fastDigitalWrite(SPI_MOSI_PIN, data & 0X80);

    data <<= 1;

    fastDigitalWrite(SPI_SCK_PIN, HIGH);
  }
  // hold SCK high for a few ns
  nop;
  nop;
  nop;
  nop;

  fastDigitalWrite(SPI_SCK_PIN, LOW);
  // enable interrupts
  sei();
}
#endif  // SOFTWARE_SPI
//------------------------------------------------------------------------------
// send command and return error code.  Return zero for OK
unsigned int Sd2Card::cardCommand(unsigned int cmd, uint32_t arg) {
  // end read if in partialBlockRead mode
  readEnd();

  // select card
  chipSelectLow();

  // wait up to 300 ms if busy
  waitNotBusy(300);

	  // send command
  //Serial.print("CMD ");
  //Serial.println(cmd);
  spiSend(cmd | 0x40);

  // send argument
  for (int s = 24; s >= 0; s -= 8) spiSend(arg >> s);

  // send CRC
  int crc = 0XFF;
  if (cmd == CMD0) crc = 0X95;  // correct crc for CMD0 with arg 0
  if (cmd == CMD8) crc = 0X87;  // correct crc for CMD8 with arg 0X1AA
  spiSend(crc);

  // wait for response
  for (int i = 0; ((status_ = spiRec()) & 0X80) && i != 0XFF; i++);
  return status_;
}
//------------------------------------------------------------------------------
/**
 * Determine the size of an SD flash memory card.
 *
 * \return The number of 512 byte data blocks in the card
 *         or zero if an error occurs.
 */
uint32_t Sd2Card::cardSize(void) {
  csd_t csd;
  if (!readCSD(&csd)) return 0;
  if (csd.v1.csd_ver == 0) {
    uint8_t read_bl_len = csd.v1.read_bl_len;
    uint16_t c_size = (csd.v1.c_size_high << 10)
                      | (csd.v1.c_size_mid << 2) | csd.v1.c_size_low;
    uint8_t c_size_mult = (csd.v1.c_size_mult_high << 1)
                          | csd.v1.c_size_mult_low;
    return (uint32_t)(c_size + 1) << (c_size_mult + read_bl_len - 7);
  } else if (csd.v2.csd_ver == 1) {
    uint32_t c_size = ((uint32_t)csd.v2.c_size_high << 16)
                      | (csd.v2.c_size_mid << 8) | csd.v2.c_size_low;
    return (c_size + 1) << 10;
  } else {
    error(SD_CARD_ERROR_BAD_CSD);
    return 0;
  }
}
//------------------------------------------------------------------------------
void Sd2Card::chipSelectHigh(void) {
  digitalWrite(chipSelectPin_, HIGH);
}
//------------------------------------------------------------------------------
void Sd2Card::chipSelectLow(void) {
  digitalWrite(chipSelectPin_, LOW);
}
//------------------------------------------------------------------------------
/** Erase a range of blocks.
 *
 * \param[in] firstBlock The address of the first block in the range.
 * \param[in] lastBlock The address of the last block in the range.
 *
 * \note This function requests the SD card to do a flash erase for a
 * range of blocks.  The data on the card after an erase operation is
 * either 0 or 1, depends on the card vendor.  The card must support
 * single block erase.
 *
 * \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.
 */
uint8_t Sd2Card::erase(uint32_t firstBlock, uint32_t lastBlock) {
  if (!eraseSingleBlockEnable()) {
    error(SD_CARD_ERROR_ERASE_SINGLE_BLOCK);
    goto fail;
  }
  if (type_ != SD_CARD_TYPE_SDHC) {
    firstBlock <<= 9;
    lastBlock <<= 9;
  }
  if (cardCommand(CMD32, firstBlock)
    || cardCommand(CMD33, lastBlock)
    || cardCommand(CMD38, 0)) {
      error(SD_CARD_ERROR_ERASE);
      goto fail;
  }
  if (!waitNotBusy(SD_ERASE_TIMEOUT)) {
    error(SD_CARD_ERROR_ERASE_TIMEOUT);
    goto fail;
  }
  chipSelectHigh();
  return true;

 fail:
  chipSelectHigh();
  return false;
}
//------------------------------------------------------------------------------
/** Determine if card supports single block erase.
 *
 * \return The value one, true, is returned if single block erase is supported.
 * The value zero, false, is returned if single block erase is not supported.
 */
uint8_t Sd2Card::eraseSingleBlockEnable(void) {
  csd_t csd;
  return readCSD(&csd) ? csd.v1.erase_blk_en : 0;
}
//------------------------------------------------------------------------------
/**
 * Initialize an SD flash memory card.
 *
 * \param[in] sckRateID SPI clock rate selector. See setSckRate().
 * \param[in] chipSelectPin SD chip select pin number.
 *
 * \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.  The reason for failure
 * can be determined by calling errorCode() and errorData().
 */
int Sd2Card::init(uint8_t sckRateID, uint8_t chipSelectPin, uint8_t wishboneSlot) {
	wishboneSlot_ = wishboneSlot;
	return init(sckRateID, chipSelectPin);
} 
 
int Sd2Card::init(uint8_t sckRateID, uint8_t chipSelectPin) {
  errorCode_ = inBlock_ = partialBlockRead_ = type_ = 0;
  chipSelectPin_ = chipSelectPin;
  // 16-bit init start time allows over a minute
  uint16_t t0 = (uint16_t)millis();
  uint32_t arg;

  // set pin modes
  pinMode(chipSelectPin_, OUTPUT);
  chipSelectHigh();
#ifndef USE_SPI_LIB
  pinMode(SPI_MISO_PIN, INPUT);
  pinMode(SPI_MOSI_PIN, OUTPUT);
  pinMode(SPI_SCK_PIN, OUTPUT);
#endif

#ifndef SOFTWARE_SPI
#ifndef USE_SPI_LIB
#ifndef ZPU
  // SS must be in output mode even it is not chip select
  pinMode(SS_PIN, OUTPUT);
  digitalWrite(SS_PIN, HIGH); // disable any SPI device using hardware SS pin
  // Enable SPI, Master, clock rate f_osc/128
  SPCR = (1 << SPE) | (1 << MSTR) | (1 << SPR1) | (1 << SPR0);
  // clear double speed
  SPSR &= ~(1 << SPI2X);
#endif // defined ZPU
#else // USE_SPI_LIB
  //SPI.begin();
  SPI.begin(WishboneSlot(wishboneSlot_));
  //SPI.begin(wishboneSlot_);
  REGISTER(IO_SLOT(wishboneSlot_),0)=BIT(SPICP1)|BIT(SPICPOL)|BIT(SPISRE)|BIT(SPIEN)|BIT(SPIBLOCK);
  //SPI.setClockDivider(128);
#ifdef SPI_CLOCK_DIV128
    SPI.setClockDivider(SPI_CLOCK_DIV128);
#else
#ifndef ZPU
    SPI.setClockDivider(255);
#endif
#endif
#endif // USE_SPI_LIB
#endif // SOFTWARE_SPI

  // must supply min of 74 clock cycles with CS high.
  for (uint8_t i = 0; i < 10; i++) spiSend(0XFF);

  chipSelectLow();

  // command to go idle in SPI mode
  while ((status_ = cardCommand(CMD0, 0)) != R1_IDLE_STATE) {
    if (((uint16_t)millis() - t0) > SD_INIT_TIMEOUT) {
      error(SD_CARD_ERROR_CMD0);
      goto fail;
    }
  }
  // check SD version
  if ((cardCommand(CMD8, 0x1AA) & R1_ILLEGAL_COMMAND)) {
    type(SD_CARD_TYPE_SD1);
  } else {
    // only need last byte of r7 response
    for (uint8_t i = 0; i < 4; i++) status_ = spiRec();
    if (status_ != 0XAA) {
      error(SD_CARD_ERROR_CMD8);
      goto fail;
    }
    type(SD_CARD_TYPE_SD2);
  }
  // initialize card and send host supports SDHC if SD2
  arg = type() == SD_CARD_TYPE_SD2 ? 0X40000000 : 0;

  while ((status_ = cardAcmd(ACMD41, arg)) != R1_READY_STATE) {
    // check for timeout
    if (((uint16_t)millis() - t0) > SD_INIT_TIMEOUT) {
      error(SD_CARD_ERROR_ACMD41);
      goto fail;
    }
  }

  // if SD2 read OCR register to check for SDHC card
  if (type() == SD_CARD_TYPE_SD2) {
    if (cardCommand(CMD58, 0)) {
      error(SD_CARD_ERROR_CMD58);
      goto fail;
    }
    if ((spiRec() & 0XC0) == 0XC0) type(SD_CARD_TYPE_SDHC);
    // discard rest of ocr - contains allowed voltage range
    for (uint8_t i = 0; i < 3; i++) spiRec();
  }
  chipSelectHigh();

  return true;

#ifndef SOFTWARE_SPI
  return setSckRate(sckRateID);
#else  // SOFTWARE_SPI
  return true;
#endif  // SOFTWARE_SPI

 fail:
  chipSelectHigh();
  return false;
}
//------------------------------------------------------------------------------
/**
 * Enable or disable partial block reads.
 *
 * Enabling partial block reads improves performance by allowing a block
 * to be read over the SPI bus as several sub-blocks.  Errors may occur
 * if the time between reads is too long since the SD card may timeout.
 * The SPI SS line will be held low until the entire block is read or
 * readEnd() is called.
 *
 * Use this for applications like the Adafruit Wave Shield.
 *
 * \param[in] value The value TRUE (non-zero) or FALSE (zero).)
 */
void Sd2Card::partialBlockRead(uint8_t value) {
  readEnd();
  partialBlockRead_ = value;
}
//------------------------------------------------------------------------------
/**
 * Read a 512 byte block from an SD card device.
 *
 * \param[in] block Logical block to be read.
 * \param[out] dst Pointer to the location that will receive the data.

 * \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.
 */
int Sd2Card::readBlock(uint32_t block, uint8_t* dst) {
#ifdef AVR
  return readData(block, 0, 512, dst);
#else
	unsigned int *idst;
	int i;


	if (!inBlock_ || block != block_) {
		block_ = block;
		// use address if not SDHC card
		if (type()!= SD_CARD_TYPE_SDHC) block <<= 9;
		if (cardCommand(CMD17, block)) {
			error(SD_CARD_ERROR_CMD17);
			goto fail;
		}
		if (!waitStartBlock()) {
			goto fail;
		}
		offset_ = 0;
		inBlock_ = 1;
	}
		/* Do fast readout */

	idst = (unsigned int*)dst;
	for (i=128;i!=0;i--) {
		*idst++=spiRec32(wishboneSlot_);
		// USPIDATA=0xff;
		// USPIDATA=0xff;
		// USPIDATA=0xff;
		// USPIDATA=0xff;
		//*idst++=USPIDATA;
	}
	chipSelectHigh();
	inBlock_ = 0;
	return true;

fail:
	chipSelectHigh();
  return false;
#endif
}
//------------------------------------------------------------------------------
/**
 * Read part of a 512 byte block from an SD card.
 *
 * \param[in] block Logical block to be read.
 * \param[in] offset Number of bytes to skip at start of block
 * \param[out] dst Pointer to the location that will receive the data.
 * \param[in] count Number of bytes to read
 * \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.
 */
int Sd2Card::readData(uint32_t block,
					  unsigned offset, unsigned count, uint8_t* dst) {
	unsigned n;
	if (count == 0) return true;
	if ((count + offset) > 512) {
		goto fail;
	}
	if (!inBlock_ || block != block_ || offset < offset_) {
    block_ = block;
    // use address if not SDHC card
    if (type()!= SD_CARD_TYPE_SDHC) block <<= 9;
    if (cardCommand(CMD17, block)) {
      error(SD_CARD_ERROR_CMD17);
      goto fail;
    }
    if (!waitStartBlock()) {
      goto fail;
    }
    offset_ = 0;
    inBlock_ = 1;
  }

#ifdef OPTIMIZE_HARDWARE_SPI
  // start first spi transfer
  SPDR = 0XFF;

  // skip data before offset
  for (;offset_ < offset; offset_++) {
    while (!(SPSR & (1 << SPIF)));
    SPDR = 0XFF;
  }
  // transfer data
  n = count - 1;
  for (uint16_t i = 0; i < n; i++) {
    while (!(SPSR & (1 << SPIF)));
    dst[i] = SPDR;
    SPDR = 0XFF;
  }
  // wait for last byte
  while (!(SPSR & (1 << SPIF)));
  dst[n] = SPDR;

#else  // OPTIMIZE_HARDWARE_SPI

  // skip data before offset
  for (;offset_ < offset; offset_++) {
    spiRec();
  }
  // transfer data
  for (uint16_t i = 0; i < count; i++) {
    dst[i] = spiRec();
  }
#endif  // OPTIMIZE_HARDWARE_SPI

  offset_ += count;
  if (!partialBlockRead_ || offset_ >= 512) {
    // read rest of data, checksum and set chip select high
    readEnd();
  }
  return true;

 fail:
  chipSelectHigh();
  return false;
}
//------------------------------------------------------------------------------
/** Skip remaining data in a block when in partial block read mode. */
void Sd2Card::readEnd(void) {
  if (inBlock_) {
      // skip data and crc
#ifdef OPTIMIZE_HARDWARE_SPI
    // optimize skip for hardware
    SPDR = 0XFF;
    while (offset_++ < 513) {
      while (!(SPSR & (1 << SPIF)));
      SPDR = 0XFF;
    }
    // wait for last crc byte
    while (!(SPSR & (1 << SPIF)));
#else  // OPTIMIZE_HARDWARE_SPI
    while (offset_++ < 514) spiRec();
#endif  // OPTIMIZE_HARDWARE_SPI
    chipSelectHigh();
    inBlock_ = 0;
  }
}
//------------------------------------------------------------------------------
/** read CID or CSR register */
int Sd2Card::readRegister(unsigned cmd, void* buf) {
  uint8_t* dst = reinterpret_cast<uint8_t*>(buf);
  if (cardCommand(cmd, 0)) {
    error(SD_CARD_ERROR_READ_REG);
    goto fail;
  }
  if (!waitStartBlock()) goto fail;
  // transfer data
  for (unsigned i = 0; i < 16; i++) dst[i] = spiRec();
  spiRec();  // get first crc byte
  spiRec();  // get second crc byte
  chipSelectHigh();
  return true;

 fail:
  chipSelectHigh();
  return false;
}
//------------------------------------------------------------------------------
/**
 * Set the SPI clock rate.
 *
 * \param[in] sckRateID A value in the range [0, 6].
 *
 * The SPI clock will be set to F_CPU/pow(2, 1 + sckRateID). The maximum
 * SPI rate is F_CPU/2 for \a sckRateID = 0 and the minimum rate is F_CPU/128
 * for \a scsRateID = 6.
 *
 * \return The value one, true, is returned for success and the value zero,
 * false, is returned for an invalid value of \a sckRateID.
 */
uint8_t Sd2Card::setSckRate(uint8_t sckRateID) {
#ifndef ZPU
  if (sckRateID > 6) {
    error(SD_CARD_ERROR_SCK_RATE);
    return false;
  }
#ifndef USE_SPI_LIB
  // see avr processor datasheet for SPI register bit definitions
  if ((sckRateID & 1) || sckRateID == 6) {
    SPSR &= ~(1 << SPI2X);
  } else {
    SPSR |= (1 << SPI2X);
  }
  SPCR &= ~((1 <<SPR1) | (1 << SPR0));
  SPCR |= (sckRateID & 4 ? (1 << SPR1) : 0)
    | (sckRateID & 2 ? (1 << SPR0) : 0);
#else // USE_SPI_LIB
  int v;
#ifdef SPI_CLOCK_DIV128
  switch (sckRateID) {
    case 0: v=SPI_CLOCK_DIV2; break;
    case 1: v=SPI_CLOCK_DIV4; break;
    case 2: v=SPI_CLOCK_DIV8; break;
    case 3: v=SPI_CLOCK_DIV16; break;
    case 4: v=SPI_CLOCK_DIV32; break;
    case 5: v=SPI_CLOCK_DIV64; break;
    case 6: v=SPI_CLOCK_DIV128; break;
  }
#else // SPI_CLOCK_DIV128
  v = 2 << sckRateID;
#endif // SPI_CLOCK_DIV128
  SPI.setClockDivider(v);
#endif // USE_SPI_LIB
#endif // defined ZPU
  return true;
}
//------------------------------------------------------------------------------
// wait for card to go not busy
int Sd2Card::waitNotBusy(unsigned timeoutMillis) {
  unsigned t0 = millis();
  do {
    if (spiRec() == 0XFF) return true;
  }
  while ((millis() - t0) < timeoutMillis);
  return false;
}
//------------------------------------------------------------------------------
/** Wait for start block token */
int Sd2Card::waitStartBlock(void) {
	//unsigned t0 = millis();
	unsigned count = 30000;
	while ((status_ = spiRec()) == 0XFF) {
		if (count-- == 0) {
			error(SD_CARD_ERROR_READ_TIMEOUT);
			goto fail;
		}
	}

  if (status_ != DATA_START_BLOCK) {
    error(SD_CARD_ERROR_READ);
    goto fail;
  }
  return true;

 fail:
  chipSelectHigh();
  return false;
}
//------------------------------------------------------------------------------
/**
 * Writes a 512 byte block to an SD card.
 *
 * \param[in] blockNumber Logical block to be written.
 * \param[in] src Pointer to the location of the data to be written.
 * \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.
 */
int Sd2Card::writeBlock(uint32_t blockNumber, const uint8_t* src) {
#ifdef SD_WRITE_SUPPORT

#if SD_PROTECT_BLOCK_ZERO
  // don't allow write to first block
  if (blockNumber == 0) {
    error(SD_CARD_ERROR_WRITE_BLOCK_ZERO);
    goto fail;
  }
#endif  // SD_PROTECT_BLOCK_ZERO

  // use address if not SDHC card
  if (type() != SD_CARD_TYPE_SDHC) blockNumber <<= 9;
  if (cardCommand(CMD24, blockNumber)) {
    error(SD_CARD_ERROR_CMD24);
    goto fail;
  }
  if (!writeData(DATA_START_BLOCK, src)) goto fail;

  // wait for flash programming to complete
  if (!waitNotBusy(SD_WRITE_TIMEOUT)) {
    error(SD_CARD_ERROR_WRITE_TIMEOUT);
    goto fail;
  }
  // response is r2 so get and check two bytes for nonzero
  if (cardCommand(CMD13, 0) || spiRec()) {
    error(SD_CARD_ERROR_WRITE_PROGRAMMING);
    goto fail;
  }
  chipSelectHigh();
  return true;

 fail:
	 chipSelectHigh();
#endif
  return false;
}
//------------------------------------------------------------------------------
/** Write one data block in a multiple block write sequence */
int Sd2Card::writeData(const uint8_t* src) {
#ifdef SD_WRITE_SUPPORT
  // wait for previous write to finish
  if (!waitNotBusy(SD_WRITE_TIMEOUT)) {
    error(SD_CARD_ERROR_WRITE_MULTIPLE);
    chipSelectHigh();
    return false;
  }
  return writeData(WRITE_MULTIPLE_TOKEN, src);
#else
  return false;
#endif
}
//------------------------------------------------------------------------------
// send one block of data for write block or write multiple blocks
int Sd2Card::writeData(uint8_t token, const uint8_t* src) {
#ifdef SD_WRITE_SUPPORT
#ifdef OPTIMIZE_HARDWARE_SPI

  // send data - optimized loop
  SPDR = token;

  // send two byte per iteration
  for (uint16_t i = 0; i < 512; i += 2) {
    while (!(SPSR & (1 << SPIF)));
    SPDR = src[i];
    while (!(SPSR & (1 << SPIF)));
    SPDR = src[i+1];
  }

  // wait for last data byte
  while (!(SPSR & (1 << SPIF)));

#else  // OPTIMIZE_HARDWARE_SPI
  spiSend(token);
  for (uint16_t i = 0; i < 512; i++) {
    spiSend(src[i]);
  }
#endif  // OPTIMIZE_HARDWARE_SPI
  spiSend(0xff);  // dummy crc
  spiSend(0xff);  // dummy crc

  status_ = spiRec();
  if ((status_ & DATA_RES_MASK) != DATA_RES_ACCEPTED) {
    error(SD_CARD_ERROR_WRITE);
    chipSelectHigh();
    return false;
  }
  return true;
#else
  return false;
#endif
}
//------------------------------------------------------------------------------
/** Start a write multiple blocks sequence.
 *
 * \param[in] blockNumber Address of first block in sequence.
 * \param[in] eraseCount The number of blocks to be pre-erased.
 *
 * \note This function is used with writeData() and writeStop()
 * for optimized multiple block writes.
 *
 * \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.
 */
int Sd2Card::writeStart(uint32_t blockNumber, uint32_t eraseCount) {
#ifdef SD_WRITE_SUPPORT
#if SD_PROTECT_BLOCK_ZERO
  // don't allow write to first block
  if (blockNumber == 0) {
    error(SD_CARD_ERROR_WRITE_BLOCK_ZERO);
    goto fail;
  }
#endif  // SD_PROTECT_BLOCK_ZERO
  // send pre-erase count
  if (cardAcmd(ACMD23, eraseCount)) {
    error(SD_CARD_ERROR_ACMD23);
    goto fail;
  }
  // use address if not SDHC card
  if (type() != SD_CARD_TYPE_SDHC) blockNumber <<= 9;
  if (cardCommand(CMD25, blockNumber)) {
    error(SD_CARD_ERROR_CMD25);
    goto fail;
  }
  return true;

 fail:
	 chipSelectHigh();
#endif
  return false;
}
//------------------------------------------------------------------------------
/** End a write multiple blocks sequence.
 *
* \return The value one, true, is returned for success and
 * the value zero, false, is returned for failure.
 */
int Sd2Card::writeStop(void) {
#ifdef SD_WRITE_SUPPORT
  if (!waitNotBusy(SD_WRITE_TIMEOUT)) goto fail;
  spiSend(STOP_TRAN_TOKEN);
  if (!waitNotBusy(SD_WRITE_TIMEOUT)) goto fail;
  chipSelectHigh();
  return true;

 fail:
  error(SD_CARD_ERROR_STOP_TRAN);
  chipSelectHigh();
#endif
  return false;
}
