/*
  Gadget Factory
  Papilio One VGA Color Bar Example
  
 VGA Wing Introduction:
 http://papilio.cc/index.php?n=Papilio.VGAWingIntroduction
 
 Hardware:
 If using an Arcade MegaWing or a LogicStart MegaWing then select the appropriate "Hyperion" board type in the ZAP IDE.
 If using a VGA Wing or some other device then use the "Hyperion" pinselect board type in the ZAP IDE and be sure to uncomment "setup_pin_select" in setup.
 
 ZPUino Variant:
 Hyperion "The Lord of Light" with HQVGA adapter is needed for this example sketch

 created 2012
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#include "VGA.h"

//Use the VGA library for this sketches FPGA circuit
#define circuit hqvga

int textarea = 20;
int colors[] = {RED,GREEN,BLUE,YELLOW,PURPLE,CYAN,WHITE,BLACK};


void setup() {
  
  VGA.begin(VGAWISHBONESLOT(9),CHARMAPWISHBONESLOT(10));
  
  int width = VGA.getHSize();
  int height = VGA.getVSize();
  int column = width/8;
  
  
  VGA.clear();
  VGA.setBackgroundColor(BLACK);
  VGA.setColor(RED);
  VGA.printtext(25,0,"Papilio/ZPUino");
  VGA.printtext(25,10,"Color Bar Test");
  for ( int i=0; i<8; i++ )
  {
    VGA.setColor(colors[i]);
    VGA.drawRect(i*column, textarea, column, height-textarea);
  } 
}

void loop() {
  
}
