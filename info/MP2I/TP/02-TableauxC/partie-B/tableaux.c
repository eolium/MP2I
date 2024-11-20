#include "tableaux.h"
#include <stdbool.h> // pour bool


/* partie B.2 */

/** Renvoie la première case de T */
int premiere_case(int T[]) {
  return -1; // À changer
}

/** Renvoie la somme des len cases de U */
int somme_tableau(int U[], int len) {
  return -1; // À changer
}

/** Mystère mystère...
 * NB : si vous changez son nom ici, changez-le aussi 
 *      dans tableaux.h et dans main.c
 */
int mystere(int T[], int len) {
  return -1;
}

/** Teste si x est présent dans une des len cases de T */
bool est_present(int x, int T[], int len) {
  return false; // À changer
}


/* partie B.3 */

/** Teste si un tableau commence par 9 4 3 8 7 5 . */
bool est_943875(int T[]) {
  return T[0] == 9 && T[1] == 4
      && T[2] == 3 && T[3] == 8
      && T[4] == 7 && T[5] == 5;
}

/** Fonction-exo création de tableau */
bool foo(void) {

  /* return ci-dessous à décommenter lorsque
     vous aurez créé le tableau. */
  // return est_943875(<nom_de_votre_tableau>);
  return false;
}


/* partie B.4 */

/** Double le contenu du tableau tab, de longueur len. */
void double_tableau(int tab[], int len) {
  return; // À changer
}

/** Recopie src dans dest. Les deux sont de longueur len. */
void copie(int dest[], int src[], int len) {
  return; // À changer
}

/** Stocke dans V les min et T et U, longueur len. */
void map2_min(int V[], int T[], int U[], int len) {
  return;
}