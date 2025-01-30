/* Version optimisée de la recherche d'un chemin pour le cavalier d'Euler */

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>


/* Optimisations par rapport à l'énoncé :
   - je linéarise la matrice en << collant >> ses lignes les unes 
     après les autres. Ainsi, la case (i,j) est echiquier[n*i+j] .
   - pour ordonner les options possibles pour chaque choix, j'applique
     la règle de Warnsdorf : privélégier la case depuis laquelle le moins
     d'autres cases sont accessibles.
     Vouloir appliquer cette règle me pousse à créer le type case_t qui
     permet de mémoriser pour chaque case son nombre de voisins.
   - je lis n, i et j depuis la ligne de commande
     (à l'aide de argv dans le main)
*/

/* Dans tout ce code :
  - n désigne la longueur du côté de l'échiquier
  - échiquier l'échiquier.
  - i et lgn et x désignent un indice de ligne.
  - j et col et y désignent un indice de colonne.
*/




/**************************/
/* Manipulation des cases */
/**************************/


/** Le numéro d'une case vide */
int const vide = -1;


/** Pour chaque case, on stocke son numéro dans le chemin actuel 
  * et son degré restant. 
  */
struct case_s {
  int num; // numéro de la case dans le chemin du cavalier. 
           // vaut vide si la case n'est pas encore dans le chemin.

  int deg; // degré de la case, çad nombre de cases voisines disponibles
};
typedef struct case_s case_t;




/********************/
/* Retour sur trace */
/********************/


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
bool disponible(case_t const* echiquier, int n, int lgn, int col) {
  return existe(n, lgn, col) && echiquier[n*lgn + col].num == vide;
}


/** Les 8 vecteurs (dx,dy) des mouvements possibles sont, dans le sens trigo :
  * (-1, 2) ; (-2, 1) ; (-2, -1) ; (-1, -2) ; 
  * (1, -2) ; (2, -1) ; (2, 1) ; (1, 2)
  */
int const dx[8] = {-1, -2, -2, -1,  1,  2, 2, 1};
int const dy[8] = { 2,  1, -1, -2, -2, -1, 1, 2};


/** Ajoute diff au degré de tous les voisins de (lgn,col).
  * En pratique, diff vaut +1 ou -1. 
  */
void maj_deg_voisins(case_t* echiquier, int n, int lgn, int col, int diff) {
  for (int mov = 0; mov < 8; mov += 1) {
    int x = lgn + dx[mov];
    int y = col + dy[mov];
    if(existe(n, x, y)) {
      echiquier[n*x + y].deg += diff;
    }
  }
  return;
}


/* On va vouloir trouver tous les voisins de (i,j) disponibles et les
   ranger dans l'ordre décroissant de degré dans un tableau ret_voisins 
   Pour cela, je vais trier des paires (case, degré de echiquier[indice])
*/
typedef struct {
  int lgn; 
  int col;
  int deg; // degré de la case (lgn, col)
} paire_t;


/** Renvoie <0 si p0.deg <= p1.deg, 0 si = et >0 sinon.
  * Autrement dit, code <= pour les paires comparées par degré. */
int paires_leq(void const* ptr_p0, void const* ptr_p1) {
  return ((paire_t*) ptr_p0)->deg - ((paire_t*) ptr_p1)->deg;
}


/** Remplit voisins avec les voisins disponibles de la case (i,j)
  * triés par degré croissant. Renvoie le nombre de tels voisins.
  */
int get_voisins(paire_t voisins[8], case_t const* echiquier, int n, int i, int j) {
  int nb_voisins = 0;

  // Remplir voisins
  for (int mov = 0; mov < 8; mov += 1) {
    int lgn = i + dx[mov];
    int col = j + dy[mov];
    if (disponible(echiquier, n, lgn, col)) {
      voisins[nb_voisins].lgn = lgn;
      voisins[nb_voisins].col = col;
      voisins[nb_voisins].deg= echiquier[n*lgn + col].deg;
      nb_voisins += 1;
    }
  }

  // Trier voisins
  // if (vous voulez) {allez lire la doc de qsort;} else {trust me;}
  qsort(voisins, nb_voisins, sizeof(paire_t), paires_leq);

  return nb_voisins;
}


/** Renvoie true si et seulement si la solution partielle echiquier peut être
  * étendue en une solution valide, c'est à dire s'il existe un moyen
  * de compléter le chemin entammé en un chemin du cavalier qui passe
  * 1 et 1 seule fois par chaque case. 
  * Le cavalier est actuellement dans la case (i,j).
  */
