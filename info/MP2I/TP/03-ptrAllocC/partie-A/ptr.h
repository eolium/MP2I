/* Interface de ptr.c */

// Le but d'un .h est de lister et décrire les fonctions du .c
// associés qui sont utilisables par un autre fichier.
// Ignorez pour l'instant les #if, #define et #endif .

#ifndef _H_ptr_H_
#define _H_ptr_H_ 0

#include <stdlib.h>
#include <stdio.h>


int dereference_int(int* ptr);


double dereference_double(double* ptr);

unsigned int deref_et_somme(unsigned int* ptr0, unsigned int* ptr1);

void met_a_0(int* ptr);

void incr(int* ptr);

void swap(int* a, int *b);

void min_et_max(int T[], int len, int* mini, int* maxi);

#endif