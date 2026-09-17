#include <stdio.h>

char long_line[100];
int long_size;

char current_line[sizeof long_line];
int current_index;


void copy_line(char dst[], char src[], int size)
{
	int i = 0;
	while (i < size) {
		dst[i] = src[i];
		i++;
	}
}

void print_line(char line[], int size)
{
	int i = 0;
	while (i < size) {
		putchar(line[i]);
		i++;
	}
	putchar('\n');
}

int main()
{
	int c = getchar();
	while (c >= 0) {
		if (c == '\n') {
			if (current_index > long_size) {
				copy_line(long_line, current_line, current_index);
				long_size = current_index;
			}
			current_index = 0;
		}
		else {
			current_line[current_index++] = c;
		}
		
		c = getchar();
	}
	puts("-->");
	print_line(long_line, long_size);
}

