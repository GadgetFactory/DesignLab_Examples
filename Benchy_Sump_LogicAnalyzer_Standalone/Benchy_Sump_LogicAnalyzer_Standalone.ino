/*
 Gadget Factory - Project Name
 Stand Alone Sump "Blaze" Logic Analyzer with 32 BRAM blocks (64KB) and 16 channels.
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 Tutorials:

 Related library documentation:

 Hardware:
   
 Special Notes:
 If you want to generate a signal to test with then you can load this sketch to the AVR of the Papilio DUO. You will see a UART signal on channel0

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */


int counter = 0;

void setup() {
  // put your setup code here, to run once:
  Serial1.begin(115200);

}

void loop() {
  // put your main code here, to run repeatedly: 
  Serial1.write(counter);
  counter++;
  delay(1);

}
