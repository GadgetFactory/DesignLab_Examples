#include<TEE_ESP_WIFI.h>
#include <SoftwareSerial.h>
#define pinEN   9
#define ESP_Rx 10
#define ESP_Tx 11
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
  wifi.Event_debug = print_debug;
  wifi.reset();
  wifi.setmode(STATION);
  wifi.Event_list_AP = print_debug;
  wifi.listAP();
}
void loop()
{

}
