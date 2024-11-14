#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>


/* Introduction */

/** Renvoie x^n. */
double exp_naif(double x, unsigned n) {
  if (n > 0) {
    return x * exp_naif(x, n-1);
  } else { // n == 0
    return 1;
  }
}



/* Exemples plus avancés */

/** Renvoie x^n. */
double exp_rap(double x, unsigned n) {
  if (n > 0) {
    int x_p = exp_rap(x, n/2); // x puissance p avec p = n/2
    if (n % 2 == 0) { return x_p * x_p; } 
    else { return x * x_p * x_p; }
  } 
  else {
    return 1;
  }
}


/** Somme des entiers jusqu'à n inclus. */
int somme_entiers(int n) {
  int i = 0;
  int somme = 0;
  while (i <= n) {
    somme = somme + i;
    i = i +1;
  }
  return i;
}


int boucle(int somme, int i, int n) {
	if (i <= n) {
		return boucle(somme+i, i+1, n);
	} else {
		return somme;
	}
}

int somme_rec(int n) {
	return boucle(0, 0, n);
}




/* main */

int main(void) {
  
  double x = 2.0;
  unsigned n = 4;
  printf("%lf^%u = %lf\n", x, n, exp_naif(x, n));

  return EXIT_SUCCESS;
}
