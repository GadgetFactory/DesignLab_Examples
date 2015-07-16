

#include "i2c.h"
//#include"config.h"
#define OV7670_ADDRESS 0x21
#define OV7670_REG_NUM  166
const char OV7670_reg[166][2]={
  {0x67,0xaa},
{0x68,0x55},
{0x3a,0x14},
{0x40,0xC0},
{0x12,0x10},  //use CIF frame format
{0x32,0x80},
{0x17,0x16},
{0x18,0x04},
{0x19,0x02},
{0x1a,0x7b},
{0x03,0x06},
//{0x0c,0x00},
{0x0c,0x08},  //enable scaling
{0x3e,0x00},
{0x70,0x3a},
{0x71,0x35},
{0x72,0x11},
{0x73,0x00},
{0xa2,0x02},
{0x11,0x81},
{0x7a,0x20},
{0x7b,0x1c},
{0x7c,0x28},
{0x7d,0x3c},
{0x7e,0x55},
{0x7f,0x68},
{0x80,0x76},
{0x81,0x80},
{0x82,0x88},
{0x83,0x8f},
{0x84,0x96},
{0x85,0xa3},
{0x86,0xaf},
{0x87,0xc4},
{0x88,0xd7},
{0x89,0xe8},
{0x13,0xe0},
{0x00,0x00},
{0x10,0x00},
{0x0d,0x00},
{0x14,0x28},
{0xa5,0x05},
{0xab,0x07},
{0x24,0x75},
{0x25,0x63},
{0x26,0xA5},
{0x9f,0x78},
{0xa0,0x68},
{0xa1,0x03},
{0xa6,0xdf},
{0xa7,0xdf},
{0xa8,0xf0},
{0xa9,0x90},
{0xaa,0x94},
{0x13,0xe5},
{0x0e,0x61},
{0x0f,0x4b},
{0x16,0x02},
{0x1e,0x37},
{0x21,0x02},
{0x22,0x91},
{0x29,0x07},
{0x33,0x0b},
{0x35,0x0b},
{0x37,0x1d},
{0x38,0x71},
{0x39,0x2a},
{0x3c,0x78},
{0x4d,0x40},
{0x4e,0x20},
{0x69,0x00},
{0x6b,0x60},
{0x74,0x19},
{0x8d,0x4f},
{0x8e,0x00},
{0x8f,0x00},
{0x90,0x00},
{0x91,0x00},
{0x92,0x00},
{0x96,0x00},
{0x9a,0x80},
{0xb0,0x84},
{0xb1,0x0c},
{0xb2,0x0e},
{0xb3,0x82},
{0xb8,0x0a},
{0x43,0x14},
{0x44,0xf0},
{0x45,0x34},
{0x46,0x58},
{0x47,0x28},
{0x48,0x3a},
{0x59,0x88},
{0x5a,0x88},
{0x5b,0x44},
{0x5c,0x67},
{0x5d,0x49},
{0x5e,0x0e},
{0x64,0x04},
{0x65,0x20},
{0x66,0x05},
{0x94,0x04},
{0x95,0x08},
{0x6c,0x0a},
{0x6d,0x55},
{0x6e,0x11},
{0x6f,0x9f},
{0x6a,0x40},
{0x01,0x40},
{0x02,0x40},
{0x13,0xe7},
{0x15,0x00},
{0x4f,0x80},
{0x50,0x80},
{0x51,0x00},
{0x52,0x22},
{0x53,0x5e},
{0x54,0x80},
{0x58,0x9e},
{0x41,0x08},
{0x3f,0x00},
{0x75,0x05},
{0x76,0xe1},
{0x4c,0x00},
{0x77,0x01},
{0x3d,0x80},
{0x4b,0x09},
{0xc9,0x60},
{0x41,0x38},
{0x56,0x40},
{0x34,0x11},
{0x3b,0x02},
{0xa4,0x89},
{0x96,0x00},
{0x97,0x30},
{0x98,0x20},
{0x99,0x30},
{0x9a,0x84},
{0x9b,0x29},
{0x9c,0x03},
{0x9d,0x4c},
{0x9e,0x3f},
{0x78,0x04},
{0x79,0x01},
{0xc8,0xf0},
{0x79,0x0f},
{0xc8,0x00},
{0x79,0x10},
{0xc8,0x7e},
{0x79,0x0a},
{0xc8,0x80},
{0x79,0x0b},
{0xc8,0x01},
{0x79,0x0c},
{0xc8,0x0f},
{0x79,0x0d},
{0xc8,0x20},
{0x79,0x09},
{0xc8,0x80},
{0x79,0x02},
{0xc8,0xc0},
{0x79,0x03},
{0xc8,0x40},
{0x79,0x05},
{0xc8,0x30},
{0x79,0x26},
{0x09,0x00},
 };


