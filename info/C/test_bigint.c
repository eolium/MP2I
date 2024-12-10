#include "bigint.h"

int main() {
    bigint big = bigint_create(34);

    bigint_free(big);
}