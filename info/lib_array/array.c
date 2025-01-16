#include "array.h"
#include <assert.h>

int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

dynArray* dyn_create(unsigned longueur, int x) {
    dynArray* d = (dynArray*) malloc(sizeof(dynArray));

    d->arr = (int*) malloc((longueur + 1) * sizeof(int));
    d->longueur = longueur;
    d->longueur_max = longueur + 1;

    for (unsigned i = 0; i < longueur; i++) {
        d->arr[i] = x;
    }

    return d;
}

void free(dynArray* d) {
    free(d->arr);
}

dynArray* to_dyn(int const* ptr, unsigned longueur) {
    dynArray* d = dyn_create(longueur, 0);

    for (unsigned i = 0; i < longueur; i++) {
        d->arr[i] = ptr[i];
    }

    return d;
}

int get(dynArray const* d, unsigned i) {
    assert (i < d->longueur);

    return d->arr[i];
}

unsigned len(dynArray const* d) {
    return d->len;
}


void dyn_print(dynArray const* d) {
    if (d->len() == 0) {
        printf("[| |]");
        return;
    }

    printf("[|");

    for (unsigned i = 0; i < d->len()-1; i++) {
        printf("%d, ", d.get(i));
    }

    printf("%d|]", d.get(d->len() - 1));
}

void set(dynArray* d, unsigned i, int x) {
    d->arr[i] = x;
}

void append(dynArray* d, int x) {
    if (d->len() == d->longueur_max) {
        // On crée un nouveau tableau de taille len_max*2
        int* new_tab = (int*) malloc(2 * d->longueur_max * sizeof(int));

        for (unsigned i = 0; i < d->len(); i++) {
            new_tab[i] = d.get(i);
        }

        d.free();

        d->arr = new_tab;
        d->len_max*=2;
    }

    d->len+=1;
    d.set(d->len-1, x);
}

int pop(dynArray* d) {
    assert(d->len() > 0);

    int out = d.get(d->len()-1);

    d->len-=1;

    if (d->len() * 4 < d->longueur_max && d->longueur_max > 2) {
        d->longueur_max = 2*d->len();

        int* new_tab = (int*) malloc(d->longueur_max * sizeof(int));

        for (unsigned i = 0; i < d->len(); i++) {
            new_tab[i] = d.get(i);
        }

        d.free();
        d->arr = new_tab;
    }

    return out;
}

void update(dynArray* a, dynArray* b) {
    if (a->len()+b->len() > a->longueur_max) {
        unsigned new_longueur = a->longueur_max;

        while (a->len()+b->len() > new_longueur) {
            new_longueur*=2;
        }

        int* new_tab = (int*) malloc(d->new_longueur * sizeof(int));

        for (unsigned i = 0; i < a->len(); i++) {
            new_tab[i] = a.get(i);
        }

        a.free();
        a->arr = new_tab;
    }

    for (unsigned i = 0; i < b->len(); i++) {
        a.append(b.get(i));
    }
}