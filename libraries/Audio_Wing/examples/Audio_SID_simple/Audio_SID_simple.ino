/*
 Gadget Factory
 SID Audio Player Example
 To learn more about the Papilio Schematic Library please visit http://learn.gadgetfactory.net
 
 Hardware:
  Connect an Audio Wing to the CH WingSlot
  
 Notes: This sketch is too big to run on the Papilio One 500K or 250K.

 created 2012
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define circuit Audio_Wing

#include <SD.h>
#include <SPI.h>
#include "SID.h"
#include "SmallFS.h"
#include "ramFS.h"
#include "cbuffer.h"
#include "sidplayer.h"
#include <Timer.h>

SIDPLAYER sidplayer;

int sidplayercounter = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Starting");
  
   //Start SmallFS
  if (SmallFS.begin()<0) {
	Serial.println("No SmalLFS found.");
  }
  else{
     Serial.println("SmallFS Started.");
  }  
  
 //Setup timer for YM and mod players, this generates an interrupt at 1700hz
  Timers.begin();
    int r = Timers.periodicHz(50, timer, 0, 1);
    if (r<0) {
        Serial.println("Fatal error!");
    }     
    
  //Set what wishbone slot the sid device is connected to.
  sidplayer.setup(8);  
  
  sidplayer.loadFile("music.sid");
  sidplayer.play(true); 
  
}

bool timer(void*)
{
  //We need 50Hz for SID
  sidplayer.zpu_interrupt(); 
  return true;
}

void loop() {
  // put your main code here, to run repeatedly: 
  if (sidplayer.getPlaying() == 1)    
    sidplayer.audiofill();  
}
