#include "panel.h"
#include "Adafruit_GFX.h"
#include "AlvieGFX.h"

RGBPanel_class RGBPanel;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("Hello");

  RGBPanel.begin();
  RGBPanel.clear();

  //RGBPanel.setTextColor(0x000000);
  RGBPanel.setTextColor(0x808000);
  RGBPanel.setTextWrap(false);

  RGBPanel.setTextSize(1);
  
      RGBPanel.clear();
      RGBPanel.setCursor(0,0);
      RGBPanel.print("Alvie");
      RGBPanel.setCursor(1,8);
      RGBPanel.print("Rocks!");


      RGBPanel.apply();
}

void loop()
{
    return;
      RGBPanel.fillScreen(0xFFE0);
      RGBPanel.apply();
      delay(1000);
      RGBPanel.fillScreen(0x0000);
      RGBPanel.apply();
      delay(1000);
      RGBPanel.fillScreen(0x001F);
      RGBPanel.apply();
      delay(1000);
      RGBPanel.fillScreen(0xF800);
      RGBPanel.apply();
      delay(1000);
      RGBPanel.fillScreen(0x07E0);
      RGBPanel.apply();
      delay(1000);
      RGBPanel.fillScreen(0x07FF);
      RGBPanel.apply();
      delay(1000);
      

      


     // RGBPanel.apply();
//      delay(200);
//      Serial.println("looping");
}
