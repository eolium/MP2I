#include <stdbool.h>
/* Exemples de Spec */

/** Renvoie le maximum de deux entiers
 * Entrées : a et b deux entiers relatifs
 * Sortie : le maximum de a et b
 */
int max(int a, int b) {
  if (a > b) {
    return a;
  }
  else {
    return b;
  }
}

/** Renvoie le maximum d'un tableau
 * Entrées : T, un tableau de L entiers
 *           L, un entier positif 
 * Sorties : le maximum des L premières cases de T
 * Eff. Sec. : euh?...
 */
int apres_moi_le_deluge(int L, int T[]) {
  for (int i = 1; i < L; i = i+1) {
    T[i] = max(T[i-1], T[i]);
  }
  // à la fin, la dernière case est
  // plus grande que toutes les autres
  return T[L-1];
}


/** Renvoie le maximum des
 *  premières cases d'un tableau
 * Entrées : n un entier >= 1
 *          T un tableau d'au moins n entiers
 * Sortie : l'élément maximal de T
 */
int maxi_v0(int n, int T[]) {
  int sortie = T[0];
  int i = 0;
  while (i < n) {
    if (T[i] > sortie) {
      sortie = T[i];
      i = i+1;
    }
  }
  return sortie;
}

/** Renvoie le maximum des
 *  premières cases d'un tableau
 * Entrées : n un entier >= 1
 *          T un tableau d'au moins n entiers
 * Sortie : l'élément maximal de T
 */
int maxi_v1(int n, int T[]) {
  int sortie = 666;
  for (int i = 0; i < n; i = i+1) {
    sortie = max(sortie, T[i]);
  }
  return sortie;
}

/** Renvoie le maximum des
 *  premières cases d'un tableau
 * Entrées : n un entier >= 1
 *          T un tableau d'au moins n entiers
 * Sortie : l'élément maximal de T
 */
int maxi_v2(int n, int T[]) {
  int sortie = T[0];
  for (int i = 1; i < n; i = i+1) {
    sortie = max(sortie, T[i]);
  }
  return sortie;
}

/** Renvoie le maximum des
 *  premières cases d'un tableau
 * Entrées : n un entier >= 1
 *          T un tableau d'au moins n entiers
 * Sortie : l'élément maximal de T
 */
int maxi_v3(int n, int T[]) {
  int sortie = T[0];
  int i = 0;
  while (i < n) {
    sortie = max(sortie, T[i]);
    i = i+1;
  }
  return sortie;
}



/* Exemples de Term et Corr*/

/** Somme des n premiers entiers.
 * Entrées : n >= 0
 * Sortie : somme des n premiers entiers de N*.
 * Eff. Sec : aucun.
 */
int somme(int n) {
  int s = 0;
  int i = 0;
  while (i < n+1) {
    s = s+i;
    i = i+1;
  }
  return s;
}

int sommebis(int n) {
  int s = 0;
  for (int i = 0; i < n+1; i = i+1) {
    s = s+i;
  }
  return s;
}


/** Partie entière supérieure de log_2(x)
 * Entrées : x entier >= 1
 * Sortie : la partie entière supérieure du 
 *          logarithme en base 2 de x
 * Eff. Sec : aucun.
 */
int sup_log_2(int x) {
  int n = 0;
  int p = 1;
  while (p < x) {
    p = 2*p;
    n = n+1;
  }
  return n;
}



/* Exemples de Corr */

/** Renvoie a^n
 * Entrée : a un entier
 *          n un entier >= 0
 * Sortie : a^n 
 */
int exp_simple(int a, int n) {
  int p = 1;
  for (int i = 0; i < n; i = i+1) {
    p = a*p;
  }
  return p;
}


/** Renvoie true
 * Entrée : rien
 * Sortie : true
 */
bool patience(void) {
	while (true) {
		int sert_a_rien = 0;
	}
	return true;
}



/* Exemples rec */

#include <assert.h>

/** Renvoie x^n
 * Entrée : x un entier
 *          n entier >= 0
 * Sortie : x^n
 */
int exp_rap(int x, int n) {
  assert(n >= 0);

  /* Cas de base */
  if (n == 0) { return 1; }
  else if (n == 1) { return x; }

  /* Sinon, cas récursifs */
  int x_puiss_demi = exp_rap(x, n/2);
  if (n % 2 == 0) {
    return x_puiss_demi * x_puiss_demi;
  } else {
    return x * x_puiss_demi * x_puiss_demi;
  }
}