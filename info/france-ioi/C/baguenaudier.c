#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>

void print_arr(int* plateau, int N, int taille) {
    printf("%d", plateau[0]);

    for (int i = 1; i < taille; i++) {
        printf("\t%d", plateau[i]);
    }

    printf("\t\t%d\n", N);
}

void sw(int* plateau, int i, int taille, int etat) {
    if (plateau[i] != etat) {
        plateau[i] = etat;

        print_arr(plateau, i+1, taille);
    }
}

void baguenaudier(int* plateau, int N, int taille, int etat) {
    if (N <= 0) { return; }

    if (N == 1) {
        sw(plateau, 0, taille, etat);
    }

    if (N == 2) {
        if (plateau[1] != etat) {
            sw(plateau, 0, taille, 1);

            sw(plateau, 1, taille, etat);
        }

        sw(plateau, 0, taille, etat);
    }

    if (N >= 3) {
        baguenaudier(plateau, N-1, taille, 1);

        baguenaudier(plateau, N-2, taille, 0);

        sw(plateau, N-1, taille, etat);

        baguenaudier(plateau, N-1, taille, etat);
    }
}


int main() {
    // On récupère les entrées et on génère le plateau de départ
    int N = 4;
    //scanf(" %d", &N);

    int* plateau = (int*) malloc(N * sizeof(int));

    for (int i = 0; i < N; i++) {
        plateau[i] = 1;
    }

    //print_arr(plateau, N, N);

    baguenaudier(plateau, N, N, 0);

    free(plateau);
}