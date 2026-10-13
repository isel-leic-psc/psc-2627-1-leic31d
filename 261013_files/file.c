#include <stdio.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
	FILE *fd = fopen(argv[1], "w");
	if (fd == nullptr) {
		printf("fopen(%s): %s\n", argv[1], strerror(errno));
	}
	
	for (int i = 0; i < 10; ++i)
		fprintf(fd, "%d\n", i);
	fclose(fd);
}
