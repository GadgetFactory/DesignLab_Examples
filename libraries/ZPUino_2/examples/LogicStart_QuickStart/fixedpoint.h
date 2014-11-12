#ifndef __FIXEDPOINT_H__
#define __FIXEDPOINT_H__

#include <string.h>
#include <stdio.h>
#include <inttypes.h>
#include <Arduino.h>
char *sprintint(char *dest, int max, unsigned v);
extern "C" void printhex(unsigned int c);


template<typename t_signed, typename t_unsigned, unsigned int bits>

struct fpval {
	static const unsigned int nbits = bits;
	typedef t_unsigned size_type;
	typedef t_signed ssize_type;

	// Helpers

	static const unsigned int storage_bits = 8 * sizeof(size_type);
	static const ssize_type low_mask = (1<<bits)-1;

	// The value
	ssize_type v;

	inline struct fpval<t_signed,t_unsigned,bits> &operator=(unsigned int c) {
		v=(c<<bits);
		return *this;
	}

	fpval<t_signed,t_unsigned,bits> inverse() const {
		/*
		 fpval<t_signed,t_unsigned,bits> r;

		 printf("Inverse %08x\n", v);

		 r.v = (1<< (storage_bits-1))/(v*(1<<bits)) << 1;

		 printf("equals %08x\n", r.v);
		 return r;*/
		fpval<t_signed,t_unsigned,bits> r(1.0);
		r/=v;
		return r;
	}


	fpval(unsigned int c) {
		v=(c<<bits);
	}

	fpval(unsigned int c, int raw): v(c) {
	}

    fpval(int c) {
		v=(c<<bits);
	}

	template< typename T >
		inline void setFromRangedValue( T value, T max ) {
		}

	struct fpval<t_signed,t_unsigned,bits> &operator*=(const struct fpval<t_signed,t_unsigned,bits> &o);

	inline struct fpval<t_signed,t_unsigned,bits> &operator+=(const struct fpval<t_signed,t_unsigned,bits> &o) {
		v+=o.v;
        return *this;
	}

	inline struct fpval<t_signed,t_unsigned,bits> operator+(const struct fpval<t_signed,t_unsigned,bits> &o) {
		fpval<t_signed,t_unsigned,bits> r = *this;
		r+=o;
        return r;
	}

	inline struct fpval<t_signed,t_unsigned,bits> &operator-=(const struct fpval<t_signed,t_unsigned,bits> &o) {
		v-=o.v;
        return *this;
	}

	inline struct fpval<t_signed,t_unsigned,bits> operator-(const struct fpval<t_signed,t_unsigned,bits> &o) {
		fpval<t_signed,t_unsigned,bits> r = *this;
		r-=o;
        return r;
	}

	inline struct fpval<t_signed,t_unsigned,bits> operator*(const struct fpval<t_signed,t_unsigned,bits> &o)const {

		fpval<t_signed,t_unsigned,bits> ret = *this;
		ret*=o;
		return ret;
        /*

		ssize_type hi[2] = { (o2.v >> bits),    (o1.v >> bits) };
		ssize_type lo[2] = { (o2.v & low_mask), (o1.v & low_mask) };

		ssize_type r_hi = hi[0] * hi[1];
		ssize_type r_md = (hi[0] * lo[1]) + (hi[1] * lo[0]);

		size_type r_lo = lo[0] * lo[1];
		r_lo += low_mask;

		r_md += (r_hi & low_mask) << (storage_bits-bits);
		r_md += (r_lo >> bits);
		ret = r_md;

		return ret;*/
	}

	/*	template<unsigned b>
	 struct fpval<int,unsigned int,b> operator/=(const fpval<int,unsigned int,b> &o)
	 {
	 int64_t tempResult = v;
	 tempResult <<= b;
	 tempResult += (o.v >> 1);
	 tempResult /= o.v;
	 v = tempResult;
	 return *this;

	 }

	 template<unsigned bt>
	 struct fpval<int,unsigned int,bt> operator/=(double b)
	 {
	 const fpval<int,unsigned int,bt> nb(b);

	 int64_t tempResult = v;
	 tempResult <<= b;
	 tempResult += (nb.v >> 1);
	 tempResult /= nb.v;
	 v = tempResult;
	 return *this;

	 }*/

	struct fpval<t_signed,t_unsigned,bits> operator/(const fpval<t_signed,t_unsigned,bits> &o) const {
		fpval<t_signed,t_unsigned,bits> other = *this;
		other/=o;
		return other;
	}

	struct fpval<t_signed,t_unsigned,bits> &operator/=(const fpval<t_signed,t_unsigned,bits> &o) {
		size_type other = o.v;
		int neg = ((v < 0) != (other < 0));
		v = (v < 0 ? -v : v);
		other = (other < 0 ? -other : other);

		while(((v | other) & 1) == 0) {
			v >>= 1;
			other >>= 1;
		}

		uint32_t r_hi = (v / other);

		uint32_t n_lo = (v % other);
		uint32_t n_hi = (n_lo >> 16);
		n_lo <<= 16;
		uint32_t n_lo_orig = n_lo;

		uint32_t i, arg;
		for(i = 1, arg = other; ((n_lo | arg) & 1) == 0; i <<= 1) {
			n_lo = ((n_lo >> 1) | (n_hi << 31));
			n_hi =  (n_hi >> 1);
			arg >>= 1;
		}
		n_lo = n_lo_orig;

