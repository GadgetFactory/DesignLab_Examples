#include "VGALiquidCrystal.h"
#include "WProgram.h"

VGALiquidCrystal::VGALiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,
			     uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
			     uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7)
{
  init(0, rs, rw, enable, d0, d1, d2, d3, d4, d5, d6, d7);
}

VGALiquidCrystal::VGALiquidCrystal(uint8_t rs, uint8_t enable,
			     uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
			     uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7)
{
  init(0, rs, 255, enable, d0, d1, d2, d3, d4, d5, d6, d7);
}

VGALiquidCrystal::VGALiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,
			     uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3)
{
  init(1, rs, rw, enable, d0, d1, d2, d3, 0, 0, 0, 0);
}

VGALiquidCrystal::VGALiquidCrystal(uint8_t rs,  uint8_t enable,
			     uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3)
{
  init(1, rs, 255, enable, d0, d1, d2, d3, 0, 0, 0, 0);
}

void VGALiquidCrystal::init(uint8_t fourbitmode, uint8_t rs, uint8_t rw, uint8_t enable,
			 uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
			 uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7)
{
  begin(16, 1);  
}

void VGALiquidCrystal::setDDRAddress(unsigned value)
{
	// Depends if we have one or two lines.
	AC = value;
	if (_lines == 0) {
		if (AC>79)
			AC=0;
	} else {
		if(AC > 39 && AC < 64){
			AC = 64;
		}
		if(AC > 103){
			AC = 0;
		}
	}
}

static bool cursor_high=false;
static void *object = NULL;

unsigned int tickcount = 0;

#if 0
void _zpu_interrupt()
{
	tickcount++;
	if (!(tickcount & 0x7))
		cursor_high = !cursor_high;

	// Update
	VGALiquidCrystal *v =(VGALiquidCrystal*)object;
	if (v) {
		v->updateDisplay();
	}
	TMR0CTL &= ~_BV(TCTLIF);
}
#endif

void VGALiquidCrystal::blinkUpdate(int value)
{
	if (value)
		putcharat(255,0);
	else
        putcharat(' ',0);
}

void VGALiquidCrystal::scheduleUpdate()
{
	// need_update=1;
	updateDisplay();
}

void VGALiquidCrystal::setupInterrupt()
{
#if 0
	// Start timer, 20Hz (prescaler 1024)
	TMR0CMP = (CLK_FREQ/(20*1024))-1;
	TMR0CNT = 0x0;
	TMR0CTL = BIT(TCTLENA)|BIT(TCTLCCM)|BIT(TCTLDIR)|BIT(TCTLCP2)|BIT(TCTLCP1)|BIT(TCTLCP0)|BIT(TCTLIEN);

	object = this;

	INTRMASK |= BIT(INTRLINE_TIMER0);
	INTRCTL=1;
#endif
}

void VGALiquidCrystal::begin(uint8_t cols, uint8_t lines, uint8_t dotsize) {

	_lines = lines;
	_cols = cols;
	if (_lines>1)
		displayRange=32;
	else
        displayRange=16;

	blink_on = cursor_on = scrool_on = false;
	display_on = true;

	increment = 1;

	_x0 = 10;
	_y0 = 10;
	cursorPosition = 0;
	increment = 1;
            /*
	unsigned i;
	for (i=0;i<sizeof(cgram);i++) {
		cgram[i]=0;
	}         */

	initCurrentDisplayChars();

	clear();
	display();
    blankDisplay();
	need_update=true;
    setupInterrupt();
}

void VGALiquidCrystal::drawline(unsigned line, unsigned offset)
{
    /*
	int i;
	for (i=0;i<_cols;i++) {
		if (vmem[offset]!=0)
			VGA.printchar( _x0 + (i*(_xspace+8)), _y0 + (i*(_yspace+8)), vmem[offset], 1);
		offset++;
		}
        */
}

void VGALiquidCrystal::redrawAll()
{
	/*int row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
	int r;
	for (r=0;r< _numlines; r++) {
		drawline( r, row_offsets[r]);
	} */
}

