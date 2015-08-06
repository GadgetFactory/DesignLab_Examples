/*
 Gadget Factory
 Example for Alvaro's ZPUino VGA Adapter 
 To learn more about using DesignLab please visit http://learn.gadgetfactory.net

 Related library documentation:
    Use the Adafruit GFX library to program this VGA adapter.
    https://learn.adafruit.com/adafruit-gfx-graphics-library/overview

 created 2015
 by Alvaro Lopes
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
 
#define circuit Computing_Shield2

#include "Adafruit_GFX.h"
#include "ZPUino_GFX.h"
#include "PLL.h"
#include "menus.h"
#include "SID.h"
#include "YM2149.h"
#include "ymplayer.h"
#include "sidplayer.h"
#include <Timer.h>
#include "SmallFS.h"
#include <SD.h>
#include <SPI.h>
#include "ramFS.h"
#include "cbuffer.h"
#include <Timer.h>

YM2149 ym2149;
YMPLAYER ymplayer;
//SID sid;
SIDPLAYER sidplayer;

ZPUino_GFX gfx;
static bool menuVisible = true;
static bool sidState = false;
static bool ymState = false;

#define TIMEOUTMAX 10000    //Timeout for joystick

//Joystick
#define JSELECT 19
#define JDOWN 18
#define JUP 20
#define JRIGHT 17
#define JLEFT 21

enum kButtonDirection {
	Left                = 0, 
	Right               = 1,  
	Up                  = 2,  
    Down                = 3,  
	Select              = 4,
    None                = 5
};

unsigned long timeout;
int sidplayercounter = 0;
kButtonDirection buttonPressed;

void exitMenus(void *a)
{
    menuExit();
    menuVisible=false;
    gfx.fillScreen( 0 );
}


void showMenu()
{
    menuReset();
    menuVisible=true;
    menuShowTop();
}

static void sidStop(void*)
{
  sidplayer.play(false);
}
static void ymStop(void*)
{
  ymplayer.play(false);
}
static void sidStart(void*)
{
  sidplayer.play(true);
}
static void ymStart(void*)
{
  ymplayer.play(true);
}

#define MAXFILES 32

char fileNames[MAXFILES][32];

static void onOpenFile(void *data)
{
    char *name = (char*)data;
    // Process file here.
}

static void createFileSelectionMenu(subMenu *menu, const char *filter_ext = NULL)
{
    int i = 0;
    SmallFSEntry entry = SmallFS.getFirstEntry();
    menu->deleteChilds();
    if (entry.valid()) {
        do {
            bool skip=false;
            if (filter_ext) {
                if (!entry.endsWith(filter_ext))
                    skip=true;
            }
            if (!skip) {
                entry.getName(fileNames[i]);
                menu->appendChild(new menuItem( fileNames[i], &onOpenFile, fileNames[i]) );
            }
            if (entry.hasNext())
                entry++;
            else
                break;
            i++;
        } while (true);
    }
}


static void createMenus()
{
    subMenu *config = new subMenu("Options");

//    subMenu *sid = new subMenu("SID Audio");
//    config->appendChild(sid);
//    sid->setParent(config);
    config->appendChild( new menuItem("SID Pause", &sidStop) );
    config->appendChild( new menuItem("YM Pause", &ymStop) );
    
    config->appendChild( new menuItem("SID Play", &sidStart) );
    config->appendChild( new menuItem("YM Play", &ymStart) );    

//    modo->appendChild( new menuItem("Video", &onVideo) );
//    modo->appendChild( new menuItem("Bricks", &onBricks)) ;
//    modo->appendChild( new menuItem("SoundPuddle",&onVideo) ) ;
//    modo->appendChild( new menuItem("< Back",(void(*)(void*))&menuSwitchTo, config) ) ;

//    subMenu *ym = new subMenu("YM Audio");
//    config->appendChild(ym);
//    ym->setParent(config);
    //controle->appendChild( new menuItem("< Back",(void(*)(void*))&menuSwitchTo, config) ) ;

    config->appendChild( new menuItem("Exit",(void(*)(void*))&exitMenus) ) ;


    subMenu *play = new subMenu("Play");
    config->appendChild(play);
    play->setParent(config);
    createFileSelectionMenu(play);
    play->appendChild( new menuItem("< Back",(void(*)(void*))&menuSwitchTo, config) ) ;

    menuSetTop(config);
}

bool timer(void*)
{
  sidplayercounter++;
  //modplayer.zpu_interrupt();
  ymplayer.zpu_interrupt(); 
  if (sidplayercounter == 340) {
    sidplayer.zpu_interrupt(); 
    sidplayercounter = 1;
  }
  //retrocade.setTimeout();
  return true;
}

void setup()
{
    //delay(3000);
    Serial.begin(115200);
    Serial.println("Starting");
    gfx.begin(MODE_640x480);
    //gfx.begin( &modeline_640x480_60 );
    createMenus();
    //menuInit(128,128);
    menuInit(256,256);
    menusSetRenderer(&gfx);

    
    //Set Wishbone slots for audio chips
    //sid.setup(14);
    //ym2149.setup(13);   
   
    ymplayer.setup(&ym2149,6); 
    sidplayer.setup(8);  
  
    ///Give some volume
    ym2149.V1.setVolume(15);
    ym2149.V2.setVolume(15);
    ym2149.V3.setVolume(15);   
    //sid.setVolume(15);    
    
    sidplayer.loadFile("track1.sid");
    sidplayer.play(true);
    
    ymplayer.loadFile("track2.ymd");
    ymplayer.play(true);    
    
   //Setup timer for YM and mod players, this generates an interrupt at 1700hz
    Timers.begin();
    int r = Timers.periodicHz(17000, timer, 0, 1);
    if (r<0) {
        Serial.println("Fatal error!");
    }      
    
    //Setup Joystick
    pinMode(JSELECT, INPUT); 
    pinMode(JUP, INPUT); 
    pinMode(JDOWN, INPUT); 
    pinMode(JLEFT, INPUT); 
    pinMode(JRIGHT, INPUT);     
    
    timeout=TIMEOUTMAX;
    showMenu();    
}

void loop()
{
  if (sidplayer.getPlaying() == 1)    
    sidplayer.audiofill();   
   
  if (ymplayer.getPlaying() == 1)
    ymplayer.audiofill();
    
  timeout--;
  if (timeout==0) {
    timeout = TIMEOUTMAX;
    //Serial.println("timeout");
    if (digitalRead(JUP)) {
      timeout = TIMEOUTMAX;
      buttonPressed = Up;
      Serial.println("up");
    } else if (digitalRead(JDOWN)) {
      timeout = TIMEOUTMAX;
      buttonPressed = Down;
      Serial.println("down");
    } else if (digitalRead(JRIGHT)) {
      timeout = TIMEOUTMAX;
      buttonPressed = Right;
      Serial.println("right");
    } else if (digitalRead(JLEFT)) {
      timeout = TIMEOUTMAX; 
      buttonPressed = Left;
      Serial.println("left");
    } else if (digitalRead(JSELECT)) {
        timeout = TIMEOUTMAX; 
        buttonPressed = Select;  
        Serial.println("select");    
    }         
  }  
  
  
  
    if (buttonPressed < 5) {
        //char s = (char)Serial.read();
        if (menuVisible) {
            if (buttonPressed == Up) {
                Serial.println("up");
                moveMenuUp();
            }
            if (buttonPressed == Down) {
                Serial.println("down");
                moveMenuDown();
            }
            if (buttonPressed == Right) {
                //Serial.println("action");
                menuAction();
            }
            if (buttonPressed == Left) {
                //exitMenus(0);
            }
        } else {
            if (buttonPressed == Select) {
                Serial.println("show");
                showMenu();
            }
        }
        buttonPressed = None;        
    } 
}
