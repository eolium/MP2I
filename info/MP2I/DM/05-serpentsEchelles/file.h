/* Librairie implémentant des files bornées */

#ifndef FILE_H
#define FILE_H 0

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>


/** On stocke des int dans les files. */
typedef int data;

struct file_s {
  data* arr;     // le tableau circulaire
  int len_max;   // le nb max d'elem de la file
  int sortie;    // l'indice du prochain élément à sortir
  int entree;    // l'indice où aura lieu la prochaine insertion
  bool est_vide; // true ssi la file est vide
};
typedef struct file_s file;


/* Initialisateurs : création, suppression */

/** Crée une file vide de capacité maximale capacite */
file* file_vide(int len_max);

/** Supprime une file */
void file_free(file* f);


/* Accesseurs */

/** Teste si une file est vide */
bool file_est_vide(file const* f);

/** Renvoie le prochain élément à sortir de la file, sans le défiler */
data file_premier(file const* f);

/** Renvoie le dernier élément à sortir de la file, sans le défiler */
data file_dernier(file const* f);

/** Renvoie le nb d'éléments d'une file */
int file_len(file const* f);

/** Affiche les éléments d'une file dans l'ordre où ils sortiront */
void print_file(file const* f);


/* Transformateurs */

/** Enfilage d'un élément x dans la file */
void file_enfile(file* f, data x);

/** Défile la file, et renvoie l'élément défilé */
data file_defile(file* f);

#endif