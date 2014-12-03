/*
 Gadget Factory
 Sump Logic Analyzer
 To learn more about the Papilio Schematic Library please visit http://learn.gadgetfactory.net
   
 Related Software:
   Click here to open Jawi's Logic Analyzer client: tools://Logic_Analyzer.sh
   You must have Java installed and in the path.
   
 Hardware:
   Use this circuit with a Papilio Pro, Papilio One 500K, or Papilio DUO

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

HardwareSerial mySerial1(2);  //This finds the second instance of a serial port - in our case connected to wishbone slot 5

int counter = 0;

void setup() {
  // put your setup code here, to run once:
//  delay(3000);  
  Serial.begin(115200);
  mySerial1.begin(115200); 
  pinMode(WAL0, OUTPUT);
  pinMode(WAL1, OUTPUT);
  pinMode(WAL2, OUTPUT);
  pinMode(WAL3, OUTPUT);
  pinMode(WAL4, OUTPUT);
  pinMode(WAL5, OUTPUT);
  pinMode(WAL6, OUTPUT);
  pinMode(WAL7, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly: 
  if (mySerial1.available()) {
   Serial.write(mySerial1.read()); 
  }
  if (Serial.available()) {
   mySerial1.write(Serial.read()); 
  }  
  GPIODATA(0) = counter;
  counter++;
  if (counter >= 255)
    counter == 0;
}
