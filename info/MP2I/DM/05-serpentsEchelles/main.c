/* Votre main à vous.

  Faites-y ce que vous voulez : je n'utilise pas ce fichier 
  pour les tests (j'ai mon main à moi dans testeur.o)
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <limits.h>
#include <assert.h>

#include "file.h"
#include "plateaux.h"
#include "solver.h"



/** Affiche le résultat d'un test de solubilité.
    Interrompt le programme si le résultat est incorrect
    (et envoie un signal d'erreur).

  /!\ Suppose que le plateau p est soluble.
*/
void test_soluble(plateau p, char const* nom_p, int reponse) {
  int lg_sol = 0;
  bool status = soluble(p, &lg_sol);
  if (!status) {
    printf("Le plateau %s n'aurait pas de solution..."
           " Erreur !\n", nom_p);
    exit(EXIT_FAILURE);
  }
  else if (lg_sol != reponse) {
    printf("Pour le plateau %s, une plus courte solution"
           " de longueur %d a été trouvée... mais la plus courte est"
           " en fait de longueur %d !\n", nom_p, lg_sol, reponse);
    exit(EXIT_FAILURE);
  }
  else {
    printf("Pour le plateau %s, une plus courte solution"
           " de longueur %d a été trouvée. C'est valide ! 🙂\n", nom_p, lg_sol);
  }

  return;
}


/** Affiche le résultat d'un test de nombre de chemins.
    Interrompt le programme si le résultat est incorrect
    (et envoie un signal d'erreur).
*/
void test_nb_path(plateau p, char const* nom_p, int max_path_len, int64_t reponse) {
  int64_t nb = nb_path(p, max_path_len);
  if (nb != reponse) {
    printf("Pour le plateau %s, %ld solutions de longueur"
           " au plus %d a été trouvées... mais il y en a en fait %ld.\n", 
           nom_p, nb, max_path_len, reponse);
    exit(EXIT_FAILURE);
  }
  else {
    printf("Pour le plateau %s, %ld solutions de longueur"
           " au plus %d ont été trouvées. C'est valide ! 🙂\n", nom_p, nb, max_path_len);
  }

  return;
}

void print_plateau(plateau p) {
  for (int i = 0; i < p.nb_cases; i++) {
    printf("%d ", p.cases[i]);
  }
  printf("\n");
}

int main(void) {
  plateau mini = plateau_mini();
  char const* nom_mini = "mini (celui à 12 cases)";
  plateau enonce = plateau_enonce();
  char const* nom_enonce = "de l'énoncé (celui à 100 cases)";

  print_plateau(mini);

  // Deux tests de soluble
  printf("\n");
  test_soluble(mini, nom_mini, 2);
  test_soluble(enonce, nom_enonce, 4);
  
  // Deux tests de nb_path
  printf("\n");
  test_nb_path(mini, nom_mini, 3, 26);
  test_nb_path(enonce, nom_enonce, 5, 51);
  

  plateau_free(mini);
  plateau_free(enonce);
  return EXIT_SUCCESS;
}