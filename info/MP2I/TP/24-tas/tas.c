/* Implémentation des tas max */

#include "tas.h"


/************/
/* Tas max */
/***********/

/** Affiche un tableau. Utile pour déboguer. */
void print_arr(double* arr, int len) {
  if (len == 0) {
    printf("[||]\n");
  }
  else {
    printf("[|%2lf", arr[0]);
    for (int i=1; i < len; i+=1) {
      printf("; %2lf", arr[i]);
    }
    printf("|]\n");
  }
}



/***************/
/* Tri par tas */
/***************/




tas* tas_vide(int max_size) {
  assert(max_size > 0);

  tas* t = (tas*) malloc(sizeof(tas));
  t->max_size = max_size;
  t->len = 0;
  t->arr = (double*) malloc(sizeof(double) * max_size);

  return t;
}


void tas_free(tas* t) {
  free(t->arr);
  free(t);
}


bool tas_est_vide(tas* t) {
  return t->len == 0;
}


double tas_lit_max(tas const* t) {
  assert(t->len > 0);

  return t->arr[0];
}


int gauche(int i) {
  return 2*i+1;
}


int droite(int i) {
  return 2*i+2;
}


int parent(int i) {
  return i/2;
}


void percoleHaut(tas* t, int i) {
  while (i > 0 && t->arr[i] > t->arr[parent(i)]) {
    if (t->arr[i] > t->arr[parent(i)]) {
      double c = t->arr[i];
      t->arr[i] = t->arr[parent(i)];
      t->arr[parent(i)] = c;
    }
  }
}


void percoleBas(tas* t, int i) {
  if (gauche(i) < t->len) {
    int i_max;
    if (droite(i) < t->len && t->arr[gauche(i)] < t->arr[droite(i)]) {
      i_max = droite(i);
    } else {
      i_max = gauche(i);
    }

    if (t->arr[i] > t->arr[i_max]) {
      double c = t->arr[i];
      t->arr[i] = t->arr[i_max];
      t->arr[i_max] = c;

      percoleBas(t, i_max);
    }
  }
}


void tas_insere(tas* t, double x) {
  assert(t->max_size > 0);

  while (t->len >= t->max_size) {
    t->max_size*=2;
    double* new_tab = (double*) malloc(sizeof(double) * t->max_size);
    for (int i = 0; i < t->len; i++) {
      new_tab[i] = t->arr[i];
    }
    free(t->arr);
    t->arr = new_tab;
  }

  t->arr[t->len] = x;
  t->len++;

  percoleHaut(t, t->len-1);
}


double tas_extrait_max(tas* t) {
  // Redimensionnement si tableau "trop vide"
  if (t->len * 4 < t->max_size) {
    double* new_tab = (double*) malloc(sizeof(double) * t->len);
    for (int i = 0; i < t->len; i++) {
      new_tab[i] = t->arr[i];
    }
    free(t->arr);
    t->arr = new_tab;
  }

  double out = tas_lit_max(t);

  double c = t->arr[0];
  t->arr[0] = t->arr[t->len-1];
  t->arr[t->len-1] = c;

  t->len--;

  percoleBas(t, 0);

  return out;
}



int main() {
  tas* t = tas_vide(8);
  t->len = 6;
  t->arr[0] = 14;
  t->arr[1] = 13;
  t->arr[2] = 8;
  t->arr[3] = 7;
  t->arr[4] = 1;
  t->arr[5] = 2;

  printf("%lf\n", t->arr[0]);

  printf("%d\n", tas_est_vide(t));

  print_arr(t->arr, t->len);

  printf("%lf\n", tas_lit_max(t));

  tas_insere(t, 3.0);
  tas_insere(t, 3.0);
  tas_insere(t, 3.0);

  print_arr(t->arr, t->len);

  tas_extrait_max(t);

  print_arr(t->arr, t->len);

  tas_free(t);
}