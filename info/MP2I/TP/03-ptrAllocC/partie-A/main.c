#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "ptr.h"


/* Des tests */


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


void test_dereference_int(int val) {
  int* ptr = &val;
  printf("\tOn range %d à l'adresse %p. dereference_int trouve %d à cette adresse.\n", val, ptr, dereference_int(ptr));
  return;
}

void test_dereference_double(double val) {
  double* ptr = &val;
  printf("\tOn range %lf à l'adresse %p. dereference_double trouve %lf à cette adresse.\n", val, ptr, dereference_double(ptr));
  return;
}

void test_deref_et_somme(unsigned val0, unsigned val1) {
  unsigned* ptr0 = &val0;
  unsigned* ptr1 = &val1;
  printf("\tOn range %u à l'adresse %p ; et %u à l'adresse %p. deref_et_somme somme ces deux valeurs et obtient %u.\n", val0, ptr0, val1, ptr1, deref_et_somme(ptr0, ptr1));
  return;
}

void test_met_a_0(int val) {
  int* ptr = &val;
  printf("\tOn range %d à l'adresse %p.", val, ptr); 
  met_a_0(ptr);
  printf(" Après l'appel à remet_a_0, on trouve %d à cette adresse.\n", *ptr);
  return;
}

void test_incr(int val) {
  int* ptr = &val;
  printf("\tOn range %d à l'adresse %p.", val, ptr); 
  incr(ptr);
  printf(" Après l'appel à incr, on trouve %d à cette adresse.\n", *ptr);
  return;
}

void test_swap(int val0, int val1) {
  int* ptr0 = &val0;
  int* ptr1 = &val1;
  printf("\tOn range %d à l'adresse %p ; et %d à l'adresse %p.", val0, ptr0, val1, ptr1);
  swap(ptr0, ptr1);
  printf(" Aprèsl'appel à swap, on trouve %d à l'adresse %p ; et %d à l'adresse %p.\n", *ptr0, ptr0, *ptr1, ptr1);
  return;
}

void test_min_et_max(int T[], int len) {
  int mini = 0;
  int maxi = 0;
  min_et_max(T, len, &mini, &maxi);
  printf("\tLe minimum et le maximum de ");
  print_zone((int*) T, len);
  printf(" sont %d et %d.\n", mini, maxi);
}


int main(void) {

  /* Tests de dereference_int */
  printf("Tests de dereference_int : \n");
  test_dereference_int(0);
  test_dereference_int(-5);
  test_dereference_int(15);
  printf("------------------------\n\n");

  /* Tests de dereference_double */
  printf("Tests de dereference_double : \n");
  test_dereference_double(0.125);
  test_dereference_double(-2.71);
  test_dereference_double(3.14);
  printf("------------------------\n\n");

  /* Tests de deref_et_somme */
  printf("Tests de deref_et_somme : \n");
  test_deref_et_somme(0,0);
  test_deref_et_somme(3, 7);
  test_deref_et_somme(53, 22);
  printf("------------------------\n\n");

  /* Tests de met_a_0. */
  printf("Tests de met_a_0 : \n");
  test_met_a_0(0);
  test_met_a_0(3);
  test_met_a_0(-56);
  printf("------------------------\n\n");

  /* Tests de incr */
  printf("Tests de incr : \n");
  test_incr(0);
  test_incr(2);
  test_incr(-4);
  printf("------------------------\n\n");

  /* Tests de swap */
  printf("Tests de swap : \n");
  test_swap(0, 1);
  test_swap(-15, 42);
  test_swap(20, -40);
  printf("------------------------\n\n");


  /* Tests de min_et_max */
  printf("Tests de min_et_max : \n");
  int T0[] = {8, 0, 5, 42, 6}; // len = 5
  int T1[] = {-20, -35, -2, -55, 1, -12}; // len = 6
  test_min_et_max(T0, 5);
  test_min_et_max(T1, 6);
  test_min_et_max(T1, 3);
  printf("------------------------\n\n");

  return EXIT_SUCCESS;
}