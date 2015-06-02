
#define WIICHUCK_ADDRESS 0x52

#include "i2c.h"
#include "wiichuck.h"


void WIIChuck_class::begin()
{
    I2C.begin(100000);
    I2C.enable();
}

void WIIChuck_class::prstatus()
{
    Serial.print("Status: ");
    printf( "0x%x\n", I2C.getStatus() );
}
#if 0
void prctr()
{
    I2CREG_CR = _BV(I2C_STA);

    Serial.print("CR: ");
    printbin(I2CREG_CR,8);
    Serial.println("");

    Serial.print("CTR: ");
    printbin(I2CREG_CTR,8);
    Serial.println("");
}
#endif




int WIIChuck_class::init_nunchuck()
{
    int err = 0;
    if (I2C.start(WIICHUCK_ADDRESS,0)!=0)
        err = -1;
    if (err==0)
        if (I2C.tx(0x40)!=0)
            err = -1;
    if (err==0)
        if (I2C.tx(0x00)!=0)
            err = -1;
    I2C.stop();

    return err;

    delay(100);

    if (I2C.start(WIICHUCK_ADDRESS,0)!=0)
        return -1;
    if (I2C.tx(0xfb)!=0)
        return -1;
    if (I2C.tx(0x00)!=0)
        return -1;
    I2C.stop();


    return 0;
}

int WIIChuck_class::send_zero(void (*idle)(void))
{
    if (I2C.start(WIICHUCK_ADDRESS,0,idle)!=0)
        return -1;
    if (I2C.tx(0x0,idle)!=0)
        return -1;
    I2C.stop();

    if (idle) {
        unsigned t= millis()+10;
        while(millis()<t) {
            idle();
        }
    } else {
        delay(10);
    }

    return 0;
}


void WIIChuck_class::update(void (*idle)(void))
{
    unsigned char buf[6];

    send_zero(idle);

    I2C.start(WIICHUCK_ADDRESS,1,idle);

    int i;
    for (i=0;i<sizeof(buf);i++) {
        buf[i] = 0;
    }
    if (I2C.rx(buf,sizeof(buf),true)!=0) {
        Serial.println("Error read");
        //return;
    }
    send_zero(idle);

    for (i=0;i<sizeof(buf);i++) {
        buf[i] = nunchuk_decode_byte(buf[i]);
    }
    

    nunchuck_update_data(buf);
}


void WIIChuck_class::nunchuck_update_data(unsigned char *nunchuck_buf)
{ 
  joy_x_axis = nunchuck_buf[0];
  joy_y_axis = nunchuck_buf[1];
  accel_x_axis = nunchuck_buf[2]; // * 2 * 2;
  accel_y_axis = nunchuck_buf[3]; // * 2 * 2;
  accel_z_axis = nunchuck_buf[4]; // * 2 * 2;

  accel_x_axis <<=2;
  accel_y_axis <<=2;
  accel_z_axis <<=2;

  z_button = 1;
  c_button = 1;

  // byte nunchuck_buf[5] contains bits for z and c buttons
  // it also contains the least significant bits for the accelerometer data
  // so we have to check each bit of byte outbuf[5]
  if ((nunchuck_buf[5] >> 0) & 1) 
      z_button = 0;
  if ((nunchuck_buf[5] >> 1) & 1)
      c_button = 0;

  if (z_button) {
      c_button=!!c_button;
  }

  if ((nunchuck_buf[5] >> 2) & 1) 
    accel_x_axis += 2;
  if ((nunchuck_buf[5] >> 3) & 1)
    accel_x_axis += 1;

  if ((nunchuck_buf[5] >> 4) & 1)
    accel_y_axis += 2;
  if ((nunchuck_buf[5] >> 5) & 1)
    accel_y_axis += 1;

  if ((nunchuck_buf[5] >> 6) & 1)
    accel_z_axis += 2;
  if ((nunchuck_buf[5] >> 7) & 1)
    accel_z_axis += 1;
}

unsigned char WIIChuck_class::nunchuk_decode_byte (unsigned char x)
{
  x = (x ^ 0x17) + 0x17;
  return x;
}

WIIChuck_class WIIChuck;
