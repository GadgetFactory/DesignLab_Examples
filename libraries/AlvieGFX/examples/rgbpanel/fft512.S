#include <register.h>

#define CORDIC IO_SLOT(13)

#define M 9
#define N 512
#define N_M1 (N-1)
#define N_D2 (N/2)

#define IMAGINARY_OFFSET (N*4)
#define DELTA(x) x

#undef DEBUG

#ifdef DEBUG

.macro DBGVAR strname
    im \strname                                
    nop                                       
    im Serial                                 
    nop                                       
    im _ZN5Print5printEPKc
    call                                      
    storesp 0                                 
    storesp 0                                 
    loadsp 0
    im printhex
    call                                      
    storesp 0                                 
    im spacestr                               
    nop                                       
    im Serial                                 
    nop                                       
    im _ZN5Print7printlnEPKc                  
    call                                      
    storesp 0                                 
    storesp 0                                 
.endm
#else
.macro DBGVAR strname
.endm

#endif

#ifdef DEBUG
.data
    .balign 4
swapstr: .string "Swap "
	
spacestr: .string " "

kstr: .string "K "

newline: .string "\r\n"


i_name: .string "I "
j_name: .string "J "
l_name: .string "L "

si_name: .string "SI "
sr_name: .string "SR "
ui_name: .string "UI "
ur_name: .string "UR "
uisi_name: .string "UI*SI "
uisr_name: .string "UI*SR "
trsi_name: .string "TR*SI "
trsr_name: .string "TR*SR "
tr_name: .string "TR "
ti_name: .string "TI "
ang_name: .string "ANG "
cordic_name: .string "CORDIC "
sin_name: .string "SIN "
inimi_in_name: .string"in_im[i] ";
inreal_in_name: .string"in_real[i] ";
inimip_out_name: .string"in_im[ip] <= ";
#endif
.text
    .weak	_ZN3FFTILj9EE5doFFTEv
	.type	_ZN3FFTILj9EE5doFFTEv, @function

_ZN3FFTILj9EE5doFFTEv: /* FFT<5u>::doFFT() */
	/*
	 At this point we have retpc @ sp, and "this" pointer @ sp + 4.
	 The pointer coincides with "in_real", and adding IMAGINARY_OFFSET
     will get us the pointer to in_im
	 */

// TEST TEST TEST
//    im fft_main
//    poppc


	im N_D2       // j            /* 7D8 */
	nop
	im 1          // i            /* 7D4 */

.loop_reorder:
	// i is in TOS
    loadsp 4
	loadsp 4
	ulessthan
	im -1
    add
	impcrel .noswap
	neqbranch
	// Swap values
	loadsp 4 // j
	addsp 0
	addsp 0 // *4
	addsp 16 // in_real[j]
    loadsp 0 // duplicate address
	load
	loadsp 8 // i
   	addsp 0
    addsp 0  // *4
	addsp 24 // in_real[i]
    loadsp 0
	load
    loadsp 12
	store    // Store to in_real[j]
	store    // Store to in_real[i]
	storesp 0
.noswap:

	im N_D2  // k               /* 7D0 */
.loop_for_k:

	loadsp 8 // j
	loadsp 4 // k

	ulessthanorequal
	im -1
    add
	impcrel .L1
	neqbranch

	// j=j-k
	loadsp 0 // K
	/* Negate */
	not
	im 1
	add
    /* End negate */
	addsp 12 // add to J
	storesp 12 // store in J
	loadsp 0 // K
	/* Faster shift right */
	flip
	addsp 0
	flip
	/* end fast shift right */
	storesp 4 // Store back K
	im .loop_for_k
    poppc
.L1:
	loadsp 0 // K
	addsp 12
	storesp 12 // J=J+K

	// Get rid of K
	storesp 0

	// Loop stuff

	loadsp 0
	im 1
	add
	storesp 4  // Increment I

	im N-1
  	loadsp 4 // I
	ulessthan
	impcrel .loop_reorder
    neqbranch


	storesp 0
	storesp 0