//For DUO connected to row D
#define SCCB_SCL 29
#define SCCB_SDA 27
#define VSYNC 33
#define HREF 31
#define XCLK 37
#define PCLK 35
//#define WEN  //No FIFO
//#define RRST //What is this?
//#define OE //No Fifo
#define RCLK 37  //Is this right?

#define D0 53
#define D1 51
#define D2 49
#define D3 47
#define D4 45
#define D5 43
#define D6 41
#define D7 39

//output mode 0:screen
static byte outputmode = 1;

//#if outputmode == 0
//  #include <TFT.h>  // Arduino LCD library
//  #include <SPI.h>
//  #define cs   53
//  #define dc   48
//  #define rst  49
//  TFT TFTscreen = TFT(cs, dc, rst);
//#endif

volatile int OV_State=0;
int incomingByte;
int hCount = 0;
int pCount = 0;
int hrefCur = 0;
int hrefPrev = 0;
int pclkCur = 0;
int pclkPrev = 0;
unsigned char buf[202];

void setup(){
  delay(3000);  
  Serial.begin(115200);
  
    I2C.begin(100000);
    I2C.enable(); 
    
    writeSensor(0x12,0x80);//reset
    delay(100);
    writeSensor(0x0C,0x08);//enable scaling
    delay(100);
    writeSensor(0x12,0x09);//set to RGB and QCIF
    delay(100);
    
//    Serial.print("Read sub-address 1: ");
//    Serial.println(readSensor(0x01),HEX);
//    delay(1);
//    Serial.print("Read sub-address 0: ");
//    Serial.println(readSensor(0x00),HEX);       
   
   readSensor(0x00);  //Set address for read to 0
   delay(1);
   Serial.println(I2C.start(OV7670_ADDRESS,1,0));
    if (I2C.rx(buf,sizeof(buf),true)!=0) {
        Serial.println("Error read");
        //return;
    }   
   Serial.println("Read after write");
   
  for(int i=0;i<sizeof(buf);i++)
  {
    Serial.print(i,HEX);
    Serial.print(": ");
    Serial.println(buf[i],HEX); 
  }


  
  
//   Serial.println(buf[0]);
//   Serial.println(buf[1]);
  //output
//  if (outputmode == 0)
//  {
//	  TFTscreen.begin();
//	  TFTscreen.background(0, 0, 0);	  
//  }
  
  //connection initialize
  //pinMode(WEN,OUTPUT);
  //pinMode(RRST,OUTPUT);
  //pinMode(OE,OUTPUT);
  //pinMode(RCLK,OUTPUT);
  //DDRC = 0x00;
  
  //disable FIFO, start loading data
//  digitalWrite(OE,LOW);
//  digitalWrite(WEN,HIGH);
  

  Serial.println("Starting");
  
  //Sensorinit();
  //readReset();
}

