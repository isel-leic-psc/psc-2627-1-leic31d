#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
	int opt;

	while ((opt = getopt(argc, argv, "i:o:c")) != -1) {
		switch (opt) {
			case 'i':
				printf("-i %s\n", optarg);
				break;
			case 'o':
				printf("-o %s\n", optarg);
				break;
			case 'c':
				printf("-c\n");
				break;
			default: /* '?' */
			   printf("%c\n", optopt);
			   exit(EXIT_FAILURE);
		}
	}
}
