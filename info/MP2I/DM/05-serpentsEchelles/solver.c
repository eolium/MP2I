/* Implémentation d'un solver de serpents et échelles */
#include "solver.h"

/* Les lancers de dés min et max. */
int const min_roll = 1;
int const max_roll = 6;


/*****************************************************/
/* Trouver la longueur d'un plus court chemin gagant */
/*****************************************************/

/*
  Renvoie la longueur d'une case, et calcule le plateau en conséquence
*/
int soluble_aux(plateau p, int i, bool* used, int* lg_sol) {
  // Si on est à la fin du plateau, c'est win
  if (est_final(p, i)) {
    return 0;
  }

  // La case a déjà été calculé
  if (used[i] != 0) {
    return used[i];
  }

  // La case n'a pas été calculé, on la pointe à -1 par défaut
  used[i] = -1;

  int out = -1;

  // On tente d'aller aux cases j = i...i+6
  for (int j = i+1; j < i+max_roll; j++) {
    // On esquive les cases en dehors
    if (!est_valide(p, j)) {
      continue;
    }

    // On va à la case pointée
    int c = p.cases[j];

    // On récupère la longueur de chaque case
    int l = soluble_aux(p, c, used, lg_sol);

    //  Si aucun résultat n'a été trouvé ou le résultat est plus intéressant
    if (out == -1 || l < out) {
      out = l;
    }
  }

  // On stocke s'il a été trouvé le résultat le plus intéressant
  used[i] = out+1;

  // Et on le return
  return out+1;
}


bool soluble(plateau p, int* lg_sol) {
  // On crée un tableau des tentatives
  bool* used = (bool*) malloc(sizeof(int) * p.nb_cases);

  // On initialise toutes les cases comme non jouées
  for (int i = 0; i < p.nb_cases; i++) {
    used[i] = 0;
  }

  // On lance la partie sur la première case
  int out = soluble_aux(p, 0, used, lg_sol);

  free(used);

  if (out == -1) {
    // Aucune solution n'a été trouvée
    return false;
  } else {
    *lg_sol = out;
    return true;
  }
}



/*****************************************/
/* Trouver le nombre de chemins gagnants */
/*****************************************/


int64_t nb_path(plateau p, int max_path_len) {
  return 0;
}