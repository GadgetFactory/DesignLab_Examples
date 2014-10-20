HardwareSerial mySerial1(11);

void setup() {
  // put your setup code here, to run once:
  mySerial1.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
 if (mySerial1.available()) { 
  mySerial1.write(mySerial1.read());
 }
  //delay(1000);
}
