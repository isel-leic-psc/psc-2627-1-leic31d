#include <stdarg.h>
#include <stdio.h>

int sum(int n, ...)
{
	va_list vap;
	
	va_start(vap, n);
	
	int result = 0;
	while (n > 0) {
		result = result + va_arg(vap, int);
		n--;
	}
	return result;
}

int main()
{
	int a = sum(2, 4, 5);
	int b = sum(4, 1, 1, 1, 1, 1, 1, 1);
	
	printf("a = %d, b = %d\n", a, b);
}
