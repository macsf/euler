/*
  sum of square = 338350
  square of sum = 25502500
  diff = 25164150

  real    0m00m0.004s
  user    0m00m0.004s
  sys     0m00m0.004s
*/

#include <stdio.h>
#include <stdlib.h>

int sqr(int);

int main() {
  const int LIMIT = 100;
  unsigned int i,
    sum = 0,
    sum_sqr = 0,
    sqr_sum = 0,
    diff = 0;

  for (i = 1; i <= LIMIT; i++) {
    sum += i;
    sum_sqr += sqr(i);
  }
  sqr_sum = sqr(sum);

  printf("sum of square = %d\n", sum_sqr);
  printf("square of sum = %d\n", sqr_sum);
  printf("diff = %d", abs(sum_sqr - sqr_sum));

  return 0;
}

int sqr(int x) {
  return x * x;
}
