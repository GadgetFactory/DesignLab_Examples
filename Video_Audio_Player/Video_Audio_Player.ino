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

#include "jpeglib.h"
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
SID mySid;
SIDPLAYER sidplayer;

ZPUino_GFX gfx;
static bool menuVisible = true;
static bool sidState = false;
static bool ymState = false;

#define TIMEOUTMAX 30000    //Timeout for joystick

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


//Image stuff.
int width, height;



#define COLOR_BYTES 2
#define COLOR_WEIGHT_R 5
#define COLOR_WEIGHT_G 6
#define COLOR_WEIGHT_B 5

#define COLOR_SHIFT_R (COLOR_WEIGHT_B+COLOR_WEIGHT_G)
#define COLOR_SHIFT_G (COLOR_WEIGHT_B)
#define COLOR_SHIFT_B 0


unsigned short *imgbuf;




void jpeg_error(jpeg_common_struct*)
{
    printf("Error reading JPEG\r\n");
    while (1) {
    }
}

int readjpeg(const char *file)
{
    jpeg_decompress_struct cinfo;

    jpeg_error_mgr defaultErrorManager;

    cinfo.err = jpeg_std_error(&defaultErrorManager);

    defaultErrorManager.error_exit = &jpeg_error;

    FILE* pFile = fopen(file, "rb");
    if (!pFile)
        return -1;

    jpeg_create_decompress(&cinfo);
    jpeg_stdio_src(&cinfo, pFile);
    jpeg_read_header(&cinfo, TRUE);
    jpeg_start_decompress(&cinfo);

    printf("JPEG image info: %d x %d\n", cinfo.image_width, cinfo.image_height);

    unsigned row_stride = cinfo.output_width * cinfo.output_components;

    unsigned char *buffer = (unsigned char*)malloc(row_stride);

    unsigned short v;
    uint16_t *imgbuf = gfx.getFramebuffer();
 
    while(cinfo.output_scanline < cinfo.image_height)
    {
        int s = jpeg_read_scanlines(&cinfo, &buffer, 1);
        printf("%d\r\n",cinfo.output_scanline);
        unsigned char *ptr = buffer;
        int x;
        for (x=0; x<cinfo.image_width; x++) {
            uint16_t r = (ptr[0] >> (8 - COLOR_WEIGHT_R));
            uint16_t g = (ptr[1] >> (8 - COLOR_WEIGHT_G));
            uint16_t b = (ptr[2] >> (8 - COLOR_WEIGHT_B));
            v = (r<<(COLOR_SHIFT_R)) + (g<<COLOR_SHIFT_G) + (b<<COLOR_SHIFT_B);
            *imgbuf=v;
            ptr+=3;
            imgbuf++;
        }
    }
    jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    fclose(pFile);
    free(buffer);
    printf("All done\r\n");
    return 0;

}




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

static void gfxTest(void*)
{
//  sidplayer.play(false);
//  ymplayer.play(false);
  mySid.reset();
  ym2149.reset();
  ym2149.V1.setVolume(0);
  ym2149.V2.setVolume(0);
  ym2149.V3.setVolume(0);   
  mySid.setVolume(0);  
  test();     
  createMenus();
  menuInit(128,128);
  //menuInit(256,256);
  menusSetRenderer(&gfx);
  readjpeg("/smallfs/image.jpg");  
  showMenu();
  ym2149.V1.setVolume(11);
  ym2149.V2.setVolume(11);
  ym2149.V3.setVolume(11);   
  mySid.setVolume(15);  
}

static void imgTest(void*)
{
  //not working
  gfx.begin(MODE_640x480);
//  readjpeg("/smallfs/imageBig.jpg");
//  delay(5000);
//  gfx.begin(MODE_320x240);
  createMenus();
  menuInit(128,128);
  //menuInit(256,256);
  menusSetRenderer(&gfx);
  //readjpeg("/smallfs/image.jpg");  
  showMenu();
}

static void sidStop(void*)
{
  sidplayer.play(false);
      ym2149.V1.setVolume(0);
    ym2149.V2.setVolume(0);
    ym2149.V3.setVolume(0);   
    mySid.setVolume(0);   
}
static void ymStop(void*)
{
  ymplayer.play(false);
      ym2149.V1.setVolume(0);
    ym2149.V2.setVolume(0);
    ym2149.V3.setVolume(0);   
    mySid.setVolume(0);   
}
static void sidStart(void*)
{
  sidplayer.play(true);
  ym2149.V1.setVolume(11);
  ym2149.V2.setVolume(11);
  ym2149.V3.setVolume(11);   
  mySid.setVolume(15);   
}
static void ymStart(void*)
{
  ymplayer.play(true);
  ym2149.V1.setVolume(11);
  ym2149.V2.setVolume(11);
  ym2149.V3.setVolume(11);   
  mySid.setVolume(15);   
}

