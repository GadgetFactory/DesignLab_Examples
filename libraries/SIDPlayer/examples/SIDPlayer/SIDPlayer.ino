/*
  Gadget Factory
  Papilio One VGA Hello World Example
  
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
#include "sidplayer.h"
#include "SID.h"
#include "SmallFS.h"
#include "ramFS.h"
#include <SD.h>

#define AUDIO_J1_L WING_B_1
#define AUDIO_J1_R WING_B_0

#define AUDIO_J2_L WING_B_3
#define AUDIO_J2_R WING_B_2

SIDPLAYER sidplayer;
//SID sidtmp; 

void setup() {
	//Move the audio output to the appropriate pins on the Papilio Hardware
	pinMode(AUDIO_J1_L,OUTPUT);
	digitalWrite(AUDIO_J1_L,HIGH);
	//outputPinForFunction(AUDIO_J1_L, IOPIN_SIGMADELTA0);
	outputPinForFunction(AUDIO_J1_L, 8);
	pinModePPS(AUDIO_J1_L, HIGH);

	pinMode(AUDIO_J1_R,OUTPUT);
	digitalWrite(AUDIO_J1_R,HIGH);
	outputPinForFunction(AUDIO_J1_R, 8);
	//outputPinForFunction(AUDIO_J1_R, IOPIN_SIGMADELTA1);
	pinModePPS(AUDIO_J1_R, HIGH);

	pinMode(AUDIO_J2_L,OUTPUT);
	digitalWrite(AUDIO_J2_L,HIGH);
	outputPinForFunction(AUDIO_J2_L, 8);
	pinModePPS(AUDIO_J2_L, HIGH);

	pinMode(AUDIO_J2_R,OUTPUT);
	digitalWrite(AUDIO_J2_R,HIGH);
	outputPinForFunction(AUDIO_J2_R, 8);
	pinModePPS(AUDIO_J2_R, HIGH);

	//Setup timer
	TMR0CMP = (CLK_FREQ/(50*64))-1;
	TMR0CNT = 0x0;
	TMR0CTL = BIT(TCTLENA)|BIT(TCTLCCM)|BIT(TCTLDIR)|BIT(TCTLCP2)|BIT(TCTLCP0)|BIT(TCTLIEN);
	INTRMASK = BIT(INTRLINE_TIMER0); // Enable Timer0 interrupt
	INTRCTL=1;  
	
	//Setup sid
	//sid.setVolume(15);
	
	//Setup sid player
	//sidplayer.setup(&sidtmp);
        sidplayer.setup();
	sidplayer.loadFile("music.sid");
        sidplayer.play(true); 	
}

void _zpu_interrupt()
{
  sidplayer.zpu_interrupt();
}

void loop() {
 
  //if (sidplayer.getPlaying() == 1)
    sidplayer.audiofill(); 		  
	
}