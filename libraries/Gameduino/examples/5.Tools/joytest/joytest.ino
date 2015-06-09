//Uncomment your preferred Shield
#define circuit Gameduino_Computing_Shield     //Please note that pressing the "Reset" button on the Computing Shield will reset the FPGA.
//#define circuit Gameduino_LogicStart_Shield  //Important SW0 and SW1 need to be down for this sketch to work. On the Logicstart Shield, SW0 controls the Arduino reset line and SW1 controls the FPGA reset.

//Joystick note: This sketch uses a joystick. The LogicStart shield does not have a joystick defined. For the Computing Shield plug an Atari 2600 style joystick into Joystick Port 2.

//For a tutorial on using Gameduino on the Papilio DUO visit:
//http://gadgetfactory.net/learn/2015/06/08/gameduino-on-papilio-duo/

#include <SPI.h>
#include <Gameduino.h>

void setup()
{
#if 0
  pinMode(9, OUTPUT);
  pinMode(12, INPUT);
  digitalWrite(12, HIGH);
  for (;;) {
    digitalWrite(9, HIGH);
    delay(1000);
    digitalWrite(9, LOW);
    delay(1000);
  }
#endif
  // Configure input pins with internal pullups
  byte i;
  for (i = 5; i < 9; i++) {
    pinMode(i, INPUT);
    //digitalWrite(i, HIGH);
  }
  GD.begin();
  GD.ascii();

  GD.wr16(RAM_SPRPAL + 2 * 255, TRANSPARENT);

  // draw 32 circles into 32 sprite images
  for (i = 0; i < 32; i++) {
    GD.wr16(RAM_SPRPAL + 2 * i, RGB(8 * i, 64, 255 - 8 * i));
    int dst = RAM_SPRIMG + 256 * i;
    GD.__wstart(dst);
    byte x, y;
    int r2 = min(i * i, 256);
    for (y = 0; y < 16; y++) {
      for (x = 0; x < 16; x++) {
        byte pixel;
        if ((x * x + y * y) <= r2)
          pixel = i;    // use color above
        else
          pixel = 0xff; // transparent
        SPI.transfer(pixel);
      }
    }
    GD.__end();
  }
}

void circle(int x, int y, byte a)
{
    byte sprnum = 0;
    GD.sprite(sprnum++, x + 16, y + 16, a, 0, 0);
    GD.sprite(sprnum++, x +  0, y + 16, a, 0, 2);
    GD.sprite(sprnum++, x + 16, y +  0, a, 0, 4);
    GD.sprite(sprnum++, x +  0, y +  0, a, 0, 6);
}

static byte bbits()
{
  byte r;
  r |= (digitalRead(6) << 0);
  r |= (digitalRead(5) << 1);
  r |= (digitalRead(7) << 2);
  r |= (digitalRead(8) << 3);
  //r |= (digitalRead(2) << 4);
  return r;
}

static byte ands = 0x1f, ors = 0x00;

void loop()
{
  GD.putstr(40, 10, digitalRead(5) ? "-" : "F");
  GD.putstr(40, 20, digitalRead(6) ? "-" : "D");
  GD.putstr(35, 15, digitalRead(7) ? "-" : "L");
  GD.putstr(45, 15, digitalRead(8) ? "-" : "R");

  //GD.putstr(17, 24, digitalRead(2) ? "-" : "S");

  int x = analogRead(0);
  int y = analogRead(1);

  byte bb = bbits();
  ands &= bb;
  ors |= bb;

  if (ands == 0 && ors == 0x1f)
    GD.putstr(35, 24, "BUTTONS OK");

  char msg[20];
  sprintf(msg, "X=%4d, Y=%4d", x, y);
  GD.putstr(0, 36, msg);

  circle(x / 4, 255 - y / 4, digitalRead(2) ? 15 : 31);
}
