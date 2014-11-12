#ifndef __SEVENSEGHW_H__
#define __SEVENSEGHW_H__

#if defined(ZPU)
#include "zpuino.h"
#endif

#define SEVENSEGBASE IO_SLOT(11)
#define SEVSEGDIGITO  REGISTER(SEVENSEGBASE,7)
#define SEVSEGDIGIT1  REGISTER(SEVENSEGBASE,6)
#define SEVSEGDIGIT2  REGISTER(SEVENSEGBASE,5)
#define SEVSEGDIGIT3  REGISTER(SEVENSEGBASE,4)
#define SEVSEGBRIGHT  REGISTER(SEVENSEGBASE,0)
#define SEVSEGEXTRA   REGISTER(SEVENSEGBASE,1)

#define SEGA 1
#define SEGB 2
#define SEGC 4
#define SEGD 8
#define SEGE 16
#define SEGF 32
#define SEGG 64


class SEVENSEGHW {
public:
	// Default Constructor
    SEVENSEGHW();
	
	// Set the 4 digits Int value 
    void setIntValue (unsigned int value, unsigned int pos_dot) ;
    // Set a digit value
    void setDigitValue (unsigned int value, unsigned int dot, unsigned int digit) ;
    // Set a Hexadecimal value
    void setHexValue (unsigned int value) ;
	// Get the 4 digits Int value 
    unsigned int getIntValue () ;
	// Get a digit value 
    unsigned int getDigitValue (unsigned int digit) ;
    // Get Dot position
    unsigned int getDotPosition () ;
    // Set a Hexadecimal value
    void setHexValue (unsigned int value, unsigned int digit) ;
    // Set a custom value
    void custom (unsigned int value, unsigned int digit) ;	

	// Set Brightness
    void setBrightness (unsigned int value) ;
	// Get Brightness
	unsigned int getBrightness () ;

	// Set Extra value
    void setExtra (unsigned int value);
	// Get Extra value
	unsigned int getExtra (); 
	
	
	// enable/disable segment 
    void setSegmentStatus (unsigned int enabled );
	// get segment status 
    unsigned int getSegmentStatus ();
	
	void begin(int wishboneSlot);
	
private:
	int wishboneSlot;
};

#endif
