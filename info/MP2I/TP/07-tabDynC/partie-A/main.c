#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


/* TODO : déclarer ici un type struct mp2i_s */

struct mp2i_s {
  int physique;
  int informatique;
  int sciences_industrielles;
};

/* TODO : déclarer ici un raccourci pour struct mp2_s, nommé mp2i */
typedef struct mp2i_s mp2i;

int main(void) {

  mp2i toto;
  // TODO : modifier les 3 champs de toto 
  toto.physique = 4;
  toto.informatique = 3;
  toto.sciences_industrielles = 10;

  printf("Moyenne physique de Toto : %d\n", toto.physique);
  printf("Moyenne info de Toto : %d\n", toto.informatique);
  printf("Moyenne SI de Toto : %d\n", toto.sciences_industrielles);

  return EXIT_SUCCESS;
}