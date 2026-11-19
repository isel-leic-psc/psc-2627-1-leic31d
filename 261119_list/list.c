#include <stdlib.h>


#include "list.h"

void list_insert_next(struct node *node, void *user)
{
	struct node *new = malloc(sizeof *new);
	
	new->data = user;
	
	new->next = node->next;
	new->prev = node;

	node->next->prev = new;
	node->next = new;
}

void list_insert_prev(struct node *node, void *user)
{
	struct node *new = malloc(sizeof *new);
	
	new->data = user;
	
	new->next = node;
	new->prev = node->prev;

	node->prev->next = new;
	node->prev = new;
}

void list_remove(struct node *p)
{
	p->prev->next = p->next;
	p->next->prev = p->prev;
	free(p);
}

bool list_empty(struct node *node)
{
	return node->next == node;
}
