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

#define DEADZONE 5 /* Joy dead zone */

void initControl(void) {
  pinMode(JOYUP, INPUT);
  pinMode(JOYDOWN, INPUT);
  pinMode(JOYLEFT, INPUT);
  pinMode(JOYRIGHT, INPUT);
  pinMode(JOYBUT, INPUT);
  
  pinMode(JOYGND, OUTPUT);
  digitalWrite(JOYGND, LOW);

//  WIIChuck.update();
//
//  centerx = WIIChuck.getJoyX();
//  centery = WIIChuck.getJoyY();

}

uint8_t getControl(void) {
//  WIIChuck.update();
//  int deltay = (int)WIIChuck.getJoyY() - centery;
//  int deltax = (int)WIIChuck.getJoyX() - centerx;
//  
//  if (deltay>DEADZONE || deltay<-DEADZONE) {
//      accumuly+=deltay;
//      //Serial.println(accumul);
//      if (accumuly<-100) {
//          //Serial.println("Down");
//          return DOWN;
//          accumuly=0;
//      } else if (accumuly>100) {
//        //Serial.println("up");
//          return UP;
//          accumuly=0;
//      }
//  }  
//  
//  if (deltax>DEADZONE || deltax<-DEADZONE) {
//      accumulx+=deltax;
//      //Serial.println(accumul);
//      if (accumulx<-100) {
//        //Serial.println("left");
//          return LEFT;
//          accumulx=0;
//      } else if (accumulx>100) {
//        //Serial.println("right");
//          return RIGHT;
//          accumulx=0;
//      }
//  }   

//  if (digitalRead(JOYUP) == LOW) {  Serial.println("UP"); return UP; }
//  if (digitalRead(JOYDOWN) == LOW) { Serial.println("down"); return DOWN; }
//  if (digitalRead(JOYLEFT) == LOW) { Serial.println("left"); return LEFT; }
//  if (digitalRead(JOYRIGHT) == LOW) { Serial.println("right"); return RIGHT; }
//  if (digitalRead(JOYBUT) == LOW) { Serial.println("fire"); return BUTTON; }

  if (digitalRead(JOYUP) == LOW) { return UP; }
  if (digitalRead(JOYDOWN) == LOW) { return DOWN; }
  if (digitalRead(JOYLEFT) == LOW) { return LEFT; }
  if (digitalRead(JOYRIGHT) == LOW) { return RIGHT; }
  if (digitalRead(JOYBUT) == LOW) { return BUTTON; }
  /*--------------Need to implement this for teensy --------------------
    if (SDL_PollEvent(&event)) {
        if (event.type == SDL_KEYDOWN) {
            SDL_Keycode keyPressed = event.key.keysym.sym;

            switch (keyPressed)
            {
                case SDLK_ESCAPE:
                    return ESCAPE;
                case SDLK_UP:
                    return UP;
                case SDLK_DOWN:
                    return DOWN;
                case SDLK_LEFT:
                    return LEFT;
                case SDLK_RIGHT:
                    return RIGHT;
            }
        }
    }
  --------------------------------------------------------------------*/
    
    return NOINPUT;
    
}

void controlDelayMs(uint16_t ms) {
  delay(ms); 
}

bool timer(void*)
{
  //1Hz Timer
  //Serial.println("In Timer");
  matrix.apply();
  //control = getControl();
  return true;
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  
//  WIIChuck.begin();
//  WIIChuck.init_nunchuck();
  
  Timers.begin();
  int r = Timers.periodic(10, timer, 0, 1);
  if (r<0) {
      Serial.println("Fatal error!");
  }  
//  int r2 = Timers.periodic(100, timer2, 0, 2);
//  if (r2<0) {
//      Serial.println("Fatal error!");
//  }   
}

void loop() {
  //Everything is handled in the matrixman.c loop
  playMatrixman();
}
