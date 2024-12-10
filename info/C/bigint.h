#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

struct bigint_s {
    int* arr;
    unsigned len;
    unsigned len_max;
};
typedef struct bigint_s bigint;

/* Constructeurs */

bigint bigint_create(unsigned n);

void bigint_free(bigint big);

void bigint_print(bigint big);