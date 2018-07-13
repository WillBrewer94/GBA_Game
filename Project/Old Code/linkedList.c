#include "linkedList.h"
#include <stdio.h>
#include <stdlib.h>


//=========================================================
// LINKED LIST METHODS						
//=========================================================

//Adds item to beginning of list
void addItem(NODE **head_ref, ENEMY newEnemy) {
	NODE *new_node;

	new_node = (NODE *) malloc(sizeof(NODE));
	new_node->enemy = newEnemy;
	new_node->next = *head_ref;
	*head_ref = new_node;
}

void deleteNode(NODE *head, NODE *n) {
	//When node to be deleted is head node
	if(head == n) {
		if(head->next != NULL) {
			//Copy the data of the next node to head
			head->enemy = head->next->enemy;

			//Store address of the next node
			n = head->next;

			//Remove the link of next node
			head->next = head->next->next;

			//Free memory
			free(n);

			return;
		}

	} else {
		//When not first node, follow normal deletion process

		//Find the previous node
		NODE *prev = head;

		while(prev->next != NULL && prev->next != n) {
			prev = prev->next;
		}

		//Check if node really exists in linked list
		if(prev->next == NULL) {
			return;
		}

		//Remove node from linked list
		prev->next = prev->next->next;

		//Free memory
		free(n);

		return;
	}
}