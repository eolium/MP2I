#include <stdio.h>
#include <stdlib.h>

int* base10(int n, int* nb_chiffres) {
    *nb_chiffres = 0;
    int n2 = 1;

    while (n / n2 > 0) {
        *nb_chiffres = *nb_chiffres + 1;
        n2*=10;
    }

    int* ptr = (int*) malloc(4 * *nb_chiffres);

    for (int i = 0; i < *nb_chiffres; i++) {
        ptr[i] = n % 10;
        n /= 10;
    }

    return ptr;
}


int main() {
    int nb_chiffres;
    int* ptr = base10(521, &nb_chiffres);

    for (int i = 0; i < nb_chiffres; i++) {
        printf("%d\t", ptr[i]);
    }

    printf("\n");

    free(ptr);

    return 0;
}