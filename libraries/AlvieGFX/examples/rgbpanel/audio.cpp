#include "FFT.h"
#include "audio.h"
#include <SigmaDelta.h>
#include "cbuffer.h"
#include <Timer.h>
#include "lpfilter.h"
#include "wav.h"
#include <zstdio.h>
#include "log256.h"
#include "wiichuck.h"

#undef DOLOWPASS

#define DOWINDOW

#define FPGA_PIN_SDCS WING_C_4 /* 12 */
#define AUDIO_LEFT  WING_C_8 /* 5*/
#define AUDIO_RIGHT WING_C_10 /* 6*/


static unsigned int run=0;
static unsigned int underruns=0;
//static unsigned int outputarray[512];
//static unsigned int mapping[1024];

/* Led color mappings for analiser. Goes from green to red */

static const int lvmappings[NUMBER_ROWS] = {
    0x00004e04,0x00005203,0x00005301,0x00005600,
    0x00015b00,0x00035c00,0x00056000,0x00086500,
    0x000b6900,0x000f6b00,0x00147100,0x001b7500,
    0x00237a00,0x002d7e00,0x00398300,0x00488700,
    0x005e8c00,0x00809100,0x00968300,0x009b6700,
    0x00a05200,0x00a54200,0x00ab3600,0x00b02b00,
    0x00b82200,0x00bb1a00,0x00c31400,0x00c90e00,
    0x00cf0a00,0x00d50700,0x00da0400,0x00e00200
#if 0
    0x00005107,0x00005602,0x00015a00,0x00066200,0x000d6900,0x00177000,
    0x00267800,0x003d8300,0x005d8c00,0x00968800,0x00a05600,0x00aa3b00,
    0x00b52700,0x00c01800,0x00cb0d00,0x00d90500
#endif
#if 0
    0x00004b04,
    0x00004b04,
    0x00004b04,
    0x00004b04,
    0x00004b04,
    0x00004b04,
    0x00005101,
    0x00025c00,
    0x00086700,
    0x00177300,
    0x00368100,
    0x00819100,
    0x00a04f00,
    0x00b02800,
    0x00c31100,
    0x00d40500
#endif
};

#define LED_OFF 0x0

#define FFTSIZE 512
typedef FFT_512 FFT_type;
FFT_type myfft;

//#define DECAYM 0x7
//#define MAXDECAY (32*DECAYM)

void AudioPlayer::levelController(int controller, int level)
{
    // Level from 0 to 16
#ifdef DOLOWPASS
    level = filter.lowpass(controller, level);
#endif
    int x = controller * 4;
    int y = NUMBER_ROWS-1;

    unsigned rv = LED_OFF;
    if (level>0)
        rv = lvmappings[(level-1)%NUMBER_ROWS];

    level--;

    for (int i=0; i<NUMBER_ROWS; i++) {
        unsigned color = 0;
        if (level>i) {
            color=lvmappings[i];
        }   else {
            break;
        }
#if NUMBER_ROWS == 16
        for (int z=2;z!=0;z--) {
            RGBPanel.setPixelRaw(x,y,color);
            RGBPanel.setPixelRaw(x+1,y,color);
            RGBPanel.setPixelRaw(x+2,y,color);
            RGBPanel.setPixelRaw(x+3,y,color);
            y--;
        }
#else
        RGBPanel.setPixelRaw(x,y,color);
        RGBPanel.setPixelRaw(x+1,y,color);
        RGBPanel.setPixelRaw(x+2,y,color);
        RGBPanel.setPixelRaw(x+3,y,color);
        y--;
#endif

        //RGBPanel.fillRect( x, y, 4, 2, color);

        //y-=2;
    }

    //outputarray[12+(16*level)]=0x8f8f8f00;

    if (level>=lastlevel[controller]) {
        lastlevel[controller]=level;
        decayindex[controller]=0;
    }
    else {
        // Decay.
        lastlevel[controller] -= ((decayindex[controller]&DECAYM)==DECAYM);

        if (lastlevel[controller]<0)
            lastlevel[controller]=0;

        if (decayindex[controller]<MAXDECAY)
            decayindex[controller]++;

    }
    // Light.

    y = (NUMBER_ROWS-1) - lastlevel[controller] ;
 //   if (y<0)
 //       y=0;
#if NUMBER_ROWS == 16
    y<<=1;
    for (int z=2;z!=0;z--) {
        unsigned color = 0xff0000;
        RGBPanel.setPixelRaw(x,y,color);
        RGBPanel.setPixelRaw(x+1,y,color);
        RGBPanel.setPixelRaw(x+2,y,color);
        RGBPanel.setPixelRaw(x+3,y,color);
        y--;
    }
#else
    unsigned color = 0xff0000;
    RGBPanel.setPixelRaw(x,y,color);
    RGBPanel.setPixelRaw(x+1,y,color);
    RGBPanel.setPixelRaw(x+2,y,color);
    RGBPanel.setPixelRaw(x+3,y,color);
    //y--;
#endif


    //outputarray[controller+(LEDS_PER_STRIPE * lastlevel[controller])]=0x80808f00;
}



