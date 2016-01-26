/*
 Gadget Factory
 Template to make your own Schematic Symbol and Community Core Library for the Papilio FPGA and DesignLab

 To use this sketch do the following steps:
  1) 
  
 Tools for generating your own libraries:
 

 Tutorials:
   http://learn.gadgetfactory.net
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define circuit Wishbone_Sump

unsigned int samplebuffer[8192];
 
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);  
  
  //Set base address for shared memory
  REGISTER(IO_SLOT(14),0x400) = (unsigned)&samplebuffer[0];
  //Set end of shared memory
  REGISTER(IO_SLOT(14),0x404) = (unsigned)&samplebuffer[1891];  
  
  //Reset
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  //Mask
  //REGISTER(IO_SLOT(14),0xc0) = 0xFFFFFFFE;
  REGISTER(IO_SLOT(14),0xc0) = 0x00000000;
  //Mask Value
  //REGISTER(IO_SLOT(14),0xc1) = 0x00000001;
  REGISTER(IO_SLOT(14),0xc1) = 0x00000000;
  
  //Conf
  REGISTER(IO_SLOT(14),0xc2) = 0x08000000;
  //Speed
  REGISTER(IO_SLOT(14),0x80) = 0x00000000;
  //Size
  REGISTER(IO_SLOT(14),0x81) = 0x20000000;
  //  REGISTER(IO_SLOT(14),0x81) = 0x00002000;
  //Flags
  REGISTER(IO_SLOT(14),0x82) = 0x00000000;
  //ARM
  REGISTER(IO_SLOT(14),0x01) = 0x00000000;
}

void loop() {
	Serial.println(REGISTER(IO_SLOT(14),256),HEX);
        delay(1000);

}
