/* Implémentation de Serpents et Echelles */
#include "plateaux.h"
#include <stdlib.h>



/* Constructeurs */

plateau plateau_mini(void) {
  int const nb_cases = 12;
  int* cases = (int*) malloc(nb_cases * sizeof(int));
  for (int i = 0; i < nb_cases; i += 1) { cases[i] = i; }

  cases[10] = 2;
  cases[4] = 8;

  plateau p = {.nb_cases = nb_cases, .cases = cases};
  return p;
}

plateau plateau_enonce(void) {
  int const nb_cases = 100;
  int* cases = (int*) malloc(nb_cases * sizeof(int));
  for (int i = 0; i < nb_cases; i+= 1) { cases[i] = i; } 

  // Serpents
  cases[27] = 17;
  cases[67] = 10;
  cases[79] = 40;
  cases[95] = 71;
  cases[98] = 6;

  // Échelles
  cases[3] = 42;
  cases[8] = 54;
  cases[24] = 86;
  cases[50] = 93;
  cases[58] = 65;
  cases[59] = 81;

  plateau p = {.cases = cases, .nb_cases = 100};
  return p;
}


plateau plateau_rand(int nb_cases, unsigned seed) {
  int* cases = (int*) malloc(nb_cases * sizeof(int));
  
  cases[0] = 0;
  cases[nb_cases-1] = nb_cases-1;
  // Proportion : 
  // 1/8 de serpents, 1/8 d'échelles,
  // le reste normal
  srand(seed);
  for (int i = 1; i < nb_cases-1; i += 1) {
    int r = rand() % 8;
    if (r == 0) { // Serpent
      cases[i] = rand() % i;
    }
    else if (r == 1) { // Échelle
      int offset = rand() % (nb_cases-1 -i);
      cases[i] = i+1 + offset;
    }
    else {
      cases[i] = i;
    }
  }

  plateau p = {.cases = cases, .nb_cases = nb_cases};
  return p;
}


void plateau_free(plateau p) {
  free(p.cases);
}



/* Accesseurs */


bool est_valide(plateau const p, int pos) {
  return 0 <= pos && pos < p.nb_cases;
}

bool est_final(plateau const p, int pos) {
  return pos == p.nb_cases -1;
}


int avance(plateau const p, int pos, int roll) {
  if (est_valide(p, pos+roll)) {
    return p.cases[pos+roll];
  }
  else {
    return p.nb_cases;
  }
}