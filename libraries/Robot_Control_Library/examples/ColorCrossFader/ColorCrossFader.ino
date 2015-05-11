/*
* Code from Arduino website: http://www.arduino.cc/en/Tutorial/ColorCrossfader
* Code for cross-fading 3 LEDs, red, green and blue (RGB) 
* To create fades, you need to do two things: 
*  1. Describe the colors you want to be displayed
*  2. List the order you want them to fade in
*
* DESCRIBING A COLOR:
* A color is just an array of three percentages, 0-100, 
*  controlling the red, green and blue LEDs
*
* Red is the red LED at full, blue and green off
*   int red = { 100, 0, 0 }
* Dim white is all three LEDs at 30%
*   int dimWhite = {30, 30, 30}
* etc.
*
* Some common colors are provided below, or make your own
* 
* LISTING THE ORDER:
* In the main part of the program, you need to list the order 
*  you want to colors to appear in, e.g.
*  crossFade(red);
*  crossFade(green);
*  crossFade(blue);
*
* Those colors will appear in that order, fading out of 
*    one color and into the next  
*
* In addition, there are 5 optional settings you can adjust:
* 1. The initial color is set to black (so the first color fades in), but 
*    you can set the initial color to be any other color
* 2. The internal loop runs for 1020 interations; the 'wait' variable
*    sets the approximate duration of a single crossfade. In theory, 
*    a 'wait' of 10 ms should make a crossFade of ~10 seconds. In 
*    practice, the other functions the code is performing slow this 
*    down to ~11 seconds on my board. YMMV.
* 3. If 'repeat' is set to 0, the program will loop indefinitely.
*    if it is set to a number, it will loop that number of times,
*    then stop on the last color in the sequence. (Set 'return' to 1, 
*    and make the last color black if you want it to fade out at the end.)
* 4. There is an optional 'hold' variable, which pasues the 
*    program for 'hold' milliseconds when a color is complete, 
*    but before the next color starts.
* 5. Set the DEBUG flag to 1 if you want debugging output to be
*    sent to the serial monitor.
*
*    The internals of the program aren't complicated, but they
*    are a little fussy -- the inner workings are explained 
*    below the main loop.
*
* April 2007, Clay Shirky <clay.shirky@nyu.edu> 

 Hardware:
   Encoder Wing connected to AL WingSlot for Papilio One and Papilio Pro
   Encoder Wing connected to DL WingSlot for Papilio DUO

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

// Output
int redPin = 9;   // Red LED,   connected to digital pin 9
int grnPin = 10;  // Green LED, connected to digital pin 10
int bluPin = 11;  // Blue LED,  connected to digital pin 11

// Color arrays
int black[3]  = { 0, 0, 0 };
int white[3]  = { 100, 100, 100 };
int red[3]    = { 100, 0, 0 };
int green[3]  = { 0, 100, 0 };
int blue[3]   = { 0, 0, 100 };
int yellow[3] = { 40, 95, 0 };
int dimWhite[3] = { 30, 30, 30 };
// etc.

// Set initial color
int redVal = black[0];
int grnVal = black[1]; 
int bluVal = black[2];

int wait = 1;      // 10ms internal crossFade delay; increase for slower fades
int hold = 0;       // Optional hold when a color is complete, before the next crossFade
int DEBUG = 1;      // DEBUG counter; if set to 1, will write values back via serial
int loopCount = 60; // How often should DEBUG report?
int repeat = 3;     // How many times should we loop before stopping? (0 for no stop)
int j = 0;          // Loop counter for repeat

// Initialize color variables
int prevR = redVal;
int prevG = grnVal;
int prevB = bluVal;

// Set up the LED outputs
void setup()
{
//  pinMode(redPin, OUTPUT);   // sets the pins as output
//  pinMode(grnPin, OUTPUT);   
//  pinMode(bluPin, OUTPUT); 

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
}

// Main program: list the order of crossfades
void loop()
{
  crossFade(red);
  crossFade(green);
  crossFade(blue);
  crossFade(yellow);

  if (repeat) { // Do we loop a finite number of times?
    j += 1;
    if (j >= repeat) { // Are we there yet?
      exit(j);         // If so, stop.
    }
  }
}

/* BELOW THIS LINE IS THE MATH -- YOU SHOULDN'T NEED TO CHANGE THIS FOR THE BASICS
* 
* The program works like this:
* Imagine a crossfade that moves the red LED from 0-10, 
*   the green from 0-5, and the blue from 10 to 7, in
*   ten steps.
*   We'd want to count the 10 steps and increase or 
*   decrease color values in evenly stepped increments.
*   Imagine a + indicates raising a value by 1, and a -
*   equals lowering it. Our 10 step fade would look like:
* 
*   1 2 3 4 5 6 7 8 9 10
* R + + + + + + + + + +
* G   +   +   +   +   +
* B     -     -     -
* 
* The red rises from 0 to 10 in ten steps, the green from 
* 0-5 in 5 steps, and the blue falls from 10 to 7 in three steps.
* 
* In the real program, the color percentages are converted to 
* 0-255 values, and there are 1020 steps (255*4).
* 
* To figure out how big a step there should be between one up- or
* down-tick of one of the LED values, we call calculateStep(), 
* which calculates the absolute gap between the start and end values, 
* and then divides that gap by 1020 to determine the size of the step  
* between adjustments in the value.
*/

