
void user_insert(char *name)
{
}

char *user_answer()
{
	struct user *user = queue.head;
	queue.head = queue.head->next; 	/* user->next */
	char *name = user->name;
	free(user);
	return name;
}

void user_remove(char *name)
{
	struct user *prev = nullptr;
	for (struct user *ptr; ptr != nullptr ; prev = ptr, ptr = ptr->next)
		if (strcmp(user->name, name) == 0)
			break;
	if (prev == nullptr)
		queue.head = ptr->next;
	else
		prev->next = ptr->next;
	free(user->name);
	free(user);
}

void user_delete_queue()
{
	struct user *next;
	for (struct user *ptr = queue.head; ptr != nullptr; ptr = next) {
		next = ptr->next;
		free(ptr->name);
		free(ptr);
	}
}

static void help()
{
	printf("Comandos:\n"
		"        S        - Sair do programa\n"
		"        H        - Mostrar lista de comando\n"
		"        N <name> - Chegada de novo utente\n"
		"        D <name> - Desistencia de utente\n"
		"        L        - Listar fila de espera\n"
		"        A        - Atender utente\n");
}

int main()
{
	char line[100];
	while (true) {
		if (fgets(line, sizeof line, stdin) == NULL)
			return EXIT_FAILURE;
		char *command = strtok(line, " \n");
		if (command == NULL)
			continue;
		char *name = strtok(nullptr, " \n");
		switch (toupper(*command)) {
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


