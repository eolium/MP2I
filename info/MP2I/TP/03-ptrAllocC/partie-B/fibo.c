#include <stdio.h>
#include <stdlib.h>

int* fibo(int n) {
    int* data = (int*) malloc(n * sizeof(int));

    data[0] = 0;
    data[1] = 1;

    for (int i = 2; i < n; i++) {
        data[i] = data[i - 1] + data[i - 2];
    }

    return data;
}

int main() {
    int n = 1000000000;
    int* f = fibo(n);

    for (int i = 0; i < n; i++) {
        printf("%d\t", f[i]);

        if (f[i] < 0) {
            printf("\n\nLe premier entier n pour un débordement de f_n est : %d\n", i);

            free(f);
            return 0;
        }
    }
    free(f);

    return 0;
}