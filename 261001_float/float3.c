#include <stdio.h>

float f = 478.502456;

int main() {
	
	unsigned int i = *(int *)&f;
	
	unsigned long w = i & ((1 << 23) - 1);
	
	w = w + (1 << 23);
	
	int exp = i >> 23 & (1 << 8) - 1;
	
	if (exp > 127)
		w = w << (exp - 127);
	else if (exp < 127)
		w = w >> (127 - exp);
	else
		;
	
	w = w * 1000000;
	
	w = w >> 23;
	
	char buffer[100];
	int index = 0;
	while (w > 0) {
		buffer[index++] = w % 10 + '0';
		w = w / 10;
	}
	buffer[index] = 0;
	int j = 0;
	int k = index - 1;
	while (j < k) {
		char tmp = buffer[k];
		buffer[k] = buffer[j];
		buffer[j] = tmp;
		k--;
		j++;
	}
	printf("%s\n", buffer);
}
