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
#define circuit Wishbone_Sump_LA

unsigned int samplebuffer[8192];
 
void setup() {
  
        for (int i = 0; i < 8192; i++ ){ 
         samplebuffer[i] = 0xaa;
        }  
  
  // put your setup code here, to run once:
  Serial.begin(9600);  

  setupLA();  

  delay(1000);
}

void loop() {
	Serial.println(REGISTER(IO_SLOT(14),256),HEX);
        if (REGISTER(IO_SLOT(14),256) == 0x43) {
          for (int i = 0; i < 50; i++ ){ 
           Serial.println(samplebuffer[i],HEX);
          }
          //Clear trigger
          REGISTER(IO_SLOT(14),0x108) = 0x01;
          Serial.println(REGISTER(IO_SLOT(14),256),HEX);
          setupLA();
        }
        delay(1000);        
}

void setupLA() {
  delay(2000);
  Serial.println(REGISTER(IO_SLOT(14),256),HEX);
  
  //Set base address for shared memory
  REGISTER(IO_SLOT(14),0x100) = (unsigned)&samplebuffer[0];
  //Set end of shared memory
  REGISTER(IO_SLOT(14),0x104) = (unsigned)&samplebuffer[8192];  

  delay(2000);
  Serial.println(REGISTER(IO_SLOT(14),256),HEX);  
  

  
  //Reset
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  REGISTER(IO_SLOT(14),0x0) = 0x0;
  
  //Enable Fifo
  //REGISTER(IO_SLOT(14),0x408) = 0x02;   
  
  //Mask
  //REGISTER(IO_SLOT(14),0xc0) = 0xFFFFFFFE;
  REGISTER(IO_SLOT(14),0xc0) = 0x00000000;
  //Mask Value
  //REGISTER(IO_SLOT(14),0xc1) = 0x00000001;
  REGISTER(IO_SLOT(14),0xc1) = 0x00000000;
  
  //Trigger Conf
  REGISTER(IO_SLOT(14),0xc2) = 0x08000000;
  //Speed
  REGISTER(IO_SLOT(14),0x80) = 0x08008000;
  //Size
  //REGISTER(IO_SLOT(14),0x81) = 0x20000000;
  REGISTER(IO_SLOT(14),0x81) = 0x20002000;
  //Flags
  REGISTER(IO_SLOT(14),0x82) = 0x00000000;
  //Test Mode
  //REGISTER(IO_SLOT(14),0x82) = 0x00000400;
  //ARM
  REGISTER(IO_SLOT(14),0x01) = 0x00000000;  
}
