#ifndef __HQVGA_H__
#define __HQVGA_H__

#if defined(ZPU)


#include <Arduino.h>
#include <zpuino-types.h>
#include <zpuino.h>

#define INTVAL(x) \
struct x {                             \
    explicit x(int i):v(i){};          \
    inline operator int () { return v; } \
private:                               \
    x &operator=(int v);               \
    int v;                             \
}
 INTVAL(VGAWISHBONESLOT);
 INTVAL(CHARMAPWISHBONESLOT);

#define VGABASE IO_SLOT(9)

const unsigned int VGA_HSIZE = 160;
const unsigned int VGA_VSIZE = 120;

#define BYTES_PER_PIXEL 1
#define COLOR_WEIGHT_R 3
#define COLOR_WEIGHT_G 3
#define COLOR_WEIGHT_B 2


#define COLOR_SHIFT_R (COLOR_WEIGHT_B+COLOR_WEIGHT_G)
#define COLOR_SHIFT_G (COLOR_WEIGHT_B)
#define COLOR_SHIFT_B 0


#define CHARRAMBASE IO_SLOT(10)
#define VGAPTR REGISTER(VGABASE,0);
#define CHARRAMPTR REGISTER(CHARRAMBASE,0);

typedef volatile unsigned int *vgaptr_t;
typedef volatile unsigned int *charptr_t;



#elif defined(__linux__)

#include "vga-linux.h"
#include <unistd.h>

typedef MemProxy vgaptr_t;
typedef MemProxy charptr_t;
inline vgaptr_t getVgaMem() {
	return MemProxy(vga);
}

inline vgaptr_t getCharRam() {
	return MemProxy(charram);
}

#else
#error No support
#endif


class VGA_class {
public:
	VGA_class(): blitpos(getBasePointer()) {};

#if BYTES_PER_PIXEL == 1
	typedef unsigned char pixel_t;
#elif BYTES_PER_PIXEL == 2
	typedef unsigned short pixel_t;
#endif


	inline unsigned int getHSize() const { return VGA_HSIZE; }
	inline unsigned int getVSize() const { return VGA_VSIZE; }

	void readArea(int x, int y, int width, int height, pixel_t *dest);
	void writeArea(int x, int y, int width, int height, pixel_t *source);

	void setColor(pixel_t color)
	{
		fg=color;
	}

	void setBackgroundColor(pixel_t color)
	{
        bg=color;
	}

	inline void putPixel(int x, int y)
	{
		*(getBasePointer(x,y)) = fg;
	}

	pixel_t getPixel(int x, int y)
	{
		return *(getBasePointer(x,y));
	}

	inline void putPixel(int x, int y, pixel_t color)
	{
		*(getBasePointer(x,y)) = color;
	}

	inline void setColor(unsigned r, unsigned g, unsigned b)
	{
		setColor(r<<COLOR_SHIFT_R | g<<COLOR_SHIFT_G | b);
	}

	void drawRect(unsigned x, unsigned y, unsigned width, unsigned height);

	void clearArea(unsigned x, unsigned y, unsigned width, unsigned height);

	void printchar(unsigned int x, unsigned int y, unsigned char c, bool trans=false);
	void printtext(unsigned x, unsigned y, const char *text, bool trans=false);

	void clear();
	
	void begin(VGAWISHBONESLOT vgaslot, CHARMAPWISHBONESLOT charslot);
	//void begin(int vgaslot, int charslot);

	void moveArea(unsigned x, unsigned y, unsigned width, unsigned height, unsigned tx, unsigned ty);

	void blitStreamInit(int x, int y, int w);
	void blitStreamAppend(unsigned char c);
	static void blitStream(unsigned char c, void *data) {
		VGA_class*me=static_cast<VGA_class*>(data);
		me->blitStreamAppend(c);
	}
    void drawLine(int x0,int y0,int x1,int y1);
	vgaptr_t getVgaMem();
	vgaptr_t getCharRam();
	vgaptr_t getBasePointer();
	vgaptr_t getBasePointer(unsigned x, unsigned y);
	vgaptr_t getCharacterBasePointer();

protected:
	vgaptr_t blitpos;
	int blitw,cblit;
	pixel_t fg,bg;
	int charMapWishboneSlot;
	int vgaWishboneSlot;	
};

const VGA_class::pixel_t RED = (((1<<COLOR_WEIGHT_R)-1) << COLOR_SHIFT_R);
const VGA_class::pixel_t GREEN = (((1<<COLOR_WEIGHT_G)-1) << COLOR_SHIFT_G);
const VGA_class::pixel_t BLUE = (((1<<COLOR_WEIGHT_B)-1) << COLOR_SHIFT_B);
const VGA_class::pixel_t YELLOW = (RED|GREEN);
const VGA_class::pixel_t PURPLE = (RED|BLUE);
const VGA_class::pixel_t CYAN = (GREEN|BLUE);
const VGA_class::pixel_t WHITE = (RED|GREEN|BLUE);
const VGA_class::pixel_t BLACK = 0;

extern VGA_class VGA;

#endif
