#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

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


bool verifier_afficher_ligne(int* tab, int taille) {
    for (int i = 0; i < taille; i++) {
        if (tab[i] < 0) {
            printf("\n\n(%d, %d) = %d\n", i+1, taille, tab[i]);
            return false;
        }

        printf("%d\t", tab[i]);
    }
    
    // On fait un retour à la ligne si on a afficher des choses
    if (taille > 0) printf("\n");

    return true;
}

void update_ligne(int* tab, int taille) {
    for (int i = taille - 1; i > 0; i--) {
        // On utilise la formule de Pascalou
        tab[i] = tab[i] + tab[i - 1];
    }
}


void affiche_triangle_pascalou(int n) {
    int* tab = (int*) malloc(sizeof(n) * n);

    // On génère la première ligne du tableau
    tab[0] = 1;
    for (int i = 1; i < n; i++) {
        tab[i] = 0;
    }

    // Pour chaque ligne du tableau
    for (int iter = 1; iter < n+1; iter++) {
        // On affiche la ligne
        if (!verifier_afficher_ligne(tab, iter)) {
            free(tab);
            return;
        }

        // On calcule la ligne suivante
        update_ligne(tab, n);
    }

    // On libère la mémoire
    free(tab);
}

int main() {
    // Bah on lance la fonction quoi
    affiche_triangle_pascalou(100);
}