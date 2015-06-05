#include "jpeglib.h"
#include <SmallFS.h>

#define COLOR_BYTES 4
#define COLOR_WEIGHT_R 8
#define COLOR_WEIGHT_G 8
#define COLOR_WEIGHT_B 8

#define COLOR_SHIFT_R 16
#define COLOR_SHIFT_G 8
#define COLOR_SHIFT_B 0

typedef uint32_t PixelType;
PixelType *imgbuf;

void drawimage()
{
    RGBPanel.setImage(imgbuf);
}

void setup()
{
    SmallFS.begin();
    readjpeg("/smallfs/image.jpg");

    RGBPanel.clear();
    drawimage();
    RGBPanel.apply();

}

void jpeg_error(jpeg_common_struct*)
{
    printf("Error reading JPEG\r\n");
    while (1) {
    }
}


int readjpeg(const char *file)
{
    jpeg_decompress_struct cinfo;

    jpeg_error_mgr defaultErrorManager;

    cinfo.err = jpeg_std_error(&defaultErrorManager);

    defaultErrorManager.error_exit = &jpeg_error;

    FILE* pFile = fopen(file, "rb");
    if (!pFile)
        return -1;

    jpeg_create_decompress(&cinfo);
    jpeg_stdio_src(&cinfo, pFile);
    jpeg_read_header(&cinfo, TRUE);
    jpeg_start_decompress(&cinfo);

    printf("JPEG image info: %d x %d\n", cinfo.image_width, cinfo.image_height);

    unsigned row_stride = cinfo.output_width * cinfo.output_components;

    unsigned char *buffer = (unsigned char*)malloc(row_stride);

    unsigned int v;

    imgbuf = (PixelType*)malloc(row_stride * cinfo.image_height*sizeof(uint32_t));
    PixelType *iter = imgbuf;
    while(cinfo.output_scanline < cinfo.image_height)
    {
        int s = jpeg_read_scanlines(&cinfo, &buffer, 1);
        printf("%d\r\n",cinfo.output_scanline);
        unsigned char *ptr = buffer;
        int x;
        for (x=0; x<cinfo.image_width; x++) {
#if 1
            uint32_t r = (ptr[0] >> (8 - COLOR_WEIGHT_R));
            uint32_t g = (ptr[1] >> (8 - COLOR_WEIGHT_G));
            uint32_t b = (ptr[2] >> (8 - COLOR_WEIGHT_B));
            v = (r<<(COLOR_SHIFT_R)) + (g<<COLOR_SHIFT_G) + (b<<COLOR_SHIFT_B);
#endif
            *iter=v;
            ptr+=3;
            iter++;
        }
        //imgbuf+=(gfx.width()-cinfo.image_width);
    }
    jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    fclose(pFile);
    free(buffer);
    printf("All done\r\n");
    return 0;

}
