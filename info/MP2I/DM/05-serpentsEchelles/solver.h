/* Solver de Serpents et Échelles. */

/* Plus précisément, on cherche des
   plus courtes solutions et le nombre
   de solutions bornées.
*/

#ifndef SOLVER_H
#define SOLVER_H

#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <limits.h>
#include <assert.h>
#include "file.h"
#include "plateaux.h"


/** Renvoie true ssi le plateau p est soluble.

    Si le plateau est soluble, modifie *lg_sol
    pour y stocker la longueur d'un plus court
    chemin gagnant.
*/
bool soluble(plateau p, int* lg_sol);


/** Renvoie le nombre de chemins gagnants de longueur 
    inférieure ou égale à max_path_len
*/
int64_t nb_path(plateau p, int max_path_len);

#endif