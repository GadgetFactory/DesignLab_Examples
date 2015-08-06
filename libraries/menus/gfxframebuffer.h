#ifndef __GFXFramebuffer_H__
#define __GFXFramebuffer_H__

#ifdef __linux__
#include <stdlib.h>
#include <string.h>
#endif

#include "Adafruit_GFX.h"
#include "ZPUino_GFX.h"

using namespace ZPUino;

template<typename PixelType>
    class GFXFramebuffer_class:
    public Adafruit_GFX_core<PixelType>,
    public Framebuffer<PixelType>
{
public:
    unsigned NUMPIXELS;
    PixelType transColor;

    GFXFramebuffer_class(): Adafruit_GFX_core<PixelType>()
    {
        transColor = 0;
    }

    void setTransparentColor(PixelType p)
    {
        transColor = p;
    }

    void begin(int width, int height)
    {
        NUMPIXELS = width*height;
        Framebuffer<PixelType>::allocate(NUMPIXELS,width);
        Adafruit_GFX_core<PixelType>::begin(width,height);
    }

    virtual void drawPixel(int x, int y, PixelType v)
    {
        if (x<Adafruit_GFX_core<PixelType>::width() && y<Adafruit_GFX_core<PixelType>::height())
            Framebuffer<PixelType>::getFramebuffer()[x+(y*Framebuffer<PixelType>::getStride())]=v;
    }
#if 0
    void overlayToFramebuffer(unsigned int *dest)
    {
        int i,z;
        for (i=0;i<NUMPIXELS; i++) {
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
#endif
    void overlayToFramebuffer(Framebuffer<PixelType> &fb, int dx, int dy);
    void clear(PixelType color=0);

};

#endif