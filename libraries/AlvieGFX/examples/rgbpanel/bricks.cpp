#include <BaseDevice.h>
#include "panel.h"
#include "fixedpoint.h"
#include "wiipositioner.h"

// Define this is you use the ZPUino simulator
//#define SIMULATION

#define STATIC static

#ifdef SIMULATION

#define JUMP_INVERT
#define LEFT_INVERT
#define RIGHT_INVERT

#define JUMP_PIN 25
#define LEFT_PIN 27
#define RIGHT_PIN 24

#else

// Hephaestus (megawing)

#define JUMP_PIN 36
#define JUMP_INVERT
#define LEFT_PIN 39
#define LEFT_INVERT
#define RIGHT_PIN 38
#define RIGHT_INVERT

#endif

#define VGA_COLUMNS 32
#define VGA_ROWS 32

extern "C" const unsigned int costable[64]; /* Cosine table from 0 to PI/2 */

static unsigned char ball_sprite[32];

#define BALL_SIZE_BITS 1

void make_speed(int *sx, int *sy);
void update_player();
static void playLost();
static void waitStart();

unsigned char small_ball[6] = {
	0x30, 0x78, 0xfc, 0xdc, 0x78, 0x30
};

#define BLOCK_HEIGHT 2
#define BLOCK_HCOUNT 4
#define BLOCK_WIDTH 8

#define PLAYER_SIZE_PIX 9

int lost=0;

typedef enum {
    WAITSTART,
    GAME,
    END
} gamestate_t;

gamestate_t gamestate;

static unsigned char screenblocks[(VGA_COLUMNS/BLOCK_WIDTH)*BLOCK_HCOUNT];

Positioner_class<VGA_COLUMNS-PLAYER_SIZE_PIX+1, 0> positioner;

static int oldx;

void make_ball(int x, int y)
{
}

void make_blocks()
{
}

int player_x = ((VGA_COLUMNS)/2) - PLAYER_SIZE_PIX/2;
int player_moved=0;

void draw_player()
{
	int x;
        if (player_moved) {
            //RGBPanel.fillRect( 0, HEIGHT-2, WIDTH, HEIGHT, 0);
            RGBPanel.fillRect( oldx, HEIGHT-2, PLAYER_SIZE_PIX, 2, 0);

            //memset( VGAZX.framebuffer(0,4+23*8),0,VGA_COLUMNS*4);
	}
        //for (x=player_x;x<player_x+PLAYER_SIZE_PIX;x++) {
        RGBPanel.fillRect( player_x, HEIGHT-2, PLAYER_SIZE_PIX, 2, 0x808080);
        //positioner.getX()
}


int bx=(PLAYER_SIZE_PIX/2)+1, by=(VGA_ROWS-2);
int dx=8, dy=-16;
unsigned char ftick=0;

#define BALL_COLOR 0x800080

void draw_ball(int x, int y, bool isxor)
{
    //VGAZX.drawsprite(ball_sprite, VGAZX.framebuffer(x/8,(y/8)*8), false, isxor);
    if (isxor) {
        RGBPanel.drawPixel(x,y, BALL_COLOR ^ RGBPanel.readPixel(x,y));
    } else {
        RGBPanel.drawPixel(x,y, BALL_COLOR);
    }
}

int getButton()
{
	return digitalRead(JUMP_PIN);
}

void flash_area(unsigned off, unsigned count)
{
}

void flash(int x, int y, int ballx, int bally, int color=0xff)
{
}

int test_collision(int x, int y)
{
    make_ball(x,y);

    //return VGAZX.sprite_collides(ball_sprite,VGAZX.framebuffer(x/8,(y/8)*8));
    unsigned p = RGBPanel.readPixel(x,y);
    //printf("Col check: 0x%x\n",p);
    return p==0 ? -1 : 1;
}

void wait_up()
{
    //delay(10);//1000);
    return;
}

void new_screen()
{

}
/*
 Block definition, in bits

 T T C C C I I I

 T - 2 bits, block type
 C - 3 bits, color index
 I - 3 bits, block ID
 */

static unsigned int blockcolors[8] = {
    0x300000,
    0x003000,
    0x000030,
    0x003030,
    0x300030,
    0x303000,
    0x300000,
    0x003000
};
static unsigned char emptyblock[8] = {0};

unsigned char blockdefs[8][8] = {
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff },
	{ 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff },
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff },
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff },
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff },
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff },
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff },
	{ 0xff, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xff }
};

