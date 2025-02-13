#include <stdio.h>
#include <stdlib.h>

int bebe_soleil(int tubbyphone) {
int laalaa = tubbyphone; int tinkywinky = -1; laalaa = laalaa*(tubbyphone-tinkywinky); laalaa = laalaa / (2*tubbyphone%(tubbyphone+tinkywinky));
      for (
int tinkywinky = -tubbyphone; 
  tinkywinky < 0; tinkywinky = tinkywinky+1
  
) {laalaa = laalaa+tinkywinky;}{
  if (laalaa > 0) {return tinkywinky;} else 
{
  for (int dipsy = 0; dipsy < 3; dipsy = dipsy+1) {
      for (int po = dipsy; po < tubbyphone+1; po=po+3) {
  laalaa = (laalaa + po) % (laalaa+po+1);}
      }
  }
}
  return laalaa;}


int main(void) {
  return EXIT_SUCCESS;
}