#ifndef ESP_h
#define ESP_h

#include <Arduino.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <Stream.h>

#define STATION 1
#define AP 2
#define STATION_AP 3

#define SINGLE 0
#define MULTIPLE 1

#define OPEN	0
#define WEP		1
#define WPA_PSK 2
#define WPA2_PSK 3
#define WPA_WPA2_PSK 4		
#include <SoftwareSerial.h>

class ESP : public SoftwareSerial
{
	public:
	ESP(int,int,int);
	void begin(long);
	void reset();
	void softreset();
	void setmode(unsigned char mode);
	void listAP();
	bool disconnectAP();
	bool connectAP(String ap,String pwd);
	bool Res_OK();
	bool multipleconnect(unsigned char mul);
	String myip();
	bool startclient(String type,String add,String port);
	bool startclient(unsigned char id,String type,String add,String port);
	bool startserver(String port);
	bool stop();
	bool stop(unsigned char id);
	String ipstatus();
	bool setAP(String ssid,String pwd,unsigned char ch,unsigned char ecn);
	bool print(String str);
	bool print(unsigned char id,String str);
	bool println(String str);
	bool println(unsigned char id,String str);
	bool write(unsigned char id,char *data,int len);
	bool write_HTML(unsigned char id,char *data);
	bool send(unsigned char id,int len);
	
	String readstringdata();
	unsigned char currentID;
	
	void write(char c);
	void flush();
	int read();
	int available();
	bool find(char* str);
	
	
	
	void send_cmd(String);
	void (*Event_debug)(String data);
	void (*Event_list_AP)(String data);
	void debug(String);
	

};

#endif 