fft_main:
	/* we're good to go now, and perform FFT itself */
#ifdef USE_CORDIC
    im CORDIC
    nop      // CORDIC                         20              7BC
#else
    im _ZN3FFTILj9EE11sincostableE        //   20
    nop
#endif
	im 1
	nop      // L         // Use pushspadd/    16              7B8
	loadsp 0 // LE                             12              7B4
	loadsp 0 // LE2                            8               7B0
	loadsp 0 // UR                             4               7AC
	loadsp 0 // UI                             0               7A8  7B4

fft_main_loop:

    im 1                                       // +4
    loadsp 20 // L                             // +8
    DBGVAR(l_name)
    ashiftleft  // This gets us LE             // +4
    loadsp 0                                   // +8
    storesp 12+4 // Write back LE              // +4
    // Fast shiftright for LE2
    flip
    addsp 0
    flip
    // Write LE2 back
    storesp 12                                 // +0

    // Init UR
    im 0x10000                                 // +4
    storesp 8                                  // +0
    // Init UI
    im 0                                       // +4
    storesp 4                                  // +0

#ifdef USE_CORDIC
    // ask CORDIC now for sine/cosine
    im 0x8000                                  // +4
    flip // TODO: Change this flip by changing IM
    // shift right by L-1
    loadsp 20                                  // +8
    im -1                                      // +12
    add                                        // +8
    ashiftleft                                 // +4
    flip
    // We're good to go now. Load CORDIC address
    DBGVAR(ang_name)
    loadsp 4+20                                // +8
    //DBGVAR(cordic_name)
    store                                      // +0          7A8
#endif

    // TEST
    loadsp 20
    load
    DBGVAR(sin_name)
    storesp 0

    // NEW VARIABLE: J
    im 1                                       // +4

jloop:
    loadsp 0                                   // +8
    DBGVAR(j_name)
    im -1                                      // +12
    add                                        // +8          7A0
    // We have now JM1. We start "i" loop with it
    // NEW VARIABLE i at (delta+8)

    // NOTE: I assume jm1 is always <= N_M1 here.

    // Ok go on, and load IP (temporary)
iloop:
    DBGVAR(i_name)
    loadsp 0                                   // +12
    //loadsp 12+8 // LE2                           // +16
    //add                                        // +12   // LE2 + I
    addsp 12+8                                   // +12

    // we have IP, we ought to fetch data now.
    loadsp 0                                   // +16     
    addsp 0
    addsp 0 // Multiply by 4

    // Now, load in_real
    //loadsp 16+28// CHECK THIS PLEASE            // +20
    //add                                        // +16       // &in_real[IP]
    addsp 16+28                                  // +16

    loadsp 0 // Triplicate, we need three offsets // +20    // &in_real[IP]
    loadsp 0 // Triplicate, we need three offsets // +24    // &in_real[IP]

    load                                       // +24 *

    loadsp 0 // we need 2 values also          // +28 *
    // Now, multiply by UR
    loadsp 28+4                                // +32 *
    .byte 0x1 // MULF16                        // +28 *   in_real[ip]*UR  / TR
    // And multiply by UI
    loadsp 28-DELTA(24)  // load value again   // +32 *


    loadsp 32+0  // Load UI                    // +36 *
    .byte 0x1 // MULF16                        // +32 *   in_real[ip]*UI  / TI

    // Load imaginary data now
    loadsp 32-DELTA(20)                        // +36 *
    im IMAGINARY_OFFSET // in bytes            // +40 *
    add                                        // +36 *   (saved in_im[ip] address)
    // Save address
    loadsp 0                                   // +40 *

    load                                       // +40 *  in_im[ip]
    loadsp 0 // need two values also           // +44 *   in_im[ip](dup)

    // Multiply by UR
    loadsp 44+4                                // +48 *
    .byte 0x1 // MULF16                        // +44 *  in_im[ip]*UR
    // Add at once to in_real[ip]*UI
    addsp  44-DELTA(32)                        // +44 *
    storesp 44-DELTA(32)                       // +40 *
    // Multiply by UI
    loadsp 40+0                                // +44 *
    .byte 0x1 // MULF16                        // +40 *
    // Negate (two's complement)
    not
    im 1                                       // +44 *
    add                                        // +40 *
    // and finally add to in_real[ip]*UR  (TR)

    addsp 40-DELTA(28)                         // +40 *

    storesp 40-DELTA(28)                       // +36 *

    // So now we have TR and TI

