#include "VGAZX.h"

void VGAZX_class::begin(unsigned int slot)
{
	REGISTER(IO_SLOT(slot),0) = (unsigned)z_framebuffer;
	REGISTER(IO_SLOT(slot),1) = (unsigned)z_pallete;

	SmallFS.begin();

	zxrom = SmallFS.open("ZXROM");

	if (!zxrom.valid()) {
		Serial.print("Cannot open ROM, you won't be able to print");
	}

	tptr=0;
}

void VGAZX_class::loadscr(SmallFSFile &scr)
{
	// SCR are tricky

	unsigned i,j,z;
	for (z=0;z<3;z++) {
		unsigned char *fbptr= &z_framebuffer[VGA_COLUMNS*(z*8*8)];

		for (j=0;j<8;j++) {
			unsigned char *tbptr=fbptr;
			for (i=0;i<8;i++) {
				scr.read( tbptr, VGA_COLUMNS );
				tbptr+=VGA_COLUMNS*8;
			}
			fbptr+=VGA_COLUMNS;
		}
	}
	// Seek to pallete (not nedded, I think)
	scr.seek( sizeof(z_framebuffer), SEEK_SET);
	scr.read( &z_pallete[0], sizeof(z_pallete));
}

void VGAZX_class::generic_copy_from_flash(unsigned offset, unsigned char *target, unsigned size)
{
	zxrom.seek(offset, SEEK_SET);
	zxrom.read( target, size);
}

void VGAZX_class::clrscr()
{
	memset( &z_pallete[0], 0x7, sizeof(z_pallete));
	memset( &z_framebuffer[0], 0, sizeof(z_framebuffer));
}

size_t VGAZX_class::write(uint8_t v)
{
	putChar(v);
	tptr++;
	if ((tptr % VGA_COLUMNS)==0) {
		tptr+=(7*VGA_COLUMNS);
	}
	return 1;
}


#define ABS(x) ((x)>0 ? (x):-1*(x))

void VGAZX_class::drawLine(int x0, int y0, int x1, int y1)
{
	int dx = ABS(x1-x0);
	int dy = ABS(y1-y0);
	int sx = (x0 < x1) ? 1:-1;
	int sy = (y0 < y1) ? 1:-1;
	int err = dx-dy;

	while (1)
	{
		putPixel(x0,y0);

		if (x0==x1 && y0==y1)
			break;

		int e2 = 2*err;

		if (e2 > -dy) {
			err-=dy;
			x0 += sx;
		}

		if (e2 < dx) {
			err += dx;
			y0 += sy;
		}
	}
}



int VGAZX_class::drawsprite(const unsigned char *source, unsigned char*dest, bool check_collision, bool isxor)
{
	int i;
	unsigned sprite_byte;
	for (i=16;i!=0;i--) {
		sprite_byte = *source;
		if (check_collision) {
			if (sprite_byte & (*dest)) {
				return 1;
			}
		}
		if (isxor) {
			sprite_byte ^= *dest;
		} else {
			sprite_byte |= *dest;
		}

		*dest = sprite_byte;
		dest++;
		source++;
		sprite_byte=*source;
		if (check_collision) {
			if (sprite_byte & (*dest)) {
				return 1;
			}
		}
		if (isxor) {
			sprite_byte ^= *dest;
		} else {
			sprite_byte |= *dest;
		}
		*dest = sprite_byte;
		dest--;
		dest+=VGA_COLUMNS;
		source++;
	}
	return 0;
}

/*
     +---+---+
	 | 0 | 1 |
	 +---+---+
	 | 2 | 3 |
     +---+---+
*/
int VGAZX_class::sprite_collides(const unsigned char *source, unsigned char*dest)
{
	int i;
	unsigned sprite_byte;
	for (i=0;i<16;i++) {
		sprite_byte = *source;
		if (sprite_byte & (*dest)) {
			Serial.print("Collision line ");
			Serial.println(i);
			return (i>>2)&0x2;
		}
		dest++;
		source++;
		sprite_byte=*source;
		if (sprite_byte & (*dest)) {
			return 1+((i>>2)&0x2);
			Serial.print("Collision(2) line ");
			Serial.println(i);

		}
		dest--;
		dest+=VGA_COLUMNS;
		source++;
	}
	return -1;
}

void VGAZX_class::pctext(const char *text)
{
	unsigned char color=0x7;
	tptr=0;
    Serial.println("Here man");
	while (*text) {
		if (*text==0x1B) { /* Escape sequence */
			text++;
			switch (*text) {
			case 'C':
				// Switch color
                text++;
				color = *text++;
				break;

			case 'G':
				// Switch position
                text++;
				tptr = *text++;
				tptr += (8*VGA_COLUMNS)*(unsigned)*text;
				text++;
				break;
			}
            continue;
		}
		putChar(*text++);
		z_pallete[ (tptr % VGA_COLUMNS) + (tptr/(8*VGA_COLUMNS))*VGA_COLUMNS ]=color;

		tptr++;
	}
}



void VGAZX_class::drawblock(const unsigned char *source, unsigned char *dest)
{
	// Print a 8x8 matrix on screen. This loop is fully unrolled.
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source++; dest+=VGA_COLUMNS;
	*dest = *source;
}

VGAZX_class VGAZX;

unsigned char VGAZX_class::z_framebuffer[RWIDTH*VGA_ROWS];
unsigned char VGAZX_class::z_pallete[VGA_COLUMNS*VGA_ROWS];
unsigned VGAZX_class::tptr;
SmallFSFile VGAZX_class::zxrom;