		uint32_t res = 0;
		if(n_hi) {
			uint32_t arg_lo, arg_hi;
			for(arg_lo = other; (arg_lo >> 31) == 0; arg_lo <<= 1, i <<= 1);
			for(arg_hi = (arg_lo >> 31), arg_lo <<= 1, i <<= 1; arg_hi < n_hi; arg_hi = (arg_hi << 1) | (arg_lo >> 31), arg_lo <<= 1, i <<= 1);

			do {
				arg_lo = (arg_lo >> 1) | (arg_hi << 31);
				arg_hi = (arg_hi >> 1);
				i >>= 1;
				if(arg_hi < n_hi) {
					n_hi -= arg_hi;
					if(arg_lo > n_lo)
						n_hi--;
					n_lo -= arg_lo;
					res += i;
				} else if((arg_hi == n_hi) && (arg_lo <= n_lo)) {
					n_hi -= arg_hi;
					n_lo -= arg_lo;
					res += i;
				}
			} while(n_hi);
		}

		res += (n_lo / other);

		if((n_lo % other) >= (other >> 1))
			res++;

		res += (r_hi << 16);

		v = neg ? -res : res;
		return *this;
	}

	void setFromBitRange(unsigned value, unsigned nb)
	{

		if (value > (unsigned)((1<<(nb-1))-1))
			value++;

		if (bits>nb) {
			value<<=(bits-nb);
		} else {
			value>>=(nb-bits);
		}

		v=(ssize_type)value;
	}

	//	struct fpval<t_signed,t_unsigned,bits> &operator/=(const struct fpval<t_signed,t_unsigned,bits> &o);

	inline struct fpval<t_signed,t_unsigned,bits> &operator=(const double c) {
		v = (size_type)(c*(double)(1<<bits)+0.5);
		return *this;
	}
	inline double asDouble() const {
        return (double)v/(double)(1<<bits);
	}

	inline bool isNegative() const {
		return v<0;
	}

	template<typename T>
		fpval(const T &);

	fpval(double c) {
		v = (size_type)(c*(1<<bits));
	}

	fpval() {
	}

	ssize_type asInt() const {
		return (v>>bits);
	}
	inline ssize_type asNative() const {
		return v;
	}
	void sprint(char *dest, int sizemax, int decimal);

	void sqrt() {
#if 0
		size_type root, remHi, remLo, testDiv, count;
		root = 0; /* Clear root */
		remHi = 0; /* Clear high part of partial remainder */
		remLo = v; /* Get argument into low part of partial remainder */
		count = 20; /* Load loop counter */
		do {
			remHi = (remHi<<16) | (remLo>>16); remLo <<= 16; /* get 2 bits of arg */
			root <<= 1; /* Get ready for the next bit in the root */
			testDiv = (root << 1) + 1; /* Test radical */
			if (remHi >= testDiv) {
				remHi -= testDiv;
				root++;
			}
		} while (count-- != 0);
		v=root;
#endif
#define value v
#define step(shift) \
	if((0x40000000l >> shift) + root <= value)          \
	{                                                   \
	value -= (0x40000000l >> shift) + root;         \
	root = (root >> 1) | (0x40000000l >> shift);    \
	}                                                   \
	else                                                \
	{                                                   \
	root = root >> 1;                               \
	}

		int root = 0;
		int shift;

		for (shift=0;shift<32;shift+=2) {
			//printhex(0x40000000>>shift);
			//Serial.print(" ");
			//printhex(root);
			//Serial.print(" ");
			//printhex(value);
			//Serial.println("");

			if((0x40000000l >> shift) + root <= value)
			{
				value -= (0x40000000l >> shift) + root;
				root = (root >> 1) | (0x40000000l >> shift);
			}
			else
			{
				root = root >> 1;
			}
		}
		// round to the nearest integer, cuts max error in half

		if(root < value)
		{
			++root;
		}

		root <<=8;

		v=root;


	}
};

static inline __attribute__((always_inline)) int __chars_needed(unsigned int bits)
{
    /*
	switch(bits) {
	case 0: return 0;  // 0
	case 1: return 1;  // 1
	case 2: return 1;  // 2
	case 3: return 1;  // 4
	case 4: return 1;  // 8
	case 5: return 2;  // 16
	}
	*/
	return 10;
}


template<typename t_signed, typename t_unsigned, unsigned int bits>
void fpval<t_signed,t_unsigned,bits>::sprint(char *dest, int sizemax, int decimal) {
	char tmp[ __chars_needed(bits) + 1];
	fpval<t_signed,t_unsigned,bits> radd = 0.5;
	int i;
/*
	if (isNegative())
		radd *= -1.0;
  */
	for (i = 0; i < decimal; i++)
		radd/= fpval<t_signed,t_unsigned,bits>(10.0);

	// Round

	radd+=(*this);

	if (isNegative()) {
        *dest++='-';
		radd *= -1.0;
	}


	// Integer part

	size_type intpart = radd.v>>bits;
	//printf("INT part: %u\n",intpart);
	char *start = sprintint( tmp, __chars_needed(bits),intpart);
	/* copy */
	while (*start) {
		*dest++=*start++;
	}
	*dest++='.';

	int mval=1;
	for (i=1;i<=decimal;i++) {
		size_type low = radd.v & ((1<<bits)-1);
		mval*=10;
		low *= mval;
		low>>=bits;
		low %= 10;
		*dest++=('0'+low);
	}
	*dest='\0';
}


typedef fpval<int, unsigned int, 16> fp32_16_16;

extern "C" unsigned fmul16(unsigned,unsigned);
extern "C" unsigned fsqrt16(unsigned);

template<>
	inline struct fpval<int,unsigned,16> & fpval<int,unsigned,16>::operator*=(const fp32_16_16 &o)
{
	v=fmul16(v,o.v);
    return *this;
}




#endif
