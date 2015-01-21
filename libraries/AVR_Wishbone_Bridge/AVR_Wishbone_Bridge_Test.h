/*

 AVR_Wishbone_Bridge_Test - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#ifndef __AVR_Wishbone_Bridge_Test_H__
#define __AVR_Wishbone_Bridge_Test_H__

#include <inttypes.h> 
#include <zpuino-types.h>
#include <zpuino.h>
#include "Arduino.h"
#include "AVR_Wishbone_Bridge.h"

class AVR_Wishbone_Bridge_Test
{
  public:
    AVR_Wishbone_Bridge_Test();
	void setup(unsigned int wishboneSlot);
    unsigned long readButtons();
    void writeLEDs(unsigned long value);
  private:
    int wishboneSlot;
};

#endif
