#include <stdio.h>

int main() {
  int i;
  long sum = 0;                 /* must init value */

  for (i = 0; i < 1000; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }

  printf("%ld\n", sum);

  return 0;
}
