/*
* Modified by Markus Lipp adding interleaved buffers, streaming, 32x32 & 24bit support
* Based on "_16x32_Matrix R3.0" by Creater Alex Medeiros, http://PenguinTech.tk
* Use code freely and distort its contents as much as you want, just remeber to thank the 
* original creaters of the code by leaving their information in the header. :)
*/

//PortC[0:11] = {15, 22, 23, 9, 10, 13, 11, 12, 28, 27, 29, 30}
//PortD[0:7] = {2, 14, 7, 8, 6, 20, 21, 5}
//Define pins
//const uint8_t
//PortC
//APIN      = 15, BPIN      = 22, CPIN      = 23, DPIN = 9,
//CLOCKPIN  = 10, LATCHPIN  = 13, OEPIN     = 11,
////PortD
//R1PIN     = 2, R2PIN     = 8,
//G1PIN     = 14, G2PIN     = 6,
//B1PIN     = 7, B2PIN     = 20;
//
//uint8_t pinTable[13] = {
//  R1PIN,R2PIN,G1PIN,G2PIN,B1PIN,B2PIN,
//  APIN,BPIN,CPIN,DPIN,CLOCKPIN,LATCHPIN,OEPIN};
//
////Addresses 1/8 rows Through a decoder
//uint16_t const A = 1, B = 2,C = 4, D=8;
////Acts like a 16 bit shift register
//uint16_t const SCLK   = 16;
//uint16_t const LATCH  = 32;
//uint16_t const OE     = 64;
//
//uint16_t const abcVar[16] = { //Decoder counter var
//  0,A,B,A+B,C,C+A,C+B,A+B+C,
//  0+D,A+D,B+D,A+B+D,C+D,C+A+D,C+B+D,A+B+C+D};
//
////Data Lines for row 1 red and row 9 red, ect.
//uint16_t const RED1   = 1, RED2   = 8;
//uint16_t const GREEN1 = 2, GREEN2 = 16;
//uint16_t const BLUE1  = 4, BLUE2  = 32;

#include "panel.h"
#include "Adafruit_GFX.h"
#include "AlvieGFX.h"

RGBPanel_class RGBPanel;

const uint8_t SIZEX = 32;
const uint8_t SIZEY = 32;

const unsigned char linearTable[256] = {
    0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4,
    4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7,
    7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 10, 10, 10, 10, 11,
    11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 15, 15, 15,
    16, 16, 17, 17, 17, 18, 18, 19, 19, 20, 20, 21, 21,
    22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 28, 28,
    29, 29, 30, 31, 31, 32, 33, 33, 34, 35, 35, 36, 37,
    37, 38, 39, 40, 40, 41, 42, 43, 44, 44, 45, 46, 47,
    48, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 58,
    59, 60, 61, 62, 63, 65, 66, 67, 68, 69, 70, 71, 72,
    73, 74, 75, 77, 78, 79, 80, 81, 83, 84, 85, 86, 88,
    89, 90, 91, 93, 94, 95, 97, 98, 99, 101, 102, 104,
    105, 107, 108, 109, 111, 112, 114, 115, 117, 119,
    120, 122, 123, 125, 126, 128, 130, 131, 133, 135,
    136, 138, 140, 142, 143, 145, 147, 149, 151, 152,
    154, 156, 158, 160, 162, 164, 166, 168, 170, 171,
    173, 175, 178, 180, 182, 184, 186, 188, 190, 192,
    194, 196, 199, 201, 203, 205, 208, 210, 212, 214,
    217, 219, 221, 224, 226, 229, 231, 233, 236, 238,
    241, 243, 246, 248, 251, 253, 255
};

//Here is where the data is all read
uint8_t interleavedBuffer[SIZEX*SIZEY*4];

//BAM and interrupt variables
uint8_t rowN = 0;
uint16_t BAM;
uint8_t BAMMAX = 7; //now 24bit color! (0-7)


void setup() {
//  for(uint8_t i = 0; i < 13; i++){
//        pinMode(pinTable[i], OUTPUT);
//    }
//  timerInit();
  Serial.begin(3000000); 
  
  RGBPanel.begin();
  RGBPanel.clear();
  RGBPanel.setApplyEnabled(true);  
}

//uint8_t prevVal,val;
//int dataPos=0;
unsigned char r,g,b;

