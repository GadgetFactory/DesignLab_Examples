/*
 Gadget Factory
 Template to make your own Schematic Symbol and Community Core Library for the Papilio FPGA and DesignLab

 To use this sketch do the following steps:
  1) 
  
 Tools for generating your own libraries:
 

 Tutorials:
   http://learn.gadgetfactory.net
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  

 created 2015
 by Alavaro Lopes
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define circuit VGA_640_480
#include <SmallFS.h>
#include <Adafruit_GFX.h>

using namespace ZPUino;

class Font
{
public:
    Font() { data=NULL; }
    virtual ~Font() {}
    virtual unsigned getWidth() const = 0;
    virtual unsigned getHeight() const = 0;
    virtual int getBytesPerChar() const = 0;
    unsigned char *getChar(int c) {
        return data + (c*getBytesPerChar());
    }
    int getFontSize() const {
        return 256*getBytesPerChar();
    }
    unsigned char *data;
    unsigned char *getData() { return data; }
    int loadFromFile(const char *filename)
    {
        FILE *f = fopen(filename,"rb");
        if (NULL==f)
            return -1;
        data=(unsigned char*)malloc(getFontSize());
        fread(data,getFontSize(),1,f);
        fclose(f);
        return 0;
    }
};

class HDMI_class: public BaseDevice, public Adafruit_GFX
{
    int buffered;
public:
    HDMI_class(): Adafruit_GFX() {
        buffered=0;
        cbuf=0;
    }
    void begin() {
        if (deviceBegin(0x08, 0x1B)==0) {
            REG(0) = (unsigned)&framebuffers[0][0];
            Serial.println("Device is HDMI");
            memset(framebuffers,0,sizeof(framebuffers));
        }  else if (deviceBegin(0x08, 0x1A)==0) {
            REG(0) = (unsigned)&framebuffers[0][0];
            Serial.println("Device is VGA");
            memset(framebuffers,0,sizeof(framebuffers));
        } else {
            Serial.println("Device not found");
        }
        Adafruit_GFX::begin(640,480);
    }

    uint16_t *getFramebuffer() {
        return (uint16_t*)&framebuffers[cbuf ^ buffered][0];
    }

    uint16_t *getDisplayFramebuffer() {
        return (uint16_t*)&framebuffers[cbuf][0];
    }

    unsigned getFramebufferSizeBytes() const {
        return sizeof(framebuffers)/2;
    }

    uint16_t *getPosition(int x, int y) {
        return &getFramebuffer()[x + y*640];
    }

    void setPixel(unsigned x, unsigned y, uint16_t value) {
        if (x>639)
            x=639;
        if (y>479)
            y=479;
        getFramebuffer()[x + y*640] = value;
    }

    void putChar(int x, int y, int c, Font &font)
    {
        c&=0xff;
        x*=font.getWidth();
        y*=font.getHeight();
        unsigned char *source = font.getChar(c);
        int i,z;
        for (i=0;i<font.getHeight();i++) {
            unsigned char v = *source++;
            for (z=0;z<font.getWidth();z++) {
                int set = !!(v &0x80);
                if (set) {
                    setPixel(x+z,y+i,0xffff);
                }
                v<<=1;
            }
        }
    }

    void putString(int x, int y, const char *c, Font &font)
    {
        while (*c) {
            putChar(x,y,*c,font);
            c++;
            x++;
            if (x> 640/font.getWidth()) {
                y++,x=0;
            }
        }
    }
    void syncVBlank()
    {
        while (!(REG(0)&1));
        /* Now, wait for vblank */
        while (REG(0)&1);
    }

    void clearArea(int sx, int sy, int w, int h, uint16_t color)
    {
        uint16_t *dest = getFramebuffer();
        dest+=sx+(sy*640);
        while (h--) {
            int z = w;
            while (z--) {
                *dest++=color;
            }
            /* Move dest forward, to next line */
            dest+=640-w;
            sy++;
        }
    }
    void setBuffered()
    {
        buffered=1;
    }

    int cbuf;
    uint32_t framebuffers[2][640*480/2];

    void swapBuffers() {
        cbuf++;
        cbuf&=1;
        REG(0) = (unsigned)&framebuffers[cbuf][0];
    }

    void swapBuffersAndCopy() {
        swapBuffers();
        syncVBlank();
        /* Copy old buffer into new buffer */
        memcpy( getFramebuffer(), getDisplayFramebuffer(), 640*480*2 );
    }

    virtual void drawPixel(int x, int y, unsigned color) {
        setPixel(x,y,color);
    }
    uint16_t color565(unsigned r, unsigned g, unsigned b)
    {
        r   <<=2; r   &= (0x1f<<5);
        g   <<=7; g   &= (0x1f<<10);
        b    >>=3;
        b+=g;
        b+=r;
        return b;
    }


};

