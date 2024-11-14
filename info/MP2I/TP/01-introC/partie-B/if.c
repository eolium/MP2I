#include <stdio.h> // Pour printf pour afficher
#include <stdlib.h> // Pour EXIT_SUCCESS
#include <stdbool.h> // pour le type bool


/** Renvoie le maximum entre a et b */
int max(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

// le type de sortie void signifie que l'on ne renvoie rien.
void affiche_est_majeur(int age) {
  printf("La personne est majeure.\n");

  return; // ne rien renvoyer à la fin
}

// le type de sortie bool indique que l'on renvoie
// une valeur logique, comme true ou false
bool est_bissextile(int annee) {

  return false;
}

int main(void) {

  /* test affiche_est_majeur */
  int age = 16;
  while (age < 20) {
    printf("Âge %d :\n\t", age);
    affiche_est_majeur(age);
    age = age +1;
  }

  /* test est_bissextile */
  


  return EXIT_SUCCESS;
}