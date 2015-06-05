#include "godofredo.h"
#include "wiichuck.h"
#include "mvfilter.h"
#include "panel.h"
//#include "dualpanel.h"
#include "Adafruit_GFX.h"
//#include "gfxframebuffer.h"
#include "wiipositioner.h"
//#include "wiipositionerdyn.h"
#include "menus.h"

#include <SD.h>
#include <SigmaDelta.h>
#include <SPI.h>

#include "audio.h"
#include "AlvieGFX.h"

extern void ball_setup();
extern void ball_demo();
extern void ball_demo_loop();
extern void ball_calibrate();
extern void camera_setup();
extern void setCamera(int x, int y);
extern int getCameraMax();
extern int getCameraMin();

enum { NONE, BALL, VIDEO } currentMode;


RGBPanel_class RGBPanel;
//GFXFramebuffer_class GFXFrameBuffer;
//DynPositioner_class cameraPositioner;


#if 0
const unsigned char linearTable[256] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3,
    3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5,
    5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7, 7,
    7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 10, 10,
    10, 11, 11, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 14, 14, 15,
    15, 16, 16, 16, 17, 17, 17, 18, 18, 19, 19, 20, 20, 20, 21, 21,
    22, 22, 23, 23, 24, 25, 25, 26, 26, 27, 27, 28, 29, 29, 30, 31,
    31, 32, 33, 34, 34, 35, 36, 37, 38, 38, 39, 40, 41, 42, 43, 44,
    45, 46, 47, 48, 49, 50, 51, 52, 54, 55, 56, 57, 59, 60, 61, 63,
    64, 65, 67, 68, 70, 72, 73, 75, 76, 78, 80, 82, 83, 85, 87, 89,
    91, 93, 95, 97, 99, 102, 104, 106, 109, 111, 114, 116, 119, 121, 124, 127,
    129, 132, 135, 138, 141, 144, 148, 151, 154, 158, 161, 165, 168, 172, 176, 180,
    184, 188, 192, 196, 201, 205, 209, 214, 219, 224, 229, 234, 239, 244, 249, 255
};

#else

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

#endif


unsigned linearize(unsigned value)
{
    return linearTable[value&0xff];
}


AudioPlayer audioPlayer;



int minx, miny, maxx, maxy;


MovingAverageFilter<unsigned,1024> xfilter,yfilter;

#define SHIFTPOS 5
#define DEADZONE 5 /* Joy dead zone */

static int xpos;
static int ypos;

static int centerx,centery; // Joy center
static int camoffset;

/* Menu stuff */
static bool menuVisible = false;

void onVideo(void *p)
{
    Serial.println("Video");
    currentMode = VIDEO;
    videoStart();
    RGBPanel.clear();
    exitMenus(p);
    RGBPanel.apply();
}

void onBricks(void*p)
{
    currentMode = BALL;
    ball_setup();
    exitMenus(p);
}

void exitMenus(void *a)
{
    menuExit();
    menuVisible=false;
    RGBPanel.setApplyEnabled(true);
}


void showMenu()
{
    menuReset();
    menuVisible=true;
    menuShowTop();
}

static void createMenus()
{
    subMenu *config = new subMenu("Opcoes");

    subMenu *modo = new subMenu("Modo");
    config->appendChild(modo);
    modo->setParent(config);

    modo->appendChild( new menuItem("Video", &onVideo) );
    modo->appendChild( new menuItem("Bricks", &onBricks)) ;
    modo->appendChild( new menuItem("SoundPuddle",&onVideo) ) ;
    modo->appendChild( new menuItem("< Voltar",(void(*)(void*))&menuSwitchTo, config) ) ;

    subMenu *controle = new subMenu("Controle");
    config->appendChild(controle);
    controle->setParent(config);
    controle->appendChild( new menuItem("< Voltar",(void(*)(void*))&menuSwitchTo, config) ) ;

    config->appendChild( new menuItem("Sair",(void(*)(void*))&exitMenus) ) ;

    menuSetTop(config);
}


