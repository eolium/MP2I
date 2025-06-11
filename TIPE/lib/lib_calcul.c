#include "lib_calcul.h"

void lib_add(vect* gauche, vect* droite, vect* out) {
  assert(gauche->dim == droite->dim);
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
      out->arr[i] = gauche->arr[i] + droite->arr[i];
  }
}

void lib_rem(vect* gauche, vect* droite, vect* out) {
  assert(gauche->dim == droite->dim);
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
      out->arr[i] = gauche->arr[i] - droite->arr[i];
  }
}

void lib_mul(vect* gauche, vect* droite, vect* out) {
  // A modifier pour inclure le produit scalaire et vectoriel
  // (.) pour scalaire et dot pour vectoriel ?
  if (droite->dim == 1) {
      vect* c = gauche;
      gauche = droite;
      droite = c;
  }
  assert(gauche->dim == 1);

  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
      out->arr[i] = gauche->arr[0] * droite->arr[i];
  }
}

void lib_sin(vect* gauche, vect* droite, vect* out) {
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
      out->arr[i] = sin(gauche->arr[i]) + 0 * droite->arr[i];
  }
}

void lib_cos(vect* gauche, vect* droite, vect* out) {
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
    out->arr[i] = cos(gauche->arr[i]) + 0 * droite->arr[i];
  }

}

void lib_tan(vect* gauche, vect* droite, vect* out) {
  assert(gauche->dim == droite->dim);
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
    out->arr[i] = tan(gauche->arr[i]) + 0 * droite->arr[i];
  }
}

void lib_asin(vect* gauche, vect* droite, vect* out) {
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
    out->arr[i] = asin(gauche->arr[i]) + 0 * droite->arr[i];
  }
}

void lib_acos(vect* gauche, vect* droite, vect* out) {
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
    out->arr[i] = acos(gauche->arr[i]) + 0 * droite->arr[i];
  }
}

void lib_atan(vect* gauche, vect* droite, vect* out) {
  assert(gauche->dim == droite->dim);
  out->dim = gauche->dim;

  for (int i = 0; i < out->dim; i++) {
    out->arr[i] = atan(gauche->arr[i]) + 0 * droite->arr[i];
  }
}

