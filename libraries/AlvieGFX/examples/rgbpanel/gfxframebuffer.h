#ifndef __GFXFramebuffer_H__
#define __GFXFramebuffer_H__

#ifdef __linux__
#include <stdlib.h>
#include <string.h>
#endif

#include "Adafruit_GFX.h"


class GFXFramebuffer_class: public Adafruit_GFX_32
{
public:
    unsigned NUMBERPIXELS;
    unsigned alpha;

    GFXFramebuffer_class(): Adafruit_GFX_32()
    {
        alpha = 0xff000000;
    }

    void setAlpha(unsigned v)
    {
        alpha = ((unsigned)v)<<24;
    }

    void begin(int width, int height)
    {
        NUMBERPIXELS = width*height;

        screen = (unsigned int*)malloc(sizeof(unsigned int)*NUMBERPIXELS);

        Adafruit_GFX_32::begin(width,height);
    }

    virtual void drawPixel(int x, int y, unsigned int v)
    {
        if (x<WIDTH && y<HEIGHT)
            screen[x+(y*WIDTH)]=v + alpha;
    }
 /*
    inline void setPixel(int x, int y, int r, int g, int b)
    {
        unsigned char c0 = linearTable[r&0xff];
        unsigned char c1 = linearTable[g&0xff];
        unsigned char c2 = linearTable[b&0xff];
        unsigned int v = c2 + (c1<<8) + (c0<<16);
        screen[x+(y*WIDTH)]=v;
    }

    inline void setPixelRaw(int x, int y, int v)
    {
        screen[x+(y*WIDTH)]=v;
    }
   */
    void overlayToFramebuffer(unsigned int *dest)
    {
        int i,z;
        for (i=0;i<NUMBERPIXELS; i++) {
            // Load and parse each of the RGB.
            unsigned char *sourceptr = (unsigned char *)&screen[i];
            unsigned char *destptr = (unsigned char *)&dest[i];
            int alpha = sourceptr[0];
            //alpha+=1;
            //alpha<<=8;
            //alpha=0xE0;
            for (z=1;z<4;z++) {
                int dst = destptr[z];
                int src = sourceptr[z];
                int fixup = (alpha*(src-dst))/256;
                dst += fixup;
                destptr[z] = dst;
                /*
                 d = sA*(1-p)+dA*p;
                 d = sA + p*dA - p*sA;
                 d = sA + p(dA-sA)
                    1 => d = sA+dA-sA == dA
                    0 => d = sA
                    0.5 => d = sA + 0.5dA - 0.5sA =
                */
            }
        }
    }

    void clear(unsigned color=0)
    {
        int i;
        for (i=0;i<NUMBERPIXELS;i++) {
            screen[i] = color;
        }
    }
    uint32_t *getScreen() { return screen; }


    uint32_t *screen;
};

#endif
