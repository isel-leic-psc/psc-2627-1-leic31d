#include "calculate.h"

#define X 1000

#define ARRAY_SIZE(a) (sizeof (a) / sizeof(a[0]))

#define SUM(a, b)	(a + b)

extern int a, b;
static const int x = X;
int y = 33;
static int *pa = &a;
static int *pb;
int res;

char array[200];

static int multiply(int a, int b) {
	return a * b;
}

int calculate() {
	pb = &b;
	res = *pa + *pb + multiply(x, y) + X + ARRAY_SIZE(array);
	a = 10 * SUM(2, 3);
	return res;
}
