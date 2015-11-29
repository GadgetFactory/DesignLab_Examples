#include "jpeglib.h"
#include <ZPUino_GFX.h>
#include <Adafruit_GFX.h>
#include <PLL.h>
#include <SmallFS.h>

ZPUino_GFX hdmi;

static int readjpeg(const char *file);

void setup()
{
    Serial.begin(115200);
    SmallFS.begin();
    hdmi.begin(MODE_1280x720);
    readjpeg("/smallfs/image.jpg");
    hdmi.print("Hello world");
}

void loop()
{
}

typedef uint16_t PixelType;

#ifdef MODE332

#define COLOR_BYTES 1
#define COLOR_WEIGHT_R 3
#define COLOR_WEIGHT_G 3
#define COLOR_WEIGHT_B 2

#else

#define COLOR_BYTES 2
#define COLOR_WEIGHT_R 5
#define COLOR_WEIGHT_G 6
#define COLOR_WEIGHT_B 5

#endif

#define COLOR_SHIFT_R (COLOR_WEIGHT_B+COLOR_WEIGHT_G)
#define COLOR_SHIFT_G (COLOR_WEIGHT_B)
#define COLOR_SHIFT_B 0

PixelType *imgbuf;

static void jpeg_error(jpeg_common_struct*)
{
    //printf("Error reading JPEG\r\n");
    Serial.println("Error reading JPEG");
    while (1) {
    }
}

static int readjpeg(const char *file)
{
    jpeg_decompress_struct cinfo;

    jpeg_error_mgr defaultErrorManager;

    cinfo.err = jpeg_std_error(&defaultErrorManager);

    defaultErrorManager.error_exit = &jpeg_error;

    FILE* pFile = fopen(file, "rb");
    if (!pFile) {
        printf("Cannot open file\r\n");
        return -1;
    }
    Serial.println("JPEG initialize");
    jpeg_create_decompress(&cinfo);
    Serial.println("JPEG initialize2");
    jpeg_stdio_src(&cinfo, pFile);
    Serial.println("JPEG initialize3");
    jpeg_read_header(&cinfo, TRUE);
    printf("JPEG image info: %d x %d\n", (int)cinfo.image_width, (int)cinfo.image_height);
    Serial.println("JPEG initialize4");
    jpeg_start_decompress(&cinfo);
    Serial.println("JPEG initialized OK");



    Serial.println("Preparing for FB");

    unsigned row_stride = cinfo.output_width * cinfo.output_components;

    unsigned char *buffer = (unsigned char*)malloc(row_stride);

    unsigned short v;
    PixelType *imgbuf = hdmi.getFramebuffer();
 
    while(cinfo.output_scanline < cinfo.image_height)
    {
        int s = jpeg_read_scanlines(&cinfo, &buffer, 1);
        printf("%d\r\n",cinfo.output_scanline);
        unsigned char *ptr = buffer;
        int x;
        for (x=0; x<cinfo.image_width; x++) {
            uint16_t r = (ptr[0] >> (8 - COLOR_WEIGHT_R));
            uint16_t g = (ptr[1] >> (8 - COLOR_WEIGHT_G));
            uint16_t b = (ptr[2] >> (8 - COLOR_WEIGHT_B));
            v = (r<<(COLOR_SHIFT_R)) + (g<<COLOR_SHIFT_G) + (b<<COLOR_SHIFT_B);
            *imgbuf=v;
            ptr+=3;
            imgbuf++;
        }
        imgbuf+=(hdmi.width()-cinfo.image_width);
    }
    jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    fclose(pFile);
    free(buffer);
    printf("All done\r\n");
    return 0;

}
