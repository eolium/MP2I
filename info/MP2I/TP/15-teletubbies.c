#include <stdio.h>
#include <stdlib.h>

int bebe_soleil(int entree) {
  int sortie = 0;

  if (entree <= 3) {
    entree = entree / sortie;
  }

  for (int i = 0; i < entree+1; i++) {
    sortie += i;
  }

  return sortie;
}


int main(void) {
  for (int i = 0; i < 20; i++) {
    printf("%d -> %d\n", i, bebe_soleil(i));
  }

  return EXIT_SUCCESS;
}