int calculateStep(int prevValue, int endValue) {
  int step = endValue - prevValue; // What's the overall gap?
  if (step) {                      // If its non-zero, 
    step = 1020/step;              //   divide by 1020
  } 
  return step;
}

/* The next function is calculateVal. When the loop value, i,
*  reaches the step size appropriate for one of the
*  colors, it increases or decreases the value of that color by 1. 
*  (R, G, and B are each calculated separately.)
*/

int calculateVal(int step, int val, int i) {

  if ((step) && i % step == 0) { // If step is non-zero and its time to change a value,
    if (step > 0) {              //   increment the value if step is positive...
      val += 1;           
    } 
    else if (step < 0) {         //   ...or decrement it if step is negative
      val -= 1;
    } 
  }
  // Defensive driving: make sure val stays in the range 0-255
  if (val > 255) {
    val = 255;
  } 
  else if (val < 0) {
    val = 0;
  }
  return val;
}

/* crossFade() converts the percentage colors to a 
*  0-255 range, then loops 1020 times, checking to see if  
*  the value needs to be updated each time, then writing
*  the color values to the correct pins.
*/

void crossFade(int color[3]) {
  // Convert to 0-255
  int R = (color[0] * 255) / 100;
  int G = (color[1] * 255) / 100;
  int B = (color[2] * 255) / 100;

  int stepR = calculateStep(prevR, R);
  int stepG = calculateStep(prevG, G); 
  int stepB = calculateStep(prevB, B);

  for (int i = 0; i <= 1020; i++) {
    redVal = calculateVal(stepR, redVal, i);
    grnVal = calculateVal(stepG, grnVal, i);
    bluVal = calculateVal(stepB, bluVal, i);

//    analogWrite(redPin, redVal);   // Write current values to LED pins
//    analogWrite(grnPin, grnVal);      
//    analogWrite(bluPin, bluVal); 

  Robot_Control_Library.setPWMDuty(RED, redVal);
  Robot_Control_Library.setPWMDuty(GREEN, grnVal);
  Robot_Control_Library.setPWMDuty(BLUE, bluVal);

    delay(wait); // Pause for 'wait' milliseconds before resuming the loop

    if (DEBUG) { // If we want serial output, print it at the 
      if (i == 0 or i % loopCount == 0) { // beginning, and every loopCount times
        Serial.print("Loop/RGB: #");
        Serial.print(i);
        Serial.print(" | ");
        Serial.print(redVal);
        Serial.print(" / ");
        Serial.print(grnVal);
        Serial.print(" / ");  
        Serial.println(bluVal); 
      } 
      DEBUG += 1;
    }
  }
  // Update current values for next loop
  prevR = redVal; 
  prevG = grnVal; 
  prevB = bluVal;
  delay(hold); // Pause for optional 'wait' milliseconds before resuming the loop
}
