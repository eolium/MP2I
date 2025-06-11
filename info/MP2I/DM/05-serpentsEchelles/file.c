/* Implémentation de files bornées par des tableaux circulaires */

#include "file.h"


/* Initialisateurs */

file* file_vide(int len_max) {
  file* f = (file*) malloc(sizeof(file));
  f->arr = (int*) malloc(len_max * sizeof(data));
  f->len_max = len_max;
  f->sortie = 0;
  f->entree = 0;
  f->est_vide = true;
  return f;
}


void file_free(file* f) {
  free(f->arr);
  free(f);
  return;
}



/* Accesseurs */

bool file_est_vide(file const* f) {
  return f->est_vide;
}


data file_premier(file const* f) {
  return f->arr[f->sortie];
}


data file_dernier(file const* f) {
  int indice_dernier = (f->entree -1 +f->len_max) % f->len_max;
  return f->arr[indice_dernier];
}


int file_len(file const* f) {
  return (f->entree - f->sortie +f->len_max) % f->len_max; 
}


void print_file(file const* f) {
  printf("<-- ");
  for (int i = f->sortie; i != f->entree; i = i+1 % f->len_max) {
    printf("%d ", f->arr[i]);
  }
  printf("<--");
  return;
}



/* Transformateurs */


void file_enfile(file* f, data x) {
  if (!f->est_vide && f->entree == f->sortie) {
    fprintf(stderr, "Erreur : enfilage dans une file pleine.\n");
    exit(EXIT_FAILURE);
  }

  f->arr[f->entree] = x;
  f->entree = (f->entree +1) % f->len_max;
  f->est_vide = false;
  return;
}


data file_defile(file* f) {
  if (f->est_vide) {
    fprintf(stderr, "Erreur : défilage dans une file vide.\n");
    exit(EXIT_FAILURE);
  }
  
  data sortie = f->arr[f->sortie];
  f->sortie = (f->sortie + 1 + f->len_max) % f->len_max;
  if (f->sortie == f->entree) {
    f->est_vide = true;
  }
  return sortie;
}