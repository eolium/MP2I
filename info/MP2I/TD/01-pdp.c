#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include <math.h>



/** Maximum */
int max(int n1, int n2) {
  return (n1 > n2) ? n1 : n2;
}
/** Minimum */
int min(int n1, int n2) {
  return (n1 < n2) ? n1 : n2;
}


/** Spécification : mystère mystère */
int snd_max(int l, int T[]) {
  int maxi = max(T[0], T[1]);
  int snd_maxi = min(T[0], T[1]);
  int i = 2;
  while (i < l) {
    if (T[i] > maxi) {
      snd_maxi = maxi;
      maxi = T[i];
    }
    else if (T[i] > snd_maxi) {
      snd_maxi = T[i];
    }
    i = i+1;
  }
  return snd_maxi;
}



/** Exponentation rapide itérative.
 * Entrées : a entier, n entier positif.
 * Sortie : a^n.
 */
int expo(int a, int n) {
  int puiss = n, res = 1, acc = a;
  while (puiss != 0) {
    if (puiss % 2 == 1) {
      res = res*acc;
    }
    acc = acc*acc;
    puiss = puiss/2;
  }
  return res;
}



/** Recherche dichotomique de x dans T.
 * Entrées : T un tableau de len entiers, trié croissant
 *           x un entier
 * Sortie : si x est dans T, un indice où il se trouve;
 *          sinon -1
 */
int recherche(int len, int T[], int x) {
  int deb = 0, fin = len-1;
  int milieu;
  while (fin - deb >= 0) {
    milieu = (deb + fin)/2;
    if (T[milieu] == x) {
      return milieu;
    }
    else if (T[milieu] < x) {
      deb = milieu+1;
    }
    else {
      fin = milieu - 1;
    }
  }
  return -1;
}




/** Teste si un tableau est une permutation.
 * Entrées : T un tableau de len cases, len <= 1000.
 * Sortie : true SSI T contient chaque entier de [0; len[
 *                   une et une seule fois 
 */
bool est_permutation(int len, int T[]) {
  int compte[1000] = {}; // 1000 cases à 0
  int indice = 0;
  while (indice < len) {
    compte[T[indice]] += 1;
    indice = indice +1;
  }
  indice = 0;
  while (indice < len) {
    if (compte[indice] != 1) {
      return false;
    }
    indice = indice +1;
  }
  return true;
}