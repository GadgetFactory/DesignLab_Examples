

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

#define D0 53
#define D1 51
#define D2 49
#define D3 47
#define D4 45
#define D5 43
#define D6 41
#define D7 39

volatile int OV_State=0;
int incomingByte;
int hCount = 0;
int pCount = 0;
int hrefCur = 0;
int hrefPrev = 0;
int pclkCur = 0;
int pclkPrev = 0;
unsigned char buf[202];
unsigned int pCountBuf[30];
unsigned int hCountBuf[30];
int i = 0;

void setup(){
  delay(3000);  
  pinMode(VSYNC, INPUT);
  pinMode(HREF, INPUT);
  pinMode(PCLK, INPUT);
  pinMode(D0, INPUT);
  pinMode(D1, INPUT);
  pinMode(D2, INPUT);
  pinMode(D3, INPUT);
  pinMode(D4, INPUT);
  pinMode(D5, INPUT);
  pinMode(D6, INPUT);
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
  

  Serial.println("Starting");
}

enum State {
    idle,
    waitForFrame,
    startFrame,
    waitForLine,
    startLine,
    waitForPixel,
    capturePixel,
    report
};
State currentState = idle;
int cameraPins;
int cameraPinsPrev;

//This is for PRO
void loop(){

  cameraPins = REGISTER(GPIOBASE,1);
  //Serial.println(currentState);
  
  switch(currentState) {
    case idle:
       if (((cameraPins >> 1) & 0x01) == 1) //VSYNC is high
         currentState = waitForFrame;
       break;
    case waitForFrame:
       if (((cameraPins >> 1) & 0x01) == 0) //VSYNC is low
         currentState = startFrame;
       break;
     case startFrame:
       if (((cameraPins >> 11) & 0x01) == 0) //HREF is low
         currentState = waitForLine;     
       break;
     case waitForLine:
       if (((cameraPins >> 1) & 0x01) == 1) //VSYNC is high
         currentState = report;  //or waitForFrame?     
       else if (((cameraPins >> 11) & 0x01) == 1){ //HREF is high
         currentState = startLine;        
         pCount = 0;
       }
       break;
     case startLine:
       if (((cameraPins >> 9) & 0x01) == 0) //PCLK is low
         currentState = waitForPixel;       
       break;
     case waitForPixel:
       if (((cameraPins >> 9) & 0x01) == 1) //PCLK is high
         currentState = capturePixel;     
       break;
     case capturePixel:
       //capture pixel here
       pCount++;
       if (((cameraPins >> 11) & 0x01) == 1) //HREF is high
         currentState = startLine;
       else  //if HREF is low
         currentState = waitForLine;
       break; 
     case report:
       Serial.println(pCount);
       currentState = idle;  //or waitForFrame?
       break;    
  }
  
  
  
//  while(((REGISTER(GPIOBASE,1) >> 1) & 0x01) == 0){} //While VSYNC is low
//  while(((REGISTER(GPIOBASE,1) >> 1) & 0x01) == 1){} //While VSYNC is high
//  while(((REGISTER(GPIOBASE,1) >> 1) & 0x01) == 0){} //While VSYNC is low
//  while(((REGISTER(GPIOBASE,0) >> 11) & 0x01) == 1){}  //While HREF is high
//  while(((REGISTER(GPIOBASE,0) >> 11) & 0x01) == 0){}  //While HREF is low
//    
//  while(((REGISTER(GPIOBASE,0) >> 11) & 0x01) == 1){  //While HREF is high
//      //Wait for PCLK to go high
//      while(((REGISTER(GPIOBASE,1) >> 9) & 0x01) == 0){ //While PCLK is low
//      } 
//      //get data here
//      pCount++;
//      while(((REGISTER(GPIOBASE,1) >> 9) & 0x01) == 1){ //While PCLK is high
//      }     
//      
//  }  
  
  
// Serial.println((REGISTER(GPIOBASE,1) >> 11) & 0x01);  //HREF
// 
//  Serial.println((REGISTER(GPIOBASE,1) >> 10) & 0x01);  //VSYNC

//  Serial.println((REGISTER(GPIOBASE,1) >> 9) & 0x01);  //PCLK

//Serial.println(digitalRead(PCLK));
  
}

