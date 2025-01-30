/* Implémentation du cavalier d'Euler */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>



int const vide = -1;


/** Renvoie true si et seulement si la case (lgn, col) existe
  * dans un échiquier de taille n*n 
  */
bool existe(int n, int lgn, int col) {
  return    0 <= lgn && lgn < n
         && 0 <= col && col < n;
}

/** Renvoie true si et seulement si la case (lgn, col) existe 
  * et est disponible 
  */
bool disponible(int** echiquier, int n, int lgn, int col) {
  return existe(n, lgn, col) && echiquier[lgn][col] == vide;
}


/** Les 8 vecteurs (dx,dy) des mouvements possibles sont, dans le sens trigo :
  * (-1, 2) ; (-2, 1) ; (-2, -1) ; (-1, -2) ; 
  * (1, -2) ; (2, -1) ; (2, 1) ; (1, 2)
  */
int const dx[8] = {-1, -2, -2, -1,  1,  2, 2, 1};
int const dy[8] = { 2,  1, -1, -2, -2, -1, 1, 2};

/** Renvoie true si et seulement si la solution partielle echiquier peut être
  * étendue en une solution valide, c'est à dire s'il existe un moyen
  * de compléter le chemin entammé en un chemin du cavalier qui passe
  * 1 et 1 seule fois par chaque case. 
  * Le cavalier est actuellement dans la case (i,j).
  */
bool backtrack(int** echiquier, int n, int i, int j) {
  int nb_move = echiquier[i][j];
  if (nb_move == n*n -1) {
    return true;
  }

  for (int mov = 0; mov < 8; mov = mov +1) {
    int lgn = i + dx[mov];
    int col = j + dy[col];

    // Si la case (lgn,col) est dispo : y aller et continuer le backtrack
    if (disponible(echiquier, n, lgn, col)) {
      echiquier[lgn][col] = nb_move +1;
      if (backtrack(echiquier, n, lgn, col)) {
        return true;
      }

      // Si aller en (lgn, col) n'a pas mené à une solution valide : 
      // annuler ce mvt, et au prochain tour de boucle essayer un autre mvt
      echiquier[lgn][col] = vide;
    }
  }

  // aucun mouvement n'a donné de sol valide
  return false;
}


/** Affiche un plateau */
void print_plateau_star(int** plateau, int n) {
  for (int lgn = 0; lgn < n; lgn += 1) {
    for (int col = 0; col < n; col += 1) {
      if (plateau[lgn][col] == vide) { printf("%3c ", '.'); }
      else { printf("%3d ", plateau[lgn][col]); }
    }
    printf("\n");
  }
  return;
}


/** Interface backtrack */
bool cavalier(int n, int i, int j) {
  // Créer l'échiquier
  int** echiquier = (int**) malloc(n*sizeof(int*));
  for (int lgn = 0; lgn < n; lgn = lgn +1) {
    echiquier[lgn] = (int*) malloc(n*sizeof(int));
    for (int col = 0; col < n; col = col +1) {
      echiquier[lgn][col] = vide;
    }
  }
  // Le cavalier commence en (i,j)
  echiquier[i][j] = 0;

  bool soluble = backtrack(echiquier, n, i, j) ;
  if (soluble) {
    printf("Le cavalier d'Euler %dx%d depuis (%d,%d) est soluble !\n", n, n, i, j);
    print_plateau_star(echiquier, n);
  }
  else {
    printf("Le cavalier d'Euler %dx%d depuis (%d,%d) N'est PAS soluble.\n", n, n, i, j);
  }

  for (int lgn = 0; lgn < n; lgn = lgn +1) {
    free(echiquier[lgn]);
  }
  free(echiquier);
  return soluble;
}


int main(void) {
  // On demande n i et j
  int n, i, j;
  printf("Entrez n :\n");
  scanf(" %d", &n);
  printf("Entrez i j :\n");
  scanf(" %d %d", &i, &j);

  cavalier(n, i, j);

  return EXIT_SUCCESS;
}