char val;
int dataPos=0;

char* buffer = (char*)RGBPanel.backBuffer();

void loop() {    
  
  if (Serial.available())
  {
    val = Serial.read();
    if ( val==1 || dataPos>=3072)
    {
      RGBPanel.swapBuffers(true);
      dataPos=0;
    }
    else
    {
      buffer[dataPos++] = val;
    }
  }
  return;  

//if (Serial.available())
//{
//  val = Serial.read();
//  if ( val==1|| dataPos>=3072)
//  {
//    RGBPanel.apply();
//    dataPos=0;
//  }
//  else
//  {
//    switch (dataPos%3)
//    {
//      case 0: r = val; break;
//      case 1: g = val; break;
//      case 2: b = val;
//      int pixelNr = (dataPos-1)/3;
////      rgb24 c = {colorTmp[0],colorTmp[1],colorTmp[2]};
////      matrix.drawPixel(pixelNr%32, pixelNr/32, c);
//        unsigned int v = b + (g<<8) + (r<<16);
//        RGBPanel.setPixelRaw(pixelNr%32,pixelNr/32,v);
//      break;
//  }
//  dataPos++;
//  }
//}
//return;
  
//   if (Serial.available())
//   {     
//      prevVal = val;
//      val = Serial.read();     
//   
//      if ( (prevVal==192 && val==192) || dataPos>=3072)
//      {
//        dataPos=0;
//        
////        for (i = 0; i < 32 * matrix.getScreenHeight(); i++) {
////          unsigned char r = interleavedBuffer[i * 3 + 0];
////          unsigned char g = interleavedBuffer[i * 3 + 1];
////          unsigned char b = interleavedBuffer[i * 3 + 2];
////        }        
//        
//        int i = 0;
////        for (int x=0;x<32; x++) {
////            for (int y=0;y<32; y++) {
//          for (int y=0;y<RGBPanel.height();y++) {
//              for (int x=0;x<RGBPanel.width(); x++) {  
//                unsigned char r=interleavedBuffer[i * 3 + 0];
//                unsigned char g=interleavedBuffer[i * 3 + 1];
//                unsigned char b=interleavedBuffer[i * 3 + 2];
//                unsigned int v = b + (g<<8) + (r<<16);
//                RGBPanel.setPixelRaw(x,y,v);
//                i++;
//                
//                //RGBPanel.setPixel(x,y,r,g,b);
//            }
//        }
//        
//        
//        RGBPanel.apply();        
//      }
//      else
//      {
//        interleavedBuffer[dataPos++] = val;
//      }
//   }  
}

//IntervalTimer timer1;
//
//void timerInit() {
//    BAM = 0;
//    attackMatrix();
//}
//
//
////The updating matrix stuff happens here
////each pair of rows is taken through its BAM cycle
////then the rowNumber is increased and id done again
//void attackMatrix() {
//    timer1.end();    
//    
//    uint16_t portData;
//    portData = 0; // Clear data to enter
//    portData |= (abcVar[rowN])|OE; // abc, OE
//    portData &=~ LATCH;        //LATCH LOW
//    GPIOC_PDOR = portData;  // Write to Port
//    
//    uint8_t *start = &interleavedBuffer[rowN*SIZEX*8+((7-BAMMAX)+BAM)*32];    
//    for(uint8_t _x = 0; _x < 32; _x++){
//          GPIOD_PDOR = start[_x]; // Transfer data
//          GPIOC_PDOR |=  SCLK;// Clock HIGH
//          GPIOC_PDOR &=~ SCLK;// Clock LOW
//    }
//
//    GPIOC_PDOR |= LATCH;// Latch HIGH
//    GPIOC_PDOR &=~ OE;// OE LOW, Displays line
//
//    #define LOOPTIME 2 //trial&error to get both smooth gradients & little flicker
//    #define CALLOVERHEAD 2
//    timer1.begin(attackMatrix,((LOOPTIME+CALLOVERHEAD)<<BAM)-CALLOVERHEAD);
//  
//    if(BAM >= BAMMAX) { //Checks the BAM cycle for next time.    
//        if(rowN == 15){
//            rowN = 0;
//        } else {
//            rowN ++;
//        }        
//        BAM = 0;
//      } else {
//        BAM ++;
//    }
//}
