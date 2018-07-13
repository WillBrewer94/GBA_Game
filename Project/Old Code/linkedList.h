#include "engine.h"

//=========================================================
// STRUCTS						
//=========================================================

typedef struct NODE {
	ENEMY enemy;
	struct NODE *next;
} NODE;


//=========================================================
// PROTOTYPES						
//=========================================================

void addItem(NODE **head_ref, ENEMY newEnemy);
void deleteNode(NODE *head, NODE *n);