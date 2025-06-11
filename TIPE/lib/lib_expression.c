#include "lib_expression.h"

int find_all_pattern(char* entree, char pattern) {
  int out = 1;
  int i = 0;
  while (true) {
    if (entree[i] == pattern) {
      out++;
    }
    if (entree[i] == '\0') {
      return out;
    }
    i++;
  }
}

bool is_float(char* entree) {
  int i = 0;
  while (true) {
    if (entree[i] != '.' && !isdigit(entree[i])) {
      return false;
    }
    if (entree[i] == '\0') {
      return true;
    }
    i++;
  }
}

char** chaine_to_tab(char* entree) {
  int l = find_all_pattern(entree, ' ');
  char** tab = (char**) malloc(l * sizeof(char*));

  char* token = strtok(entree, " ");
  int i = 0;

  while (token) {
    tab[i] = token;
    token = strtok(entree, " ");
    i++;
  }

  return tab;
}