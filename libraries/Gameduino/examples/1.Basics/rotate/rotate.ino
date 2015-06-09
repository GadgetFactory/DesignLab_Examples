//Uncomment your preferred Shield
#define circuit Gameduino_Computing_Shield     //Please note that pressing the "Reset" button on the Computing Shield will reset the FPGA.
//#define circuit Gameduino_LogicStart_Shield  //Important SW0 and SW1 need to be down for this sketch to work. On the Logicstart Shield, SW0 controls the Arduino reset line and SW1 controls the FPGA reset.

//For a tutorial on using Gameduino on the Papilio DUO visit:
//http://gadgetfactory.net/learn/2015/06/08/gameduino-on-papilio-duo/

#include <SPI.h>
#include <Gameduino.h>

#include "r.h"

void setup()
{
  int i;

  GD.begin();
  GD.ascii();
  GD.putstr(0, 0,"Sprite rotation");

  GD.copy(RAM_SPRIMG, r_img, sizeof(r_img));
  GD.copy(RAM_SPRPAL, r_pal, sizeof(r_pal));

  for (i = 0; i < 8; i++) {
    char msg[] = "ROT=.";
    byte y = 3 + 4 * i;
    msg[4] = '0' + i;
    GD.putstr(18, y, msg);
    GD.sprite(i, 200, 8 * y, 0, 0, i);
  }
}

void loop()
{
}