static void allStart(void*)
{
  sidplayer.play(true);
  ymplayer.play(true);
  ym2149.V1.setVolume(11);
  ym2149.V2.setVolume(11);
  ym2149.V3.setVolume(11);   
  mySid.setVolume(15);   
}
static void allStop(void*)
{
    ymplayer.play(false);
    sidplayer.play(false);
    ym2149.V1.setVolume(0);
    ym2149.V2.setVolume(0);
    ym2149.V3.setVolume(0);   
    mySid.setVolume(0);   
}

#define MAXFILES 32

int fileExtension(const char* name, const char* extension, size_t length)
{
  //Serial.println(extension);
  const char* ldot = strrchr(name, '.');
  if (ldot != NULL)
  {
    if (length == 0)
      length = strlen(extension);
    return strncmp(ldot + 1, extension, length) == 0;
  }
  return 0;
}

char fileNames[MAXFILES][32];

static void onOpenFile(void *data)
{
     char *name = (char*)data;
     if (fileExtension(name,"sid",3)) {
      ymplayer.play(false); 
      ym2149.reset();  
      mySid.setVolume(15);     
      sidplayer.loadFile(name);
      sidplayer.play(true);
     }     
     if (fileExtension(name,"ymd",3)) {
      sidplayer.play(false); 
      mySid.reset(); 
      ym2149.V1.setVolume(11);
      ym2149.V2.setVolume(11);
      ym2149.V3.setVolume(11);         
      ymplayer.loadFile(name);
      ymplayer.play(true);  
     }    
     if (fileExtension(name,"jpg",3)) {
       char tmpFile[80];
       strcat(tmpFile,"/smallfs/");
       strcat(tmpFile,name);      
       readjpeg(tmpFile);
        createMenus();
        menuInit(128,128);
        //menuInit(256,256);
        menusSetRenderer(&gfx);
       showMenu();       
     }
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
                if (!entry.endsWith(filter_ext)) {
                    Serial.println("Skipping file.");
                    skip=true;
                }
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
    } else {
        Serial.println("Nothing in SmallFS...");
    }
}


static void createMenus()
{
    subMenu *config = new subMenu("Options");
    
    subMenu *play = new subMenu("All Files");
    config->appendChild(play);
    play->setParent(config);
    createFileSelectionMenu(play);
    play->appendChild( new menuItem("< Back",(void(*)(void*))&menuSwitchTo, config) ) ;    

    subMenu *sidplay = new subMenu("SID Audio");
    config->appendChild(sidplay);
    sidplay->setParent(config);
    createFileSelectionMenu(sidplay, ".sid");
    sidplay->appendChild( new menuItem("< Back",(void(*)(void*))&menuSwitchTo, config) ) ; 

    subMenu *ymplay = new subMenu("YM2149 Audio");
    config->appendChild(ymplay);
    ymplay->setParent(config);
    createFileSelectionMenu(ymplay, ".ymd");
    ymplay->appendChild( new menuItem("< Back",(void(*)(void*))&menuSwitchTo, config) ) ;

    config->appendChild( new menuItem("Pause All", &allStop) );
    config->appendChild( new menuItem("Play All Chips", &allStart) );

    config->appendChild( new menuItem("GFX Test", &gfxTest) );
//    config->appendChild( new menuItem("Image", &imgTest) ); 

//    config->appendChild( new menuItem("SID Pause", &sidStop) );
//    config->appendChild( new menuItem("YM Pause", &ymStop) );
//    
//    config->appendChild( new menuItem("SID Play", &sidStart) );
//    config->appendChild( new menuItem("YM Play", &ymStart) );    

    config->appendChild( new menuItem("Exit",(void(*)(void*))&exitMenus) ) ;

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
  return true;
}

