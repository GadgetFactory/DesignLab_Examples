#ifndef __WIICHUCK_H__
#define __WIICHUCK_H__

#include "i2c.h"


#define BUTTON_Z 1
#define BUTTON_C 2
#define BUTTON_ZC 3

class WIIChuck_class
{
public:
    void begin();
    void prstatus();
    void update(void (*idle)(void)=NULL);

    int init_nunchuck();
    int send_zero(void (*idle)(void)=NULL);

    unsigned char nunchuk_decode_byte (unsigned char x);
    void nunchuck_update_data(unsigned char *nunchuck_buf);

    int getJoyX() const { return joy_x_axis; }
    int getJoyY() const { return joy_y_axis; }
    int getZButton() const { return z_button; }
    int getCButton() const { return c_button; }
    int getButtons() const { return (c_button<<1)+z_button; }

    int getAccelX() const { return accel_x_axis; }
    int getAccelY() const { return accel_y_axis; }
    int getAccelZ() const { return accel_z_axis; }
    int joy_x_axis;
    int joy_y_axis;
    int accel_x_axis;
    int accel_y_axis;
    int accel_z_axis;

    int z_button;
    int c_button;
};

extern WIIChuck_class WIIChuck;
#endif