////This is for DUO
//void loop(){
//  Serial.println(pCount);
//  pCount=0;
//  
////  while(((REGISTER(GPIOBASE,1) >> 1) & 0x01) == 0){} //While VSYNC is low
////  while(((REGISTER(GPIOBASE,1) >> 1) & 0x01) == 1){} //While VSYNC is high
////  while(((REGISTER(GPIOBASE,1) >> 1) & 0x01) == 0){} //While VSYNC is low
//  while(((REGISTER(GPIOBASE,0) >> HREF) & 0x01) == 1){}  //While HREF is high
//  while(((REGISTER(GPIOBASE,0) >> HREF) & 0x01) == 0){}  //While HREF is low
//    
//  while(((REGISTER(GPIOBASE,0) >> HREF) & 0x01) == 1){  //While HREF is high
//      //Wait for PCLK to go high
//      while(((REGISTER(GPIOBASE,1) >> 3) & 0x01) == 0){ //While PCLK is low
//      } 
//      //get data here
//      pCount++;
//      while(((REGISTER(GPIOBASE,1) >> 3) & 0x01) == 1){ //While PCLK is high
//      }     
//      
//  }  
//  
//  
//// Serial.println((REGISTER(GPIOBASE,0) >> HREF) & 0x01);  //HREF
//// 
////  Serial.println((REGISTER(GPIOBASE,1) >> 1) & 0x01);  //VSYNC
//
////  Serial.println((REGISTER(GPIOBASE,1) >> 3) & 0x01);  //PCLK
//
////Serial.println(digitalRead(PCLK));
//  
//// int GPIO1 = REGISTER(GPIOBASE,0);
//// Serial.println((GPIO1 >> 31) & 0x01);  //This should be href
// 
// //Serial.println((GPIO1 & 31));  //This should be href
// //Serial.println(digitalRead(HREF));
//  
//}

//void loop(){
//  //pCount=0;
//
//    //Wait for VSYNC to go high
////    while(digitalRead(VSYNC) == 0){ 
////    } 
////    
////    //Wait for VSYNC to go low
////    while(digitalRead(VSYNC) == 1){
////    }  
//
//  while(digitalRead(HREF) == 0){
//    if(digitalRead(VSYNC) == 1){       
//      pCountBuf[i]=pCount;
//      hCountBuf[i]=hCount;
//      i++;
//      hCount=0;  
//      if (i == 29)
//      {
//         Serial.println("in i");
//         for(int j=0;j<30;j++)
//        {
//          Serial.print("hCount: ");
//          Serial.println(hCountBuf[j]);  
//          Serial.print("pCount: ");
//          Serial.println(pCountBuf[j]);      
//        }
//       i=0; 
//      }            
//    }
//  }
//  
//  pCount=0;  
//  while(digitalRead(HREF) == 1){
//      //Wait for PCLK to go high
//      while(digitalRead(PCLK) == 0){ 
//      }      
//      pCount++;
//  }
//  hCount++;
//}

//void loop(){  
//  //Wait for VSYNC to go high
//  while(digitalRead(VSYNC) == 0){ 
//  } 
//  
//  //Wait for VSYNC to go low
//  while(digitalRead(VSYNC) == 1){
//  }   
//  hCount = 0;
//  Serial.println("VSYNC went low");
//  
//  int vsyncLow = 1;
//  //Do while vsync is low
//  while(vsyncLow){
//    //Wait for HREF to go low
//    while(digitalRead(HREF) == 1){
//      if (digitalRead(VSYNC) == 1)
//        vsyncLow = 0;    //exit while loop 
//        break;      
//    }     
//    
//    //Wait for HREF to go high
//    while(digitalRead(HREF) == 0){
//      if (digitalRead(VSYNC) == 1)
//        vsyncLow = 0;    //exit while loop 
//        break;     
//    } 
//    if(vsyncLow == 0){
//      Serial.print("HCount: ");
//      Serial.println(hCount);     
//      break;
//    }
//    hCount++; 
//    pCount=0;    
//
//    //Capture pixels on PCLK now
//    //do while HREF is high
////    int hrefHigh = 1;
////    while(hrefHigh){
////      //Wait for PCLK to go high
////      while(digitalRead(PCLK) == 0){ 
////        if (digitalRead(HREF) == 0)
////          hrefHigh = 0;
////      } 
////      
////      //if (digitalRead(HREF) == 0){
////      if (hrefHigh == 0)
////        break;  //exit pixel while loop   
////      //read the data here
////      pCount++;        
////      
////      //Wait for PCLK to go low
////      while(digitalRead(PCLK) == 1){
////        if (digitalRead(HREF) == 0)
////          hrefHigh = 0;        
////      } 
////      if (hrefHigh == 0){
////        break;  //exit pixel while loop   
////      }      
////    }
//    
//  }
//}

void Sensorinit(){
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
