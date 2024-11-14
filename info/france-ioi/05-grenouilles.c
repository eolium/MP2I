#include <stdio.h>
#include <stdlib.h>

int main() {
    int nbGrenouilles;
    scanf(" %d", &nbGrenouilles);

    int nbTours;
    scanf(" %d", &nbTours);

    int tab[100][2] = {0};

    int last_grenouille = 0;

    // Pour chaque tour
    for (int i = 0; i < nbTours; i++) {
        // On commence le tour
        int grenouille, saut;
        scanf(" %d %d", &grenouille, &saut);

        grenouille--;

        if (i == nbTours - 1) {
            continue;
        }

        // On fait sauter la grenouille
        tab[grenouille][0] += saut;

        // On vérifie quelle grenouille est devant
        if (tab[grenouille][0] > tab[last_grenouille][0]) {
            tab[grenouille][1] += 1;
            last_grenouille = grenouille;
        } else if (tab[grenouille][0] < tab[last_grenouille][0]) {
            tab[last_grenouille][1] += 1;
        }

        // On affiche l'avancement
        /*for (int i = 0; i < nbGrenouilles; i++) {
            printf("%d,%d\t", tab[i][0], tab[i][1]);
        }
        printf("\n");*/
    }

    int gagnant = 0;
    for (int i = 1; i < nbGrenouilles; i++) {
        if (tab[i][1] > tab[gagnant][1]) {
            gagnant = i;
        }
    }

    printf("%d\n", gagnant + 1);
}