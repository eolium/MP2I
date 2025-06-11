/* Plateaux de Serpents et Échelles */

#ifndef PLATEAUX_H
#define PLATEAUX_H

#include <stdlib.h>
#include <stdbool.h>


/** Un plateau est un tableau de cases. 

    Dans cases[i], on trouve l'indice de la case 
    où la case i nous téléporte. Si cases[i] ne 
    téléporte nulle part, alors cases[i] = i 
*/
struct plateau_s {
  int* cases;
  int nb_cases;
};
typedef struct plateau_s plateau;



/* Accesseurs */

/** Renvoie true si et seulement pos est
    une position valide du plateau. */
bool est_valide(plateau const p, int pos);

/** Renvoie true si et seulement si pos est
    la position de la dernière case de plateau */
bool est_final(plateau const p, int pos);

/** Renvoie la position obtenue en faisant avancer 
    de roll cases le pion, depuis la position pos,
    puis en appliquant la téléportation éventuelle.

    /!\ Si la position obtenue dépasse du plateau
    (et donc que le coup est en fait impossible), 
    on renvoie une position invalide.
*/
int avance(plateau const p, int pos, int roll);


/* Constructeurs */

/** Renvoie le (grand) plateau de l'énoncé.

    NB : avec une case 0 au début en plus,
    et la case 100 à la fin en moins.
*/
plateau plateau_enonce(void);


/** Renvoie lee tout petit plateau de l'énoncé */
plateau plateau_mini(void);

/** Crée un plateau généré aléatoirement. 
    
    - nb_cases est le nombre de cases du plateau.
    - seed est la graine de l'aléatoire. Ainsi, la
      sortie de la fonction est entièrement déterminée
      par nb_cases et seed. 
*/
plateau plateau_rand(int nb_cases, unsigned seed);

/** Libère un plateau créé par les fonctions précédentes */
void plateau_free(plateau p);

#endif