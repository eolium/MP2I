/* Interface de tableaux.c */


// un peu de magie noire que je n'explique pas pour l'instant
#ifndef _H_tableaux_H_
#define _H_tableaux_H_ 0


#include <stdbool.h>
  // techniquement il faut le mettre ici et non dans le .c,
  // mais je préfère le mettre aussi dans le .c pour que
  // vous y pensiez


/** Renvoie la première case de T */
int premiere_case(int T[]);

/** Renvoie la somme des len cases de U */
int somme_tableau(int U[], int len);

/** Mystère mystère... */
int mystere(int T[], int len);

/** Teste si x est présent dans une des len cases de T */
bool est_present(int x, int T[], int len);

/** Fonction-exo création de tableau */
bool foo(void);

/** Double le contenu du tableau tab, de longueur len. */
void double_tableau(int tab[], int len);

/** Recopie src dans dest. Les deux sont de longueur len. */
void copie(int dest[], int src[], int len);

/** Stocke dans V les min et T et U, longueur len. */
void map2_min(int V[], int T[], int U[], int len);



// fin du #ifndef de la magie noire
#endif