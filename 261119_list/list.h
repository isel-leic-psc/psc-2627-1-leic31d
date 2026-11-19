struct node {
	struct node *next, *prev;
	void *data;
};

void list_insert_next(struct node *node, void *user);
void list_insert_prev(struct node *node, void *user);

void list_remove(struct node *p);
bool list_empty(struct node *node);

