/* Implémentation du cavalier d'Euler */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

int const vide = -1;

int** cree_plateau(int n, int i, int j) {
  int** tab = (int**) malloc(n * sizeof(int*));

  for (int x = 0; x < n; x++) {
    tab[x] = (int*) malloc(n * sizeof(int));

    for (int y = 0; y < n; y++) {
      if (x == i && y == j) {
        tab[x][y] = 0;
      } else {
        tab[x][y] = vide;
      }
    }
  }

  return tab;
}

void free_plateau(int** plateau, int n) {
  for (int x = 0; x < n; x++) {
    free(plateau[x]);
  }
  free(plateau);
}

void print_plateau_star(int** plateau, int n) {
  for (int lgn = 0; lgn < n; lgn += 1) {
    for (int col = 0; col < n; col += 1) {
      if (plateau[lgn][col] == vide) { printf(". "); }
      else { printf("%d\t", plateau[lgn][col]); }
    }
    printf("\n\n");
  }
  return;
}

bool disponible(int** plateau, int n, int x, int y) {
  return x >= 0 && x < n && y >= 0 && y < n && plateau[x][y] == vide;
}

int nb_coups_possibles(int** plateau, int n, int a, int b) {
  int dx[8]={-2, -1, 1, 2,  2,  1, -1, -2};
  int dy[8]={ 1,  2, 2, 1, -1, -2, -2, -1};

  int out = 0;

  for (int i = 0; i < 8; i++) {
    if (disponible(plateau, n, a+dx[i], b+dy[i])) {
      out +=1;
    }
  }

  return out;
}

int max_coups_possible(int** plateau, int n, int a, int b) {
  int 
}

int tri_coups_possibles(int** plateau, int n, int a, int b) {
  int dx[8]={-2, -1, 1, 2,  2,  1, -1, -2};
  int dy[8]={ 1,  2, 2, 1, -1, -2, -2, -1};
}

bool backtrack(int** plateau, int n, int a, int b) {
  assert (plateau[a][b] != vide && plateau[a][b] < n*n);

  if (plateau[a][b] == n*n-1) {
    print_plateau_star(plateau, n);
    return true;
  }

  int dx[8]={-2, -1, 1, 2,  2,  1, -1, -2};
  int dy[8]={ 1,  2, 2, 1, -1, -2, -2, -1};

  for (int i = 0; i < 8; i++) {
    if (disponible(plateau, n, a+dx[i], b+dy[i])) {
      // Si la case n'est pas visitée, on la maj, on la teste, puis on la reset
      plateau[a+dx[i]][b+dy[i]] = plateau[a][b] + 1;
      if (backtrack(plateau, n, a+dx[i], b+dy[i])) {
        return true;
      }
      plateau[a+dx[i]][b+dy[i]] = vide;
    }
    // Sinon on essaie les autres cases
  }

  // Aucune case n'a marché, on renvoie false
  return false;
}

bool cavalier(int n, int i, int j) {
  int** tab = cree_plateau(n, i, j);

  bool out = backtrack(tab, n, i, j);

  free_plateau(tab, n);

  return out;
}



int main(int argc, char* argv[]) {
  if (argc != 4) {
    printf("Bad usage :\n./cavalier TAILLE_PLATEAU X_0 Y_0\n");
    return 1;
  }

  int n = strtod(argv[1], NULL);
  int a = strtod(argv[2], NULL);
  int b = strtod(argv[3], NULL);

  printf("Test de solutions...\n\n");

  if (!cavalier(n, a, b)) {
    printf("Aucune solution trouvée.\n");
  }
}