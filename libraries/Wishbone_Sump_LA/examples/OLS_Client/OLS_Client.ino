
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
    uint32_t samples;

    Capture(): BaseDevice(-1) {
    }
    void begin()
    {
        if (deviceBegin(VENDOR_ZPUINO, 0x22)==0) {
        } else {
            printf("Cannot find device\n");
        }
        //samples = 300000;
        samples = 65536;
        buffer = (uint32_t*)malloc(samples*sizeof(uint32_t));
        //memset(buffer, 0xff, samples*sizeof(uint32_t));
        armed=0;
        channel0=0;
        channel1=0;
        channel2=0;
        channel3=0;
    }
    unsigned getStatus()
    {
        return REG(0);
    }
    
    unsigned getTriggerAddress()
    {
        return REG(1);
    }    
    
    unsigned getSamples()
    {
        return samples;
    }       
    
    void longCommand(uint8_t opcode, uint32_t data)
    {
        uint32_t tmpData;
        switch (opcode) {
        case 0x81: // Size
            //samples = (data&0xffff)+((data>>16)&0xffff);
            //samples = ((((data>>16)&0x00ff)*0x100 + ((data>>24)&0xff)));
            tmpData = (data>>16);  //Shift Read Count over
            samples = ((tmpData & 0xFFU) << 8 | (tmpData & 0xFF00U) >> 8)*4 + 4; //Reverse bytes of Read Count
            //samples = (((data>>16)&0x00ff)*0x100 + ((data>>24)&0xff)) + (((data&0xff)*0x100) + ((data>>8)&0xff));
            
            //free(buffer);
            //buffer = (uint32_t*)malloc(samples*sizeof(uint32_t));            

            //buffer = (uint32_t*) realloc(buffer,samples);
            //memset(buffer, 0xff, samples*sizeof(uint32_t));            
            //REG(100) = (unsigned)&buffer[0];
            //REG(101) = (unsigned)&buffer[samples];
            //Serial.write(samples);
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
        //REG(100) = (unsigned)&buffer[0];
        //REG(101) = (unsigned)&buffer[samples];
        
  //Set base address for shared memory
  REGISTER(IO_SLOT(14),0x100) = (unsigned)&buffer[0];
  //Set end of shared memory
  //REGISTER(IO_SLOT(14),0x101) = (unsigned)&buffer[8192];         
  REGISTER(IO_SLOT(14),0x101) = (unsigned)&buffer[samples];         

    }
    void reset()
    {
        //REG(2) = 2;
        REG(0) = 0;
        armed = 0;
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
        unsigned trigAddress = 0;
        if (armed) {
            if ((getStatus())==0x43) {
                // Transmit.
                //Serial.println("In Transmit");
                trigAddress = getTriggerAddress();
                //Serial.print("Trigger address: ");
                //Serial.println(trigAddress);
                //for (i=samples+trigAddress;i>=trigAddress; i--) {
                for (i=samples;i>=0; i--) {
                //for (i=0;i<=samples; i++) {
                  if (channel0==0) Serial.write(buffer[i]&0xff);
                  if (channel1==0) Serial.write((buffer[i]>>8)&0xff);
                  if (channel2==0) Serial.write((buffer[i]>>16)&0xff);
                  if (channel3==0) Serial.write((buffer[i]>>24)&0xff);                  
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
            Serial.println(mycap.getStatus());
            break;  
        case 0x62: // getStatus
            for (int i = 0; i < serialIndex; i++ ){
             Serial.write(serialBuffer[i]); 
            }      
            break;   
        case 0x63: // getTrigger

             Serial.write(mycap.getTriggerAddress());   
            break; 
        case 0x64: // getSamples
             Serial.println(mycap.getSamples(), HEX);   
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
