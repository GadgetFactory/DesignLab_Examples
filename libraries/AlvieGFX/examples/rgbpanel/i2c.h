#ifndef __i2c_h__
#define __i2c_h__

#include <Arduino.h>
#include <zpuino.h>

#define I2CREG_PRERlo REG(0)
#define I2CREG_PRERhi REG(1)
#define I2CREG_CTR REG(2)
#define I2CREG_TXR REG(3)
#define I2CREG_RXR REG(3)
#define I2CREG_CR REG(4)
#define I2CREG_SR REG(4)
#define I2CPRESCALE( x )  ( (CLK_FREQ/(5* x ) )-1 )

#define I2C_ENABLED 7
#define I2C_INTR_ENABLED 6

#define I2C_STA 7
#define I2C_STO 6
#define I2C_RD  5
#define I2C_WR  4
#define I2C_ACK 3
#define I2C_IACK 0

#define I2C_RXACK 7
#define I2C_BUSY 6
#define I2C_AL 5
#define I2C_TIP 1
#define I2C_IF 0

using namespace ZPUino;

class I2C_class: public BaseDevice
{
public:
    I2C_class(): BaseDevice(1) {
    }
    void begin(unsigned int speed) {
        if (deviceBegin(0x04, 0x01)==0) {
            unsigned pres = I2CPRESCALE(speed);
            I2CREG_CTR=0; // Disable all
            I2CREG_PRERhi = pres>>8;
            I2CREG_PRERlo = pres&0xff;
            printf("I2C at slot %d, instance %d, base register 0x%08x\r\n",
                   getSlot(), getInstance(), getBaseRegister());

            //Serial.println(I2CREG_PRERhi, HEX);
        } else {
            Serial.println("I2C device not found\r\n");
        }
    }

    void enable()
    {
        I2CREG_CTR = _BV(I2C_ENABLED);
    }
    unsigned int getStatus(){
        return I2CREG_SR;
    }

    int tx(unsigned byte, void (*idle)(void)=NULL)
    {
        I2CREG_TXR = byte;
	I2CREG_CR = _BV(I2C_WR);
        while (I2CREG_SR & 0x2) {
            if (idle)
                idle();
        }
       // Serial.print("Tx: SR: ");
       // Serial.println(I2CREG_SR,HEX);

        if ((I2CREG_SR & 0x80)==0x0)
            return 0;

        return -1;
    }

    int rx(unsigned char *target, int size, bool stop, void (*idle)(void)=NULL)
    {
        while (size--) {
            unsigned f = _BV(I2C_RD);

            if(size==0) {
                f|=_BV(I2C_ACK);
                if (stop)
                    f|=_BV(I2C_STO);
            }
            I2CREG_CR = f;
            do {
                if (idle)
                    idle();

                f=I2CREG_SR;
            } while ( f & _BV(I2C_TIP) );

            *target++=I2CREG_RXR;
            if (size==0)
                return 0;

            if ((I2CREG_SR & 0x80)!=0)   {
                //Serial.print("Err while remaining");
                //Serial.println(size);
                return -1;
            }
            //Serial.print("R ");
        }
        return 0;
    }

    int start(unsigned int address, int read, void (*idle)(void)=NULL)
    {
	I2CREG_TXR = (address<<1)|read;
        I2CREG_CR = _BV(I2C_STA) | _BV(I2C_WR);

        while (I2CREG_SR & _BV(I2C_TIP)) {
            //Serial.println("Busy...\n");
            //delay(100);
            if (idle)
                idle();
        }

        if ((I2CREG_SR & 0x80)==0)
            return 0;
        /* got ack ? */
	return -1;
    }

    void stop() {
        I2CREG_CR = _BV(I2C_STO);
    };

};


extern I2C_class I2C;

#endif