extern int window[FFTSIZE];

void AudioPlayer::loadFFTData() {
    int i;
#if 0
    bool print=false;
    if (Serial.available()) {
        print=true;
    }
#endif
    for (i=0; i<FFTSIZE; i++) {
        FFT_type::fixed winv;
        myfft.in_real[i].v = sampbuf[i];
#ifdef DOWINDOW
        if (windowtype) {
            winv.v = window[i];
            myfft.in_real[i] *= winv;
        }
#endif
#if 0
        if (print) {
            //Serial.println(sampbuf[i],HEX);
            printf("%08x %d\r\n", sampbuf[i], sampbuf[i]);
        }
#endif
        myfft.in_im[i].v=0;
    }
#if 0
    if (print) {
        while(1) {}
    }
#endif
}

void AudioPlayer::captureForDisplay(unsigned sample)
{
    if (capture && sampbufptr!=FFTSIZE) {
#if 1
        /* Make this into range -2048/2047 */
        //sample=((sample>>8)&0xff)+(sample<<8);

        sample&=0xffff;
        if (sample&0x8000)
            sample|=0xffff0000;
        //int is=(int)0x8000 - int(sample);
        int is=(int)sample;

        //is/=2; // 2
#endif
        sampbuf[sampbufptr++]=is;
    }
}

#if 1
const unsigned fftbuffermap[NUMBER_COLUMNS+1] =
{
    1,2,3,4,
    5,7,10,14,
    20,28,38,52,
    72,99,135,186,255
};

#else
const unsigned fftbuffermap[NUMBER_COLUMNS+1] =
{
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    9,
    11,
    15,
    20,
    27,
    37,
    51,
    69,
    93,
    127
};

#endif

void AudioPlayer::postProcessFFT()
{
    int i;
    for (i=0;i<FFTSIZE/2;i++) {
        FFT_type::fixed v = myfft.in_real[i];
        v.v>>=2;
        v *= v;
        FFT_type::fixed u = myfft.in_im[i];
        u.v>>=2;
        u *= u;
        // TODO: use hardware acceleration here, we already have a module
        v += u;
        myfft.in_real[i].v = fsqrt16(v.asNative());

    }
}

