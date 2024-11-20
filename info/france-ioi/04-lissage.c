#include <stdio.h>
#include <stdlib.h>

double max(double a, double b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

double absolute(double a) {
    if (a > 0) {
        return a;
    } else {
        return -a;
    }
}

double lissage(double tab[], double tempo[], int taille) {
    tempo[0] = tab[0];
    tempo[taille - 1] = tab[taille - 1];

    for (int i = 1; i < taille - 1; i++) {
        tempo[i] = (tab[i - 1] + tab[i + 1]) / 2;
    }

    double diffMax = absolute(tab[0] - tab[1]);

    for (int i = 1; i < taille; i++) {
        tab[i] = tempo[i];

        diffMax = max(diffMax, absolute(tab[i] - tab[i-1]));
    }

    return diffMax;
}

int main() {
    int nbMesures;
    scanf(" %d", &nbMesures);

    double diffMax;
    scanf(" %lf", &diffMax);

    double mesures[100] = {0};
    double tempo[100] = {0};

    for (int i = 0; i < nbMesures; i++) {
        scanf(" %lf", &mesures[i]);
    }

    int nb_lissages = 1;

    while (lissage(mesures, tempo, nbMesures) >= diffMax) {
        nb_lissages++;
    }

    printf("%d\n", nb_lissages);
}