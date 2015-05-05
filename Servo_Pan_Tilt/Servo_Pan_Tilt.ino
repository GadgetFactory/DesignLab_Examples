/* Sweep
 by BARRAGAN <http://barraganstudio.com> 
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://arduino.cc/en/Tutorial/Sweep
*/ 

#define circuit ZPUino_Vanilla

#include <Servo.h> 
 
Servo tilt;  // create servo object to control a servo 
Servo pan;
                // twelve servo objects can be created on most boards
 
int pos = 0;    // variable to store the servo position 
int panpos = 0;
 
void setup() 
{ 
  tilt.attach(6);  // attaches the servo on pin 9 to the servo object 
  pan.attach(7);
} 
 
void loop() 
{ 
  for(pos = 90; pos <= 180; pos += 1) // goes from 0 degrees to 180 degrees 
  {                                  // in steps of 1 degree 
    tilt.write(pos);              // tell servo to go to position in variable 'pos' 
    pan.write(pos);
    delay(15);                       // waits 15ms for the servo to reach the position 
  } 
  for(pos = 180; pos>=90; pos-=1)     // goes from 180 degrees to 0 degrees 
  {                                
    tilt.write(pos);              // tell servo to go to position in variable 'pos' 
    pan.write(pos);
    delay(15);                       // waits 15ms for the servo to reach the position 
  } 
} 

