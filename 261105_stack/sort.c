#include <stdio.h>
#include <string.h>

#define ARRAYS_SIZE(a)  sizeof a / sizeof a[0]

struct person {
	char name[30];
	int score;
	char age;
	int number;
};

struct person people[] = {
	{.name = "Ana", .number = 50456, .age = 20},
	{"Rui", 0, 79, 50234},
	{"Luis", 0, 87, 55464}
};

void person_swap(struct person *a, struct person *b);
/*
 {
	struct person tmp = *a;
	*a = *b;
	*b = tmp;
}
*/

void swap(void *a, void *b, size_t elem_size);
/*
{
	char tmp[elem_size];
	memcpy(tmp, a, elem_size);
	memcpy(a, b, elem_size);
	memcpy(b, tmp, elem_size);
}
*/
void sort(void *array, size_t elem_size, size_t array_size,
		int (*cmp)(void *, void *));
/*
{
	for (size_t i = 0; i < array_size - 1; ++i)
		for (size_t j = 0; j < array_size - 1 - i; ++j)
			if (cmp((char *)array + j * elem_size, (char *)array + (j + 1) * elem_size) > 0)
				swap((char *)array + j * elem_size, (char *)array + (j + 1) * elem_size, elem_size);
}
*/

void print_people(struct person array[], size_t array_size) {
	for (size_t i = 0; i < array_size; ++i)
		printf("number = %d, name = %s, age = %d, score = %d\n",
			array[i].number, array[i].name, array[i].age, array[i].score);
}

int person_cmp(void *a, void *b)
{
	struct person *a_person = a;
	struct person *b_person = b;
	return a_person->number - b_person->number;
}

int main() {
	print_people(people, ARRAYS_SIZE(people));
	putchar('\n');
	sort(people, sizeof people[0], ARRAYS_SIZE(people), person_cmp); 
	print_people(people, ARRAYS_SIZE(people)); 
}
