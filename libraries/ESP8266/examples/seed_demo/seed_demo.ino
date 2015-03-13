//#include <SoftwareSerial1.h>
#define SSID "Hyperion"
#define PASS "x"
#define DST_IP "220.181.111.85" //baidu.com
//SoftwareSerial1 Serial(10, 11); // RX, TX
void setup()
{
  delay(3000);
 // Open Serial1 communications and wait for port to open:
 Serial1.begin(9600);
 Serial1.setTimeout(5000);
 Serial.begin(9600); //can't be faster than 19200 for softSerial1
 Serial.println("ESP8266 Demo");
 //test if the module is ready
 Serial1.println("AT+RST");
 delay(1000);
 if(Serial1.find("ready"))
 {
 Serial.println("Module is ready");
 }
 else
 {
 Serial.println("Module have no response.");
 while(1);
 }
 delay(1000);
 //connect to the wifi
 boolean connected=false;
 for(int i=0;i<5;i++)
 {
 if(connectWiFi())
 {
 connected = true;
 break;
 }
 }
 if (!connected){while(1);}
 delay(5000);
 //print the ip addr
 /*Serial1.println("AT+CIFSR");
 Serial.println("ip address:");
 while (Serial1.available())
 Serial.write(Serial1.read());*/
 //set the single connection mode
 Serial1.println("AT+CIPMUX=0");
}
void loop()
{
 String cmd = "AT+CIPSTART=\"TCP\",\"";
 cmd += DST_IP;
 cmd += "\",80";
 Serial1.println(cmd);
 Serial.println(cmd);
 if(Serial1.find("Error")) return;
 cmd = "GET / HTTP/1.0\r\n\r\n";
 Serial1.print("AT+CIPSEND=");
 Serial1.println(cmd.length());
 if(Serial1.find(">"))
 {
 Serial.print(">");
 }else
 {
 Serial1.println("AT+CIPCLOSE");
 Serial.println("connect timeout");
 delay(1000);
 return;
 }
 Serial1.print(cmd);
 delay(2000);
 //Serial1.find("+IPD");
 while (Serial1.available())
 {
 char c = Serial1.read();
 Serial.write(c);
 if(c=='\r') Serial.print('\n');
 }
 Serial.println("====");
 delay(1000);
}
boolean connectWiFi()
{
 Serial1.println("AT+CWMODE=1");
 String cmd="AT+CWJAP=\"";
 cmd+=SSID;
 cmd+="\",\"";
 cmd+=PASS;
 cmd+="\"";
 Serial.println(cmd);
 Serial1.println(cmd);
 delay(2000);
 if(Serial1.find("OK"))
 {
 Serial.println("OK, Connected to WiFi.");
 return true;
 }else
 {
 Serial.println("Can not connect to the WiFi.");
 return false;
 }
}

