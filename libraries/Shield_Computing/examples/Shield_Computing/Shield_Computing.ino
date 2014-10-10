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

#include "Shield_Computing.h"

Shield_Computing Shield_Computing;
 
void setup() {
  // put your setup code here, to run once:
  
  Shield_Computing.setup(5);   
  
}

void loop() {
	Serial.println(Shield_Computing.readButtons());
	Shield_Computing.writeLEDs(0xf);
}
