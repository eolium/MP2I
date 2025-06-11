#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_ieee_utils.h>
#include <ctype.h>

typedef struct {
  float* arr;
  int dim;
  int len_max;
} vect;

typedef struct {
  vect* arr;
  int len;
} vect_array;

typedef struct {
  operator op;
  vect* gauche;
  vect* droite;
} expression;


typedef void(*operator)(expression*, vect_array, int);