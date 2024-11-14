#include <stdio.h>
#include <stdlib.h>

// On travaille sur des grands nombres...
#define uint long unsigned

void print_r(uint* tab, uint taille) {
    printf("[");
    for (uint i = 0; i < taille-1; i++) {
        printf("%lu, ", tab[i]);
    }
    printf("%lu]\n", tab[taille-1]);
}

/*

Entrée : Un tableau {boites} de taille N, d'entrées %valeur

But : Déterminer le nombre de sous-tableaux dont la somme = 0 [valeur]

1 - Pour éviter de calculer la somme de chaque tableaux en boucle, on pose :
Sum(i -> j) = Sum(0 -> j) - Sum(0 -> i-1)

On calcule donc un tableau qui contient la somme Sum(0->i), et on a : Sum(i->j) = Sum(j) - Sum(i-1)

On pose ensuite :
Sum(j)-Sum(i-1) = 0 [valeur]
Sum(j) = Sum(i) [valeur]

Ainsi, on cherche le nombre de pairs de même modulo que l'on peut faire.
Pour cela, on fait un dictionnaire des nombres d'occurences de chaque modulo,
le total est la somme des n(n-1)/2 pour chaque nombre d'occurences (nombre de pairs possibles)

Donc, en résumé :

1 - On calcule un tableau qui contient Sum(0->i)(boites[i]) pour chaque i, modulo valeur.

2 - Dans une autre liste, on enregistre le nombre d'occurences de chaque modulo.

3 - On retourne la somme de chaque nombre d'occurences avec n(n-1)/2

La complexité est alors de O(3n)=O(n) Yay

*/

int main() {
    // 1 - On récupère les entrées, en utilisant des uint, pour accepter des grandes entrées
    uint N;
    scanf(" %lu", &N);

    uint valeur;
    scanf(" %lu", &valeur);

    uint* boites = (uint*) calloc(N, sizeof(uint));
    for (uint i = 0; i < N; i++) {
        scanf("%lu", &boites[i]);
    }

    uint* nb_occurences = (uint*) calloc(valeur, sizeof(uint));

    // 2 - Pour éviter de créer un tableau somme, on ne calcule que la somme, que l'on sauvegarde,
    // et que l'on enregistre dans nb_occurences

    uint s = 0;

    for (uint i = 0; i < N; i++) {
        boites[i] = s + boites[i];
    }

    print_r(boites, N);
    print_r(nb_occurences, valeur);

    free(boites);
    free(nb_occurences);

    return 0;

    // 3 - On calcule ensuite le total
    uint out = 0;
    for (uint i = 0; i < valeur; i++) {
        out += ((nb_occurences[i]+1) * (nb_occurences[i]) / 2 + 1) % 1000000007;
    }

    printf("%lu\n", out);

    free(boites);
    free(nb_occurences);
}