void setup()
{
    //delay(3000);
    Serial.begin(115200);
    Serial.println("Starting");  
  
     //Start SmallFS
    if (SmallFS.begin()<0) {
  	Serial.println("No SmalLFS found.");
    }
    else{
       Serial.println("SmallFS Started.");
    }    

    //gfx.begin(MODE_640x480);
    gfx.begin(MODE_320x240);
    //gfx.begin( &modeline_640x480_60 );
    createMenus();
    menuInit(128,128);
    //menuInit(256,256);
    menusSetRenderer(&gfx);
       

    //Set Wishbone slots for audio chips
    mySid.setup(8);
    sidplayer.setup(8);
    
    ym2149.setup(6);   
    ymplayer.setup(&ym2149,6); 

    ///Give some volume
    ym2149.V1.setVolume(11);
    ym2149.V2.setVolume(11);
    ym2149.V3.setVolume(11);   
    mySid.setVolume(15);    
    
    sidplayer.loadFile("track1.sid");
    ymplayer.loadFile("track2.ymd");
    
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
 
    readjpeg("/smallfs/image.jpg");   
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
                menuReset();
                menuShowTop();
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

// Assign human-readable names to some common 16-bit color values:
#define	BLACK   0x0000
#define	BLUE    0x001F
#define	RED     0xF800
#define	GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#define min(x,y) ((x)>(y) ? (y):(x))

void test()
{
  Serial.println(F("Benchmark                Time (microseconds)"));

  Serial.print(F("Screen fill              "));
  Serial.println(testFillScreen());
  delay(500);

  Serial.print(F("Text                     "));
  Serial.println(testText());
  delay(3000);

  Serial.print(F("Lines                    "));
  Serial.println(testLines(CYAN));
  delay(500);

  Serial.print(F("Horiz/Vert Lines         "));
  Serial.println(testFastLines(RED, BLUE));
  delay(500);

  Serial.print(F("Rectangles (outline)     "));
  Serial.println(testRects(GREEN));
  delay(500);

  Serial.print(F("Rectangles (filled)      "));
  Serial.println(testFilledRects(YELLOW, MAGENTA));
  delay(500);

  Serial.print(F("Circles (filled)         "));
  Serial.println(testFilledCircles(10, MAGENTA));

  Serial.print(F("Circles (outline)        "));
  Serial.println(testCircles(10, WHITE));
  delay(500);

  Serial.print(F("Triangles (outline)      "));
  Serial.println(testTriangles());
  delay(500);

  Serial.print(F("Triangles (filled)       "));
  Serial.println(testFilledTriangles());
  delay(500);

  Serial.print(F("Rounded rects (outline)  "));
  Serial.println(testRoundRects());
  delay(500);

  Serial.print(F("Rounded rects (filled)   "));
  Serial.println(testFilledRoundRects());
  delay(500);

  Serial.println(F("Done!"));
}

unsigned long testFillScreen() {
  unsigned long start = micros();
  gfx.fillScreen(BLACK);
  gfx.fillScreen(RED);
  gfx.fillScreen(GREEN);
  gfx.fillScreen(BLUE);
  gfx.fillScreen(BLACK);
  return micros() - start;
}

unsigned long testText() {
  gfx.fillScreen(BLACK);
  unsigned long start = micros();
  gfx.setCursor(0, 0);
  gfx.setTextColor(WHITE);  gfx.setTextSize(1);
  gfx.println("Hello World!");
  gfx.setTextColor(YELLOW); gfx.setTextSize(2);
  gfx.println(1234.56);
  gfx.setTextColor(RED);    gfx.setTextSize(3);
  gfx.println(0xDEADBEEF, HEX);
  gfx.println();
  gfx.setTextColor(GREEN);
  gfx.setTextSize(5);
  gfx.println("Groop");
  gfx.setTextSize(2);
  gfx.println("I implore thee,");
  gfx.setTextSize(1);
  gfx.println("my foonting turlingdromes.");
  gfx.println("And hooptiously drangle me");
  gfx.println("with crinkly bindlewurdles,");
  gfx.println("Or I will rend thee");
  gfx.println("in the gobberwarts");
  gfx.println("with my blurglecruncheon,");
  gfx.println("see if I don't!");
  return micros() - start;
}

unsigned long testLines(uint16_t color) {
  unsigned long start, t;
  int           x1, y1, x2, y2,
                w = gfx.width(),
                h = gfx.height();

  gfx.fillScreen(BLACK);

  x1 = y1 = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  t     = micros() - start; // fillScreen doesn't count against timing

  gfx.fillScreen(BLACK);

  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  gfx.fillScreen(BLACK);

  x1    = 0;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  gfx.fillScreen(BLACK);

  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) gfx.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) gfx.drawLine(x1, y1, x2, y2, color);

  return micros() - start;
}

