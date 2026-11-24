# 0 "calculate.c"
# 1 "/home/ezequiel/Dropbox/disciplinas/psc/2627inv/psc-2627-1-leic31d/261124_linking//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "calculate.c"
# 1 "calculate.h" 1

int calculate();
# 2 "calculate.c" 2







extern int a, b;
static const int x = 1000;
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
 res = *pa + *pb + multiply(x, y) + 1000 + (sizeof (array) / sizeof(array[0]));
 a = 10 * (2 + 3);
 return res;
}
