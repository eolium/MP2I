#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

struct dynArray_s {
  int* arr;         // pointeur vers la zone contenant les cases
  unsigned longueur;     // nombre de cases utilisées de arr
  unsigned longueur_max; // nombre de cases de arr
};
typedef struct dynArray_s dynArray;

dynArray dyn_create(unsigned longueur, int x);

// d->free
void free(dynArray* d);

// ptr->to_dyn
dynArray to_dyn(int const* ptr, unsigned longueur);

// d->get
int get(dynArray const* d, unsigned i);

// d->len
unsigned len(dynArray const* d);

// d->print
void print(dynArray const* d);

// d->set
void set(dynArray* d, unsigned i, int x);

// d->append
void append(dynArray* d, int x);

// d->pop
int pop(dynArray* d);

// a->update
void update(dynArray* a, dynArray* b);