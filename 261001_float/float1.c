#include <stdio.h>

int i = 4294967296;

float f = 4294967296.0;

int main() {
	printf("sizeof i = %ld\n", sizeof i);
	printf("sizeof f = %ld\n", sizeof f);
	printf("i = %d, f = %f\n", i, f);
	f = f + 1;
	printf("i = %d, f = %f\n", i, f);
	f = f + (1 << 10);
	printf("i = %d, f = %f\n", i, f);	
	f = f + (1 << 8);
	printf("i = %d, f = %f\n", i, f);	
}
