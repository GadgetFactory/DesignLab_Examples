/*
 Gadget Factory
 Sump Logic Analyzer
 To learn more about the Papilio Schematic Library please visit http://learn.gadgetfactory.net
 
 To use this sketch do the following steps:
 1)
 Load the bit file that defines the circuit required by this sketch by clicking on the bit file link below that corresponds to the type of Papilio board you have. 
 You should see the Papilio Loader pop up and program the circuit for this example to your Papilio Board. 
 IMPORTANT NOTE: Please be sure that you are programming the bit file to SPI Flash. ZPUino will not work if written to FPGA only.
 
 2)
 Make sure you have selected the correct ZPUino board type and com port, the Papilio always uses channel B of the FT2232 so it is usually the second com port you see.
 The board type should be ZPUino Vanilla or Hyperion depending on what the schematic shows, or look at the Board Type section below.
 Be sure to select the board type for the type of Papilio you have.
 
 3)
 Make sure you have the required hardware attached to your Papilio, look at the schematic to see what is required. Or look at the Hardware section below.
 You can open a PDF showing the circuit defined in the bit file by selecting the appropriate link to view the scheamtic for the type of Papilio board you have.

 4)
 Run the sketch, it should communicate with the ZPUino included in the bit file you loaded earlier. 
 
 5)
 In the case of using the JTAG Logic Analyzer you will need to run the network server that acts as the communication bridge between the Papilio and the Logic Analyzer client.
 The network server will make a connection with Channel A of the Papilio, which is connected to the JTAG port of the FPGA, and will forward all data to the Logic Analyzer client.
   1) Load the bit file:  sketchdir://LX9/papilio_pro.bit
   2) Start the JTAG server
     For Windows: sketchdir://papilio-prog-jtag-server/papilio-prog-jtag-server.exe
     For Linux: Coming soon
   3) Start Logic Analyzer client:
     For Windows: sketchdir://ols-0.9.7/run.bat
     For Linux: Coming soon 
 
 If you want to modify the circuit then make sure you have Xilinx ISE Webpack installed and click on the appropriate link below to modify the schematic.
 If you do not have Xilinx ISE Webpack installed visit this tutorial to learn how. http://gadgetfactory.net/learn/2013/10/23/install-xilinxs-free-ise-webpack/
 
 If the links below do not work then then open the sketch directory from Sketch/Show Sketch Folder (Ctl-K) and manually access the files defined in the links below.
 
 Papilio Pro
   Click to program bit file: sketchdir://LX9/papilio_pro.bit
   Click to view schematic:   sketchdir://schematic_papilio_pro.pdf
   Click to modify schematic: sketchdir://PSL_Papilio_Pro_LX9.xise
 
 Tutorials:
  
 Related library documentation:
   
 Related Software:
   Click here to open Jawi's Logic Analyzer client: tools://Logic_Analyzer.sh
   You must have Java installed and in the path.
   
 Hardware:
   
 Board Type:
   ZPUino Vanilla Variant for your hardware type
   
 Special Application Notes:
 Detailed notes for using the JTAG Logic Analyzer
 The network server will make a connection with Channel A of the Papilio, which is connected to the JTAG port of the FPGA, and will forward all data to the Logic Analyzer client.
   1) Load the bit file:  sketchdir://LX9/papilio_pro.bit
   2) Start the JTAG server
     For Windows: sketchdir://papilio-prog-jtag-server/papilio-prog-jtag-server.exe
     For Linux: Coming soon
   3) Start Logic Analyzer client:
     For Windows: sketchdir://ols-0.9.7/run.bat
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

HardwareSerial mySerial1(5);
//HardwareSerial bscanSerial(6);

int counter = 0;

void setup() {
  // put your setup code here, to run once:
//  delay(3000);  
  Serial.begin(115200);
  mySerial1.begin(115200);
  //bscanSerial.begin(115200); 
  pinMode(WAL0, OUTPUT);
  pinMode(WAL1, OUTPUT);
  pinMode(WAL2, OUTPUT);
  pinMode(WAL3, OUTPUT);
  pinMode(WAL4, OUTPUT);
  pinMode(WAL5, OUTPUT);
  pinMode(WAL6, OUTPUT);
  pinMode(WAL7, OUTPUT);  
  GPIODATA(0) = 170;
}

void loop() {
  // put your main code here, to run repeatedly: 
//  if (mySerial1.available()) {
//   Serial.write(mySerial1.read()); 
//  }
//  if (Serial.available()) {
//   mySerial1.write(Serial.read()); 
//  }  
  GPIODATA(0) = counter;
  counter++;
  if (counter >= 255)
    counter == 0;

  Serial.println("Hello");
  delay(1);

  //bscanSerial.print("1");

}
