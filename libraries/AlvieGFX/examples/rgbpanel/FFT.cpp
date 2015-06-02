#include "FFT.h"
#include <math.h>
#include <Arduino.h>

template<>
	const unsigned int FFT<5>::sincostable[] = {
		0x00000000, // -sin for LE2 1
		0xffff0000, // cos for LE2 1
		0xffff0000, // -sin for LE2 2
		0x00000000, // cos for LE2 2
		0xffff4afc, // -sin for LE2 4
		0x0000b504, // cos for LE2 4
		0xffff9e09, // -sin for LE2 8
		0x0000ec83, // cos for LE2 8
		0xffffce0f, // -sin for LE2 16
		0x0000fb14  // cos for LE2 16
	};

template<>
	const unsigned int FFT<6>::sincostable[] = {
		0x00000000, // -sin for LE2 1
		0xffff0000, // cos for LE2 1
		0xffff0000, // -sin for LE2 2
		0x00000000, // cos for LE2 2
		0xffff4afc, // -sin for LE2 4
		0x0000b504, // cos for LE2 4
		0xffff9e09, // -sin for LE2 8
		0x0000ec83, // cos for LE2 8
		0xffffce0f, // -sin for LE2 16
		0x0000fb14, // cos for LE2 16
		0xffffe6e9, // -sin for LE2 32
		0x0000fec4 // cos for LE2 32
	};

template<>
	const unsigned int FFT<10>::sincostable[] = {
		0x00000000, // -sin for LE2 1
		0xffff0000, // cos for LE2 1
		0xffff0000, // -sin for LE2 2
		0x00000000, // cos for LE2 2
		0xffff4afc, // -sin for LE2 4
		0x0000b504, // cos for LE2 4
		0xffff9e09, // -sin for LE2 8
		0x0000ec83, // cos for LE2 8
		0xffffce0f, // -sin for LE2 16
		0x0000fb14, // cos for LE2 16
		0xffffe6e9, // -sin for LE2 32
		0x0000fec4, // cos for LE2 32
		0xfffff371, // -sin for LE2 64
		0x0000ffb1, // cos for LE2 64
		0xfffff9b8, // -sin for LE2 128
		0x0000ffec, // cos for LE2 128
		0xfffffcdc, // -sin for LE2 256
		0x0000fffb, // cos for LE2 256
		0xfffffe6e, // -sin for LE2 512
		0x0000fffe  // cos for LE2 512
	};

template<>
	const unsigned int FFT<9>::sincostable[] = {
		0x00000000, // -sin for LE2 1
		0xffff0000, // cos for LE2 1
		0xffff0000, // -sin for LE2 2
		0x00000000, // cos for LE2 2
		0xffff4afc, // -sin for LE2 4
		0x0000b504, // cos for LE2 4
		0xffff9e09, // -sin for LE2 8
		0x0000ec83, // cos for LE2 8
		0xffffce0f, // -sin for LE2 16
		0x0000fb14, // cos for LE2 16
		0xffffe6e9, // -sin for LE2 32
		0x0000fec4, // cos for LE2 32
		0xfffff371, // -sin for LE2 64
		0x0000ffb1, // cos for LE2 64
		0xfffff9b8, // -sin for LE2 128
		0x0000ffec, // cos for LE2 128
		0xfffffcdc, // -sin for LE2 256
		0x0000fffb  // cos for LE2 256
	};

extern "C" void printnibble(unsigned int c)
{
	c&=0xf;
	if (c>9)
		Serial.write(c+'a'-10);
	else
		Serial.write(c+'0');
}

extern "C" void printhexbyte(unsigned int c)
{
	printnibble(c>>4);
	printnibble(c);
}

extern "C" void printhex(unsigned int c)
{
	printhexbyte(c>>24);
	printhexbyte(c>>16);
	printhexbyte(c>>8);
	printhexbyte(c);
}
