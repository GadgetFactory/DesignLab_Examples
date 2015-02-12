/*
 Gadget Factory
 LogicStart Shield LEDs
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 This project uses a circuit on the FPGA to connect the output of unused AVR pins to the LED's of the LogicStart Shield.
 
 Related library documentation:

 Hardware:
   Use this with a Papilio DUO with LogicStart Shield connected.
   
 Special Notes:

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
int ledPins[] = { 
  0, 1, 2, 3, 4, 10, 11, 12  };       // free pins on the Arduino that we output to. The FPGA has a circuit that connects these free pins to the LogicStart LED's.
  int ledCount = 8;           // the number of pins (i.e. the length of the array)
 
void setup() {
  // put your setup code here, to run once:
  // initialize the LED pins as an output:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(ledPins[thisPin], OUTPUT);  
  }
  
}

void loop() {
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    digitalWrite(ledPins[thisPin], HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(120);
    digitalWrite(ledPins[thisPin], LOW);    // turn the LED off by making the voltage LOW
  }
  for (int thisPin = 6; thisPin > 0; thisPin--)  {
    digitalWrite(ledPins[thisPin], HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(120);
    digitalWrite(ledPins[thisPin], LOW);    // turn the LED off by making the voltage LOW
  }  
}
