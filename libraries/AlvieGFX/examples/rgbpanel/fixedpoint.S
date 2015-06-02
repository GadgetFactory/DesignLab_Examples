.text

.weak fmul16
.type fmul16, @function
fmul16:
	loadsp 8
        loadsp 8
        .byte 1
        im _memreg
        store
        poppc
.size fmul16, . - fmul16

.weak fsqrt16
.type fsqrt16, @function

fsqrt16:                // -4 : value
	im 0
        nop             // +4 (root)
        im 2 
        flip            // +8 (shiftval)
.sqrtloop:
        loadsp 0        // +12
        addsp  12-4     // add to root
        loadsp 12+4     // +16
        ulessthan       // +12
        impcrel .isgreat// +16
        neqbranch       // +8
        
        // subtract from value
        loadsp 0        // +12
        not
        im 1
        add             // +12
        addsp 12+4      // add to value
        storesp 12+4    // +8
        // load root and shift right
        loadsp 8-4      // +12
        flip
        addsp 0
        flip
        // or with shift value
        loadsp 12-8	// +16
        or              // +12
        storesp 12-4    // +8
        // Shift and loop
.endloop:
        //im 2
        //lshiftright     // +8 replace with faster version
        flip
        addsp 0
        addsp 0
        flip
        loadsp 0        // +12
	impcrel .sqrtloop  // +16
        neqbranch       // +8
        // Done.
        storesp 0       // +4
        // Root now on top

        //
        // NOTE NOTE: no rounding
        //
        im 8
        ashiftleft

        im _memreg
        store
        poppc
.isgreat:                    // +8
        // Just shift root
        loadsp 8-4           // +12
        flip
        addsp 0
        flip
        storesp 12-4         // +8
        im .endloop
        poppc

.size fsqrt16, . - fsqrt16
