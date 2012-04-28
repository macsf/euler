#include <stdio.h>

int main() {
  int done = 0, pass = 0, i, limit = 20;
  long num = 1, smallest;

  while (!done) {
    i = 1;
    do {
      if (i == limit) {
        smallest = num;
        done = 1;
      }

      if (num % i == 0) {
        pass = 1;
      } else {
        pass = 0;
      }
      i++;
    } while (i <= limit && pass);
    num++;
  }

  printf("smallest = %ld", smallest);

  return 0;
}
