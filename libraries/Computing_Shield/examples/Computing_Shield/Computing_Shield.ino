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

#include "Computing_Shield.h"

Computing_Shield Computing_Shield;
 
void setup() {
  // put your setup code here, to run once:
  
  Computing_Shield.setup(5);   
  
}

void loop() {
	Serial.println(Computing_Shield.readButtons());
	Computing_Shield.writeLEDs(0xf);
}
