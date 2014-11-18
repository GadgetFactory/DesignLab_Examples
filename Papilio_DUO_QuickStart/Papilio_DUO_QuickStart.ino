/*
 Gadget Factory
 Papilio Schematic Library Example
 To learn more about the Papilio Schematic Library please visit http://learn.gadgetfactory.net
 
 Tutorials:
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  
 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

int ledPins[] = { 
  0, 2, 4, 6, 15, 17, 19, 21, 25, 29, 33, 37, 41, 45, 49, 53, 22, 26, 30, 34, 38, 42, 46, 50  };       // an array of pin numbers to which LEDs are attached
int ledCount = 24;           // the number of pins (i.e. the length of the array)

int buttonPins[] = { 
  1, 3, 5, 7, 14, 16, 18, 20, 23, 27, 31, 35, 39, 43, 47, 51, 24, 28, 32, 36, 40, 44, 48, 52 };       // an array of pin numbers to which Buttons are attached
int buttonCount = 24;           // the number of pins (i.e. the length of the array)

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status
int thisPin;
int ledState = LOW;

// first visible ASCIIcharacter '!' is number 33:
int thisByte = 33; 
// you can also write ASCII characters in single quotes.
// for example. '!' is the same as 33, so you could also use this:
//int thisByte = '!'; 

void setup() {
  // initialize the LED pins as an output:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(ledPins[thisPin], OUTPUT);  
  }
  
  // initialize the pushbutton pin as an input:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(buttonPins[thisPin], INPUT);      
  }  
  
  //Free up ISP pins
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
  
  //Delay for 5 seconds to prevent detection as a Micorsoft Serial BallPoint serial mouse.
  delay(5000);
  
  //Setup Serial port and send out Title
  Serial.begin(9600); 

  // prints title with ending line break 
  Serial.println("Papilio DUO Quick Start V1.0 - ASCII Table ~ Character Map"); 
}

void loop(){
  //This sends the ASCII table to the serial port.
  
  // prints value unaltered, i.e. the raw binary version of the 
  // byte. The serial monitor interprets all bytes as 
  // ASCII, so 33, the first number,  will show up as '!' 
  //Serial.print(thisByte, BYTE);    

  Serial.print("dec: "); 
  // prints value as string as an ASCII-encoded decimal (base 10).
  // Decimal is the  default format for Serial.print() and Serial.println(),
  // so no modifier is needed:
  Serial.print(thisByte);      
  // But you can declare the modifier for decimal if you want to.
  //this also works if you uncomment it:

  // Serial.print(thisByte, DEC);  


  Serial.print(", hex: "); 
  // prints value as string in hexadecimal (base 16):
  Serial.print(thisByte, HEX);     

  Serial.print(", oct: "); 
  // prints value as string in octal (base 8);
  Serial.print(thisByte, OCT);     

  Serial.print(", bin: "); 
  // prints value as string in binary (base 2) 
  // also prints ending line break:
  Serial.println(thisByte, BIN);   

  // if printed last visible character '~' or 126, stop: 
  if(thisByte == 126) {     // you could also use if (thisByte == '~') {
    thisByte = 33;
  } 
  // go on to the next character
  thisByte++;  
  
  //This section blinks the LED's and keeps them solid if a button is pressed. 
  delay(200);                  // wait for a second 
  ledState = !ledState;  
  for (int thisPin = 0; thisPin < buttonCount; thisPin++)  {
    // read the state of the pushbutton value:
    buttonState = digitalRead(buttonPins[thisPin]);
  
    // check if the pushbutton is pressed.
    // if it is, the buttonState is HIGH:
    if (buttonState == HIGH) {     
      // turn LED on:    
      digitalWrite(ledPins[thisPin], HIGH);  
    } 
    else {
      // toggle LED:
      digitalWrite(ledPins[thisPin], ledState); 
    }
  }
  //digitalWrite(13,ledState);  //For LED1
}
