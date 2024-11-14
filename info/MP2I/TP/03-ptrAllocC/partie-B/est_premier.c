#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int isqrt(int n) {
    int a = 0;
    int b = n;

    if (n == 1) {
        return 1;
    }

    while (b - a > 1) {
        int m = (a + b) / 2;

        if (m * m == n) {
            return m;
        }

        if (m * m < n) {
            a = m;
        } else {
            b = m;
        }
    }

    return a;
}

bool est_premier_1(int n) {
    if (n == 2) {
        return true;
    }

    if (n < 2 || n%2 == 0) {
        return false;
    }

    for (int i = 3; i < isqrt(n) + 1; i++) {
        if (n%i == 0) {
            return false;
        }
    }

    return true;
}

bool* est_premier(int n) {
    bool* ptr = (bool*) malloc(sizeof(bool) * n);

    for (int i = 0; i < n; i++) {
        ptr[i] = est_premier_1(i);
    }

    return ptr;
}

int main() {
    int n = 50000;
    bool* ptr = est_premier(n);

    for (int i = 0; i < n; i++) {
        if (ptr[i]) {
            printf("%d\t%d\n", i, ptr[i]);
        }
    }

    printf("\n");

    free(ptr);

    return 0;
}