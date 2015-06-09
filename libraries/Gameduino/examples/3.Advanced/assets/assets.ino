//Uncomment your preferred Shield
#define circuit Gameduino_Computing_Shield     //Please note that pressing the "Reset" button on the Computing Shield will reset the FPGA.
//#define circuit Gameduino_LogicStart_Shield  //Important SW0 and SW1 need to be down for this sketch to work. On the Logicstart Shield, SW0 controls the Arduino reset line and SW1 controls the FPGA reset.

//NOTE: Not working on Papilio DUO, drop us a note if you know why.

//For a tutorial on using Gameduino on the Papilio DUO visit:
//http://gadgetfactory.net/learn/2015/06/08/gameduino-on-papilio-duo/

#include <SPI.h>
#include <Gameduino.h>

static void playsample(Asset &a)
{
  while (a.available()) {
    byte b;
    a.read(&b, 1);
    GD.wr(SAMPLE_L + 1, b);
    GD.wr(SAMPLE_R + 1, b);
    delayMicroseconds(80);
  }
}

static void say(const char *word)
{
  Asset a;
  a.open("voice", word, NULL);
  playsample(a);
}

void setup()
{
  delay(7000);
  GD.begin();

  // Say "Gameduino ready"
  say("game");
  say("duino");
  delay(100);
  say("ready");

  // Load the pickups starting at sprite 0.
  // First copy pickups/pal into RAM_SPRPAL, then
  // pickups/img into RAM_SPRIMG.
  Asset a;
  a.open("pickups", "pal", NULL);
  a.load(RAM_SPRPAL);
  a.open("pickups", "img", NULL);
  a.load(RAM_SPRIMG);
}

void loop()
{
  // Scatter sprites across the screen
  for (int i = 0; i < 256; i++)
    GD.sprite(i, random(400), random(300), random(47), 0, 0);

  // Play a random instrument from the 12 in the drumkit
  static const char *drums[12] = {
    "bassdrum2",
    "bassdrum4",
    "clap",
    "conga2",
    "conga3",
    "cowbell1",
    "cymbal1",
    "cymbal3",
    "hihat1",
    "hihat2",
    "snaredrum2",
    "snaredrum3"
  };
  Asset drum;
  drum.open("drumkit", drums[random(12)], NULL);
  playsample(drum);

  // Say "game over"
  say("game");
  say("over");
}
