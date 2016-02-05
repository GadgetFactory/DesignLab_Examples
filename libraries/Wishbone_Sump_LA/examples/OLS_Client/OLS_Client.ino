
#define circuit Wishbone_Sump_LA

using namespace ZPUino;

class Capture: public BaseDevice
{
private:
    byte channel0;
    byte channel1;
    byte channel2;
    byte channel3;
    
public:
    uint32_t *buffer;
    size_t samples;

    Capture(): BaseDevice(-1) {
    }
    void begin()
    {
        if (deviceBegin(VENDOR_ZPUINO, 0x22)==0) {
        } else {
            printf("Cannot find device\n");
        }
        samples = 0x10;
        buffer = (uint32_t*)malloc(samples*sizeof(uint32_t));
        armed=0;
        channel0=1;
        channel1=1;
        channel2=1;
        channel3=1;
    }
    unsigned getStatus()
    {
        return REG(0);
    }
    void longCommand(uint8_t opcode, uint32_t data)
    {
        switch (opcode) {
        case 0x81: // Size
            //samples = (data&0xffff)+((data>>16)&0xffff);
            samples = ((((data>>16)&0x00ff)*0x100 + ((data>>24)&0xff))+1)*4;
            //samples = (((data>>16)&0x00ff)*0x100 + ((data>>24)&0xff)) + (((data&0xff)*0x100) + ((data>>8)&0xff));
            //(b3+b4)+(b2+b1)
            //free(buffer);
            //buffer = (uint32_t*) realloc(buffer,samples);
            //REG(100) = (unsigned)&buffer[0];
            //REG(101) = (unsigned)&buffer[samples];
            //Serial.println(samples, HEX);
            break;
        case 0x82: //Channel Groups
            channel0 = data>>26&0x01;
            channel1 = data>>27&0x01;
            channel2 = data>>28&0x01;
            channel3 = data>>29&0x01;
//            Serial.print("Channel0: ");
//            Serial.println(channel0);
//            Serial.print("Channel1: ");
//            Serial.println(channel1);
//            Serial.print("Channel2: ");
//            Serial.println(channel2);
//            Serial.print("Channel3: ");
//            Serial.println(channel3);
            break;
        }      
      
      REG(opcode) = data;
    }
    
    void start()
    {
        REG(100) = (unsigned)&buffer[0];
        REG(101) = (unsigned)&buffer[samples];
        
  //Set base address for shared memory
  //REGISTER(IO_SLOT(14),0x100) = (unsigned)&buffer[0];
  //Set end of shared memory
  //REGISTER(IO_SLOT(14),0x101) = (unsigned)&buffer[8192];         

    }
    void reset()
    {
        //REG(2) = 2;
        REG(0) = 0;
    }
    void arm()
    {
        REG(1) = 0;
        armed=1;
    }
    void dump()
    {
        int i;
        for (i=0;i<16; i++) {
            printf("%08x\n", buffer[i]);
        }
    }
    void sendIfReady()
    {
        int i;
        if (armed) {
            if ((getStatus())==0x43) {
                // Transmit.
                //Serial.println("In Transmit");
                for (i=samples;i>=0; i--) {
                //for (i=0;i<=samples; i++) {
                  if (channel0=1) Serial.write(buffer[i]&0xff);
                  if (channel1=1) Serial.write((buffer[i]>>8)&0xff);
                  if (channel2=1) Serial.write((buffer[i]>>16)&0xff);
                  if (channel3=1) Serial.write((buffer[i]>>24)&0xff);                  
                }
              reset();
            }
        }
    }

    uint8_t armed;
};

Capture mycap;

void setup()
{
    //delay(3000);
    Serial.begin(115200);

    mycap.begin();
    mycap.start();
    //mycap.arm();
}

typedef enum {
    IDLE,
    LONG1,
    LONG2,
    LONG3,
    LONG4
} state_t;

state_t state = IDLE;
uint32_t longcommand;
uint8_t opcode;
unsigned int serialBuffer[8192];
int serialIndex = 0;


void processLong(uint32_t v)
{

  mycap.longCommand(opcode,longcommand);

//   Serial.println(); 
//   Serial.print("Opcode: ");
//   Serial.println(opcode, HEX);
//   Serial.print("LongCommand: ");
//   Serial.println(longcommand, HEX);

}

void handleSerial(uint8_t v)
{
    //Serial.println(state, HEX);
    switch(state) {
    case IDLE:
        //Serial.println("In Idle");
        switch (v) {
        case 0x00: // Reset
            mycap.reset();
            break;
        case 0x01: // Arm
            mycap.arm();
            break;
        case 0x02: // id
            Serial.write((const uint8_t*)"1ALS",4);
            //Serial.print("1ALS");
            break;
        case 0x61: // getStatus
            Serial.println(mycap.getStatus(), HEX);
            break;  
        case 0x62: // getStatus
            for (int i = 0; i < serialIndex; i++ ){
             Serial.write(serialBuffer[i]); 
            }      
            break;    
        default:
            if (v & 0x80) {
                //longcommand = v;
                opcode = v;
                state = LONG1;
            }
            break;
        }
        break;
    case LONG1:
        //Serial.println("In LONG1");
//        longcommand<<=8;
//        longcommand += v;
        longcommand = v;
        state = LONG2;
        break;
    case LONG2:
        longcommand<<=8;
        longcommand += v;
        state = LONG3;
        break;
    case LONG3:
        longcommand<<=8;
        longcommand += v;
        state = LONG4;
        break;        
    case LONG4:
        longcommand<<=8;
        longcommand += v;
        processLong(v);
        state = IDLE;
        break;
    }
}


void loop()
{
    if (Serial.available())
    {
        int i = Serial.read();
        //Serial.println(i, HEX);
        serialBuffer[serialIndex] = i;
        serialIndex++;
        handleSerial(i&0xff);
        //handleSerial(i);
    }
    mycap.sendIfReady();
    //mycap.arm();
    //mycap.dump();
}
