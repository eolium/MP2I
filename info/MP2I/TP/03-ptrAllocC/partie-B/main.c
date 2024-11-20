#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

/* Deux fonctions que vous pourrez utiliser */

/** Affiche les len entiers pointés par T.
 * /!\ N'affiche pas de retour à la ligne.
 */
void print_zone(int* T, int len) {
  if (len == 0) { // cas particulier à la main
    printf("[||]");
    return;
  } else {        // cas général
    printf("[");
    int indice = 0;
    while (indice < len) {
      printf("| %d ", T[indice]);
      indice = indice +1;
    }
    printf("|]");
    return;
  }
}

/** Demande à l'utilisateur de remplir une zone.
 * Pas utilisé actuellement, mais vous pouvez changer le reste du code
 * pour vous en servir.
 */
void demande_remplir_zone(int* T, int len) {
  printf("Veuillez donner les %d entiers qui composent la zone allouée, "
         "séparés par des espaces ou des retours à la ligne :\n", len);
  int indice = 0;
  while (indice < len) {
    scanf(" %d", &T[indice]);
    indice = indice +1;
  }
  return;
}


/* Le coeur du fichier ! */

int* tuto_alloc(int n) {
  int* ptr_int = (int*) malloc(sizeof(int) * n);

  int i = 0;
  while (i < n) {
    ptr_int[i] = 42;
    i++;
  }

  return ptr_int;
}


int main(void) {
  /* Un test de tuto_alloc */
  printf("Après la question 13, les tableaux-ci dessous doit contenir uniquement des 42 :\n");
  int len = 8;
  int* ptr = tuto_alloc(len);
  if (ptr != NULL) {
    printf("\t");
    print_zone(ptr, len);
    printf("\n");
  } 
  else { printf("\t(rien, la q13 n'est pas encore finie).\n"); }

  free(ptr);

  len = 12;
  ptr = tuto_alloc(len);
  if (ptr != NULL) {
    printf("\t");
    print_zone(ptr, len); 
    printf("\n");
  } 
  else { printf("\t(rien, la q13 n'est pas encore finie).\n"); }

  free(ptr);

  /* Le reste du main est à vous ;) */

  return EXIT_SUCCESS;
}