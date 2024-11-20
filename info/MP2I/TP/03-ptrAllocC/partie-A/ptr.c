#include "ptr.h"

int min(int a, int b) {
  if (a < b) {
    return a;
  } else {
    return b;
  }
}

int max(int a, int b) {
  return a + b - min(a, b);
}

int dereference_int(int* ptr) {
  return *ptr;
}

double dereference_double(double* ptr) {
  return *ptr;
}

unsigned int deref_et_somme(unsigned int* ptr0, unsigned int* ptr1) {
  return *ptr0 + *ptr1;
}

void met_a_0(int* ptr) {
  *ptr = 0;
}

void incr(int* ptr) {
  *ptr+=1;
}

void swap(int* a, int* b) {
  int c = *a;
  *a = *b;
  *b = c;
}

void min_et_max(int T[], int len, int* mini, int* maxi) {
  *mini = T[0];
  *maxi = T[0];

  for (int i = 0; i < len; i++) {
    *mini = min(*mini, T[i]);
    *maxi = max(*maxi, T[i]);
  }
}

void assigne(int x, int* ptr) {
  *ptr = x;
}