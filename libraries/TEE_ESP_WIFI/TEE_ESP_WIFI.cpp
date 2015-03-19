#ifdef __cplusplus
extern "C" 
{
#endif
  #include <inttypes.h>
  #include <avr/io.h>
  #include <avr/interrupt.h>
#ifdef __cplusplus
}
#endif
#if ARDUINO >= 100
#include "Arduino.h"
#else   
#include "WProgram.h"
#endif
#include "TEE_ESP_WIFI.h"

int enable_pin;
void event_null(String data){}
char str_data_in[50]="";
unsigned char cnt_str_data=0;
String data_out="";
ESP :: ESP(int rx,int tx,int pinEN):SoftwareSerial(rx,tx)
{
	Event_debug =  event_null;
	Event_list_AP = event_null;
	pinMode(pinEN, OUTPUT);
	enable_pin = pinEN;
	//digitalWrite(pinEN,LOW);   
	//delay(1000);               
	//digitalWrite(pinEN,HIGH
}
void ESP :: begin(long baudrate)
{
	SoftwareSerial::begin(baudrate);
}
void ESP :: reset()
{
	digitalWrite(enable_pin,LOW);   
	delay(1000);               
	digitalWrite(enable_pin,HIGH);
	delay(3000);	
	send_cmd("AT+RST");
	delay(1000);
	while (SoftwareSerial::available())
	{
		SoftwareSerial::read();
	}
	send_cmd("AT");
	send_cmd("AT");
	delay(1000);
	debug("Ready\r\n");
}
void ESP :: softreset()
{
	char input;
	send_cmd("AT+RST");
	delay(100);
	while (SoftwareSerial::available())
	{
		input = SoftwareSerial::read();
		debug(String(input));
	}
	send_cmd("AT");
	send_cmd("AT");
}
void ESP :: setmode(unsigned char mode)
{
	char input;
	SoftwareSerial::flush();
	String cmd = "AT+CWMODE=" + String(mode);
	debug("Setmode = ");
	send_cmd(cmd);
	delay(2000);
	while (SoftwareSerial::available())
	{
		input = SoftwareSerial::read();
		debug(String(input));
	}
}
void ESP :: listAP()
{
	char input;
	char end[5];
	unsigned char cnt=0;
	SoftwareSerial::flush();
	send_cmd("AT+CWLAP");
	debug("List AP = ");
	long previousMillis = 0;
	long interval = 1000;
	unsigned char time=0;
	while(1)
	{
		while (SoftwareSerial::available())
		{
			input  = SoftwareSerial::read();
			(*Event_list_AP)(String(input));
			
		}
		 unsigned long currentMillis = millis();
		 if(currentMillis - previousMillis > interval) 
		 {
			previousMillis = currentMillis;
			if(time++>5)
			{
				debug("\r\n");
				debug("<---END--->");
				debug("\r\n");
				break;
			}
		 }
	}	
	
}
bool ESP :: connectAP(String ap , String pwd)
{
	bool res=false;
	char input;
	char str[10];
	unsigned str_cnt=0;
	String cmd = "AT+CWJAP=" + String("\"") + ap + String("\"") + String(",")+String("\"") + pwd + String("\"");
	send_cmd(cmd);
	debug("Please wait...\r\n");
	debug("Connect AP =");
	//delay(3000);
	while(1)
	{
		if(SoftwareSerial::available())
		{
			input = SoftwareSerial::read();
			if(input=='K')
			{
				res=true;
				debug("OK\r\n");
				break;
			}
			if(input=='F')
			{
				res = false;
				debug("Fail\r\n");
				break;
			}
		}
	}
	return(res);
}
bool ESP::disconnectAP()
{
	send_cmd("AT+CWQAP");
	debug("Disconnect AP =");
	return(Res_OK());
}
bool ESP :: multipleconnect(unsigned char mul)
{
	String cmd = "AT+CIPMUX=" + String(mul);
	send_cmd(cmd);
	debug("multipleconnect = ");
	return(Res_OK());
}
String ESP :: myip()
{
    char input;
	String all_in="";
	unsigned char cnt=0;
	String my_ip="";
	SoftwareSerial::flush();
	send_cmd("AT+CIFSR");
	delay(100);
		while(1)
		{
			if(SoftwareSerial::available())
			{
				input = SoftwareSerial::read();
				all_in += String(input);
				//debug(String(input));
				if(((input >= 0x30)&&(input <= 0x39))||(input == '.')||(input == 0x0D)||(input == 0x0A))
				{
					my_ip += String(input);
				}
				if(input=='K')
				break;
			}
		}		
	if(my_ip.length()>2)
	{
		debug("My IP =");
		debug(my_ip);
		debug("\r\n");
	}
	else
	{
		debug(all_in);
		return("Error");
	}

   return(my_ip);
}
bool ESP:: startclient(String type,String add,String port)
{
	bool res=false;
	String cmd = "AT+CIPSTART="+String("\"")+type+String("\",")+String("\"")+add+String("\",")+port;
	debug("Start client = ");
	SoftwareSerial::flush();
	send_cmd(cmd);
	char input;
	
	if (SoftwareSerial::find("Linked"))
	{
		res=true;
		debug("OK,Linked\r\n");
	}	
	else
	{
		res=false;
		debug("Fail,Unlink\r\n");
	}

	return(res);
}
bool ESP:: startclient(unsigned char id,String type,String add,String port)
{
	bool res=false;
	String cmd = "AT+CIPSTART=" + String(id) + "," + String("\"")+type+String("\",")+String("\"")+add+String("\",")+port;
	debug("Srart client = ");
	SoftwareSerial::flush();
	send_cmd(cmd);
	char input;
	
	if ( SoftwareSerial::find("Linked"))
	{
		res=true;
		debug("OK,Linked\r\n");
	}	
	else
	{
		res=false;
		debug("Fail,Unlink\r\n");
	}

	return(res);
}
bool ESP :: startserver(String port)
{
	bool res=0;
	String cmd = "AT+CIPSERVER="+String("1")+String(",")+port;
	send_cmd(cmd);
	debug("Start Server = Port "+port+" ");
	if (SoftwareSerial::find("OK"))
	{
		debug("OK\r\n");
		res = true;
	}
	else if (SoftwareSerial::find("no change"))
	{
		debug("no change\r\n");
		res = true;
	}
	else
	{
		debug("Error\r\n");
		res = false;
	}
	return(res);
	
}
bool ESP :: stop()
{
	bool res=false;
	send_cmd("AT+CIPCLOSE");
	debug("Stop = ");
	if (SoftwareSerial::find("Unlink"))
	{
		res=true;
		debug("OK,Unlink\r\n");
	}	
	else
	{
		res=false;
		debug("ERROR\r\n");
	}
	
	return(res);
}
bool ESP :: stop(unsigned char id)
{
	bool res=false;
	String cmd = "AT+CIPCLOSE="+String(id);
	send_cmd(cmd);
	debug("Stop = ");
	if (SoftwareSerial::find("Unlink"))
	{
		res=true;
		debug("OK,Unlink\r\n");
	}	
	else
	{
		res=false;
		debug("ERROR\r\n");
	}
	
	return(res);
}
bool ESP :: print(String str)
{
   bool res;
   String cmd = "AT+CIPSEND="+String(str.length());
   SoftwareSerial::flush();
   send_cmd(cmd);
   
   if (SoftwareSerial::find(">"))
	{
		debug("Send -->");
		debug(str);
		debug("\r\n");
		res = true; 
	}	
	else
	{
		debug("Send Error\r\n");
		res = false;
	}
	SoftwareSerial::print(str);
	if (SoftwareSerial::find("SEND OK"))
	{
		debug("SEND OK\r\n");
		res = true;
	}
	else
	{
		debug("SEND Fail\r\n");
		res = false;
	}
   return(res);
}
bool ESP :: print(unsigned char id,String str)
{
	String cmd = "AT+CIPSEND="+String(id)+String(",")+String(str.length());
    SoftwareSerial::flush();
    send_cmd(cmd);
   
   if (SoftwareSerial::find(">"))
	{
		debug("Send -->");
		debug(str);
		debug("\r\n");
	}	
	else
	{
		debug("Send Error\r\n");
	}
	SoftwareSerial::print(str);
	if (SoftwareSerial::find("SEND OK"))
	{
		debug("SEND OK\r\n");
	}
	else
	{
		debug("SEND Fail\r\n");
	}
}
bool ESP :: println(String str)
{
    String data = str+String("\r\n"); 
	return(print(data));
}

