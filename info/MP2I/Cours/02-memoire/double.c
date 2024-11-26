#include <stdio.h>
#include <stdlib.h>

double my_pow(double x, int n) {
    int pas = 1;
    if (n < 0) {pas = -1;}
    
    int compteur = 0;
    double p = 1;
    while (compteur != n) {
        if (n > 0) { p = p * x; }
        else { p = p / x; }
        compteur = compteur +pas;
    }
    return p;
}

int main() {

    double petit = my_pow(2, -30);
    double gros = my_pow(2, 30);
    printf("%.52lf \n", (petit+gros)-gros);
    printf("%.52lf \n", petit+(gros-gros));

    return EXIT_SUCCESS;
}