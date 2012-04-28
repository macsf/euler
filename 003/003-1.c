#include <stdio.h>

// 4/25/2012

int is_prime(long long);

int main() {
  long long limit = 600851475143,
    max = 0,
    c;

  for (c = 2; (c * c) <= limit; c++) {
    if (limit % c == 0) {
      if (is_prime(c)) {
        if (c > max) {
          max = c;
        }
      }
    }
  }

  printf("largest prime = %lld", max);

  return 0;

}

int is_prime(long long num) {
  long long check;

  if (num < 2) return 0;

  for (check = 2; check < num; check++) {
    if (num % check == 0) {
      return 0;
    }
  }

  return 1;
}
