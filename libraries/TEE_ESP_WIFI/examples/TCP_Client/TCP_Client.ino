#include<TEE_ESP_WIFI.h>
#include <SoftwareSerial.h>
#define pinEN   9
#define ESP_Rx 10
#define ESP_Tx 11

String ssid="stk";
String pass="stk123456";
String serverip="192.168.1.37";
String port="8000";
long previousMillis = 0;
long interval = 1000; 

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
  wifi.disconnectAP();
  wifi.connectAP(ssid,pass);
  wifi.multipleconnect(SINGLE);
  String ip = wifi.myip();
  wifi.startclient("TCP",serverip,port);
}
void loop()
{
    if(!wifi.print("Test EPS8226"))
    {
      wifi.stop();
      wifi.startclient("TCP",serverip,port);
    }
}