void AudioPlayer::computeLevels()
{
    int z,i;
    FFT_type::fixed max;

    // Dump FFT
#if NUMBER_ROWS==16
    FFT_type::fixed scale(3.60928510925538); // 1.25 * 16[height] / log(255)
#else
    FFT_type::fixed scale(5.7748562);//7.21857021851077);
#endif
    //7.21857021851077 for 32
    for (z=0; z<NUMBER_COLUMNS; z++) {
        max.v=0;

        for (i=fftbuffermap[z];i<fftbuffermap[z+1];i++) {
            if ((unsigned)myfft.in_real[i].v > max.v)
                max.v=myfft.in_real[i].v;
        }

        // Apply window correction
        if (windowtype) {
            max *= FFT_type::fixed(1.5);
        }

        // Max is still fixed-point.

        //unsigned val = max >> 15;// >>7; //7
        //unsigned index = max.asInt();
        unsigned index = 1+(max.v>>13);
        if (index>255)
            index=255;
        //index=z+1;
        unsigned val;
#if 0
        if (index==0)
            index=1;
#endif
        if (dispmode==0) {
            if (scaletype==0) {
                FFT_type::fixed rlog;

                // Get log(value)

                rlog.v = logtable256[index];  // from 0 to 5.54
                rlog *= scale; // Up to 16.

                //int(log (yl) * y_scale);
                //FFT_type::fixed pc;
                //pc.v = relpower[z];

                //pc*=max;

                //val = pc.asInt();
                //val>>=2;

                val = rlog.asInt();
            } else {
                val=index>>2;
            }
            //unsigned val = index>>1;
            if (val>NUMBER_ROWS-1)
                val=NUMBER_ROWS-1;
        } else {
            rvalues[z] = index;
        }
        rvalues[z] = val;
    }
}


unsigned spres=MAXSPRES;

#define LEDPRESMASK 0xff
unsigned ledpres=0;

static void toggleLED()
{
    ledpres++;
    ledpres&=LEDPRESMASK;
    if (ledpres==0)
        digitalWrite(13, !digitalRead(13));
}

void AudioPlayer::idle()
{
//    checkDisplay();
}

int xpos=0;

void AudioPlayer::checkDisplay()
{
    capture=true;

    if (sampbufptr==FFTSIZE) {
        infoindex++;
        spres--;
        capture=false;
        if (spres==0) {
            //toggleLED();
            loadFFTData();
        }
        sampbufptr=0;
        capture=true;

        if(spres==0) {
            int i;
            myfft.doFFT();

            postProcessFFT();
            computeLevels();
            spres=MAXSPRES;
            RGBPanel.clear();

            if (dispmode==0) {
                for (i=0;i<NUMBER_COLUMNS;i++) {
                    levelController(i,rvalues[i]);
                }
            } else {
                applySP();
            }
            // Print time
            if (npres==0) {
                WIIChuck.update();
                RGBPanel.setTextColor(0xff00ff);

                int button = WIIChuck.getCButton();

                if (WIIChuck.getZButton())
                    positioner.calibrate();

                if (button && !lastbutton) {
                    mode=(mode_t)((int)mode+1);
                    infoindex=0;
                    if (mode==MAXMODE)
                        mode = CLEAN;
                }

                lastbutton=button;
                npres=MAXNPRES;
            } else {
                npres--;
            }
            int newvol;
            char *line;
            int off;
#if 1
            switch (mode) {
            case TIME:
                RGBPanel.setCursor(8,0);
                RGBPanel.print(current_time);
                break;
            case INFO:
                line = info[!!(infoindex&0x20)];
                off=(strlen(line)/10);
                RGBPanel.setCursor(off,0);
                RGBPanel.print(line);
                break;
            case VOLUME:
                positioner.updateData();
                newvol = positioner.getX();
                if (newvol!=lastvol) {
                    sprintf(current_volume,"Volume:%d%%", newvol);
                    unsigned nv = 0x10000/100;
                    vol.v = nv*newvol;
                }
                RGBPanel.setCursor(5,0);
                RGBPanel.print(current_volume);

                lastvol=newvol;
                break;
            case TYPE:
                RGBPanel.setCursor(0,0);
                if (WIIChuck.getJoyX()<50) {
                    if (scaletype==1)
                        scaletype=0;
                } else if (WIIChuck.getJoyX()>180) {
                    if (scaletype==0)
                        scaletype=1;
                }
                RGBPanel.print("Mode:");
                RGBPanel.print(scaletype?"linear":"log");
                break;
            case WTYPE:
                RGBPanel.setCursor(0,0);
                if (WIIChuck.getJoyX()<50) {
                    if (windowtype==1)
                        windowtype=0;
                } else if (WIIChuck.getJoyX()>180) {
                    if (windowtype==0)
                        windowtype=1;
                }
                RGBPanel.print("Wind: ");
                RGBPanel.print(windowtype?"Hann":"None");
                break;
            case CLEAN:
            default:
                break;
            }
#endif
            RGBPanel.apply();


        }
    }
}

