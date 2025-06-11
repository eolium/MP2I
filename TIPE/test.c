#include "lib/lib_expression.h"

void success(int nombre) {
  char* red = "\x1b[31m";
  char* green = "\x1b[32m";
  char* yellow = "\x1b[33m";
  char* blue = "\x1b[34m";
  char* magenta = "\x1b[35m";
  char* cyan = "\x1b[36m";
  char* reset = "\x1b[0m";

  printf("%s- Test %d : success%s\n", green, nombre, reset);
}

void echec(int nombre) {
  char* red = "\x1b[31m";
  char* green = "\x1b[32m";
  char* yellow = "\x1b[33m";
  char* blue = "\x1b[34m";
  char* magenta = "\x1b[35m";
  char* cyan = "\x1b[36m";
  char* reset = "\x1b[0m";

  printf("%s- Test %d : échec%s\n", red, nombre, reset);

  exit(-1);
}

int main () {
  char entree[] = "1 2 sin";
  expression* expr = parser(entree);

  free_expression(expr);
}