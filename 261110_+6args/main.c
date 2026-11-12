#include<stdlib.h>

long use_func8args();

int main()
{
	div_t r = div(23, 5);
	int a = r.quot;
	int b = r.rem;

	use_func8args();
}
