#include "LogicStart.h"
#include <SmallFS.h>
#include "VGAZX.h"
#include "fixedpoint.h"
#include "cbuffer.h"
#include "ptplaylocal.h"

#define USPIDATA16 *((&USPIDATA)+2)

static SmallFSFile modfile;
static char buf[128];
static pt_mod_s * mod;
static CircularBuffer<unsigned,7> audioBuffer;

extern pt_mod_s *pt_init_smallfs(SmallFSFile &file);

static int timeout=0;

void _zpu_interrupt()
{
	// Play
	if (audioBuffer.hasData()) {
		unsigned v = audioBuffer.pop();
		SIGMADELTADATA = v;
	}
	if (timeout!=0)
		timeout--;
	TMR0CTL &= ~(BIT(TCTLIF));
}

void setup()
{
	LS_setAllLeds(0);
	digitalWrite(LS_ADC_SEL, 0);
	VGAZX.begin();
	SmallFS.begin();

	SmallFSFile f = SmallFS.open("scr1");
	if (f.valid())
		VGAZX.loadscr(f);

	Serial.begin(115200);

	modfile = SmallFS.open("music.mod");

	mod = pt_init_smallfs(modfile);
	SIGMADELTACTL=0x3;
	TMR0CTL = 0;
	TMR0CNT = 0;
	TMR0CMP = ((CLK_FREQ/2) / FREQ )- 1;
	TMR0CTL = _BV(TCTLENA)|_BV(TCTLCCM)|_BV(TCTLDIR)|
		_BV(TCTLCP0) | _BV(TCTLIEN);

	INTRMASK = BIT(INTRLINE_TIMER0); // Enable Timer0 interrupt

	USPICTL=BIT(SPICPOL)|BIT(SPISRE)|BIT(SPIEN)|BIT(SPIBLOCK)|BIT(SPICP2)|BIT(SPICP0);

	INTRCTL=1;


}

static unsigned char table7seg[16] =
{
	0x3F, //00111111, 0
	0x06, //00000110, 1
	0x5B, //01011011  2
	0x4F, //01001111  3
	0x66, //01100110  4
	0x6D, //01101101  5
	0x7D, //01111101  6
	0x07, //00000111  7
	0x7F, //01111111  8
	0x6F, //01101111  9
	0x00,
	0x00,
	0x00,
	0x00,
	0x00,
	0x00
};

static int int_to_7seg(int v)
{
	return table7seg[v%16];
}

int cnt = 0;
int extcnt = 0;
int mode = 0;
unsigned channel=0;

static void set_sevenseg_value(int v, unsigned bindots)
{
	REGISTER( SEVENSEGBASE, 7 ) = int_to_7seg(v%10) | (bindots&8 ? 0x80:0x00);
	REGISTER( SEVENSEGBASE, 6 ) = int_to_7seg((v/10)%10) | (bindots&4 ? 0x80:0x00);
	REGISTER( SEVENSEGBASE, 5 ) = int_to_7seg((v/100)%10) | (bindots&2 ? 0x80:0x00);
	REGISTER( SEVENSEGBASE, 4 ) = int_to_7seg((v/1000)%10) | (bindots&1 ? 0x80:0x00);
}

static void test()
{
	REGISTER( SEVENSEGBASE, 7 ) = int_to_7seg(channel);
	REGISTER( SEVENSEGBASE, 6 ) = 0;
	REGISTER( SEVENSEGBASE, 5 ) = SEGF|SEGE|SEGB|SEGC|SEGG;
	REGISTER( SEVENSEGBASE, 4 ) = SEGA|SEGF|SEGE|SEGD;
}

static void hello()
{
	REGISTER( SEVENSEGBASE, 7 ) = SEGA|SEGF|SEGB|SEGE|SEGC|SEGD;
	REGISTER( SEVENSEGBASE, 6 ) = SEGF|SEGE|SEGD;
	REGISTER( SEVENSEGBASE, 5 ) = SEGA|SEGF|SEGE|SEGD|SEGG;
	REGISTER( SEVENSEGBASE, 4 ) = SEGF|SEGE|SEGB|SEGC|SEGG;
}


void loop()
{
	unsigned char lpwm;
	unsigned switches = LS_readAllSwitches();
	unsigned adcvalue = USPIDATA16;
	int i;
	const fp32_16_16 adcv = 5000;

	if ((extcnt & 0x17) == 0) {
		adcvalue &= 0xffff;
		adcvalue <<= 4;
		adcvalue += ((1<<4)-1);

		if (adcvalue>0x10000)
			adcvalue=0x10000;

		adcvalue &= 0x1ffff;

		fp32_16_16 adcf(adcvalue,1);
		adcf *= adcv;

		adcvalue = adcf.asInt();


		lpwm = 0xf - (switches& 0xf);

		LS_setAllLeds(switches);

		REGISTER( SEVENSEGBASE, 0 ) = 0xF | (lpwm<<16);

		if (!digitalRead(LS_JOY_SELECT)) {
            hello();
		} else {
			if (timeout==0) {
				if (mode==0) {
					if ((cnt & 0x3F)==0)
						set_sevenseg_value(adcvalue,1);
				} else {
					set_sevenseg_value(cnt,1);
				}
			}
		}

		USPIDATA16 = channel<<(8+3);

		/* Check for mode change */
		if (!digitalRead(LS_JOY_LEFT))
			mode=0;
		else if (!digitalRead(LS_JOY_RIGHT))
            mode=1;

		if (timeout==0) {
			if (!digitalRead(LS_JOY_UP)) {
				if (channel<7)
					channel++;
				/* Print something and add timeout */
				timeout = 17000;
				test();
			} else if (!digitalRead(LS_JOY_DOWN)) {
				if (channel!=0)
					channel--;
				timeout = 17000;
				test();
			}
		}

        cnt++;
	}
	extcnt++;

	pt_render(modfile, mod, buf, NULL, 2, 16 /* Samples */, 1, 16, 1);
	for (i=0;i<32;i+=2) {
		unsigned v = buf[i];
		v += buf[i+1]<<8;
		//v += buf[i]<<16;
		//v += buf[i+1]<<24;
		v+=0x8000;

		while (audioBuffer.isFull());
		audioBuffer.push(v);
	}
}
