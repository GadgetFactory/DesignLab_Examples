#include "gfxframebuffer.h"

void GFXFramebuffer_class<uint16_t>::overlayToFramebuffer(Framebuffer<uint16_t> &fb, int dx, int dy)
{
    int x,y,z;
    
    for (y=0; y<height();y++) {

        uint16_t *sourceptr = &getFramebuffer()[y*getStride()];
        uint16_t *destptr = &fb.getFramebuffer()[dx+((dy+y)*fb.getStride())];

        for (x=0;x<width(); x++) {
            uint16_t pix = *sourceptr;
            if (pix!=transColor) {
                *destptr=pix;
            }
            sourceptr++;
            destptr++;
        }
    }
}
void GFXFramebuffer_class<uint16_t>::clear(uint16_t color)
{
    int i;
    for (i=0;i<NUMPIXELS;i++) {
        getFramebuffer()[i] = color;
    }
}
