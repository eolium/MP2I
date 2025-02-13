#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


int main() {
    int N;
    scanf(" %d", &N);

    int tab[20]={1};
    bool out[20]={0};

    int i = 0;
    while (tab[i] < N) {
        tab[i+1] = (i + 1) * tab[i];

        i+=1;
    }

    while (i >= 0) {
        if (N >= tab[i]) {
            out[i] = true;
            N-=1;
        }
        i-=1;
    }

    i = 1;
    while (out[i] > 0) {
        printf("%d ", );

        i+=1
    }
}