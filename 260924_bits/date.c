#include <stdio.h>
#include <stdint.h>

uint16_t pack_date(int year, int month, int day)
{
	uint16_t date = year - 2000;
	date = date | month << 7;
	date = date | day << 11;
	return date;
}

void unpack_date(uint16_t date, int year, int month, int day)
{
	/*********** CÒDIGO INCOMPLETO E INCORRETO ************/
	
	year = (date & 0b1111111) + 2000;
	month = 0;
	day = 0;
}


int main()
{
	int year = 2026;
	int month = 9;
	int day = 24;
	uint16_t date = pack_date(year, month, day);
	printf("date = %d-%d-%d, packed date = %b\n", year, month, day, date);
	
	int y, m, d;
	unpack_date(date, y, m, d);
	printf("packed date = %b, date = %d-%d-%d\n", date, year, month, day);
}
