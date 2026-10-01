#include <stdio.h>

float f = 4.5;

int main() {
	
	int i;
	
	int *pi;
	float *pf;
	
	pf = &f;
	pi = (int *)pf;
	
	i = *pi;
	
	printf("f = %d (%b)\n", i, i);	
}
