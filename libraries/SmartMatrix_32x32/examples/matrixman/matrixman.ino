/*
    This is 1-pixel pacman as seen on HackaDay
    http://hackaday.com/2015/06/01/1-pixel-pacman/
    
    Source code:
    https://hackaday.io/project/6036-1-pixel-pac-man
  
    Papilio Notes:
    
    Hardware: Use a RGB LED Panel Wing connected to row D on the Papilio DUO and row C on the Papilio Pro.
    http://store.gadgetfactory.net/rgb-led-panel-wing/?page_context=category&faceted_search=0
    
    Connect a Joystick Wing to the BL Wing Slot.  
  
*/

#define circuit RGB_Matrix

#include "matrixman-gamefile.h"
#include <SmartMatrix_32x32.h>
#include <WiiChuck.h>
#include <i2c.h>
#include <Timer.h>

#define circuit RGB_Matrix

SmartMatrix matrix;

static int centerx,centery; // Joy center
static int accumulx = 0;
static int accumuly = 0;
//uint8_t control;



/*------------------Display Specific Funcions----------------------------*/
void initDisplay(void) {
  matrix.begin();
  matrix.setBrightness(128);
  matrix.fillScreen(rgb24(0,0,0));
}

void displayClear(uint8_t color) {
    //matrix.fillScreen(rgb24(colors[color][0],colors[color][1],colors[color][2]));
    matrix.fillScreen(rgb24(0,0,0));
    displayLatch();
}

void displayGameOver(void) {
    matrix.setScrollOffsetFromEdge(13);
    matrix.setScrollMode(wrapForward);
    matrix.setScrollSpeed(40);
    matrix.scrollText("Game Over", 1);
    while(matrix.getScrollStatus() > 0) { }
}

void displayPixel(uint8_t x, uint8_t y, char color) {
    matrix.drawPixel(x,y-2,rgb24(colors[color][0],colors[color][1],colors[color][2]));
}

void displayClose(void) {

}

void displayLatch(void) {
    matrix.swapBuffers();
}

/*---------------------Control Specific Funcitons ----------------------*/
//Compshield snap off wing on C row. Caution - don't connect end pins.
//#define JOYUP      44
//#define JOYDOWN    46
//#define JOYLEFT    48
//#define JOYRIGHT   50
//#define JOYBUT     42

//Joystick Wing on BL.
#define JOYUP      14
#define JOYDOWN    15
#define JOYLEFT    16
#define JOYRIGHT   17
#define JOYBUT     19
#define JOYGND     20

void initControl(void) {
  pinMode(JOYUP, INPUT);
  pinMode(JOYDOWN, INPUT);
  pinMode(JOYLEFT, INPUT);
  pinMode(JOYRIGHT, INPUT);
  pinMode(JOYBUT, INPUT);
  
  pinMode(JOYGND, OUTPUT);
  digitalWrite(JOYGND, LOW);


}

uint8_t getControl(void) {

  if (digitalRead(JOYUP) == LOW) { return UP; }
  if (digitalRead(JOYDOWN) == LOW) { return DOWN; }
  if (digitalRead(JOYLEFT) == LOW) { return LEFT; }
  if (digitalRead(JOYRIGHT) == LOW) { return RIGHT; }
  if (digitalRead(JOYBUT) == LOW) { return BUTTON; }
    
    return NOINPUT;
    
}

void controlDelayMs(uint16_t ms) {
  delay(ms); 
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200); 
}

void loop() {
  //Everything is handled in the matrixman.c loop
  playMatrixman();
}
