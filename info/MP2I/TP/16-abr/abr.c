#include "abr.h"

noeud* nouveau_noeud(int x) {
    noeud* n = (noeud*) malloc(sizeof(noeud));

    n->gauche = NULL;
    n->droit = NULL;
    n->etiquette = x;

    return n;
}

abr cree_abr_vide() {
    abr arbre = {
        .taille = 0,
        .racine = NULL
    };

    return arbre;
}

void libere_noeud(noeud* n) {
    if (n == NULL) { return; }

    // On libère d'abord tous les enfants
    libere_noeud(n->gauche);
    libere_noeud(n->droit);
    free(n);
}

void libere_arbre(abr* a) {
    libere_noeud(a->racine);
}

int max(int a, int b) {
    if (a > b) { return a; }
    return b;
}

int hauteur_noeud(noeud* n) {
    if (n == NULL) {
        return 0;
    }
    return 1 + max(
        hauteur_noeud(n->gauche),
        hauteur_noeud(n->droit)
    );
}

int hauteur_arbre(abr* a) {
    return hauteur_noeud(a->racine);
}

bool mem_noeud(noeud* n, int x) {
    if (n == NULL) { return false; }

    if (x > n->etiquette) {
        return mem_noeud(n->droit, x);
    }

    if (x < n->etiquette) {
        return mem_noeud(n->gauche, x);
    }

    return true;
}

bool mem_arbre(abr* a, int x) {
    return mem_noeud(a->racine, x);
}

void insere_noeud(noeud* n, int x) {
    if (n == NULL) { assert(false); }

    if (x < n->etiquette) {
        if (n->gauche == NULL) {
            n->gauche = nouveau_noeud(x);
        } else {
            insere_noeud(n->gauche, x);
        }
    } else if (x > n->etiquette) {
        if (n->droit == NULL) {
            n->droit = nouveau_noeud(x);
        } else {
            insere_noeud(n->droit, x);
        }
    }
}

void insere_arbre(abr* a, int x) {
    if (a->racine == NULL) {
        a->racine = nouveau_noeud(x);
    }

    insere_noeud(a->racine, x);

    a->taille+=1;
}

void print_noeud(noeud* n) {
    if (n == NULL) { return; }

    print_noeud(n->gauche);

    printf("%d ", n->etiquette);

    print_noeud(n->droit);
}

void print_arbre(abr* a) {
    print_noeud(a->racine);

    printf("\n");
}

int noeud_vers_tableau(noeud* n, int* arr, int i) {
    if (n == NULL) { return i; }

    i = noeud_vers_tableau(n->gauche, arr, i);

    arr[i] = n->etiquette;
    i+=1;

    i = noeud_vers_tableau(n->droit, arr, i);

    return i;
}

int* arbre_vers_tableau(abr* a) {
    int* arr = (int*) malloc(sizeof(int) * a->taille);

    noeud_vers_tableau(a->racine, arr, 0);

    return arr;
}

void print_tableau(int* arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

abr abr_of_array(int* arr, int len) {
    abr arbre = cree_abr_vide();

    for (int i = 0; i < len; i++) {
        insere_arbre(&arbre, arr[i]);
    }

    return arbre;
}