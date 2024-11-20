#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


/** Teste si T contient les mêmes valeurs que U.
    len est leur longueur.
 */
int egalite(int T[], int U[], int len) {
  int indice = 0;
  while (indice < len) {
    if (T[indice] != U[indice]) { return false;}
    indice = indice +1;
  }
  return true;
}

/** Teste si T contient les premières valeurs
    d'une suite arithmétique. Autrement dit,
    teste si T[i+1]-T[i] est constant.
 */
bool debut_arithmetique(int T[], int len) {
  if (len == 0 || len == 1) { 
    return true;
  }

  int ecart = T[1]-T[0];
  int indice = 1;
  while (indice+1 < len) {
    if (T[indice+1] - T[indice] != ecart) { 
      return false; 
    }
    indice = indice +1;
  }
  return true;
}

/** Renvoie true SSI T < U lexicographiquement
    len est la longueur des tableaux
 */
bool str_inf_lex(int T[], int U[], int len) {
  int indice = 0;
  while (indice < len) {
    if (T[indice] < U[indice]) {
      return true;
    }
    indice = indice +1;
  }
  return false;
}


int main(void) {

  // TODO : tests !!!!


  return EXIT_SUCCESS;
}