void loop(){
  //Serial.println(readSensor(0x01));
//  Serial.println(".");
//  delay(1000);
  
  //Wait for VSYNC to go high
  while(digitalRead(VSYNC) == 0){
    //Serial.println("Waiting for VSYNC LOW");
//    Serial.println(hCount);       
//    hCount = 0;
//    pCount = 0;  
  } 
  
  //Wait for VSYNC to go low
  while(digitalRead(VSYNC) == 1){
    //Serial.println("Waiting for VSYNC HIGH");
  }   
  hCount = 0;
  Serial.println("VSYNC went low");
  
  int vsyncLow = 1;
  while(vsyncLow){
    //Wait for HREF to go low
    while(digitalRead(HREF) == 1){
    } 
    
    //Wait for HREF to go high
    while(digitalRead(HREF) == 0){
      if (digitalRead(VSYNC) == 1)
        vsyncLow = 0;
    }   
    //Serial.println("HREF went high");
    Serial.println(hCount); 
    hCount++; 
  }
  
  

//  while(digitalRead(HREF) == 0){}  //Wait for HREF to go high
//  hCount++;
//  Serial.print("hCount: ");
//  Serial.println(hCount);   
 
  //while(digitalRead(HREF) == 1){Serial.println("in href high");delay(1);} 

//    hrefCur = digitalRead(HREF); 
//    if (hrefCur == 1 && hrefPrev == 0) // detect rising edge of href - meaning we are on a line
//    {
//      while(digitalRead(HREF) == 1)
//      {
//        pclkCur = digitalRead(PCLK);
//        if (pclkCur == 1 && pclkPrev == 0) // detect rising edge of pclk - meaning we have a new pixel
//        {
//          Serial.print("pCount: ");
//          Serial.println(pCount);         
//          pCount++;  
//        }
//        pclkPrev = pclkCur;      
//      }     
//      pCount = 0; 
//      Serial.print("hCount: ");
//      Serial.println(hCount);     
//      hCount++;
//    }
//    hrefPrev = hrefCur;

  
    
  
  
//  if (digitalRead(vsyncPin) == 0)  // meaning we are on a frame
//  {
//    if (digitalRead(hrefPin) == 1) // meaning we are on a line
//    {
//      d0 = digitalRead(d0Pin);
//      d1 = digitalRead(d1Pin);
//      d2 = digitalRead(d2Pin);
//      d3 = digitalRead(d3Pin);
//      d4 = digitalRead(d4Pin);
//      d5 = digitalRead(d5Pin);
//      d6 = digitalRead(d6Pin);
//      d7 = digitalRead(d7Pin);
//      buf[k++] = (d0 + d1*2 + d2*4 + d3*8 + d4*16 + d5*32 + d6*64 + d7*128); 
//    }
//  }  
  
  
//  attachInterrupt(0,watcher,RISING);
//  while(OV_State != 2){
//  }

//  readReset();
//  digitalWrite(OE,LOW);
//  if (outputmode == 0)
//  {
//	  int colordata;
//	  for(int x=0; x<120; x++)
//	  {
//		  for (int y = 0; y<160;y++)
//		  {
//			  digitalWrite(RCLK,LOW);
//			  //colordata=PINC<<8;		//读高位
//			  digitalWrite(RCLK,HIGH);
//			  digitalWrite(RCLK,LOW);
//			  //colordata|=PINC;			//读低位
//			  digitalWrite(RCLK,HIGH);
//			  //TFTscreen.drawPixel(x,y,colordata);  //RGB565
//		  }
//	  }  
//  }
//  digitalWrite(OE,HIGH);
//  delayMicroseconds(20);
//  OV_State=0;
}

//void watcher(){
//  if(OV_State == 0)				//判断状态，第一次下降沿
//  {
//    OV_State = 1;				//状态变为1
//    digitalWrite(WEN,HIGH);		//使能WEN，写
//  }
//  else if(OV_State == 1)		//状态1，
//  {
//    digitalWrite(WEN,LOW);		//关闭写使能，禁止写
//    OV_State = 2;				//状态变为2，准备读数据
//    detachInterrupt(0);			//关闭外部中断 
//  }  
//}

//void readReset(){
//  digitalWrite(RRST,LOW);
//  digitalWrite(RCLK,LOW);
//  digitalWrite(RCLK,HIGH);
//  digitalWrite(RCLK,LOW);
//  digitalWrite(RRST,HIGH);
//  digitalWrite(RCLK,HIGH);
//}

void Sensorinit(){
//  pinMode(SCCB_SCL,OUTPUT);
//  pinMode(SCCB_SDA,OUTPUT);
//  digitalWrite(SCCB_SDA,HIGH);
//  digitalWrite(SCCB_SCL,HIGH);
  delayMicroseconds(10);
  writeSensor(0x12,0x80);//reset
  if(readSensor(0x0A)==0x76){
    if(readSensor(0x0B)==0x73){
      Serial.println("setting");
      for(int i=0;i< OV7670_REG_NUM;i++){
        writeSensor(OV7670_reg[i][0],OV7670_reg[i][1]);
      }
    }
  }
}

//orig
//byte readSensor(byte regID){
//  byte temp;
//  SCCB_Start();
//  if(SCCB_Write(0x42)==0){
//    SCCB_Stop();
//    Serial.print(regID);
//    Serial.println(" Read ERROR1");
//  }
//  delayMicroseconds(10);
//  if(SCCB_Write(regID)==0){
//    SCCB_Stop();
//    Serial.print(regID);
//    Serial.println(" Read ERROR2");
//  }
//  SCCB_Stop();
//  delayMicroseconds(10);
//  SCCB_Start();
//  if(SCCB_Write(0x43)==0){
//    SCCB_Stop();
//    Serial.print(regID);
//    Serial.println(" Read ERROR3");
//  }
//  delayMicroseconds(10);
//  temp=SCCB_Read();
//  SCCB_NASK();
//  SCCB_Stop();
//  return temp;
//}

