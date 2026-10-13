#include <stdio.h>

struct example {
	int	a;
	char	b;
	short	c;
};

struct example2 {
	short	c;
	int	a;
	char	b;
};

struct example x;

struct example2 y;

// sizeof (int)

int main()
{
	printf("sizeof x = %ld\n", sizeof x);
	printf("sizeof y = %ld\n", sizeof y);
}
