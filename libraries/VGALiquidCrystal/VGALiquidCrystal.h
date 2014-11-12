#ifndef VGALiquidCrystal_h
#define VGALiquidCrystal_h

#include <HQVGA.h>
#include "Print.h"
#include <inttypes.h>

#define LCD_5x10DOTS 0x04
#define LCD_5x8DOTS 0x00

class VGALiquidCrystal : public Print {
public:
  VGALiquidCrystal(uint8_t rs, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
		uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
  VGALiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
		uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
  VGALiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3);
  VGALiquidCrystal(uint8_t rs, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3);

  void init(uint8_t fourbitmode, uint8_t rs, uint8_t rw, uint8_t enable,
	    uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
	    uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
    
  void begin(uint8_t cols, uint8_t rows, uint8_t charsize = LCD_5x8DOTS);

  void clear();
  void home();

  void noDisplay();
  void display();
  void noBlink();
  void blink();
  void noCursor();
  void cursor();
  void scrollDisplayLeft();
  void scrollDisplayRight();
  void leftToRight();
  void rightToLeft();
  void autoscroll();
  void noAutoscroll();

  void createChar(uint8_t, uint8_t[]);
  void setCursor(uint8_t, uint8_t); 
  virtual size_t write(uint8_t);
  void command(uint8_t);

  void blinkUpdate(int);
  void updateDisplay();
private:

	struct currentDisplayChars {
		unsigned char chr;
		uint8_t addr;
	} __attribute__((packed));

	struct currentDisplayChars currentDisplayChars[32];

	void setupInterrupt();

	void setCurrentDisplayChars();
	void initCurrentDisplayChars();

	void blankDisplay();

	void drawline(unsigned line, unsigned offset);
	void redrawAll();
	void clearDisplay();
	void scrollOne();
	void setDDRAddress(unsigned int);

	void scheduleUpdate();
	void updateCharAt(int);

	void send(uint8_t, uint8_t);
	void putcharat(uint8_t chr, int pos, bool reverse=false);

	unsigned char ddram[104];
	unsigned char cgram[64];
	int shiftChars;
	unsigned int AC;
	unsigned _cols; /* Number of columns */
	unsigned _lines; /* Number of lines */
	int increment;
	int displayRange;
	int _x0,_y0;

	int prevDDRAMadrCursAt;
	int cursorPosition;

	bool display_on, blink_on, cursor_on, scrool_on;
	bool need_update;

	static unsigned char chrtbl[2048];
};

#endif