HDMI_class HDMI;

// Assign human-readable names to some common 16-bit color values:
#define	BLACK   0x0000
#define	BLUE    0x001F
#define	RED     0xF800
#define	GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#define F(X) X
#define min(x,y) ((x)>(y) ? (y):(x))

void setup(void) {
    Serial.begin(115200);
    Serial.println(F("TFT LCD test"));

  HDMI.begin();

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

void loop(void) {
  for(uint8_t rotation=0; rotation<4; rotation++) {
    HDMI.setRotation(rotation);
    testText();
    delay(2000);
  }
}

unsigned long testFillScreen() {
  unsigned long start = micros();
  HDMI.fillScreen(BLACK);
  HDMI.fillScreen(RED);
  HDMI.fillScreen(GREEN);
  HDMI.fillScreen(BLUE);
  HDMI.fillScreen(BLACK);
  return micros() - start;
}

unsigned long testText() {
  HDMI.fillScreen(BLACK);
  unsigned long start = micros();
  HDMI.setCursor(0, 0);
  HDMI.setTextColor(WHITE);  HDMI.setTextSize(1);
  HDMI.println("Hello World!");
  HDMI.setTextColor(YELLOW); HDMI.setTextSize(2);
  HDMI.println(1234.56);
  HDMI.setTextColor(RED);    HDMI.setTextSize(3);
  HDMI.println(0xDEADBEEF, HEX);
  HDMI.println();
  HDMI.setTextColor(GREEN);
  HDMI.setTextSize(5);
  HDMI.println("Groop");
  HDMI.setTextSize(2);
  HDMI.println("I implore thee,");
  HDMI.setTextSize(1);
  HDMI.println("my foonting turlingdromes.");
  HDMI.println("And hooptiously drangle me");
  HDMI.println("with crinkly bindlewurdles,");
  HDMI.println("Or I will rend thee");
  HDMI.println("in the gobberwarts");
  HDMI.println("with my blurglecruncheon,");
  HDMI.println("see if I don't!");
  return micros() - start;
}

unsigned long testLines(uint16_t color) {
  unsigned long start, t;
  int           x1, y1, x2, y2,
                w = HDMI.width(),
                h = HDMI.height();

  HDMI.fillScreen(BLACK);

  x1 = y1 = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  t     = micros() - start; // fillScreen doesn't count against timing

  HDMI.fillScreen(BLACK);

  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  HDMI.fillScreen(BLACK);

  x1    = 0;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  HDMI.fillScreen(BLACK);

  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) HDMI.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) HDMI.drawLine(x1, y1, x2, y2, color);

  return micros() - start;
}

unsigned long testFastLines(uint16_t color1, uint16_t color2) {
  unsigned long start;
  int           x, y, w = HDMI.width(), h = HDMI.height();

  HDMI.fillScreen(BLACK);
  start = micros();
  for(y=0; y<h; y+=5) HDMI.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) HDMI.drawFastVLine(x, 0, h, color2);

  return micros() - start;
}

