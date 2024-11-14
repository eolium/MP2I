#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    scanf(" %d", &n);

    int out = n;
    out += 4;
    out += out * 4;
    out += 1;
    out -= 5 * n;
    out *= 2;

    printf("%d\n", out);
}