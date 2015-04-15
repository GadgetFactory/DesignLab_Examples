/*
 Gadget Factory
 Template to make your own Schematic Symbol and Community Core Library for the Papilio FPGA and DesignLab

 To use this sketch do the following steps:
  1) 
  
 Tools for generating your own libraries:
 

 Tutorials:
   http://learn.gadgetfactory.net
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#include "Robot_Control_Library.h"

Robot_Control_Library Robot_Control_Library;
 
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Robot_Control_Library.setupQuad(5);   
  
}

void loop() {
  Serial.print("\t Pulse Count 0: ");              
  Serial.print(Robot_Control_Library.getPulseCount(0));
  Serial.print("\t \t Pulse Count 1: ");              
  Serial.print(Robot_Control_Library.getPulseCount(1));  
  Serial.print("\t \t Pulse Count 2: ");              
  Serial.print(Robot_Control_Library.getPulseCount(2)); 
  Serial.print("\t \t Pulse Count 3: ");              
  Serial.print(Robot_Control_Library.getPulseCount(3)); 
  Serial.print("\t \t Pulse Count 4: ");              
  Serial.print(Robot_Control_Library.getPulseCount(4)); 
  Serial.print("\t \t Pulse Count 5: ");              
  Serial.print(Robot_Control_Library.getPulseCount(5));  
  
//  Serial.print("\t \t Revolution Count:");            // T is not connected            
//  Serial.print(Robot_Control_Library.getRevCount(1));

  //Not sure if these functions are working correctly...
//  Serial.print("\t \t Speed: ");                 
//  Serial.print(Robot_Control_Library.getSpeed(1));
//  Serial.print("\t \t Speed Radians: ");               
//  Serial.print(Robot_Control_Library.getSpeedRad(1));
//  Serial.print("\t \t Acceleration: ");              
//  Serial.print(Robot_Control_Library.getAccel(1));
  Serial.println();
  Serial.println();
  delay (200);   
}
