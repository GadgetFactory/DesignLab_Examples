#ifndef __LPFILTER_H__
#define __LPFILTER_H__

#include <Arduino.h>

/*
 LP Technicalities:

   z(0) = LPC * ( z(-1)*FBG - x(0) )
   */

#define LPCOEFF 0.99   /* Low-pass coefficient */
#define SHIFTADJ 8 /* Shift adjust - 256 */
#define FLT_R int((LPCOEFF*(1<<SHIFTADJ)))

#if 0
#define GAIN 1.0 /* Unity gain */
#define FBGAIN_ADJ ((1.0/LPCOEFF)-(GAIN))
#endif



template<unsigned int size>
    class LPFilter
{
public:
    LPFilter() {
        reset();
    }
    void reset()
    {
        memset(lpdata,0,sizeof(lpdata));
    }
    int lowpass(int index, int value)
    {
        int ZM1 = lpdata[index];

        int vc = (FLT_R * value) + ZM1 - ((ZM1*FLT_R)>>SHIFTADJ);
        lpdata[index] = vc;
        return vc>>SHIFTADJ;
    }
private:
    int lpdata[size];
};

#endif