/*
				in_real[ip] = in_real[i] - tr;
				in_im[ip] = in_im[i] - ti;
				in_real[i] = in_real[i] + tr;
				in_im[i] = in_im[i] + ti;
*/
    // Load I                                  
    loadsp 36-DELTA(8)                         // +40 *
    addsp 0
    addsp 0    // mult *4
    loadsp 0   // Duplicate                    // +44 *
    // Get in_real
    loadsp 44+28                               // +48 *

    add                                        // +44 *  & in_real[i]
    //addsp 44+28                                // +44 *
    // we have offset, we will need it later
    loadsp 0                                   // +48 *
    load                                       // +48 * in_real[i]
    // we need it twice
    loadsp 0                                   // +52 *
    // Get TR
    loadsp 52-DELTA(28)                        // +56 *
    not
    im 1                                       // +60 *
    add // negate..                            // +56 *
    add // and add to in_real[i]               // +52 *

    // now, store to in_real[ip]
    loadsp 52-DELTA(16)                        // +56 *
    store                                      // +48 *
    // Get TR again
    loadsp 48-DELTA(28)                        // +52 *
    // Add to in_real[i]
    addsp 52-DELTA(48)
    // And write back to in_real[i]
    loadsp 52-DELTA(44)                        // +56 *

    store                                      // +48 *


    // Do far we computed in_real[ip] and in_real[i]
    // let's go imaginary now.

    // Load I
    loadsp 48-DELTA(8)                         // +52 *
    addsp 0
    addsp 0    // mult *4
    // Get in_real
    loadsp 52+28                               // +56 *
    im IMAGINARY_OFFSET                        // +60 *
    add                                        // +56 *
    add                                        // +52 *  & in_im[i]

    // we will need address later on
    loadsp 0                                   // +56 *
    // Fetch it
    load                                       // +56 * // in_im[i]
    //DBGVAR(inimi_in_name)
    // Dup
    loadsp 0                                   // +60 *
    // Load TI and invert
    loadsp 60-DELTA(32)                        // +64 *

    not
    im 1
    add                                        // +64 *
    // Add to in_im[i]
    add                                        // +60 *

    // Store to in_im[ip]
    //DBGVAR(inimip_out_name);
    loadsp 60-DELTA(36)                        // +64 *
    store                                      // +56 *
    // we still hold in_im[i] value

    // add to TI

    //loadsp 56-DELTA(32)                        // +60 *
    //DBGVAR(ti_name)
    //add                                        // +56 *
    addsp 56-DELTA(32)                           // +56 *
    // Store to in_im[i]

    loadsp 56-DELTA(52)                        // +60 *
    store                                      // +52 *

    //, now loop for I, load LE2
    loadsp 52+8                                // +56
    //loadsp 56-DELTA(12)                        // +60
    // add to LE2 I
    addsp 56-DELTA(12)                        // +56

//    add                                        // +56
    loadsp 0                                   // +60
    // store I back in its proper place
    storesp 60-DELTA(8)                        // +56


    // I is still at +56
    im N_M1                                    // +60
    ulessthanorequal                           // +56
    impcrel finishediloop                      // +60
    neqbranch                                  // +52
    // Repeat "I" loop. Need to unwind stack first
    // unwind stack
    pushsp
    im 52-8
    add
    popsp                                      // +8
    im iloop
    poppc // Repeat loop

finishediloop:

    // We finished "I" loop.

    // So we need to update UR and UI.
    // First, we load SI
    loadsp 52 + 20                             // +56
//    DBGVAR(cordic_name)
    load                              // +56 (si)
#ifdef USE_CORDIC
    // Negate SI
    not
    im 1
    add                                        // +68
