#include <stdio.h>

struct date {
	short	day: 5;
	short	month: 4;
	short	year: 7;
};

struct date date_pack(int year, int month, int day)
{
	struct date date;
	
	date.day = day;
	date.month = month;
	date.year = year - 2000;
	
	return date;
}

struct date date;

int main()
{
	printf("sizeof date = %ld\n", sizeof date);
	date = date_pack(2026, 10, 13);
}
