#include <stdio.h>
#include <stdlib.h>


int main() {
    int nb_requetes;
    scanf(" %d", &nb_requetes);

    int* tab = (int*) calloc(nb_requetes, sizeof(int));

    int epaisseur = 0;

    for (int i = 0; i < nb_requetes; i++) {
        char req;
        scanf(" %c", &req);

        if (req == 'Q') {
            printf("%d\n", epaisseur);
        } else {
            int n;
            scanf(" %d", &n);

            while (epaisseur > 0 && n >= tab[epaisseur-1]) {
                epaisseur-=1;
            }

            tab[epaisseur] = n;
            epaisseur+=1;
        }
    }

    free(tab);
}