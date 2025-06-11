/* Tas max */

#ifndef _H_tas_H_
#define _H_tas_H_ 0

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>


/** Type d'un tas max */
struct tas_s {
    double* arr;  // Le tas
    int max_size; // La longueur allouée de arr
    int len;      // Nombre de noeuds du tas
};
typedef struct tas_s tas;


/** Crée un tas vide de capacité  max_size. */
tas* tas_vide(int max_size);

/** Supprime un tas. */
void tas_free(tas* t);


/** Renvoie si le tas est vide. */
bool tas_est_vide(tas* t);

/** Renvoie le maximum du tas t.
  Ne modifie pas le tas. */
double tas_lit_max(tas const* t);

/** Insère l'élément x dans le tas t. 

  Bonus : redimensionner dynamiquement t
  si besoin.
*/
void tas_insere(tas* t, double x);

/** Extrait le maximum du tas t 
  (et modifie) le tas. 

  Bonus : redimensionner dynamiquement t
  si besoin.
*/
double tas_extrait_max(tas* t);

/** Tri en place tab, de longueur n.

  Bonus : le coder de sorte à ne pas
  allouer de mémoire durant le calcul
  (c'est à dire que l'on utilise tab
  lui-même pour y mettre le tas.)
*/
void heapsort(double* tab, int n);

#endif