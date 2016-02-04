
#define circuit Wishbone_Sump_LA

using namespace ZPUino;

class Capture: public BaseDevice
{
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
        samples = 0xff;
        buffer = (uint32_t*)malloc(samples*sizeof(uint32_t));
        armed=0;
    }
    unsigned getStatus()
    {
        return REG(0);
    }
    void longCommand(uint8_t opcode, uint32_t data)
    {
      REG(opcode) = data;
    }
    
    void start()
    {
        REG(100) = (unsigned)&buffer[0];
        REG(101) = (unsigned)&buffer[samples];
               
        
//        //Mask
//        REG(0xc0) = 0x00000001;
//        //Mask Value
//        REG(0xc1) = 0x00000001;
//        
//        //Trigger Conf
//        REG(0xc2) = 0x08000000;
//        //Speed
//        REG(0x80) = 0x00000008;
//        //Size
//        //REG(0x81) = 0x20000000;
//        REG(0x81) = 0x00100000;
//        //Flags
//        REG(0x82) = 0x00000000;
//        //ARM
//        REG(0x01) = 0x00000000;    


//        //Mask
//        REG(0xc0) = 0x10000000;
//        //Mask Value
//        REG(0xc1) = 0x10000000;
//        
//        //Trigger Conf
//        REG(0xc2) = 0x00000008;
//        //Speed
//        REG(0x80) = 0x00000000;
//        //Size
//        //REG(0x81) = 0x20000000;
//        REG(0x81) = 0x00000001;
//        //Flags
//        REG(0x82) = 0x00000000;
//        //ARM
//        REG(0x01) = 0x00000000;  

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
                for (i=0;i<samples; i++) {
                  Serial.write(buffer[i]&0xff);
                  Serial.write((buffer[i]>>8)&0xff);
                  Serial.write((buffer[i]>>16)&0xff);
                  Serial.write((buffer[i]>>24)&0xff);                  
                  
                  
//                    Serial.write((uint8_t)0x00);
//                    Serial.write((uint8_t)( i& 1));
//                    Serial.write((uint8_t)0x00);
//                    Serial.write((uint8_t)0x00);
                    
                    //Serial.write(buffer[i]);
                    //Serial.println(buffer[i], HEX);
                }
              //reset();
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
             Serial.println(serialBuffer[i], HEX); 
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
//        serialBuffer[serialIndex] = i;
//        serialIndex++;
        handleSerial(i&0xff);
        //handleSerial(i);
    }
    mycap.sendIfReady();
    //mycap.arm();
    //mycap.dump();
}
