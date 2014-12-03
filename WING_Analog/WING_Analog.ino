/*
 Gadget Factory
 Analog Wing Example

 Hardware:
   This example circuit is wired for an Analog Wing connected to CH, to use with any of the other hardware click the link to modify the schematic to adjust for your hardware.
   http://store.gadgetfactory.net/analog-grove-wing/
   
 Special Application Notes:
   The Papilio Pro version of this design has the JTAG Logic Analyzer connected. You can capture and study the SPI waveforms that are generated during communications with the SPI ADC device. To do so follow these directions:
    In the case of using the JTAG Logic Analyzer you will need to run the network server that acts as the communication bridge between the Papilio and the Logic Analyzer client.
 The network server will make a connection with Channel A of the Papilio, which is connected to the JTAG port of the FPGA, and will forward all data to the Logic Analyzer client.
   1) Load the bit file:  sketchdir://LX9/papilio_pro.bit
   2) Start the JTAG server
     For Windows: tools://papilio-prog-jtag-server/papilio-prog-jtag-server.exe
     For Linux: Coming soon
   3) Start Logic Analyzer client:
     For Windows: tools://ols-0.9.7/run.bat
     For Linux: Coming soon 
   4) In the OLS Capture Settings - Connection page set the following:
       a)Connection Type = Network
       b)Remote host address = localhost
       c)Remote port = 5000
       d)Device Type = Papilio Logic Analyzer
   5) In the OLS Capture Settings - Acquisition page set the following:
       a)Channel Groups = Only select Channel Group 0
       b)Recording Size = Automatic (There is 24KB of sample space with 8 channels)
       c)Sampling Rate = 20MHZ
   6) To capture a SPI transmission setup a trigger on chanel 3 which is the CS line. Set the trigger to activate when /CS goes low.
       a)Under the Trigger tab select the Trigger enaled checkbox.
       b)For Mask put a checkbox on the 4th box over from the right.
       c)Click Capture
   7) To make the waveform easier to interpret change the labels of each channel
       a) Double Click Channel-0 and change the label box to SCK
       b) Double Click Channel-1 and change the label box to MISO
       c) Double Click Channel-2 and change the label box to MOSI
       d) Double Click Channel-3 and change the label box to /CS       
   8) Use the SPI Analyzer to interpret what data is being sent over the SPI lines.
       a)Open Tools/SPI Analyzer
       b)The default settings should be correct, just hit the Analyzer button.


 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#include "SPIADC.h"
#include "SPI.h"

void setup() {
  // put your setup code here, to run once:
  
  delay(1000);
  Serial.begin(115200);
  analog.begin(CS(WING_CH4),WISHBONESLOT(5),ADCBITS(SPIADC_12BIT));
  Serial.println("Channel 0\t1\t2\t3\t4\t5\t6\t7");
  
}

void loop() {
  Serial.print("\t");
  for ( int i = 0; i < 8; i++)
  {
    Serial.print(analog.read(i));
    Serial.print("\t");
  }
  Serial.println();
  delay(100);
}
