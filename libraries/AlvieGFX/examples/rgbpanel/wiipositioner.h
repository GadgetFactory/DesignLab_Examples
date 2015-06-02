#ifndef __WIIPOSITIONER_H__
#define __WIIPOSITIONER_H__

#include "wiichuck.h"

#define DEADZONE 5 /* Joy dead zone */

template<unsigned int MAXX,unsigned int MAXY>
class Positioner_class
{
public:
    Positioner_class(): SHIFTPOS(5)
    {
    }
    int SHIFTPOS;
    void setShift(int i) {
        SHIFTPOS=i;
    }
    int centerx,centery; // Joy center
    void calibrate(){
        WIIChuck.update();

        centerx = WIIChuck.getJoyX();
        centery = WIIChuck.getJoyY();
    }
    void set(int x, int y)
    {
        xpos=x<<SHIFTPOS; ypos=y<<SHIFTPOS;
    }
    int getX() const { return xpos >> SHIFTPOS; }
    int getY() const { return ypos >> SHIFTPOS; }

    void update()
    {
        //WIIChuck.update();
        updateData();
    }

    int deltax, deltay;
    int getDeltaX() const { return deltax; }
    int getDeltaY() const { return deltay; }

    void updateData()
    {
        int jx = (int)WIIChuck.getJoyX() - centerx;
        int jy = centery - (int)WIIChuck.getJoyY();

        deltax=deltay=0;

        if (jx>DEADZONE || jx<-DEADZONE) {
            deltax=jx;
            xpos+=jx;
        }

        if (jy>DEADZONE|| jy<-DEADZONE) {
            deltay=jy;
            ypos+=jy;
        }

        if (xpos<0)
            xpos=0;

        if (ypos<0)
            ypos=0;

        if (xpos>=MAXX<<SHIFTPOS)
            xpos =(MAXX<<SHIFTPOS)-1;

        if (ypos>=MAXY<<SHIFTPOS)
            ypos =(MAXY<<SHIFTPOS)-1;
    }
protected:
    int xpos,ypos;
};
#endif
