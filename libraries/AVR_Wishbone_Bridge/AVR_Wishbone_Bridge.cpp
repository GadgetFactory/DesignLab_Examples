/*

 AVR_Wishbone_Bridge - Allows AVR to communicate with wishbone chips in the FPGA.

 Allows AVR to communicate with wishbone chips in the FPGA

 License: GNU General Public License V3

 (C) Copyright (Gadget Factory)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "AVR_Wishbone_Bridge.h"

uint32_t REGISTER::read()
{
    uint32_t val = 0;
    uint8_t v;
    int retries = 8;
    int i;

    digitalWrite(SS,LOW);
    SPI.transfer(0x40); // Read.
    SPI.transfer(_address>>24);
    SPI.transfer(_address>>16);
    SPI.transfer(_address>>8);
    SPI.transfer(_address);
    do {
        v = SPI.transfer(0xff);
        if (v==0xFE) break;
    } while (--retries);

    if (retries==0) {
        Serial.print("Error communicating.");
    } else {
        // Read out value.
        for (i=0;i<4;i++) {
            v = SPI.transfer(0xff);
            val<<=8;
            val|=v;
        }
    }
    digitalWrite(SS,HIGH);
    return val;
}

void REGISTER::write(uint32_t val)
{
    uint8_t v;
    int retries = 8;
    int i;

    digitalWrite(SS,LOW);
    SPI.transfer(0xC0); // Write.
    SPI.transfer(_address>>24);
    SPI.transfer(_address>>16);
    SPI.transfer(_address>>8);
    SPI.transfer(_address);
    SPI.transfer(val>>24);
    SPI.transfer(val>>16);
    SPI.transfer(val>>8);
    SPI.transfer(val);

    do {
        v = SPI.transfer(0xff);
        if (v==0xFE) break;
    } while (--retries);

    if (retries==0) {
        Serial.print("Error communicating.");
    }
    digitalWrite(SS,HIGH);
}


