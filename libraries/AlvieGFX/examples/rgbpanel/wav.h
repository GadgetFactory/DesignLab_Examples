#ifndef __WAVE_H__
#define __WAVE_H__

#include "endian.h"

#define RIFF_ID 0x52494646
#define WAVE_ID 0x57415645

struct riff_header
{
	__be32 chunkid;
	__le32 chunksize;
	__be32 format;
};

struct wav_fmt
{
	__be32 chunkid;
	__le32 chunksize;
	__le16 audioformat;
	__le16 numchannels;
	__le32 samplerate;
	__le32 byterate;
	__le16 blockalign;
	__le16 bps;
};

struct data_fmt
{
	__le32 chunkid;
	__le32 size;
};

#endif
