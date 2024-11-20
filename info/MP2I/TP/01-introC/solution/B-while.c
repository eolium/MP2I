#include <stdio.h> // Pour printf pour afficher
#include <stdlib.h> // Pour EXIT_SUCCESS
#include <stdbool.h> // pour le type bool


/* Exo 1.a du premeir TD */
int td1a(int i) {
  if (i > 42) { 
    // pour éviter une boucle infinie.
    return -666; 
  }
  int c = 0;
  while (i != 42) {
    i = i+1;
    c = c+1;
  }
  return c;
}


/* Une fonction à tester. */
int sup_log2(int x) {
  int n = 0;
  int p = 1;
  while (p < x) {
    p = 2*p;
    n = n +1;
  }
  return n;
}


/* Teste si n n'admet que 2 diviseurs : 1 et lui-même.
   Pour cela, vérifie que n n'est pas divisible par les
   entiers de 2 à n-1 inclus.
 */
bool is_prime(int n) {
  if (n <= 1) { return false; }
  int d = 2;
  while (d < n) {
    if (n % d == 0) { return false; }
    if (d*d > n) { break; }
    d = d +1;
  }
  return true;
}


/* Fonction principale, seule lancée à l'exécution */
int main(void) {

  /* test td1a */
  int i = 39;
  while (i < 45) {
    int difference = td1a(i);
    printf("42-%d = %d\n",i, difference);
    i = i+1;
  }
  printf("\n");

  /* Meilleurs tests de sup_log2 */
  int x = 1;
  while (x < 20) {
    printf("sup_log2(%d) = %d\n", x, sup_log2(x));
    x = x +1;
  }
  printf("\n");

  /* tests de is_prime. */
  int n = 0;
  while (n < 20) {
    if (is_prime(n)) {
      printf("%d : premier\n", n);
    } else {
      printf("%d : non-premier\n", n);
    }
    n = n +1;
  }


  return EXIT_SUCCESS;
}