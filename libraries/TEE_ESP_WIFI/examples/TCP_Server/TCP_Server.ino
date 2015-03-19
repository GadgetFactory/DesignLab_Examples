#include<TEE_ESP_WIFI.h>
#include <SoftwareSerial.h>
#define pinEN   9
#define ESP_Rx 10
#define ESP_Tx 11

String ssid="stk";
String pass="stk123456";
String port="8000";

ESP wifi(ESP_Rx,ESP_Tx,pinEN);

void print_debug(String data)
{
  Serial.print(data);
}
void setup()
{
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
}
String data="";
void loop()
{
   if(wifi.available())
         {
           Serial.write(wifi.read());
         }
        if(Serial.available())
        {
          char input = Serial.read();
          data += input;
          if(input==0x0D)
          {
            wifi.print(0,data);
            data="";
          }
        }
}
