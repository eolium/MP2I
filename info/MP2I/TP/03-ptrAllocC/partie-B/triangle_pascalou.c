#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int fact(int n) {
    if (n <= 1) { return 1; }
    return n * fact(n - 1);
}

int cb(int i, int n) {
    if (i < 0) {
        return 0;
    }
    if (i > n) {
        return 0;
    }

    return fact(n) / (fact(i) * fact(n - i));
}

void affiche_triangle_pascalou(int n) {
    // On alloue une zone pour le triangle
    int* tab = (int*) malloc(sizeof(int) * n);

    // On crée la première ligne du triangle
    tab[0] = 1;

    // que l'on remplie de 0 sauf au début
    for (int i = 1; i < n; i++) {
        tab[i] = 0;
    }

    // Pour chaque ligne du triangle
    for (int iter = 0; iter < n; iter++) {
        // Pour chaque coefficient (i parmi iter) de la ligne
        for (int i = 0; i < n; i++){
            // On affiche le coeff
            printf("(%d,%d) = %d\n", iter, n, tab[i]);

            // On vérifie les potentiels overflow
            if (tab[i] < 0) {
                printf("%d\t", tab[i]);
            }
        }
        printf("\n\n");

        // On met à jour les lignes
        /*for (int i = n - 1; i > 0; i--) {
            tab[i] = tab[i] + tab[i - 1];
        }*/
    }

    free(tab);
}


int main() {
    affiche_triangle_pascalou(35);

    return 0;
}