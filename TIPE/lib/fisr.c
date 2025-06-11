#include <math.h>
#include <stdio.h>
#include <stdlib.h>
# include <stdint.h> // uint32_t

float Q_rsqrt(float number)
{
  union {
    float    f;
    uint32_t i;
  } conv = { .f = number };
  conv.i  = 0x5f3759df - (conv.i >> 1);
  conv.f *= 1.5F - (number * 0.5F * conv.f * conv.f);
  conv.f *= 1.5F - (number * 0.5F * conv.f * conv.f);
  conv.f *= 1.5F - (number * 0.5F * conv.f * conv.f);
  return conv.f;
}

int main() {
    int m = 10;

    for (int i = 1; i < m; i++) {
        float x = (float) i / (float) m;
        printf("%f\n", Q_rsqrt(x));
    }
}