/********** high level commands, for the user! */
void VGALiquidCrystal::clear()
{
	unsigned i;

	for (i=0;i<sizeof(ddram);i++) {
		ddram[i]=' ';
	}
    increment = 1;
    AC=0;
	scheduleUpdate();
}

void VGALiquidCrystal::home()
{
    //_cursorx = _cursory = 0;
}

void VGALiquidCrystal::setCursor(uint8_t col, uint8_t row)
{
	int row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
	if ( row > _lines ) {
		row = _lines-1;    // we count rows starting w/0
	}
  
	AC = col + row_offsets[row];
}

// Turn the display on/off (quickly)
void VGALiquidCrystal::noDisplay() {
	display_on = false;
	scheduleUpdate();
}

void VGALiquidCrystal::display() {
	display_on = true;
    scheduleUpdate();
}

// Turns the underline cursor on/off
void VGALiquidCrystal::noCursor() {
}

void VGALiquidCrystal::cursor() {
}

// Turn on and off the blinking cursor
void VGALiquidCrystal::noBlink() {
}

void VGALiquidCrystal::blink() {
}

// These commands scroll the display without changing the RAM
void VGALiquidCrystal::scrollDisplayLeft(void) {

	shiftChars++;
	scheduleUpdate();
}

void VGALiquidCrystal::scrollDisplayRight(void) {
	shiftChars--;
    scheduleUpdate();
}

// This is for text that flows Left to Right
void VGALiquidCrystal::leftToRight(void) {
}

// This is for text that flows Right to Left
void VGALiquidCrystal::rightToLeft(void) {
}

// This will 'right justify' text from the cursor
void VGALiquidCrystal::autoscroll(void) {
}

// This will 'left justify' text from the cursor
void VGALiquidCrystal::noAutoscroll(void) {
}

// Allows us to fill the first 8 CGRAM locations
// with custom characters
void VGALiquidCrystal::createChar(uint8_t location, uint8_t charmap[]) {
	uint8_t sl= location;
	location*=8;
	int i;
	for(i=0;i<8;i++) {
		chrtbl[location++] = charmap[i];
	}

	if (display_on) {
		for(i=0; i<displayRange; i++){
			if(currentDisplayChars[i].chr == sl){
				putcharat(currentDisplayChars[i].chr,i, false);
			}
		}
	}
	scheduleUpdate();
}

void VGALiquidCrystal::scrollOne()
{
	// Copy area.
    /*
	VGA.moveArea( _x0 + 8 + _xspace, _y0,
				 (_cols-1)*(_xspace+8),
				 _rows*(_xspace+8)
				 _x0, _y0 );
                 */
}


void VGALiquidCrystal::putcharat(uint8_t chr, int pos, bool reverse)
{
	int col = pos % 16;
	int line = pos/16;

	vgaptr_t vmem = VGA.getBasePointer(_x0 + ( (5+1) * col), _y0 + (9*line) );
	const unsigned char *vchar = &chrtbl[chr*8];

	int i,j;
	unsigned char v;

	for (i=0; i<8;i++) {
		v = *vchar;
		for (j=0; j<5;j++) {

			int rx,ry;
			rx = j;
			ry = i;

			/* Check bounds */
			//if (rx>=0 && rx<(int)getHSize() && ry>=0 &&  ry<(int)getVSize()) {
				rx = rx + (ry * (int)VGA.getHSize());
				if (v&0x10) {
					vmem[rx] = reverse ? 1<<3:GREEN;
				} else {
					vmem[rx] = reverse ? GREEN:1<<3;
				}
				v<<=1;
			//}
		}
		vchar++;
	}
}


void VGALiquidCrystal::initCurrentDisplayChars()
{
	int i;
	for(i=0;i<16;i++) {
		currentDisplayChars[i].chr = 0x20;
		currentDisplayChars[i].addr = i;
	}
	for(i=16;i<32;i++){
		currentDisplayChars[i].chr = 0x20;
		currentDisplayChars[i].addr = 48 + i;
	}
}

