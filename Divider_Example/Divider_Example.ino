/*
 Gadget Factory
 LogicStart Shield Divider Example
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 This is a quick example of generating a 1Hz clock from the AVR chip and then dividing it and outputting the clock on the LEDs
 of the LogicStart Shield.

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
int led = 13;
 
void setup() {
  // put your setup code here, to run once:
  
  pinMode(led, OUTPUT);   
  
}

void loop() {
  digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(500);               // wait for a second
  digitalWrite(led, LOW);    // turn the LED off by making the voltage LOW
  delay(500);               // wait for a second
}
