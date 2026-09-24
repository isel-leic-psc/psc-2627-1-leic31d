/*
 *	Ordenar um array de valores inteiros
 */
#include <stdio.h>

#if 0
int a;   sizeof a == 4

char c;  sizeof c == 1
#endif
 
#define DIM 8
 
void int_sort(int array[], size_t array_size)
{
	for (int i = 0; i < array_size - 1; ++i)
		for (int j = 0; j < array_size - 1 - i; ++j)
			if (array[j] > array[j + 1]) {
				int tmp = array[j];
				array[j] = array[j + 1];
				array[j + 1] = tmp;
			}
}
 
void int_print(int array[], size_t array_size)
{
	for (int i = 0; i < array_size; ++i)
		printf("array[%d] = %d\n", i, array[i]);
}

#define ARRAY_SIZE(a)	sizeof a / sizeof a[0]
 

 
int main()
{
	int array1[DIM] = {12, 1231, 3, 4, 10, -1, 7};
	 
	int_print(array1, ARRAY_SIZE(array1));
	int_sort(array1, ARRAY_SIZE(array1));
	putchar('\n');
	int_print(array1, ARRAY_SIZE(array1));
}