void VGALiquidCrystal::setCurrentDisplayChars()
{
	int i;
	if (_lines == 1){
		for(i=0; i<16; i++){
			currentDisplayChars[i].addr = (i + 80 + shiftChars) % 80;
		}
	}
	else{
		for(i=0; i<16; i++){
			currentDisplayChars[i].addr = (i + 40 + shiftChars) % 40;
		}
		for(i=16; i<32; i++){
			if(shiftChars < 0){
				currentDisplayChars[i].addr= (i + 40 + shiftChars + 48);
				if(currentDisplayChars[i].addr > 103)
					currentDisplayChars[i].addr = (currentDisplayChars[i].addr % 104) + 64;
			}else{
				currentDisplayChars[i].addr = i  + shiftChars + 48;
				if(currentDisplayChars[i].addr > 103)
					currentDisplayChars[i].addr = ( currentDisplayChars[i].addr % 104) + 64;
			}
		}
	}
}

void VGALiquidCrystal::blankDisplay()
{
	int i;

	for(i=0;i<displayRange;i++){
		putcharat(' ',i);
	}

	for(i=0; i<32; i++){
		currentDisplayChars[i].chr = ' ';
	}
}

void VGALiquidCrystal::updateCharAt(int i)
{
	if((currentDisplayChars[i].chr != ddram[currentDisplayChars[i].addr])/* || cursorIn*/) {
		putcharat(ddram[currentDisplayChars[i].addr],i, false);//cursor_high & cursorIn);
		currentDisplayChars[i].chr = ddram[currentDisplayChars[i].addr];
	}
}

void VGALiquidCrystal::updateDisplay() {
#if 0

	if (!need_update)
		return;

	need_update = false;
#endif

	int i;
	int cp = -1;
    bool seenCursor=false;

	setCurrentDisplayChars();

	if(!display_on){
		blankDisplay();
		return;
	}
	
	if(_lines == 0){
		if(shiftChars > 79 || shiftChars < -79){
			shiftChars=0;
		}
	}
	else{
		if(shiftChars > 39 || shiftChars < -39){
			shiftChars=0;
		}
	}
	
	for(i=0; i<16; i++){
		updateCharAt(i);
	}
	if (_lines>0)
	{
		for(; i<32; i++){
			updateCharAt(i);
		}
	}
}



size_t VGALiquidCrystal::write(uint8_t value) {
	ddram[AC] = value;
	if(scrool_on){
		shiftChars += increment;
	}
	//incdcrDDRadrs(ID);
	if(_lines == 0){
		AC += increment;
		if(AC < 0){AC = 79;}
		AC %= 80;
	}
	else{
		AC += increment;
		if(AC < 0){
			AC = 103;
		}
		if(AC > 39 && AC < 64){
			AC = 64;
		}
		if(AC > 103){
			AC = 0;
		}
	}

    scheduleUpdate();

	/*
	vmem[vmem_offset]=value;
	int col = vmem_offset % 40;
	int row = vmem_offset / 40;
	if (col < _cols) {
		VGA.setColor(GREEN);
		VGA.printchar( _x0 + (col*(_xspace+8)), _y0 + (row*(_yspace+8)), vmem[vmem_offset], 1);
	}
	vmem_offset++;
	if (vmem_offset > sizeof(vmem))
	vmem_offset=0;
    */
	return 1;
}

