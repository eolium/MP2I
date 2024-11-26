#include <stdio.h>
#include <stdlib.h>


int somme = -10;
int Lmax = 100000;


int somme_tableau(int T[], int len) {
  if (len > Lmax) {
    // faire planter le programme
    exit(EXIT_FAILURE);
  }

  int somme = 0;
  int indice = 0;
  while (indice < len) {
    int tmp = 666;
    somme = somme + T[indice];
    indice = indice +1;
  }

  return somme;
}


int main(void) {
  int T[] = {5, 85, -20};
  int sortie_somme = somme_tableau(T, 3);
  printf("variable globale somme  : %d\n", somme);
  printf("sortie de somme_tableau : %d\n", sortie_somme);
  
  return EXIT_SUCCESS;
}