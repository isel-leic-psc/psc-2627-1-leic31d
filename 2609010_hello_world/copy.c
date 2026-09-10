#include <stdio.h>

int main()
{
	int c = getchar();
	while (c >= 0) {
		putchar(c);
		c = getchar();
	}
}

