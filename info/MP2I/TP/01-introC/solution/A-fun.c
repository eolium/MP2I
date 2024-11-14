#include <stdio.h> // Pour printf pour afficher
#include <stdlib.h> // Pour EXIT_SUCCESS
#include <stdbool.h> // pour le type bool


int produit(int a, int b) {
  return a*b;
}

int carre(int x) {
  return x*x;
}

bool plus_grand_que(int a, int b) {
  return a > b ;
}

int ex_def4(int x) {
  x = 3;
  x = 9-4;
  int y = 2*x;
  x = y*y*y;
  return -1;
}

int polynome(int x) {
  int x3=x * x * x;
  int x6 = x3 * x3;
  int x7 = x * x6;
  int num = x7 + 2*x3 - 2*x + 3;
  int denom = x6 + 1;
  return num / denom;
}


/* Fonction principale, celle qui se lance 
   à l'exécution du programme.

   N'hésitez pas à la bidouiller !!
   De manière générale, en informatique,
   n'hésitez jamais à bidouiller. =)

   Nous verrons ce comment fonctionne printf(...)
   plus tard, mais vous pouvez le déduire 
   en lançant le programme. ;)
*/
int main(void) {

  /* Test de produit */
  printf("Test de la fonction produit :\n");
  int x = 3;
  while (x <= 5) {
    int y = 7;
    printf("%d*%d = %d\n", x, y, produit(x,y));
    x = x+1;
  }
  printf("\n");

  /* Test de carre */
  printf("Test de la fonction carre :\n");
  x = 3;
  while (x <= 5) {
    printf("%d²= %d\n", x, carre(x));
    x = x+1;
  }
  printf("\n");

  /* Test de plus_grand_que */
  printf("Test de la fonction plus_grand_que :\n");
  x = 0;
  while (x <= 2) {
    int y = 1;
    if ( plus_grand_que(x, y) ) {
      printf("%d > %d\n", x, y);
    } else {
      printf("%d ≤ %d\n", x, y);
    }
    x = x +1;
  }
  printf("\n");

  /* Test de ex_def4 */
  printf("Test de la fonction ex_def4 :\n");
  x = 3;
  while (x <= 5) {
    printf("%d -> %d\n", x, ex_def4(x));
    x = x+1;
  }
  printf("\n");

  /* Test de polynome */
  printf("Test de la fonction polynome :\n");
  x = -3;
  while (x <= 4) {
    printf("%d -W %d\n", x, polynome(x));
    x = x+1;
  }
  printf("\n");


  /* Fin. On indique au terminal que tout
     s'est bien passé. */
  return EXIT_SUCCESS;
}