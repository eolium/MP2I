#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_ieee_utils.h>
#include "lib_calcul.h"

expression* parser(char* entree);

vect eval(expression expr, vect_array* parametres);

void free_expression(expression* expr)