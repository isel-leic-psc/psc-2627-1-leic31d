/*
 *	Ordenar um array de valores inteiros
 */
 #include <stddef.h>
 
 #if 0
 int a;   sizeof a == 4
 
 char c;  sizeof c == 1
 #endif
 
 int array1[] = {12, 1231, 3, 4, 10, 0, 7};	//	sizeof array1 == 7 * 4
 
 void int_sort(int array[], size_t array_size)
 {
 
 }
 
 void int_print(int array[], size_t array_size)
 {
 
 }
 
#define ARRAY_SIZE(a)	sizeof a / sizeof a[0]
 
 int main()
 {
	int_sort(array1, ARRAY_SIZE(array1));
	int_print(array1, ARRAY_SIZE(array1));
 }
