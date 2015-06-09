//Uncomment your preferred Shield
#define circuit Gameduino_Computing_Shield     //Please note that pressing the "Reset" button on the Computing Shield will reset the FPGA.
//#define circuit Gameduino_LogicStart_Shield  //Important SW0 and SW1 need to be down for this sketch to work. On the Logicstart Shield, SW0 controls the Arduino reset line and SW1 controls the FPGA reset.

//For a tutorial on using Gameduino on the Papilio DUO visit:
//http://gadgetfactory.net/learn/2015/06/08/gameduino-on-papilio-duo/

#include <SPI.h>
#include <Gameduino.h>

void readn(byte *dst, unsigned int addr, int c)
{
  GD.__start(addr);
  while (c--)
    *dst++ = SPI.transfer(0);
  GD.__end();
}

static byte coll[256];
static void load_coll()
{
  while (GD.rd(VBLANK) == 0)  // Wait until vblank
    ;
  while (GD.rd(VBLANK) == 1)  // Wait until display
    ;
  while (GD.rd(VBLANK) == 0)  // Wait until vblank
    ;
  readn(coll, COLLISION, sizeof(coll));
}

void setup()
{
  int i;

  delay(3000);
  GD.begin();

  GD.wr(JK_MODE, 1);
  GD.wr16(RAM_PAL, RGB(255,255,255));

  // Use the 4 palettes:
  // 0 pink, for J sprites
  // 1 green, for K sprites
  // 2 dark pink, J collisions
  // 3 dark green, K collisions
  for (i = 0; i < 256; i++) {
    GD.wr16(RAM_SPRPAL + (0 * 512) + (i << 1), RGB(255, 0, 255));
    GD.wr16(RAM_SPRPAL + (1 * 512) + (i << 1), RGB(0, 255, 0));
    GD.wr16(RAM_SPRPAL + (2 * 512) + (i << 1), RGB(100, 0, 100));
    GD.wr16(RAM_SPRPAL + (3 * 512) + (i << 1), RGB(0, 100, 0));
  }
}

byte spr;
static void polar(float th, int r, byte jk)
{
  // add 2 to the palette if this sprite is colliding
  byte colliding = coll[spr] != 0xff;
  GD.sprite(spr, 200 + int(r * sin(th)), 142 + int(r * cos(th)), 0, jk + (colliding ? 2 : 0), 0, jk);
  spr++;
}

void loop()
{
  byte i;
  float th;
  spr = 0;
  // draw the J sprites (pink)
  for (i = 0; i < 5; i++) {
    th = (millis() / 3000.) + 2 * PI * i / 5;
    polar(th, 134, 0);
  }
  // draw the K sprites (green)
  randomSeed(4);
  for (i = 0; i < 17; i++) {
    th = (millis() / float(random(1000,3000))) + 2 * PI * i / 17;
    polar(th, 134, 1);
  }
  load_coll();
}
