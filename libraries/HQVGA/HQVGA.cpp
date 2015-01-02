#include "HQVGA.h"
#include "HardwareSerial.h"

#define ABS(x) ((x)>0?(x):-1*(x))

void VGA_class::printchar(unsigned int x, unsigned int y, unsigned char c, bool trans)
{
	vgaptr_t vmem = getBasePointer(x,y);
	charptr_t vchar = getCharacterBasePointer();

	int i,j;
	unsigned int v;

	vchar += c << 3;

	for (i=0; i<8;i++) {
		v = *vchar;
		for (j=0; j<8;j++) {

			int rx,ry;
			rx = j;
			ry = i;

			/* Check bounds */
			if (rx>=0 && rx<(int)getHSize() && ry>=0 &&  ry<(int)getVSize()) {
				rx = rx + (ry * (int)getHSize());
				if (v&0x80) {
					vmem[rx] = fg;
				} else {
					if (!trans)
						vmem[rx] = bg;
				}
				v<<=1;
			}
		}
		vchar++;
	}
}

void VGA_class::clearArea(unsigned x, unsigned y, unsigned width, unsigned height)
{
	drawRect(x,y,width,height);
}

void VGA_class::drawRect(unsigned x, unsigned y, unsigned width, unsigned height)
{
	vgaptr_t vmem = getBasePointer(x,y);
	unsigned w,h;

	for (h=0;h<height;h++) {
		for (w=0;w<width;w++) {
			*vmem++=fg;
		}
		vmem+=getHSize()-width;
	}
}

void VGA_class::printtext(unsigned x, unsigned y, const char *text, bool trans)
{
	while (*text) {
		printchar(x,y,*text,trans);
		text++;
		x+=8;
	}
}

void VGA_class::readArea(int x, int y, int width, int height, pixel_t *dest)
{
	vgaptr_t vmem = getBasePointer(x,y);
	int w;

	while (height--) {
		for (w=0;w<width;w++) {
			*dest++ = *vmem++;
		}
		vmem+=getHSize()-width;
	}
}

void VGA_class::writeArea(int x, int y, int width, int height, pixel_t *source)
{
	vgaptr_t vmem = getBasePointer(x,y);
	int w;

	while (height--) {
		for (w=0;w<width;w++) {
			*vmem++ = *source++;
		}
		vmem+=getHSize()-width;
	}
}
extern void sync();

void VGA_class::moveArea(unsigned x, unsigned y, unsigned width, unsigned height, unsigned tx, unsigned ty)
{
	vgaptr_t vsource = getBasePointer(x,y);
	vgaptr_t vtarget = getBasePointer(tx,ty);
	unsigned w;

	if (vtarget>vsource) {
		vsource += ((height-1) * VGA.getHSize()) + width-1;
		vtarget += ((height-1) * VGA.getHSize()) + width-1;

		while (height--) {
			for (w=0;w<width;w++) {
				*vtarget-- = *vsource--;
			}
			vsource-=getHSize()-width;
			vtarget-=getHSize()-width;
		}

	} else {
		while (height--) {
			for (w=0;w<width;w++) {
				*vtarget++ = *vsource++;
				
			}
			vsource+=getHSize()-width;
			vtarget+=getHSize()-width;
		}
	}
}

vgaptr_t VGA_class::getBasePointer(){
	return getVgaMem();
}
vgaptr_t VGA_class::getBasePointer(unsigned x, unsigned y){
	vgaptr_t p = getBasePointer();
	p += x;
	p += (y * getHSize());
	return p;
}

vgaptr_t VGA_class::getCharacterBasePointer(){
	return getCharRam();
}

vgaptr_t VGA_class::getVgaMem() {
	return &REGISTER(IO_SLOT(vgaWishboneSlot),0);
	// return &VGAPTR;
}

vgaptr_t VGA_class::getCharRam() {
	return &REGISTER(IO_SLOT(charMapWishboneSlot),0);
	// return &CHARRAMPTR;
}

void VGA_class::begin(VGAWISHBONESLOT vgaslot, CHARMAPWISHBONESLOT charslot)
//void VGA_class::begin(int vgaslot, int charslot)
{
	vgaWishboneSlot = vgaslot;
	charMapWishboneSlot = charslot;
}

void VGA_class::clear()
{
	vgaptr_t vmem = getBasePointer();
	unsigned count = getHSize() * getVSize();
	while (--count) {
		*vmem++=0;
	}
}

void VGA_class::blitStreamInit(int x, int y, int w)
{
	blitpos=VGA.getBasePointer(x,y);
	blitw=w;
	cblit=0;
}

void VGA_class::blitStreamAppend(unsigned char c)
{
	*blitpos++ = c;
	cblit++;
	if (cblit==blitw) {
		cblit=0;
		blitpos+=VGA.getHSize()-blitw;
	}
}

void VGA_class::drawLine(int x0, int y0, int x1, int y1)
{
	int dx = ABS(x1-x0);
	int dy = ABS(y1-y0);
	int sx = (x0 < x1) ? 1:-1;
	int sy = (y0 < y1) ? 1:-1;
	int err = dx-dy;
	vgaptr_t px = getBasePointer(x0,y0);
    vgaptr_t epx = getBasePointer(x1,y1);
	while (1)
	{
		*px = fg;
		if (px==epx)
			break;
		int e2 = 2*err;
		if (e2 > -dy) {
			err-=dy;
			px += sx;
		}
		if (e2 < dx) {
			err += dx;
			px += sy * getHSize();
		}
	}
}

VGA_class VGA;
