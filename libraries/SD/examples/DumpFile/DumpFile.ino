/*
  SD card file dump
 
 This example shows how to read a file from the SD card using the
 SD library and send it over the serial port.
 	
 The circuit:
 A microSD Wing connected to AL ( http://www.papilio.cc/index.php?n=Papilio.MicroSDWing )
 or
 A RetroCade MegaWing ( http://retrocade.gadgetfactory.net/index.php?n=Main.RetroCadeMegaWing )
 
 Soft Processor:
 This example is for the ZPUino Soft Processor, it will work with any variant that has SPI connected to Wishbone slot 6 such as the Hyperion variant.
  ( http://papilio.gadgetfactory.net/index.php?n=Papilio.Hyperion )
 
 created  22 December 2010
 by Limor Fried
 modified 9 Apr 2012
 by Tom Igoe
 modified 6/3/2013
 by Jack Gassett for the Papilio
 
 This example code is in the public domain.
 	 
 */

#include <SD.h>

//SD Card on RetroCade MegaWing
//#define CSPIN  WING_C_13
//#define SDIPIN WING_C_12
//#define SCKPIN WING_C_11
//#define SDOPIN WING_C_10
//Uncomment for RetroCade MegaWing

//SD Card on microSD Wing connected to AL
#define CSPIN  WING_A_4
#define SDIPIN WING_A_3
#define SCKPIN WING_A_2
#define SDOPIN WING_A_1
//Uncomment for microSD Wing

void setup()
{
 // Open serial communications and wait for port to open:
  Serial.begin(9600);

  USPICTL=BIT(SPICP1)|BIT(SPICPOL)|BIT(SPISRE)|BIT(SPIEN)|BIT(SPIBLOCK);
  outputPinForFunction( SDIPIN, IOPIN_USPI_MOSI );
  pinModePPS(SDIPIN,HIGH);
  pinMode(SDIPIN,OUTPUT);

  outputPinForFunction( SCKPIN, IOPIN_USPI_SCK);
  pinModePPS(SCKPIN,HIGH);
  pinMode(SCKPIN,OUTPUT);

  pinModePPS(CSPIN,LOW);
  pinMode(CSPIN,OUTPUT);

  inputPinForFunction( SDOPIN, IOPIN_USPI_MISO );
  pinMode(SDOPIN,INPUT);   

  Serial.print("Initializing SD card...");

  
  // see if the card is present and can be initialized:
  if (!SD.begin(CSPIN)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    return;
  }
  Serial.println("card initialized.");
  
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  // make sure test.txt exists
  Serial.println("Opening test.txt");
  File dataFile = SD.open("test.txt");

  // if the file is available, write to it:
  if (dataFile) {
    while (dataFile.available()) {
      Serial.write(dataFile.read());
    }
    dataFile.close();
  }  
  // if the file isn't open, pop up an error:
  else {
    Serial.println("error opening datalog.txt");
  } 
}

void loop()
{
}
