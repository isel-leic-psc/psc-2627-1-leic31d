#include <stdio.h>

#if 0

union Float {
	float f;
	unsigned i;
};

union Float my_float = { .f = 1.25 };


int main()
{
	printf("sizeof my_float = %ld\n", sizeof my_float);
	printf("my_float = %032b\n", my_float.i);
}

#endif

#if 1

union Float {
	float f;
	unsigned i;
	struct {
		unsigned mantissa:23;
		unsigned exponet:8;
		unsigned signal:1;
	};
};

union Float my_float = { .f = 1.25 };	/*    */


int main()
{
	printf("sizeof my_float = %ld\n", sizeof my_float);
	printf("my_float = %032b\n", my_float.i);
	printf("my_float = mantissa: %023b, exponet: %08b, signal:%d\n", my_float.mantissa, my_float.exponet, my_float.signal);
}

#endif
