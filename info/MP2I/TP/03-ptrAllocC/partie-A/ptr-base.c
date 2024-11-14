#include <stdlib.h>
#include <stdio.h>

int main(void) {

  int x = 42;
  int* pointeur = &x; // pointeur contient l'adresse du contenu de x
  printf("x contient %d, et est rangé à l'adresse %p.\n", x, &x);

  int y = *pointeur;
  printf("y contient %d, et est rangé à l'adresse %p.\n", y, &y);

  *pointeur = 5;
  printf("Après modification du contenu de la case mémoire %p, x contient %d et y contient %d.\n", pointeur, x, y);

  return EXIT_SUCCESS;
}