unsigned long testRects(uint16_t color) {
  unsigned long start;
  int           n, i, i2,
                cx = HDMI.width()  / 2,
                cy = HDMI.height() / 2;

  HDMI.fillScreen(BLACK);
  n     = min(HDMI.width(), HDMI.height());
  start = micros();
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    HDMI.drawRect(cx-i2, cy-i2, i, i, color);
  }

  return micros() - start;
}

unsigned long testFilledRects(uint16_t color1, uint16_t color2) {
  unsigned long start, t = 0;
  int           n, i, i2,
                cx = HDMI.width()  / 2 - 1,
                cy = HDMI.height() / 2 - 1;

  HDMI.fillScreen(BLACK);
  n = min(HDMI.width(), HDMI.height());
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    start = micros();
    HDMI.fillRect(cx-i2, cy-i2, i, i, color1);
    t    += micros() - start;
    // Outlines are not included in timing results
    HDMI.drawRect(cx-i2, cy-i2, i, i, color2);
  }

  return t;
}

unsigned long testFilledCircles(uint8_t radius, uint16_t color) {
  unsigned long start;
  int x, y, w = HDMI.width(), h = HDMI.height(), r2 = radius * 2;

  HDMI.fillScreen(BLACK);
  start = micros();
  for(x=radius; x<w; x+=r2) {
    for(y=radius; y<h; y+=r2) {
      HDMI.fillCircle(x, y, radius, color);
    }
  }

  return micros() - start;
}

unsigned long testCircles(uint8_t radius, uint16_t color) {
  unsigned long start;
  int           x, y, r2 = radius * 2,
                w = HDMI.width()  + radius,
                h = HDMI.height() + radius;

  // Screen is not cleared for this one -- this is
  // intentional and does not affect the reported time.
  start = micros();
  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      HDMI.drawCircle(x, y, radius, color);
    }
  }

  return micros() - start;
}

unsigned long testTriangles() {
  unsigned long start;
  int           n, i, cx = HDMI.width()  / 2 - 1,
                      cy = HDMI.height() / 2 - 1;

  HDMI.fillScreen(BLACK);
  n     = min(cx, cy);
  start = micros();
  for(i=0; i<n; i+=5) {
    HDMI.drawTriangle(
      cx    , cy - i, // peak
      cx - i, cy + i, // bottom left
      cx + i, cy + i, // bottom right
      HDMI.color565(0, 0, i));
  }

  return micros() - start;
}

unsigned long testFilledTriangles() {
  unsigned long start, t = 0;
  int           i, cx = HDMI.width()  / 2 - 1,
                   cy = HDMI.height() / 2 - 1;

  HDMI.fillScreen(BLACK);
  start = micros();
  for(i=min(cx,cy); i>10; i-=5) {
    start = micros();
    HDMI.fillTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      HDMI.color565(0, i, i));
    t += micros() - start;
    HDMI.drawTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      HDMI.color565(i, i, 0));
  }

  return t;
}

unsigned long testRoundRects() {
  unsigned long start;
  int           w, i, i2,
                cx = HDMI.width()  / 2 - 1,
                cy = HDMI.height() / 2 - 1;

  HDMI.fillScreen(BLACK);
  w     = min(HDMI.width(), HDMI.height());
  start = micros();
  for(i=0; i<w; i+=6) {
    i2 = i / 2;
    HDMI.drawRoundRect(cx-i2, cy-i2, i, i, i/8, HDMI.color565(i, 0, 0));
  }

  return micros() - start;
}

unsigned long testFilledRoundRects() {
  unsigned long start;
  int           i, i2,
                cx = HDMI.width()  / 2 - 1,
                cy = HDMI.height() / 2 - 1;

  HDMI.fillScreen(BLACK);
  start = micros();
  for(i=min(HDMI.width(), HDMI.height()); i>20; i-=6) {
    i2 = i / 2;
    HDMI.fillRoundRect(cx-i2, cy-i2, i, i, i/8, HDMI.color565(0, i, 0));
  }

  return micros() - start;
}