bool AudioPlayer::timerExpired(void *arg)
{
    AudioPlayer *player = (AudioPlayer*)arg;
    return player->timerExpiredImpl();
}

bool AudioPlayer::timerExpiredImpl()
{
    if (run) {
        if (soundBuffer.hasData()) {
            unsigned v = soundBuffer.pop();
            // Pre-process volume
            {
                FFT_type::fixed r,l;
                r.v = v&0xffff0000;
                l.v = v<<16;
                r*=vol;
                l*=vol;
                v=r.v&0xffff0000;
                v+=l.v>>16;

                SigmaDelta.setValues(v);
            }
            captureForDisplay(v);

        } else {
            underruns++;
        }
    } else {
        SigmaDelta.setValues( 0x00800080 );
        captureForDisplay(0x00800080);
    }
    return true;
}


void AudioPlayer::open()
{
    fp_handle = fopen("sd:/music.wav","r");

    if (fp_handle == NULL) {
        Serial.println("Cannot open file");
    }

    Serial.println("File opened");
}

AudioPlayer::AudioPlayer()
{
    fp_handle=NULL;
    samplerate = 44100;
    current_time[0]='\0';
    info[0][0]='\0';
    info[1][0]='\0';
    lastbutton=0;
    infoindex=0;
    scaletype=0; // Log
    windowtype=0;
    dispmode=0;
    positioner.calibrate();
    vol = 1.0;
    npres=MAXNPRES;
    positioner.set(100,0);

    sprintf(current_volume,"Volume: 100%%");

}

void AudioPlayer::reset()
{
    //Timers.cancel();
    soundBuffer.clear();
    memset(lastlevel,0,sizeof(lastlevel));
    memset(decayindex,0,sizeof(decayindex));
    sampbufptr=0;
    capture=false;
    filter.reset();
    Serial.println("Player reset");
#if 0
    if (fp_handle) {
        fclose(fp_handle);
        fp_handle=NULL;
    }
#endif
}

void AudioPlayer::start()
{
    //reset();
    Serial.println("Starting timer");

    h=m=0;
    s=-1;
    increaseTime();

    Timers.periodicHz( samplerate, &timerExpired, this);
    run = 1;
}


void AudioPlayer::play()
{
    if (NULL==fp_handle) {
        Serial.println("Cannot play, file not opened");
        return;
    }

    startPlay();

}

void AudioPlayer::begin()
{
//    pinMode(FPGA_PIN_SDCS, OUTPUT);
//
//    do {
//        if (SD.begin(FPGA_PIN_SDCS))
//            break;
//        Serial.println("Error initializing SDcard");
//        delay(2000);
//    } while (1);

    Serial.println("AudioPlayer initialized");

//    SigmaDelta.begin( AUDIO_LEFT, AUDIO_RIGHT );
//    SigmaDelta.setEndianness( LITTLE_ENDIAN );
//    SigmaDelta.setSignedness( true );
//    Serial.println("Audio output sink initialized");

    Timers.begin();

    Serial.println("Timer set-up OK");

}


