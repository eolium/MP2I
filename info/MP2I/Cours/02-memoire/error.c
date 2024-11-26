#include <stdlib.h>

double* zombiLeRetour(void) {
  double tab[5] = {3.14, -4.2, 2.71, 5.0};
  return tab;
}


int main(void) {
  double* tab = zombiLeRetour();
  return EXIT_SUCCESS;
}