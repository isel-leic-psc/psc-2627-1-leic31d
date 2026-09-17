#include <stdio.h>
#include <string.h>

/*
 * Utilizando a convenção string C
 * Utiliza funções da biblioteca de strings
 */
char long_line[200];

char current_line[sizeof long_line];
size_t current_size;

int main()
{
	int c = getchar();
	while (c != EOF) {
		if (c == '\n') {
			if (current_size > strlen(long_line)) {
				current_line[current_size] = 0;
				strcpy(long_line, current_line);
			}
			current_size = 0;
		}
		else {
			current_line[current_size++] = c;
		}
		c = getchar();
	}
	printf("---> %s\n", long_line);
}

