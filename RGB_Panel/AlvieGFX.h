#ifndef _ALVIE_GFX_H
#define _ALVIE_GFX_H

#include "Arduino.h"
#include "Print.h"

#define swap(a, b) { int t = a; a = b; b = t; }

#ifndef pgm_read_byte
#define pgm_read_byte(addr) (*(const unsigned char *)(addr))
#endif
extern const char *font;

class PixelIterator
{
};

class AlvieGFX : public Print {

 public:

  AlvieGFX(); // Constructor
  void begin(int w, int h);

  virtual PixelIterator getPI(int x, int y) = 0;

  void drawPixel(const PixelIterator &, unsigned int color);

  // These MAY be overridden by the subclass to provide device-specific
  // optimized code.  Otherwise 'generic' versions are used.
  virtual void
    drawLine(int x0, int y0, int x1, int y1, unsigned int color),
    drawFastVLine(int x, int y, int h, unsigned int color),
    drawFastHLine(int x, int y, int w, unsigned int color),
    drawRect(int x, int y, int w, int h, unsigned int color),
    fillRect(int x, int y, int w, int h, unsigned int color),
    fillScreen(unsigned int color),
    invertDisplay(boolean i);

  // These exist only with Adafruit_GFX (no subclass overrides)
  void
      drawCircle(int x0, int y0, int r, unsigned int color),
  drawCircleHelper(int x0, int y0, int r, uint8_t cornername,
                   unsigned int color),
  fillCircle(int x0, int y0, int r, unsigned int color),
  fillCircleHelper(int x0, int y0, int r, uint8_t cornername,
                   int delta, unsigned int color),
  drawTriangle(int x0, int y0, int x1, int y1,
                 int x2, int y2, unsigned int color),
  fillTriangle(int x0, int y0, int x1, int y1,
                 int x2, int y2, unsigned int color),
  drawRoundRect(int x0, int y0, int w, int h,
                  int radius, unsigned int color),
  fillRoundRect(int x0, int y0, int w, int h,
                  int radius, unsigned int color),
  drawBitmap(int x, int y, const uint8_t *bitmap,
               int w, int h, unsigned int color),
  drawChar(int x, int y, unsigned char c, unsigned int color,
             unsigned int bg, uint8_t size),
  setCursor(int x, int y),
  setTextColor(unsigned int c),
  setTextColor(unsigned int c, unsigned int bg),
  setTextSize(uint8_t s),
  setTextWrap(boolean w),
  setRotation(uint8_t r);

  virtual size_t write(uint8_t);

  // Return the size of the display (per current rotation)
  int width(void) const {
      return _width;
  }
 
  int height(void) const {
      return _height;
  }

  uint8_t getRotation(void);

 protected:
  int
    _WIDTH, _HEIGHT;   // This is the 'raw' display w/h - never changes
  int
    _width, _height, // Display w/h as modified by current rotation
    cursor_x, cursor_y;
  unsigned int
    textcolor, textbgcolor;
  uint8_t
    textsize,
    rotation;
  boolean
    wrap; // If set, 'wrap' text at right edge of display
};




#endif // _ADAFRUIT_GFX_H