unsigned long testFastLines(uint16_t color1, uint16_t color2) {
  unsigned long start;
  int           x, y, w = gfx.width(), h = gfx.height();

  gfx.fillScreen(BLACK);
  start = micros();
  for(y=0; y<h; y+=5) gfx.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) gfx.drawFastVLine(x, 0, h, color2);

  return micros() - start;
}

unsigned long testRects(uint16_t color) {
  unsigned long start;
  int           n, i, i2,
                cx = gfx.width()  / 2,
                cy = gfx.height() / 2;

  gfx.fillScreen(BLACK);
  n     = min(gfx.width(), gfx.height());
  start = micros();
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    gfx.drawRect(cx-i2, cy-i2, i, i, color);
  }

  return micros() - start;
}

unsigned long testFilledRects(uint16_t color1, uint16_t color2) {
  unsigned long start, t = 0;
  int           n, i, i2,
                cx = gfx.width()  / 2 - 1,
                cy = gfx.height() / 2 - 1;

  gfx.fillScreen(BLACK);
  n = min(gfx.width(), gfx.height());
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    start = micros();
    gfx.fillRect(cx-i2, cy-i2, i, i, color1);
    t    += micros() - start;
    // Outlines are not included in timing results
    gfx.drawRect(cx-i2, cy-i2, i, i, color2);
  }

  return t;
}

unsigned long testFilledCircles(uint8_t radius, uint16_t color) {
  unsigned long start;
  int x, y, w = gfx.width(), h = gfx.height(), r2 = radius * 2;

  gfx.fillScreen(BLACK);
  start = micros();
  for(x=radius; x<w; x+=r2) {
    for(y=radius; y<h; y+=r2) {
      gfx.fillCircle(x, y, radius, color);
    }
  }

  return micros() - start;
}

unsigned long testCircles(uint8_t radius, uint16_t color) {
  unsigned long start;
  int           x, y, r2 = radius * 2,
                w = gfx.width()  + radius,
                h = gfx.height() + radius;

  // Screen is not cleared for this one -- this is
  // intentional and does not affect the reported time.
  start = micros();
  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      gfx.drawCircle(x, y, radius, color);
    }
  }

  return micros() - start;
}

unsigned long testTriangles() {
  unsigned long start;
  int           n, i, cx = gfx.width()  / 2 - 1,
                      cy = gfx.height() / 2 - 1;

  gfx.fillScreen(BLACK);
  n     = min(cx, cy);
  start = micros();
  for(i=0; i<n; i+=5) {
    gfx.drawTriangle(
      cx    , cy - i, // peak
      cx - i, cy + i, // bottom left
      cx + i, cy + i, // bottom right
      gfx.buildColor(0, 0, i));
  }

  return micros() - start;
}

unsigned long testFilledTriangles() {
  unsigned long start, t = 0;
  int           i, cx = gfx.width()  / 2 - 1,
                   cy = gfx.height() / 2 - 1;

  gfx.fillScreen(BLACK);
  start = micros();
  for(i=min(cx,cy); i>10; i-=5) {
    start = micros();
    gfx.fillTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      gfx.buildColor(0, i, i));
    t += micros() - start;
    gfx.drawTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      gfx.buildColor(i, i, 0));
  }

  return t;
}

unsigned long testRoundRects() {
  unsigned long start;
  int           w, i, i2,
                cx = gfx.width()  / 2 - 1,
                cy = gfx.height() / 2 - 1;

  gfx.fillScreen(BLACK);
  w     = min(gfx.width(), gfx.height());
  start = micros();
  for(i=0; i<w; i+=6) {
    i2 = i / 2;
    gfx.drawRoundRect(cx-i2, cy-i2, i, i, i/8, gfx.buildColor(i, 0, 0));
  }

  return micros() - start;
}

unsigned long testFilledRoundRects() {
  unsigned long start;
  int           i, i2,
                cx = gfx.width()  / 2 - 1,
                cy = gfx.height() / 2 - 1;

  gfx.fillScreen(BLACK);
  start = micros();
  for(i=min(gfx.width(), gfx.height()); i>20; i-=6) {
    i2 = i / 2;
    gfx.fillRoundRect(cx-i2, cy-i2, i, i, i/8, gfx.buildColor(0, i, 0));
  }

  return micros() - start;
}
