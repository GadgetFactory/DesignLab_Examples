#ifndef SPIADC_H_INCLUDED
#define SPIADC_H_INCLUDED

#include <Arduino.h>
#include <inttypes.h>

#ifndef SPI_H_INCLUDED

#include <SPI.h>
#endif
#define SPIADC_8BIT 0
#define SPIADC_12BIT 1

typedef unsigned char byte ;

INTVAL(CS);
INTVAL(WISHBONESLOT);
INTVAL(ADCBITS);

class SPIADC {
  public    :

    void       begin     (CS cs, WISHBONESLOT wishboneSlot, ADCBITS bits);
    uint16_t   read      (byte pin);
    SPIClass SPI;

  private   :
  byte SPI_ADC_CS ;
  bool adcBits ;
};

extern SPIADC analog;
extern SPIADC analog1;


#endif
