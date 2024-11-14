#include <stdio.h> // Pour printf pour afficher
#include <stdlib.h> // Pour EXIT_SUCCESS
#include <stdbool.h> // pour le type bool



/* Renvoie si une année est booléenne ou non */
bool est_bissextile(int annee) {
  return annee % 400 == 0  ||  (annee % 4 == 0 && annee % 100 != 0);
}

int main(void) {

  /* Lire l'entrée */
  int annee = 0;
  printf("Entrez l'année : ");
  scanf(" %d", &annee);

  /* Afficher la réponse */
  if (est_bissextile(annee)) {
    printf("L'année %d est bissextile.\n", annee);
  } else {
    printf("L'année %d n'est pas bissextile.\n", annee);
  }
  
  /* Fin. On indique que tout s'est bien passé. */
  return EXIT_SUCCESS;
}