unsigned char tempblock[8];

#define BLOCK_TYPE_MASK 0xC0
#define BLOCK_ID_MASK 0x07
#define BLOCK_COLOR_SHIFT 3
#define BLOCK_COLOR_MASK 0x7

#define BLOCK_LEFT   0x00
#define BLOCK_RIGHT  0x40
#define BLOCK_CENTER 0x80
#define BLOCK_SOLID  0xC0

fp32_16_16 speed;
int angle; /* 0 to 63 for 0 to pi/2 */


void draw_block_screen()
{
	unsigned p;
	unsigned bpixid;
        unsigned i;
        unsigned color=0xff;

	for (p=0;p<sizeof(screenblocks);p++) {
		if (screenblocks[p]==BLOCK_SOLID)
			continue; /* No block */

		/* Get block pixmap */
		bpixid = screenblocks[p] & BLOCK_ID_MASK;

		/* Copy block into temporary area, and manipulate for Left/Right block */

		for (i=0;i<8;i++) {
			tempblock[i] = blockdefs[bpixid][i];
			switch ( screenblocks[p] & BLOCK_TYPE_MASK ) {
			case BLOCK_LEFT:
				tempblock[i] |= 0x80;
				break;
			case BLOCK_RIGHT:
				tempblock[i] |= 0x1;
                                break;
                        }
		}

		/* draw */
#if 0
		VGAZX.drawblock(tempblock, VGAZX.framebuffer(p%VGA_COLUMNS,(p/VGA_COLUMNS)*8));
		VGAZX.pallete()[p] = blockcolors[ (screenblocks[p] >> BLOCK_COLOR_SHIFT) & BLOCK_COLOR_MASK];
#endif
                //color = blockcolors[ (screenblocks[p] >> BLOCK_COLOR_SHIFT) & BLOCK_COLOR_MASK];
                // Get random color..
#if 0
                color = random(0xff) % 0xff;
                color += (random(0xff) % 0xff)<<8;
                color += (random(0xff) % 0xff)<<16;
#endif
                color = random(0xffffff) & 0x3f3f3f;

                color|=1;

                RGBPanel.fillRect( (p*BLOCK_WIDTH)%VGA_COLUMNS, ((p*BLOCK_WIDTH)/VGA_COLUMNS)*2, BLOCK_WIDTH, BLOCK_HEIGHT,
                                  color);
#if 0
                color<<=8;
                if (color&0xff000000) {
                    color=0xff;
                }
#endif

	}
}

void clear_block(int x, int y)
{
    /* Remove block. Compute its offset first */

    unsigned boffset = x/BLOCK_WIDTH + ((y>>1) * (VGA_COLUMNS/BLOCK_WIDTH));

#if 0
    Serial.print("Clearing block at ");
    Serial.print(x);
    Serial.print(",");
    Serial.print(y);
    Serial.print(" type ");
    Serial.println(screenblocks[boffset] & BLOCK_TYPE_MASK);
#endif

    screenblocks[boffset] = BLOCK_SOLID;
    RGBPanel.fillRect( (boffset*BLOCK_WIDTH)%VGA_COLUMNS, ((boffset*BLOCK_WIDTH)/VGA_COLUMNS)*2, BLOCK_WIDTH, BLOCK_HEIGHT,
                      0x0);

}

void collision(int x, int y)
{
	unsigned boffset = x + (y * VGA_COLUMNS);
	unsigned sx, soffset,type;

	Serial.print("Collision at ");
        Serial.print(x);
        Serial.print(",");
        Serial.println(y);

        if (y>30) {
            //lost=1;
            return; // Player collision

        }
        clear_block(x,y);

        return;
	if ((screenblocks[boffset] & BLOCK_TYPE_MASK) != BLOCK_SOLID) {
		sx = x;
		soffset = boffset;
		unsigned savetype = screenblocks[boffset] & BLOCK_TYPE_MASK;

		do {
			type = screenblocks[soffset] & BLOCK_TYPE_MASK;
			clear_block(sx,y);
			if (type==BLOCK_RIGHT)
				break;
                        soffset++, sx++;
		} while (1);

		sx = x;
		soffset = boffset;
		screenblocks[soffset] = savetype;

		do {
			type = screenblocks[soffset] & BLOCK_TYPE_MASK;
			clear_block(sx,y);
			if (type==BLOCK_LEFT)
				break;
                        soffset--, sx--;
		} while (1);
	}
}

inline int deg2index(int deg)
{
	// 90 -> 63
	return (deg*63)/90;
}

