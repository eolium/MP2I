#include "bigint.h"
#include <assert.h>

bigint bigint_create(unsigned n) {
    int* arr = malloc(4*sizeof(unsigned));
    unsigned len = 1;
    unsigned len_max = 4;

    arr[0] = n;

    bigint big = {
        .arr = arr,
        .len = len,
        .len_max = len_max
    };

    return big;
}

void bigint_free(bigint big) {
    free(big.arr);
}

void bigint_print(bigint big) {
    
}