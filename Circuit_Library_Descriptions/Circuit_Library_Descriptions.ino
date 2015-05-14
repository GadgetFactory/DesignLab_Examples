/*
DesignLab contains many circuits that have already been generated for you. This is a full listing of all the pre-defined circuits available for you to use.

It's easy to associate any one of these circuits to your sketch. Simply do a:
#define circuit <circuit_name>

Arcade_MegaWing Circuit
  The Arcade_MegaWing circuit is intended to be used with an Arcade MegaWing connected to a Papilio Pro or Papilio One 500K.
  It contains:
    -Arcade MegaWing Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -YM2149 Audio Chip - For playing Atari ST YM files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.YM2149
        -http://www.papilio.cc/index.php?n=Papilio.YMVoice
    -Commodore 64 SID Chip - For playing SID files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.SID
        -http://www.papilio.cc/index.php?n=Papilio.SIDVoice
    -HQVGA Adapter - This is an older VGA adapter that uses internal BRAM memory and can only generate 240x160 video output.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.VGA
        -http://www.papilio.cc/index.php?n=Papilio.VGALiquidCrystal
  
  Special Notes:
    All audio chips connect to a 3 channel audio mixer and then to the Arcade MegaWing audio pins.
    Pullups are placed on all of the joystick pins.
  
  Supported boards:
    Papilio One 500K
    Papilio Pro  
  
  To use, include the following line in your sketch:
  #define circuit Arcade_MegaWing

*******************************************************************************************************************************************************************  

Arcade_MegaWing2 Circuit
  The Arcade_MegaWing2 circuit is intended to be used with an Arcade MegaWing connected to a Papilio Pro.
  
  The main difference from Arcade_MegaWing is the VGA adapter. This circuit uses the more advanced ZPUino VGA Adapter which is capable of resolutions up to 1280x1024.
  It also uses the Adafruit_GFX library to control the graphics.
  
  It contains:
    -Arcade MegaWing Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -YM2149 Audio Chip - For playing Atari ST YM files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.YM2149
        -http://www.papilio.cc/index.php?n=Papilio.YMVoice
    -Commodore 64 SID Chip - For playing SID files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.SID
        -http://www.papilio.cc/index.php?n=Papilio.SIDVoice
    -ZPUino VGA Adapter - This is the latest and greatest graphics adapter that uses DMA to access SDRAM memory for video. Uses the Adafruit_GFX library for graphics.

  Special Notes:
    All audio chips connect to a 3 channel audio mixer and then to the Arcade MegaWing audio pins.
    Pullups are placed on all of the joystick pins.
  
  Supported boards:
    Papilio Pro  
  
  To use, include the following line in your sketch:
  #define circuit Arcade_MegaWing2

*******************************************************************************************************************************************************************    

Audio_Wing Circuit
  The Audio_Wing circuit connects all available audio chips to an Audio Wing connected to the CH Wing Slot. It is intended to be used with the Audio Wing available in the store:
  http://store.gadgetfactory.net/audio-wing/
  
  It contains:
    -Audio Wing connected to CH Wing Slot
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -YM2149 Audio Chip - For playing Atari ST YM files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.YM2149
        -http://www.papilio.cc/index.php?n=Papilio.YMVoice
    -Commodore 64 SID Chip - For playing SID files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.SID
        -http://www.papilio.cc/index.php?n=Papilio.SIDVoice

  Special Notes:
    All audio chips connect to a 3 channel audio mixer and then to the Audio Wings audio pins.
  
  Supported boards:
    Papilio Pro
    Papilio DUO
    Papilio One 500K
    
  To use, include the following line in your sketch:
  #define circuit Audio_Wing

*******************************************************************************************************************************************************************    

blank Circuit
  The blank circuit lets you essentially disable the FPGA. You may need this when running AVR sketches on the Papilio DUO and you want to ensure there is no interference from the FPGA.
  
  Supported boards:
    Papilio Pro
    Papilio DUO
    Papilio One 500K
    Papilio One 250K
    
  To use, include the following line in your sketch:
  #define circuit blank

*******************************************************************************************************************************************************************    

Computing_Shield Circuit
  The Computing_Shield circuit is intended to be used with an Computing Shield connected to a Papilio DUO.
  http://store.gadgetfactory.net/computing-shield/
  
  It contains:
    -Computing Shield Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -YM2149 Audio Chip - For playing Atari ST YM files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.YM2149
        -http://www.papilio.cc/index.php?n=Papilio.YMVoice
    -Commodore 64 SID Chip - For playing SID files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.SID
        -http://www.papilio.cc/index.php?n=Papilio.SIDVoice
    -HQVGA Adapter - This is an older VGA adapter that uses internal BRAM memory and can only generate 240x160 video output.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.VGA
        -http://www.papilio.cc/index.php?n=Papilio.VGALiquidCrystal
    -Second UART - Connected to the Maxim RS232 converter on the Computing Shield
    -SPI Master - Connected to the SD card on the Computing Shield. Used with the SD library for full SD card access from your sketches.
  
  Special Notes:
    All audio chips connect to a 3 channel audio mixer and then to the Computing Shield audio pins.
  
  Supported boards:
    Papilio DUO 
  
  To use, include the following line in your sketch:
  #define circuit Computing_Shield

*******************************************************************************************************************************************************************    

Computing_Shield2 Circuit
  The Computing_Shield circuit is intended to be used with an Computing Shield connected to a Papilio DUO.
  http://store.gadgetfactory.net/computing-shield/
  
  The main difference from Computing_Shield is the VGA adapter. This circuit uses the more advanced ZPUino VGA Adapter which is capable of resolutions up to 1280x1024.
  It also uses the Adafruit_GFX library to control the graphics.
  
  It contains:
    -Computing Shield Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -YM2149 Audio Chip - For playing Atari ST YM files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.YM2149
        -http://www.papilio.cc/index.php?n=Papilio.YMVoice
    -Commodore 64 SID Chip - For playing SID files.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.SID
        -http://www.papilio.cc/index.php?n=Papilio.SIDVoice
    -ZPUino VGA Adapter - This is the latest and greatest graphics adapter that uses DMA to access SDRAM memory for video. Uses the Adafruit_GFX library for graphics.
    -Second UART - Connected to the Maxim RS232 converter on the Computing Shield
    -SPI Master - Connected to the SD card on the Computing Shield. Used with the SD library for full SD card access from your sketches.
  
  Special Notes:
    All audio chips connect to a 3 channel audio mixer and then to the Computing Shield audio pins.
  
  Supported boards:
    Papilio DUO 
  
  To use, include the following line in your sketch:
  #define circuit Computing_Shield2

*******************************************************************************************************************************************************************    

Gameduino_Computing_Shield Circuit
  Connects James Bowman's Gameduino project to a Computing Shield.
  http://store.gadgetfactory.net/computing-shield/
  http://excamera.com/sphinx/gameduino/
  
  All of the Gameduino sketchs can run on the AVR chip of the Papilio DUO. The FPGA runs the Gameduino design - together it is a self contained Gameduino.

  Special Notes:
    Look at the example sketches under File/Examples/Gameduino
  
  Supported boards:
    Papilio DUO 
  
  To use, include the following line in your sketch:
  #define circuit Gameduino_Computing_Shield

*******************************************************************************************************************************************************************    

Gameduino_LogicStart_Shield Circuit
  Connects James Bowman's Gameduino project to a LogicStart Shield.
  http://store.gadgetfactory.net/computing-shield/
  http://excamera.com/sphinx/gameduino/
  
  All of the Gameduino sketchs can run on the AVR chip of the Papilio DUO. The FPGA runs the Gameduino design - together it is a self contained Gameduino.

  Special Notes:
    Look at the example sketches under File/Examples/Gameduino
  
  Supported boards:
    Papilio DUO 
  
  To use, include the following line in your sketch:
  #define circuit Gameduino_LogicStart_Shield    

*******************************************************************************************************************************************************************  

LogicStart_MegaWing Circuit
  All the "chips" needed to put the LogicStart MegaWing through its paces with the Papilio Pro or Papilio One.

  It contains:
    -LogicStart MegaWing Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -HQVGA Adapter - This is an older VGA adapter that uses internal BRAM memory and can only generate 240x160 video output.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.VGA
        -http://www.papilio.cc/index.php?n=Papilio.VGALiquidCrystal
    -Seven Segment Controller
    -SPI Master for interfacing to the ADC chips on the MegaWing, is the following library:
      -http://www.papilio.cc/index.php?n=Papilio.ADC
  
  Supported boards:
    Papilio Pro  
    Papilio One 500K
  
  To use, include the following line in your sketch:
  #define circuit LogicStart_MegaWing
  
*******************************************************************************************************************************************************************  

LogicStart_MegaWing2 Circuit
  All the "chips" needed to put the LogicStart MegaWing through its paces with the Papilio Pro.
  
  The LogicStart_MegaWing2 circuit uses the more advanced VGA controller that is capable of 1280x1024 output.
  
  It contains:
    -LogicStart MegaWing Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -ZPUino VGA Adapter - This is the latest and greatest graphics adapter that uses DMA to access SDRAM memory for video. Uses the Adafruit_GFX library for graphics.
    -Seven Segment Controller
    -SPI Master for interfacing to the ADC chips on the MegaWing, is the following library:
      -http://www.papilio.cc/index.php?n=Papilio.ADC
  
  Supported boards:
    Papilio Pro  
  
  To use, include the following line in your sketch:
  #define circuit LogicStart_MegaWing2  

*******************************************************************************************************************************************************************  

LogicStart_Shield Circuit
  All the "chips" needed to put the LogicStart MegaWing through its paces with the Papilio Pro or Papilio One.

  It contains:
    -LogicStart MegaWing Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -HQVGA Adapter - This is an older VGA adapter that uses internal BRAM memory and can only generate 240x160 video output.
      -Libraries
        -http://www.papilio.cc/index.php?n=Papilio.VGA
        -http://www.papilio.cc/index.php?n=Papilio.VGALiquidCrystal
    -Seven Segment Controller
    
  Supported boards:
    Papilio DUO
  
  To use, include the following line in your sketch:
  #define circuit LogicStart_Shield
  
*******************************************************************************************************************************************************************  

LogicStart_Shield2 Circuit
  All the "chips" needed to put the LogicStart MegaWing through its paces with the Papilio Pro.
  
  The LogicStart_MegaWing2 circuit uses the more advanced VGA controller that is capable of 1280x1024 output.
  
  It contains:
    -LogicStart MegaWing Pinout
    -Audio passthrough - For playing Amiga MOD files or passing raw audio.
    -ZPUino VGA Adapter - This is the latest and greatest graphics adapter that uses DMA to access SDRAM memory for video. Uses the Adafruit_GFX library for graphics.
    -Seven Segment Controller

  Supported boards:
    Papilio DUO  
  
  To use, include the following line in your sketch:
  #define circuit LogicStart_Shield2    
  
*******************************************************************************************************************************************************************  

Robot_Control_Library Circuit
  5 PWM's and 3 Quadrature decoders connected to the flex pins so you can move them to any Papilio pin on the fly.
  
  The Robot Control Library is a neat library from OpenCores that includes a stepper controller, PWM, Quad Decoder, and PID. We will port the remaining components soon.
  
  It contains:
    -PWM
    -Quadrature Decoder

  Supported boards:
    Papilio DUO
    Papilio Pro
    Papilio One 500K  
    Papilio One 250K
    
  To use, include the following line in your sketch:
  #define circuit Robot_Control_Library   
    
*******************************************************************************************************************************************************************  

ZPUino_Vanilla Circuit
  This is a basic ZPUino circuit with nothing attached to the Wishbone bus. It is the base that is used when you make your own ZPUino circuits from scratch or you want to use the FPGA like an Arduino.

  Supported boards:
    Papilio DUO
    Papilio Pro
    Papilio One 500K  
    Papilio One 250K
    
  To use, include the following line in your sketch:
  #define circuit ZPUino_Vanilla   
    
*******************************************************************************************************************************************************************  

ZPUino_Wings Circuit
  This may be one of the more interesting circuits becuase it contains all of the current Papilio Wings connected at once to different Wing Slots.

  It contains:

    -Wii Chuck Wing connected to AL Wing Slot. Uses the WiiChuck and I2C library.
    -VGA Wing connected to AH Wing Slot with the latest and ZPUino VGA Adapter - This is the latest and greatest graphics adapter that uses DMA to access SDRAM memory for video. Uses the Adafruit_GFX library for graphics.
    -SD Card Wing connected to CL with an SPI master. Used with the SD library for full SD card access from your sketches.
    -Audio Wing connected to CH with three audio chips connected to it through the audiomixer.
      -Audio passthrough - For playing Amiga MOD files or passing raw audio.
      -YM2149 Audio Chip - For playing Atari ST YM files.
        -Libraries
          -http://www.papilio.cc/index.php?n=Papilio.YM2149
          -http://www.papilio.cc/index.php?n=Papilio.YMVoice
      -Commodore 64 SID Chip - For playing SID files.
        -Libraries
          -http://www.papilio.cc/index.php?n=Papilio.SID
          -http://www.papilio.cc/index.php?n=Papilio.SIDVoice
      


  Supported boards:
    Papilio DUO
    Papilio Pro
    Papilio One 500K  
    Papilio One 250K
    
  To use, include the following line in your sketch:
  #define circuit ZPUino_Wings  
*/
