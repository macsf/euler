#include <stdio.h>

int main() {
  long limit = 4000000;
  long num_a = 0,
    num_b = 1,
    fib_num = 0,
    sum = 0;

  while (fib_num <= limit) {
    fib_num = num_a + num_b;
    num_a = num_b;
    num_b = fib_num;

    // printf("%ld, ", fib_num);

    if (fib_num % 2 == 0) {
      sum += fib_num;
    }
  }

  printf("\n%ld\n", sum);

  return 0;
}
