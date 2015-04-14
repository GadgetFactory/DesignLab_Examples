/*

 Robot_Control_Library - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#ifndef __Robot_Control_Library_H__
#define __Robot_Control_Library_H__

#include <inttypes.h> 
#include <zpuino-types.h>
#include <zpuino.h>
#include "Arduino.h"

class Robot_Control_Library
{
  public:
    Robot_Control_Library();
	void setup(unsigned int wishboneSlot);
        int getPulseCount(unsigned int i);
        int getRevCount(unsigned int i);
        int getSpeed(unsigned int i);
        float getSpeedRad(unsigned int i);
        int getAccel(unsigned int i);
  private:
    int wishboneSlot;
};

#endif
