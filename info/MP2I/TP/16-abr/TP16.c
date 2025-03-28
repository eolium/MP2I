#include "abr.h"

abr cree_test_abr() {
    noeud* n = nouveau_noeud(24);
    
    n->gauche = nouveau_noeud(5);
    n->droit = nouveau_noeud(42);

    n->gauche->gauche = nouveau_noeud(3);
    n->gauche->droit = nouveau_noeud(7);

    abr a = {.taille = 5, .racine = n};

    return a;
}

int main() {
    abr arbre = cree_test_abr();

    insere_arbre(&arbre, 18);

    printf("%d\n", mem_arbre(&arbre, 18));

    print_arbre(&arbre);

    int* arr = arbre_vers_tableau(&arbre);

    print_tableau(arr, arbre.taille);
    
    int arr2[7]={18, 2, 7, 26, 42, 37, 1};

    abr arbre2 = abr_of_array(arr2, 7);

    print_arbre(&arbre2);

    libere_arbre(&arbre2);

    free(arr);

    libere_arbre(&arbre);
}