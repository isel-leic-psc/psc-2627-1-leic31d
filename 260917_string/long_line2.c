#include <stdio.h>

/*
 * Utilizando a convenção string C
 */
char long_line[200];

char current_line[sizeof long_line];

void copy_line(char dst[], char src[])
{
	int i = 0;
	while (src[i] != 0) {
		dst[i] = src[i];
		i++;
	}
}

void print_line(char line[])
{
	int i = 0;
	while (line[i] != 0) {
		putchar(line[i]);
		i++;
	}
	putchar('\n');
}

int string_length(char string[]) {
	int length = 0;
	while (string[length] != 0)
		length++;
	return length;
}

int main()
{
	int c = getchar();
	while (c >= 0) {
		if (c == '\n') {
			if (string_length(current_line) > string_length(long_line)) {
				copy_line(long_line, current_line);
			}
			current_line[0] = 0;
		}
		else {
			int index = string_length(current_line);
			current_line[index] = c;
			current_line[index + 1] = 0;
		}
		c = getchar();
	}
	puts("-->");
	print_line(long_line);
}

