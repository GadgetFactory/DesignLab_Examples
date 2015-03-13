/*
 Gadget Factory
 Zpuino 2.0 Timer Example
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 Tutorials:

 Related library documentation:

 Hardware:
   
 Special Notes:

 created 2015
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define circuit ZPUino_Vanilla 

#include <Timer.h>
 
int led = 13;
int ledVal = 0;
 
void setup() {
  // put your setup code here, to run once:
  
  Serial.begin(9600);
  
  pinMode(led, OUTPUT);   
  
 //Setup timer that will generate an interrupt at 1hz
  Timers.begin();
    int r = Timers.periodicHz(1, timer, 0, 1);
    if (r<0) {
        Serial.println("Fatal error!");
    }   
  
}

bool timer(void*)
{
  //1Hz Timer
  Serial.println("In Timer");
  ledVal = ~ledVal;
  digitalWrite(led, ledVal); 
  return true;
}

void loop() {

}