bool ESP :: println(unsigned char id,String str)
{
	String data = str+String("\r\n"); 
	return(print(id,data));
}
bool ESP :: send(unsigned char id,int len)
{
	bool res;
	String cmd = "AT+CIPSEND="+String(id)+String(",")+String(len);
	SoftwareSerial::flush();
    send_cmd(cmd);
   if (SoftwareSerial::find(">"))
	{
		debug("Send ...");
		debug("\r\n");
		res = true; 
	}	
	else
	{
		debug("Send Error\r\n");
		res = false;
	}
	return(res);
}
bool ESP :: write(unsigned char id,char *data,int len)
{
	bool res;
	
	res = send(id,len);
	if(!res)
	return(res);
	for(int i=0;i<len;i++)
	{
		SoftwareSerial::write(data[i]);
	}
	if (SoftwareSerial::find("SEND OK"))
	{
		debug("SEND OK\r\n");
		res = true;
	}
	else
	{
		debug("SEND Fail\r\n");
		res = false;
	}
   return(res);
	
}
bool ESP :: write_HTML(unsigned char id,char *data)
{
	int len=0;
	while(data[len])
	{
		len++;
	}
	write(id,data,len);
	
}
String ESP ::ipstatus()
{
	String status;
	char input;
	SoftwareSerial::flush();
	send_cmd("AT+CIPSTATUS");
	
	while (1)
	{
		if(SoftwareSerial::available())
		{
			input = SoftwareSerial::read();
			status += String(input);
			//debug(String(input));
			if(input=='K')
				break;
		}
		
	}
	debug(status);
return(status);
}
bool ESP :: setAP(String ssid,String pwd,unsigned char ch,unsigned char ecn)
{
	//flush();
	String cmd ="AT+CWSAP="+String("\"")+ssid+String("\",")+String("\"")+pwd+String("\",")+String(ch)+String(",")+String(ecn);
	send_cmd(cmd);
	debug(cmd);
	debug("\r\n");
	debug("Set Access Point =");
return(Res_OK());
}
int ESP :: read()
{
	return(SoftwareSerial::read());
}
int ESP :: available()
{
	return(SoftwareSerial::available());
}
bool ESP :: find(char* str)
{
	return(SoftwareSerial::find(str));
}
void ESP :: write(char c)
{
	SoftwareSerial::write(c);
}
void ESP :: flush()
{
	SoftwareSerial::flush();
	send_cmd("AT");
	send_cmd("AT");
}
String ESP :: readstringdata()
{
//+IPD,0,7:LED OFF
//char str_data_in[50]="";
//unsigned char cnt_str_data=0;
  while (SoftwareSerial::available())
  {
		char input = SoftwareSerial::read();
		if((input != 0x0A)&&(input != 0x0D))
		{
			str_data_in[cnt_str_data] = input;
			cnt_str_data++;
			if(cnt_str_data>49)
				cnt_str_data=0;
			  if(str_data_in[0] != '+')
			  {
				cnt_str_data=0;
			  }
		}
		if((input == 0x0A)&& (str_data_in[0] == '+'))
		{
			str_data_in[cnt_str_data]=0;
			String data_str = String(str_data_in);
			unsigned char index = data_str.indexOf(':');
			currentID = str_data_in[5]-0x30;
			data_out = data_str.substring(index+1);
			//Serial.print(data_out);
			cnt_str_data=0;
			return(data_out);
		}
	}
	return("");
}
/*bool ESP :: change_baud_rate(long baud)
{
	bool res = false;
	String cmd = "AT+CIOBAUD="+String(baud);
	send_cmd(cmd);
	res=Res_OK();
	SoftwareSerial::begin(baud);
	return(res);
}
*/
void ESP :: send_cmd(String data)
{
	 SoftwareSerial::println(data);
}
void ESP:: debug(String data)
{
   (*Event_debug)(data);
}
bool ESP:: Res_OK()
{
	bool res=false;
	if ( SoftwareSerial::find("OK"))
	{
		debug("OK\r\n");
		res = true;
	}
	else
	{
		debug("Error\r\n");
		res = false;
	}
	return(res);
}



