/*

 BitCoin_Miner - Summarize your library here.

 Describe your library here.

 License: GNU General Public License V3

 (C) Copyright (Your Name Here)
 
 For more help on how to make an Arduino style library:
 http://arduino.cc/en/Hacking/LibraryTutorial

 */

#include "Arduino.h"
#include "BitCoin_Miner.h"

BitCoin_Miner::BitCoin_Miner()
{

}

void BitCoin_Miner::setup(unsigned int wishboneSlot)
{
	this->wishboneSlot = wishboneSlot;
}

unsigned long BitCoin_Miner::readButtons()
{
	return REGISTER(IO_SLOT(wishboneSlot),1);
}

void BitCoin_Miner::writeLEDs(unsigned long value)
{
	REGISTER(IO_SLOT(wishboneSlot),0) = value;
}
