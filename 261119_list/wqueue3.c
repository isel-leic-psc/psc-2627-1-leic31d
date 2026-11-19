#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

#include "list.h"

struct user {
	char *name;
	time_t time;
};

struct node queue = {.next = &queue, .prev = &queue};	// sentinel

void user_insert(char *name) {
	struct user *user = malloc(sizeof *user); /* sizeof (struct user));*/
	if (user == NULL) {
		fprintf(stderr, "Out of memory\n");
		exit(EXIT_FAILURE);
	}
	user->name = malloc(strlen(name) + 1);
	if (user->name == NULL) {
		fprintf(stderr, "Out of memory\n");
		exit(EXIT_FAILURE);
	}
	strcpy(user->name, name);
	user->time = time(NULL);
	
	list_insert_prev(&queue, user);
}

char *user_answer() {
	if (list_empty(&queue))
		return NULL;

	struct node *p = queue.next;
	
	struct user *user = p->data;

	list_remove(p);
	
	char *name = user->name;
	free(user);
	return name;
}

void user_remove(char *name) {
	for (struct node *p = queue.next; p != &queue; p = p->next) {
		struct user *user = p->data;
		if (strcmp(user->name, name) == 0) {
			list_remove(p);
			
			free(user->name);
			free(user);
			return;
		}
	}
}

void user_delete_queue() {
	struct node *next;
	for (struct node *p = queue.next; p != &queue; p = next) {
		struct user *user = p->data;
		next = p->next;
		list_remove(p);
		
		free(user->name);
		free(user);
	}
}

void user_print() {
	int i = 1;
	for (struct node *p = queue.next; p != &queue; p = p->next, i++) {
		struct user *user = p->data;		
		printf("[%d] %s\n", i, user->name);
	}
}

void help()
{
	printf("Comandos:\n"
		"        s        - Sair do programa\n"
		"        h        - Mostrar lista de comando\n"
		"        n <name> - Chegada de novo utente\n"
		"        d <name> - Desistencia de utente\n"
		"        l        - Listar fila de espera\n"
		"        a        - Atender utente\n");
}

int main()
{
	char line[100];
	while (true) {
		fputs( "> ", stdout);
		if (fgets(line, sizeof line, stdin) == NULL)
			return EXIT_FAILURE;
		char *command = strtok(line, " \n");
		if (command == NULL)
			continue;
		char *name = strtok(NULL, " \n");
		switch (toupper(*command)) {
			case 's':
			case 'S':
				user_delete_queue();
				return EXIT_FAILURE;
			case 'H':
				help();
				break;
			case 'N':
				user_insert(name);
				break;
			case 'D':
				user_remove(name);
				break;
			case 'L':
				user_print();
				break;
			case 'A':
				name = user_answer();
				if (nullptr == name) {
					printf("Fila vazia\n");
				}
				else {
					printf("Atender %s\n", name);
					free(name);
				}
				break;
		}
	}
}
