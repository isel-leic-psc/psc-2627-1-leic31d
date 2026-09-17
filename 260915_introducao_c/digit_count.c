#include <stdio.h>

int digit_counters[10];

int main()
{
	int c = getchar();
	while (c >= 0) {
		if (c >= '0' && c <= '9') {
			digit_counters[c - '0']++;
		}
		putchar(c);
		c = getchar();
	}
	int i = 0;
	while (i < sizeof digit_counters / sizeof digit_counters[0]) {
		printf("digit_counters[%d] = %d\n", i, digit_counters[i]);
		i++;
	}
}

