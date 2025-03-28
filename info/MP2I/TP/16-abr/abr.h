#ifndef ABR_H
#define ABR_H 0

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

struct noeud_s {
    struct noeud_s* gauche;
    int etiquette;
    struct noeud_s* droit;
};
typedef struct noeud_s noeud;

struct abr_s {
    int taille;
    noeud* racine;
};
typedef struct abr_s abr;

/*
    Crée et retourne une feuille d'étiquette x
*/
noeud* nouveau_noeud(int x);

/*
    Crée et renvoie un arbre vide
*/
abr cree_abr_vide();

/*
    Free le noeud donné
*/
void libere_noeud(noeud* n);

/*
    Free l'arbre donné
*/
void libere_arbre(abr* a);

/*
    Retourne la hauteur de l'ABR a
*/
int hauteur_arbre(abr* a);

/*
    Retourne true ssi a contient x
*/
bool mem_arbre(abr* a, int x);

/*
    Insère l'élément x dans le noeud n, s'il n'est pas déjà présent
*/
void insere_noeud(noeud* n, int x);

/*
    Insère x dans l'ABR a
*/
void insere_arbre(abr* a, int x);


void print_noeud(noeud* n);

void print_arbre(abr* a);

int* arbre_vers_tableau(abr* a);

void print_tableau(int* arr, int n);

abr abr_of_array(int* arr, int len);

#endif