/*

 Wishbone_Symbol_Example - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#ifndef __Wishbone_Symbol_Example_H__
#define __Wishbone_Symbol_Example_H__

#include <inttypes.h> 
#include <zpuino-types.h>
#include <zpuino.h>
#include "Arduino.h"

class Wishbone_Symbol_Example
{
  public:
    Wishbone_Symbol_Example();
	void setup(unsigned int wishboneSlot);
    unsigned long readButtons();
    void writeLEDs(unsigned long value);
  private:
    int wishboneSlot;
};

#endif