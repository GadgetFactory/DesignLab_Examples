/*

 Quadrature_decoder - Decoder for Encoders.

 One instance can track four encoders

 License: GNU General Public License V3

 (C) Copyright (Filip Filipov)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#ifndef __Quadrature_decoder_H__
#define __Quadrature_decoder_H__

#include <inttypes.h> 
#include <zpuino-types.h>
#include <zpuino.h>
#include "Arduino.h"

class Quadrature_decoder
{
  public:
    Quadrature_decoder();
	void setup(unsigned int wishboneSlot);
    signed long read_1();
    signed long read_2();
    signed long read_3();
    signed long read_4();
    void write(unsigned long value);
  private:
    int wishboneSlot;
};

#endif
