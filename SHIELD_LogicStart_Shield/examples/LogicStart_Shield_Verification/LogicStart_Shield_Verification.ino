/*
 Gadget Factory
 LogicStart MegaWing Example

 Related library documentation:
  http://papilio.cc/index.php?n=Papilio.VGA


 created 2014
 by Alvaro Lopes and Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#define circuit LogicStart_Shield

#define FREQ 17000          //Freq for all players 

#define LS_JOY_RIGHT 10
#define LS_JOY_LEFT  13
#define LS_JOY_DOWN  12
#define LS_JOY_UP    11

#include "HQVGA.h"
#include <SevenSegHW.h>
#include "SPI.h"

  #include <SD.h>
  #include "SmallFS.h"
  #include "modplayer.h"
  #include "ramFS.h"
  #include "cbuffer.h"
  #include <Timer.h>
  
  MODPLAYER modplayer;
  

SEVENSEGHW sevenseg;

int ledPins[] = { 
  48, 50, 52, 5, 6, 7, 8, 9  };       // an array of pin numbers to which LEDs are attached
int ledCount = 8;           // the number of pins (i.e. the length of the array)

int switchPins[] = { 
  0, 1, 2, 3, 4, 42, 44, 46 };       // an array of pin numbers to which Buttons are attached
int switchCount = 8;           // the number of pins (i.e. the length of the array)

int buttonState = 0;         // variable for reading the pushbutton status
int thisPin;
int ledState = LOW;
unsigned adcvalue = 5;
int cnt = 0;
int extcnt = 0;
int mode = 0;
unsigned channel=0;
int timeout=0;

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
  
  //Set what wishbone slot the audio passthrough device is connected to.
  modplayer.setup(5);

  modplayer.loadFile("music.mod");
  modplayer.play(true);  
  
 //Setup timer for YM and mod players, this generates an interrupt at 17000hz
  Timers.begin();
    int r = Timers.periodicHz(17000, (bool(*)(void*))timer, 0, 1);
    if (r<0) {
        Serial.println("Fatal error!");
    }    
  
  //Setup VGA Hello World
  VGA.begin(VGAWISHBONESLOT(9),CHARMAPWISHBONESLOT(10));
  VGA.clear();
  VGA.setBackgroundColor(BLACK);
  VGA.setColor(RED);
  VGA.printtext(35,10,"Hello World");
  VGA.printtext(15,30, "Hello World RED");
  VGA.setColor(GREEN);
  VGA.printtext(15,40, "Hello World GREEN");
  VGA.setColor(BLUE);
  VGA.printtext(15,50, "Hello World BLUE");
  VGA.setColor(YELLOW);
  VGA.printtext(15,60, "Hello World YELLOW");
  VGA.setColor(PURPLE);
  VGA.printtext(15,70, "Hello World PURPLE");
  VGA.setColor(CYAN);
  VGA.printtext(15,80, "Hello World CYAN");
  VGA.setColor(WHITE);
  VGA.printtext(15,90, "Hello World WHITE");   
  VGA.setBackgroundColor(WHITE);  
  VGA.setColor(BLACK);  
  VGA.printtext(15,100, "Hello World BLACK"); 
  
  sevenseg.begin(11);
  sevenseg.setBrightness(8);
  sevenseg.setHexValue(0x8888);
  
  // initialize the LED pins as an output:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(ledPins[thisPin], OUTPUT);
    digitalWrite(ledPins[thisPin], LOW);  
  }
  
  // initialize the switch pins as an input:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(switchPins[thisPin], INPUT);      
  }    
    
}

bool timer(void)
{
  //Interrupt runs at 17KHz
  modplayer.zpu_interrupt();
  return true;
}

static void up()
{
   sevenseg.custom(0,0);
   sevenseg.custom(0,1);
   sevenseg.custom(SEGB|SEGC|SEGD|SEGE|SEGF,2);
   sevenseg.custom(SEGA|SEGB|SEGE|SEGF|SEGG,3);
}

static void down()
{
   sevenseg.custom(SEGA|SEGB|SEGC|SEGD,0);
   sevenseg.custom(SEGA|SEGB|SEGC|SEGD|SEGE|SEGF,1);
   sevenseg.custom(SEGB|SEGC|SEGD|SEGE|SEGF|SEGG,2);
   sevenseg.custom(SEGA|SEGB|SEGC|SEGE|SEGF,3);
}

static void right()
{
   sevenseg.custom(SEGA|SEGB|SEGC|SEGE|SEGG,0);
   sevenseg.custom(SEGA|SEGC|SEGD|SEGE|SEGF,1);
   sevenseg.custom(SEGB|SEGC|SEGE|SEGF|SEGG,2);
   sevenseg.custom(SEGD|SEGE|SEGF|SEGG,3);
}

static void left()
{
   sevenseg.custom(SEGD|SEGE|SEGF,0);
   sevenseg.custom(SEGA|SEGD|SEGE|SEGF|SEGG,1);
   sevenseg.custom(SEGA|SEGE|SEGF|SEGG,2);
   sevenseg.custom(SEGD|SEGE|SEGF|SEGG,3);
}

void loop() {
  // put your main code here, to run repeatedly: 

  if (modplayer.getPlaying() == 1)
    modplayer.audiofill();
   
    
  //Handle LED's and Switches
  for (int thisPin = 0; thisPin < switchCount; thisPin++)  {
    // read the state of the pushbutton value:
    buttonState = digitalRead(switchPins[thisPin]);
  
    // check if the switch is on.
    // if it is, the buttonState is HIGH:
    if (buttonState == HIGH) {     
      // turn LED on:    
      digitalWrite(ledPins[thisPin], HIGH);  
    } 
    else {
      // toggle LED:
      digitalWrite(ledPins[thisPin], LOW); 
    }
  }    

  
  //Handle joystick and reading SPI ADC
  if ((extcnt & 0x17) == 0) {
    if (timeout==0) {
      if (digitalRead(LS_JOY_UP)) {
          //Serial.println("Up");
          up();
      } else if (digitalRead(LS_JOY_DOWN)) {
          //Serial.println("Down");
          down();
      } else if (digitalRead(LS_JOY_LEFT)) {
          //Serial.println("Left");
          left();
      } else if (digitalRead(LS_JOY_RIGHT)) {
          //Serial.println("Right");
          right();
      }      
      else  {
        sevenseg.setHexValue(0x8888);
      }
    }
        cnt++;
  }
      extcnt++;
      if (timeout!=0)
        timeout--;        
}
