#include <stdio.h>
#include <stdint.h>

uint16_t pack_date(int year, int month, int day);

#if 0
uint16_t pack_date(int year, int month, int day)
{
	uint16_t date = year - 2000;
	date = date | month << 7;
	date = date | day << 11;
	return date;
}
#endif

/* parâmetros do tipo ponteiro para variável do tipo int */
void unpack_date(uint16_t date, int *year, int *month, int *day);
#if 0
void unpack_date(uint16_t date, int *year, int *month, int *day)
{
	*year = (date & 0b1111111) + 2000;	/* variável apontada pelo ponteiro year */
	*month = date >> 7 & 0b1111;		/* desreferenciar */
	*day = date >> 11 & 0b11111;
}
#endif

int year = 2026;
int month = 9;
int day = 24;

int main()
{
	int y, m, d;
	    r12 r13 r14
	
	uint16_t date = pack_date(year, month, day);
	printf("date = %d-%d-%d, packed date = %b\n", year, month, day, date);
	
	unpack_date(date, &y, &m, &d);	/* & - ponteiro para (endereço de) referenciar */
	
	printf("packed date = %b, date = %d-%d-%d\n", date, y, m, d);
}



