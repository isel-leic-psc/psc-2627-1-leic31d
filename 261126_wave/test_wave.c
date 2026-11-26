#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

/*
 * Só funciona em processador little ended 
 */
 
struct Chunk {
	char ChunkID[4];
	uint32_t ChunkSize;
	char Format[4];
};

struct Chunk Chunk;

int main(int argc, char *argv[])
{
	FILE *fd = fopen(argv[1], "r");
	
	fread(&Chunk, 1, sizeof Chunk, fd);
	
	if (strncmp(Chunk.Format, "WAVE", 4) != 0) {
		fprintf(stderr, "O ficheiro %s não tem o formato WAVE\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	
}
