/*
 Gadget Factory - Wii Chuck example
 An example of using the Wii Chuck Wing with the Nintendo Wii Chuck Controller.
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 Tutorials:

 Related library documentation:

 Hardware:
   WiiChuck Wing connected to AL WingSlot
   
 Special Notes:
 Only works on Papilio DUO and Papilio Pro boards.

 created 2015
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
 
#define circuit ZPUino_Wings
 
#include "WiiChuck.h" 
#include "i2c.h"
 
void setup() {
  // put your setup code here, to run once:
  delay(1000);
  Serial.begin(9600);
  Serial.println("Starting");
  
  WIIChuck.begin();
  WIIChuck.init_nunchuck();
}

void loop() {
    WIIChuck.update();
    printf("Chuck: %d %d buttons %d %d\n",
           WIIChuck.getJoyX(),
           WIIChuck.getJoyY(),
           WIIChuck.getZButton(),
           WIIChuck.getCButton());
         
    delay(500);
}
