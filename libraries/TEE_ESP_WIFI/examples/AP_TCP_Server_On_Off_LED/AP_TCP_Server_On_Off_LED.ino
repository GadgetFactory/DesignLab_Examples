#include<TEE_ESP_WIFI.h>
#include <SoftwareSerial.h>
#define pinEN   9
#define ESP_Rx 10
#define ESP_Tx 11
#define LED 7
String ssid="My_AP_EPS8266";
String pwd ="12345678";

ESP wifi(ESP_Rx,ESP_Tx,pinEN);

void print_debug(String data)
{
  Serial.print(data);
}
void setup()
{
  pinMode(LED, OUTPUT);
  digitalWrite(LED,HIGH);
  delay(500);
  digitalWrite(LED,LOW);
  Serial.begin(9600);
  wifi.begin(9600);
  Serial.println("ESP8226");
  wifi.Event_debug = print_debug; // Add function print debug
  wifi.reset();
  //delay(2000);
  wifi.setmode(STATION_AP);
  if(wifi.setAP(ssid,pwd,1,WPA_WPA2_PSK))
  {
    wifi.multipleconnect(MULTIPLE);
    wifi.startserver("8000");
    String ip = wifi.myip();
  } 
  wifi.flush();
}

void loop()
{  
   String data = wifi.readstringdata();
   if(data.length())
   {
      if(data=="LED ON")
      {   
        digitalWrite(LED,HIGH);
      }
      if(data=="LED OFF")
      {
        digitalWrite(LED,LOW);
      }
      Serial.println(data);
   }
 } 
 
