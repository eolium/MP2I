#include <stdlib.h>  // pour EXIT_SUCCESS
#include <stdio.h>   // pour printf
#include <stdbool.h> // pour bool



/** Calcule la somme des entiers impairs entre 0 et n inclus. */
int somme_impairs(int n) {
  return -1; // TODO : rendre correcte.
}


/** Fonction principale, la seule qui est lancée à l'exécution. */
int main(void) {

  /* Tests de somme_impairs */
  printf("Le programme va calculer la somme d'entiers positifs.\n\n"
         "n  -->  somme\n"
  );
  int n = 0;
  while (n < 20) {
    int somme = somme_impairs(n);
    printf("%d  -->  %d\n", n, somme);
    n = n +1;
  }

  /* Fin. On indique que tout s'est bien passé. */
  return EXIT_SUCCESS;
}