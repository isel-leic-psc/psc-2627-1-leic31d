#include <stdio.h>

/*
 * Utilizando a convenção string C
 */
char long_line[200];
int long_size;

char current_line[sizeof long_line];
int current_index;


//void copy_line(char *dst, char *src)
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

// zdczdzad adad sfds  sdffsf  sdfs fsff szdf  sdfs sdf  dgv

int main()
{
	int c = getchar();
	while (c >= 0) {
		if (c == '\n') {
			current_line[current_index] = 0;
			if (current_index > long_size) {
				copy_line(long_line, current_line);
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
	print_line(long_line);
}

