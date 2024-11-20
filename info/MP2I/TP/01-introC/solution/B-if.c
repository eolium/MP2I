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
  if (age >= 18) {
    printf("La personne est majeure.\n");
  } else {
    printf("La personne n'est pas majeure.\n");
  }

  return; // ne rien renvoyer à la fin
}

// le type de sortie bool indique que l'on renvoie
// une valeur logique, comme true ou false
bool est_bissextile(int annee) {
  if (annee % 400 == 0) {
    return true;
  } else {
    if (annee % 4 == 0) {
      if (annee % 100 == 0) {
        // div par 100 mais pas par 400
        return false;
      } else {
        // div par 4 mais pas par 100
        return true;
      }
    } else { 
      // pas div par 4
      return false;
    }
  }
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