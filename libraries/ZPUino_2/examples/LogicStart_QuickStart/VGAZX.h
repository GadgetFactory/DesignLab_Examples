#ifndef __VGAZX_H__
#define __VGAZX_H__

#include "Arduino.h"
#include <SmallFS.h>

// This converts a attrbuffer offset to a framebuffer offset

#define ATTRBUFFER_OFFSET_TO_FRAMEBUFFER_OFFSET(x)  \
	( ( (x) &0x1F) /* X offset */ + (((x)<<3) & ~0xFF) )

// Our main framebuffer

#define VGA_COLUMNS 32
#define VGA_ROWS 24
#define RWIDTH VGA_COLUMNS*8

class VGAZX_class: public Print
{
public:
	void begin(unsigned int slot=8);
	static inline unsigned char *framebuffer() { return &z_framebuffer[0]; }
    static inline unsigned char *framebuffer(int x,int y) { return &z_framebuffer[x+(y*VGA_COLUMNS)]; }
	static inline unsigned char *pallete() { return &z_pallete[0]; }
    static inline unsigned char *pallete(int x,int y) { return &z_pallete[x+(y*VGA_COLUMNS)]; }
	static void clrscr();
	virtual size_t write(uint8_t v);
	static void textMoveTo(int x, int y);
	static void drawLine(int x0, int y0, int x1, int y1);
	static int drawsprite(const unsigned char *source, unsigned char*dest,bool check_collision, bool isxor=false);
	static void drawblock(const unsigned char *source, unsigned char *dest);
	static int sprite_collides(const unsigned char *source, unsigned char*dest);
	static inline void putPixel(int x,int y) { z_framebuffer[y*VGA_COLUMNS+x/8]|=0x80>>(x%8); }
	static void pctext(const char *text);
	static void loadscr(SmallFSFile &);
protected:

	static inline void blit8x8(unsigned char value, void*)
	{
		z_framebuffer[tptr]=value;
		tptr+=VGA_COLUMNS;
	}

	static inline void putChar(unsigned char value)
	{
		zxrom.seek( (value*8) + 0x3C00,SEEK_SET);
		zxrom.readCallback(8, &blit8x8, NULL);
		tptr-=((8*VGA_COLUMNS));
	}

	static inline void putString(const char *p)
	{
		while (*p) {
			putChar(*p++);
			tptr++;
			if ((tptr % VGA_COLUMNS)==0) {
				tptr+=(8*VGA_COLUMNS);
			}
		}
	}


	static void generic_copy_from_flash(unsigned offset, unsigned char *target, unsigned size);


	static unsigned char z_framebuffer[32*24*8];
	static unsigned char z_pallete[32*24];

	static SmallFSFile zxrom;
	static unsigned tptr; /* Text pointer */
};

extern VGAZX_class VGAZX;

#endif
