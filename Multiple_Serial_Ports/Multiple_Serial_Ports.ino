//This code assumes that you will use a jumper wire to connect the tx pins of the to UARTs to the rx pin of mySerial1. Refer to the schematic of your custom Soft Processor to determine what physical pin those signals are connected to.
 
//Instantiate the 9 serial ports and connect them to the Wishbone slots that we specified in our custom schematic design. 
HardwareSerial mySerial1( WishboneSlot(5) );
HardwareSerial mySerial2( WishboneSlot(6) );
HardwareSerial mySerial3( WishboneSlot(8) );
HardwareSerial mySerial4( WishboneSlot(9) );
HardwareSerial mySerial5( WishboneSlot(10) );
HardwareSerial mySerial6( WishboneSlot(11) );
HardwareSerial mySerial7( WishboneSlot(12) );
HardwareSerial mySerial8( WishboneSlot(13) );
HardwareSerial mySerial9( WishboneSlot(14) );
 
void setup() {
  //Start the 9 serial ports
  Serial.begin(9600);
  mySerial1.begin(9600);
  mySerial2.begin(9600);
  mySerial3.begin(9600);
  mySerial4.begin(9600);
  mySerial5.begin(9600);
  mySerial6.begin(9600);
  mySerial7.begin(9600);
  mySerial8.begin(9600);
  mySerial9.begin(9600);
}
 
void loop() {
 
  //Send a number out of mySerial1-9, read it on mySerial1, and send it out the USB serial port.
  mySerial1.write(1);
  mySerial2.write(2);
  mySerial3.write(3);
  mySerial4.write(4);
  mySerial5.write(5);
  mySerial6.write(6);
  mySerial7.write(7);
  mySerial8.write(8);
  mySerial9.write(9);
  if (mySerial1.available()) {
   Serial.println(mySerial1.read()); 
  }
  delay(500);
}