byte readSensor(byte regID){
  byte temp;
  //write address
  int err = 0;
  if (I2C.start(OV7670_ADDRESS,0)!=0)
      err = -1;
  if (err==0)
      if (I2C.tx(regID)!=0)
          err = -1;
  I2C.stop();  
  if (err==-1)
     Serial.println("There was an error in reading");   
  delayMicroseconds(10);
  //read data
   I2C.start(OV7670_ADDRESS,1);
    if (I2C.rx(buf,1,true)!=0) {
        Serial.println("Error read");
        //return;
    } 
   temp = buf[0];    
  return temp;
}

void writeSensor(byte regID, byte regDat){
    int err = 0;
    if (I2C.start(OV7670_ADDRESS,0)!=0)
        err = -1;
    if (err==0)
        if (I2C.tx(regID)!=0)
            err = -1;
    if (err==0)
        if (I2C.tx(regDat)!=0)
            err = -1;
    I2C.stop();  
    if (err==-1)
       Serial.println("There was an error in writing");   
}

//orig
//void writeSensor(byte regID, byte regDat){
//  SCCB_Start();
//  if(SCCB_Write(0x42)==0){
//    SCCB_Stop();
//    Serial.print(regID);
//    Serial.println(" Write ERROR1");
//  }
//  delayMicroseconds(10);
//  if(SCCB_Write(regID)==0){
//    SCCB_Stop();
//    Serial.print(regID);
//    Serial.println(" Write ERROR2");
//  }
//  delayMicroseconds(10);
//  if(SCCB_Write(regDat)==0){
//    SCCB_Stop();
//    Serial.print(regID);
//    Serial.println(" Write ERROR3");
//  }
//  delayMicroseconds(10);
//  SCCB_Stop();
//}

//void SCCB_Start(){
//  digitalWrite(SCCB_SDA,HIGH);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SCL,HIGH);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SDA,LOW);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SCL,LOW);
//  delayMicroseconds(30);
//}
//
//void SCCB_Stop(){
//  digitalWrite(SCCB_SDA,LOW);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SCL,HIGH);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SDA,HIGH);
//  delayMicroseconds(20);
//}
//
//void SCCB_NASK(){
//  digitalWrite(SCCB_SDA,HIGH);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SCL,HIGH);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SCL,LOW);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SDA,LOW);
//  delayMicroseconds(20);
//}
//
//byte SCCB_Write(byte data){
//  for(byte i=0x80;i>0;i>>=1){
//    if(data&i){
//      digitalWrite(SCCB_SDA,HIGH);
//    }
//    else{
//      digitalWrite(SCCB_SDA,LOW);
//    }
//    delayMicroseconds(20);
//    digitalWrite(SCCB_SCL,HIGH);
//    delayMicroseconds(20);
//    digitalWrite(SCCB_SCL,LOW);
//    delayMicroseconds(20);
//  }
//  //digitalWrite(SCCB_SDA,HIGH);
//  byte temp;
//  pinMode(SCCB_SDA,INPUT);
//  delayMicroseconds(20);
//  digitalWrite(SCCB_SCL,HIGH);
//  delayMicroseconds(20);
//  if(digitalRead(SCCB_SDA)){
//    temp=0;
//  }   //SDA=1发送失败，返回0}
//  else {
//    temp=1;
//  } 
//  digitalWrite(SCCB_SCL,LOW);
//  delayMicroseconds(20);
//  pinMode(SCCB_SDA,OUTPUT); 
//  return temp;
//}
//
//byte SCCB_Read(){
//  byte data;
//  pinMode(SCCB_SDA,INPUT);
//  delayMicroseconds(50);
//  for(int i=0;i<8;i++){
//    digitalWrite(SCCB_SCL,HIGH);
//    data <<= 1;
//    delayMicroseconds(20);
//    if(digitalRead(SCCB_SDA)){
//      data++;
//    }
//    digitalWrite(SCCB_SCL,LOW);
//    delayMicroseconds(20);
//  }
//  pinMode(SCCB_SDA,OUTPUT); 
//  return data;
//}
