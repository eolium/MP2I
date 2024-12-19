#include "list.h"

// N'hésitez pas à rajouter vos propres tests !

int main() {

  // tests de create et de cons
  cellule* p = list_create(42);
  list_print(p);
  p = list_cons(5, p);
  list_print(p);
  p = list_cons(8, p);
  list_print(p);
  p = list_cons(15, p);
  list_print(p);

  // tests de tl et hd et size
  printf("La queue de la liste est maintenant :\n");
  list_print(list_tl(p));
  printf("Sa tête est : %d\n", list_hd(p));
  printf("Sa taille est : %u\n", list_length(p));

  // test de list_mem
  printf("\n5 est-il dans la list p ? : %d\n", list_mem(5, p));
  printf("4 est-il dans la list p ? : %d\n", list_mem(4,p));

  // test de list_free
  list_free(p);

  return EXIT_SUCCESS;
}
