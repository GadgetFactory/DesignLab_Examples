/*
 Gadget Factory
 DesignLab New Project
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 Hardware:
  Will blink led4 and led3 of a B/LED Wing attached to Wing AL.
     
 Special Notes:
  The circuit for the Papilio DUO shows the DAC outputs directly connected to the pins.
  The circuit for the Papilio Pro shows the DAC outputs connected with Flex pins that can be moved anywhere.
  
 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#include "SigmaDelta.h"

void setup()
{
  //This Section is only for the Papilio Pro version with the flex pins - on the DUO it does nothing.
       // Configure pin as output
       pinMode (0 , OUTPUT );
       // enable PPS on this pin
       pinModePPS (0 , HIGH );
       // Map pin 0 to FlexPinOut0
       outputPinForFunction (0 , 0 );
       
       // Configure pin as output
       pinMode (2 , OUTPUT );
       // enable PPS on this pin
       pinModePPS (2 , HIGH );
       // Map pin 2 to FlexPinOut1
       outputPinForFunction (2 , 1 );  
  //End flex pin section 
  
  //SigmaDelta  
  SigmaDelta.begin(0, 2);
  SigmaDelta.setEndianness(BIG_ENDIAN);
  SigmaDelta.setSignedness(false);  
}

void loop()
{
  //SigmaDelta
  SigmaDelta.setValues(65535, 0);
  delay(1000);
  SigmaDelta.setValues(65535, 65535);
  delay(1000);
  SigmaDelta.setValues(32767, 32767);
  delay(1000);
  SigmaDelta.setValues(0, 0);
  delay(1000);

}
