#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int comp(const void *a, const void *b) {
    int e1 = *(int*)a;
    int e2 = *(int*)b;

    if (e1 > e2) {
        return 1;
    } else {
        return -1;
    }
}

int main() {
    srand(time(NULL));

    int taille = 10000000;

    int* tab = (int*) malloc(4 * taille);

    for (int i = 0; i < taille; i++) {
        tab[i] = rand();
    }

    qsort(tab, taille, 4, comp);

    for (int i = 0; i < taille; i++) {
        printf("%d ", tab[i]);
    }
    printf("\n");

    free(tab);
}
