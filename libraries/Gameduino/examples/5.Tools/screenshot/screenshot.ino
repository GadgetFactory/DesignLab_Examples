//Uncomment your preferred Shield
#define circuit Gameduino_Computing_Shield     //Please note that pressing the "Reset" button on the Computing Shield will reset the FPGA.
//#define circuit Gameduino_LogicStart_Shield  //Important SW0 and SW1 need to be down for this sketch to work. On the Logicstart Shield, SW0 controls the Arduino reset line and SW1 controls the FPGA reset.

//For a tutorial on using Gameduino on the Papilio DUO visit:
//http://gadgetfactory.net/learn/2015/06/08/gameduino-on-papilio-duo/

#include <SPI.h>
#include <Gameduino.h>

#define RED RGB(255,0,0)
#define GREEN RGB(0,255,0)

void setup()
{
  int i;

  GD.begin();
  GD.ascii();
  GD.putstr(20, 0, "Screenshot");

  GD.wr16(RAM_PAL + (8 * 127), RED);   // char 127: 0=red, 3=green
  GD.wr16(RAM_PAL + (8 * 127) + 6, GREEN);
  static PROGMEM prog_uchar box[] = {
     0xff, 0xff,
     0xc0, 0x03,
     0xc0, 0x03,
     0xc0, 0x03,
     0xc0, 0x03,
     0xc0, 0x03,
     0xc0, 0x03,
     0xff, 0xff };
  GD.copy(RAM_CHR + (16 * 127), box, sizeof(box));

  for (i = 0; i < 64; i++) {
    GD.wr(64 * i + i, 127);     // diagonal boxes

    char msg[20];
    sprintf(msg, "Line %d", i);
    GD.putstr(i + 2, i, msg);

    GD.wr(64 * i + 49, 127);    // boxes on right
  }

  Serial.begin(1000000);
  long started = millis();
  GD.screenshot(0);
}

void loop()
{
}
