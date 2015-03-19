#include<TEE_ESP_WIFI.h>
#include <SoftwareSerial.h>
#define pinEN   9
#define ESP_Rx 10
#define ESP_Tx 11

String ssid="stk";
String pass="stk123456";
//String serverip="192.168.1.37";
String port="80";
#define LED 7
ESP wifi(ESP_Rx,ESP_Tx,pinEN);

void print_debug(String data)
{
  Serial.print(data);
}
void setup()
{
  pinMode(LED, OUTPUT);
  digitalWrite(LED,LOW);
  Serial.begin(9600);
  wifi.begin(9600);
  Serial.println("EPS8226");
  wifi.Event_debug = print_debug;
  wifi.reset();
  wifi.setmode(STATION);
  wifi.disconnectAP();
  wifi.connectAP(ssid,pass);
  wifi.multipleconnect(MULTIPLE);
  wifi.startserver(port);
  String ip = wifi.myip();
 for(unsigned char i=0;i<5;i++)
 {
    wifi.stop(i); //close all socket
 }
}
void loop()
{  
   String data = wifi.readstringdata();
   if(data.length())
   {
     Serial.println(data); 
      if(data=="GET /?status=1 HTTP/1.1")
      {
        digitalWrite(LED,HIGH);
      }
      if(data=="GET /?status=0 HTTP/1.1")
      {
        digitalWrite(LED,LOW);
      }
        html_web();
        wifi.stop(wifi.currentID);
   }
 } 
 
void html_web()
{
  delay(3000);
  char *data1= "<html><header><title>ESP8266 Webserver</title></header>\"LED Control\"<FORM action=\"\"><P> <INPUT type=\"radio\" name=\"status\" value=\"1\">ON";
  char *data2= "<P> <INPUT type=\"radio\" name=\"status\" value=\"0\">OFF<P> <INPUT type=\"submit\" value=\"Submit\"></FORM><body></body></html>";
  wifi.write_HTML(wifi.currentID,data1);
  wifi.write_HTML(wifi.currentID,data2);
}
