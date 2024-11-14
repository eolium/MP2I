#include <stdio.h> // Pour printf pour afficher
#include <stdlib.h> // Pour EXIT_SUCCESS
#include <stdbool.h> // pour le type bool



/* Renvoie si une année est booléenne ou non */
bool est_bissextile(int annee) {
  return annee % 400 == 0  ||  (annee % 4 == 0 && annee % 100 != 0);
}

int main(void) {

  /* test est_bissextile */
  int annee = 1995;
  while (annee < 2025) {
    if (est_bissextile(annee)) {
      printf("%d : BISSEXTILE.\n", annee);
    } else {
      printf("%d : non bissextile.\n", annee);
    }

    annee = annee + 1;
  }
  

  return EXIT_SUCCESS;
}