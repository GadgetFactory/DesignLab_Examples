/*

 Robot_Control_Library - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "Robot_Control_Library.h"

Robot_Control_Library::Robot_Control_Library()
{

}

void Robot_Control_Library::setupQuad(unsigned int wishboneSlotQuad)
{
	this->wishboneSlotQuad = wishboneSlotQuad;
}

//unsigned long Robot_Control_Library::readButtons()
//{
//	return REGISTER(IO_SLOT(wishboneSlotQuad),1);
//}
//
//void Robot_Control_Library::writeLEDs(unsigned long value)
//{
//	REGISTER(IO_SLOT(wishboneSlotQuad),0) = value;
//}

int Robot_Control_Library::getPulseCount(unsigned int i){
  return REGISTER(IO_SLOT(wishboneSlotQuad),i*4);
}

int Robot_Control_Library::getRevCount(unsigned int i){
  return REGISTER(IO_SLOT(wishboneSlotQuad),i*4+1);
}

int Robot_Control_Library::getSpeed(unsigned int i){
  return REGISTER(IO_SLOT(wishboneSlotQuad),i*4+2);
}

float Robot_Control_Library::getSpeedRad(unsigned int i){
  float data = (float)getSpeed(i);
  //time for one A pulse: 1/freq * clk tick per A pulse = time for per pulse
  //xil_printf("lujer1; %d\n\r",(int)data);
  data /= 50000000.0;
  //xil_printf("lujer1; %d\n\r",(int)(data*1000000.0));
  //xil_printf("piting: %d\n\r",(int)((((2.0*3.14159265)/512.0))*10000));
  float tmp = (2.0*3.14159265)/512.0;
  //xil_printf("piting: %d\n\r",(int)(tmp*10000));
  if(data != 0)
    data = tmp/data;
  else 
    data = 0;
  //xil_printf("float: %d\n\r",(int)data);
  return data;
}

int Robot_Control_Library::getAccel(unsigned int i){
  return REGISTER(IO_SLOT(wishboneSlotQuad),i*4+3);
}
