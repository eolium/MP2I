#include "file.h"

/*
    Initialisateurs
*/


file* file_vide(int len_max) {
    file* f = (file*) malloc(sizeof(file));
    f->arr = (int*) malloc((len_max + 1) * sizeof(int));
    f->len_max = len_max + 1;
    f->sortie = 0;
    f->entree = 0;

    return f;
}

void file_free(file* f) {
    free(f->arr);
    free(f);
}


/*
    Accesseurs
*/

bool file_est_vide(file const* f) {
    return f->entree == f->sortie;
}

int file_premier(file const* f) {
    return f->arr[f->sortie];
}

int file_dernier(file const*f) {
    return f->arr[(f->entree - 1 + f->len_max)%f->len_max];
}

int file_len(file const* f) {
    return (f->entree - f->sortie + f->len_max)%f->len_max;
}

void print_file(file const* f) {

    printf("(%d", f->arr[f->sortie]);

    for (int i = (f->sortie + 1) % f->len_max; i != f->entree; i = (i + 1)%f->len_max) {
        printf(", %d", f->arr[i]);
    }

    printf(")\n");
}

/*
    Transformateurs
*/

void file_enfile(file* f, int x) {
    // On évite les files pleines
    assert ((f->entree+1)%f->len_max != f->sortie);

    f->arr[f->entree] = x;
    f->entree = (f->entree + 1)%f->len_max;
}

int file_defile(file* f) {
    // On évite les files vides
    assert (f->entree != f->sortie);

    int out = f->arr[f->sortie];

    f->sortie = (f->sortie+1)%f->len_max;

    return out;
}