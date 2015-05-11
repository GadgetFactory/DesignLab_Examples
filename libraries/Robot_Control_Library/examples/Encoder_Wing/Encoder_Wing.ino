/*
 Gadget Factory
 This example sketch shows how to move flex pins and use the PWM and Quadrature Decoder cores. 

 Hardware:
   Encoder Wing connected to AL WingSlot for Papilio One and Papilio Pro
   Encoder Wing connected to DL WingSlot for Papilio DUO

 Tutorials:
   http://learn.gadgetfactory.net

 created 2015
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#define circuit Robot_Control_Library

//Papilio DUO on DL Wingslot
#if defined(__ZPUINO_PAPILIO_DUO_512KB__) || defined(__ZPUINO_PAPILIO_DUO_2MB__)
  #define BUTTON_LED WING_DL7
  #define ENC_LEDR WING_DL3
  #define ENC_LEDG WING_DL2
  #define ENC_LEDB WING_DL1
  #define ENC_A WING_DL4
  #define ENC_B WING_DL5
#else
  //Everything else on AL Wingslot
  #define BUTTON_LED WING_AL7
  #define ENC_LEDR WING_AL3
  #define ENC_LEDG WING_AL2
  #define ENC_LEDB WING_AL1
  #define ENC_A WING_AL4
  #define ENC_B WING_AL5
#endif

//Define PWM channels
#define BUTTON 0
#define RED 1
#define GREEN 2
#define BLUE 3

#include "Robot_Control_Library.h"

Robot_Control_Library Robot_Control_Library;
 
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Robot_Control_Library.setupQuad(5); 
  Robot_Control_Library.setupPWM(11);  
  
   //Setup the Flex pins to connect to an Encoder Wing connected to AL Wingslot
   
   // Map WING_AL7/Button_LED to FlexPinOut0/PWM0
   pinMode (BUTTON_LED , OUTPUT );
   pinModePPS (BUTTON_LED , HIGH );
   outputPinForFunction (BUTTON_LED , 0 );  
 
   // Map WING_AL3/ENC_LEDR to FlexPinOut1/PWM1
   pinMode (ENC_LEDR , OUTPUT );
   pinModePPS (ENC_LEDR , HIGH );
   outputPinForFunction (ENC_LEDR , 1 );   
 
   // Map WING_AL2/ENC_LEDG to FlexPinOut2/PWM2
   pinMode (ENC_LEDG , OUTPUT );
   pinModePPS (ENC_LEDG , HIGH );
   outputPinForFunction (ENC_LEDG , 2 );      
  
   // Map WING_AL1/ENC_LEDB to FlexPinOut3/PWM3
   pinMode (ENC_LEDB , OUTPUT );
   pinModePPS (ENC_LEDB , HIGH );
   outputPinForFunction (ENC_LEDB , 3 );   
  
   // Map WING_AL4/ENC_A to FlexPinIn0/Quad_A(0)
  pinMode (ENC_A , INPUT );
  inputPinForFunction (ENC_A , 0 );  

   // Map WING_AL5/ENC_B to FlexPinIn3/Quad_B(0)
  pinMode (ENC_B , INPUT );
  inputPinForFunction (ENC_B , 3 );   
  
  //255 is off, 0 is on
  Robot_Control_Library.setPWMDuty(BUTTON, 0);
  Robot_Control_Library.setPWMDuty(RED, 0);
  Robot_Control_Library.setPWMDuty(GREEN, 255);
  Robot_Control_Library.setPWMDuty(BLUE, 255);  
  
}

void setColourRgb(unsigned int _red, unsigned int _green, unsigned int _blue) {
  Robot_Control_Library.setPWMDuty(RED, _red);
  Robot_Control_Library.setPWMDuty(GREEN, _green);
  Robot_Control_Library.setPWMDuty(BLUE, _blue);
 }

void loop() {
  Serial.print("\t Pulse Count 0: ");              
  Serial.print(Robot_Control_Library.getPulseCount(0));
  
//  Serial.print("\t \t Revolution Count:");            // T is not connected            
//  Serial.print(Robot_Control_Library.getRevCount(1));

  //Not sure if these functions are working correctly...
  Serial.print("\t \t Speed: ");                 
  Serial.print(Robot_Control_Library.getSpeed(0));
  Serial.print("\t \t Speed Radians: ");               
  Serial.print(Robot_Control_Library.getSpeedRad(0));
  Serial.print("\t \t Acceleration: ");              
  Serial.print(Robot_Control_Library.getAccel(0));
  Serial.println();
  Serial.println();
  //delay (200);  

  //Code snippet from: https://gist.github.com/jamesotron/766994
  unsigned int rgbColour[3];
  // Start off with red.
  rgbColour[0] = 255;
  rgbColour[1] = 0;
  rgbColour[2] = 0;  
 
  // Choose the colours to increment and decrement.
  for (int decColour = 0; decColour < 3; decColour += 1) {
    int incColour = decColour == 2 ? 0 : decColour + 1;
 
    // cross-fade the two colours.
    for(int i = 0; i < 255; i += 1) {
      rgbColour[decColour] -= 1;
      rgbColour[incColour] += 1;
      
      setColourRgb(rgbColour[0], rgbColour[1], rgbColour[2]);
      delay(1);
    }
  }  
}