void setup() {
  // put your setup code here, to run once:
  int index;
  //Serial.begin(3000000);
  Serial.begin(250000);
  //Serial1.begin(460800);
  Serial.println("Hello");

  RGBPanel.begin();
  RGBPanel.clear();
  RGBPanel.setApplyEnabled(true);

  WIIChuck.begin();
  WIIChuck.init_nunchuck();

//  camera_setup();
//  camoffset = getCameraMin();
//
//  cameraPositioner.begin( getCameraMax()-camoffset,
//                          getCameraMax()-camoffset);
  createMenus();
  menuInit();

  // Setup SPI for SD card.
//  SPI.begin(
//            MOSI(WING_C_3), // 11
//            MISO(WING_C_1), // 9
//            SCK(WING_C_2) // 10
//           );
//
//  SPI.setClockDivider(SPI_CLOCK_DIV2);
//
//  Serial1.setPins( TX(WING_B_1), RX(WING_B_0) );
//
//  pinMode(FPGA_LED_PIN,OUTPUT);

  RGBPanel.setTextColor(0x808000);
  RGBPanel.setTextWrap(false);

  WIIChuck.update();
  RGBPanel.setTextSize(1);

  WIIChuck.update();


  centerx = WIIChuck.getJoyX();
  centery = WIIChuck.getJoyY();

  ball_calibrate();
  //cameraPositioner.calibrate();

  unsigned pos=WIDTH-1;

  while (!WIIChuck.getCButton()) {
      //WIIChuck.update();
      RGBPanel.clear();
      RGBPanel.setCursor(pos,0);
      RGBPanel.print("Move your ");
      RGBPanel.setCursor(pos,8);
      RGBPanel.print("WII Chuck ");
      RGBPanel.apply();
      delay(5);
      if (pos>2)
          pos--;
      else
          break;
  }

  while (!WIIChuck.getCButton()) {
      WIIChuck.update();
//      cameraPositioner.updateData();
//
//      // Move camera
//      setCamera( camoffset+cameraPositioner.getX(),
//                 camoffset+cameraPositioner.getY());

      RGBPanel.setCursor(0,16);

      RGBPanel.fillRect(0, 16, RGBPanel.width(), 16 + 8, 0);
      RGBPanel.print("Joy ");

      RGBPanel.setTextColor(0xff00ff);
      RGBPanel.print(WIIChuck.getJoyX());

      RGBPanel.setCursor(46,16);
      RGBPanel.setTextColor(0x008080);
      RGBPanel.print(WIIChuck.getJoyY());

      RGBPanel.fillRect(0, 24, RGBPanel.width(), 24 + 8, 0);
      RGBPanel.setCursor(0,24);

      RGBPanel.print("Acc ");

      int x = WIIChuck.getAccelX();
      int y = WIIChuck.getAccelY();
      int z = WIIChuck.getAccelZ();

      RGBPanel.print(x);

      RGBPanel.apply();
  }

  xpos = (RGBPanel.width()/2)<<SHIFTPOS;
  ypos = (RGBPanel.height()/2)<<SHIFTPOS;

  //currentMode = BALL;

}

unsigned random()
{
    return TIMERTSC;
}

static const int colors[8] = {
    0x300000,
    0x003000,
    0x000030,
    0x003030,
    0x300030,
    0x303000,
    0x300000,
    0x003000
};

static const int colors_lighter[8] = {
    0xA00000,
    0x00A000,
    0x0000A0,
    0x00A0A0,
    0xA000A0,
    0xA0A000,
    0xA00000,
    0x00A000
};




// Accelerometer test
extern unsigned int hsvtable[256];




void oldloop() {
    static int mode = 0;
    static unsigned frame = 0;


  //  videoLoop();
#if 0
    for (int x=0;x<96;x++)
        for (int y=0;y<64;y++) {
            RGBPanel.setPixel(x, y, x<<1, x<<1, x<<1);
        }
    RGBPanel.setPixel(0,1,255,255,0);
    RGBPanel.apply();
    while (1);
#endif

#if 0
    set(image1);
    apply();
    delay(200);
    set(image2);
    apply();
    delay(200);
#endif
    static int r=0,g=0,b=0;

    WIIChuck.update();
    printf("Chuck: %d %d buttons %d %d\n",
           WIIChuck.getJoyX(),
           WIIChuck.getJoyY(),
           WIIChuck.getZButton(),
           WIIChuck.getCButton());

    switch (WIIChuck.getButtons()) {
    case BUTTON_C:
        RGBPanel.setImage(godofredo_image);
        break;
    case BUTTON_ZC:
        r = linearize(WIIChuck.getJoyX());
        g = linearize(WIIChuck.getJoyY());
        RGBPanel.clear( (r<<16) + (g<<8) + b);
        break;
    default:
        RGBPanel.clear( 0x0 );
        {
#if 1
            int jx = (int)WIIChuck.getJoyX() - centerx;
            int jy = centery - (int)WIIChuck.getJoyY();

            if (jx>DEADZONE || jx<-DEADZONE) {
                xpos+=jx;
            }

            if (jy>DEADZONE|| jy<-DEADZONE) {
                ypos+=jy;
            }

            if (xpos<0)
                xpos=0;

            if (ypos<0)
                ypos=0;

            if (xpos>=WIDTH<<SHIFTPOS)
                xpos =(WIDTH<<SHIFTPOS)-1;

            if (ypos>=HEIGHT<<SHIFTPOS)
                ypos =(HEIGHT<<SHIFTPOS)-1;
#endif
            RGBPanel.drawPixel(xpos>>SHIFTPOS,
                               ypos>>SHIFTPOS, 0xdeadbe);
            printf("X %d Y %d\n", xpos,ypos);
            printf("jX %d jY %d\n", jx,jy);
        }
        break;
    case BUTTON_Z:
#if 0
        if ((frame & 1) ==0) {
            RGBPanel.clear( 0x0 );
            {
                int x = WIIChuck.getAccelX();
                x =xfilter.push(x);
                int y = WIIChuck.getAccelY();
                y = yfilter.push(y);
                x-=512;
                x/=(128/WIDTH);
                y-=512;
                y/=(128/HEIGHT);
                if (x<0) x=0;
                if (y<0) y=0;
                if (x>=WIDTH) x=WIDTH-1;
                if (y>=HEIGHT) y=HEIGHT-1;

                RGBPanel.drawPixel(x,y, 0x803080);
            }
        }
#else
        ball_demo();

        while (1) {
            //Serial.println("In ball demo");
            ball_demo_loop();
        }

#if 1
        audioPlayer.begin();
        audioPlayer.open();
        audioPlayer.play();
#endif

        //videoLoop();
        //mBlocks.start();
        //mBlocks.go();
#endif
        break;
    }
    RGBPanel.apply();
    frame++;
}

