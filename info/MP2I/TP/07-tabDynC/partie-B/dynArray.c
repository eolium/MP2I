#include "dynArray.h"
#include <assert.h>

int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

dynArray dyn_create(unsigned len, int x) {
    dynArray d =  {
        .arr = (int*) malloc((len + 1) * sizeof(int)),
        .len = len,
        .len_max = len + 1
    };

    for (unsigned i = 0; i < len; i++) {
        d.arr[i] = x;
    }

    return d;
}

void dyn_free(dynArray* d) {
    free(d->arr);
}

dynArray dynarray_of_array(unsigned len, int const* ptr) {
    dynArray d = dyn_create(len, 0);

    for (unsigned i = 0; i < len; i++) {
        d.arr[i] = ptr[i];
    }

    return d;
}

int dyn_get(dynArray const* d, unsigned i) {
    assert (i < d->len);

    return d->arr[i];
}

unsigned dyn_len(dynArray const* d) {
    return (*d).len;
}

void dyn_print(dynArray const* d) {
    if (d->len == 0) {
        printf("[| |]");
        return;
    }

    printf("[|");

    for (unsigned i = 0; i < (d->len)-1; i++) {
        printf("%d, ", dyn_get(d, i));
    }

    printf("%d|]", dyn_get(d, dyn_len(d)-1));
}

void dyn_set(dynArray* d, unsigned i, int x) {
    d->arr[i] = x;
}

void dyn_append(dynArray* d, int x) {
    if (d->len == d->len_max) {
        // On crée un nouveau tableau de taille len_max*2
        int* new_tab = (int*) malloc(2 * d->len_max * sizeof(int));

        for (unsigned i = 0; i < d->len; i++) {
            new_tab[i] = dyn_get(d, i);
        }

        dyn_free(d);

        d->arr = new_tab;
        d->len_max*=2;
    }

    d->len+=1;
    dyn_set(d, d->len-1, x);
}

int dyn_pop(dynArray* d) {
    assert(dyn_len(d) > 0);

    int out = dyn_get(d, dyn_len(d)-1);

    d->len-=1;

    if (d->len * 4 < d->len_max && d->len_max > 2) {
        d->len_max = 2*d->len;

        int* new_tab = (int*) malloc(d->len_max * sizeof(int));

        for (unsigned i = 0; i < d->len; i++) {
            new_tab[i] = dyn_get(d, i);
        }

        dyn_free(d);
        d->arr = new_tab;
    }

    return out;
}

void dyn_concat(dynArray* a, dynArray* b) {
    for (unsigned i = 0; i < b->len; i++) {
        dyn_append(a, dyn_get(b, i));
    }
}