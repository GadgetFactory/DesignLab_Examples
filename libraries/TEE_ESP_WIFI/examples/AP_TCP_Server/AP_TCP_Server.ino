#include<TEE_ESP_WIFI.h>
#include <SoftwareSerial.h>
#define pinEN   9
#define ESP_Rx 10
#define ESP_Tx 11

String ssid="My_AP_ESP8266";
String pwd ="12345678";

ESP wifi(ESP_Rx,ESP_Tx,pinEN);

void print_debug(String data)
{
  Serial.print(data);
}
void setup()
{
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
  
}
void loop()
{  
  
 /* if (wifi.available())
    Serial.write(wifi.read());
  if (Serial.available())
    wifi.write(Serial.read());
  */
  if (wifi.available())
  {
    if(wifi.find("Link"))
    {
      while(!wifi.find("Unlink"))
      {
        if(!wifi.println(0,"Send from EPS8266"))
        {
          break;
        }
        delay(500);
      }
      wifi.debug("Connection closed");
    }
  } 
 
}
