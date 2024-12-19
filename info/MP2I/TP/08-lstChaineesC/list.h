/** Librairie de manipulation de listes simplement chainées */

#ifndef _H_LIST_H_
#define _H_LIST_H_ 0

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>


/** Le type des cellules */
struct cellule_s {
  int elem;
  struct cellule_s* next;
};
typedef struct cellule_s cellule;


/* Constructeurs */

/** La constante liste vide 
    (le motclef extern est hors-programme.) */
extern cellule const* vide;

/** Crée une liste contenant uniquement l'élement x */
cellule* list_create(int x);

/** Désalloue toute une liste */
void list_free(cellule* p);


/* Accesseurs */

/** Renvoie l'élément de tête de liste */
int list_hd (cellule const* p);

/** Renvoie un pointeur vers la queue d'une liste */
cellule* list_tl(cellule const* p);

/** Renvoie le nombre d'éléments d'une liste */
unsigned list_length(cellule const* p);

/** Teste l'appartenance d'un élément à une liste */
bool list_mem(int x, cellule const* p);

/** Affiche récursivement tout une liste */
void list_print(cellule const* p);


/* Transformateurs */

/** Ajoute un élément en tête de liste
    et renvoie un pointeur vers cette nouvelle tête*/
cellule* list_cons(int x, cellule const* p);



/* Le reste */


/* Renvoie le ième élément de la liste */
int list_get(cellule* const p, unsigned i);

cellule* array_to_list(int* const tab, unsigned len);

int* list_to_array(cellule* const p);

cellule* list_tri(cellule* const p);

#endif