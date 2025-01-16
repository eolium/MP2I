
#include "file.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>


void test(void) {

  file* f = file_vide(10);
  assert(file_est_vide(f));

  file_enfile(f, 42);

  print_file(f);

  assert(!file_est_vide(f));
  assert(file_len(f) == 1);
  assert(file_premier(f) == 42);
  print_file(f);

  file_enfile(f, 66);
  assert(!file_est_vide(f));
  assert(file_len(f) == 2);
  assert(file_premier(f) == 42);
  print_file(f);

  file_enfile(f, 21);
  assert(!file_est_vide(f));
  assert(file_len(f) == 3);
  assert(file_premier(f) == 42);
  print_file(f);

  assert(file_defile(f) == 42);
  assert(!file_est_vide(f));
  assert(file_len(f) == 2);
  assert(file_premier(f) == 66);
  print_file(f);

  file_free(f);
  
  printf("Tous les tests ont été passés avec succès.\n");
  return;
}

int main() {
  test();
}