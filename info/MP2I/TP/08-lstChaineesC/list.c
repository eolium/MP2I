/** Implémentation de lists comme listes simplement chainées */

#include "list.h"


/* Constructeurs */

cellule const* vide = NULL;

cellule* list_create(int x) {
    cellule* lst = (cellule*) malloc(sizeof(cellule));
    lst->elem = x;
    lst->next = NULL;

    return lst;
}

void list_free(cellule* p) {
    if (p != vide) {
        list_free(p->next);
        free(p);
    }
}

// TODO : le reste


/* Accesseurs */

int list_hd(cellule const* p) {
    return p->elem;
}

cellule* list_tl(cellule const* p) {
    return p->next;
}

unsigned list_length(cellule const* p) {
    if (p->next == vide) {
        return 1;
    }

    return 1 + list_length(p->next);
}

bool list_mem(int x, cellule const* p) {
    if (p->next == vide) {
        return p->elem == x;
    }
    return p->elem==x || list_mem(x, p->next);
}

void list_print(cellule const* p) {
    if (p == vide) {
        printf("fin\n");
    } else {
        printf("%d, ", p->elem);
        list_print(p->next);
    }
}

/* Transformateurs */

cellule* list_cons(int x, cellule const* p) {
    cellule* lst = list_create(x);
    lst->next = (cellule*) p;

    return lst;
}

/* Le reste */


int list_get(cellule* const p, unsigned i) {
    if (i == 0) {
        return p->elem;
    }
    return list_get(p->next, i-1);
}

cellule* array_to_list(int* const tab, unsigned len) {
    if (len == 0) {
        return (cellule*) vide;
    }

    cellule* p = list_create(tab[0]);
    p->next = array_to_list(tab+1, len-1);

    return p;
}

int* list_to_array(cellule* const p) {
    unsigned len = list_length(p);

    int* out = (int*) malloc(len * sizeof(len));

    cellule* current = (cellule*) p;

    for (unsigned i = 0; i < len; i++) {
        out[i] = current->elem;
        current = current->next;
    }

    return out;
}

int min(int a, int b) {
    if (a < b) {
        return a;
    }
    return b;
}

int list_min(cellule* const p) {
    if (p->next == vide) {
        return p->elem;
    }
    return min(p->elem, list_min(p->next));
}

cellule* list_tri(cellule* const p) {
    if (p->next == vide) {
        return list_create(p->elem);
    }

    cellule* out = list_create(list_min(p));
    out->next = list_tri(p->next);

    return out;
}