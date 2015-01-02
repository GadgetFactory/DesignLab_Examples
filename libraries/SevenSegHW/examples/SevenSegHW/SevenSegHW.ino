/*
  Gadget Factory
  Seven Segment Hardware Example
  
 Requires a ZPUino bit file with the Seven Segment Core connected to a Wishbone slot
 
 Wiki Page:
 http://www.papilio.cc/index.php?n=Papilio.7Segment-Core-Walid
 
 Hardware:
 There is no pre-built bit file/board type in the ZAP IDE that contains a Seven Segment Core. You will have to synthesize our own for now. The Seven Segment Core VHDL can be found here:
 https://github.com/GadgetFactory/Papilio-SOC/blob/master/zpu/hdl/zpuino/zpuino_sevenseg.vhd
 If using LogicStart MegaWing then select the appropriate "To be determined" board type in the ZAP IDE.
 
 ZPUino Variant:
 There is no pre-built bit file/board type in the ZAP IDE that contains a Seven Segment Core. You will have to synthesize our own for now. The Seven Segment Core VHDL can be found here:
 https://github.com/GadgetFactory/Papilio-SOC/blob/master/zpu/hdl/zpuino/zpuino_sevenseg.vhd

 created 2013
 by Walid Youssef
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#include <SevenSegHW.h>

SEVENSEGHW sevenseg;

void setup () {
  sevenseg.begin(11);
}

void loop () {

    // Testing simple read/write acces to registers
    // hmmm, but I don't know what the Extra register is used for :)
    //sevenseg.setExtra(34);

	
    // change Brightness
    sevenseg.setBrightness(1);

    // writes "BEEF" (0xBEEF) on display
    sevenseg.setHexValue(48879);
    delay (2000);
    // Simply write the "8879" value
    sevenseg.setIntValue(8879,0);
    // Maximum Brightness
    sevenseg.setBrightness(10);
    delay (2000);

    // check enable register
    //sevenseg.setSegmentStatus(35);
    // check conflict between status & brightness registers
    //delay(4000);

}