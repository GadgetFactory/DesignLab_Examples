#ifndef __LOGICSTART_H__
#define __LOGICSTART_H__

#include <zpuino.h>

#define LS_ADC_SEL 0

#define LS_JOY_RIGHT 1
#define LS_JOY_LEFT  2
#define LS_JOY_DOWN  3
#define LS_JOY_UP    4
#define LS_JOY_SELECT 5

#define LS_SWITCH0 6
#define LS_SWITCH1 7
#define LS_SWITCH2 8
#define LS_SWITCH3 9
#define LS_SWITCH4 10
#define LS_SWITCH5 11
#define LS_SWITCH6 12
#define LS_SWITCH7 13

#define LS_LED0   14
#define LS_LED1   15
#define LS_LED2   16
#define LS_LED3   17
#define LS_LED4   18
#define LS_LED5   19
#define LS_LED6   20
#define LS_LED7   21

#define SEVENSEGBASE IO_SLOT(9)

#define SEGA 1
#define SEGB 2
#define SEGC 4
#define SEGD 8
#define SEGE 16
#define SEGF 32
#define SEGG 64

#define ADC_BITS 12

static inline void LS_setAllLeds(unsigned values)
{
	values &= 0xFF;
	unsigned old = GPIODATA(0);
	old &= ~((0xFF)<<LS_LED0);
	old |= values<<LS_LED0;
	GPIODATA(0) = old;
}

static inline unsigned LS_readAllSwitches()
{
	return (GPIODATA(0) >> LS_SWITCH0) & 0xFF;
}

#endif