inline int index2deg(int index)
{
	// 63 -> 90
	return (index*90)/63;
}

unsigned roundpos(unsigned v)
{
    unsigned rem = v & 0xf;
    unsigned ret = v>>4;
    if (rem>=0x7)
        ret++;
    return ret;
}

int interDelay=0;


void clearTextArea()
{
    /* Clear area */
    RGBPanel.fillRect( 0, 32,  VGA_COLUMNS, 16, 0x00000000 );
}

void prepareStart()
{
    clearTextArea();
}

int demo_loop()
{
    //Serial.println("In demo_loop");
    int nx, ny;
    int hcol=0, vcol=0;

    unsigned rbx = roundpos(bx);
    unsigned rby = roundpos(by);

    if (interDelay!=0)
        interDelay = interDelay-1;


    if (gamestate==WAITSTART) {
        // Ball is on top of player.
        rbx = player_x + ((PLAYER_SIZE_PIX/2));
        rby = VGA_ROWS - 3;//29;
    }
    printf("Current x %d, y %d\n", rbx,rby);

    make_ball(rbx,rby);
    draw_ball(rbx,rby,true);
    draw_player();
    RGBPanel.apply();
    wait_up();
    draw_ball(rbx,rby,true);
    //RGBPanel.apply();
    
    //Serial.println("before make_speed");

    make_speed(&dx,&dy);

    nx=bx+dx;
    ny=by+dy;
    //printf("Dx %d, Dy %d\r\n", dx,dy);
    //printf("New x %d, new y %d\n", nx>>4,ny>>4);

    /* Out of bounds check */
    unsigned rnx = roundpos(nx);
    unsigned rny = roundpos(ny);
    
    //printf("rnx %d, rny %d\r\n", rnx,rny);

    if (rnx>(VGA_COLUMNS-BALL_SIZE_BITS) || nx<0) {
        dx=-1*dx;
        nx+=dx;
        nx+=dx;
        printf("Bounce X\n");
        angle = deg2index(180) - angle;
        if (angle > deg2index(180)) {
            angle= angle - deg2index(360);
        }
    }
    if (rny>(VGA_ROWS-BALL_SIZE_BITS) && ny>0) {
        lost=1;
    }

    if (rny>(VGA_ROWS-BALL_SIZE_BITS) || ny<0) {

        dy=-1*dy;
        ny+=dy;
        ny+=dy;
        printf("Bounce Y %d\n", VGA_ROWS-BALL_SIZE_BITS);

        /* Make this IF false */
        if (0) { //(rny>(VGA_ROWS-BALL_SIZE_BITS)) && lost==0) {
            /* Collision with player. */
            angle = -1*angle;

            /* Correct angle */
            int delta = positioner.getDeltaX();
            if (delta>128) {
                delta=128;
            }
            if (delta<-128)
                delta=-128;

            /* delta max adjusts up to 24 degrees */
#define MAXDEGREE 24
            if (angle>0) {
                angle += ((delta*MAXDEGREE))>>7;
                if (angle<16)
                    angle=16;
                if (angle>48)
                    angle=48;
            } else {
                angle += ((delta*MAXDEGREE))>>7;
                if (angle>-16)
                    angle=-16;
                if (angle<-48)
                    angle=-48;
            }



#if 1
            if (angle < (-1*deg2index(180)))
                angle= angle + deg2index(360);
#endif

        } else {
            angle = -1*angle;
            if (angle < (-1*deg2index(180)))
                angle= angle + deg2index(360);
        }
    }

    int col;
    /* Check collision */
    //unsigned rby = roundpos(by);
    //unsigned rbx = roundpos(bx);

    if ((col=test_collision(rnx,rby)) >=0 ) {

        //collision((nx/(16*8))+(col&1),(by/(16*8))+((col&2)>>1));
        collision(rnx,rby);
        hcol=1;
    }

    if ((col=test_collision(rbx,rny)) >= 0) {

        //collision((bx/(16*8))+(col&1),(ny/(16*8))+((col&2)>>1));
        collision(rbx,rny);
        vcol=1;
    }

    if (hcol==0 && vcol==0) {
        if ((col=test_collision(rnx,rny)) >=0 ) {
            //    collision(1+nx/(16*8),1+ny/(16*8));
            collision(rnx,rny);
            hcol=1;
            vcol=1;
        }
    }

    if (hcol) {
        dx=-1*dx;
        nx+=dx;
        nx+=dx;

        angle = deg2index(180) - angle;
        if (angle > deg2index(180)) {
            angle= angle - deg2index(360);
        }
    }
    if (vcol) {
        dy=-1*dy;
        ny+=dy;
        ny+=dy;

        angle = -1*angle;
        if (angle < (-1*deg2index(180)))
            angle= angle + deg2index(360);

    }
    if (lost) {
        if (gamestate != END)
            playLost();
        gamestate=END;
    }

    if (gamestate==GAME && !lost)
    {
        bx=nx;
        by=ny;
    } else {
        bx=(player_x + 2)<<4;
        by=(VGA_ROWS-3)<<4;
    }

    update_player();

    // Check WII buttons
    if (gamestate==WAITSTART || gamestate==END) {
        //WIIChuck.update();

        if ((gamestate==END) && (interDelay==0)) {
            gamestate=WAITSTART;
            lost=0;
            waitStart();
        }

        if ((interDelay==0) && (WIIChuck.getCButton())) {
            gamestate = GAME;
            speed = 16.0;
            angle = (TIMERTSC&4) ? 32: -32;

            lost=0;
            prepareStart();
        }
    }
    if (gamestate==GAME) {
        if (WIIChuck.getZButton()) {
            return -1;
        }
    }
    return 0;
}

