#include "B-tableaux.h"
#include <stdbool.h> // pour bool


/* partie B.2 */

/** Renvoie la première case de T */
int premiere_case(int T[]) {
  return T[0];
}

/** Renvoie la somme des len cases de U */
int somme_tableau(int U[], int len) {
  int somme = 0;
  int indice = 0;
  while (indice < len) {
    somme = somme + U[indice];
    indice = indice +1;
  }
  return somme;
}

/** Mystère mystère...
 */
int mystere(int T[], int len) {
  int indice = 0;
  int maxi = T[0];
  while (indice < len) {
    if (maxi < T[indice]) {
      maxi = T[indice];
    }
    indice = indice +1;
  }
  return maxi;
}

/** Teste si x est présent dans une des len cases de T */
bool est_present(int x, int T[], int len) {
  int indice = 0;
  while (indice < len) {
    if (T[indice] == x) { return true; }
    indice = indice +1;
  }
  return false;
}


/* partie B.3 */

/** Teste si un tableau commence par 9 4 3 8 7 5 . */
bool est_943875(int T[]) {
  return T[0] == 9 && T[1] == 4
      && T[2] == 3 && T[3] == 8
      && T[4] == 7 && T[5] == 5;
}

/** Fonction-exo création de tableau */
bool foo(void) {
  int T[] = {9, 4, 3, 8, 7, 5};
  return est_943875(T);
}


/* partie B.4 */

/** Double le contenu du tableau tab, de longueur len. */
void double_tableau(int tab[], int len) {
  int indice = 0;
  while (indice < len) {
    tab[indice] = 2*tab[indice];
    indice = indice +1;
  }
  return;
}

/** Recopie src dans dest. Les deux sont de longueur len. */
void copie(int dest[], int src[], int len) {
  int indice = 0;
  while (indice < len) {
    dest[indice] = src[indice];
    indice = indice +1;
  }
  return;
}


int min(int a, int b) {
  if (a < b) { return a; }
  return b;
}

/** Stocke dans V les min et T et U, longueur len. */
void map2_min(int V[], int T[], int U[], int len) {
  int indice = 0;
  while (indice < len) {
    V[indice] = min(T[indice], U[indice]);
    indice = indice +1;
  }
  return;
}