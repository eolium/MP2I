
#include "dynArray.h"

/** Des tests pour la librairie dynArray.h 
  * Si vous n'avez pas encore codé pop, 
  * vous pouvez commmenter les lignes correspondantes.
  *
  * N'hésitez pas à rajouter des tests ! */
void testeur_append_et_pop(void) {

  // Premier test : partir du tableau vide, et y ajouter 1 2 3 4 5 (il n'y a donc pas 0 )
  dynArray d = dyn_create(0, 0);
  dyn_append(&d,1);
  dyn_append(&d,2);
  dyn_append(&d,3);
  dyn_append(&d,4);
  dyn_append(&d,5);
  printf("Le tableau ci-dessous devrait contenir exactement 1 2 3 4 5 :\n\t");
  dyn_print(&d);
  printf("\n");
  printf("\tSelon dyn_len, sa longueur est %d\n", dyn_len(&d));
  printf("\n");

  // On ajoute 6 7 8 9
  dyn_append(&d, 6);
  dyn_append(&d, 7);
  dyn_append(&d, 8);
  dyn_append(&d, 9);
  printf("Après ajout de 6 7 8 9, ceb tableau contient :\n\t");
  dyn_print(&d);
  printf("\n");
  printf("\tSelon dyn_len, sa longueur est %d\n", dyn_len(&d));

  // On retire 9 8 7 6 5
  printf("\n");
  int neuf = dyn_pop(&d);
  int huit = dyn_pop(&d);
  int sept = dyn_pop(&d);
  int six = dyn_pop(&d);
  int cinq = dyn_pop(&d);
  printf("Cinq appels à dyn_pop retirent %d %d %d %d %d, et on obtient le tableau :\n\t", 
          neuf, huit, sept, six, cinq);
  dyn_print(&d);
  printf("\n");

  // On retire 4 3 2
  printf("\n");
  int quatre = dyn_pop(&d);
  int trois = dyn_pop(&d);
  int deux = dyn_pop(&d);
  printf("Trois appels supplémentaire à dyn_pop renvoient %d %d %d, et on obtient le tableau :\n\t",
          quatre, trois, deux);
  dyn_print(&d);
  printf("\n");

  // On retire le 1 : il ne reste rien
  int un = dyn_pop(&d);
  printf("Un dernier appel à dyn_pop renvoie %d, et on obtient le tableau :\n\t", un);
  dyn_print(&d);
  printf("\n");

  // On vérifie qu'on peut bien rajouter des éléments à nouveau
  printf("\n");
  int deux_puissance_p = 1;
  for (int p = 0; p < 30; p = p+1) {
    dyn_append(&d, deux_puissance_p);
    deux_puissance_p = 2*deux_puissance_p;
  }
  printf("On ajoute 1, 2, 4, ..., 2**30 :\n\t");
  dyn_print(&d);
  printf("\n");


  dyn_free(&d);
  return;
}


int main(void) {

  // Mettez plus de tests si vous voulez !
  
  testeur_append_et_pop();
  
  return EXIT_SUCCESS;
}