void randomize_color_area()
{
#if 0
	volatile unsigned char *memory=(volatile unsigned char*)0x1010;

	int d = 5*VGA_COLUMNS;
	for (;d<20*VGA_COLUMNS;d++) {
		VGAZX.pallete()[d] = memory[TIMERTSC & 0xfff];
        }
#endif
}

void make_speed(int *sx, int *sy)
{

        //Serial.println("in make_speed");
	fp32_16_16 speedx, speedy;
	fp32_16_16 cosi=1.0, sini=1.0;
	int la=angle;

//Serial.println(la);
//printf("Current sini %d, cosi %d\n", sini,cosi);
//Serial.println("Still running");


	if (la<0) {
		la=-la;
		sini = fp32_16_16(0xffff0000,1); // This is -1.0
	}

	if (la>63) {
		la=127-la;
                cosi = fp32_16_16(0xffff0000,1); // This is -1.0
	}


	fp32_16_16 cos( costable[la] ,1);
	fp32_16_16 sin( costable[63-la] ,1);

        //printf("Current sini %d, cosi %d\n", sini,cosi);

//Serial.println(la);
	cos*=cosi;
	sin*=sini;
//Serial.println("part 6");

	speedx = (speed * cos);
	speedy = (speed * sin);

//Serial.println("part 5");

	*sx = speedx.asInt();
	*sy = -1 * speedy.asInt(); // Vertical is inverted.
        //Serial.println("finished make_speed");
}

void update_player()
{
    oldx = player_x;
    positioner.update();
    player_x = positioner.getX();

    if (oldx==player_x)
        player_moved=0;
    else
        player_moved=1;
}

static void waitStart()
{
//    RGBPanel.setTextColor(0xffff00);
//    clearTextArea();
//    // 16 chars.
//    RGBPanel.setCursor((96/2)-(6*16)/2,33);
//    RGBPanel.print("Carrega no botao");
//    RGBPanel.setCursor((96/2)-(6*16)/2,33+7);
//    RGBPanel.print(" para comecares ");
//    gamestate = WAITSTART;
//    interDelay=0;
}

static void playLost()
{
//    RGBPanel.setTextColor(0xff4040);
//    clearTextArea();
//    // 16 chars.
//    RGBPanel.setCursor((96/2)-(6*16)/2,33);
//    RGBPanel.print("Perdeste a bola!");
//    interDelay=100;
}

void ball_setup()
{
    speed = 16.0;
    angle = (TIMERTSC&4)?32:-32;

    positioner.setShift(6);

    bx=((PLAYER_SIZE_PIX/2)+1)<<4;
    by=(VGA_ROWS-2)<<4;

    dx=8;
    dy=-16;
    interDelay=0;
//    draw_block_screen();
    RGBPanel.clear();
    memset( screenblocks, 1, sizeof(screenblocks) );
    draw_block_screen();
    RGBPanel.apply();
    
    randomSeed(TIMERTSC);
    waitStart();
}
void ball_calibrate()
{
    positioner.calibrate();
}


void ball_demo_loop()
{
    //Serial.println("In ball_demo_loop");
    demo_loop();
}

void ball_demo()
{
    //Serial.println("In ball_demo");
    ball_setup();
}
