#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

/*

On souhaite afficher une chaine, mais pour chaque caractère, si c'est un chiffre,
s'il est inférieur au dernier chiffre lu avant, on ne l'affiche pas.

On enregistre donc le dernier nombre lu, en commençant à -1 car -1 est inférieur à tous les chiffres,
et pour chaque caractère :
    - si last_chiffre est -1, on l'affiche
    - si ce n'est pas un chiffre, on l'affiche
    - si last_chiffre < caractère, on l'affiche

    sinon on continue


En C, les caractères sont des entiers, donc pour transformer msg[i] en entier, on fait msg[i]-48,
car 48 correspond au 0 dans la table ASCII (src: internet).
*/

int main() {
    // On demande la taille
    int taille;
    scanf(" %d", &taille);

    // On demande le message
    char msg[420] = {0};
    scanf("%s", msg);

    int last_digit = -1;

    // On parcourt le message
    for (int i = 0; i < taille; i++) {
        if (last_digit == -1 || !isdigit(msg[i]) || last_digit <= msg[i]-48) {
            printf("%c", msg[i]);
        }

        if (isdigit(msg[i])) {
            last_digit = msg[i]-48;
        }
    }
}