unsigned char VGALiquidCrystal::chrtbl[2048] = {
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, /* 10 */
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, /* 20 */
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, /* 30 */
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
4, 4, 4, 4, 4, 0, 4, 0,
10,10,10, 0, 0, 0, 0, 0,
10,10,31,10,31,10,10, 0,
4,15,20,14, 5,30, 4, 0,
24,25, 2, 4, 8,19, 3, 0,
12,18,20, 8,21,18,13, 0,
12, 4, 8, 0, 0, 0, 0, 0,
2, 4, 8, 8, 8, 4, 2, 0, /* 40 */
8, 4, 2, 2, 2, 4, 8, 0,
0, 4,21,14,21, 4, 0, 0,
0, 4, 4,31, 4, 4, 0, 0,
0, 0, 0, 0,12, 4, 8, 0,
0, 0, 0,31, 0, 0, 0, 0,
0, 0, 0, 0, 0,12,12, 0,
0, 1, 2, 4, 8,16, 0, 0,
14,17,19,21,25,17,14, 0,
4,12, 4, 4, 4, 4,14, 0,
14,17, 1, 2, 4, 8,31, 0, /* 50 */
31, 2, 4, 2, 1,17,14, 0,
2, 6,10,18,31, 2, 2, 0,
31,16,30, 1, 1,17,14, 0,
6, 8,16,30,17,17,14, 0,
31, 1, 2, 4, 8, 8, 8, 0,
14,17,17,14,17,17,14, 0,
14,17,17,15, 1, 2,12, 0,
0,12,12, 0,12,12, 0, 0,
0,12,12, 0,12, 4, 8, 0,
2, 4, 8,16, 8, 4, 2, 0,
0, 0,31, 0,31, 0, 0, 0,
16, 8, 4, 2, 4, 8,16, 0,
14,17, 1, 2, 4, 0, 4, 0,
14,17, 1,13,21,21,14, 0,
14,17,17,17,31,17,17, 0,
30,17,17,30,17,17,30, 0,
14,17,16,16,16,17,14, 0,
30,17,17,17,17,17,30, 0,
31,16,16,30,16,16,31, 0,
31,16,16,30,16,16,16, 0,
14,17,16,23,17,17,15, 0,
17,17,17,31,17,17,17, 0,
14, 4, 4, 4, 4, 4,14, 0,
7, 2, 2, 2, 2,18,12 , 0,
17,18,20,24,20,18,17, 0,
16,16,16,16,16,16,31, 0,
17,27,21,21,17,17,17, 0,
17,17,25,21,19,17,17, 0,
14,17,17,17,17,17,14, 0,
30,17,17,30,16,16,16, 0,
14,17,17,17,21,18,13, 0,
30,17,17,30,20,18,17, 0,
15,16,16,14, 1, 1,30, 0,
31, 4, 4, 4, 4, 4, 4, 0,
17,17,17,17,17,17,14, 0,
17,17,17,17,17,10, 4, 0,
17,17,17,21,21,21,10, 0,
17,17,10, 4,10,17,17, 0,
17,17,17,10, 4, 4, 4, 0,
31, 1, 2, 4, 8,16,31, 0,
14, 8, 8, 8, 8, 8,14, 0,
17,10,31, 4,31, 4, 4, 0,
14, 2, 2, 2, 2, 2,14, 0,
4,10,17, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,31, 0,
8, 4, 2, 0, 0, 0, 0, 0,
0, 0,14, 1,15,17,15, 0,
16,16,22,25,17,17,30, 0,
0, 0,14,16,16,17,14, 0,
1, 1,13,19,17,17,15, 0,
0, 0,14,17,31,16,14, 0,
6, 9, 8,28, 8, 8, 8, 0,
0, 0,15,17,15, 1,14, 0,
16,16,22,25,17,17,17, 0,
4, 0,12, 4, 4, 4,14, 0,
2, 6, 2, 2, 2,18,12, 0,
16,16,18,20,24,20,18, 0,
12, 4, 4, 4, 4, 4,14, 0,
0, 0,26,21,21,17,17, 0,
0, 0,22,25,17,17,17, 0,
0, 0,14,17,17,17,14, 0,
0, 0,30,17,30,16,16, 0,
0, 0,13,19,15, 1, 1, 0,
0, 0,22,25,16,16,16, 0,
0, 0,15,16,14, 1,30, 0,
8, 8,28, 8, 8, 9, 6, 0,
0, 0,17,17,17,19,13, 0,
0, 0,17,17,17,10, 4, 0,
0, 0,17,17,21,21,10, 0,
0, 0,17,10, 4,10,17, 0,
0, 0,17,17,15, 1,14, 0,
0, 0,31, 2, 4, 8,31, 0,
2, 4, 4, 8, 4, 4, 2, 0,
4, 4, 4, 4, 4, 4, 4, 0,
8, 4, 4, 2, 4, 4, 8, 0,
0, 4, 2,31, 2, 4, 0, 0,
0, 4, 8,31, 8, 4, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0,28,20,28,
7, 4, 4, 4, 0, 0, 0,
0, 0, 0, 4, 4, 4,28,
0, 0, 0, 0,16, 8, 4,
0, 0, 0,12,12, 0, 0,
0,31, 1,31, 1, 2, 4,
0, 0,31, 1, 6, 4, 8,
0, 0, 2, 4,12,20, 4,
0, 0, 4,31,17, 1, 6,
0, 0, 0,31, 4, 4,31,
0, 0, 2,31, 6,10,18,
0, 0, 8,31, 9,10, 8,
0, 0, 0,14, 2, 2,31,
0, 0,30, 2,30, 2,30,
0, 0, 0,21,21, 1, 6,
0, 0, 0, 0,31, 0, 0,
31, 1, 5, 6, 4, 4, 8,
1, 2, 4,12,20, 4, 4,
4,31,17,17, 1, 2, 4,
0, 0,31, 4, 4, 4,31,
2,31, 2, 6,10,18, 2,
8,31, 9, 9, 9, 9,18,
4,31, 4,31, 4, 4, 4,
0,15, 9,17, 1, 2,12,
8,15,18, 2, 2, 2, 4,
0,31, 1, 1, 1, 1,31,
10,31,10,10, 2, 4, 8,
0,24, 1,25, 1, 2,28,
0,31, 1, 2, 4,10,17,
8,31, 9,10, 8, 8, 7,
0,17,17, 9, 1, 2,12,
0,15, 9,21, 3, 2,12,
2,28, 4,31, 4, 4, 8,
0,21,21, 1, 1, 2, 4,
14, 0,31, 4, 4, 4, 8,
8, 8, 8,12,10, 8, 8,
4, 4,31, 4, 4, 8,16,
0,14, 0, 0, 0, 0,31,
0,31, 1,10, 4,10,16,
4,31, 2, 4,14,21, 4,
2, 2, 2, 2, 2, 4, 8,
0, 4, 2,17,17,17,17,
16,16,31,16,16,16,15,
0,31, 1, 1, 1, 2,12,
0, 8,20, 2, 1, 1, 0,
4,31, 4, 4,21,21, 4,
0,31, 1, 1,10, 4, 2,
0,14, 0,14, 0,14, 1,
0, 4, 8,16,17,31, 1,
0, 1, 1,10, 4,10,16,
0,31, 8,31, 8, 8, 7,
8, 8,31, 9,10, 8, 8,
0,14, 2, 2, 2, 2,31,
0,31, 1,31, 1, 1,31,
14, 0,31, 1, 1, 2, 4,
18,18,18,18, 2, 4, 8,
0, 4,20,20,21,21,22,
0,16,16,17,18,20,24,
0,31,17,17,17,17,31,
0,31,17,17, 1, 2, 4,
0,24, 0, 1, 1, 2,28,
4,18, 8, 0, 0, 0, 0,
28,20,28, 0, 0, 0, 0,
0, 0, 9,21,18,18,13 ,
10, 0,14, 1,15,17,15,
0,14,17,30,17,30,16,
0, 0,14,16,12,17,14,
0,17,17,17,19,29,16,
0, 0,15,20,18,17,14,
0, 6, 9,17,17,30,16,
0,15,17,17,17,15, 1,
0, 0, 7, 4, 4,20, 8,
2,26, 2, 0, 0, 0, 0,
2, 0, 6, 2, 2, 2, 2,
0,20, 8,20, 0, 0, 0,
4,14,20,21,14, 4, 0,
8, 8,28, 8,28, 8,15,
14, 0,22,25,17,17,17,
10, 0,14,17,17,17,14,
0,22,25,17,17,30,16,
0,13,19,17,17,15, 1 ,
14,17,31,17,17,14, 0,
0, 0, 0, 0,11,21,26 ,
0,14,17,17,10,27, 0,
10, 0,17,17,17,19,13,
31,16, 8, 4, 8,16,31,
0,31,10,10,10,19, 0 ,
31, 0,17,10, 4,10,17,
0,17,17,17,17,15, 1,
1,30, 4,31, 4, 4, 0,
0,31, 8,15, 9,17, 0,
0,31,21,31,17,17, 0 ,
0, 0, 4, 0,31, 0, 4 ,
0, 0, 0, 0, 0, 0, 0 ,
31,31,31,31,31,31,31
};
