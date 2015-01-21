/*
 Gadget Factory
 Mod File Example
 To learn more about the Papilio Schematic Library please visit http://learn.gadgetfactory.net
 
 Hardware:
  Connect an Audio Wing to the CH WingSlot
  
 Notes:
   Does not work no Papilio One 500K or 250K - not enough memory.

 created 2012
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define circuit Audio_Wing

#include <SD.h>
#include <SPI.h>
#include "SmallFS.h"
#include "modplayer.h"
#include "ramFS.h"
#include "cbuffer.h"
#include <Timer.h>

MODPLAYER modplayer;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
   //Start SmallFS
  if (SmallFS.begin()<0) {
	Serial.println("No SmalLFS found.");
  }
  else{
     Serial.println("SmallFS Started.");
  }  
  
 //Setup timer for YM and mod players, this generates an interrupt at 1700hz
  Timers.begin();
    int r = Timers.periodicHz(17000, (bool(*)(void*))timer, 0, 1);
    if (r<0) {
        Serial.println("Fatal error!");
    }   
    
  //Set what wishbone slot the audio passthrough device is connected to.
  modplayer.setup(5);

  modplayer.loadFile("music.mod");
  modplayer.play(true);
  Serial.println("Finish Setup");
  
}

bool timer(void)
{
  //Interrupt runs at 17KHz
  modplayer.zpu_interrupt();
  return true;
}

void loop() {

  // put your main code here, to run repeatedly: 
  if (modplayer.getPlaying() == 1)
    modplayer.audiofill();
}