int AudioPlayer::startPlay()
{
    /* Read header */
    struct riff_header *hdr = (struct riff_header*)tmpbuf;
    struct wav_fmt *fmt = (struct wav_fmt*)tmpbuf;
    struct data_fmt *dfmt = (struct data_fmt*)tmpbuf;
    unsigned pos = 0;

    //frewind(fp_handle);

    int r = fread(tmpbuf,sizeof(struct riff_header),1,fp_handle);

    if (r<=0) {
        Serial.println("Short read");
        return r;
    }

    pos+=sizeof(struct riff_header);

    if (hdr->chunkid != RIFF_ID) {
        Serial.println("Not a RIFF file");
        return -1;
    }
    if (hdr->format != WAVE_ID) {
        Serial.println("Not a WAV file");
        return -1;
    }

    r = fread(tmpbuf,1,sizeof(struct wav_fmt),fp_handle);
    pos+=sizeof(struct wav_fmt);

    if (r<=0)
        return r;

    if (fmt->chunkid!=0x666d7420) {
        Serial.println("Invalid chunk ID");
        return -1;
    }

    printf("WAV file info: %d channels, sample rate %d\r\n", (int)fmt->numchannels, (int)fmt->samplerate);

    sprintf(info[0],"  %dHz", (int)fmt->samplerate, (int)fmt->numchannels);
    sprintf(info[1],"%db %s", 16, (int)fmt->numchannels==2 ? "Stereo" : "Mono" );

    reset();

    //set_sample_rate(fmt->samplerate);

    do {
        r = fread(tmpbuf,sizeof(struct data_fmt),1,fp_handle);
        if (r<=0)
            return r;

        pos+=sizeof(struct data_fmt);

        if (fmt->chunkid!=0x64617461) {
            return -1;
        }
        unsigned size = dfmt->size;

        /* Align to next block - don't ask me, but looks like it'a bug in SD library */
        fread(tmpbuf,512-pos,1,fp_handle);

        Serial.println("Running now.");

        if(readdata(fp_handle,size)!=0) {
            Serial.println("Error reading.");
            return -1;
        }
    } while (1);
}

void AudioPlayer::increaseTime()
{
    s++;
    if (s==60) {
        s=0;
        m++;
    }
    if (m==60) {
        h++;
        m=0;
    }
    sprintf(current_time,"%02d:%02d:%02d", h,m,s);
}

int AudioPlayer::readdata(FILE *f, unsigned int size)
{
    unsigned bytes=0;
    unsigned second_tick_frame = samplerate;

    printf("Playing %d bytes of music.\r\n",size);

    while (size) {

        int retries=10;
        unsigned chunksize = size >= 512 ? 512 : size;
        unsigned int *src = (unsigned int*)tmpbuf;
        int r = 0;

        do {
            r = fread(tmpbuf,chunksize,1,f);
            if (r<=0) {
                retries--;
            } else {
                break;
            }
        } while (retries);

        if (size==0 || retries==0)
            return -1;

        if(!run)
            start();

        for (int i=0;i<128;i++) {

            uint32_t v = *src;
            unsigned d;
            {
                unsigned char *vc = (unsigned char *)&v;
                unsigned char *vd = (unsigned char *)&d;
                vd[0]=vc[1];
                vd[1]=vc[0];
                vd[2]=vc[3];
                vd[3]=vc[2];
            }

            while (soundBuffer.isFull()) {
                //idle();
                checkDisplay();
            } /* Wait for space in buffer */

            second_tick_frame--;

            soundBuffer.push( d );
            src++;
#if 1
            if (second_tick_frame==0) {
                increaseTime();
                second_tick_frame=samplerate;
            }
#endif

        }
        //checkDisplay();

        bytes+=r, size-=r;
#if 1
        if ( (bytes & 0x1fff) == 0) {
            printf("Bytes: %d, underruns %d      \r",bytes,underruns);
        }
#endif

    };
    printf("Music ended\n");
    return 0;
}

void AudioPlayer::applySP()
{
    // Shift the buffer up.
    int *sptr=&spbuf[DISPLAY_COLUMNS]; // First pixel on row 1
    int *dptr=&spbuf[0]; // First pixel on row 0
    int x;
    for (x=(DISPLAY_COLUMNS*(NUMBER_ROWS-1))-1;x!=-1;x--) {
        *dptr++=*sptr++;
    }
    // sptr is on good position.

}
