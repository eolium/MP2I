#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define uint unsigned long long

int main() {
    uint taille_max;
    scanf("%llu", &taille_max);

    uint* p = (uint*) calloc(taille_max, sizeof(uint));
    uint* c = (uint*) calloc(taille_max, sizeof(uint));
    p[0] = 3;
    c[0] = 9;

    uint taille = 1;

    for (uint n = 5; n < taille_max; n+=2) {
        bool isp = true;
        for (uint i = 0; c[i] <= n; i++) {
            if (n%p[i] == 0) {
                isp = false;
            }
        }

        if (isp) {
            p[taille] = n;
            c[taille] = n*n;
            taille++;

            //printf("%llu\t\t, ", n);

            if (taille % 10000 == 0) {
                printf("%lluK premiers < %lluM\n", taille / 1000, n / 1000000);
            }
        }
    }

    free(p);
    free(c);
}