bool backtrack(case_t* echiquier, int n, int i, int j) {
  int nb_move = echiquier[n*i  + j].num; // numéro du mvt qui a mené en (i,j)
  if (nb_move == n*n -1) {
    return true;
  }

  paire_t voisins[8]; 
  int nb_voisins = get_voisins(voisins, echiquier, n, i, j);

  for (int v = 0; v < nb_voisins; v += 1) {
    int lgn = voisins[v].lgn;
    int col = voisins[v].col;

    // aller en (lgn,col) (et mettre à jour les degrés)
    echiquier[n*lgn + col].num = nb_move+1;
    maj_deg_voisins(echiquier, n, lgn, col, -1);

    // backtracker
    if (backtrack(echiquier, n, lgn, col)) {
      return true;
    }

    // le backtrack a échoué : annuler le déplacement en (lgn,col)
    echiquier[n*lgn + col].num = vide;
    maj_deg_voisins(echiquier, n, lgn, col, +1);
  }

  return false;
}




/********************/
/* Jolis affichages */
/****************** */


/** Affiche un échiquier avec les numéros des cases lors du chemin */
void print_plateau(case_t const* echiquier, int n) {
  
  // Pour que ce soit joli, j'affiche avec la même "largeur" tous les numéros
  // Par exemple en largeur 3, "  1", " 12" et "547" .*
  // Cette largeur est le nombre de chiffres en b10 de n²-1
  int largeur = 1;
  int dix_p_largeur = 10;
  while (dix_p_largeur < n*n -1) {
    largeur += 1;
    dix_p_largeur *= 10;
  }

  // Et maintenant j'affiche
  for (int lgn = 0; lgn < n; lgn += 1) {
    for (int col = 0; col < n; col += 1) {
      int num = echiquier[n*lgn + col].num;
      if (num == vide) { printf("%*c ", largeur, '.'); }
      else             { printf("%*d ", largeur, num); }
    }
    printf("\n");
  }
  return;
}


/** Interface pour backtrack */
bool cavalier(int n, int i, int j) {
  case_t* echiquier = (case_t*) malloc(n*n*sizeof(case_t));
  for (int lgn = 0; lgn < n; lgn += 1) {
    for (int col = 0; col < n; col += 1) {
      echiquier[n*lgn + col].num = vide;

      // pour le degré : on compte les voisins qui existent
      echiquier[n*lgn + col].deg = 0;
      for (int mov = 0; mov < 8; mov += 1) {
        if(existe(n, lgn+dx[mov], col+dy[mov])) {
          echiquier[n*lgn + col].deg += 1;
        }
      }
    }
  }
  echiquier[n*i + j].num = 0;
  maj_deg_voisins(echiquier, n, i, j, -1);

  bool soluble = backtrack(echiquier, n, i, j) ;
  if (soluble) {
    printf("Le cavalier d'Euler %dx%d depuis (%d,%d) est soluble !\n", n, n, i, j);
    print_plateau(echiquier, n);
  }
  else {
    printf("Le cavalier d'Euler %dx%d depuis (%d,%d) N'est PAS soluble.\n", n, n, i, j);
  }

  free(echiquier);
  return soluble;
}




/********/
/* main */
/****** */

int main(int argc, char const* argv[]) {
  // La ligne de commande qui a lancé le prgm est de la forme :
  // ./exe truc machin bidule
  // On appelle mot les sous-parties de la ligne de commande obtenue en
  // découpant sur les espaces.
  // Dans l'exemple, les mots sont "./exe", "truc", "machin", "bidule" .
  // 
  // Dans les arguments du main, argc est le nombre de mots et argv leur valeur
  // (le main ne peut pas prendre autre chose comme arguments)
  
  if (argc != 4) {
    fprintf(stderr, "Usage :\n"
            "%s n i j\n"
            "où n est la longueur du plateau, et (i,j) la case de départ.\n",
            argv[0]);
    return EXIT_FAILURE;
  }

  // j'utilise la fonction atoi qui convertit un char* en 
  // le int qui correspond à son contenu
  int n = atoi(argv[1]);
  int i = atoi(argv[2]);
  int j = atoi(argv[3]);

  cavalier(n, i, j);

  return EXIT_SUCCESS;
}