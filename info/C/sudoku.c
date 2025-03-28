#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <assert.h>

struct sudoku_s {
    int** arr;
    int taille;
    int taille_sqrt;
    int nb_sudoku;
};

typedef struct sudoku_s sudoku;


void reset_sudoku(sudoku* sudo) {
    for (int i = 0; i < sudo->taille; i++) {
        for (int j = 0; j < sudo->taille; j++) {
            sudo->arr[i][j] = 0;
        }
    }
}

sudoku* create_sudoku(int taille_sqrt) {
    int taille = taille_sqrt * taille_sqrt;

    int** arr = (int**) malloc(sizeof(int*) * taille);
    for (int i = 0; i < taille; i++) {
        arr[i] = (int*) malloc(sizeof(int) * taille);
    }

    sudoku* sudo = (sudoku*) malloc(sizeof(sudoku));

    sudo->arr = arr;
    sudo->taille = taille;
    sudo->taille_sqrt = taille_sqrt;

    reset_sudoku(sudo);

    return sudo;
}

void free_sudoku(sudoku* sudo) {
    for (int i = 0; i < sudo->taille; i++) {
        free(sudo->arr[i]);
    }

    free(sudo->arr);

    free(sudo);
}

void sudoku_set(sudoku* sudo, int i, int j, int x) {
    sudo->arr[i][j] = x;
}

int sudoku_get(sudoku* sudo, int i, int j) {
    if (i >= sudo->taille || j >= sudo->taille) {
        printf("%d - %d\n", i, j);
        assert(0);
    }

    return sudo->arr[i][j];
}

void print_sudoku(sudoku* sudo) {
    int x;

    for (int j = 0; j < sudo->taille; j++) {
        printf(" ");
        for (int i = 0; i < sudo->taille-1; i++) {
            x = sudoku_get(sudo, i, j);
            if (x == 0) {
                printf("  | ");
            } else {
                printf("%d | ", x);
            }
        }
        x = sudoku_get(sudo, sudo->taille-1, j);
        if (x != 0) {
            printf("%d", x);
        }
        printf("\n");
        for (int i = 0; i < 4*(sudo->taille+1)+2; i++) {
            printf("-");
        }
        printf("\n");
    }

    printf("\n");
}

bool case_valide(sudoku* sudo, int i, int j) {
    int x = sudoku_get(sudo, i, j);

    if (x == 0) {
        return true;
    }


    // On teste la colonne et la ligne
    for (int e = 0; e < sudo->taille; e++) {
        if (e != i && sudoku_get(sudo, e, j) == x) {
            return false;
        }

        if (e != j && sudoku_get(sudo, i, e) == x) {
            return false;
        }
    }

    int n = (i / sudo->taille_sqrt) * sudo->taille_sqrt;
    int p = (j / sudo->taille_sqrt) * sudo->taille_sqrt;

    for (int a = 0; a < sudo->taille_sqrt; a++) {
        for (int b = 0; b < sudo->taille_sqrt; b++) {
            if (n+a != i && p+b != j && sudoku_get(sudo, n + a, p + b) == x) {
                return false;
            }
        }
    }

    return true;
}

bool sudoku_valide(sudoku* sudo) {
    for (int i = 0; i < sudo->taille; i++) {
        for (int j = 0; j < sudo->taille; j++) {
            if (!case_valide(sudo, i, j)) {
                return false;
            }
        }
    }

    return true;
}

bool solve_sudoku_aux(sudoku* sudo, int i, int j) {
    if (i >= sudo->taille-2 && j == sudo->taille-1) {
        return true;
    }

    if (i >= sudo->taille) {
        i = 0;
        j++;
    }

    while (sudoku_get(sudo, i, j) != 0) {
        i++;
        if (i >= sudo->taille) {
            i = 0;
            j++;
        }
    }

    if (i >= sudo->taille) {
        i = 0;
        j++;
    }

    if (!case_valide(sudo, i, j)) {
        return false;
    }

    system("clear");
    print_sudoku(sudo);
    printf("%d\n", sudo->nb_sudoku);

    for (int x = 1; x <= sudo->taille; x++) {
        sudoku_set(sudo, i, j, x);

        if (!case_valide(sudo, i, j)) {
            continue;
        }

        if (solve_sudoku_aux(sudo, i+1, j)) {
            return true;
        }
    }

    sudoku_set(sudo, i, j, 0);

    return false;
}

bool solve_sudoku(sudoku* sudo) {
    if (!solve_sudoku_aux(sudo, 0, 0)) {
        return false;
    }

    for (int x = 1; x <= sudo->taille; x++) {
        sudoku_set(sudo, sudo->taille-1, sudo->taille-1, x);

        if (case_valide(sudo, sudo->taille-1, sudo->taille-1)) {
            break;
        }
    }

    return false;
}

int main() {
    srand(time(NULL));


    sudoku* sudo = create_sudoku(4);
    sudo->nb_sudoku = 0;

    while (true) {
        reset_sudoku(sudo);

        /*for (int j = 0; j < sudo->taille; j++) {
            for (int i = 0; i < sudo->taille; i++) {
                scanf(" %d", &(sudo->arr[i][j]));
            }
        }

        for (int i = 0; i < sudo->taille; i++) {
            for (int j = 0; j < sudo->taille; j++) {
                if (!case_valide(sudo, i, j)) {
                    printf("%d - %d\n", i+1, j+1);
                }
            }
        }

        abort();*/

        int nb = 0;
        while (nb < sudo->taille * sudo->taille / 10) {
            int i = random() % sudo->taille;
            int j = random() % sudo->taille;

            sudoku_set(sudo, i, j, 1 + (random() % (sudo->taille+1)));

            if (sudoku_valide(sudo)) {
                nb++;
            }
            else {
                reset_sudoku(sudo);
                nb = 0;
            }
        }

        if (solve_sudoku(sudo)) {
            printf("Sudoku résolu !\n\n");
        }

        /*system("clear");
        print_sudoku(sudo);
        printf("%d\n", sudo->nb_sudoku);*/

        sudo->nb_sudoku++;
    }

    free_sudoku(sudo);
}
