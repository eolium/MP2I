#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <time.h>

int min(int a, int b, int c) {
    if (a < b) {
        if (a < c) {
            return a;
        } else {
            return c;
        }
    }
    if (b < c) {
        return b;
    }
    return c;
}

int lev_aux(int** M, char* u, char* v, int i, int j) {
    if (M[i][j] != -1) {
        return M[i][j];
    }

    int out;

    if (i == 0) {
        out = j;
    } else {
        if (j == 0) {
            out = i;
        } else {
            if (u[i-1] == v[j-1]) {
                out = lev_aux(M, u, v, i-1, j-1);
            } else {
                out = 1 + min(lev_aux(M, u, v, i-1, j), lev_aux(M, u, v, i, j-1), lev_aux(M, u, v, i-1, j-1));
            }
        }
    }

    M[i][j] = out;
    return out;
}

int** create_matrix(int n, int p, int x) {
    int** M = (int**) malloc(sizeof(int*) * n);

    for (int i = 0; i < n; i++) {
        M[i] = (int*) malloc(sizeof(int) * p);

        for (int j = 0; j < p; j++) {
            M[i][j] = x;
        }
    }

    return M;
}

void free_matrix(int** M, int n) {
    for (int i = 0; i < n; i++) {
        free(M[i]);
    }

    free(M);
}

int lev(char* u, char* v) {
    int i = strlen(u);
    int j = strlen(v);

    int** M = create_matrix(i+1, j+1, -1);

    int out = lev_aux(M, u, v, i, j);

    free_matrix(M, i+1);

    return out;
}


char* random_string(int max_size) {
    int size = 1 + (random() % max_size);

    char* tab = (char*) malloc(sizeof(char) * size);

    for (int i = 0; i < size-1; i++) {
        tab[i] = 'A' + (random() % 26);
    }

    tab[size-1] = '\0';

    return tab;
}

void sub(char* u, int i, char x) {
    assert (i < (int) strlen(u));

    u[i] = x;
}

void del(char* u, int n) {
    int size = strlen(u);
    assert(n < size);

    for (int i = n; i < size-1; i++) {
        u[i] = u[i+1];
    }
    u[size-1] = '\0';
}

void add(char* u, int n, char x) {
    int size = strlen(u);

    for (int i = size; i > n; i--) {
        u[i] = u[i-1];
    }

    u[n] = x;
}

char* copie(char* u, int n) {
    char* v = (char*) malloc(sizeof(char) * n);

    for (int i = 0; i < n; i++) {
        v[i] = u;
    }

    return u;
}

void edition(char* u, int len_u, char* v, int len_v) {
    char* copie_u = copie(u, len_u);
    char* copie_v = copie(v, len_v);
}


int main(int argc, char* argv[]) {
    assert(argc == 3 && "Erreur : Option invalide, ./main MOT1 MOT2");
    printf("%d\n", lev(argv[1], argv[2]));
}