void displayLoop()
{
    switch (currentMode) {
    case BALL:
        ball_demo_loop();
        break;
    case VIDEO:
        videoLoop();

    default:
        break;
    }
}


void loop()
{
    static int accumul = 0;
    static int button = 0;
    static int frame=0;
    static unsigned lastcheck=TIMERTSC;
    unsigned now;

    frame++;
    if (frame&1) delay(10);
    if (currentMode==VIDEO) {
        unsigned delta;
        now = TIMERTSC;
        displayLoop();

        if (now<lastcheck) {
            delta=lastcheck-now;
        } else {
            delta=now-lastcheck;
        }
        if (delta<(96000000/4))
            return;
    }


    WIIChuck.update();
    lastcheck=TIMERTSC;
    //showMenu();

    if (currentMode==VIDEO && menuVisible==false) {
//        cameraPositioner.updateData();
//
//        setCamera( camoffset+cameraPositioner.getX(),
//                  camoffset+cameraPositioner.getY());
    }

    switch (WIIChuck.getButtons()) {
    case BUTTON_Z:
        if (button==0) {
            if (menuVisible) {
                menuAction();
                Serial.println("Menu Action");
            } else {
                showMenu();
                Serial.println("Show Menu");
                RGBPanel.setApplyEnabled(false);
            }
        }
        button=1;
        break;
    case BUTTON_ZC:
        button=1;
        //exitMenus(NULL);
        break;
    default:
        button=0;
        break;
    }
    if (menuVisible) {
        int delta = (int)WIIChuck.getJoyY() - centery;

        if (delta>DEADZONE || delta<-DEADZONE) {
            accumul+=delta;
            //Serial.println(accumul);
            if (accumul<-100) {
                moveMenuDown();
                accumul=0;
            } else if (accumul>100) {
                moveMenuUp();
                accumul=0;
            }
        }

        updateMenus();
    } else {
        displayLoop();
    }
}

static void framebufferChanged()
{
    RGBPanel.apply();
}

#define HDLC_frameFlag 0x7E
#define HDLC_escapeFlag 0x7D
#define HDLC_escapeXOR 0x20

int syncSeen;
int unescaping;
int bufferpos;

//#define VIDEOFRAMESIZE 96*64*3
#define VIDEOFRAMESIZE 32*32*3

unsigned char buffer[VIDEOFRAMESIZE+16];

inline int inbyte()
{
    while (!Serial.available());
    return Serial.read();
}

static int cnt=0;

#define CORRECT 1

static void processFrame(unsigned char *buf,int size)
{
    int x,y;
    unsigned char frametype;
    bool needCorrection = false;


    /* We might have several kind of frames. */
    frametype = *buf++;
    size--;

    switch (frametype) {
    case 1: /* Uncorrected video frame */
        needCorrection = true;
        /* Fallback... */
    case 0: /* Corrected video frame */
        cnt++;
        //digitalWrite(FPGA_LED_PIN, cnt&1);

        if (size==VIDEOFRAMESIZE) {

            for (y=0;y<RGBPanel.height();y++) {
                for (x=0;x<RGBPanel.width(); x++) {
                    unsigned char r=*buf++;
                    unsigned char g=*buf++;
                    unsigned char b=*buf++;
                    if (needCorrection) {
                        RGBPanel.setPixel(x,y,r,g,b);
                    } else {
                        unsigned int v = b + (g<<8) + (r<<16);
                        RGBPanel.setPixelRaw(x,y,v);
                    }
                }
            }
        }
        framebufferChanged();


        break;
    default:
        /* Ignore frame */
        break;
    }
}

static void videoStart()
{
    syncSeen = 0;
    unescaping = 0;
    bufferpos=0;
}

static void videoLoop() {

    while (Serial.available()) {
        int i;
        i = inbyte();
        if (syncSeen) {
            if (i==HDLC_frameFlag) {
                if (bufferpos>0) {
                    syncSeen=0;
                    processFrame(buffer, bufferpos);
                    bufferpos=0;
                }
            } else if (i==HDLC_escapeFlag) {
                unescaping=1;
            } else if (bufferpos<sizeof(buffer)) {
                if (unescaping) {
                    unescaping=0;
                    i^=HDLC_escapeXOR;
                }
                buffer[bufferpos++]=i;
            } else {
                syncSeen=0;
            }
        } else {
            if (i==HDLC_frameFlag) {
                bufferpos=0;
                syncSeen=1;
                unescaping=0;
            }
        }
    }
}

