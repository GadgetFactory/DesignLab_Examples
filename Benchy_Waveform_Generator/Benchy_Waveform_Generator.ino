/*
 Gadget Factory
 Waveform Generator Example
 To learn more about DesignLab please visit http://learn.gadgetfactory.net

 Hardware:
  Papilio Pro, Papilio One 500K

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

//This is what wishbone slot you are using
#define MYBASE IO_SLOT(5)
#define MYREG(x) REGISTER(MYBASE,x) 

void setup() {
  // put your setup code here, to run once:
  
  setFreq(2.4);  //Sets in Mhz

}

void setFreq(float freq)  //sets in Mhz
{
  unsigned long long phase = freq * 44507433.119;
  MYREG(0) = phase;
}

void loop() {
  // put your main code here, to run repeatedly: 
  
}
