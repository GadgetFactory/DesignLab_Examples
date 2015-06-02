#ifndef __AUDIO_H__
#define __AUDIO_H__

#include <SD.h>
#include "lpfilter.h"
#include "panel.h"
#include "cbuffer.h"
#include "FFT.h"
#include "wiipositioner.h"

#define NUMBER_COLUMNS 16  /* Don't change this for now */
#define NUMBER_ROWS 32
#define DISPLAY_COLUMNS 64

#define FFTSIZE 512
typedef FFT_512 FFT_type;

#define DECAYM 0x3 // 0x7
#define MAXDECAY (NUMBER_ROWS*DECAYM)


#define MAXSPRES 1


#define MAXNPRES 2

static int lastlevel[NUMBER_COLUMNS] = {0}; // For decay

class AudioPlayer
{
public:
    AudioPlayer();
    void begin();
    void start();
    void stop();
    void reset();

    void play();
    void open();
protected:
    bool timerExpiredImpl();
    static bool timerExpired(void*);
    void levelController(int,int);
    void loadFFTData();
    void captureForDisplay(unsigned);
    void postProcessFFT();
    void computeLevels();
    void checkDisplay();
    void idle();
    void applySP();
    int startPlay();

    int readdata(FILE *f, unsigned int size);
    void setSampleRate(unsigned int samplerate);
    void increaseTime();

private:

    typedef enum {
        CLEAN,
        TIME,
        INFO,
        VOLUME,
        TYPE,
        WTYPE,
        MAXMODE
    } mode_t;
    mode_t mode;

    int run;

    FFT_type myfft;

    FILE *fp_handle;

    int lastlevel[NUMBER_COLUMNS];// = {0}; // For decay
    int decayindex[NUMBER_COLUMNS];// = {0};
    int sampbuf[FFTSIZE];

    unsigned rvalues[NUMBER_COLUMNS];

    int sampbufptr;
    bool capture;
    unsigned samplerate;

    LPFilter<NUMBER_COLUMNS> filter;
    CircularBuffer<uint32_t,13> soundBuffer;

    /* WAV file temporary buffer */
    uint8_t tmpbuf[512];

    int h,m,s;
    char current_time[16];
    typedef char infop[16] ;
    infop info[2];
    int infoindex;
    int lastbutton;
    int lastvol;
    char current_volume[16];
    FFT_type::fixed vol;
    // Volume
    Positioner_class<100, 0> positioner;
    int scaletype;
    int windowtype;
    int npres;
    int dispmode;
    int spbuf[DISPLAY_COLUMNS*NUMBER_ROWS];
};

#endif
