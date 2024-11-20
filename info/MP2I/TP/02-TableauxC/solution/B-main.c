#include <stdlib.h>   // pour EXIT_SUCCESS
#include <stdio.h>    // pour printf
#include <stdbool.h>  // pour bool
#include "B-tableaux.h" // appelle le code de tableaux.c


/* Output et Input */

/** Affiche len cases de T.
 * /!\ N'affiche pas de retour à la ligne.
 */
void print_tableau(int T[], int len) {
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

/** Demande à l'utilisateur de remplir un tableau.
 * Pas utilisé actuellement, mais vous pouvez changer le reste du code
 * pour vous en servir.
 */
void demande_remplir_tableau(int T[], int len) {
  printf("Veuillez donner les %d entiers qui composent le tableau, "
         "séparés par des espaces ou des retours à la ligne :\n", len);
  int indice = 0;
  while (indice < len) {
    scanf(" %d", &T[indice]);
    indice = indice +1;
  }
  return;
}



/* Tests de tableaux.c */

/** Affiche un test de premiere_case sur un tableau donné */
void test_premiere_case(int T_test[], int len_test) {
  printf("\tLa première case de ");
  print_tableau(T_test, len_test);
  printf(" est : %d .\n", premiere_case(T_test));
  return;
}

void test_somme_tableau(int T_test[], int len_test) {
  printf("\tLa somme des %d premièes cases de ", len_test);
  print_tableau(T_test, len_test);
  printf(" est : %d .\n", somme_tableau(T_test, len_test));
  return;
}

void test_mystere(int T_test[], int len_test) {
  printf("\tMystère( T=");
  print_tableau(T_test, len_test);
  printf(", len=%d )  -->  %d\n", len_test, mystere(T_test, len_test));
  return;
}

void test_est_present(int x, int T_test[], int len_test) {
  if (est_present(x, T_test, len_test)) {
    printf("\tOui, %d est présent dans ", x);
    print_tableau(T_test, len_test);
    printf(".\n");
  } else {
    printf("\tNon, %d n'est pas présent dans ", x);
    print_tableau(T_test, len_test);
    printf(".\n");
  }
  return;
}

void test_foo(void) {
  if (foo()) {
    printf("\tVous avez créé le bon tableau dans foo. Bien joué !\n");
  } else {
    printf("\tVous n'avez pas encore créé le bon tableau dans foo.\n");
  }
  return;
}

void test_double_tableau(int T_test[], int len_test) {
  printf("\tdouble_tableau( ");
  print_tableau(T_test, len_test);
  printf(" )  -->  ");
  double_tableau(T_test, len_test);
  print_tableau(T_test, len_test);
  printf(".\n");
  return;
}

void test_copie(int T_test[], int len_test) {
  if (len_test > 10) {
    printf("\ttest_copie est prévue pour des tableaux de 10 cases ou moins.\n");
    exit(EXIT_FAILURE);
  }
  int dst[10] = {}; // initialisé à 0
  printf("\tcopie( ");
  print_tableau(T_test, len_test);
  printf(" )  -->  ");
  copie(dst, T_test, len_test);
  print_tableau(dst, len_test);
  printf(".\n");
  return;
}

void test_map2_min(int T_test[], int U_test[], int len_test) {
  if (len_test > 10) {
    printf("test_map2_min est prévue pour des tableaux de 10 cases ou moins.\n");
    exit(EXIT_FAILURE);
  }
  int dst[10] = {}; // initialisé à 0
  printf("\tmap2_min( ");
  print_tableau(T_test, len_test);
  printf(",\n\t          ");
  print_tableau(U_test, len_test);
  printf(" )\n\t     -->  ");
  map2_min(dst, T_test, U_test, len_test);
  print_tableau(dst, len_test);
  printf(".\n");
  return;
}



/* main */

/** Fonction principale, la seule qui est lancée à l'exécution.
    Lance tout plein de tests.
 */
int main(void) {

  /* 4 tableaux de tests */
  int T0[] = {0, 5, 2};              // len0 = 3
  int T1[] = {3};                    // len1 = 1
  int T2[] = {42, 666, -300, 0, 55}; // len2 = 5
  int T3[] = {0, -5, 2, -10, 4, 0};  // len3 = 6

  /* Tests de premiere_case */
  printf("Tests de premiere_case :\n");
  test_premiere_case(T0, 3);
  test_premiere_case(T1, 1);
  test_premiere_case(T2, 5);
  printf("------------------------\n\n");

  /* Tests de somme_tableau */
  printf("Tests de somme_tableau :\n");
  test_somme_tableau(T0, 3);
  test_somme_tableau(T1, 1);
  test_somme_tableau(T2, 5);
  test_somme_tableau(T3, 6);
  test_somme_tableau(T3, 3);
  test_somme_tableau(T3, 1);
  test_somme_tableau(T3, 0);
  printf("------------------------\n\n");

  /* tests de mystere */
  printf("Tests de mystere :\n");
  test_mystere(T0, 3);
  test_mystere(T1, 1);
  test_mystere(T2, 5);
  test_mystere(T3, 6);
  test_mystere(T3, 4);
  test_mystere(T3, 2);
  printf("------------------------\n\n");

  /* Tests de est_present */
  printf("Tests de est_present :\n");
  test_est_present(0, T0, 3);
  test_est_present(1, T0, 3);
  test_est_present(2, T0, 3);
  test_est_present(0, T3, 6);
  test_est_present(10, T3, 6);
  test_est_present(-10, T3, 6);
  printf("------------------------\n\n");

  /* Tests de foo */
  printf("Tests de foo :\n");
  test_foo();
  printf("------------------------\n\n");

  /* Tests de double_tableau */
  printf("Tests de double_tableau :\n");
  int tmp0[] = {0, 5, 2};  
  int tmp2[] = {42, 666, -300, 0, 55};
  test_double_tableau(tmp0, 3);
  test_double_tableau(tmp2, 5);
  printf("------------------------\n\n");

  /* Tests de double_tableau */
  printf("Tests de double_tableau :\n");
  test_copie(tmp0, 3);
  test_copie(tmp2, 5);
  printf("------------------------\n\n");

  /* Tests de map2_min */
  printf("Tests de map2_min :\n");
  test_map2_min(T2, T3, 5);
  printf("------------------------\n\n");

  /* Fin. On indique que tout s'est bien passé. */
  return EXIT_SUCCESS;
}