#endif
    DBGVAR(si_name)
    loadsp 0                                   // +60

    // We need (ui*si) and (tr*si)
    // Get UI first
    loadsp 60+0                                // +64
    // Mult
    .byte 0x1                                  // +60 (ui*si)
    DBGVAR(uisi_name)
    // Get SI again
    loadsp 4                                   // +64

    // Load UR
    loadsp 64+4                                // +68
    // And multiply
    .byte 0x1                                  // +64 (tr*si)
    DBGVAR(trsi_name)
    // And load SR
    im 4                                       // +68
    loadsp 68 + 20                             // +72
    add                                        // +68
//    DBGVAR(cordic_name)
    load                                       // +68 (sr)
    DBGVAR(sr_name)
    loadsp 0                                   // +72
    // we need tr*sr and ui*sr
    // Get UI first
    loadsp 72+0                                // +76
    // Mult
    .byte 0x1                                  // +72 (ui*sr)
    DBGVAR(uisr_name)
    // Get SR again
    loadsp 4                                   // +76
    // Load UR
    loadsp 76+4                                // +80
    // And multiply
    .byte 0x1                                  // +76 (tr*sr)
    DBGVAR(trsr_name)
    // Now, load ui*si
    loadsp 76-DELTA(60)                        // +80
    // negate
    not
    im 1
    add                                        // +80
    // And add to tr*sr, will be new UR
    add                                        // +76


    // Store UR
    DBGVAR(ur_name);
    storesp 76+4                               // +72
    // ui*sr is now on TOS, add to tr*si


    addsp 72-DELTA(64)                         // +72

    // And store to UI, finally
    DBGVAR(ui_name)
    storesp 72 + 0                             // +68
    // ur = tr*sr - ui*si;
	// ui = tr*si + ui*sr;


    // Loop for j <= le2
    // J is at +4. We need to unwind stack first

    pushsp                                     // +72
    im 72-8
    add
    popsp                                      // +4
    // Ok, now J is in top of stack. Increment it
    im 1
    add                                        // +4
    // load LE2
    loadsp 4+8                                 // +8
    loadsp 4                                   // +12

    ulessthanorequal                           // +8
    //im -1                                      // +12
    //add                                        // +8
    impcrel jloop                              // +12
    neqbranch                                  // +4 :)
    storesp 0 // Get rid of J                  // +0

    // Now, loop for l <= M;
    // L is at -16

#ifndef USE_CORDIC
    // Increment table pointer
    loadsp 0+20
    im 8
    add
    storesp 4+20

#endif
    im M                                       // +4
    loadsp 4+16                                // +8
    im 1
    add                                        // +8
    loadsp 0                                   // +12
    storesp 12+16                               // +8
    // compare
    ulessthanorequal                           // +4
    impcrel fft_main_loop                      // +8
    neqbranch                                  // +0

    // we'redone. bail out for now

    pushsp                                     // +4
    im 20+4
    add
    popsp
    //breakpoint

    poppc
    .size _ZN3FFTILj9EE5doFFTEv, .-_ZN3FFTILj9EE5doFFTEv
#if 0

	for (int l = 1; l <= M; l++)
    {
		// le = round(pow(2,l));
		le = 1<<l;

		// le2 = le/2;
		le2 = le>>1;
        ur = 1.0;
        ui = 0.0;

		sr = cos(M_PI/le2);
        si = -sin(M_PI/le2);
		for (int j = 1; j <= le2; j++)
        {
            jm1 = j-1;
            for (int i = jm1; i <= N_M1; i += le)
            {
				ip = i+le2;
				tr = in_real[ip]*ur - in_im[ip]*ui;
				ti = in_real[ip]*ui + in_im[ip]*ur;

				in_real[ip] = in_real[i] - tr;
				in_real[i] = in_real[i] + tr;
             	in_im[ip] = in_im[i] - ti;
				in_im[i] = in_im[i] + ti;
            }
            tr = ur;
            ur = tr*sr - ui*si;
			ui = tr*si + ui*sr;
        }
    }
}
#endif
