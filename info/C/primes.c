#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main() {
    unsigned long taille = 1000000000;

    unsigned long* p = (unsigned long*) calloc(taille, sizeof(unsigned long));
    unsigned long* c = (unsigned long*) calloc(taille, sizeof(unsigned long));

    p[0] = 2;
    c[0] = 4;
    unsigned long indice = 1;

    unsigned long n = 3;

    while (true) {
        unsigned long i = 0;

        bool isp = true;
        while (i < indice && c[i] <= n) {
            if (n%c[i] == 0) {
                isp = false;
                break;
            }
            i+=1;
        }

        if (isp) {
            p[indice] = n;
            c[indice] = n*n;

            indice+=1;
            if (indice >= taille) {
                break;
            }
        }

        n+=2;
    }

    printf("\n");

    free(p);
    free(c);
}
