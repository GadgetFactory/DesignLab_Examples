/*
 Gadget Factory
 Template to make your own Schematic Symbol and Community Core Library for the Papilio FPGA and DesignLab

 To use this sketch do the following steps:
  1) 
  
 Tools for generating your own libraries:
 

 Tutorials:
   http://learn.gadgetfactory.net
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#include "Robot_Control_Library.h"

Robot_Control_Library Robot_Control_Library;
 
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Robot_Control_Library.setup(5);   
  
}

void loop() {
	Serial.println(Robot_Control_Library.readButtons());
	Robot_Control_Library.writeLEDs(0xf);
}
