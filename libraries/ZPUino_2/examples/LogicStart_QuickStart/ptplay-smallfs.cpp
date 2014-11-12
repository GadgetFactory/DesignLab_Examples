#include "ptplay.h"
#include <SmallFS.h>

pt_mod_s *pt_init_smallfs(SmallFSFile &file)
{
	unsigned char buf[256]; // Some buffer. Let's hope this fits on stack.
	unsigned char *bp=&buf[0];

	int i, j, k,l;
	//double tempf;
	pt_mod_s *mod;
	pt_sample_s *s;
	pt_pattern_s *pat;
	int i2, i3;
	pt_patterndata_s *p;

	/* M.K. signature */

	// smallfs bp = buf + 0x438;
    file.seek(0x438, SEEK_SET);


//#ifdef DO_CHECKS
	file.read(&bp[0], 4);
	if (!(bp[0] == 'M' && bp[1] == '.' && bp[2] == 'K' && bp[3] == '.')) {
		Serial.println("Invalid file:");
		Serial.print((unsigned)bp[0]); Serial.print(" ");
		Serial.print((unsigned)bp[1]); Serial.print(" ");
		Serial.print((unsigned)bp[2]); Serial.print(" ");
        Serial.print((unsigned)bp[3]); Serial.print(" ");
		return NULL;
	}
//#endif

	/* determine number of patterns */

	k = 0;
	// smallfs bp = buf + 952;
	file.seek(952, SEEK_SET);
	file.read(&buf,128);

	for (i = 0; i < 128; ++i)
	{
		j = *bp++;
		if (j > k) k = j;
	}
	k++;

#ifdef DO_CHECKS
	if (bufsize < 1084 + (k << 8))
	{
		return NULL;		/* incomplete */
	}
#endif

	Serial.print("Number of patterns: ");
	Serial.println(k);

#ifdef DEBUG
#endif

	mod = (pt_mod_s*)&mymod;
	memset(mod, 0, sizeof(*mod));

	mod->numpat = k;
	//mod->pattern = ( pt_pattern_s *) (mod + 1);

	for (i = 0; i < 4; ++i)
	{
		mod->chan[i].sp = -1;
	}

	mod->chan[0].pan = 0;
	mod->chan[1].pan = 255;
	mod->chan[2].pan = 255;
	mod->chan[3].pan = 0;

	mod->mastervolume = 256;
	//	mod->flags = 0;										//MODF_ALLOWPANNING;
	mod->flags = MODF_ALLOWFILTER;		//MODF_ALLOWPANNING;

	mod->speed = 6;
	mod->ciaspeed = 125;
	// mod->freq = freq;
	mod->vbllen = FREQ / 50;

#if 0
	for(i = 0; i < 20; ++i)
		mod->name[i] = buf[i];
#endif


	/* samples */

	// smallfs bp = buf + 20;
	file.seek(20,SEEK_SET);

	for (i = 1; i < 32; ++i)
	{
		s = &mod->sample[i];
		file.read(buf,30);
        s->cachel=-1;
#ifdef DEBUG
		Serial.print("Name: ");
		for(l = 0; l < 22, buf[l]; ++l) {
			Serial.write(buf[l]);
		}
		Serial.println("");
#endif

#if 0
		for(l = 0; l < 22; ++l)
			s->name[l] = bp[l];
#endif
		// SmallFS - read everything
		j = buf[22];
		k = buf[23];
		s->length = ((j << 8) + k) << 1;
#ifdef DEBUG
		Serial.print("Sample ");
		Serial.print(i);
		Serial.print(" size is ");
		Serial.print(s->length);
		Serial.println(" bytes");
#endif
		j = buf[24];
		s->ft = j & 15;
		j = buf[25];
		s->volume = j;
		j = buf[26];
		k = buf[27];
		s->repeat = ((j << 8) + k) << 1;
		j = buf[28];
		k = buf[29];
		s->replen = ((j << 8) + k) << 1;
		bp += 30;
	}
	/* mod length */


	file.seek(950,SEEK_SET);
    file.read(buf,1);
	//j = buf[950];
	mod->length = buf[0];//j;

	/* positions */

	file.seek(952,SEEK_SET);
	file.read(buf,128);

	// bp = buf + 952;
    bp=&buf[0];
	for (i = 0; i < 128; ++i)
	{
		j = *bp++;
		mod->pos[i] = j;
	}

	/* patterns */

    /*
	file.seek(1084,SEEK_SET);

	file.read(buf,256); // 64 * 4
	Serial.print("Loading patterns:");
	Serial.println(mod->numpat);
	*/
#if 0

	//bp = buf + 1084;
	bp = &buf[0];
	unsigned offset = 1084;

	for (i = 0; i < mod->numpat; ++i)
	{
		for (i2 = 0; i2 < 64; ++i2)
		{
			for (i3 = 0; i3 < 4; ++i3)
			{
				Serial.print("PAT ");
				Serial.print(i); Serial.print(" ");
				Serial.print(i2); Serial.print(" ");
				Serial.print(i3); Serial.print(" ");
				Serial.println(offset);
				offset+=4;
			}
		}
	}
#endif

#ifdef DEBUG
	Serial.println("Loadind sample data ptr");
#endif
	/* ptrs to sampledata */

	bp = (unsigned char*)(1084 + ((64*4*4)*mod->numpat));

	for (i = 1; i < 32; ++i)
	{
		s = &mod->sample[i];

		s->offset = (unsigned)bp;
		bp += s->length;
#ifdef DO_CHECKS
		if (bp - buf > bufsize)
		{
			return FALSE;			/* sample ptr past end of file */
		}
#endif

		s->length <<= 14;			/* include oversampling precision */
		s->repeat <<= 14;
		s->replen <<= 14;
		s->repend = s->repeat + s->replen;
	}

    Serial.println("All loaded");
	/* init lowpass filter */
	mod->filter =FALSE;

#ifdef DO_LOWPASS
	mod->flags |= MODF_ALLOWFILTER;


	tempf = 3.14159265358979 * 4000 / freq;
	tempf = atan(tempf);
	tempf = -(tempf-1)/(1+tempf);
	mod->fltb = (float) tempf;
	mod->flta = (float) ((1 - tempf) / 2);
#endif

	mod->state=PT_STATE_PLAYSONG;

	return mod;
}
