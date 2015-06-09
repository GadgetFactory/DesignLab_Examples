//Uncomment your preferred Shield
#define circuit Gameduino_Computing_Shield     //Please note that pressing the "Reset" button on the Computing Shield will reset the FPGA.
//#define circuit Gameduino_LogicStart_Shield  //Important SW0 and SW1 need to be down for this sketch to work. On the Logicstart Shield, SW0 controls the Arduino reset line and SW1 controls the FPGA reset.

//For a tutorial on using Gameduino on the Papilio DUO visit:
//http://gadgetfactory.net/learn/2015/06/08/gameduino-on-papilio-duo/

#include <SPI.h>
#include <Gameduino.h>

#include "random.h"

void setup()
{
  GD.begin();
  int i;
  for (i = 0; i < 256; i++) {
    GD.wr16(RAM_PAL + (4 * i + 0) * 2, RGB(0,0,0));
    GD.wr16(RAM_PAL + (4 * i + 1) * 2, RGB(0x20,0x20,0x20));
    GD.wr16(RAM_PAL + (4 * i + 2) * 2, RGB(0x40,0x40,0x40));
    GD.wr16(RAM_PAL + (4 * i + 3) * 2, RGB(0xff,0xff,0xff));
  }
  GD.microcode(random_code, sizeof(random_code));
}

void loop()
{
}
