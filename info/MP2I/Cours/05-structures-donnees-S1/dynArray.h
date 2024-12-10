/* Interface de tableaux dynamiques contenant des entiers int */

#ifndef _H_DYNARRAY_H_
#define _H_DYNARRAY_H_ 0

#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>


/** Structure d'un tableau dynamique */
struct dynArray_s {
  int* arr;         // pointeur vers la zone contenant les cases
  unsigned len;     // nombre de cases utilisées de arr
  unsigned len_max; // nombre de cases de arr
};
typedef struct dynArray_s dynArray;


/* Constructeurs */

/** Crée un tableau dynamique de longueur n, dont les cases sont initialisées à x */
dynArray dyn_create(unsigned len, int x);

/** Libère le contenu de d */
void dyn_free(dynArray* d);

/** Crée un tableau dynamique qui contient les len valeurs pointées par ptr */
dynArray dynarray_of_array(unsigned len, int const* ptr);


/* Accesseurs */

/** Renvoie l'élément d'indice i de d. */
int dyn_get(dynArray const* d, int i);

/** Renvoie le nombre d'élément de d. */
unsigned dyn_len(dynArray const* d);

/** Affiche le contenu de d.
  * N'affiche que les cases utilisées. Ne met pas de \n final. */
void dyn_print(dynArray const* d);


/* Transformateurs */

/* Écrit x dans la case d'indice i de d. */
void dyn_set(dynArray* d, int i, int x);

/** Ajoute x à la fin de d.*/
void dyn_append(dynArray* d, int x);

/** Retire et renvoie le dernier élément de d.
  * Échoue et interrompt le programme si dyn_len(d) == 0 */
int dyn_pop(dynArray* d);



#endif