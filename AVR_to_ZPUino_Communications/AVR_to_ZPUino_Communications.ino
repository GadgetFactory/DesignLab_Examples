/*
 Gadget Factory - AVR to ZPUino Communications
 An example of how to communicate between the AVR microcontroller and the ZPUino Soft Processor over the Wishbone bus.
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 Tutorials:

 Related library documentation:

 Hardware:
   
 Special Notes:

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#include "AVR_Wishbone_Bridge.h"
#include "SPI.h"

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); 
  #if defined(ARDUINO_ARCH_AVR)  //Only the AVR needs to start SPI for the AVR to Wishbone bridge. The ZPUino can write directly to Wishbone peripherals.
    SPI.begin();
  #endif
  
}

void loop() {
  for(int i=0;i<256;i++) {
    #if defined(ARDUINO_ARCH_AVR)  //In this example only the AVR is going to write to the Wishbone peripheral.
      REGISTER(IO_SLOT(9),0) = i;
    #endif
    Serial.println(REGISTER(IO_SLOT(9),0));  //Both the AVR and ZPUino will read from the shared Wishbone peripheral.
    delay(20);
  }
}
