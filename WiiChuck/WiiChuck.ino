/*
 Gadget Factory - Project Name
 Use this as a template for DesignLab ZPUino System on Chip Projects
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
 
//#define circuit WiiChuck
 
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
